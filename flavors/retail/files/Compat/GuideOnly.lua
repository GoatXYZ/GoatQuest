local addonName, GQ = ...

GQ.GuideOnly = true
GQ.GuideCategories = { LEVELING=true, DUNGEONS=true, PROFESSIONS=true }
GQ.GuideOnlyHiddenOptions = {
	gear=true, itemscore=true, gold=true, notification=true, extras=true, zta=true,
}

-- Retain shared definitions used by the viewer, but do not start optional systems.
-- "Faction: Covenants startup" stays on: Shadowlands leveling steps use covenantfeature().
local disabledStartups = {
	["Talent Advisor"]=true, ["ItemScore"]=true,
	["Item-Quest startup"]=true, ["InventoryManager setup"]=true,
	["Gold"]=true, ["Goldguide core"]=true, ["Gold scan startup"]=true,
	["Auctiontools core"]=true, ["Auctiontools late pop"]=true, ["Servertrends"]=true,
	["Telemetry"]=true, ["Dataminer"]=true, ["Sync startup"]=true,
	["PlayerHousing setup"]=true,
	["Announcements startup"]=true,
	["Guide Menu Featured"]=true,
	-- Retail-only map, collection and planner hooks outside the kept categories.
	["WorldQuests"]=true, ["POI hooks"]=true, ["POI map icon"]=true,
	["PetBattle hooks"]=true, ["Achievement: frame hook"]=true,
}
for _,startup in ipairs(GQ.startups) do
	if type(startup)=="table" and disabledStartups[startup[1]] then
		startup[2] = function() end
	end
end

function GQ:ApplyGuideOnlySettings()
	local profile = self.db.profile
	for _,key in ipairs({
		"autogear", "autogearauto", "autoequip", "enable_vendor_tools", "autobuy",
		"autosell", "showgreysellbutton", "actionbar_trash", "zta_enabled", "nc_enable",
		"nc_skills", "sync_enabled", "load_gold", "gold_enable", "autoselectitem",
		"mouseovermarkers", "targetonclick",
		"loadguidesfully",
		"talenton", "petbattleframe", "poienabled", "worldquestenable", "worldquestmap",
	}) do profile[key]=false end
	profile.autorepair = 1 -- select option: 1 = do not auto-repair
	profile.ranconfig2 = true
	profile.widgets_first_run_done = true
	profile.widgets = {}
	profile.widgetshome = {}
	if not ({["1_home"]=true,["2_current"]=true,["3_recent"]=true,["5_last"]=true})[profile.gmfirstpage] then
		profile.gmfirstpage = "5_last"
	end
	if not profile.gmlastsection or profile.gmlastsection=="Leveling Guides"
		or not (self.GuideCategories[profile.gmlastsection:match("^[^\\]+")]
			or profile.gmlastsection=="Current" or profile.gmlastsection=="Recent") then
		profile.gmlastsection = "LEVELING"
	end
	profile.gmlasthomeversion = self.GuideMenu and self.GuideMenu.HomeVersion
end

-- The user can always open the guide browser directly.
SLASH_GOATQUESTGUIDES1 = "/goatquestguides"
SlashCmdList.GOATQUESTGUIDES = function()
	if GQ.GuideMenu and GQ.db then
		GQ.GuideMenu:Show("LEVELING")
	end
end
