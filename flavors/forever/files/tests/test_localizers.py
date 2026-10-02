"""Exercise real quest localization and guide-step retries on Lua 5.1."""
from pathlib import Path
import os
import sys

sys.path.insert(0, str(Path(os.environ.get("TEMP", ".")) / "goatquest-lua-tests"))
from lupa.lua51 import LuaRuntime

ROOT = Path(__file__).resolve().parents[1]
lua = LuaRuntime(encoding=None, unpack_returned_tuples=True)
lua.globals()[b"root"] = str(ROOT).replace("\\", "/").encode()
goal = (ROOT / "Goal.lua").read_text(encoding="utf-8-sig")
begin = goal.index("local retries=20")
end = goal.index("\nend", goal.index("function Goal:AutoTranslate()", begin)) + len("\nend")
lua.globals()[b"translateSource"] = goal[begin:end].encode()
step = (ROOT / "Step.lua").read_text(encoding="utf-8-sig")
begin = step.index("function Step:Translate()")
end = step.index("\nfunction Step:IsDynamic()", begin)
lua.globals()[b"stepSource"] = step[begin:end].encode()

lua.execute(b'''
local now,tooltip=100,{}
time=function() return now end
GoatQuest_L=function() return {} end
local function newViewer(classic)
    local z={IsClassic=classic,IsForever=classic,questsbyid={},completedQuests={[64]=true},
        db={char={maint_fetchquestdata=true}},TooltipScanner={}}
    function z.TooltipScanner:GetTooltip() return tooltip end
    function z:Debug() end
    assert(loadfile(root.."/Localizers.lua"))("GoatQuest",z)
    return z
end

-- Forever has no GetQuestInfo; it uses quest IDs with the modern getter.
local title,requests=nil,0
C_QuestLog={GetTitleForQuestID=function(id) assert(id==64) return title end,
    RequestLoadQuestByID=function(id) assert(id==64) requests=requests+1 end}
local z=newViewer(true)
assert(z.Localizers:GetQuestData(nil)==nil)
assert(z.Localizers:GetQuestData(64)==nil and not z.questsbyid[64])
assert(requests==1)
for i=1,30 do assert(z.Localizers:GetQuestData(64)==nil) end
assert(requests==1, "many goals/frames must not spam quest requests")
now=104; z.Localizers:GetQuestData(64); assert(requests==1)
now=105; z.Localizers:GetQuestData(64); assert(requests==2)
title=""; assert(z.Localizers:GetQuestData(64)==nil and not z.questsbyid[64])
title="The Forgotten Heirloom"
local q,inlog=z.Localizers:GetQuestData(64)
assert(q.title==title and q.id==64 and q.complete and not inlog)
assert(z.questsbyid[64]==q and requests==2)
q.inlog=true; now=106
C_QuestLog.GetTitleForQuestID=function() error("cache must be used first") end
local cached,inlog=z.Localizers:GetQuestData(64)
assert(cached==q and inlog and q.time==106)

-- Keep legacy Classic support and a tooltip fallback when APIs are absent.
C_QuestLog={GetQuestInfo=function(id) assert(id==64) return "Legacy title" end}
z=newViewer(true)
assert(z.Localizers:GetQuestData(64).title=="Legacy title")
C_QuestLog=nil; tooltip={"Tooltip title", "  - Oats x8"}
z=newViewer(true); q=z.Localizers:GetQuestData(64)
assert(q.title=="Tooltip title" and q.goals[1].item=="Oats" and q.goals[1].needed==8)
tooltip={}; z=newViewer(true)
assert(z.Localizers:GetQuestData(64)==nil)
C_QuestLog={}; assert(z.Localizers:GetQuestData(64)==nil)

-- Disabled tooltip fetching still allows async API loading without a scanner call.
z=newViewer(true); z.db.char.maint_fetchquestdata=false
function z.TooltipScanner:GetTooltip() error("tooltip fetch disabled") end
requests=0
C_QuestLog={RequestLoadQuestByID=function() requests=requests+1 end}
assert(z.Localizers:GetQuestData(64)==nil and requests==1)

-- Incomplete tooltip objectives must be retried instead of cached permanently.
tooltip={"Tooltip title", "  -   "}; z=newViewer(false)
q=z.Localizers:GetQuestData(64)
assert(q and not z.questsbyid[64])
tooltip={"Tooltip title", "  - Oats x8"}
q=z.Localizers:GetQuestData(64)
assert(q.goals[1].item=="Oats" and z.questsbyid[64]==q)

-- Real Step/Goal translation recovers after data arrives, even after retry exhaustion.
tooltip={}; title=nil; requests=0
C_QuestLog={GetTitleForQuestID=function() return title end,
    RequestLoadQuestByID=function() requests=requests+1 end}
z=newViewer(true)
local Goal={IsFitting=function() return true end,
    NeedsTranslation=function(self) return not self.L end}
assert(loadstring("local GQ,Goal=...; "..translateSource))(z,Goal)
local Step={}
assert(loadstring("local Step=...; "..stepSource))(Step)
local goal=setmetatable({action="accept",questid=64,num=1,parentStep={num=2}}, {__index=Goal})
local step=setmetatable({goals={goal}}, {__index=Step})
for i=1,25 do step:Translate() end
assert(not goal.quest and not z.questsbyid[64] and requests==1)
title="The Forgotten Heirloom"
step:Translate()
assert(goal.quest.title==title and goal.L and not goal.Lfail and z.frameNeedsUpdating)
print("PASS quest localization: modern/legacy/missing APIs, throttled async loading, cache and step retries")
''')
