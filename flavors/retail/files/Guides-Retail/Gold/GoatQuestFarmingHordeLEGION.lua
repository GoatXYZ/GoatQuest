local GoatQuest=GoatQuest
if not GoatQuest then return end
GoatQuest.Gold.guides_loaded=true
if GQ:DoMutex("GoldFarmHLEGION") then return end
if UnitFactionGroup("player")~="Horde" then return end
GoatQuest.GuideMenuTier = "LEG"
