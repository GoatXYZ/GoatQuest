local name,GQ = ...
local Styles = GQ.Styles
if not Styles then return end

-- The GoatQuest viewer: a compact, flat panel. 1px lines, narrow numbers and
-- one thin bar per objective; the only colour is the accent (class colour or
-- GoatQuest gold). Navigation is the arrow, a flat chevron in the same accent
-- that replaces the waypoint arrow, or the halo, a ring at the character's
-- feet (Halo.lua); the Navigation option picks one.
--
-- Widgets are built once. Rows are drawn from pools of font strings and
-- textures anchored to the panel at computed offsets, so a render is a
-- single top-to-bottom pass and the panel height is wherever it ends.
-- Font strings cannot be struck through, so finished lines use the muted
-- colour and a check mark instead.

local L = GQ.L
local floor,ceil,max,min = math.floor,math.ceil,math.max,math.min
local GetTime = GetTime
local Decolor = Styles.Decolor

local Viewer = Styles:Register(Styles.VIEWER,{name=L["name_plain"]})
local Halo = Styles.Halo

---------------------------------------------------------------------------
-- Metrics and palette (mockup px map 1:1 to UI units)
---------------------------------------------------------------------------

local WIDTH = 300
local PAD = 12                -- left/right padding of the body
local INNER = WIDTH-PAD*2     -- 276
local ACCENT_H = 2            -- accent line along the top edge
local HEAD_H = 38             -- 8 + 22 + 8
local BTN = 22
local PROGRESS_Y = ACCENT_H+HEAD_H
local BODY_Y = PROGRESS_Y+2
local MARK_INDENT = 18        -- text indent after a row marker
local BUMP = 0.6              -- seconds a progress bump stays lit

local TEXT  = {0.925,0.918,0.902}   -- #ECEAE6
local MUTED = {0.553,0.576,0.612}   -- #8D939C
local DIM   = {0.435,0.459,0.494}   -- #6F757E
local SOFT  = {0.773,0.784,0.804}   -- #C5C8CD
local TITLE = {0.910,0.910,0.910}   -- #E8E8E8
local STEP_FMT = "%d|cff8d939c / %d|r"   -- " / 64" in the muted colour

local DEFAULT_POINT = {"TOPRIGHT","TOPRIGHT",-24,-200}
local DEFAULT_ARROW = {"TOP","TOP",0,-84}

local TEX_CHECK = Styles.TEXDIR.."check.tga"
local TEX_DOT   = Styles.TEXDIR.."dot.tga"
local TEX_PIN   = Styles.TEXDIR.."pin.tga"
local TEX_WHITE = Styles.WHITE

local EMPTY = {}

--- CSS line box of a font size (line-height 1.35).
local function LH(size) return floor(size*1.35+0.5) end

local function TextWidth(fs)
	if fs.GetUnboundedStringWidth then return fs:GetUnboundedStringWidth() end
	return fs:GetStringWidth()
end

local function Font(fs,key,size)
	if fs.fontKey~=key or fs.fontSize~=size then
		Styles:SetFont(fs,key,size)
		fs.fontKey,fs.fontSize = key,size
	end
end

local function Shadow(fs)
	fs:SetShadowOffset(1,-1)
	fs:SetShadowColor(0,0,0,0.85)
end

---------------------------------------------------------------------------
-- Position, locking and dragging
---------------------------------------------------------------------------

-- The viewer lock (Lock viewer) stops dragging the panel and the arrow; the
-- movers still work.
local function Locked()
	return Styles:GetSetting("windowlocked",false)==true
end

local function PlaceFrame(frame,key,default)
	local p = Styles:GetSetting(key)
	if type(p)~="table" or type(p[1])~="string" or type(p[3])~="number" or type(p[4])~="number" then p = default end
	frame:ClearAllPoints()
	frame:SetPoint(p[1],UIParent,p[2] or p[1],p[3],p[4])
end

-- Saved by the top-left corner so the panel grows downwards from where it
-- was dropped. GetLeft/GetTop and SetPoint offsets share the frame's scale.
local function SavePosition(frame,key)
	local point,rel,x,y
	local left = frame.GetLeft and frame:GetLeft()
	local top = frame.GetTop and frame:GetTop()
	if left and top then
		point,rel,x,y = "TOPLEFT","BOTTOMLEFT",left,top
	else
		local _
		point,_,rel,x,y = frame:GetPoint(1)
	end
	if not point then return end
	Styles.Profile()[key] = {point,rel,x,y}
	frame:ClearAllPoints()
	frame:SetPoint(point,UIParent,rel,x,y)
end

local function StartMove(frame)
	if frame.dragging or Locked() then return end
	frame:StartMoving()
	frame.dragging = true
end

local function StopMove(frame,key)
	if not frame.dragging then return end
	frame.dragging = false
	frame:StopMovingOrSizing()
	SavePosition(frame,key)
end

---------------------------------------------------------------------------
-- Buttons
---------------------------------------------------------------------------

local function FlipSound()
	local profile = Styles.Profile()
	if profile.flipsounds and PlaySound and SOUNDKIT and SOUNDKIT.IG_MINIMAP_ZOOM_IN then
		PlaySound(SOUNDKIT.IG_MINIMAP_ZOOM_IN)
	end
