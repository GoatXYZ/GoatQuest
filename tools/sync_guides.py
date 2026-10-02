"""Run Retail's existing importer in a workspace, then save only guide changes to source."""
import argparse
import importlib.util
import json
from pathlib import Path
import sys

from source_tree import ROOT, scan, write_json


def load_module(name, path):
    spec = importlib.util.spec_from_file_location(name, path)
    module = importlib.util.module_from_spec(spec)
    sys.modules[name] = module
    spec.loader.exec_module(module)
    return module


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("flavor", choices=["retail"])
    parser.add_argument("--apply", action="store_true")
    parser.add_argument("--prune", action="store_true")
    parser.add_argument("--upstream", type=Path, help="installed upstream addon folder")
    args = parser.parse_args(argv)
    builder = load_module("monobuild", ROOT / "build.py")
    tree = builder.assemble(args.flavor)
    target = ROOT / "flavors" / args.flavor / "files" / "Guides-Retail"
    before = {name: path.read_bytes() for name, path in scan(target).items()}
    sys.path.insert(0, str(tree / "tools"))
    native = load_module("retail_guide_sync", tree / "tools/sync_guides.py")
    if args.upstream:
        native.UPSTREAM = args.upstream.resolve()
        native.UPSTREAM_GUIDES = native.UPSTREAM / "Guides-Retail"
    native.main((["--apply"] if args.apply else []) + (["--prune"] if args.prune else []))
    if not args.apply:
        return
    after = {name: path.read_bytes() for name, path in scan(tree / "Guides-Retail").items()}
    current = {name: path.read_bytes() for name, path in scan(target).items()}
    if current != before:
        raise SystemExit("Guide source changed during sync; nothing copied back. Retry from the current source.")
    for name, data in after.items():
        if before.get(name) != data:
            path = target / name
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_bytes(data)
    for name in before.keys() - after.keys():
        (target / name).unlink()
    # Keep the historical inventory consistent when the upstream catalogue adds/removes files.
    manifest_path = target.parent / "build-manifest.json"
    manifest = json.loads(manifest_path.read_text(encoding="utf-8"))
    added, modified, deleted = (set(manifest[k]) for k in ("added_files", "modified_from_retail", "deleted_from_retail"))
    for name in after.keys() - before.keys():
        relative = "Guides-Retail/" + name
        if relative in deleted:
            deleted.remove(relative)
            modified.add(relative)
        else:
            added.add(relative)
    for name in before.keys() - after.keys():
        relative = "Guides-Retail/" + name
        if relative in added:
            added.remove(relative)
        else:
            deleted.add(relative)
        modified.discard(relative)
    manifest.update(added_files=sorted(added), modified_from_retail=sorted(modified), deleted_from_retail=sorted(deleted))
    write_json(manifest_path, manifest)
    print("Guide changes saved to flavors/retail/files/Guides-Retail. Run py -3 build.py retail.")


if __name__ == "__main__":
    main()
