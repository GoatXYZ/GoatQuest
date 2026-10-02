"""Re-import guide content from the installed upstream addon and rebuild the guides-only catalogue.

    py -3 tools/sync_guides.py                  dry run: report what would change (default)
    py -3 tools/sync_guides.py --apply          write changed guide files and Autoload.xml
    py -3 tools/sync_guides.py --apply --prune  also delete guide files no longer shipped upstream

Every upstream file under Guides-Retail is renamed with goat_transform, cleaned with
clean_guide_text(), corrected with UPSTREAM_FIXES and compared with the local copy (files in
DROPPED_FILES are not shipped). Autoload.xml is regenerated from the
upstream manifest: the Leveling, Dungeons and Professions guides keep their upstream order,
together with Images.lua and the include files their #include directives reach. Every other
entry stays in place as an XML comment, so a category can be restored by uncommenting it.
Trial files whose full counterpart is loaded earlier behind the same DoMutex guard can never
register a guide and are commented as dead.

Only Guides-Retail is written. The upstream folder, Licence.lua, engine and data files are
read at most. Standard library only.
"""
import argparse
import re
import sys
import xml.etree.ElementTree as ET
from collections import Counter, defaultdict
from dataclasses import dataclass, field
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import goat_transform  # noqa: E402  (the shared rename transform)

ROOT = Path(__file__).resolve().parents[1]
GUIDES = ROOT / "Guides-Retail"
UPSTREAM = goat_transform.UPSTREAM
UPSTREAM_GUIDES = UPSTREAM / "Guides-Retail"
MANIFEST = "Autoload.xml"

# Categories the guides-only browser shows (GQ.GuideCategories in Compat/GuideOnly.lua).
KEPT_CATEGORIES = ("LEVELING", "DUNGEONS", "PROFESSIONS")
# Top-level section comments of the upstream manifest. Sub-section comments (CATA, MOP...) are ignored.
SECTIONS = {
    "INCLUDES": "INCLUDES", "LEVELING": "LEVELING", "DAILIES": "DAILIES", "DUNGEONS": "DUNGEONS",
    "GEAR": "GEAR", "PROFESSIONS": "PROFESSIONS", "ACHIEVEMENTS": "ACHIEVEMENTS",
    "PETS AND MOUNTS": "PETSMOUNTS", "TITLES": "TITLES", "REPUTATIONS": "REPUTATIONS",
    "EVENTS": "EVENTS", "GOLD": "GOLD", "POINTS OF INTEREST": "POI",
}
FOLDERS = {
    "Images": "IMAGES", "Includes": "INCLUDES", "Leveling": "LEVELING", "Dungeons": "DUNGEONS",
    "Professions": "PROFESSIONS", "Dailies": "DAILIES", "Achievements": "ACHIEVEMENTS",
    "PetsMounts": "PETSMOUNTS", "Titles": "TITLES", "Reputations": "REPUTATIONS", "Events": "EVENTS",
    "Gold": "GOLD", "Poi": "POI",
}
# Manifest entries that are data for systems disabled in guides-only mode, not guides.
DISABLED_DATA = {"TalentAdvisor-Builds.lua": "talent advisor"}
# Upstream files GoatQuest does not ship. No Lua or XML file references them: they show the
# original product's mascot, interface or wordmark, or (banner.tga) are an unused banner whose
# Classic counterpart GoatQuest also removed.
DROPPED_FILES = {
    "Images/banner.tga": "unused banner",
    "Images/default.tga": "original product mascot",
    "Images/bulletin-customizable-home-screen.tga": "original product interface",
    "Images/bulletin-improved-notifications.tga": "original product interface",
    "Images/bulletin-starup-orientation.tga": "original product interface",
    "Images/gbtut1.blp": "original product wordmark (gold tutorial no longer shows it)",
    "Images/gbtut4.blp": "original product wordmark (gold tutorial no longer shows it)",
}
# Upstream mistakes in guide headers, corrected on every import: (file, old, new, reason).
# Each 'old' must occur exactly once; otherwise the fix is reported and not applied.
_DK_IMAGE = ('image=GQ.IMAGESDIR.."Death Knight",', 'image=GQ.IMAGESDIR.."Death Knight 55-58",',
             "no 'Death Knight' image exists; the Alliance starter uses 'Death Knight 55-58'")
