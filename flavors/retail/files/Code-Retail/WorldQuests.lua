local name,GQ = ...

local WorldQuests = {}
GQ.WorldQuests = WorldQuests

local L = GQ.L
local ui = GQ.UI
local SkinData = ui.SkinData
local CHAIN = GQ.ChainCall
local FONT=GQ.Font
local FONTBOLD=GQ.FontBold
local FONTSTATUS="Fonts\\ARIALN.TTF"
local LibRover=LibStub("LibRover-1.0")

local min,max,hooksecurefunc,round,CreateFrame = min,max,hooksecurefunc,round,CreateFrame
local Enum = Enum
local C_Map,C_Reputation,C_QuestLog,C_TaskQuest = C_Map,C_Reputation,C_QuestLog,C_TaskQuest
local GameTooltip,WorldMapFrame = GameTooltip,WorldMapFrame

function WorldQuests.UpdateSorting(widget,field)  -- NOT called with a colon; called from a ScrollTable widget.
	if GQ.db.profile.WQSorting[1] == field then
		if GQ.db.profile.WQSorting[2] == "desc" then
			GQ.db.profile.WQSorting = {field,"asc"}
		else
			GQ.db.profile.WQSorting = {field,"desc"}
		end
	else
		GQ.db.profile.WQSorting = {field,"asc"}
	end

	WorldQuests.needToUpdate = true
	WorldQuests.useCache = true
end

local DATATABLE_COLUMNS = {
	{ title="", width=12, headerwidth=12, titlej="LEFT", textj="LEFT", name="toggle", type="toggle"},
	{ title="", width=20, headerwidth=20, titlej="LEFT", textj="LEFT", name="icon", type="icon", texture="_iconsets_worldquest_" },
	{ title=L["wqp_col_NAME"], width=100, titlej="LEFT", textj="LEFT", name="name", sortable=true, sortfunction=WorldQuests.UpdateSorting, onentertooltip=function(row) WorldQuests:ShowTooltipQuest(row) end, tooltipanchor="ANCHOR_BOTTOM" },
	{ title="", width=20, headerwidth=20, titlej="LEFT", textj="LEFT", name="rewardicon", type="icon", onentertooltip=function(row) WorldQuests:ShowTooltipReward(row) end, tooltipanchor="ANCHOR_BOTTOM" },
	{ title=L["wqp_col_REWARDS"], width=80, titlej="LEFT", textj="LEFT", name="rewards", sortable=true, sortfunction=WorldQuests.UpdateSorting, onentertooltip=function(row) WorldQuests:ShowTooltipReward(row) end, tooltipanchor="ANCHOR_BOTTOM" },
	{ title=L["wqp_col_FACTION"], width=65, titlej="LEFT", textj="LEFT", name="faction", sortable=true, sortfunction=WorldQuests.UpdateSorting, onentertooltip=function(row) WorldQuests:ShowTooltipFaction(row) end, tooltipanchor="ANCHOR_BOTTOM"  },
	{ title=L["wqp_col_TIME"], width=60, titlej="LEFT", textj="LEFT", name="time", sortable=true, sortfunction=WorldQuests.UpdateSorting },
	{ title=L["wqp_col_ZONE"], width=90, titlej="LEFT", textj="LEFT", name="zone", sortable=true, sortfunction=WorldQuests.UpdateSorting },
}

local DATATABLE_DATA = {
	ROW_COUNT = 20,
	LIST_WIDTH = 518,
	LIST_HEIGHT = 455,
	ROW_ICONSIZE = 20,
	HEADERY = -5,
	POSX = 0,
	POSY = -55,
	STRATA = "HIGH",
	ROWBACKGROUND = true,
}

local WQ_TYPES = {
	{ text="Regular", value=Enum.QuestTagType.Normal},
	{ text="PVP", value=Enum.QuestTagType.PvP},
	{ text="Dungeons", value=Enum.QuestTagType.Dungeon},
	{ text="Raid", value=Enum.QuestTagType.Raid},
	{ text="Invasion", value=Enum.QuestTagType.Invasion},
	{ text="Professions", value=Enum.QuestTagType.Profession},
	{ text="Pet Battles", value=Enum.QuestTagType.PetBattle},
}

local WQ_REWARDS = { -- checks for specific currencies are in isvalid
	{ text="Voidlight Marl", value=3316, exp="mid"},
	{ text="The Singularity", value=3389, exp="mid"},
	{ text="Bloody Tokens", value=2123, exp="mid"},
	{ text="Coffer Key Shards", value=3310, exp="mid"},
	{ text="Resonance Crystals", value=2815, exp="tww"},
	{ text="Valorstones", value=3008, exp="tww"},
	{ text="Anima", value="anima", exp="sha"},
	{ text="Order resources", value=1220, exp="leg"},
	{ text="Wakening essence", value=1533, exp="leg"},
	{ text="Azerite power", value=1553, exp="bfa"},
	{ text="War resources", value=1560, exp="bfa"},

	{ text="Reputation", value="reputation"},
	{ text="Other resources", value="resources"},
	{ text="Gold", value="gold"},
	{ text="Gear", value="gear"},
	{ text="Other", value="other"},
}

local faction_data = {
	[2103] = {quest=50598, exp="bfa", faction="Horde", engname="Zandalari Empire", fileID=2203921},			-- Zandalari Empire        
	[2156] = {quest=50602, exp="bfa", faction="Horde", engname="Talanji's Expedition", fileID=2203918},		-- Talanji's Expedition    
	[2158] = {quest=50603, exp="bfa", faction="Horde", engname="Voldunai", fileID=2203920},				-- Voldunai                
	[2157] = {quest=50606, exp="bfa", faction="Horde", engname="The Honorbound", fileID=2203914},			-- The Honorbound          
	[2160] = {quest=50599, exp="bfa", faction="Alliance", engname="Proudmoore Admiralty", fileID=2203916},	-- Proudmoore Admiralty    
	[2159] = {quest=50605, exp="bfa", faction="Alliance", engname="7th Legion", fileID=2203912},			-- 7th Legion              
	[2161] = {quest=50600, exp="bfa", faction="Alliance", engname="Order of Embers", fileID=2203915},			-- Order of Embers         
	[2162] = {quest=50601, exp="bfa", faction="Alliance", engname="Storm's Wake", fileID=2203917},			-- Storm's Wake            
	[2164] = {quest=50562, exp="bfa", engname="Champions of Azeroth", fileID=2203913},				-- Champions of Azeroth    
	[2163] = {quest=50604, exp="bfa", engname="Tortollan Seekers", fileID=2203919},				-- Tortollan Seekers       

	[2400] = {quest=56119, exp="bfa", faction="Alliance", engname="Waveblade Ankoan", fileID=2909043},		-- Waveblade Ankoan       
	[2373] = {quest=56120, exp="bfa", faction="Horde", engname="The Unshackled", fileID=2821782},		-- The Unshackled       

	[2391] = {quest=-1, exp="bfa", engname="Rustbolt Resistance", fileID=2909316, zone=1462},			-- Rustbolt Resistance, no emissary, match by zone

	[1883] = {quest=42170, exp="leg", engname="Dreamweavers", fileID=1450995},			-- Dreamweavers            
	[1828] = {quest=42233, exp="leg", engname="Highmountain Tribe", fileID=1450996},	-- Highmountain Tribe      
	[1948] = {quest=42234, exp="leg", engname="Valarjar", fileID=1450999},				-- Valarjar                
	[1900] = {quest=42420, exp="leg", engname="Court of Farondis", fileID=1450994},		-- Court of Farondis       
	[1859] = {quest=42421, exp="leg", engname="The Nightfallen", fileID=1450998},			-- The Nightfallen         
	[1894] = {quest=42422, exp="leg", engname="The Wardens", fileID=1451000},				-- The Wardens             
	[1090] = {quest=43179, exp="leg", engname="The Kirin Tor of Dalaran", fileID=1450997},		-- The Kirin Tor of Dalaran
	[2045] = {quest=46777, exp="leg", engname="Legionfall", fileID=1708507},			-- Legionfall              
	[2165] = {quest=48639, exp="leg", engname="Army of the Light", fileID=1708506},		-- Army of the Light       
	[2045] = {quest=48641, exp="leg", engname="Armies of Legionfall", fileID=1708507},		-- Armies of Legionfall    
	[2170] = {quest=48642, exp="leg", engname="Argussian Reach", fileID=1708505},		-- Argussian Reach         

	[2465] = {quest=-1, exp="sha", engname="The Wild Hunt", fileID=3641394},			-- The Wild Hunt            
	[2410] = {quest=-1, exp="sha", engname="The Undying Army", fileID=3641396},		-- The Undying Army            
	[2407] = {quest=-1, exp="sha", engname="The Ascended", fileID=3641395},			-- The Ascended
	[2413] = {quest=-1, exp="sha", engname="Court of Harvesters", fileID=3641397},		-- Court of Harvesters

	[2503] = {quest=-1, exp="dra", engname="Maruuk Centaur", fileID=4687627},			-- Maruuk Centaur
	[2507] = {quest=-1, exp="dra", engname="Dragonscale Expedition", fileID=4687628},		-- Dragonscale Expedition
	[2510] = {quest=-1, exp="dra", engname="Valdrakken Accord", fileID=4687630},		-- Valdrakken Accord
	[2511] = {quest=-1, exp="dra", engname="Iskaara Tuskarr", fileID=4687629},			-- Iskaara Tuskarr

	--[2544] = {quest=0, exp="dra", engname="Artisan's Consortium", fileID=},		-- Artisan's Consortium 
	--[2517] = {quest=0, exp="dra", engname="Wrathion", fileID=},			-- Wrathion
	--[2522] = {quest=0, exp="dra", engname="Clan Teerai", fileID=},			-- Clan Teerai
	--[2520] = {quest=0, exp="dra", engname="Clan Nokhud", fileID=},			-- Clan Nokhud
	--[2513] = {quest=0, exp="dra", engname="Clan Ohn'ir", fileID=},			-- Clan Ohn'ir
	--[2526] = {quest=0, exp="dra", engname="Winterpelt Furbolg", fileID=},		-- Winterpelt Furbolg
	--[2518] = {quest=0, exp="dra", engname="Sabellian", fileID=},			-- Sabellian

	[2594] = {quest=-1, exp="tww", engname="The Assembly of the Deeps", fileID=5891367}, 
	[2570] = {quest=-1, exp="tww", engname="Hallowfall Arathi", fileID=5891368}, 
	[2590] = {quest=-1, exp="tww", engname="Council of Dornogal", fileID=5891369},
	[2600] = {quest=-1, exp="tww", engname="The Severed Threads", fileID=5891370},

	[2696] = {quest=-1, exp="mid", engname="Amani Tribe", atlas="majorfactions_icons_origin512"},	
	[2704] = {quest=-1, exp="mid", engname="Hara'ti", atlas="majorfactions_icons_root512"}, 
	[2699] = {quest=-1, exp="mid", engname="The Singularity", atlas="majorfactions_icons_sky512"},  
	[2710] = {quest=-1, exp="mid", engname="Silvermoon Court", atlas="majorfactions_icons_light512"}, 
	--[2770] = {quest=-1, exp="mid", engname="Slayer's Duellum", filepath="ui_majorfactions_web"},

	[2711] = {quest=-1, exp="mid", engname="Magisters", atlas="majorfactions_icons_light512"},
	[2714] = {quest=-1, exp="mid", engname="Shades of the Row", atlas="majorfactions_icons_light512"},
	[2713] = {quest=-1, exp="mid", engname="Farstriders", atlas="majorfactions_icons_light512"}, 
	[2712] = {quest=-1, exp="mid", engname="Blood Knights", atlas="majorfactions_icons_light512"},
	
	[2772] = {quest=-1, exp="mid", engname="Zul'Jarra Forces", fileID=7903180},
	
	

}

