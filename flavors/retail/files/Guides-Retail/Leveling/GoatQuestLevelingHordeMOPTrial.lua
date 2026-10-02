local GoatQuest=GoatQuest
if not GoatQuest then return end
if UnitFactionGroup("player")~="Horde" then return end
if GQ:DoMutex("LevelingHMOP") then return end
GoatQuest.GuideMenuTier = "TRI"
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Pandaria (10-70)\\The Jade Forest (10-70)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Pandaria (10-70)\\Valley of the Four Winds (15-70)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Pandaria (10-70)\\Krasarang Wilds (15-70)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Pandaria (10-70)\\Kun-Lai Summit (20-70)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Pandaria (10-70)\\Townlong Steppes (25-70)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Pandaria (10-70)\\Dread Wastes (30-70)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Pandaria (10-70)\\Isle of Thunder (50-70)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Pandaria (10-70)\\Dominance Offensive")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Pandaria (10-70)\\Peak of Serenity\\Monk Daily")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Pandaria (10-70)\\Peak of Serenity\\Monk Quest 10")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Pandaria (10-70)\\Peak of Serenity\\Monk Quest 40")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Pandaria (10-70)\\Peak of Serenity\\Monk Quest 50")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Pandaria (10-70)\\Peak of Serenity\\Monk Quest 60")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Pandaria (10-70)\\Peak of Serenity\\Monk Quest 70")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Pandaria (10-70)\\Peak of Serenity\\Monk Quest 80")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Pandaria (10-70)\\Peak of Serenity\\Monk Quest 90")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\The Loremaster\\Loremaster of Pandaria")
