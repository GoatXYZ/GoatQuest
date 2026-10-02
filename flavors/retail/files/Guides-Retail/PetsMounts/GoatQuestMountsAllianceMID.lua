local GoatQuest=GoatQuest
if not GoatQuest then return end
if UnitFactionGroup("player")~="Alliance" then return end
if GQ:DoMutex("MountsAMID") then return end
GoatQuest.GuideMenuTier = "SHA"
GoatQuest:RegisterGuide("Pets & Mounts\\Mounts\\Flying Mounts\\World Event Mounts\\Ballistic Bronco",{
patch='110207',
source='World Event',
author="Original guide team",
description="This guide will teach you how to acquire the Ballistic Bronco mount.",
keywords={"World Event","Flying"},
mounts={1264643},
mounttype="Flying",
startlevel=80,
},[[
step
Unlock the Brawler's Guild and Reach Rank 6 with Bizmo's Brawlpub in the Deeprun Tram |complete factionrenown(2767) >= 6 |or
|tip Use the {b}Midnight Brawler's Guild Event Guide{} to achieve this.
'|complete hasmount1264643) |or
step
talk Quackenbush##68363
buy Ballistic Bronco##259238 |goto Deeprun Tram/2 54.25,25.48 |or
'|complete hasmount(1264643) |or
step
use Ballistic Bronco##259238
learnmount Ballistic Bronco##1264643
]])
GoatQuest:RegisterGuide("Pets & Mounts\\Mounts\\Ground Mounts\\World Event Mounts\\Brawlin' Bruno",{
patch='110207',
source='World Event',
author="Original guide team",
description="This guide will teach you how to acquire the Brawlin' Bruno mount.",
keywords={"World Event","Ground"},
mounts={1264621},
mounttype="Ground",
startlevel=80,
},[[
step
Unlock the Brawler's Guild and Reach Rank 6 with Bizmo's Brawlpub in the Deeprun Tram |complete factionrenown(2767) >= 6 |or
|tip Use the {b}Midnight Brawler's Guild Event Guide{} to achieve this.
'|complete hasmount(1264621) |or
step
talk Quackenbush##68363
buy Brawlin' Bruno##259227 |goto Deeprun Tram/2 54.25,25.48 |or
'|complete hasmount(1264621) |or
step
use Brawlin' Bruno##259227
learnmount Brawlin' Bruno##1264621
]])
GoatQuest:RegisterGuide("Pets & Mounts\\Mounts\\Flying Mounts\\Achievement Mounts\\Anu'shalla Shadow's Guidance",{
patch='120000',
source='Achievement',
author="Original guide team",
description="This guide will help you acquire the Anu'shalla mount.",
keywords={"Achievement","Flying"},
mounts={1276650},
mounttype="Flying",
startlevel=10,
},[[
step
achieve 62103
|tip Obtain 600 mounts (usable by a single character).
learnmount Anu'shalla##1276650
]])
