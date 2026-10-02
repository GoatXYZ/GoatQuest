local GoatQuest=GoatQuest
if not GoatQuest then return end
if GQ:DoMutex("MountsCMID") then return end
GoatQuest.GuideMenuTier = "SHA"
GoatQuest:RegisterGuide("Pets & Mounts\\Mounts\\Ground Mounts\\Trading Post Mounts\\Arboreal Pseudoshell",{
patch='120000',
source='Trading Post',
author="Original guide team",
description="This guide will help you acquire the Arboreal Pseudoshell mount.",
keywords={"Trading Post","Ground"},
mounts={1266993},
mounttype="Ground",
startlevel=10,
},[[
step
earn 450 Trader's Tender##2032 |or
|tip You receive these from the Trading Post Tour quest, opening the chest each month, and from Adventure Guide activities.
'|complete hasmount(1266993) |or
step
Talk to the Trading Post Vendor
buy Arboreal Pseudoshell##260893 |or
|tip Purchase this from the Trading Post in your capital city.
'|complete hasmount(1266993) |or
step
use Arboreal Pseudoshell##260893
|tip Unwrap this in your mount collection.
learnmount Arboreal Pseudoshell##1266993
]])
GoatQuest:RegisterGuide("Pets & Mounts\\Mounts\\Ground Mounts\\Vendor Mounts\\Amani Blessed Bear",{
patch='120000',
source='Vendor',
author="Original guide team",
description="This guide will help you acquire the Amani Blessed Bear mount.",
keywords={"Vendor","Ground"},
mounts={1261357},
mounttype="Ground",
startlevel=10,
},[[
step
Reach Renown {p}Rank 17{} with {y}Amani Tribe{} |complete factionrenown(2696) >= 17 |or
|tip Use the {b}Amani Tribe{} Reputation Guide to achieve this.
loadguide "Reputation Guides\\The War Within Reputations\\Amani Tribe"
'|complete hasmount(1261357) |or
step
earn 6000 Voidlight Marl##3316 |or
|tip You get this currency by killing rare enemies, opening treasures and caches, completing quests, world quests, delves, dungeons, and prey hunts, in Zul'Aman.
'|complete hasmount(1261357) |or
step
talk Magovu##240279
|tip Inside the building.
buy Amani Blessed Bear##257219 |goto Zul Aman M/0 45.95,65.92 |or
'|complete hasmount(1261357) |or
step
use Amani Blessed Bear##257219
learnmount Amani Blessed Bear##1261357
]])
GoatQuest:RegisterGuide("Pets & Mounts\\Mounts\\Ground Mounts\\Dropped Mounts\\Ancestral War Bear",{
patch='120000',
source='Dropped',
author="Original guide team",
description="This guide will help you acquire the Ancestral War Bear mount.",
keywords={"Dropped","Ground"},
mounts={1261360},
mounttype="Ground",
startlevel=10,
},[[
step
click Honored Warrior's Urn##613701
|tip You will be attacked.
kill Nalorakk's Chosen##255171 |n
collect Bear Tooth##259219 |goto Zul Aman M/0 32.70,83.49 |or
'|complete hasmount(1261360) |or
step
click Honored Warrior's Urn##613760
|tip You will be attacked.
kill Halazzi's Chosen##255232 |n
collect Lynx Claw##259223 |goto Zul Aman M/0 34.54,33.46 |or
'|complete hasmount(1261360) |or
step
click Honored Warrior's Urn##613757
|tip You will be attacked.
kill Jan'alai's Chosen##255233 |n
collect Dragonhawk Feather##259220 |goto Zul Aman M/0 54.78,22.39 |or
'|complete hasmount(1261360) |or
step
click Honored Warrior's Urn##613701
|tip You will be attacked.
kill Akil'zon's Chosen##255231 |n
collect Eagle Talon##259221 |goto Zul Aman M/0 51.58,84.92 |or
'|complete hasmount(1261360) |or
step
Enter the cave |goto Zul Aman M/0 46.95,82.29 < 10 |walk
|tip Under the giant broken tree.
click Honored Warrior's Cache##613727
|tip Inside the cave.
collect Ancestral War Bear##257223 |goto Zul Aman M/0 46.83,81.87 |or
'|complete hasmount(1261360) |or
step
use Ancestral War Bear##257223
learnmount Ancestral War Bear##1261360
]])
GoatQuest:RegisterGuide("Pets & Mounts\\Mounts\\Ground Mounts\\Vendor Mounts\\Blessed Amani Burrower",{
patch='120000',
source='Vendor',
author="Original guide team",
description="This guide will help you acquire the Blessed Amani Burrower mount.",
keywords={"Vendor","Ground"},
mounts={1261348},
mounttype="Ground",
startlevel=10,
},[[
step
earn 1600 Unalloyed Abundance##3377 |or
|tip Earn this currency from Abundance Events.
|tip Use the Abundance Leveling guide to unlock this.
loadguide "Leveling Guides\\Midnight (80-90)\\Extra Storylines\\Abundance"
'|complete hasmount(1261348) |or
step
Talk to Chel the Chip
|tip This is the Abundance Vendor who can be found in all the Midnight zones.
Eversong Woods [Eversong Woods M/0 56.82,65.82]
Zul'Aman North [Zul Aman M/0 32.04,26.11]
Harandar [Harandar/0 66.00,61.58]
Voidstorm [Voidstorm/0 38.78,53.20]
buy Blessed Amani Burrower##257197
learnmount Blessed Amani Burrower##1261348
]])
GoatQuest:RegisterGuide("Pets & Mounts\\Mounts\\Ground Mounts\\Dropped Mounts\\Cerulean Hawkstrider",{
patch='120000',
source='Dropped',
author="Original guide team",
description="This guide will help you acquire the Cerulean Hawkstrider mount.",
keywords={"Dropped","Ground"},
mounts={1261323},
mounttype="Ground",
startlevel=80,
},[[
step
label "START_GUIDE_OVER_CERULEAN_HAWKSTRIDER"
clicknpc Lovely Sunflower##250788
|tip The rare will spawn in the water and attack.
kill Waverly##250780
|tip The mount item drop is available on the first kill of every daily reset.
collect Cerulean Hawkstrider##257156 |goto Eversong Woods M/0 34.81,20.98 |next "MOUNT_ITEM_OBTAINED_CERULEAN_HAWKSTRIDER" |or
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1261323) |or
step
kill Coralfang##250683
|tip The mount item drop is available on the first kill of every daily reset.
collect Cerulean Hawkstrider##257156 |goto Eversong Woods M/0 36.31,36.44 |next "MOUNT_ITEM_OBTAINED_CERULEAN_HAWKSTRIDER" |or
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1261323) |or
step
kill Dame Bloodshed##255348
|tip The mount item drop is available on the first kill of every daily reset.
collect Cerulean Hawkstrider##257156 |goto Eversong Woods M/0 44.98,38.52 |next "MOUNT_ITEM_OBTAINED_CERULEAN_HAWKSTRIDER" |or
Spawn point [Eversong Woods M/0 45.55,38.75]
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1261323) |or
step
kill Malfunctioning Construct##255329
|tip The mount item drop is available on the first kill of every daily reset.
collect Cerulean Hawkstrider##257156 |goto Eversong Woods M/0 51.67,46.05 |next "MOUNT_ITEM_OBTAINED_CERULEAN_HAWKSTRIDER" |or
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1261323) |or
step
kill Cre'van##250719
Spawn point [Eversong Woods M/0 63.43,48.86]
|tip The mount item drop is available on the first kill of every daily reset.
collect Cerulean Hawkstrider##257156 |goto Eversong Woods M/0 62.73,49.00 |next "MOUNT_ITEM_OBTAINED_CERULEAN_HAWKSTRIDER" |or
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1261323) |or
step
kill Overfester Hydra##240129
|tip Bound by roots in Suncrown Village.
|tip The mount item drop is available on the first kill of every daily reset.
collect Cerulean Hawkstrider##257156 |goto Eversong Woods M/0 54.70,60.25 |next "MOUNT_ITEM_OBTAINED_CERULEAN_HAWKSTRIDER" |or
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1261323) |or
step
kill Lost Guardian##250806
|tip The mount item drop is available on the first kill of every daily reset.
collect Cerulean Hawkstrider##257156 |goto Eversong Woods M/0 59.09,79.24 |next "MOUNT_ITEM_OBTAINED_CERULEAN_HAWKSTRIDER" |or
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1261323) |or
step
kill Banuran##250826
|tip The mount item drop is available on the first kill of every daily reset.
collect Cerulean Hawkstrider##257156 |goto Eversong Woods M/0 56.46,77.54 |next "MOUNT_ITEM_OBTAINED_CERULEAN_HAWKSTRIDER" |or
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1261323) |or
step
kill Warden of Weeds##246332
|tip He patrols along the path marked on the map.
|tip The mount item drop is available on the first kill of every daily reset.
collect Cerulean Hawkstrider##257156 |next "MOUNT_ITEM_OBTAINED_CERULEAN_HAWKSTRIDER" |or
map Eversong Woods M/0
path follow smart; loop on; ants curved; dist 30
path    51.17,75.13    51.50,74.46    51.90,73.89    52.26,73.68    52.73,74.13
path    52.85,74.99    52.59,75.49    52.29,75.75    52.05,76.01    52.51,75.33
path    52.69,74.98    52.70,74.66    52.59,74.14    52.28,73.89    52.05,73.90
path    51.76,74.21    51.59,74.59    51.59,74.56
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1261323) |or
step
kill Bad Zed##250841
|tip The mount item drop is available on the first kill of every daily reset.
|tip Inside the building.
collect Cerulean Hawkstrider##257156 |goto Eversong Woods M/0 49.05,87.76 |next "MOUNT_ITEM_OBTAINED_CERULEAN_HAWKSTRIDER" |or
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1261323) |or
step
kill Harried Hawkstrider##246633
|tip It runs around in the circular path marked on the map.
|tip The mount drop is available on the first kill of every daily reset.
collect Cerulean Hawkstrider##257156 |next "MOUNT_ITEM_OBTAINED_CERULEAN_HAWKSTRIDER" |or
map Eversong Woods M/0
path follow smart; loop on; ants curved; dist 30
path	44.76,77.73	45.43,78.39	45.46,79.39	44.61,79.86	44.05,78.94
path	44.17,78.81
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1261323) |or
step
kill Terrinor##250876
|tip The mount item drop is available on the first kill of every daily reset.
collect Cerulean Hawkstrider##257156 |goto Eversong Woods M/0 40.39,85.48 |next "MOUNT_ITEM_OBTAINED_CERULEAN_HAWKSTRIDER" |or
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1261323) |or
step
kill Lady Liminus##250754
|tip The mount item drop is available on the first kill of every daily reset.
collect Cerulean Hawkstrider##257156 |goto Eversong Woods M/0 36.66,77.14 |next "MOUNT_ITEM_OBTAINED_CERULEAN_HAWKSTRIDER" |or
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1261323) |or
step
kill Duskburn##255302
|tip The mount item drop is available on the first kill of every daily reset.
collect Cerulean Hawkstrider##257156 |goto Eversong Woods M/0 42.43,68.98 |next "MOUNT_ITEM_OBTAINED_CERULEAN_HAWKSTRIDER" |or
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1261323) |or
step
kill Bloated Snapdragon##250582
Spawn location [Eversong Woods M/0 37.70,64.28]
|tip The mount item drop is available on the first kill of every daily reset.
collect Cerulean Hawkstrider##257156 |goto Eversong Woods M/0 36.57,64.07 |next "MOUNT_ITEM_OBTAINED_CERULEAN_HAWKSTRIDER" |or
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1261323) |or
step
Return to the Start of this Guide
|tip Kill them all again after daily reset if you haven't yet received the mount item.
Click Here to Start Over |confirm |next "START_GUIDE_OVER_CERULEAN_HAWKSTRIDER"
|only if itemcount(257156) < 1 |or
'|complete hasmount(1261323)
step
label "MOUNT_ITEM_OBTAINED_CERULEAN_HAWKSTRIDER"
use Cerulean Hawkstrider##257156
learnmount Cerulean Hawkstrider##1261323
|only if itemcount(257156) == 1 |or
'|complete hasmount(1261323) |or
]])
GoatQuest:RegisterGuide("Pets & Mounts\\Mounts\\Ground Mounts\\Vendor Mounts\\Crimson Silvermoon Hawkstrider",{
patch='120000',
source='Vendor',
author="Original guide team",
description="This guide will help you acquire the Crimson Silvermoon Hawkstrider mount.",
keywords={"Vendor","Ground"},
mounts={1261322},
mounttype="Ground",
startlevel=10,
},[[
step
Reach Renown {p}Rank 17{} with {y}Silvermoon Court{} |complete factionrenown(2710) >= 17 |or
|tip Use the {b}Silvermoon Court{} Reputation Guide to achieve this.
loadguide "Reputation Guides\\The War Within Reputations\\Silvermoon Court"
'|complete hasmount(1261322) |or
step
earn 6000 Voidlight Marl##3316 |or
|tip You get this currency by killing rare enemies, opening treasures and caches, completing quests, world quests, delves, dungeons, and prey hunts, in Zul'Aman.
'|complete hasmount(1261322) |or
step
talk Caeris Fairdawn##240838
Select _"I want to browse your goods."_ |gossip 138627
buy Crimson Silvermoon Hawkstrider##257154 |goto Eversong Woods M/0 43.46,47.42 |or
'|complete hasmount(1261322) |or
step
use Crimson Silvermoon Hawkstrider##257154
learnmount Crimson Silvermoon Hawkstrider##1261322
]])
GoatQuest:RegisterGuide("Pets & Mounts\\Mounts\\Ground Mounts\\Quest Mounts\\Emerald Hawkstrider",{
patch='120000',
source='Quest',
author="Original guide team",
description="This guide will help you acquire the Emerald Hawkstrider mount.",
keywords={"Quest","Ground"},
mounts={1265785},
mounttype="Ground",
startlevel=90,
},[[
step
Complete _The Battle of the Bridge_ Midnight quest scenario
|tip This mount, and associated pet, both drop upon completion of this quest.
|tip It is a main storyline quest you are offered upon reaching level 90.
|tip You can use {b}The War of Light and Shadow Campaign{} Leveling Guide to complete this.
loadguide "Leveling Guides\\Midnight (80-90)\\The War of Light and Shadow Campaign"
collect Emerald Hawkstrider##260233 |or
'|complete hasmount(1265785) |or
step
use Emerald Hawkstrider##260233
learnmount Emerald Hawkstrider##1265785
]])
GoatQuest:RegisterGuide("Pets & Mounts\\Mounts\\Ground Mounts\\Vendor Mounts\\Fierce Grimlynx",{
patch='120000',
source='Vendor',
author="Original guide team",
description="This guide will help you acquire the Fierce Grimlynx mount.",
keywords={"Vendor","Ground"},
mounts={1243593},
mounttype="Ground",
startlevel=10,
},[[
step
Reach Renown {y}Rank 16{} with the {b}Hara'ti{} |complete factionrenown(2704) >= 16 |or
|tip Use the {b}Hara'ti{} Reputation Guide to achieve this.
loadguide "Reputation Guides\\The War Within Reputations\\Hara'ti"
'|complete hasmount(1243593) |or
step
earn 6000 Voidlight Marl##3316 |or
|tip You get this currency by killing rare enemies, opening treasures and caches, completing quests, world quests, delves, dungeons, and other events, in Harandar.
'|complete hasmount(1243593) |or
step
talk Naynar##240407
|tip Outside the tent.
buy Fierce Grimlynx##246734 |goto Harandar/0 50.95,50.73 |or
'|complete hasmount(1243593) |or
step
use Fierce Grimlynx##246734
learnmount Fierce Grimlynx##1243593
]])
GoatQuest:RegisterGuide("Pets & Mounts\\Mounts\\Ground Mounts\\Vendor Mounts\\Frenzied Shredclaw",{
patch='120000',
source='Vendor',
author="Original guide team",
description="This guide will help you acquire the Frenzied Shredclaw mount.",
keywords={"Vendor","Ground"},
mounts={1261585},
mounttype="Ground",
startlevel=90,
},[[
step
ding 90
step
use Personal Key to the Arcantina##253629
Reach {p}Exalted{} with {b}Slayer's Duellum{} |complete factionrenown(2770) == Exalted |goto Slayers Rise/0 39.34,80.95 |or
|tip Complete daily and weekly {r}PVP{} quests at {o}The Master's Perch{} in {o}Voidstorm{} for reputation.
|tip The repeatable quest there, {b}Collecting Remains{} from {p}Deminos Darktrance{}, is debatably the best way to quickly boost your reputation.
|tip Use {p}Inky Black Potion{} to clearly see the {w}Void-Tainted Remains{} for easy gathering of these rep items.
|tip These little black potions are avalable at {p}Darkmoon Faire{} from vendor, {g}Rona Greenteeth{} (see coordinates below if DMF is active), and also inside {p}The Arcantina{} on top of tables, boxes, countertops, and even on the floor.
|tip Reach {p}The Arcantina{} using your personal key (toy), or via the portal inside the Wayfarer's Rest in Silvermoon City (click coordinates below), both unlocked by completing {y}Arator's Journey{} Leveling questline.
'|complete hasmount(1261585) |or
{g}Rona Greenteeth{} at {p}Darkmoon Faire{} 36.60,57.60
Arcantina Portal [Silvermoon City M/0 56.42,70.80]
step
earn 6000 Voidlight Marl##3316 |or
|tip You get this currency by killing rare enemies, opening treasures and caches, completing quests, world quests, delve quests, dungeon quests, and prey hunts, in any Midnight area, including quests, daily quests, and weekly quests in your neighborhood.
'|complete hasmount(1261585) |or
step
talk Thraxadar##258328
buy Frenzied Shredclaw##257448 |goto Slayers Rise/0 39.17,89.02 |or
'|complete hasmount(1261585) |or
step
use Frenzied Shredclaw##257448
learnmount Frenzied Shredclaw##1261585
]])
GoatQuest:RegisterGuide("Pets & Mounts\\Mounts\\Ground Mounts\\Trading Post Mounts\\Gilneas Loyalist's Rouncey",{
patch='120000',
source='Trading Post',
author="Original guide team",
description="This guide will teach you how to acquire the Gilneas Loyalist's Rouncey ground mount.",
keywords={"Trading Post","Ground"},
mounts={1282276},
mounttype="Ground",
startlevel=10,
},[[
step
earn 500 Trader's Tender##2032 |or
|tip You receive these from the Trading Post Tour quest, opening the chest each month, and from Adventure Guide activities.
'|complete hasmount(1282276) |or
step
Talk to the Trading Post Vendor
buy Gilneas Loyalist's Rouncey##268364 |or
|tip Purchase this from the Trading Post in your capital city.
'|complete hasmount(1282276) |or
step
use Gilneas Loyalist's Rouncey##268364
|tip Unwrap this in your mount collection.
learnmount Gilneas Loyalist's Rouncey##1282276
]])
GoatQuest:RegisterGuide("Pets & Mounts\\Mounts\\Ground Mounts\\Dropped Mounts\\Insatiable Shredclaw",{
patch='120000',
source='Dropped',
author="Original guide team",
description="This guide will help you acquire the Insatiable Shredclaw mount.",
keywords={"Dropped","Ground"},
mounts={1261583},
mounttype="Ground",
startlevel=10,
},[[
step
Enter the caves |goto Voidstorm/0 48.94,78.36 < 20 |walk
|tip Walk past the white circles without touching them, as they despawn.
click the Final Clutch of Predaxis##605169
collect the Reins of the Insatiable Shredclaw##257446 |goto Voidstorm/0 49.94,79.38 |or
|tip Stand in a circle to teleport back to the entrance.
'|complete hasmount(1261583) |or
step
use the Reins of the Insatiable Shredclaw##257446
learnmount Insatiable Shredclaw##1261583
]])
GoatQuest:RegisterGuide("Pets & Mounts\\Mounts\\Ground Mounts\\Dropped Mounts\\Lucent Hawkstrider",{
patch='120000',
source='Drop',
author="Original guide team",
description="This guide will help you acquire the Lucent Hawkstrider mount.",
keywords={"Drop","Ground"},
mounts={1265784},
mounttype="Ground",
startlevel=10,
},[[
step
Enter {b}Magister's Terrace{} on {p}Mythic{} difficulty
kill Degentrius##231865
|tip It may take more than one run to obtain the mount.
collect Lucent Hawkstrider##260231 |or
'|complete hasmount(1265784) |or
step
use Lucent Hawkstrider##260231
learnmount Lucent Hawkstrider##1265784
]])
GoatQuest:RegisterGuide("Pets & Mounts\\Mounts\\Ground Mounts\\Vendor Mounts\\Prowling Shredclaw",{
patch='120000',
source='Vendor',
author="Original guide team",
description="This guide will help you acquire the Prowling Shredclaw mount.",
keywords={"Vendor","Ground"},
mounts={1261584},
mounttype="Ground",
startlevel=90,
},[[
step
ding 90
step
Complete "Arator's Journey" questline
|tip Use the {y}Arator's Journey{} Leveling guide to help you complete this.
loadguide
step
use Personal Key to the Arcantina##253629
Reach {p}Exalted{} with {b}Slayer's Duellum{} |complete factionrenown(2770) == Exalted |goto Slayers Rise/0 39.34,80.95 |or
|tip Complete daily and weekly {r}PVP{} quests at {o}The Master's Perch{} in {o}Voidstorm{} for reputation.
|tip The repeatable quest there, {b}Collecting Remains{} from {p}Deminos Darktrance{}, is debatably the best way to quickly boost your reputation.
|tip Use {p}Inky Black Potion{} to clearly see the {w}Void-Tainted Remains{} for easy gathering of these rep items.
|tip These little black potions are avalable at {p}Darkmoon Faire{} from vendor, {g}Rona Greenteeth{} (see coordinates below if DMF is active), and also inside {p}The Arcantina{} on top of tables, boxes, countertops, and even on the floor.
|tip Reach {p}The Arcantina{} using your personal key (toy), or via the portal in Wayfarer's Rest in Silvermoon City (click coordinates below), both unlocked by completing {y}Arator's Journey{} Leveling questline.
'|complete hasmount(1261584) |or
{g}Rona Greenteeth{} {p}Darkmoon Faire{} at 36.60,57.60
Arcantina Portal [Silvermoon City M/0 56.42,70.80]
step
earn 6000 Voidlight Marl##3316 |or
|tip You get this currency by killing rare enemies, opening treasures and caches, completing quests, world quests, delve quests, dungeon quests, and prey hunts, in any Midnight area, including quests, daily quests, and weekly quests in your neighborhood.
'|complete hasmount(1261584) |or
step
talk Thraxadar##258328
buy Prowling Shredclaw##257447 |goto Slayers Rise/0 39.17,89.02 |or
'|complete hasmount(1261584) |or
step
use Prowling Shredclaw##257447
learnmount Prowling Shredclaw##1261584
]])
GoatQuest:RegisterGuide("Pets & Mounts\\Mounts\\Ground Mounts\\Trading Post Mounts\\Pyrewood Rebel's Rouncey",{
patch='120000',
source='Trading Post',
author="Original guide team",
description="This guide will teach you how to acquire the Pyrewood Rebel's Rouncey ground mount.",
keywords={"Trading Post","Ground"},
mounts={1282275},
mounttype="Ground",
startlevel=10,
},[[
step
earn 500 Trader's Tender##2032 |or
|tip You receive these from the Trading Post Tour quest, opening the chest each month, and from Adventure Guide activities.
'|complete hasmount(1282275) |or
step
Talk to the Trading Post Vendor
buy Pyrewood Rebel's Rouncey##268363 |or
|tip Purchase this from the Trading Post in your capital city.
'|complete hasmount(1282275) |or
step
use Pyrewood Rebel's Rouncey##268363
|tip Unwrap this in your mount collection.
learnmount Pyrewood Rebel's Rouncey##1282275
]])
GoatQuest:RegisterGuide("Pets & Mounts\\Mounts\\Ground Mounts\\Quest Mounts\\Relinquished Scarlet Charger",{
patch='120000',
source='Quest',
author="Original guide team",
description="This guide will help you acquire the Relinquished Scarlet Charger mount.",
keywords={"Quest","Ground"},
mounts={1261391},
mounttype="Ground",
startlevel=80,
},[[
step
Complete the Quest _Relinquishing Relics_
|tip Use the {g}Arator's Journey{} Leveling Guide to accomplish this.
loadguide "Leveling Guides\\Midnight (80-90)\\Story Campaigns\\Arator's Journey (Story Only)"
collect Relinquished Scarlet Charger##257240 |or
'|complete hasmount(1261391) |or
step
use Relinquished Scarlet Charger##257240
learnmount Relinquished Scarlet Charger##1261391
]])
GoatQuest:RegisterGuide("Pets & Mounts\\Mounts\\Ground Mounts\\Dropped Mounts\\Rootstalker Grimlynx",{
patch='120000',
source='Dropped',
author="Original guide team",
description="This guide will help you acquire the Rootstalker Grimlynx mount.",
keywords={"Dropped","Ground"},
mounts={1243597},
mounttype="Ground",
startlevel=10,
},[[
step
label "START_GUIDE_OVER_ROOTSTALKER_GRIMLYNX"
kill Rhazul##248741
|tip Up on a shelf, on the side of the mountain.
collect Vibrant Petalwing##252012 |goto Harandar/0 51.15,45.35 |next "MOUNT_ITEM_OBTAINED_ROOTSTALKER_GRIMLYNX" |or
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1243597) |or
step
kill Queen Lashtongue##249962
collect Rootstalker Grimlynx##246735 |goto Harandar/0 60.16,47.11 |next "MOUNT_ITEM_OBTAINED_ROOTSTALKER_GRIMLYNX" |or
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1243597) |or
step
kill Chlorokyll##249997
collect Vibrant Petalwing##252012 |goto Harandar/0 64.74,48.06 |next "MOUNT_ITEM_OBTAINED_ROOTSTALKER_GRIMLYNX" |or
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1243597) |or
step
kill Ha'kalawe##249849
|tip The mount item drop is available on the first kill of every daily reset.
collect Vibrant Petalwing##252012 |goto Harandar/0 67.96,60.70 |next "MOUNT_ITEM_OBTAINED_ROOTSTALKER_GRIMLYNX" |or
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1243597) |or
step
kill Tallcap the Truthspreader##249902
collect Vibrant Petalwing##252012 |goto Harandar/0 72.62,69.35 |next "MOUNT_ITEM_OBTAINED_ROOTSTALKER_GRIMLYNX" |or
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1243597) |or
step
kill Chironex##249844
collect Vibrant Petalwing##252012 |goto Harandar/0 68.70,40.61 |next "MOUNT_ITEM_OBTAINED_ROOTSTALKER_GRIMLYNX" |or
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1243597) |or
step
kill Stumpy##250086
collect Vibrant Petalwing##252012 |goto Harandar/0 65.74,32.47 |next "MOUNT_ITEM_OBTAINED_ROOTSTALKER_GRIMLYNX" |or
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1243597) |or
step
kill Serrasa##250180
collect Vibrant Petalwing##252012 |goto Harandar/0 55.94,31.63 |next "MOUNT_ITEM_OBTAINED_ROOTSTALKER_GRIMLYNX" |or
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1243597) |or
step
kill Mindrot##250226
collect Vibrant Petalwing##252012 |goto Harandar/0 46.11,32.17 |next "MOUNT_ITEM_OBTAINED_ROOTSTALKER_GRIMLYNX" |or
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1243597) |or
step
kill Annulus the Worldshaker##250358
|tip He patrols around here.
collect Vibrant Petalwing##252012 |goto Harandar/0 43.76,16.78 |next "MOUNT_ITEM_OBTAINED_ROOTSTALKER_GRIMLYNX" |or
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1243597) |or
step
kill Dracaena##250231
collect Vibrant Petalwing##252012 |goto Harandar/0 40.53,43.27 |next "MOUNT_ITEM_OBTAINED_ROOTSTALKER_GRIMLYNX" |or
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1243597) |or
step
kill Ahl'ua'huhi##250347
collect Vibrant Petalwing##252012 |goto Harandar/0 39.75,60.21 |next "MOUNT_ITEM_OBTAINED_ROOTSTALKER_GRIMLYNX" |or
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1243597) |or
step
kill Treetop##250246
|tip Bound by roots in Suncrown Village.
collect Vibrant Petalwing##252012 |goto Harandar/0 36.34,75.35 |next "MOUNT_ITEM_OBTAINED_ROOTSTALKER_GRIMLYNX" |or
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1243597) |or
step
kill Oro'ohna##250317
collect Vibrant Petalwing##252012 |goto Harandar/0 28.19,81.81 |next "MOUNT_ITEM_OBTAINED_ROOTSTALKER_GRIMLYNX" |or
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1243597) |or
step
kill Treetop##250246
|tip Bound by roots in Suncrown Village.
collect Vibrant Petalwing##252012 |goto Harandar/0 36.34,75.35 |next "MOUNT_ITEM_OBTAINED_ROOTSTALKER_GRIMLYNX" |or
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1243597) |or
step
kill Pterrock##250321
|tip Inside the cave
collect Vibrant Petalwing##252012 |goto Harandar/0 27.39,71.39
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1243597) |or
step
Return to the Start of this Guide
|tip Kill them all again after daily reset for the best chance to receive the mount item.
|tip The mount item drop is available on the first kill of every daily reset.
Click Here to Start Over |confirm |next "START_GUIDE_OVER_ROOTSTALKER_GRIMLYNX"
|only if itemcount(246735) < 1 |or
'|complete hasmount(1243597) |or
step
label "MOUNT_ITEM_OBTAINED_ROOTSTALKER_GRIMLYNX"
use Rootstalker Grimlynx##246735
learnmount Rootstalker Grimlynx##1243597
|only if itemcount(246735) == 1
]])
GoatQuest:RegisterGuide("Pets & Mounts\\Mounts\\Ground Mounts\\Vendor Mounts\\Skypaw Glimmerfur",{
patch='120000',
source='Vendor',
author="Original guide team",
description="This guide will help you acquire the Skypaw Glimmerfur mount.",
keywords={"Vendor","Ground"},
mounts={1263369},
mounttype="Ground",
startlevel=10,
},[[
step
earn 5000 Timewarped Badge##1166 |or
|tip These are rewarded from completing quests and running Timewalking Dungeons during Timewalking events.
|tip You can find these events listed on the game calendar, which you can find by clicking the icon next to your in-game clock.
'|complete hasmount(1263369) |or
step
talk Collector Ta'steld##252687
|tip Only available during the Shadowlands Timewalking event.
buy Skypaw Glimmerfur##258488 |goto Oribos/0 56.56,63.63 |or
'|complete hasmount(1263369) |or
step
use Skypaw Glimmerfur##258488
learnmount Skypaw Glimmerfur##1263369
]])
GoatQuest:RegisterGuide("Pets & Mounts\\Mounts\\Ground Mounts\\Dropped Mounts\\Spectral Hawkstrider",{
patch='110207',
source='Dropped',
author="Original guide team",
description="This guide will help you acquire the Spectral Hawkstrider mount.",
keywords={"Dropped","Ground"},
mounts={1263635},
mounttype="Ground",
startlevel=90,
},[[
step
Enter the {y}Windrunner Spire{} Dungeon on Mythic Difficulty |goto Eversong Woods M/0 35.48,78.82 < 15 |c |or
|tip Enter with a 5-man group.
'|complete hasmount(1263635) |or
step
_Inside the Windrunner Spire Dungeon:_
|tip Complete all 4 boss encounters in the dungeon on mythic difficulty.
|tip The mount item has a chance to drop in the Challenger's Cache after killing the last boss.
click Challenger's Cache##574408
collect Spectral Hawkstrider##262914 |or
'|complete hasmount(1263635) |or
step
use Spectral Hawkstrider##262914
learnmount Spectral Hawkstrider##1263635
]])
GoatQuest:RegisterGuide("Pets & Mounts\\Mounts\\Ground Mounts\\Dropped Mounts\\Untainted Grove Crawler",{
patch='120000',
source='Dropped',
author="Original guide team",
description="This guide will help you acquire the Untainted Grove Crawler mount.",
keywords={"Dropped","Ground"},
mounts={1260354},
mounttype="Ground",
startlevel=10,
},[[
step
click Fungal Mallet##615908
|tip Inside the cave, leaning up against the yellow window.
|tip This buff only lasts for 5 minutes.
|tip Fungal Mallet buff is retrievable.
Gain the Fungal Mallet buff |complete hasbuff(1266347) |goto Harandar/0 41.31,68.00 |or
'|complete hasmount(1260354) |or
step
click Mycelium Gong##615907 |goto Harandar/0 46.63,67.84
|tip Under the little mushroom pavillion.
|tip Must have the Fungal Mallet buff.
click Sporespawned Cache##615963 |n
|tip Spawns nearby.
collect Untainted Grove Crawler##256423 |goto Harandar/0 46.67,67.80 |or
'|complete hasmount(1260354) |or
step
use Untainted Grove Crawler##256423
|tip In your bags.
learnmount Untainted Grove Crawler##1260354
]])
GoatQuest:RegisterGuide("Pets & Mounts\\Mounts\\Ground Mounts\\Achievement Mounts\\Vivacious Chloroceros",{
patch='120000',
source='Achievement',
author="Original guide team",
description="This guide will help you acquire the Vivacious Chloroceros mount.",
keywords={"Achievement","Ground"},
mounts={1270673},
mounttype="Ground",
startlevel=83,
},[[
step
Complete the {p}Treasures of Harandar{} Achievement
|tip Use the {p}Treasures of Harandar{} Achievement guide to accomplish this.
loadguide "Achievement Guides\\Exploration\\Midnight\\Treasures of Harandar"
learnmount Vivacious Chloroceros##1270673
]])
GoatQuest:RegisterGuide("Pets & Mounts\\Mounts\\Ground Mounts\\Profession Mounts\\Void-Corrupted Lynx",{
patch='120100',
source='Profession',
author="Original guide team",
description="This guide will help you acquire the Void-Corrupted Lynx mount.",
keywords={"Leatherworking","Ground"},
mounts={1287359},
mounttype="Ground",
startlevel=90,
},[[
step
Reach Ritual Sites Renown Rank 8 |complete factionrenown(2792) >= 8 |or
|tip Use the Void Strikes Event Guide to achieve this.
loadguide "Events Guides\\Midnight (80-90)\\Eversong Woods Void Assaults" |only if areapoi(2395,8758)
loadguide "Events Guides\\Midnight (80-90)\\Zul'Aman Void Assaults" |only if areapoi(2437,8757)
'|complete hasmount(1287359) |or
step
Enter Daggerspine Point Ritual Site Scenario |goto Eversong Woods M/0 34.89,65.44 |only if areapoi(2395,8758)
Enter Speaker's Rest Ritual Site Scenario |goto Zul Aman M/0 29.71,78.18 |only if areapoi(2437,8757)
|tip Complete the scenario and loot the end of run treasure.
collect Broken Lynx Leash##272392
collect Pattern: Rope Lynx Harness##272391
|tip You may have to complete this scenario more than once to obtain these items.
|tip Only the {b}Broken Lynx Leash{} is needed to put in a crafting order.
step
Click Here to Collect the Reagents for this mount |confirm |next "COLLECT_REAGENTS_VOID-CORRUPTED_LYNX"
-OR-
Click Here to Skip Reagent Collection and Place a Crafting Order |confirm |next "CRAFTING_VOID-CORRUPTED_LYNX"
step
label "COLLECT_REAGENTS_VOID-CORRUPTED_LYNX"
Collect Reagents:
collect 40 Mote of Primal Energy##236950 |or
|tip These can be fished along waterways in any part of the Midnight zones, looted from chests that appear while fishing, transmuted by a level 15 Midnight alchemist, looted from skinning, picking herbs, and mining.
|tip They can also available in the auction house.
'|complete hasmount(1287359) |or
step
Collect Reagents:
collect Infused Scalewoven Hide##244634 |or
collect 2 Sin'dorei Armor Banding##244636 |or
|tip These are both crafted by level 35 Midnight {b}Leatherworker{}, and they can also be purchased from the auction house.
'|complete hasmount(1287359) |or
step
label "CRAFTING_VOID-CORRUPTED_LYNX"
Click Here to Create a Crafting Order for {p}Rope Lynx Harness{} |confirm |next "CRAFTING_ORDER_VOID-CORRUPTED_LYNX"
-OR- |only hasprof("Midnight Leatherworking",1,100)
Click Here to Craft the Mount Item with your {b}Leatherworking{} Profession |confirm |next "LEATHERWORKING_CRAFT_VOID-CORRUPTED_LYNX" |only hasprof("Midnight Leatherworking",1,100)
step
label "CRAFTING_ORDER_VOID-CORRUPTED_LYNX"
Place a Crafting Order for {p}Rope Lynx Harness{}
|tip You can enter the name into the Search field to begin.
|tip Make sure you have the crafting reagents in your bag before placing the order.
|tip If you don't have all the reagents to make the craft, consider adding a commission great enough for the crafter to purchase those items from the auction house.
|tip Add a note to the crafter with any information you would like them to know.
|tip The completed order will be delivered to your mailbox.
collect Rope Lynx Harness##270058 |goto Silvermoon City M/0 45.00,55.61 |next "USE_ROPE_LYNX_HARNESS"
step
label "LEATHERWORKING_CRAFT_VOID-CORRUPTED_LYNX"
use Pattern: Rope Lynx Harness##272391
learn Rope Lynx Harness##1291046
|only hasprof("Midnight Leatherworking",1,100)
step
Craft the {p}Rope Lynx Harness{}
|tip This craft requires level 90 Midnight {b}Leatherworking{}.
|tip Open your Midnight {b}Leatherworking{} panel, select {p}Rope Lynx Harness{} from the list on the left, then click Create.
collect Rope Lynx Harness##270058
|only hasprof("Midnight Leatherworking",1,100)
]])
GoatQuest:RegisterGuide("Pets & Mounts\\Mounts\\Ground Mounts\\Vendor Mounts\\Vivid Chloroceros",{
patch='120000',
source='Vendor',
author="Original guide team",
description="This guide will help you acquire the Vivid Chloroceros mount.",
keywords={"Vendor","Ground"},
mounts={1270675},
mounttype="Ground",
startlevel=10,
},[[
step
Reach Renown Rank 4 with the Hara'ti |complete factionrenown(2704) >= 4 |or
|tip Use the {y}Hara'ti{} Reputation Guide to accomplish this.
loadguide "Reputation Guides\\The War Within Reputations\\Hara'ti"
'|complete hasmount(1270675) |or
step
Click at Least #50# Glowing Moths
|tip They are tiny flying moths that show up as blue or purple dots on your minimap.
|tip Collecting these will activate the mount item in the vendor inventory.
|tip They can be found all around Harandar.
|complete achieveprogress(61052,1) >= 50 |or
'|complete hasmount(1270675) |or
step
earn 10 Luminous Dust##3385 |or
|tip These drop when you click the Glowing Moths in the previous steps.
'|complete hasmount(1270675) |or
step
talk Mothkeeper Wew'tam##251259
accept Vivid Chloroceros##96502 |goto Harandar/0 49.25,54.33 |or
'|complete hasmount(1270675) |or
step
talk Mothkeeper Wew'tam##251259
turnin Vivid Chloroceros##96502 |goto Harandar/0 49.25,54.33 |or
'|complete hasmount(1270675) |or
step
collect Vivid Chloroceros##263580 |or
step
use Vivid Chloroceros##263580
learnmount Vivid Chloroceros##1270675
]])
GoatQuest:RegisterGuide("Pets & Mounts\\Mounts\\Ground Mounts\\Vendor Mounts\\Void-Touched Hawkstrider",{
patch='120000',
source='Vendor',
author="Original guide team",
description="This guide will teach you how to acquire the Void-Touched Hawkstrider mount.",
keywords={"Vendor","Ground"},
mounts={1282936},
mounttype="Ground",
startlevel=90,
},[[
step
Reach Ritual Sites Renown Rank 8 |complete factionrenown(2792) >= 8 |or
|tip Use the Void Strikes Event Guide to achieve this.
loadguide "Events Guides\\Midnight (80-90)\\Eversong Woods Void Assaults" |only if areapoi(2395,8758)
loadguide "Events Guides\\Midnight (80-90)\\Zul'Aman Void Assaults" |only if areapoi(2437,8757)
'|complete hasmount(1282936) |or
step
earn 50 Field Accolade##3405 |or
|tip You get this currency from completing Ritual Sites and Void Strike Events.
'|complete hasmount(1282936) |or
step
talk Sergeant Vornin##255503
Select _"Do you have any mounts or pets available now?"_ |gossip 138966
buy Void-Touched Hawkstrider##268578 |goto Silvermoon City M/0 48.68,50.37 |or
'|complete hasmount(1282936) |or
step
use Void-Touched Hawkstrider##268578
learnmount Void-Touched Hawkstrider##1282936
]])
GoatQuest:RegisterGuide("Pets & Mounts\\Mounts\\Ground Mounts\\Dropped Mounts\\Witherbark Pango",{
patch='120000',
source='Dropped',
author="Original guide team",
description="This guide will help you acquire the Witherbark Pango mount.",
keywords={"Dropped","Ground"},
mounts={1261351},
mounttype="Ground",
startlevel=10,
},[[
step
label "START_GUIDE_OVER_WITHERBARK_PANGO"
kill The Snapping Scourge##242024
|tip The mount item drop is available on the first kill of every daily reset.
|tip If the spawn time is long, you can go to the next rare spawn by clicking below.
collect Amani Sharptalon##257152 |goto Zul Aman M/0 51.79,18.65 |next "MOUNT_ITEM_OBTAINED_AMANI_SHARPTALON" |or
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1261351) |or
step
kill Depthborn Eelamental##242027
|tip The mount item drop is available on the first kill of every daily reset.
collect Escaped Witherbark Pango##257200 |goto Zul Aman M/0 47.67,20.56 |next "MOUNT_ITEM_OBTAINED_WITHERBARK_PANGO" |or
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1261351) |or
step
Enter the cave |goto Zul Aman M/0 39.50,20.20 < 10 |walk
kill The Devouring Invader##242035
|tip Inside the cave.
|tip The mount item drop is available on the first kill of every daily reset.
collect Escaped Witherbark Pango##257200 |goto Zul Aman M/0 39.55,21.03 |next "MOUNT_ITEM_OBTAINED_WITHERBARK_PANGO" |or
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1261351) |or
step
Enter the cave |goto Zul Aman M/0 28.75,24.06 < 10 |walk
kill Lightwood Borer##242028
|tip Inside the cave.
|tip The mount item drop is available on the first kill of every daily reset.
collect Escaped Witherbark Pango##257200 |goto Zul Aman M/0 28.91,24.42 |next "MOUNT_ITEM_OBTAINED_WITHERBARK_PANGO" |or
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1261351) |or
step
kill Necrohexxer Raz'ka##242023
|tip The mount item drop is available on the first kill of every daily reset.
collect Escaped Witherbark Pango##257200 |goto Zul Aman M/0 34.40,33.04 |next "MOUNT_ITEM_OBTAINED_WITHERBARK_PANGO" |or
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1261351) |or
step
kill Tiny Vermin##242033
|tip The mount item drop is available on the first kill of every daily reset.
collect Escaped Witherbark Pango##257200 |goto Zul Aman M/0 47.79,34.51 |next "MOUNT_ITEM_OBTAINED_WITHERBARK_PANGO" |or
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1261351) |or
step
kill Ash'an the Empowered##245692
|tip Inside the cave.
|tip You may need help with this.
|tip The mount item drop is available on the first kill of every daily reset.
collect Escaped Witherbark Pango##257200 |goto Zul Aman M/0 45.31,41.71 |next "MOUNT_ITEM_OBTAINED_WITHERBARK_PANGO" |or
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1261351) |or
step
kill The Decaying Diamondback##245691
|tip In the pit.
|tip Avoid green gas and blue puddles.
|tip You may need help with this.
|tip The mount item drop is available on the first kill of every daily reset.
collect Escaped Witherbark Pango##257200 |goto Zul Aman M/0 46.46,43.57 |next "MOUNT_ITEM_OBTAINED_WITHERBARK_PANGO" |or
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1261351) |or
step
Enter the cave |goto Zul Aman M/0 46.46,51.82 < 10 |walk
kill Oophaga##242032
|tip Inside the cave.
|tip The mount item drop is available on the first kill of every daily reset.
collect Escaped Witherbark Pango##257200 |goto Zul Aman M/0 46.44,51.06 |next "MOUNT_ITEM_OBTAINED_WITHERBARK_PANGO" |or
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1261351) |or
step
Kill the rare spawns in Zul'Aman
|tip The mount drop is available on the first kill of every daily reset.
kill Poacher Rav'ik##247976
collect Escaped Witherbark Pango##257200 |goto Zul Aman M/0 39.01,49.98 |next "MOUNT_ITEM_OBTAINED_WITHERBARK_PANGO" |or
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1261351) |or
step
kill Spinefrill##242031
|tip Underwater.
|tip The mount item drop is available on the first kill of every daily reset.
collect Escaped Witherbark Pango##257200 |goto Zul Aman M/0 30.47,44.55 |next "MOUNT_ITEM_OBTAINED_WITHERBARK_PANGO" |or
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1261351) |or
step
kill Voidtouched Crustacean##242034
|tip The mount item drop is available on the first kill of every daily reset.
collect Escaped Witherbark Pango##257200 |goto Zul Aman M/0 21.18,70.71 |next "MOUNT_ITEM_OBTAINED_WITHERBARK_PANGO" |or
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1261351) |or
step
kill Elder Oaktalon##242026
|tip The mount item drop is available on the first kill of every daily reset.
collect Escaped Witherbark Pango##257200 |goto Zul Aman M/0 33.69,88.96 |next "MOUNT_ITEM_OBTAINED_WITHERBARK_PANGO" |or
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1261351) |or
step
kill Skullcrusher Harak##242025
|tip The mount item drop is available on the first kill of every daily reset.
collect Escaped Witherbark Pango##257200 |goto Zul Aman M/0 51.84,72.89 |next "MOUNT_ITEM_OBTAINED_WITHERBARK_PANGO" |or
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1261351) |or
step
kill Mrrlokk##245975
|tip The mount item drop is available on the first kill of every daily reset.
collect Escaped Witherbark Pango##257200 |goto Zul Aman M/0 50.82,65.16|next "MOUNT_ITEM_OBTAINED_WITHERBARK_PANGO" |or
-OR-
Click Here to Complete This Guide |confirm
'|complete hasmount(1261351) |or
step
Return to the Start of this Guide
|tip Kill them all again after daily reset if you haven't yet received the mount item.
Click Here to Start Over |confirm |next "START_GUIDE_OVER_WITHERBARK_PANGO"
'|complete hasmount(1261351)
step
label "MOUNT_ITEM_OBTAINED_WITHERBARK_PANGO"
use Witherbark Pango##257200
learnmount Witherbark Pango##1261351
|only if itemcount(257200) |or
'|complete hasmount(1261351) |or
]])
GoatQuest:RegisterGuide("Pets & Mounts\\Mounts\\Ground Mounts\\Dropped Mounts\\Witherbark Warbear Mother",{
patch='110207',
source='Dropped',
author="Original guide team",
description="This guide will help you acquire the Witherbark Warbear Mother mount.",
keywords={"Dropped","Ground"},
mounts={1261362},
mounttype="Ground",
startlevel=90,
},[[
step
collect 6 Practically Pork##242639 |only if not haspet(5019)
collect 5 Practically Pork##242639 |only if haspet(5019)
-OR-
collect 6 Sin'dorei Swarmer##238365 |only if not haspet(5019)
collect 5 Sin'dorei Swarmer##238365 |only if haspet(5019)
|tip {w}Practically Pork{} is a crafting reagent that can be fished, looted, or skinned from beasts.
|tip {w}Sin'dorei Swarmer{} can be fished from almost any body of fishable water.
|tip You can also purchase either of these reagents in the auction house.
|tip You need 1 of either of these to get the {b}Chubs{} battle pet that will allow you to spawn the NPC that drops the mount. |only if not haspet(5019)
confirm
step
click Curious Obelisk##260104 |goto Zul Aman M/0 29.58,77.94
|tip Queue at difficulty {b}Tier 2{} or higher.
|tip You can queue solo, or with a party of up to 5.
Enter {y}Ritual Site{}: {w}Broken Throne{} |complete zone("Broken Throne") |goto Broken Throne/0 62.32,58.93 |or
'|complete hasmount(1261362) |or
step
Acquire the {b}Chubs{} battle pet
|tip Inside this instance.
|tip Use the Chubs battle Pet guide to accomplish this.
loadguide "Pets & Mounts\\Battle Pets\\Beast Pets\\Ritual Site Pets\\Chubs"
learnpet Chubs##5019 |or
'|complete hasmount(1261362) |or
|only if not haspet(5019)
step
cast Chubs##1286634
|tip Walk up to the piles of {w}Chewed Meat{} with Chubs and the Angry Amani Warbear will spawn.
kill Angry Amani Warbear##263381 |goto Broken Throne/0 55.84,38.39
|tip He will turn friendly at 1% health.
'|complete incombat |or
'|complete hasmount(1261362) or itemcount(257225) == 1 |or
step
talk Angry Amani Warbear##263381
|tip He looks hungry.
Select _"Choose Feed the bear some Practically Pork <Cost 5 Practically Pork>"_ |gossip 139454
collect Witherbark Warbear Harness##257225 |or
'|complete hasmount(1261362) |or
step
use Witherbark Warbear Harness##257225
learnmount Witherbark Warbear Mother##1261362
]])
GoatQuest:RegisterGuide("Pets & Mounts\\Mounts\\Flying Mounts\\Dropped Mounts\\Amani Sharptalon",{
patch='120000',
source='Dropped',
author="Original guide team",
description="This guide will help you acquire the Amani Sharptalon mount.",
keywords={"Dropped","Flying"},
mounts={1261316},
mounttype="Flying",
startlevel=10,
},[[
step
label "START_GUIDE_OVER_AMANI_SHARPTALON"
kill The Snapping Scourge##242024
|tip The mount item drop is available on the first kill of every daily reset.
|tip If the spawn time is long, you can go to the next rare spawn by clicking below.
collect Amani Sharptalon##257152 |goto Zul Aman M/0 51.79,18.65 |next "MOUNT_ITEM_OBTAINED_AMANI_SHARPTALON" |or
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1261316) |or
step
kill Depthborn Eelamental##242027
|tip The mount item drop is available on the first kill of every daily reset.
collect Amani Sharptalon##257152 |goto Zul Aman M/0 47.67,20.56 |next "MOUNT_ITEM_OBTAINED_AMANI_SHARPTALON" |or
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1261316) |or
step
Enter the cave |goto Zul Aman M/0 39.50,20.20 < 10 |walk
kill The Devouring Invader##242035
|tip Inside the cave.
|tip The mount item drop is available on the first kill of every daily reset.
collect Amani Sharptalon##257152 |goto Zul Aman M/0 39.55,21.03 |next "MOUNT_ITEM_OBTAINED_AMANI_SHARPTALON" |or
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1261316) |or
step
Enter the cave |goto Zul Aman M/0 28.75,24.06 < 10 |walk
kill Lightwood Borer##242028
|tip Inside the cave.
|tip The mount item drop is available on the first kill of every daily reset.
collect Amani Sharptalon##257152 |goto Zul Aman M/0 28.91,24.42 |next "MOUNT_ITEM_OBTAINED_AMANI_SHARPTALON" |or
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1261316) |or
step
kill Necrohexxer Raz'ka##242023
|tip The mount item drop is available on the first kill of every daily reset.
collect Amani Sharptalon##257152 |goto Zul Aman M/0 34.40,33.04 |next "MOUNT_ITEM_OBTAINED_AMANI_SHARPTALON" |or
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1261316) |or
step
kill Tiny Vermin##242033
collect Amani Sharptalon##257152 |goto Zul Aman M/0 47.79,34.51 |next "MOUNT_ITEM_OBTAINED_AMANI_SHARPTALON" |or
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1261316) |or
step
kill Ash'an the Empowered##245692
|tip Inside the cave.
|tip You may need help with this.
|tip The mount item drop is available on the first kill of every daily reset.
collect Amani Sharptalon##257152 |goto Zul Aman M/0 45.31,41.71 |next "MOUNT_ITEM_OBTAINED_AMANI_SHARPTALON" |or
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1261316) |or
step
kill The Decaying Diamondback##245691
|tip In the pit.
|tip Avoid green gas and blue puddles.
|tip You may need help with this.
|tip The mount item drop is available on the first kill of every daily reset.
collect Amani Sharptalon##257152 |goto Zul Aman M/0 46.46,43.57 |next "MOUNT_ITEM_OBTAINED_AMANI_SHARPTALON" |or
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1261316) |or
step
Enter the cave |goto Zul Aman M/0 46.46,51.82 < 10 |walk
kill Oophaga##242032
|tip Inside the cave.
|tip The mount item drop is available on the first kill of every daily reset.
collect Amani Sharptalon##257152 |goto Zul Aman M/0 46.44,51.06 |next "MOUNT_ITEM_OBTAINED_AMANI_SHARPTALON" |or
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1261316) |or
step
kill Poacher Rav'ik##247976
|tip The mount item drop is available on the first kill of every daily reset.
collect Amani Sharptalon##257152 |goto Zul Aman M/0 39.01,49.98 |next "MOUNT_ITEM_OBTAINED_AMANI_SHARPTALON" |or
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1261316) |or
step
kill Spinefrill##242031
|tip Underwater.
|tip The mount item drop is available on the first kill of every daily reset.
collect Amani Sharptalon##257152 |goto Zul Aman M/0 30.47,44.55 |next "MOUNT_ITEM_OBTAINED_AMANI_SHARPTALON" |or
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1261316) |or
step
kill Voidtouched Crustacean##242034
|tip The mount item drop is available on the first kill of every daily reset.
collect Amani Sharptalon##257152 |goto Zul Aman M/0 21.18,70.71 |next "MOUNT_ITEM_OBTAINED_AMANI_SHARPTALON" |or
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1261316) |or
step
kill Elder Oaktalon##242026
|tip The mount item drop is available on the first kill of every daily reset.
collect Amani Sharptalon##257152 |goto Zul Aman M/0 33.69,88.96 |next "MOUNT_ITEM_OBTAINED_AMANI_SHARPTALON" |or
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1261316) |or
step
kill Skullcrusher Harak##242025
|tip The mount item drop is available on the first kill of every daily reset.
collect Amani Sharptalon##257152 |goto Zul Aman M/0 51.84,72.89 |next "MOUNT_ITEM_OBTAINED_AMANI_SHARPTALON" |or
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1261316) |or
step
kill Mrrlokk##245975
|tip The mount item drop is available on the first kill of every daily reset.
collect Amani Sharptalon##257152 |goto Zul Aman M/0 50.82,65.16|next "MOUNT_ITEM_OBTAINED_AMANI_SHARPTALON" |or
-OR-
Click Here to Complete This Guide |confirm
'|complete hasmount(1261316) |or
step
Return to the Start of this Guide
|tip Kill them all again after daily reset.
Click Here to Start Over |confirm |next "START_GUIDE_OVER_AMANI_SHARPTALON"
'|complete hasmount(1261316)
step
label "MOUNT_ITEM_OBTAINED_AMANI_SHARPTALON"
use Amani Sharptalon##257152
learnmount Amani Sharptalon##1261316
|only if itemcount(257152) |or
'|complete hasmount(1261316) |or
]])
GoatQuest:RegisterGuide("Pets & Mounts\\Mounts\\Flying Mounts\\Vendor Mounts\\Amani Sunfeather",{
patch='120000',
source='Vendor',
author="Original guide team",
description="This guide will help you acquire the Amani Sunfeather mount.",
keywords={"Vendor","Flying"},
mounts={1251433},
mounttype="Flying",
startlevel=10,
},[[
step
earn 1600 Unalloyed Abundance##3377 |or
|tip Earn this currency from Abundance Events.
|tip Use the Abundance Leveling guide to unlock this.
loadguide "Leveling Guides\\Midnight (80-90)\\Extra Storylines\\Abundance"
'|complete hasmount(1251433) |or
step
Talk to Chel the Chip
|tip This is the Abundance Vendor who can be found in all the Midnight zones.
Eversong Woods [Eversong Woods M/0 56.82,65.82]
Zul'Aman [Zul Aman M/0 32.04,26.11]
Harandar [Harandar/0 66.00,61.58]
Voidstorm [Voidstorm/0 38.78,53.20]
buy Amani Sunfeather##250782
learnmount Amani Sunfeather##1251433
]])
GoatQuest:RegisterGuide("Pets & Mounts\\Mounts\\Flying Mounts\\Vendor Mounts\\Amani Windcaller",{
patch='120000',
source='Vendor',
author="Original guide team",
description="This guide will help you acquire the Amani Windcaller mount.",
keywords={"Vendor","Flying"},
mounts={1251630},
mounttype="Flying",
startlevel=10,
},[[
step
Reach Renown {p}Rank 19{} with {y}Amani Tribe{} |complete factionrenown(2696) >= 19 |or
|tip Use the {b}Amani Tribe{} Reputation Guide to achieve this.
loadguide "Reputation Guides\\The War Within Reputations\\Amani Tribe"
'|complete hasmount(1251630) |or
step
earn 8000 Voidlight Marl##3316 |or
|tip You get this currency by killing rare enemies, opening treasures and caches, completing quests, world quests, delves, dungeons, and prey hunts, in Zul'Aman.
'|complete hasmount(1251630) |or
step
talk Magovu##240279
|tip Inside the building.
buy Amani Windcaller##250889 |goto Zul Aman M/0 45.95,65.92 |or
'|complete hasmount(1251630) |or
step
use Amani Windcaller##250889
learnmount Amani Windcaller##1251630
]])
GoatQuest:RegisterGuide("Pets & Mounts\\Mounts\\Flying Mounts\\In-Game Shop Mounts\\Amberback Arboon",{
patch='120000',
source='In-Game Shop',
author="Original guide team",
description="This guide will help you acquire the Amberback Arboon mount.",
keywords={"In-Game Shop","Flying"},
mounts={1282453},
mounttype="Flying",
startlevel=10,
},[[
step
May be Available for Purchase in the Blizzard Online Store
|tip Once purchased, unwrap in your mount inventory.
|tip This mount may be available in the Trading Post, or for 6- or 12-month sub reward.
learnmount Amberback Arboon##1282453
]])
GoatQuest:RegisterGuide("Pets & Mounts\\Mounts\\Flying Mounts\\Achievement Mounts\\Arcanovoid Construct",{
patch='120000',
source='Achievement',
author="Original guide team",
description="This guide will help you acquire the Arcanovoid Construct mount.",
keywords={"Achievement","Flying"},
mounts={1268949},
mounttype="Flying",
startlevel=10,
},[[
step
Enter the {b}Torment's Rise{} Delve alone |goto Voidstorm/0 61.18,71.35
kill Nullaeus##252892
|tip Inside the delve.
|tip Interrupt his {p}Emptiness of the Void{} cast to avoid a wipe.
|tip A good preparation strategy is to key bind your interrupt spell.
collect Arcanovoid Construct##263222
step
use Arcanovoid Construct##263222
learnmount Arcanovoid Construct##1268949
]])
GoatQuest:RegisterGuide("Pets & Mounts\\Mounts\\Flying Mounts\\Dropped Mounts\\Ashes of Belo'ren",{
patch='120000',
source='Dropped',
author="Original guide team",
description="This guide will help you acquire the Ashes of Belo'ren mount.",
keywords={"Dropped","Flying"},
mounts={1242904},
mounttype="Flying",
startlevel=10,
},[[
step
Enter with your Raid Team and Defeat Midnight Falls in the March on Quel'Danas Raid on Mythic difficulty |goto Isle of Quel Danas M/0 52.60,85.68
|tip This mount has a chance to drop from this encounter.
|tip You may have to defeat this boss more than once to obtain the mount.
collect Ashes of Belo'ren##246590 |or
'|complete hasmount(1242904) |or
step
use Ashes of Belo'ren##246590
learnmount Ashes of Belo'ren##1242904
]])
GoatQuest:RegisterGuide("Pets & Mounts\\Mounts\\Flying Mounts\\Trading Post Mounts\\Blackwater X-TREME Firework Rocket",{
patch='120700',
source='Trading Post',
author="Original guide team",
description="This guide will help you acquire the Blackwater X-TREME Firework Rocket mount.",
keywords={"Trading","Post","Flying"},
mounts={1292102},
mounttype="Flying",
startlevel=10,
},[[
step
earn 700 Trader's Tender##2032 |or
|tip You receive these from the Trading Post Tour quest, opening the chest each month, and from Adventure Guide activities.
'|complete hasmount(1292102) |or
step
Talk to the Trading Post Vendor
buy Blackwater X-TREME Firework Rocket##273317 |or
|tip Purchase this from the Trading Post in your capital city.
'|complete hasmount(1292102) |or
step
use Blackwater X-TREME Firework Rocket##273317
|tip Unwrap this in your mount collection.
learnmount Blackwater X-TREME Firework Rocket##1292102
]])
GoatQuest:RegisterGuide("Pets & Mounts\\Mounts\\Flying Mounts\\In-Game Shop Mounts\\Blossomback Arboon",{
patch='120000',
source='In-Game Shop',
author="Original guide team",
description="This guide will help you acquire the Blossomback Arboon mount.",
keywords={"In-Game Shop","Flying"},
mounts={1282450},
mounttype="Flying",
startlevel=10,
},[[
step
May be Available for Purchase in the Blizzard Online Store
|tip Once purchased, unwrap in your mount inventory.
|tip This mount may be available in the Trading Post, or for 6- or 12-month sub reward.
learnmount Blossomback Arboon##1282450
]])
GoatQuest:RegisterGuide("Pets & Mounts\\Mounts\\Flying Mounts\\Achievement Mounts\\Calamitous Carrion",{
patch='120000',
source='Achievement',
author="Original guide team",
description="This guide will teach you how to acquire the Calamitous Carrion mount.",
keywords={"Achievement","Flying"},
mounts={1257058},
mounttype="Flying",
startlevel=20,
},[[
step
{y}This Mount is No Longer Available{}
{g}It may become available in future at the Trading Post, as a sub reward, or in the Blizzard Store.
achieve 61256
|tip Attain a Mythic+ Rating of at least {w}2000{} during {p}Midnight{} Season One.
|tip You may get a Mythic+ keystone when running a dungeon on {p}Mythic{} difficulty.
|tip Complete Mythic+ dungeons using a keystone.
|tip Ratings are determined by {y}Key Level{} and {b}Speed{}.
|tip Ratings for each dungeon are accumulated across two weekly affixes, {o}Fortified{} and {r}Tyrannical{}.
|tip To efficiently increase your rating, run every dungeon in the current season pool on both affixes, and focus on upgrading your lowest-scored dungeons first.
|tip Timed M+6s and M+7s should give you this rating.
learnmount Calamitous Carrion##1257058
]])
GoatQuest:RegisterGuide("Pets & Mounts\\Mounts\\Flying Mounts\\Vendor Mounts\\Caustic Venomfang",{
patch='120700',
source='Vendor',
author="Original guide team",
description="This guide will help you obtain the Caustic Venomfang flying mount.",
keywords={"Vendor","Flying"},
mounts={1297217},
mounttype="Flying",
startlevel=10,
},[[
step
earn 10000 Corrosive Coin##3448 |or
|tip Participate in the Events in the Vaults of Atal'Utek to obtain these.
|tip Event sequence is always Strike -> Incursion -> Ancient Foe.
|tip Do patrols in between the main events.
'|complete hasmount(1297217) |or
step
talk Skull of Er'inye##272751
|tip Inside the Vaults of Atal'Utek.
buy Caustic Venomfang##275654 |goto Vaults of Atal'Utek/0 51.16,62.80 |or
'|complete hasmount(1297217) |or
step
use Caustic Venomfang##275654
learnmount Caustic Venomfang##1297217
]])
GoatQuest:RegisterGuide("Pets & Mounts\\Mounts\\Flying Mounts\\Vendor Mounts\\Cerulean Sporeglider",{
patch='120000',
source='Vendor',
author="Original guide team",
description="This guide will help you to acquire the Cerulean Sporeglider mount.",
keywords={"Vendor","Flying"},
mounts={1253929},
mounttype="Flying",
startlevel=20,
},[[
step
Reach Renown {y}Rank 19{} with the {b}Hara'ti{} |complete factionrenown(2704) >= 19 |or
|tip Use the {b}Hara'ti{} Reputation Guide to achieve this.
loadguide "Reputation Guides\\The War Within Reputations\\Hara'ti"
'|complete hasmount(1253929) |or
step
earn 8000 Voidlight Marl##3316 |or
|tip You get this currency by killing rare enemies, opening treasures and caches, completing quests, world quests, delves, dungeons, and other events, in Harandar.
'|complete hasmount(1253929) |or
step
talk Naynar##240407
|tip Outside the tent.
buy Cerulean Sporeglider##252014 |goto Harandar/0 50.95,50.73 |or
'|complete hasmount(1253929) |or
step
use Cerulean Sporeglider##252014
learnmount Cerulean Sporeglider##1253929
]])
GoatQuest:RegisterGuide("Pets & Mounts\\Mounts\\Flying Mounts\\Dropped Mounts\\Cobalt Dragonhawk",{
patch='120000',
source='Dropped',
author="Original guide team",
description="This guide will teach you how to acquire the Cobalt Dragonhawk mount.",
keywords={"Dropped","Flying"},
mounts={1261302},
mounttype="Flying",
startlevel=20,
},[[
step
label "START_GUIDE_OVER_COBALT_DRAGONHAWK"
clicknpc Lovely Sunflower##250788
|tip The rare will spawn in the water and attack.
kill Waverly##250780
|tip The mount item drop is available on the first kill of every daily reset.
collect Cobalt Dragonhawk##257147 |goto Eversong Woods M/0 34.81,20.98 |next "MOUNT_ITEM_OBTAINED_COBALT_DRAGONHAWK" |or
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1261302) |or
step
kill Coralfang##250683
|tip The mount item drop is available on the first kill of every daily reset.
collect Cobalt Dragonhawk##257147 |goto Eversong Woods M/0 36.31,36.44 |next "MOUNT_ITEM_OBTAINED_COBALT_DRAGONHAWK" |or
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1261302) |or
step
kill Dame Bloodshed##255348
|tip The mount item drop is available on the first kill of every daily reset.
collect Cobalt Dragonhawk##257147 |goto Eversong Woods M/0 44.98,38.52 |next "MOUNT_ITEM_OBTAINED_COBALT_DRAGONHAWK" |or
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1261302) |or
step
kill Malfunctioning Construct##255329
|tip The mount item drop is available on the first kill of every daily reset.
collect Cobalt Dragonhawk##257147 |goto Eversong Woods M/0 51.67,46.05 |next "MOUNT_ITEM_OBTAINED_COBALT_DRAGONHAWK" |or
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1261302) |or
step
kill Cre'van##250719
|tip The mount item drop is available on the first kill of every daily reset.
collect Cobalt Dragonhawk##257147 |goto Eversong Woods M/0 62.73,49.00 |next "MOUNT_ITEM_OBTAINED_COBALT_DRAGONHAWK" |or
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1261302) |or
step
kill Overfester Hydra##240129
|tip Bound by roots in Suncrown Village.
|tip The mount item drop is available on the first kill of every daily reset.
collect Cobalt Dragonhawk##257147 |goto Eversong Woods M/0 54.70,60.25 |next "MOUNT_ITEM_OBTAINED_COBALT_DRAGONHAWK" |or
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1261302) |or
step
kill Lost Guardian##250806
|tip The mount item drop is available on the first kill of every daily reset.
collect Cobalt Dragonhawk##257147 |goto Eversong Woods M/0 59.09,79.24 |next "MOUNT_ITEM_OBTAINED_COBALT_DRAGONHAWK" |or
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1261302) |or
step
kill Banuran##250826
|tip The mount item drop is available on the first kill of every daily reset.
collect Cobalt Dragonhawk##257147 |goto Eversong Woods M/0 56.46,77.54 |next "MOUNT_ITEM_OBTAINED_COBALT_DRAGONHAWK" |or
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1261302) |or
step
kill Warden of Weeds##246332
|tip He patrols along the path marked on the map.
|tip The mount item drop is available on the first kill of every daily reset.
map Eversong Woods M/0
path follow smart; loop on; ants curved; dist 30
path	51.37,75.18	51.41,74.83	51.62,74.17	52.04,73.69	52.47,73.77
path	52.85,74.19	52.84,74.87	52.54,75.49	51.92,75.68	52.06,75.52
path	52.46,75.39	52.65,75.08	52.70,74.52	52.55,74.06	52.23,73.91
path	51.87,74.12	51.60,74.62	51.50,75.14
collect Cobalt Dragonhawk##257147 |goto Eversong Woods M/0 51.94,73.80 |next "MOUNT_ITEM_OBTAINED_COBALT_DRAGONHAWK" |or
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1261302) |or
step
kill Bad Zed##250841
|tip The mount item drop is available on the first kill of every daily reset.
|tip Inside the building.
collect Cobalt Dragonhawk##257147 |goto Eversong Woods M/0 49.05,87.76 |next "MOUNT_ITEM_OBTAINED_COBALT_DRAGONHAWK" |or
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1261302) |or
step
kill Harried Hawkstrider##246633
|tip It runs around in the circular path marked on the map.
|tip The mount drop is available on the first kill of every daily reset.
map Eversong Woods M/0
path follow smart; loop on; ants curved; dist 30
path	44.81,79.78	44.65,78.98	44.81,78.02	45.14,77.76	45.31,78.67
path	45.16,79.57
collect Cobalt Dragonhawk##257147 |goto Eversong Woods M/0 45.14,77.57 |next "MOUNT_ITEM_OBTAINED_COBALT_DRAGONHAWK" |or
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1261302) |or
step
kill Terrinor##250876
|tip The mount item drop is available on the first kill of every daily reset.
collect Cobalt Dragonhawk##257147 |goto Eversong Woods M/0 40.39,85.48 |next "MOUNT_ITEM_OBTAINED_COBALT_DRAGONHAWK" |or
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1261302) |or
step
kill Lady Liminus##250754
|tip The mount item drop is available on the first kill of every daily reset.
collect Cobalt Dragonhawk##257147 |goto Eversong Woods M/0 36.66,77.14 |next "MOUNT_ITEM_OBTAINED_COBALT_DRAGONHAWK" |or
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1261302) |or
step
kill Duskburn##255302
|tip The mount item drop is available on the first kill of every daily reset.
collect Cobalt Dragonhawk##257147 |goto Eversong Woods M/0 42.43,68.98 |next "MOUNT_ITEM_OBTAINED_COBALT_DRAGONHAWK" |or
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1261302) |or
step
kill Bloated Snapdragon##250582
|tip The mount item drop is available on the first kill of every daily reset.
collect Cobalt Dragonhawk##257147 |goto Eversong Woods M/0 36.57,64.07 |next "MOUNT_ITEM_OBTAINED_COBALT_DRAGONHAWK" |or
Spawn location [Eversong Woods M/0 37.70,64.28]
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1261302) |or
step
Return to the Start of this Guide
|tip Kill them all again after daily reset if you haven't yet received the mount item.
Click Here to Start Over |confirm |next "START_GUIDE_OVER_COBALT_DRAGONHAWK"
|only if itemcount(257147) < 1 |or
'|complete hasmount(1261302)
step
label "MOUNT_ITEM_OBTAINED_COBALT_DRAGONHAWK"
use Cobalt Dragonhawk##257147
learnmount Cobalt Dragonhawk##1261302
|only if itemcount(257147) == 1 |or
'|complete hasmount(1261302) |or
]])
GoatQuest:RegisterGuide("Pets & Mounts\\Mounts\\Flying Mounts\\Trading Post Mounts\\Comfy Bel'ameth Flying Quilt",{
patch='120000',
source='Trading Post',
author="Original guide team",
description="This guide will teach you how to acquire the Comfy Bel'ameth Flying Quilt mount.",
keywords={"Trading Post","Flying"},
mounts={1270522},
mounttype="Flying",
startlevel=20,
},[[
step
earn 550 Trader's Tender##2032 |or
|tip You receive these from the Trading Post Tour quest, opening the chest each month, and from Adventure Guide activities.
'|complete hasmount(1270522) |or
step
Talk to the Trading Post Vendor
buy Comfy Bel'ameth Flying Quilt##263451 |or
|tip Purchase this from the Trading Post in your capital city.
'|complete hasmount(1270522) |or
step
use Comfy Bel'ameth Flying Quilt##263451
|tip Unwrap this in your mount collection.
learnmount Comfy Bel'ameth Flying Quilt##1270522
]])
GoatQuest:RegisterGuide("Pets & Mounts\\Mounts\\Flying Mounts\\Trading Post Mounts\\Comfy Silvermoon Flying Quilt",{
patch='120000',
source='Trading Post',
author="Original guide team",
description="This guide will teach you how to acquire the Comfy Silvermoon Flying Quilt mount.",
keywords={"Trading Post","Flying"},
mounts={1270523},
mounttype="Flying",
startlevel=20,
},[[
step
earn 550 Trader's Tender##2032 |or
|tip You receive these from the Trading Post Tour quest, opening the chest each month, and from Adventure Guide activities.
'|complete hasmount(1270523) |or
step
Talk to the Trading Post Vendor
buy Comfy Silvermoon Flying Quilt##263452 |or
|tip Purchase this from the Trading Post in your capital city.
'|complete hasmount(1270523) |or
step
use Comfy Silvermoon Flying Quilt##263452
|tip Unwrap this in your mount collection.
learnmount Comfy Silvermoon Flying Quilt##1270523
]])
GoatQuest:RegisterGuide("Pets & Mounts\\Mounts\\Flying Mounts\\Achievement Mounts\\Convalescent Carrion",{
patch='120000',
source='Achievement',
author="Original guide team",
description="This guide will teach you how to acquire the Convalescent Carrion mount.",
keywords={"Achievement","Flying"},
mounts={1257081},
mounttype="Flying",
startlevel=20,
},[[
step
{y}This Mount is No Longer Available{}
{g}It may become available in future at the Trading Post, as a sub reward, or in the Blizzard Store.
achieve 61258
|tip Attain a Mythic+ Rating of at least {w}3000{} during {w}Midnight Season One{}.
|tip You may get a Mythic+ keystone when running a dungeon on {p}Mythic{} difficulty.
|tip Complete Mythic+ dungeons using a keystone.
|tip Ratings are determined by {y}Key Level{} and {b}Speed{}.
|tip Ratings for each dungeon are accumulated across two weekly affixes, {o}Fortified{} and {r}Tyrannical{}.
|tip To efficiently increase your rating, run every dungeon in the current season pool on both affixes, and focus on upgrading your lowest-scored dungeons first.
|tip Timed M+13s across all dungeons in the pool should give you this rating.
learnmount Convalescent Carrion##1257081
]])
GoatQuest:RegisterGuide("Pets & Mounts\\Mounts\\Flying Mounts\\Vendor Mounts\\Elven Arcane Guardian",{
patch='120000',
source='Vendor',
author="Original guide team",
description="This guide will teach you how to acquire the Elven Arcane Guardian mount.",
keywords={"Vendor","Flying"},
mounts={1268926},
mounttype="Flying",
startlevel=20,
},[[
step
earn 10000 Undercoin##2803 |or
|tip Earn these inside weekly delve troves, caches, and reward chests.
|tip These can also be pickpocketed, looted from profession tasks like skinning or fishing, and just looting npcs.
'|complete hasmount(1268926) |or
step
talk Naleidea Rivergleam##242398
|tip Inside the building.
buy Elven Arcane Guardian##262502 |goto Silvermoon City M/0 52.76,77.90 |or
'|complete hasmount(1268926) |or
step
use Elven Arcane Guardian##262502
learnmount Elven Arcane Guardian##1268926
]])
GoatQuest:RegisterGuide("Pets & Mounts\\Mounts\\Flying Mounts\\Vendor Mounts\\Fiery Dragonhawk",{
patch='120000',
source='Vendor',
author="Original guide team",
description="This guide will teach you how to acquire the Fiery Dragonhawk mount.",
keywords={"Vendor","Flying"},
mounts={1261291},
mounttype="Flying",
startlevel=20,
},[[
step
Reach Renown {p}Rank 19{} with {y}Silvermoon Court{} |complete factionrenown(2710) >= 19 |or
|tip Use the {b}Silvermoon Court{} Reputation Guide to achieve this.
loadguide "Reputation Guides\\The War Within Reputations\\Silvermoon Court"
'|complete hasmount(1261291) |or
step
earn 8000 Voidlight Marl##3316 |or
|tip You get this currency by killing rare enemies, opening treasures and caches, completing quests, world quests, delves, dungeons, and prey hunts, in Zul'Aman.
'|complete hasmount(1261291) |or
step
talk Caeris Fairdawn##240838
Select _"I want to browse your goods."_ |gossip 138627
buy Fiery Dragonhawk##257142 |goto Eversong Woods M/0 43.46,47.42 |or
'|complete hasmount(1261291) |or
step
use Fiery Dragonhawk##257142
learnmount Fiery Dragonhawk##1261291
]])
GoatQuest:RegisterGuide("Pets & Mounts\\Mounts\\Flying Mounts\\Puzzle Mounts\\Luminous Sporeglider",{
patch='120700',
source='Dropped',
author="Original guide team",
description="This guide will help you acquire the Luminous Sporeglider mount.",
keywords={"Rotmire","Flying","Sporefall","Raid","Sporesnack"},
mounts={1284973},
mounttype="Flying",
startlevel=90,
},[[
step
Press _I_ and queue for the {y}Sporefall{} Raid or Enter with Your Group |goto Harandar/0 73.42,66.35
kill Rotmire##254176
|tip Inside the raid instance.
collect 4 Delicious Sporesnack##269245 |or
|tip Players will likely receive one per account per week for defeating the boss on any difficulty, which means you can obtain the mount in as little as four weeks.
'|complete hasmount(1284973) |or
step
use Delicious Sporesnack##269245
|tip Right click the 4 Delicious Sporesnacks in your bag.
collect Luminous Sporeglider##269240 |or
'|complete hasmount(1284973) |or
step
use Luminous Sporeglider##269240
learnmount Luminous Sporeglider##1284973
]])
GoatQuest:RegisterGuide("Pets & Mounts\\Mounts\\Flying Mounts\\Quest Mounts\\Peridot Dragonhawk",{
patch='120000',
source='World Quest',
author="Original guide team",
description="This guide will teach you how to acquire the Peridot Dragonhawk mount.",
keywords={"Quest","Flying"},
mounts={1261293},
mounttype="Flying",
startlevel=20,
},[[
step
Complete the {p}War of Light and Shadow{} Campaign
|tip Use the {b}War of Light and Shadow Campaign{} Leveling Guide to achieve this.
loadguide "Leveling Guides\\Midnight (80-90)\\The War of Light and Shadow Campaign"
collect Peridot Dragonhawk##257143 |or
'|complete hasmount(1261293) |or
step
use Peridot Dragonhawk##257143
|tip This will be an item in your bags.
learnmount Peridot Dragonhawk##1261293
]])
GoatQuest:RegisterGuide("Pets & Mounts\\Mounts\\Flying Mounts\\Dropped Mounts\\Ruddy Sporeglider",{
patch='120000',
source='Dropped',
author="Original guide team",
description="This guide will teach you how to acquire the Ruddy Sporeglider mount.",
keywords={"Dropped","Flying"},
mounts={1253938},
mounttype="Flying",
startlevel=20,
},[[
step
click Flame-Hardened Sap of Teldrassil##616052
|tip These can be found in the river that runs from The Den to Har'mara to the northwest.
|tip They look like little yellow or orange bubbles in the water, and can have a faint purple outline.
|tip They are found only in the water, generally spawning near rocks, roots, islands, lillypads, and at the tops and bottoms of waterfalls.
|tip If you have difficulty spotting these, try adjusting your graphics settings: Options>System>Graphics.
|tip Set {y}Liquid Detail{} to Low, and {y}Outline Mode{} to High.
|tip It also helps to fly low along the water, or use a water-walking mount buff.
map Harandar/0
path follow smart; loop on; ants curved; dist 30
path	39.69,20.44	41.68,30.50	42.09,33.16	41.73,36.89	41.92,37.66
path	42.66,40.31	46.41,48.13	48.06,50.68	48.63,50.62	48.38,50.52
path	47.92,50.39	46.42,48.07	42.64,40.12	41.93,37.62	41.77,36.82
path	42.25,34.97	43.01,34.45	43.01,33.22	42.29,32.61	41.64,30.36
path	40.49,26.05	40.82,24.61	39.97,22.32	40.22,21.29	40.25,19.85
collect 150 Crystalized Resin Fragment##260531 |or
'|complete hasmount(1253938) |or
step
click Peculiar Cauldron##614483
collect Ruddy Sporeglider##252017 |or
'|complete hasmount(1253938) |or
step
use Ruddy Sporeglider##252017
|tip In your bags.
learnmount Ruddy Sporeglider##1253938
]])
GoatQuest:RegisterGuide("Pets & Mounts\\Mounts\\Flying Mounts\\Promotion Mounts\\Scorching Valor",{
patch='120000',
source='In-Game Shop',
author="Original guide team",
description="This guide will teach you how to acquire the Scorching Valor mount.",
keywords={"In-Game Shop","Flying"},
mounts={1247422},
mounttype="Flying",
startlevel=10,
},[[
step
May be Available for Purchase in the Blizzard Online Store
|tip Once purchased or awarded, you may need to unwrap in your mount inventory.
|tip Check the Blizzard Store and purchase a 6 month subscription to acquire this mount.
learnmount Scorching Valor##1247422
]])
GoatQuest:RegisterGuide("Pets & Mounts\\Mounts\\Flying Mounts\\Achievement Mounts\\Tenebrous Harrower",{
patch='120000',
source='Achievement',
author="Original guide team",
description="This guide will teach you how to acquire the Tenebrous Harrower mount.",
keywords={"Achievement","Flying","Glory","Midnight","Raider"},
mounts={1266980},
mounttype="Flying",
startlevel=20,
},[[
step
achieve 61380
learnmount Tenebrous Harrower##1266980
]])
GoatQuest:RegisterGuide("Pets & Mounts\\Mounts\\Flying Mounts\\Vendor Mounts\\Unbound Manawyrm",{
patch='120000',
source='Vendor',
author="Original guide team",
description="This guide will teach you how to acquire the Unbound Manawyrm mount.",
keywords={"Vendor","Flying","Eversong","Assault"},
mounts={1271698},
mounttype="Flying",
startlevel=90,
},[[
step
label "NEED_EVERSONG_ERADICATOR"
Complete a Void Strike or Incursion in Eversong Woods
|tip Use the {b}Eversong Woods Void Assaults{} Events Guide to achieve this.
loadguide "Events Guides\\Midnight (80-90)\\Eversong Woods Void Assaults"
achieve 62498 |or
'|complete hasmount(1271698) |or
|only if areapoi(2395,8758)
step
Complete #25# Void Strikes or Incursions in Eversong Woods |achieve 62508 |or
|tip Use the {b}Eversong Woods Void Assaults{} Events Guide to achieve this.
loadguide "Events Guides\\Midnight (80-90)\\Eversong Woods Void Assaults"
'|complete hasmount(1271698) |or
|only if areapoi(2395,8758)
step
label "NEED_ZUL'AMAN_ERADICATOR"
Complete a Void Strike or Incursion in Zul'Aman
|tip Use the {b}Zul'Aman Void Assaults{} Events Guide to achieve this.
loadguide "Events Guides\\Midnight (80-90)\\Zul'Aman Void Assaults"
achieve 62499 |or
'|complete hasmount(1271698) |or
|only if areapoi(2437,8757)
step
Complete #25# Void Strikes or Incursions in Zul'Aman |achieve 62511 |or
|tip Use the {b}Zul'Aman Void Assaults{} Events Guide to achieve this.
loadguide "Events Guides\\Midnight (80-90)\\Zul'Aman Void Assaults"
'|complete hasmount(1271698) |or
|only if areapoi(2437,8757)
step
Earn #100# Field Accolades## from completing Ritual Site events |achieve 62513 |or
|tip Accolade rewards are based on calculated "Final Spoils" (base loot + challenge bonuses (affixes) - death penalties).
'|complete hasmount(1271698) |or
step
Defeat #100# corrupted creatures at the Void Strike events below |achieve 62518 |or
|tip Travel to the Void Strike locations and kill as many Void Corrupted creatures or beasts as you can.
|tip At this time, Bitterbark is the only location in Zul'Aman with Void Corrupted beasts that count towards the achievement. |only if areapoi(2437,8757)
Kill corrupted creatures at the {b}Void Rift: Sunstrider Isle{} |only if areapoi(2395,8734) |goto Eversong Woods M/0 40.27,16.71
Kill corrupted creatures at the {b}Void Rift: Tranquil Repose{} |only if areapoi(2395,8727) |goto Eversong Woods M/0 50.97,50.47
Kill corrupted creatures at the {b}Void Rift: South Eversong Woods{} |only if areapoi(2395,8721) |goto Eversong Woods M/0 52.05,81.07
Kill corrupted beasts at {b}Void Rift: Bitterbark{} |only if areapoi(2437,8757) |goto Zul Aman M/0 30.46,42.98
'|complete hasmount(1271698) |or
step
Earn the Void Response Team Achievement
You still need to:
Click to complete Void Assault: Eversong Woods |only if not achieved(62563,3) and areapoi(2395,8758) |next "NEED_EVERSONG_ERADICATOR"
Click to complete Void Assault: Zul'Aman |only if not achieved(62563,4) and areapoi(2437,8757) |next "NEED_ZUL'AMAN_ERADICATOR"
{b}Wait for Weekly Reset{} |only if not achieved(62563,3) or not achieved(62563,4)
The Eversong Woods Void Assault must be Active to Complete your Achievement |only if not achieved(62563,3) and achieved(62563,4) and areapoi(2437,8757)
The Zul'Aman Void Assault must be Active to Complete your Achievement |only if not achieved(62563,4) and achieved(62563,3) and areapoi(2395,8758)
|tip Weekly reset is Tuesday at 10:00 AM CST for North American, Oceanic, and Latin American servers.
|tip Weekly reset is Wednesday at 5:00 AM CET for European servers.
|tip Weekly reset is Thursday at 7:00 AM local time for Korean, Taiwanese, and Chinese servers.
achieve 62563 |or
'|complete hasmount(1271698) |or
step
earn 6000 Voidlight Marl##3316 |or
|tip You earn this currency most efficiently by spamming {g}Random Nightmare Hunts{}, completing {p}Ritual Sites{} and {b}Void Strikes{}, killing rare enemies, opening treasures and caches, completing quests, world quests, weekly quests, bountiful delves, and prey hunts in Midnight areas.
|tip If you have completed the campaign, alt leveling will reward Voidlight Marl in place of reputation.
'|complete hasmount(1271698) |or
step
talk Sergeant Vornin##255503
Select _"Do you have any mounts or pets available now?"_ |gossip 138966
buy Unbound Manawyrm##264348 |goto Silvermoon City M/0 48.69,50.37 |or
'|complete hasmount(1271698) |or
step
use Unbound Manawyrm##264348
learnmount Unbound Manawyrm##1271698
]])
GoatQuest:RegisterGuide("Pets & Mounts\\Mounts\\Flying Mounts\\Dropped Mounts\\Vibrant Petalwing",{
patch='120000',
source='Dropped',
author="Original guide team",
description="This guide will teach you how to acquire the Vibrant Petalwing mount.",
keywords={"Dropped","Flying"},
mounts={1253927},
mounttype="Flying",
startlevel=20,
},[[
step
label "START_GUIDE_OVER_VIBRANT_PETALWING"
kill Rhazul##248741
|tip Up on a shelf, on the side of the mountain.
collect Vibrant Petalwing##252012 |goto Harandar/0 51.15,45.35 |next "MOUNT_ITEM_OBTAINED_VIBRANT_PETALWING" |or
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1253927) |or
step
kill Queen Lashtongue##249962
|tip In the water.
collect Vibrant Petalwing##252012 |goto Harandar/0 59.83,46.99 |next "MOUNT_ITEM_OBTAINED_VIBRANT_PETALWING" |or
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1253927) |or
step
kill Chlorokyll##249997
collect Vibrant Petalwing##252012 |goto Harandar/0 64.47,47.68 |next "MOUNT_ITEM_OBTAINED_VIBRANT_PETALWING" |or
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1253927) |or
step
kill Ha'kalawe##249849
|tip The mount item drop is available on the first kill of every daily reset.
collect Vibrant Petalwing##252012 |goto Harandar/0 70.17,60.87 |next "MOUNT_ITEM_OBTAINED_VIBRANT_PETALWING" |or
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1253927) |or
step
kill Tallcap the Truthspreader##249902
collect Vibrant Petalwing##252012 |goto Harandar/0 72.62,69.35 |next "MOUNT_ITEM_OBTAINED_VIBRANT_PETALWING" |or
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1253927) |or
step
kill Chironex##249844
collect Vibrant Petalwing##252012 |goto Harandar/0 68.70,40.61 |next "MOUNT_ITEM_OBTAINED_VIBRANT_PETALWING" |or
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1253927) |or
step
kill Stumpy##250086
collect Vibrant Petalwing##252012 |goto Harandar/0 65.34,32.95 |next "MOUNT_ITEM_OBTAINED_VIBRANT_PETALWING" |or
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1253927) |or
step
kill Serrasa##250180
collect Vibrant Petalwing##252012 |goto Harandar/0 55.94,31.63 |next "MOUNT_ITEM_OBTAINED_VIBRANT_PETALWING" |or
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1253927) |or
step
kill Mindrot##250226
collect Vibrant Petalwing##252012 |goto Harandar/0 46.11,32.17 |next "MOUNT_ITEM_OBTAINED_VIBRANT_PETALWING" |or
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1253927) |or
step
kill Annulus the Worldshaker##250358
|tip He patrols around here.
collect Vibrant Petalwing##252012 |goto Harandar/0 43.76,16.78 |next "MOUNT_ITEM_OBTAINED_VIBRANT_PETALWING" |or
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1253927) |or
step
kill Dracaena##250231
collect Vibrant Petalwing##252012 |goto Harandar/0 40.53,43.27 |next "MOUNT_ITEM_OBTAINED_VIBRANT_PETALWING" |or
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1253927) |or
step
kill Ahl'ua'huhi##250347
collect Vibrant Petalwing##252012 |goto Harandar/0 39.75,60.21 |next "MOUNT_ITEM_OBTAINED_VIBRANT_PETALWING" |or
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1253927) |or
step
kill Treetop##250246
|tip Bound by roots in Suncrown Village.
collect Vibrant Petalwing##252012 |goto Harandar/0 36.34,75.35 |next "MOUNT_ITEM_OBTAINED_VIBRANT_PETALWING" |or
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1253927) |or
step
kill Oro'ohna##250317
collect Vibrant Petalwing##252012 |goto Harandar/0 28.19,81.81 |next "MOUNT_ITEM_OBTAINED_COBALT_DRAGONHAWK" |or
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1253927) |or
step
kill Pterrock##250321
|tip Inside the cave
collect Vibrant Petalwing##252012 |goto Harandar/0 27.39,71.39 |next "MOUNT_ITEM_OBTAINED_VIBRANT_PETALWING" |or
-OR-
Click Here to Go to the Next Rare |confirm
'|complete hasmount(1253927) |or
step
Return to the Start of this Guide
|tip Kill them all again after daily reset for the best chance to receive the mount item.
|tip The mount item drop is available on the first kill of every daily reset.
Click Here to Start Over |confirm |next "START_GUIDE_OVER_VIBRANT_PETALWING"
|only if itemcount(252012) < 1 |or
'|complete hasmount(1253927) |or
step
label "MOUNT_ITEM_OBTAINED_VIBRANT_PETALWING"
use Vibrant Petalwing##252012
learnmount Vibrant Petalwing##1253927
|only if itemcount(252012) == 1
]])
GoatQuest:RegisterGuide("Pets & Mounts\\Mounts\\Flying Mounts\\Trading Post Mounts\\Vicious Snapvine",{
patch='120000',
source='Trading Post',
author="Original guide team",
description="This guide will help you acquire the Vicious Snapvine mount.",
keywords={"Trading Post","Flying"},
mounts={1269273},
mounttype="Flying",
startlevel=10,
},[[
step
earn 600 Trader's Tender##2032 |or
|tip You receive these from the Trading Post Tour quest, opening the chest each month, and from Adventure Guide activities.
'|complete hasmount(1269273) |or
step
Talk to the Trading Post Vendor
buy Vicious Snapvine##262705 |or
|tip Purchase this from the Trading Post in your capital city.
'|complete hasmount(1269273) |or
step
use Vicious Snapvine##262705
|tip Unwrap this in your mount collection.
learnmount Vicious Snapvine##1269273
]])
GoatQuest:RegisterGuide("Pets & Mounts\\Mounts\\Flying Mounts\\Dropped Mounts\\Void-Corrupted Hex Eagle",{
patch='120100',
source='Dropped',
author="Original guide team",
description="This guide will help you acquire the Void-Corrupted Hex Eagle mount.",
keywords={"Dropped","Flying"},
mounts={1286606},
mounttype="Flying",
startlevel=90,
},[[
step
click Curious Obelisk##260104 |goto Zul Aman M/0 29.58,77.94
|tip Queue at difficulty {b}Tier 2{} or higher.
|tip You can queue solo, or with a party of up to 5.
Enter {y}Ritual Site{}: {w}Broken Throne{} |complete zone("Broken Throne") |goto Broken Throne/0 62.32,58.93 |or
'|complete hasmount(1286606) |or
step
click Misplaced Ritual Candle##649209
|tip This is a tiny, pink candle burning on top of the wall, under a tree.
collect Misplaced Ritual Candle##271999 |goto Broken Throne/0 51.44,47.83 |or
'|complete hasmount(1286606) |or
step
clicknpc Ritual Item##263500
|tip The item is an interactive skull on the outside of the nearby ritual circle.
|tip It looks like a skull.
|tip Place the candle on the skull.
Replace the Ritual Candle |goto Broken Throne/0 50.75,47.13 |complete itemcount(271999) < 1 |or
'|complete hasmount(1286606) |or
step
Click the ritual candle in the center of the ritual circle |goto Broken Throne/0 50.65,47.30
|tip A Void-Corrupted Hex Eagle elite mob will spawn nearby.
kill Void-Corrupted Hex Eagle##263527
collect Void-Corrupted Eagle Talon##269828 |goto Broken Throne/0 51.10,47.34 |or
'|complete hasmount(1286606) |or
step
use Void-Corrupted Eagle Talon##269828
learnmount Void-Corrupted Hex Eagle##1286606
step
loadguide "Pets & Mounts\\Battle Pets\\Flying Pets\\Dropped Pets\\Void-Scarred Eaglet"
|tip You have unlocked the means to get this battle pet.
|only if not haspet(5017)
]])
GoatQuest:RegisterGuide("Pets & Mounts\\Mounts\\Aquatic Mounts\\Trading Post Mounts\\Savage Crimson Battle Turtle",{
patch='120000',
source='Trading Post',
author="Original guide team",
description="This guide will teach you how to acquire the Savage Crimson Battle Turtle mount.",
keywords={"Trading Post","Aquatic"},
mounts={1266248},
mounttype="Aquatic",
startlevel=20,
},[[
step
earn 500 Trader's Tender##2032 |or
|tip You receive these from the Trading Post Tour quest, opening the chest each month, and from Adventure Guide activities.
|tip If this mount isn't currently available, it may become available again at a later date in the Trading Post, or in the Blizzard Store.
'|complete hasmount(1266248) |or
step
Talk to the Trading Post Vendor
buy Savage Crimson Battle Turtle##260409 |or
|tip Purchase this from the Trading Post in your capital city.
'|complete hasmount(1266248) |or
step
use Savage Crimson Battle Turtle##260409
|tip Unwrap this in your mount collection.
learnmount Savage Crimson Battle Turtle##1266248
]])
