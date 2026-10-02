local GoatQuest=GoatQuest
if not GoatQuest then return end
if UnitFactionGroup("player")~="Horde" then return end
if GQ:DoMutex("PetBattleHBFA") then return end
GoatQuest.GuideMenuTier = "TRI"
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Battle Pet Dungeons\\Gnomeregan")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Battle Pet Dungeons\\Stratholme")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Battle Pet Dungeons\\Blackrock Depths")