local validFactions = {
	bfa = function()
		-- ek, kalimdor, kul tiras, zandalar
		return WorldQuests.current_continent==12 
			or WorldQuests.current_continent==13 
			or WorldQuests.current_continent==876 or WorldQuests.current_continent==1014 
			or WorldQuests.current_continent==875 or WorldQuests.current_continent==1011
	end,
	leg = function()
		-- broken isles or argus
		return WorldQuests.current_continent==905 or WorldQuests.current_continent==619
	end,
	sha = function()
		-- shadowlands
		return WorldQuests.current_continent==1550 or WorldQuests.current_continent==1647
	end,
	dra = function()
		-- dragon isles
		return WorldQuests.current_continent==1978 or WorldQuests.current_continent==2057 or WorldQuests.current_continent==2063 or WorldQuests.current_continent==2079
	end,
	tww = function()
		-- khaz algar
		return WorldQuests.current_continent==2274
	end,
	mid = function()
		-- quel thanas
		return WorldQuests.current_continent==2537
	end,
}

for i,v in ipairs(WQ_TYPES) do 
	v.keepShownOnClick=1 
	v.condition = validFactions[v.exp]
end

for i,v in ipairs(WQ_REWARDS) do 
	v.keepShownOnClick=1 
	v.condition = validFactions[v.exp]
end


local FACTIONS = {}
local locale=GetLocale()
local player_faction = UnitFactionGroup("player")
local _null = {}

-- build dropdown data based on faction list, sort and add textures
for i,faction in pairs(faction_data) do
	if locale=="enGB" or locale=="enUS" then
		faction.name = faction.engname
	else
		faction.name = (C_Reputation.GetFactionDataByID(i) or _null).name or faction.engname
	end

	faction.condition = validFactions[faction.exp]
	faction.keepShownOnClick = 1
	faction.text = faction.name
	faction.value = i
	--faction.texture = (faction.fileID and "|T"..faction.fileID..":14|t " or "") -- disabled, since many factions now use atlas
	if (not faction.faction or faction.faction == player_faction) then table.insert(FACTIONS,faction) end
end
table.sort(FACTIONS, function(a,b) return a.text<b.text end)

-- now these are keys in GQ.IconSets.WorldQuest
local quest_icons = {
	[Enum.QuestTagType.Normal] = "QUEST", -- default 
	[Enum.QuestTagType.PetBattle] = "PET", -- pet
	[Enum.QuestTagType.Dungeon] = "DUNGEON", -- dungeon
	[Enum.QuestTagType.Raid] = "RAID", -- raid
	[Enum.QuestTagType.Invasion] = "INVASION", -- invasion
	[Enum.QuestTagType.PvP] = "PVP", -- pvp
	[Enum.QuestTagType.FactionAssault] = "HORDE", -- intrusion horde, alliance is icon 22, handled in code
	[Enum.QuestTagType.Islands] = "QUEST", -- island expeditions?
	[Enum.QuestTagType.CovenantCalling] = "FIRSTAID", -- covenant quests
	[171] = "ALCHEMY", -- alchemy
	[794] = "ARCHAEOLOGY", -- archeology
	[164] = "BLACKSMITHING", -- blacksmith
	[182] = "HERBALISM", -- herbalism
	[773] = "INSCRIPTION", -- inscription
	[755] = "JEWELCRAFTING", -- jewelcrafting
	[165] = "LEATHERWORKING", -- leatherworking
	[197] = "TAILORING", -- tailoring
	[393] = "SKINNING", -- skinning
	[185] = "COOKING", -- cooking
	[333] = "ENCHANTING", -- enchanting
	[202] = "ENGINEERING", -- engineering
	[356] = "FISHING", -- fishing
	[186] = "MINING", -- mining
	bodyguard = "DAILY", -- bodyguard quests
	daily = "DAILY", -- daily quests
	}

WorldQuests.Quests = {}
WorldQuests.HiddenQuests = {}
WorldQuests.DisplayAll = true

function WorldQuests:Startup()
	WorldQuests:SetFilters()

	WorldQuests.Guides = {}
	for i,guide in pairs(GQ.registeredguides) do
		if guide.headerdata and guide.headerdata.worldquestzone then
			if type(guide.headerdata.worldquestzone)=="table" then
				for _,zone in pairs(guide.headerdata.worldquestzone) do
					WorldQuests.Guides[zone] = guide
				end
			else
				WorldQuests.Guides[guide.headerdata.worldquestzone] = guide
			end
			if guide.headerdata and guide.headerdata.worldquestshidden then
				WorldQuests.HiddenQuests[guide.headerdata.worldquestzone] = {}
				for quest,coords in pairs(guide.headerdata.worldquestshidden) do
					WorldQuests.HiddenQuests[guide.headerdata.worldquestzone][quest] = {coords[1]/100,coords[2]/100}
				end
			end
		end
	end

	-- hook templates and objects to use with suggesting guides from world map icons
	local mixin_to_template = {
		WorldMap_WorldQuestPinMixin = "WorldMap_WorldQuestPinTemplate",
		BonusObjectivePinMixin = "BonusObjectivePinTemplate",
		QuestOfferPinMixin = "QuestOfferPinTemplate",
	}

	local alreadyhooked = {}
	local function register_for_suggestion(pin)
		if alreadyhooked[pin] then return end
		if pin:GetScript("OnMouseUp") then
			hooksecurefunc(pin,"OnMouseUp", function(pin,button) GQ:ScheduleTimer(function() WorldQuests:SuggestWorldQuestGuideFromMap(pin) end,0) end)
		else
			pin:EnableMouse(true)
			pin:SetScript("OnMouseUp",function(pin) GQ:ScheduleTimer(function() WorldQuests:SuggestWorldQuestGuideFromMap(pin) end,0) end)
		end
		alreadyhooked[pin]=true
	end

	for pinmixin,pintemplate in pairs(mixin_to_template) do
		local mixin = _G[pinmixin]
		if mixin then
			hooksecurefunc(mixin,"OnAcquired", register_for_suggestion)
			for pin,_ in WorldMapFrame:EnumeratePinsByTemplate(pintemplate) do register_for_suggestion(pin) end
		end
	end
	-- done hooking stuff for world map


	hooksecurefunc(WorldMapFrame,"OnMapChanged", function() 
		if not GQ.db.profile.worldquestenable then return end
		WorldQuests.DisplayFrame:Show()
		WorldQuests.needToUpdate = true
		WorldQuests.useCache = false
		WorldQuests:HighlightHide()
	end)

	hooksecurefunc(WorldMapFrame,"Maximize",function() 
		WorldQuests.DisplayFrame:Hide() 
		WorldQuests:HighlightHide() 
	end)
	hooksecurefunc(WorldMapFrame,"Minimize",function()
		if not GQ.db.profile.worldquestenable then return end
		WorldQuests.DisplayFrame:Show()
		WorldQuests.needToUpdate = true
		WorldQuests.useCache = false
	end)

	EventRegistry:RegisterCallback("WorldMapOnShow", function()
		if not GQ.db.profile.worldquestenable then return end
		WorldQuests.DisplayFrame:Show()
		WorldQuests.needToUpdate = true
		WorldQuests.useCache = false
	end);

	if WorldQuestTrackerAddon then
		GQ:Hook(WorldQuestTrackerAddon,"OnQuestButtonClick", WorldQuests.WQTwrapper) -- map buttons
		GQ:AddEventHandler("SUPER_TRACKING_CHANGED",function(self,event) WorldQuests:SUPER_TRACKING_CHANGED() end)
	end

	WorldQuests:CreateFrame()
	WorldQuests:QueueDetailsLoad()
