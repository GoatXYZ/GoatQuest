local GoatQuest=GoatQuest
if not GoatQuest then return end
GoatQuest.Gold.guides_loaded=true
if GQ:DoMutex("GoldGatherCDRAGON") then return end
GoatQuest.GuideMenuTier = "SHA"
