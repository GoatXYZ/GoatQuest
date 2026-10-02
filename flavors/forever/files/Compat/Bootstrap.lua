local addonName, GQ = ...

-- Forever 1.60 uses the Mainline UI family with Classic world/quest data.
-- Keep these decisions private to GoatQuest; never change WOW_PROJECT_ID.
local version, build, _, interfaceVersion = GetBuildInfo()
GQ.IsForever = type(version)=="string" and version:match("^1%.60%.")~=nil
GQ.Compat = {
	version = version,
	build = build,
	interfaceVersion = interfaceVersion,
	modernQuestLog = C_QuestLog and type(C_QuestLog.GetInfo)=="function",
}
GoatQuestCompat = GQ.Compat

-- Classic equipment code still consumes the old skill-line tuple.
GQ.Compat.GetNumSkillLines = GetNumSkillLines or (C_SkillInfo and C_SkillInfo.GetNumSkillLines)
GQ.Compat.GetSkillLineInfo = GetSkillLineInfo or function(index)
	local info = C_SkillInfo and C_SkillInfo.GetSkillLineInfo(index)
	if not info then return end
	return info.name, info.isHeader, info.isCollapsed, info.rank, info.tempPoints,
		info.modifier, info.maxRank, info.isAbandonable, info.stepCost,
		info.rankCost, info.minLevel, info.costType
end
