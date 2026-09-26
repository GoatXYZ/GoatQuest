"""Ensure guides/navigation never invoke automatic raid-marker actions."""
from pathlib import Path
import os
import re
import sys

sys.path.insert(0, str(Path(os.environ.get("TEMP", ".")) / "goatquest-lua-tests"))
from lupa.lua51 import LuaRuntime

ROOT = Path(__file__).resolve().parents[1]
source = (ROOT / "GoatQuest.lua").read_text()


def function_source(name):
    match = re.search(r"^function " + re.escape(name) + r"\(.*?^end\s*$", source, re.M | re.S)
    assert match, f"Missing core helper: {name}"
    return match.group(0)


helpers = "\n".join(function_source(name) for name in (
    "GQ:MagicRaidMarker", "GQ:MaybeClearRaidMarker",
    "GQ.HandleRaidmarker", "GQ.ClearRaidmarker",
))
for alias in ("MRM", "MCM"):
    match = re.search(r"^GQ\." + alias + r"\s*=\s*GQ\.\w+\s*$", source, re.M)
    assert match, f"Missing legacy alias: {alias}"
    helpers += "\n" + match.group(0)

lua = LuaRuntime(encoding=None, unpack_returned_tuples=True)
lua.globals()[b"root"] = str(ROOT).replace("\\", "/").encode()
lua.globals()[b"helpers"] = helpers.encode()
lua.execute(b'''
tinsert=table.insert
SlashCmdList={}
local locked,grouped,leader=false,false,false
local calls={}
local currentMarker=1
function InCombatLockdown() return locked end
function UnitAffectingCombat() return locked end
function IsInGroup() return grouped end
function UnitIsGroupLeader() return leader end
function UnitExists() return true end
function UnitCanAttack() return true end
function UnitIsDead() return false end
function UnitGUID(unit) return unit=="pet" and "pet-guid" or "npc-guid" end
function GetRaidTargetIndex() return currentMarker end
function SetRaidTarget(unit,marker) table.insert(calls,{unit,marker}) end

GQ={IsRetail=false,IsForever=true,startups={},UsedRaidMarkers={},
    db={profile={mouseovermarkers=true,targetonclick=true}}}
function GQ.GetUnitId() return 42 end
function GQ:GetStickiesAt() return {} end
local step={num=1,IsCurrentlySticky=function() return false end}
step.goals={{action="kill",targetid=42,parentStep=step}}
GQ.CurrentStep=step
assert(loadstring(helpers))()
assert(loadfile(root.."/Compat/GuideOnly.lua"))("GoatQuest",GQ)
GQ:ApplyGuideOnlySettings()
assert(GQ.db.profile.mouseovermarkers==false,"guide settings must disable automatic marking")
assert(GQ.db.profile.targetonclick==false,"guide settings must disable click raid markers")
assert(GQ.MRM==GQ.MagicRaidMarker and GQ.MCM==GQ.MaybeClearRaidMarker)

local function exercise(guideOnly,forever,inCombat,inGroup,isLeader,preexisting)
    GQ.GuideOnly,GQ.IsForever=guideOnly,forever
    locked,grouped,leader=inCombat,inGroup,isLeader
    -- Simulate saved settings or a profile switch restoring the old defaults.
    GQ.db.profile.mouseovermarkers=true
    GQ.db.profile.targetonclick=true
    GQ.UsedRaidMarkers=preexisting and {[1]=true,[6]=true,[7]=true,[8]=true} or {}
    calls={}
    GQ.ClearRaidmarker() -- called when changing/loading a guide step
    assert(#calls==0,"step cleanup must not set/clear raid markers")
    GQ.HandleRaidmarker("target")
    GQ.HandleRaidmarker("mouseover")
    assert(#calls==0,"target/mouseover events must not set raid markers")
    assert(GQ:MagicRaidMarker(6)==GQ,"MagicRaidMarker must preserve chaining")
    GQ:MaybeClearRaidMarker(1)
    assert(GQ:MRM(6)==GQ,"MRM alias must preserve chaining")
    GQ:MCM(1)
    assert(#calls==0,"legacy guide/macro helpers must not modify raid markers")
    if preexisting then
        for _,marker in ipairs({1,6,7,8}) do
            assert(GQ.UsedRaidMarkers[marker],"disabled helpers must leave old bookkeeping untouched")
        end
    else
        assert(next(GQ.UsedRaidMarkers)==nil)
    end
end

local count=0
for _,flags in ipairs({{true,false},{false,true},{true,true}}) do
    for _,inCombat in ipairs({false,true}) do
        for _,membership in ipairs({{false,false},{true,false},{true,true}}) do
            for _,preexisting in ipairs({false,true}) do
                exercise(flags[1],flags[2],inCombat,membership[1],membership[2],preexisting)
                count=count+1
            end
        end
    end
end

-- Positive control: these same mocks reach every legacy write path without the mode guards.
GQ.GuideOnly,GQ.IsForever=false,false
locked,grouped,leader=false,false,false
GQ.UsedRaidMarkers={}
calls={}
assert(GQ:MagicRaidMarker(6)==GQ)
GQ:MaybeClearRaidMarker(1)
GQ.HandleRaidmarker("target")
GQ.HandleRaidmarker("mouseover")
assert(#calls==4,"the mock units/goals must otherwise cause all legacy helpers to mark")
GQ.ClearRaidmarker()
assert(#calls>4,"legacy cleanup must otherwise reach SetRaidTarget")
print("PASS automatic raid markers: "..count.." disabled-mode cases, aliases/chaining, stale settings/history, solo/group, combat; legacy positive control")
''')
