local GoatQuest=GoatQuest
if not GoatQuest then return end
if UnitFactionGroup("player")~="Horde" then return end
if GQ:DoMutex("ReputationsHBFA") then return end
GoatQuest.GuideMenuTier = "TRI"
GoatQuest:RegisterGuidePlaceholder("Reputation Guides\\Battle for Azeroth\\Champions of Azeroth")
GoatQuest:RegisterGuidePlaceholder("Reputation Guides\\Battle for Azeroth\\Talanji's Expedition")
GoatQuest:RegisterGuidePlaceholder("Reputation Guides\\Battle for Azeroth\\The Honorbound")
GoatQuest:RegisterGuidePlaceholder("Reputation Guides\\Battle for Azeroth\\Rustbolt Resistance")
GoatQuest:RegisterGuidePlaceholder("Reputation Guides\\Battle for Azeroth\\Tortollan Seekers")
GoatQuest:RegisterGuidePlaceholder("Reputation Guides\\Battle for Azeroth\\The Unshackled")
GoatQuest:RegisterGuidePlaceholder("Reputation Guides\\Battle for Azeroth\\Voldunai")
GoatQuest:RegisterGuidePlaceholder("Reputation Guides\\Battle for Azeroth\\Zandalari Empire")
GoatQuest:RegisterGuidePlaceholder("Reputation Guides\\Battle for Azeroth\\Rajani")
GoatQuest:RegisterGuidePlaceholder("Reputation Guides\\Battle for Azeroth\\Uldum Accord")
