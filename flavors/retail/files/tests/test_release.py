"""The release ZIP: one GoatQuestRetail/ folder with everything the TOC loads and no personal
or development files. Licence.lua (personal subscription keys) must never be packaged."""
from pathlib import Path, PurePosixPath
import sys
import tempfile
import zipfile

sys.path.insert(0, str(Path(__file__).resolve().parent))
from gqtest import ADDON, PRIVATE_FILES, ROOT, build_release  # noqa: E402

version = build_release.version()
assert version == build_release.toc_metadata()["Version"]
files = build_release.release_files()
names = [name for name, _ in files]
relative = {name.split("/", 1)[1] for name in names}

assert all(name.startswith(f"{ADDON}/") for name in names), "one top-level folder"
assert {f"{ADDON}.toc", "files-GoatQuest.xml", "Bindings.xml"} <= relative
for name in names:
    parts = PurePosixPath(name).parts[1:]
    assert parts[-1] not in PRIVATE_FILES, f"personal keys packaged: {name}"
    assert not {"tests", "tools", "design", "migration", ".git", ".work", "__pycache__", "dist"} & set(parts), name
    suffix = PurePosixPath(name).suffix.lower()
    assert suffix not in {".py", ".pyc", ".zip"}, name
    if suffix == ".md":
        assert parts == ("README.md",) or parts[0] in build_release.VENDORED_DIRS, f"developer notes packaged: {name}"

# Everything any locale loads ships (except the user's own Licence.lua); dormant code does not.
loadable = set(build_release.load_graph(None)[0]) - PRIVATE_FILES
assert loadable <= relative, f"load graph files missing from the release: {sorted(loadable - relative)[:5]}"
dormant = [path for path in relative if PurePosixPath(path).suffix.lower() in {".lua", ".xml"}
           and path not in loadable and path != "Bindings.xml"
           and PurePosixPath(path).parts[0] not in build_release.VENDORED_DIRS]
assert not dormant, f"unloaded code packaged: {sorted(dormant)[:5]}"
hidden = [path for path in relative if path.startswith("Guides-Retail/") and path.endswith(".lua")
          and PurePosixPath(path).parts[1] not in {"Images", "Includes", "Leveling", "Dungeons", "Professions"}]
assert not hidden, f"unloaded guide categories packaged: {hidden[:5]}"
# Runtime assets are addressed by path at runtime, so they ship whole.
for asset in ("Skins/goatquest-icon.tga", "Styles/Fonts/Archivo-Regular.ttf", "Styles/Fonts/OFL-archivo.txt"):
    assert asset in relative, asset

with tempfile.TemporaryDirectory() as directory:
    archive = build_release.build(directory, compresslevel=1)
    assert archive.name == f"{ADDON}-{version}.zip"
    with zipfile.ZipFile(archive) as release:
        packaged = release.namelist()
        assert packaged == names
        assert not [name for name in packaged if PurePosixPath(name).name in PRIVATE_FILES], "Licence.lua packaged"
        assert f"{ADDON}/{ADDON}.toc" in packaged and f"{ADDON}/files-GoatQuest.xml" in packaged
        assert release.read(f"{ADDON}/{ADDON}.toc") == (ROOT / f"{ADDON}.toc").read_bytes()
        size = sum(info.file_size for info in release.infolist())
print(f"PASS release: {ADDON}-{version}.zip, {len(names)} files ({size / 1e6:.1f} MB unpacked); TOC and "
      "files-GoatQuest.xml present; no Licence.lua, tests, tools, design or dormant code")
