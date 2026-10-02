local GoatQuest=GoatQuest
if not GoatQuest then return end
GoatQuest.Gold.guides_loaded=true
if GQ:DoMutex("GoldFarmCWOD") then return end
GoatQuest.GuideMenuTier = "TRI"
