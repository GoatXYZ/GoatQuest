"""Shared source layout and guarded file operations (Python 3.10+)."""
from pathlib import Path, PurePosixPath
import hashlib
import json
import shutil

ROOT = Path(__file__).resolve().parents[1]
FLAVORS = {"forever": "GoatQuest", "retail": "GoatQuestRetail"}
PRIVATE = {"licence.lua", "license.lua"}
IGNORED = {".git", "__pycache__", ".pytest_cache"}


def digest(data):
    return hashlib.sha256(data).hexdigest() if data is not None else None


def relative_path(name):
    path = PurePosixPath(name)
    if not name or "\\" in name or ":" in name or path.is_absolute() or ".." in path.parts:
        raise ValueError(f"Unsafe relative path: {name!r}")
    if path.name.casefold() in PRIVATE:
        raise ValueError(f"Personal file cannot be source or release content: {name}")
    return path


def scan(directory):
    result = {}
    if not directory.exists():
        return result
    base = directory.resolve()
    for path in sorted(directory.rglob("*")):
        name = path.relative_to(directory).as_posix()
        if IGNORED.intersection(PurePosixPath(name).parts):
            continue
        if path.is_symlink() or (hasattr(path, "is_junction") and path.is_junction()):
            raise ValueError(f"Linked source path is not supported: {path}")
        if path.is_file():
            relative_path(name)
            if not path.resolve().is_relative_to(base):
                raise ValueError(f"Source escapes its directory: {path}")
            result[name] = path
    return result


def source_files(flavor, root=ROOT):
    if flavor not in FLAVORS:
        raise ValueError(f"Unknown flavor: {flavor}")
    shared = scan(root / "core")
    specific = scan(root / "flavors" / flavor / "files")
    overlap = shared.keys() & specific.keys()
    if overlap:
        raise ValueError(f"Ambiguous core/flavor files for {flavor}: {sorted(overlap)}")
    files = shared | specific
    if len(files) != len({name.casefold() for name in files}):
        raise ValueError(f"Case-colliding source files for {flavor}")
    return dict(sorted(files.items()))


def write_json(path, value):
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(value, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")


def remove_generated(path, root=ROOT):
    """Recursive removal is restricted to descendants of this repo's build/dist dirs."""
    target = path.resolve()
    allowed = [(root / name).resolve() for name in ("build", "dist")]
    if not any(target != base and target.is_relative_to(base) for base in allowed):
        raise ValueError(f"Refusing to remove a non-generated directory: {target}")
    if path.is_symlink() or (hasattr(path, "is_junction") and path.is_junction()):
        raise ValueError(f"Refusing to remove a linked directory: {path}")
    if path.exists():
        shutil.rmtree(path)
