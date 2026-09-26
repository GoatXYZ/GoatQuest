--[[-----------------------------------------------------------------------------
Heading Widget
-------------------------------------------------------------------------------]]
local Type, Version = "Heading-Z", 20
local AceGUI = LibStub and LibStub("AceGUI-3.0-Z", true)
if not AceGUI or (AceGUI:GetWidgetVersion(Type) or 0) >= Version then return end

-- Lua APIs
local pairs = pairs

-- WoW APIs
local CreateFrame, UIParent = AceGUI.CreateFrameWithBG, UIParent

--[[-----------------------------------------------------------------------------
Methods
-------------------------------------------------------------------------------]]
local methods = {
	["OnAcquire"] = function(self)
		self:ApplySkin()
		self:SetText()
		self:SetFullWidth()
		self:SetHeight(18)
		self:SetFontObject()
	end,

	-- ["OnRelease"] = nil,

	-- GoatQuest skin: a left-aligned SemiBold title followed by a hairline.
	["ApplySkin"] = function(self)
		local GQ = GQ
		local SkinData = GQ and GQ.UI and GQ.UI.SkinData
		self.flat = SkinData and SkinData("StyleAceGUI") and SkinData("AceGUIFlat") and true or nil
		local label, right = self.label, self.right
		label:ClearAllPoints()
		if self.flat then
			label:SetPoint("TOPLEFT")
			label:SetPoint("BOTTOMLEFT")
			label:SetJustifyH("LEFT")
			right:SetTexture(GQ.SKINSDIR.."white")
			right:SetTexCoord(0, 1, 0, 1)
			right:SetHeight(1)
			right:SetVertexColor(unpack(SkinData("Hairline")))
			self.left:Hide()
		else
			label:SetPoint("TOP")
			label:SetPoint("BOTTOM")
			label:SetJustifyH("CENTER")
			right:SetTexture(137057) -- Interface\Tooltips\UI-Tooltip-Border
			right:SetTexCoord(0.81, 0.94, 0.5, 1)
			right:SetHeight(8)
			right:SetVertexColor(1, 1, 1, 1)
			self.left:Show()
		end
	end,

	["SetText"] = function(self, text)
		self.label:SetText(text or "")
		if self.flat then
			self.right:ClearAllPoints()
			self.right:SetPoint("RIGHT", -3, 0)
			if text and text ~= "" then
				self.right:SetPoint("LEFT", self.label, "RIGHT", 8, 0)
			else
				self.right:SetPoint("LEFT", 3, 0)
			end
			self.right:Show()
			return
		end
		if text and text ~= "" then
			self.left:SetPoint("RIGHT", self.label, "LEFT", -5, 0)
			self.right:Show()
		else
			self.left:SetPoint("RIGHT", -3, 0)
			self.right:Hide()
		end
	end,

	["SetFontObject"] = function(self, font)
		self.label:SetFontObject(font or GameFontNormal)
		if self.flat and GQ.FontBold then
			local _, size = (font or GameFontNormal):GetFont()
			self.label:SetFont(GQ.FontBold, size or 12, "")
		end
	end,
}

--[[-----------------------------------------------------------------------------
Constructor
-------------------------------------------------------------------------------]]
local function Constructor()
	local frame = CreateFrame("Frame", nil, UIParent)
	frame:Hide()

	local label = frame:CreateFontString(nil, "BACKGROUND", "GameFontNormal")
	label:SetPoint("TOP")
	label:SetPoint("BOTTOM")
	label:SetJustifyH("CENTER")

	local left = frame:CreateTexture(nil, "BACKGROUND")
	left:SetHeight(8)
	left:SetPoint("LEFT", 3, 0)
	left:SetPoint("RIGHT", label, "LEFT", -5, 0)
	left:SetTexture(137057) -- Interface\\Tooltips\\UI-Tooltip-Border
	left:SetTexCoord(0.81, 0.94, 0.5, 1)

	local right = frame:CreateTexture(nil, "BACKGROUND")
	right:SetHeight(8)
	right:SetPoint("RIGHT", -3, 0)
	right:SetPoint("LEFT", label, "RIGHT", 5, 0)
	right:SetTexture(137057) -- Interface\\Tooltips\\UI-Tooltip-Border
	right:SetTexCoord(0.81, 0.94, 0.5, 1)

	local widget = {
		label = label,
		left  = left,
		right = right,
		frame = frame,
		type  = Type
	}
	for method, func in pairs(methods) do
		widget[method] = func
	end

	return AceGUI:RegisterAsWidget(widget)
end

AceGUI:RegisterWidgetType(Type, Constructor, Version)
