"""The stock subscription gate must stay exactly as shipped in the retail viewer.

GoatQuest (Forever) removed this gate. The retail port keeps it, so paid guide tiers
still need the user's own keys from Licence.lua. Checks:
  1. Licence.lua loads straight after GoatQuest.lua and Tooltips.lua, as in stock.
  2. The gate code is unchanged from stock retail (SHA-256, line endings normalized),
     and nothing else redefines it.
  3. Synthetic licence data: a tiered guide without a usable key is not registered;
     guides in SHARED paths always are.
  4. With the local Licence.lua (if present), a licensed tier registers.
Nothing here prints, copies or stores Licence.lua content or key values.

Only after reviewing a deliberate upstream change to the gate, regenerate the digests
from the transformed stock source with:
    py -3 tests/test_licence_gate.py --compute <transformed retail tree>
"""
from pathlib import Path
import hashlib
import re
import sys
import xml.etree.ElementTree as ET

sys.path.insert(0, str(Path(__file__).resolve().parent))
from gqtest import ROOT, build_release, function_source, lua_runtime, source_files, warn  # noqa: E402

LICENCE = "Licence.lua"


def normalized(root, relative):
    return (Path(root) / relative).read_bytes().decode("utf-8-sig").replace("\r\n", "\n")


def block(source, pattern, label):
    match = re.search(pattern, source, re.M | re.S)
    assert match, f"Gate code missing: {label}"
    return match.group(0)


_STRINGS_AND_COMMENTS = re.compile(r'"(?:[^"\\\n]|\\.)*"|\'(?:[^\'\\\n]|\\.)*\'|--[^\n]*')


def logic_only(text):
    """Code with string literals emptied and comments dropped: wording may change, logic may not."""
    text = _STRINGS_AND_COMMENTS.sub(lambda m: "" if m.group(0).startswith("--") else '""', text)
    return "\n".join(line.rstrip() for line in text.split("\n") if line.strip())


# (label, file, extractor). Extractors take the normalized file text.
GATE_PARTS = [
    ("NeedsAnimatedPopup", "Parser.lua", lambda s: function_source(s, "GQ:NeedsAnimatedPopup")),
    ("NeedsAnimatedPopup helpers", "Parser.lua", lambda s: "\n".join((
        block(s, r'^local mod=.*?$', "Parser.lua mod"),
        block(s, r'^local meta\n.*?$', "Parser.lua meta")))),
    ("RegisterGuide gate", "Guide.lua", lambda s: block(
        s, r'^(\t)if not path:find\("SHARED"\) and GQ:NeedsAnimatedPopup\(guide\) then.*?^\1end[ \t]*$', "Guide:New gate")),
    ("startup key check", "Guide.lua", lambda s: block(
        s, r'^tinsert\(GQ\.startups,\{"Guide: registering events".*?^end\}\)', "Guide.lua startup")),
    ("AnimationVariables", "Functions.lua", lambda s: block(s, r'^GQ\.AnimationVariables = \{.*?\}', "AnimationVariables")),
    ("RenderAnimation", "Functions.lua", lambda s: function_source(s, "GQ:RenderAnimation")),
    ("Licence key checks", "Functions.lua", lambda s: block(
        s, r'^GQ\.Licence = \{\}\n.*?(?=^function GQ\.Licence:CheckExpirationPopup\(\))', "GQ.Licence")),
    ("expiration popup logic", "Functions.lua", lambda s: logic_only(function_source(s, "GQ.Licence:CheckExpirationPopup"))),
    ("expiration warning logic", "Functions.lua", lambda s: logic_only(function_source(s, "GQ.Licence:CheckExpirationWarning"))),
    ("SetBeta", "GoatQuest.lua", lambda s: function_source(s, "GQ:SetBeta")),
    ("RegisterGuide", "GoatQuest.lua", lambda s: function_source(s, "GQ:RegisterGuide")),
]

