"""Package an assembled Forever tree without requiring a separate Git repository."""

from pathlib import Path, PurePosixPath
import json
import re
import zipfile


ROOT = Path(__file__).resolve().parents[1]
ADDON = "GoatQuest"
RUNTIME_DIRS = {
    "Arrows", "Code-Classic", "Code-Forever", "Code-Retail", "Compat",
    "Data-Classic", "GoldUI", "Guides-Classic", "Guides-ClassicSeason",
    "Libs", "Libs-Classic", "Localization", "Localization-Classic",
    "Skins", "Styles", "UiWidgets", "Widgets",
}
ROOT_FILES = {"README.md"}
ROOT_SUFFIXES = {".lua", ".xml", ".toc"}
EXCLUDED_PARTS = {"tests", "tools", "design", "migration", "__pycache__"}
PRIVATE_FILES = {"licence.lua", "license.lua"}


def version() -> str:
    toc = (ROOT / f"{ADDON}.toc").read_text(encoding="utf-8-sig")
    match = re.search(r"^## Version: (\d+\.\d+\.\d+)\s*$", toc, re.MULTILINE)
    if not match:
        raise SystemExit("Missing semantic version in TOC")
    value = match.group(1)
    mainline = (ROOT / f"{ADDON}_Mainline.toc").read_text(encoding="utf-8-sig")
    if toc != mainline:
        raise SystemExit("Mainline TOC differs from the primary TOC")
    if json.loads((ROOT / "build-manifest.json").read_text(encoding="utf-8"))["version"] != value:
        raise SystemExit("build-manifest.json version differs from the TOC")
    return value


def release_files() -> list[tuple[str, Path]]:
    result = []
    for path in ROOT.rglob("*"):
        if not path.is_file():
            continue
        relative = path.relative_to(ROOT).as_posix()
        parts = PurePosixPath(relative).parts
        if parts[-1].casefold() in PRIVATE_FILES:
            continue
        if any(part in EXCLUDED_PARTS for part in parts):
            continue
        if len(parts) == 1:
            if relative not in ROOT_FILES and PurePosixPath(relative).suffix.lower() not in ROOT_SUFFIXES:
                continue
        elif parts[0] not in RUNTIME_DIRS:
            continue
        path = ROOT.joinpath(*parts)
        if not path.is_file() or not path.resolve().is_relative_to(ROOT):
            raise SystemExit(f"Missing or external tracked file: {relative}")
        result.append((f"{ADDON}/{relative}", path))
    if f"{ADDON}/{ADDON}.toc" not in {name for name, _ in result}:
        raise SystemExit("Release is missing its primary TOC")
    return sorted(result)


def main() -> None:
    value = version()
    archive = ROOT / "dist" / f"{ADDON}-{value}.zip"
    archive.parent.mkdir(exist_ok=True)
    files = release_files()
    with zipfile.ZipFile(archive, "w") as output:
        for name, path in files:
            entry = zipfile.ZipInfo(name, (2020, 1, 1, 0, 0, 0))
            entry.compress_type = zipfile.ZIP_DEFLATED
            entry.create_system = 3
            entry.external_attr = 0o644 << 16
            output.writestr(entry, path.read_bytes(), compress_type=zipfile.ZIP_DEFLATED, compresslevel=9)
    with zipfile.ZipFile(archive) as output:
        if output.testzip() is not None:
            raise SystemExit("Release ZIP failed its integrity check")
    print(f"Built {archive} ({len(files)} files)")


if __name__ == "__main__":
    main()
