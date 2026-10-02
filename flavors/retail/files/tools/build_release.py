"""Build the GoatQuestRetail release ZIP and regenerate build-manifest.json.

    py -3 tools/build_release.py              # dist/GoatQuestRetail-<version>.zip
    py -3 tools/build_release.py --manifest   # rewrite build-manifest.json (needs the retail baseline)

There are no source commits to package, so the ZIP is assembled from the working tree with
an explicit allow-list. Lua/XML code ships only when the TOC can load it (for any client
locale); WoW never runs a file that no TOC/XML entry names, so dormant guide categories and
retired modules stay in the repository for reversible expansion but are not distributed.
Non-code assets of the runtime directories (textures, fonts, licences) ship as they are,
because code builds their paths at runtime. Third-party libraries ship verbatim.

Licence.lua holds the user's personal subscription keys. It is part of the load graph,
exactly as in stock, but is never packaged: each install supplies its own copy.
"""
from pathlib import Path, PurePosixPath
import argparse
import json
import re
import sys
import xml.etree.ElementTree as ET
import zipfile


ROOT = Path(__file__).resolve().parents[1]
ADDON = "GoatQuestRetail"
TOC = f"{ADDON}.toc"
BASELINE = ROOT.parent / ".work" / "retail-baseline"
TARGET_CLIENT = "12.1.0.69933 / Interface 120100"
FOCUS = "Leveling, Dungeons, Professions guides and navigation"

PRIVATE_FILES = {"Licence.lua", "License.lua"}  # personal subscription keys
RUNTIME_DIRS = {
    "Arrows", "Code-Retail", "Compat", "Data-Retail", "GoldUI", "Guides-Retail",
    "Libs", "Libs-Retail", "Localization", "Localization-Retail", "Skins", "Styles",
    "UiWidgets", "Widgets",
}
VENDORED_DIRS = {"Libs", "Libs-Retail"}  # third-party packages, with their own notes and licences
# Bindings.xml is read by the client without a TOC entry; README.md is the install note.
ROOT_FILES = {TOC, "Bindings.xml", "README.md"}
EXCLUDED_PARTS = {".git", ".work", "__pycache__", "dist", "tests", "tools", "design", "migration"}
# Texture generators, source art and developer notes (outside the vendored libraries).
EXCLUDED_SUFFIXES = {".py", ".pyc", ".png", ".html", ".zip", ".md"}
CODE_SUFFIXES = {".lua", ".xml"}
# Compared with normalized line endings in the manifest ("" covers .gitignore, LICENSE).
TEXT_SUFFIXES = CODE_SUFFIXES | {".toc", ".txt", ".md", ".json", ".py", ".html", ""}
TEXT_LOCALES = ("enUS", "enGB", "deDE", "esES", "esMX", "frFR", "itIT", "koKR", "ptBR", "ruRU", "zhCN", "zhTW")
_DIRECTIVE = re.compile(r"\s*\[(\w+)\s*([^\]]*)\]\s*$")


def toc_text() -> str:
    return (ROOT / TOC).read_text(encoding="utf-8-sig")


def toc_metadata() -> dict:
    return dict(re.findall(r"^## ([\w-]+):[ \t]*(.*?)\s*$", toc_text(), re.MULTILINE))


def toc_entries() -> list:
    """TOC file entries in order, as (relative path, locales or None for every client)."""
    entries = []
    for line in toc_text().splitlines():
        line = line.strip()
        if not line or line.startswith("#"):
            continue
        locales = None
        match = _DIRECTIVE.search(line)
        if match:
            if match.group(1) != "AllowLoadTextLocale":
                raise SystemExit(f"Unsupported TOC directive: {line}")
            locales = tuple(value.strip() for value in match.group(2).split(",") if value.strip())
            line = line[:match.start()]
        entries.append((line.strip().replace("\\", "/"), locales))
    return entries


def load_graph(locale="enUS"):
    """Files a client of this text locale loads, in load order (None: every locale).

    Returns (files, inline_scripts, missing) with repository-relative POSIX paths.
    """
    files, inline, missing, seen = [], [], [], set()

    def visit(path):
        path = path.resolve()
        if not path.is_relative_to(ROOT):
            raise SystemExit(f"External addon dependency: {path}")
        relative = path.relative_to(ROOT).as_posix()
        if relative in seen:
            return
        seen.add(relative)
        if not path.is_file():
            missing.append(relative)
            return
        files.append(relative)
        if path.suffix.lower() == ".xml":
            for element in ET.fromstring(path.read_bytes()).iter():
                tag = element.tag.split("}")[-1]
                if tag in {"Include", "Script"} and element.get("file"):
                    visit(path.parent / element.get("file").replace("\\", "/"))
                elif tag == "Script" and element.text and element.text.strip():
                    inline.append((relative, element.text))

    for relative, locales in toc_entries():
        if locale is None or locales is None or locale in locales:
            visit(ROOT / relative)
    return files, inline, missing


def toc_version() -> str:
    value = toc_metadata().get("Version", "")
    if not re.fullmatch(r"\d+\.\d+\.\d+", value):
        raise SystemExit("Missing semantic version in the TOC")
    return value


def version() -> str:
    """The release version: the TOC's, which build-manifest.json must agree with."""
    value = toc_version()
    manifest = json.loads((ROOT / "build-manifest.json").read_text(encoding="utf-8"))
    if manifest["version"] != value:
        raise SystemExit("build-manifest.json version differs from the TOC")
    return value