# Computed from the transformed stock retail source (revision 37179).
STOCK_DIGESTS = {
    "NeedsAnimatedPopup": "7a5a605d9844195d83291f7d9b1675e4d907a6b2c9a43bddd2f2338fed88ed68",
    "NeedsAnimatedPopup helpers": "8fac32204ab79115363fb7949160d5b4a62e6f0c1a0c8d8e820bb92825897019",
    "RegisterGuide gate": "dbea707a8c648f838ab6ee08504bf848e68dce4850aee0aa25babfb90b922a8c",
    "startup key check": "ea733b2adc0d0f1a9cc6c9ed005d341e5b80ed455840303567432655d7113a6d",
    "AnimationVariables": "ec172d6b7903b70dd78cb7193d9b1354fdfaae5290b4c5389c62a105fe7e0939",
    "RenderAnimation": "3c67ff18be75335ca702a17d1f22e754ecad231545f8be625dc68762f11eb630",
    "Licence key checks": "fac270d4d8ec0cd85fec291bf4e3d449384e4438de0f7bd98a235ea9548b0a48",
    "expiration popup logic": "bdd950487f3b4d96b16a9e2d63d5e3bf666c2e906c7251b5d87f951f217d2d70",
    "expiration warning logic": "b55e602a236b7fece04051e7916215685f9b151a7df6da408bda2a50803887c8",
    "SetBeta": "0329325f94e196b5f0849b6cf9db6209688e5446b6af11e1dd63d3e42b3abb23",
    "RegisterGuide": "dff1a88871935d8e92944caae0f8b799c97e5dc2ba25f9930a72aca5fbc6a310",
}


def digests(root):
    texts = {}
    result = {}
    for label, relative, extract in GATE_PARTS:
        if relative not in texts:
            texts[relative] = normalized(root, relative)
        result[label] = hashlib.sha256(extract(texts[relative]).rstrip().encode("utf-8")).hexdigest()
    return result


if len(sys.argv) == 3 and sys.argv[1] == "--compute":
    for label, digest in digests(sys.argv[2]).items():
        print(f'    "{label}": "{digest}",')
    raise SystemExit(0)

# 1. Load order: stock files-Retail.xml runs GoatQuest.lua, Tooltips.lua, Licence.lua.
order = [element.get("file") for element in ET.fromstring((ROOT / "files-GoatQuest.xml").read_bytes()).iter()
         if element.tag.split("}")[-1] in {"Script", "Include"} and element.get("file")]
assert order[:3] == ["GoatQuest.lua", "Tooltips.lua", LICENCE], f"Licence.lua must follow GoatQuest.lua/Tooltips.lua: {order[:4]}"
files, _, missing = build_release.load_graph("enUS")
licence_present = (ROOT / LICENCE).is_file()
if licence_present:
    position = files.index(LICENCE)
    assert files[position - 2:position] == ["GoatQuest.lua", "Tooltips.lua"], "Licence.lua load position changed"
else:
    assert missing == [LICENCE], missing
    warn("Licence.lua is absent (clean checkout): tiered guides will not register until the user's own copy is added")
gitignore = (ROOT / ".gitignore").read_text(encoding="utf-8").splitlines() if (ROOT / ".gitignore").is_file() else []
assert "/Licence.lua" in gitignore, "Licence.lua (personal keys) must stay git-ignored"
print("PASS licence load order: Licence.lua follows GoatQuest.lua and Tooltips.lua as in stock; git-ignored")

# 2. Gate code unchanged, and not redefined or bypassed elsewhere.
current = digests(ROOT)
changed = [label for label in STOCK_DIGESTS if current[label] != STOCK_DIGESTS[label]]
assert set(STOCK_DIGESTS) == set(current), "Digest table out of date"
assert not changed, "Subscription gate differs from stock retail: " + ", ".join(changed)

