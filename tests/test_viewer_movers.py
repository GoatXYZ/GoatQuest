"""GoatQuest viewer movers: a box over the panel and over the arrow or the halo
ring, dragging (live, and saved in the viewer's keys), right-click and Reset
all, visibility while open, navigation switches, combat and /gqviewer move."""
import os
import sys
from pathlib import Path

sys.path.insert(0, str(Path(os.environ.get("TEMP", ".")) / "goatquest-lua-tests"))
from lupa.lua51 import LuaRuntime

ROOT = Path(__file__).resolve().parents[1]

lua = LuaRuntime(encoding=None, unpack_returned_tuples=True)
lua.globals()[b"root"] = str(ROOT).replace("\\", "/").encode()
lua.execute(b'assert(loadfile(root.."/tests/wowmock.lua"))()')
lua.execute(b'assert(loadfile(root.."/tests/styles_fixture.lua"))()')
lua.execute(br'''
local F = StylesFixture
local abs = math.abs
local function near(a,b,eps) return type(a)=="number" and type(b)=="number" and abs(a-b)<(eps or 1e-6) end

-- A minimal GameTooltip that records what is shown.
local tip = {lines={}}
function tip:SetOwner(owner) self.owner = owner end
function tip:SetText(t) self.lines = {t} end
function tip:AddLine(t) tinsert(self.lines,t) end
function tip:Show() self.shown = true end
function tip:Hide() self.shown = false end
function tip:IsOwned(owner) return self.owner==owner end
GameTooltip = tip
local printed = {}
GQ.Print = function(_,msg) tinsert(printed,msg) end

-- Any global created from here on is a leak.
local before, leaks = {}, {}
for k in pairs(_G) do before[k] = true end
setmetatable(_G,{__newindex=function(t,k,v) if k~="SLASH_GOATQUESTVIEWER1" then tinsert(leaks,tostring(k)) end rawset(t,k,v) end})

F.LoadViewer()
local Styles = GQ.Styles
local Movers = Styles.Movers
local W,H = UIParent:GetWidth(),UIParent:GetHeight()

--- The box sits over its part, pinned by the part's point, and is at least as big.
local function covers(box,region,point)
	local l,b,w,h = Movers.RegionRect(region)
	local bl,bb,bw,bh = box:GetRect()
	local px,py = Movers.PointOffset(point,w,h)
	local qx,qy = Movers.PointOffset(point,bw,bh)
	return near(l+px,bl+qx) and near(b+py,bb+qy) and bw>=w-1e-6 and bh>=h-1e-6
end
local function drop(box,point,x,y)
	box:RunScript("OnDragStart")
	assert(box.dragging and box.moving)
	-- The client moves the box with the cursor.
	box:ClearAllPoints()
	box:SetPoint(point,UIParent,"BOTTOMLEFT",x,y)
end
local function alpha(tex) return select(4,tex:GetVertexColor()) end
local function labels()
	local t = {}
	for i,box in ipairs(Movers.boxes.used) do t[i] = box.label:GetText() end
	return table.concat(t,",")
end

----------------------------------------------------------------- geometry helpers
assert(select(1,Movers.PointOffset("TOPLEFT",10,20))==0 and select(2,Movers.PointOffset("TOPLEFT",10,20))==20)
assert(select(1,Movers.PointOffset("BOTTOM",10,20))==5 and select(2,Movers.PointOffset("BOTTOM",10,20))==0)
assert(select(1,Movers.PointOffset("RIGHT",10,20))==10 and select(2,Movers.PointOffset("CENTER",10,20))==10)

----------------------------------------------------------------- before the viewer is up
assert(Movers:Open()==false and not Movers:IsOpen() and printed[#printed]=="styles_movers_notready")

----------------------------------------------------------------- open
F.Startup()
F.Tick(3)
local viewer = Styles:Get()
assert(Movers:Open() and Movers:IsOpen() and Styles.forceShown)
assert(Movers:Open(),"opening twice is harmless")
local bar = Movers.bar
assert(bar:IsShown() and bar:GetFrameStrata()=="FULLSCREEN_DIALOG" and bar.events.PLAYER_REGEN_DISABLED)
assert(Movers.title:GetText()=="styles_movers_title")
assert(labels()=="styles_mover_panel,styles_mover_arrow")
local panelBox,arrowBox = Movers.boxes.used[1],Movers.boxes.used[2]
assert(panelBox:IsShown() and panelBox:IsMouseEnabled() and panelBox:IsMovable() and panelBox:IsClampedToScreen())
assert(panelBox.drag[1]=="LeftButton" and panelBox.clicks[1]=="RightButtonUp" and panelBox:GetFrameStrata()=="DIALOG")
F.Tick(1)
assert(covers(panelBox,viewer.panel,"TOPLEFT") and covers(arrowBox,viewer.arrow,"TOPLEFT"))
local l,b,w,h = panelBox:GetRect()
assert(near(l,W-24-300) and near(b+h,H-200) and near(w,300) and near(h,viewer.panel:GetHeight()),"the default panel spot")

-- Boxes follow their parts as they resize, and never shrink below a grab size.
viewer.panel:SetHeight(77)
Movers:Update()
assert(near(select(4,panelBox:GetRect()),77) and covers(panelBox,viewer.panel,"TOPLEFT"))
viewer.panel:SetHeight(10)
Movers:Update()
assert(select(4,panelBox:GetRect())==24 and covers(panelBox,viewer.panel,"TOPLEFT"),"small parts get a usable box")
Styles:MarkDirty()
F.Tick(2)

-- With the viewer hidden or faded, it stays up while the movers are open.
GQ.Frame:SetAlpha(0.3)
F.Tick(1)
assert(viewer.panel:GetAlpha()==1)
GQ.Frame:SetAlpha(1)
GQ.Frame:Hide()
F.Tick(1)
assert(viewer.panel:IsShown() and viewer.arrow:IsShown())

----------------------------------------------------------------- panel and arrow
-- Dragging: the panel follows the box every frame; the drop is saved like a header drag.
drop(panelBox,"TOPLEFT",100.4,600.6)
F.Tick(1)
local p,rel,rp,x,y = viewer.panel:GetPoint(1)
assert(p=="TOPLEFT" and rel==UIParent and rp=="BOTTOMLEFT" and near(x,100.4) and near(y,600.6),"live follow")
panelBox:RunScript("OnDragStop")
assert(not panelBox.dragging and not panelBox.moving)
local saved = GQ.db.profile.viewer_point
assert(saved[1]=="TOPLEFT" and saved[2]=="BOTTOMLEFT" and saved[3]==100 and saved[4]==601,"saved, rounded")
F.Tick(1)
assert(covers(panelBox,viewer.panel,"TOPLEFT"),"the box goes back over the panel")

-- Scaled parts: the box covers the scaled arrow, and the drop is saved in its own scale.
GQ.db.profile.viewer_scale = 1.25
Styles:ApplySettings()
F.Tick(1)
l,b,w,h = arrowBox:GetRect()
assert(near(w,220*1.25) and near(h,90*1.25) and covers(arrowBox,viewer.arrow,"TOPLEFT"))
drop(arrowBox,"TOPLEFT",500,700)
arrowBox:RunScript("OnDragStop")
saved = GQ.db.profile.viewer_arrowpoint
assert(saved[1]=="TOPLEFT" and saved[3]==500/1.25 and saved[4]==700/1.25)
l,b,w,h = Movers.RegionRect(viewer.arrow)
assert(near(l,500) and near(b+h,700),"the arrow lands where the box was dropped")

-- The viewer lock is for dragging the parts themselves; the movers ignore it.
GQ.db.profile.windowlocked = true
Styles:ApplySettings()
drop(arrowBox,"TOPLEFT",520,700)
arrowBox:RunScript("OnDragStop")
assert(GQ.db.profile.viewer_arrowpoint[3]==520/1.25)
GQ.db.profile.windowlocked = nil
Styles:ApplySettings()

-- Hover and tooltip.
panelBox:RunScript("OnEnter")
assert(tip.shown and tip.owner==panelBox and tip.lines[1]=="styles_mover_panel" and tip.lines[2]=="styles_movers_tip")
assert(near(alpha(panelBox.fill),0.4))
panelBox:RunScript("OnLeave")
assert(not tip.shown and near(alpha(panelBox.fill),0.22))

-- Right-click puts one part back; Reset all puts back every part.
arrowBox:RunScript("OnClick","LeftButton")
assert(GQ.db.profile.viewer_arrowpoint,"only a right-click resets")
arrowBox:RunScript("OnClick","RightButton")
assert(GQ.db.profile.viewer_arrowpoint==nil and GQ.db.profile.viewer_point)
p,rel,rp,x,y = viewer.arrow:GetPoint(1)
assert(p=="TOP" and rp=="TOP" and x==0 and y==-84)
Movers.resetBtn:Click()
assert(GQ.db.profile.viewer_point==nil)
p,rel,rp,x,y = viewer.panel:GetPoint(1)
assert(p=="TOPRIGHT" and x==-24 and y==-200)
F.Tick(1)
assert(covers(panelBox,viewer.panel,"TOPLEFT") and covers(arrowBox,viewer.arrow,"TOPLEFT"))

----------------------------------------------------------------- switching navigation while open
GQ.db.profile.viewer_nav = "halo"
Styles:ApplySettings()
assert(Movers:IsOpen() and labels()=="styles_mover_panel,styles_mover_ring","the arrow's box becomes the ring's")
local ringBox = Movers.boxes.used[2]
local halo = viewer.halo
F.Tick(1)
assert(covers(ringBox,halo.ring,"CENTER"))
l,b,w,h = ringBox:GetRect()
assert(near(w,280*1.25) and near(h,70*1.25) and near(l+w/2,W/2) and near(b+h/2,H/2-90))
drop(ringBox,"CENTER",W/2+150,H/2-120)
F.Tick(1)
p,rel,rp,x,y = halo.feet:GetPoint(1)
assert(p=="CENTER" and rel==UIParent and near(x,150) and near(y,-120),"live follow")
ringBox:RunScript("OnDragStop")
local hx,ho = GQ.db.profile.viewer_halo_x,GQ.db.profile.viewer_halo_offset
assert(near(hx,150,0.5) and ho==-120,"saved in the Ring height key, in screen units")
Styles:ApplySettings()
assert(select(4,halo.feet:GetPoint(1))==hx,"a settings pass keeps it")
ringBox:RunScript("OnClick","RightButton")
assert(GQ.db.profile.viewer_halo_x==nil and GQ.db.profile.viewer_halo_offset==nil)
assert(select(4,halo.feet:GetPoint(1))==0 and select(5,halo.feet:GetPoint(1))==-90)
-- An unrelated settings change keeps the same boxes.
Styles:ApplySettings()
assert(Movers.boxes.used[2]==ringBox)
GQ.db.profile.viewer_nav = nil
Styles:ApplySettings()
assert(labels()=="styles_mover_panel,styles_mover_arrow")
panelBox,arrowBox = Movers.boxes.used[1],Movers.boxes.used[2]

----------------------------------------------------------------- Done mid-drag
-- The drop is kept, and the hidden viewer hides again.
drop(panelBox,"TOPLEFT",200,500)
Movers.doneBtn:Click()
assert(not Movers:IsOpen() and not bar:IsShown() and not panelBox:IsShown() and not Styles.forceShown)
assert(GQ.db.profile.viewer_point[3]==200/1.25,"closing mid-drag keeps the drop")
assert(not viewer.panel:IsShown() and not viewer.arrow:IsShown())
GQ.Frame:Show()
F.Tick(2)
assert(viewer.panel:IsShown())
-- A later settings pass does not reopen anything.
Styles:ApplySettings()
assert(not Movers:IsOpen() and not bar:IsShown())
GQ.db.profile.viewer_point = nil

----------------------------------------------------------------- /gqviewer move
SlashCmdList.GOATQUESTVIEWER("move")
assert(Movers:IsOpen())
SlashCmdList.GOATQUESTVIEWER(" MOVE ")
assert(not Movers:IsOpen())

----------------------------------------------------------------- combat
SlashCmdList.GOATQUESTVIEWER("move")
GQ.Frame:Hide()
F.Tick(1)
assert(viewer.panel:IsShown(),"open movers keep the viewer up")
panelBox = Movers.boxes.used[1]
drop(panelBox,"TOPLEFT",300,450)
WoWMock.combat = true
bar:RunScript("OnEvent","PLAYER_REGEN_DISABLED")
assert(not Movers:IsOpen() and printed[#printed]=="styles_movers_combat_closed")
assert(GQ.db.profile.viewer_point[3]==300/1.25,"combat mid-drag keeps the drop")
assert(not viewer.panel:IsShown() and not panelBox:IsShown())
local count = #printed
bar:RunScript("OnEvent","PLAYER_REGEN_DISABLED")
assert(#printed==count,"closed movers stay quiet")
assert(Movers:Open()==false and printed[#printed]=="styles_movers_combat")
SlashCmdList.GOATQUESTVIEWER("move")
assert(not Movers:IsOpen())
WoWMock.combat = false
GQ.Frame:Show()
F.Tick(1)
assert(#WoWMock.blocked==0,"no protected calls: "..table.concat(WoWMock.blocked,","))

setmetatable(_G,nil)
for k in pairs(_G) do assert(before[k] or k=="SLASH_GOATQUESTVIEWER1","global leaked: "..tostring(k)) end
assert(#leaks==0,"globals written: "..table.concat(leaks,","))
''')
print("PASS viewer movers: boxes over the panel and the arrow or ring, live drag and saved drops, scale, "
      "minimum size, right-click/Reset all, forced visibility, navigation switch while open, Done mid-drag, "
      "/gqviewer move, combat, no protected calls or globals")
