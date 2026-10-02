local GoatQuest=GoatQuest
if not GoatQuest then return end
if UnitFactionGroup("player")~="Alliance" then return end
if GQ:DoMutex("PetsASHADOW") then return end
GQ.CommonPets=true
GoatQuest.GuideMenuTier = "SHA"
