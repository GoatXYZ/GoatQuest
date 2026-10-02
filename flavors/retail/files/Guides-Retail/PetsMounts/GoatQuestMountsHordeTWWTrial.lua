local GoatQuest=GoatQuest
if not GoatQuest then return end
if UnitFactionGroup("player")~="Horde" then return end
if GQ:DoMutex("MountsHTWW") then return end
GoatQuest.GuideMenuTier = "TRI"
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Mounts\\World Event Mounts\\Heartseeker Mana Ray")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Mounts\\Flying Mounts\\Vendor Mounts\\Remembered Wind Rider")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Mounts\\Flying Mounts\\PVP Mounts\\Vicious Skyflayer")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Mounts\\Flying Mounts\\PVP Mounts\\Vicious Electro Eel")