end

function WorldQuests:SUPER_TRACKING_CHANGED()
	local questID = C_SuperTrack.GetSuperTrackedQuestID()

	if not questID then return end
	if not WorldQuestTrackerAddon then return end
	if not WorldQuestTrackerAddon.db.profile.use_tracker then return end
	if not WorldQuestTrackerAddon.IsQuestBeingTracked(questID) then return end
	for i,questdata in pairs(WorldQuestTrackerAddon.QuestTrackList) do
		if questdata.questID == questID then
			WorldQuests:SuggestWorldQuestGuideFromMap(nil,questID,"force",questdata.mapID)
			return
		end
	end
end

function WorldQuests.WQTwrapper(object)
	if not WorldQuestTrackerAddon.db.profile.use_tracker then return end
	if not WorldQuestTrackerAddon.IsQuestBeingTracked(object.questID) then
		WorldQuests:SuggestWorldQuestGuideFromMap(nil,object.questID,"force",object.mapID)
	end
end

local function find_world_quest_step(questID,mapID,vignetteID)
	local mapid = mapID or WorldMapFrame and WorldMapFrame:GetMapID()

	if not mapid then
		GQ:Debug("&_SUB &worldquests unable to get current map id")
		return false,false
	end
	
	local zoneguide = WorldQuests.Guides[mapid]
	local prefix = vignetteID and "vignette-" or "quest-"
	local objectID = questID or vignetteID

	if zoneguide then
		zoneguide:Parse(true)
		for labelname,labeldata in pairs(zoneguide.steplabels) do
			if labelname == prefix..objectID then
				return zoneguide,labeldata[1]
			end
		end
	end
	return false,false
end

local function guide_exists(questID,mapID) 
	local guides = GQ.QuestDB.GuideForQuest[questID]
	if not guides then 
		local guide,labelstep = find_world_quest_step(questID,mapID or WorldQuests.current_mapid)
		if guide then return true end
	else
		for _,guide in ipairs(guides) do
			for map,mapguide in pairs(WorldQuests.Guides) do
				if mapguide.title==guide then return true end
			end
		end
	end
	return false
end

function WorldQuests:SuggestWorldQuestGuide(object,questID,force,mapID)
	local questID = object and (object.worldQuest or object.isCombatAllyQuest or object.isDaily or object.pinTemplate=="BonusObjectivePinTemplate") and object.questID or questID or object.vignetteID
	if not questID then return false end

	if C_QuestLog.GetQuestWatchType(questID) or (object and (object.isCombatAllyQuest or object.hiddenworldquest or object.vignetteID or object.pinTemplate=="BonusObjectivePinTemplate")) or force then
		local guide,labelstep = find_world_quest_step(questID,mapID,object and object.vignetteID)

		if not labelstep then
			if object and object.questID and (object.worldQuest or object.pinTemplate=="BonusObjectivePinTemplate") then
				GQ:Print("Selected World Quest is not yet in our guides.")
				GQ:Debug("&_SUB &worldquests no label for %s %s",object.vignetteID and "vignette" or "quest",questID)
			end
			return false
		end
		
		-- if tab with world quest guide exists load guide into it, otherwise create one
		local silent = GQ.Tabs:DoesSpecialTabExist("worldquestzone")

		GQ:Debug("&_SUB &worldquests setting to %s",questID)
		local tab = GQ.Tabs:GetSpecialTabFromPool("worldquestzone")
		tab:SetAsCurrent()
		GQ:SetGuide(guide.title,labelstep,false,silent)

		return true
	else
		GQ:Debug("&worldquests won't switch to %s",questID)
		return false
	end
end

function WorldQuests:SuggestWorldQuestGuideFromList(object)
	if not object then return end
	if not object:IsVisible() then return end
	if not object.quest then return end
	if not object.quest.questID then return end

	WorldQuests:SuggestWorldQuestGuide(nil,object.quest.questID,"force",object.quest.mapID)
end

function WorldQuests:SuggestWorldQuestGuideFromMap(object,questID,force,mapID)
	if not GQ.db.profile.worldquestmap then return false end

	mapID = mapID or object.GoatQuestMapId

	WorldQuests:SuggestWorldQuestGuide(object,questID,force,mapID)
end

local skip_currencies = {[1716]=true, [1717]=true} -- service medals, as they are static and block other rewards from showing
local function get_quest_details(data,qid)
	data.questID = qid
	data.questId = qid -- fallback, since data provider requires this camelcase.

	data.mapID = data.mapID or C_TaskQuest.GetQuestZoneID(qid)
	local mapinfo = GQ.GetMapInfo(data.mapID)
	data.mapName = mapinfo and mapinfo.name or ""

	local _
	data.title,data.faction,_ = C_TaskQuest.GetQuestInfoByQuestID(qid)

	local info = C_QuestLog.GetQuestTagInfo(qid)
	if not info then return end

	if not info.worldQuestType and info.tagID==266 then
		data.type = "bodyguard"
	elseif data.type~="combatally" and data.type~="daily" then
		data.type = info.worldQuestType
	end

	if info.quality == Enum.WorldQuestQuality.Rare then
		data.rarity = ITEM_QUALITY_COLORS[3].hex
	elseif info.quality == Enum.WorldQuestQuality.Epic then
		data.rarity = ITEM_QUALITY_COLORS[4].hex
	else
		data.rarity = ""
	end

	data.tradeskill = info.tradeskillLineID
	data.time = C_TaskQuest.GetQuestTimeLeftSeconds(qid)
	data.timedisp = C_TaskQuest.GetQuestTimeLeftMinutes(qid)
	data.exp = GetQuestLogRewardXP(qid)
	data.gold = GetQuestLogRewardMoney(qid)
	data.honor = GetQuestLogRewardHonor(qid)


	data.currencies = {}
	for i,v in ipairs(C_QuestLog.GetQuestRewardCurrencies(qid)) do
		if not skip_currencies[v.currencyID] then
			data.currencies.name = v.name
			data.currencies.texture = v.texture
			data.currencies.count = v.totalRewardAmount
			data.currencies.currencyID = v.currencyID

			if C_CurrencyInfo.GetFactionGrantedByCurrency(v.currencyID) then
				data.rewardsreputation = true
			end
			break
		end
	end

	data.rewards = {}
	if GetNumQuestLogRewards(qid)>0 then
		local itemlink = GQ.TooltipScanner:GetQuestLogItem("reward", 1, qid)
		if itemlink then
			local itemname, _, itemRarity, _, _, itemType, itemSubType, _, itemEquipLoc, itemIcon = GQ:GetItemInfo(itemlink)
			local _, _, numItems = GetQuestLogRewardInfo(1,qid)

			data.rewards.quantity = numItems
			data.rewards.itemlink = itemlink
			data.rewards.itemname = itemname
			data.rewards.itemType = itemType
			data.rewards.itemSubType = itemSubType
			data.rewards.itemEquipLoc = itemEquipLoc
			data.rewards.texture = itemIcon
			data.rewards.colorcode = ITEM_QUALITY_COLORS[itemRarity or 1].hex
			if itemlink then data.rewards.anima = C_Item.IsAnimaItemByID(itemlink) end

			if not itemIcon then -- if we did not get icon, force refresh
				WorldQuests.useCache = false
				WorldQuests.needToUpdate = true
			end
		end
	end

	data.reputations = ""
	data.reputationDetails = {}
	local faction_name_set = false
	for factionID,factionData in pairs(faction_data) do
		if (C_QuestLog.DoesQuestAwardReputationWithFaction(qid, factionID) or C_QuestLog.IsQuestCriteriaForBounty(qid, factionData.quest) or (data.mapID==factionData.zone) or (data.faction==factionID)) and (not factionData.faction or factionData.faction==player_faction) then
			if faction_data[factionID].fileID then
				data.reputations =  data.reputations..("|T"..faction_data[factionID].fileID..":20:20:0:4|t " or faction_data[factionID].name or "")
				data.reputationDetails[factionID] = "|T"..faction_data[factionID].fileID..":0|t "..(faction_data[factionID].name or "")
			elseif faction_data[factionID].atlas then
				data.reputations =  data.reputations..("|A:"..faction_data[factionID].atlas..":20:20:0:4|a " or faction_data[factionID].name or "")
				data.reputationDetails[factionID] = "|A:"..faction_data[factionID].atlas..":0|a "..(faction_data[factionID].name or "")
			else
				data.reputations =  data.reputations.." "..(faction_data[factionID].name or "")
				data.reputationDetails[factionID] = " "..(faction_data[factionID].name or "")
			end
			if not faction_name_set then 
				data.reputationName = (faction_data[factionID].name or "")
				faction_name_set = true
			end
		end
	end

	data.tostring = function() return data.title end
