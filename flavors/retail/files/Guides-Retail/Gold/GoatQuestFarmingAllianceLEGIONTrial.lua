local GoatQuest=GoatQuest
if not GoatQuest then return end
GoatQuest.Gold.guides_loaded=true
if GQ:DoMutex("GoldFarmALEGION") then return end
if UnitFactionGroup("player")~="Alliance" then return end
GoatQuest.GuideMenuTier = "TRI"
