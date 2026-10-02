local GoatQuest=GoatQuest
if not GoatQuest then return end
GoatQuest.Gold.guides_loaded=true
if GQ:DoMutex("GoldFarmC") then return end
GoatQuest.GuideMenuTier = "TRI"
GoatQuest:RegisterGuidePlaceholder("GOLD\\Farming\\Linen Cloth")