UPSTREAM_FIXES = (
    ("Leveling/StartersHorde.lua",) + _DK_IMAGE,
    ("Leveling/StartersHordeTrial.lua",) + _DK_IMAGE,
    ("Leveling/GoatQuestLevelingAllianceCATA.lua",
     r'next="Leveling Guides\\The Burning Crusade (10-70)\\Shadowmoon Valley (TBC) (25-70)"',
     r'next="Leveling Guides\\The Burning Crusade (10-70)\\Shadowmoon Valley (25-70)"',
     "Netherstorm's next guide is registered without '(TBC)'"),
    ("Leveling/GoatQuestLevelingAllianceBFA.lua",
     r'next="Leveling Guides\\Battle for Azeroth (10-70)\\Kul Tiras\\Stormsong Valley (30-70)"',
     r'next="Leveling Guides\\Battle for Azeroth (10-70)\\Kul Tiras\\Stormsong Valley (10-70)"',
     "Drustvar's next guide is registered as 'Stormsong Valley (10-70)'"),
)
# Port of GQ:SanitizeGuideTitle (GoatQuest.lua): title roots -> browser category.
TITLE_ROOTS = (
    ("Event", "EVENTS"), ("Dail", "DAILIES"), ("Leveling", "LEVELING"), ("Loremaster", "LOREMASTER"),
    ("Profession", "PROFESSIONS"), ("Achievement", "ACHIEVEMENTS"), ("Pet", "PETSMOUNTS"),
    ("Reputation", "REPUTATIONS"), ("Title", "TITLES"), ("Macro", "MACROS"), ("Dungeon", "DUNGEONS"),
    ("Gear", "GEAR"), ("Test Guide", "TEST"), ("Misc", "MISC"),
)
BRANDING_LEFTOVERS = re.compile(r"GoatQuest (?:Guides|Client|Elite)|goatquestguides|purchase the full GoatQuest", re.I)


# --------------------------------------------------------------------------- text cleanup

ORIGINAL_AUTHORS = "Original guide team"
_AUTHOR_FIELD = re.compile(r"""(\bauthor\s*=\s*)(["'])([^"'\r\n]*)\2""")
_AUTHOR_LINE = re.compile(  # "author <contact>" header line inside guide/include text
    r"(?m)^([ \t]*author[ \t]+)(\S*(?:@|goatquestguides|https?:|www\.)\S*)[ \t]*(?=\r?\n|\Z)", re.I)
_PROSE = (
    # "Refer to the GoatQuest Guides Pet Battles section" -> "Refer to the Pet Battles guides"
    (re.compile(r"\bthe GoatQuest Guides ([A-Z][\w&' ]*?) section\b"), r"the \1 guides"),
    # The desktop client of the original product (it installed Trend Data); not a GoatQuest service.
    (re.compile(r"\bGoatQuest (?:Guides )?Client(?: \(desktop\))?"), "original desktop client"),
    # Trial upsell: "please purchase the full GoatQuest Profession Guides!"
    (re.compile(r"\bplease purchase the full GoatQuest (\w+) Guides!"),
     lambda m: f"the full {m.group(1).lower()} guides are required."),
    (re.compile(r" with GoatQuest Elite!"), "!"),
    (re.compile(r"\bGoatQuest Guide Reader\b"), "GoatQuest viewer"),
    # Product name: "In order for GoatQuest Guides to perform" -> "In order for GoatQuest to perform"
    (re.compile(r"\bGoatQuest Guides\b"), "GoatQuest"),
    (re.compile(r"[\w.+-]+@goatquestguides\.com\b", re.I), "the original guide team"),
    (re.compile(r"(?:https?://)?(?:www\.)?goatquestguides\.com[^\s\"'\]|)]*", re.I),
     "the original guide team's website"),
)


def _is_contact(value):
    value = value.lower()
    return "@" in value or "goatquestguides" in value or "http:" in value or "https:" in value or "www." in value


def clean_guide_text(text):
    """Neutralise upstream support addresses and the product names that the rename turned into
    invented GoatQuest services. Only author credits and prose change; titles, conditions,
    coordinates and step logic are untouched. Idempotent."""
    text = _AUTHOR_FIELD.sub(
        lambda m: m.group(1) + m.group(2) + ORIGINAL_AUTHORS + m.group(2) if _is_contact(m.group(3)) else m.group(0),
        text)
    text = _AUTHOR_LINE.sub(lambda m: m.group(1) + ORIGINAL_AUTHORS, text)
    for pattern, replacement in _PROSE:
        text = pattern.sub(replacement, text)
    return text


def import_bytes(data, suffix):
    """Upstream bytes -> GoatQuestRetail bytes: shared rename, then guide text cleanup."""
    data = goat_transform.transform_bytes(data, suffix)
    if suffix.lower() not in (".lua", ".xml", ".txt"):
        return data
    bom = data.startswith(b"\xef\xbb\xbf")
    text = data.removeprefix(b"\xef\xbb\xbf").decode("utf-8", errors="surrogateescape")
    return (b"\xef\xbb\xbf" if bom else b"") + clean_guide_text(text).encode("utf-8", errors="surrogateescape")


# --------------------------------------------------------------------------- Lua scanning

