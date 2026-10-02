local GoatQuest=GoatQuest
if not GoatQuest then return end
if UnitFactionGroup("player")~="Alliance" then return end
if GQ:DoMutex("AchievementsAMID") then return end
GoatQuest.GuideMenuTier = "SHA"
GoatQuest:RegisterGuide("Achievement Guides\\Pet Battles\\Classic (1-60)\\Aquatic Battler of Eastern Kingdoms",{
patch='120000',
author="Original guide team",
description="This will guide you through accomplishing the Aquatic Battler of Eastern Kingdoms achievement.",
achieveid={61029},
startlevel=10,
},[[
step
Defeat the battle pet trainers of Eastern Kingdoms with a team of all level 25 {b}aquatic{} pets.
|tip These achievement quests are dailies.
|tip You will be able to complete one family achievement per day.
|tip If you haven't completed the achievement, this guide will start over.
confirm
step
label "ALLIANCE_AQUATIC_BATTLER_NOT_FINISHED"
talk Old MacDonald##65648
accept Old MacDonald##31780 |goto Westfall/0 60.85,18.49 |or
'|complete achieved(61029) |or
step
talk Old MacDonald##65648
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41437
|tip Defeat him with a team of level 25 {y}aquatic{} pets.
Defeat Old MacDonald |q 31780/1 |goto Westfall/0 60.85,18.49 |or
'|complete achieved(61029) |or
step
Click the Complete Quest Box:
turnin Old MacDonald##31780 |or
'|complete achieved(61029) |or
step
talk Julia Stevens##64330
accept Julia Stevens##31693 |goto Elwynn Forest/0 41.66,83.67 |or
'|complete achieved(61029) |or
step
talk Julia Stevens##64330
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 40127
|tip Defeat her with a team of level 25 {y}aquatic{} pets.
Defeat Julia Stevens |q 31693/1 |goto Elwynn Forest/0 41.66,83.67 |or
'|complete achieved(61029) |or
step
talk Julia Stevens##64330
turnin Julia Stevens##31693 |goto Elwynn Forest/0 41.66,83.67 |or
'|complete achieved(61029) |or
step
talk Eric Davidson##65655
accept Eric Davidson##31850 |goto Duskwood/0 19.87,44.62 |or
'|complete achieved(61029) |or
step
talk Eric Davidson##65655
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41186
|tip Defeat him with a team of level 25 {y}aquatic{} pets.
Defeat Eric Davidson |q 31850/1 |goto Duskwood/0 19.87,44.62 |or
'|complete achieved(61029) |or
step
talk Eric Davidson##65655
turnin Eric Davidson##31850 |goto Duskwood/0 19.87,44.62 |or
'|complete achieved(61029) |or
step
talk Steven Lisbane##63194
accept Steven Lisbane##31852 |goto Northern Stranglethorn/0 46.00,40.45 |or
'|complete achieved(61029) |or
step
talk Steven Lisbane##63194
Select _"Let's rumble!"_ |gossip 39601
|tip Defeat him with a team of level 25 {y}aquatic{} pets.
Defeat Steven Lisbane |q 31852/1 |goto Northern Stranglethorn/0 46.00,40.45 |or
'|complete achieved(61029) |or
step
talk Steven Lisbane##63194
turnin Steven Lisbane##31852 |goto Northern Stranglethorn/0 46.00,40.45 |or
'|complete achieved(61029) |or
step
talk Bill Buckler##65656
accept Bill Buckler##31851 |goto The Cape of Stranglethorn/0 51.47,73.39 |or
'|complete achieved(61029) |or
step
talk Bill Buckler##65656
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41216
|tip Defeat him with a team of level 25 {y}aquatic{} pets.
Defeat Bill Buckler |q 31851/1 |goto The Cape of Stranglethorn/0 51.47,73.39 |or
'|complete achieved(61029) |or
step
talk Bill Buckler##65656
turnin Bill Buckler##31851 |goto The Cape of Stranglethorn/0 51.47,73.39 |or
'|complete achieved(61029) |or
step
talk Lydia Accoste##66522
accept Grand Master Lydia Accost##31916 |goto Deadwind Pass/0 40.04,76.46 |or
'|complete achieved(61029) |or
step
talk Lydia Accoste##66522
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41781
|tip Defeat her with a team of level 25 {y}aquatic{} pets.
Defeat Lydia Accoste |q 31916/1 |goto Deadwind Pass/0 40.04,76.46 |or
'|complete achieved(61029) |or
step
talk Lydia Accoste##66522
turnin Grand Master Lydia Accoste##31916 |goto Deadwind Pass/0 40.04,76.46 |or
'|complete achieved(61029) |or
step
talk Everessa##66518
accept Everessa##31913 |goto Swamp of Sorrows/0 76.82,41.50 |or
'|complete achieved(61029) |or
step
talk Everessa##66518
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41777
|tip Defeat her with a team of level 25 {y}aquatic{} pets.
Defeat Everessa |q 31913/1 |goto Swamp of Sorrows/0 76.82,41.50 |or
'|complete achieved(61029) |or
step
talk Everessa##66518
turnin Everessa##31913 |goto Swamp of Sorrows/0 76.82,41.50 |or
'|complete achieved(61029) |or
step
talk Lindsay##65651
accept Lindsay##31781 |goto Redridge Mountains/0 33.30,52.57 |or
'|complete achieved(61029) |or
step
talk Lindsay##65651
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41184
|tip Defeat her with a team of level 25 {y}aquatic{} pets.
Defeat Lindsay |q 31781/1 |goto Redridge Mountains/0 33.30,52.57 |or
'|complete achieved(61029) |or
step
Click the Complete Quest Box:
turnin Lindsay##31781 |or
'|complete achieved(61029) |or
step
talk Durin Darkhammer##66520
accept Durin Darkhammer##31914 |goto Burning Steppes/0 25.54,47.51 |or
'|complete achieved(61029) |or
step
talk Durin Darkhammer##66520
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41779
|tip Defeat her with a team of level 25 {y}aquatic{} pets.
Defeat Durin Darkhammer |q 31914/1 |goto Burning Steppes/0 25.54,47.51 |or
'|complete achieved(61029) |or
step
talk Durin Darkhammer##66520
turnin Durin Darkhammer##31914 |goto Burning Steppes/0 25.54,47.51 |or
'|complete achieved(61029) |or
step
talk Kortas Darkhammer##66515
accept Kortas Darkhammer##31912 |goto Searing Gorge/0 35.31,27.76 |or
'|complete achieved(61029) |or
step
talk Kortas Darkhammer##66515
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41417
|tip Defeat her with a team of level 25 {y}aquatic{} pets.
Defeat Kortas Darkhammer |q 31912/1 |goto Searing Gorge/0 35.31,27.76 |or
'|complete achieved(61029) |or
step
talk Kortas Darkhammer##66515
turnin Kortas Darkhammer##31912 |goto Searing Gorge/0 35.31,27.76 |or
'|complete achieved(61029) |or
step
talk David Kosse##66478
accept David Kosse##31910 |goto The Hinterlands/0 62.98,54.59 |or
'|complete achieved(61029) |or
step
talk David Kosse##66478
Select _"Let's rumble!"_ |gossip 41413
|tip Defeat her with a team of level 25 {y}aquatic{} pets.
Defeat David Kosse |q 31910/1 |goto The Hinterlands/0 62.78,54.83 |or
'|complete achieved(61029) |or
step
talk David Kosse##66478
turnin David Kosse##31910 |goto The Hinterlands/0 62.98,54.59 |or
'|complete achieved(61029) |or
step
talk Deiza Plaguehorn##66512
accept Deiza Plaguehorn##31911 |goto Eastern Plaguelands/0 66.49,56.84 |or
'|complete achieved(61029) |or
step
talk Deiza Plaguehorn##66512
Select _"Let's rumble!"_ |gossip 41415
|tip Defeat her with a team of level 25 {y}aquatic{} pets.
Defeat Deiza Plaguehorn |q 31911/1 |goto Eastern Plaguelands/0 66.67,57.10 |or
'|complete achieved(61029) |or
step
talk Deiza Plaguehorn##66512
turnin Deiza Plaguehorn##31911 |goto Eastern Plaguelands/0 66.49,56.84 |or
'|complete achieved(61029) |or
step
achieve 61029
next "ALLIANCE_AQUATIC_BATTLER_NOT_FINISHED" |only if not achieved(61029)
]])
GoatQuest:RegisterGuide("Achievement Guides\\Pet Battles\\Classic (1-60)\\Beast Battler of Eastern Kingdoms",{
patch='120000',
author="Original guide team",
description="This will guide you through accomplishing the Beast Battler of Eastern Kingdoms achievement.",
achieveid={61030},
startlevel=10,
},[[
step
Defeat the battle pet trainers of Eastern Kingdoms with a team of all level 25 {b}beast{} pets.
|tip These achievement quests are dailies.
|tip You will be able to complete one family achievement per day.
|tip If you haven't completed the achievement, this guide will start over.
confirm
step
label "ALLIANCE_BEAST_BATTLER_NOT_FINISHED"
talk Old MacDonald##65648
accept Old MacDonald##31780 |goto Westfall/0 60.85,18.49 |or
'|complete achieved(61030) |or
step
talk Old MacDonald##65648
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41437
|tip Defeat him with a team of level 25 {y}beast{} pets.
Defeat Old MacDonald |q 31780/1 |goto Westfall/0 60.85,18.49 |or
'|complete achieved(61030) |or
step
Click the Complete Quest Box:
turnin Old MacDonald##31780 |or
'|complete achieved(61030) |or
step
talk Julia Stevens##64330
accept Julia Stevens##31693 |goto Elwynn Forest/0 41.66,83.67 |or
'|complete achieved(61030) |or
step
talk Julia Stevens##64330
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 40127
|tip Defeat her with a team of level 25 {y}beast{} pets.
Defeat Julia Stevens |q 31693/1 |goto Elwynn Forest/0 41.66,83.67 |or
'|complete achieved(61030) |or
step
talk Julia Stevens##64330
turnin Julia Stevens##31693 |goto Elwynn Forest/0 41.66,83.67 |or
'|complete achieved(61030) |or
step
talk Eric Davidson##65655
accept Eric Davidson##31850 |goto Duskwood/0 19.87,44.62 |or
'|complete achieved(61030) |or
step
talk Eric Davidson##65655
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41186
|tip Defeat him with a team of level 25 {y}beast{} pets.
Defeat Eric Davidson |q 31850/1 |goto Duskwood/0 19.87,44.62 |or
'|complete achieved(61030) |or
step
talk Eric Davidson##65655
turnin Eric Davidson##31850 |goto Duskwood/0 19.87,44.62 |or
'|complete achieved(61030) |or
step
talk Steven Lisbane##63194
accept Steven Lisbane##31852 |goto Northern Stranglethorn/0 46.00,40.45 |or
'|complete achieved(61030) |or
step
talk Steven Lisbane##63194
Select _"Let's rumble!"_ |gossip 39601
|tip Defeat him with a team of level 25 {y}beast{} pets.
Defeat Steven Lisbane |q 31852/1 |goto Northern Stranglethorn/0 46.00,40.45 |or
'|complete achieved(61030) |or
step
talk Steven Lisbane##63194
turnin Steven Lisbane##31852 |goto Northern Stranglethorn/0 46.00,40.45 |or
'|complete achieved(61030) |or
step
talk Bill Buckler##65656
accept Bill Buckler##31851 |goto The Cape of Stranglethorn/0 51.47,73.39 |or
'|complete achieved(61030) |or
step
talk Bill Buckler##65656
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41216
|tip Defeat him with a team of level 25 {y}beast{} pets.
Defeat Bill Buckler |q 31851/1 |goto The Cape of Stranglethorn/0 51.47,73.39 |or
'|complete achieved(61030) |or
step
talk Bill Buckler##65656
turnin Bill Buckler##31851 |goto The Cape of Stranglethorn/0 51.47,73.39 |or
'|complete achieved(61030) |or
step
talk Lydia Accoste##66522
accept Grand Master Lydia Accost##31916 |goto Deadwind Pass/0 40.04,76.46 |or
'|complete achieved(61030) |or
step
talk Lydia Accoste##66522
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41781
|tip Defeat her with a team of level 25 {y}beast{} pets.
Defeat Lydia Accoste |q 31916/1 |goto Deadwind Pass/0 40.04,76.46 |or
'|complete achieved(61030) |or
step
talk Lydia Accoste##66522
turnin Grand Master Lydia Accoste##31916 |goto Deadwind Pass/0 40.04,76.46 |or
'|complete achieved(61030) |or
step
talk Everessa##66518
accept Everessa##31913 |goto Swamp of Sorrows/0 76.82,41.50 |or
'|complete achieved(61030) |or
step
talk Everessa##66518
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41777
|tip Defeat her with a team of level 25 {y}beast{} pets.
Defeat Everessa |q 31913/1 |goto Swamp of Sorrows/0 76.82,41.50 |or
'|complete achieved(61030) |or
step
talk Everessa##66518
turnin Everessa##31913 |goto Swamp of Sorrows/0 76.82,41.50 |or
'|complete achieved(61030) |or
step
talk Lindsay##65651
accept Lindsay##31781 |goto Redridge Mountains/0 33.30,52.57 |or
'|complete achieved(61030) |or
step
talk Lindsay##65651
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41184
|tip Defeat her with a team of level 25 {y}beast{} pets.
Defeat Lindsay |q 31781/1 |goto Redridge Mountains/0 33.30,52.57 |or
'|complete achieved(61030) |or
step
Click the Complete Quest Box:
turnin Lindsay##31781 |or
'|complete achieved(61030) |or
step
talk Durin Darkhammer##66520
accept Durin Darkhammer##31914 |goto Burning Steppes/0 25.54,47.51 |or
'|complete achieved(61030) |or
step
talk Durin Darkhammer##66520
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41779
|tip Defeat her with a team of level 25 {y}beast{} pets.
Defeat Durin Darkhammer |q 31914/1 |goto Burning Steppes/0 25.54,47.51 |or
'|complete achieved(61030) |or
step
talk Durin Darkhammer##66520
turnin Durin Darkhammer##31914 |goto Burning Steppes/0 25.54,47.51 |or
'|complete achieved(61030) |or
step
talk Kortas Darkhammer##66515
accept Kortas Darkhammer##31912 |goto Searing Gorge/0 35.31,27.76 |or
'|complete achieved(61030) |or
step
talk Kortas Darkhammer##66515
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41417
|tip Defeat her with a team of level 25 {y}beast{} pets.
Defeat Kortas Darkhammer |q 31912/1 |goto Searing Gorge/0 35.31,27.76 |or
'|complete achieved(61030) |or
step
talk Kortas Darkhammer##66515
turnin Kortas Darkhammer##31912 |goto Searing Gorge/0 35.31,27.76 |or
'|complete achieved(61030) |or
step
talk David Kosse##66478
accept David Kosse##31910 |goto The Hinterlands/0 62.98,54.59 |or
'|complete achieved(61030) |or
step
talk David Kosse##66478
Select _"Let's rumble!"_ |gossip 41413
|tip Defeat her with a team of level 25 {y}beast{} pets.
Defeat David Kosse |q 31910/1 |goto The Hinterlands/0 62.78,54.83 |or
'|complete achieved(61030) |or
step
talk David Kosse##66478
turnin David Kosse##31910 |goto The Hinterlands/0 62.98,54.59 |or
'|complete achieved(61030) |or
step
talk Deiza Plaguehorn##66512
accept Deiza Plaguehorn##31911 |goto Eastern Plaguelands/0 66.49,56.84 |or
'|complete achieved(61030) |or
step
talk Deiza Plaguehorn##66512
Select _"Let's rumble!"_ |gossip 41415
|tip Defeat her with a team of level 25 {y}beast{} pets.
Defeat Deiza Plaguehorn |q 31911/1 |goto Eastern Plaguelands/0 66.67,57.10 |or
'|complete achieved(61030) |or
step
talk Deiza Plaguehorn##66512
turnin Deiza Plaguehorn##31911 |goto Eastern Plaguelands/0 66.49,56.84 |or
'|complete achieved(61030) |or
step
achieve 61030
next "ALLIANCE_BEAST_BATTLER_NOT_FINISHED" |only if not achieved(61030)
]])
GoatQuest:RegisterGuide("Achievement Guides\\Pet Battles\\Classic (1-60)\\Critter Battler of Eastern Kingdoms",{
patch='120000',
author="Original guide team",
description="This will guide you through accomplishing the Critter Battler of Eastern Kingdoms achievement.",
achieveid={61031},
startlevel=10,
},[[
step
Defeat the battle pet trainers of Eastern Kingdoms with a team of all level 25 {b}critter{} pets.
|tip These achievement quests are dailies.
|tip You will be able to complete one family achievement per day.
|tip If you haven't completed the achievement, this guide will start over.
confirm
step
label "ALLIANCE_CRITTER_BATTLER_NOT_FINISHED"
talk Old MacDonald##65648
accept Old MacDonald##31780 |goto Westfall/0 60.85,18.49 |or
'|complete achieved(61031) |or
step
talk Old MacDonald##65648
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41437
|tip Defeat him with a team of level 25 {y}critter{} pets.
Defeat Old MacDonald |q 31780/1 |goto Westfall/0 60.85,18.49 |or
'|complete achieved(61031) |or
step
Click the Complete Quest Box:
turnin Old MacDonald##31780 |or
'|complete achieved(61031) |or
step
talk Julia Stevens##64330
accept Julia Stevens##31693 |goto Elwynn Forest/0 41.66,83.67 |or
'|complete achieved(61031) |or
step
talk Julia Stevens##64330
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 40127
|tip Defeat her with a team of level 25 {y}critter{} pets.
Defeat Julia Stevens |q 31693/1 |goto Elwynn Forest/0 41.66,83.67 |or
'|complete achieved(61031) |or
step
talk Julia Stevens##64330
turnin Julia Stevens##31693 |goto Elwynn Forest/0 41.66,83.67 |or
'|complete achieved(61031) |or
step
talk Eric Davidson##65655
accept Eric Davidson##31850 |goto Duskwood/0 19.87,44.62 |or
'|complete achieved(61031) |or
step
talk Eric Davidson##65655
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41186
|tip Defeat him with a team of level 25 {y}critter{} pets.
Defeat Eric Davidson |q 31850/1 |goto Duskwood/0 19.87,44.62 |or
'|complete achieved(61031) |or
step
talk Eric Davidson##65655
turnin Eric Davidson##31850 |goto Duskwood/0 19.87,44.62 |or
'|complete achieved(61031) |or
step
talk Steven Lisbane##63194
accept Steven Lisbane##31852 |goto Northern Stranglethorn/0 46.00,40.45 |or
'|complete achieved(61031) |or
step
talk Steven Lisbane##63194
Select _"Let's rumble!"_ |gossip 39601
|tip Defeat him with a team of level 25 {y}critter{} pets.
Defeat Steven Lisbane |q 31852/1 |goto Northern Stranglethorn/0 46.00,40.45 |or
'|complete achieved(61031) |or
step
talk Steven Lisbane##63194
turnin Steven Lisbane##31852 |goto Northern Stranglethorn/0 46.00,40.45 |or
'|complete achieved(61031) |or
step
talk Bill Buckler##65656
accept Bill Buckler##31851 |goto The Cape of Stranglethorn/0 51.47,73.39 |or
'|complete achieved(61031) |or
step
talk Bill Buckler##65656
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41216
|tip Defeat him with a team of level 25 {y}critter{} pets.
Defeat Bill Buckler |q 31851/1 |goto The Cape of Stranglethorn/0 51.47,73.39 |or
'|complete achieved(61031) |or
step
talk Bill Buckler##65656
turnin Bill Buckler##31851 |goto The Cape of Stranglethorn/0 51.47,73.39 |or
'|complete achieved(61031) |or
step
talk Lydia Accoste##66522
accept Grand Master Lydia Accost##31916 |goto Deadwind Pass/0 40.04,76.46 |or
'|complete achieved(61031) |or
step
talk Lydia Accoste##66522
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41781
|tip Defeat her with a team of level 25 {y}critter{} pets.
Defeat Lydia Accoste |q 31916/1 |goto Deadwind Pass/0 40.04,76.46 |or
'|complete achieved(61031) |or
step
talk Lydia Accoste##66522
turnin Grand Master Lydia Accoste##31916 |goto Deadwind Pass/0 40.04,76.46 |or
'|complete achieved(61031) |or
step
talk Everessa##66518
accept Everessa##31913 |goto Swamp of Sorrows/0 76.82,41.50 |or
'|complete achieved(61031) |or
step
talk Everessa##66518
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41777
|tip Defeat her with a team of level 25 {y}critter{} pets.
Defeat Everessa |q 31913/1 |goto Swamp of Sorrows/0 76.82,41.50 |or
'|complete achieved(61031) |or
step
talk Everessa##66518
turnin Everessa##31913 |goto Swamp of Sorrows/0 76.82,41.50 |or
'|complete achieved(61031) |or
step
talk Lindsay##65651
accept Lindsay##31781 |goto Redridge Mountains/0 33.30,52.57 |or
'|complete achieved(61031) |or
step
talk Lindsay##65651
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41184
|tip Defeat her with a team of level 25 {y}critter{} pets.
Defeat Lindsay |q 31781/1 |goto Redridge Mountains/0 33.30,52.57 |or
'|complete achieved(61031) |or
step
Click the Complete Quest Box:
turnin Lindsay##31781 |or
'|complete achieved(61031) |or
step
talk Durin Darkhammer##66520
accept Durin Darkhammer##31914 |goto Burning Steppes/0 25.54,47.51 |or
'|complete achieved(61031) |or
step
talk Durin Darkhammer##66520
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41779
|tip Defeat her with a team of level 25 {y}critter{} pets.
Defeat Durin Darkhammer |q 31914/1 |goto Burning Steppes/0 25.54,47.51 |or
'|complete achieved(61031) |or
step
talk Durin Darkhammer##66520
turnin Durin Darkhammer##31914 |goto Burning Steppes/0 25.54,47.51 |or
'|complete achieved(61031) |or
step
talk Kortas Darkhammer##66515
accept Kortas Darkhammer##31912 |goto Searing Gorge/0 35.31,27.76 |or
'|complete achieved(61031) |or
step
talk Kortas Darkhammer##66515
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41417
|tip Defeat her with a team of level 25 {y}critter{} pets.
Defeat Kortas Darkhammer |q 31912/1 |goto Searing Gorge/0 35.31,27.76 |or
'|complete achieved(61031) |or
step
talk Kortas Darkhammer##66515
turnin Kortas Darkhammer##31912 |goto Searing Gorge/0 35.31,27.76 |or
'|complete achieved(61031) |or
step
talk David Kosse##66478
accept David Kosse##31910 |goto The Hinterlands/0 62.98,54.59 |or
'|complete achieved(61031) |or
step
talk David Kosse##66478
Select _"Let's rumble!"_ |gossip 41413
|tip Defeat her with a team of level 25 {y}critter{} pets.
Defeat David Kosse |q 31910/1 |goto The Hinterlands/0 62.78,54.83 |or
'|complete achieved(61031) |or
step
talk David Kosse##66478
turnin David Kosse##31910 |goto The Hinterlands/0 62.98,54.59 |or
'|complete achieved(61031) |or
step
talk Deiza Plaguehorn##66512
accept Deiza Plaguehorn##31911 |goto Eastern Plaguelands/0 66.49,56.84 |or
'|complete achieved(61031) |or
step
talk Deiza Plaguehorn##66512
Select _"Let's rumble!"_ |gossip 41415
|tip Defeat her with a team of level 25 {y}critter{} pets.
Defeat Deiza Plaguehorn |q 31911/1 |goto Eastern Plaguelands/0 66.67,57.10 |or
'|complete achieved(61031) |or
step
talk Deiza Plaguehorn##66512
turnin Deiza Plaguehorn##31911 |goto Eastern Plaguelands/0 66.49,56.84 |or
'|complete achieved(61031) |or
step
achieve 61031
next "ALLIANCE_CRITTER_BATTLER_NOT_FINISHED" |only if not achieved(61031)
]])
GoatQuest:RegisterGuide("Achievement Guides\\Pet Battles\\Classic (1-60)\\Dragonkin Battler of Eastern Kingdoms",{
patch='120000',
author="Original guide team",
description="This will guide you through accomplishing the Dragonkin Battler of Eastern Kingdoms achievement.",
achieveid={61032},
startlevel=10,
},[[
step
Defeat the battle pet trainers of Eastern Kingdoms with a team of all level 25 {b}dragonkin{} pets.
|tip These achievement quests are dailies.
|tip You will be able to complete one family achievement per day.
|tip If you haven't completed the achievement, this guide will start over.
confirm
step
label "ALLIANCE_DRAGONKIN_BATTLER_NOT_FINISHED"
talk Old MacDonald##65648
accept Old MacDonald##31780 |goto Westfall/0 60.85,18.49 |or
'|complete achieved(61032) |or
step
talk Old MacDonald##65648
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41437
|tip Defeat him with a team of level 25 {y}dragonkin{} pets.
Defeat Old MacDonald |q 31780/1 |goto Westfall/0 60.85,18.49 |or
'|complete achieved(61032) |or
step
Click the Complete Quest Box:
turnin Old MacDonald##31780 |or
'|complete achieved(61032) |or
step
talk Julia Stevens##64330
accept Julia Stevens##31693 |goto Elwynn Forest/0 41.66,83.67 |or
'|complete achieved(61032) |or
step
talk Julia Stevens##64330
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 40127
|tip Defeat her with a team of level 25 {y}dragonkin{} pets.
Defeat Julia Stevens |q 31693/1 |goto Elwynn Forest/0 41.66,83.67 |or
'|complete achieved(61032) |or
step
talk Julia Stevens##64330
turnin Julia Stevens##31693 |goto Elwynn Forest/0 41.66,83.67 |or
'|complete achieved(61032) |or
step
talk Eric Davidson##65655
accept Eric Davidson##31850 |goto Duskwood/0 19.87,44.62 |or
'|complete achieved(61032) |or
step
talk Eric Davidson##65655
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41186
|tip Defeat him with a team of level 25 {y}dragonkin{} pets.
Defeat Eric Davidson |q 31850/1 |goto Duskwood/0 19.87,44.62 |or
'|complete achieved(61032) |or
step
talk Eric Davidson##65655
turnin Eric Davidson##31850 |goto Duskwood/0 19.87,44.62 |or
'|complete achieved(61032) |or
step
talk Steven Lisbane##63194
accept Steven Lisbane##31852 |goto Northern Stranglethorn/0 46.00,40.45 |or
'|complete achieved(61032) |or
step
talk Steven Lisbane##63194
Select _"Let's rumble!"_ |gossip 39601
|tip Defeat him with a team of level 25 {y}dragonkin{} pets.
Defeat Steven Lisbane |q 31852/1 |goto Northern Stranglethorn/0 46.00,40.45 |or
'|complete achieved(61032) |or
step
talk Steven Lisbane##63194
turnin Steven Lisbane##31852 |goto Northern Stranglethorn/0 46.00,40.45 |or
'|complete achieved(61032) |or
step
talk Bill Buckler##65656
accept Bill Buckler##31851 |goto The Cape of Stranglethorn/0 51.47,73.39 |or
'|complete achieved(61032) |or
step
talk Bill Buckler##65656
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41216
|tip Defeat him with a team of level 25 {y}dragonkin{} pets.
Defeat Bill Buckler |q 31851/1 |goto The Cape of Stranglethorn/0 51.47,73.39 |or
'|complete achieved(61032) |or
step
talk Bill Buckler##65656
turnin Bill Buckler##31851 |goto The Cape of Stranglethorn/0 51.47,73.39 |or
'|complete achieved(61032) |or
step
talk Lydia Accoste##66522
accept Grand Master Lydia Accost##31916 |goto Deadwind Pass/0 40.04,76.46 |or
'|complete achieved(61032) |or
step
talk Lydia Accoste##66522
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41781
|tip Defeat her with a team of level 25 {y}dragonkin{} pets.
Defeat Lydia Accoste |q 31916/1 |goto Deadwind Pass/0 40.04,76.46 |or
'|complete achieved(61032) |or
step
talk Lydia Accoste##66522
turnin Grand Master Lydia Accoste##31916 |goto Deadwind Pass/0 40.04,76.46 |or
'|complete achieved(61032) |or
step
talk Everessa##66518
accept Everessa##31913 |goto Swamp of Sorrows/0 76.82,41.50 |or
'|complete achieved(61032) |or
step
talk Everessa##66518
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41777
|tip Defeat her with a team of level 25 {y}dragonkin{} pets.
Defeat Everessa |q 31913/1 |goto Swamp of Sorrows/0 76.82,41.50 |or
'|complete achieved(61032) |or
step
talk Everessa##66518
turnin Everessa##31913 |goto Swamp of Sorrows/0 76.82,41.50 |or
'|complete achieved(61032) |or
step
talk Lindsay##65651
accept Lindsay##31781 |goto Redridge Mountains/0 33.30,52.57 |or
'|complete achieved(61032) |or
step
talk Lindsay##65651
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41184
|tip Defeat her with a team of level 25 {y}dragonkin{} pets.
Defeat Lindsay |q 31781/1 |goto Redridge Mountains/0 33.30,52.57 |or
'|complete achieved(61032) |or
step
Click the Complete Quest Box:
turnin Lindsay##31781 |or
'|complete achieved(61032) |or
step
talk Durin Darkhammer##66520
accept Durin Darkhammer##31914 |goto Burning Steppes/0 25.54,47.51 |or
'|complete achieved(61032) |or
step
talk Durin Darkhammer##66520
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41779
|tip Defeat her with a team of level 25 {y}dragonkin{} pets.
Defeat Durin Darkhammer |q 31914/1 |goto Burning Steppes/0 25.54,47.51 |or
'|complete achieved(61032) |or
step
talk Durin Darkhammer##66520
turnin Durin Darkhammer##31914 |goto Burning Steppes/0 25.54,47.51 |or
'|complete achieved(61032) |or
step
talk Kortas Darkhammer##66515
accept Kortas Darkhammer##31912 |goto Searing Gorge/0 35.31,27.76 |or
'|complete achieved(61032) |or
step
talk Kortas Darkhammer##66515
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41417
|tip Defeat her with a team of level 25 {y}dragonkin{} pets.
Defeat Kortas Darkhammer |q 31912/1 |goto Searing Gorge/0 35.31,27.76 |or
'|complete achieved(61032) |or
step
talk Kortas Darkhammer##66515
turnin Kortas Darkhammer##31912 |goto Searing Gorge/0 35.31,27.76 |or
'|complete achieved(61032) |or
step
talk David Kosse##66478
accept David Kosse##31910 |goto The Hinterlands/0 62.98,54.59 |or
'|complete achieved(61032) |or
step
talk David Kosse##66478
Select _"Let's rumble!"_ |gossip 41413
|tip Defeat her with a team of level 25 {y}dragonkin{} pets.
Defeat David Kosse |q 31910/1 |goto The Hinterlands/0 62.78,54.83 |or
'|complete achieved(61032) |or
step
talk David Kosse##66478
turnin David Kosse##31910 |goto The Hinterlands/0 62.98,54.59 |or
'|complete achieved(61032) |or
step
talk Deiza Plaguehorn##66512
accept Deiza Plaguehorn##31911 |goto Eastern Plaguelands/0 66.49,56.84 |or
'|complete achieved(61032) |or
step
talk Deiza Plaguehorn##66512
Select _"Let's rumble!"_ |gossip 41415
|tip Defeat her with a team of level 25 {y}dragonkin{} pets.
Defeat Deiza Plaguehorn |q 31911/1 |goto Eastern Plaguelands/0 66.67,57.10 |or
'|complete achieved(61032) |or
step
talk Deiza Plaguehorn##66512
turnin Deiza Plaguehorn##31911 |goto Eastern Plaguelands/0 66.49,56.84 |or
'|complete achieved(61032) |or
step
achieve 61032
next "ALLIANCE_DRAGONKIN_BATTLER_NOT_FINISHED" |only if not achieved(61032)
]])
GoatQuest:RegisterGuide("Achievement Guides\\Pet Battles\\Classic (1-60)\\Elemental Battler of Eastern Kingdoms",{
patch='120000',
author="Original guide team",
description="This will guide you through accomplishing the Elemental Battler of Eastern Kingdoms achievement.",
achieveid={61033},
startlevel=10,
},[[
step
Defeat the battle pet trainers of Eastern Kingdoms with a team of all level 25 {b}elemental{} pets.
|tip These achievement quests are dailies.
|tip You will be able to complete one family achievement per day.
|tip If you haven't completed the achievement, this guide will start over.
confirm
step
label "ALLIANCE_ELEMENTAL_BATTLER_NOT_FINISHED"
talk Old MacDonald##65648
accept Old MacDonald##31780 |goto Westfall/0 60.85,18.49 |or
'|complete achieved(61033) |or
step
talk Old MacDonald##65648
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41437
|tip Defeat him with a team of level 25 {y}elemental{} pets.
Defeat Old MacDonald |q 31780/1 |goto Westfall/0 60.85,18.49 |or
'|complete achieved(61033) |or
step
Click the Complete Quest Box:
turnin Old MacDonald##31780 |or
'|complete achieved(61033) |or
step
talk Julia Stevens##64330
accept Julia Stevens##31693 |goto Elwynn Forest/0 41.66,83.67 |or
'|complete achieved(61033) |or
step
talk Julia Stevens##64330
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 40127
|tip Defeat her with a team of level 25 {y}elemental{} pets.
Defeat Julia Stevens |q 31693/1 |goto Elwynn Forest/0 41.66,83.67 |or
'|complete achieved(61033) |or
step
talk Julia Stevens##64330
turnin Julia Stevens##31693 |goto Elwynn Forest/0 41.66,83.67 |or
'|complete achieved(61033) |or
step
talk Eric Davidson##65655
accept Eric Davidson##31850 |goto Duskwood/0 19.87,44.62 |or
'|complete achieved(61033) |or
step
talk Eric Davidson##65655
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41186
|tip Defeat him with a team of level 25 {y}elemental{} pets.
Defeat Eric Davidson |q 31850/1 |goto Duskwood/0 19.87,44.62 |or
'|complete achieved(61033) |or
step
talk Eric Davidson##65655
turnin Eric Davidson##31850 |goto Duskwood/0 19.87,44.62 |or
'|complete achieved(61033) |or
step
talk Steven Lisbane##63194
accept Steven Lisbane##31852 |goto Northern Stranglethorn/0 46.00,40.45 |or
'|complete achieved(61033) |or
step
talk Steven Lisbane##63194
Select _"Let's rumble!"_ |gossip 39601
|tip Defeat him with a team of level 25 {y}elemental{} pets.
Defeat Steven Lisbane |q 31852/1 |goto Northern Stranglethorn/0 46.00,40.45 |or
'|complete achieved(61033) |or
step
talk Steven Lisbane##63194
turnin Steven Lisbane##31852 |goto Northern Stranglethorn/0 46.00,40.45 |or
'|complete achieved(61033) |or
step
talk Bill Buckler##65656
accept Bill Buckler##31851 |goto The Cape of Stranglethorn/0 51.47,73.39 |or
'|complete achieved(61033) |or
step
talk Bill Buckler##65656
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41216
|tip Defeat him with a team of level 25 {y}elemental{} pets.
Defeat Bill Buckler |q 31851/1 |goto The Cape of Stranglethorn/0 51.47,73.39 |or
'|complete achieved(61033) |or
step
talk Bill Buckler##65656
turnin Bill Buckler##31851 |goto The Cape of Stranglethorn/0 51.47,73.39 |or
'|complete achieved(61033) |or
step
talk Lydia Accoste##66522
accept Grand Master Lydia Accost##31916 |goto Deadwind Pass/0 40.04,76.46 |or
'|complete achieved(61033) |or
step
talk Lydia Accoste##66522
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41781
|tip Defeat her with a team of level 25 {y}elemental{} pets.
Defeat Lydia Accoste |q 31916/1 |goto Deadwind Pass/0 40.04,76.46 |or
'|complete achieved(61033) |or
step
talk Lydia Accoste##66522
turnin Grand Master Lydia Accoste##31916 |goto Deadwind Pass/0 40.04,76.46 |or
'|complete achieved(61033) |or
step
talk Everessa##66518
accept Everessa##31913 |goto Swamp of Sorrows/0 76.82,41.50 |or
'|complete achieved(61033) |or
step
talk Everessa##66518
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41777
|tip Defeat her with a team of level 25 {y}elemental{} pets.
Defeat Everessa |q 31913/1 |goto Swamp of Sorrows/0 76.82,41.50 |or
'|complete achieved(61033) |or
step
talk Everessa##66518
turnin Everessa##31913 |goto Swamp of Sorrows/0 76.82,41.50 |or
'|complete achieved(61033) |or
step
talk Lindsay##65651
accept Lindsay##31781 |goto Redridge Mountains/0 33.30,52.57 |or
'|complete achieved(61033) |or
step
talk Lindsay##65651
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41184
|tip Defeat her with a team of level 25 {y}elemental{} pets.
Defeat Lindsay |q 31781/1 |goto Redridge Mountains/0 33.30,52.57 |or
'|complete achieved(61033) |or
step
Click the Complete Quest Box:
turnin Lindsay##31781 |or
'|complete achieved(61033) |or
step
talk Durin Darkhammer##66520
accept Durin Darkhammer##31914 |goto Burning Steppes/0 25.54,47.51 |or
'|complete achieved(61033) |or
step
talk Durin Darkhammer##66520
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41779
|tip Defeat her with a team of level 25 {y}elemental{} pets.
Defeat Durin Darkhammer |q 31914/1 |goto Burning Steppes/0 25.54,47.51 |or
'|complete achieved(61033) |or
step
talk Durin Darkhammer##66520
turnin Durin Darkhammer##31914 |goto Burning Steppes/0 25.54,47.51 |or
'|complete achieved(61033) |or
step
talk Kortas Darkhammer##66515
accept Kortas Darkhammer##31912 |goto Searing Gorge/0 35.31,27.76 |or
'|complete achieved(61033) |or
step
talk Kortas Darkhammer##66515
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41417
|tip Defeat her with a team of level 25 {y}elemental{} pets.
Defeat Kortas Darkhammer |q 31912/1 |goto Searing Gorge/0 35.31,27.76 |or
'|complete achieved(61033) |or
step
talk Kortas Darkhammer##66515
turnin Kortas Darkhammer##31912 |goto Searing Gorge/0 35.31,27.76 |or
'|complete achieved(61033) |or
step
talk David Kosse##66478
accept David Kosse##31910 |goto The Hinterlands/0 62.98,54.59 |or
'|complete achieved(61033) |or
step
talk David Kosse##66478
Select _"Let's rumble!"_ |gossip 41413
|tip Defeat her with a team of level 25 {y}elemental{} pets.
Defeat David Kosse |q 31910/1 |goto The Hinterlands/0 62.78,54.83 |or
'|complete achieved(61033) |or
step
talk David Kosse##66478
turnin David Kosse##31910 |goto The Hinterlands/0 62.98,54.59 |or
'|complete achieved(61033) |or
step
talk Deiza Plaguehorn##66512
accept Deiza Plaguehorn##31911 |goto Eastern Plaguelands/0 66.49,56.84 |or
'|complete achieved(61033) |or
step
talk Deiza Plaguehorn##66512
Select _"Let's rumble!"_ |gossip 41415
|tip Defeat her with a team of level 25 {y}elemental{} pets.
Defeat Deiza Plaguehorn |q 31911/1 |goto Eastern Plaguelands/0 66.67,57.10 |or
'|complete achieved(61033) |or
step
talk Deiza Plaguehorn##66512
turnin Deiza Plaguehorn##31911 |goto Eastern Plaguelands/0 66.49,56.84 |or
'|complete achieved(61033) |or
step
achieve 61033
next "ALLIANCE_ELEMENTAL_BATTLER_NOT_FINISHED" |only if not achieved(61033)
]])
GoatQuest:RegisterGuide("Achievement Guides\\Pet Battles\\Classic (1-60)\\Flying Battler of Eastern Kingdoms",{
patch='120000',
author="Original guide team",
description="This will guide you through accomplishing the Flying Battler of Eastern Kingdoms achievement.",
achieveid={61034},
startlevel=10,
},[[
step
Defeat the battle pet trainers of Eastern Kingdoms with a team of all level 25 {b}flying{} pets.
|tip These achievement quests are dailies.
|tip You will be able to complete one family achievement per day.
|tip If you haven't completed the achievement, this guide will start over.
confirm
step
label "ALLIANCE_FLYING_BATTLER_NOT_FINISHED"
talk Old MacDonald##65648
accept Old MacDonald##31780 |goto Westfall/0 60.85,18.49 |or
'|complete achieved(61034) |or
step
talk Old MacDonald##65648
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41437
|tip Defeat him with a team of level 25 {y}flying{} pets.
Defeat Old MacDonald |q 31780/1 |goto Westfall/0 60.85,18.49 |or
'|complete achieved(61034) |or
step
Click the Complete Quest Box:
turnin Old MacDonald##31780 |or
'|complete achieved(61034) |or
step
talk Julia Stevens##64330
accept Julia Stevens##31693 |goto Elwynn Forest/0 41.66,83.67 |or
'|complete achieved(61034) |or
step
talk Julia Stevens##64330
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 40127
|tip Defeat her with a team of level 25 {y}flying{} pets.
Defeat Julia Stevens |q 31693/1 |goto Elwynn Forest/0 41.66,83.67 |or
'|complete achieved(61034) |or
step
talk Julia Stevens##64330
turnin Julia Stevens##31693 |goto Elwynn Forest/0 41.66,83.67 |or
'|complete achieved(61034) |or
step
talk Eric Davidson##65655
accept Eric Davidson##31850 |goto Duskwood/0 19.87,44.62 |or
'|complete achieved(61034) |or
step
talk Eric Davidson##65655
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41186
|tip Defeat him with a team of level 25 {y}flying{} pets.
Defeat Eric Davidson |q 31850/1 |goto Duskwood/0 19.87,44.62 |or
'|complete achieved(61034) |or
step
talk Eric Davidson##65655
turnin Eric Davidson##31850 |goto Duskwood/0 19.87,44.62 |or
'|complete achieved(61034) |or
step
talk Steven Lisbane##63194
accept Steven Lisbane##31852 |goto Northern Stranglethorn/0 46.00,40.45 |or
'|complete achieved(61034) |or
step
talk Steven Lisbane##63194
Select _"Let's rumble!"_ |gossip 39601
|tip Defeat him with a team of level 25 {y}flying{} pets.
Defeat Steven Lisbane |q 31852/1 |goto Northern Stranglethorn/0 46.00,40.45 |or
'|complete achieved(61034) |or
step
talk Steven Lisbane##63194
turnin Steven Lisbane##31852 |goto Northern Stranglethorn/0 46.00,40.45 |or
'|complete achieved(61040) |or
step
talk Bill Buckler##65656
accept Bill Buckler##31851 |goto The Cape of Stranglethorn/0 51.47,73.39 |or
'|complete achieved(61034) |or
step
talk Bill Buckler##65656
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41216
|tip Defeat him with a team of level 25 {y}flying{} pets.
Defeat Bill Buckler |q 31851/1 |goto The Cape of Stranglethorn/0 51.47,73.39 |or
'|complete achieved(61034) |or
step
talk Bill Buckler##65656
turnin Bill Buckler##31851 |goto The Cape of Stranglethorn/0 51.47,73.39 |or
'|complete achieved(61034) |or
step
talk Lydia Accoste##66522
accept Grand Master Lydia Accost##31916 |goto Deadwind Pass/0 40.04,76.46 |or
'|complete achieved(61034) |or
step
talk Lydia Accoste##66522
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41781
|tip Defeat her with a team of level 25 {y}flying{} pets.
Defeat Lydia Accoste |q 31916/1 |goto Deadwind Pass/0 40.04,76.46 |or
'|complete achieved(61034) |or
step
talk Lydia Accoste##66522
turnin Grand Master Lydia Accoste##31916 |goto Deadwind Pass/0 40.04,76.46 |or
'|complete achieved(61034) |or
step
talk Everessa##66518
accept Everessa##31913 |goto Swamp of Sorrows/0 76.82,41.50 |or
'|complete achieved(61034) |or
step
talk Everessa##66518
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41777
|tip Defeat her with a team of level 25 {y}flying{} pets.
Defeat Everessa |q 31913/1 |goto Swamp of Sorrows/0 76.82,41.50 |or
'|complete achieved(61034) |or
step
talk Everessa##66518
turnin Everessa##31913 |goto Swamp of Sorrows/0 76.82,41.50 |or
'|complete achieved(61034) |or
step
talk Lindsay##65651
accept Lindsay##31781 |goto Redridge Mountains/0 33.30,52.57 |or
'|complete achieved(61034) |or
step
talk Lindsay##65651
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41184
|tip Defeat her with a team of level 25 {y}flying{} pets.
Defeat Lindsay |q 31781/1 |goto Redridge Mountains/0 33.30,52.57 |or
'|complete achieved(61034) |or
step
Click the Complete Quest Box:
turnin Lindsay##31781 |or
'|complete achieved(61034) |or
step
talk Durin Darkhammer##66520
accept Durin Darkhammer##31914 |goto Burning Steppes/0 25.54,47.51 |or
'|complete achieved(61034) |or
step
talk Durin Darkhammer##66520
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41779
|tip Defeat her with a team of level 25 {y}flying{} pets.
Defeat Durin Darkhammer |q 31914/1 |goto Burning Steppes/0 25.54,47.51 |or
'|complete achieved(61034) |or
step
talk Durin Darkhammer##66520
turnin Durin Darkhammer##31914 |goto Burning Steppes/0 25.54,47.51 |or
'|complete achieved(61034) |or
step
talk Kortas Darkhammer##66515
accept Kortas Darkhammer##31912 |goto Searing Gorge/0 35.31,27.76 |or
'|complete achieved(61034) |or
step
talk Kortas Darkhammer##66515
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41417
|tip Defeat her with a team of level 25 {y}flying{} pets.
Defeat Kortas Darkhammer |q 31912/1 |goto Searing Gorge/0 35.31,27.76 |or
'|complete achieved(61034) |or
step
talk Kortas Darkhammer##66515
turnin Kortas Darkhammer##31912 |goto Searing Gorge/0 35.31,27.76 |or
'|complete achieved(61034) |or
step
talk David Kosse##66478
accept David Kosse##31910 |goto The Hinterlands/0 62.98,54.59 |or
'|complete achieved(61034) |or
step
talk David Kosse##66478
Select _"Let's rumble!"_ |gossip 41413
|tip Defeat her with a team of level 25 {y}flying{} pets.
Defeat David Kosse |q 31910/1 |goto The Hinterlands/0 62.78,54.83 |or
'|complete achieved(61034) |or
step
talk David Kosse##66478
turnin David Kosse##31910 |goto The Hinterlands/0 62.98,54.59 |or
'|complete achieved(61034) |or
step
talk Deiza Plaguehorn##66512
accept Deiza Plaguehorn##31911 |goto Eastern Plaguelands/0 66.49,56.84 |or
'|complete achieved(61034) |or
step
talk Deiza Plaguehorn##66512
Select _"Let's rumble!"_ |gossip 41415
|tip Defeat her with a team of level 25 {y}flying{} pets.
Defeat Deiza Plaguehorn |q 31911/1 |goto Eastern Plaguelands/0 66.67,57.10 |or
'|complete achieved(61034) |or
step
talk Deiza Plaguehorn##66512
turnin Deiza Plaguehorn##31911 |goto Eastern Plaguelands/0 66.49,56.84 |or
'|complete achieved(61034) |or
step
achieve 61034
next "ALLIANCE_FLYING_BATTLER_NOT_FINISHED" |only if not achieved(61034)
]])
GoatQuest:RegisterGuide("Achievement Guides\\Pet Battles\\Classic (1-60)\\Humanoid Battler of Eastern Kingdoms",{
patch='120000',
author="Original guide team",
description="This will guide you through accomplishing the Humanoid Battler of Eastern Kingdoms achievement.",
achieveid={61035},
startlevel=10,
},[[
step
Defeat the battle pet trainers of Eastern Kingdoms with a team of all level 25 {b}humanoid{} pets.
|tip These achievement quests are dailies.
|tip You will be able to complete one family achievement per day.
|tip If you haven't completed the achievement, this guide will start over.
confirm
step
label "ALLIANCE_HUMANOID_BATTLER_NOT_FINISHED"
talk Old MacDonald##65648
accept Old MacDonald##31780 |goto Westfall/0 60.85,18.49 |or
'|complete achieved(61035) |or
step
talk Old MacDonald##65648
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41437
|tip Defeat him with a team of level 25 {y}humanoid{} pets.
Defeat Old MacDonald |q 31780/1 |goto Westfall/0 60.85,18.49 |or
'|complete achieved(61035) |or
step
Click the Complete Quest Box:
turnin Old MacDonald##31780 |or
'|complete achieved(61035) |or
step
talk Julia Stevens##64330
accept Julia Stevens##31693 |goto Elwynn Forest/0 41.66,83.67 |or
'|complete achieved(61035) |or
step
talk Julia Stevens##64330
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 40127
|tip Defeat her with a team of level 25 {y}humanoid{} pets.
Defeat Julia Stevens |q 31693/1 |goto Elwynn Forest/0 41.66,83.67 |or
'|complete achieved(61035) |or
step
talk Julia Stevens##64330
turnin Julia Stevens##31693 |goto Elwynn Forest/0 41.66,83.67 |or
'|complete achieved(61035) |or
step
talk Eric Davidson##65655
accept Eric Davidson##31850 |goto Duskwood/0 19.87,44.62 |or
'|complete achieved(61035) |or
step
talk Eric Davidson##65655
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41186
|tip Defeat him with a team of level 25 {y}humanoid{} pets.
Defeat Eric Davidson |q 31850/1 |goto Duskwood/0 19.87,44.62 |or
'|complete achieved(61035) |or
step
talk Eric Davidson##65655
turnin Eric Davidson##31850 |goto Duskwood/0 19.87,44.62 |or
'|complete achieved(61035) |or
step
talk Steven Lisbane##63194
accept Steven Lisbane##31852 |goto Northern Stranglethorn/0 46.00,40.45 |or
'|complete achieved(61035) |or
step
talk Steven Lisbane##63194
Select _"Let's rumble!"_ |gossip 39601
|tip Defeat him with a team of level 25 {y}humanoid{} pets.
Defeat Steven Lisbane |q 31852/1 |goto Northern Stranglethorn/0 46.00,40.45 |or
'|complete achieved(61035) |or
step
talk Steven Lisbane##63194
turnin Steven Lisbane##31852 |goto Northern Stranglethorn/0 46.00,40.45 |or
'|complete achieved(61035) |or
step
talk Bill Buckler##65656
accept Bill Buckler##31851 |goto The Cape of Stranglethorn/0 51.47,73.39 |or
'|complete achieved(61035) |or
step
talk Bill Buckler##65656
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41216
|tip Defeat him with a team of level 25 {y}humanoid{} pets.
Defeat Bill Buckler |q 31851/1 |goto The Cape of Stranglethorn/0 51.47,73.39 |or
'|complete achieved(61035) |or
step
talk Bill Buckler##65656
turnin Bill Buckler##31851 |goto The Cape of Stranglethorn/0 51.47,73.39 |or
'|complete achieved(61035) |or
step
talk Lydia Accoste##66522
accept Grand Master Lydia Accost##31916 |goto Deadwind Pass/0 40.04,76.46 |or
'|complete achieved(61035) |or
step
talk Lydia Accoste##66522
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41781
|tip Defeat her with a team of level 25 {y}humanoid{} pets.
Defeat Lydia Accoste |q 31916/1 |goto Deadwind Pass/0 40.04,76.46 |or
'|complete achieved(61035) |or
step
talk Lydia Accoste##66522
turnin Grand Master Lydia Accoste##31916 |goto Deadwind Pass/0 40.04,76.46 |or
'|complete achieved(61035) |or
step
talk Everessa##66518
accept Everessa##31913 |goto Swamp of Sorrows/0 76.82,41.50 |or
'|complete achieved(61035) |or
step
talk Everessa##66518
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41777
|tip Defeat her with a team of level 25 {y}humanoid{} pets.
Defeat Everessa |q 31913/1 |goto Swamp of Sorrows/0 76.82,41.50 |or
'|complete achieved(61035) |or
step
talk Everessa##66518
turnin Everessa##31913 |goto Swamp of Sorrows/0 76.82,41.50 |or
'|complete achieved(61035) |or
step
talk Lindsay##65651
accept Lindsay##31781 |goto Redridge Mountains/0 33.30,52.57 |or
'|complete achieved(61035) |or
step
talk Lindsay##65651
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41184
|tip Defeat her with a team of level 25 {y}humanoid{} pets.
Defeat Lindsay |q 31781/1 |goto Redridge Mountains/0 33.30,52.57 |or
'|complete achieved(61035) |or
step
Click the Complete Quest Box:
turnin Lindsay##31781 |or
'|complete achieved(61035) |or
step
talk Durin Darkhammer##66520
accept Durin Darkhammer##31914 |goto Burning Steppes/0 25.54,47.51 |or
'|complete achieved(61035) |or
step
talk Durin Darkhammer##66520
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41779
|tip Defeat her with a team of level 25 {y}humanoid{} pets.
Defeat Durin Darkhammer |q 31914/1 |goto Burning Steppes/0 25.54,47.51 |or
'|complete achieved(61035) |or
step
talk Durin Darkhammer##66520
turnin Durin Darkhammer##31914 |goto Burning Steppes/0 25.54,47.51 |or
'|complete achieved(61035) |or
step
talk Kortas Darkhammer##66515
accept Kortas Darkhammer##31912 |goto Searing Gorge/0 35.31,27.76 |or
'|complete achieved(61035) |or
step
talk Kortas Darkhammer##66515
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41417
|tip Defeat her with a team of level 25 {y}humanoid{} pets.
Defeat Kortas Darkhammer |q 31912/1 |goto Searing Gorge/0 35.31,27.76 |or
'|complete achieved(61035) |or
step
talk Kortas Darkhammer##66515
turnin Kortas Darkhammer##31912 |goto Searing Gorge/0 35.31,27.76 |or
'|complete achieved(61035) |or
step
talk David Kosse##66478
accept David Kosse##31910 |goto The Hinterlands/0 62.98,54.59 |or
'|complete achieved(61035) |or
step
talk David Kosse##66478
Select _"Let's rumble!"_ |gossip 41413
|tip Defeat her with a team of level 25 {y}humanoid{} pets.
Defeat David Kosse |q 31910/1 |goto The Hinterlands/0 62.78,54.83 |or
'|complete achieved(61035) |or
step
talk David Kosse##66478
turnin David Kosse##31910 |goto The Hinterlands/0 62.98,54.59 |or
'|complete achieved(61035) |or
step
talk Deiza Plaguehorn##66512
accept Deiza Plaguehorn##31911 |goto Eastern Plaguelands/0 66.49,56.84 |or
'|complete achieved(61035) |or
step
talk Deiza Plaguehorn##66512
Select _"Let's rumble!"_ |gossip 41415
|tip Defeat her with a team of level 25 {y}humanoid{} pets.
Defeat Deiza Plaguehorn |q 31911/1 |goto Eastern Plaguelands/0 66.67,57.10 |or
'|complete achieved(61035) |or
step
talk Deiza Plaguehorn##66512
turnin Deiza Plaguehorn##31911 |goto Eastern Plaguelands/0 66.49,56.84 |or
'|complete achieved(61035) |or
step
achieve 61035
next "ALLIANCE_HUMANOID_BATTLER_NOT_FINISHED" |only if not achieved(61035)
]])
GoatQuest:RegisterGuide("Achievement Guides\\Pet Battles\\Classic (1-60)\\Magic Battler of Eastern Kingdoms",{
patch='120000',
author="Original guide team",
description="This will guide you through accomplishing the Magic Battler of Eastern Kingdoms achievement.",
achieveid={61036},
startlevel=10,
},[[
step
Defeat the battle pet trainers of Eastern Kingdoms with a team of all level 25 {b}magic{} pets.
|tip These achievement quests are dailies.
|tip You will be able to complete one family achievement per day.
|tip If you haven't completed the achievement, this guide will start over.
confirm
step
label "ALLIANCE_MAGIC_BATTLER_NOT_FINISHED"
talk Old MacDonald##65648
accept Old MacDonald##31780 |goto Westfall/0 60.85,18.49 |or
'|complete achieved(61036) |or
step
talk Old MacDonald##65648
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41437
|tip Defeat him with a team of level 25 {y}magic{} pets.
Defeat Old MacDonald |q 31780/1 |goto Westfall/0 60.85,18.49 |or
'|complete achieved(61036) |or
step
Click the Complete Quest Box:
turnin Old MacDonald##31780 |or
'|complete achieved(61036) |or
step
talk Julia Stevens##64330
accept Julia Stevens##31693 |goto Elwynn Forest/0 41.66,83.67 |or
'|complete achieved(61036) |or
step
talk Julia Stevens##64330
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 40127
|tip Defeat her with a team of level 25 {y}magic{} pets.
Defeat Julia Stevens |q 31693/1 |goto Elwynn Forest/0 41.66,83.67 |or
'|complete achieved(61036) |or
step
talk Julia Stevens##64330
turnin Julia Stevens##31693 |goto Elwynn Forest/0 41.66,83.67 |or
'|complete achieved(61036) |or
step
talk Eric Davidson##65655
accept Eric Davidson##31850 |goto Duskwood/0 19.87,44.62 |or
'|complete achieved(61036) |or
step
talk Eric Davidson##65655
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41186
|tip Defeat him with a team of level 25 {y}magic{} pets.
Defeat Eric Davidson |q 31850/1 |goto Duskwood/0 19.87,44.62 |or
'|complete achieved(61036) |or
step
talk Eric Davidson##65655
turnin Eric Davidson##31850 |goto Duskwood/0 19.87,44.62 |or
'|complete achieved(61036) |or
step
talk Steven Lisbane##63194
accept Steven Lisbane##31852 |goto Northern Stranglethorn/0 46.00,40.45 |or
'|complete achieved(61036) |or
step
talk Steven Lisbane##63194
Select _"Let's rumble!"_ |gossip 39601
|tip Defeat him with a team of level 25 {y}magic{} pets.
Defeat Steven Lisbane |q 31852/1 |goto Northern Stranglethorn/0 46.00,40.45 |or
'|complete achieved(61036) |or
step
talk Steven Lisbane##63194
turnin Steven Lisbane##31852 |goto Northern Stranglethorn/0 46.00,40.45 |or
'|complete achieved(61036) |or
step
talk Bill Buckler##65656
accept Bill Buckler##31851 |goto The Cape of Stranglethorn/0 51.47,73.39 |or
'|complete achieved(61036) |or
step
talk Bill Buckler##65656
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41216
|tip Defeat him with a team of level 25 {y}magic{} pets.
Defeat Bill Buckler |q 31851/1 |goto The Cape of Stranglethorn/0 51.47,73.39 |or
'|complete achieved(61036) |or
step
talk Bill Buckler##65656
turnin Bill Buckler##31851 |goto The Cape of Stranglethorn/0 51.47,73.39 |or
'|complete achieved(61036) |or
step
talk Lydia Accoste##66522
accept Grand Master Lydia Accost##31916 |goto Deadwind Pass/0 40.04,76.46 |or
'|complete achieved(61036) |or
step
talk Lydia Accoste##66522
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41781
|tip Defeat her with a team of level 25 {y}magic{} pets.
Defeat Lydia Accoste |q 31916/1 |goto Deadwind Pass/0 40.04,76.46 |or
'|complete achieved(61036) |or
step
talk Lydia Accoste##66522
turnin Grand Master Lydia Accoste##31916 |goto Deadwind Pass/0 40.04,76.46 |or
'|complete achieved(61036) |or
step
talk Everessa##66518
accept Everessa##31913 |goto Swamp of Sorrows/0 76.82,41.50 |or
'|complete achieved(61036) |or
step
talk Everessa##66518
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41777
|tip Defeat her with a team of level 25 {y}magic{} pets.
Defeat Everessa |q 31913/1 |goto Swamp of Sorrows/0 76.82,41.50 |or
'|complete achieved(61036) |or
step
talk Everessa##66518
turnin Everessa##31913 |goto Swamp of Sorrows/0 76.82,41.50 |or
'|complete achieved(61036) |or
step
talk Lindsay##65651
accept Lindsay##31781 |goto Redridge Mountains/0 33.30,52.57 |or
'|complete achieved(61036) |or
step
talk Lindsay##65651
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41184
|tip Defeat her with a team of level 25 {y}magic{} pets.
Defeat Lindsay |q 31781/1 |goto Redridge Mountains/0 33.30,52.57 |or
'|complete achieved(61036) |or
step
Click the Complete Quest Box:
turnin Lindsay##31781 |or
'|complete achieved(61036) |or
step
talk Durin Darkhammer##66520
accept Durin Darkhammer##31914 |goto Burning Steppes/0 25.54,47.51 |or
'|complete achieved(61036) |or
step
talk Durin Darkhammer##66520
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41779
|tip Defeat her with a team of level 25 {y}magic{} pets.
Defeat Durin Darkhammer |q 31914/1 |goto Burning Steppes/0 25.54,47.51 |or
'|complete achieved(61036) |or
step
talk Durin Darkhammer##66520
turnin Durin Darkhammer##31914 |goto Burning Steppes/0 25.54,47.51 |or
'|complete achieved(61036) |or
step
talk Kortas Darkhammer##66515
accept Kortas Darkhammer##31912 |goto Searing Gorge/0 35.31,27.76 |or
'|complete achieved(61036) |or
step
talk Kortas Darkhammer##66515
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41417
|tip Defeat her with a team of level 25 {y}magic{} pets.
Defeat Kortas Darkhammer |q 31912/1 |goto Searing Gorge/0 35.31,27.76 |or
'|complete achieved(61036) |or
step
talk Kortas Darkhammer##66515
turnin Kortas Darkhammer##31912 |goto Searing Gorge/0 35.31,27.76 |or
'|complete achieved(61036) |or
step
talk David Kosse##66478
accept David Kosse##31910 |goto The Hinterlands/0 62.98,54.59 |or
'|complete achieved(61036) |or
step
talk David Kosse##66478
Select _"Let's rumble!"_ |gossip 41413
|tip Defeat her with a team of level 25 {y}magic{} pets.
Defeat David Kosse |q 31910/1 |goto The Hinterlands/0 62.78,54.83 |or
'|complete achieved(61036) |or
step
talk David Kosse##66478
turnin David Kosse##31910 |goto The Hinterlands/0 62.98,54.59 |or
'|complete achieved(61036) |or
step
talk Deiza Plaguehorn##66512
accept Deiza Plaguehorn##31911 |goto Eastern Plaguelands/0 66.49,56.84 |or
'|complete achieved(61036) |or
step
talk Deiza Plaguehorn##66512
Select _"Let's rumble!"_ |gossip 41415
|tip Defeat her with a team of level 25 {y}magic{} pets.
Defeat Deiza Plaguehorn |q 31911/1 |goto Eastern Plaguelands/0 66.67,57.10 |or
'|complete achieved(61036) |or
step
talk Deiza Plaguehorn##66512
turnin Deiza Plaguehorn##31911 |goto Eastern Plaguelands/0 66.49,56.84 |or
'|complete achieved(61036) |or
step
achieve 61036
next "ALLIANCE_MAGIC_BATTLER_NOT_FINISHED" |only if not achieved(61036)
]])
GoatQuest:RegisterGuide("Achievement Guides\\Pet Battles\\Classic (1-60)\\Mechanical Battler of Eastern Kingdoms",{
patch='120000',
author="Original guide team",
description="This will guide you through accomplishing the Mechanical Battler of Eastern Kingdoms achievement.",
achieveid={61037},
startlevel=10,
},[[
step
Defeat the battle pet trainers of Eastern Kingdoms with a team of all level 25 {b}mechanical{} pets.
|tip These achievement quests are dailies.
|tip You will be able to complete one family achievement per day.
|tip If you haven't completed the achievement, this guide will start over.
confirm
step
label "ALLIANCE_MECHANICAL_BATTLER_NOT_FINISHED"
talk Old MacDonald##65648
accept Old MacDonald##31780 |goto Westfall/0 60.85,18.49 |or
'|complete achieved(61037) |or
step
talk Old MacDonald##65648
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41437
|tip Defeat him with a team of level 25 {y}mechanical{} pets.
Defeat Old MacDonald |q 31780/1 |goto Westfall/0 60.85,18.49 |or
'|complete achieved(61037) |or
step
Click the Complete Quest Box:
turnin Old MacDonald##31780 |or
'|complete achieved(61037) |or
step
talk Julia Stevens##64330
accept Julia Stevens##31693 |goto Elwynn Forest/0 41.66,83.67 |or
'|complete achieved(61037) |or
step
talk Julia Stevens##64330
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 40127
|tip Defeat her with a team of level 25 {y}mechanical{} pets.
Defeat Julia Stevens |q 31693/1 |goto Elwynn Forest/0 41.66,83.67 |or
'|complete achieved(61037) |or
step
talk Julia Stevens##64330
turnin Julia Stevens##31693 |goto Elwynn Forest/0 41.66,83.67 |or
'|complete achieved(61037) |or
step
talk Eric Davidson##65655
accept Eric Davidson##31850 |goto Duskwood/0 19.87,44.62 |or
'|complete achieved(61037) |or
step
talk Eric Davidson##65655
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41186
|tip Defeat him with a team of level 25 {y}mechanical{} pets.
Defeat Eric Davidson |q 31850/1 |goto Duskwood/0 19.87,44.62 |or
'|complete achieved(61037) |or
step
talk Eric Davidson##65655
turnin Eric Davidson##31850 |goto Duskwood/0 19.87,44.62 |or
'|complete achieved(61037) |or
step
talk Steven Lisbane##63194
accept Steven Lisbane##31852 |goto Northern Stranglethorn/0 46.00,40.45 |or
'|complete achieved(61037) |or
step
talk Steven Lisbane##63194
Select _"Let's rumble!"_ |gossip 39601
|tip Defeat him with a team of level 25 {y}mechanical{} pets.
Defeat Steven Lisbane |q 31852/1 |goto Northern Stranglethorn/0 46.00,40.45 |or
'|complete achieved(61037) |or
step
talk Steven Lisbane##63194
turnin Steven Lisbane##31852 |goto Northern Stranglethorn/0 46.00,40.45 |or
'|complete achieved(61037) |or
step
talk Bill Buckler##65656
accept Bill Buckler##31851 |goto The Cape of Stranglethorn/0 51.47,73.39 |or
'|complete achieved(61037) |or
step
talk Bill Buckler##65656
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41216
|tip Defeat him with a team of level 25 {y}mechanical{} pets.
Defeat Bill Buckler |q 31851/1 |goto The Cape of Stranglethorn/0 51.47,73.39 |or
'|complete achieved(61037) |or
step
talk Bill Buckler##65656
turnin Bill Buckler##31851 |goto The Cape of Stranglethorn/0 51.47,73.39 |or
'|complete achieved(61037) |or
step
talk Lydia Accoste##66522
accept Grand Master Lydia Accost##31916 |goto Deadwind Pass/0 40.04,76.46 |or
'|complete achieved(61037) |or
step
talk Lydia Accoste##66522
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41781
|tip Defeat her with a team of level 25 {y}mechanical{} pets.
Defeat Lydia Accoste |q 31916/1 |goto Deadwind Pass/0 40.04,76.46 |or
'|complete achieved(61037) |or
step
talk Lydia Accoste##66522
turnin Grand Master Lydia Accoste##31916 |goto Deadwind Pass/0 40.04,76.46 |or
'|complete achieved(61037) |or
step
talk Everessa##66518
accept Everessa##31913 |goto Swamp of Sorrows/0 76.82,41.50 |or
'|complete achieved(61037) |or
step
talk Everessa##66518
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41777
|tip Defeat her with a team of level 25 {y}mechanical{} pets.
Defeat Everessa |q 31913/1 |goto Swamp of Sorrows/0 76.82,41.50 |or
'|complete achieved(61037) |or
step
talk Everessa##66518
turnin Everessa##31913 |goto Swamp of Sorrows/0 76.82,41.50 |or
'|complete achieved(61037) |or
step
talk Lindsay##65651
accept Lindsay##31781 |goto Redridge Mountains/0 33.30,52.57 |or
'|complete achieved(61037) |or
step
talk Lindsay##65651
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41184
|tip Defeat her with a team of level 25 {y}mechanical{} pets.
Defeat Lindsay |q 31781/1 |goto Redridge Mountains/0 33.30,52.57 |or
'|complete achieved(61037) |or
step
Click the Complete Quest Box:
turnin Lindsay##31781 |or
'|complete achieved(61037) |or
step
talk Durin Darkhammer##66520
accept Durin Darkhammer##31914 |goto Burning Steppes/0 25.54,47.51 |or
'|complete achieved(61037) |or
step
talk Durin Darkhammer##66520
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41779
|tip Defeat her with a team of level 25 {y}mechanical{} pets.
Defeat Durin Darkhammer |q 31914/1 |goto Burning Steppes/0 25.54,47.51 |or
'|complete achieved(61037) |or
step
talk Durin Darkhammer##66520
turnin Durin Darkhammer##31914 |goto Burning Steppes/0 25.54,47.51 |or
'|complete achieved(61037) |or
step
talk Kortas Darkhammer##66515
accept Kortas Darkhammer##31912 |goto Searing Gorge/0 35.31,27.76 |or
'|complete achieved(61037) |or
step
talk Kortas Darkhammer##66515
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41417
|tip Defeat her with a team of level 25 {y}mechanical{} pets.
Defeat Kortas Darkhammer |q 31912/1 |goto Searing Gorge/0 35.31,27.76 |or
'|complete achieved(61037) |or
step
talk Kortas Darkhammer##66515
turnin Kortas Darkhammer##31912 |goto Searing Gorge/0 35.31,27.76 |or
'|complete achieved(61037) |or
step
talk David Kosse##66478
accept David Kosse##31910 |goto The Hinterlands/0 62.98,54.59 |or
'|complete achieved(61037) |or
step
talk David Kosse##66478
Select _"Let's rumble!"_ |gossip 41413
|tip Defeat her with a team of level 25 {y}mechanical{} pets.
Defeat David Kosse |q 31910/1 |goto The Hinterlands/0 62.78,54.83 |or
'|complete achieved(61037) |or
step
talk David Kosse##66478
turnin David Kosse##31910 |goto The Hinterlands/0 62.98,54.59 |or
'|complete achieved(61037) |or
step
talk Deiza Plaguehorn##66512
accept Deiza Plaguehorn##31911 |goto Eastern Plaguelands/0 66.49,56.84 |or
'|complete achieved(61037) |or
step
talk Deiza Plaguehorn##66512
Select _"Let's rumble!"_ |gossip 41415
|tip Defeat her with a team of level 25 {y}mechanical{} pets.
Defeat Deiza Plaguehorn |q 31911/1 |goto Eastern Plaguelands/0 66.67,57.10 |or
'|complete achieved(61037) |or
step
talk Deiza Plaguehorn##66512
turnin Deiza Plaguehorn##31911 |goto Eastern Plaguelands/0 66.49,56.84 |or
'|complete achieved(61037) |or
step
achieve 61037
next "ALLIANCE_MECHANICAL_BATTLER_NOT_FINISHED" |only if not achieved(61037)
]])
GoatQuest:RegisterGuide("Achievement Guides\\Pet Battles\\Classic (1-60)\\Undead Battler of Eastern Kingdoms",{
patch='120000',
author="Original guide team",
description="This will guide you through accomplishing the Undead Battler of Eastern Kingdoms achievement.",
achieveid={61028},
startlevel=10,
},[[
step
Defeat the battle pet trainers of Eastern Kingdoms with a team of all level 25 {b}undead{} pets.
|tip These achievement quests are dailies.
|tip You will be able to complete one family achievement per day.
|tip If you haven't completed the achievement, this guide will start over.
confirm
step
label "ALLIANCE_UNDEAD_BATTLER_NOT_FINISHED"
talk Old MacDonald##65648
accept Old MacDonald##31780 |goto Westfall/0 60.85,18.49 |or
'|complete achieved(61028) |or
step
talk Old MacDonald##65648
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41437
|tip Defeat him with a team of level 25 {y}undead{} pets.
Defeat Old MacDonald |q 31780/1 |goto Westfall/0 60.85,18.49 |or
'|complete achieved(61028) |or
step
Click the Complete Quest Box:
turnin Old MacDonald##31780 |or
'|complete achieved(61028) |or
step
talk Julia Stevens##64330
accept Julia Stevens##31693 |goto Elwynn Forest/0 41.66,83.67 |or
'|complete achieved(61028) |or
step
talk Julia Stevens##64330
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 40127
|tip Defeat her with a team of level 25 {y}undead{} pets.
Defeat Julia Stevens |q 31693/1 |goto Elwynn Forest/0 41.66,83.67 |or
'|complete achieved(61028) |or
step
talk Julia Stevens##64330
turnin Julia Stevens##31693 |goto Elwynn Forest/0 41.66,83.67 |or
'|complete achieved(61028) |or
step
talk Eric Davidson##65655
accept Eric Davidson##31850 |goto Duskwood/0 19.87,44.62 |or
'|complete achieved(61028) |or
step
talk Eric Davidson##65655
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41186
|tip Defeat him with a team of level 25 {y}undead{} pets.
Defeat Eric Davidson |q 31850/1 |goto Duskwood/0 19.87,44.62 |or
'|complete achieved(61028) |or
step
talk Eric Davidson##65655
turnin Eric Davidson##31850 |goto Duskwood/0 19.87,44.62 |or
'|complete achieved(61028) |or
step
talk Steven Lisbane##63194
accept Steven Lisbane##31852 |goto Northern Stranglethorn/0 46.00,40.45 |or
'|complete achieved(61028) |or
step
talk Steven Lisbane##63194
Select _"Let's rumble!"_ |gossip 39601
|tip Defeat him with a team of level 25 {y}undead{} pets.
Defeat Steven Lisbane |q 31852/1 |goto Northern Stranglethorn/0 46.00,40.45 |or
'|complete achieved(61028) |or
step
talk Steven Lisbane##63194
turnin Steven Lisbane##31852 |goto Northern Stranglethorn/0 46.00,40.45 |or
'|complete achieved(61028) |or
step
talk Bill Buckler##65656
accept Bill Buckler##31851 |goto The Cape of Stranglethorn/0 51.47,73.39 |or
'|complete achieved(61028) |or
step
talk Bill Buckler##65656
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41216
|tip Defeat him with a team of level 25 {y}undead{} pets.
Defeat Bill Buckler |q 31851/1 |goto The Cape of Stranglethorn/0 51.47,73.39 |or
'|complete achieved(61028) |or
step
talk Bill Buckler##65656
turnin Bill Buckler##31851 |goto The Cape of Stranglethorn/0 51.47,73.39 |or
'|complete achieved(61028) |or
step
talk Lydia Accoste##66522
accept Grand Master Lydia Accost##31916 |goto Deadwind Pass/0 40.04,76.46 |or
'|complete achieved(61028) |or
step
talk Lydia Accoste##66522
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41781
|tip Defeat her with a team of level 25 {y}undead{} pets.
Defeat Lydia Accoste |q 31916/1 |goto Deadwind Pass/0 40.04,76.46 |or
'|complete achieved(61028) |or
step
talk Lydia Accoste##66522
turnin Grand Master Lydia Accoste##31916 |goto Deadwind Pass/0 40.04,76.46 |or
'|complete achieved(61028) |or
step
talk Everessa##66518
accept Everessa##31913 |goto Swamp of Sorrows/0 76.82,41.50 |or
'|complete achieved(61028) |or
step
talk Everessa##66518
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41777
|tip Defeat her with a team of level 25 {y}undead{} pets.
Defeat Everessa |q 31913/1 |goto Swamp of Sorrows/0 76.82,41.50 |or
'|complete achieved(61028) |or
step
talk Everessa##66518
turnin Everessa##31913 |goto Swamp of Sorrows/0 76.82,41.50 |or
'|complete achieved(61028) |or
step
talk Lindsay##65651
accept Lindsay##31781 |goto Redridge Mountains/0 33.30,52.57 |or
'|complete achieved(61028) |or
step
talk Lindsay##65651
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41184
|tip Defeat her with a team of level 25 {y}undead{} pets.
Defeat Lindsay |q 31781/1 |goto Redridge Mountains/0 33.30,52.57 |or
'|complete achieved(61028) |or
step
Click the Complete Quest Box:
turnin Lindsay##31781 |or
'|complete achieved(61028) |or
step
talk Durin Darkhammer##66520
accept Durin Darkhammer##31914 |goto Burning Steppes/0 25.54,47.51 |or
'|complete achieved(61028) |or
step
talk Durin Darkhammer##66520
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41779
|tip Defeat her with a team of level 25 {y}undead{} pets.
Defeat Durin Darkhammer |q 31914/1 |goto Burning Steppes/0 25.54,47.51 |or
'|complete achieved(61028) |or
step
talk Durin Darkhammer##66520
turnin Durin Darkhammer##31914 |goto Burning Steppes/0 25.54,47.51 |or
'|complete achieved(61028) |or
step
talk Kortas Darkhammer##66515
accept Kortas Darkhammer##31912 |goto Searing Gorge/0 35.31,27.76 |or
'|complete achieved(61028) |or
step
talk Kortas Darkhammer##66515
Select _"Think you can take me in a pet battle?  Let's fight!"_ |gossip 41417
|tip Defeat her with a team of level 25 {y}undead{} pets.
Defeat Kortas Darkhammer |q 31912/1 |goto Searing Gorge/0 35.31,27.76 |or
'|complete achieved(61028) |or
step
talk Kortas Darkhammer##66515
turnin Kortas Darkhammer##31912 |goto Searing Gorge/0 35.31,27.76 |or
'|complete achieved(61028) |or
step
talk David Kosse##66478
accept David Kosse##31910 |goto The Hinterlands/0 62.98,54.59 |or
'|complete achieved(61028) |or
step
talk David Kosse##66478
Select _"Let's rumble!"_ |gossip 41413
|tip Defeat her with a team of level 25 {y}undead{} pets.
Defeat David Kosse |q 31910/1 |goto The Hinterlands/0 62.78,54.83 |or
'|complete achieved(61028) |or
step
talk David Kosse##66478
turnin David Kosse##31910 |goto The Hinterlands/0 62.98,54.59 |or
'|complete achieved(61028) |or
step
talk Deiza Plaguehorn##66512
accept Deiza Plaguehorn##31911 |goto Eastern Plaguelands/0 66.49,56.84 |or
'|complete achieved(61028) |or
step
talk Deiza Plaguehorn##66512
Select _"Let's rumble!"_ |gossip 41415
|tip Defeat her with a team of level 25 {y}undead{} pets.
Defeat Deiza Plaguehorn |q 31911/1 |goto Eastern Plaguelands/0 66.67,57.10 |or
'|complete achieved(61028) |or
step
talk Deiza Plaguehorn##66512
turnin Deiza Plaguehorn##31911 |goto Eastern Plaguelands/0 66.49,56.84 |or
'|complete achieved(61028) |or
step
achieve 61028
next "ALLIANCE_UNDEAD_BATTLER_NOT_FINISHED" |only if not achieved(61028)
]])
GoatQuest:RegisterGuide("Achievement Guides\\Pet Battles\\Classic (1-60)\\Family Battler of Eastern Kingdoms",{
patch='120000',
author="Original guide team",
description="This will guide you through accomplishing the Family Battler of Eastern Kingdoms achievement.",
achieveid={61040},
startlevel=10,
},[[
step
Complete One of The Following Guides Per Day
|tip These are all daily quests.
|tip Use all level 25 pet teams at full health.
confirm
step
loadguide "Achievement Guides\\Pet Battles\\Classic (1-60)\\Aquatic Battler of Eastern Kingdoms" |only if not achieved(61029)
loadguide "Achievement Guides\\Pet Battles\\Classic (1-60)\\Beast Battler of Eastern Kingdoms" |only if not achieved(61030)
loadguide "Achievement Guides\\Pet Battles\\Classic (1-60)\\Critter Battler of Eastern Kingdoms" |only if not achieved(61031)
loadguide "Achievement Guides\\Pet Battles\\Classic (1-60)\\Dragonkin Battler of Eastern Kingdoms" |only if not achieved(61032)
loadguide "Achievement Guides\\Pet Battles\\Classic (1-60)\\Elemental Battler of Eastern Kingdoms" |only if not achieved(61033)
loadguide "Achievement Guides\\Pet Battles\\Classic (1-60)\\Flying Battler of Eastern Kingdoms" |only if not achieved(61034)
loadguide "Achievement Guides\\Pet Battles\\Classic (1-60)\\Humanoid Battler of Eastern Kingdoms" |only if not achieved(61035)
loadguide "Achievement Guides\\Pet Battles\\Classic (1-60)\\Magic Battler of Eastern Kingdoms" |only if not achieved(61036)
loadguide "Achievement Guides\\Pet Battles\\Classic (1-60)\\Mechanical Battler of Eastern Kingdoms" |only if not achieved(61037)
loadguide "Achievement Guides\\Pet Battles\\Classic (1-60)\\Undead Battler of Eastern Kingdoms" |only if not achieved(61028)
achieve 61040
]])