guide_new = function_source(normalized(ROOT, "Guide.lua"), "Guide:New")
before_gate = guide_new.split('if not path:find("SHARED") and GQ:NeedsAnimatedPopup(guide)', 1)[0]
for statement in re.findall(r"\breturn\b[^\n]*", logic_only(before_gate)):
    assert re.fullmatch(r"return(\s+nil)?(\s+end)*\s*", statement), f"Guide:New returns before the gate: {statement}"
assert logic_only(guide_new).rstrip().endswith("return guide\nend")

DEFINITIONS = {
    r"function\s+[\w.]+[:.]NeedsAnimatedPopup\b|\bNeedsAnimatedPopup\s*=[^=]": {"Parser.lua": 1},
    r"function\s+[\w.]+[:.]RenderAnimation\b|\bRenderAnimation\s*=[^=]": {"Functions.lua": 1},
    r"\bAnimationVariables\s*=[^=]": {"Functions.lua": 1},
    r"function\s+GQ[:.]SetBeta\b|\bSetBeta\s*=[^=]": {"GoatQuest.lua": 1},
    r"function\s+GQ[:.]RegisterGuide\b|\bGQ\.RegisterGuide\s*=[^=]": {"GoatQuest.lua": 1},
    r"function\s+Guide:New\b|\bGuideProto\.New\s*=[^=]": {"Guide.lua": 1},
    r"\bLicences\s*=[^=]": {},
    r"\bBETA\s*=\s*true\b|SetBeta\(\s*true|\bdebug_beta\s*=[^=]": {},
    r"\bGenericGoatQuestLicenceEngine\s*=[^=]": {},
    r"\bLicence\s*=[^=]": {"Functions.lua": 1},
    r"(?<!function )GQ\.Licence:CheckExpirationPopup\(\)": {"GoatQuest.lua": 1},
    r"(?<!function )GQ\.Licence:CheckExpirationWarning\(\)": {"GoatQuest.lua": 1},
}
# Everything any client locale can load, except the private key file itself.
loadable = set(build_release.load_graph(None)[0]) - {LICENCE}
code = {relative: logic_only(path.read_bytes().decode("utf-8-sig", errors="replace"))
        for relative, path in source_files({".lua"}) if relative in loadable}
for pattern, expected in DEFINITIONS.items():
    found = {relative: len(re.findall(pattern, text)) for relative, text in code.items()}
    found = {relative: count for relative, count in found.items() if count}
    assert found == expected, f"Gate definitions changed for /{pattern}/: {found}"
print(f"PASS licence gate code: {len(STOCK_DIGESTS)} parts identical to stock retail; no redefinitions or early returns")

# 3/4. Real Parser.lua, Guide.lua, RegisterGuide and the digest-checked animation tables.

