"""Every texture or font path inside the addon that loaded code names must exist on disk.

Scans the files any client locale loads (tools/build_release.py load graph) for addon-internal
asset paths:
  * Lua string literals that are, or are concatenated onto, a known addon path prefix:
    "Interface\\AddOns\\GoatQuestRetail\\...", GQ.DIR, DIR, GQ.SKINSDIR, GQ.ARROWSDIR,
    GQ.IMAGESDIR, GQ.StyleDir, GQ.SkinDir, Styles.DIR/TEXDIR/FONTDIR, "Interface\\AddOns\\"..addon;
  * Styles:Texture(parent,layer,"file.tga") names (Styles/Textures);
  * Pointer.lua icon files (tex={file="mapicons"}), drawn from the GoatQuest style folder;
  * XML file="..."/font="..." attributes and inline <Script> bodies;
  * the TOC IconTexture.
A path resolves when a file with that name exists (case-insensitively), as given or with
.tga/.blp/.png/.ttf/.otf appended. Paths built from runtime values are only counted.
Licence.lua (personal keys) is never read.
"""
from pathlib import Path
import bisect
import re
import sys
import xml.etree.ElementTree as ET

sys.path.insert(0, str(Path(__file__).resolve().parent))
from gqtest import ADDON, PRIVATE_FILES, ROOT, build_release  # noqa: E402

STYLE_DIR = "Skins/Default/GoatQuest/"  # GQ.StyleDir of the only skin style
SKIN_DIR = "Skins/Default/"             # GQ.SkinDir
EXTS = ("", ".tga", ".blp", ".png", ".ttf", ".otf")
# Lua prefix expression -> folder relative to the addon root (None: not an asset folder).
PREFIXES = {
    "GQ.DIR": "", "DIR": "", "self.DIR": None,
    "GQ.SKINSDIR": "Skins/", "SKINSDIR": "Skins/",
    "GQ.ARROWSDIR": "Arrows/",
    "GQ.IMAGESDIR": "Guides-Retail/Images/", "IMAGESDIR": "Guides-Retail/Images/",
    "GQ.StyleDir": STYLE_DIR, "STYLEDIR": STYLE_DIR,
    "GQ.SkinDir": SKIN_DIR, "SKINDIR": SKIN_DIR,
    "Styles.DIR": "Styles/", "Styles.TEXDIR": "Styles/Textures/", "Styles.FONTDIR": "Styles/Fonts/",
    "self.TEXDIR": "Styles/Textures/", "self.FONTDIR": "Styles/Fonts/",
}
ADDON_RE = re.compile(r"(?i)^interface[\\/]+addons[\\/]+" + ADDON + r"(?:[\\/]+(.*))?$")
OTHER_ADDON_RE = re.compile(r"(?i)^interface[\\/]+addons[\\/]+([^\\/]+)")
STRING_RE = re.compile(r"""--\[(=*)\[.*?\]\1\]|--[^\n]*|\[(=*)\[(.*?)\]\2\]|"((?:\\.|[^"\\\n])*)"|'((?:\\.|[^'\\\n])*)'""",
                       re.S)
PREFIX_BEFORE = re.compile(r"""((?:"Interface\\\\AddOns\\\\"\s*\.\.\s*(?:addonName|name|addon)\b)"""
                           r"""|[A-Za-z_][\w]*(?:\.[A-Za-z_]\w*)*)\s*\.\.\s*$""")
ESCAPES = {"n": "\n", "t": "\t", "\\": "\\", '"': '"', "'": "'"}
TRIGGERS = ("interface", "dir", "styles:texture", "$skins", "|t")

INDEX = {path.relative_to(ROOT).as_posix().lower() for path in ROOT.rglob("*") if path.is_file()}
found = {"ok": 0, "missing": [], "dynamic": 0, "foreign": set()}


def exists(relative):
    relative = re.sub(r"[\\/]+", "/", relative).strip("/").lower()
    return any(relative + ext in INDEX for ext in EXTS)


def record(origin, relative, raw):
    if exists(relative):
        found["ok"] += 1
    else:
        found["missing"].append(f"{origin}: {raw}")


def lua_strings(source):
    """(start, end, value) of every string literal outside comments."""
    for m in STRING_RE.finditer(source):
        if m.group(0).startswith("--"):
            continue
        if m.group(3) is not None:
            yield m.start(), m.end(), m.group(3)
        else:
            body = m.group(4) if m.group(4) is not None else m.group(5)
            yield m.start(), m.end(), re.sub(r"\\(.)", lambda e: ESCAPES.get(e.group(1), e.group(1)), body)


