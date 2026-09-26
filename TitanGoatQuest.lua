do return end

local name,GQ = ...
local TITAN_GOATQUEST_ID = "GoatQuest" -- MUST match the button name; TitanPanel{*}Button
local updateTable = {TITAN_GOATQUEST_ID, TITAN_PANEL_UPDATE_BUTTON}

-- just ignore all globals, this file isn't used anyway
-- GLOBAL FAMILY_ORDER,FORMATS,GetContainerNumFreeSlots,LibStub,strjoin,TITAN_BAG_ID,TITAN_PANEL_MENU_FUNC_HIDE,TITAN_PANEL_UPDATE_BUTTON,TITAN_VERSION,TitanPanelButton_SetButtonIcon,TitanPanelPluginHandle_OnUpdate,TitanPanelRightClickMenu_AddCommand,TitanPanelRightClickMenu_AddSpacer,TitanPanelRightClickMenu_AddTitle,TitanPanelRightClickMenu_AddToggleIcon,TitanPanelRightClickMenu_AddToggleLabelText,TitanPanelRightClickMenu_PrepareGoatQuestMenu,TitanPanelGoatQuestButton,TitanPanelGoatQuestButton_GetButtonText,TitanPanelGoatQuestButton_GetTooltipText,TitanPanelGoatQuestButton_OnClick,TitanPanelGoatQuestButton_OnEvent,TitanPanelGoatQuestButton_OnLoad,TitanPanelGoatQuestButton_OnUpdate,TitanPanelGoatQuestButton_ShowDetailedInfo,TitanPanelGoatQuestButton_GOATQUESTGV_LOADING,TitanPlugins,TitanToggleVar,GQ
-- GLOBAL addon,data,free,size,GQName

local L = LibStub("AceLocale-3.0"):GetLocale("Titan", true)
local AceTimer = LibStub("AceTimer-3.0")
local BagTimer

local TitanPanelGoatQuestButton_GOATQUESTGV_STEP_CHANGED

function TitanPanelGoatQuestButton_OnLoad(self)
	if not TITAN_VERSION then return end
	self.registry = {
		id = TITAN_GOATQUEST_ID,
		--          builtIn = 1,
		category = "General",
		version = GQ.version,
		menuText = "GoatQuest",
		buttonTextFunction = "TitanPanelGoatQuestButton_GetButtonText",
		tooltipTitle = "GoatQuest",
		tooltipTextFunction = "TitanPanelGoatQuestButton_GetTooltipText", 
		icon = GQ.SKINSDIR .. "goatquest-icon",
		iconWidth = 16,
		iconCoords = {0,1,0,0.25},
		controlVariables = {
			ShowIcon = true,
			ShowLabelText = true,
			ShowRegularText = false,
			ShowColoredText = true,
			DisplayOnRightSide = false
		},
		savedVariables = {
			ShowUsedSlots = 1,
			ShowDetailedInfo = false,
			CountAmmoPouchSlots = false,
			CountShardBagSlots = false,
			CountProfBagSlots = false,
			ShowIcon = 1,
			ShowLabelText = 1,
			ShowColoredText = 1,               
		}
	}

	self:RegisterEvent("PLAYER_ENTERING_WORLD");
	GQ:AddMessageHandler("GQ_STEP_CHANGED",TitanPanelGoatQuestButton_GOATQUESTGV_STEP_CHANGED)
	GQ:AddMessageHandler("GQ_LOADING",TitanPanelGoatQuestButton_GOATQUESTGV_LOADING)
end

-- **************************************************************************
-- NAME : TitanPanelGoatQuestButton_OnEvent()
-- DESC : Parse events registered to plugin and act on them
-- **************************************************************************
function TitanPanelGoatQuestButton_GOATQUESTGV_STEP_CHANGED(num)
	TitanPanelGoatQuestButton:SetScript("OnUpdate", TitanPanelGoatQuestButton_OnUpdate)
end

function TitanPanelGoatQuestButton_GOATQUESTGV_LOADING(progress)
	TitanPanelGoatQuestButton:SetScript("OnUpdate", TitanPanelGoatQuestButton_OnUpdate)
end

local coordsset
function TitanPanelGoatQuestButton_OnEvent(self, event, ...)
	if not coordsset then  TitanPanelButton_SetButtonIcon(TITAN_GOATQUEST_ID, self.registry.iconCoords)  coordsset=true  end
end

function TitanPanelGoatQuestButton_OnUpdate(self)
	self:SetScript("OnUpdate", nil)
	TitanPanelPluginHandle_OnUpdate(updateTable)
end

function TitanPanelGoatQuestButton_OnClick(self, button)
	if (button == "LeftButton") then
		GQ:ToggleFrame()
	end
end


-- called by Titan
function TitanPanelGoatQuestButton_GetButtonText(id)
	--local button, id = TitanUtils_GetButton(id, true)
	if GQ.loading then return "Loading..." end
	return "Step |cffffffff"..(GQ.CurrentGuide and GQ.CurrentStepNum or "?")
end

