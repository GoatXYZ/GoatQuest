local name,GQ = ...

local FONT = GQ.Font
local CHAIN = GQ.ChainCall
local L=GQ.L

GQ.Poi = GQ.Poi or {}

local Poi = GQ.Poi
Poi.Sets = {}
Poi.Points = {}

local IsQuestFlaggedCompleted = C_QuestLog.IsQuestFlaggedCompleted

local function addline(text,icon,indent,nowrap)
	local tooltip = GameTooltip

	if icon then text = "|T"..icon..":0|t "..text end

	if text then tooltip:AddLine(text,1,1,1,not nowrap) end
	--if icon then tooltip:AddTexture(icon) end
	if indent then tooltip:AddTexture(GQ.DIR .. "\\Skins\\blank") end
end

local function poi_tooltip_show(pin)
	local poi = pin and pin.waypoint and pin.waypoint.storedData
	if not poi then return end

	GameTooltip:SetOwner(pin,"ANCHOR_TOP")
	GameTooltip:ClearLines()

	if poi.type=="treasure" then	
		addline("|cffffffffTreasure: "..poi.name)
	end
	if poi.type=="rare" then 
		addline("|cffffffffRare: "..poi.name)
		if poi.level and poi.level-UnitLevel("player")>3 then
			addline("|cffee0000Warning: This NPC will be hard to solo at your level") 
		end
	end

	if poi.comment then 
		addline("|cffffaa00"..poi.comment) 
	end

	addline(L["poi_load"]) 

	if poi.currencydata and #poi.currencydata>0 and (poi.type=="treasure" or poi.type=="rare") then
		addline("")
		addline("|cffffffffCurrency:")
		for _,currency in pairs(poi.currencydata) do
			addline("|cffffffff".."|T"..(currency.icon or "")..":0|t "..currency.type)
		end
	end

	if poi.itemdata then
		addline("")
		if #poi.itemdata>1 then
			addline("|cffffffffRewards:")
		else
			addline("|cffffffffReward:")
		end

		for index,item in ipairs(poi.itemdata) do
			local comment = item.comment and " "..item.comment or ""
			
			local ItemTooltip = GameTooltip.ItemTooltip
			
			if index==1 and item.itemid and ItemTooltip then
				if not (GQ.IsSecret(ItemTooltip.Tooltip:GetWidth()) or GQ.IsSecret(ItemTooltip.Icon:GetWidth())) then
					EmbeddedItemTooltip_SetItemByID(ItemTooltip,item.itemid)
				else
					GQ:Debug("&poi Not showing tooltip due to secret widths")
				end
			elseif item.itemid then
				local _, name, _, _, _, _, _, _, _, itemTexture = GQ:GetItemInfo(item.itemid)
				name = name or RETRIEVING_ITEM_INFO
				addline(((item.count and item.count.." ") or "")..name..comment,itemTexture,nil,"nowrap")
			else
				local _,_,_,color = C_Item.GetItemQualityColor(2)
				addline(((poi.itemcount and poi.itemcount.." ") or "")..("|c"..(color or "ffffffff")).."Random green"..(tonumber(poi.itemcount or 1) > 1 and "s" or "")..comment,GQ.DIR.."\\Skins\\poirandomgreen",nil,"nowrap")
			end
		end
		--if poi.item == "RANDOM" then
		--	local _,_,_,color = C_Item.GetItemQualityColor(2)
		--	addline(((poi.itemcount and poi.itemcount.." ") or "")..("|c"..(color or "ffffffff")).."Random green"..(tonumber(poi.itemcount or 1) > 1 and "s" or ""),GQ.DIR.."\\Skins\\poirandomgreen")
		--else
		--	EmbeddedItemTooltip_SetItemByID(GameTooltip.ItemTooltip,poi.item)
		--end
	end

	GameTooltip:Show()
	GameTooltip.GoatQuestRecalculatePadding = 10;
end