_SKIP = (r'--\[(?P<lc>=*)\[.*?\](?P=lc)\]|--[^\n]*|\[(?P<ls>=*)\[.*?\](?P=ls)\]'
         r'|"(?:[^"\\\n]|\\.)*"|\'(?:[^\'\\\n]|\\.)*\'')
_CALLS = re.compile(_SKIP + r'|\b(?P<call>RegisterGuidePlaceholder|RegisterGuide|RegisterInclude|DoMutex)\s*\(', re.S)
_BRACES = re.compile(_SKIP + r'|(?P<brace>[{}])', re.S)
_QUOTED = re.compile(r'"((?:[^"\\\n]|\\.)*)"|\'((?:[^\'\\\n]|\\.)*)\'', re.S)
_LONG = re.compile(r'\[(=*)\[(.*?)\]\1\]', re.S)
_ESCAPES = {"n": "\n", "t": "\t", "r": "\r", "a": "\a", "b": "\b", "f": "\f", "v": "\v", "\n": "\n"}
_GUARD = re.compile(r'if\s+(?:GQ|GoatQuest)[:.]DoMutex\(\s*(["\']).*?\1\s*\)\s+then\s+return\s+end\s*(?:--.*)?')


def lua_unescape(body):
    """Lua 5.1 string escapes; unknown escapes drop the backslash, as the 5.1 lexer does."""
    def escape(m):
        token = m.group(1)
        if token.isdigit():
            return chr(int(token))
        return _ESCAPES.get(token, token)
    return re.sub(r"\\(\d{1,3}|.)", escape, body, flags=re.S)


def read_literal(text, pos):
    """Read a Lua string literal at pos (after whitespace). Returns (value, end) or (None, pos)."""
    while pos < len(text) and text[pos].isspace():
        pos += 1
    m = _QUOTED.match(text, pos)
    if m:
        value = lua_unescape(m.group(1) if m.group(1) is not None else m.group(2))
    else:
        m = _LONG.match(text, pos)
        if not m:
            return None, pos
        value = m.group(2)
        if value.startswith("\r\n"):
            value = value[2:]
        elif value.startswith("\n"):
            value = value[1:]
    end = m.end()
    rest = text[end:end + 8].lstrip()
    if rest.startswith(".."):  # concatenated: not a static value
        return None, pos
    return value, end


def skip_table(text, pos):
    """pos at '{' -> (table source, end)."""
    depth = 0
    for m in _BRACES.finditer(text, pos):
        brace = m.group("brace")
        if brace == "{":
            depth += 1
        elif brace == "}":
            depth -= 1
            if depth == 0:
                return text[pos:m.end()], m.end()
    return text[pos:], len(text)


def _skip_comma(text, pos):
    while pos < len(text) and text[pos].isspace():
        pos += 1
    return pos + 1 if text.startswith(",", pos) else None


@dataclass
class LuaFile:
    guides: list = field(default_factory=list)       # (title, header source, body, is_placeholder)
    includes: dict = field(default_factory=dict)     # name -> [body]
    mutex: str = None
    preamble: tuple = ()
    guard: bool = False                              # first DoMutex is "if ...DoMutex(key) then return end"
    registers_before_mutex: bool = False


def _code_lines(source):
    code = re.sub(_SKIP, lambda m: "" if m.group(0).startswith("--") else m.group(0), source, flags=re.S)
    return tuple(line.strip() for line in code.splitlines() if line.strip())


def scan_lua(text):
    info = LuaFile()
    for m in _CALLS.finditer(text):
        call = m.group("call")
        if not call:
            continue
        first, pos = read_literal(text, m.end())
        if call == "DoMutex":
            if info.mutex is None and first is not None:
                info.mutex = first
                line_end = text.find("\n", m.end())
                line_end = len(text) if line_end < 0 else line_end
                info.preamble = _code_lines(text[:line_end])
                line_start = text.rfind("\n", 0, m.start()) + 1
                info.guard = _GUARD.fullmatch(text[line_start:line_end].strip()) is not None
            continue
        if info.mutex is None:
            info.registers_before_mutex = True
        if first is None:
            continue
        if call == "RegisterGuidePlaceholder":
            info.guides.append((first, "", "", True))
        elif call == "RegisterInclude":
            comma = _skip_comma(text, pos)
            body = read_literal(text, comma)[0] if comma else None
            info.includes.setdefault(first, []).append(body or "")
        else:
            header, body = "", ""
            comma = _skip_comma(text, pos)
            if comma is not None:
                while comma < len(text) and text[comma].isspace():
                    comma += 1
                if text.startswith("{", comma):
                    header, after = skip_table(text, comma)
                    comma = _skip_comma(text, after)
                    if comma is not None:
                        body = read_literal(text, comma)[0] or ""
            info.guides.append((first, header, body, False))
    return info


