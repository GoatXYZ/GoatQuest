local GoatQuest=GoatQuest
if not GoatQuest then return end
if UnitFactionGroup("player")~="Horde" then return end
if GQ:DoMutex("ProfessionsHMoP") then return end
GoatQuest.GuideMenuTier = "TRI"
GoatQuest:RegisterGuidePlaceholder("Profession Guides\\Blacksmithing\\Leveling Guides\\Pandaria Blacksmithing 1-75")
GoatQuest:RegisterGuidePlaceholder("Profession Guides\\Fishing\\Leveling Guides\\Pandaria Fishing 1-75")
GoatQuest:RegisterGuidePlaceholder("Profession Guides\\Herbalism\\Leveling Guides\\Pandaria Herbalism 1-75")
GoatQuest:RegisterGuidePlaceholder("Profession Guides\\Mining\\Leveling Guides\\Pandaria Mining 1-75")
GoatQuest:RegisterGuidePlaceholder("Profession Guides\\Tailoring\\Leveling Guides\\Pandaria Tailoring 1-75")
