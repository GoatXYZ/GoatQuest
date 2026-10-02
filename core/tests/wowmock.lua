-- A small WoW UI API mock for offline tests (Lua 5.1 via lupa).
-- It models what the viewer styles rely on: frame hierarchy, shown/visible
-- state, alpha, scale, points, sizes, scripts and hooks, textures, font
-- strings, cooldowns, secure-hook semantics and combat lockdown.
-- Geometry is deliberately simple: sizes are whatever was set, and
-- rectangles resolve only through a frame's first anchor.

local Mock = {}
WoWMock = Mock

Mock.time = 0
Mock.combat = false
Mock.alt = false
Mock.shift = false
Mock.locale = "enUS"
Mock.class = "PALADIN"
Mock.timers = {}
Mock.blocked = {}   -- protected calls attempted in combat

function GetTime() return Mock.time end
function InCombatLockdown() return Mock.combat end
function IsAltKeyDown() return Mock.alt end
function IsShiftKeyDown() return Mock.shift end
function IsControlKeyDown() return false end
function GetLocale() return Mock.locale end
function UnitClass() return "Paladin",Mock.class end
function GetScreenWidth() return 1365.33 end
function GetScreenHeight() return 768 end
function GetPhysicalScreenSize() return 1920,1080 end
function GetCursorPosition() return 0,0 end
STANDARD_TEXT_FONT = "Fonts\\FRIZQT__.TTF"
SlashCmdList = {}
tinsert,tremove,wipe = table.insert,table.remove,function(t) for k in pairs(t) do t[k]=nil end return t end
strtrim = function(s) return (s:gsub("^%s+",""):gsub("%s+$","")) end
RAID_CLASS_COLORS = {
	PALADIN={r=0.96,g=0.55,b=0.73}, MAGE={r=0.25,g=0.78,b=0.92}, SHAMAN={r=0,g=0.44,b=0.87},
	WARRIOR={r=0.78,g=0.61,b=0.43}, ROGUE={r=1,g=0.96,b=0.41},
}
C_Timer = {After=function(delay,fn) tinsert(Mock.timers,{at=Mock.time+delay,fn=fn}) end}
C_Map = {GetMapInfo=function(id) return {name=Mock.mapnames and Mock.mapnames[id] or "Westfall"} end}

function Mock.advance(dt)
	Mock.time = Mock.time + dt
	local due = {}
	for i=#Mock.timers,1,-1 do
		if Mock.timers[i].at<=Mock.time then tinsert(due,tremove(Mock.timers,i)) end
	end
	for _,t in ipairs(due) do t.fn() end
end

function hooksecurefunc(tbl,method,hook)
	if type(tbl)=="string" then tbl,method,hook = _G,tbl,method end
	local orig = tbl[method]
	assert(type(orig)=="function","hooksecurefunc: no function "..tostring(method))
	tbl[method] = function(...)
		local r = {orig(...)}
		hook(...)
		return unpack(r)
	end
end

---------------------------------------------------------------------------
-- Regions
---------------------------------------------------------------------------

local Region = {}
Region.__index = Region

local function new(kind,parent,proto)
	local o = setmetatable({
		kind=kind, parent=parent, shown=true, alpha=1, scale=1, width=0, height=0,
		points={}, scripts={}, hooks={}, children={},
	},proto)
	if parent and parent.children then tinsert(parent.children,o) end
	return o
end

local function protected(self,what)
	if Mock.combat and self.isProtected then
		tinsert(Mock.blocked,what)
		return true
	end
end

function Region:GetObjectType() return self.kind end
function Region:GetParent() return self.parent end
function Region:SetParent(p) self.parent = p end
function Region:Show() self:SetShown(true) end
function Region:Hide() self:SetShown(false) end
function Region:SetShown(shown)
	shown = not not shown
	if protected(self,"SetShown") then return end
	if self.shown==shown then return end
	self.shown = shown
	if self.RunScript then self:RunScript(shown and "OnShow" or "OnHide") end
