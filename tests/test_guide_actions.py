"""Exercise the guides-only trash regression and preserve usable quest actions."""
from pathlib import Path
import os
import sys

sys.path.insert(0, str(Path(os.environ.get("TEMP", ".")) / "goatquest-lua-tests"))
from lupa.lua51 import LuaRuntime

ROOT = Path(__file__).resolve().parents[1]
lua = LuaRuntime(encoding=None, unpack_returned_tuples=True)
lua.globals()[b"root"] = str(ROOT).replace("\\", "/").encode()
lua.execute(b'''
tinsert = table.insert
SlashCmdList = {}
NUM_BAG_SLOTS = 4
function UnitName() return "Goat" end
function InCombatLockdown() return false end
C_Spell = {GetSpellCooldown=function() return {} end, GetSpellInfo=function() end}
C_Item = {GetItemCount=function() return 1 end}

GQ = {
    Retrofit={C_Spell=C_Spell}, UI={}, startups={},
    L={["stepgoal_talk to"]="Talk to %s",["stepgoal_clicknpc"]="Click %s",["stepgoal_kill"]="Kill %s"},
    db={char={},profile={enable_actionbar=true,actionbar_quest=true,actionbar_trash=true,
        mouseovermarkers=true,targetonclick=true}},
    ItemLink={GetItemID=function() return 771 end},
}
function GQ:GetItemInfo(item)
    return "Chipped Boar Tusk", item, 0, 1, 0, "Miscellaneous", "Junk", 5,
        "INVTYPE_NON_EQUIP_IGNORE", 133721, 38
end
function GQ:GetStickiesAt() return {} end

assert(loadfile(root.."/Inventory.lua"))("GoatQuest",GQ)
assert(loadfile(root.."/ActionBar.lua"))("GoatQuest",GQ)
assert(loadfile(root.."/Compat/GuideOnly.lua"))("GoatQuest",GQ)
GQ:ApplyGuideOnlySettings()
assert(GQ.db.profile.actionbar_trash==false)
assert(GQ.db.profile.mouseovermarkers==false and GQ.db.profile.targetonclick==false)
assert(GQ.db.profile.enable_actionbar and GQ.db.profile.actionbar_quest)

-- The disabled startup must not be restored merely to create keptItems.
for _,startup in ipairs(GQ.startups) do
    if startup[1]=="InventoryManager setup" then startup[2](GQ) end
end
assert(GQ.db.char.keptItems==nil)
C_Container={GetContainerNumSlots=function() error("guides-only must not scan bags for trash") end}
assert(#GQ.Inventory:GetGrayTrashDetails()==0)
GQ.Inventory:HandleTrashMacro() -- stale macros must also stop before touching inventory

local actionbar=GQ.ActionBar
local button={attributes={}}
function button:SetAttribute(key,value) self.attributes[key]=value end
actionbar.KeyboundButtons[1]=button
local overlay={icon={SetDesaturated=function() end},SetAlpha=function() end}
local expectedType="item"
function overlay:Setup(actual,icon,tooltip,btype) assert(actual==button and btype==expectedType) end
actionbar.ButtonOverlayPool={Acquire=function() return overlay,false end}
function actionbar:ClearBar() self.Buttons={} end
function actionbar:ReanchorButtons() end

local goal={action="use",itemid=771,forceuse=true,
    IsVisible=function() return true end,IsComplete=function() return false end}
GQ.CurrentStep={num=1,goals={goal}}

-- Simulate an existing saved profile or a later profile switch restoring the toggle.
GQ.db.profile.actionbar_trash=true
GQ.Inventory.GetGrayTrashDetails=function() error("guide action rebuild called trash helper") end
actionbar:SetActionButtonsQueued()
assert(#actionbar.Buttons==1 and actionbar.TrashButton==nil)
assert(button.attributes.itemid==771 and button.attributes.type=="macro")
assert(button.attributes.macrotext1:find("/use item:771",1,true))
GQ.CurrentStep.goals={}
actionbar:SetActionButtonsQueued()
assert(#actionbar.Buttons==0 and actionbar.TrashButton==nil)
print("PASS guides-only: no trash scan or button with missing keptItems; quest item macro retained")

-- Shared inventory definitions remain safe before an optional manager has started.
assert(loadfile(root.."/Inventory.lua"))("GoatQuest",GQ)
GQ.GuideOnly=false
C_Container={
    GetContainerNumSlots=function(bag) return bag==1 and 1 or 0 end,
    GetContainerItemLink=function() return "item:771" end,
    GetContainerItemInfo=function() return {stackCount=2} end,
}
local items=GQ.Inventory:GetGrayTrashDetails()
assert(#items==1 and items[1][4]==771 and items[1][6]==76)
assert(GQ.db.char.keptItems==nil)
GQ.db.char.keptItems={[771]=true}
assert(#GQ.Inventory:GetGrayTrashDetails()==0)
print("PASS shared trash helper: missing keptItems tolerated; explicitly kept items excluded")

-- Targeting buttons must still target guide NPCs without adding raid-marker commands.
GQ.Localizers={GetTranslatedNPC=function(self,id,fallback) return fallback end}
GQ.db.profile.mouseovermarkers=true
GQ.db.profile.targetonclick=true
local targetCases={{"talk",false,1},{"clicknpc",false,6},{"kill",false,8},{"kill",true,7}}
local function targetMacro(case,allowMarkers)
    expectedType=case[1]
    button.attributes={}
    actionbar:SetButton(case[1],42,"Quest Target",1,case[2])
    local macro=button.attributes.macrotext1
    assert(button.attributes.type=="macro")
    assert(macro:find("/target Quest Target",1,true),"guide target action must remain available")
    assert(macro:find("/cleartarget",1,true),"target reset must remain available")
    if case[1]=="kill" then
        assert(macro:find("/cleartarget [dead]",1,true),"dead-target cleanup must remain available")
    end
    if allowMarkers then
        assert(macro:find("/tm "..case[3],1,true),"legacy mode must retain its marker suffix")
    else
        assert(not macro:find("/tm",1,true),"guide/Forever targeting must not set raid markers")
    end
end
for _,flags in ipairs({{true,false},{false,true},{true,true}}) do
    GQ.GuideOnly,GQ.IsForever=flags[1],flags[2]
    for _,case in ipairs(targetCases) do targetMacro(case,false) end
end
GQ.GuideOnly,GQ.IsForever=false,false
for _,case in ipairs(targetCases) do targetMacro(case,true) end
print("PASS action macros: talk/click/kill/sticky targets retained without markers in GuideOnly/Forever; legacy suffixes retained")
''')
