"""Offline GoatQuest checks. Requires Python and lupa (Lua 5.1 runtime)."""
from pathlib import Path
import os
import re
import runpy
import sys
import xml.etree.ElementTree as ET

sys.path.insert(0, str(Path(os.environ.get("TEMP", ".")) / "goatquest-lua-tests"))
from lupa.lua51 import LuaRuntime

ROOT = Path(__file__).resolve().parents[1]
lua = LuaRuntime(encoding=None, unpack_returned_tuples=True)
loaded = set()
inline_count = 0


def visit(path):
    global inline_count
    path = path.resolve()
    assert path.is_relative_to(ROOT), f"External addon dependency: {path}"
    assert path.name.casefold() not in {"licence.lua", "license.lua"}, f"Unexpected license dependency: {path}"
    assert path.is_file(), f"Missing load dependency: {path}"
    if path in loaded:
        return
    loaded.add(path)
    data = path.read_bytes().removeprefix(b"\xef\xbb\xbf")
    if path.suffix == ".lua":
        lua.compile(data)
    elif path.suffix == ".xml":
        tree = ET.fromstring(data)
        for element in tree.iter():
            tag = element.tag.split("}")[-1]
            if tag in {"Include", "Script"} and element.get("file"):
                visit(path.parent / element.get("file").replace("\\", "/"))
            elif tag == "Script" and element.text and element.text.strip():
                lua.compile(element.text.encode())
                inline_count += 1


for line in (ROOT / "GoatQuest.toc").read_text().splitlines():
    if line.strip() and not line.startswith("#"):
        visit(ROOT / line.strip().replace("\\", "/"))
assert (ROOT / "GoatQuest.toc").read_bytes() == (ROOT / "GoatQuest_Mainline.toc").read_bytes()
for name in ["Compat/Bootstrap.lua", "Compat/GuideOnly.lua", "Compat/Diagnostics.lua"]:
    assert (ROOT / name).resolve() in loaded
assert (ROOT / "Code-Classic/QuestTracking.lua").resolve() not in loaded
assert (ROOT / "Code-Classic/Faction.lua").resolve() not in loaded
print(f"PASS load graph: {len(loaded)} files, {inline_count} inline scripts; Lua 5.1 syntax")

lua.globals()[b"root"] = str(ROOT).replace("\\", "/").encode()
lua.execute(b'''
PI,abs,max,tinsert = math.pi,math.abs,math.max,table.insert
Enum = {UIMapType={Continent=2,Dungeon=4,Micro=5,Zone=3,Orphan=6}}
local function mapCase(retail, classicIDs, empty)
    local kal,ek = classicIDs and 1414 or 12, classicIDs and 1415 or 13
    local maps = {}
    if not empty then
        maps[kal]={100,200,1000,2000,instance=1}
        maps[ek]={300,400,3000,4000,instance=0}
    end
    C_Map = {
        GetMapInfo=function(id)
            if maps[id] then return {mapID=id,mapType=2,parentMapID=947} end
        end,
        GetWorldPosFromMapPos=function() return nil end,
    }
    local z = {IsRetail=retail,IsClassic=not retail,startups={},
        HBD={mapData=maps},LibRover={data={FloorByID={},InstanceMapsRev={}}}}
    assert(loadfile(root.."/MapCoords.lua"))("GoatQuest",z)
    local virtual = z.MapCoords.virtual_calculated
    if not empty then
        assert(virtual[0][1].x==3600 and virtual[0][1].y==4000)
        assert(virtual[0][1].w==100 and virtual[0][1].h==200)
        assert(virtual[1][0].x==800 and virtual[1][0].y==2000)
        local x,y = z.MapCoords.Mxlt(kal,0.5,0.5,ek,true,true)
        assert(type(x)=="number" and type(y)=="number")
        assert(x==x and y==y)
        local d = z.MapCoords.Mdist(kal,0,0,kal,0.5,0)
        assert(d==50)
        z.MapCoords.MAPDATA[ek]=nil
        z.MapCoords.TranslateVirtualContinents()
        assert(not virtual[0][1] and not virtual[1][0])
    end
    if retail then
        assert(next(virtual[1220])==nil, "missing expansion maps must be skipped")
    end
end
mapCase(true,true,false) -- reported Forever failure: Retail flag, Classic maps
mapCase(true,false,false) -- Retail data preserved
mapCase(false,true,false) -- GoatQuest Classic map configuration
mapCase(true,true,true) -- no continent data yet
print("PASS maps: Forever, Retail, Classic, missing parents/children, navigation math")

WOW_PROJECT_ID,WOW_PROJECT_MAINLINE,WOW_PROJECT_CLASSIC = 1,1,2
C_QuestLog={GetInfo=function() end}
local attributes={name="Swords",isHeader=false,isCollapsed=false,rank=75,tempPoints=0,
    modifier=5,maxRank=100,isAbandonable=false,stepCost=0,rankCost=0,minLevel=1,costType=0}
C_SkillInfo={GetNumSkillLines=function() return 1 end,GetSkillLineInfo=function(i) if i==1 then return attributes end end}
GetBuildInfo=function() return "1.60.1","70009","",16001 end
local z={}
assert(loadfile(root.."/Compat/Bootstrap.lua"))("GoatQuest",z)
assert(z.IsForever and WOW_PROJECT_ID==1)
local skill={z.Compat.GetSkillLineInfo(1)}
assert(skill[1]=="Swords" and skill[4]==75 and skill[6]==5 and skill[7]==100)
assert(z.Compat.GetSkillLineInfo(2)==nil)
assert(z.Compat.GetNumSkillLines()==1)
GetBuildInfo=function() return "12.0.1","12345","",120001 end
local retail={}
assert(loadfile(root.."/Compat/Bootstrap.lua"))("GoatQuest",retail)
assert(not retail.IsForever and WOW_PROJECT_ID==1)
print("PASS Forever detection and private skill API adapter; Blizzard globals unchanged")
''')