-- called by Titan
function TitanPanelGoatQuestButton_GetTooltipText()
	local returnstring = "";

	if GQ.CurrentGuide then
		returnstring = GQ.CurrentGuide.title_short..", step "..GQ.CurrentStepNum.."\n"

		for i,goal in ipairs(GQ.CurrentStep.goals) do
			returnstring = returnstring .. "\n" .. goal:GetText(1)
		end

	else
		returnstring = "No guide"
	end

	return returnstring

	--TitanUtils_GetNormalText(L["TITAN_BAG_USED_SLOTS"])
	--TitanUtils_GetThresholdColor
	--TitanUtils_GetGreenText
	--if TitanGetVar(TITAN_GOATQUEST_ID, "ShowDetailedInfo") then
end

-- **************************************************************************
-- NAME : TitanPanelRightClickMenu_PrepareGoatQuestMenu()
-- DESC : Display rightclick menu options
-- **************************************************************************
function TitanPanelRightClickMenu_PrepareGoatQuestMenu()
	local info
		 
		 -- level 2
	--[[ -- removed for now
	if _G["UIDROPDOWNMENU_MENU_LEVEL"] == 2 then
		if _G["UIDROPDOWNMENU_MENU_VALUE"] == "Options" then
			TitanPanelRightClickMenu_AddTitle(L["TITAN_PANEL_MENU_OPTIONS"], _G["UIDROPDOWNMENU_MENU_LEVEL"])
			info = {};
			info.text = L["TITAN_BAG_MENU_SHOW_USED_SLOTS"];
			info.func = TitanPanelGoatQuestButton_ShowUsedSlots;
			info.checked = TitanGetVar(TITAN_BAG_ID, "ShowUsedSlots");
			UIDropDownMenu_AddButton(info, _G["UIDROPDOWNMENU_MENU_LEVEL"]);

			info = {};
			info.text = L["TITAN_BAG_MENU_SHOW_AVAILABLE_SLOTS"];
			info.func = TitanPanelGoatQuestButton_ShowAvailableSlots;
			info.checked = TitanUtils_Toggle(TitanGetVar(TITAN_BAG_ID, "ShowUsedSlots"));
			UIDropDownMenu_AddButton(info, _G["UIDROPDOWNMENU_MENU_LEVEL"]);
		  
			info = {};
			info.text = L["TITAN_BAG_MENU_SHOW_DETAILED"];
			info.func = TitanPanelGoatQuestButton_ShowDetailedInfo;
			info.checked = TitanGetVar(TITAN_BAG_ID, "ShowDetailedInfo");
			UIDropDownMenu_AddButton(info, _G["UIDROPDOWNMENU_MENU_LEVEL"]);
		end
		if _G["UIDROPDOWNMENU_MENU_VALUE"] == "IgnoreCont" then
			TitanPanelRightClickMenu_AddTitle(L["TITAN_BAG_MENU_IGNORE_SLOTS"], _G["UIDROPDOWNMENU_MENU_LEVEL"])
			info = {};
			info.text = L["TITAN_BAG_MENU_IGNORE_AMMO_POUCH_SLOTS"];
			info.func = TitanPanelGoatQuestButton_ToggleIgnoreAmmoPouchSlots;
			info.checked = TitanUtils_Toggle(TitanGetVar(TITAN_BAG_ID, "CountAmmoPouchSlots"));
			UIDropDownMenu_AddButton(info, _G["UIDROPDOWNMENU_MENU_LEVEL"]);

			info = {};
			info.text = L["TITAN_BAG_MENU_IGNORE_SHARD_BAGS_SLOTS"];
			info.func = TitanPanelGoatQuestButton_ToggleIgnoreShardBagSlots;
			info.checked = TitanUtils_Toggle(TitanGetVar(TITAN_BAG_ID, "CountShardBagSlots"));
			UIDropDownMenu_AddButton(info, _G["UIDROPDOWNMENU_MENU_LEVEL"]);

			info = {};
			info.text = L["TITAN_BAG_MENU_IGNORE_PROF_BAGS_SLOTS"];
			info.func = TitanPanelGoatQuestButton_ToggleIgnoreProfBagSlots;
			info.checked = TitanUtils_Toggle(TitanGetVar(TITAN_BAG_ID, "CountProfBagSlots"));
			UIDropDownMenu_AddButton(info, _G["UIDROPDOWNMENU_MENU_LEVEL"]);
		end
		return
	end
	--]]
	
	-- level 1
	TitanPanelRightClickMenu_AddTitle(TitanPlugins[TITAN_GOATQUEST_ID].menuText);

	--[[
	info = {};
	info.text = L["TITAN_PANEL_MENU_OPTIONS"];
	info.value = "Options"
	info.hasArrow = 1;
	UIDropDownMenu_AddButton(info);

	info = {};
	info.text = L["TITAN_BAG_MENU_IGNORE_SLOTS"];
	info.value = "IgnoreCont"
	info.hasArrow = 1;
	UIDropDownMenu_AddButton(info);
	--]]

	TitanPanelRightClickMenu_AddSpacer();     
	TitanPanelRightClickMenu_AddToggleIcon(TITAN_GOATQUEST_ID);
	TitanPanelRightClickMenu_AddToggleLabelText(TITAN_GOATQUEST_ID);
	--TitanPanelRightClickMenu_AddToggleColoredText(TITAN_GOATQUEST_ID);
	TitanPanelRightClickMenu_AddSpacer();     
	TitanPanelRightClickMenu_AddCommand(L["TITAN_PANEL_MENU_HIDE"], TITAN_GOATQUEST_ID, TITAN_PANEL_MENU_FUNC_HIDE);
