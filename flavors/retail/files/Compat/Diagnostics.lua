local addonName, GQ = ...

local function count(t)
	local n = 0
	for _ in pairs(t or {}) do n = n + 1 end
	return n
end

local function day(stamp)
	return date("%Y-%m-%d %H:%M", stamp)
end

-- Never print key values: only presence, the file's expiry date and the gate's outcome.
local function LicenceStatus()
	local licences = GQ.Licences
	local withheld = GQ.AnimatePopup and "yes" or "no"
	if type(licences)~="table" then
		return "Licence: Licence.lua not loaded | guides withheld this session: "..withheld
	end
	local expires = tonumber(licences.DATE_E)
	if not expires then
		return "Licence: Licence.lua loaded, no expiry date | guides withheld this session: "..withheld
	end
	local left = expires - time()
	local remaining = left>=0 and ("%d days left"):format(math.floor(left/86400))
		or ("expired %d days ago"):format(math.ceil(-left/86400))
	return ("Licence: Licence.lua loaded | expires %s (%s) | guides withheld this session: %s"):format(day(expires), remaining, withheld)
end

SLASH_GOATQUESTDEBUG1 = "/goatquestdebug"
SlashCmdList.GOATQUESTDEBUG = function()
	local version, build, _, interfaceVersion = GetBuildInfo()
	print(("GoatQuest %s | WoW %s (%s) | Interface %s | Retail=%s project=%s"):format(tostring(GQ.version),
		tostring(version), tostring(build), tostring(interfaceVersion), tostring(GQ.IsRetail), tostring(WOW_PROJECT_ID)))
	print(("Locale %s | NPC names %d | quest names %d"):format(GetLocale(),
		count(GoatQuest_L("NPCs")), count(GoatQuest_L("Quests"))))
	local map = C_Map.GetBestMapForUnit("player")
	local info = map and C_Map.GetMapInfo(map)
	print(("Player map %s (%s) | startup %s"):format(tostring(map), info and info.name or "?",
		GQ.initialized and "complete" or tostring(GQ.loading or "pending")))

	local guides, parsed, kept, categories = GQ.registeredguides or {}, 0, 0, {}
	for _,guide in ipairs(guides) do
		if guide.fully_parsed then parsed = parsed + 1 end
		if not guide.missing and GQ.GuideCategories[guide.type] then kept = kept + 1 end
	end
	for category in pairs(GQ.GuideCategories) do tinsert(categories, category) end
	table.sort(categories)
	print(("Guide index %d | fully parsed %d | in %s: %d"):format(#guides, parsed, table.concat(categories, ", "), kept))

	local global = GQ.db and GQ.db.global
	if global and global.goatquest_imported_from then
		local at = tonumber(global.goatquest_imported_at)
		print(("Settings: imported from %s on %s"):format(tostring(global.goatquest_imported_from), at and day(at) or "?"))
	else
		print("Settings: GoatQuestSettings (not imported)")
	end
	print(LicenceStatus())
end
