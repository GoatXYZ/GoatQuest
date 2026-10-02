local GoatQuest=GoatQuest
if not GoatQuest then return end
GoatQuest.Gold.guides_loaded=true
if GQ:DoMutex("GoldGatherAWOD") then return end
if UnitFactionGroup("player")~="Alliance" then return end
GoatQuest.GuideMenuTier = "TRI"
