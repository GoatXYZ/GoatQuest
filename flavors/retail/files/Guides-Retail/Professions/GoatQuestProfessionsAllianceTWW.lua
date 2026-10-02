local GoatQuest=GoatQuest
if not GoatQuest then return end
if UnitFactionGroup("player")~="Alliance" then return end
if GQ:DoMutex("ProfessionsATWW") then return end
GoatQuest.GuideMenuTier = "SHA"