end
function Region:IsShown() return self.shown end
function Region:IsVisible()
	if not self.shown then return false end
	if self.parent then return self.parent:IsVisible() end
	return true
end
function Region:SetAlpha(a) self.alpha = a end
function Region:GetAlpha() return self.alpha end
function Region:GetEffectiveAlpha()
	return self.alpha*(self.parent and self.parent:GetEffectiveAlpha() or 1)
end
function Region:SetScale(s) self.scale = s end
function Region:GetScale() return self.scale end
function Region:GetEffectiveScale()
	return self.scale*(self.parent and self.parent.GetEffectiveScale and self.parent:GetEffectiveScale() or 1)
end
function Region:SetSize(w,h) self.width,self.height = w,h end
function Region:SetWidth(w) self.width = w end
function Region:SetHeight(h) self.height = h end
function Region:GetWidth() return self.width end
function Region:GetHeight() return self.height end
function Region:GetSize() return self.width,self.height end
function Region:ClearAllPoints()
	if protected(self,"ClearAllPoints") then return end
	self.points = {}
end
function Region:SetPoint(point,rel,relpoint,x,y)
	if protected(self,"SetPoint") then return end
	if type(rel)=="number" then rel,relpoint,x,y = nil,point,rel,relpoint end
	if type(relpoint)=="number" then relpoint,x,y = point,relpoint,x end
	tinsert(self.points,{point,rel or self.parent,relpoint or point,x or 0,y or 0})
end
function Region:SetAllPoints(rel)
	self.points = {{"TOPLEFT",rel or self.parent,"TOPLEFT",0,0},{"BOTTOMRIGHT",rel or self.parent,"BOTTOMRIGHT",0,0}}
	local r = rel or self.parent
	if r then self.width,self.height = r.width,r.height end
end
function Region:GetPoint(i)
	local p = self.points[i or 1]
	if p then return p[1],p[2],p[3],p[4],p[5] end
end
function Region:GetNumPoints() return #self.points end
function Region:SetDrawLayer(layer,sub) self.layer,self.sublayer = layer,sub end
function Region:SetVertexColor(r,g,b,a) self.color = {r,g,b,a or 1} end
function Region:GetVertexColor() local c = self.color or {1,1,1,1} return c[1],c[2],c[3],c[4] end
-- Rectangles resolve from the first anchor (or a SetAllPoints pair) in
-- UIParent units, honouring scale; enough for frames placed by one point.
local function PointOffset(point,w,h)
	local x = point:find("LEFT") and 0 or point:find("RIGHT") and w or w/2
	local y = point:find("BOTTOM") and 0 or point:find("TOP") and h or h/2
	return x,y
end

local function ScreenRect(r)
	if r==UIParent then return 0,0,r.width,r.height end
	local p = r.points[1]
	if not p or not p[2] then return nil end
	local rl,rb,rw,rh = ScreenRect(p[2])
	if not rl then return nil end
	local q = r.points[2]
	if q and p[1]=="TOPLEFT" and q[1]=="BOTTOMRIGHT" and q[2]==p[2] then return rl,rb,rw,rh end
	local es = r:GetEffectiveScale()
	local w,h = r.width*es,r.height*es
	local ax,ay = PointOffset(p[3],rw,rh)
	local ox,oy = PointOffset(p[1],w,h)
	return rl+ax+p[4]*es-ox,rb+ay+p[5]*es-oy,w,h
end

function Region:GetRect()
	local l,b,w,h = ScreenRect(self)
	if not l then return nil end
	local es = self:GetEffectiveScale()
	return l/es,b/es,w/es,h/es
end
function Region:GetLeft() local l = self:GetRect() return l end
function Region:GetBottom() local _,b = self:GetRect() return b end
function Region:GetRight() local l,_,w = self:GetRect() return l and l+w end
function Region:GetTop() local _,b,_,h = self:GetRect() return b and b+h end
function Region:GetCenter()
	local l,b,w,h = self:GetRect()
	if l then return l+w/2,b+h/2 end
end

---------------------------------------------------------------------------
-- Textures and font strings
---------------------------------------------------------------------------

