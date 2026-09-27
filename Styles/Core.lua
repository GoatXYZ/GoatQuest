local name,GQ = ...

-- The GoatQuest viewer: how the current guide step is presented.
--
-- The stock viewer (GQ.Frame) stays the engine's source of truth. Step
-- completion, the arrow and several other systems only run while
-- GQ.Frame:IsVisible() is true, so the viewer never hides it. Instead the
-- stock frame's parent is faded to alpha 0 and the frame itself is parked
-- off-screen so it cannot catch the mouse. The viewer then mirrors GQ.Frame's
-- shown state and alpha, so toggling the viewer, cinematics, dungeon
-- auto-hide and "hide in combat" all keep working unchanged.
--
-- Nothing here touches secure frames. Every change to the stock frames that
-- could be restricted in combat is deferred until PLAYER_REGEN_ENABLED.

local Styles = {}
GQ.Styles = Styles

local L = GQ.L
local GetTime,InCombatLockdown = GetTime,InCombatLockdown

Styles.DIR = "Interface\\AddOns\\"..name.."\\Styles\\"
Styles.TEXDIR = Styles.DIR.."Textures\\"
Styles.FONTDIR = Styles.DIR.."Fonts\\"
Styles.WHITE = "Interface\\Buttons\\WHITE8X8"

Styles.registry = {}
Styles.VIEWER = "goatquest"   -- the one registered presentation (Viewer.lua)
Styles.NAVS = {"arrow","halo"}

-- Parked position for the suppressed stock frame. Far enough that no screen
-- size or UI scale brings it back into view.
local PARK_X = -8000

local MODEL_INTERVAL = 0.1   -- at most ten model rebuilds a second
local NAV_INTERVAL = 1/30    -- direction markers update at 30 fps

---------------------------------------------------------------------------
-- Registry
---------------------------------------------------------------------------

--- Register the viewer. The object provides:
---   id, name
---   :Create()       build frames once; must set self.roots = { frame, ... }
---   :Render(model)  redraw from a Styles.Model snapshot
---   :UpdateNav(nav, elapsed)   called at up to 30 fps
---   :ApplySettings()           optional; navigation, size, positions, accent changed
---   :OnActivate()              optional
---   :GetMovers()               optional; the parts the movers can move (Movers.lua)
function Styles:Register(id,style)
	style.id = id
	self.registry[id] = style
	return style
end

function Styles:Get(id)
	return self.registry[id or self.VIEWER]
end

--- True once the viewer is presenting the guide.
function Styles:IsDriving()
	return self.active ~= nil
end

---------------------------------------------------------------------------
-- Settings
---------------------------------------------------------------------------

local function profile()
	return GQ.db and GQ.db.profile or {}
end
Styles.Profile = profile

function Styles:GetSetting(key,default)
	local v = profile()[key]
	if v == nil then return default end
	return v
end

--- "arrow" or "halo".
function Styles:GetNav()
	return self:GetSetting("viewer_nav","arrow")=="halo" and "halo" or "arrow"
end

-- Where the viewer's parts sit; cleared by "Reset windows".
Styles.POSITION_KEYS = {"viewer_point","viewer_arrowpoint","viewer_halo_x","viewer_halo_offset"}

function Styles:ResetPositions()
	local p = profile()
	for _,key in ipairs(self.POSITION_KEYS) do p[key] = nil end
	self:ApplySettings()
end

-- Keys from when the viewer came in several styles (standard, Classbound,
-- Guiding Wind, Halo). Values read raw: profile defaults must not count.
local RENAMED = {
	styles_scale="viewer_scale", styles_accent="viewer_accent",
	styles_cb_point="viewer_point", styles_cb_arrowpoint="viewer_arrowpoint",
	styles_halo_offset="viewer_halo_offset", styles_halo_x="viewer_halo_x",
}
local RETIRED = {
	"viewerstyle","styles_ownarrow","styles_cb_locked","styles_wind_x","styles_wind_offset",
	"styles_wind_pinned","styles_halo_top_x","styles_halo_top_y",
}

