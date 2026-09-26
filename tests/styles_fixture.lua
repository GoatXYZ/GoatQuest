-- Fake GoatQuest engine for the viewer tests. Load after wowmock.lua.
-- It reproduces the contracts Styles/*.lua rely on (see Styles/README.md):
-- GQ.Frame under GoatQuestFrameMaster, ReanchorFrame, UpdateFrame, message
-- and event handlers, the Pointer arrow frame and its Show* methods, and a
-- Westfall guide whose goals answer GetStatus/GetText/IsVisible.

local Fixture = {}
StylesFixture = Fixture

local L = setmetatable({}, {__index=function(_,k) return k end})

GQ = {
	L=L, Font="Interface\\AddOns\\GoatQuest\\Skins\\OpenSans.TTF", startups={},
	db={profile={arrowalpha=0.9}},
	messages={}, events={}, calls={},
}
GoatQuest = GQ

function GQ:Debug(...) end
function GQ:Print(...) end
function GQ:AddMessageHandler(msg,fn) self.messages[msg] = self.messages[msg] or {} tinsert(self.messages[msg],fn) end
function GQ:AddEventHandler(ev,fn) self.events[ev] = self.events[ev] or {} tinsert(self.events[ev],fn) end
function GQ:SendMessage(msg,...) for _,fn in ipairs(self.messages[msg] or {}) do fn(self,msg,...) end end
function GQ:FireEvent(ev,...) for _,fn in ipairs(self.events[ev] or {}) do fn(self,ev,...) end end
function GQ:UpdateFrame(full) self.calls.updateframe = (self.calls.updateframe or 0)+1 end
function GQ:SetSkin() end
function GQ:PreviousStep(fast,forcefocus) tinsert(self.calls,{"PreviousStep",fast,forcefocus}) end
function GQ:SkipStep(fast,hack,forcefocus) tinsert(self.calls,{"SkipStep",fast,hack,forcefocus}) end
function GQ:OpenOptions(v) tinsert(self.calls,{"OpenOptions",v}) end
GQ.GuideMenu = {Show=function(_,section) tinsert(GQ.calls,{"GuideMenu",section}) end}
GQ.FormatDistance = function(d) return ("%d yd"):format(d) end

-- Stock viewer: master frame with the viewer inside it.
GoatQuestFrameMaster = CreateFrame("Frame","GoatQuestFrameMaster",UIParent)
GoatQuestFrameMaster:SetSize(40,40)
GoatQuestFrameMaster:SetPoint("CENTER",UIParent,"CENTER",300,100)
GQ.Frame = CreateFrame("Frame","GoatQuestFrame",GoatQuestFrameMaster)
GQ.Frame:SetClampedToScreen(true)
function GQ:ReanchorFrame()
	self.Frame:ClearAllPoints()
	self.Frame:SetPoint("TOPLEFT",GoatQuestFrameMaster)
	self.calls.reanchor = (self.calls.reanchor or 0)+1
end
GQ:ReanchorFrame()

GQ.ActionBar = {Frame=CreateFrame("Frame",nil,UIParent)}
GQ.ActionBar.Frame.snapped = true

-- Stock arrow: a protected button whose Show* methods the pipeline calls.
GQ.Pointer = {FormatTime=function(eta) return ("%d:%02d"):format(eta/60,eta%60) end}
-- Waypoint pins take the viewer's accent; record the latest colour.
function GQ.Pointer:SetWaypointColor(r,g,b) self.waypointColor = {r,g,b} end
GoatQuestPointer_ArrowCtrl = CreateFrame("Frame","GoatQuestPointer_ArrowCtrl",UIParent)
function GQ.Pointer:SetupArrow()
	local f = CreateFrame("Button",nil,GoatQuestPointer_ArrowCtrl,"GoatQuestFrame_ArrowSkin_Template,SecureHandlerStateTemplate")
	for _,m in ipairs({"ShowTraveling","ShowArrived","ShowError","ShowWaiting","ShowStairs","ShowText"}) do
		f[m] = function(self,...) self.last = m end
	end
	f:EnableMouse(true)
	f:SetAlpha(GQ.db.profile.arrowalpha)
	f.ArrowIcon = CreateFrame("Button","GoatQuestPointerArrow_Icon",GoatQuestPointer_ArrowCtrl,"SecureActionButtonTemplate")
	f.ArrowIcon:Hide()
	self.ArrowFrame = f
end
GQ.Pointer:SetupArrow()

-- Westfall (13-15), step 12 of 64.
local function Goal(t)
	t.status = t.status or "incomplete"
	function t:GetStatus() return self.status,self.done,self.needed end
	function t:GetText() return self.text end
	function t:IsVisible() return self.status~="hidden" end
	function t:IsInlineTravel() return self.inlinetravel end
	return t
end
Fixture.Goal = Goal

function Fixture.MakeGuide()
	local militia = {title="The People's Militia"}
	local steps = {}
	for n=1,64 do steps[n] = {num=n, goals={Goal({text="Step "..n.." text", action="text", status="passive"})}} end
	steps[11] = {num=11, goals={Goal({text="Accept Red Leather Bandanas", action="accept", status="complete"})}}
	steps[12] = {num=12, current_waypoint_goal_num=1, goals={
		Goal({text="Kill Defias Trapper", action="kill", target="Defias Trapper", done=9, needed=15, quest=militia, x=0.484, y=0.454, map=1436,
			tooltip="West of Sentinel Hill. Bandanas drop from both."}),
		Goal({text="Kill Defias Smuggler", action="kill", target="Defias Smuggler", done=11, needed=15, quest=militia, x=0.484, y=0.454, map=1436}),
		Goal({text="|cffffee00Hidden|r goal", action="kill", status="hidden"}),
	}}
	steps[13] = {num=13, goals={Goal({text="Loot Furlbrow's Pocket Watch", action="click", status="passive"})}}
	local bandanas = {num=40, goals={
		Goal({text="Collect Red Leather Bandana", action="get", target="Red Leather Bandana", done=6, needed=15, quest={title="Red Leather Bandanas"}}),
	}}
	local oats = {num=41, goals={Goal({text="Collect Handful of Oats", action="get", done=8, needed=8, status="complete"})}}
	GQ.CurrentGuide = {title="Leveling Guides\\Westfall (13-15)", title_short="Westfall (13-15)", steps=steps, fully_parsed=true}
	GQ.CurrentStepNum = 12
	GQ.CurrentStep = steps[12]
	GQ.CurrentStickies = {bandanas, oats}
	return GQ.CurrentGuide
end
Fixture.MakeGuide()

--- Load a file from the addon root with the (name, GQ) varargs WoW passes.
function Fixture.Load(path)
	local chunk = assert(loadfile(root.."/"..path))
	chunk("GoatQuest",GQ)
end

function Fixture.LoadStyles(extra)
	Fixture.Load("Styles/Core.lua")
	Fixture.Load("Styles/Model.lua")
	for _,f in ipairs(extra or {}) do Fixture.Load(f) end
end

--- Core, model, movers, halo and the viewer, in Styles.xml order.
function Fixture.LoadViewer()
	Fixture.LoadStyles({"Styles/Movers.lua","Styles/Halo.lua","Styles/Viewer.lua"})
end

--- Run the startups GoatQuest would run after login.
function Fixture.Startup()
	for _,s in ipairs(GQ.startups) do s[2](GQ) end
end

--- Advance time and run OnUpdate on all visible frames.
function Fixture.Tick(n,dt)
	for _=1,(n or 1) do WoWMock.tick(dt or 0.05) end
end

return Fixture