def sanitize_title(title):
    """Port of GQ:SanitizeGuideTitle: the first path segment is the browser category."""
    title = title.replace("\\\\", "\\")
    title = re.sub(r"^GoatQuest's ", "", title)
    title = re.sub(r"^Alliance ", "", title)
    title = re.sub(r"^Horde ", "", title)
    for prefix, category in TITLE_ROOTS:
        title = re.sub("^" + re.escape(prefix) + r".*?\\", lambda m, c=category: c + "\\", title, count=1)
    return title


# --------------------------------------------------------------------------- #include directives

_INCLUDE_DIRECTIVE = re.compile(r"#include\s*([^\r\n|$]*)")


def include_calls(text):
    """(name, params) per "#include name,param=\"value\"" line, parsed as Parser.lua does."""
    for m in _INCLUDE_DIRECTIVE.finditer(text):
        line = m.group(1).replace("\\,", "\0").replace('\\"', "\1")
        line = re.sub(r"\s*//.*$", "", line)
        line = re.sub(r"\s*--.*$", "", line)
        words = line.split(",")
        name = re.sub(r'^"(.*?)"', r"\1", words[0].strip())
        params = {}
        for word in words[1:]:
            pm = re.match(r'\s*(.*?)\s*=\s*"(.*?)"', word)
            if pm:
                params[pm.group(1)] = pm.group(2)
        yield name, params


def include_closure(roots, definitions):
    """Names reachable from roots [(name, params, source)], expanding %param% like GQ:RegisterInclude.
    Returns (needed names, {missing name: sources})."""
    needed, missing, seen = set(), defaultdict(set), set()
    stack = list(roots)
    while stack:
        name, params, source = stack.pop()
        key = (name, tuple(sorted(params.items())))
        if key in seen:
            continue
        seen.add(key)
        bodies = definitions.get(name)
        if not bodies:
            missing[name].add(source)
            continue
        needed.add(name)
        for body in bodies:
            expanded = re.sub(r"%([A-Za-z0-9]+)%", lambda m: params.get(m.group(1), ""), body)
            stack.extend((sub, subparams, f"include {name}") for sub, subparams in include_calls(expanded))
    return needed, missing


# --------------------------------------------------------------------------- manifest

_ELEMENT = re.compile(r'^(?P<indent>[ \t]*)'
                      r'(?P<element><(?P<tag>Script|Include)\s+file=(?P<q>["\'])(?P<file>[^"\']+)(?P=q)\s*/>)'
                      r'(?P<rest>.*?)(?P<eol>\r?\n)?$', re.S)


@dataclass
class Entry:
    index: int
    file: str          # as written in the manifest (backslashes)
    rel: str           # forward slashes, relative to Guides-Retail
    section: str
    category: str
    decision: str = "load"   # load | category | dead trial | unused include | disabled data | missing
    note: str = ""


def manifest_lines(text):
    """Yield (line, in_comment_before_line) for each line, tracking multi-line XML comments."""
    in_comment = False
    for line in text.splitlines(keepends=True):
        yield line, in_comment
        pos = 0
        while True:
            if in_comment:
                end = line.find("-->", pos)
                if end < 0:
                    break
                in_comment, pos = False, end + 3
            else:
                start = line.find("<!--", pos)
                if start < 0:
                    break
                in_comment, pos = True, start + 4


def parse_manifest(text):
    entries, section = [], None
    for line, in_comment in manifest_lines(text):
        if in_comment:
            continue
        heading = re.fullmatch(r"([ \t]*)<!--\s*(.*?)\s*-->\s*", line)
        if heading:
            name = heading.group(2).upper()
            # Top-level sections are indented one tab; deeper comments (CATA, MOP...) are sub-sections.
            if name in SECTIONS or len(heading.group(1).expandtabs(4)) <= 4:
                section = name
            continue
        m = _ELEMENT.match(line)
        if m:
            rel = m.group("file").replace("\\", "/")
            folder = rel.split("/", 1)[0] if "/" in rel else ""
            folder_category = FOLDERS.get(folder)
            if rel in DISABLED_DATA:
                category = "DISABLED"
            elif folder_category in ("IMAGES", "INCLUDES"):
                category = folder_category
            else:
                category = SECTIONS.get(section) or folder_category or "OTHER"
            entries.append(Entry(len(entries), m.group("file"), rel, section, category))
    return entries


@dataclass
class Catalogue:
    entries: list
    infos: dict
    needed_includes: set
    missing_includes: dict
    links: list            # (kind, source file, guide title, target title, status)
    notes: list            # free-form findings for the report

    @property
    def loaded(self):
        return [e for e in self.entries if e.decision == "load"]


