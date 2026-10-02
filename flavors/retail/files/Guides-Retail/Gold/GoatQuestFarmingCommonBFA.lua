local GoatQuest=GoatQuest
if not GoatQuest then return end
GoatQuest.Gold.guides_loaded=true
if GQ:DoMutex("GoldFarmCBFA") then return end
GoatQuest.GuideMenuTier = "BFA"
