local GoatQuest=GoatQuest
if not GoatQuest then return end
if UnitFactionGroup("player")~="Alliance" then return end
if GQ:DoMutex("LevelingAWOD") then return end
GoatQuest.GuideMenuTier = "TRI"
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Draenor (10-70)\\Draenor Intro")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Draenor (10-70)\\Shadowmoon Valley (10-70)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Draenor (10-70)\\Gorgrond (15-70)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Draenor (10-70)\\Talador (20-70)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Draenor (10-70)\\Spires of Arak (30-70)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Draenor (10-70)\\Nagrand (35-70)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Draenor (10-70)\\Tanaan Jungle (40-70)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\The Loremaster\\Loremaster of Draenor")
