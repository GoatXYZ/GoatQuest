local _,GQ = ...
local Styles = GQ.Styles
if not Styles then return end
local L = GQ.L

-- Movers: a labelled box over every part of the GoatQuest viewer that the
-- player can place: the panel, and the arrow or the halo ring. Drag a box to
-- move its part; right-click it to put the part back where it started. Opened
-- from the options (Move frames) or with /gqviewer move; closed with Done,
-- the same command, or the start of combat.
--
-- The viewer lists its parts in :GetMovers():
--   {id=, label=, region=frame, point="TOPLEFT"|"BOTTOM"|"CENTER"|...,
--    Set=function(x,y) end, Reset=function() end}
-- x,y is where the region's `point` goes, in UIParent units from UIParent's
-- bottom-left corner. Set saves it in the viewer's profile keys (so the Ring
-- height slider keeps working) and places the part; Reset clears those keys.
-- The movers never position the viewer's frames themselves.
--
-- While open, Styles.forceShown keeps the viewer up at full alpha even when it
-- is hidden, so every box sits over something visible. Every frame here is
-- unnamed and non-secure.

local floor,max = math.floor,math.max

local Movers = {}
Styles.Movers = Movers

local MIN_W,MIN_H = 60,24     -- small or empty parts still get a box to grab
local BAR_W,BAR_H = 420,70
local BTN_W,BTN_H = 96,24
local FILL,FILL_HOVER = 0.22,0.4
local GOLD = Styles.GOLD
local MUTED = {0.553,0.576,0.612}

---------------------------------------------------------------------------
-- Geometry
---------------------------------------------------------------------------

--- Offset of a named point from the bottom-left corner of a w x h rectangle.
function Movers.PointOffset(point,w,h)
	local x = point:find("LEFT") and 0 or point:find("RIGHT") and w or w/2
	local y = point:find("BOTTOM") and 0 or point:find("TOP") and h or h/2
	return x,y
end
local PointOffset = Movers.PointOffset

--- A region's rectangle in UIParent units: left, bottom, width, height.
function Movers.RegionRect(region)
	local l,b,w,h = region:GetRect()
	if not l then return nil end
	local k = region:GetEffectiveScale()/UIParent:GetEffectiveScale()
	return l*k,b*k,w*k,h*k
end

--- Where a box's point is. Boxes are unscaled UIParent children, so their
--- own units are UIParent units.
local function BoxPoint(box)
	local l,b,w,h = box:GetRect()
	if not l then return nil end
	local x,y = PointOffset(box.def.point,w,h)
	return l+x,b+y
end

--- Keep a box over its part, pinned by the same point, so a box enlarged to
--- the minimum size still drops the part exactly where it was released.
local function PlaceBox(box)
	local def = box.def
	local l,b,w,h = Movers.RegionRect(def.region)
	if not l then return end
	local x,y = PointOffset(def.point,w,h)
	x,y,w,h = l+x,b+y,max(w,MIN_W),max(h,MIN_H)
	if x==box.px and y==box.py and w==box.pw and h==box.ph then return end
	box.px,box.py,box.pw,box.ph = x,y,w,h
	box:ClearAllPoints()
	box:SetPoint(def.point,UIParent,"BOTTOMLEFT",x,y)
	box:SetSize(w,h)
end

---------------------------------------------------------------------------
-- Boxes
---------------------------------------------------------------------------

local function Paint(box)
	local a = (box.hover or box.dragging) and FILL_HOVER or FILL
	box.fill:SetVertexColor(GOLD[1],GOLD[2],GOLD[3],a)
end

local function Box_OnDragStart(box)
	box.dragging = true
	box:StartMoving()
	Paint(box)
end

--- End a drag and save where the box was dropped. Also runs when the box hides.
local function Box_OnDragStop(box)
	if not box.dragging then return end
	box.dragging = false
	box:StopMovingOrSizing()
	local x,y = BoxPoint(box)
	if x then box.def.Set(floor(x+0.5),floor(y+0.5)) end
	box.px = nil   -- the client re-anchored the box; put it back over the part
	Paint(box)
end

local function Box_OnClick(box,button)
	if button~="RightButton" or box.dragging then return end
	box.def.Reset()
	box.px = nil
end

