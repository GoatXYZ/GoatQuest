"""Audit the whole addon, including dormant modules, for stale branding.

Exceptions are limited to the places that must name the original product: the offline
import of its saved settings and the subscription-renewal instructions (the user's guide
data and keys come from the original client). Do not grow these exceptions to hide a missed
interface string or graphic. Licence.lua (personal keys) is never read here.
"""
from pathlib import Path, PurePosixPath
import json
import re
import sys
import xml.etree.ElementTree as ET

sys.path.insert(0, str(Path(__file__).resolve().parent))
from gqtest import ADDON, ROOT, SKIPPED_PARTS, build_release, source_files  # noqa: E402

stale = re.compile(r"zyg(?!and)|zglogo", re.I)  # "Zygand" is an in-game NPC name.
invented = re.compile(r"GoatQuest (?:Client|Elite)|goatquestguides\.com", re.I)
RETAINED_FILENAMES = {"tools/import_zygor_settings.py"}  # imports the original addon's save
RETAINED_TEXT = {
    # The settings import names its source addon and save file.
    "Compat/MigrateSettings.lua": re.compile(r"Zygor ?Guides ?Viewer|import_zygor_settings\.py|\bZygor\b"),
    # Subscription renewal: guide data and keys are refreshed through the original client.
    "Functions.lua": re.compile(r"\bthe Zygor client\b"),
}
errors = []
checked = 0

for path in sorted(ROOT.rglob("*")):
    relative = path.relative_to(ROOT).as_posix()
    if path.is_file() and SKIPPED_PARTS.isdisjoint(PurePosixPath(relative).parts):
        if stale.search(relative) and relative not in RETAINED_FILENAMES:
            errors.append(f"Old branded filename: {relative}")

for relative, path in source_files({".lua", ".xml", ".toc"}):
    checked += 1
    retained = RETAINED_TEXT.get(relative)
    text = path.read_bytes().decode("utf-8-sig", errors="replace")
    if not stale.search(text) and not invented.search(text):
        continue
    for number, line in enumerate(text.splitlines(), 1):
        stripped = retained.sub("", line) if retained else line
        if stale.search(stripped):
            errors.append(f"{relative}:{number}: {line.strip()[:200]}")
        if invented.search(line):
            errors.append(f"Invented service: {relative}:{number}")

assert not errors, "Unexpected old branding:\n" + "\n".join(errors)

meta = build_release.toc_metadata()
assert meta["Version"] == "1.0.0"
assert meta["IconTexture"] == f"Interface\\AddOns\\{ADDON}\\Skins\\goatquest-icon"
assert meta["SavedVariables"] == "GoatQuestSettings"
assert "GoatQuest" in meta["Title"] and "Zyg" not in meta["Title"]

# Catch renamed XML templates whose Lua users would otherwise fail only at login.
prefixes = ("GoatQuest", "GQ")
templates = set()
mixins = set()
for _, path in source_files({".xml"}):
    for element in ET.fromstring(path.read_bytes()).iter():
        name = element.get("name", "")
        if name.startswith(prefixes):
            templates.add(name)
        mixins.update(name.strip() for name in element.get("mixin", "").split(",") if name.strip().startswith(prefixes))
_LUA_TOKENS = re.compile(r'--\[(=*)\[.*?\]\1\]|--[^\n]*|"(?:[^"\\\n]|\\.)*"|\'(?:[^\'\\\n]|\\.)*\'', re.S)


def without_comments(source):
    """Lua source minus comments (commented-out code is not a runtime contract)."""
    return _LUA_TOKENS.sub(lambda m: "" if m.group(0).startswith("--") else m.group(0), source)


DATA_DIRS = ("tests/", "Guides-Retail/", "Localization-Retail/", "Data-Retail/")  # no frames or mixins
lua_sources = "\n".join(without_comments(path.read_bytes().decode("utf-8-sig", errors="replace"))
                        for relative, path in source_files({".lua"}) if not relative.startswith(DATA_DIRS))
for name in mixins:
    assert re.search(r"\b" + re.escape(name) + r"\s*=", lua_sources), f"Missing renamed mixin: {name}"
for name in re.findall(r'["\']((?:GoatQuest|GQ)\w*(?:Template|ActionButton|ActionButtonOverlay))["\']', lua_sources):
    assert name in templates, f"Missing renamed XML template: {name}"

manifest = json.loads((ROOT / "build-manifest.json").read_text(encoding="utf-8"))
assert manifest["version"] == meta["Version"]
assert manifest["target_client"] == "12.1.0.69933 / Interface 120100"
for path in manifest["modified_from_retail"] + manifest["added_files"]:
    assert (ROOT / path).is_file(), f"Stale build manifest entry: {path}"
for path in manifest["deleted_from_retail"]:
    assert not (ROOT / path).is_file(), f"Build manifest lists a present file as deleted: {path}"
assert not {"Licence.lua", "License.lua"} & set(manifest["modified_from_retail"] + manifest["added_files"])
print(f"PASS rebranding: {checked} source/manifests, filenames, XML template/mixin references; "
      "settings-import and subscription-renewal references retained")