--- One-time move of old keys: the scale, accent and positions carry over, and
--- someone who used the Halo style keeps the halo for navigation.
function Styles.Migrate(p)
	if rawget(p,"viewer_nav")==nil and rawget(p,"viewerstyle")=="halo" then p.viewer_nav = "halo" end
	-- The gold accent became a custom colour that starts out gold.
	for _,key in ipairs({"styles_accent","viewer_accent"}) do
		if rawget(p,key)=="gold" then
			p[key] = "custom"
			if rawget(p,"viewer_accent_color")==nil then
				local g = Styles.GOLD
				p.viewer_accent_color = {r=g[1],g=g[2],b=g[3]}
			end
		end
	end
	for old,new in pairs(RENAMED) do
		local v = rawget(p,old)
		if v~=nil then
			if rawget(p,new)==nil then p[new] = v end
			p[old] = nil
		end
	end
	for _,key in ipairs(RETIRED) do p[key] = nil end
end

---------------------------------------------------------------------------
-- Fonts
---------------------------------------------------------------------------

-- Static TTF instances shipped in Styles/Fonts. None cover Cyrillic, Korean
-- or Chinese, so those locales use the game font.
Styles.FONTS = {
	archivo          = {file="Archivo-Regular.ttf"},
	archivo_semibold = {file="Archivo-SemiBold.ttf"},
	archivo_bold     = {file="Archivo-Bold.ttf"},
	archivo_narrow   = {file="ArchivoNarrow-SemiBold.ttf"},
	atkinson         = {file="AtkinsonHyperlegible-Regular.ttf"},
	atkinson_bold    = {file="AtkinsonHyperlegible-Bold.ttf"},
}

local UNSUPPORTED_LOCALES = {koKR=true, zhCN=true, zhTW=true, ruRU=true}

function Styles:FontPath(key)
	local font = self.FONTS[key]
	local locale = GetLocale and GetLocale() or "enUS"
	if not font or UNSUPPORTED_LOCALES[locale] then
		return STANDARD_TEXT_FONT or GQ.Font
	end
	return self.FONTDIR..font.file
end

function Styles:SetFont(fontstring,key,size,flags)
	flags = flags or ""
	if not fontstring:SetFont(self:FontPath(key),size,flags) then
		-- SetFont returns false when the file cannot be used; keep text visible.
		fontstring:SetFont(STANDARD_TEXT_FONT or GQ.Font,size,flags)
	end
end

---------------------------------------------------------------------------
-- Colour
---------------------------------------------------------------------------

-- Used only when neither CUSTOM_CLASS_COLORS, C_ClassColor nor
-- RAID_CLASS_COLORS is available.
local CLASS_FALLBACK = {
	WARRIOR={0.78,0.61,0.43}, PALADIN={0.96,0.55,0.73}, HUNTER={0.67,0.83,0.45},
	ROGUE={1.00,0.96,0.41},   PRIEST={1.00,1.00,1.00},  SHAMAN={0.00,0.44,0.87},
	MAGE={0.25,0.78,0.92},    WARLOCK={0.53,0.53,0.93}, DRUID={1.00,0.49,0.04},
	DEATHKNIGHT={0.77,0.12,0.23}, MONK={0.00,1.00,0.60}, DEMONHUNTER={0.64,0.19,0.79},
	EVOKER={0.20,0.58,0.50},
}
Styles.GOLD = {0.96,0.75,0.16}

function Styles:GetClassColor()
	local _,class = UnitClass("player")
	if not class then return unpack(self.GOLD) end
	local c = CUSTOM_CLASS_COLORS and CUSTOM_CLASS_COLORS[class]
	if not c and C_ClassColor and C_ClassColor.GetClassColor then c = C_ClassColor.GetClassColor(class) end
	if not c and RAID_CLASS_COLORS then c = RAID_CLASS_COLORS[class] end
	if c and c.r then return c.r,c.g,c.b end
	c = CLASS_FALLBACK[class]
	if c then return c[1],c[2],c[3] end
	return unpack(self.GOLD)
end

--- The viewer's accent: the class colour, or a colour the player picked
--- (viewer_accent_color, GoatQuest gold until changed).
function Styles:GetAccent()
	if self:GetSetting("viewer_accent","class")=="class" then return self:GetClassColor() end
	local c = self:GetSetting("viewer_accent_color")
	if type(c)=="table" and tonumber(c.r) and tonumber(c.g) and tonumber(c.b) then return c.r,c.g,c.b end
	return unpack(self.GOLD)
end

