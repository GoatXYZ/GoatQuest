local _,GQ = ...
local Styles = GQ.Styles
local L = GQ.L

-- Halo: navigation where the player's eyes already are. A ring at the
-- character's feet carries a notch that points toward the waypoint, with the
-- distance just outside it; on arrival the ring lights up in the accent and
-- says so. The GoatQuest viewer shows it in place of the arrow when the
-- navigation option is Halo, and tints it with the viewer's accent.
--
-- Addons cannot draw in the 3D world, so the ring is a flat overlay at a
-- fixed screen position: UIParent's centre plus an offset the player can
-- adjust (the Ring height option, or the movers for both directions), because
-- the default camera keeps the character near the middle of the screen. The
-- ring is a foreshortened ellipse, so "ahead" is its far (top) side and
-- "left" is its left end.
--
-- Everything here is a plain, unnamed, click-through frame.

local sin,cos,sqrt,atan2,floor,abs,pi = math.sin,math.cos,math.sqrt,math.atan2,math.floor,math.abs,math.pi
local type,tonumber = type,tonumber
local CreateFrame = CreateFrame

local Halo = {}
Styles.Halo = Halo

---------------------------------------------------------------------------
-- Look
---------------------------------------------------------------------------

local RING = {0.969,0.961,0.941,0.62}   -- #F7F5F0 at 62%
Halo.RING = RING

-- ring.tga is a 512x128 canvas holding a 250x58 ellipse whose 4.5px stroke is
-- drawn inward. RX/RY are that stroke's centre line once the texture is drawn
-- at RING_W x RING_H, so the notch sits exactly on the visible line.
local RING_W,RING_H = 280,70
local RX = RING_W*(250-2.25)/512    -- ~135.5
local RY = RING_H*(58-2.25)/128     -- ~30.5
Halo.RX,Halo.RY = RX,RY
Halo.DEFAULT_OFFSET = -90

-- Notch: an arc of dots on the ring, two chevrons and the distance outside it.
local DOTS = 9                      -- odd, so the middle dot sits on the point
local DOT_STEP = 5                  -- arc length between dot centres
local DOT_SIZE,DOT_UNDER = 6,10     -- dot.tga's disc fills 26/32 of the texture
local CHEV_SIZE,CHEV_UNDER = 24,30
local CHEV1,CHEV2,TEXT_OFF = 12,24,44
local ANGLE_EPS = 0.002             -- radians; smaller changes do not move anything
Halo.DOTS,Halo.DOT_STEP,Halo.CHEV1,Halo.CHEV2,Halo.TEXT_OFF = DOTS,DOT_STEP,CHEV1,CHEV2,TEXT_OFF

---------------------------------------------------------------------------
-- Pure maths (exposed for tests)
---------------------------------------------------------------------------

--- Point on the ground ellipse for a nav angle (radians relative to facing,
--- 0 = ahead = the far/top side, increasing counter-clockwise) and the unit
--- outward normal there. Returns x, y, nx, ny relative to the ring centre.
function Halo.EllipsePoint(angle,rx,ry)
	local s,c = sin(angle),cos(angle)
	-- Gradient of x²/rx² + y²/ry² at (-s*rx, c*ry), halved.
	local nx,ny = -s/rx,c/ry
	local len = sqrt(nx*nx+ny*ny)
	return -s*rx,c*ry,nx/len,ny/len
end

--- Rotation that turns an up-pointing texture to point along (nx,ny).
function Halo.NormalRotation(nx,ny)
	return atan2(ny,nx)-pi/2
end

local function Speed(t,rx,ry)
	local s,c = sin(t),cos(t)
	return sqrt(rx*rx*c*c+ry*ry*s*s)
end

--- Ellipse parameter reached by walking a signed arc length from parameter t
--- (midpoint step). Equal arc steps keep the notch the same length whether it
--- sits on the long front edge or wraps round the tight ends of the ellipse.
function Halo.ArcStep(t,rx,ry,dist)
	local mid = t+0.5*dist/Speed(t,rx,ry)
	return t+dist/Speed(mid,rx,ry)
end

---------------------------------------------------------------------------
-- Widget helpers
---------------------------------------------------------------------------

local function Shadow(fs,alpha)
	fs:SetShadowOffset(1,-1)
	fs:SetShadowColor(0,0,0,alpha or 0.9)
end

