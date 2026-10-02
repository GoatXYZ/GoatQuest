"""Exercise saved-tab restoration with a reduced guide catalog in Lua 5.1."""
from pathlib import Path
import os
import sys

sys.path.insert(0, str(Path(os.environ.get("TEMP", ".")) / "goatquest-lua-tests"))
from lupa.lua51 import LuaRuntime

ROOT = Path(__file__).resolve().parents[1]
lua = LuaRuntime(encoding=None, unpack_returned_tuples=True)
lua.globals()[b"root"] = str(ROOT).replace("\\", "/").encode()
lua.execute(b'''
tinsert,tremove=table.insert,table.remove
table.wipe=function(t) for key in pairs(t) do t[key]=nil end end
function debugprofilestop() return 1 end
function hooksecurefunc() end
local function newFrame()
    return {SetPoint=function() end,SetFrameStrata=function() end,SetSize=function() end,
        SetFrameLevel=function() end,Hide=function() end}
end
function CreateFrame() return newFrame() end
local function chain(object)
    return setmetatable({__END=object},{__index=function(_,key)
        return function(self,...) object[key](object,...) return self end
    end})
end
local known={}
local function guide(title)
    local entry={title=title,title_short=title,type=title:match("^[^\\\\]+"),headerdata={}}
    known[title]=entry
    return entry
end
local level=guide("LEVELING\\\\Westfall")
local dungeon=guide("DUNGEONS\\\\Deadmines")
local profession=guide("PROFESSIONS\\\\Cooking")
local pet=guide("PETS\\\\Companion")
local achievement=guide("ACHIEVEMENTS\\\\Collector")
local missing="PROFESSIONS\\\\Unavailable"
local history={{pet.title,6},{dungeon.title,7},{level.title,4}}
local firstHistory=history[1]
local persistedTabs={
    [1]={title=level.title,step=4},[3]={title=pet.title,step=6,note="preserve"},
    [7]={title=dungeon.title,step=7},[9]={title=missing,step=11},
    [10]={title=level.title,step=2}, -- duplicate old copy must not replace the first
}
local archived={
    [pet.title]={title=pet.title,step=1},
    [profession.title]={title=profession.title,step=12},
    [achievement.title]={title=achievement.title,step=20},
}
local messages={}
GQ={GuideOnly=true,GuideCategories={LEVELING=true,DUNGEONS=true,PROFESSIONS=true},
    ChainCall=chain,UI={SkinData=function() end},L={},startups={},
    db={char={tabguides=persistedTabs,goatquest_archived_tabs=archived,guides_history=history,
        guidename=pet.title,unloadedguide=true}},
    Frame={Controls={TabsAddButton={},TabsMoreButton={}},specialstate="normal",
        Border={GetFrameLevel=function() return 1 end}},
    UpdateCentral={AddHandler=function() end},
    IconSets={TabsIcons=setmetatable({},{__index=function()
        return {AssignToTexture=function() end}
    end})},
    AddMessageHandler=function() end,
}
function GQ:GetGuideByTitle(title) return known[title] end
function GQ:SendMessage(message) messages[#messages+1]=message end
assert(loadfile(root.."/Tabs.lua"))("GoatQuest",GQ)
local tabs=GQ.Tabs
function tabs:CreateTab()
    local tab=setmetatable({Num=#tabs.Pool+1,Button={SetText=function() end},Icon={}}, {__index=tabs})
    table.insert(tabs.Pool,tab)
    return tab
end
function tabs:SetAsCurrent()
    assert(self.guide,"must never activate an empty saved tab")
    tabs.ActiveTab=self
end
function tabs:ApplySkin() end
function tabs:ReanchorTabs()
    -- Mimic serialization that changes the source table during restoration.
    GQ.db.char.tabguides={}
    for i,tab in ipairs(tabs.Pool) do
        if tab.guide then GQ.db.char.tabguides[i]={title=tab.guide.title,step=tab.step} end
    end
end
local function assertHistoryUnchanged()
    assert(GQ.db.char.guides_history==history and history[1]==firstHistory and #history==3)
    assert(history[1][1]==pet.title and history[1][2]==6)
    assert(history[2][1]==dungeon.title and history[2][2]==7)
    assert(history[3][1]==level.title and history[3][2]==4)
    assert(GQ.db.char.unloadedguide==true)
end

tabs:Initialize()
local active=GQ.db.char.tabguides
assert(#active==3 and #tabs.Pool==3 and tabs.ActiveTab==nil)
assert(active[1].title==level.title and active[1].step==4)
assert(active[2].title==dungeon.title and active[2].step==7)
assert(active[3].title==profession.title and active[3].step==12)
assert(archived[pet.title].step==6 and archived[pet.title].note=="preserve")
assert(archived[missing].step==11 and archived[achievement.title].step==20)
assert(archived[level.title]==nil and archived[profession.title]==nil)
assert(persistedTabs[3].title==pet.title and persistedTabs[3].step==6)
assertHistoryUnchanged()
assert(#messages==0,"restoring tabs must not announce fresh guide changes")

-- Repeat startup: no duplicates, and an allowed last-used guide gets an actual active tab.
tabs.Pool={}
tabs.ActiveTab=nil
GQ.db.char.guidename=dungeon.title
tabs:Initialize()
assert(#tabs.Pool==3 and tabs.ActiveTab.guide==dungeon)
assertHistoryUnchanged()

-- A newly permitted/resolvable guide is restored automatically from the archive.
GQ.GuideCategories.PETS=true
guide(missing)
tabs.Pool={}
tabs.ActiveTab=nil
GQ.db.char.guidename=pet.title
tabs:Initialize()
assert(#tabs.Pool==5 and tabs.ActiveTab.guide==pet and tabs.ActiveTab.step==6)
assert(archived[pet.title]==nil and archived[missing]==nil)
assert(archived[achievement.title].step==20)
assertHistoryUnchanged()

-- The existing 30-tab cap now preserves overflow instead of deleting it.
local many={}
for i=1,31 do
    local title=("LEVELING\\\\Guide %02d"):format(i)
    guide(title)
    many[i]={title=title,step=i}
end
GQ.db.char.tabguides=many
GQ.db.char.goatquest_archived_tabs={}
local restored=tabs:GetRestorableTabs()
assert(#restored==30 and #many==31)
assert(GQ.db.char.goatquest_archived_tabs[many[31].title].step==31)
assert(restored[1]~=many[1] and restored[1].title==many[1].title)

-- Outside guides-only mode, all existing categories can be restored; missing data stays archived.
GQ.GuideOnly=false
GQ.db.char.tabguides={{title=achievement.title,step=20}}
GQ.db.char.goatquest_archived_tabs={["PETS\\\\Missing"]={title="PETS\\\\Missing",step=9}}
restored=tabs:GetRestorableTabs()
assert(#restored==1 and restored[1].title==achievement.title)
assert(GQ.db.char.goatquest_archived_tabs["PETS\\\\Missing"].step==9)

print("PASS saved tabs: filtered snapshot, archive deduplication/restoration, sparse data, safe active tab, unchanged history, preserved overflow")
''')