core = normalized(ROOT, "GoatQuest.lua")
engine = "local GQ=...; local L=GQ.L;\n" + core[core.index("local function split(str,sep)"):core.index("\nGQ.registered_mapspotset_groups =")]
functions = normalized(ROOT, "Functions.lua")
extractors = {label: extract for label, _, extract in GATE_PARTS}
animation = "local GQ=...;\n" + extractors["AnimationVariables"](functions) + "\n" + extractors["RenderAnimation"](functions)
lua = lua_runtime()
lua.globals()[b"engine"] = engine.encode()
lua.globals()[b"animation"] = animation.encode()
lua.execute(br'''
tinsert=table.insert
floor=math.floor
time=os.time
C_DateAndTime={GetCurrentCalendarTime=function()
    local now=os.date("*t") return {year=now.year,month=now.month,monthDay=now.day} end}
C_Spell={GetSpellInfo=function() end,IsSpellUsable=function() return false end}
C_UnitAuras={GetAuraDataByIndex=function() end}
C_QuestLog={IsQuestFlaggedCompleted=function() return false end}
Enum={}
ITEM_QUALITY_COLORS={}
for i=0,8 do ITEM_QUALITY_COLORS[i]={hex="|cffffffff"} end
StaticPopupDialogs={}
function debugprofilestop() return 0 end
function debugstack() return "Interface/AddOns/"..addon.."/Guides-Retail/probe.lua" end
function GetClassInfo() end
function FillLocalizedClassList() end
function LibStub() return {data={MapIDsByName={}}} end
function GoatQuest_L() return setmetatable({},{__index=function(_,key) return key end}) end
local faction="Alliance"
function UnitFactionGroup() return faction end
-- WoW's bit library; Lua 5.1 has none.
bit={bxor=function(a,b)
    local result,place=0,1
    while a>0 or b>0 do
        if a%2~=b%2 then result=result+place end
        a,b,place=math.floor(a/2),math.floor(b/2),place*2
    end
    return result
end}
GQ={IsRetail=true,registeredguides={},registered_guide_types={},RegisteredGuidesTitles={},
    RegisteredGuidesByIdent={},registered_groups={groups={},guides={}},startups={},
    db={profile={},char={}},Faction={StandingNums={}},UI={SkinData=function() end},
    F={HTMLColor=function() return 1,1,1,1 end},Retrofit={C_Spell=C_Spell},
    L=setmetatable({},{__index=function(_,key) return key end})}
GoatQuest=GQ
function GQ:Error(...) error(table.concat({...}," ")) end
function GQ:Debug() end
assert(loadstring(engine))(GQ)
assert(loadstring(animation))(GQ)
assert(loadfile(root.."/Parser.lua"))(addon,GQ)
assert(loadfile(root.."/Guide.lua"))(addon,GQ)

local probes=0
function register(path,tier,side)
    probes=probes+1
    faction=side or "Alliance"
    GQ.GuideMenuTier=tier
    GQ.AnimatePopup=nil
    local before=#GQ.registeredguides
    GQ:RegisterGuide(path.."\\Gate probe "..probes,{},"step\nProbe step")
    return #GQ.registeredguides>before
end

-- Synthetic data only. A full-length key goes through the obfuscated check, which is
-- left to the real Licence.lua below; no key is constructed here.
GQ.Licences=nil
assert(not register("LEVELING","TRI") and GQ.AnimatePopup, "no Licences table must not register a tiered guide")
GQ.Licences={}
assert(not register("LEVELING","TRI"), "empty Licences")
GQ.Licences={DATE_E=time()+86400,DATE_S=time()+86400}
assert(not register("DUNGEONS","SHA"), "dates without keys")
GQ.Licences={LEVELING={}}
assert(not register("LEVELING","TRI"), "missing tier entry")
GQ.Licences={LEVELING={SHA={A="1"}}}
assert(not register("LEVELING","TRI"), "other tier's entry")
GQ.Licences={LEVELING={TRI={}}}
assert(not register("LEVELING","TRI"), "missing faction entry")
GQ.Licences={LEVELING={TRI={H="1"}}}
assert(not register("LEVELING","TRI","Alliance"), "other faction's entry")
GQ.Licences={DUNGEONS={TRI={A="1"}}}
assert(not register("LEVELING","TRI"), "other guide type's entry")
for _,key in ipairs({"", "0123456789", "123456789012345678901", 12345, true, "not a key"}) do
    GQ.Licences={LEVELING={TRI={A=key}},PROFESSIONS={SHA={H=key}}}
    assert(not register("LEVELING","TRI","Alliance"), "malformed or short key")
    assert(not register("PROFESSIONS","SHA","Horde"), "malformed or short key")
end
assert(#GQ.registeredguides==0 and next(GQ.RegisteredGuidesTitles)==nil)
GQ.Licences=nil
assert(register("LEVELING\\SHARED","TRI") and not GQ.AnimatePopup, "SHARED guides need no key")
GQ.Licences={LEVELING={TRI={A=""}}}
assert(register("PROFESSIONS\\SHARED\\Materials","SHA","Horde"), "SHARED guides need no key")
assert(#GQ.registeredguides==2 and GQ.registeredguides[1].title:find("^LEVELING\\SHARED\\Gate probe"))
GQ.Licences=nil

-- In-process only: report whether Licence.lua loaded and how many probes registered.
function probeRealLicence()
    local quiet,savedPrint=function() end,print
    print=quiet -- nothing from the key file reaches the console
    local loaded=pcall(function() assert(loadfile(root.."/Licence.lua"))(addon,GQ) end)
    print=savedPrint
    if not loaded or type(GQ.Licences)~="table" then return false,0,0 end
    local tiers,registered=0,0
    for guidetype,subtypes in pairs(GQ.Licences) do
        if type(subtypes)=="table" and GQ.GuideProto.Types[guidetype] then
            for tier,sides in pairs(subtypes) do
                if type(sides)=="table" then
                    for side in pairs(sides) do
                        if side=="A" or side=="H" then
                            tiers=tiers+1
                            local ok,result=pcall(register,guidetype,tier,side=="A" and "Alliance" or "Horde")
                            if ok and result then registered=registered+1 end
                        end
                    end
                end
            end
        end
    end
    GQ.Licences=nil
    return true,tiers,registered
end
''')
print("PASS licence gate behaviour: no table, missing tier/faction/type, malformed or short keys stay unregistered; SHARED paths register")

