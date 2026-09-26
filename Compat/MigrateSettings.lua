local addonName, GQ = ...

-- The retired GoatZyg folder only loads its existing SavedVariables file.
-- Import a separate copy once, before AceDB installs defaults/metatables.
local function CopySettings(value, seen)
	if type(value)~="table" then return value end
	if seen[value] then return seen[value] end
	local copy = {}
	seen[value] = copy
	for key,item in pairs(value) do copy[CopySettings(key,seen)] = CopySettings(item,seen) end
	return copy
end

function GQ:MigrateLegacySettings()
	if type(GoatQuestSettings)=="table" and next(GoatQuestSettings) then return false end
	if type(GoatZygSettings)~="table" and C_AddOns and C_AddOns.DoesAddOnExist("GoatZyg")
		and C_AddOns.GetAddOnMetadata("GoatZyg","X-GoatQuest-Migration")=="1" then
		local loaded,reason = C_AddOns.LoadAddOn("GoatZyg")
		if not loaded then self.legacySettingsImportError=reason end
	end
	if type(GoatZygSettings)~="table" or not next(GoatZygSettings) then return false end
	GoatQuestSettings = CopySettings(GoatZygSettings,{})
	GoatQuestSettings.global = GoatQuestSettings.global or {}
	GoatQuestSettings.global.goatquest_imported_from = "GoatZyg"
	self.legacySettingsImported=true
	return true
end
