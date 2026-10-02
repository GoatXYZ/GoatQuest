local GoatQuest=GoatQuest
if not GoatQuest then return end
if UnitFactionGroup("player")~="Alliance" then return end
if GQ:DoMutex("PetBattleALEGION") then return end
GoatQuest.GuideMenuTier = "TRI"
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Battle Pet Dungeons\\Deadmines")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Battle Pet Dungeons\\Wailing Caverns")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pet Quests\\Uuna Storyline")