end

-- Same behaviour as the stock viewer's step buttons.
local function Prev_OnClick(_,button)
	if IsControlKeyDown() and not IsAltKeyDown() then
		if GQ.FocusStep then GQ:FocusStep(1,true) end   -- and force focus
		GQ.pause = nil
	else
		local count = IsShiftKeyDown() and 10 or 1
		for _=1,count do GQ:PreviousStep(button=="RightButton",true) end   -- fast,forcefocus
	end
	FlipSound()
	local rating = GQ.BugReport and GQ.BugReport.GuideRating
	if rating and rating.GoatQuestPopup then
		rating.GoatQuestPopup:Hide()
		if rating.GoatQuestPopupOn then rating.GoatQuestPopupOn:Hide() end
	end
end

local function Next_OnClick(_,button)
	local count = IsShiftKeyDown() and 10 or 1
	for _=1,count do GQ:SkipStep(button=="RightButton",false,true) end
	FlipSound()
end

local function OpenGuides()
	if GQ.GuideMenu and GQ.GuideMenu.Show then GQ.GuideMenu:Show("LEVELING") end
end

local function Menu_OnClick(_,button)
	if button=="RightButton" then
		if GQ.OpenOptions then GQ:OpenOptions("display") end
	else
		OpenGuides()
	end
end

local function GoalMenu_OnClick(frame,button)
	if button~="RightButton" then return end
	local goal = frame.goal
	local step = goal and goal.parentStep
	if not step or not GQ.CurrentGuide then return end
	-- Future steps are previews. Their menu's Skip action would skip the
	-- current step, so keep the stock viewer's restriction on them.
	local active = step==GQ.CurrentStep
	if frame.parentStep.is_sticky then
		for _,sticky in ipairs(GQ.CurrentStickies or EMPTY) do
			if sticky==step then active = true break end
		end
	end
	if not active then return end
	frame.menuGoal = goal
	GQ:OpenQuickStepMenu(frame.parentStep,frame)
end

function Viewer:CloseStaleGoalMenu(hidden)
	local menu = GQ.Frame and GQ.Frame.Menu
	local anchor = menu and menu.goalframe
	if not anchor or anchor.viewer~=self then return end
	if hidden or not anchor:IsShown() or anchor.goal~=anchor.menuGoal then
		if DropDownForkList1 and DropDownForkList1.dropdown==menu then CloseDropDownForks() end
		menu.goalframe,menu.stepframe = nil,nil
	end
end

local function SetHover(b,on)
	if b.hl then b.hl:SetShown(on) end
	local c = on and b.hoverColor or b.baseColor
	for i=1,#b.parts do b.parts[i]:SetVertexColor(c[1],c[2],c[3],1) end
	if b.label then b.label:SetTextColor(c[1],c[2],c[3],1) end
end

local WHITE = {1,1,1}

local function Button_OnEnter(b)
	SetHover(b,true)
	local tip = b.tip
	if not tip or not GameTooltip then return end
	GameTooltip:SetOwner(b,"ANCHOR_TOP")
	GameTooltip:SetText(L[tip[1]])
	for i=2,#tip do GameTooltip:AddLine(L[tip[i]],1,1,1) end
	GameTooltip:Show()
end

local function Button_OnLeave(b)
	SetHover(b,false)
	if not GameTooltip then return end
	if GameTooltip.IsOwned and not GameTooltip:IsOwned(b) then return end
	GameTooltip:Hide()
end

local function MakeButton(parent,w,h,tip,onclick)
	local b = CreateFrame("Button",nil,parent)
	b:SetSize(w,h)
	b:RegisterForClicks("LeftButtonUp","RightButtonUp")
	local hl = Styles:Texture(b,"BACKGROUND")
	hl:SetAllPoints(b)
	hl:SetVertexColor(1,1,1,0.07)
	hl:Hide()
	b.hl = hl
	b.parts = {}
	b.baseColor,b.hoverColor = MUTED,WHITE
	b.tip = tip
	b:SetScript("OnClick",onclick)
	b:SetScript("OnEnter",Button_OnEnter)
	b:SetScript("OnLeave",Button_OnLeave)
	return b
end

local function StepButton(parent,rotation,tip,onclick)
	local b = MakeButton(parent,BTN,BTN,tip,onclick)
	local icon = Styles:Texture(b,"ARTWORK","vchev.tga")
	icon:SetSize(14,14)
	icon:SetPoint("CENTER",b,"CENTER",0,0)
	icon:SetRotation(rotation)
	b.icon = icon
	b.parts[1] = icon
	SetHover(b,false)
	return b
end

---------------------------------------------------------------------------
-- Construction
---------------------------------------------------------------------------

local PREV_TIP = {"frame_stepnav_prev","frame_stepnav_prev_click","frame_stepnav_prev_right","frame_stepnav_prev_ctrl"}
local NEXT_TIP = {"frame_stepnav_next","frame_stepnav_next_click","frame_stepnav_next_right"}
local MENU_TIP = {"styles_menu","styles_menu_click","styles_menu_right"}

