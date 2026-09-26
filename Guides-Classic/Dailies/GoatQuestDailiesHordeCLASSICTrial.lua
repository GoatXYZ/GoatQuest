local GoatQuest=GoatQuest
if not GoatQuest then return end
if UnitFactionGroup("player")~="Horde" then return end
if GQ:DoMutex("DailiesHCLASSIC") then return end
GoatQuest.GuideMenuTier = "TRI"