local function split(str,sep,reverse)
	local fields = {}
	str = str..sep
	local tinsert=tinsert
	str:gsub("(.-)"..sep, function(c) if reverse then tinsert(fields, c, 1) else tinsert(fields, c) end end)
	return fields
end

local function poi_waypoint_click(way,button)
	if UnitAffectingCombat("player") then return end

	local point = way.waypoint.storedData

	if button=="LeftButton" then
		Poi:LoadPoint(point)
		poi_tooltip_show(way)
		Poi.DataProvider:RefreshAllData(true)
	end
end

-- returns if given poi is already completed
function Poi:IsComplete(point)
	if not (point.quest or point.achieve) then return true end
	if point.quest then return IsQuestFlaggedCompleted(point.quest) end
	if point.achieve then 
		local _,completed
		if point.achievecriteria then
			_, _, completed = GetAchievementCriteriaInfoByID(point.achieve,point.achievecriteria, true)
		else
			_, _, _, completed = GetAchievementInfo(point.achieve)
		end
		return completed
	end
end

-- returns if given poi is valid under current settings
function Poi:IsValid(point)
	if not GQ.db.profile.poienabled then return false,"system disabled" end
	
	if GQ.db.profile.hideguide[point.type] then
		return false,"hidden type" -- poi type hidden
	end

	if GQ.db.profile.poitype==1 and point.access then 
		return false,"hidden mode"  -- quick mode, and point has access completionist
	end

	if point.condition and not point.condition_raw then
		local cond = point.condition:match("^only if%s+(.*)$")
		if cond then
			local fun,err,cond_procd = GQ.Parser.MakeCondition(cond,true)
			if not fun then error(err) end
			point.condition_raw = point.condition
			point.condition = fun
		else
			local params = point.condition:gsub("%s*,%s*",",")
			point.condition_raw = point.condition
			point.condition = function() return GQ:RaceClassMatch(split(params,",")) end
		end
	end
				
	if point.condition and not point.condition() then 
		return false,"condition failed" -- unmet condition
	end

	return not Poi:IsComplete(point),"quest/achieve status"
end

