local GoatQuest=GoatQuest
if not GoatQuest then return end
if UnitFactionGroup("player")~="Alliance" then return end
if GQ:DoMutex("DailiesAWOD") then return end
GoatQuest.GuideMenuTier = "TRI"
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Warlords of Draenor Dailies\\Lunarfall Inn Dungeon Dailies")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Warlords of Draenor Dailies\\Fishing Dailies")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Warlords of Draenor Dailies\\Battle Pets Dailies")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Warlords of Draenor Dailies\\Harrison Jones Treasure Contracts")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Warlords of Draenor Dailies\\Muradin Bronzebeard Dailies")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Warlords of Draenor Dailies\\Renzik Daily Quests")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Warlords of Draenor Dailies\\Garrison Assault Daily Quests")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Warlords of Draenor Dailies\\Garrison Building Dailies")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Warlords of Draenor Dailies\\Tanaan Jungle (100)\\Hand of the Prophet Dailies")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Warlords of Draenor Dailies\\Tanaan Jungle (100)\\Order of the Awakened Dailies")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Warlords of Draenor Dailies\\Tanaan Jungle (100)\\The Saberstalkers")
