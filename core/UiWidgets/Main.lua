local name,GQ = ...
local GQ = GQ

local L = GQ.L
local CHAIN = GQ.ChainCall

local UI = {}
local widgets = {}

GQ.UI = UI
UI.widgets = widgets

--[[
	Returns a widget of type uiType
	@param uiType - String of the type of widget
	@param parent - parent of the widget. Can also be set later
	@param name - Global name of the widget if possible.
--]]

function UI:Create(uiType,parent,name,...)
	if not uiType or type(uiType)~="string" then return end
	uiType = uiType:upper()

	if not self.widgets[uiType] then error(uiType.." is not a valid ui type.") end

	return self.widgets[uiType]:New(parent,name,...)
end

--[[
	Register each widget so they are available in one place for use.
	@param name - Name used when attempting to create the widget.
	@param widget - The actual widget object
--]]

function UI:RegisterWidget(name,widget)
	if not (name and widget) then return end
	name = name:upper()

	self.widgets[name] = widget
end

--[[
	Reads a token from the current skin style (GoatQuest, see Skins/Default/GoatQuest/Style.lua).
--]]

function UI.SkinData(property,...)
	return GQ.CurrentSkinStyle:GetProp(property,...)
end

--[[
	Flat box: a fill and four 1px edges drawn as plain textures on `owner`.
	Regions of a frame draw below its child frames, so a box on a widget's
	frame sits under text and controls that live on child frames. The edges
	are drawn over the fill.

	local box = GQ.UI.CreateFlatBox(frame)
	box:SetPoints(region, left, top, right, bottom)   -- offsets from region's TOPLEFT / BOTTOMRIGHT
	box:SetColors(fill, edge)                         -- {r,g,b,a} tables
--]]

local FlatBox = {}
FlatBox.__index = FlatBox

function UI.CreateFlatBox(owner)
	local white = GQ.SKINSDIR.."white"
	local box = setmetatable({owner=owner},FlatBox)
	box.fill = owner:CreateTexture(nil,"BACKGROUND",nil,1)
	box.fill:SetTexture(white)
	box.edges = {}
	for i,side in ipairs({"TOP","BOTTOM","LEFT","RIGHT"}) do
		local t = owner:CreateTexture(nil,"BORDER",nil,1)
		t:SetTexture(white)
		t.side = side
		box.edges[i] = t
	end
	return box
end

function FlatBox:SetPoints(region,left,top,right,bottom)
	local fill = self.fill
	fill:ClearAllPoints()
	fill:SetPoint("TOPLEFT",region,"TOPLEFT",left or 0,top or 0)
	fill:SetPoint("BOTTOMRIGHT",region,"BOTTOMRIGHT",right or 0,bottom or 0)
	for _,t in ipairs(self.edges) do
		t:ClearAllPoints()
		if t.side=="TOP" or t.side=="BOTTOM" then
			t:SetPoint(t.side.."LEFT",fill,t.side.."LEFT")
			t:SetPoint(t.side.."RIGHT",fill,t.side.."RIGHT")
			t:SetHeight(1)
		else
			t:SetPoint("TOP"..t.side,fill,"TOP"..t.side,0,-1)
			t:SetPoint("BOTTOM"..t.side,fill,"BOTTOM"..t.side,0,1)
			t:SetWidth(1)
		end
	end
	return self
end

function FlatBox:SetColors(fill,edge)
	if fill then self.fill:SetVertexColor(unpack(fill)) end
	if edge then self:SetEdgeColor(edge) end
	return self
end

function FlatBox:SetEdgeColor(edge)
	for _,t in ipairs(self.edges) do t:SetVertexColor(unpack(edge)) end
	return self
end

function FlatBox:SetShown(shown)
	self.fill:SetShown(shown)
	for _,t in ipairs(self.edges) do t:SetShown(shown) end
	self.shown = shown and true or false
	return self
end

function FlatBox:Show() return self:SetShown(true) end
function FlatBox:Hide() return self:SetShown(false) end
function FlatBox:IsShown() return self.shown~=false end

--[[
	Thin scroll bar for Blizzard slider scroll bars (UIPanelScrollBarTemplate and
	plain sliders): no arrow buttons, a narrow thumb in ScrollBarColor.
--]]

function UI.StyleFlatScrollBar(scrollbar,background)
	local SkinData = UI.SkinData
	local thumb = scrollbar.ThumbTexture or (scrollbar.GetThumbTexture and scrollbar:GetThumbTexture())
	if not thumb then
		scrollbar:SetThumbTexture(GQ.SKINSDIR.."white")
		thumb = scrollbar:GetThumbTexture()
	end
	thumb:SetTexture(GQ.SKINSDIR.."white")
	thumb:SetTexCoord(0,1,0,1)
	thumb:SetVertexColor(unpack(SkinData("ScrollBarColor")))
	thumb:SetWidth(SkinData("ScrollBarThumbWidth") or 4)
	thumb:SetHeight(32)
	for _,key in ipairs({"ScrollUpButton","ScrollDownButton"}) do
		local button = scrollbar[key]
		if button then
			button:SetAlpha(0)
			button:EnableMouse(false)
		end
	end
	if background then background:SetColorTexture(0,0,0,0) end
	if scrollbar.SetBackdrop then scrollbar:SetBackdrop(nil) end
end

-- Takes a previous time and returns a string of how long it has been since that time.
-- TODO this probably needs a better home.

function UI.GetTimeStamp(lasttime)
	if not lasttime then lasttime = time() end
	if type(lasttime)~="number" then print("GetTimeStamp: needs a number", type(lasttime)) return end


	local time = floor(time() - lasttime)
	local s = ""

	if time >= 3600*24 then
		time = floor(time / (3600*24))
		if time == 1 then s = "%d day ago" else s = "%d days ago" end
	elseif time >= 3600 then
		time = floor(time / 3600)
		if time == 1 then s = "%d hour ago" else s = "%d hours ago" end
	elseif time >= 60 then
		time = floor(time / 60)
		if time == 1 then s = "%d min ago" else s = "%d mins ago" end
	else
		s = "less than a min ago"
		--if time == 1 then s = "%d sec ago" else s = "%d secs ago" end
	end

	--local s = FriendsFrame_GetLastOnline(lasttime)
	--return ("%s ago"):format(s)
	return s:format(time)
end

--[[

local function buildframestart()
	BuildFrame = CHAIN(CreateFrame("Frame","Build",UIParent))
			:SetBackdrop(SkinData("Backdrop"))
			:SetBackdropColor(unpack(SkinData("BackdropColor")))
			:SetBackdropBorderColor(unpack(SkinData("BackdropBorderColor")))
			:SetPoint("LEFT",100,0)
			:SetSize(250,100)
			:SetMovable(true) :SetClampedToScreen(true) :RegisterForDrag("LeftButton")
			:SetScript("OnDragStart",function(self) self:StartMoving() end)
			:SetScript("OnDragStop",function(self) self:StopMovingOrSizing() end)
			:Show()
	.__END
end

tinsert(GQ.startups,function(self)
	buildframestart()

	local button = CHAIN(GQ.UI:Create("Button",BuildFrame,"But"))
		:SetPoint("LEFT",25,0)
		:SetText("Text Set")
		:SetFont(FONTBOLD,12)
		:SetTextColor(1,0,0)

end)

--]]