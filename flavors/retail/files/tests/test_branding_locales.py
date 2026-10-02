"""Load every supported UI locale and check the final visible product identity."""
from pathlib import Path
import re
import sys
import xml.etree.ElementTree as ET

sys.path.insert(0, str(Path(__file__).resolve().parent))
from gqtest import ADDON, ROOT, lua_runtime  # noqa: E402

tree = ET.fromstring((ROOT / "Localization/Localization.xml").read_bytes())
files = [ROOT / "Localization" / item.get("file") for item in tree.iter() if item.get("file")]
locales = sorted({"enGB", "itIT"} | {path.stem.removeprefix("Core_") for path in files if path.stem.startswith("Core_")})
enum_names = set(re.findall(rb"Enum\.(\w+)\.(\w+)", (ROOT / "Localization/Core_enUS.lua").read_bytes()))
source_notice = b"Original engine and guide authors"

for locale in locales:
    lua = lua_runtime()
    lua.globals()[b"locale"] = locale.encode()
    lua.execute(b'''
    function GetLocale() return locale end
    CONFIRM_LEARN_PREVIEW_TALENTS="Learn these talents?"
    SINGLE_DAMAGE_TEMPLATE="%s Damage"
    STAT_SPELLDAMAGE="Spell Damage"
    for i=1,6 do _G["SPELL_SCHOOL"..i.."_CAP"]="School "..i end
    Enum={}
    C_Item={GetItemClassInfo=function() return "Item Class" end,
        GetItemSubClassInfo=function() return "Item Subclass" end}
    ''')
    for group, name in enum_names:
        enums = lua.globals()[b"Enum"]
        if enums[group] is None:
            enums[group] = lua.table()
        enums[group][name] = 0
    addon = lua.table()
    for path in files:
        lua.execute(path.read_bytes().removeprefix(b"\xef\xbb\xbf"), ADDON.encode(), addon)
    lua.execute((ROOT / "Compat/Identity.lua").read_bytes(), ADDON.encode(), addon)
    localize = lua.globals()[b"GoatQuest_L"]
    main = localize(b"Main")
    assert main[b"name_plain"] == b"GoatQuest"
    assert main[b"opt_about_desc2"] == source_notice
    assert main[b"opt_about_desc3"] == b"All Rights Reserved"
    assert b"GoatQuest" in main[b"static_caption"] and b"|T" not in main[b"static_caption"]
    assert b"/goatquestdebug" in main[b"opt_tech_support"]
    assert b"saved locally" in main[b"bugreport_step_tooltip2"]
    assert main[b"gold_app_old_servertrends"].count(b"%s") == 1
    assert main[b"guidemenu_section_search_request"].count(b"%s") == 2
    for namespace in (b"Main", b"zta"):
        for key, value in localize(namespace).items():
            if not isinstance(value, bytes) or value == source_notice:
                continue
            # Remove inline coloring too: the inherited talent caption spelled the
            # old brand one colored character at a time.
            plain = re.sub(rb"\|c[0-9a-fA-F]{8}|\|r", b"", value).lower()
            assert not re.search(rb"zyg(?!and)|goatquest (?:client|elite)|goatquestguides\.com", plain), \
                f"{locale} {namespace!r} {key!r}: old brand or invented service"
    print(f"PASS {locale} UI identity: GoatQuest and local reports")

print("PASS all UI locale fallbacks and popup identity")