---------------------------------------------------------------------------
-- Widget helpers
---------------------------------------------------------------------------

function Styles:Texture(parent,layer,file,sublevel)
	local t = parent:CreateTexture(nil,layer or "ARTWORK",nil,sublevel)
	t:SetTexture(file and (file:find("\\") and file or self.TEXDIR..file) or self.WHITE)
	return t
end

function Styles:Text(parent,fontkey,size,layer,flags)
	local fs = parent:CreateFontString(nil,layer or "OVERLAY")
	self:SetFont(fs,fontkey,size,flags)
	fs:SetWordWrap(false)
	fs:SetJustifyH("LEFT")
	return fs
end

--- Size of one physical pixel in a frame's coordinate space, for crisp 1px lines.
function Styles:Pixel(frame)
	local _,height = 768,768
	if GetPhysicalScreenSize then _,height = GetPhysicalScreenSize() end
	local scale = (frame and frame:GetEffectiveScale()) or 1
	if not height or height<=0 or scale<=0 then return 1 end
	return 768/height/scale
end

--- A minimal object pool: pool:Acquire() returns a reused or new object,
--- pool:ReleaseAll() hides everything handed out since the last release.
function Styles:Pool(create)
	local pool = {free={},used={}}
	function pool:Acquire()
		local obj = tremove(self.free) or create()
		tinsert(self.used,obj)
		obj:Show()
		return obj
	end
	function pool:ReleaseAll()
		for i=#self.used,1,-1 do
			local obj = self.used[i]
			obj:Hide()
			if obj.ClearAllPoints then obj:ClearAllPoints() end
			tinsert(self.free,obj)
			self.used[i] = nil
		end
	end
	return pool
end

--- Strip colour codes so the viewer can colour text itself. Texture escapes stay.
function Styles.Decolor(text)
	if not text then return text end
	return (text:gsub("|c%x%x%x%x%x%x%x%x",""):gsub("|r",""))
end

function Styles.FormatDistance(dist)
	if type(dist)~="number" then return nil end
	if dist>=99999999 then return L["styles_far"] end
	if GQ.FormatDistance then return GQ.FormatDistance(dist) end
	return ("%d yd"):format(dist)
end

function Styles.FormatETA(eta)
	if type(eta)~="number" or eta<=0 or eta>=3600 then return nil end
	if GQ.Pointer and GQ.Pointer.FormatTime then return GQ.Pointer.FormatTime(eta) end
	return ("%d:%02d"):format(eta/60,eta%60)
end

---------------------------------------------------------------------------
-- Navigation tap: read what the stock arrow pipeline computes each frame
---------------------------------------------------------------------------

-- The arrow pipeline in Pointer.lua keeps running whether or not the arrow
-- is drawn. It hands angle, distance, ETA and title to the arrow frame, so a
-- post-hook on those methods gives the viewer the same data without
-- duplicating the maths. Angle is radians relative to the player's facing,
-- 0 = ahead, increasing counter-clockwise (the Texture:SetRotation convention).
local nav = {mode="hidden", t=0}
Styles.nav = nav

local NAV_MODES = {
	ShowTraveling = "travel", ShowArrived = "arrived", ShowError = "error",
	ShowWaiting = "special", ShowStairs = "special", ShowShip = "special",
	ShowTaxi = "special", ShowInstance = "special",
}

function Styles:AttachNav()
	local frame = GQ.Pointer and GQ.Pointer.ArrowFrame
	if not frame or frame.__gqStylesNav then return end
	frame.__gqStylesNav = true
	for method,mode in pairs(NAV_MODES) do
		if frame[method] then
			if method=="ShowTraveling" then
				hooksecurefunc(frame,method,function(_,_,angle,dist)
					nav.mode,nav.angle,nav.t = mode,angle,GetTime()
					if type(dist)=="number" then nav.dist = dist end
				end)
			else
				hooksecurefunc(frame,method,function()
					nav.mode,nav.special,nav.t = mode,method,GetTime()
				end)
			end
		end
	end
	if frame.ShowText then
		hooksecurefunc(frame,"ShowText",function(_,title,dist,eta,status)
			nav.title,nav.eta,nav.status = title,eta,status
			if type(dist)=="number" then nav.dist = dist end
		end)
	end
	frame:HookScript("OnHide",function() nav.mode = "hidden" end)
end