def check_value(origin, value, base=None):
    """value: a literal path, or the part after a known prefix (base)."""
    # Texture escapes carry size and coordinates after the path: "path:12:12|t".
    path = value if re.match(r"(?i)^[a-z]:[\\/]", value) else re.split(r"[:|]", value, maxsplit=1)[0]
    if path.endswith(("\\", "/")) or path in ("", "-"):
        found["dynamic"] += 1  # a folder prefix, or the deliberately empty icon
        return
    m = ADDON_RE.match(path)
    if m:
        if m.group(1):
            record(origin, m.group(1), value)
    elif base is not None:
        record(origin, base + path, value)
    else:
        other = OTHER_ADDON_RE.match(path)
        if other and other.group(1).lower() == "goatquest":
            found["missing"].append(f"{origin}: {value} (the Forever addon folder)")
        elif other:
            found["foreign"].add(other.group(1))


def scan_lua(relative, source):
    if not any(trigger in source.lower() for trigger in TRIGGERS):
        return
    newlines = [m.start() for m in re.finditer("\n", source)]
    for start, end, value in lua_strings(source):
        before = source[max(0, start - 120):start]
        if not value or (not any(t in value.lower() for t in ("\\", "/", "|t", "$skins", "("))
                         and not before.rstrip().endswith("..")):
            continue
        origin = f"{relative}:{bisect.bisect_left(newlines, start) + 1}"
        dynamic_tail = source[end:end + 40].lstrip().startswith("..")
        for escape in re.finditer(r"\|T([^:|]+)", value):  # |T...|t escapes carry their own path
            if not dynamic_tail:
                check_value(origin, escape.group(1))
        if "|T" in value:
            continue
        prefix = PREFIX_BEFORE.search(before)
        if prefix:
            expr = prefix.group(1)
            base = "" if expr.startswith('"Interface') else PREFIXES.get(expr)
            if base is None:
                if ADDON_RE.match(value):
                    if dynamic_tail:
                        found["dynamic"] += 1
                    else:
                        check_value(origin, value)
            elif dynamic_tail:
                found["dynamic"] += 1
            else:
                check_value(origin, value.lstrip("\\/"), base=base)
        elif ADDON_RE.match(value) or OTHER_ADDON_RE.match(value):
            if dynamic_tail:
                found["dynamic"] += 1
            else:
                check_value(origin, value)
        elif "$skins" in value.lower():
            found["missing"].append(f"{origin}: {value} (unresolved placeholder)")
    for m in re.finditer(r"""Styles:Texture\(\s*[^,()]+,\s*(?:"[^"]*"|[\w.]+)\s*,\s*"([^"\\]+)"\s*[,)]""", source):
        record(f"{relative}:{bisect.bisect_left(newlines, m.start()) + 1}", "Styles/Textures/" + m.group(1), m.group(1))
    if relative.startswith("Arrows/") and relative.count("/") == 2:  # arrowSkin:GetDir().."arrow"
        folder = relative.rsplit("/", 1)[0] + "/"
        for m in re.finditer(r"""\w+:GetDir\(\)\s*\.\.\s*"([^"]+)\"""", source):
            record(relative, folder + m.group(1), m.group(1))
        record(f"{relative} (ArrowSkin.lua specials)", folder + "specials", "specials")
    if relative == "Pointer.lua":  # tex={file="mapicons"}, drawn as GQ.StyleDir..file
        for m in re.finditer(r"""\b(?:tex|edgetex)\s*=\s*\{\s*file\s*=\s*"([^"]+)\"""", source):
            if m.group(1) != "-":  # Icons.none: deliberately empty
                record(f"{relative}:{bisect.bisect_left(newlines, m.start()) + 1}", STYLE_DIR + m.group(1), m.group(1))


def scan_xml(relative, data):
    for element in ET.fromstring(data).iter():
        tag = element.tag.split("}")[-1]
        for attribute in ("file", "font"):
            value = element.get(attribute)
            if not value or tag in ("Include", "Script"):
                continue
            origin = f"{relative}:<{tag} {attribute}>"
            if "$skins" in value.lower() or re.fullmatch(r"\(\w+\)", value):
                found["missing"].append(f"{origin}: {value} (unresolved placeholder)")
            else:
                check_value(origin, value)
        if tag == "Script" and element.text and element.text.strip():
            scan_lua(relative, element.text)


files, _, missing = build_release.load_graph(None)
assert not [path for path in missing if path not in PRIVATE_FILES], f"Missing load dependencies: {missing}"
for relative in files:
    if relative in PRIVATE_FILES:
        continue
    data = (ROOT / relative).read_bytes().removeprefix(b"\xef\xbb\xbf")
    if relative.endswith(".lua"):
        scan_lua(relative, data.decode("utf-8", "replace"))
    elif relative.endswith(".xml"):
        scan_xml(relative, data)
check_value(f"{ADDON}.toc:IconTexture", build_release.toc_metadata()["IconTexture"])

assert found["ok"] > 300, f"asset scan found too few paths ({found['ok']}): the patterns no longer match the code"
assert not found["missing"], "Missing assets referenced by loaded code:\n  " + "\n  ".join(found["missing"])
print(f"PASS asset paths: {found['ok']} texture/font paths in loaded code resolve, {found['dynamic']} built at runtime; "
      f"no Forever folder paths or placeholders")
