"""Exercise real guide registration, header indexing and catalogue dependencies."""
from collections import Counter
from pathlib import Path
import os
import re
import sys
import xml.etree.ElementTree as ET

sys.path.insert(0, str(Path(os.environ.get("TEMP", ".")) / "goatquest-lua-tests"))
from lupa.lua51 import LuaRuntime

ROOT = Path(__file__).resolve().parents[1]
core = (ROOT / "GoatQuest.lua").read_text(encoding="utf-8-sig")


def function_source(source, name):
    match = re.search(r"^function " + re.escape(name) + r"\(.*?^end$", source, re.M | re.S)
    assert match, f"Missing function: {name}"
    return match.group(0)


# Execute production registration and indexing code; only WoW services are mocked.
engine = "local GQ=...; local L=GQ.L; local yield=coroutine.yield;\n"
engine += core[core.index("local function CompGroups("):core.index("\nGQ.maint_done={}")]
engine += core[core.index("local function split(str,sep)"):core.index("\nGQ.registered_mapspotset_groups =")]
for name in ("GQ:DoMutex", "GQ:RegisterInclude", "GQ:RegisterGuideSorting", "GQ:SetBeta"):
    engine += "\n" + function_source(core, name)
engine += "\nlocal Step=GQ.StepProto;\n" + function_source(
    (ROOT / "Step.lua").read_text(), "Step:GetJumpDestination")


def manifest_files(directory):
    tree = ET.fromstring((ROOT / directory / "Autoload.xml").read_bytes())
    return [ROOT / directory / element.get("file").replace("\\", "/")
            for element in tree.iter() if element.get("file")]


classic = manifest_files("Guides-Classic")
season = manifest_files("Guides-ClassicSeason")
assert not season, "The separate Season of Discovery catalogue should not load on Forever"
assert len(classic) == len(set(classic)), "Duplicate guide file on login load path"
for path in classic:
    assert path.is_file(), f"Missing guide dependency: {path}"
    group = path.relative_to(ROOT / "Guides-Classic").parts[0]
    assert group in {"Images", "Includes", "Leveling", "Dungeons", "Professions"}, path
    assert not path.name.startswith("GoatQuestGear"), "Disabled item scoring data should not load"

# Shared helper files remain available even when their names mention a hidden category.
for path in (ROOT / "Guides-Classic/Includes").rglob("*.lua"):
    assert path in classic, f"Shared guide include was removed: {path}"