function Viewer:CreatePanel()
	local panel = CreateFrame("Frame",nil,UIParent)
	self.panel = panel
	panel.style = self
	panel:SetSize(WIDTH,120)
	panel:SetFrameStrata("MEDIUM")
	panel:SetClampedToScreen(true)
	panel:SetMovable(true)
	panel:EnableMouse(true)
	panel:SetScript("OnHide",function(f)
		StopMove(f,"viewer_point")
		self:CloseStaleGoalMenu(true)
	end)
	PlaceFrame(panel,"viewer_point",DEFAULT_POINT)

	local bg = Styles:Texture(panel,"BACKGROUND")
	bg:SetAllPoints(panel)
	bg:SetVertexColor(15/255,17/255,21/255,0.9)

	-- Accent along the top edge; 1px hairline on the other three sides.
	local top = Styles:Texture(panel,"OVERLAY",nil,6)
	top:SetPoint("TOPLEFT",panel,"TOPLEFT",0,0)
	top:SetPoint("TOPRIGHT",panel,"TOPRIGHT",0,0)
	self.topLine = top
	self.borders = {}
	for i,side in ipairs({"LEFT","RIGHT","BOTTOM"}) do
		local t = Styles:Texture(panel,"OVERLAY",nil,5)
		t:SetVertexColor(1,1,1,0.07)
		if side=="BOTTOM" then
			t:SetPoint("BOTTOMLEFT",panel,"BOTTOMLEFT",0,0)
			t:SetPoint("BOTTOMRIGHT",panel,"BOTTOMRIGHT",0,0)
		else
			t:SetPoint("TOP"..side,panel,"TOP"..side,0,-ACCENT_H)
			t:SetPoint("BOTTOM"..side,panel,"BOTTOM"..side,0,0)
		end
		t.side = side
		self.borders[i] = t
	end

	-- Header: guide name, range, step navigation, menu. Drag handle.
	local header = CreateFrame("Frame",nil,panel)
	self.header = header
	header:SetPoint("TOPLEFT",panel,"TOPLEFT",0,-ACCENT_H)
	header:SetPoint("TOPRIGHT",panel,"TOPRIGHT",0,-ACCENT_H)
	header:SetHeight(HEAD_H)
	header:EnableMouse(true)
	header:RegisterForDrag("LeftButton")
	header:SetScript("OnDragStart",function() StartMove(panel) end)
	header:SetScript("OnDragStop",function() StopMove(panel,"viewer_point") end)

	local menu = MakeButton(header,BTN,BTN,MENU_TIP,Menu_OnClick)
	menu:SetPoint("RIGHT",header,"RIGHT",-8,0)
	for i=1,3 do
		local line = Styles:Texture(menu,"ARTWORK")
		line:SetSize(10,1)
		line:SetPoint("CENTER",menu,"CENTER",0,(2-i)*3.5)
		menu.parts[i] = line
	end
	SetHover(menu,false)
	self.menuBtn = menu

	local nextBtn = StepButton(header,-math.pi/2,NEXT_TIP,Next_OnClick)
	nextBtn:SetPoint("RIGHT",menu,"LEFT",-2,0)
	self.nextBtn = nextBtn

	local step = Styles:Text(header,"archivo_narrow",13)
	step:SetPoint("RIGHT",nextBtn,"LEFT",-3,0)
	step:SetTextColor(TEXT[1],TEXT[2],TEXT[3],1)
	self.stepText = step

	local prevBtn = StepButton(header,math.pi/2,PREV_TIP,Prev_OnClick)
	prevBtn:SetPoint("RIGHT",step,"LEFT",-3,0)
	self.prevBtn = prevBtn

	local guide = Styles:Text(header,"archivo_semibold",14.5)
	guide:SetPoint("LEFT",header,"LEFT",PAD,0)
	guide:SetTextColor(TEXT[1],TEXT[2],TEXT[3],1)
	self.guideText = guide

	local range = Styles:Text(header,"archivo",13)
	range:SetPoint("BOTTOMLEFT",guide,"BOTTOMRIGHT",7,0)
	range:SetTextColor(MUTED[1],MUTED[2],MUTED[3],1)
	self.rangeText = range

	-- Guide progress under the header.
	local track = Styles:Texture(panel,"ARTWORK",nil,0)
	track:SetPoint("TOPLEFT",panel,"TOPLEFT",0,-PROGRESS_Y)
	track:SetPoint("TOPRIGHT",panel,"TOPRIGHT",0,-PROGRESS_Y)
	track:SetVertexColor(1,1,1,0.07)
	self.progressTrack = track
	local fill = Styles:Texture(panel,"ARTWORK",nil,1)
	fill:SetPoint("TOPLEFT",panel,"TOPLEFT",0,-PROGRESS_Y)
	self.progressFill = fill

	-- "Choose a guide" for the empty state: a flat, always-filled button.
	local choose = MakeButton(panel,120,24,nil,OpenGuides)
	choose.bg,choose.hl = choose.hl,nil
	choose.bg:SetVertexColor(1,1,1,0.06)
	choose.bg:Show()
	choose:SetScript("OnEnter",function(b) b.bg:SetVertexColor(1,1,1,0.11) SetHover(b,true) end)
	choose:SetScript("OnLeave",function(b) b.bg:SetVertexColor(1,1,1,0.06) SetHover(b,false) end)
	local label = Styles:Text(choose,"archivo_semibold",12)
	label:SetPoint("CENTER",choose,"CENTER",0,0)
	choose.label = label
	choose.baseColor = TEXT
	SetHover(choose,false)
	choose:Hide()
	self.chooseBtn = choose

	-- Pools for everything below the header.
	self.texts = Styles:Pool(function()
		local fs = Styles:Text(panel,"archivo",13)
		fs.fontKey,fs.fontSize = "archivo",13
		fs:SetJustifyV("MIDDLE")
		return fs
	end)
	self.wraps = Styles:Pool(function()
		local fs = Styles:Text(panel,"archivo",13)
		fs.fontKey,fs.fontSize = "archivo",13
		fs:SetWordWrap(true)
		if fs.SetNonSpaceWrap then fs:SetNonSpaceWrap(true) end
		fs:SetJustifyV("TOP")
		fs:SetSpacing(2)
		return fs
	end)
	self.texes = Styles:Pool(function() return Styles:Texture(panel,"ARTWORK") end)
	self.goalButtons = Styles:Pool(function()
		local b = CreateFrame("Button",nil,panel)
		b.viewer = self
		b.parentStep = {}
		b:EnableMouse(true)
		b:RegisterForClicks("RightButtonUp")
		b:SetScript("OnClick",GoalMenu_OnClick)
		return b
	end)

	self.accent = {1,1,1}
	self.groups = {}
	self.rows = {}
	self.nrows = 0
	self.bumps = {}
	self.nbumps = 0
	self.lastDone = setmetatable({},{__mode="k"})
	self.bumpUntil = setmetatable({},{__mode="k"})
