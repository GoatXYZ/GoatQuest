"""Guides-Retail is exactly what tools/sync_guides.py builds from the installed upstream addon.

Guide files and Guides-Retail/Autoload.xml are generated (rename, text cleanup, upstream fixes,
catalogue selection), so a hand edit would be lost on the next sync: edit the tool instead.
While the installed upstream is the revision the tree was synced from, any difference fails.
After a client update installs a newer upstream revision, the check only warns until
`py -3 tools/sync_guides.py --apply` is run. The upstream folder is only read.
"""
from pathlib import Path
import re
import sys

sys.path.insert(0, str(Path(__file__).resolve().parent))
from gqtest import ROOT, warn  # noqa: E402  (also puts tools/ on sys.path)

import sync_guides  # noqa: E402

if not sync_guides.UPSTREAM_GUIDES.is_dir():
    warn(f"catalogue sync not checked: upstream guides not installed at {sync_guides.UPSTREAM_GUIDES}")
    sys.exit(0)

header = (ROOT / "Guides-Retail" / sync_guides.MANIFEST).read_text(encoding="utf-8", errors="replace")[:2000]
synced = re.search(r"from upstream revision (\w+)", header)
assert synced, "Guides-Retail/Autoload.xml has no generator header: regenerate it with tools/sync_guides.py --apply"

expected = sync_guides.expected_tree()
local = sync_guides.read_local()
added = sorted(set(expected.tree) - set(local))
removed = sorted(set(local) - set(expected.tree))
changed = sorted(rel for rel in set(expected.tree) & set(local) if local[rel].read_bytes() != expected.tree[rel])
differences = [f"missing {rel}" for rel in added] + [f"edited {rel}" for rel in changed] + \
              [f"not generated {rel}" for rel in removed]

if expected.revision != synced.group(1):
    warn(f"Guides-Retail was synced from upstream revision {synced.group(1)}, the installed upstream is "
         f"{expected.revision} ({len(differences)} file(s) differ): run py -3 tools/sync_guides.py, then --apply")
    sys.exit(0)
assert not differences, ("Guides-Retail differs from tools/sync_guides.py output (edit the tool, not the files):\n  "
                         + "\n  ".join(differences[:20]))
assert not expected.fix_notes, "\n".join(expected.fix_notes)
print(f"PASS catalogue sync: Guides-Retail matches tools/sync_guides.py for upstream revision {expected.revision} "
      f"({len(expected.tree)} files, {len(expected.catalogue.loaded)} catalogue scripts, "
      f"{len(sync_guides.UPSTREAM_FIXES)} upstream fixes, {len(sync_guides.DROPPED_FILES)} upstream files not shipped)")
