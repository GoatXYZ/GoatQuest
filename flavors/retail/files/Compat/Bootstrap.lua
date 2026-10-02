local addonName, GQ = ...

-- GoatQuestRetail only targets the Retail client. The shared engine still has
-- GoatQuest's Forever branches (GQ.IsForever); keep them off so the stock Retail
-- code paths run. Never change WOW_PROJECT_ID or other Blizzard globals.
local version, build, _, interfaceVersion = GetBuildInfo()
GQ.IsForever = false
GQ.Compat = {
	version = version,
	build = build,
	interfaceVersion = interfaceVersion,
}