local function Box_OnEnter(box)
	box.hover = true
	Paint(box)
	if not GameTooltip then return end
	GameTooltip:SetOwner(box,"ANCHOR_TOP")
	GameTooltip:SetText(box.def.label)
	GameTooltip:AddLine(L["styles_movers_tip"],1,1,1)
	GameTooltip:Show()
end

local function Box_OnLeave(box)
	box.hover = false
	Paint(box)
	if not GameTooltip then return end
	if GameTooltip.IsOwned and not GameTooltip:IsOwned(box) then return end
	GameTooltip:Hide()
end

local function NewBox()
	local box = CreateFrame("Button",nil,UIParent)
	box:SetFrameStrata("DIALOG")
	box:SetMovable(true)
	box:SetClampedToScreen(true)
	box:EnableMouse(true)
	box:RegisterForDrag("LeftButton")
	box:RegisterForClicks("RightButtonUp")

	box.fill = Styles:Texture(box,"BACKGROUND")
	box.fill:SetAllPoints(box)
	-- 1px outline: top, bottom, left, right.
	local e = {}
	for i=1,4 do
		e[i] = Styles:Texture(box,"BORDER")
		e[i]:SetVertexColor(GOLD[1],GOLD[2],GOLD[3],0.9)
	end
	e[1]:SetPoint("TOPLEFT") e[1]:SetPoint("TOPRIGHT")
	e[2]:SetPoint("BOTTOMLEFT") e[2]:SetPoint("BOTTOMRIGHT")
	e[3]:SetPoint("TOPLEFT") e[3]:SetPoint("BOTTOMLEFT")
	e[4]:SetPoint("TOPRIGHT") e[4]:SetPoint("BOTTOMRIGHT")
	box.edges = e

	local label = Styles:Text(box,"archivo_semibold",12)
	label:SetPoint("CENTER",box,"CENTER",0,0)
	label:SetJustifyH("CENTER")
	label:SetTextColor(1,1,1,1)
	label:SetShadowOffset(1,-1)
	label:SetShadowColor(0,0,0,0.9)
	box.label = label

	box:SetScript("OnDragStart",Box_OnDragStart)
	box:SetScript("OnDragStop",Box_OnDragStop)
	box:SetScript("OnHide",Box_OnDragStop)
	box:SetScript("OnClick",Box_OnClick)
	box:SetScript("OnEnter",Box_OnEnter)
	box:SetScript("OnLeave",Box_OnLeave)
	return box
end

---------------------------------------------------------------------------
-- Bar: title, hint, Reset all and Done
---------------------------------------------------------------------------

local function BarButton(parent,text,onclick)
	local b = CreateFrame("Button",nil,parent)
	b:SetSize(BTN_W,BTN_H)
	b:RegisterForClicks("LeftButtonUp")
	local bg = Styles:Texture(b,"BACKGROUND")
	bg:SetAllPoints(b)
	bg:SetVertexColor(1,1,1,0.08)
	local label = Styles:Text(b,"archivo_semibold",12)
	label:SetPoint("CENTER",b,"CENTER",0,0)
	label:SetTextColor(1,1,1,1)
	label:SetText(text)
	b.label = label
	b:SetScript("OnClick",onclick)
	b:SetScript("OnEnter",function() bg:SetVertexColor(1,1,1,0.16) end)
	b:SetScript("OnLeave",function() bg:SetVertexColor(1,1,1,0.08) end)
	return b
end

