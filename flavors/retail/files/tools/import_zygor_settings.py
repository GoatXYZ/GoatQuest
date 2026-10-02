"""Copy Zygor Guides Viewer settings into GoatQuestRetail, offline, once per account.

    py -3 tools/import_zygor_settings.py            # dry run: report what would be imported
    py -3 tools/import_zygor_settings.py --apply    # write the copies

WoW only loads an addon's own SavedVariables, so GoatQuestRetail cannot read Zygor's file
in game without loading Zygor itself. For every account folder this tool copies

    WTF/Account/<ACCOUNT>/SavedVariables/ZygorGuidesViewer.lua
 -> WTF/Account/<ACCOUNT>/SavedVariables/GoatQuestRetail.lua

renaming only the top-level ZygorGuidesViewerSettings assignment to GoatQuestSettings; every
other byte is copied unchanged and the source file is never modified. An existing
GoatQuestRetail.lua is never overwritten: delete it yourself if you want to import again.
On the next login GoatQuestRetail notices the unmarked save and records the import
(Compat/MigrateSettings.lua; /goatquestdebug shows it).

The game must be closed: WoW rewrites SavedVariables on logout and /reload, so a copy taken
while it runs could be stale or be overwritten. The tool refuses while Wow.exe, WowT.exe or
WowB.exe is running.

Per-character SavedVariables are not involved: GoatQuestRetail.toc declares none (and the Zygor
TOC's per-character line is disabled), so character folders are left alone.

With lupa installed (Lua 5.1), each copy is also loaded and compared with the source table
before it is written.
"""
from pathlib import Path
import argparse
import csv
import io
import os
import re
import subprocess
import sys

sys.path.insert(0, str(Path(__file__).resolve().parent))
import goat_transform  # noqa: E402  (shared paths/naming; the settings copy itself is not transformed)

ROOT = Path(__file__).resolve().parents[1]
TOC = ROOT / f"{goat_transform.ADDON}.toc"
SOURCE_FILE = "ZygorGuidesViewer.lua"
TARGET_FILE = f"{goat_transform.ADDON}.lua"
SOURCE_VAR = b"ZygorGuidesViewerSettings"
TARGET_VAR = b"GoatQuestSettings"
GAME_PROCESSES = {"wow.exe", "wowt.exe", "wowb.exe"}
TOP_LEVEL = re.compile(rb"(?m)^([A-Za-z_][A-Za-z0-9_]*)[ \t]*=")


def default_wtf() -> Path:
    """The WTF folder of the install this addon sits in, else the standard Retail one."""
    if ROOT.parent.name.lower() == "addons" and ROOT.parent.parent.name.lower() == "interface":
        return ROOT.parents[2] / "WTF"
    return goat_transform.UPSTREAM.parents[2] / "WTF"


def running_game() -> list:
    """Names of running WoW clients. Raises RuntimeError when the check cannot be made."""
    if os.name == "nt":
        command = ["tasklist", "/FO", "CSV", "/NH"]
    else:
        command = ["ps", "-A", "-o", "comm="]
    try:
        output = subprocess.run(command, capture_output=True, text=True, check=True).stdout
    except (OSError, subprocess.CalledProcessError) as error:
        raise RuntimeError(f"cannot list running processes ({error})") from None
    if os.name == "nt":
        names = [row[0] for row in csv.reader(io.StringIO(output)) if row]
    else:
        names = [Path(line.strip()).name for line in output.splitlines() if line.strip()]
    return sorted({name for name in names if name.lower() in GAME_PROCESSES})


def check_toc() -> None:
    """Confirm the SavedVariables layout this tool was written for."""
    text = TOC.read_text(encoding="utf-8-sig")
    declared = re.findall(r"^## SavedVariables:[ \t]*(.*?)\s*$", text, re.MULTILINE)
    if [name.strip() for line in declared for name in line.split(",")] != [TARGET_VAR.decode()]:
        raise SystemExit(f"{TOC.name} must declare only '## SavedVariables: {TARGET_VAR.decode()}'.")
    if re.search(r"^## SavedVariablesPerCharacter:", text, re.MULTILINE):
        raise SystemExit(f"{TOC.name} declares per-character SavedVariables; this tool does not import them.")


def convert(source: bytes) -> bytes:
    """Rename the single top-level assignment; refuse anything unexpected."""
    names = TOP_LEVEL.findall(source)
    if names != [SOURCE_VAR]:
        found = ", ".join(sorted({name.decode("ascii", "replace") for name in names})) or "none"
        raise ValueError(f"expected one top-level {SOURCE_VAR.decode()} assignment, found: {found}")
    start = TOP_LEVEL.search(source).start(1)
    return source[:start] + TARGET_VAR + source[start + len(SOURCE_VAR):]


