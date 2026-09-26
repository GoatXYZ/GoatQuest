"""Audit the whole installed addon, including dormant modules, for stale branding.

Exceptions are limited to the one-time GoatZyg settings import.
Do not grow these exceptions to hide a missed interface string or graphic.
"""
from pathlib import Path
import json
import re
import xml.etree.ElementTree as ET

ROOT = Path(__file__).resolve().parents[1]
stale = re.compile(r"zyg(?!and)|zglogo", re.I)  # "Zygand" is an in-game NPC name.
errors = []
checked = 0


def without_retained_notices(relative, line):
    if relative in {"GoatQuest.toc", "GoatQuest_Mainline.toc"} and line == "## OptionalDeps: TomTom, GoatZyg":
        return ""
    if relative in {"Compat/MigrateSettings.lua", "migration/GoatZyg.toc"}:
        line = line.replace("GoatZygSettings", "OldSettings").replace("GoatZyg", "OldAddon")
    return line


for path in ROOT.rglob("*"):
    if not path.is_file() or "__pycache__" in path.parts or ".git" in path.parts:
        continue
    relative = path.relative_to(ROOT).as_posix()
    if stale.search(relative) and relative != "migration/GoatZyg.toc":
        errors.append(f"Old branded filename: {relative}")
    if path.suffix.lower() not in {".lua", ".xml", ".toc"}:
        continue
    checked += 1
    for number, line in enumerate(path.read_bytes().decode("utf-8-sig", errors="replace").splitlines(), 1):
        stripped = without_retained_notices(relative, line)
        if stale.search(stripped):
            errors.append(f"{relative}:{number}: {line.strip()}")
        if re.search(r"GoatQuest (?:Client|Elite)|goatquestguides\.com", stripped):
            errors.append(f"Invented service: {relative}:{number}")

assert not errors, "Unexpected old branding:\n" + "\n".join(errors)

toc = (ROOT / "GoatQuest.toc").read_text()
assert "## Version: 1.0.0" in toc
assert "## IconTexture: Interface\\AddOns\\GoatQuest\\Skins\\goatquest-icon" in toc
assert "## SavedVariables: GoatQuestSettings" in toc

# Catch renamed XML templates whose Lua users would otherwise fail only at login.
prefixes = ("GoatQuest", "GQ")
templates = set()
mixins = set()
for path in ROOT.rglob("*.xml"):
    for element in ET.fromstring(path.read_bytes()).iter():
        name = element.get("name", "")
        if name.startswith(prefixes):
            templates.add(name)
        mixins.update(name.strip() for name in element.get("mixin", "").split(",") if name.strip().startswith(prefixes))
lua_sources = "\n".join(path.read_bytes().decode("utf-8-sig", errors="replace") for path in ROOT.rglob("*.lua"))
for name in mixins:
    assert re.search(r"\b" + re.escape(name) + r"\s*=", lua_sources), f"Missing renamed mixin: {name}"
for name in re.findall(r'["\']((?:GoatQuest|GQ)\w*(?:Template|ActionButton|ActionButtonOverlay))["\']', lua_sources):
    assert name in templates, f"Missing renamed XML template: {name}"

manifest = json.loads((ROOT / "build-manifest.json").read_text())
assert manifest["version"] == "1.0.0"
for path in manifest["modified_from_classic"] + manifest["added_files"]:
    assert (ROOT / path).is_file(), f"Stale build manifest entry: {path}"
print(f"PASS rebranding: {checked} source/manifests, filenames, XML template/mixin references; migration contracts retained")