function Movers:CreateBar()
	local bar = CreateFrame("Frame",nil,UIParent)
	bar:SetFrameStrata("FULLSCREEN_DIALOG")
	bar:SetSize(BAR_W,BAR_H)
	bar:SetPoint("CENTER",UIParent,"CENTER",0,170)
	bar:SetClampedToScreen(true)
	bar:SetMovable(true)
	bar:EnableMouse(true)
	bar:RegisterForDrag("LeftButton")
	bar:SetScript("OnDragStart",function(f) f:StartMoving() end)
	bar:SetScript("OnDragStop",function(f) f:StopMovingOrSizing() end)
	bar:Hide()
	self.bar = bar

	local bg = Styles:Texture(bar,"BACKGROUND")
	bg:SetAllPoints(bar)
	bg:SetVertexColor(15/255,17/255,21/255,0.94)
	local accent = Styles:Texture(bar,"BORDER")
	accent:SetPoint("TOPLEFT") accent:SetPoint("TOPRIGHT")
	accent:SetHeight(2)
	accent:SetVertexColor(GOLD[1],GOLD[2],GOLD[3],1)

	local done = BarButton(bar,L["styles_movers_done"],function() Movers:Close() end)
	done:SetPoint("TOPRIGHT",bar,"TOPRIGHT",-12,-12)
	local reset = BarButton(bar,L["styles_movers_reset"],function() Movers:ResetAll() end)
	reset:SetPoint("RIGHT",done,"LEFT",-8,0)
	self.doneBtn,self.resetBtn = done,reset

	local title = Styles:Text(bar,"archivo_semibold",14.5)
	title:SetPoint("TOPLEFT",bar,"TOPLEFT",14,-16)
	title:SetWidth(BAR_W-28-2*BTN_W-20)
	title:SetTextColor(1,1,1,1)
	title:SetText(L["styles_movers_title"])
	self.title = title

	local hint = Styles:Text(bar,"archivo",12)
	hint:SetPoint("TOPLEFT",bar,"TOPLEFT",14,-46)
	hint:SetWidth(BAR_W-28)
	hint:SetTextColor(MUTED[1],MUTED[2],MUTED[3],1)
	hint:SetText(L["styles_movers_hint"])

	self.boxes = Styles:Pool(NewBox)

	bar:SetScript("OnUpdate",function() Movers:Update() end)
	-- The boxes would sit over the fight: close them when combat starts.
	bar:RegisterEvent("PLAYER_REGEN_DISABLED")
	bar:SetScript("OnEvent",function()
		if not Movers.open then return end
		Movers:Close()
		GQ:Print(L["styles_movers_combat_closed"])
	end)
end

---------------------------------------------------------------------------
-- Open and close
---------------------------------------------------------------------------

function Movers:IsOpen()
	return self.open==true
end

function Movers:Populate(defs)
	self.boxes:ReleaseAll()
	for _,def in ipairs(defs) do
		local box = self.boxes:Acquire()
		box.def,box.px,box.hover,box.dragging = def,nil,false,false
		box.label:SetText(def.label)
		local px,e = Styles:Pixel(box),box.edges
		e[1]:SetHeight(px) e[2]:SetHeight(px) e[3]:SetWidth(px) e[4]:SetWidth(px)
		Paint(box)
	end
end

--- Show the boxes. Returns true when they are open.
function Movers:Open()
	if self.open then return true end
	if InCombatLockdown() then
		GQ:Print(L["styles_movers_combat"])
		return false
	end
	local style = Styles.active
	local defs = style and style.GetMovers and style:GetMovers()
	if not defs or #defs==0 then
		GQ:Print(L["styles_movers_notready"])
		return false
	end
	if not self.bar then self:CreateBar() end
	self.open = true
	Styles.forceShown = true
	Styles:SyncVisibility(true)
	self:Populate(defs)
	self.bar:Show()
	self:Update()
	return true
end

function Movers:Close()
	if not self.open then return end
	self.open = false
	self.boxes:ReleaseAll()   -- hiding a box ends its drag and saves the drop
	self.bar:Hide()
	Styles.forceShown = nil
	Styles:SyncVisibility(true)
end

function Movers:Toggle()
	if self.open then self:Close() else self:Open() end
end

function Movers:ResetAll()
	for _,box in ipairs(self.boxes.used) do
		box.def.Reset()
		box.px = nil
	end
end

--- A dragged box carries its part along; the others follow their parts,
--- which resize as the guide changes.
function Movers:Update()
	for _,box in ipairs(self.boxes.used) do
		if box.dragging then
			local x,y = BoxPoint(box)
			if x then box.def.Set(x,y) end
		else
			PlaceBox(box)
		end
	end
end

--- Follow a settings change: switching the navigation swaps the arrow's box
--- for the ring's, and the other way round.
function Movers:Refresh()
	if not self.open then return end
	local style = Styles.active
	local defs = style and style.GetMovers and style:GetMovers()
	if not defs or #defs==0 then
		self:Close()
		return
	end
	local used = self.boxes.used
	local same = #used==#defs
	for i=1,#defs do
		if not same or used[i].def~=defs[i] then same = false break end
	end
	if not same then self:Populate(defs) end
end

hooksecurefunc(Styles,"ApplySettings",function() Movers:Refresh() end)
