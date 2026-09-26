local GQ = GQ
local L = GQ.L
local CHAIN = GQ.ChainCall
local FONT=GQ.Font
local FONTBOLD=GQ.FontBold
local SkinData = GQ.UI.SkinData
local GQ_Widget_Object_Mixin = GQ_Widget_Object_Mixin

local widget={
	ident = "renown",
	group = "covenant",
	sizes = {
		{width = 2,height = 1}
	},
	sizelimits = {
		minwidth = 2, 
		minheight = 1,
		maxwidth = 2,
		maxheight = 1,
	},
	events = {
		COVENANT_SANCTUM_RENOWN_LEVEL_CHANGED=true,
	},
	valid = GQ.IsRetail,
}

function widget:Initialise()
	self.frame = GQ.UI:Create("Button",GQ.Widgets.Parent,nil,nil,"GQ_Widget_Template")
	self.frame.header = CHAIN(self.frame:CreateFontString())
		:SetFont(FONTBOLD,14) 
		:SetTextColor(1,1,1,1)
		:SetText(L["widget_renown_header"])
		:SetIgnoreParentAlpha(true)
	.__END
	self.frame.text = CHAIN(self.frame:CreateFontString())
		:SetFont(FONT,18) 
		:SetTextColor(1,1,1,1)
		:SetText("")
		:SetIgnoreParentAlpha(true)
	.__END

	self.frame.header:SetPoint("BOTTOM",self.frame.text,"TOP",0,2)
	self.frame.text:SetPoint("CENTER")

	Mixin(self,GQ_Widget_Object_Mixin)
end

function widget:Update()
	local renownid = {
		1829, -- 1 Kyrian
		1830, -- 2 Venthyr
		1831, -- 3 NightFae
		1832  -- 4 Necrolord
	}

	local coven = C_Covenants.GetActiveCovenantID()
	if not coven then return end
	if not renownid[coven] then return end

	local currency = C_CurrencyInfo.GetCurrencyInfo(renownid[coven])
	local renown = C_CovenantSanctumUI.GetRenownLevel()

	self.frame.text:SetText(L["widget_renown_format"]:format(renown,max(80,renown))) -- server incorrectly reports 79 as max renown
end

function widget:OnEvent(event,...)
	self:Update()
end

GQ.Widgets:RegisterWidget(widget)