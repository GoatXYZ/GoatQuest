"""Import/reconcile the two existing addon trees; dry run unless --apply is given.

Three-way SHA-256 comparison preserves edits in this repository and refuses conflicts.
No runtime dependency on the original repositories remains after import.
"""
import argparse
import json
from pathlib import Path
import subprocess
import sys

from source_tree import ROOT, FLAVORS, PRIVATE, digest, relative_path, source_files, write_json

FLAVOR_PREFIXES = ("Code-", "Data-", "Guides-", "Localization-", "Libs-")
EXCLUDED = {".git", ".work", "dist", "build", ".release", "__pycache__", ".pytest_cache"}


def read_original(root):
    names = subprocess.check_output(
        ["git", "ls-files", "--cached", "--others", "--exclude-standard", "-z"], cwd=root
    ).decode("utf-8").split("\0")
    result = {}
    for name in sorted(set(filter(None, names))):
        path = root / name
        if path.name.casefold() in PRIVATE or EXCLUDED.intersection(Path(name).parts):
            continue
        relative_path(name)
        if path.is_symlink() or not path.resolve().is_relative_to(root.resolve()):
            raise ValueError(f"External or linked import: {name}")
        if path.is_file():
            result[name] = path.read_bytes()
    return result


def reconcile(base, current, incoming):
    """Return merged bytes and conflicting paths; a missing path represents deletion."""
    result, conflicts = {}, []
    for name in sorted(base.keys() | current.keys() | incoming.keys()):
        old = base.get(name)
        local, new = current.get(name), incoming.get(name)
        if digest(new) == old or local == new:
            chosen = local
        elif digest(local) == old:
            chosen = new
        else:
            conflicts.append(name)
            continue
        if chosen is not None:
            result[name] = chosen
    return result, conflicts


def partition(trees):
    a, b = (trees[f] for f in FLAVORS)
    shared = {name: a[name] for name in a.keys() & b.keys()
              if a[name] == b[name] and not name.split("/")[0].startswith(FLAVOR_PREFIXES)
              and name != ".gitignore"}
    planned = {"core/" + name: data for name, data in shared.items()}
    for flavor, tree in trees.items():
        planned.update({f"flavors/{flavor}/files/{name}": data for name, data in tree.items()
                        if name not in shared})
    return planned, len(shared)


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    for flavor, addon in FLAVORS.items():
        parser.add_argument("--" + flavor, type=Path, default=ROOT.parent / addon)
    parser.add_argument("--apply", action="store_true")
    args = parser.parse_args(argv)
    state_path = ROOT / "migration" / "import-state.json"
    state = json.loads(state_path.read_text(encoding="utf-8")) if state_path.exists() else {}
    trees, updated, conflicts = {}, {}, []
    for flavor in FLAVORS:
        incoming = read_original(getattr(args, flavor))
        if f"{FLAVORS[flavor]}.toc" not in incoming:
            raise ValueError(f"Not a {flavor} source tree: {getattr(args, flavor)}")
        current = {n: p.read_bytes() for n, p in source_files(flavor).items()}
        trees[flavor], problems = reconcile(state.get(flavor, {}), current, incoming)
        conflicts.extend(f"{flavor}: {name}" for name in problems)
        updated[flavor] = {n: digest(data) for n, data in incoming.items()}
        print(f"{flavor}: {len(incoming)} imported files; {len(problems)} conflicts")
    if conflicts:
        raise SystemExit("Import stopped; no source files written. Resolve both versions before retrying:\n" +
                         "\n".join(conflicts))
    planned, shared_count = partition(trees)
    existing = {p.relative_to(ROOT).as_posix(): p for flavor in FLAVORS
                for p in source_files(flavor).values()}
    changed = sorted(n for n, data in planned.items() if n not in existing or existing[n].read_bytes() != data)
    removed = sorted(existing.keys() - planned.keys())
    print(f"{shared_count} shared files; write {len(changed)}, remove {len(removed)} relocated/deleted files")
    for name in changed[:30]:
        print("  write " + name)
    if not args.apply:
        print("Dry run; use --apply to import.")
        return
    for name in changed:
        target = ROOT / name
        target.parent.mkdir(parents=True, exist_ok=True)
        target.write_bytes(planned[name])
    for name in removed:
        existing[name].unlink()
    write_json(state_path, updated)
    print("Imported. Run py -3 build.py all to validate both flavors.")


if __name__ == "__main__":
    main()
