local GoatQuest=GoatQuest
if not GoatQuest then return end
if UnitFactionGroup("player")~="Alliance" then return end
if GQ:DoMutex("LevelingACLASSHERITAGE") then return end
GoatQuest.GuideMenuTier = "TRI"
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Heritage Armor\\Draenei Heritage Armor")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Heritage Armor\\Dwarf Heritage Armor")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Heritage Armor\\Gnome Heritage Armor")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Heritage Armor\\Human Heritage Armor")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Heritage Armor\\Night Elf Heritage Armor")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Heritage Armor\\Worgen Heritage Armor")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Heritage Armor\\Pandaren Heritage Armor")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Heritage Armor\\Dark Iron Dwarf Heritage Armor")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Heritage Armor\\Kul Tiran Heritage Armor")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Heritage Armor\\Lightforged Draenei Heritage Armor")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Heritage Armor\\Mechagnome Heritage Armor")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Heritage Armor\\Void Elf Heritage Armor")