end

function Viewer:CreateArrow()
	local arrow = CreateFrame("Frame",nil,UIParent)
	self.arrow = arrow
	arrow:SetSize(220,90)
	arrow:SetFrameStrata("MEDIUM")
	arrow:SetClampedToScreen(true)
	arrow:SetMovable(true)
	arrow:SetScript("OnHide",function(f) StopMove(f,"viewer_arrowpoint") end)
	PlaceFrame(arrow,"viewer_arrowpoint",DEFAULT_ARROW)

	-- Everything visible (and the drag area) lives in body, which is hidden
	-- whenever there is nothing to point at, so it never catches the mouse.
	local body = CreateFrame("Frame",nil,arrow)
	body:SetAllPoints(arrow)
	body:RegisterForDrag("LeftButton")
	body:SetScript("OnDragStart",function() StartMove(arrow) end)
	body:SetScript("OnDragStop",function() StopMove(arrow,"viewer_arrowpoint") end)
	body:Hide()
	body:SetScript("OnHide",function() arrow.mode = nil end)
	self.arrowBody = body

	local shadow = Styles:Texture(body,"ARTWORK","chevron-shadow.tga",0)
	shadow:SetSize(46,46)
	shadow:SetPoint("TOP",body,"TOP",0,-2)
	self.chevShadow = shadow
	local chev = Styles:Texture(body,"ARTWORK","chevron.tga",1)
	chev:SetSize(46,46)
	chev:SetPoint("TOP",body,"TOP",0,0)
	self.chev = chev

	local check = Styles:Texture(body,"ARTWORK","check.tga",1)
	check:SetSize(40,40)
	check:SetPoint("CENTER",chev,"CENTER",0,0)
	check:Hide()
	self.arrived = check

	local dist = Styles:Text(body,"archivo_bold",17)
	dist:SetJustifyH("CENTER")
	dist:SetPoint("TOP",body,"TOP",0,-51)
	dist:SetTextColor(1,1,1,1)
	Shadow(dist)
	self.distText = dist

	local eta = Styles:Text(body,"archivo_narrow",13)
	eta:SetPoint("BOTTOMLEFT",dist,"BOTTOMRIGHT",6,1)
	eta:SetTextColor(MUTED[1],MUTED[2],MUTED[3],1)
	Shadow(eta)
	self.etaText = eta

	local title = Styles:Text(body,"archivo",12)
	title:SetJustifyH("CENTER")
	title:SetWidth(220)
	title:SetTextColor(TITLE[1],TITLE[2],TITLE[3],1)
	Shadow(title)
	self.titleText = title
end

function Viewer:Create()
	self:CreatePanel()
	self:CreateArrow()
	self.halo = Halo:Create()
	self.nav = "arrow"
	self.roots = {self.panel,self.arrow,self.halo.root}
end

---------------------------------------------------------------------------
-- Settings
---------------------------------------------------------------------------

function Viewer:Tint(r,g,b)
	self.ar,self.ag,self.ab = r,g,b
	local accent = self.accent
	accent[1],accent[2],accent[3] = r,g,b
	self.topLine:SetVertexColor(r,g,b,1)
	self.progressFill:SetVertexColor(r,g,b,1)
	self.chev:SetVertexColor(r,g,b,1)
	self.arrived:SetVertexColor(r,g,b,1)
	self.halo:Tint(r,g,b)
	-- Waypoint pins on the maps share the accent (Pointer skips unchanged colours).
	local pointer = GQ.Pointer
	if pointer and pointer.SetWaypointColor then pointer:SetWaypointColor(r,g,b) end