end

local show_dailies_on_map = {
	--[1527] = true, -- nzoth uldum
	--[1530] = true, -- nzoth vale
}

local blacklisted_quests = {
	[58703] = true, -- nazjatar, wanted: lady narjss
}

local argus_subzones = {830, 882, 885}

function WorldQuests:GetWorldQuests()
	table.wipe(WorldQuests.Quests)

	for id,v in pairs(faction_data) do
		faction_data[id].name = faction_data[id].name or (C_Reputation.GetFactionDataByID(id) or _null).name
	end

	if not WorldMapFrame:IsVisible() then return WorldQuests.Quests end

	local current_mapid = WorldMapFrame:GetMapID()
	WorldQuests.current_mapid = current_mapid

	local continent = GQ.GetMapContinent(WorldQuests.current_mapid)
	WorldQuests.current_continent = continent

	local mapdata = GQ.GetMapInfo(current_mapid)

	if mapdata and mapdata.mapType==Enum.UIMapType.World then return WorldQuests.Quests end -- don't work on world maps

	local quests = C_TaskQuest.GetQuestsOnMap(current_mapid)
	local pins = {}

	if current_mapid==905 then -- meh, argus needs workaround
		table.wipe(quests)
		for _,amap in pairs(argus_subzones) do
			for i,v in pairs(C_TaskQuest.GetQuestsOnMap(amap)) do
				table.insert(quests,v)
			end
		end
	end

	if WorldQuests.HiddenQuests[current_mapid] then
		for hiddenquest,coords in pairs(WorldQuests.HiddenQuests[current_mapid]) do
			if C_TaskQuest.IsActive(hiddenquest) then
				local newquest = {
					childDepth = 0,
					inProgress = false,
					isCombatAllyQuest = false,
					--isDaily = true,
					isQuestStart = false,
					mapID = current_mapid,
					numObjectives = 1,
					questID = hiddenquest,
					x = coords[1],
					y = coords[2],
					hiddenworldquest = true
				}
				table.insert(quests,newquest)
			end
		end
	end


	local map_children = GQ.GetMapChildren(current_mapid)
	if not quests then return WorldQuests.Quests end

	if WorldMapFrame.pinPools.WorldMap_WorldQuestPinTemplate then
		for worldQuestPin,_ in WorldMapFrame.pinPools.WorldMap_WorldQuestPinTemplate:EnumerateActive() do
			pins[worldQuestPin.questID]=worldQuestPin
		end
	end

	if WorldMapFrame.pinPools.GoatQuestWorldQuestPinTemplate then
		for worldQuestPin,_ in WorldMapFrame.pinPools.GoatQuestWorldQuestPinTemplate:EnumerateActive() do
			pins[worldQuestPin.questID]=worldQuestPin
		end
	end

	for _,quest in pairs(quests) do
		local qid = quest.questID
		if not qid then GQ.DEBUG_WQMISSINGID=quest end
		local info = qid and C_QuestLog.GetQuestTagInfo(qid)
		local quest_type = (info and info.worldQuestType) or (quest.isCombatAllyQuest and "combatally") or (quest.isDaily and show_dailies_on_map[quest.mapID] and "daily") or (info and info.tagID == 283 and "bonus")
		if quest_type and (map_children[quest.mapID] or quest.mapID==current_mapid) then -- on current map or its proper children, we do not want bleed through from borders
			local data = {}

			-- copy blizzard data, as we will be feeding whole WorldQuests.Quests array to main data provider later
			for i,v in pairs(quest) do data[i]=v end

			data.mapID = quest.mapID
			local mapinfo = GQ.GetMapInfo(quest.mapID)
			data.mapName = mapinfo and mapinfo.name or ""
			data.x = quest.x
			data.y = quest.y
			data.pin = pins[qid]
			data.numObjectives = quest.numObjectives
			if quest_type=="combatally" or quest_type=="daily" or quest_type=="bonus" then data.type=quest_type end

			get_quest_details(data,qid)

			if not blacklisted_quests[qid] then
				table.insert(WorldQuests.Quests,data)
			end
		end
	end
	--WorldQuests.DataProvier:RefreshAllData()
	return WorldQuests.Quests 
end

function WorldQuests:FormatTime(remaining)
	local h = math.floor(remaining/60)
	local m = remaining-(h*60)

	local colour = "|cffffffff"
	if ( remaining <= WORLD_QUESTS_TIME_CRITICAL_MINUTES ) then -- 15m
		colour = "|cffff2222"
	elseif ( remaining <= WORLD_QUESTS_TIME_LOW_MINUTES ) then -- 75m
		colour = "|cffffff00"
	else
		colour = ""
	end

	local timestring = ""
	if remaining<60 then
		timestring = ("%dm"):format(m)
	else
		timestring = ("%dh %dm"):format(h,m)
	end

	return colour..timestring.."|r"
end

function WorldQuests:HighlightShow(row)
	if row.quest and row.quest.pin then
		self.Highlight:SetPoint("TOPLEFT",row.quest.pin,"TOPLEFT")
		self.Highlight:Show()
	end
end

function WorldQuests:HighlightHide()
	self.Highlight:Hide()
end

function WorldQuests:IsValidQuest(object)
	if not object then return false end

	--if object.time==0 then return false end

	if #WorldQuests.Quests==0 then return true,"showing queue quests" end

	if (object.type==Enum.QuestTagType.Normal or object.type==Enum.QuestTagType.Islands) and GQ.db.profile.WQmode[Enum.QuestTagType.Normal]==false then return false,"rejected normal"
	elseif object.type==Enum.QuestTagType.PvP and GQ.db.profile.WQmode[Enum.QuestTagType.PvP]==false  then return false ,"rejected pvp"
	elseif object.type==Enum.QuestTagType.PetBattle and GQ.db.profile.WQmode[Enum.QuestTagType.PetBattle]==false then return false,"rejected pet" 
	elseif (object.type==Enum.QuestTagType.Profession or object.tradeskill) and GQ.db.profile.WQmode[Enum.QuestTagType.Profession]==false then return false,"rejected tradeskill"
	elseif object.type==Enum.QuestTagType.Dungeon and GQ.db.profile.WQmode[Enum.QuestTagType.Dungeon]==false then return false,"rejected dungeon" 
	elseif object.type==Enum.QuestTagType.Raid and GQ.db.profile.WQmode[Enum.QuestTagType.Raid]==false then return false,"rejected raid" 
	elseif (object.type==Enum.QuestTagType.Invasion or object.type==Enum.QuestTagType.FactionAssault) and GQ.db.profile.WQmode[Enum.QuestTagType.Invasion]==false then return false,"rejected invasion" 
	end

	if object.gold>0 then 
		if not GQ.db.profile.WQreward.gold then return false,"rejected gold" end 

	elseif object.rewardsreputation then
		if not GQ.db.profile.WQreward.reputation then return false,"rejected reputation" end

	elseif object.currencies.currencyID then 
		if object.currencies.currencyID == 1553 then 
			if not GQ.db.profile.WQreward[1553] then return false,"rejected resource" end
		elseif object.currencies.currencyID == 1560 then 
			if not GQ.db.profile.WQreward[1560] then return false,"rejected resource" end

		elseif object.currencies.currencyID == 1220 then 
			if not GQ.db.profile.WQreward[1220] then return false,"rejected resource" end
		elseif object.currencies.currencyID == 1533 then 
			if not GQ.db.profile.WQreward[1533] then return false,"rejected resource" end

		elseif object.currencies.currencyID == 2815 then 
			if not GQ.db.profile.WQreward[2815] then return false,"rejected resource" end
		elseif object.currencies.currencyID == 3008 then 
			if not GQ.db.profile.WQreward[3008] then return false,"rejected resource" end

		elseif not GQ.db.profile.WQreward.resources then 
			return false,"rejected resource" 
		end
	--elseif object.honor>0  then 
	--	if not GQ.db.profile.WQreward.honor then return false,"rejected honor" end
	elseif (object.rewards.anima) then 
		if not GQ.db.profile.WQreward.anima then return false,"rejected anima" end

	elseif (object.rewards.itemEquipLoc and object.rewards.itemEquipLoc~="") then 
		if not GQ.db.profile.WQreward.gear then return false,"rejected gear" end
	elseif GQ.db.profile.WQreward.other == false then 
		return false,"rejected other"
	end

	local valid_rep_found = false
	local any_rep_found = false
	for factionID,_ in pairs(object.reputationDetails) do
		any_rep_found = true
		if GQ.db.profile.WQreputation[factionID] then 
			valid_rep_found = true
			break
		end
	end
	if not valid_rep_found and any_rep_found then return false,"no rep" end

	return true