local Texture = setmetatable({},{__index=Region})
Texture.__index = Texture
function Texture:SetTexture(path) self.texture = path return true end
function Texture:GetTexture() return self.texture end
function Texture:SetColorTexture(r,g,b,a) self.texture = "color" self.color = {r,g,b,a or 1} end
function Texture:SetTexCoord(...) self.texcoord = {...} end
function Texture:SetRotation(r) self.rotation = r end
function Texture:GetRotation() return self.rotation or 0 end
function Texture:SetBlendMode(m) self.blend = m end
function Texture:SetDesaturated(d) self.desaturated = d end
function Texture:SetSnapToPixelGrid() end
function Texture:SetTexelSnappingBias() end
function Texture:SetHorizTile() end
function Texture:SetVertTile() end

local FontString = setmetatable({},{__index=Region})
FontString.__index = FontString
function FontString:SetFont(path,size,flags)
	if Mock.badfonts and Mock.badfonts[path] then return false end
	self.font,self.fontsize,self.fontflags = path,size,flags
	return true
end
function FontString:GetFont() return self.font,self.fontsize,self.fontflags end
function FontString:SetText(t) self.text = t end
function FontString:SetFormattedText(fmt,...) self.text = fmt:format(...) end
function FontString:GetText() return self.text end
function FontString:SetTextColor(r,g,b,a) self.textcolor = {r,g,b,a or 1} end
function FontString:GetTextColor() local c = self.textcolor or {1,1,1,1} return c[1],c[2],c[3],c[4] end
function FontString:SetShadowOffset(x,y) self.shadowoffset = {x,y} end
function FontString:SetShadowColor(r,g,b,a) self.shadowcolor = {r,g,b,a} end
function FontString:SetJustifyH(j) self.justifyH = j end
function FontString:SetJustifyV(j) self.justifyV = j end
function FontString:SetWordWrap(w) self.wordwrap = w end
function FontString:SetNonSpaceWrap(w) self.nonspacewrap = w end
function FontString:SetMaxLines(n) self.maxlines = n end
function FontString:SetSpacing(s) self.spacing = s end
function FontString:SetIndentedWordWrap() end
function FontString:GetStringWidth()
	local text = (self.text or ""):gsub("|c%x%x%x%x%x%x%x%x",""):gsub("|r","")
	return #text*(self.fontsize or 12)*0.5
end
function FontString:GetUnboundedStringWidth() return self:GetStringWidth() end
function FontString:GetNumLines()
	if not self.wordwrap or not self.width or self.width<=0 then return 1 end
	local lines = math.max(1,math.ceil(self:GetStringWidth()/self.width))
	if self.maxlines and self.maxlines>0 then lines = math.min(lines,self.maxlines) end
	return lines
end
function FontString:GetLineHeight() return (self.fontsize or 12)*1.2 end
function FontString:GetStringHeight() return self:GetNumLines()*self:GetLineHeight() end
function FontString:GetHeight()
	if self.height and self.height>0 then return self.height end
	return self:GetStringHeight()
end

---------------------------------------------------------------------------
-- Frames
---------------------------------------------------------------------------

local Frame = setmetatable({},{__index=Region})
Frame.__index = Frame

function Frame:SetScript(event,fn) self.scripts[event] = fn end
function Frame:GetScript(event) return self.scripts[event] end
function Frame:HookScript(event,fn)
	self.hooks[event] = self.hooks[event] or {}
	tinsert(self.hooks[event],fn)
end
function Frame:RunScript(event,...)
	if self.scripts[event] then self.scripts[event](self,...) end
	for _,h in ipairs(self.hooks[event] or {}) do h(self,...) end
end
function Frame:CreateTexture(name,layer,template,sub)
	local t = new("Texture",self,Texture)
	t.layer,t.sublayer = layer,sub
	if name then _G[name] = t end
	return t
end
function Frame:CreateFontString(name,layer,template)
	local f = new("FontString",self,FontString)
	f.layer = layer
	if name then _G[name] = f end
	return f