allowed = {b"LEVELING", b"DUNGEONS", b"PROFESSIONS"}
for faction in ("Alliance", "Horde"):
    runtime = LuaRuntime(encoding=None, unpack_returned_tuples=True)
    runtime.globals()[b"faction"] = faction.encode()
    runtime.globals()[b"root"] = str(ROOT).replace("\\", "/").encode()
    runtime.globals()[b"engine"] = engine.encode()
    runtime.execute(b'''
    tinsert=table.insert
    floor=math.floor
    C_Spell={GetSpellInfo=function() end,IsSpellUsable=function() return false end}
    C_UnitAuras={GetAuraDataByIndex=function() end}
    C_QuestLog={IsQuestFlaggedCompleted=function() return false end}
    Enum={}
    ITEM_QUALITY_COLORS={}
    for i=0,8 do ITEM_QUALITY_COLORS[i]={hex="|cffffffff"} end
    StaticPopupDialogs={}
    function debugprofilestop() return 0 end
    function debugstack() return "Interface/AddOns/GoatQuest/Guides-Classic/catalogue.lua" end
    function GetClassInfo(id) if id==8 then return "Mage","MAGE",8 end end
    function FillLocalizedClassList(classes) classes.MAGE="Mage" end
    function LibStub() return {data={MapIDsByName={}}} end
    GQ={IsClassic=true,IsForever=true,GuideOnly=true,STARTUP_INTENSITY=10,
        GuideCategories={LEVELING=true,DUNGEONS=true,PROFESSIONS=true},
        registeredguides={},registered_guide_types={},registered_groups={groups={},guides={}},
        RegisteredGuidesTitles={},RegisteredGuidesByIdent={},registered_includes={},
        guidesets={},registered_sortings={},GuideTitles={},startups={},ParseLog={},
        db={profile={},char={}},StepProto={},Faction={StandingNums={}},
        UI={SkinData=function() end},F={HTMLColor=function() return 1,1,1,1 end},
        Retrofit={C_Spell=C_Spell},
        L=setmetatable({},{__index=function(_,key) return key end}),
        IMAGESDIR="Interface/AddOns/GoatQuest/Guides-Classic/Images/"}
    GoatQuest=GQ
    function GoatQuest_L() return GQ.L end
    function UnitFactionGroup() return faction end
    function UnitClass() return "Mage","MAGE",8 end
    function UnitRace()
        if faction=="Alliance" then return "Human","Human",1 end
        return "Undead","Scourge",5
    end
    function GetLocale() return "enUS" end
    function GQ:GetPlayerPreciseLevel() return 14 end
    function GQ:Debug() end
    function GQ:Error(...) error(table.concat({...}," ")) end
    function GQ:SendMessage() end
    function GQ:LoadInitialGuide() end -- saved-tab/step restoration is covered separately
    function GQ:CheckGuideJumps() end -- no full step parsing during catalogue indexing
    assert(loadstring(engine))(GQ)
    assert(loadfile(root.."/Parser.lua"))("GoatQuest",GQ)
    assert(loadfile(root.."/Guide.lua"))("GoatQuest",GQ)
    assert(loadfile(root.."/GuideMenu.lua"))("GoatQuest",GQ)
    GQ.Parser.ConditionEnv:_Setup()
    function GQ.Parser:ParseHeaderError(...) error(table.concat({...}," ")) end
    GQ:SetBeta()
    ''')
    for path in classic:
        runtime.execute(path.read_bytes().removeprefix(b"\xef\xbb\xbf"))

    registered = runtime.globals()[b"GQ"][b"registeredguides"]
    # The real constructor excludes seasonal/Hardcore variants via hideif/only_hardcore.
    assert len(registered) > 300, f"{faction}: real registration lost the installed guides"
    catalogue = {guide[b"title"]: guide for guide in registered.values()}
    titles = set(catalogue)
    categories = Counter(title.split(b"\\")[0] for title in titles)
    assert set(categories) == allowed, f"Unexpected categories: {categories}"
    # These anchors cover zone progression, dungeon instructions, profession skills
    # and the material routes referenced by the profession instructions.
    for title in (
        b"DUNGEONS\\The Deadmines (17-26)",
        b"PROFESSIONS\\Alchemy\\Alchemy (1-300)",
        b"PROFESSIONS\\Cooking\\Farming Guides\\Chunk of Boar Meat",
    ):
        assert title in titles, f"Missing {faction} guide: {title!r}"
    route = (b"LEVELING\\Human Starter (1-13)", b"LEVELING\\Westfall (13-15)")
    if faction == "Horde":
        route = (b"LEVELING\\Undead Starter (1-13)", b"LEVELING\\Silverpine Forest (13-15)")
    assert all(title in titles for title in route)
    sanitize = runtime.eval(b"function(title) return GQ:SanitizeGuideTitle(title) end")
    assert sanitize(catalogue[route[0]][b"headerdata"][b"next"]) == route[1]

    includes = runtime.globals()[b"GQ"][b"registered_includes"]
    for title, guide in catalogue.items():
        next_title = guide[b"headerdata"][b"next"]
        assert not next_title or sanitize(next_title) in titles, f"Broken next-guide link: {title!r} -> {next_title!r}"
        for name in re.findall(rb"#include\s+([^,\r\n|]+)", guide[b"rawdata"]):
            assert includes[name.strip()] is not None, f"Missing include in {title!r}: {name!r}"
    runtime.execute(b'''
    local startup=coroutine.create(function() GQ:Startup_LoadGuides_Threaded() end)
    repeat
        local ok,err=coroutine.resume(startup)
        assert(ok,err)
    until coroutine.status(startup)=="dead"
    assert(GQ.guidesloaded and GQ.Licences==nil)
    for _,category in ipairs({"LEVELING","DUNGEONS","PROFESSIONS"}) do
        local group=GQ:FindOrCreateGroup(GQ.registered_groups,category,true)
        assert(group and GQ.GuideMenu:HasVisibleGuides(group),"Empty browser category: "..category)
    end
    for _,guide in ipairs(GQ.registeredguides) do
        assert(guide.headerdata.parsed and not guide.fully_parsed)
    end
    ''')
    counts = ", ".join(f"{name.decode()}: {categories[name]}" for name in sorted(categories))
    print(f"PASS {faction} real catalogue registration/indexing: {len(titles)} unique guides; {counts}; browser categories visible; progression links intact")

print(f"PASS guide loading: {len(classic)} catalogue scripts; hidden categories and seasonal catalogue unloaded")
