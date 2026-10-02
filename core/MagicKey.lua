local name,GQ = ...

local FR

local CHAIN = GQ.ChainCall

GQ.MagicKey = {}
local MK=GQ.MagicKey

function MK:CreateFrame()
	if FR then return FR end

	FR = CHAIN(CreateFrame("Frame", "GoatQuest_MagicKeyHint", UIParent))
	 :SetSize(1,1)
	 :SetPoint("BOTTOMRIGHT",UIParent,"BOTTOMRIGHT",-100,100)
	 :Show()
	 .__END
	self.FR = FR

	FR.Label = CHAIN(FR:CreateFontString(nil,nil,"SystemFont_Shadow_Med1"))
	 :SetPoint("RIGHT")
	 :SetJustifyH("RIGHT") :SetJustifyV("MIDDLE") :SetHeight(30)
	 :SetFont(STANDARD_TEXT_FONT,16)
	 :SetText("")
	 :Show()
	 .__END

	FR.Button = CHAIN(CreateFrame("Button", "GoatQuest_MagicKeyHint_Button", FR))
	 :SetScript("OnClick",GQ.MagicButton_OnClick)
	 :EnableMouse()
	 :Enable()
	 :Show()
	 .__END

	return FR
end

function MK:SetHint(s)
	FR.Label:SetText(s)
end