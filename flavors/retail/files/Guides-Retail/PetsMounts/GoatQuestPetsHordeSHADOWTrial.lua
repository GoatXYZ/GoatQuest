local GoatQuest=GoatQuest
if not GoatQuest then return end
if UnitFactionGroup("player")~="Horde" then return end
if GQ:DoMutex("PetsHSHADOW") then return end
GQ.CommonPets=true
GoatQuest.GuideMenuTier = "TRI"
