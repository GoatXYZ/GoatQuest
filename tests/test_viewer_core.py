"""GoatQuest viewer core: model snapshot, stock viewer/arrow takeover, combat
deferral, visibility mirroring, navigation tap, settings migration, fonts,
accent colour and /gqviewer."""
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


# A throwaway viewer registered under the real id records what Core hands it.
PROBE = br'''
local F = StylesFixture
F.LoadStyles()
Styles = GQ.Styles
probe = {name="Probe", renders=0, navs={}, settings=0, creates=0}
function probe:Create()
	self.creates = self.creates+1
	self.root = CreateFrame("Frame",nil,UIParent)
	self.roots = {self.root}
end
function probe:Render(model) self.renders = self.renders+1 self.model = model end
function probe:ApplySettings() self.settings = self.settings+1 end
function probe:UpdateNav(nav) tinsert(self.navs, nav and {mode=nav.mode, angle=nav.angle, dist=nav.dist} or false) end
Styles:Register(Styles.VIEWER, probe)
'''

lua = runtime()
lua.execute(PROBE)
lua.execute(br'''
local F = StylesFixture

----------------------------------------------------------------- model
local m = Styles.Model:Build()
assert(m.state=="guide", m.state)
assert(m.guideName=="Westfall" and m.range=="13\226\128\14715", tostring(m.range))
assert(m.stepNum==12 and m.stepCount==64)
assert(#m.lines==2, "hidden goal must be skipped: "..#m.lines)
local l1 = m.lines[1]
assert(l1.text=="Kill Defias Trapper" and l1.counted and l1.done==9 and l1.needed==15)
assert(l1.quest=="The People's Militia" and l1.label=="Defias Trapper")
assert(l1.tip=="West of Sentinel Hill. Bandanas drop from both.")
assert(math.abs(l1.fraction-0.6)<1e-9)
assert(m.primary==1 and m.counted==nil and m.upcoming==nil)
assert(#m.along==1 and m.along[1].label=="Red Leather Bandana" and m.along[1].sticky,
	"completed sticky goals are dropped, open ones kept")
assert(m.prev.text=="Accept Red Leather Bandanas" and m.next.text=="Loot Furlbrow's Pocket Watch")
assert(m.waypoint and math.abs(m.waypoint.x-48.4)<1e-9 and math.abs(m.waypoint.y-45.4)<1e-9 and m.waypoint.zone=="Westfall")

local base,range = Styles.Model.SplitTitle("Leveling Guides\\Darkshore (15-18)")
assert(base=="Darkshore" and range=="15\226\128\14718")
assert(Styles.Model.SplitTitle("Dungeons\\The Deadmines")=="The Deadmines")
assert(Styles.Decolor("|cff00ff00Green|r text")=="Green text")

GQ.CurrentGuide.fully_parsed = false
assert(Styles.Model:Build().state=="loading")
GQ.CurrentGuide.fully_parsed = true
local keep = GQ.CurrentStep; GQ.CurrentStep = nil
assert(Styles.Model:Build().state=="none")
GQ.CurrentStep = keep

----------------------------------------------------------------- startup takes over from the stock viewer
assert(not Styles:IsDriving())
F.Startup()
local arrow = GQ.Pointer.ArrowFrame
assert(Styles:IsDriving() and Styles.active==probe and probe.creates==1)
assert(GoatQuestFrameMaster:GetAlpha()==0, "stock viewer faded out")
assert(GQ.Frame:GetAlpha()==1 and GQ.Frame:IsVisible(), "engine gates still see the viewer")
assert(Styles:IsStockParked() and not GQ.Frame:IsClampedToScreen())
assert(GQ.ActionBar.Frame.snapped==false, "snapped action bar is released while parked")
assert(arrow:GetAlpha()==0 and not arrow:IsMouseEnabled(), "stock arrow hidden and click-through")
assert(probe.root:IsShown() and probe.settings>=1)

-- Applying again only re-applies settings.
local settings = probe.settings
Styles:Apply()
assert(probe.creates==1 and probe.settings==settings+1)

-- A reanchor from stock code is undone immediately.
GQ:ReanchorFrame()
assert(Styles:IsStockParked())
-- A skin change rebuilds the stock viewer; it stays suppressed.
GoatQuestFrameMaster:SetAlpha(1)
GQ.Frame:SetClampedToScreen(true)
GQ:SetSkin()
assert(GoatQuestFrameMaster:GetAlpha()==0 and not GQ.Frame:IsClampedToScreen() and Styles:IsStockParked())

-- Render happens on the next driver tick.
F.Tick(3)
assert(probe.renders>=1 and probe.model.stepNum==12)

-- Messages mark the model dirty.
local before = probe.renders
GQ.CurrentStep.goals[1].done = 10
GQ:SendMessage("GQ_GOAL_PROGRESS",12,1)
F.Tick(3)
assert(probe.renders>before and probe.model.lines[1].done==10)

----------------------------------------------------------------- navigation tap
arrow:ShowTraveling(0.05, math.pi/2, 84)
arrow:ShowText("Defias Trappers", 84, 12)
F.Tick(2)
local last = probe.navs[#probe.navs]
assert(last and last.mode=="travel" and math.abs(last.angle-math.pi/2)<1e-9 and last.dist==84)
assert(Styles.nav.title=="Defias Trappers" and Styles.nav.eta==12)
arrow:ShowArrived()
F.Tick(2)
assert(probe.navs[#probe.navs].mode=="arrived")
arrow:Hide()
F.Tick(2)
assert(Styles.nav.mode=="hidden")
arrow:Show()

-- The secure spell icon keeps the stock arrow visible and the viewer's navigation off.
arrow.ArrowIcon:Show()
F.Tick(2)
assert(arrow:GetAlpha()==0.9 and probe.navs[#probe.navs]==false)
arrow.ArrowIcon:Hide()
F.Tick(2)
assert(arrow:GetAlpha()==0)

-- A new arrow skin creates a new frame: it is tapped and hidden too.
GQ.Pointer:SetupArrow()
local arrow2 = GQ.Pointer.ArrowFrame
assert(arrow2~=arrow and arrow2:GetAlpha()==0 and not arrow2:IsMouseEnabled())
arrow2:ShowTraveling(0.05, 1.0, 50)
assert(Styles.nav.dist==50)
arrow = arrow2

----------------------------------------------------------------- visibility mirrors GQ.Frame
GQ.Frame:Hide()
F.Tick(1)
assert(not probe.root:IsShown(), "viewer toggled off hides the GoatQuest viewer")
GQ.Frame:Show()
F.Tick(1)
assert(probe.root:IsShown())
GQ.Frame:SetAlpha(0.25)   -- hide-in-combat fade
F.Tick(1)
assert(probe.root:GetAlpha()==0.25)
GQ.Frame:SetAlpha(1)
F.Tick(1)
-- forceShown (the movers) keeps it up at full alpha.
Styles.forceShown = true
GQ.Frame:Hide()
GQ.Frame:SetAlpha(0.25)
F.Tick(1)
assert(probe.root:IsShown() and probe.root:GetAlpha()==1)
Styles.forceShown = nil
GQ.Frame:Show()
GQ.Frame:SetAlpha(1)
F.Tick(1)

----------------------------------------------------------------- arrow mouse in combat
WoWMock.combat = true
Styles:SetArrowMouse(true)
assert(not arrow:IsMouseEnabled() and #WoWMock.blocked==0,"protected change waits for the end of combat")
WoWMock.combat = false
GQ:FireEvent("PLAYER_REGEN_ENABLED")
assert(arrow:IsMouseEnabled())
Styles:SuppressStockArrow()
assert(not arrow:IsMouseEnabled())

----------------------------------------------------------------- fonts
assert(Styles:FontPath("archivo"):find("Styles\\Fonts\\Archivo%-Regular%.ttf$"))
for _,locale in ipairs({"ruRU","zhCN","zhTW","koKR"}) do
	WoWMock.locale = locale
	assert(Styles:FontPath("archivo")==STANDARD_TEXT_FONT,locale.." uses the game font")
end
WoWMock.locale = "deDE"
assert(Styles:FontPath("atkinson_bold"):find("AtkinsonHyperlegible%-Bold%.ttf$"))
WoWMock.locale = "enUS"
assert(Styles:FontPath("spectral")==STANDARD_TEXT_FONT,"unknown keys fall back")
local fs = UIParent:CreateFontString()
WoWMock.badfonts = {[Styles:FontPath("atkinson")]=true}
Styles:SetFont(fs,"atkinson",14)
assert(fs:GetFont()==STANDARD_TEXT_FONT, "unusable font falls back to the game font")
WoWMock.badfonts = nil

----------------------------------------------------------------- accent colour
local r,g,b = Styles:GetAccent()
assert(math.abs(r-0.96)<1e-9 and math.abs(g-0.55)<1e-9, "paladin pink from RAID_CLASS_COLORS")
WoWMock.class = "DRUID"; RAID_CLASS_COLORS.DRUID = nil
r,g,b = Styles:GetAccent()
assert(math.abs(g-0.49)<1e-9, "fallback table when the client has no colour")
CUSTOM_CLASS_COLORS = {DRUID={r=0.1,g=0.2,b=0.3}}
r = Styles:GetAccent()
assert(math.abs(r-0.1)<1e-9, "CUSTOM_CLASS_COLORS wins")
CUSTOM_CLASS_COLORS = nil
-- Custom colour: GoatQuest gold until one is picked; bad saved values fall back to gold.
GQ.db.profile.viewer_accent = "custom"
r,g,b = Styles:GetAccent()
assert(r==Styles.GOLD[1] and g==Styles.GOLD[2] and b==Styles.GOLD[3])
GQ.db.profile.viewer_accent_color = {r=0.2,g=0.4,b=0.6}
r,g,b = Styles:GetAccent()
assert(r==0.2 and g==0.4 and b==0.6)
GQ.db.profile.viewer_accent_color = {r="x"}
assert(Styles:GetAccent()==Styles.GOLD[1])
-- An old "gold" value reads as a custom colour.
GQ.db.profile.viewer_accent = "gold"
GQ.db.profile.viewer_accent_color = nil
assert(Styles:GetAccent()==Styles.GOLD[1])
GQ.db.profile.viewer_accent = nil
WoWMock.class = "PALADIN"

----------------------------------------------------------------- settings migration
-- Old per-style keys carry over; retired ones go; defaults (via __index) never count.
local defaults = {viewer_nav="arrow", viewer_scale=1, viewer_accent="class"}
local p = setmetatable({
	viewerstyle="halo", styles_scale=1.2, styles_accent="gold",
	styles_cb_point={"TOPLEFT","BOTTOMLEFT",100,600}, styles_cb_arrowpoint={"TOP","TOP",0,-90},
	styles_halo_offset=-40, styles_halo_x=12, styles_ownarrow=false, styles_cb_locked=true,
	styles_wind_offset=200, styles_wind_x=5, styles_wind_pinned=true, styles_halo_top_x=1, styles_halo_top_y=-30,
},{__index=defaults})
Styles.Migrate(p)
assert(rawget(p,"viewer_nav")=="halo","a Halo user keeps the halo")
assert(rawget(p,"viewer_scale")==1.2 and rawget(p,"viewer_accent")=="custom","the gold accent became a custom colour")
assert(rawget(p,"viewer_accent_color").r==Styles.GOLD[1] and rawget(p,"viewer_accent_color").b==Styles.GOLD[3])
assert(rawget(p,"viewer_point")[3]==100 and rawget(p,"viewer_arrowpoint")[4]==-90)
assert(rawget(p,"viewer_halo_offset")==-40 and rawget(p,"viewer_halo_x")==12)
for _,k in ipairs({"viewerstyle","styles_scale","styles_accent","styles_cb_point","styles_cb_arrowpoint","styles_halo_offset",
	"styles_halo_x","styles_ownarrow","styles_cb_locked","styles_wind_offset","styles_wind_x","styles_wind_pinned",
	"styles_halo_top_x","styles_halo_top_y"}) do
	assert(rawget(p,k)==nil,k.." cleared")
end
-- A gold accent saved under the new key migrates too, keeping a colour already picked.
p = setmetatable({viewer_accent="gold", viewer_accent_color={r=1,g=0,b=0}},{__index=defaults})
Styles.Migrate(p)
assert(rawget(p,"viewer_accent")=="custom" and rawget(p,"viewer_accent_color").r==1)
p = setmetatable({viewer_accent="class"},{__index=defaults})
Styles.Migrate(p)
assert(rawget(p,"viewer_accent")=="class" and rawget(p,"viewer_accent_color")==nil)
-- A value already under the new key wins; other styles leave the arrow.
p = setmetatable({viewerstyle="classbound", styles_scale=1.2, viewer_scale=0.8},{__index=defaults})
Styles.Migrate(p)
assert(rawget(p,"viewer_scale")==0.8 and rawget(p,"viewer_nav")==nil and p.viewer_nav=="arrow")
p = setmetatable({viewerstyle="halo", viewer_nav="arrow"},{__index=defaults})
Styles.Migrate(p)
assert(rawget(p,"viewer_nav")=="arrow","an explicit choice stays")

----------------------------------------------------------------- reset positions
local profile = GQ.db.profile
profile.viewer_point,profile.viewer_arrowpoint,profile.viewer_halo_x,profile.viewer_halo_offset = {},{},1,2
settings = probe.settings
Styles:ResetPositions()
assert(profile.viewer_point==nil and profile.viewer_arrowpoint==nil and profile.viewer_halo_x==nil and profile.viewer_halo_offset==nil)
assert(probe.settings==settings+1,"the viewer re-places its parts")

----------------------------------------------------------------- /gqviewer
local printed = {}
GQ.Print = function(_,msg) tinsert(printed,msg) end
assert(Styles:GetNav()=="arrow")
SlashCmdList.GOATQUESTVIEWER("halo")
assert(profile.viewer_nav=="halo" and Styles:GetNav()=="halo" and printed[#printed]=="styles_slash_nav")
SlashCmdList.GOATQUESTVIEWER("")
assert(Styles:GetNav()=="arrow","no word switches the navigation")
SlashCmdList.GOATQUESTVIEWER(" HALO ")
assert(Styles:GetNav()=="halo")
SlashCmdList.GOATQUESTVIEWER("bogus")
assert(printed[#printed]=="styles_slash_usage" and Styles:GetNav()=="halo")
SlashCmdList.GOATQUESTVIEWER("move")   -- no movers loaded here: nothing happens
profile.viewer_nav = "sideways"
assert(Styles:GetNav()=="arrow","unknown values mean the arrow")
profile.viewer_nav = nil
''')

# Startup during combat waits for the end of combat before touching the stock frames.
lua = runtime()
lua.execute(PROBE)
lua.execute(br'''
WoWMock.combat = true
StylesFixture.Startup()
assert(not Styles:IsDriving() and Styles.pending and GoatQuestFrameMaster:GetAlpha()==1)
assert(#WoWMock.blocked==0, "no protected calls attempted in combat")
WoWMock.combat = false
GQ:FireEvent("PLAYER_REGEN_ENABLED")
assert(Styles:IsDriving() and not Styles.pending and GoatQuestFrameMaster:GetAlpha()==0, "applied after combat")
''')
print("PASS viewer core: model, stock takeover, skin rebuild, combat deferral, visibility mirroring, arrow tap, "
      "migration, reset, fonts, accent, /gqviewer")
