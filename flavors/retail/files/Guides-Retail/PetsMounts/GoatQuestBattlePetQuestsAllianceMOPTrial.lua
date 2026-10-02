local GoatQuest=GoatQuest
if not GoatQuest then return end
if UnitFactionGroup("player")~="Alliance" then return end
if GQ:DoMutex("PetBattleAMOP") then return end
GoatQuest.GuideMenuTier = "TRI"
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pet Quests\\Battle Pet Dailies")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pet Quests\\Battle Pet Tamers: Cataclysm")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pet Quests\\Battle Pet Tamers: Eastern Kingdoms")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pet Quests\\Battle Pet Tamers: Kalimdor")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pet Quests\\Battle Pet Tamers: Northrend")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pet Quests\\Battle Pet Tamers: Outland")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pet Quests\\Battle Pet Tamers: Pandaria")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pet Quests\\Beasts of Fable")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pet Quests\\Beasts of Fable Dailies")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pet Quests\\Pandaren Spirit Tamer")