def verify_with_lua(source: bytes, copy: bytes):
    """Load both files with Lua 5.1 and deep-compare the tables. None when lupa is missing."""
    try:
        from lupa.lua51 import LuaRuntime
    except ImportError:
        return None
    compare = LuaRuntime(encoding=None).eval(b"""function(source, copy)
        -- Run each file in an empty environment, as data: it cannot reach io/os.
        local function run(chunk)
            local f = assert(loadstring(chunk))
            local env = {}
            setfenv(f, env)()
            return env
        end
        local function same(a, b, seen)
            if type(a) ~= "table" or type(b) ~= "table" then return a == b end
            if seen[a] then return seen[a] == b end
            seen[a] = b
            for k, v in pairs(a) do if not same(v, rawget(b, k), seen) then return false end end
            for k in pairs(b) do if rawget(a, k) == nil then return false end end
            return true
        end
        local a, b = run(source), run(copy)
        return type(a.ZygorGuidesViewerSettings) == "table" and b.ZygorGuidesViewerSettings == nil
            and same(a.ZygorGuidesViewerSettings, b.GoatQuestSettings, {})
    end""")
    if not compare(source, copy):
        raise ValueError("the copy does not load as the same Lua table")
    return True


def write_new(path: Path, data: bytes) -> None:
    """Create path exclusively (never replaces an existing file); remove it if writing fails."""
    with open(path, "xb") as handle:
        try:
            handle.write(data)
            handle.flush()
            os.fsync(handle.fileno())
        except BaseException:
            handle.close()
            path.unlink(missing_ok=True)
            raise


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__.split("\n\n")[0])
    parser.add_argument("--apply", action="store_true", help="write the copies (default: dry run)")
    parser.add_argument("--wtf", type=Path, default=None, help="WoW Retail WTF folder")
    parser.add_argument("--account", action="append", default=[], help="only this account folder (repeatable)")
    args = parser.parse_args()

    try:
        running = running_game()
    except RuntimeError as error:
        print(f"Refusing: {error}; cannot confirm that WoW is closed.")
        return 2
    if running:
        print(f"Refusing: close World of Warcraft first ({', '.join(running)} is running).")
        return 2
    check_toc()

    wtf = (args.wtf or default_wtf()).resolve()
    accounts_dir = wtf / "Account"
    if not accounts_dir.is_dir():
        print(f"No account folders under {wtf}. Use --wtf to point at your _retail_\\WTF folder.")
        return 2
    accounts = sorted(path for path in accounts_dir.iterdir() if (path / "SavedVariables").is_dir())
    if args.account:
        wanted = {name.lower() for name in args.account}
        accounts = [path for path in accounts if path.name.lower() in wanted]
    print(f"WTF: {wtf}  ({'apply' if args.apply else 'dry run'})")
    if not accounts:
        print("  no matching account folders")

    imported = pending = failed = 0
    for account in accounts:
        saved = account / "SavedVariables"
        source, target = saved / SOURCE_FILE, saved / TARGET_FILE
        if not source.is_file():
            print(f"  {account.name}: no {SOURCE_FILE}; nothing to import")
            continue
        if target.exists():
            print(f"  {account.name}: {TARGET_FILE} already exists; left unchanged")
            continue
        try:
            data = source.read_bytes()
            copy = convert(data)
            checked = verify_with_lua(data, copy)
        except Exception as error:  # report and continue with the next account
            print(f"  {account.name}: not imported: {error}")
            failed += 1
            continue
        how = "Lua table verified" if checked else "lupa not installed; byte-level copy only"
        if not args.apply:
            print(f"  {account.name}: would copy {SOURCE_FILE} -> {TARGET_FILE} ({len(data):,} bytes; {how})")
            pending += 1
            continue
        try:
            write_new(target, copy)
        except FileExistsError:
            print(f"  {account.name}: {TARGET_FILE} appeared meanwhile; left unchanged")
            continue
        print(f"  {account.name}: copied {SOURCE_FILE} -> {TARGET_FILE} ({len(copy):,} bytes; {how})")
        imported += 1

    if pending:
        print(f"{pending} account(s) ready. Run again with --apply to write the copies.")
    if imported:
        print(f"{imported} account(s) imported. Keep ZygorGuidesViewer disabled while GoatQuestRetail is enabled.")
    return 1 if failed else 0


if __name__ == "__main__":
    sys.exit(main())