core = (ROOT / "GoatQuest.lua").read_text(encoding="utf-8-sig")
start = core.index("\tGQ.db.char.questrewards=")
end = core.index("\n\tif self.DEV then", start)
lua.globals()[b"initHooks"] = core[start:end].encode()
start = core.index("function GQ:Hook_QuestChoice()")
end = core.index("\nfunction GQ.Surrogate_SendQuestChoiceResponse", start)
lua.globals()[b"enableHooks"] = core[start:end].encode()
lua.execute(b'''
local function hooksCase(legacy, modern, getter, expected)
    local z={IsRetail=true,db={char={}},events=0,rewards=0,responses=0,choices=0}
    function z:AddMessageHandler() self.events=self.events+1 end
    function z:QuestRewardSelect() self.rewards=self.rewards+1 end
    function z:PlayerChoiceResponce() self.responses=self.responses+1 end
    function z.Surrogate_SendQuestChoiceResponse() z.choices=z.choices+1 end
    SendQuestChoiceResponse=legacy and function() end or nil
    C_QuestChoice=getter and {GetQuestChoiceInfo=function() return 1 end} or nil
    C_PlayerChoice=modern and {SendPlayerChoiceResponse=function() end} or nil
    local hooks={}
    hooksecurefunc=function(target,name,callback)
        if type(target)=="string" then
            assert(type(_G[target])=="function", "attempted to hook missing global")
            callback=name
        else
            assert(type(target[name])=="function", "attempted to hook missing namespace function")
        end
        hooks[#hooks+1]=callback
    end
    assert(loadstring("local GQ=...; "..initHooks))(z)
    assert(loadstring("local GQ=...; "..enableHooks))(z)
    z:Hook_QuestChoice()
    assert(#hooks==expected)
    for _,hook in ipairs(hooks) do hook(7) end
    assert(z.responses==(modern and 1 or 0))
    assert(z.rewards==((legacy and getter) and 1 or 0))
    assert(z.choices==z.rewards and z.events==z.rewards)
end
hooksCase(false,false,false,0)
hooksCase(false,true,false,1)
hooksCase(true,false,true,2)
hooksCase(true,true,true,3)
hooksCase(true,false,false,0)
print("PASS quest-choice hooks: missing APIs, modern, legacy and partial APIs")

SlashCmdList={}
local optionalRan,navRan=false,false
local z={db={profile={}},startups={
    {"ItemScore",function() optionalRan=true end},
    {"Travel System",function() navRan=true end},
    {"Talent Advisor",function() optionalRan=true end},
    {"Telemetry",function() optionalRan=true end},
}}
assert(loadfile(root.."/Compat/GuideOnly.lua"))("GoatQuest",z)
z:ApplyGuideOnlySettings()
for _,startup in ipairs(z.startups) do startup[2]() end
assert(navRan and not optionalRan)
assert(not z.db.profile.sync_enabled and not z.db.profile.autogear and not z.db.profile.enable_vendor_tools)
assert(z.GuideOnlyHiddenOptions.gear and not z.GuideOnlyHiddenOptions.maps)
print("PASS guides-only configuration: navigation starts, optional systems stay disabled")
''')
for faction in ["Alliance", "Horde"]:
    guides = LuaRuntime(encoding=None, unpack_returned_tuples=True)
    guides.globals()[b"faction"] = faction.encode()
    guides.execute(b'''
    GQ={IsClassic=true,IsForever=true,count=0,mutex={},Gold={},
        IMAGESDIR="Interface/AddOns/GoatQuest/Guides-Classic/Images/"}
    GoatQuest=GQ
    function UnitFactionGroup() return faction end
    function UnitClass() return "Mage","MAGE",8 end
    function UnitRace() return "Human","Human",1 end
    function GetLocale() return "enUS" end
    function GQ:DoMutex(name)
        if self.mutex[name] then return true end
        self.mutex[name]=true
    end
    function GQ:RegisterGuide(title,metadata,body)
        assert(type(title)=="string")
        self.count=self.count+1
    end
    function GQ:RegisterInclude() end
    function GQ:RegisterMapSpots() end
    ''')
    for path in sorted(loaded):
        if path.suffix == ".lua" and path.relative_to(ROOT).parts[0].startswith("Guides-"):
            guides.execute(path.read_bytes().removeprefix(b"\xef\xbb\xbf"))
    count = guides.globals()[b"GQ"][b"count"]
    assert count > 600, f"Missing {faction} guides"
    print(f"PASS {faction}: {count} guide registrations (metadata/body parsing happens in-game)")

