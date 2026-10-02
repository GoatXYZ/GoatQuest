"""Exercise visible viewer targets with the real quick-step menu builder."""
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from gqtest import ROOT, lua_runtime  # noqa: E402

lua = lua_runtime()
core = (ROOT / "GoatQuest.lua").read_text(encoding="utf-8-sig")
start = core.index("function GQ:OpenQuickStepMenu(")
end = core.index("\n--[[", core.index("\n\tEasyFork(menu", start))
lua.globals()[b"menuSource"] = core[start:end].encode()
lua.execute(br'''
assert(loadfile(root.."/tests/wowmock.lua"))()
assert(loadfile(root.."/tests/styles_fixture.lua"))()
local F = StylesFixture
local function prepare(step)
	for i,goal in ipairs(step.goals) do
		goal.parentStep,goal.num = step,i
		function goal:IsCompleteable() return self.action~="text" end
		function goal:IsComplete() return self.status=="complete" end
	end
	function step:CycleWaypointTo(num) self.selectedWaypoint = num end
end
for _,step in ipairs(GQ.CurrentGuide.steps) do prepare(step) end
for _,step in ipairs(GQ.CurrentStickies) do prepare(step) end
GQ.Frame.Menu = {}
GQ.recentlyCompletedGoals = {}
GQ.Localizers = {GetQuestData=function() return nil,false end}
GQ.GetMapNameByID = function() return "Westfall" end
GQ.FakeCompleteGoal = function(_,goal,value) GQ.completedGoal,GQ.completedValue = goal,value end
local entries,anchor,opened,closed = nil,nil,0,0
function EasyFork(menu,frame,target,x,y,mode)
	assert(frame==GQ.Frame.Menu and target:IsVisible() and target:GetEffectiveAlpha()==1)
	assert(target:GetParent()==GQ.Styles:Get().panel and mode=="MENU")
	entries,anchor,opened = menu,target,opened+1
	DropDownForkList1 = {dropdown=frame}
end
function CloseDropDownForks() closed=closed+1 DropDownForkList1=nil end
assert(loadstring("local GQ=...; local L=GQ.L; "..menuSource))(GQ)
F.LoadViewer()
F.Startup()
F.Tick(3)
local viewer = GQ.Styles:Get()
local function clicker(goal)
	for i=1,viewer.nrows do
		local row = viewer.rows[i]
		if row.line.goal==goal then return assert(row.clicker) end
	end
	error("no objective target")
end
local function entry(key)
	for _,item in ipairs(entries) do if item.text==key then return item end end
	error("missing menu item "..key)
end
local first,second = GQ.CurrentStep.goals[1],GQ.CurrentStep.goals[2]
local target = clicker(first)
assert(target:GetWidth()==viewer.panel:GetWidth() and target:GetHeight()>20,
	"target covers the entire counted objective, including its progress bar")
assert(#target.clicks==1 and target.clicks[1]=="RightButtonUp")
target:Click("LeftButton")
assert(opened==0)
target:Click("RightButton")
assert(opened==1 and GQ.Frame.Menu.goalframe.goal==first)
assert(GQ.Frame.Menu.stepframe.step==GQ.CurrentStep)
entry("qmenu_goal_complete").func()
assert(GQ.completedGoal==first and GQ.completedValue==true)
entry("qmenu_goal_waypoint").func()
assert(GQ.CurrentStep.selectedWaypoint==1)
entry("qmenu_step_skip").func()
assert(GQ.calls[#GQ.calls][1]=="SkipStep" and GQ.calls[#GQ.calls][2]==true)
clicker(second):Click("RightButton")
entry("qmenu_goal_complete").func()
assert(GQ.completedGoal==second and GQ.Frame.Menu.goalframe.goal==second,
	"the menu operates on the clicked objective, not always the primary one")

-- A normal progress refresh preserves the menu; hiding/replacing its goal closes it.
local before = closed
GQ:UpdateFrame()
F.Tick(3)
assert(closed==before and anchor:IsVisible() and anchor.goal==second)
second.status = "hidden"
GQ:UpdateFrame()
F.Tick(3)
assert(closed==before+1 and GQ.Frame.Menu.goalframe==nil)
second.status = "incomplete"
GQ:UpdateFrame()
F.Tick(3)

-- The current step's whitespace, quest heading and tooltip have targets too.
local backgrounds,tips = 0,0
for _,button in ipairs(viewer.goalButtons.used) do
	if button.goal==first then
		if button:GetFrameLevel()==viewer.panel:GetFrameLevel()+1 then
			button:Click("RightButton")
			assert(anchor==button)
			backgrounds=backgrounds+1
		elseif button~=clicker(first) then tips=tips+1 end
	end
end
assert(backgrounds==1 and tips==1)

local sticky = GQ.CurrentStickies[1].goals[1]
clicker(sticky):Click("RightButton")
assert(GQ.Frame.Menu.goalframe.goal==sticky and GQ.Frame.Menu.stepframe.is_sticky)
entry("qmenu_goal_complete").func()
assert(GQ.completedGoal==sticky)

GQ.db.profile.showcountsteps = 3
GQ:UpdateFrame()
F.Tick(3)
before = opened
clicker(GQ.CurrentGuide.steps[13].goals[1]):Click("RightButton")
assert(opened==before,"future previews must not expose actions for the current step")
clicker(first):Click("RightButton")
before = closed
GQ.Frame:Hide()
F.Tick(1)
assert(closed==before+1 and not viewer.panel:IsShown())
GQ.Frame:Show()
F.Tick(3)

-- Reused frames must point to the new guide, and old menus must be dismissed.
clicker(first):Click("RightButton")
before = closed
GQ.CurrentStepNum,GQ.CurrentStep = 13,GQ.CurrentGuide.steps[13]
GQ:UpdateFrame()
F.Tick(3)
assert(closed==before+1)
local nextGoal = GQ.CurrentStep.goals[1]
clicker(nextGoal):Click("RightButton")
assert(GQ.Frame.Menu.goalframe.goal==nextGoal)
GQ.CurrentGuide,GQ.CurrentStep = nil,nil
GQ:UpdateFrame()
F.Tick(3)
assert(#viewer.goalButtons.used==0 and GQ.Frame.Menu.goalframe==nil)
assert(#WoWMock.blocked==0)
''')
print("PASS viewer context menu: visible anchors, correct goals and actions, tips, sticky goals, "
      "preview restrictions, refresh, step changes, hide and empty-state cleanup")
