"""Shared paths and helpers for the offline GoatQuestRetail checks.

The TOC/XML load graph comes from tools/build_release.py, so the release and the
tests agree on exactly which files a client loads.
"""
from pathlib import Path, PurePosixPath
import os
import re
import sys

ROOT = Path(__file__).resolve().parents[1]
ADDON = "GoatQuestRetail"
sys.path.insert(0, str(Path(os.environ.get("TEMP", ".")) / "goatquest-lua-tests"))
sys.path.insert(0, str(ROOT / "tools"))

import build_release  # noqa: E402

# Personal subscription keys. Tests may load Licence.lua in-process but must never
# print, copy or scan its text, so every content scan skips these files.
PRIVATE_FILES = build_release.PRIVATE_FILES
SKIPPED_PARTS = {".git", ".work", "__pycache__", "dist"}


def source_files(suffixes):
    """Repository files with one of the suffixes, excluding personal and generated files."""
    for path in sorted(ROOT.rglob("*")):
        relative = path.relative_to(ROOT).as_posix()
        if not path.is_file() or path.suffix.lower() not in suffixes or relative in PRIVATE_FILES:
            continue
        if not SKIPPED_PARTS.isdisjoint(PurePosixPath(relative).parts):
            continue
        yield relative, path


def read(relative):
    return (ROOT / relative).read_text(encoding="utf-8-sig")


def function_source(source, name):
    """A top-level Lua function, from its 'function' line to the first unindented 'end'."""
    match = re.search(r"^function " + re.escape(name) + r"\(.*?^end[ \t]*$", source, re.M | re.S)
    assert match, f"Missing function: {name}"
    return match.group(0)


def lua_root():
    return str(ROOT).replace("\\", "/").encode()


def lua_runtime():
    """A Lua 5.1 runtime with 'root' and 'addon' set and print routed through Python,
    so Lua and Python output stay in order when captured."""
    from lupa.lua51 import LuaRuntime

    lua = LuaRuntime(encoding=None, unpack_returned_tuples=True)

    def lua_print(*values):
        print("\t".join(value.decode("utf-8", "replace") if isinstance(value, bytes) else str(value)
                        for value in values))

    lua.globals()[b"print"] = lua_print
    lua.globals()[b"root"] = lua_root()
    lua.globals()[b"addon"] = ADDON.encode()
    return lua


def warn(message):
    print(f"WARN {message}")
