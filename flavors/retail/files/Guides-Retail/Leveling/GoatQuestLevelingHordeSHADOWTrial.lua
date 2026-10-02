local GoatQuest=GoatQuest
if not GoatQuest then return end
if UnitFactionGroup("player")~="Horde" then return end
if GQ:DoMutex("LevelingHSHADOW") then return end
GoatQuest.GuideMenuTier = "TRI"
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Shadowlands (50-70)\\Blood Elf Questline")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Shadowlands (50-70)\\Stolen Shipments")
