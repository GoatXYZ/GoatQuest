local GoatQuest=GoatQuest
if not GoatQuest then return end
if UnitFactionGroup("player")~="Horde" then return end
if GQ:DoMutex("LevelingHCLASSHERITAGE") then return end
GoatQuest.GuideMenuTier = "TRI"
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Heritage Armor\\Blood Elf Heritage Armor")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Heritage Armor\\Forsaken Heritage Armor")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Heritage Armor\\Goblin Heritage Armor")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Heritage Armor\\Orc Heritage Armor")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Heritage Armor\\Tauren Heritage Armor")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Heritage Armor\\Troll Heritage Armor")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Heritage Armor\\Pandaren Heritage Armor")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Heritage Armor\\Highmountain Tauren Heritage Armor")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Heritage Armor\\Mag'har Orc Heritage Armor")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Heritage Armor\\Nightborne Heritage Armor")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Heritage Armor\\Vulpera Heritage Armor")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Heritage Armor\\Zandalari Troll Heritage Armor")
