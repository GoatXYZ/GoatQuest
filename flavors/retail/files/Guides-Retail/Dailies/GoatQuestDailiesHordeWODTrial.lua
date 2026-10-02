local GoatQuest=GoatQuest
if not GoatQuest then return end
if UnitFactionGroup("player")~="Horde" then return end
if GQ:DoMutex("DailiesHWOD") then return end
GoatQuest.GuideMenuTier = "TRI"
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Warlords of Draenor Dailies\\Frostwall Tavern Dungeon Dailies")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Warlords of Draenor Dailies\\Fishing Dailies")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Warlords of Draenor Dailies\\Battle Pets Dailies")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Warlords of Draenor Dailies\\High Overlord Saurfang Dailies")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Warlords of Draenor Dailies\\Harrison Jones Treasure Contracts")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Warlords of Draenor Dailies\\Shadow Hunter Ty'jin Daily Quests")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Warlords of Draenor Dailies\\Garrison Assault Daily Quests")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Warlords of Draenor Dailies\\Garrison Building Dailies")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Warlords of Draenor Dailies\\Tanaan Jungle (100)\\Vol'jin's Headhunters Dailies")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Warlords of Draenor Dailies\\Tanaan Jungle (100)\\Order of the Awakened Dailies")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Warlords of Draenor Dailies\\Tanaan Jungle (100)\\The Saberstalkers")
