local GoatQuest=GoatQuest
if not GoatQuest then return end
if UnitFactionGroup("player")~="Alliance" then return end
if GQ:DoMutex("TitlesABFA") then return end
GoatQuest.GuideMenuTier = "TRI"
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Battle for Azeroth Titles\\Dungeon & Raid\\The Purifier")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Battle for Azeroth Titles\\General\\The Awakened")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Battle for Azeroth Titles\\General\\Junkyard")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Battle for Azeroth Titles\\General\\Renowned Explorer")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Battle for Azeroth Titles\\General\\Veteran of the Fourth War")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Battle for Azeroth Titles\\Island Expedition\\Expedition Leader")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Battle for Azeroth Titles\\Reputation\\The Admired")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Battle for Azeroth Titles\\Reputation\\Esteemed")
