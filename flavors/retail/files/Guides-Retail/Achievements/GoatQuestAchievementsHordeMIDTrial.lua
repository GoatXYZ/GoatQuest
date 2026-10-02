local GoatQuest=GoatQuest
if not GoatQuest then return end
if UnitFactionGroup("player")~="Horde" then return end
if GQ:DoMutex("AchievementsHMID") then return end
GoatQuest.GuideMenuTier = "TRI"
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Pet Battles\\Classic (1-60)\\Aquatic Battler of Kalimdor")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Pet Battles\\Classic (1-60)\\Beast Battler of Kalimdor")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Pet Battles\\Classic (1-60)\\Critter Battler of Kalimdor")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Pet Battles\\Classic (1-60)\\Dragonkin Battler of Kalimdor")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Pet Battles\\Classic (1-60)\\Elemental Battler of Kalimdor")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Pet Battles\\Classic (1-60)\\Flying Battler of Kalimdor")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Pet Battles\\Classic (1-60)\\Humanoid Battler of Kalimdor")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Pet Battles\\Classic (1-60)\\Magic Battler of Kalimdor")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Pet Battles\\Classic (1-60)\\Mechanical Battler of Kalimdor")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Pet Battles\\Classic (1-60)\\Undead Battler of Kalimdor")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Pet Battles\\Classic (1-60)\\Family Battler of Kalimdor")
