local name,GQ = ...
if not (GQ and GQ.ItemScore) then return end

local ItemScore = GQ.ItemScore
local GearFinder = ItemScore.GearFinder

GearFinder.PAST_DUNGEONS_LIMIT = 10 -- how many levels can user be above previous expansion cap before we start ignoring its dungeon
GearFinder.FUTURE_DUNGEONS_LIMIT = 5 -- how many levels to look ahead for future upgrades


function GearFinder:Initialise()
	GearFinder:TrimDatabase()
	GearFinder:CreateMainFrame()
	CharacterFrame:HookScript("OnShow", function() GearFinder:AttachFrame() end)
	CharacterFrame:HookScript("OnHide", function() GearFinder:RestoreBlizzardFrame() end)
end


-- unhide elements of blizzard ui we hid when showing our frame
-- no params
-- no returns
function GearFinder:RestoreBlizzardFrame()
	CharacterFrameInset:Show()
	CharacterFramePortrait:Show()
	CharacterFrameBg:Show()
	CharacterFrameTitleText:Show()
	CharacterFrameCloseButton:Show()

	if CharacterFrame.NineSlice then
		for i,v in pairs(CharacterFrame.NineSlice) do
			if type(v)=="table" and v.Show then v:Show() end
		end
		CharacterFrame.TitleContainer:Show()
	end

	if CharacterFrameTab4 and CharacterFrameTab4.GoatQuest then
		PanelTemplates_DeselectTab(CharacterFrameTab4); -- 8.2 taint error workaround
	end

	GoatQuestGearFinder:Hide()
end

-- support function for character frame system tab creation
local function OnGoatQuestTabClick(self) 
	if GoatQuestGearFinder:IsVisible() then return end
	ToggleCharacter("GoatQuestGearFinder")
	PanelTemplates_SetTab(CharacterFrame, self:GetID())

	CharacterFrameInset:Hide()
	CharacterFramePortrait:Hide()
	CharacterFrameBg:Hide()
	CharacterFrameTitleText:Hide()
	CharacterFrameCloseButton:Hide()

	if CharacterFramePortraitFrame then
		CharacterFramePortraitFrame:Hide()
		CharacterFrameTitleBg:Hide()
		CharacterFrameLeftBorder:Hide()
		CharacterFrameTopBorder:Hide()
		CharacterFrameRightBorder:Hide()
		CharacterFrameBottomBorder:Hide()
		CharacterFrameTopTileStreaks:Hide()
		CharacterFrameTopRightCorner:Hide()
		CharacterFrameBotLeftCorner:Hide()
		CharacterFrameBotRightCorner:Hide()
	end

	if CharacterFrame.NineSlice then
		for i,v in pairs(CharacterFrame.NineSlice) do
			if type(v)=="table" and v.Hide then v:Hide() end
		end
		CharacterFrame.TitleContainer:Hide()
	end

	PanelTemplates_SelectTab(CharacterFrameTab4); -- 8.2 taint error workaround
	GoatQuestGearFinder:Show()

	GearFinder:ScoreDungeonItems()
end

-- support function for character frame system tab creation
local function GoatQuestTabAnchor()
	local tab = GearFinder.BlizzardTab
	if not tab then return end
	if tab.Anchored then return end

	for i=1,CharacterFrame.numTabs do
		local previous = _G["CharacterFrameTab"..i]
		if previous and previous~=tab and previous:IsVisible() then
			tab:SetPoint("LEFT", previous, "RIGHT", 0, 0)
			tab.Anchored = true
		end
	end
end


-- support function for character frame system tab creation
local function OnNonGoatQuestClick()
	GearFinder:RestoreBlizzardFrame()
end

-- attaches goatquest gearfinder tab button to blizzard character frame, hooks functions to show/hide our frame and blizz elements
-- no params
-- no returns
function GearFinder:AttachFrame()
	if not GQ.ItemScore.GearFinder:IsEnabled() then return end

	if self.BlizzardTab then
		GoatQuestTabAnchor()
		return
	end

	local n = CharacterFrame.numTabs + 1
	local tab = CreateFrame("Button", "CharacterFrameTab"..n, CharacterFrame, "PanelTabButtonTemplate")
	tab:SetID(n)
	tab:SetText("|cfffe6000Gear Finder")
	tab:SetNormalFontObject(GameFontHighlightSmall)
	tab:Show()
	tab:SetScript("OnClick", OnGoatQuestTabClick)
	tab.GoatQuest = true
	self.BlizzardTab = tab

	GoatQuestTabAnchor()

	--PanelTemplates_SetNumTabs(CharacterFrame, n) -- 8.2 taint error
	PanelTemplates_EnableTab(CharacterFrame, n)
	PanelTemplates_TabResize(_G["CharacterFrameTab4"], nil, 100, nil, nil);
	PanelTemplates_DeselectTab(CharacterFrameTab4);

	ItemScore:SecureHook("PanelTemplates_Tab_OnClick", OnNonGoatQuestClick, true)
	--ItemScore:Hook("CharacterFrame_Expand", OnNonGoatQuestClick, true)

	--table.insert(CHARACTERFRAME_SUBFRAMES,"GoatQuestGearFinder") -- 8.2 taint error

end

function GearFinder:UpdateSystemTab()
	if GearFinder:IsEnabled() then
		if not self.BlizzardTab then 
			GearFinder:AttachFrame()
		end
		self.BlizzardTab:Show()
	else
		if self.BlizzardTab then 
			self.BlizzardTab:Hide()
			GearFinder:RestoreBlizzardFrame()
			if CharacterFrame:IsVisible() and GearFinder.MainFrame:IsVisible() then
				GearFinder.MainFrame:Hide()
				ToggleCharacter("PaperDollFrame")
			end
		end
	end
end

function GearFinder:IsEnabled()
	if not GQ.db.profile.autogear_finder then return false else return true end
end