end



function TitanPanelGoatQuestButton_ShowDetailedInfo()
	TitanToggleVar(TITAN_BAG_ID, "ShowDetailedInfo");
end













--
do return end

local GQname,GQ = ...
local L = GQ.L

local me = GQ:NewModule('DataSource', 'AceEvent-3.0', 'AceBucket-3.0')
me.uiName = L['opt_ldb']
me.uiDesc = L['opt_ldb_desc']
me.cannotDisable = true

local dataobj = {
	type = 'data source',
	label = GQName,
	text = GQName,
	icon = [[Interface\Buttons\Button-Backpack-Up]],
	OnClick = function(_, button)
		if button == "RightButton" then
			GQ:OpenOptions()
		else
			GQ:ToggleFrame()
		end
	end,
}

function me:OnInitialize()
	self.db = me.db:RegisterNamespace(self.moduleName, {
		profile = {
		},
	})
end

local created
function me:OnEnable()
	if not created then
		LibStub('LibDataBroker-1.1'):NewDataObject(GQname, dataobj)
		created = true
	end
	self:Update()
end

local function BuildSpaceString(bags)
	wipe(size)
	wipe(free)
	for bag in pairs(bags) do
		local bagSize = C_Container.GetContainerNumSlots(bag)
		if bagSize and bagSize > 0 then
			local bagFree, bagFamily = C_Container.GetContainerNumFreeSlots(bag)
			if mod.db.profile.mergeBags then bagFamily = 0 end
			size[bagFamily] = (size[bagFamily] or 0) + bagSize
			free[bagFamily] = (free[bagFamily] or 0) + bagFree
		end
	end
	wipe(data)
	local spaceformat = FORMATS[mod.db.profile.format]
	local showIcons, showTags = mod.db.profile.showIcons, mod.db.profile.showTags
	local numIcons = 0
	for i, family in ipairs(FAMILY_ORDER) do
		if size[family] then
			local tag, icon = GQ:GetFamilyTag(family)
			local text = spaceformat:format(free[family], size[family], size[family] - free[family])
			if showIcons and icon then
				numIcons = numIcons + 1 -- fix a bug with fontstring embedding several textures
				text = string.format("%s|T%s:0:0:0:%d:64:64:4:60:4:60|t", text, icon, -numIcons)
			elseif (showIcons or showTags) and tag then
				text = strjoin(':', tag, text)
			end
			tinsert(data, text)
		end
	end
	return table.concat(data, " ")
end

function me:Update(event)
	local bags = 'booyaa' --BuildSpaceString(addon.BAG_IDS.BAGS)
	if self.atBank and self.db.profile.showBank then
		dataobj.text = "blaalalala" --string.format("%s |cff7777ff%s|r", bags, BuildSpaceString(GQ.BAG_IDS.BANK))
	else
		dataobj.text = bags
	end
end

function me:GetOptions()
	local handler = GQ:GetOptionHandler(self)
	local oldSet = handler.Set
	handler.Set = function(...)
		oldSet(...)
		self:Update()
	end
	return {
		format = {
			name = L['Bag usage format'],
			desc = L['Select how bag usage should be formatted in the plugin.'],
			type = 'select',
			order = 10,
			values = {
				['free/total'] = L['Free space / total space'],
				['inUse/total'] = L['Space in use / total space'],
				['free'] = L['Free space'],
				['inUse'] = L['Space in use']
			}
		},
		showBank = {
			name = L['Show bank usage'],
			desc = L['Check this to show space at your bank in the plugin.'],
			type = 'toggle',
			order = 20,
		},
		mergeBags = {
			name = L['Merge bag types'],
			desc = L['Check this to display only one value counting all equipped bags, ignoring their type.'],
			type = 'toggle',
			order = 30,
		},
		showIcons = {
			name = L['Show bag type icons'],
			desc = L['Check this to display an icon after usage of each type of bags.'],
			type = 'toggle',
			order = 40,
			disabled = function(info) return info.handler:IsDisabled(info) or self.db.profile.mergeBags end,
		},
		showTags = {
			name = L['Show bag type tags'],
			desc = L['Check this to display an textual tag before usage of each type of bags.'],
			type = 'toggle',
			order = 50,
			disabled = function(info) return info.handler:IsDisabled(info) or self.db.profile.mergeBags end,
		},
	}, addon:GetOptionHandler(self)
end

do return end

