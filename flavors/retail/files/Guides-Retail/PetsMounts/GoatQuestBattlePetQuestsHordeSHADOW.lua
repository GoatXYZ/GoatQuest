local GoatQuest=GoatQuest
if not GoatQuest then return end
if UnitFactionGroup("player")~="Horde" then return end
if GQ:DoMutex("PetBattleHSHADOW") then return end
GoatQuest.GuideMenuTier = "SHA"
