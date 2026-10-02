local GoatQuest=GoatQuest
if not GoatQuest then return end
if UnitFactionGroup("player")~="Horde" then return end
if GQ:DoMutex("PetsHCLASSIC") then return end
GoatQuest.GuideMenuTier = "CLA"
