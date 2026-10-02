local GoatQuest=GoatQuest
if not GoatQuest then return end
if UnitFactionGroup("player")~="Horde" then return end
if GQ:DoMutex("ProfessionsHWOD") then return end
GoatQuest.GuideMenuTier = "TRI"
GoatQuest:RegisterGuidePlaceholder("Profession Guides\\Alchemy\\Leveling Guides\\Draenor Alchemy 1-100")
GoatQuest:RegisterGuidePlaceholder("Profession Guides\\Archaeology\\Leveling Guides\\Archaeology 600-700")
GoatQuest:RegisterGuidePlaceholder("Profession Guides\\Blacksmithing\\Leveling Guides\\Draenor Blacksmithing 1-100")
GoatQuest:RegisterGuidePlaceholder("Profession Guides\\Cooking\\Leveling Guides\\Draenor Cooking 1-100")
GoatQuest:RegisterGuidePlaceholder("Profession Guides\\Enchanting\\Leveling Guides\\Draenor Enchanting 1-100")
GoatQuest:RegisterGuidePlaceholder("Profession Guides\\Engineering\\Leveling Guides\\Draenor Engineering 1-100")
GoatQuest:RegisterGuidePlaceholder("Profession Guides\\Fishing\\Leveling Guides\\Draenor Fishing 1-100")
GoatQuest:RegisterGuidePlaceholder("Profession Guides\\Herbalism\\Leveling Guides\\Draenor Herbalism 1-100")
GoatQuest:RegisterGuidePlaceholder("Profession Guides\\Inscription\\Leveling Guides\\Draenor Inscription 1-100")
GoatQuest:RegisterGuidePlaceholder("Profession Guides\\Jewelcrafting\\Leveling Guides\\Draenor Jewelcrafting 1-100")
GoatQuest:RegisterGuidePlaceholder("Profession Guides\\Leatherworking\\Leveling Guides\\Draenor Leatherworking 1-100")
GoatQuest:RegisterGuidePlaceholder("Profession Guides\\Mining\\Leveling Guides\\Draenor Mining 1-100")
GoatQuest:RegisterGuidePlaceholder("Profession Guides\\Mining\\Farming Guides\\Blackrock")
GoatQuest:RegisterGuidePlaceholder("Profession Guides\\Mining\\Farming Guides\\True Iron")
GoatQuest:RegisterGuidePlaceholder("Profession Guides\\Mining\\Leveling Guides\\Draenor Mining 1-100")
GoatQuest:RegisterGuidePlaceholder("Profession Guides\\Tailoring\\Leveling Guides\\Draenor Tailoring 1-100")
