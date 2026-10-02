local GoatQuest=GoatQuest
if not GoatQuest then return end
if GQ:DoMutex("LevelingStarterC") then return end
GoatQuest.GuideMenuTier = "TRI"
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Allied Races\\Void Elf Demon Hunter Unlock")
