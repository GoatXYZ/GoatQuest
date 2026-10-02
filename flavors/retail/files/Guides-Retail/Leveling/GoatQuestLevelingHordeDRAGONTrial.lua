local GoatQuest=GoatQuest
if not GoatQuest then return end
if UnitFactionGroup("player")~="Horde" then return end
if GQ:DoMutex("LevelingHDRAGON") then return end
GoatQuest.GuideMenuTier = "TRI"
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Dragonflight (10-70)\\Orgrimmar Trading Post Unlock")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Dragonflight (10-70)\\Primal Storms Questline")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Dragonflight (10-70)\\Primal Storms Daily Quest")
