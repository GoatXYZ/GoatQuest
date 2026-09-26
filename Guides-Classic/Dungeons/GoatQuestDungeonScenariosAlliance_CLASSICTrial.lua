local GoatQuest=GoatQuest
if not GoatQuest then return end
if UnitFactionGroup("player")~="Alliance" then return end
if GQ:DoMutex("ScenarioACLASSIC") then return end
GoatQuest.GuideMenuTier = "TRI"
