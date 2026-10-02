local GoatQuest=GoatQuest
if not GoatQuest then return end
if UnitFactionGroup("player")~="Alliance" then return end
if GQ:DoMutex("LevelingAMOP") then return end
GoatQuest.GuideMenuTier = "TRI"
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Pandaria (10-70)\\The Jade Forest (10-70)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Pandaria (10-70)\\Valley of the Four Winds (15-70)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Pandaria (10-70)\\Krasarang Wilds (15-70)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Pandaria (10-70)\\Kun-Lai Summit (20-70)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Pandaria (10-70)\\Townlong Steppes (25-70)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Pandaria (10-70)\\Dread Wastes (30-70)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Pandaria (10-70)\\Isle of Thunder (50-70)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Pandaria (10-70)\\Operation: Shieldwall")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Pandaria (10-70)\\Peak of Serenity\\Monk Daily Quest")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Pandaria (10-70)\\Peak of Serenity\\Monk Quests")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\The Loremaster\\Loremaster of Pandaria")