local function Place(region,parent,x,y)
	region:ClearAllPoints()
	region:SetPoint("CENTER",parent,"CENTER",x,y)
end

local function Tex(parent,layer,file,sublevel,size,r,g,b,a)
	local t = Styles:Texture(parent,layer,file,sublevel)
	if size then t:SetSize(size,size) end
	t:SetVertexColor(r,g,b,a)
	return t
end

---------------------------------------------------------------------------
-- Build
---------------------------------------------------------------------------

function Halo:Create()
	local root = CreateFrame("Frame",nil,UIParent)
	root:SetFrameStrata("LOW")
	root:SetAllPoints(UIParent)
	root:EnableMouse(false)
	self.root = root

	-- The feet anchor stays unscaled, so its offset is in plain UI units. The
	-- ring hung off it takes the size setting through its own SetScale.
	local feet = CreateFrame("Frame",nil,root)
	feet:SetSize(1,1)
	self.feet = feet

	local ring = CreateFrame("Frame",nil,feet)
	ring:SetSize(RING_W,RING_H)
	ring:SetPoint("CENTER",feet,"CENTER",0,0)
	self.ring = ring

	-- ring-shadow.tga is black already; the vertex alpha only sets its strength.
	self.ringShadow = Tex(ring,"BACKGROUND","ring-shadow.tga",0,nil,1,1,1,0.8)
	self.ringShadow:SetSize(RING_W,RING_H)
	self.ringShadow:SetPoint("CENTER",ring,"CENTER",0,0)
	self.ringLine = Tex(ring,"BORDER","ring.tga",0,nil,RING[1],RING[2],RING[3],RING[4])
	self.ringLine:SetSize(RING_W,RING_H)
	self.ringLine:SetPoint("CENTER",ring,"CENTER",0,0)

	-- Dark copies under the accent keep the notch readable on bright ground.
	self.dots,self.dotUnders = {},{}
	for i=1,DOTS do
		self.dotUnders[i] = Tex(ring,"ARTWORK","dot.tga",1,DOT_UNDER,0,0,0,0.55)
		self.dots[i] = Tex(ring,"OVERLAY","dot.tga",1,DOT_SIZE,1,1,1,1)
	end
	self.chevrons,self.chevUnders = {},{}
	for i=1,2 do
		self.chevUnders[i] = Tex(ring,"ARTWORK","vchev.tga",2,CHEV_UNDER,0,0,0,0.6)
		self.chevrons[i] = Tex(ring,"OVERLAY","vchev.tga",2,CHEV_SIZE,1,1,1,1)
	end

	local dist = Styles:Text(ring,"atkinson_bold",16,"OVERLAY","OUTLINE")
	dist:SetJustifyH("CENTER")
	dist:SetTextColor(1,1,1,1)
	Shadow(dist,0.65)
	self.distText = dist

	local here = Styles:Text(ring,"atkinson_bold",16,"OVERLAY","OUTLINE")
	here:SetJustifyH("CENTER")
	here:SetTextColor(1,1,1,1)
	Shadow(here,0.65)
	here:SetText(L["styles_here"])
	here:SetPoint("BOTTOM",ring,"CENTER",0,RY+6)
	self.hereText = here

	self.x,self.offset,self.scale = 0,Halo.DEFAULT_OFFSET,1
	self.accent = {1,1,1}
	self.notchShown = true
	self:SetNotchShown(false)
	self:SetArrived(false)
	return self
end

---------------------------------------------------------------------------
-- Settings
---------------------------------------------------------------------------

--- The feet anchor is unscaled, so its offsets are plain UI units.
function Halo:PlaceFeet()
	self.feet:ClearAllPoints()
	self.feet:SetPoint("CENTER",UIParent,"CENTER",self.x,self.offset)
end

--- enabled: navigation is Halo. The root stays under the viewer's visibility
--- control; only the ring inside it comes and goes.
function Halo:ApplySettings(scale,enabled)
	self.scale = scale or 1
	self.offset = tonumber(Styles:GetSetting("viewer_halo_offset",Halo.DEFAULT_OFFSET)) or Halo.DEFAULT_OFFSET
	self.x = tonumber(Styles:GetSetting("viewer_halo_x",0)) or 0
	self:PlaceFeet()
	-- The ring's size and its offsets from the feet grow together, while the
	-- feet stay where the player put them.
	self.ring:SetScale(self.scale)
	self.ring:SetShown(enabled and true or false)
	self.enabled = enabled and true or false
	self.lastAngle,self.lastDist = nil,nil
