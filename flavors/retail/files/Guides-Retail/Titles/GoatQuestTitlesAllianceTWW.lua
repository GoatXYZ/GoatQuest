local GoatQuest=GoatQuest
if not GoatQuest then return end
if UnitFactionGroup("player")~="Alliance" then return end
if GQ:DoMutex("TitlesATWW") then return end
GoatQuest.GuideMenuTier = "SHA"