def build_catalogue(manifest_text, files):
    """files: rel path -> imported bytes. Decides which manifest entries load."""
    entries = parse_manifest(manifest_text)
    infos, notes = {}, []
    for e in entries:
        if e.rel not in files:
            e.decision, e.note = "missing", "file not shipped"
            continue
        if e.rel.lower().endswith(".lua"):
            infos[e.rel] = scan_lua(files[e.rel].decode("utf-8", errors="surrogateescape"))
        folder = e.rel.split("/", 1)[0]
        if e.category in KEPT_CATEGORIES and FOLDERS.get(folder) not in KEPT_CATEGORIES:
            notes.append(f"section {e.section} lists {e.file} from folder {folder}")
    for e in entries:
        if e.decision != "load":
            continue
        if e.category in ("IMAGES", "INCLUDES") or e.category in KEPT_CATEGORIES:
            continue
        e.decision = "disabled data" if e.category == "DISABLED" else "category"
        if e.category == "DISABLED":
            e.note = f"data for the disabled {DISABLED_DATA[e.rel]}"
        if e.category == "OTHER":
            notes.append(f"unclassified manifest entry not loaded: {e.file}")

    # Trial files behind the same guard as an earlier loaded full counterpart can never register.
    position = {e.rel: e for e in entries}
    for e in entries:
        if e.decision != "load" or not e.rel.endswith("Trial.lua") or e.category not in KEPT_CATEGORIES:
            continue
        full = position.get(e.rel[:-len("Trial.lua")] + ".lua")
        trial_info, full_info = infos.get(e.rel), full and infos.get(full.rel)
        if not full or full.decision != "load" or full.index > e.index or not trial_info or not full_info:
            e.note = "kept: no earlier full counterpart"
            continue
        if not (trial_info.guard and full_info.guard and not trial_info.registers_before_mutex
                and not full_info.registers_before_mutex):
            e.note = "kept: counterpart lacks a leading DoMutex guard"
        elif trial_info.mutex != full_info.mutex:
            e.note = f"kept: mutex {trial_info.mutex!r} differs from {full_info.mutex!r}"
        elif trial_info.preamble != full_info.preamble:
            e.note = "kept: code before the guard differs"
        else:
            e.decision, e.note = "dead trial", f"{full.file} sets mutex {full_info.mutex!r} first"

    # Includes reachable from the loaded guides; include files that define none of them stay unloaded.
    definitions = defaultdict(list)
    defined_by = defaultdict(list)
    for e in entries:
        info = infos.get(e.rel)
        if info:
            for name, bodies in info.includes.items():
                definitions[name].extend(bodies)
                defined_by[name].append(e)
    while True:
        roots = []
        for e in entries:
            info = infos.get(e.rel)
            if e.decision == "load" and info and e.category != "INCLUDES":
                for title, header, body, _ in info.guides:
                    roots.extend((name, params, f"{e.file}: {title}") for name, params in include_calls(body))
        needed, missing = include_closure(roots, definitions)
        for e in entries:
            info = infos.get(e.rel)
            if e.category == "INCLUDES" and e.decision in ("load", "unused include"):
                used = bool(info and needed.intersection(info.includes))
                e.decision = "load" if used else "unused include"
        # An include defined outside Includes/ drags its file in (a dead trial never registers it).
        pulled = [d for name in needed for d in defined_by[name] if d.decision not in ("load", "dead trial")]
        if not pulled:
            break
        for d in pulled:
            d.decision, d.note = "load", "defines an include used by loaded guides"
            notes.append(f"loaded as include provider: {d.file}")

    return Catalogue(entries, infos, needed, dict(missing), analyse_links(entries, infos), notes)


_STEP_LINK = re.compile(r'(?:\|\s*next|\bloadguide)\s+"([^"]*\\[^"]*)"')
_HEADER_NEXT = re.compile(r'\bnext\s*=\s*("(?:[^"\\\n]|\\.)*"|\'(?:[^\'\\\n]|\\.)*\')')


def analyse_links(entries, infos):
    """Guide-to-guide references (header next=, step |next/loadguide) from loaded guides whose
    target is not loaded: (kind, file, guide, target, status)."""
    loaded, everywhere = {}, {}
    for e in entries:
        info = infos.get(e.rel)
        if not info:
            continue
        for title, _, _, _ in info.guides:
            everywhere.setdefault(sanitize_title(title), e.file)
            if e.decision == "load":
                loaded.setdefault(sanitize_title(title), e.file)
    links = []
    for e in entries:
        info = infos.get(e.rel)
        if e.decision != "load" or not info:
            continue
        for title, header, body, placeholder in info.guides:
            if placeholder:
                continue
            targets = [("next=", lua_unescape(v[1:-1])) for v in _HEADER_NEXT.findall(header)]
            targets += [("step link", t.split("::", 1)[0]) for t in _STEP_LINK.findall(body)]
            for kind, target in targets:
                if target.startswith("id:"):
                    continue
                sane = sanitize_title(target)
                if sane in loaded:
                    continue
                if sane not in everywhere:
                    status = "not registered upstream either"
                elif sane.split("\\", 1)[0] not in KEPT_CATEGORIES:
                    status = "excluded category"
                else:
                    status = "registered by unloaded " + everywhere[sane]
                links.append((kind, e.file, sanitize_title(title), sane, status))
    return links