function Poi:ParsePoints()
	local totalsets = 0
	for pointsetname,pointset in pairs(Poi.Sets) do  totalsets=totalsets+1  end

	local currencyInfo = {
		["GR"] = C_CurrencyInfo.GetCurrencyInfo(824),
		["AC"] = C_CurrencyInfo.GetCurrencyInfo(823),
		["GL"] = {name="Gold",iconFileIDicon = "Interface\\Icons\\INV_Misc_Coin_01"},
		["PS"] = {name="Primal Spirits",iconFileIDicon = "Interface\\Icons\\6BF_Explosive_Shard"},
		["AA"] = C_CurrencyInfo.GetCurrencyInfo(829), --arakkoa archaeo
		["OIL"]= C_CurrencyInfo.GetCurrencyInfo(1101),
		["PC"] = {name="Pet Charms",iconFileIDicon = "Interface\\Icons\\achievement_guildperk_honorablemention"},
		["OR"] = C_CurrencyInfo.GetCurrencyInfo(1220), 
		["AM"] = C_CurrencyInfo.GetCurrencyInfo(1155), 
		["VA"] = C_CurrencyInfo.GetCurrencyInfo(1508), 
		["CC"] = C_CurrencyInfo.GetCurrencyInfo(1275), 
		["AZ"] = C_CurrencyInfo.GetCurrencyInfo(1553), 
		["WR"] = C_CurrencyInfo.GetCurrencyInfo(1560), 
		["CR"] = C_CurrencyInfo.GetCurrencyInfo(1931), 
		["IR"] = C_CurrencyInfo.GetCurrencyInfo(1820), --Infused Ruby
		["RA"] = C_CurrencyInfo.GetCurrencyInfo(1813), --Reservoir Anima
		["ST"] = C_CurrencyInfo.GetCurrencyInfo(1767), --Stygia
	}

	-- preparse achieve points to have achieve/crit split before we get to IsComplete
	for pointsetname,pointset in pairs(Poi.Sets) do 
		for i,point in pairs(pointset) do
			if point.achieve then 
				if type(point.achieve)=="string" then
					local name, id, criteria = GQ.Parser.ParseID(point.achieve)
					point.achieve, point.achievecriteria = tonumber(id), tonumber(criteria)
				end
			end
		end
	end
	
	local count=0
	for pointsetname,pointset in pairs(Poi.Sets) do 
		count=count+1
		for i,point in pairs(pointset) do if not Poi:IsComplete(point) then
			point.poi = true

			-- name
			point.name = point.rare or point.treasure

			-- type
			if point.rare then point.type="rare" end
			if point.treasure then point.type="treasure" end

			-- icon
			point.icon_off = GQ.Pointer.Icons[point.type]
			point.icon_on = GQ.Pointer.Icons[point.type.."_on"]
			point.icon = point.icon_off

			-- identificators
			if point.achieve then 
				point.ident = "achieve"..point.achieve..(point.achievecriteria and "-"..point.achievecriteria or "")
			end
			if point.quest then
				point.ident = "quest"..point.quest
			end

			-- coords
			local m,_,f,x,y = point.spot:match("([^/]+)(/*)(%d*) (%d.+),(%d.+)")
			point.map = GQ.LibRover:GetMapByNameFloor(m,tonumber(f))
			point.f = tonumber(f)
			point.x = tonumber(x)/100
			point.y = tonumber(y)/100

			-- reward: currency
			if point.currency then
				point.currencydata = {}
				for currencystring in string.gmatch(point.currency, "([^,]+)") do
					local value,currency = currencystring:match("([0-9%-~]+)%s*(%w+)")
					local name,icon,_,info
					if not value then currency=currencystring:match("(%w+)") end
					
					local info = currencyInfo[currency]

					if info then
						name = info.name
						icon = info.iconFileID
					end
					 
					if name and name~="" then table.insert(point.currencydata,{value=value, type=name, icon=icon}) end
				end
			end

			-- reward: item, needs parsing if string is given (for randoms)
			if point.item then
				point.itemdata = {}
				for itemstring in string.gmatch(point.item, "([^,]+)") do
					local item,comment = itemstring:match("(%w+) (%w+)") 
					if not item then item = itemstring end
					if comment=="RANDOM" then 
						comment=""
						item=itemstring
					end


					if tonumber(item) then
						table.insert(point.itemdata,{itemid=item,comment=comment})
					else
						local count, item = itemstring:match("([0-9-~]+) (%w+)")
						if item then
							table.insert(point.itemdata,{item=item,count=count,comment=comment})
						end
					end
				end
			end

			-- unset no longer needed stuff
			point.spot = nil
			point.rare = nil
			point.treasure = nil

			-- prepare for waypoint conversion
			point.tooltipfunc = poi_tooltip_show
			point.OnClick = poi_waypoint_click
			point.storedData = point
		end end
		if coroutine.running() then coroutine.yield(50*count/totalsets,"poi set parsed: "..pointsetname) end
	end

	Poi:PreparePoints()
end

function Poi:PreparePoints()
	table.wipe(Poi.Points)

	local pointcount=0
	for pointsetname,pointset in pairs(Poi.Sets) do
		for i,point in pairs(pointset) do
			pointcount=pointcount+1
		end
	end
		
	local count=0
	for pointsetname,pointset in pairs(Poi.Sets) do
		for i,point in pairs(pointset) do 
			count=count+1  if count%100==0 and coroutine.running() then coroutine.yield(50+50*count/pointcount,"poi set prepared: "..pointsetname) end
			if Poi:IsValid(point) then
				Poi.Points[point.map] = Poi.Points[point.map] or {}
				table.insert(Poi.Points[point.map],point)
			end 
		end
	end
	Poi.DoneLoadingPoints = true
	Poi.DataProvider:RefreshAllData()
end

