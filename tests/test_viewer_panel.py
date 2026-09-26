"""GoatQuest viewer panel: content from the model, objective bars, progress
bump, step and menu buttons, arrow modes, arrow/halo navigation switch, empty
and loading states, accent re-tint, scale, drag/lock and saved positions."""
import os
import sys
from pathlib import Path

sys.path.insert(0, str(Path(os.environ.get("TEMP", ".")) / "goatquest-lua-tests"))
from lupa.lua51 import LuaRuntime

ROOT = Path(__file__).resolve().parents[1]


def runtime():
    lua = LuaRuntime(encoding=None, unpack_returned_tuples=True)
    lua.globals()[b"root"] = str(ROOT).replace("\\", "/").encode()
    lua.execute(b'assert(loadfile(root.."/tests/wowmock.lua"))()')
    lua.execute(b'assert(loadfile(root.."/tests/styles_fixture.lua"))()')
    return lua


lua = runtime()
lua.execute(br'''
local F = StylesFixture

-- Test-only mock additions: frames report their top edge the way GetLeft
-- reports the left one, and a minimal GameTooltip records what is shown.
WoWMock.Frame.GetTop = function(self) local p = self.points[1] return p and p[5] end
local tip = {lines={}}
function tip:SetOwner(owner) self.owner = owner end
function tip:SetText(t) self.lines = {t} end
function tip:AddLine(t) tinsert(self.lines,t) end
function tip:Show() self.shown = true end
function tip:Hide() self.shown = false end
function tip:IsOwned(owner) return self.owner==owner end
GameTooltip = tip

-- Any global created from here on is a leak.
local before, leaks = {}, {}
for k in pairs(_G) do before[k] = true end
setmetatable(_G,{__newindex=function(t,k,v) if k~="SLASH_GOATQUESTVIEWER1" then tinsert(leaks,tostring(k)) end rawset(t,k,v) end})

F.LoadViewer()
local Styles = GQ.Styles
local viewer = Styles:Get()
assert(viewer and viewer.id=="goatquest" and viewer.name=="name_plain")

F.Startup()
F.Tick(3)
assert(Styles.active==viewer and viewer.created)

local panel,arrow = viewer.panel,viewer.arrow
assert(viewer.roots[1]==panel and viewer.roots[2]==arrow and viewer.roots[3]==viewer.halo.root and #viewer.roots==3)
assert(viewer.nav=="arrow" and not viewer.halo.ring:IsShown(),"the arrow by default")
assert(panel:IsShown() and arrow:IsShown() and panel:GetWidth()==300)
assert(panel:IsClampedToScreen() and arrow:IsClampedToScreen())

local function near(a,b,eps) return math.abs(a-b)<(eps or 1e-6) end
local function colorIs(region,c,getter)
	local r,g,b = region[getter or "GetVertexColor"](region)
	return near(r,c[1],1e-3) and near(g,c[2],1e-3) and near(b,c[3],1e-3)
end
local function texts(pattern) return WoWMock.findText(panel,pattern,true) end
local function one(pattern)
	local t = texts(pattern)
	assert(#t==1,"expected one visible text "..pattern..", got "..#t)
	return t[1]
end
local function none(pattern) assert(#texts(pattern)==0,"unexpected text "..pattern) end
local function top(region) return -select(5,region:GetPoint(1)) end
local function row(label)
	for i=1,viewer.nrows do
		local r = viewer.rows[i]
		if r.name and r.name:GetText()==label then return r end
	end
	error("no row "..label)
end
local function lastCall() return GQ.calls[#GQ.calls] end

local PALADIN = {0.96,0.55,0.73}
local TEXT = {0.925,0.918,0.902}
local DIM = {0.435,0.459,0.494}
local MUTED = {0.553,0.576,0.612}
local px = Styles:Pixel(panel)

----------------------------------------------------------------- default positions
local p,rel,rp,x,y = panel:GetPoint(1)
assert(p=="TOPRIGHT" and rel==UIParent and rp=="TOPRIGHT" and x==-24 and y==-200)
p,rel,rp,x,y = arrow:GetPoint(1)
assert(p=="TOP" and rel==UIParent and rp=="TOP" and x==0 and y==-84)

----------------------------------------------------------------- header
assert(viewer.guideText:GetText()=="Westfall" and viewer.rangeText:GetText()=="13\226\128\14715" and viewer.rangeText:IsShown())
local step = viewer.stepText:GetText()
assert(step:find("^12") and step:find("|cff8d939c / 64|r",1,true), step)
assert(viewer.prevBtn:IsShown() and viewer.nextBtn:IsShown() and viewer.menuBtn:IsShown())
assert(near(viewer.prevBtn.icon:GetRotation(),math.pi/2) and near(viewer.nextBtn.icon:GetRotation(),-math.pi/2),
	"step buttons use the up chevron turned left and right")
assert(viewer.progressFill:IsShown() and near(viewer.progressFill:GetWidth(),300*12/64))
assert(colorIs(viewer.progressFill,PALADIN) and colorIs(viewer.topLine,PALADIN))
assert(near(viewer.topLine:GetHeight(),3*px),"2 units of accent rounded to whole pixels")
for _,b in ipairs(viewer.borders) do
	local thickness = b.side=="BOTTOM" and b:GetHeight() or b:GetWidth()
	assert(near(thickness,px),"true 1px border")
end

----------------------------------------------------------------- body
local prev = one("^Accept Red Leather Bandanas$")
assert(colorIs(prev,DIM,"GetTextColor"))
local quest = one("^The People's Militia$")
assert(colorIs(quest,PALADIN,"GetTextColor"))
local trap,smug,band = row("Defias Trapper"),row("Defias Smuggler"),row("Red Leather Bandana")
assert(one("^9/15$")==trap.count and one("^11/15$")==smug.count and one("^6/15$")==band.count)
assert(colorIs(trap.name,TEXT,"GetTextColor") and colorIs(trap.count,TEXT,"GetTextColor"))
assert(near(trap.fill:GetWidth()/trap.track:GetWidth(),9/15))
assert(near(smug.fill:GetWidth()/smug.track:GetWidth(),11/15))
assert(near(band.fill:GetWidth()/band.track:GetWidth(),6/15))
assert(colorIs(trap.fill,PALADIN))
assert(near(trap.track:GetHeight(),4*px) and near(band.track:GetHeight(),px),
	"3-unit objective bars, 1px along-the-way bars")
local tipfs = one("^West of Sentinel Hill%. Bandanas drop from both%.$")
local wp = one("^48%.4, 45%.4, Westfall$")
assert(colorIs(wp,MUTED,"GetTextColor"))
local along = one("^styles_along$")
local thenfs = one("^styles_then$")
local nextfs = one("^Loot Furlbrow's Pocket Watch$")
none("Hidden")
none("Oats")   -- finished sticky goals are left out by the model
-- Top-to-bottom order.
local order = {prev,quest,trap.name,smug.name,tipfs,wp,along,band.name,thenfs}
for i=2,#order do assert(top(order[i])>top(order[i-1]),"row "..i.." is below row "..(i-1)) end
assert(top(nextfs)==top(thenfs))
assert(panel:GetHeight()>top(nextfs)+16,"panel fits its content")
local fullHeight = panel:GetHeight()

----------------------------------------------------------------- progress bump
local w0 = trap.fill:GetWidth()
GQ.CurrentStep.goals[1].done = 10
GQ:SendMessage("GQ_GOAL_PROGRESS",12,1)
F.Tick(3)
trap = row("Defias Trapper")
assert(one("^10/15$")==trap.count)
none("^9/15$")
assert(trap.fill:GetWidth()>w0 and near(trap.fill:GetWidth()/trap.track:GetWidth(),10/15))
local _,g = trap.count:GetTextColor()
assert(g<0.8,"a count that went up lights up in the accent")
assert(colorIs(row("Defias Smuggler").count,TEXT,"GetTextColor"),"unchanged counts stay quiet")
assert(panel:GetScript("OnUpdate"))
F.Tick(20)
assert(colorIs(trap.count,TEXT,"GetTextColor") and colorIs(trap.fill,PALADIN))
assert(not panel:GetScript("OnUpdate"),"the bump driver stops when done")

-- A finished counted objective: muted name, accent count, check mark.
local g2 = GQ.CurrentStep.goals[2]
g2.done,g2.status = 15,"complete"
GQ:SendMessage("GQ_GOAL_COMPLETED")
F.Tick(20)
smug = row("Defias Smuggler")
assert(colorIs(smug.name,DIM,"GetTextColor") and colorIs(smug.count,PALADIN,"GetTextColor"))
assert(near(smug.fill:GetWidth(),smug.track:GetWidth()))
g2.done,g2.status = 11,"incomplete"

-- Plain objectives, tips, quest grouping and wrapping.
local goals = GQ.CurrentStep.goals
tinsert(goals,F.Goal({text="Talk to Gryan Stoutmantle", action="talk", quest={title="The People's Militia"}}))
tinsert(goals,F.Goal({text="Use the Sentinel Hill flight master to save a very long walk back to town later on", action="text", status="complete"}))
tinsert(goals,F.Goal({text="?", action="text", tooltip="Kill them near the coast."}))
GQ:SendMessage("GQ_STEP_CHANGED")
F.Tick(20)
one("^The People's Militia$")   -- one title for the whole group
local talk = row("Talk to Gryan Stoutmantle")
local long = row("Use the Sentinel Hill flight master to save a very long walk back to town later on")
assert(top(talk.name)>top(row("Defias Smuggler").name),"grouped with its quest")
assert(colorIs(talk.name,TEXT,"GetTextColor") and colorIs(long.name,DIM,"GetTextColor"))
assert(long.name:GetNumLines()>=2,"long lines wrap")
local isTip = one("^Kill them near the coast%.$")
assert(top(isTip)>=top(long.name)+long.name:GetStringHeight(),"rows below a wrapped line clear it")
assert(panel:GetHeight()>fullHeight)
for _=1,3 do tremove(goals) end
GQ:SendMessage("GQ_STEP_CHANGED")
F.Tick(3)

-- A long guide name is truncated, not pushed under the buttons.
GQ.CurrentGuide.title_short = "An Extraordinarily Long Guide Name For Testing (13-15)"
Styles:MarkDirty()
F.Tick(3)
assert(viewer.guideText:GetWidth()<300-12-8-22*3-40,"name leaves room for the step controls")
GQ.CurrentGuide.title_short = "Westfall (13-15)"
Styles:MarkDirty()
F.Tick(3)

----------------------------------------------------------------- buttons
viewer.prevBtn:Click("LeftButton")
local c = lastCall()
assert(c[1]=="PreviousStep" and c[2]==false and c[3]==true)
viewer.prevBtn:Click("RightButton")
c = lastCall()
assert(c[1]=="PreviousStep" and c[2]==true and c[3]==true)
viewer.nextBtn:Click("LeftButton")
c = lastCall()
assert(c[1]=="SkipStep" and c[2]==false and c[3]==false and c[4]==true)
viewer.nextBtn:Click("RightButton")
c = lastCall()
assert(c[1]=="SkipStep" and c[2]==true and c[3]==false and c[4]==true)
WoWMock.shift = true
local n0 = #GQ.calls
viewer.nextBtn:Click("LeftButton")
assert(#GQ.calls-n0==10,"shift skips ten steps")
WoWMock.shift = false
viewer.menuBtn:Click("LeftButton")
c = lastCall()
assert(c[1]=="GuideMenu" and c[2]=="LEVELING")
viewer.menuBtn:Click("RightButton")
c = lastCall()
assert(c[1]=="OpenOptions" and c[2]=="display")

viewer.nextBtn:RunScript("OnEnter")
assert(colorIs(viewer.nextBtn.icon,{1,1,1}) and viewer.nextBtn.hl:IsShown())
assert(tip.shown and tip.owner==viewer.nextBtn and tip.lines[1]=="frame_stepnav_next")
viewer.nextBtn:RunScript("OnLeave")
assert(colorIs(viewer.nextBtn.icon,MUTED) and not viewer.nextBtn.hl:IsShown() and not tip.shown)

----------------------------------------------------------------- direction marker
local stock = GQ.Pointer.ArrowFrame
assert(stock:GetAlpha()==0 and not stock:IsMouseEnabled(),"stock arrow replaced")
stock:ShowTraveling(0.05,1.2,84)
F.Tick(2)
assert(viewer.arrowBody:IsShown() and viewer.chev:IsShown() and viewer.chevShadow:IsShown() and not viewer.arrived:IsShown())
assert(viewer.chev:GetRotation()==1.2 and viewer.chevShadow:GetRotation()==1.2)
assert(viewer.distText:GetText()=="84 yd" and viewer.distText:IsShown())
assert(colorIs(viewer.chev,PALADIN))
assert(viewer.distText.shadowoffset[1]==1 and viewer.distText.shadowoffset[2]==-1 and near(viewer.distText.shadowcolor[4],0.85))
stock:ShowText("|cffffee00Defias|r Trappers",84,75)
F.Tick(2)
assert(viewer.titleText:GetText()=="Defias Trappers" and viewer.etaText:GetText()=="1:15")
stock:ShowTraveling(0.05,-0.5,60.4)
F.Tick(2)
assert(viewer.chev:GetRotation()==-0.5 and viewer.distText:GetText()=="60 yd")

-- Steady state allocates nothing and does not touch the text.
local sets,orig = 0,viewer.distText.SetText
viewer.distText.SetText = function(...) sets = sets+1 return orig(...) end
collectgarbage("stop")
local m0 = collectgarbage("count")
for i=1,2000 do
	Styles.nav.angle = (i%50)/10
	viewer:UpdateNav(Styles.nav,1/30)
end
local grown = collectgarbage("count")-m0
collectgarbage("restart")
viewer.distText.SetText = nil
assert(grown<1,"UpdateNav allocated "..grown.." KB")
assert(sets==0,"unchanged distance is not re-set")
Styles.nav.angle = -0.5

stock:ShowArrived()
F.Tick(2)
assert(not viewer.chev:IsShown() and not viewer.chevShadow:IsShown() and viewer.arrived:IsShown())
assert(viewer.distText:GetText()=="styles_arrived" and viewer.titleText:GetText()=="Defias Trappers")
assert(colorIs(viewer.arrived,PALADIN))

stock:ShowError()
F.Tick(2)
assert(not viewer.chev:IsShown() and not viewer.arrived:IsShown() and not viewer.distText:IsShown() and not viewer.etaText:IsShown())
assert(viewer.titleText:GetText()=="Defias Trappers" and top(viewer.titleText)==51,"title only, in the distance slot")
stock:ShowWaiting()
F.Tick(2)
assert(Styles.nav.mode=="special" and not viewer.chev:IsShown() and viewer.titleText:GetText()=="Defias Trappers")

stock:Hide()
F.Tick(2)
assert(not viewer.arrowBody:IsShown(),"hidden nav hides the marker")
stock:Show()
stock:ShowTraveling(0.05,0.3,84)
F.Tick(2)
assert(viewer.arrowBody:IsShown() and viewer.chev:IsShown() and viewer.distText:GetText()=="84 yd" and top(viewer.titleText)==72)

stock.ArrowIcon:Show()
F.Tick(2)
assert(not viewer.arrowBody:IsShown(),"spell arrow up: stock arrow shows, marker hides")
stock.ArrowIcon:Hide()
F.Tick(2)
assert(viewer.arrowBody:IsShown())

-- Navigation: the halo takes over from the arrow, and back.
local halo = viewer.halo
GQ.db.profile.viewer_nav = "halo"
Styles:ApplySettings()
assert(viewer.nav=="halo" and not viewer.arrowBody:IsShown() and halo.ring:IsShown())
F.Tick(2)
assert(not viewer.arrowBody:IsShown() and stock:GetAlpha()==0,"the stock arrow stays hidden")
assert(halo.notchShown and halo.distText:GetText()=="84 yd","the ring points instead")
assert(colorIs(halo.dots[1],PALADIN) and colorIs(halo.chevrons[1],PALADIN),"the notch takes the accent")
stock:ShowArrived()
F.Tick(2)
assert(not viewer.arrowBody:IsShown() and halo.arrived and halo.hereText:IsShown() and colorIs(halo.ringLine,PALADIN))
stock:ShowTraveling(0.05,0.3,84)
stock.ArrowIcon:Show()
F.Tick(2)
assert(not halo.notchShown and stock:GetAlpha()==0.9,"spell arrow up: the ring stops pointing")
stock.ArrowIcon:Hide()
F.Tick(2)
assert(halo.notchShown)
GQ.db.profile.viewer_nav = "arrow"
Styles:ApplySettings()
assert(viewer.nav=="arrow" and not halo.ring:IsShown())
F.Tick(2)
assert(viewer.arrowBody:IsShown() and viewer.chev:IsShown() and stock:GetAlpha()==0)

----------------------------------------------------------------- empty and loading
GQ.CurrentGuide.fully_parsed = false
Styles:MarkDirty()
F.Tick(3)
one("^styles_loading$")
assert(viewer.guideText:GetText()=="Westfall")
assert(not viewer.prevBtn:IsShown() and not viewer.nextBtn:IsShown() and not viewer.stepText:IsShown())
assert(not viewer.progressFill:IsShown() and not viewer.chooseBtn:IsShown())
none("^10/15$")
GQ.CurrentGuide.fully_parsed = true

local keep = GQ.CurrentStep
GQ.CurrentStep = nil
Styles:MarkDirty()
F.Tick(3)
one("^styles_noguide$")
assert(viewer.guideText:GetText()=="GoatQuest" and not viewer.rangeText:IsShown())
assert(viewer.chooseBtn:IsShown() and viewer.chooseBtn.label:GetText()=="styles_chooseguide")
assert(panel:GetHeight()<fullHeight)
viewer.chooseBtn:Click("LeftButton")
c = lastCall()
assert(c[1]=="GuideMenu" and c[2]=="LEVELING")
GQ.CurrentStep = keep
Styles:MarkDirty()
F.Tick(3)
assert(not viewer.chooseBtn:IsShown() and viewer.stepText:IsShown())
one("^10/15$")
none("styles_noguide")

----------------------------------------------------------------- accent
-- Class colour by default, pins included.
local function pinsAre(c) local w = GQ.Pointer.waypointColor return w and near(w[1],c[1]) and near(w[2],c[2]) and near(w[3],c[3]) end
assert(pinsAre(PALADIN),"waypoint pins take the class colour")
-- A custom colour, GoatQuest gold until one is picked.
GQ.db.profile.viewer_accent = "custom"
Styles:ApplySettings()
F.Tick(3)
local GOLD = Styles.GOLD
assert(colorIs(viewer.topLine,GOLD) and colorIs(viewer.progressFill,GOLD) and colorIs(viewer.chev,GOLD) and colorIs(viewer.arrived,GOLD))
assert(colorIs(viewer.halo.dots[1],GOLD) and colorIs(viewer.halo.chevrons[2],GOLD),"the halo follows the accent")
assert(colorIs(one("^The People's Militia$"),GOLD,"GetTextColor"))
assert(colorIs(row("Defias Trapper").fill,GOLD))
assert(pinsAre(GOLD))
local TEAL = {0.2,0.7,0.65}
GQ.db.profile.viewer_accent_color = {r=TEAL[1],g=TEAL[2],b=TEAL[3]}
Styles:ApplySettings()
F.Tick(3)
assert(colorIs(viewer.topLine,TEAL) and colorIs(viewer.chev,TEAL) and colorIs(row("Defias Trapper").fill,TEAL))
assert(colorIs(viewer.halo.dots[1],TEAL) and pinsAre(TEAL),"the halo and the pins follow a picked colour")
-- The picked colour stays when switching back and forth.
GQ.db.profile.viewer_accent = nil
Styles:ApplySettings()
F.Tick(3)
assert(colorIs(viewer.topLine,PALADIN) and colorIs(viewer.chev,PALADIN) and pinsAre(PALADIN))
assert(GQ.db.profile.viewer_accent_color.r==TEAL[1])
GQ.db.profile.viewer_accent_color = nil

----------------------------------------------------------------- scale
GQ.db.profile.viewer_scale = 1.25
Styles:ApplySettings()
F.Tick(3)
assert(panel:GetScale()==1.25 and arrow:GetScale()==1.25)
assert(near(viewer.borders[1]:GetWidth(),Styles:Pixel(panel)) and Styles:Pixel(panel)<px,"hairlines follow the scale")
GQ.db.profile.viewer_scale = nil
Styles:ApplySettings()
F.Tick(3)
assert(panel:GetScale()==1 and near(viewer.borders[1]:GetWidth(),px))

----------------------------------------------------------------- drag and lock
assert(viewer.header.drag and viewer.header.drag[1]=="LeftButton" and viewer.arrowBody:IsMouseEnabled())
viewer.header:RunScript("OnDragStart")
assert(panel.moving,"the header drags the panel")
-- The client re-anchors a moved frame; simulate the drop.
panel:ClearAllPoints()
panel:SetPoint("TOPLEFT",UIParent,"BOTTOMLEFT",900,600)
viewer.header:RunScript("OnDragStop")
assert(not panel.moving)
local saved = GQ.db.profile.viewer_point
assert(saved[1]=="TOPLEFT" and saved[2]=="BOTTOMLEFT" and saved[3]==900 and saved[4]==600)

viewer.arrowBody:RunScript("OnDragStart")
assert(arrow.moving)
arrow:ClearAllPoints()
arrow:SetPoint("TOPLEFT",UIParent,"BOTTOMLEFT",500,700)
viewer.arrowBody:RunScript("OnDragStop")
saved = GQ.db.profile.viewer_arrowpoint
assert(saved[1]=="TOPLEFT" and saved[2]=="BOTTOMLEFT" and saved[3]==500 and saved[4]==700)

-- Settings passes keep the saved positions.
Styles:ApplySettings()
p,rel,rp,x,y = panel:GetPoint(1)
assert(p=="TOPLEFT" and rel==UIParent and rp=="BOTTOMLEFT" and x==900 and y==600)
p,rel,rp,x,y = arrow:GetPoint(1)
assert(p=="TOPLEFT" and rp=="BOTTOMLEFT" and x==500 and y==700)

-- Hidden mid-drag (viewer toggled off): the move ends and is saved.
viewer.header:RunScript("OnDragStart")
panel:ClearAllPoints()
panel:SetPoint("TOPLEFT",UIParent,"BOTTOMLEFT",880,610)
GQ.Frame:Hide()
F.Tick(1)
assert(not panel:IsShown() and not panel.moving and GQ.db.profile.viewer_point[3]==880)
GQ.Frame:Show()
F.Tick(3)
assert(panel:IsShown())

-- The viewer lock (the stock viewer's "Lock viewer" option) stops dragging.
GQ.db.profile.windowlocked = true
Styles:ApplySettings()
assert(not viewer.arrowBody:IsMouseEnabled(),"locked: the arrow is click-through")
viewer.header:RunScript("OnDragStart")
viewer.arrowBody:RunScript("OnDragStart")
assert(not panel.moving and not arrow.moving,"locked: dragging does nothing")
viewer.header:RunScript("OnDragStop")
assert(GQ.db.profile.viewer_point[3]==880,"a locked drop saves nothing")
-- Locking mid-drag ends the move and keeps where it was dropped.
GQ.db.profile.windowlocked = nil
Styles:ApplySettings()
assert(viewer.arrowBody:IsMouseEnabled())
viewer.header:RunScript("OnDragStart")
assert(panel.moving)
panel:ClearAllPoints()
panel:SetPoint("TOPLEFT",UIParent,"BOTTOMLEFT",870,620)
GQ.db.profile.windowlocked = true
Styles:ApplySettings()
assert(not panel.moving and GQ.db.profile.viewer_point[3]==870)
GQ.db.profile.windowlocked = nil
Styles:ApplySettings()

----------------------------------------------------------------- combat
WoWMock.combat = true
GQ.CurrentStep.goals[1].done = 12
GQ:SendMessage("GQ_GOAL_PROGRESS",12,1)
stock:ShowTraveling(0.05,2.0,40)
F.Tick(4)
viewer.header:RunScript("OnDragStart")
viewer.header:RunScript("OnDragStop")
viewer.nextBtn:Click("LeftButton")
WoWMock.combat = false
assert(one("^12/15$") and viewer.chev:GetRotation()==2.0)
assert(#WoWMock.blocked==0,"no protected calls: "..table.concat(WoWMock.blocked,","))

----------------------------------------------------------------- apply again
-- Applying again (a skin change, the options) keeps the same frames.
Styles:Apply()
F.Tick(3)
assert(Styles:Get().panel==panel and panel:IsShown() and arrow:IsShown())
one("^12/15$")

setmetatable(_G,nil)
for k in pairs(_G) do assert(before[k] or k=="SLASH_GOATQUESTVIEWER1","global leaked: "..tostring(k)) end
assert(#leaks==0,"globals written: "..table.concat(leaks,","))
''')
print("PASS viewer panel: header/progress, grouped rows and proportional bars, progress bump, "
      "prev/next/menu buttons, arrow travel/arrived/error/hidden, arrow/halo navigation switch, "
      "empty/loading, accent, scale, drag save/lock, no protected calls, no globals")