--- The spell icon over the arrow (hearthstone, portals) is a secure button that
--- only the stock arrow presents; while it is up the stock arrow is shown.
function Styles:IsSpellArrowUp()
	local frame = GQ.Pointer and GQ.Pointer.ArrowFrame
	local icon = frame and frame.ArrowIcon
	return icon and icon:IsShown() or false
end

---------------------------------------------------------------------------
-- Stock viewer and arrow suppression
---------------------------------------------------------------------------

local function master()
	return GQ.Frame and GQ.Frame:GetParent()
end

function Styles:ParkStockFrame()
	local frame = GQ.Frame
	if not frame then return end
	frame:ClearAllPoints()
	frame:SetPoint("TOPRIGHT",UIParent,"TOPLEFT",PARK_X,0)
end

function Styles:IsStockParked()
	local point,_,_,x = GQ.Frame:GetPoint(1)
	return point=="TOPRIGHT" and x==PARK_X
end

function Styles:SuppressStockViewer()
	if not GQ.Frame then return end
	master():SetAlpha(0)
	GQ.Frame:SetClampedToScreen(false)
	self:ParkStockFrame()
	-- The action bar pins itself to the top of the panel while the viewer is
	-- active (ActionBar.lua), so it never follows the parked frame.
	self.viewerSuppressed = true
end

function Styles:SuppressStockArrow()
	local frame = GQ.Pointer and GQ.Pointer.ArrowFrame
	self.arrowSuppressed = true
	if not frame then return end
	frame:SetAlpha(0)
	Styles:SetArrowMouse(false)
end

--- The stock arrow is a protected frame, so its mouse state can only change
--- out of combat. A change requested in combat is applied on PLAYER_REGEN_ENABLED.
function Styles:SetArrowMouse(enabled)
	local frame = GQ.Pointer and GQ.Pointer.ArrowFrame
	if not frame then return end
	if InCombatLockdown() then
		self.arrowMousePending = enabled
		return
	end
	self.arrowMousePending = nil
	if frame:IsMouseEnabled()~=enabled then frame:EnableMouse(enabled) end
end

---------------------------------------------------------------------------
-- Activation
---------------------------------------------------------------------------

--- Take over from the stock viewer. Waits for the stock frame to exist and
--- for the end of combat.
function Styles:Apply()
	local style = self.registry[self.VIEWER]
	if not style then return end
	if not GQ.Frame or InCombatLockdown() then
		self.pending = true
		return
	end
	self.pending = nil
	if self.active then
		self:ApplySettings()
		return
	end
	if not style.created then
		style:Create()
		style.created = true
	end
	self.active = style
	self:SuppressStockViewer()
	self:SuppressStockArrow()
	if style.OnActivate then style:OnActivate() end
	self:ApplySettings()
	self:MarkDirty()
	self.driver:SetScript("OnUpdate",self.Driver_OnUpdate)
	self:SyncVisibility(true)
end

function Styles:ApplySettings()
	local style = self.active
	if not style then return end
	self:SuppressStockArrow()
	if style.ApplySettings then style:ApplySettings() end
	self:MarkDirty()
end

--- Mirror GQ.Frame: shown when it is shown, and faded with it (hide in combat).
--- While the movers are open (forceShown) the viewer stays up at full alpha.
function Styles:SyncVisibility(force)
	local style = self.active
	if not style then return end
	local m = master()
	local shown = GQ.Frame:IsShown() and m:IsShown()
	local alpha = GQ.Frame:GetAlpha()
	if self.forceShown then shown,alpha = true,1 end
	if force or shown~=self.lastShown or alpha~=self.lastAlpha then
		for _,root in ipairs(style.roots or {}) do
			root:SetShown(shown)
			root:SetAlpha(alpha)
		end
		self.lastShown,self.lastAlpha = shown,alpha
		if shown then self:MarkDirty() end
	end
end

---------------------------------------------------------------------------
-- Update driver
---------------------------------------------------------------------------

function Styles:MarkDirty()
	self.dirty = true
end

function Styles:Refresh()
	local style = self.active
	if not style then return end
	local ok,model = pcall(self.Model.Build,self.Model)
	if not ok then
		GQ:Debug("&styles model error: %s",tostring(model))
		return
	end
	self.model = model
	style:Render(model)
end

