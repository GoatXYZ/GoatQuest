local GoatQuest=GoatQuest
if not GoatQuest then return end
if UnitFactionGroup("player")~="Alliance" then return end
if GQ:DoMutex("PetsAMID") then return end
GoatQuest.GuideMenuTier = "SHA"
GoatQuest:RegisterGuide("Pets & Mounts\\Peaceful Pets\\Dragonkin Pets\\Moon Darter",{
patch='120000',
source='Achievement',
author="Original guide team",
description="This guide will teach you how to acquire the Moon Darter peaceful pet.",
keywords={"Achievement","Dragonkin"},
pet=4913,
startlevel=1,
},[[
step
You can only access the battle pet tamers necessary to acquire this pet item on a Horde character.
confirm
]])