# Expiry notices with synthetic dates (stock logic; wording may differ from stock).
notices = lua_runtime()
notices.globals()[b"licenceSource"] = "\n".join((
    "local GQ=...", extractors["Licence key checks"](functions),
    function_source(functions, "GQ.Licence:CheckExpirationPopup"),
    function_source(functions, "GQ.Licence:CheckExpirationWarning"))).encode()
notices.execute(b'''
local now=1700000000
time=function() return now end
local popups,printed
GQLP={}
local function control() return {Hide=function() end,ClearAllPoints=function() end,SetPoint=function() end,SetText=function() end} end
GQ={db={profile={}}}
function GQ:SetVisible() end
function GQ:Print() printed=printed+1 end
GQ.PopupHandler={NewPopup=function(_,name)
    local dialog={declinebutton=control(),acceptbutton=control(),settings=control()}
    function dialog:SetText(title) self.title=title end
    function dialog:Show() popups[#popups+1]=self.title end
    return dialog
end}
assert(loadstring(licenceSource))(GQ)
local function check(licences)
    popups,printed={},0
    GQ.Licences=licences
    GQ.Licence.WarningShown_E,GQ.Licence.WarningShown_S=nil,nil
    GQ.Licence:CheckExpirationPopup()
    GQ.Licence:CheckExpirationWarning()
    return popups[1],#popups,printed
end
local title,count,warnings=check(nil)
assert(title=="Guides outdated" and count==1 and warnings==0, "missing Licence.lua is reported once")
title,count,warnings=check({DATE_E=now+86400,DATE_S=now+86400})
assert(count==0 and warnings==0, "current subscription: no notice")
title,count,warnings=check({DATE_E=now-60,DATE_S=now+86400})
assert(title=="Subscription expired" and count==1 and warnings==1)
title,count,warnings=check({DATE_E=now+600,DATE_S=now+86400})
assert(count==0 and warnings==1, "expiring within the hour: one chat warning")
''')
print("PASS licence notices: missing data, expired and expiring subscriptions report once; current data stays quiet")

if licence_present:
    loaded, tiers, registered = lua.globals()[b"probeRealLicence"]()
    assert loaded, "Licence.lua did not load in the test runtime (error text withheld)"
    assert tiers, "Licence.lua loaded but defines no licensed tiers"
    assert registered, "No licensed tier registers with the local Licence.lua: keys expired, or the gate/load order broke"
    print("PASS licence gate positive path: guides of a licensed tier register with the local Licence.lua")
else:
    warn("licence gate positive path skipped: Licence.lua is absent")
