local GoatQuest=GoatQuest
if not GoatQuest then return end
if UnitFactionGroup("player")~="Alliance" then return end
if GQ:DoMutex("DailiesATWW") then return end
GoatQuest.GuideMenuTier = "TRI"