_TAGS = {"dead trial": "dead trial: ", "unused include": "unused include: ",
         "disabled data": "disabled system: ", "missing": "missing: "}


def render_manifest(manifest_text, catalogue, revision):
    """The upstream manifest with every entry that does not load turned into an XML comment."""
    eol = "\r\n" if "\r\n" in manifest_text else "\n"
    decisions = iter(catalogue.entries)
    out = []
    for line, in_comment in manifest_lines(manifest_text):
        m = None if in_comment else _ELEMENT.match(line)
        if m:
            e = next(decisions)
            if e.decision != "load":
                line = (f"{m.group('indent')}<!-- {_TAGS.get(e.decision, '')}{m.group('element')} -->"
                        f"{m.group('rest')}{m.group('eol') or ''}")
        out.append(line)
    text = "".join(out)
    start_tag_end = text.find("\n", text.find(">", text.find("<Ui"))) + 1
    header = (
        f"\t<!-- GoatQuest loads the Leveling, Dungeons and Professions guides, Images.lua and the{eol}"
        f"\t     include files their #include directives reach. Other upstream entries stay below as{eol}"
        f"\t     comments, so a category can be restored by uncommenting it. A \"dead trial\" can never{eol}"
        f"\t     register: its full counterpart above runs the same DoMutex guard first.{eol}"
        f"\t     Generated by tools/sync_guides.py from upstream revision {revision}; edit the tool. -->{eol}")
    return text[:start_tag_end] + header + text[start_tag_end:]


def manifest_files(manifest_text):
    tree = ET.fromstring(manifest_text.encode("utf-8"))
    return [el.get("file") for el in tree.iter() if el.tag.split("}")[-1] in ("Script", "Include") and el.get("file")]


# --------------------------------------------------------------------------- vocabulary check

_ENGINE_SKIP_DIRS = {"Guides-Retail", "Data-Retail", "Localization", "Localization-Retail", "tests", "tools", "design"}
_LINE_KEYWORD = re.compile(r"(?m)^[ \t]*\|?[ \t]*([a-z][a-z0-9_]*)(?=[ \t\r\n|]|$)")
_PIPE_KEYWORD = re.compile(r"\|[ \t]*([a-z][a-z0-9_]*)\b")
_CONDITION = re.compile(r"\b(?:only if|only|complete|condition)\b([^|\r\n]*)")
_CALL_NAME = re.compile(r"\b([A-Za-z_][A-Za-z0-9_]*)\s*\(")
_COLOUR = re.compile(r"c[0-9a-f]{8}")


def guide_vocabulary(text):
    """(step keywords, condition function names, include names) used by a guide file's guides."""
    keywords, conditions, includes = set(), set(), set()
    info = scan_lua(text)
    for _, header, body, _ in info.guides:
        for word in _LINE_KEYWORD.findall(body) + _PIPE_KEYWORD.findall(body):
            if not _COLOUR.fullmatch(word) and word not in ("r", "n", "t"):
                keywords.add(word)
        for segment in _CONDITION.findall(body):
            conditions.update(_CALL_NAME.findall(segment))
        conditions.update(_CALL_NAME.findall(header))
        includes.update(name for name, _ in include_calls(body))
    return keywords, conditions, includes


def engine_vocabulary():
    words, goaltypes, literals = set(), set(), set()
    for path in ROOT.rglob("*.lua"):
        rel = path.relative_to(ROOT)
        if rel.parts[0] in _ENGINE_SKIP_DIRS or path.name.casefold() in ("licence.lua", "license.lua"):
            continue
        text = path.read_text(encoding="utf-8", errors="surrogateescape")
        words.update(re.findall(r"[A-Za-z_][A-Za-z0-9_]*", text))
        goaltypes.update(re.findall(r"GOALTYPES\[\s*['\"](\w+)['\"]\s*\]", text))
        goaltypes.update(re.findall(r"GOALTYPES\.(\w+)\s*=", text))
        literals.update(re.findall(r"[\"'](\w+)[\"']", text))
    return words, goaltypes | literals