end

--- Line thicknesses in whole physical pixels for the current effective scale.
function Viewer:ApplyPixel(px)
	self.px = px
	local function snap(units) return max(1,floor(units/px+0.5))*px end
	self.snap = snap
	self.topLine:SetHeight(snap(ACCENT_H))
	for _,t in ipairs(self.borders) do
		if t.side=="BOTTOM" then t:SetHeight(px) else t:SetWidth(px) end
	end
	self.progressTrack:SetHeight(snap(2))
	self.progressFill:SetHeight(snap(2))
	for _,line in ipairs(self.menuBtn.parts) do line:SetHeight(snap(1.25)) end
end

function Viewer:ApplySettings()
	local scale = tonumber(Styles:GetSetting("viewer_scale",1)) or 1
	self.panel:SetScale(scale)
	self.arrow:SetScale(scale)

	-- Navigation: the arrow or the halo, never both.
	local nav = Styles:GetNav()
	if nav~=self.nav then
		self.nav = nav
		self.arrowBody:Hide()
		Halo:UpdateNav(nil)
	end
	Halo:ApplySettings(scale,nav=="halo")

	-- Frames stay movable and registered for drag; StartMove checks the lock,
	-- so a lock change can never leave a drag pointing at a fixed frame.
	local locked = Locked()
	if locked then
		StopMove(self.panel,"viewer_point")
		StopMove(self.arrow,"viewer_arrowpoint")
	end
	-- Locked, the arrow is click-through.
	self.arrowBody:EnableMouse(not locked)

	if not self.panel.dragging then PlaceFrame(self.panel,"viewer_point",DEFAULT_POINT) end
	if not self.arrow.dragging then PlaceFrame(self.arrow,"viewer_arrowpoint",DEFAULT_ARROW) end

	self:ApplyPixel(Styles:Pixel(self.panel))
	self:Tint(Styles:GetAccent())
end

--- Movers (Movers.lua): the panel, and the arrow or the ring, whichever the
--- navigation shows. Panel and arrow drops save like a header drag.
function Viewer:GetMovers()
	local function mover(id,frame,key,default)
		local function Place()
			if not frame.dragging then PlaceFrame(frame,key,default) end
		end
		return {
			id=id, label=L["styles_mover_"..id], region=frame, point="TOPLEFT",
			-- x,y are UIParent units; the frame's own offsets are in its scale.
			Set=function(x,y)
				local s = frame:GetScale()
				Styles.Profile()[key] = {"TOPLEFT","BOTTOMLEFT",x/s,y/s}
				Place()
			end,
			Reset=function()
				Styles.Profile()[key] = nil
				Place()
			end,
		}
	end
	local defs = self.moverDefs
	if not defs then
		defs = {
			panel = mover("panel",self.panel,"viewer_point",DEFAULT_POINT),
			arrow = mover("arrow",self.arrow,"viewer_arrowpoint",DEFAULT_ARROW),
		}
		self.moverDefs = defs
	end
	-- The same tables every time, so the movers can tell when the set changed.
	return {defs.panel, self.nav=="halo" and Halo:GetMover() or defs.arrow}
end

function Viewer:OnActivate()
	-- Custom fonts can report wrong string sizes until they have been drawn
	-- once; lay out again shortly after the first render.
	if C_Timer and C_Timer.After then
		C_Timer.After(0.3,function() if Styles.active==self then Styles:MarkDirty() end end)
	end
end

