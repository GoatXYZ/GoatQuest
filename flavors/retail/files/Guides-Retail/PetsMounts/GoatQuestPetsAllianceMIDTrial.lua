local GoatQuest=GoatQuest
if not GoatQuest then return end
if UnitFactionGroup("player")~="Alliance" then return end
if GQ:DoMutex("PetsAMID") then return end
GoatQuest.GuideMenuTier = "TRI"
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts\\Peaceful Pets\\Dragonkin Pets\\Moon Darter")
