"""Refresh Licence.lua (guide subscription data) from the installed Zygor Guides Viewer.

    py -3 tools/refresh_licence.py            # copy the current subscription data
    py -3 tools/refresh_licence.py --check    # report only; exit 1 when an update is pending

Licence.lua holds the user's personal per-guide-tier subscription keys and the expiry date
(DATE_E) that GoatQuestRetail checks exactly as the stock viewer does (see LICENCE-USAGE.md).
The Zygor client keeps the upstream copy current. This tool copies it through the shared
name transform (tools/goat_transform.py) and validates the result first; then /reload in game.
It updates this folder and, when one exists, the installed copy in the Retail AddOns folder
(release ZIPs never contain Licence.lua); --target picks the folders explicitly.

Writing is the default: the refresh is idempotent, its only source is the user's own installed
file, and it is the documented fix for the expiry popup, so a dry-run default would just add
a step. It refuses to replace the current file with one that expires earlier unless
--allow-older is given, and leaves the current file untouched whenever validation fails.

Privacy: only expiry dates are printed. Key values are never printed, logged or copied
anywhere except GoatQuestRetail/Licence.lua, which is git-ignored and never packaged.
"""
from datetime import datetime
from pathlib import Path
import argparse
import os
import re
import subprocess
import sys

sys.path.insert(0, str(Path(__file__).resolve().parent))
import goat_transform  # noqa: E402

ROOT = Path(__file__).resolve().parents[1]
TARGET = ROOT / "Licence.lua"
DATE_E = re.compile(rb"^\s*DATE_E\s*=\s*(\d+)\s*,", re.MULTILINE)
STRINGS = re.compile(rb'"(?:[^"\\\r\n]|\\.)*"')
UPSTREAM_TABLE = re.compile(rb"^ZygorGuidesViewer\.Licences\s*=\s*\{", re.MULTILINE)
TARGET_TABLE = re.compile(rb"^GoatQuest\.Licences\s*=\s*\{", re.MULTILINE)


def describe(stamp):
    """An expiry date for humans: local time and days remaining."""
    if stamp is None:
        return "no expiry date"
    when = datetime.fromtimestamp(stamp)
    days = (when - datetime.now()).total_seconds() / 86400
    count = int(days) if days >= 0 else int(-days) + 1
    plural = "day" if count == 1 else "days"
    left = f"{count} {plural} left" if days >= 0 else f"expired {count} {plural} ago"
    return f"{when:%Y-%m-%d %H:%M} ({left})"


def expiry(data):
    match = DATE_E.search(data)
    return int(match.group(1)) if match else None


def lua_check(data):
    """Load the transformed file with Lua 5.1 if lupa is installed. Returns DATE_E or None."""
    try:
        from lupa.lua51 import LuaRuntime
    except ImportError:
        return None
    run = LuaRuntime(encoding=None).eval(b"""function(chunk)
        local f = loadstring(chunk)
        if not f then return false end
        local env = {GoatQuest = {}}
        setfenv(f, env)
        if not pcall(f) or type(env.GoatQuest.Licences) ~= "table" then return false end
        return tonumber(env.GoatQuest.Licences.DATE_E) or -1
    end""")
    result = run(data)
    if result is False:
        raise ValueError("the transformed file does not load as GoatQuest.Licences")
    return result


def build(upstream):
    """Transform and validate upstream bytes. Raises ValueError without quoting file content."""
    if not UPSTREAM_TABLE.search(upstream) or expiry(upstream) is None:
        raise ValueError("it does not look like a Zygor subscription file (no Licences table or DATE_E)")
    data = goat_transform.transform_bytes(upstream, ".lua")
    if not TARGET_TABLE.search(data):
        raise ValueError("the name transform did not produce a GoatQuest.Licences table")
    if STRINGS.findall(data) != STRINGS.findall(upstream):
        raise ValueError("the name transform would change key strings")
    loaded = lua_check(data)
    if loaded is not None and loaded != expiry(data):
        raise ValueError("DATE_E read by Lua differs from the file text")
    return data


def check_ignored():
    """Warn if git would track Licence.lua (read-only check)."""
    if not (ROOT / ".git").exists():
        return
    try:
        result = subprocess.run(["git", "-C", str(ROOT), "check-ignore", "-q", TARGET.name],
                                capture_output=True)
    except OSError:
        return
    if result.returncode == 1:
        print("WARNING: Licence.lua is not git-ignored; add '/Licence.lua' to .gitignore before committing.")


def default_targets():
    """This folder, plus the installed GoatQuestRetail when the game loads a separate copy."""
    targets = [ROOT]
    installed = goat_transform.UPSTREAM.parent / goat_transform.ADDON
    if (installed / f"{goat_transform.ADDON}.toc").is_file() and installed.resolve() != ROOT.resolve():
        targets.append(installed)
    return targets


def refresh(folder, data, args):
    """Bring folder/Licence.lua up to date with data. Returns an exit code."""
    target = folder / TARGET.name
    current = target.read_bytes() if target.is_file() else None
    old, new = (expiry(current) if current else None), expiry(data)
    print(f"Current:   {target}")
    print(f"  expires  {describe(old) if current else 'missing'}")
    if current == data:
        print("  up to date")
        return 0
    if old is not None and new < old and not args.allow_older:
        print("  not refreshed: the upstream file expires earlier than this one (use --allow-older)")
        return 1
    if args.check:
        print("  update available; run without --check to apply it")
        return 1
    temporary = target.with_name(target.name + ".tmp")
    try:
        temporary.write_bytes(data)
        os.replace(temporary, target)
    finally:
        temporary.unlink(missing_ok=True)
    print("  refreshed; type /reload in game")
    return 0


def main():
    parser = argparse.ArgumentParser(description=__doc__.split("\n\n")[0])
    parser.add_argument("--check", action="store_true", help="report only, write nothing")
    parser.add_argument("--allow-older", action="store_true",
                        help="replace the current file even if the upstream one expires earlier")
    parser.add_argument("--upstream", type=Path, default=goat_transform.UPSTREAM,
                        help="ZygorGuidesViewer addon folder (default: the Retail install)")
    parser.add_argument("--target", type=Path, action="append",
                        help="GoatQuestRetail folder to update (repeatable; default: this folder and, "
                             "if present, the installed copy in the Retail AddOns folder)")
    args = parser.parse_args()

    source = args.upstream / "Licence.lua"
    if not source.is_file():
        print(f"Upstream Licence.lua not found: {source}")
        print("Install or update the guides with the Zygor client, or pass --upstream.")
        return 2
    try:
        data = build(source.read_bytes())
    except (OSError, ValueError) as error:
        detail = error.strerror if isinstance(error, OSError) else error
        print(f"Not refreshing: upstream Licence.lua is unusable: {detail}")
        return 2

    print(f"Upstream:  {source}")
    print(f"  expires  {describe(expiry(data))}")
    check_ignored()
    return max(refresh(folder, data, args) for folder in (args.target or default_targets()))


if __name__ == "__main__":
    sys.exit(main())