end

--- The notch, the chevrons and the arrived ring take the viewer's accent.
function Halo:Tint(r,g,b)
	local a = self.accent
	if a[1]==r and a[2]==g and a[3]==b then return end
	a[1],a[2],a[3] = r,g,b
	for i=1,DOTS do self.dots[i]:SetVertexColor(r,g,b,1) end
	for i=1,2 do self.chevrons[i]:SetVertexColor(r,g,b,i==1 and 1 or 0.75) end
	if self.arrived then self.ringLine:SetVertexColor(r,g,b,0.9) end
end

--- Movers (Movers.lua): the ring, by its centre.
function Halo:GetMover()
	self.mover = self.mover or {
		id="ring", label=L["styles_mover_ring"], region=self.ring, point="CENTER",
		Set=function(x,y)
			local p = Styles.Profile()
			p.viewer_halo_x,p.viewer_halo_offset = x-UIParent:GetWidth()/2,y-UIParent:GetHeight()/2
			self.x,self.offset = p.viewer_halo_x,p.viewer_halo_offset
			self:PlaceFeet()
		end,
		Reset=function()
			local p = Styles.Profile()
			p.viewer_halo_x,p.viewer_halo_offset = nil,nil
			self:ApplySettings(self.scale,self.enabled)
		end,
	}
	return self.mover
end

---------------------------------------------------------------------------
-- Navigation: the notch
---------------------------------------------------------------------------

function Halo:SetNotchShown(shown)
	if self.notchShown==shown then return end
	self.notchShown = shown
	for i=1,DOTS do
		self.dots[i]:SetShown(shown)
		self.dotUnders[i]:SetShown(shown)
	end
	for i=1,2 do
		self.chevrons[i]:SetShown(shown)
		self.chevUnders[i]:SetShown(shown)
	end
	self.distText:SetShown(shown)
	self.lastAngle = nil
end

function Halo:SetArrived(on)
	if self.arrived==on then return end
	self.arrived = on
	if on then
		local a = self.accent
		self.ringLine:SetVertexColor(a[1],a[2],a[3],0.9)
	else
		self.ringLine:SetVertexColor(RING[1],RING[2],RING[3],RING[4])
	end
	self.hereText:SetShown(on)
end

function Halo:PlaceNotch(angle)
	local ring = self.ring
	local px,py,nx,ny = Halo.EllipsePoint(angle,RX,RY)

	local mid = (DOTS+1)/2
	Place(self.dots[mid],ring,px,py)
	Place(self.dotUnders[mid],ring,px,py)
	for dir=-1,1,2 do
		local t = angle
		for k=1,mid-1 do
			t = Halo.ArcStep(t,RX,RY,dir*DOT_STEP)
			local x,y = -sin(t)*RX,cos(t)*RY
			local i = mid+dir*k
			Place(self.dots[i],ring,x,y)
			Place(self.dotUnders[i],ring,x,y)
		end
	end

	local rot = Halo.NormalRotation(nx,ny)
	local off = CHEV1
	for i=1,2 do
		local x,y = px+nx*off,py+ny*off
		Place(self.chevrons[i],ring,x,y)
		Place(self.chevUnders[i],ring,x,y)
		self.chevrons[i]:SetRotation(rot)
		self.chevUnders[i]:SetRotation(rot)
		off = CHEV2
	end

	Place(self.distText,ring,px+nx*TEXT_OFF,py+ny*TEXT_OFF)
end

--- nav is the Styles.nav tap, or nil when nothing should point (the spell
--- arrow is up, or navigation is the arrow).
function Halo:UpdateNav(nav)
	local mode = nav and nav.mode
	local angle = nav and nav.angle
	if mode~="travel" or type(angle)~="number" then
		self:SetNotchShown(false)
		self:SetArrived(mode=="arrived")
		return
	end
	self:SetArrived(false)
	self:SetNotchShown(true)

	local dist = nav.dist
	local rounded = type(dist)=="number" and floor(dist+0.5) or -1
	if rounded~=self.lastDist then
		self.lastDist = rounded
		self.distText:SetText(rounded>=0 and Styles.FormatDistance(dist) or "")
	end

	local last = self.lastAngle
	if last and abs(angle-last)<ANGLE_EPS then return end
	self.lastAngle = angle
	self:PlaceNotch(angle)
end
