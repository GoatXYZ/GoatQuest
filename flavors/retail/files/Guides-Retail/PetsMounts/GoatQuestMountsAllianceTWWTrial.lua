local GoatQuest=GoatQuest
if not GoatQuest then return end
if UnitFactionGroup("player")~="Alliance" then return end
if GQ:DoMutex("MountsATWW") then return end
GoatQuest.GuideMenuTier = "TRI"
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Mounts\\Flying Mounts\\Vendor Mounts\\Remembered Golden Gryphon")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Mounts\\World Event Mounts\\Heartseeker Mana Ray")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Mounts\\Flying Mounts\\PVP Mounts\\Vicious Skyflayer")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Mounts\\Flying Mounts\\PVP Mounts\\Vicious Electro Eel")
