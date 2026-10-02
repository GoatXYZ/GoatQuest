local GoatQuest=GoatQuest
if not GoatQuest then return end
if UnitFactionGroup("player")~="Alliance" then return end
if GQ:DoMutex("ReputationsABFA") then return end
GoatQuest.GuideMenuTier = "TRI"
GoatQuest:RegisterGuidePlaceholder("Reputation Guides\\Battle for Azeroth\\7th Legion")
GoatQuest:RegisterGuidePlaceholder("Reputation Guides\\Battle for Azeroth\\Champions of Azeroth")
GoatQuest:RegisterGuidePlaceholder("Reputation Guides\\Battle for Azeroth\\Order of Embers")
GoatQuest:RegisterGuidePlaceholder("Reputation Guides\\Battle for Azeroth\\Proudmoore Admiralty")
GoatQuest:RegisterGuidePlaceholder("Reputation Guides\\Battle for Azeroth\\Rustbolt Resistance")
GoatQuest:RegisterGuidePlaceholder("Reputation Guides\\Battle for Azeroth\\Storm's Wake")
GoatQuest:RegisterGuidePlaceholder("Reputation Guides\\Battle for Azeroth\\Tortollan Seekers")
GoatQuest:RegisterGuidePlaceholder("Reputation Guides\\Battle for Azeroth\\Waveblade Ankoan")
GoatQuest:RegisterGuidePlaceholder("Reputation Guides\\Battle for Azeroth\\Honeyback Hive")
GoatQuest:RegisterGuidePlaceholder("Reputation Guides\\Battle for Azeroth\\Honeyback Harvester")
GoatQuest:RegisterGuidePlaceholder("Reputation Guides\\Battle for Azeroth\\Rajani")
GoatQuest:RegisterGuidePlaceholder("Reputation Guides\\Battle for Azeroth\\Uldum Accord")
