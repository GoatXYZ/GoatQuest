"""Retail settings and quest-finder behaviour of the guides-only build:

* Options.lua hides the options of systems GoatQuest does not start (sync/sharing, inventory and
  vendor automation, rare/treasure markers, World Quest planner) but keeps the viewer, map and
  travel options; outside guides-only mode everything is shown as in stock. The hidden POI and
  World Quest setters still run from the command line (/zgmaps), where Poi.lua is not loaded and
  the World Quest frame does not exist, so they must not error.
* The AceConfigDialog fork registers its Blizzard settings panels like Ace3 r93 on 12.x: numeric
  category IDs (C_SettingsUtil), parents found by name.
* The quest-log finder neither counts nor parses guides the browser hides.
"""
from pathlib import Path
import sys

sys.path.insert(0, str(Path(__file__).resolve().parent))
from gqtest import lua_runtime  # noqa: E402

STUBS = br'''
local function stub() return setmetatable({}, {__index=function(t,k) local f=function() return stub() end t[k]=f return f end,
    __call=function() return stub() end}) end
setmetatable(_G,{__index=function(t,k) if type(k)=="string" and k:match("^[A-Z]") then return stub() end end})
tinsert,tremove,sort=table.insert,table.remove,table.sort
wipe=function(t) for k in pairs(t) do t[k]=nil end return t end
'''

# ------------------------------------------------------------------ options
lua = lua_runtime()
lua.execute(STUBS + br'''
function UnitName() return "Goat" end
function UnitClass() return "Warrior","WARRIOR",1 end
function GetLocale() return "enUS" end
function IsInGuild() return false end
L = setmetatable({}, {__index=function(t,k) return k end})
function build(guideOnly)
    GQ = {L=L, IsRetail=true, DEV=false, startups={},
        db={profile={hideguide={}}, global={}, char={}, RegisterCallback=function() end,
            GetProfiles=function() return {} end, GetCurrentProfile=function() return "Default" end},
        LibRover={is_stub=false}, LibTaxi={},
        Pointer=setmetatable({Icons=setmetatable({},{__index=function() return {r=1,g=1,b=1,a=1} end})},
            {__index=function() return function() end end}),
        Styles=stub(), GuideMenu={HomeVersion=1}, Font="f", FontBold="fb", SKINSDIR="s\\", DIR="d", ZTA=stub()}
    assert(loadfile(root.."/Compat/GuideOnly.lua"))(addon,GQ)
    GQ.GuideOnly = guideOnly
    if not guideOnly then -- the stock option groups also reach into the gear, gold and talent modules
        local deep
        deep = function() return setmetatable({}, {__index=function() return deep() end, __call=function() return deep() end}) end
        setmetatable(GQ, {__index=function(t,k)
            if type(k)=="string" and k:match("^[A-Z]") and not k:match("^Is%u") then return deep() end
        end})
    end
    assert(loadfile(root.."/Options.lua"))(addon,GQ)
    GQ:Options_DefineOptionTables()
    local opts = {}
    local function walk(args)
        for k,v in pairs(args) do
            if type(v)=="table" then opts[k]=v if v.args then walk(v.args) end end
        end
    end
    for _,o in ipairs(GQ.optiontables_ordered) do walk(GQ.optiontables[o.name].args) end
    return opts
end
function hidden(opts, key)
    local option = assert(opts[key], "missing option "..key)
    return option.hidden==true and option.cmdHidden==true
end
''')
HIDDEN = ("sync_enabled", "sync_snap", "autobuy", "autosell", "showgreysellbutton", "autorepair",
          "poienabled", "poisize", "poialphatoggle", "poishow_rare", "poishow_treasure", "poitype",
          "worldquestenable", "worldquestlocal", "worldquestmap", "worldquestscale")
SHOWN = ("autoacceptturnin", "autotaxi", "maplines_enabled", "foglight", "mapicons", "highlighttaxi", "preview",
         "showallroles", "enable_actionbar", "viewer_nav", "viewer_accent")
build, hidden = lua.globals()[b"build"], lua.globals()[b"hidden"]
guide_only = build(True)
for key in HIDDEN:
    assert hidden(guide_only, key.encode()), f"guides-only: {key} must be hidden"
for key in SHOWN:
    assert not hidden(guide_only, key.encode()), f"guides-only: {key} must stay visible"
stock = build(False)
for key in HIDDEN + SHOWN:
    assert not hidden(stock, key.encode()), f"outside guides-only mode {key} is shown as in stock"
lua.execute(br'''
local opts = build(true)
GQ.Poi, GQ.WorldQuests = nil, {}   -- Poi.lua not loaded; the World Quest frame never created
for _,key in ipairs({"poienabled","poishow_rare","poishow_treasure","poitype","worldquestenable"}) do
    opts[key].set({key}, true)
    opts[key].set({key}, false)
end
local changed
GQ.Poi = {ChangeState=function(_,v) changed=v end}
opts.poienabled.set({"poienabled"}, true)
assert(changed==true, "with Poi.lua loaded the setter still updates the markers")
''')
print(f"PASS retail options: {len(HIDDEN)} options of unstarted systems hidden in guides-only mode, viewer/map/travel "
      "options shown, stock visibility otherwise; POI and World Quest setters safe without their modules")