-- Find guide designated as loader, store it in easy to access location, copy default landing step for future reuse
function Poi:SetupLoader()
	for i,v in pairs(GQ.registeredguides) do
		if v.headerdata.poiloader then
			Poi.LoaderGuide = v
			break
		end
	end
	if not Poi.LoaderGuide then 
		GQ:Debug("&poi Failed to setup loader")
		Poi.DoneLoadingPoints = false
		return 
	end
	Poi.LoaderGuide.LandingStep = Poi.LoaderGuide.rawdata

	if GQ.db.char.activepoi then
		for _,pointset in pairs(Poi.Points) do
			for _,point in pairs(pointset) do
				if point.ident == GQ.db.char.activepoi then
					Poi:LoadPoint(point,"noswitch")
					break
				end
			end
		end
	end
end

-- Load landing guide, load selected point steps into it, append landing step
function Poi:LoadPoint(point,noswitch)
	Poi.LoaderGuide.rawdata = (point.steps)..(Poi.LoaderGuide.LandingStep)
	if Poi.LoaderGuide.steps then table.wipe(Poi.LoaderGuide.steps) end
	Poi.LoaderGuide.parsed = false
	Poi.LoaderGuide:Parse(true)

	for i,step in pairs(Poi.LoaderGuide.steps) do
		step.point = point
	end

	Poi.LoaderGuide.steps[#Poi.LoaderGuide.steps].ispoiloader = true

	GQ.db.char.activepoi = point.ident

	if not noswitch then
		GQ.Tabs:LoadGuideToTab(Poi.LoaderGuide.title,1,"poiloader")
	end
end

function Poi:ChangeState(enable)
	if enable then 
		Poi.DataProvider.DisplayedPoiSet = 0
		Poi:PreparePoints()
		Poi.DataProvider:RefreshAllData()
		Poi.CurrentZoneDataProvider:RefreshAllData()
	else
		Poi.DataProvider:RemoveAllData()
		Poi.CurrentZoneDataProvider:RemoveAllData()
	end
end

-- map button/menu moved to mapcoords.lua

local function refresh_all_points()
	GQ:ScheduleTimer(function() 
		GQ:UpdateFrame(true)
		Poi.DataProvider:RefreshAllData()
		Poi.CurrentZoneDataProvider:RefreshPoints()
	end,0)
	GQ:ScheduleTimer(function() 
		GQ:UpdateFrame(true)
		Poi.DataProvider:RefreshAllData()
		Poi.CurrentZoneDataProvider:RefreshPoints()
	end,0.5)
end

local function EventHandler(self, event, ...)
	if event=="QUEST_LOG_UPDATE" 
	or event=="LOOT_READY" 
	or event=="LOOT_SLOT_CLEARED" 
	or event=="LOOT_CLOSED" 
	or event=="ENCOUNTER_LOOT_RECEIVED" 
	or (event=="CRITERIA_UPDATE" and not (IsFlying and IsFlying("player"))) -- C_U fires each time you use dragonriding skills. 
	or event=="CHAT_MSG_CURRENCY" then 
		if DataProvider and DataProvider.DelayedRefresh then 
			GQ:CancelTimer(DataProvider.DelayedRefresh)
			DataProvider.DelayedRefresh = nil
		end

		if GQ:Throttler("refresh_all_points",0.1,refresh_all_points) then return end
		refresh_all_points()
	end
end

local function UpdateHandler()
	if GameTooltip:IsVisible() and (GameTooltip.GoatQuestRecalculatePadding or 0)>0 then
		GameTooltip.GoatQuestRecalculatePadding = GameTooltip.GoatQuestRecalculatePadding - 1
		if GameTooltip.ItemTooltip then
			GameTooltip_CalculatePadding(GameTooltip)
		end
	end
end

tinsert(GQ.startups,{"POI hooks",function(self)
	GQ:AddEventHandler("CRITERIA_UPDATE",EventHandler)
	GQ:AddEventHandler("QUEST_LOG_UPDATE",EventHandler)
	GQ:AddEventHandler("LOOT_READY",EventHandler)
	GQ:AddEventHandler("LOOT_CLOSED",EventHandler)
	GQ:AddEventHandler("CHAT_MSG_CURRENCY",EventHandler)
	if GQ.IsRetail then
		GQ:AddEventHandler("ENCOUNTER_LOOT_RECEIVED",EventHandler)
	end
	--GQ:AddEventHandler("WORLD_MAP_UPDATE",EventHandler)

	GQ.UpdateCentral:AddHandler(UpdateHandler)

	WorldMapFrame:AddDataProvider(GQ.Poi.DataProvider)
	WorldMapFrame:AddDataProvider(GQ.Poi.CurrentZoneDataProvider)
	Poi.DataProvider.DisplayedPoiSet=0

	Poi:ParsePoints()
	Poi:SetupLoader()
end})

Poi.DataProvider	= CreateFromMixins(MapCanvasDataProviderMixin)
local DataProvider	= Poi.DataProvider
DataProvider.DisplaySet = {}

function DataProvider:RemoveAllData()
	GQ.Pointer:ClearSet("gq_poi_"..DataProvider.DisplayedPoiSet)
end

function DataProvider:OnShow()
	DataProvider:RefreshAllData(true)
end

function DataProvider:OnMapChanged()
	GQ.Pointer:ClearSet("gq_poi_"..DataProvider.DisplayedPoiSet)
	DataProvider.DelayedRefresh = GQ:ScheduleTimer(function() 
		GQ:UpdateFrame(true)
		Poi.DataProvider:RefreshAllData()
		Poi.CurrentZoneDataProvider:RefreshPoints()
	end,0.5)
end

function DataProvider:OnHide()
	if DataProvider.RetryTimer then 
		GQ:CancelTimer(DataProvider.RetryTimer)
	end
	GQ.Pointer:ClearSet("gq_poi_"..DataProvider.DisplayedPoiSet,"keeparrow")
	DataProvider.DisplayedPoiSet = 0

end

function DataProvider:RefreshAllData(force)
	if not Poi.DoneLoadingPoints then return end
	if not GQ.db.profile.poienabled then return end
	
	if not (self.owningMap and self.owningMap:IsShown()) then return end

	DataProvider.RetryTimer = GQ:ScheduleTimer(function() Poi.DataProvider:RefreshAllData() end,1)

	local selfmap = self and self.GetMap and self:GetMap()
	if not (selfmap or force) then return end

	local mapid = selfmap and selfmap.GetMapID and selfmap:GetMapID()
	if not (mapid or force) then return end


	GQ:CancelTimer(DataProvider.RetryTimer)
	DataProvider.RetryTimer = nil

	local t1=debugprofilestop()
	local ident = GQ.db.char.activepoi
	for i,point in pairs(GQ.Pointer.waypoints) do
		if point.storedData then
			if Poi:IsValid(point.storedData) then
				local active = point.storedData.ident == ident
				point:SetIcon(active and point.storedData.icon_on or point.storedData.icon_off)
			else
				GQ.Pointer:RemoveWaypoint(point)
			end
		end
	end

	GQ:Debug("&poi Cleared POIs in %dms",debugprofilestop()-t1)

	if mapid and DataProvider.DisplayedPoiSet~=mapid then
		DataProvider:DisplayPoints(mapid)
	else
		GQ:Debug("&poi Already shown")
	end
end

function DataProvider:DisplayPoints(mapid)
	GQ.Pointer:ClearSet("gq_poi_"..DataProvider.DisplayedPoiSet)
	if not mapid then return end

	GQ:Debug("&poi Showing POIs for %d",DataProvider.DisplayedPoiSet)

	DataProvider.DisplayedPoiSet = mapid
	table.wipe(DataProvider.DisplaySet)

	if GQ.Poi.Points[mapid] then
		for i,point in pairs(GQ.Poi.Points[mapid]) do
			table.insert(DataProvider.DisplaySet,point)
		end
	end

	local mapinfo = GQ.GetMapInfo(mapid)
	if mapinfo and mapinfo.mapType~=Enum.UIMapType.Continent and mapinfo.mapType~=Enum.UIMapType.World and mapinfo.mapType~=Enum.UIMapType.Cosmic then
		local map_children = GQ.GetMapChildren(mapid)
		for submap,_ in pairs(map_children) do
			if GQ.Poi.Points[submap] then
				for i,point in pairs(GQ.Poi.Points[submap]) do
					table.insert(DataProvider.DisplaySet,point)
				end
			end
		end
	end

	GQ.Pointer:Thread_ShowSet(
		{
			coords=DataProvider.DisplaySet,
			type="poi",
			ants=nil
		},
		"gq_poi_"..DataProvider.DisplayedPoiSet,
		function() DataProvider:RefreshAllData("force") end
	)
end

Poi.CurrentZoneDataProvider	= CreateFromMixins(MapCanvasDataProviderMixin)
local CurrentZoneDataProvider	= Poi.CurrentZoneDataProvider
CurrentZoneDataProvider.DisplaySet = {}
CurrentZoneDataProvider.DisplayedPoiSet=0

function CurrentZoneDataProvider:OnAdded()
	GQ:AddEventHandler("ZONE_CHANGED",CurrentZoneDataProvider.DisplayPoints);
	GQ:AddEventHandler("ZONE_CHANGED_INDOORS",CurrentZoneDataProvider.DisplayPoints);
	GQ:AddEventHandler("ZONE_CHANGED_NEW_AREA",CurrentZoneDataProvider.DisplayPoints)
	GQ:AddMessageHandler("GQ_GUIDES_PARSED",CurrentZoneDataProvider.DisplayPoints)
end

function CurrentZoneDataProvider:RefreshPoints()
	local ident = GQ.db.char.activepoi
	for i,point in pairs(GQ.Pointer.waypoints) do
		if point.storedData then
			if Poi:IsValid(point.storedData) then
				local active = point.storedData.ident == ident
				point:SetIcon(active and point.storedData.icon_on or point.storedData.icon_off)
			else
				GQ.Pointer:RemoveWaypoint(point)
			end
		end
	end
end

function CurrentZoneDataProvider:DisplayPoints()
	if not Poi.DoneLoadingPoints then return end
	if not GQ.db.profile.poienabled then return end

	local mapid = C_Map.GetBestMapForUnit("player")
	if mapid==DataProvider.DisplayedPoiSet then return end
	if mapid==CurrentZoneDataProvider.DisplayedPoiSet then return end

	GQ.Pointer:ClearSet("gq_poi_mini")

	CurrentZoneDataProvider.DisplayedPoiSet=mapid
	table.wipe(CurrentZoneDataProvider.DisplaySet)

	if GQ.Poi.Points[mapid] then
		for i,point in pairs(GQ.Poi.Points[mapid]) do
			table.insert(CurrentZoneDataProvider.DisplaySet,point)
		end
	end

	local mapinfo = GQ.GetMapInfo(mapid)
	if mapinfo and mapinfo.mapType~=Enum.UIMapType.Continent and mapinfo.mapType~=Enum.UIMapType.World and mapinfo.mapType~=Enum.UIMapType.Cosmic then
		local map_children = GQ.GetMapChildren(mapid)
		for submap,_ in pairs(map_children) do
			if GQ.Poi.Points[submap] then
				for i,point in pairs(GQ.Poi.Points[submap]) do
					table.insert(CurrentZoneDataProvider.DisplaySet,point)
				end
			end
		end
	end

	GQ.Pointer:Thread_ShowSet(
		{
			coords=CurrentZoneDataProvider.DisplaySet,
			type="poi",
			ants=nil
		},
		"gq_poi_mini",
		function() DataProvider:RefreshAllData("force") end
	)
end