end

local display_quests = {}
function WorldQuests:Update()
	if not GQ.db.profile.worldquestenable then return end
	if not WorldQuests.needToUpdate then return end
	if not WorldQuests.QuestList then return end
	if not WorldMapFrame:IsVisible() then return end
	if WorldMapFrame:IsMaximized() then WorldQuests.DisplayFrame:Hide() end

	WorldQuests.DisplayFrame.DisplayOverride:Hide()
	WorldQuests.DisplayFrame.ModeDropdown:Show()
	WorldQuests.DisplayFrame.RewardsDropdown:Show()
	WorldQuests.DisplayFrame.ReputationDropdown:Show()
	WorldQuests.DisplayFrame.DisplayMode:Show()

	local continent = GQ.GetMapContinent(WorldQuests.current_mapid)
	if not WorldQuests.useCache then 
		WorldQuests:GetWorldQuests() 
	end -- only requery when events tell us to

	WorldQuests.useCache = false
	WorldQuests.needToUpdate = false


	-- prepare data
	local mapdata = GQ.GetMapInfo(WorldQuests.current_mapid)
	local QuestList = WorldQuests.QuestList
	local ROW_COUNT = QuestList:CountRows()
	local Quests = WorldQuests.Quests

	if #WorldQuests.Quests==0 or not WorldQuests.DisplayAll then
		Quests = WorldQuests.QuestQueueDetails
	end

	if #WorldQuests.Quests==0 then
		WorldQuests.DisplayFrame.DisplayOverride:Show()
		WorldQuests.DisplayFrame.ModeDropdown:Hide()
		WorldQuests.DisplayFrame.RewardsDropdown:Hide()
		WorldQuests.DisplayFrame.ReputationDropdown:Hide()
		WorldQuests.DisplayFrame.DisplayMode:Hide()
	end

	if #WorldQuests.Quests==0 and #WorldQuests.QuestQueueDetails==0 then 
		WorldQuests.DisplayFrame:Hide()
	end


	-- filter
	table.wipe(display_quests)
	for ii,questItem in ipairs(Quests) do 
		if WorldQuests:IsValidQuest(questItem) then
			table.insert(display_quests,questItem)
		end
	end

	-- sort data
	local sorting_mode, sorting_dir = GQ.db.profile.WQSorting[1], GQ.db.profile.WQSorting[2]

	table.sort(display_quests,function(a,b)
		local a_value, b_value

		if sorting_mode=="name" then
			a_value = a.title
			b_value = b.title
		elseif sorting_mode=="faction" then
			a_value = a.reputationName
			b_value = b.reputationName
		elseif sorting_mode=="time" then
			a_value = a.time
			b_value = b.time
		elseif sorting_mode=="zone" then
			a_value = a.mapName
			b_value = b.mapName
		elseif sorting_mode=="rewards" then
			a_value = a.currencies.name or a.rewards.itemname or (a.gold and tostring("gold "..a.gold))
			b_value = b.currencies.name or b.rewards.itemname or (b.gold and tostring("gold "..b.gold))
		end

		if a_value and b_value and a_value~=b_value then
			if sorting_dir=="asc" then 
				return a_value<b_value 
			else 
				return a_value>b_value
			end
		else
			return a.title<b.title
		end
	end)

	-- display data
	WorldQuests.QuestsOffset = max(0,min(WorldQuests.QuestsOffset,#display_quests-ROW_COUNT))
	local WQ_RowNum=0
	local WQ_RowOff=WorldQuests.QuestsOffset

	--Spoo(display_quests)

	WQ_RowOff=WorldQuests.QuestsOffset
	for ii,questItem in ipairs(display_quests) do 
		WQ_RowNum = ii-WQ_RowOff
		if WQ_RowNum>0 and WQ_RowNum<ROW_COUNT+1 then 
			local row = QuestList.rows[WQ_RowNum]

			if row.toggle:GetNormalTexture() then row.toggle:GetNormalTexture():Show() end
			if row.toggle:GetDisabledTexture() then row.toggle:GetDisabledTexture():Show() end

			if WorldQuests.QuestQueue[questItem.questID] then
				row.toggle:SetToggle(true,"no callback")
			else
				row.toggle:SetToggle(false,"no callback")
			end

			if guide_exists(questItem.questID,questItem.mapID) then
				row.toggle.canToggle=true
				row.toggle:SetScript("OnEnter",nil)
				row.toggleOverlay:SetScript("OnEnter",nil)
			else
				-- SetDisableTooltip()
				-- Disable()
				row.toggle.canToggle=false
				row.toggle:SetScript("OnEnter",function() 
					GameTooltip:SetOwner(row.toggle,"ANCHOR_BOTTOM")
					GameTooltip:SetText(L["wqp_no_guide"]) 
					GameTooltip:Show()
				end)
				row.toggleOverlay:SetScript("OnEnter",function() row.toggle:GetScript("OnEnter")() end)
				row.toggle:GetNormalTexture():Hide()
				row.toggle:GetDisabledTexture():Show()
			end

			local texture_index = quest_icons[questItem.type] or 0
			if questItem.type == Enum.QuestTagType.Profession then
				texture_index = quest_icons[questItem.tradeskill]
			elseif questItem.type == Enum.QuestTagType.FactionAssault then
				if player_faction=="alliance" then texture_index = "ALLIANCE" end
			end
			row.icon:SetTexCoord(unpack(GQ.IconSets.WorldQuest[texture_index].texcoord))
			
			row.name:SetText(questItem.rarity..questItem.title)

			local reward = questItem.rewards
			if reward.itemname then -- item
				local rewardtext = reward.itemname
				if reward.itemEquipLoc~="" then rewardtext = _G[reward.itemEquipLoc] or "" end
				local rewardcount
				if reward.quantity > 1 then rewardcount = "x "..reward.quantity else rewardcount = "" end
				row.rewards:SetText(reward.colorcode ..rewardtext.."|r"..rewardcount)
				row.rewardicon:SetTexture( reward.texture )
			elseif questItem.currencies.name then -- currencies
				local cur = questItem.currencies
				row.rewards:SetText( ("x %s"):format(cur.count) )
				row.rewardicon:SetTexture( cur.texture )
			elseif questItem.gold>0 then
				row.rewards:SetText( GQ.GetMoneyString(questItem.gold) )
				row.rewardicon:SetTexture(133784)
			else
				row.rewards:SetText( "" )
				row.rewardicon:SetTexture(GQ.DIR.."\\Skins\\blank")
				WorldQuests.useCache = false
				WorldQuests.needToUpdate = true
			end

			row.faction:SetText( questItem.reputations )

			if not questItem.timedisp then
			--if questItem.type=="daily" or questItem.type=="combatally" then
				if questItem.time then
					row.time:SetText(WorldQuests:FormatTime(math.ceil(questItem.time/60)))
				else
					row.time:SetText("|cffffffff-|r")
				end
			else
				row.time:SetText(WorldQuests:FormatTime(questItem.timedisp or 0))
			end

			row.zone:SetText(questItem.mapName)
			row:Show()

			row.quest = questItem
			row.questID = questItem.questID
			row.worldquest = true

			row.backalpha = WQ_RowNum%2==0 and 0.0 or 0.06
			row.back:SetAlpha(row.backalpha)
		end
	end
	QuestList.scrollbar:TotalValue(#display_quests)
	QuestList.scrollbar:SetValue(WQ_RowOff)
	for r=WQ_RowNum+1,ROW_COUNT do QuestList.rows[r]:Hide() QuestList.rows[r].item=nil end

	--WorldQuests.DataProvier:RefreshAllData()
	WorldQuests:QueueDetailsLoad()
end

function WorldQuests:ShowTooltipReward(row)
	local quest = row.quest

	if quest.rewards.itemlink then
		GameTooltip:SetHyperlink(quest.rewards.itemlink)
	elseif quest.currencies.name then -- currencies
		GameTooltip:AddLine( quest.currencies.count.." "..quest.currencies.name )
	elseif quest.gold>0 then
		GameTooltip:AddLine( GQ.GetMoneyString(quest.gold) )
	end	
	WorldQuests:HighlightShow(row) 
end

function GQ.WorldQuests:ShowTooltipQuest(row)
	-- code based on GameTooltip_AddQuest. skips progress bars since they sometimes mess with tooltip secret widths
	local questID = row.quest.questID;
	
	if ( not HaveQuestData(questID) ) then
		GameTooltip_SetTitle(GameTooltip, RETRIEVING_DATA, RED_FONT_COLOR);
		GameTooltip_SetTooltipWaitingForData(GameTooltip, true);
		GameTooltip:Show();
		return;
	end

	local isThreat = C_QuestLog.IsThreatQuest(questID);

	local title, factionID, capped = C_TaskQuest.GetQuestInfoByQuestID(questID);
	if C_QuestLog.IsWorldQuest(questID) then
		local tagInfo = C_QuestLog.GetQuestTagInfo(questID);
		local quality = tagInfo and tagInfo.quality or Enum.WorldQuestQuality.Common;

		local colorData = ColorManager.GetColorDataForWorldQuestQuality(quality)
		if colorData then
			GameTooltip_SetTitle(GameTooltip, title, colorData.color);
		else
			GameTooltip_SetTitle(GameTooltip, title);
		end

		if C_QuestLog.IsAccountQuest(questID) then
			GameTooltip_AddColoredLine(GameTooltip, ACCOUNT_QUEST_LABEL, ACCOUNT_WIDE_FONT_COLOR);
		end

		QuestUtils_AddQuestTypeToTooltip(GameTooltip, questID, NORMAL_FONT_COLOR);

		local factionData = factionID and C_Reputation.GetFactionDataByID(factionID);
		if factionData then
			local questAwardsReputationWithFaction = C_QuestLog.DoesQuestAwardReputationWithFaction(questID, factionID);
			local reputationYieldsRewards = (not capped) or C_Reputation.IsFactionParagonForCurrentPlayer(factionID);
			if questAwardsReputationWithFaction and reputationYieldsRewards then
				GameTooltip:AddLine(factionData.name);
			else
				GameTooltip:AddLine(factionData.name, GRAY_FONT_COLOR:GetRGB());
			end
		end

		GameTooltip_AddQuestTimeToTooltip(GameTooltip, questID);
	end

	local numObjectives = C_QuestLog.GetNumQuestObjectives(questID);
	for objectiveIndex = 1, numObjectives do
		local objectiveText, objectiveType, finished, numFulfilled, numRequired = GetQuestObjectiveInfo(questID, objectiveIndex, false);
		local showObjective = not (finished and isThreat);
		if showObjective then
			if objectiveText and (#objectiveText > 0) then
				local color = finished and GRAY_FONT_COLOR or HIGHLIGHT_FONT_COLOR;
				GameTooltip:AddLine(QUEST_DASH .. objectiveText, color.r, color.g, color.b, true);
			end
		end
	end
	local objectiveText, objectiveType, finished, numFulfilled, numRequired = GetQuestObjectiveInfo(questID, 1, false);

	if GameTooltip.ItemTooltip.Tooltip:IsAnchoringSecret() then 
		GQ:Debug("&_SUB &worldquests tooltip is being secretive late")
		return
	end
	GameTooltip_AddQuestRewardsToTooltip(GameTooltip, questID, TOOLTIP_QUEST_REWARDS_STYLE_DEFAULT);

	GameTooltip:Show();
end


function WorldQuests:ShowTooltipFaction(row)
	for i,line in pairs(row.quest.reputationDetails) do
		GameTooltip:AddLine( line )
	end
	WorldQuests:HighlightShow(row) 
end

function WorldQuests:ToggleAll(isChecked)
	local Quests = WorldQuests.Quests

	if #WorldQuests.Quests==0 or not WorldQuests.DisplayAll then
		Quests = WorldQuests.QuestQueueDetails
	end

	for i,quest in pairs(Quests) do
		if WorldQuests:IsValidQuest(quest) then
			if isChecked then
				GQ:Debug("&worldquests queueued %s",quest.questID)
				if guide_exists(quest.questID,quest.mapID) then
					WorldQuests.QuestQueue[quest.questID] = {m=quest.mapID, x=quest.x, y=quest.y, questID=quest.questID, numObjectives=quest.numObjectives}
				end
			else
				GQ:Debug("&worldquests unqueueued %s",quest.questID)
				WorldQuests.QuestQueue[quest.questID] = nil
			end
		end
	end

	WorldQuests:QueueDetailsLoad()

	WorldQuests.needToUpdate = true
	WorldQuests.useCache = true
end

function WorldQuests:CreateFrame()
	self.DisplayFrame = CHAIN(ui:Create("Frame",WorldMapFrame,"GQWQ"))
		:SetWidth(520+2*SkinData("WorldQuestMargin"))
		:SetHeight(535)
		:EnableMouse(true)
		:SetBackdrop(SkinData("WorldQuestBackdrop"))
		:SetBackdropColor(unpack(SkinData("WorldQuestBackdropColor")))
		:SetBackdropBorderColor(unpack(SkinData("WorldQuestBackdropBorderColor")))
		:SetScale(GQ.db.profile.worldquestscale or 1)
		:Hide()
		.__END
	local MF = self.DisplayFrame

	if QuestMapFrame and QuestMapFrame.TabButtons then -- 11.1+
		MF:SetPoint("TOP",WorldMapFrame,"TOP")
		--MF:SetPoint("BOTTOM",WorldMapFrame,"BOTTOM")
		MF:SetPoint("LEFT",QuestMapFrame.TabButtons[1],"RIGHT")
	else -- 11.0
		MF:SetPoint("TOPLEFT",WorldMapFrame,"TOPRIGHT")
		--MF:SetPoint("BOTTOMLEFT",WorldMapFrame,"BOTTOMRIGHT")
	end

	function self.EventHandler(a,b,c)
		WorldQuests.needToUpdate = true
		WorldQuests.useCache = false
	end

	GQ:AddEventHandler("QUEST_WATCH_LIST_CHANGED",self.EventHandler)
	GQ:AddEventHandler("QUEST_LOG_UPDATE",self.EventHandler)
	GQ:AddEventHandler("AREA_POIS_UPDATED",self.EventHandler)
	GQ:AddEventHandler("QUEST_REMOVED",self.EventHandler)
	GQ.UpdateCentral:AddHandler(function() WorldQuests:Update() end)

	MF.Logo = CHAIN(GQ:CreateBrandTitle(MF,16))
		:SetPoint("TOP",MF,"TOP",0,-3) 
		:SetSize(100,25)
	.__END
	MF.close = CHAIN(CreateFrame("Button",nil,MF))
		:SetPoint("TOPRIGHT",-5,-5)
		:SetSize(17,17)
		:SetScript("OnClick",function() WorldQuests:Hide() GQ.db.profile.worldquestenable=false end)
		.__END
	GQ.ButtonSets.TitleButtons.CLOSE:AssignToButton(MF.close)

	MF.DisplayMode = CHAIN(ui:Create("ToggleButton",MF))
		:SetPoint("TOPLEFT",MF,"TOPLEFT",16,-35)
		:SetFont(FONT,12)
		:SetText(L["wqp_only_selected"])
		:SetToggle(false)
		:SetScript("OnEnter",function(self) 
			CHAIN(GameTooltip):SetOwner(self, "ANCHOR_BOTTOM") 
			:SetText(type(self.tooltip)=="function" and self:tooltip() or tostring(self.tooltip)) 
			:Show() 
			end)
		:SetScript("OnLeave",function(self) GameTooltip:Hide() end)
	.__END
	MF.DisplayMode.tooltip = "Show only quests from all zones\nyou have added to the queue"
	MF.DisplayMode:RegisterToggleCallback(function()
		WorldQuests.DisplayAll = not MF.DisplayMode:IsChecked()
		WorldQuests.needToUpdate = true
		WorldQuests.useCache = true
	end)

	MF.DisplayOverride = CHAIN(MF:CreateFontString())
		:SetSize(260,20)
		:SetPoint("TOPLEFT",MF,"TOPLEFT",15,-32)
		:SetFont(FONT,12)
		:SetJustifyH("LEFT")
		:SetText(L["wqp_showing_queue"])
		:Hide()
	.__END


	-- dropdowns
	local profile = GQ.db.profile
	-- Type
	MF.ModeDropdown = CHAIN(ui:Create("DropDownFork",MF))
		:SetPoint("TOPLEFT",MF,"TOPLEFT",190,-30)
		:SetSize(100,20)
		:AddTooltip("ANCHOR_TOPLEFT","Type")
		:SetFrameLevel(MF:GetFrameLevel()+2)
		:SetName(L["wqp_filter_Type"])
		:IsButtonChecked(function(button) return  GQ.db.profile.WQmode[button.value] end)
		:OnButtonClicked(function(button)
			GQ.db.profile.WQmode[button.value] = not GQ.db.profile.WQmode[button.value]
			WorldQuests.needToUpdate = true
			WorldQuests.useCache = true
		end)
		:SetValues(WQ_TYPES)
	.__END

	-- Reward
	MF.RewardsDropdown = CHAIN(ui:Create("DropDownFork",MF))
		:SetPoint("TOPLEFT",MF.ModeDropdown,"TOPRIGHT",10,0)
		:SetSize(100,20)
		:AddTooltip("ANCHOR_TOPLEFT","Reward")
		:SetFrameLevel(MF:GetFrameLevel()+2)
		:SetName(L["wqp_filter_Reward"])
		:IsButtonChecked(function(button) return  GQ.db.profile.WQreward[button.value] end)
		:OnButtonClicked(function(button)
			GQ.db.profile.WQreward[button.value] = not GQ.db.profile.WQreward[button.value]
			WorldQuests.needToUpdate = true
			WorldQuests.useCache = true
		end)
		:SetValuesFunc(function(self)
			table.wipe(self.Values)
			local continent = GQ.GetMapContinent(WorldQuests.current_mapid)

			for _,value in ipairs(WQ_REWARDS) do
				if not value.condition or value.condition() then
					table.insert(self.Values,value)
				end
			end
		end)
	.__END

	-- Rep
	MF.ReputationDropdown = CHAIN(ui:Create("DropDownFork",MF))
		:SetPoint("TOPLEFT",MF.RewardsDropdown,"TOPRIGHT",10,0)
		:SetSize(100,20)
		:AddTooltip("ANCHOR_TOPLEFT","Faction")
		:SetFrameLevel(MF:GetFrameLevel()+2)
		:SetName(L["wqp_filter_Faction"])
		:IsButtonChecked(function(button) return  GQ.db.profile.WQreputation[button.value] end)
		:OnButtonClicked(function(button)
			GQ.db.profile.WQreputation[button.value] = not GQ.db.profile.WQreputation[button.value]
			WorldQuests.needToUpdate = true
			WorldQuests.useCache = true
		end)
		:SetValuesFunc(function(self)
			table.wipe(self.Values)
			local continent = GQ.GetMapContinent(WorldQuests.current_mapid)

			for _,faction in ipairs(FACTIONS) do
				if not faction.condition or faction.condition() then
					table.insert(self.Values,faction)
				end
			end
		end)
	.__END


	WorldQuests:SetFilters()

	for i,data in pairs(DATATABLE_COLUMNS) do  if data.texture=="_iconsets_worldquest_" then  data.texture=GQ.IconSets.WorldQuest.file  end  end  --delayed assignment :(

	-- Content
	DATATABLE_DATA.POSX = DATATABLE_DATA.POSX+SkinData("WorldQuestMargin")
	self.QuestList = ui:Create("ScrollTable",MF,"GQWQLIST",DATATABLE_COLUMNS,DATATABLE_DATA)
	--self.QuestList.col_toggle:Hide()
	--self.QuestList.col_icon:SetPoint("TOPLEFT",self.QuestList,"TOPLEFT",23,0)

	self.QuestList.col_toggle:RegisterToggleCallback(function()
		WorldQuests:ToggleAll(self.QuestList.col_toggle:IsChecked())
	end)
	self.QuestList.col_toggle:SetToggle(false,"no callback")



	self.QuestList:SetScript("OnMouseWheel", function(self,delta)
		WorldQuests.QuestsOffset=WorldQuests.QuestsOffset-delta
		WorldQuests.needToUpdate = true
		WorldQuests.useCache = true
		WorldQuests.hideTooltip=true
		WorldQuests.Highlight:Hide()
		GameTooltip:Hide()
	end)
	self.QuestList.scrollbar:SetScript("OnVerticalScroll",function(me,offset)
		WorldQuests.QuestsOffset=math.round(offset)
		WorldQuests.needToUpdate = true
		WorldQuests.useCache = true
		WorldQuests.Highlight:Hide()
		GameTooltip:Hide()
	end)

	for rownum,row in ipairs(self.QuestList.rows) do
		row:SetScript("OnEnter", function() WorldQuests:HighlightShow(row) end)
		row:SetScript("OnLeave", function() WorldQuests:HighlightHide(row) end)
		
		row:SetScript("OnClick", function() 
			-- when we select world quest, waypoint.showwaypoints fires twice, and since we do not want to switch maps, lets have showwaypoints ignore next two map switches
			-- hackish, but it makes the map behave the way we want to
			WorldQuests.PreventMapSwitch = 2 
			WorldQuests:SuggestWorldQuestGuideFromList(row) 
		end)

		-- add overlay to toggle so that clicking outside the small rectangle does not trigger row onclick event
		row.toggleOverlay = CHAIN(CreateFrame("Button",nil,row))
			:SetPoint("TOP")
			:SetPoint("BOTTOM")
			:SetPoint("LEFT",row.toggle,"LEFT",-5,0)
			:SetPoint("RIGHT",row.toggle,"RIGHT",5,0)
			:SetScript("OnClick",function() row.toggle:Toggle(not row.toggle.curToggle) end)
			:SetScript("OnLeave",function() GameTooltip:Hide() end)
		.__END

		row.toggle:RegisterToggleCallback(function()
			WorldQuests:QueueUpdate(row)
		end)

		--row.toggle:SetPoint("LEFT",row,"LEFT",-10,0)
	end

	MF.SelectedQuests = CHAIN(MF:CreateFontString())
		:SetSize(160,20)
		:SetPoint("TOPLEFT",self.QuestList,"BOTTOMLEFT", 0,0)
		:SetFont(FONT,12)
		:SetJustifyH("LEFT")
		:SetText(L["wqp_quests_selected"]:format(0))
	.__END

	MF.StartButton = CHAIN(CreateFrame("Button",nil,MF,"GQ_DefaultSkin_TitleButton_Template"))
		:SetSize(20,20)
		:SetScript("OnClick",function(self,button) WorldQuests:QueueProcess() end)
		:SetPoint("LEFT",MF.SelectedQuests,"RIGHT",10,-1)
		:Show()
		:SetScript("OnEnter",function(self) 
			GameTooltip:SetOwner(self, "ANCHOR_BOTTOM") 
			GameTooltip:SetText(L["wqp_start_queue"]) 
			GameTooltip:Show() 
		end)
		:SetScript("OnLeave",function(self) GameTooltip:Hide() end)
	.__END
	MF.StartButton.buttonkey = "LOADGUIDE"
	MF.StartButton:ApplySkin()

	MF.FooterSettingsButton = CHAIN(CreateFrame("Button",nil,MF))
		:SetPoint("BOTTOMRIGHT",-5,5)
		:SetSize(15,15)
		:SetScript("OnClick",function() GQ:OpenOptions("maps") end)
	.__END
	GQ.ButtonSets.TitleButtons.SETTINGS:AssignToButton(MF.FooterSettingsButton)

	self.Highlight = CHAIN(CreateFrame("Button",nil,MF))
		:SetSize(25,25)
		:SetNormalTexture(GQ.StyleDir.."mapicons")
		:SetAlpha(0.7)
	.__END
	self.Highlight:GetNormalTexture():SetTexCoord(1/2,1,0,1/2)
end

function WorldQuests:SetFilters()
	if not GQ.db.profile.WQSorting then
		GQ.db.profile.WQSorting = {"name","asc"}
	end

	-- if user has not see some faction/reward/type yet, enable it once
	GQ.db.profile.WQreputationSeen = GQ.db.profile.WQreputationSeen or {}
	for i,v in pairs(faction_data) do 
		if not GQ.db.profile.WQreputationSeen[i] then
			GQ.db.profile.WQreputationSeen[i] = true
			GQ.db.profile.WQreputation[i] = true
		end
	end

	GQ.db.profile.WQrewardSeen = GQ.db.profile.WQrewardSeen or {}
	for i,v in pairs(WQ_REWARDS) do 
		if not GQ.db.profile.WQrewardSeen[v.value] then
			GQ.db.profile.WQrewardSeen[v.value] = true
			GQ.db.profile.WQreward[v.value] = true
		end
	end

	GQ.db.profile.WQmodeSeen = GQ.db.profile.WQmodeSeen or {}
	for i,v in pairs(WQ_TYPES) do 
		if not GQ.db.profile.WQmodeSeen[v.value] then
			GQ.db.profile.WQmodeSeen[v.value] = true
			GQ.db.profile.WQmode[v.value] = true
		end
	end

	GQ.db.char.QuestQueue = GQ.db.char.QuestQueue or {}
	WorldQuests.QuestQueue = GQ.db.char.QuestQueue
end

function WorldQuests:Hide()
	self.DisplayFrame:Hide()
end

WorldQuests.QuestQueueDetails = {} -- used in display only selected quests mode
function WorldQuests:QueueUpdate(row)
	if not row then return end
	if not row.quest then return end
	local quest = row.quest

	-- toggle single row
	if row.toggle:IsChecked() then
		GQ:Debug("&worldquests queueued %s",quest.questID)
		WorldQuests.QuestQueue[quest.questID] = {m=quest.mapID, x=quest.x, y=quest.y, questID=quest.questID, numObjectives=quest.numObjectives}
	else
		GQ:Debug("&worldquests unqueueued %s",quest.questID)
		WorldQuests.QuestQueue[quest.questID] = nil
	end

	
	-- update toggle all rows state
	local Quests = WorldQuests.Quests
	if #WorldQuests.Quests==0 or not WorldQuests.DisplayAll then
		Quests = WorldQuests.QuestQueueDetails
	end

	local all_toggled = true
	for i,quest in pairs(Quests) do
		if not (WorldQuests:IsValidQuest(quest) and WorldQuests.QuestQueue[quest.questID]) then
			all_toggled = false
			break
		end
	end

	WorldQuests.QuestList.col_toggle:SetToggle(all_toggled,"no callback")

	WorldQuests:QueueDetailsLoad()
end

function WorldQuests:QueueDetailsLoad()
	table.wipe(WorldQuests.QuestQueueDetails)
	for qid,qdata in pairs(WorldQuests.QuestQueue) do
		if C_TaskQuest.IsActive(qid) then
			local data = {numObjectives=qdata.numObjectives}
			get_quest_details(data,qid)
			table.insert(WorldQuests.QuestQueueDetails,data)
		else
			WorldQuests.QuestQueue[qid] = nil
		end
	end
	WorldQuests:QueueUpdateButton()
end

local more_points = {}
function WorldQuests:QueueProcess()
	WorldQuests:QueueDetailsLoad()
	GQ:Debug("&worldquests QueueProcess")

	table.wipe(more_points)
	local endpoint

	local current_zone = C_Map.GetBestMapForUnit("player")
	local mapinfo = GQ.GetMapInfo(current_zone)
	local parent = mapinfo and mapinfo.parentMapID

	if GQ.db.profile.worldquestlocal then
		-- check quests in current zone
		for questID,quest in pairs(WorldQuests.QuestQueue) do
			if not GQ.Parser.ConditionEnv.readyq(questID) then
				if quest.m == current_zone then
					if endpoint then
						table.insert(more_points,{m=quest.m, x=quest.x, y=quest.y, questID=questID, title="quest "..questID, noskip=true})
					else
						endpoint = quest
					end
				end
			end
		end
		if endpoint then 
			LibRover:QueueFindPath(0,0,0, endpoint.m,endpoint.x,endpoint.y, GQ.WorldQuests.QueuePathHandler, {direct=not GQ.db.profile.pathfinding, multiple_ends=more_points, reportEnd=true })
			return
		end

		-- if current zone is cleared, check its parent
		for questID,quest in pairs(WorldQuests.QuestQueue) do
			if not GQ.Parser.ConditionEnv.readyq(questID) then
				if quest.m == parent then
					if endpoint then
						table.insert(more_points,{m=quest.m, x=quest.x, y=quest.y, questID=questID, title="quest "..questID, noskip=true})
					else
						endpoint = quest
					end
				end
			end
		end
		if endpoint then 
			LibRover:QueueFindPath(0,0,0, endpoint.m,endpoint.x,endpoint.y, GQ.WorldQuests.QueuePathHandler, {direct=not GQ.db.profile.pathfinding, multiple_ends=more_points, reportEnd=true })
			return
		end
	end

	-- if current and parent are cleared, check quests in all zones
	endpoint = nil
	for questID,quest in pairs(WorldQuests.QuestQueue) do
		if not GQ.Parser.ConditionEnv.readyq(questID) then
			if endpoint then
				table.insert(more_points,{m=quest.m, x=quest.x, y=quest.y, questID=questID, title="quest "..questID, noskip=true})
			else
				endpoint = quest
			end
		end
	end
	if not endpoint then return end

	LibRover:QueueFindPath(0,0,0, endpoint.m,endpoint.x,endpoint.y, GQ.WorldQuests.QueuePathHandler, {direct=not GQ.db.profile.pathfinding, multiple_ends=more_points, reportEnd=true })
end

function WorldQuests:QueueUpdateButton()
	local queue_count = 0
	for questID,quest in pairs(WorldQuests.QuestQueue) do
		queue_count = queue_count + 1
	end

	WorldQuests.DisplayFrame.SelectedQuests:SetText(L["wqp_quests_selected"]:format(queue_count))
end

function WorldQuests.QueuePathHandler(state,path,ext,reason)
	local result,rm,rx,ry,rq
	if state=="success" then
		local m,x,y = ext.endnode.m, ext.endnode.x, ext.endnode.y
		rm,rx,ry = m,x,y
		GQ:Debug("&worldquests handler success",m,x,y)
		for i,v in pairs(WorldQuests.QuestQueue) do
			if v.m==m and v.x==x and v.y==y then
				rq = v.questID
				result = WorldQuests:SuggestWorldQuestGuide(nil,v.questID,true,m)
			end
		end
	elseif state=="failure" then
		GQ:Debug("&worldquests handler failure")
		local _,quest = next(WorldQuests.QuestQueue)
		rm,rx,ry,rq = quest.m, quest.x, quest.y, quest.questID
		result = WorldQuests:SuggestWorldQuestGuide(nil,quest.questID,true,quest.m)
	end

	if (state=="success" or state=="failure") and not result then
		local guide = WorldQuests.Guides[rm or 0]
		-- open current zone wq guide in tab
		if guide then
			local tab = GQ.Tabs:GetSpecialTabFromPool("worldquestzone")
			tab:SetAsCurrent()
			GQ:SetGuide(guide.title)
		end
		GQ.Pointer:SetWaypoint(rm,rx,ry,{title=C_TaskQuest.GetQuestInfoByQuestID(rq),arrow=true,findpath=true,type="manual"},true)
	end

end

function WorldQuests:QuestsQueued()
	local counter = 0
	for questID,quest in pairs(WorldQuests.QuestQueue) do
		if not GQ.Parser.ConditionEnv.readyq(questID) then
			counter = counter + 1
		end
	end
	return counter>0
end

--[[
WorldQuests.DataProvier = CreateFromMixins(WorldQuestDataProviderMixin)

function WorldQuests.DataProvier:GetPinTemplate()
	return "GoatQuestWorldQuestPinTemplate";
end

function WorldQuests.DataProvier:RefreshAllData()
	local pinsToRemove = {};
	for questID in pairs(self.activePins) do
		pinsToRemove[questID] = true;
	end

	local mapCanvas = self:GetMap();

	local mapID = mapCanvas:GetMapID();
	if (mapID and GQ.db.profile.worldquestenable) then
		local mapdata = GQ.GetMapInfo(mapID)
		if WorldQuests.HiddenQuests[mapID] or show_dailies_on_map[mapID] or mapdata and mapdata.mapType==Enum.UIMapType.Continent then -- only show our pins on continents, leave rest to default blizzard
			for i, info in ipairs(WorldQuests.Quests) do
				pinsToRemove[info.questID] = nil;
				local pin = self.activePins[info.questID];
				if pin then
					pin:RefreshVisuals();
					pin:SetPosition(info.x, info.y);
				else
					self.activePins[info.questID] = self:AddWorldQuest(info);
				end

				if pin then
					pin.GoatQuestMapId = info.mapID

					if info.isCombatAllyQuest or info.isDaily then
						pin.worldQuest = false
					end
					if info.hiddenworldquest then
						pin.hiddenworldquest = true
					else
						pin.hiddenworldquest = nil
					end
				end
			end
		end
	end


	for questID in pairs(pinsToRemove) do
		mapCanvas:RemovePin(self.activePins[questID]);
		self.activePins[questID] = nil;
	end

	mapCanvas:TriggerEvent("WorldQuestsUpdate", mapCanvas:GetNumActivePinsByTemplate(self:GetPinTemplate()));
end

WorldMapFrame:AddDataProvider(WorldQuests.DataProvier)
--]]

GoatQuestWorldQuestPinMixin = CreateFromMixins(WorldMap_WorldQuestPinMixin);

-- taint prevention for blizz SetPassThroughButtons insecurities
function GoatQuestWorldQuestPinMixin:CheckMouseButtonPassthrough() return false end
function GoatQuestWorldQuestPinMixin.SetPassThroughButtons() end


tinsert(GQ.startups,{"WorldQuests",function(self)
	WorldQuests:Startup()
	WorldQuests.QuestsOffset = 0
end})