# ------------------------------------------------------------------ AceConfigDialog on 12.x Settings
lua = lua_runtime()
lua.execute(STUBS + br'''
geterrorhandler=function() return function(e) error(e) end end
local libs={}
LibStub=setmetatable({NewLibrary=function(self,major) if libs[major] then return nil end libs[major]={} return libs[major],nil end,
    GetLibrary=function(self,major) return libs[major] end},{__call=function(self,major) return libs[major] or stub() end})
libs["AceGUI-3.0-Z"]={Create=function()
    local w={frame={},user={}}
    function w:SetTitle(t) self.title=t end
    function w:SetUserData(k,v) self.user[k]=v end
    function w:GetUserData(k) return self.user[k] end
    function w:SetCallback() end
    function w:SetName(n,p) self.frame.name=n self.frame.parent=p end
    return w end}
local function settings(liveIDs)
    local nextID,cats=100,{}
    local function newcat(name)
        nextID=nextID+1
        local c={ID=nextID,name=name,subcategories={}}
        function c:GetID() return self.ID end
        return c
    end
    local function find(id,list)
        for _,c in ipairs(list) do
            if c:GetID()==id then return c end
            local s=find(id,c.subcategories) if s then return s end
        end
    end
    Settings={RegisterCanvasLayoutCategory=function(frame,name) return newcat(name) end,
        RegisterCanvasLayoutSubcategory=function(parent,frame,name) local c=newcat(name) tinsert(parent.subcategories,c) return c end,
        RegisterAddOnCategory=function(c) tinsert(cats,c) end,
        GetCategory=function(id) return find(id,cats) end}
    C_SettingsUtil = liveIDs and {OpenSettingsPanel=function() end} or false -- false: absent (nil would hit the stubs)
    return cats
end
-- Live 12.x: generated numeric IDs stay; subcategories find their parent by name.
local cats=settings(true)
assert(loadfile(root.."/Libs/AceConfig-3.0/AceConfigDialog-3.0/AceConfigDialog-3.0.lua"))()
local ACD=libs["AceConfigDialog-3.0-Z"]
local top=ACD:AddToBlizOptions("GoatQuest","GoatQuest")
local display=ACD:AddToBlizOptions("GoatQuest-Display","Guide Viewer","GoatQuest")
ACD:AddToBlizOptions("GoatQuest-Maps","Maps","GoatQuest")
assert(#cats==1 and type(cats[1].ID)=="number" and top.name==cats[1].ID, "top level keeps its numeric ID")
assert(#cats[1].subcategories==2 and display.parent==cats[1].ID, "subcategories attach to the parent found by name")
assert(ACD.BlizOptionsIDMap.GoatQuest==cats[1].ID)
-- Clients without C_SettingsUtil: the name doubles as the ID, as before (fresh app names:
-- the library keeps its registrations).
cats=settings(false)
local old=ACD:AddToBlizOptions("GoatQuestOld","GoatQuestOld")
ACD:AddToBlizOptions("GoatQuestOld-Maps","Maps","GoatQuestOld")
assert(cats[1].ID=="GoatQuestOld" and old.name=="GoatQuestOld" and #cats[1].subcategories==1)
''')
print("PASS settings panels: numeric 12.x category IDs kept, parents found by name; name IDs without C_SettingsUtil")

# ------------------------------------------------------------------ quest-log finder
lua = lua_runtime()
lua.execute(STUBS + br'''
C_QuestLog={IsQuestFlaggedCompleted=function() return false end}
local guides={}
local function guide(title,visible)
    local g={title=title,visible=visible,steps={{goals={{action="accept",questid=42}}}}}
    function g:Parse() self.parsed=true end
    guides[title]=g
end
guide("LEVELING\\A",true) guide("DAILIES\\B",false)
GQ={GuideOnly=true,startups={},L=setmetatable({},{__index=function(t,k) return k end}),
    GetGuideByTitle=function(self,t) return guides[t] end,
    GuideMenu={IsGuideVisible=function(self,g) return g.visible end},
    Quest_Cache={},Quest_Cache_Accept={["LEVELING\\A"]={{ids={[42]=true}}},["DAILIES\\B"]={{ids={[42]=true}}}}}
assert(loadfile(root.."/QuestDB.lua"))(addon,GQ)
local ok,res=GQ.QuestDB:GetGuidesForQuest(42)
assert(ok and res["LEVELING\\A"]==1 and res["DAILIES\\B"]==nil and not guides["DAILIES\\B"].parsed)
guides["LEVELING\\A"].visible=false
ok,res=GQ.QuestDB:GetGuidesForQuest(42)
assert(not ok and next(res)==nil, "no visible guide: no finder result")
GQ.GuideOnly=false
ok,res=GQ.QuestDB:GetGuidesForQuest(42)
assert(ok and res["DAILIES\\B"]==1, "stock behaviour outside guides-only mode")
''')
print("PASS quest finder: guides the browser hides are neither counted nor parsed in guides-only mode")
