"""Exercise real guide registration, header indexing and catalogue dependencies.

The subscription gate is opened in this test only, so the structure of the whole loaded
catalogue is checked whatever the local Licence.lua unlocks; test_licence_gate.py checks the
gate itself. Guide accuracy against the live 12.1 quest data cannot be checked offline.
"""
from collections import Counter
from pathlib import Path
import re
import sys
import xml.etree.ElementTree as ET

sys.path.insert(0, str(Path(__file__).resolve().parent))
from gqtest import ROOT, function_source, lua_runtime, read  # noqa: E402

core = read("GoatQuest.lua")

# Execute production registration and indexing code; only WoW services are mocked.
engine = "local GQ=...; local L=GQ.L; local yield=coroutine.yield;\n"
engine += core[core.index("local function CompGroups("):core.index("\nGQ.maint_done={}")]
engine += core[core.index("local function split(str,sep)"):core.index("\nGQ.registered_mapspotset_groups =")]
for name in ("GQ:DoMutex", "GQ:RegisterInclude", "GQ:RegisterGuideSorting", "GQ:SetBeta", "GQ:GetGuideByTitle"):
    engine += "\n" + function_source(core, name)
engine += "\nlocal Step=GQ.StepProto;\n" + function_source(read("Step.lua"), "Step:GetJumpDestination")


def manifest_files(directory):
    tree = ET.fromstring((ROOT / directory / "Autoload.xml").read_bytes())
    return [ROOT / directory / element.get("file").replace("\\", "/")
            for element in tree.iter() if element.get("file")]


catalogue = manifest_files("Guides-Retail")
assert len(catalogue) == len(set(catalogue)), "Duplicate guide file on login load path"
for path in catalogue:
    assert path.is_file(), f"Missing guide dependency: {path}"
    group = path.relative_to(ROOT / "Guides-Retail").parts[0]
    assert group in {"Images", "Includes", "Leveling", "Dungeons", "Professions"}, path
    assert "Gear" not in path.name, "Disabled item scoring data should not load"
# Include files load only when kept guides use them; the #include closure is checked below.


def include_names(text):
    """Names in '#include name,param=...' lines; Parser.lua strips spaces and quotes."""
    return [re.sub(rb'^"(.*?)"', rb"\1", name.strip()) for name in re.findall(rb"#include\s+([^,\r\n|]+)", text)]


