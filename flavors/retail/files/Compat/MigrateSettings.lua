local addonName, GQ = ...

-- Settings import happens offline: tools/import_zygor_settings.py copies the Zygor
-- Guides Viewer account save (ZygorGuidesViewer.lua) to GoatQuestRetail.lua with only
-- the variable renamed. Every save GoatQuestRetail opens gets a marker, so a non-empty
-- save without one at first load is an imported copy. Runs before AceDB.
local MARKER = "goatquest_retail"

function GQ:MigrateLegacySettings()
	if type(GoatQuestSettings)~="table" then GoatQuestSettings = {} end
	local sv = GoatQuestSettings
	if type(sv.global)=="table" and sv.global[MARKER] then return false end
	local imported = next(sv)~=nil
	if type(sv.global)~="table" then sv.global = {} end
	sv.global[MARKER] = 1
	if not imported then return false end
	sv.global.goatquest_imported_from = "ZygorGuidesViewer"
	sv.global.goatquest_imported_at = time()
	self.legacySettingsImported = true
	return true
end
