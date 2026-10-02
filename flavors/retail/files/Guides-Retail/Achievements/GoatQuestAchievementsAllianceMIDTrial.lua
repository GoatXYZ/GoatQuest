local GoatQuest=GoatQuest
if not GoatQuest then return end
if UnitFactionGroup("player")~="Alliance" then return end
if GQ:DoMutex("AchievementsAMID") then return end
GoatQuest.GuideMenuTier = "TRI"
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Pet Battles\\Classic (1-60)\\Aquatic Battler of Eastern Kingdoms")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Pet Battles\\Classic (1-60)\\Beast Battler of Eastern Kingdoms")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Pet Battles\\Classic (1-60)\\Critter Battler of Eastern Kingdoms")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Pet Battles\\Classic (1-60)\\Dragonkin Battler of Eastern Kingdoms")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Pet Battles\\Classic (1-60)\\Elemental Battler of Eastern Kingdoms")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Pet Battles\\Classic (1-60)\\Flying Battler of Eastern Kingdoms")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Pet Battles\\Classic (1-60)\\Humanoid Battler of Eastern Kingdoms")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Pet Battles\\Classic (1-60)\\Magic Battler of Eastern Kingdoms")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Pet Battles\\Classic (1-60)\\Mechanical Battler of Eastern Kingdoms")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Pet Battles\\Classic (1-60)\\Undead Battler of Eastern Kingdoms")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Pet Battles\\Classic (1-60)\\Family Battler of Eastern Kingdoms")