---------------------------------------------------------------------------
-- Render helpers (all anchored to the panel's top-left corner)
---------------------------------------------------------------------------

--- Single-line text, truncated to w when given, otherwise sized to fit.
function Viewer:Line(key,size,c,text,x,y,w,justify)
	local fs = self.texts:Acquire()
	Font(fs,key,size)
	fs:SetTextColor(c[1],c[2],c[3],1)
	fs:SetJustifyH(justify or "LEFT")
	fs:SetText(text)
	if not w then w = ceil(TextWidth(fs))+2 end
	fs:SetSize(w,LH(size))
	fs:SetPoint("TOPLEFT",self.panel,"TOPLEFT",x,-y)
	return fs,w
end

--- Wrapped text; returns the font string and the height it takes.
function Viewer:Wrapped(key,size,c,text,x,y,w)
	local fs = self.wraps:Acquire()
	Font(fs,key,size)
	fs:SetTextColor(c[1],c[2],c[3],1)
	fs:SetWidth(w)
	fs:SetText(text)
	fs:SetPoint("TOPLEFT",self.panel,"TOPLEFT",x,-(y+1))
	local h = fs:GetStringHeight() or 0
	return fs,max(ceil(h)+2,LH(size))
end

function Viewer:Tex(file,sub,r,g,b,a,x,y,w,h)
	local t = self.texes:Acquire()
	t:SetTexture(file)
	t:SetDrawLayer("ARTWORK",sub)
	t:SetVertexColor(r,g,b,a)
	t:SetSize(w,h)
	t:SetPoint("TOPLEFT",self.panel,"TOPLEFT",x,-y)
	return t
end

--- Record a drawn objective row (kept for tests and bump effects).
function Viewer:AddRow(line,nameFs,countFs,track,fill)
	local n = self.nrows+1
	self.nrows = n
	local row = self.rows[n] or {}
	self.rows[n] = row
	row.line,row.name,row.count,row.track,row.fill = line,nameFs,countFs,track,fill
	return row
end

function Viewer:AddBump(fs,fill,base,untilT)
	local n = self.nbumps+1
	self.nbumps = n
	local b = self.bumps[n] or {}
	self.bumps[n] = b
	b.fs,b.fill,b.base,b.untilT = fs,fill,base,untilT
end

local function Bump_OnUpdate(panel)
	local self = panel.style
	local now = GetTime()
	local ar,ag,ab = self.ar,self.ag,self.ab
	local live = false
	for i=1,self.nbumps do
		local b = self.bumps[i]
		local k = (b.untilT-now)/BUMP
		if k>0 then live = true else k = 0 end
		if k>1 then k = 1 end
		k = k*k
		local c = b.base
		b.fs:SetTextColor(c[1]+(ar-c[1])*k,c[2]+(ag-c[2])*k,c[3]+(ab-c[3])*k,1)
		if b.fill then
			local w = 0.55*k
			b.fill:SetVertexColor(ar+(1-ar)*w,ag+(1-ag)*w,ab+(1-ab)*w,1)
		end
	end
	if not live then panel:SetScript("OnUpdate",nil) end
end

---------------------------------------------------------------------------
-- Rows
---------------------------------------------------------------------------

-- Full-width mouse targets cover counts, bars and wrapped text. The stock
-- menu anchors to this visible frame, not the parked stock viewer.
function Viewer:GoalTarget(line,y,height,background)
	local goal = line and line.goal
	if not (goal and goal.parentStep) then return end
	local b = self.goalButtons:Acquire()
	b.goal = goal
	b.parentStep.step = goal.parentStep
	b.parentStep.is_sticky = line.sticky
	b:SetFrameLevel(self.panel:GetFrameLevel()+(background and 1 or 2))
	b:SetPoint("TOPLEFT",self.panel,"TOPLEFT",0,-y)
	b:SetSize(WIDTH,height)
	return b
end

-- Counted objective: name left, count right, bar underneath.
function Viewer:CountedRow(line,y,small,now)
	local top = y
	local ar,ag,ab = self.ar,self.ag,self.ab
	local size = small and 12 or 13
	local lh = LH(size)
	local complete = line.complete
	local base = small and SOFT or TEXT
	local countColor = complete and self.accent or base

	local count,cw = self:Line("archivo_narrow",small and 12 or 13.5,countColor,line.done.."/"..line.needed,0,y)
	count:SetJustifyH("RIGHT")
	count:ClearAllPoints()
	count:SetPoint("TOPLEFT",self.panel,"TOPLEFT",WIDTH-PAD-cw,-y)

	local nameW = INNER-cw-10
	if complete then
		local s = small and 12 or 14
		self:Tex(TEX_CHECK,1,ar,ag,ab,1,WIDTH-PAD-cw-s-1,y+(lh-s)/2,s,s)
		nameW = nameW-s
	end
	local nameFs = self:Line("archivo",size,complete and DIM or base,line.label or line.text,PAD,y,max(1,nameW))

	y = y+lh+4
	local bh = self.snap(small and 1 or 3)
	local track = self:Tex(TEX_WHITE,0,1,1,1,0.08,PAD,y,INNER,bh)
	local fill
	local frac = line.fraction or 0
	if frac>0 then
		fill = self:Tex(TEX_WHITE,1,ar,ag,ab,1,PAD,y,max(self.px,INNER*min(1,frac)),bh)
	end
	self:AddRow(line,nameFs,count,track,fill).clicker = self:GoalTarget(line,top,y+bh-top)

	-- Count went up since the last render: light it briefly.
	local goal = line.goal
	if goal then
		local last = self.lastDone[goal]
		self.lastDone[goal] = line.done
		if last and line.done>last then self.bumpUntil[goal] = now+BUMP end
		local untilT = self.bumpUntil[goal]
		if untilT then
			if untilT>now then self:AddBump(count,fill,countColor,untilT) else self.bumpUntil[goal] = nil end
		end
	end
	return y+bh
end

-- Plain objective: marker and wrapped text.
function Viewer:PlainRow(line,y,small)
	local ar,ag,ab = self.ar,self.ag,self.ab
	local size = small and 12 or 13
	local complete = line.complete
	local fs,h = self:Wrapped("archivo",size,complete and DIM or (small and SOFT or TEXT),line.text,PAD+MARK_INDENT,y,INNER-MARK_INDENT)
	local mid = y+LH(size)/2
	if complete then
		self:Tex(TEX_CHECK,1,ar,ag,ab,1,PAD-1,mid-7,14,14)
	else
		self:Tex(TEX_DOT,1,MUTED[1],MUTED[2],MUTED[3],1,PAD+3,mid-3,6,6)
	end
	self:AddRow(line,fs).clicker = self:GoalTarget(line,y,h)
	return y+h
end

function Viewer:TipRow(text,y,line)
	local _,h = self:Wrapped("archivo",11.5,MUTED,text,PAD,y,INNER)
	self:GoalTarget(line,y,h)
	return y+h
end

--- Group lines by quest title, in order of first appearance.
function Viewer:Group(lines,primary)
	local groups = self.groups
	local n = 0
	for _,line in ipairs(lines) do
		local q = line.quest or false
		local g
		for i=1,n do if groups[i].quest==q then g = groups[i] break end end
		if not g then
			n = n+1
			g = groups[n]
			if g then wipe(g) else g = {} groups[n] = g end
			g.quest = q
		end
		g[#g+1] = line
		if line==primary then g.primary = true end
	end
	return groups,n
end

---------------------------------------------------------------------------
-- Render
---------------------------------------------------------------------------

function Viewer:RenderHeader(model)
	local guide = model.state=="guide"
	local stepFs,nameFs,rangeFs = self.stepText,self.guideText,self.rangeText

	self.prevBtn:SetShown(guide)
	self.nextBtn:SetShown(guide)
	stepFs:SetShown(guide)
	local cluster = BTN
	if guide then
		stepFs:SetFormattedText(STEP_FMT,model.stepNum or 0,model.stepCount or 0)
		cluster = cluster+2+BTN+3+ceil(TextWidth(stepFs))+3+BTN
	end

	local title = model.guideName or (model.state=="none" and name) or ""
	nameFs:SetText(title)
	local avail = WIDTH-PAD-8-cluster-10
	local nw = ceil(TextWidth(nameFs))+1
	local range = model.range
	if range then
		rangeFs:SetText(range)
		local rw = ceil(TextWidth(rangeFs))+1
		if avail-rw-7>=40 then
			rangeFs:SetWidth(rw)
			rangeFs:Show()
			avail = avail-rw-7
		else
			rangeFs:Hide()
		end
	else
		rangeFs:Hide()
	end
	nameFs:SetWidth(max(1,min(nw,avail)))

	local frac = guide and model.stepFraction or 0
	if frac>0 then
		self.progressFill:SetWidth(max(self.px,WIDTH*min(1,frac)))
		self.progressFill:Show()
	else
		self.progressFill:Hide()
	end
	return BODY_Y
end

function Viewer:RenderEmpty(model,y)
	y = y+14
	local loading = model.state=="loading"
	self:Line("archivo",13,loading and MUTED or TEXT,loading and L["styles_loading"] or L["styles_noguide"],PAD,y,INNER)
	y = y+LH(13)
	if not loading then
		y = y+10
		local b = self.chooseBtn
		b.label:SetText(L["styles_chooseguide"])
		b:SetSize(ceil(TextWidth(b.label))+28,24)
		b:ClearAllPoints()
		b:SetPoint("TOPLEFT",self.panel,"TOPLEFT",PAD,-y)
		b:Show()
		y = y+24
	end
	return y+14
end

function Viewer:RenderObjectives(model,y)
	local now = GetTime()
	local lines = model.lines or EMPTY
	-- Group each step separately so repeated quests retain their step order.
	local gap = 0
	local primary = lines[model.primary or 1]
	local groups,n = self:Group(lines,primary)
	for gi=1,n do
		local group = groups[gi]
		if group.quest then
			y = y+gap+(gi>1 and 4 or 0)
			self:Line("archivo_semibold",12,self.accent,group.quest,PAD,y,INNER)
			y = y+LH(12)
			gap = 6
		end
		for _,line in ipairs(group) do
			y = y+gap
			if line.isTip then
				y = self:TipRow(line.text,y,line)
				gap = 7
			elseif line.counted then
				y = self:CountedRow(line,y,false,now)
				gap = 9
			else
				y = self:PlainRow(line,y,false)
				gap = 7
			end
		end
		if group.primary and primary.tip and primary.tip~="" then
			y = self:TipRow(primary.tip,y+gap-3,primary)
			gap = 7
		end
	end
	return y,gap,n
end

function Viewer:RenderGuide(model,y)
	local ar,ag,ab = self.ar,self.ag,self.ab
	local now = GetTime()

	-- Previous step, done.
	local prev = model.prev and model.prev.text
	if prev and prev~="" then
		y = y+9
		local lh = LH(12)
		self:Tex(TEX_CHECK,1,ar,ag,ab,1,PAD-1,y+(lh-14)/2,14,14)
		self:Line("archivo",12,DIM,prev,PAD+19,y,INNER-19)
		y = y+lh
	end

	local gap,n
	local currentTop = y
	y,gap,n = self:RenderObjectives(model,y+10)

	-- Waypoint.
	local wp = model.waypoint
	if wp and wp.x and wp.y then
		y = y+(n>0 and gap-2 or 0)
		local lh = LH(11.5)
		self:Tex(TEX_PIN,1,MUTED[1],MUTED[2],MUTED[3],1,PAD,y+(lh-12)/2,12,12)
		local text = wp.zone and ("%.1f, %.1f, %s"):format(wp.x,wp.y,wp.zone) or ("%.1f, %.1f"):format(wp.x,wp.y)
		self:Line("archivo",11.5,MUTED,text,PAD+18,y,INNER-18)
		y = y+lh
		gap = 2
	end

	-- Along the way: open objectives of sticky steps.
	self:GoalTarget((model.lines or EMPTY)[model.primary or 1],currentTop,y-currentTop,true)
	local along = model.along or EMPTY
	if #along>0 then
		y = y+max(gap,12)
		self:Tex(TEX_WHITE,0,1,1,1,0.06,PAD,y,INNER,self.px)
		y = y+10
		self:Line("archivo",11.5,MUTED,L["styles_along"],PAD,y,INNER)
		y = y+LH(11.5)
		gap = 7
		for _,line in ipairs(along) do
			y = y+gap
			if line.counted then
				y = self:CountedRow(line,y,true,now)
			elseif line.isTip then
				y = self:TipRow(line.text,y,line)
			else
				y = self:PlainRow(line,y,true)
			end
			gap = 7
		end
	end

	-- Additional steps selected in Step Display, with their full objectives.
	for _,upcoming in ipairs(model.upcoming or EMPTY) do
		y = y+12
		self:Tex(TEX_WHITE,0,1,1,1,0.07,0,y,WIDTH,self.px)
		y = y+9
		self:Line("archivo_narrow",12,MUTED,STEP_FMT:format(upcoming.stepNum,model.stepCount),PAD,y,INNER)
		y = self:RenderObjectives(upcoming,y+LH(12)+7)
	end
	y = y+12

	-- Footer: what comes next.
	local nextText = model.next and model.next.text
	if nextText and nextText~="" then
		self:Tex(TEX_WHITE,0,1,1,1,0.07,0,y,WIDTH,self.px)
		y = y+9
		local _,tw = self:Line("archivo",12,MUTED,L["styles_then"],PAD,y)
		self:Line("archivo",12,SOFT,nextText,PAD+tw+8,y,max(1,INNER-tw-8))
		y = y+LH(12)+9
	end
	return y
end

function Viewer:Render(model)
	if not model then return end
	self.model = model
	local px = Styles:Pixel(self.panel)
	if px~=self.px then self:ApplyPixel(px) end
	self:Tint(Styles:GetAccent())

	self.texts:ReleaseAll()
	self.wraps:ReleaseAll()
	self.texes:ReleaseAll()
	self.goalButtons:ReleaseAll()
	self.chooseBtn:Hide()
	self.nrows = 0
	self.nbumps = 0

	local y = self:RenderHeader(model)
	if model.state=="guide" then
		y = self:RenderGuide(model,y)
	else
		y = self:RenderEmpty(model,y)
	end
	self.panel:SetHeight(ceil(y))
	self:CloseStaleGoalMenu()

	if self.nbumps>0 then
		self.panel:SetScript("OnUpdate",Bump_OnUpdate)
		Bump_OnUpdate(self.panel)
	else
		self.panel:SetScript("OnUpdate",nil)
	end
end

---------------------------------------------------------------------------
-- Navigation
---------------------------------------------------------------------------

-- Lay out the arrow for a mode; text caches reset so the next update redraws.
function Viewer:ArrowMode(mode)
	local a = self.arrow
	a.mode = mode
	a.distKey,a.etaKey,a.titleRaw = nil,nil,false
	local travel,arrived = mode=="travel",mode=="arrived"
	self.chev:SetShown(travel)
	self.chevShadow:SetShown(travel)
	self.arrived:SetShown(arrived)
	self.distText:SetShown(travel or arrived)
	self.etaText:SetShown(travel)
	if arrived then self.distText:SetText(L["styles_arrived"]) end
	self.titleText:ClearAllPoints()
	self.titleText:SetPoint("TOP",self.arrowBody,"TOP",0,(travel or arrived) and -72 or -51)
end

--- nav is Styles.nav, or nil while the spell arrow is up. The halo points
--- instead of the arrow when the navigation option says so.
function Viewer:UpdateNav(nav)
	if self.nav=="halo" then
		Halo:UpdateNav(nav)
		nav = nil
	end
	local body = self.arrowBody
	local mode = nav and nav.mode
	if not mode or mode=="hidden" then
		if body:IsShown() then body:Hide() end
		return
	end
	local a = self.arrow
	if not body:IsShown() then body:Show() end
	if mode~=a.mode then self:ArrowMode(mode) end

	if mode=="travel" then
		local angle = nav.angle
		if angle and angle~=a.angle then
			a.angle = angle
			self.chev:SetRotation(angle)
			self.chevShadow:SetRotation(angle)
		end
		local dist,eta = nav.dist,nav.eta
		local dk = type(dist)=="number" and floor(dist) or -1
		if dk~=a.distKey then
			a.distKey = dk
			self.distText:SetText(Styles.FormatDistance(dist) or "")
		end
		local ek = type(eta)=="number" and floor(eta) or -1
		if ek~=a.etaKey then
			a.etaKey = ek
			self.etaText:SetText(Styles.FormatETA(eta) or "")
		end
	end

	local title = nav.title
	if title~=a.titleRaw then
		a.titleRaw = title
		self.titleText:SetText(type(title)=="string" and Decolor(title) or "")
	end
end
