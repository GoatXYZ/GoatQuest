"""Exercise real quest localization and guide-step retries on Lua 5.1."""
from pathlib import Path
import sys

sys.path.insert(0, str(Path(__file__).resolve().parent))
from gqtest import lua_runtime, read  # noqa: E402

lua = lua_runtime()
goal = read("Goal.lua")
begin = goal.index("local retries=20")
end = goal.index("\nend", goal.index("function Goal:AutoTranslate()", begin)) + len("\nend")
lua.globals()[b"translateSource"] = goal[begin:end].encode()
step = read("Step.lua")
begin = step.index("function Step:Translate()")
end = step.index("\nfunction Step:IsDynamic()", begin)
lua.globals()[b"stepSource"] = step[begin:end].encode()

lua.execute(b'''
local now,tooltip=100,{}
time=function() return now end
GoatQuest_L=function() return {} end
local function newViewer()
    local z={IsRetail=true,IsClassic=false,questsbyid={},completedQuests={[64]=true},
        db={char={maint_fetchquestdata=true}},TooltipScanner={}}
    function z.TooltipScanner:GetTooltip() return tooltip end
    function z:Debug() end
    assert(loadfile(root.."/Localizers.lua"))(addon,z)
    return z
end

-- Retail reads quest titles from the quest hyperlink tooltip and asks the client to load
-- quests it has not cached yet, without spamming requests from many goals/frames.
local requests=0
C_QuestLog={GetTitleForQuestID=function() return nil end,
    RequestLoadQuestByID=function(id) assert(id==64) requests=requests+1 end}
local z=newViewer()
assert(z.Localizers:GetQuestData(nil)==nil)
assert(not z.Localizers:GetQuestData(64) and not z.questsbyid[64])
assert(requests==1)
for i=1,30 do assert(not z.Localizers:GetQuestData(64)) end
assert(requests==1, "many goals/frames must not spam quest requests")
now=104; z.Localizers:GetQuestData(64); assert(requests==1)
now=105; z.Localizers:GetQuestData(64); assert(requests==2)
tooltip={"The Forgotten Heirloom", "  - Oats x8"}
local q,inlog=z.Localizers:GetQuestData(64)
assert(q.title=="The Forgotten Heirloom" and q.id==64 and q.complete and not inlog)
assert(q.goals[1].item=="Oats" and q.goals[1].needed==8)
assert(z.questsbyid[64]==q and requests==2)
q.inlog=true; now=106
function z.TooltipScanner:GetTooltip() error("cache must be used first") end
local cached,inlog=z.Localizers:GetQuestData(64)
assert(cached==q and inlog and q.time==106)

-- Without any quest-log API, an empty tooltip is simply retried later.
C_QuestLog=nil; tooltip={}
z=newViewer()
assert(not z.Localizers:GetQuestData(64))

-- Disabled tooltip fetching still allows async API loading without a scanner call.
z=newViewer(); z.db.char.maint_fetchquestdata=false
function z.TooltipScanner:GetTooltip() error("tooltip fetch disabled") end
requests=0
C_QuestLog={RequestLoadQuestByID=function() requests=requests+1 end}
assert(z.Localizers:GetQuestData(64)==nil and requests==1)

-- Incomplete tooltip objectives must be retried instead of cached permanently.
tooltip={"Tooltip title", "  -   "}; z=newViewer()
q=z.Localizers:GetQuestData(64)
assert(q and not z.questsbyid[64])
tooltip={"Tooltip title", "  - Oats x8"}
q=z.Localizers:GetQuestData(64)
assert(q.goals[1].item=="Oats" and z.questsbyid[64]==q)

-- Real Step/Goal translation recovers after data arrives, even after retry exhaustion.
tooltip={}; requests=0
C_QuestLog={RequestLoadQuestByID=function() requests=requests+1 end}
z=newViewer()
local Goal={IsFitting=function() return true end,
    NeedsTranslation=function(self) return not self.L end}
assert(loadstring("local GQ,Goal=...; "..translateSource))(z,Goal)
local Step={}
assert(loadstring("local Step=...; "..stepSource))(Step)
local goal=setmetatable({action="accept",questid=64,num=1,parentStep={num=2}}, {__index=Goal})
local step=setmetatable({goals={goal}}, {__index=Step})
for i=1,25 do step:Translate() end
assert(not goal.quest and not z.questsbyid[64] and requests==1)
tooltip={"The Forgotten Heirloom"}
step:Translate()
assert(goal.quest.title=="The Forgotten Heirloom" and goal.L and not goal.Lfail and z.frameNeedsUpdating)
print("PASS quest localization: Retail tooltip titles, throttled async loading, cache and step retries")
''')