def release_files() -> list:
    """(archive name, path) pairs for the release, sorted."""
    files, _, missing = load_graph(None)
    missing = [relative for relative in missing if relative not in PRIVATE_FILES]
    if missing:
        raise SystemExit("Missing load dependencies: " + ", ".join(missing))
    loadable = set(files)
    result = []
    for path in ROOT.rglob("*"):
        if not path.is_file():
            continue
        relative = path.relative_to(ROOT).as_posix()
        parts = PurePosixPath(relative).parts
        suffix = path.suffix.lower()
        if relative in PRIVATE_FILES or any(part in EXCLUDED_PARTS for part in parts):
            continue
        if len(parts) == 1:
            if relative not in ROOT_FILES and relative not in loadable:
                continue
        elif parts[0] not in RUNTIME_DIRS:
            continue
        elif parts[0] not in VENDORED_DIRS:
            if suffix in EXCLUDED_SUFFIXES or (suffix in CODE_SUFFIXES and relative not in loadable):
                continue
        if not path.resolve().is_relative_to(ROOT):
            raise SystemExit(f"External file: {relative}")
        result.append((f"{ADDON}/{relative}", path))
    names = {name for name, _ in result}
    for required in (TOC, "files-GoatQuest.xml"):
        if f"{ADDON}/{required}" not in names:
            raise SystemExit(f"Release is missing {required}")
    for name in names:
        if PurePosixPath(name).name in PRIVATE_FILES:
            raise SystemExit(f"Release would contain personal keys: {name}")
    return sorted(result)


def build(output_dir=None, compresslevel=9) -> Path:
    """Write <output_dir or dist>/GoatQuestRetail-<version>.zip with one top-level folder."""
    value = version()
    archive = Path(output_dir or ROOT / "dist") / f"{ADDON}-{value}.zip"
    archive.parent.mkdir(parents=True, exist_ok=True)
    files = release_files()
    with zipfile.ZipFile(archive, "w") as output:
        for name, path in files:
            entry = zipfile.ZipInfo(name, (2020, 1, 1, 0, 0, 0))
            entry.compress_type = zipfile.ZIP_DEFLATED
            entry.create_system = 3
            entry.external_attr = 0o644 << 16
            output.writestr(entry, path.read_bytes(), compress_type=zipfile.ZIP_DEFLATED, compresslevel=compresslevel)
    with zipfile.ZipFile(archive) as output:
        if output.testzip() is not None:
            raise SystemExit("Release ZIP failed its integrity check")
    return archive


def _source_files(root: Path) -> dict:
    """Relative path -> bytes (line endings normalized for text) for a source tree."""
    result = {}
    for path in root.rglob("*"):
        if not path.is_file():
            continue
        relative = path.relative_to(root).as_posix()
        if relative in PRIVATE_FILES or path.suffix == ".pyc":
            continue
        if any(part in {".git", ".work", "__pycache__", "dist"} for part in PurePosixPath(relative).parts):
            continue
        data = path.read_bytes()
        if path.suffix.lower() in TEXT_SUFFIXES:
            data = data.replace(b"\r\n", b"\n")
        result[relative] = data
    return result


def generate_manifest(baseline=BASELINE) -> dict:
    """Describe this tree relative to the transformed upstream retail source."""
    baseline = Path(baseline)
    if not (baseline / "Ver.lua").is_file():
        raise SystemExit(f"Retail baseline not found: {baseline}")
    ours, theirs = _source_files(ROOT), _source_files(baseline)
    revision = re.search(rb"\$Revision: (\d+) \$", theirs["Ver.lua"])
    return {
        "version": toc_version(),
        "target_client": TARGET_CLIENT,
        "focus": FOCUS,
        "upstream": "Retail guide viewer revision " + (revision.group(1).decode() if revision else "unknown")
                    + ", name transform from tools/goat_transform.py",
        "branding_namespace": "GoatQuest; GQ shorthand",
        "subscription_gate": "Stock Licence.lua gate kept; Licence.lua (personal keys) is git-ignored and never packaged",
        "release": "Code the TOC loads for any locale plus runtime assets; dormant guide categories, tests, "
                   "tools, design and Licence.lua stay out of the ZIP",
        "modified_from_retail": sorted(path for path in ours.keys() & theirs.keys() if ours[path] != theirs[path]),
        "added_files": sorted(ours.keys() - theirs.keys()),
        "deleted_from_retail": sorted(theirs.keys() - ours.keys()),
    }


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    parser.add_argument("--manifest", action="store_true", help="regenerate build-manifest.json from the retail baseline")
    parser.add_argument("--baseline", default=str(BASELINE), help="transformed upstream retail tree")
    parser.add_argument("--output", help="directory for the ZIP (default: dist)")
    args = parser.parse_args()
    if args.manifest:
        manifest = generate_manifest(args.baseline)
        (ROOT / "build-manifest.json").write_text(json.dumps(manifest, indent=2) + "\n", encoding="utf-8")
        print(f"Wrote build-manifest.json: {len(manifest['modified_from_retail'])} modified, "
              f"{len(manifest['added_files'])} added, {len(manifest['deleted_from_retail'])} deleted")
        return
    archive = build(args.output)
    with zipfile.ZipFile(archive) as output:
        count = len(output.namelist())
    print(f"Built {archive} ({count} files, {archive.stat().st_size / 1e6:.1f} MB)")


if __name__ == "__main__":
    sys.exit(main())
