local GoatQuest=GoatQuest
if not GoatQuest then return end
if UnitFactionGroup("player")~="Horde" then return end
if GQ:DoMutex("AchievementsHMID") then return end
GoatQuest.GuideMenuTier = "SHA"
GoatQuest:RegisterGuide("Achievement Guides\\Pet Battles\\Classic (1-60)\\Aquatic Battler of Kalimdor",{
patch='120000',
author="Original guide team",
description="This will guide you through accomplishing the Aquatic Battler of Kalimdor achievement.",
achieveid={61041},
startlevel=10,
},[[
step
Defeat the battle pet trainers of Kalimdor with a team of all level 25 {b}aquatic{} pets.
|tip These achievement quests are dailies.
|tip You will be able to complete one family achievement per day.
|tip If you haven't completed the achievement, this guide will start over.
confirm
step
label "HORDE_AQUATIC_BATTLER_NOT_FINISHED"
talk Zunta##66126
accept Zunta##31818 |goto Durotar/0 43.86,28.86 |or
'|complete achieved(61041) |or
step
talk Zunta##66126
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41403
|tip Defeat him with a team of level 25 {b}aquatic{} pets.
Defeat Zunta |q 31818/1 |goto Durotar/0 43.86,28.86 |or
'|complete achieved(61041) |or
step
talk Zunta##66126
turnin Zunta##31818 |goto Durotar/0 43.86,28.86 |or
'|complete achieved(61041) |or
step
talk Dagra the Fierce##66135
accept Dagra the Fierce##31819 |goto Northern Barrens/0 58.61,53.04 |or
'|complete achieved(61041) |or
step
talk Dagra the Fierce##66135
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41182
|tip Defeat her with a team of level 25 {b}aquatic{} pets.
Defeat Dagra the Fierce |q 31819/1 |goto Northern Barrens/0 58.61,53.04 |or
'|complete achieved(61041) |or
step
talk Dagra the Fierce##66135
turnin Dagra the Fierce##31819 |goto Northern Barrens/0 58.61,53.04 |or
'|complete achieved(61041) |or
step
talk Grazzle the Great##66436
accept Grazzle the Great##31905 |goto Dustwallow Marsh/0 53.85,74.88 |or
'|complete achieved(61041) |or
step
talk Grazzle the Great##66436
Select _"Let's rumble!"_ |gossip 41246
|tip Defeat him with a team of level 25 {b}aquatic{} pets.
Defeat Grazzle the Great |q 31905/1 |goto Dustwallow Marsh/0 53.85,74.88 |or
'|complete achieved(61041) |or
step
talk Grazzle the Great##66436
turnin Grazzle the Great##31905 |goto Dustwallow Marsh/0 53.85,74.88 |or
'|complete achieved(61041) |or
step
talk Kela Grimtotem##66452
|tip Atop the pillar.
accept Kela Grimtotem##31906 |goto Thousand Needles/0 31.88,32.93 |or
'|complete achieved(61041) |or
step
talk Kela Grimtotem##66452
Select _"Let's rumble!"_ |gossip 41248
|tip Defeat her with a team of level 25 {b}aquatic{} pets.
Defeat Kela Grimtotem |q 31906/1 |goto Thousand Needles/0 31.88,32.93 |or
'|complete achieved(61041) |or |or
step
talk Kela Grimtotem##66452
turnin Kela Grimtotem##31906 |goto Thousand Needles/0 31.88,32.93 |or
'|complete achieved(61041) |or
step
talk Cassandra Kaboom##66422
accept Cassandra Kaboom##31904 |goto Southern Barrens/0 39.59,79.14 |or
'|complete achieved(61041) |or
step
talk Cassandra Kaboom##66422
Select _"Let's rumble!"_ |gossip 41260
|tip Defeat her with a team of level 25 {b}aquatic{} pets.
Defeat Cassandra Kaboom |q 31904/1 |goto Southern Barrens/0 39.59,79.14 |or
'|complete achieved(61041) |or
step
talk Cassandra Kaboom##66422
turnin Cassandra Kaboom##31904 |goto Southern Barrens/0 39.59,79.14 |or
'|complete achieved(61041) |or
step
talk Traitor Gluk##66352
accept Traitor Gluk##31871 |goto Feralas/0 59.75,49.64 |or
'|complete achieved(61041) |or
step
talk Traitor Gluk##66352
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41017
|tip Defeat him with a team of level 25 {b}aquatic{} pets.
Defeat Traitor Gluk |q 31871/1 |goto Feralas/0 59.75,49.64 |or
'|complete achieved(61041) |or
step
talk Traitor Gluk##66352
turnin Traitor Gluk##31871 |goto Feralas/0 59.75,49.64 |or
'|complete achieved(61041) |or
step
talk Merda Stronghoof##66372
accept Merda Stronghoof##31872 |goto Desolace/0 57.11,45.69 |or
'|complete achieved(61041) |or
step
talk Merda Stronghoof##66372
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41022
|tip Defeat her with a team of level 25 {b}aquatic{} pets.
Defeat Merda Stronghoof |q 31872/1 |goto Desolace/0 57.11,45.69 |or
'|complete achieved(61041) |or
step
talk Merda Stronghoof##66372
turnin Merda Stronghoof##31872 |goto Desolace/0 57.11,45.69 |or
'|complete achieved(61041) |or
step
talk Zonya the Sadist##66137
accept Zonya the Sadist##31862 |goto Stonetalon Mountains/0 59.66,71.58 |or
'|complete achieved(61041) |or
step
talk Zonya the Sadist##66137
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 40812
|tip Defeat her with a team of level 25 {b}aquatic{} pets.
Defeat Zonya the Sadist |q 31862/1 |goto Stonetalon Mountains/0 59.66,71.58 |or
'|complete achieved(61041) |or
step
talk Zonya the Sadist##66137
turnin Zonya the Sadist##31862 |goto Stonetalon Mountains/0 59.66,71.58 |or
'|complete achieved(61041) |or
step
talk Analynn##66136
accept Analynn##31814 |goto Ashenvale/0 20.20,29.55 |or
'|complete achieved(61041) |or
step
talk Analynn##66136
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 40736
|tip Defeat her with a team of level 25 {b}aquatic{} pets.
Defeat Analynn |q 31862/1 |goto Ashenvale/0 20.20,29.55 |or
'|complete achieved(61041) |or
step
talk Analynn##66136
turnin Analynn##31814 |goto Ashenvale/0 20.20,29.55 |or
'|complete achieved(61041) |or
step
talk Zoltan##66442
accept Zoltan##31907 |goto Felwood/0 39.95,56.57 |or
'|complete achieved(61041) |or
step
talk Zoltan##66442
Select _"Let's rumble!"_ |gossip 41250
|tip Defeat him with a team of level 25 {b}aquatic{} pets.
Defeat Zoltan |q 31907/1 |goto Felwood/0 39.95,56.57 |or
'|complete achieved(61041) |or
step
talk Zoltan##66442
turnin Zoltan##31907 |goto Felwood/0 39.95,56.57 |or
'|complete achieved(61041) |or
step
talk Elena Flutterfly##66412
accept Elena Flutterfly##31908 |goto Moonglade/0 46.13,60.27 |or
'|complete achieved(61041) |or
step
talk Elena Flutterfly##66412
Select _"Let's rumble!"_ |gossip 41258
|tip Defeat her with a team of level 25 {b}aquatic{} pets.
Defeat Elena Flutterfly |q 31908/1 |goto Moonglade/0 46.13,60.27 |or
'|complete achieved(61041) |or
step
talk Elena Flutterfly##66412
turnin Elena Flutterfly##31908 |goto Moonglade/0 46.13,60.27 |or
'|complete achieved(61041) |or
step
talk Stone Cold Trixxy##66466
accept Grand Master Trixxy##31909 |goto Winterspring/0 65.64,64.52 |or
'|complete achieved(61041) |or
step
talk Stone Cold Trixxy##66466
Select _"Let's rumble!"_ |gossip 41411
|tip Defeat her with a team of level 25 {b}aquatic{} pets.
Defeat Stone Cold Trixxy |q 31909/1 |goto Winterspring/0 65.64,64.52 |or
'|complete achieved(61041) |or
step
talk Stone Cold Trixxy##66466
turnin Grand Master Trixxy##31909 |goto Winterspring/0 65.64,64.52 |or
'|complete achieved(61041) |or
step
achieve 61041
next "HORDE_AQUATIC_BATTLER_NOT_FINISHED" |only if not achieved(61041)
]])
GoatQuest:RegisterGuide("Achievement Guides\\Pet Battles\\Classic (1-60)\\Beast Battler of Kalimdor",{
patch='120000',
author="Original guide team",
description="This will guide you through accomplishing the Beast Battler of Kalimdor achievement.",
achieveid={61042},
startlevel=10,
},[[
step
Defeat the battle pet trainers of Kalimdor with a team of all level 25 {y}beast{} pets.
|tip These achievement quests are dailies available after the daily quest reset.
|tip You will be able to complete one family achievement per day.
|tip If you haven't completed the achievement, this guide will start over.
confirm
step
label "HORDE_BEAST_BATTLER_NOT_FINISHED"
talk Zunta##66126
accept Zunta##31818 |goto Durotar/0 43.86,28.86 |or
'|complete achieved(61042) |or
step
talk Zunta##66126
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41403
|tip Defeat him with a team of level 25 {y}beast{} pets.
Defeat Zunta |q 31818/1 |goto Durotar/0 43.86,28.86 |or
'|complete achieved(61042) |or
step
talk Zunta##66126
turnin Zunta##31818 |goto Durotar/0 43.86,28.86
achieve 61042/1 |or
'|complete achieved(61042) |or
step
talk Dagra the Fierce##66135
accept Dagra the Fierce##31819 |goto Northern Barrens/0 58.61,53.04 |or
'|complete achieved(61042) |or
step
talk Dagra the Fierce##66135
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41182
|tip Defeat her with a team of level 25 {b}beast{} pets.
Defeat Dagra the Fierce |q 31819/1 |goto Northern Barrens/0 58.61,53.04 |or
'|complete achieved(61042) |or
step
talk Dagra the Fierce##66135
turnin Dagra the Fierce##31819 |goto Northern Barrens/0 58.61,53.04
achieve 61042/2 |or
'|complete achieved(61042) |or
step
talk Grazzle the Great##66436
accept Grazzle the Great##31905 |goto Dustwallow Marsh/0 53.85,74.88 |or
'|complete achieved(61042) |or
step
talk Grazzle the Great##66436
Select _"Let's rumble!"_ |gossip 41246
|tip Defeat him with a team of level 25 {b}beast{} pets.
Defeat Grazzle the Great |q 31905/1 |goto Dustwallow Marsh/0 53.85,74.88 |or
'|complete achieved(61042) |or
step
talk Grazzle the Great##66436
turnin Grazzle the Great##31905 |goto Dustwallow Marsh/0 53.85,74.88
achieve 61042/9 |or
'|complete achieved(61042) |or
step
talk Kela Grimtotem##66452
|tip Atop the pillar.
accept Kela Grimtotem##31906 |goto Thousand Needles/0 31.88,32.93 |or
'|complete achieved(61042) |or
step
talk Kela Grimtotem##66452
Select _"Let's rumble!"_ |gossip 41248
|tip Defeat her with a team of level 25 {b}beast{} pets.
Defeat Kela Grimtotem |q 31906/1 |goto Thousand Needles/0 31.88,32.93 |or
'|complete achieved(61042) |or
step
talk Kela Grimtotem##66452
turnin Kela Grimtotem##31906 |goto Thousand Needles/0 31.88,32.93
achieve 61042/11 |or
'|complete achieved(61042) |or
step
talk Cassandra Kaboom##66422
accept Cassandra Kaboom##31904 |goto Southern Barrens/0 39.59,79.14 |or
'|complete achieved(61042) |or
step
talk Cassandra Kaboom##66422
Select _"Let's rumble!"_ |gossip 41260
|tip Defeat her with a team of level 25 {b}beast{} pets.
Defeat Cassandra Kaboom |q 31904/1 |goto Southern Barrens/0 39.59,79.14 |or
'|complete achieved(61042) |or
step
talk Cassandra Kaboom##66422
turnin Cassandra Kaboom##31904 |goto Southern Barrens/0 39.59,79.14
achieve 61042/8 |or
'|complete achieved(61042) |or
step
talk Traitor Gluk##66352
accept Traitor Gluk##31871 |goto Feralas/0 59.75,49.64 |or
'|complete achieved(61042) |or
step
talk Traitor Gluk##66352
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41017
|tip Defeat him with a team of level 25 {b}beast{} pets.
Defeat Traitor Gluk |q 31871/1 |goto Feralas/0 59.75,49.64 |or
'|complete achieved(61042) |or
step
talk Traitor Gluk##66352
turnin Traitor Gluk##31871 |goto Feralas/0 59.75,49.64
achieve 61042/6 |or
'|complete achieved(61042) |or
step
talk Merda Stronghoof##66372
accept Merda Stronghoof##31872 |goto Desolace/0 57.11,45.69 |or
'|complete achieved(61042) |or
step
talk Merda Stronghoof##66372
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41022
|tip Defeat her with a team of level 25 {b}beast{} pets.
Defeat Merda Stronghoof |q 31872/1 |goto Desolace/0 57.11,45.69 |or
'|complete achieved(61042) |or
step
talk Merda Stronghoof##66372
turnin Merda Stronghoof##31872 |goto Desolace/0 57.11,45.69
achieve 61042/5 |or
'|complete achieved(61042) |or
step
talk Zonya the Sadist##66137
accept Zonya the Sadist##31862 |goto Stonetalon Mountains/0 59.66,71.58 |or
'|complete achieved(61042) |or
step
talk Zonya the Sadist##66137
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 40812
|tip Defeat her with a team of level 25 {b}beast{} pets.
Defeat Zonya the Sadist |q 31862/1 |goto Stonetalon Mountains/0 59.66,71.58 |or
'|complete achieved(61042) |or
step
talk Zonya the Sadist##66137
turnin Zonya the Sadist##31862 |goto Stonetalon Mountains/0 59.66,71.58
achieve 61042/4 |or
'|complete achieved(61042) |or
step
talk Analynn##66136
accept Analynn##31854 |goto Ashenvale/0 20.20,29.55 |or
'|complete achieved(61042) |or
step
talk Analynn##66136
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 40736
|tip Defeat her with a team of level 25 {b}beast{} pets.
Defeat Analynn |q 31854/1 |goto Ashenvale/0 20.20,29.55 |or
'|complete achieved(61042) |or
step
talk Analynn##66136
turnin Analynn##31854 |goto Ashenvale/0 20.20,29.55 q
achieve 61042/3 |or
'|complete achieved(61042) |or
step
talk Zoltan##66442
accept Zoltan##31907 |goto Felwood/0 39.95,56.57 |or
'|complete achieved(61042) |or
step
talk Zoltan##66442
Select _"Let's rumble!"_ |gossip 41250
|tip Defeat him with a team of level 25 {b}beast{} pets.
Defeat Zoltan |q 31907/1 |goto Felwood/0 39.95,56.57 |or
'|complete achieved(61042) |or
step
talk Zoltan##66442
turnin Zoltan##31907 |goto Felwood/0 39.95,56.57
achieve 61042/10 |or
'|complete achieved(61042) |or
step
talk Elena Flutterfly##66412
accept Elena Flutterfly##31908 |goto Moonglade/0 46.13,60.27 |or
'|complete achieved(61042) |or
step
talk Elena Flutterfly##66412
Select _"Let's rumble!"_ |gossip 41258
|tip Defeat her with a team of level 25 {b}beast{} pets.
Defeat Elena Flutterfly |q 31908/1 |goto Moonglade/0 46.13,60.27 |or
'|complete achieved(61042) |or
step
talk Elena Flutterfly##66412
turnin Elena Flutterfly##31908 |goto Moonglade/0 46.13,60.27
achieve 61042/7 |or
'|complete achieved(61042) |or
step
talk Stone Cold Trixxy##66466
accept Grand Master Trixxy##31909 |goto Winterspring/0 65.64,64.52 |or
'|complete achieved(61042) |or
step
talk Stone Cold Trixxy##66466
Select _"Let's rumble!"_ |gossip 41411
|tip Defeat her with a team of level 25 {b}beast{} pets.
Defeat Stone Cold Trixxy |q 31909/1 |goto Winterspring/0 65.64,64.52 |or
'|complete achieved(61042) |or
step
talk Stone Cold Trixxy##66466
turnin Grand Master Trixxy##31909 |goto Winterspring/0 65.64,64.52
achieve 61042/12 |or
'|complete achieved(61042) |or
step
Did you complete the achievement?
next |only if achieved(61042)
next "HORDE_BEAST_BATTLER_NOT_FINISHED" |only if not achieved(61042)
]])
GoatQuest:RegisterGuide("Achievement Guides\\Pet Battles\\Classic (1-60)\\Critter Battler of Kalimdor",{
patch='120000',
author="Original guide team",
description="This will guide you through accomplishing the Critter Battler of Kalimdor achievement.",
achieveid={61043},
startlevel=10,
},[[
step
Defeat the battle pet trainers of Kalimdor with a team of all level 25 {y}critter{} pets.
|tip These achievement quests are dailies.
|tip You will be able to complete one family achievement per day.
|tip If you haven't completed the achievement, this guide will start over.
confirm
step
label "HORDE_CRITTER_BATTLER_NOT_FINISHED"
talk Zunta##66126
accept Zunta##31818 |goto Durotar/0 43.86,28.86 |or
'|complete achieved(61043) |or
step
talk Zunta##66126
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41403
|tip Defeat him with a team of level 25 {y}critter{} pets.
Defeat Zunta |q 31818/1 |goto Durotar/0 43.86,28.86 |or
'|complete achieved(61043) |or
step
talk Zunta##66126
turnin Zunta##31818 |goto Durotar/0 43.86,28.86
achieve 61043/1 |or
'|complete achieved(61043) |or
step
talk Dagra the Fierce##66135
accept Dagra the Fierce##31819 |goto Northern Barrens/0 58.61,53.04 |or
'|complete achieved(61043) |or
step
talk Dagra the Fierce##66135
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41182
|tip Defeat her with a team of level 25 {b}critter{} pets.
Defeat Dagra the Fierce |q 31819/1 |goto Northern Barrens/0 58.61,53.04 |or
'|complete achieved(61043) |or
step
talk Dagra the Fierce##66135
turnin Dagra the Fierce##31819 |goto Northern Barrens/0 58.61,53.04
achieve 61043/2 |or
'|complete achieved(61043) |or
step
talk Grazzle the Great##66436
accept Grazzle the Great##31905 |goto Dustwallow Marsh/0 53.85,74.88 |or
'|complete achieved(61043) |or
step
talk Grazzle the Great##66436
Select _"Let's rumble!"_ |gossip 41246
|tip Defeat him with a team of level 25 {b}critter{} pets.
Defeat Grazzle the Great |q 31905/1 |goto Dustwallow Marsh/0 53.85,74.88 |or
'|complete achieved(61043) |or
step
talk Grazzle the Great##66436
turnin Grazzle the Great##31905 |goto Dustwallow Marsh/0 53.85,74.88
achieve 61043/9 |or
'|complete achieved(61043) |or
step
talk Kela Grimtotem##66452
|tip Atop the pillar.
accept Kela Grimtotem##31906 |goto Thousand Needles/0 31.88,32.93 |or
'|complete achieved(61043) |or
step
talk Kela Grimtotem##66452
Select _"Let's rumble!"_ |gossip 41248
|tip Defeat her with a team of level 25 {b}critter{} pets.
Defeat Kela Grimtotem |q 31906/1 |goto Thousand Needles/0 31.88,32.93
step
talk Kela Grimtotem##66452
turnin Kela Grimtotem##31906 |goto Thousand Needles/0 31.88,32.93
achieve 61043/11 |or
'|complete achieved(61043) |or
step
talk Cassandra Kaboom##66422
accept Cassandra Kaboom##31904 |goto Southern Barrens/0 39.59,79.14 |or
'|complete achieved(61043) |or
step
talk Cassandra Kaboom##66422
Select _"Let's rumble!"_ |gossip 41260
|tip Defeat her with a team of level 25 {b}critter{} pets.
Defeat Cassandra Kaboom |q 31904/1 |goto Southern Barrens/0 39.59,79.14 |or
'|complete achieved(61043) |or
step
talk Cassandra Kaboom##66422
turnin Cassandra Kaboom##31904 |goto Southern Barrens/0 39.59,79.14
achieve 61043/8 |or
'|complete achieved(61043) |or
step
talk Traitor Gluk##66352
accept Traitor Gluk##31871 |goto Feralas/0 59.75,49.64 |or
'|complete achieved(61043) |or
step
talk Traitor Gluk##66352
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41017
|tip Defeat him with a team of level 25 {b}critter{} pets.
Defeat Traitor Gluk |q 31871/1 |goto Feralas/0 59.75,49.64 |or
'|complete achieved(61043) |or
step
talk Traitor Gluk##66352
turnin Traitor Gluk##31871 |goto Feralas/0 59.75,49.64
achieve 61043/6 |or
'|complete achieved(61043) |or
step
talk Merda Stronghoof##66372
accept Merda Stronghoof##31872 |goto Desolace/0 57.11,45.69 |or
'|complete achieved(61043) |or
step
talk Merda Stronghoof##66372
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41022
|tip Defeat her with a team of level 25 {b}critter{} pets.
Defeat Merda Stronghoof |q 31872/1 |goto Desolace/0 57.11,45.69 |or
'|complete achieved(61043) |or
step
talk Merda Stronghoof##66372
turnin Merda Stronghoof##31872 |goto Desolace/0 57.11,45.69 |or
achieve 61043/5 |or
'|complete achieved(61043) |or
step
talk Zonya the Sadist##66137
accept Zonya the Sadist##31862 |goto Stonetalon Mountains/0 59.66,71.58 |or
'|complete achieved(61043) |or
step
talk Zonya the Sadist##66137
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 40812
|tip Defeat her with a team of level 25 {b}critter{} pets.
Defeat Zonya the Sadist |q 31862/1 |goto Stonetalon Mountains/0 59.66,71.58 |or
'|complete achieved(61043) |or
step
talk Zonya the Sadist##66137
turnin Zonya the Sadist##31862 |goto Stonetalon Mountains/0 59.66,71.58
achieve 61043/4 |or
'|complete achieved(61043) |or
step
talk Analynn##66136
accept Analynn##31854 |goto Ashenvale/0 20.20,29.55 |or
'|complete achieved(61043) |or
step
talk Analynn##66136
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 40736
|tip Defeat her with a team of level 25 {b}critter{} pets.
Defeat Analynn |q 31854/1 |goto Ashenvale/0 20.20,29.55 |or
'|complete achieved(61043) |or
step
talk Analynn##66136
turnin Analynn##31854 |goto Ashenvale/0 20.20,29.55
achieve 61043/3 |or
'|complete achieved(61043) |or
step
talk Zoltan##66442
accept Zoltan##31907 |goto Felwood/0 39.95,56.57 |or
'|complete achieved(61043) |or
step
talk Zoltan##66442
Select _"Let's rumble!"_ |gossip 41250
|tip Defeat him with a team of level 25 {b}critter{} pets.
Defeat Zoltan |q 31907/1 |goto Felwood/0 39.95,56.57 |or
'|complete achieved(61043) |or
step
talk Zoltan##66442
turnin Zoltan##31907 |goto Felwood/0 39.95,56.57
achieve 61043/10 |or
'|complete achieved(61043) |or
step
talk Elena Flutterfly##66412
accept Elena Flutterfly##31908 |goto Moonglade/0 46.13,60.27 |or
'|complete achieved(61043) |or
step
talk Elena Flutterfly##66412
Select _"Let's rumble!"_ |gossip 41258
|tip Defeat her with a team of level 25 {b}critter{} pets.
Defeat Elena Flutterfly |q 31908/1 |goto Moonglade/0 46.13,60.27 |or
'|complete achieved(61043) |or
step
talk Elena Flutterfly##66412
turnin Elena Flutterfly##31908 |goto Moonglade/0 46.13,60.27
achieve 61043/7 |or
'|complete achieved(61043) |or
step
talk Stone Cold Trixxy##66466
accept Grand Master Trixxy##31909 |goto Winterspring/0 65.64,64.52 |or
'|complete achieved(61043) |or
step
talk Stone Cold Trixxy##66466
Select _"Let's rumble!"_ |gossip 41411
|tip Defeat her with a team of level 25 {b}critter{} pets.
Defeat Stone Cold Trixxy |q 31909/1 |goto Winterspring/0 65.64,64.52 |or
'|complete achieved(61043) |or
step
talk Stone Cold Trixxy##66466
turnin Grand Master Trixxy##31909 |goto Winterspring/0 65.64,64.52
achieve 61043/12 |or
'|complete achieved(61043) |or
step
Did you complete the achievement?
next |only if achieved(61043)
next "HORDE_CRITTER_BATTLER_NOT_FINISHED" |only if not achieved(61043)
]])
GoatQuest:RegisterGuide("Achievement Guides\\Pet Battles\\Classic (1-60)\\Dragonkin Battler of Kalimdor",{
patch='120000',
author="Original guide team",
description="This will guide you through accomplishing the Dragonkin Battler of Kalimdor achievement.",
achieveid={61044},
startlevel=10,
},[[
step
Defeat the battle pet trainers of Kalimdor with a team of all level 25 {y}dragonkin{} pets.
|tip These achievement quests are dailies.
|tip You will be able to complete one family achievement per day.
|tip If you haven't completed the achievement, this guide will start over.
confirm
step
label "HORDE_DRAGONKIN_BATTLER_NOT_FINISHED"
talk Zunta##66126
accept Zunta##31818 |goto Durotar/0 43.86,28.86 |or
'|complete achieved(61044) |or
step
talk Zunta##66126
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41403
|tip Defeat him with a team of level 25 {y}dragonkin{} pets.
Defeat Zunta |q 31818/1 |goto Durotar/0 43.86,28.86 |or
'|complete achieved(61044) |or
step
talk Zunta##66126
turnin Zunta##31818 |goto Durotar/0 43.86,28.86
achieve 61044/1 |or
'|complete achieved(61044) |or
step
talk Dagra the Fierce##66135
accept Dagra the Fierce##31819 |goto Northern Barrens/0 58.61,53.04 |or
'|complete achieved(61044) |or
step
talk Dagra the Fierce##66135
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41182
|tip Defeat her with a team of level 25 {b}dragonkin{} pets.
Defeat Dagra the Fierce |q 31819/1 |goto Northern Barrens/0 58.61,53.04 |or
'|complete achieved(61044) |or
step
talk Dagra the Fierce##66135
turnin Dagra the Fierce##31819 |goto Northern Barrens/0 58.61,53.04
achieve 61044/2 |or
'|complete achieved(61044) |or
step
talk Grazzle the Great##66436
accept Grazzle the Great##31905 |goto Dustwallow Marsh/0 53.85,74.88 |or
'|complete achieved(61044) |or
step
talk Grazzle the Great##66436
Select _"Let's rumble!"_ |gossip 41246
|tip Defeat him with a team of level 25 {b}dragonkin{} pets.
Defeat Grazzle the Great |q 31905/1 |goto Dustwallow Marsh/0 53.85,74.88 |or
'|complete achieved(61044) |or
step
talk Grazzle the Great##66436
turnin Grazzle the Great##31905 |goto Dustwallow Marsh/0 53.85,74.88
achieve 61044/9 |or
'|complete achieved(61044) |or
step
talk Kela Grimtotem##66452
|tip Atop the pillar.
accept Kela Grimtotem##31906 |goto Thousand Needles/0 31.88,32.93 |or
'|complete achieved(61044) |or
step
talk Kela Grimtotem##66452
Select _"Let's rumble!"_ |gossip 41248
|tip Defeat her with a team of level 25 {b}dragonkin{} pets.
Defeat Kela Grimtotem |q 31906/1 |goto Thousand Needles/0 31.88,32.93 |or
'|complete achieved(61044) |or
step
talk Kela Grimtotem##66452
turnin Kela Grimtotem##31906 |goto Thousand Needles/0 31.88,32.93
achieve 61044/11 |or
'|complete achieved(61044) |or
step
talk Cassandra Kaboom##66422
accept Cassandra Kaboom##31904 |goto Southern Barrens/0 39.59,79.14 |or
'|complete achieved(61044) |or
step
talk Cassandra Kaboom##66422
Select _"Let's rumble!"_ |gossip 41260
|tip Defeat her with a team of level 25 {b}dragonkin{} pets.
Defeat Cassandra Kaboom |q 31904/1 |goto Southern Barrens/0 39.59,79.14 |or
'|complete achieved(61044) |or
step
talk Cassandra Kaboom##66422
turnin Cassandra Kaboom##31904 |goto Southern Barrens/0 39.59,79.14
achieve 61044/8 |or
'|complete achieved(61044) |or
step
talk Traitor Gluk##66352
accept Traitor Gluk##31871 |goto Feralas/0 59.75,49.64 |or
'|complete achieved(61044) |or
step
talk Traitor Gluk##66352
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41017
|tip Defeat him with a team of level 25 {b}dragonkin{} pets.
Defeat Traitor Gluk |q 31871/1 |goto Feralas/0 59.75,49.64 |or
'|complete achieved(61044) |or
step
talk Traitor Gluk##66352
turnin Traitor Gluk##31871 |goto Feralas/0 59.75,49.64
achieve 61044/6 |or
'|complete achieved(61044) |or
step
talk Merda Stronghoof##66372
accept Merda Stronghoof##31872 |goto Desolace/0 57.11,45.69 |or
'|complete achieved(61044) |or
step
talk Merda Stronghoof##66372
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41022
|tip Defeat her with a team of level 25 {b}dragonkin{} pets.
Defeat Merda Stronghoof |q 31872/1 |goto Desolace/0 57.11,45.69 |or
'|complete achieved(61044) |or
step
talk Merda Stronghoof##66372
turnin Merda Stronghoof##31872 |goto Desolace/0 57.11,45.69
achieve 61044/5 |or
'|complete achieved(61044) |or
step
talk Zonya the Sadist##66137
accept Zonya the Sadist##31862 |goto Stonetalon Mountains/0 59.66,71.58 |or
'|complete achieved(61044) |or
step
talk Zonya the Sadist##66137
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 40812
|tip Defeat her with a team of level 25 {b}dragonkin{} pets.
Defeat Zonya the Sadist |q 31862/1 |goto Stonetalon Mountains/0 59.66,71.58 |or
'|complete achieved(61044) |or
step
talk Zonya the Sadist##66137
turnin Zonya the Sadist##31862 |goto Stonetalon Mountains/0 59.66,71.58
achieve 61044/4 |or
'|complete achieved(61044) |or
step
talk Analynn##66136
accept Analynn##31814 |goto Ashenvale/0 20.20,29.55 |or
'|complete achieved(61044) |or
step
talk Analynn##66136
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 40736
|tip Defeat her with a team of level 25 {b}dragonkin{} pets.
Defeat Zonya the Sadist |q 31862/1 |goto Ashenvale/0 20.20,29.55 |or
'|complete achieved(61044) |or
step
talk Analynn##66136
turnin Analynn##31814 |goto Ashenvale/0 20.20,29.55
achieve 61044/3 |or
'|complete achieved(61044) |or
step
talk Zoltan##66442
accept Zoltan##31907 |goto Felwood/0 39.95,56.57 |or
'|complete achieved(61044) |or
step
talk Zoltan##66442
Select _"Let's rumble!"_ |gossip 41250
|tip Defeat him with a team of level 25 {b}dragonkin{} pets.
Defeat Zoltan |q 31907/1 |goto Felwood/0 39.95,56.57 |or
'|complete achieved(61044) |or
step
talk Zoltan##66442
turnin Zoltan##31907 |goto Felwood/0 39.95,56.57
achieve 61044/10 |or
'|complete achieved(61044) |or
step
talk Elena Flutterfly##66412
accept Elena Flutterfly##31908 |goto Moonglade/0 46.13,60.27 |or
'|complete achieved(61044) |or
step
talk Elena Flutterfly##66412
Select _"Let's rumble!"_ |gossip 41258
|tip Defeat her with a team of level 25 {b}dragonkin{} pets.
Defeat Elena Flutterfly |q 31908/1 |goto Moonglade/0 46.13,60.27 |or
'|complete achieved(61044) |or
step
talk Elena Flutterfly##66412
turnin Elena Flutterfly##31908 |goto Moonglade/0 46.13,60.27
achieve 61044/7 |or
'|complete achieved(61044) |or
step
talk Stone Cold Trixxy##66466
accept Grand Master Trixxy##31909 |goto Winterspring/0 65.64,64.52 |or
'|complete achieved(61044) |or
step
talk Stone Cold Trixxy##66466
Select _"Let's rumble!"_ |gossip 41411
|tip Defeat her with a team of level 25 {b}dragonkin{} pets.
Defeat Stone Cold Trixxy |q 31909/1 |goto Winterspring/0 65.64,64.52 |or
'|complete achieved(61044) |or
step
talk Stone Cold Trixxy##66466
turnin Grand Master Trixxy##31909 |goto Winterspring/0 65.64,64.52
achieve 61044/12 |or
'|complete achieved(61044) |or
step
Did you complete the achievement?
next |only if achieved(61044)
next "HORDE_DRAGONKIN_BATTLER_NOT_FINISHED" |only if not achieved(61044)
]])
GoatQuest:RegisterGuide("Achievement Guides\\Pet Battles\\Classic (1-60)\\Elemental Battler of Kalimdor",{
patch='120000',
author="Original guide team",
description="This will guide you through accomplishing the Elemental Battler of Kalimdor achievement.",
achieveid={61045},
startlevel=10,
},[[
step
Defeat the battle pet trainers of Kalimdor with a team of all level 25 {y}elemental{} pets.
|tip These achievement quests are dailies.
|tip You will be able to complete one family achievement per day.
|tip If you haven't completed the achievement, this guide will start over.
confirm
step
label "HORDE_ELEMENTAL_BATTLER_NOT_FINISHED"
talk Zunta##66126
accept Zunta##31818 |goto Durotar/0 43.86,28.86 |or
'|complete achieved(61045) |or
step
talk Zunta##66126
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41403
|tip Defeat him with a team of level 25 {y}elemental{} pets.
Defeat Zunta |q 31818/1 |goto Durotar/0 43.86,28.86 |or
'|complete achieved(61045) |or
step
talk Zunta##66126
turnin Zunta##31818 |goto Durotar/0 43.86,28.86
achieve 61045/1 |or
'|complete achieved(61045) |or
step
talk Dagra the Fierce##66135
accept Dagra the Fierce##31819 |goto Northern Barrens/0 58.61,53.04 |or
'|complete achieved(61045) |or
step
talk Dagra the Fierce##66135
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41182
|tip Defeat her with a team of level 25 {b}elemental{} pets.
Defeat Dagra the Fierce |q 31819/1 |goto Northern Barrens/0 58.61,53.04 |or
'|complete achieved(61045) |or
step
talk Dagra the Fierce##66135
turnin Dagra the Fierce##31819 |goto Northern Barrens/0 58.61,53.04
achieve 61045/2 |or
'|complete achieved(61045) |or
step
talk Grazzle the Great##66436
accept Grazzle the Great##31905 |goto Dustwallow Marsh/0 53.85,74.88 |or
'|complete achieved(61045) |or
step
talk Grazzle the Great##66436
Select _"Let's rumble!"_ |gossip 41246
|tip Defeat him with a team of level 25 {b}elemental{} pets.
Defeat Grazzle the Great |q 31905/1 |goto Dustwallow Marsh/0 53.85,74.88 |or
'|complete achieved(61045) |or
step
talk Grazzle the Great##66436
turnin Grazzle the Great##31905 |goto Dustwallow Marsh/0 53.85,74.88
achieve 61045/9 |or
'|complete achieved(61045) |or
step
talk Kela Grimtotem##66452
|tip Atop the pillar.
accept Kela Grimtotem##31906 |goto Thousand Needles/0 31.88,32.93 |or
'|complete achieved(61045) |or
step
talk Kela Grimtotem##66452
Select _"Let's rumble!"_ |gossip 41248
|tip Defeat her with a team of level 25 {b}elemental{} pets.
Defeat Kela Grimtotem |q 31906/1 |goto Thousand Needles/0 31.88,32.93 |or
'|complete achieved(61045) |or
step
talk Kela Grimtotem##66452
turnin Kela Grimtotem##31906 |goto Thousand Needles/0 31.88,32.93
achieve 61045/11 |or
'|complete achieved(61045) |or
step
talk Cassandra Kaboom##66422
accept Cassandra Kaboom##31904 |goto Southern Barrens/0 39.59,79.14 |or
'|complete achieved(61045) |or
step
talk Cassandra Kaboom##66422
Select _"Let's rumble!"_ |gossip 41260
|tip Defeat her with a team of level 25 {b}elemental{} pets.
Defeat Cassandra Kaboom |q 31904/1 |goto Southern Barrens/0 39.59,79.14 |or
'|complete achieved(61045) |or
step
talk Cassandra Kaboom##66422
turnin Cassandra Kaboom##31904 |goto Southern Barrens/0 39.59,79.14
achieve 61045/8 |or
'|complete achieved(61045) |or
step
talk Traitor Gluk##66352
accept Traitor Gluk##31871 |goto Feralas/0 59.75,49.64 |or
'|complete achieved(61045) |or
step
talk Traitor Gluk##66352
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41017
|tip Defeat him with a team of level 25 {b}elemental{} pets.
Defeat Traitor Gluk |q 31871/1 |goto Feralas/0 59.75,49.64 |or
'|complete achieved(61045) |or
step
talk Traitor Gluk##66352
turnin Traitor Gluk##31871 |goto Feralas/0 59.75,49.64
achieve 61045/6 |or
'|complete achieved(61045) |or
step
talk Merda Stronghoof##66372
accept Merda Stronghoof##31872 |goto Desolace/0 57.11,45.69 |or
'|complete achieved(61045) |or
step
talk Merda Stronghoof##66372
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41022
|tip Defeat her with a team of level 25 {b}elemental{} pets.
Defeat Merda Stronghoof |q 31872/1 |goto Desolace/0 57.11,45.69 |or
'|complete achieved(61045) |or
step
talk Merda Stronghoof##66372
turnin Merda Stronghoof##31872 |goto Desolace/0 57.11,45.69
achieve 61045/5 |or
'|complete achieved(61045) |or
step
talk Zonya the Sadist##66137
accept Zonya the Sadist##31862 |goto Stonetalon Mountains/0 59.66,71.58 |or
'|complete achieved(61045) |or
step
talk Zonya the Sadist##66137
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 40812
|tip Defeat her with a team of level 25 {b}elemental{} pets.
Defeat Zonya the Sadist |q 31862/1 |goto Stonetalon Mountains/0 59.66,71.58 |or
'|complete achieved(61045) |or
step
talk Zonya the Sadist##66137
turnin Zonya the Sadist##31862 |goto Stonetalon Mountains/0 59.66,71.58
achieve 61045/4 |or
'|complete achieved(61045) |or
step
talk Analynn##66136
accept Analynn##31814 |goto Ashenvale/0 20.20,29.55 |or
'|complete achieved(61045) |or
step
talk Analynn##66136
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 40736
|tip Defeat her with a team of level 25 {b}elemental{} pets.
Defeat Zonya the Sadist |q 31862/1 |goto Ashenvale/0 20.20,29.55 |or
'|complete achieved(61045) |or
step
talk Analynn##66136
turnin Analynn##31814 |goto Ashenvale/0 20.20,29.55
achieve 61045/3 |or
'|complete achieved(61045) |or
step
talk Zoltan##66442
accept Zoltan##31907 |goto Felwood/0 39.95,56.57 |or
'|complete achieved(61045) |or
step
talk Zoltan##66442
Select _"Let's rumble!"_ |gossip 41250
|tip Defeat him with a team of level 25 {b}elemental{} pets.
Defeat Zoltan |q 31907/1 |goto Felwood/0 39.95,56.57 |or
'|complete achieved(61045) |or
step
talk Zoltan##66442
turnin Zoltan##31907 |goto Felwood/0 39.95,56.57
achieve 61045/10 |or
'|complete achieved(61045) |or
step
talk Elena Flutterfly##66412
accept Elena Flutterfly##31908 |goto Moonglade/0 46.13,60.27 |or
'|complete achieved(61045) |or
step
talk Elena Flutterfly##66412
Select _"Let's rumble!"_ |gossip 41258
|tip Defeat her with a team of level 25 {b}elemental{} pets.
Defeat Elena Flutterfly |q 31908/1 |goto Moonglade/0 46.13,60.27 |or
'|complete achieved(61045) |or
step
talk Elena Flutterfly##66412
turnin Elena Flutterfly##31908 |goto Moonglade/0 46.13,60.27
achieve 61045/7 |or
'|complete achieved(61045) |or
step
talk Stone Cold Trixxy##66466
accept Grand Master Trixxy##31909 |goto Winterspring/0 65.64,64.52 |or
'|complete achieved(61045) |or
step
talk Stone Cold Trixxy##66466
Select _"Let's rumble!"_ |gossip 41411
|tip Defeat her with a team of level 25 {b}elemental{} pets.
Defeat Stone Cold Trixxy |q 31909/1 |goto Winterspring/0 65.64,64.52 |or
'|complete achieved(61045) |or
step
talk Stone Cold Trixxy##66466
turnin Grand Master Trixxy##31909 |goto Winterspring/0 65.64,64.52
achieve 61045/12 |or
'|complete achieved(61045) |or
step
Did you complete the achievement?
next |only if achieved(61045)
next "HORDE_ELEMENTAL_BATTLER_NOT_FINISHED" |only if not achieved(61045)
]])
GoatQuest:RegisterGuide("Achievement Guides\\Pet Battles\\Classic (1-60)\\Flying Battler of Kalimdor",{
patch='120000',
author="Original guide team",
description="This will guide you through accomplishing the Flying Battler of Kalimdor achievement.",
achieveid={61046},
startlevel=10,
},[[
step
Defeat the battle pet trainers of Kalimdor with a team of all level 25 {y}flying{} pets.
|tip These achievement quests are dailies.
|tip You will be able to complete one family achievement per day.
|tip If you haven't completed the achievement, this guide will start over.
confirm
step
label "HORDE_FLYING_BATTLER_NOT_FINISHED"
talk Zunta##66126
accept Zunta##31818 |goto Durotar/0 43.86,28.86 |or
'|complete achieved(61046) |or
step
talk Zunta##66126
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41403
|tip Defeat him with a team of level 25 {y}flying{} pets.
Defeat Zunta |q 31818/1 |goto Durotar/0 43.86,28.86 |or
'|complete achieved(61045) |or
step
talk Zunta##66126
turnin Zunta##31818 |goto Durotar/0 43.86,28.86
achieve 61046/1 |or
'|complete achieved(61046) |or
step
talk Dagra the Fierce##66135
accept Dagra the Fierce##31819 |goto Northern Barrens/0 58.61,53.04 |or
'|complete achieved(61046) |or
step
talk Dagra the Fierce##66135
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41182
|tip Defeat her with a team of level 25 {b}flying{} pets.
Defeat Dagra the Fierce |q 31819/1 |goto Northern Barrens/0 58.61,53.04 |or
'|complete achieved(61046) |or
step
talk Dagra the Fierce##66135
turnin Dagra the Fierce##31819 |goto Northern Barrens/0 58.61,53.04
achieve 61046/2 |or
'|complete achieved(61046) |or
step
talk Grazzle the Great##66436
accept Grazzle the Great##31905 |goto Dustwallow Marsh/0 53.85,74.88 |or
'|complete achieved(61046) |or
step
talk Grazzle the Great##66436
Select _"Let's rumble!"_ |gossip 41246
|tip Defeat him with a team of level 25 {b}flying{} pets.
Defeat Grazzle the Great |q 31905/1 |goto Dustwallow Marsh/0 53.85,74.88 |or
'|complete achieved(61046) |or
step
talk Grazzle the Great##66436
turnin Grazzle the Great##31905 |goto Dustwallow Marsh/0 53.85,74.88
achieve 61046/9 |or
'|complete achieved(61046) |or
step
talk Kela Grimtotem##66452
|tip Atop the pillar.
accept Kela Grimtotem##31906 |goto Thousand Needles/0 31.88,32.93 |or
'|complete achieved(61046) |or
step
talk Kela Grimtotem##66452
Select _"Let's rumble!"_ |gossip 41248
|tip Defeat her with a team of level 25 {b}flying{} pets.
Defeat Kela Grimtotem |q 31906/1 |goto Thousand Needles/0 31.88,32.93 |or
'|complete achieved(61046) |or
step
talk Kela Grimtotem##66452
turnin Kela Grimtotem##31906 |goto Thousand Needles/0 31.88,32.93
achieve 61046/11 |or
'|complete achieved(61046) |or
step
talk Cassandra Kaboom##66422
accept Cassandra Kaboom##31904 |goto Southern Barrens/0 39.59,79.14 |or
'|complete achieved(61046) |or
step
talk Cassandra Kaboom##66422
Select _"Let's rumble!"_ |gossip 41260
|tip Defeat her with a team of level 25 {b}flying{} pets.
Defeat Cassandra Kaboom |q 31904/1 |goto Southern Barrens/0 39.59,79.14 |or
'|complete achieved(61046) |or
step
talk Cassandra Kaboom##66422
turnin Cassandra Kaboom##31904 |goto Southern Barrens/0 39.59,79.14
achieve 61046/8 |or
'|complete achieved(61046) |or
step
talk Traitor Gluk##66352
accept Traitor Gluk##31871 |goto Feralas/0 59.75,49.64 |or
'|complete achieved(61046) |or
step
talk Traitor Gluk##66352
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41017
|tip Defeat him with a team of level 25 {b}flying{} pets.
Defeat Traitor Gluk |q 31871/1 |goto Feralas/0 59.75,49.64 |or
'|complete achieved(61046) |or
step
talk Traitor Gluk##66352
turnin Traitor Gluk##31871 |goto Feralas/0 59.75,49.64
achieve 61046/6 |or
'|complete achieved(61046) |or
step
talk Merda Stronghoof##66372
accept Merda Stronghoof##31872 |goto Desolace/0 57.11,45.69 |or
'|complete achieved(61046) |or
step
talk Merda Stronghoof##66372
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41022
|tip Defeat her with a team of level 25 {b}flying{} pets.
Defeat Merda Stronghoof |q 31872/1 |goto Desolace/0 57.11,45.69 |or
'|complete achieved(61046) |or
step
talk Merda Stronghoof##66372
turnin Merda Stronghoof##31872 |goto Desolace/0 57.11,45.69
achieve 61046/5 |or
'|complete achieved(61046) |or
step
talk Zonya the Sadist##66137
accept Zonya the Sadist##31862 |goto Stonetalon Mountains/0 59.66,71.58 |or
'|complete achieved(61046) |or
step
talk Zonya the Sadist##66137
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 40812
|tip Defeat her with a team of level 25 {b}flying{} pets.
Defeat Zonya the Sadist |q 31862/1 |goto Stonetalon Mountains/0 59.66,71.58 |or
'|complete achieved(61046) |or
step
talk Zonya the Sadist##66137
turnin Zonya the Sadist##31862 |goto Stonetalon Mountains/0 59.66,71.58
achieve 61046/4 |or
'|complete achieved(61046) |or
step
talk Analynn##66136
accept Analynn##31814 |goto Ashenvale/0 20.20,29.55 |or
'|complete achieved(61046) |or
step
talk Analynn##66136
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 40736
|tip Defeat her with a team of level 25 {b}flying{} pets.
Defeat Zonya the Sadist |q 31862/1 |goto Ashenvale/0 20.20,29.55 |or
'|complete achieved(61046) |or
step
talk Analynn##66136
turnin Analynn##31814 |goto Ashenvale/0 20.20,29.55
achieve 61046/3 |or
'|complete achieved(61046) |or
step
talk Zoltan##66442
accept Zoltan##31907 |goto Felwood/0 39.95,56.57 |or
'|complete achieved(61046) |or
step
talk Zoltan##66442
Select _"Let's rumble!"_ |gossip 41250
|tip Defeat him with a team of level 25 {b}flying{} pets.
Defeat Zoltan |q 31907/1 |goto Felwood/0 39.95,56.57 |or
'|complete achieved(61046) |or
step
talk Zoltan##66442
turnin Zoltan##31907 |goto Felwood/0 39.95,56.57
achieve 61046/10 |or
'|complete achieved(61046) |or
step
talk Elena Flutterfly##66412
accept Elena Flutterfly##31908 |goto Moonglade/0 46.13,60.27 |or
'|complete achieved(61046) |or
step
talk Elena Flutterfly##66412
Select _"Let's rumble!"_ |gossip 41258
|tip Defeat her with a team of level 25 {b}flying{} pets.
Defeat Elena Flutterfly |q 31908/1 |goto Moonglade/0 46.13,60.27 |or
'|complete achieved(61046) |or
step
talk Elena Flutterfly##66412
turnin Elena Flutterfly##31908 |goto Moonglade/0 46.13,60.27
achieve 61046/7 |or
'|complete achieved(61046) |or
step
talk Stone Cold Trixxy##66466
accept Grand Master Trixxy##31909 |goto Winterspring/0 65.64,64.52 |or
'|complete achieved(61046) |or
step
talk Stone Cold Trixxy##66466
Select _"Let's rumble!"_ |gossip 41411
|tip Defeat her with a team of level 25 {b}flying{} pets.
Defeat Stone Cold Trixxy |q 31909/1 |goto Winterspring/0 65.64,64.52 |or
'|complete achieved(61046) |or
step
talk Stone Cold Trixxy##66466
turnin Grand Master Trixxy##31909 |goto Winterspring/0 65.64,64.52
achieve 61046/12 |or
'|complete achieved(61046) |or
step
Did you complete the achievement?
next |only if achieved(61046)
next "HORDE_FLYING_BATTLER_NOT_FINISHED" |only if not achieved(61046)
]])
GoatQuest:RegisterGuide("Achievement Guides\\Pet Battles\\Classic (1-60)\\Humanoid Battler of Kalimdor",{
patch='120000',
author="Original guide team",
description="This will guide you through accomplishing the Humanoid Battler of Kalimdor achievement.",
achieveid={61047},
startlevel=10,
},[[
step
Defeat the battle pet trainers of Kalimdor with a team of all level 25 {y}humanoid{} pets.
|tip These achievement quests are dailies.
|tip You will be able to complete one family achievement per day.
|tip If you haven't completed the achievement, this guide will start over.
confirm
step
label "HORDE_HUMANOID_BATTLER_NOT_FINISHED"
talk Zunta##66126
accept Zunta##31818 |goto Durotar/0 43.86,28.86 |or
'|complete achieved(61047) |or
step
talk Zunta##66126
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41403
|tip Defeat him with a team of level 25 {y}humanoid{} pets.
Defeat Zunta |q 31818/1 |goto Durotar/0 43.86,28.86 |or
'|complete achieved(61047) |or
step
talk Zunta##66126
turnin Zunta##31818 |goto Durotar/0 43.86,28.86
achieve 61047/1 |or
'|complete achieved(61047) |or
step
talk Dagra the Fierce##66135
accept Dagra the Fierce##31819 |goto Northern Barrens/0 58.61,53.04 |or
'|complete achieved(61047) |or
step
talk Dagra the Fierce##66135
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41182
|tip Defeat her with a team of level 25 {b}humanoid{} pets.
Defeat Dagra the Fierce |q 31819/1 |goto Northern Barrens/0 58.61,53.04 |or
'|complete achieved(61047) |or
step
talk Dagra the Fierce##66135
turnin Dagra the Fierce##31819 |goto Northern Barrens/0 58.61,53.04
achieve 61047/2 |or
'|complete achieved(61047) |or
step
talk Grazzle the Great##66436
accept Grazzle the Great##31905 |goto Dustwallow Marsh/0 53.85,74.88 |or
'|complete achieved(61047) |or
step
talk Grazzle the Great##66436
Select _"Let's rumble!"_ |gossip 41246
|tip Defeat him with a team of level 25 {b}humanoid{} pets.
Defeat Grazzle the Great |q 31905/1 |goto Dustwallow Marsh/0 53.85,74.88 |or
'|complete achieved(61047) |or
step
talk Grazzle the Great##66436
turnin Grazzle the Great##31905 |goto Dustwallow Marsh/0 53.85,74.88
achieve 61047/9 |or
'|complete achieved(61047) |or
step
talk Kela Grimtotem##66452
|tip Atop the pillar.
accept Kela Grimtotem##31906 |goto Thousand Needles/0 31.88,32.93 |or
'|complete achieved(61047) |or
step
talk Kela Grimtotem##66452
Select _"Let's rumble!"_ |gossip 41248
|tip Defeat her with a team of level 25 {b}humanoid{} pets.
Defeat Kela Grimtotem |q 31906/1 |goto Thousand Needles/0 31.88,32.93 |or
'|complete achieved(61047) |or
step
talk Kela Grimtotem##66452
turnin Kela Grimtotem##31906 |goto Thousand Needles/0 31.88,32.93
achieve 61047/11 |or
'|complete achieved(61047) |or
step
talk Cassandra Kaboom##66422
accept Cassandra Kaboom##31904 |goto Southern Barrens/0 39.59,79.14 |or
'|complete achieved(61047) |or
step
talk Cassandra Kaboom##66422
Select _"Let's rumble!"_ |gossip 41260
|tip Defeat her with a team of level 25 {b}humanoid{} pets.
Defeat Cassandra Kaboom |q 31904/1 |goto Southern Barrens/0 39.59,79.14 |or
'|complete achieved(61047) |or
step
talk Cassandra Kaboom##66422
turnin Cassandra Kaboom##31904 |goto Southern Barrens/0 39.59,79.14
achieve 61047/8 |or
'|complete achieved(61047) |or
step
talk Traitor Gluk##66352
accept Traitor Gluk##31871 |goto Feralas/0 59.75,49.64 |or
'|complete achieved(61047) |or
step
talk Traitor Gluk##66352
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41017
|tip Defeat him with a team of level 25 {b}humanoid{} pets.
Defeat Traitor Gluk |q 31871/1 |goto Feralas/0 59.75,49.64 |or
'|complete achieved(61047) |or
step
talk Traitor Gluk##66352
turnin Traitor Gluk##31871 |goto Feralas/0 59.75,49.64
achieve 61047/6 |or
'|complete achieved(61047) |or
step
talk Merda Stronghoof##66372
accept Merda Stronghoof##31872 |goto Desolace/0 57.11,45.69 |or
'|complete achieved(61047) |or
step
talk Merda Stronghoof##66372
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41022
|tip Defeat her with a team of level 25 {b}humanoid{} pets.
Defeat Merda Stronghoof |q 31872/1 |goto Desolace/0 57.11,45.69 |or
'|complete achieved(61047) |or
step
talk Merda Stronghoof##66372
turnin Merda Stronghoof##31872 |goto Desolace/0 57.11,45.69
achieve 61047/5 |or
'|complete achieved(61047) |or
step
talk Zonya the Sadist##66137
accept Zonya the Sadist##31862 |goto Stonetalon Mountains/0 59.66,71.58 |or
'|complete achieved(61047) |or
step
talk Zonya the Sadist##66137
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 40812
|tip Defeat her with a team of level 25 {b}humanoid{} pets.
Defeat Zonya the Sadist |q 31862/1 |goto Stonetalon Mountains/0 59.66,71.58 |or
'|complete achieved(61047) |or
step
talk Zonya the Sadist##66137
turnin Zonya the Sadist##31862 |goto Stonetalon Mountains/0 59.66,71.58
achieve 61047/4
step
talk Analynn##66136
accept Analynn##31814 |goto Ashenvale/0 20.20,29.55 |or
'|complete achieved(61047) |or
step
talk Analynn##66136
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 40736
|tip Defeat her with a team of level 25 {b}humanoid{} pets.
Defeat Zonya the Sadist |q 31862/1 |goto Ashenvale/0 20.20,29.55 |or
'|complete achieved(61047) |or
step
talk Analynn##66136
turnin Analynn##31814 |goto Ashenvale/0 20.20,29.55 q
achieve 61047/3 |or
'|complete achieved(61047) |or
step
talk Zoltan##66442
accept Zoltan##31907 |goto Felwood/0 39.95,56.57 |or
'|complete achieved(61047) |or
step
talk Zoltan##66442
Select _"Let's rumble!"_ |gossip 41250
|tip Defeat him with a team of level 25 {b}humanoid{} pets.
Defeat Zoltan |q 31907/1 |goto Felwood/0 39.95,56.57 |or
'|complete achieved(61047) |or
step
talk Zoltan##66442
turnin Zoltan##31907 |goto Felwood/0 39.95,56.57
achieve 61047/10 |or
'|complete achieved(61047) |or
step
talk Elena Flutterfly##66412
accept Elena Flutterfly##31908 |goto Moonglade/0 46.13,60.27 |or
'|complete achieved(61047) |or
step
talk Elena Flutterfly##66412
Select _"Let's rumble!"_ |gossip 41258
|tip Defeat her with a team of level 25 {b}humanoid{} pets.
Defeat Elena Flutterfly |q 31908/1 |goto Moonglade/0 46.13,60.27 |or
'|complete achieved(61047) |or
step
talk Elena Flutterfly##66412
turnin Elena Flutterfly##31908 |goto Moonglade/0 46.13,60.27
achieve 61047/7 |or
'|complete achieved(61047) |or
step
talk Stone Cold Trixxy##66466
accept Grand Master Trixxy##31909 |goto Winterspring/0 65.64,64.52 |or
'|complete achieved(61047) |or
step
talk Stone Cold Trixxy##66466
Select _"Let's rumble!"_ |gossip 41411
|tip Defeat her with a team of level 25 {b}humanoid{} pets.
Defeat Stone Cold Trixxy |q 31909/1 |goto Winterspring/0 65.64,64.52 |or
'|complete achieved(61047) |or
step
talk Stone Cold Trixxy##66466
turnin Grand Master Trixxy##31909 |goto Winterspring/0 65.64,64.52
achieve 61047/12 |or
'|complete achieved(61047) |or
step
Did you complete the achievement?
next |only if achieved(61047)
next "HORDE_HUMANOID_BATTLER_NOT_FINISHED" |only if not achieved(61047)
]])
GoatQuest:RegisterGuide("Achievement Guides\\Pet Battles\\Classic (1-60)\\Magic Battler of Kalimdor",{
patch='120000',
author="Original guide team",
description="This will guide you through accomplishing the Magic Battler of Kalimdor achievement.",
achieveid={61048},
startlevel=10,
},[[
step
Defeat the battle pet trainers of Kalimdor with a team of all level 25 {y}magic{} pets.
|tip These achievement quests are dailies.
|tip You will be able to complete one family achievement per day.
|tip If you haven't completed the achievement, this guide will start over.
confirm
step
label "HORDE_MAGIC_BATTLER_NOT_FINISHED"
talk Zunta##66126
accept Zunta##31818 |goto Durotar/0 43.86,28.86 |or
'|complete achieved(61048) |or
step
talk Zunta##66126
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41403
|tip Defeat him with a team of level 25 {y}magic{} pets.
Defeat Zunta |q 31818/1 |goto Durotar/0 43.86,28.86 |or
'|complete achieved(61048) |or
step
talk Zunta##66126
turnin Zunta##31818 |goto Durotar/0 43.86,28.86
achieve 61048/1 |or
'|complete achieved(61048) |or
step
talk Dagra the Fierce##66135
accept Dagra the Fierce##31819 |goto Northern Barrens/0 58.61,53.04 |or
'|complete achieved(61048) |or
step
talk Dagra the Fierce##66135
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41182
|tip Defeat her with a team of level 25 {b}magic{} pets.
Defeat Dagra the Fierce |q 31819/1 |goto Northern Barrens/0 58.61,53.04 |or
'|complete achieved(61048) |or
step
talk Dagra the Fierce##66135
turnin Dagra the Fierce##31819 |goto Northern Barrens/0 58.61,53.04
achieve 61048/2 |or
'|complete achieved(61048) |or
step
talk Grazzle the Great##66436
accept Grazzle the Great##31905 |goto Dustwallow Marsh/0 53.85,74.88 |or
'|complete achieved(61048) |or
step
talk Grazzle the Great##66436
Select _"Let's rumble!"_ |gossip 41246
|tip Defeat him with a team of level 25 {b}magic{} pets.
Defeat Grazzle the Great |q 31905/1 |goto Dustwallow Marsh/0 53.85,74.88 |or
'|complete achieved(61048) |or
step
talk Grazzle the Great##66436
turnin Grazzle the Great##31905 |goto Dustwallow Marsh/0 53.85,74.88
achieve 61048/9 |or
'|complete achieved(61048) |or
step
talk Kela Grimtotem##66452
|tip Atop the pillar.
accept Kela Grimtotem##31906 |goto Thousand Needles/0 31.88,32.93 |or
'|complete achieved(61048) |or
step
talk Kela Grimtotem##66452
Select _"Let's rumble!"_ |gossip 41248
|tip Defeat her with a team of level 25 {b}magic{} pets.
Defeat Kela Grimtotem |q 31906/1 |goto Thousand Needles/0 31.88,32.93 |or
'|complete achieved(61048) |or
step
talk Kela Grimtotem##66452
turnin Kela Grimtotem##31906 |goto Thousand Needles/0 31.88,32.93
achieve 61048/11 |or
'|complete achieved(61048) |or
step
talk Cassandra Kaboom##66422
accept Cassandra Kaboom##31904 |goto Southern Barrens/0 39.59,79.14 |or
'|complete achieved(61048) |or
step
talk Cassandra Kaboom##66422
Select _"Let's rumble!"_ |gossip 41260
|tip Defeat her with a team of level 25 {b}magic{} pets.
Defeat Cassandra Kaboom |q 31904/1 |goto Southern Barrens/0 39.59,79.14 |or
'|complete achieved(61048) |or
step
talk Cassandra Kaboom##66422
turnin Cassandra Kaboom##31904 |goto Southern Barrens/0 39.59,79.14
achieve 61048/8 |or
'|complete achieved(61048) |or
step
talk Traitor Gluk##66352
accept Traitor Gluk##31871 |goto Feralas/0 59.75,49.64 |or
'|complete achieved(61048) |or
step
talk Traitor Gluk##66352
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41017
|tip Defeat him with a team of level 25 {b}magic{} pets.
Defeat Traitor Gluk |q 31871/1 |goto Feralas/0 59.75,49.64 |or
'|complete achieved(61048) |or
step
talk Traitor Gluk##66352
turnin Traitor Gluk##31871 |goto Feralas/0 59.75,49.64 |or
'|complete achieved(61048) |or
step
talk Merda Stronghoof##66372
accept Merda Stronghoof##31872 |goto Desolace/0 57.11,45.69 |or
'|complete achieved(61048) |or
step
talk Merda Stronghoof##66372
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41022
|tip Defeat her with a team of level 25 {b}magic{} pets.
Defeat Merda Stronghoof |q 31872/1 |goto Desolace/0 57.11,45.69 |or
'|complete achieved(61048) |or
step
talk Merda Stronghoof##66372
turnin Merda Stronghoof##31872 |goto Desolace/0 57.11,45.69 |or
'|complete achieved(61048) |or
step
talk Zonya the Sadist##66137
accept Zonya the Sadist##31862 |goto Stonetalon Mountains/0 59.66,71.58 |or
'|complete achieved(61048) |or
step
talk Zonya the Sadist##66137
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 40812
|tip Defeat her with a team of level 25 {b}magic{} pets.
Defeat Zonya the Sadist |q 31862/1 |goto Stonetalon Mountains/0 59.66,71.58 |or
'|complete achieved(61048) |or
step
talk Zonya the Sadist##66137
turnin Zonya the Sadist##31862 |goto Stonetalon Mountains/0 59.66,71.58 |or
'|complete achieved(61048) |or
step
talk Analynn##66136
accept Analynn##31814 |goto Ashenvale/0 20.20,29.55 |or
'|complete achieved(61048) |or
step
talk Analynn##66136
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 40736
|tip Defeat her with a team of level 25 {b}magic{} pets.
Defeat Zonya the Sadist |q 31862/1 |goto Ashenvale/0 20.20,29.55 |or
'|complete achieved(61048) |or
step
talk Analynn##66136
turnin Analynn##31814 |goto Ashenvale/0 20.20,29.55 |or
'|complete achieved(61048) |or
step
talk Zoltan##66442
accept Zoltan##31907 |goto Felwood/0 39.95,56.57 |or
'|complete achieved(61048) |or
step
talk Zoltan##66442
Select _"Let's rumble!"_ |gossip 41250
|tip Defeat him with a team of level 25 {b}magic{} pets.
Defeat Zoltan |q 31907/1 |goto Felwood/0 39.95,56.57 |or
'|complete achieved(61048) |or
step
talk Zoltan##66442
turnin Zoltan##31907 |goto Felwood/0 39.95,56.57 |or
'|complete achieved(61048) |or
step
talk Elena Flutterfly##66412
accept Elena Flutterfly##31908 |goto Moonglade/0 46.13,60.27 |or
'|complete achieved(61048) |or
step
talk Elena Flutterfly##66412
Select _"Let's rumble!"_ |gossip 41258
|tip Defeat her with a team of level 25 {b}magic{} pets.
Defeat Elena Flutterfly |q 31908/1 |goto Moonglade/0 46.13,60.27 |or
'|complete achieved(61048) |or
step
talk Elena Flutterfly##66412
turnin Elena Flutterfly##31908 |goto Moonglade/0 46.13,60.27 |or
'|complete achieved(61048) |or
step
talk Stone Cold Trixxy##66466
accept Grand Master Trixxy##31909 |goto Winterspring/0 65.64,64.52 |or
'|complete achieved(61048) |or
step
talk Stone Cold Trixxy##66466
Select _"Let's rumble!"_ |gossip 41411
|tip Defeat her with a team of level 25 {b}magic{} pets.
Defeat Stone Cold Trixxy |q 31909/1 |goto Winterspring/0 65.64,64.52 |or
'|complete achieved(61048) |or
step
talk Stone Cold Trixxy##66466
turnin Grand Master Trixxy##31909 |goto Winterspring/0 65.64,64.52 |or
'|complete achieved(61048) |or
step
Did you complete the achievement?
next |only if achieved(61048)
next "HORDE_MAGIC_BATTLER_NOT_FINISHED" |only if not achieved(61048)
]])
GoatQuest:RegisterGuide("Achievement Guides\\Pet Battles\\Classic (1-60)\\Mechanical Battler of Kalimdor",{
patch='120000',
author="Original guide team",
description="This will guide you through accomplishing the Mechanical Battler of Kalimdor achievement.",
achieveid={61049},
startlevel=10,
},[[
step
Defeat the battle pet trainers of Kalimdor with a team of all level 25 {y}mechanical{} pets.
|tip These achievement quests are dailies.
|tip You will be able to complete one family achievement per day.
|tip If you haven't completed the achievement, this guide will start over.
confirm
step
label "HORDE_MECHANICAL_BATTLER_NOT_FINISHED"
talk Zunta##66126
accept Zunta##31818 |goto Durotar/0 43.86,28.86 |or
'|complete achieved(61049) |or
step
talk Zunta##66126
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41403
|tip Defeat him with a team of level 25 {y}mechanical{} pets.
Defeat Zunta |q 31818/1 |goto Durotar/0 43.86,28.86 |or
'|complete achieved(61049) |or
step
talk Zunta##66126
turnin Zunta##31818 |goto Durotar/0 43.86,28.86 |or
'|complete achieved(61049) |or
step
talk Dagra the Fierce##66135
accept Dagra the Fierce##31819 |goto Northern Barrens/0 58.61,53.04 |or
'|complete achieved(61049) |or
step
talk Dagra the Fierce##66135
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41182
|tip Defeat her with a team of level 25 {b}mechanical{} pets.
Defeat Dagra the Fierce |q 31819/1 |goto Northern Barrens/0 58.61,53.04 |or
'|complete achieved(61049) |or
step
talk Dagra the Fierce##66135
turnin Dagra the Fierce##31819 |goto Northern Barrens/0 58.61,53.04 |or
'|complete achieved(61049) |or
step
talk Grazzle the Great##66436
accept Grazzle the Great##31905 |goto Dustwallow Marsh/0 53.85,74.88 |or
'|complete achieved(61049) |or
step
talk Grazzle the Great##66436
Select _"Let's rumble!"_ |gossip 41246
|tip Defeat him with a team of level 25 {b}mechanical{} pets.
Defeat Grazzle the Great |q 31905/1 |goto Dustwallow Marsh/0 53.85,74.88 |or
'|complete achieved(61049) |or
step
talk Grazzle the Great##66436
turnin Grazzle the Great##31905 |goto Dustwallow Marsh/0 53.85,74.88 |or
'|complete achieved(61049) |or
step
talk Kela Grimtotem##66452
|tip Atop the pillar.
accept Kela Grimtotem##31906 |goto Thousand Needles/0 31.88,32.93 |or
'|complete achieved(61049) |or
step
talk Kela Grimtotem##66452
Select _"Let's rumble!"_ |gossip 41248
|tip Defeat her with a team of level 25 {b}mechanical{} pets.
Defeat Kela Grimtotem |q 31906/1 |goto Thousand Needles/0 31.88,32.93 |or
'|complete achieved(61049) |or
step
talk Kela Grimtotem##66452
turnin Kela Grimtotem##31906 |goto Thousand Needles/0 31.88,32.93 |or
'|complete achieved(61049) |or
step
talk Cassandra Kaboom##66422
accept Cassandra Kaboom##31904 |goto Southern Barrens/0 39.59,79.14 |or
'|complete achieved(61049) |or
step
talk Cassandra Kaboom##66422
Select _"Let's rumble!"_ |gossip 41260
|tip Defeat her with a team of level 25 {b}mechanical{} pets.
Defeat Cassandra Kaboom |q 31904/1 |goto Southern Barrens/0 39.59,79.14 |or
'|complete achieved(61049) |or
step
talk Cassandra Kaboom##66422
turnin Cassandra Kaboom##31904 |goto Southern Barrens/0 39.59,79.14 |or
'|complete achieved(61049) |or
step
talk Traitor Gluk##66352
accept Traitor Gluk##31871 |goto Feralas/0 59.75,49.64 |or
'|complete achieved(61049) |or
step
talk Traitor Gluk##66352
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41017
|tip Defeat him with a team of level 25 {b}mechanical{} pets.
Defeat Traitor Gluk |q 31871/1 |goto Feralas/0 59.75,49.64 |or
'|complete achieved(61049) |or
step
talk Traitor Gluk##66352
turnin Traitor Gluk##31871 |goto Feralas/0 59.75,49.64 |or
'|complete achieved(61049) |or
step
talk Merda Stronghoof##66372
accept Merda Stronghoof##31872 |goto Desolace/0 57.11,45.69 |or
'|complete achieved(61049) |or
step
talk Merda Stronghoof##66372
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41022
|tip Defeat her with a team of level 25 {b}mechanical{} pets.
Defeat Merda Stronghoof |q 31872/1 |goto Desolace/0 57.11,45.69 |or
'|complete achieved(61049) |or
step
talk Merda Stronghoof##66372
turnin Merda Stronghoof##31872 |goto Desolace/0 57.11,45.69 |or
'|complete achieved(61049) |or
step
talk Zonya the Sadist##66137
accept Zonya the Sadist##31862 |goto Stonetalon Mountains/0 59.66,71.58 |or
'|complete achieved(61049) |or
step
talk Zonya the Sadist##66137
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 40812
|tip Defeat her with a team of level 25 {b}mechanical{} pets.
Defeat Zonya the Sadist |q 31862/1 |goto Stonetalon Mountains/0 59.66,71.58 |or
'|complete achieved(61049) |or
step
talk Zonya the Sadist##66137
turnin Zonya the Sadist##31862 |goto Stonetalon Mountains/0 59.66,71.58 |or
'|complete achieved(61049) |or
step
talk Analynn##66136
accept Analynn##31814 |goto Ashenvale/0 20.20,29.55 |or
'|complete achieved(61049) |or
step
talk Analynn##66136
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 40736
|tip Defeat her with a team of level 25 {b}mechanical{} pets.
Defeat Zonya the Sadist |q 31862/1 |goto Ashenvale/0 20.20,29.55 |or
'|complete achieved(61049) |or
step
talk Analynn##66136
turnin Analynn##31814 |goto Ashenvale/0 20.20,29.55 |or
'|complete achieved(61049) |or
step
talk Zoltan##66442
accept Zoltan##31907 |goto Felwood/0 39.95,56.57 |or
'|complete achieved(61049) |or
step
talk Zoltan##66442
Select _"Let's rumble!"_ |gossip 41250
|tip Defeat him with a team of level 25 {b}mechanical{} pets.
Defeat Zoltan |q 31907/1 |goto Felwood/0 39.95,56.57 |or
'|complete achieved(61049) |or
step
talk Zoltan##66442
turnin Zoltan##31907 |goto Felwood/0 39.95,56.57 |or
'|complete achieved(61049) |or
step
talk Elena Flutterfly##66412
accept Elena Flutterfly##31908 |goto Moonglade/0 46.13,60.27 |or
'|complete achieved(61049) |or
step
talk Elena Flutterfly##66412
Select _"Let's rumble!"_ |gossip 41258
|tip Defeat her with a team of level 25 {b}mechanical{} pets.
Defeat Elena Flutterfly |q 31908/1 |goto Moonglade/0 46.13,60.27 |or
'|complete achieved(61049) |or
step
talk Elena Flutterfly##66412
turnin Elena Flutterfly##31908 |goto Moonglade/0 46.13,60.27 |or
'|complete achieved(61049) |or
step
talk Stone Cold Trixxy##66466
accept Grand Master Trixxy##31909 |goto Winterspring/0 65.64,64.52 |or
'|complete achieved(61049) |or
step
talk Stone Cold Trixxy##66466
Select _"Let's rumble!"_ |gossip 41411
|tip Defeat her with a team of level 25 {b}mechanical{} pets.
Defeat Stone Cold Trixxy |q 31909/1 |goto Winterspring/0 65.64,64.52 |or
'|complete achieved(61049) |or
step
talk Stone Cold Trixxy##66466
turnin Grand Master Trixxy##31909 |goto Winterspring/0 65.64,64.52 |or
'|complete achieved(61049) |or
step
achieve 61049
next "HORDE_MECHANICAL_BATTLER_NOT_FINISHED" |only if not achieved(61049)
]])
GoatQuest:RegisterGuide("Achievement Guides\\Pet Battles\\Classic (1-60)\\Undead Battler of Kalimdor",{
patch='120000',
author="Original guide team",
description="This will guide you through accomplishing the Undead Battler of Kalimdor achievement.",
achieveid={61050},
startlevel=10,
},[[
step
Defeat the battle pet trainers of Kalimdor with a team of all level 25 {y}undead{} pets.
|tip These achievement quests are dailies.
|tip You will be able to complete one family achievement per day.
|tip If you haven't completed the achievement, this guide will start over.
confirm
step
label "HORDE_UNDEAD_BATTLER_NOT_FINISHED"
talk Zunta##66126
accept Zunta##31818 |goto Durotar/0 43.86,28.86 |or
'|complete achieved(61050) |or
step
talk Zunta##66126
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41403
|tip Defeat him with a team of level 25 {y}undead{} pets.
Defeat Zunta |q 31818/1 |goto Durotar/0 43.86,28.86 |or
'|complete achieved(61050) |or
step
talk Zunta##66126
turnin Zunta##31818 |goto Durotar/0 43.86,28.86 |or
'|complete achieved(61050) |or
step
talk Dagra the Fierce##66135
accept Dagra the Fierce##31819 |goto Northern Barrens/0 58.61,53.04 |or
'|complete achieved(61050) |or
step
talk Dagra the Fierce##66135
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41182
|tip Defeat her with a team of level 25 {b}undead{} pets.
Defeat Dagra the Fierce |q 31819/1 |goto Northern Barrens/0 58.61,53.04 |or
'|complete achieved(61050) |or
step
talk Dagra the Fierce##66135
turnin Dagra the Fierce##31819 |goto Northern Barrens/0 58.61,53.04 |or
'|complete achieved(61050) |or
step
talk Grazzle the Great##66436
accept Grazzle the Great##31905 |goto Dustwallow Marsh/0 53.85,74.88 |or
'|complete achieved(61050) |or
step
talk Grazzle the Great##66436
Select _"Let's rumble!"_ |gossip 41246
|tip Defeat him with a team of level 25 {b}undead{} pets.
Defeat Grazzle the Great |q 31905/1 |goto Dustwallow Marsh/0 53.85,74.88 |or
'|complete achieved(61050) |or
step
talk Grazzle the Great##66436
turnin Grazzle the Great##31905 |goto Dustwallow Marsh/0 53.85,74.88 |or
'|complete achieved(61050) |or
step
talk Kela Grimtotem##66452
|tip Atop the pillar.
accept Kela Grimtotem##31906 |goto Thousand Needles/0 31.88,32.93 |or
'|complete achieved(61050) |or
step
talk Kela Grimtotem##66452
Select _"Let's rumble!"_ |gossip 41248
|tip Defeat her with a team of level 25 {b}undead{} pets.
Defeat Kela Grimtotem |q 31906/1 |goto Thousand Needles/0 31.88,32.93 |or
'|complete achieved(61050) |or
step
talk Kela Grimtotem##66452
turnin Kela Grimtotem##31906 |goto Thousand Needles/0 31.88,32.93 |or
'|complete achieved(61050) |or
step
talk Cassandra Kaboom##66422
accept Cassandra Kaboom##31904 |goto Southern Barrens/0 39.59,79.14 |or
'|complete achieved(61050) |or
step
talk Cassandra Kaboom##66422
Select _"Let's rumble!"_ |gossip 41260
|tip Defeat her with a team of level 25 {b}undead{} pets.
Defeat Cassandra Kaboom |q 31904/1 |goto Southern Barrens/0 39.59,79.14 |or
'|complete achieved(61050) |or
step
talk Cassandra Kaboom##66422
turnin Cassandra Kaboom##31904 |goto Southern Barrens/0 39.59,79.14 |or
'|complete achieved(61050) |or
step
talk Traitor Gluk##66352
accept Traitor Gluk##31871 |goto Feralas/0 59.75,49.64 |or
'|complete achieved(61050) |or
step
talk Traitor Gluk##66352
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41017
|tip Defeat him with a team of level 25 {b}undead{} pets.
Defeat Traitor Gluk |q 31871/1 |goto Feralas/0 59.75,49.64 |or
'|complete achieved(61050) |or
step
talk Traitor Gluk##66352
turnin Traitor Gluk##31871 |goto Feralas/0 59.75,49.64 |or
'|complete achieved(61050) |or
step
talk Merda Stronghoof##66372
accept Merda Stronghoof##31872 |goto Desolace/0 57.11,45.69 |or
'|complete achieved(61050) |or
step
talk Merda Stronghoof##66372
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41022
|tip Defeat her with a team of level 25 {b}undead{} pets.
Defeat Merda Stronghoof |q 31872/1 |goto Desolace/0 57.11,45.69 |or
'|complete achieved(61050) |or
step
talk Merda Stronghoof##66372
turnin Merda Stronghoof##31872 |goto Desolace/0 57.11,45.69 |or
'|complete achieved(61050) |or
step
talk Zonya the Sadist##66137
accept Zonya the Sadist##31862 |goto Stonetalon Mountains/0 59.66,71.58 |or
'|complete achieved(61050) |or
step
talk Zonya the Sadist##66137
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 40812
|tip Defeat her with a team of level 25 {b}undead{} pets.
Defeat Zonya the Sadist |q 31862/1 |goto Stonetalon Mountains/0 59.66,71.58 |or
'|complete achieved(61050) |or
step
talk Zonya the Sadist##66137
turnin Zonya the Sadist##31862 |goto Stonetalon Mountains/0 59.66,71.58 |or
'|complete achieved(61050) |or
step
talk Analynn##66136
accept Analynn##31814 |goto Ashenvale/0 20.20,29.55 |or
'|complete achieved(61050) |or
step
talk Analynn##66136
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 40736
|tip Defeat her with a team of level 25 {b}undead{} pets.
Defeat Zonya the Sadist |q 31862/1 |goto Ashenvale/0 20.20,29.55 |or
'|complete achieved(61050) |or
step
talk Analynn##66136
turnin Analynn##31814 |goto Ashenvale/0 20.20,29.55
achieve 61050/3 |or
'|complete achieved(61050) |or
step
talk Zoltan##66442
accept Zoltan##31907 |goto Felwood/0 39.95,56.57 |or
'|complete achieved(61050) |or
step
talk Zoltan##66442
Select _"Let's rumble!"_ |gossip 41250
|tip Defeat him with a team of level 25 {b}undead{} pets.
Defeat Zoltan |q 31907/1 |goto Felwood/0 39.95,56.57 |or
'|complete achieved(61050) |or
step
talk Zoltan##66442
turnin Zoltan##31907 |goto Felwood/0 39.95,56.57 |or
'|complete achieved(61050) |or
step
talk Elena Flutterfly##66412
accept Elena Flutterfly##31908 |goto Moonglade/0 46.13,60.27 |or
'|complete achieved(61050) |or
step
talk Elena Flutterfly##66412
Select _"Let's rumble!"_ |gossip 41258
|tip Defeat her with a team of level 25 {b}undead{} pets.
Defeat Elena Flutterfly |q 31908/1 |goto Moonglade/0 46.13,60.27 |or
'|complete achieved(61050) |or
step
talk Elena Flutterfly##66412
turnin Elena Flutterfly##31908 |goto Moonglade/0 46.13,60.27 |or
'|complete achieved(61050) |or
step
talk Stone Cold Trixxy##66466
accept Grand Master Trixxy##31909 |goto Winterspring/0 65.64,64.52 |or
'|complete achieved(61050) |or
step
talk Stone Cold Trixxy##66466
Select _"Let's rumble!"_ |gossip 41411
|tip Defeat her with a team of level 25 {b}undead{} pets.
Defeat Stone Cold Trixxy |q 31909/1 |goto Winterspring/0 65.64,64.52 |or
'|complete achieved(61050) |or
step
talk Stone Cold Trixxy##66466
turnin Grand Master Trixxy##31909 |goto Winterspring/0 65.64,64.52
step
achieve 61050
next "HORDE_UNDEAD_BATTLER_NOT_FINISHED" |only if not achieved(61050)
]])
GoatQuest:RegisterGuide("Achievement Guides\\Pet Battles\\Classic (1-60)\\Family Battler of Kalimdor",{
patch='120000',
author="Original guide team",
description="This will guide you through accomplishing the Family Battler of Kalimdor achievement.",
achieveid={61051},
startlevel=10,
},[[
step
Complete One of The Following Guides Per Day
|tip These are all daily quests.
|tip Use all level 25 pet teams at full health.
confirm
step
loadguide "Achievement Guides\\Pet Battles\\Classic (1-60)\\Aquatic Battler of Kalimdor" |only if not achieved(61041)
loadguide "Achievement Guides\\Pet Battles\\Classic (1-60)\\Beast Battler of Kalimdor" |only if not achieved(61042)
loadguide "Achievement Guides\\Pet Battles\\Classic (1-60)\\Critter Battler of Kalimdor" |only if not achieved(61043)
loadguide "Achievement Guides\\Pet Battles\\Classic (1-60)\\Dragonkin Battler of Kalimdor" |only if not achieved(61044)
loadguide "Achievement Guides\\Pet Battles\\Classic (1-60)\\Elemental Battler of Kalimdor" |only if not achieved(61045)
loadguide "Achievement Guides\\Pet Battles\\Classic (1-60)\\Flying Battler of Kalimdor" |only if not achieved(61046)
loadguide "Achievement Guides\\Pet Battles\\Classic (1-60)\\Humanoid Battler of Kalimdor" |only if not achieved(61047)
loadguide "Achievement Guides\\Pet Battles\\Classic (1-60)\\Magic Battler of Kalimdor" |only if not achieved(61048)
loadguide "Achievement Guides\\Pet Battles\\Classic (1-60)\\Mechanical Battler of Kalimdor" |only if not achieved(61049)
loadguide "Achievement Guides\\Pet Battles\\Classic (1-60)\\Undead Battler of Kalimdor" |only if not achieved(61050)
achieve 61051
]])
