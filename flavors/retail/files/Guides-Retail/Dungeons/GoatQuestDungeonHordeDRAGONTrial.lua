local GoatQuest=GoatQuest
if not GoatQuest then return end
if UnitFactionGroup("player")~="Horde" then return end
if GQ:DoMutex("DungeonHDRAGON") then return end
GoatQuest.GuideMenuTier = "TRI"
