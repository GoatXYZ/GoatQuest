local GoatQuest=GoatQuest
if not GoatQuest then return end
if UnitFactionGroup("player")~="Horde" then return end
if GQ:DoMutex("MountsHMID") then return end
GoatQuest.GuideMenuTier = "TRI"
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts\\Mounts\\Flying Mounts\\World Event Mounts\\Ballistic Bronco")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts\\Mounts\\Ground Mounts\\World Event Mounts\\Brawlin' Bruno")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts\\Mounts\\Ground Mounts\\Achievement Mounts\\Anu'shalla Shadow's Guidance")