def vocabulary_report(new_texts, baseline_texts, include_names):
    """Keywords/conditions/includes in new or changed guide files that neither the engine nor any
    previously imported guide uses."""
    base_kw, base_cond = set(), set()
    for text in baseline_texts:
        kw, cond, _ = guide_vocabulary(text)
        base_kw |= kw
        base_cond |= cond
    words, keywords = engine_vocabulary()
    findings = []
    for rel, text in sorted(new_texts.items()):
        kw, cond, inc = guide_vocabulary(text)
        for word in sorted(kw - base_kw - keywords):
            findings.append(f"{rel}: step keyword '{word}' unknown to the engine")
        for name in sorted(cond - base_cond - words):
            findings.append(f"{rel}: condition/function '{name}' unknown to the engine")
        for name in sorted(n for n in inc if n not in include_names and "%" not in n):
            findings.append(f"{rel}: #include '{name}' is not registered by any include file")
    return findings


# --------------------------------------------------------------------------- sync

def upstream_revision():
    text = (UPSTREAM / "Ver.lua").read_text(encoding="utf-8", errors="replace")
    m = re.search(r"\$Revision:\s*(\d+)\s*\$", text)
    return m.group(1) if m else "unknown"


def read_upstream():
    files = {}
    for path in sorted(UPSTREAM_GUIDES.rglob("*")):
        if path.is_file():
            rel = goat_transform.transform_name(path.relative_to(UPSTREAM_GUIDES).as_posix())
            if rel not in DROPPED_FILES:
                files[rel] = import_bytes(path.read_bytes(), path.suffix)
    return files


def apply_fixes(files):
    """Apply UPSTREAM_FIXES to the imported files in place; return notes for fixes not applied."""
    notes = []
    for rel, old, new, reason in UPSTREAM_FIXES:
        text = files[rel].decode("utf-8", errors="surrogateescape") if rel in files else ""
        count = text.count(old)
        if count == 1:
            files[rel] = text.replace(old, new).encode("utf-8", errors="surrogateescape")
        else:
            notes.append(f"upstream fix not applied to {rel} ({count} matches; fixed upstream?): {reason}")
    return notes


@dataclass
class Expected:
    revision: str
    catalogue: Catalogue
    files: dict            # imported guide files, without Autoload.xml
    tree: dict             # files plus the generated Autoload.xml: what Guides-Retail should hold
    fix_notes: list


def expected_tree():
    """The Guides-Retail tree the installed upstream produces. Reads upstream only."""
    revision = upstream_revision()
    files = read_upstream()
    fix_notes = apply_fixes(files)
    manifest_text = files.pop(MANIFEST).decode("utf-8", errors="surrogateescape")
    catalogue = build_catalogue(manifest_text, files)
    rendered = render_manifest(manifest_text, catalogue, revision)
    if manifest_files(rendered) != [e.file for e in catalogue.loaded]:
        raise SystemExit("generated Autoload.xml does not list exactly the loaded entries")
    tree = dict(files)
    tree[MANIFEST] = rendered.encode("utf-8", errors="surrogateescape")
    return Expected(revision, catalogue, files, tree, fix_notes)


def read_local():
    if not GUIDES.is_dir():
        return {}
    return {p.relative_to(GUIDES).as_posix(): p for p in sorted(GUIDES.rglob("*")) if p.is_file()}


def guide_path(rel):
    path = (GUIDES / rel).resolve()
    guides = GUIDES.resolve()
    if path == guides or not path.is_relative_to(guides) or path.is_relative_to(UPSTREAM.resolve()):
        raise SystemExit(f"refusing to write outside Guides-Retail: {rel}")
    if path.name.casefold() in ("licence.lua", "license.lua"):
        raise SystemExit(f"refusing to write a licence file: {rel}")
    return path


