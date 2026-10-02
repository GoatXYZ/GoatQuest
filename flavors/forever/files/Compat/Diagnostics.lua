local addonName, GQ = ...

SLASH_GOATQUESTDEBUG1 = "/goatquestdebug"
SlashCmdList.GOATQUESTDEBUG = function()
	local version, build, _, interfaceVersion = GetBuildInfo()
	print("GoatQuest "..tostring(GQ.version).." | WoW "..tostring(version).." ("..tostring(build)..") | Interface "..tostring(interfaceVersion))
	print("Forever="..tostring(GQ.IsForever).." Classic data="..tostring(GQ.IsClassic).." project="..tostring(WOW_PROJECT_ID))
	local map = C_Map.GetBestMapForUnit("player")
	local maps = GQ.MapCoords and GQ.MapCoords.MAPDATA or {}
	print("Player map="..tostring(map).." Kalimdor="..tostring(maps[1414]~=nil).." Eastern Kingdoms="..tostring(maps[1415]~=nil))
	print("Quest log="..tostring(C_QuestLog and type(C_QuestLog.GetInfo)).." Skills="..tostring(C_SkillInfo and type(C_SkillInfo.GetSkillLineInfo)))
	local parsed=0
	for _,guide in ipairs(GQ.registeredguides or {}) do
		if guide.fully_parsed then parsed=parsed+1 end
	end
	print("Guide index="..tostring(#(GQ.registeredguides or {})).." | Fully parsed="..parsed.." | Categories: Leveling, Dungeons, Professions")
	local imported = GQ.db and GQ.db.global.goatquest_imported_from
	print("Settings="..(imported and "GoatQuest (legacy import complete)" or "GoatQuest")..(GQ.legacySettingsImportError and (" | Import: "..GQ.legacySettingsImportError) or ""))
end
