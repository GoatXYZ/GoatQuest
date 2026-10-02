local GoatQuest=GoatQuest
if not GoatQuest then return end
if UnitFactionGroup("player")~="Alliance" then return end
if GQ:DoMutex("DailiesABFA") then return end
GoatQuest.GuideMenuTier = "TRI"
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Battle for Azeroth\\BFA World Quest Unlock")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Battle for Azeroth\\Nazjatar\\Nazjatar Dailies")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Battle for Azeroth\\Mechagon Island\\Mechagon Dailies")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Battle for Azeroth\\Mechagon Island\\Mechagon Fishing Dailies")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Battle for Azeroth\\Battle Pets\\Battle Pet Dungeons\\Stratholme Weekly")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Battle for Azeroth\\Collected Tidebloom Honey")
