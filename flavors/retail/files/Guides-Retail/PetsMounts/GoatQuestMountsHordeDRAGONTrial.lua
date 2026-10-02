local GoatQuest=GoatQuest
if not GoatQuest then return end
if UnitFactionGroup("player")~="Horde" then return end
if GQ:DoMutex("PetsMountsHDRAGON") then return end
GoatQuest.GuideMenuTier = "TRI"
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Mounts\\Ground Mounts\\Vendor Mounts\\White War Wolf")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Mounts\\Ground Mounts\\PVP Mounts\\Vicious Sabertooth")
