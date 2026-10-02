--[[-----------------------------------------------------------------------------
Button Widget
Graphical Button.
-------------------------------------------------------------------------------]]
local Type, Version = "Button-Z", 24
local AceGUI = LibStub and LibStub("AceGUI-3.0-Z", true)
if not AceGUI or (AceGUI:GetWidgetVersion(Type) or 0) >= Version then return end

-- Lua APIs
local pairs = pairs

-- WoW APIs
local _G = _G
local PlaySound, CreateFrame, UIParent = PlaySound, AceGUI.CreateFrameWithBG, UIParent

--[[-----------------------------------------------------------------------------
Scripts
-------------------------------------------------------------------------------]]
local function Button_OnClick(frame, ...)
	AceGUI:ClearFocus()
	PlaySound(852) -- SOUNDKIT.IG_MAINMENU_OPTION
	frame.obj:Fire("OnClick", ...)
end

local function Control_OnEnter(frame)
	frame.obj:Fire("OnEnter")
end

local function Control_OnLeave(frame)
	frame.obj:Fire("OnLeave")
end

--[[-----------------------------------------------------------------------------
Support functions
-------------------------------------------------------------------------------]]
-- Button labels in the GoatQuest skin: GQ.FontBold (Archivo SemiBold) at 12 in
-- the text colour, ink on the gold "Accent" style, dim when disabled. Font
-- objects rather than SetTextColor, since the button re-applies its font
-- objects whenever its state changes.
local buttonFonts = {}
local function ButtonFont(key, color)
	local font = buttonFonts[key]
	if not font then
		font = CreateFont("GoatQuestAceButtonFont"..key)
		buttonFonts[key] = font
	end
	local GQ = GQ
	font:SetFont(GQ.FontBold or GQ.Font, GQ.UI.SkinData("AceGUIButtonFontSize") or 12, "")
	font:SetTextColor(unpack(color))
	return font
end

--[[-----------------------------------------------------------------------------
Methods
-------------------------------------------------------------------------------]]
local methods = {
	["OnAcquire"] = function(self)
		-- restore default values
		self:SetHeight(24)
		self:SetWidth(200)
		self:SetDisabled(false)
		self:SetAutoWidth(false)
		self:SetText()
		self:SetFontObject()
		self:SetHighlightFontObject()
		self:ApplySkin()
		self:SetStyle()
	end,

	-- ["OnRelease"] = nil,

	["SetText"] = function(self, text)
		self.text:SetText(text)
		if self.autoWidth then
			self:SetWidth(self.text:GetStringWidth() + 30)
		end
	end,
	
	["SetAutoWidth"] = function(self, autoWidth)
		self.autoWidth = autoWidth
		if self.autoWidth then
			self:SetWidth(self.text:GetStringWidth() + 30)
		end
	end,

	["SetDisabled"] = function(self, disabled)
		self.disabled = disabled
		if disabled then
			self.frame:Disable()
		else
			self.frame:Enable()
		end
	end,

	["SetFontObject"] = function(self, font)
		self.frame:SetNormalFontObject(font or GameFontNormal)
	end,

	["SetHighlightFontObject"] = function(self, font)
		self.frame:SetHighlightFontObject(font or GameFontHighlight)
	end,

	["SetStyle"] = function(self, style)
		self.style = style or "default"
	end,

	["ApplySkin"] = function(self)
		local GQ = GQ
		local SkinData = GQ.UI.SkinData
		local CHAIN=GQ.ChainCall

		if not SkinData("StyleAceGUI") then return end

		self:SetHeight(24)

		CHAIN(self.frame)
			:SetBackdrop(SkinData("AceGUIButtonTexture"))
			:SetBackdropColor(unpack(SkinData("AceGUIButtonTextureColor")))
			:SetBackdropBorderColor(unpack(SkinData("AceGUIButtonTextureColor")))


		local accent = self.style=="Accent"
		if accent then
			CHAIN(self.frame)
			:SetBackdropColor(unpack(SkinData("Accent")))
			:SetBackdropBorderColor(unpack(SkinData("Accent")))
		end

		if SkinData("AceGUIFlat") then
			local color = SkinData(accent and "AceGUIButtonAccentTextColor" or "AceGUIButtonTextColor")
			local font = ButtonFont(accent and "Accent" or "Normal", color)
			self.frame:SetNormalFontObject(font)
			self.frame:SetHighlightFontObject(font)
			self.frame:SetDisabledFontObject(ButtonFont("Disabled", SkinData("AceGUIButtonTextColorDisabled")))
			self.frame:SetPushedTextOffset(0,0)
		end
		self.text:SetTextColor(unpack(SkinData(accent and "AceGUIButtonAccentTextColor" or "AceGUIButtonTextColor") or SkinData("AceGUIButtonTextColor")))

		-- The hover tint covers the button exactly.
		CHAIN(self.frame:GetHighlightTexture())
			:SetTexture(GQ.SKINSDIR.."white")
			:SetVertexColor(unpack(SkinData("AceGUIButtonHighlightColor") or {1,1,1,0.2}))
			:SetTexCoord(0,1,0,1)
			:SetBlendMode("BLEND")
			:ClearAllPoints()
			:SetAllPoints(self.frame)

		self.frame.Left:Hide()
		self.frame.Middle:Hide()
		self.frame.Right:Hide()


	end,
}

--[[-----------------------------------------------------------------------------
Constructor
-------------------------------------------------------------------------------]]
local function Constructor()
	local name = AceGUI.Prefix.."Button" .. AceGUI:GetNextWidgetNum(Type)
	local frame = CreateFrame("Button", name, UIParent, "UIPanelButtonTemplate,BackdropTemplate")
	frame:Hide()

	frame:EnableMouse(true)
	frame:SetScript("OnClick", Button_OnClick)
	frame:SetScript("OnEnter", Control_OnEnter)
	frame:SetScript("OnLeave", Control_OnLeave)

	local text = frame:GetFontString()
	text:ClearAllPoints()
	text:SetPoint("TOPLEFT", 15, -1)
	text:SetPoint("BOTTOMRIGHT", -15, 1)
	text:SetJustifyV("MIDDLE")

	local widget = {
		text  = text,
		frame = frame,
		type  = Type
	}
	for method, func in pairs(methods) do
		widget[method] = func
	end

	return AceGUI:RegisterAsWidget(widget)
end

AceGUI:RegisterWidgetType(Type, Constructor, Version)