def summarise(catalogue, files):
    lines = []
    by_category = defaultdict(lambda: [0, 0, 0, 0])  # loaded files, loaded bytes, all files, all bytes
    decisions = Counter(e.decision for e in catalogue.entries)
    for e in catalogue.entries:
        size = len(files.get(e.rel, b""))
        row = by_category[e.category]
        row[2] += 1
        row[3] += size
        if e.decision == "load":
            row[0] += 1
            row[1] += size
    total = [sum(r[i] for r in by_category.values()) for i in range(4)]
    lines.append(f"catalogue: {total[0]} of {total[2]} manifest scripts load, "
                 f"{total[1] / 1e6:.2f} of {total[3] / 1e6:.2f} MB of source")
    for category, row in sorted(by_category.items(), key=lambda kv: -kv[1][3]):
        lines.append(f"  {category:13} {row[0]:4}/{row[2]:<4} scripts  {row[1] / 1e6:7.2f}/{row[3] / 1e6:.2f} MB")
    lines.append("decisions: " + ", ".join(f"{k} {v}" for k, v in sorted(decisions.items())))
    trials = [e for e in catalogue.entries if e.decision == "dead trial"]
    kept_trials = [e for e in catalogue.entries if e.decision == "load" and e.rel.endswith("Trial.lua")]
    lines.append(f"dead trials commented: {len(trials)}; trials still loaded: {len(kept_trials)}")
    for e in kept_trials:
        lines.append(f"  loads {e.file} ({e.note})")
    used = sorted(e.file for e in catalogue.entries if e.category == "INCLUDES" and e.decision == "load")
    unused = sorted(e.file for e in catalogue.entries if e.decision == "unused include")
    lines.append(f"includes: {len(catalogue.needed_includes)} names reached; "
                 f"files loaded {len(used)}, unused {len(unused)}")
    for name, sources in sorted(catalogue.missing_includes.items()):
        lines.append(f"  missing include '{name}' (also missing upstream) used by {len(sources)} guide(s), "
                     f"e.g. {sorted(sources)[0]}")
    lines.append(f"links from loaded guides to guides that are not loaded: {len(catalogue.links)}")
    targets = defaultdict(set)
    for kind, _, title, target, status in catalogue.links:
        targets[(status, kind, target)].add(title)
    for (status, kind, target), titles in sorted(targets.items()):
        lines.append(f"  [{status}] {kind} -> {target}  (from {len(titles)} guide(s), e.g. {sorted(titles)[0]})")
    for note in catalogue.notes:
        lines.append(f"note: {note}")
    return lines


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__.split("\n\n")[0])
    parser.add_argument("--apply", action="store_true", help="write Guides-Retail (default: dry run)")
    parser.add_argument("--prune", action="store_true",
                        help="with --apply, delete local guide files missing upstream or listed in DROPPED_FILES")
    args = parser.parse_args(argv)
    if not UPSTREAM_GUIDES.is_dir():
        raise SystemExit(f"upstream guides not found: {UPSTREAM_GUIDES}")
    if ROOT.resolve().is_relative_to(UPSTREAM.resolve()):
        raise SystemExit("this tool must not run inside the upstream folder")

    result = expected_tree()
    revision, catalogue, files, expected = result.revision, result.catalogue, result.files, result.tree

    local = read_local()
    added = sorted(set(expected) - set(local))
    removed = sorted(set(local) - set(expected))
    changed = sorted(rel for rel in set(expected) & set(local) if local[rel].read_bytes() != expected[rel])

    print(f"upstream: {UPSTREAM} (revision {revision})")
    print(f"guide files: {len(expected)} upstream (incl. generated {MANIFEST}), {len(local)} local")
    print(f"  added {len(added)}, changed {len(changed)}, not upstream {len(removed)}")
    for label, rels in (("added", added), ("changed", changed), ("not upstream", removed)):
        for rel in rels:
            print(f"    {label}: {rel}")
    print(f"upstream fixes applied: {len(UPSTREAM_FIXES) - len(result.fix_notes)} of {len(UPSTREAM_FIXES)}; "
          f"upstream files not shipped: {len(DROPPED_FILES)}")
    for note in result.fix_notes:
        print(f"  {note}")
    for line in summarise(catalogue, files):
        print(line)
    leftovers = Counter()
    for rel, data in files.items():
        if rel.endswith((".lua", ".xml")):
            leftovers.update(m.group(0) for m in BRANDING_LEFTOVERS.finditer(data.decode("utf-8", errors="replace")))
    print("branding left after cleanup: " + (", ".join(f"{k!r} x{v}" for k, v in leftovers.items()) or "none"))

    new_texts = {rel: expected[rel].decode("utf-8", errors="surrogateescape")
                 for rel in added + changed if rel.endswith(".lua")}
    if new_texts:
        include_names = set()
        for info in catalogue.infos.values():
            include_names.update(info.includes)
        baseline = [p.read_text(encoding="utf-8", errors="surrogateescape")
                    for rel, p in local.items() if rel.endswith(".lua") and rel not in new_texts]
        findings = vocabulary_report(new_texts, baseline, include_names)
        print(f"vocabulary check of {len(new_texts)} new/changed guide files: {len(findings)} finding(s)")
        for finding in findings:
            print(f"  {finding}")
    else:
        print("vocabulary check: no new or changed guide files")

    if not args.apply:
        print("dry run: nothing written (use --apply)")
        return 0
    for rel in added + changed:
        path = guide_path(rel)
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_bytes(expected[rel])
    if args.prune:
        for rel in removed:
            guide_path(rel).unlink()
    print(f"applied: wrote {len(added) + len(changed)} file(s)"
          + (f", deleted {len(removed)}" if args.prune else f"; {len(removed)} local-only file(s) left (use --prune)"))
    return 0


if __name__ == "__main__":
    sys.exit(main())
