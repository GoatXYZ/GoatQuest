local GoatQuest=GoatQuest
if not GoatQuest then return end
if UnitFactionGroup("player")~="Alliance" then return end
if GQ:DoMutex("MountsAMID") then return end
GoatQuest.GuideMenuTier = "TRI"
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts\\Mounts\\Flying Mounts\\World Event Mounts\\Ballistic Bronco")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts\\Mounts\\Ground Mounts\\World Event Mounts\\Brawlin' Bruno")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts\\Mounts\\Flying Mounts\\Achievement Mounts\\Anu'shalla Shadow's Guidance")