local model_elapsed,nav_elapsed = 0,0
function Styles.Driver_OnUpdate(_,elapsed)
	local self = Styles
	local style = self.active
	if not style then return end

	self:SyncVisibility()

	-- Keep the stock frames out of the way if anything re-anchors them.
	if self.viewerSuppressed and not self:IsStockParked() then self:ParkStockFrame() end
	self:AttachNav()
	local frame = GQ.Pointer and GQ.Pointer.ArrowFrame
	if frame then
		local target = self:IsSpellArrowUp() and (profile().arrowalpha or 1) or 0
		if frame:GetAlpha()~=target then frame:SetAlpha(target) end
	end

	if not self.lastShown then return end

	model_elapsed = model_elapsed + elapsed
	if self.dirty and model_elapsed>=MODEL_INTERVAL then
		self.dirty = false
		model_elapsed = 0
		self:Refresh()
	end

	nav_elapsed = nav_elapsed + elapsed
	if nav_elapsed>=NAV_INTERVAL then
		style:UpdateNav(not self:IsSpellArrowUp() and nav or nil,nav_elapsed)
		nav_elapsed = 0
	end
end

Styles.driver = CreateFrame("Frame",nil,UIParent)

local function OnRegenEnabled()
	if Styles.arrowMousePending~=nil then Styles:SetArrowMouse(Styles.arrowMousePending) end
	if Styles.pending then Styles:Apply() end
end

local DIRTY_MESSAGES = {
	"GQ_STEP_CHANGED","GQ_GOAL_COMPLETED","GQ_GOAL_UNCOMPLETED","GQ_GOAL_PROGRESS",
	"GQ_GOAL_VISIBILITY_CHANGED","GQ_STEP_WAYPOINT_CHANGED","GQ_GUIDE_LOADED",
	"GQ_NPC_TRANSLATED","SKIN_UPDATED",
}

function Styles:Startup()
	Styles.Migrate(profile())
	for _,msg in ipairs(DIRTY_MESSAGES) do
		GQ:AddMessageHandler(msg,function() Styles:MarkDirty() end)
	end
	GQ:AddEventHandler("PLAYER_REGEN_ENABLED",OnRegenEnabled)
	-- Anything that redraws the stock viewer also refreshes the GoatQuest viewer.
	hooksecurefunc(GQ,"UpdateFrame",function() Styles:MarkDirty() end)
	-- Re-park whenever the stock code re-anchors its frame.
	hooksecurefunc(GQ,"ReanchorFrame",function()
		if Styles.viewerSuppressed then Styles:ParkStockFrame() end
	end)
	-- The stock viewer is rebuilt by a skin change; keep it suppressed, or
	-- finish an activation that was waiting for the frame to exist.
	hooksecurefunc(GQ,"SetSkin",function()
		if Styles.viewerSuppressed then
			Styles:SuppressStockViewer()
		elseif Styles.pending and not InCombatLockdown() then
			Styles:Apply()
		end
	end)
	-- A new arrow skin creates a new arrow frame: tap it and keep it hidden.
	if GQ.Pointer and GQ.Pointer.SetupArrow then
		hooksecurefunc(GQ.Pointer,"SetupArrow",function()
			Styles:AttachNav()
			if Styles.arrowSuppressed then Styles:SuppressStockArrow() end
		end)
	end
	self:AttachNav()
	self:Apply()
end

tinsert(GQ.startups,{"Viewer styles",function() Styles:Startup() end})

--- /gqviewer arrow|halo sets the navigation (no argument switches it);
--- /gqviewer move opens or closes the movers.
SLASH_GOATQUESTVIEWER1 = "/gqviewer"
SlashCmdList.GOATQUESTVIEWER = function(msg)
	if not GQ.db then return end
	local cmd = strtrim(msg or ""):lower()
	if cmd=="move" then
		if Styles.Movers then Styles.Movers:Toggle() end
		return
	end
	if cmd=="" then cmd = Styles:GetNav()=="halo" and "arrow" or "halo" end
	if cmd~="arrow" and cmd~="halo" then
		GQ:Print(L["styles_slash_usage"])
		return
	end
	GQ.db.profile.viewer_nav = cmd
	Styles:ApplySettings()
	GQ:Print(L["styles_slash_nav"]:format(L["opt_viewer_nav_"..cmd]))
end
