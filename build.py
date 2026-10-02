"""Assemble, test and package independent addons from one shared source repository."""
import argparse
import hashlib
import importlib.util
import json
from pathlib import Path
import re
import shutil
import subprocess
import sys
import xml.etree.ElementTree as ET
import zipfile

sys.path.insert(0, str(Path(__file__).resolve().parent / "tools"))
from source_tree import ROOT, FLAVORS, PRIVATE, relative_path, remove_generated, source_files, write_json

WOWUP_FLAVORS = {"forever": "forever", "retail": "mainline"}


def archive_filename(flavor, version):
    suffix = "-forever" if flavor == "forever" else ""
    return f"{FLAVORS[flavor]}-{version}{suffix}.zip"


def wowup_entry(flavor, archive):
    """Read client metadata from the packaged TOC, not a second version/interface table."""
    addon = FLAVORS[flavor]
    with zipfile.ZipFile(archive) as output:
        toc = output.read(f"{addon}/{addon}.toc").decode("utf-8-sig")
    fields = dict(re.findall(r"^## ([\w-]+):[ \t]*(.*?)\s*$", toc, re.MULTILINE))
    version = fields.get("Version", "")
    if not re.fullmatch(r"\d+\.\d+\.\d+", version) or archive.name != archive_filename(flavor, version):
        raise ValueError(f"Archive name/version differs from its TOC: {archive.name}")
    interface_text = fields.get("Interface", "")
    if not re.fullmatch(r"[1-9]\d*(?:\s*,\s*[1-9]\d*)*", interface_text):
        raise ValueError(f"Missing or invalid Interface in {addon}.toc")
    interfaces = sorted({int(value.strip()) for value in interface_text.split(",")})
    return {
        "filename": archive.name,
        "nolib": False,
        "metadata": [{"flavor": WOWUP_FLAVORS[flavor], "interface": value} for value in interfaces],
    }


def verify_release(directory, metadata=None):
    """Verify the exact WowUp upload set, also usable on assets downloaded from GitHub."""
    directory = Path(directory).resolve()
    if metadata is None:
        metadata = json.loads((directory / "release.json").read_text(encoding="utf-8"))
    entries = metadata.get("releases", [])
    if len(entries) != len(FLAVORS):
        raise ValueError("A release must contain both Forever and Retail")
    seen, assets = set(), []
    for entry in entries:
        filename = entry.get("filename", "")
        if len(relative_path(filename).parts) != 1 or not filename.endswith(".zip"):
            raise ValueError(f"Invalid release filename: {filename}")
        archive = directory / filename
        if not archive.resolve().is_relative_to(directory):
            raise ValueError(f"External release asset: {filename}")
        flavors = {m.get("flavor") for m in entry.get("metadata", [])}
        flavor = next((f for f, wowup in WOWUP_FLAVORS.items() if flavors == {wowup}), None)
        if flavor is None or flavor in seen:
            raise ValueError("Unknown or duplicate release flavor")
        seen.add(flavor)
        if entry != wowup_entry(flavor, archive):
            raise ValueError(f"WowUp metadata differs from packaged TOC: {filename}")
        checksum_path = archive.with_suffix(".manifest.json")
        manifest = json.loads(checksum_path.read_text(encoding="utf-8"))
        if manifest.get("offline_tests_passed") is not True:
            raise ValueError(f"Offline tests were not passed: {filename}")
        if (manifest.get("archive") != filename or manifest.get("flavor") != flavor
                or manifest.get("addon") != FLAVORS[flavor]
                or archive_filename(flavor, manifest.get("version")) != filename):
            raise ValueError(f"Checksum manifest identifies a different package: {filename}")
        if manifest.get("archive_sha256") != hashlib.sha256(archive.read_bytes()).hexdigest():
            raise ValueError(f"Archive checksum mismatch: {filename}")
        with zipfile.ZipFile(archive) as output:
            files = manifest["files"]
            expected = {f"{FLAVORS[flavor]}/{name}" for name in files}
            if set(output.namelist()) != expected or len(output.namelist()) != len(expected):
                raise ValueError(f"Archive inventory differs from checksum manifest: {filename}")
            for name, checksum in files.items():
                relative_path(name)
                data = output.read(f"{FLAVORS[flavor]}/{name}")
                if hashlib.sha256(data).hexdigest() != checksum:
                    raise ValueError(f"File checksum mismatch: {filename}: {name}")
        assets.extend([archive, checksum_path])
    return assets + [directory / "release.json"]


def write_release_metadata(archives):
    if set(archives) != set(FLAVORS):
        raise ValueError("WowUp releases require both freshly built flavors")
    metadata = {"releases": [wowup_entry(flavor, archives[flavor]) for flavor in FLAVORS]}
    verify_release(ROOT / "dist", metadata)
    temporary = ROOT / "dist" / "release.json.tmp"
    write_json(temporary, metadata)
    temporary.replace(ROOT / "dist" / "release.json")
    print("WowUp release ready: dist/release.json (Forever + Retail)", flush=True)


def assemble(flavor):
    files = source_files(flavor)
    addon = FLAVORS[flavor]
    if f"{addon}.toc" not in files:
        raise ValueError(f"Missing {addon}.toc; import the original trees first")
    target = ROOT / "build" / addon
    remove_generated(target, ROOT)
    for name, source in files.items():
        destination = target / name
        destination.parent.mkdir(parents=True, exist_ok=True)
        shutil.copyfile(source, destination)
    print(f"Assembled {flavor}: {len(files)} files -> {target}", flush=True)
    return target