end
function Frame:EnableMouse(e)
	if protected(self,"EnableMouse") then return end
	self.mouse = e
end
function Frame:IsMouseEnabled() return not not self.mouse end
function Frame:EnableMouseWheel(e) self.wheel = e end
function Frame:SetMovable(m) self.movable = m end
function Frame:IsMovable() return self.movable end
function Frame:RegisterForDrag(...) self.drag = {...} end
function Frame:RegisterForClicks(...) self.clicks = {...} end
function Frame:StartMoving() self.moving = true end
function Frame:StopMovingOrSizing() self.moving = false end
function Frame:SetUserPlaced() end
function Frame:SetClampedToScreen(c) self.clamped = c end
function Frame:IsClampedToScreen() return not not self.clamped end
function Frame:SetClampRectInsets() end
function Frame:SetFrameStrata(s) self.strata = s end
function Frame:GetFrameStrata() return self.strata or "MEDIUM" end
function Frame:SetFrameLevel(l) self.level = l end
function Frame:GetFrameLevel() return self.level or 1 end
function Frame:SetToplevel() end
function Frame:SetClipsChildren(c) self.clips = c end
function Frame:SetHitRectInsets() end
function Frame:RegisterEvent(e) self.events = self.events or {} self.events[e] = true end
function Frame:UnregisterEvent(e) if self.events then self.events[e] = nil end end
function Frame:UnregisterAllEvents() self.events = {} end
function Frame:IsProtected() return self.isProtected end
function Frame:IsMouseOver() return false end
function Frame:SetID(id) self.id = id end
function Frame:GetID() return self.id end
function Frame:GetChildren() return unpack(self.children) end
-- Buttons
function Frame:SetNormalTexture() end
function Frame:SetHighlightTexture() end
function Frame:SetPushedTexture() end
function Frame:Click(button) self:RunScript("OnClick",button or "LeftButton",false) end
function Frame:Enable() self.enabled = true end
function Frame:Disable() self.enabled = false end
function Frame:SetEnabled(e) self.enabled = e end
-- Cooldowns
function Frame:SetCooldown(start,duration) self.cd = {start,duration} end
function Frame:Clear() self.cd = nil end
function Frame:SetSwipeTexture(t) self.swipetexture = t end
function Frame:SetSwipeColor(...) self.swipecolor = {...} end
function Frame:SetReverse(r) self.reverse = r end
function Frame:SetDrawEdge(e) self.drawedge = e end
function Frame:SetDrawBling(b) self.drawbling = b end
function Frame:SetDrawSwipe(s) self.drawswipe = s end
function Frame:SetHideCountdownNumbers(h) self.hidenumbers = h end
function Frame:SetUseCircularEdge() end

Mock.Frame,Mock.Texture,Mock.FontString = Frame,Texture,FontString

function CreateFrame(kind,name,parent,template)
	local f = new(kind or "Frame",parent,Frame)
	f.template = template
	if template and template:find("Secure") then f.isProtected = true end
	if name then _G[name] = f end
	return f
end

UIParent = CreateFrame("Frame","UIParent")
UIParent:SetSize(1365.33,768)

--- Run OnUpdate on every visible frame reachable from UIParent.
function Mock.tick(dt)
	Mock.advance(dt)
	local function walk(f)
		if not f.shown then return end
		if f.RunScript and f.scripts.OnUpdate then f.scripts.OnUpdate(f,dt) end
		for _,c in ipairs(f.children) do walk(c) end
	end
	walk(UIParent)
end

--- Collect all font strings under a frame whose text matches a pattern.
function Mock.findText(root,pattern,visibleOnly)
	local found = {}
	local function walk(f)
		if visibleOnly and not f.shown then return end
		if f.kind=="FontString" and f.text and tostring(f.text):find(pattern) then tinsert(found,f) end
		for _,c in ipairs(f.children or {}) do walk(c) end
	end
	walk(root)
	return found
end

--- True if a region and all its ancestors are shown.
function Mock.visible(region)
	return region:IsVisible()
end

return Mock