allowed = {b"LEVELING", b"DUNGEONS", b"PROFESSIONS"}
ANCHORS = (
    rb"LEVELING\Midnight (80-90)\Full Zones (Story + Side Quests)\Midnight Intro & Campaign (Full Zone)",
    rb"DUNGEONS\Midnight Dungeons\Windrunner Spire",
    rb"PROFESSIONS\Alchemy\Leveling Guides\Khaz Algar Alchemy 1-100",
)
ROUTES = {
    "Alliance": (rb"LEVELING\Starter Guides\Human Starter", rb"LEVELING\Classic (1-70)\Eastern Kingdoms\Elwynn Forest (1-70)"),
    "Horde": (rb"LEVELING\Starter Guides\Orc Starter", rb"LEVELING\Classic (1-70)\Kalimdor\Durotar (1-70)"),
}
# Stock retail (revision 37179) misspells two 'next' titles; tools/sync_guides.py corrects them
# (UPSTREAM_FIXES), so every header link must resolve.
FIXED_LINKS = {
    "Alliance": ((rb"LEVELING\The Burning Crusade (10-70)\Netherstorm (25-70)",
                  rb"LEVELING\The Burning Crusade (10-70)\Shadowmoon Valley (25-70)"),
                 (rb"LEVELING\Battle for Azeroth (10-70)\Kul Tiras\Drustvar (10-70)",
                  rb"LEVELING\Battle for Azeroth (10-70)\Kul Tiras\Stormsong Valley (10-70)")),
    "Horde": (),
}
for faction in ("Alliance", "Horde"):
    runtime = lua_runtime()
    runtime.globals()[b"faction"] = faction.encode()
    runtime.globals()[b"engine"] = engine.encode()
    runtime.execute(b'''
    tinsert=table.insert
    floor=math.floor
    time=os.time
    C_Spell={GetSpellInfo=function() end,IsSpellUsable=function() return false end}
    C_UnitAuras={GetAuraDataByIndex=function() end}
    C_QuestLog={IsQuestFlaggedCompleted=function() return false end}
    local kits={"Kyrian","Venthyr","NightFae","Necrolord"}
    C_Covenants={GetCovenantIDs=function() return {1,2,3,4} end,
        GetCovenantData=function(id) return {textureKit=kits[id]} end,
        GetActiveCovenantID=function() return 0 end}
    C_MountJournal={GetMountFromSpell=function() end}
    Enum={}
    ITEM_QUALITY_COLORS={}
    for i=0,8 do ITEM_QUALITY_COLORS[i]={hex="|cffffffff"} end
    StaticPopupDialogs={}
    function debugprofilestop() return 0 end
    function debugstack() return "Interface/AddOns/"..addon.."/Guides-Retail/catalogue.lua" end
    function GetClassInfo(id) if id==8 then return "Mage","MAGE",8 end end
    function FillLocalizedClassList(classes) classes.MAGE="Mage" end
    function LibStub() return {data={MapIDsByName={}}} end
    -- Header 'model' lines create a hidden model frame; any widget call is absorbed.
    local widget=setmetatable({},{__index=function(self) return function() return self end end})
    function CreateFrame() return widget end
    GQ={IsRetail=true,GuideOnly=true,STARTUP_INTENSITY=10,
        GuideCategories={LEVELING=true,DUNGEONS=true,PROFESSIONS=true},
        registeredguides={},registered_guide_types={},registered_groups={groups={},guides={}},
        RegisteredGuidesTitles={},RegisteredGuidesByIdent={},registered_includes={},
        guidesets={},registered_sortings={},GuideTitles={},startups={},ParseLog={},
        db={profile={},char={}},StepProto={},Faction={StandingNums={}},
        -- Model/mount registration for the creature detector; PetMirror is created on demand.
        CreatureDetector=setmetatable({},{__index=function(_,key)
            if key~="PetMirror" then return function() end end
        end}),NPCModels={},
        UI={SkinData=function() end},F={HTMLColor=function() return 1,1,1,1 end},
        Retrofit={C_Spell=C_Spell},
        L=setmetatable({},{__index=function(_,key) return key end}),
        IMAGESDIR="Interface/AddOns/"..addon.."/Guides-Retail/Images/"}
    GoatQuest=GQ
    function GoatQuest_L() return GQ.L end
    function UnitFactionGroup() return faction end
    function UnitClass() return "Mage","MAGE",8 end
    function UnitRace()
        if faction=="Alliance" then return "Human","Human",1 end
        return "Orc","Orc",2
    end
    function GetLocale() return "enUS" end
    function GQ.IsLegionRemix() return false end
    function GQ:GetPlayerPreciseLevel() return 14 end
    function GQ:Debug() end
    function GQ:Error(...) error(table.concat({...}," ")) end
    function GQ:SendMessage() end
    function GQ:LoadInitialGuide() end -- saved-tab/step restoration is covered separately
    function GQ:CheckGuideJumps() end -- no full step parsing during catalogue indexing
    assert(loadstring(engine))(GQ)
    assert(loadfile(root.."/Parser.lua"))(addon,GQ)
    assert(loadfile(root.."/Guide.lua"))(addon,GQ)
    assert(loadfile(root.."/GuideMenu.lua"))(addon,GQ)
    GQ.Parser.ConditionEnv:_Setup()
    function GQ.Parser:ParseHeaderError(...) error(table.concat({...}," ")) end
    -- Test only: open the subscription gate so the whole catalogue's structure is checked
    -- whatever keys the local Licence.lua holds. test_licence_gate.py covers the gate.
    function GQ:NeedsAnimatedPopup() return false end
    GQ:SetBeta()
    ''')
    for path in catalogue:
        runtime.execute(path.read_bytes().removeprefix(b"\xef\xbb\xbf"))

    registered = runtime.globals()[b"GQ"][b"registeredguides"]
    assert len(registered) > 300, f"{faction}: real registration lost the installed guides"
    catalogue_titles = {guide[b"title"]: guide for guide in registered.values()}
    titles = set(catalogue_titles)
    categories = Counter(title.split(b"\\")[0] for title in titles)
    assert allowed <= set(categories), f"Missing categories: {categories}"
    # Kept files cross-list a few guides under other categories; the browser must hide them.
    hidden = sorted(set(categories) - allowed)
    runtime.globals()[b"hiddenCategories"] = runtime.table_from(hidden)
    # Anchors: a starting zone and its progression link, the current expansion's
    # campaign, a current dungeon and a current profession skill guide.
    for title in ANCHORS + ROUTES[faction]:
        assert title in titles, f"Missing {faction} guide: {title!r}"
    sanitize = runtime.eval(b"function(title) return GQ:SanitizeGuideTitle(title) end")
    route = ROUTES[faction]
    assert sanitize(catalogue_titles[route[0]][b"headerdata"][b"next"]) == route[1]

    includes = runtime.globals()[b"GQ"][b"registered_includes"]
    broken, used = [], set()
    for title, guide in catalogue_titles.items():
        next_title = guide[b"headerdata"][b"next"]
        if next_title and not isinstance(next_title, bytes):
            continue  # conditional 'next' functions resolve in-game
        if next_title and sanitize(next_title) not in titles:
            broken.append(f"{title!r} -> {next_title!r}")
        pending = [(title, name) for name in include_names(guide[b"rawdata"])]
        while pending:  # includes may include further includes
            parent, name = pending.pop()
            if name in used:
                continue
            assert includes[name] is not None, f"Missing include in {parent!r}: {name!r}"
            used.add(name)
            pending += [(name, nested) for nested in include_names(includes[name][b"text"])]
    assert not broken, f"{faction}: broken next-guide links:\n" + "\n".join(broken[:20])
    for source, target in FIXED_LINKS[faction]:
        assert sanitize(catalogue_titles[source][b"headerdata"][b"next"]) == target, f"Uncorrected link: {source!r}"
    runtime.execute(b'''
    local startup=coroutine.create(function() GQ:Startup_LoadGuides_Threaded() end)
    repeat
        local ok,err=coroutine.resume(startup)
        assert(ok,err)
    until coroutine.status(startup)=="dead"
    assert(GQ.guidesloaded)
    for _,category in ipairs({"LEVELING","DUNGEONS","PROFESSIONS"}) do
        local group=GQ:FindOrCreateGroup(GQ.registered_groups,category,true)
        assert(group and GQ.GuideMenu:HasVisibleGuides(group),"Empty browser category: "..category)
    end
    for _,category in ipairs(hiddenCategories) do
        local group=GQ:FindOrCreateGroup(GQ.registered_groups,category,true)
        assert(not GQ.GuideMenu:HasVisibleGuides(group),"Hidden category shown in the browser: "..category)
    end
    for _,guide in ipairs(GQ.registeredguides) do
        local category=guide.title:match("^[^\\\\]+")
        assert(GQ.GuideCategories[category] or not GQ.GuideMenu:IsGuideVisible(guide),"Visible hidden guide: "..guide.title)
        assert(guide.headerdata.parsed and not guide.fully_parsed)
    end
    ''')
    counts = ", ".join(f"{name.decode()}: {categories[name]}" for name in sorted(allowed))
    extra = sum(categories[name] for name in hidden)
    print(f"PASS {faction} real catalogue registration/indexing: {len(titles)} unique guides; {counts}; "
          f"{extra} cross-listed guides in hidden categories; browser shows only the three; progression links intact")

print(f"PASS guide loading: {len(catalogue)} catalogue scripts; hidden categories unloaded")
