local GoatQuest=GoatQuest
if not GoatQuest then return end
if UnitFactionGroup("player")~="Alliance" then return end
if GQ:DoMutex("LevelingADRAGON") then return end
GoatQuest.GuideMenuTier = "TRI"
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Dragonflight (10-70)\\Stormwind Trading Post Unlock")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Dragonflight (10-70)\\Primal Storms Questline")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Dragonflight (10-70)\\Primal Storms Daily Quest")
