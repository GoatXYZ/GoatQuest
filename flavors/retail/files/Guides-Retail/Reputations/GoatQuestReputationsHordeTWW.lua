local GoatQuest=GoatQuest
if not GoatQuest then return end
if UnitFactionGroup("player")~="Horde" then return end
if GQ:DoMutex("ReputationsHTWW") then return end
GoatQuest.GuideMenuTier = "SHA"
