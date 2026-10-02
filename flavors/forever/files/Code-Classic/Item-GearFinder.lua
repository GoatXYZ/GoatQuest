local name,GQ = ...
local GearFinder = GQ.ItemScore.GearFinder

GearFinder.PAST_DUNGEONS_LIMIT = 30 -- how many levels can user be above previous expansion cap before we start ignoring its dungeon
GearFinder.FUTURE_DUNGEONS_LIMIT = 5 -- how many levels to look ahead for future upgrades

function GearFinder:Initialise()
	GearFinder:CreateMainFrame()

	GearFinder.MainFrame:SetScript("OnHide",function() 
		CharacterNameText:Show()
		CharacterFramePortrait:Show()
		CharacterFrameCloseButton:Show()
	end)
end

local L = GQ.L
local G = _G
local FONT=GQ.Font
local FONTBOLD=GQ.FontBold
local CHAIN = GQ.ChainCall
local ui = GQ.UI
local SkinData = ui.SkinData

local tinsert,tremove,print,ipairs,pairs,wipe,debugprofilestop=tinsert,tremove,print,ipairs,pairs,wipe,debugprofilestop
local IsQuestFlaggedCompleted = C_QuestLog.IsQuestFlaggedCompleted

local ItemScore = GQ.ItemScore

local PAST_DUNGEONS_LIMIT = 30 -- how many levels can user be above min level before we start ignoring its dungeon
local FUTURE_DUNGEONS_LIMIT = 5 -- how many levels to look ahead for future upgrades

-- support function for character frame system tab creation
local function OnNonGoatQuestClick()
	if GearFinder.MainFrame:IsVisible() then
		CharacterNameText:Show()
		CharacterFramePortrait:Show()
		CharacterFrameCloseButton:Show()
		GearFinder.MainFrame:Hide()
	end
end

function GearFinder:AttachFrame()
	self.PaperDollButton = GQ.ChainCall(CreateFrame("BUTTON",nil,PaperDollFrame,"GoatQuestSpecialButton_Template"))
		:ApplySkin()
		:SetSize(32,32)
		:SetPoint("TOPRIGHT", PaperDollFrame, "TOPRIGHT", -40, -40)
		:SetFrameStrata("HIGH")
		:SetFrameLevel(611)
		:SetScript("OnClick", function() 
			GearFinder:ShowFinder()	
		end)
		:SetScript("OnEnter",function(self) 
			CHAIN(GameTooltip):SetOwner(self, "ANCHOR_TOP") 
			:SetText("Toggle GoatQuest Gear Finder") 
			:Show() 
			end)
		:SetScript("OnLeave",function(self) GameTooltip:Hide() end)
	.__END

	if GQ.IsClassicSoD then
		self.PaperDollButton:ClearAllPoints()
		self.PaperDollButton:SetPoint("RIGHT",RuneFrameControlButton,"LEFT",-5,-2)
	end

	if GQ.ItemScore.GearFinder:IsEnabled() then
		self.PaperDollButton:Show()
	else
		self.PaperDollButton:Hide()
	end
end

function GearFinder:UpdateSystemTab()
	if GQ.ItemScore.GearFinder:IsEnabled() then
		GearFinder.PaperDollButton:Show()
	else
		GearFinder.PaperDollButton:Hide()
		GearFinder.MainFrame:Hide()
	end
end

function GearFinder:ShowFinder()
	if GoatQuestGearFinder:IsVisible() then GearFinder.MainFrame:Hide() return end
	if not GearFinder.HookedChar then
		ItemScore:Hook("CharacterFrameTab_OnClick", OnNonGoatQuestClick, true)
		GearFinder.HookedChar = true
	end

	CharacterNameText:Hide()
	CharacterFramePortrait:Hide()
	CharacterFrameCloseButton:Hide()
	PaperDollFrame:Hide()

	for i=1,CharacterFrame.numTabs do
		PanelTemplates_DeselectTab(_G["CharacterFrameTab"..i])
	end

	GoatQuestGearFinder:Show()
	GearFinder:ScoreDungeonItems()
end

function GearFinder:IsEnabled()
	if not GQ.db.profile.autogear_finder then return false else return true end
end