def release_module(tree):
    spec = importlib.util.spec_from_file_location("release_" + tree.name, tree / "tools/build_release.py")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def validate_load_graph(tree, names, flavor):
    """Check the actual package, including every locale, not only the source tree."""
    seen = set()

    def visit(relative):
        path = (tree / relative).resolve()
        if not path.is_relative_to(tree.resolve()):
            raise ValueError(f"External load dependency: {relative}")
        relative = path.relative_to(tree.resolve()).as_posix()
        if relative.casefold() in PRIVATE and flavor == "retail":
            return
        relative_path(relative)
        if relative in seen:
            return
        seen.add(relative)
        if relative not in names:
            raise ValueError(f"Package is missing load dependency: {relative}")
        if path.suffix.lower() == ".xml":
            for element in ET.fromstring(path.read_bytes()).iter():
                if element.tag.split("}")[-1] in {"Include", "Script"} and element.get("file"):
                    visit((Path(relative).parent / element.get("file").replace("\\", "/")).as_posix())

    for toc in sorted(n for n in names if n.endswith(".toc") and "/" not in n):
        for line in (tree / toc).read_text(encoding="utf-8-sig").splitlines():
            line = line.strip()
            if line and not line.startswith("#"):
                line = re.sub(r"\s*\[AllowLoadTextLocale[^\]]*\]\s*$", "", line)
                visit(line.replace("\\", "/"))
    return len(seen)


def package(flavor, tree, tested):
    module = release_module(tree)
    version = module.version()
    addon = FLAVORS[flavor]
    files = module.release_files()
    names = []
    for archive_name, path in files:
        prefix = addon + "/"
        if not archive_name.startswith(prefix):
            raise ValueError(f"Incorrect addon folder: {archive_name}")
        relative = archive_name[len(prefix):]
        parsed = relative_path(relative)
        if {"tools", "tests", "design", "migration", ".git", "__pycache__", "dist"} & set(parsed.parts):
            raise ValueError(f"Development file in release: {relative}")
        if not path.resolve().is_relative_to(tree.resolve()):
            raise ValueError(f"External release file: {path}")
        names.append(relative)
    if len(names) != len(set(n.casefold() for n in names)):
        raise ValueError("Duplicate or case-colliding archive entries")
    count = validate_load_graph(tree, set(names), flavor)
    destination = ROOT / "dist" / addon
    remove_generated(destination, ROOT)
    destination.mkdir(parents=True)
    archive = ROOT / "dist" / archive_filename(flavor, version)
    checksums = {}
    with zipfile.ZipFile(archive, "w") as output:
        for (archive_name, source), name in zip(files, names):
            data = source.read_bytes()
            target = destination / name
            target.parent.mkdir(parents=True, exist_ok=True)
            target.write_bytes(data)
            entry = zipfile.ZipInfo(archive_name, (2020, 1, 1, 0, 0, 0))
            entry.compress_type = zipfile.ZIP_DEFLATED
            entry.create_system = 3
            entry.external_attr = 0o644 << 16
            output.writestr(entry, data, compress_type=zipfile.ZIP_DEFLATED, compresslevel=9)
            checksums[name] = hashlib.sha256(data).hexdigest()
    with zipfile.ZipFile(archive) as output:
        if output.testzip() is not None:
            raise ValueError("ZIP integrity check failed")
    write_json(archive.with_suffix(".manifest.json"), {
        "flavor": flavor, "addon": addon, "version": version, "archive": archive.name,
        "offline_tests_passed": tested,
        "archive_sha256": hashlib.sha256(archive.read_bytes()).hexdigest(), "files": checksums,
    })
    print(f"Built {archive} ({len(files)} files; {count} load dependencies checked)", flush=True)
    return archive


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("flavor", choices=["all", *FLAVORS], nargs="?", default="all")
    parser.add_argument("--assemble-only", action="store_true", help="prepare the disposable test workspace only")
    parser.add_argument("--skip-tests", action="store_true", help="development build; manifest records tests were skipped")
    parser.add_argument("--verify-release", type=Path, metavar="DIRECTORY",
                        help="verify a complete local/downloaded release instead of building")
    args = parser.parse_args(argv)
    if args.verify_release is not None:
        if args.flavor != "all" or args.assemble_only or args.skip_tests:
            parser.error("--verify-release cannot be combined with build options")
        for asset in verify_release(args.verify_release):
            print(f"Verified release asset: {asset.name}")
        return
    # Historical ZIPs may remain, but no previous manifest may advertise an unfinished build.
    (ROOT / "dist" / "release.json").unlink(missing_ok=True)
    flavors = list(FLAVORS) if args.flavor == "all" else [args.flavor]
    if not args.skip_tests and not args.assemble_only:
        subprocess.run([sys.executable, "-X", "utf8", "-m", "unittest", "discover", "-s", "tests"],
                       cwd=ROOT, check=True)
    prepared, failed = {}, []
    for flavor in flavors:
        tree = assemble(flavor)
        if args.assemble_only:
            continue
        if not args.skip_tests:
            result = subprocess.run([sys.executable, "-X", "utf8", "tests/validate.py"], cwd=tree)
            if result.returncode:
                failed.append(flavor)
                continue
        prepared[flavor] = tree
    if failed:
        raise SystemExit("No releases produced; validation failed: " + ", ".join(failed))
    archives = {flavor: package(flavor, tree, tested=not args.skip_tests)
                for flavor, tree in prepared.items()}
    if set(archives) == set(FLAVORS) and not args.skip_tests:
        write_release_metadata(archives)
    elif not args.assemble_only:
        print("Development packages only; run py -3 build.py all to generate release.json.")


if __name__ == "__main__":
    main()
