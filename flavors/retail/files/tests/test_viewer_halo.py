"""Halo navigation: the ring at the character's feet that the GoatQuest viewer
shows instead of the arrow. Ellipse maths, notch geometry, arrival, accent
tint, ring height, horizontal position and size, click-through and hidden
while navigation is the arrow."""
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from gqtest import lua_runtime  # noqa: E402


lua = lua_runtime()
lua.execute(b'assert(loadfile(root.."/tests/wowmock.lua"))()')
lua.execute(b'assert(loadfile(root.."/tests/styles_fixture.lua"))()')
lua.execute(br'''
local F = StylesFixture
GQ.L.styles_here = "You're here"
local abs,pi = math.abs,math.pi
local function near(a,b,eps) return type(a)=="number" and type(b)=="number" and abs(a-b)<(eps or 1e-6) end
local function point(region,i) return region:GetPoint(i or 1) end
local function colour(region) local c = region.color or {1,1,1,1} return c[1],c[2],c[3],c[4] end
local PALADIN = {0.96,0.55,0.73}
local function isAccent(region,c)
	c = c or PALADIN
	local r,g,b = colour(region)
	return near(r,c[1],1e-3) and near(g,c[2],1e-3) and near(b,c[3],1e-3)
end

local globalsBefore = {}
for k in pairs(_G) do globalsBefore[k] = true end

GQ.db.profile.viewer_nav = "halo"
F.LoadViewer()
F.Startup()
F.Tick(3)
local Styles,viewer = GQ.Styles,GQ.Styles:Get()
local H = Styles.Halo
local arrow = GQ.Pointer.ArrowFrame
assert(viewer.halo==H and viewer.nav=="halo" and arrow:GetAlpha()==0)

----------------------------------------------------------------- overlay root
local root = H.root
assert(root:IsShown() and root:GetFrameStrata()=="LOW")
assert(root:GetParent()==UIParent and root:GetNumPoints()==2 and root.points[1][2]==UIParent, "full-screen overlay")
local function walk(f,fn) fn(f) for _,c in ipairs(f.children or {}) do walk(c,fn) end end
walk(root,function(f)
	assert(not f.mouse, "click-through: nothing under the root takes the mouse")
	assert(not f.isProtected, "no secure frames")
end)

-- Feet anchor: UIParent centre plus the default offset.
local p,rel,rp,x,y = point(H.feet)
assert(p=="CENTER" and rel==UIParent and rp=="CENTER" and x==0 and y==-90, "default offset -90: "..tostring(y))
assert(H.feet:GetScale()==1)

-- Ring: ring.tga over ring-shadow.tga, white at 62%, centred on the feet.
assert(H.ringLine:GetTexture():find("Styles\\Textures\\ring%.tga$") and H.ringShadow:GetTexture():find("ring%-shadow%.tga$"))
assert(H.ringLine.width==280 and H.ringLine.height==70 and H.ring:IsShown())
assert(H.ringShadow.layer=="BACKGROUND" and H.ringLine.layer=="BORDER")
local r,g,b,a = colour(H.ringLine)
assert(near(a,0.62) and r>0.9 and g>0.9 and b>0.9)
p,rel = point(H.ring)
assert(p=="CENTER" and rel==H.feet)
assert(near(H.RX,280*247.75/512) and near(H.RY,70*55.75/128), "radii follow the stroke centre line")
-- The meters and top line of the old Halo style are gone: the panel shows progress.
assert(H.meters==nil and H.pill==nil)

----------------------------------------------------------------- ellipse maths
local RX,RY = H.RX,H.RY
local x0,y0,nx0,ny0 = H.EllipsePoint(0,RX,RY)
assert(near(x0,0) and near(y0,RY) and near(nx0,0) and near(ny0,1), "ahead = far side (top)")
local x1,y1,nx1,ny1 = H.EllipsePoint(pi/2,RX,RY)
assert(near(x1,-RX) and near(y1,0) and near(nx1,-1) and near(ny1,0), "left (counter-clockwise)")
local x2,y2,nx2,ny2 = H.EllipsePoint(pi,RX,RY)
assert(near(x2,0) and near(y2,-RY) and near(nx2,0) and near(ny2,-1), "behind = near side (bottom)")
local x3,y3,nx3 = H.EllipsePoint(-pi/2,RX,RY)
assert(near(x3,RX) and near(y3,0) and near(nx3,1))
for i=0,35 do
	local t = i*pi/18+0.1
	local x,y,nx,ny = H.EllipsePoint(t,RX,RY)
	assert(near(x*x/(RX*RX)+y*y/(RY*RY),1), "on the ellipse")
	assert(near(nx*nx+ny*ny,1), "unit normal")
	assert(nx*x+ny*y>0, "normal points outward")
	assert(near(nx*(-math.cos(t)*RX)+ny*(-math.sin(t)*RY),0,1e-9), "perpendicular to the tangent")
	local t2 = H.ArcStep(t,RX,RY,5)
	local xa,ya = -math.sin(t2)*RX,math.cos(t2)*RY
	local chord = math.sqrt((xa-x)^2+(ya-y)^2)
	assert(chord>4.6 and chord<=5.001, "arc step "..chord)
end
assert(near(H.NormalRotation(0,1),0) and near(H.NormalRotation(-1,0),pi/2) and near(H.NormalRotation(1,0),-pi/2))

----------------------------------------------------------------- notch
assert(not H.chevrons[1]:IsShown() and not H.dots[1]:IsShown(), "no notch before the arrow reports")
arrow:ShowTraveling(0.05, pi/2, 84)
F.Tick(2)
assert(not viewer.arrowBody:IsShown(), "the arrow stays hidden while the halo navigates")
for i=1,2 do
	local c,u = H.chevrons[i],H.chevUnders[i]
	assert(c:IsShown() and u:IsShown() and isAccent(c) and c:GetTexture():find("vchev%.tga$"))
	local off = i==1 and 12 or 24
	p,rel,rp,x,y = point(c)
	assert(p=="CENTER" and rel==H.ring and near(x,-RX-off) and near(y,0), "chevron "..i)
	assert(near(c:GetRotation(),pi/2) and near(u:GetRotation(),pi/2), "points left along the normal")
	assert(select(4,point(u))==x and u.width>c.width)
	assert(u.color[1]==0 and select(4,colour(u))>0.4, "dark underlay")
end
assert(H.chevrons[1].width==24 and select(4,colour(H.chevrons[2]))<1, "outer chevron lighter")
local dist = H.distText
assert(dist:IsShown() and dist:GetText()=="84 yd")
assert(dist:GetFont():find("AtkinsonHyperlegible%-Bold") and select(2,dist:GetFont())==16 and select(3,dist:GetFont())=="OUTLINE")
p,rel,rp,x,y = point(dist)
assert(rel==H.ring and near(x,-RX-44) and near(y,0))
-- Dots: an accent arc centred on the point, on the ring, evenly spaced, with underlays.
local mid = (H.DOTS+1)/2
assert(H.DOTS>=7 and H.DOTS%2==1)
p,rel,rp,x,y = point(H.dots[mid])
assert(near(x,-RX) and near(y,0))
local prevx,prevy
for i=1,H.DOTS do
	local dt,du = H.dots[i],H.dotUnders[i]
	assert(dt:IsShown() and du:IsShown() and isAccent(dt) and du.color[1]==0 and du.width>dt.width)
	local _,_,_,dx,dy = point(dt)
	assert(near(dx*dx/(RX*RX)+dy*dy/(RY*RY),1,1e-6), "dot on the ring")
	assert(select(4,point(du))==dx and select(5,point(du))==dy)
	local _,_,_,mx,my = point(H.dots[H.DOTS+1-i])
	assert(near(dx,mx) and near(dy,-my), "symmetric about the point")
	if prevx then
		local chord = math.sqrt((dx-prevx)^2+(dy-prevy)^2)
		assert(chord>H.DOT_STEP*0.8 and chord<=H.DOT_STEP+1e-6)
	end
	prevx,prevy = dx,dy
end
assert(near(H.ringLine.color[4],0.62), "ring stays white while travelling")

-- Straight ahead: the notch sits on the far side and points up.
arrow:ShowTraveling(0.05, 0, 30.4)
F.Tick(2)
p,rel,rp,x,y = point(H.chevrons[2])
assert(near(x,0) and near(y,RY+24) and near(H.chevrons[2]:GetRotation(),0))
assert(dist:GetText()=="30 yd" and near(select(5,point(dist)),RY+44))
-- Small jitter does not move anything; distance still updates.
arrow:ShowTraveling(0.05, 1.0, 50)
F.Tick(2)
local cx = select(4,point(H.chevrons[1]))
arrow:ShowTraveling(0.05, 1.0005, 49)
F.Tick(2)
assert(select(4,point(H.chevrons[1]))==cx and dist:GetText()=="49 yd")

----------------------------------------------------------------- arrived
arrow:ShowArrived()
F.Tick(2)
assert(isAccent(H.ringLine) and near(H.ringLine.color[4],0.9), "arrived: the ring lights up in the accent")
assert(not H.chevrons[1]:IsShown() and not H.dots[mid]:IsShown() and not dist:IsShown(), "notch hidden")
assert(H.hereText:IsShown() and H.hereText:GetText()=="You're here")
p,rel,rp,x,y = point(H.hereText)
assert(p=="BOTTOM" and rel==H.ring and x==0 and y>RY, "at the far side of the ring")
arrow:ShowTraveling(0.05, pi/2, 84)
F.Tick(2)
assert(not isAccent(H.ringLine) and not H.hereText:IsShown() and H.chevrons[1]:IsShown())
assert(near(select(4,point(H.chevrons[1])),-RX-12), "re-placed after being hidden")

-- Error and special modes hide the notch; the ring stays.
arrow:ShowError()
F.Tick(2)
assert(not H.chevrons[1]:IsShown() and H.ring:IsShown())
arrow:ShowTraveling(0.05, pi/2, 84)
F.Tick(2)
assert(H.chevrons[1]:IsShown())

----------------------------------------------------------------- accent
GQ.db.profile.viewer_accent = "custom"
Styles:ApplySettings()
arrow:ShowArrived()
F.Tick(2)
assert(isAccent(H.dots[1],Styles.GOLD) and isAccent(H.ringLine,Styles.GOLD))
GQ.db.profile.viewer_accent = nil
Styles:ApplySettings()
F.Tick(2)
assert(isAccent(H.ringLine) and isAccent(H.dots[1]), "re-tint while arrived updates the ring")
arrow:ShowTraveling(0.05, pi/2, 84)
F.Tick(2)

----------------------------------------------------------------- settings
GQ.db.profile.viewer_halo_offset = -40
GQ.db.profile.viewer_halo_x = 25
Styles:ApplySettings()
p,rel,rp,x,y = point(H.feet)
assert(H.feet:GetNumPoints()==1 and rel==UIParent and x==25 and y==-40, "Ring height and the mover's x move the anchor")
GQ.db.profile.viewer_halo_offset,GQ.db.profile.viewer_halo_x = nil,nil
Styles:ApplySettings()
assert(select(4,point(H.feet))==0 and select(5,point(H.feet))==-90)

GQ.db.profile.viewer_scale = 1.25
Styles:ApplySettings()
assert(H.ring:GetScale()==1.25 and H.feet:GetScale()==1 and root:GetScale()==1, "the ring scales, the anchor does not")
assert(near(H.ring:GetEffectiveScale()*select(2,H.distText:GetFont()),20), "glyphs grow with the size setting")
GQ.db.profile.viewer_scale = nil
Styles:ApplySettings()
assert(H.ring:GetScale()==1)

----------------------------------------------------------------- mover
local defs = viewer:GetMovers()
assert(#defs==2 and defs[1].id=="panel" and defs[2]==H:GetMover() and defs[2].region==H.ring and defs[2].point=="CENTER")
assert(defs[2].label=="styles_mover_ring")
defs[2].Set(UIParent:GetWidth()/2+60,UIParent:GetHeight()/2-150)
p,rel,rp,x,y = point(H.feet)
assert(near(x,60) and near(y,-150) and near(GQ.db.profile.viewer_halo_x,60) and near(GQ.db.profile.viewer_halo_offset,-150))
defs[2].Reset()
assert(GQ.db.profile.viewer_halo_x==nil and select(5,point(H.feet))==-90 and H.ring:IsShown())

----------------------------------------------------------------- navigation back to the arrow
GQ.db.profile.viewer_nav = "arrow"
Styles:ApplySettings()
F.Tick(2)
assert(not H.ring:IsShown() and root:IsShown(), "the ring goes; its root stays under visibility control")
assert(viewer.arrowBody:IsShown() and viewer:GetMovers()[2].id=="arrow")
GQ.db.profile.viewer_nav = "halo"
Styles:ApplySettings()
F.Tick(2)
assert(H.ring:IsShown() and H.chevrons[1]:IsShown() and not viewer.arrowBody:IsShown())

----------------------------------------------------------------- visibility
GQ.Frame:Hide()
F.Tick(1)
assert(not root:IsShown(), "mirrors the stock viewer")
GQ.Frame:Show()
F.Tick(1)
assert(root:IsShown())

assert(#WoWMock.blocked==0, "no protected calls")
local leaked = {}
for k in pairs(_G) do if not globalsBefore[k] and k~="SLASH_GOATQUESTVIEWER1" then tinsert(leaked,tostring(k)) end end
assert(#leaked==0, "new globals: "..table.concat(leaked,", "))
''')
print("PASS halo navigation: ring/notch geometry, arrival, accent tint, ring height and x, size, mover, "
      "arrow/halo switch, click-through, no protected calls or globals")
