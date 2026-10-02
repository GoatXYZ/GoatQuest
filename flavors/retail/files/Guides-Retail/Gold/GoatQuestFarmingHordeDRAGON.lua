local GoatQuest=GoatQuest
if not GoatQuest then return end
GoatQuest.Gold.guides_loaded=true
if GQ:DoMutex("GoldFarmHDRAGON") then return end
if UnitFactionGroup("player")~="Horde" then return end
GoatQuest.GuideMenuTier = "SHA"
