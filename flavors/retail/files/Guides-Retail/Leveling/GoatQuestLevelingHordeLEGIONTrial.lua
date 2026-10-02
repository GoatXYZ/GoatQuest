local GoatQuest=GoatQuest
if not GoatQuest then return end
if UnitFactionGroup("player")~="Horde" then return end
if GQ:DoMutex("LevelingHLEGION") then return end
GoatQuest.GuideMenuTier = "TRI"
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Legion (10-70)\\Balance of Power Questline")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Legion (10-70)\\Broken Shore\\Excavator Karla Quests")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Legion (10-70)\\Dalaran Postmaster Quest Line")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Legion (10-70)\\Rogue Pickpocketing Quest Line")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Legion (10-70)\\Meatball Order Hall Champion")