runpy.run_path(str(ROOT / "tests/test_quest_tracking.py"), run_name="__main__")
runpy.run_path(str(ROOT / "tests/test_guide_actions.py"), run_name="__main__")
runpy.run_path(str(ROOT / "tests/test_localizers.py"), run_name="__main__")
runpy.run_path(str(ROOT / "tests/test_startup.py"), run_name="__main__")
runpy.run_path(str(ROOT / "tests/test_raid_markers.py"), run_name="__main__")
runpy.run_path(str(ROOT / "tests/test_identity.py"), run_name="__main__")
runpy.run_path(str(ROOT / "tests/test_viewer_cleanup.py"), run_name="__main__")
runpy.run_path(str(ROOT / "tests/test_guide_browser.py"), run_name="__main__")
runpy.run_path(str(ROOT / "tests/test_guide_loading.py"), run_name="__main__")
runpy.run_path(str(ROOT / "tests/test_tabs.py"), run_name="__main__")
runpy.run_path(str(ROOT / "tests/test_branding_locales.py"), run_name="__main__")
runpy.run_path(str(ROOT / "tests/test_visual_branding.py"), run_name="__main__")
runpy.run_path(str(ROOT / "tests/test_goatquest_skin.py"), run_name="__main__")
runpy.run_path(str(ROOT / "tests/test_minimap_button.py"), run_name="__main__")
runpy.run_path(str(ROOT / "tests/test_viewer_core.py"), run_name="__main__")
runpy.run_path(str(ROOT / "tests/test_viewer_panel.py"), run_name="__main__")
runpy.run_path(str(ROOT / "tests/test_viewer_halo.py"), run_name="__main__")
runpy.run_path(str(ROOT / "tests/test_viewer_movers.py"), run_name="__main__")
runpy.run_path(str(ROOT / "tests/test_waypoint_pins.py"), run_name="__main__")
runpy.run_path(str(ROOT / "tests/test_rebranding.py"), run_name="__main__")
print("All offline checks passed. In-game testing is still required.")
