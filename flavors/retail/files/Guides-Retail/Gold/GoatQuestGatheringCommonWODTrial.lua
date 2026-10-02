local GoatQuest=GoatQuest
if not GoatQuest then return end
GoatQuest.Gold.guides_loaded=true
if GQ:DoMutex("GoldGatherH") then return end
GoatQuest.GuideMenuTier = "TRI"
