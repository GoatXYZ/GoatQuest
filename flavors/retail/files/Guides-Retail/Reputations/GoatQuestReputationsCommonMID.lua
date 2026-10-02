local GoatQuest=GoatQuest
if not GoatQuest then return end
if GQ:DoMutex("ReputationsCMID") then return end
GoatQuest.GuideMenuTier = "SHA"
GoatQuest:RegisterGuide("Reputation Guides\\Midnight Reputations\\Amani Tribe",{
description="This guide will walk you through gaining renown and completing activities for the \n"..
"Amani Tribe faction of Zul'Aman.",
areapoiid=8504,
areapoitype="faction (Amani Tribe)",
startlevel=80,
patch='120000',
},[[
step
Reach Renown Level 2 with the Amani Tribe |complete factionrenown(2696) >= 2
|tip Complete daily quests, weekly quests, and zone quests in Zul'Aman to gain renown.
|tip The Abundance weekly event grants a large amount of renown.
step
Reach Renown Level 3 with the Amani Tribe |complete factionrenown(2696) >= 3
|tip Complete daily quests, weekly quests, and zone quests in Zul'Aman to gain renown.
|tip The Abundance weekly event grants a large amount of renown.
step
Reach Renown Level 4 with the Amani Tribe |complete factionrenown(2696) >= 4
|tip Complete daily quests, weekly quests, and zone quests in Zul'Aman to gain renown.
|tip The Abundance weekly event grants a large amount of renown.
step
Reach Renown Level 5 with the Amani Tribe |complete factionrenown(2696) >= 5
|tip Complete daily quests, weekly quests, and zone quests in Zul'Aman to gain renown.
|tip The Abundance weekly event grants a large amount of renown.
step
Reach Renown Level 6 with the Amani Tribe |complete factionrenown(2696) >= 6
|tip Complete daily quests, weekly quests, and zone quests in Zul'Aman to gain renown.
|tip The Abundance weekly event grants a large amount of renown.
step
talk Magovu##240279
|tip Inside the building.
accept A Handful of Voidlight Marl##92386 |goto Zul Aman M/0 45.95,65.92
|tip If this quest is not available, skip this step.
step
Reach Renown Level 7 with the Amani Tribe |complete factionrenown(2696) >= 7
|tip Complete daily quests, weekly quests, and zone quests in Zul'Aman to gain renown.
|tip The Abundance weekly event grants a large amount of renown.
step
Reach Renown Level 8 with the Amani Tribe |complete factionrenown(2696) >= 8
|tip Complete daily quests, weekly quests, and zone quests in Zul'Aman to gain renown.
|tip The Abundance weekly event grants a large amount of renown.
step
Reach Renown Level 9 with the Amani Tribe |complete factionrenown(2696) >= 9
|tip Complete daily quests, weekly quests, and zone quests in Zul'Aman to gain renown.
|tip The Abundance weekly event grants a large amount of renown.
step
talk Magovu##240279
|tip Inside the building.
accept Glorious Abundance##97625 |goto Zul Aman M/0 45.95,65.92
|tip If this quest is not available, skip this step.
|tip You must have the Abundance feature unlocked.
step
Complete an Abundance Event |q 97625/1
|tip Complete an abundance event in any zone using the Abundance guide.
|loadguide "Leveling Guides\\Midnight (80-90)\\Extra Storylines\\Abundance"
|only if haveq(97625) or completedq(97625)
step
talk Magovu##240279
|tip Inside the building.
turnin Glorious Abundance##97625 |goto Zul Aman M/0 45.95,65.92
|only if haveq(97625) or completedq(97625)
step
Reach Renown Level 10 with the Amani Tribe |complete factionrenown(2696) >= 10
|tip Complete daily quests, weekly quests, and zone quests in Zul'Aman to gain renown.
|tip The Abundance weekly event grants a large amount of renown.
step
talk Magovu##240279
|tip Inside the building.
accept Fine Fashion Funding##94813 |goto Zul Aman M/0 45.95,65.92
|tip If this quest is not available, skip this step.
step
Reach Renown Level 11 with the Amani Tribe |complete factionrenown(2696) >= 11
|tip Complete daily quests, weekly quests, and zone quests in Zul'Aman to gain renown.
|tip The Abundance weekly event grants a large amount of renown.
step
Reach Renown Level 12 with the Amani Tribe |complete factionrenown(2696) >= 12
|tip Complete daily quests, weekly quests, and zone quests in Zul'Aman to gain renown.
|tip The Abundance weekly event grants a large amount of renown.
step
talk Magovu##240279
|tip Inside the building.
accept A Cluster of Voidlight Marl##92387 |goto Zul Aman M/0 45.95,65.92
|tip If this quest is not available, skip this step.
step
Reach Renown Level 13 with the Amani Tribe |complete factionrenown(2696) >= 13
|tip Complete daily quests, weekly quests, and zone quests in Zul'Aman to gain renown.
|tip The Abundance weekly event grants a large amount of renown.
step
Reach Renown Level 14 with the Amani Tribe |complete factionrenown(2696) >= 14
|tip Complete daily quests, weekly quests, and zone quests in Zul'Aman to gain renown.
|tip The Abundance weekly event grants a large amount of renown.
step
Reach Renown Level 15 with the Amani Tribe |complete factionrenown(2696) >= 15
|tip Complete daily quests, weekly quests, and zone quests in Zul'Aman to gain renown.
|tip The Abundance weekly event grants a large amount of renown.
step
Reach Renown Level 16 with the Amani Tribe |complete factionrenown(2696) >= 16
|tip Complete daily quests, weekly quests, and zone quests in Zul'Aman to gain renown.
|tip The Abundance weekly event grants a large amount of renown.
step
Reach Renown Level 17 with the Amani Tribe |complete factionrenown(2696) >= 17
|tip Complete daily quests, weekly quests, and zone quests in Zul'Aman to gain renown.
|tip The Abundance weekly event grants a large amount of renown.
step
Reach Renown Level 18 with the Amani Tribe |complete factionrenown(2696) >= 18
|tip Complete daily quests, weekly quests, and zone quests in Zul'Aman to gain renown.
|tip The Abundance weekly event grants a large amount of renown.
step
talk Magovu##240279
|tip Inside the building.
accept A Trove of Voidlight Marl##92388 |goto Zul Aman M/0 45.95,65.92
|tip If this quest is not available, skip this step.
step
Reach Renown Level 19 with the Amani Tribe |complete factionrenown(2696) >= 19
|tip Complete daily quests, weekly quests, and zone quests in Zul'Aman to gain renown.
|tip The Abundance weekly event grants a large amount of renown.
step
Reach Renown Level 20 with the Amani Tribe |complete factionrenown(2696) >= 20
|tip Complete daily quests, weekly quests, and zone quests in Zul'Aman to gain renown.
|tip The Abundance weekly event grants a large amount of renown.
step
Reach Renown Level 21 with the Amani Tribe |complete factionrenown(2696) >= 21
|tip Complete daily quests, weekly quests, and zone quests in Zul'Aman to gain renown.
|tip The Abundance weekly event grants a large amount of renown.
step
Reach Renown Level 22 with the Amani Tribe |complete factionrenown(2696) >= 22
|tip Complete daily quests, weekly quests, and zone quests in Zul'Aman to gain renown.
|tip The Abundance weekly event grants a large amount of renown.
step
Reach Renown Level 23 with the Amani Tribe |complete factionrenown(2696) >= 23
|tip Complete daily quests, weekly quests, and zone quests in Zul'Aman to gain renown.
|tip The Abundance weekly event grants a large amount of renown.
step
Reach Renown Level 24 with the Amani Tribe |complete factionrenown(2696) >= 24
|tip Complete daily quests, weekly quests, and zone quests in Zul'Aman to gain renown.
|tip The Abundance weekly event grants a large amount of renown.
step
Reach Renown Level 25 with the Amani Tribe |complete factionrenown(2696) >= 25
|tip Complete daily quests, weekly quests, and zone quests in Zul'Aman to gain renown.
|tip The Abundance weekly event grants a large amount of renown.
]])
GoatQuest:RegisterGuide("Reputation Guides\\Midnight Reputations\\Silvermoon Court",{
description="This guide will walk you through gaining renown and completing activities for the \n"..
"Silvermoon Court faction of Zul'Aman.",
startlevel=80,
patch='120000',
},[[
step
Reach Renown Level 2 with the Silvermoon Court |complete factionrenown(2710) >= 2
|tip Complete daily quests, weekly quests, and zone quests in Eversong Woods and Silvermoon City to gain renown.
|tip The Saltheril's Soiree weekly event grants a large amount of renown.
step
Reach Renown Level 3 with the Silvermoon Court |complete factionrenown(2710) >= 3
|tip Complete daily quests, weekly quests, and zone quests in Eversong Woods and Silvermoon City to gain renown.
|tip The Saltheril's Soiree weekly event grants a large amount of renown.
step
Reach Renown Level 4 with the Silvermoon Court |complete factionrenown(2710) >= 4
|tip Complete daily quests, weekly quests, and zone quests in Eversong Woods and Silvermoon City to gain renown.
|tip The Saltheril's Soiree weekly event grants a large amount of renown.
step
Reach Renown Level 5 with the Silvermoon Court |complete factionrenown(2710) >= 5
|tip Complete daily quests, weekly quests, and zone quests in Eversong Woods and Silvermoon City to gain renown.
|tip The Saltheril's Soiree weekly event grants a large amount of renown.
step
Reach Renown Level 6 with the Silvermoon Court |complete factionrenown(2710) >= 6
|tip Complete daily quests, weekly quests, and zone quests in Eversong Woods and Silvermoon City to gain renown.
|tip The Saltheril's Soiree weekly event grants a large amount of renown.
step
talk Caeris Fairdawn##240838
accept A Handful of Voidlight Marl##93200 |goto Eversong Woods M/0 43.46,47.42
|tip If this quest is not available, skip this step.
step
Reach Renown Level 7 with the Silvermoon Court |complete factionrenown(2710) >= 7
|tip Complete daily quests, weekly quests, and zone quests in Eversong Woods and Silvermoon City to gain renown.
|tip The Saltheril's Soiree weekly event grants a large amount of renown.
step
step
Reach Renown Level 8 with the Silvermoon Court |complete factionrenown(2710) >= 8
|tip Complete daily quests, weekly quests, and zone quests in Eversong Woods and Silvermoon City to gain renown.
|tip The Saltheril's Soiree weekly event grants a large amount of renown.
step
Reach Renown Level 9 with the Silvermoon Court |complete factionrenown(2710) >= 9
|tip Complete daily quests, weekly quests, and zone quests in Eversong Woods and Silvermoon City to gain renown.
|tip The Saltheril's Soiree weekly event grants a large amount of renown.
step
talk Caeris Fairdawn##240838
accept Courting Success##93930 |goto Eversong Woods M/0 43.46,47.42
|tip You need to unlock Saltheril's Soiree to accept this quest.
|loadguide "Leveling Guides\\Midnight (80-90)\\Extra Storylines\\Saltheril's Soiree"
step
Complete "Fortify the Runestones" at Saltheril's Soiree |q 93930/1
|loadguide "Daily Guides\\Midnight\\Saltheril's Soiree Weeklies"
|only if haveq(93930) or completedq(93930)
step
talk Caeris Fairdawn##240838
turnin Courting Success##93930 |goto Eversong Woods M/0 43.46,47.42
|only if haveq(93930) or completedq(93930)
step
Reach Renown Level 10 with the Silvermoon Court |complete factionrenown(2710) >= 10
|tip Complete daily quests, weekly quests, and zone quests in Eversong Woods and Silvermoon City to gain renown.
|tip The Saltheril's Soiree weekly event grants a large amount of renown.
step
talk Caeris Fairdawn##240838
accept Fine Fashion Funding##94816 |goto Eversong Woods M/0 43.46,47.42
|tip If this quest is not available, skip this step.
step
Reach Renown Level 11 with the Silvermoon Court |complete factionrenown(2710) >= 11
|tip Complete daily quests, weekly quests, and zone quests in Eversong Woods and Silvermoon City to gain renown.
|tip The Saltheril's Soiree weekly event grants a large amount of renown.
step
Reach Renown Level 12 with the Silvermoon Court |complete factionrenown(2710) >= 12
|tip Complete daily quests, weekly quests, and zone quests in Eversong Woods and Silvermoon City to gain renown.
|tip The Saltheril's Soiree weekly event grants a large amount of renown.
step
talk Caeris Fairdawn##240838
accept A Cluster of Voidlight Marl##93549 |goto Eversong Woods M/0 43.46,47.42
|tip If this quest is not available, skip this step.
step
Reach Renown Level 13 with the Silvermoon Court |complete factionrenown(2710) >= 13
|tip Complete daily quests, weekly quests, and zone quests in Eversong Woods and Silvermoon City to gain renown.
|tip The Saltheril's Soiree weekly event grants a large amount of renown.
step
Reach Renown Level 14 with the Silvermoon Court |complete factionrenown(2710) >= 14
|tip Complete daily quests, weekly quests, and zone quests in Eversong Woods and Silvermoon City to gain renown.
|tip The Saltheril's Soiree weekly event grants a large amount of renown.
step
Reach Renown Level 15 with the Silvermoon Court |complete factionrenown(2710) >= 15
|tip Complete daily quests, weekly quests, and zone quests in Eversong Woods and Silvermoon City to gain renown.
|tip The Saltheril's Soiree weekly event grants a large amount of renown.
step
Reach Renown Level 16 with the Silvermoon Court |complete factionrenown(2710) >= 16
|tip Complete daily quests, weekly quests, and zone quests in Eversong Woods and Silvermoon City to gain renown.
|tip The Saltheril's Soiree weekly event grants a large amount of renown.
step
Reach Renown Level 17 with the Silvermoon Court |complete factionrenown(2710) >= 17
|tip Complete daily quests, weekly quests, and zone quests in Eversong Woods and Silvermoon City to gain renown.
|tip The Saltheril's Soiree weekly event grants a large amount of renown.
step
Reach Renown Level 18 with the Silvermoon Court |complete factionrenown(2710) >= 18
|tip Complete daily quests, weekly quests, and zone quests in Eversong Woods and Silvermoon City to gain renown.
|tip The Saltheril's Soiree weekly event grants a large amount of renown.
step
talk Caeris Fairdawn##240838
accept A Trove of Voidlight Marl##93548 |goto Eversong Woods M/0 43.46,47.42
|tip If this quest is not available, skip this step.
step
Reach Renown Level 19 with the Silvermoon Court |complete factionrenown(2710) >= 19
|tip Complete daily quests, weekly quests, and zone quests in Eversong Woods and Silvermoon City to gain renown.
|tip The Saltheril's Soiree weekly event grants a large amount of renown.
step
Reach Renown Level 20 with the Silvermoon Court |complete factionrenown(2710) >= 20
|tip Complete daily quests, weekly quests, and zone quests in Eversong Woods and Silvermoon City to gain renown.
|tip The Saltheril's Soiree weekly event grants a large amount of renown.
step
Reach Renown Level 21 with the Silvermoon Court |complete factionrenown(2710) >= 21
|tip Complete daily quests, weekly quests, and zone quests in Eversong Woods and Silvermoon City to gain renown.
|tip The Saltheril's Soiree weekly event grants a large amount of renown.
step
Reach Renown Level 22 with the Silvermoon Court |complete factionrenown(2710) >= 22
|tip Complete daily quests, weekly quests, and zone quests in Eversong Woods and Silvermoon City to gain renown.
|tip The Saltheril's Soiree weekly event grants a large amount of renown.
step
Reach Renown Level 23 with the Silvermoon Court |complete factionrenown(2710) >= 23
|tip Complete daily quests, weekly quests, and zone quests in Eversong Woods and Silvermoon City to gain renown.
|tip The Saltheril's Soiree weekly event grants a large amount of renown.
step
Reach Renown Level 24 with the Silvermoon Court |complete factionrenown(2710) >= 24
|tip Complete daily quests, weekly quests, and zone quests in Eversong Woods and Silvermoon City to gain renown.
|tip The Saltheril's Soiree weekly event grants a large amount of renown.
step
Reach Renown Level 25 with the Silvermoon Court |complete factionrenown(2710) >= 25
|tip Complete daily quests, weekly quests, and zone quests in Eversong Woods and Silvermoon City to gain renown.
|tip The Saltheril's Soiree weekly event grants a large amount of renown.
]])
GoatQuest:RegisterGuide("Reputation Guides\\Midnight Reputations\\Hara'ti",{
description="This guide will walk you through gaining renown and completing activities for the \n"..
"Hara'ti faction of Zul'Aman.",
areapoiid=8424,
areapoitype="faction (Hara'ti)",
startlevel=80,
patch='120000',
},[[
step
Reach Renown Level 2 with the Hara'ti |complete factionrenown(2704) >= 2
|tip Complete daily quests, weekly quests, and zone quests in Harandar to gain renown.
step
Reach Renown Level 3 with the Hara'ti |complete factionrenown(2704) >= 3
|tip Complete daily quests, weekly quests, and zone quests in Harandar to gain renown.
step
Reach Renown Level 4 with the Hara'ti |complete factionrenown(2704) >= 4
|tip Complete daily quests, weekly quests, and zone quests in Harandar to gain renown.
step
talk Naynar##240407
accept A Handful of Voidlight Marl##92890 |goto Harandar/0 50.95,50.73
|tip If this quest is not available, skip this step.
step
Reach Renown Level 5 with the Hara'ti |complete factionrenown(2704) >= 5
|tip Complete daily quests, weekly quests, and zone quests in Harandar to gain renown.
step
Reach Renown Level 6 with the Hara'ti |complete factionrenown(2704) >= 6
|tip Complete daily quests, weekly quests, and zone quests in Harandar to gain renown.
step
Reach Renown Level 7 with the Hara'ti |complete factionrenown(2704) >= 7
|tip Complete daily quests, weekly quests, and zone quests in Harandar to gain renown.
step
step
Reach Renown Level 8 with the Hara'ti |complete factionrenown(2704) >= 8
|tip Complete daily quests, weekly quests, and zone quests in Harandar to gain renown.
step
talk Naynar##240407
accept Legendary Prosperity##93932 |goto Harandar/0 50.95,50.73
|tip You must be level 90 to accept this.
step
Discover a Legend of the Haranir |q 93932/1
|only if haveq(93932) or completedq(93932)
step
talk Naynar##240407
turnin Legendary Prosperity##93932 |goto Harandar/0 50.95,50.73
|only if haveq(93932) or completedq(93932)
step
Reach Renown Level 9 with the Hara'ti |complete factionrenown(2704) >= 9
|tip Complete daily quests, weekly quests, and zone quests in Harandar to gain renown.
step
Reach Renown Level 10 with the Hara'ti |complete factionrenown(2704) >= 10
|tip Complete daily quests, weekly quests, and zone quests in Harandar to gain renown.
step
talk Naynar##240407
accept Fine Fashion Funding##94794 |goto Harandar/0 50.95,50.73
|tip If this quest is not available, skip this step.
step
Reach Renown Level 11 with the Hara'ti |complete factionrenown(2704) >= 11
|tip Complete daily quests, weekly quests, and zone quests in Harandar to gain renown.
step
Reach Renown Level 12 with the Hara'ti |complete factionrenown(2704) >= 12
|tip Complete daily quests, weekly quests, and zone quests in Harandar to gain renown.
step
Reach Renown Level 13 with the Hara'ti |complete factionrenown(2704) >= 13
|tip Complete daily quests, weekly quests, and zone quests in Harandar to gain renown.
step
talk Naynar##240407
accept A Cluster of Voidlight Marl##92891 |goto Harandar/0 50.95,50.73
|tip If this quest is not available, skip this step.
step
Reach Renown Level 14 with the Hara'ti |complete factionrenown(2704) >= 14
|tip Complete daily quests, weekly quests, and zone quests in Harandar to gain renown.
step
Reach Renown Level 15 with the Hara'ti |complete factionrenown(2704) >= 15
|tip Complete daily quests, weekly quests, and zone quests in Harandar to gain renown.
step
Reach Renown Level 16 with the Hara'ti |complete factionrenown(2704) >= 16
|tip Complete daily quests, weekly quests, and zone quests in Harandar to gain renown.
step
Reach Renown Level 17 with the Hara'ti |complete factionrenown(2704) >= 17
|tip Complete daily quests, weekly quests, and zone quests in Harandar to gain renown.
step
Reach Renown Level 18 with the Hara'ti |complete factionrenown(2704) >= 18
|tip Complete daily quests, weekly quests, and zone quests in Harandar to gain renown.
step
talk Naynar##240407
accept A Trove of Voidlight Marl##92892 |goto Harandar/0 50.95,50.73
|tip If this quest is not available, skip this step.
step
Reach Renown Level 19 with the Hara'ti |complete factionrenown(2704) >= 19
|tip Complete daily quests, weekly quests, and zone quests in Harandar to gain renown.
step
Reach Renown Level 20 with the Hara'ti |complete factionrenown(2704) >= 20
|tip Complete daily quests, weekly quests, and zone quests in Harandar to gain renown.
]])
GoatQuest:RegisterGuide("Reputation Guides\\Midnight Reputations\\The Singularity",{
description="This guide will walk you through gaining renown and completing activities for \n"..
"The Singularity faction of Zul'Aman.",
areapoiid=7898,
areapoitype="faction (The Singularity)",
startlevel=80,
patch='120000',
},[[
step
Reach Renown Level 2 with The Singularity |complete factionrenown(2699) >= 2
|tip Complete daily quests, weekly quests, and zone quests in Voidstorm to gain renown.
|tip The Stormarion Assault weekly event grants a large amount of renown.
step
Reach Renown Level 3 with The Singularity |complete factionrenown(2699) >= 3
|tip Complete daily quests, weekly quests, and zone quests in Voidstorm to gain renown.
|tip The Stormarion Assault weekly event grants a large amount of renown.
step
Reach Renown Level 4 with The Singularity |complete factionrenown(2699) >= 4
|tip Complete daily quests, weekly quests, and zone quests in Voidstorm to gain renown.
|tip The Stormarion Assault weekly event grants a large amount of renown.
step
talk Void Researcher Anomander##248328
accept A Handful of Voidlight Marl##94469 |goto Voidstorm/0 52.58,72.90
|tip If this quest is not available, skip this step.
step
Reach Renown Level 5 with The Singularity |complete factionrenown(2699) >= 5
|tip Complete daily quests, weekly quests, and zone quests in Voidstorm to gain renown.
|tip The Stormarion Assault weekly event grants a large amount of renown.
step
Reach Renown Level 6 with The Singularity |complete factionrenown(2699) >= 6
|tip Complete daily quests, weekly quests, and zone quests in Voidstorm to gain renown.
|tip The Stormarion Assault weekly event grants a large amount of renown.
step
Reach Renown Level 7 with The Singularity |complete factionrenown(2699) >= 7
|tip Complete daily quests, weekly quests, and zone quests in Voidstorm to gain renown.
|tip The Stormarion Assault weekly event grants a large amount of renown.
step
talk Void Researcher Anomander##248328
accept Guarded Treasures##93933 |goto Voidstorm/0 52.58,72.90
|tip You must be level 90 to accept this quest.
step
Defend the Singularity Anchor |q 93933/1
|only if haveq(93933) or completedq(93933)
step
talk Void Researcher Anomander##248328
turnin Guarded Treasures##93933 |goto Voidstorm/0 52.58,72.90
|only if haveq(93933) or completedq(93933)
step
step
Reach Renown Level 8 with The Singularity |complete factionrenown(2699) >= 8
|tip Complete daily quests, weekly quests, and zone quests in Voidstorm to gain renown.
|tip The Stormarion Assault weekly event grants a large amount of renown.
step
Reach Renown Level 9 with The Singularity |complete factionrenown(2699) >= 9
|tip Complete daily quests, weekly quests, and zone quests in Voidstorm to gain renown.
|tip The Stormarion Assault weekly event grants a large amount of renown.
step
Reach Renown Level 10 with The Singularity |complete factionrenown(2699) >= 10
|tip Complete daily quests, weekly quests, and zone quests in Voidstorm to gain renown.
|tip The Stormarion Assault weekly event grants a large amount of renown.
step
talk Void Researcher Anomander##248328
accept Finery Funds##94671 |goto Voidstorm/0 52.58,72.90
|tip If this quest is not available, skip this step.
step
Reach Renown Level 11 with The Singularity |complete factionrenown(2699) >= 11
|tip Complete daily quests, weekly quests, and zone quests in Voidstorm to gain renown.
|tip The Stormarion Assault weekly event grants a large amount of renown.
step
Reach Renown Level 12 with The Singularity |complete factionrenown(2699) >= 12
|tip Complete daily quests, weekly quests, and zone quests in Voidstorm to gain renown.
|tip The Stormarion Assault weekly event grants a large amount of renown.
step
Reach Renown Level 13 with The Singularity |complete factionrenown(2699) >= 13
|tip Complete daily quests, weekly quests, and zone quests in Voidstorm to gain renown.
|tip The Stormarion Assault weekly event grants a large amount of renown.
step
Reach Renown Level 14 with The Singularity |complete factionrenown(2699) >= 14
|tip Complete daily quests, weekly quests, and zone quests in Voidstorm to gain renown.
|tip The Stormarion Assault weekly event grants a large amount of renown.
step
talk Void Researcher Anomander##248328
accept A Cluster of Voidlight Marl##94470 |goto Voidstorm/0 52.58,72.90
|tip If this quest is not available, skip this step.
step
Reach Renown Level 15 with The Singularity |complete factionrenown(2699) >= 15
|tip Complete daily quests, weekly quests, and zone quests in Voidstorm to gain renown.
|tip The Stormarion Assault weekly event grants a large amount of renown.
step
Reach Renown Level 16 with The Singularity |complete factionrenown(2699) >= 16
|tip Complete daily quests, weekly quests, and zone quests in Voidstorm to gain renown.
|tip The Stormarion Assault weekly event grants a large amount of renown.
step
Reach Renown Level 17 with The Singularity |complete factionrenown(2699) >= 17
|tip Complete daily quests, weekly quests, and zone quests in Voidstorm to gain renown.
|tip The Stormarion Assault weekly event grants a large amount of renown.
step
Reach Renown Level 18 with The Singularity |complete factionrenown(2699) >= 18
|tip Complete daily quests, weekly quests, and zone quests in Voidstorm to gain renown.
|tip The Stormarion Assault weekly event grants a large amount of renown.
step
talk Void Researcher Anomander##248328
accept A Trove of Voidlight Marl##94471 |goto Voidstorm/0 52.58,72.90
|tip If this quest is not available, skip this step.
step
Reach Renown Level 19 with The Singularity |complete factionrenown(2699) >= 19
|tip Complete daily quests, weekly quests, and zone quests in Voidstorm to gain renown.
|tip The Stormarion Assault weekly event grants a large amount of renown.
step
Reach Renown Level 20 with The Singularity |complete factionrenown(2699) >= 20
|tip Complete daily quests, weekly quests, and zone quests in Voidstorm to gain renown.
|tip The Stormarion Assault weekly event grants a large amount of renown.
step
Reach Renown Level 21 with The Singularity |complete factionrenown(2699) >= 21
|tip Complete daily quests, weekly quests, and zone quests in Voidstorm to gain renown.
|tip The Stormarion Assault weekly event grants a large amount of renown.
step
Reach Renown Level 22 with The Singularity |complete factionrenown(2699) >= 22
|tip Complete daily quests, weekly quests, and zone quests in Voidstorm to gain renown.
|tip The Stormarion Assault weekly event grants a large amount of renown.
step
Reach Renown Level 23 with The Singularity |complete factionrenown(2699) >= 23
|tip Complete daily quests, weekly quests, and zone quests in Voidstorm to gain renown.
|tip The Stormarion Assault weekly event grants a large amount of renown.
step
Reach Renown Level 24 with The Singularity |complete factionrenown(2699) >= 24
|tip Complete daily quests, weekly quests, and zone quests in Voidstorm to gain renown.
|tip The Stormarion Assault weekly event grants a large amount of renown.
step
Reach Renown Level 25 with The Singularity |complete factionrenown(2699) >= 25
|tip Complete daily quests, weekly quests, and zone quests in Voidstorm to gain renown.
|tip The Stormarion Assault weekly event grants a large amount of renown.
]])
GoatQuest:RegisterGuide("Reputation Guides\\Midnight Reputations\\Zul'jarra's Forces",{
description="This guide will walk you through gaining renown and completing activities for \n"..
"the Zul'jarra's Forces faction of The Coiled Isle.",
areapoiid=8892,
areapoitype="faction (Zul'jarra's Forces)",
startlevel=90,
patch='120100',
},[[
step
Reach Renown Level 2 with Zul'jarra's Forces |complete factionrenown(2772) >= 2
|tip Complete daily quests, weekly quests, and zone quests in The Coiled Isle to gain renown.
|tip The Vaults of Atal'Utek quests and events and The Coiled Isle weekly quests grant large amounts of renown.
|tip Completing the Student of Hissstory achievement grants 2500 reputation.
|loadguide "Achievement Guides\\Exploration\\Midnight\\Student of Hissstory"
step
Reach Renown Level 3 with Zul'jarra's Forces |complete factionrenown(2772) >= 3
|tip Complete daily quests, weekly quests, and zone quests in The Coiled Isle to gain renown.
|tip The Vaults of Atal'Utek quests and events and The Coiled Isle weekly quests grant large amounts of renown.
|tip Completing the Student of Hissstory achievement grants 2500 reputation.
|loadguide "Achievement Guides\\Exploration\\Midnight\\Student of Hissstory"
step
Reach Renown Level 4 with Zul'jarra's Forces |complete factionrenown(2772) >= 4
|tip Complete daily quests, weekly quests, and zone quests in The Coiled Isle to gain renown.
|tip The Vaults of Atal'Utek quests and events and The Coiled Isle weekly quests grant large amounts of renown.
|tip Completing the Student of Hissstory achievement grants 2500 reputation.
|loadguide "Achievement Guides\\Exploration\\Midnight\\Student of Hissstory"
step
Reach Renown Level 5 with Zul'jarra's Forces |complete factionrenown(2772) >= 5
|tip Complete daily quests, weekly quests, and zone quests in The Coiled Isle to gain renown.
|tip The Vaults of Atal'Utek quests and events and The Coiled Isle weekly quests grant large amounts of renown.
|tip Completing the Student of Hissstory achievement grants 2500 reputation.
|loadguide "Achievement Guides\\Exploration\\Midnight\\Student of Hissstory"
step
Reach Renown Level 6 with Zul'jarra's Forces |complete factionrenown(2772) >= 6
|tip Complete daily quests, weekly quests, and zone quests in The Coiled Isle to gain renown.
|tip The Vaults of Atal'Utek quests and events and The Coiled Isle weekly quests grant large amounts of renown.
|tip Completing the Student of Hissstory achievement grants 2500 reputation.
|loadguide "Achievement Guides\\Exploration\\Midnight\\Student of Hissstory"
step
talk Jan'sari the Watchful##268228
accept A Handful of Voidlight Marl##97670 |goto The Coiled Isle/0 58.78,45.95
|tip If this quest is not available, skip this step.
step
Reach Renown Level 7 with Zul'jarra's Forces |complete factionrenown(2772) >= 7
|tip Complete daily quests, weekly quests, and zone quests in The Coiled Isle to gain renown.
|tip The Vaults of Atal'Utek quests and events and The Coiled Isle weekly quests grant large amounts of renown.
|tip Completing the Student of Hissstory achievement grants 2500 reputation.
|loadguide "Achievement Guides\\Exploration\\Midnight\\Student of Hissstory"
step
step
Reach Renown Level 8 with Zul'jarra's Forces |complete factionrenown(2772) >= 8
|tip Complete daily quests, weekly quests, and zone quests in The Coiled Isle to gain renown.
|tip The Vaults of Atal'Utek quests and events and The Coiled Isle weekly quests grant large amounts of renown.
|tip Completing the Student of Hissstory achievement grants 2500 reputation.
|loadguide "Achievement Guides\\Exploration\\Midnight\\Student of Hissstory"
step
talk Jan'sari the Watchful##268228
accept Spirit Corrosion##97383 |goto The Coiled Isle/0 58.78,45.95
step
Bring the Corrosive Relic to Er'inye in the Vaults of Atal'Utek |q 97383/1 |goto Vaults of Atal'Utek/0 51.16,62.80
step
talk Er'inye##262880
turnin Spirit Corrosion##97383 |goto Vaults of Atal'Utek/0 51.16,62.80
step
Reach Renown Level 9 with Zul'jarra's Forces |complete factionrenown(2772) >= 9
|tip Complete daily quests, weekly quests, and zone quests in The Coiled Isle to gain renown.
|tip The Vaults of Atal'Utek quests and events and The Coiled Isle weekly quests grant large amounts of renown.
|tip Completing the Student of Hissstory achievement grants 2500 reputation.
|loadguide "Achievement Guides\\Exploration\\Midnight\\Student of Hissstory"
step
talk Jan'sari the Watchful##268228
accept Spoils of the Vaults##97141 |goto The Coiled Isle/0 58.78,45.95
step
Purge the Temple |q 97141/1 |goto Vaults of Atal'Utek/0 47.10,40.39
|tip Complete Temple Strikes, Temple Patrols, Incursions, and kill elites or Ancient Foes in the Vaults of Atal'Utek.
step
talk Jan'sari the Watchful##268228
turnin Spoils of the Vaults##97141 |goto The Coiled Isle/0 58.78,45.95
step
Reach Renown Level 10 with Zul'jarra's Forces |complete factionrenown(2772) >= 10
|tip Complete daily quests, weekly quests, and zone quests in The Coiled Isle to gain renown.
|tip The Vaults of Atal'Utek quests and events and The Coiled Isle weekly quests grant large amounts of renown.
|tip Completing the Student of Hissstory achievement grants 2500 reputation.
|loadguide "Achievement Guides\\Exploration\\Midnight\\Student of Hissstory"
step
talk Du'gal##264611
accept Ancestral Gems##96267 |goto Vaults of Atal'Utek/0 50.48,63.88
step
click Ritual Gem+
click Reliquary Stash+
click Warded Lockbox+
|tip Lockboxes require keys dropped by the elite inside each crypt location.
|tip The Underbelly at the far north location is the most difficult.
|tip Gem objects will respawn in each location after a short period of time.
collect 30 Ritual Gem##273303 |q 96267/1 |goto Profaned Mausoleum/0 67.28,69.37
You can find more in:
[Atal'Utek Underbelly/0 52.29,58.44]
[Vault of Restless Bones/0 29.02,30.77]
step
talk Du'gal##264611
turnin Ancestral Gems##96267 |goto Vaults of Atal'Utek/0 50.48,63.88
step
Reach Renown Level 11 with Zul'jarra's Forces |complete factionrenown(2772) >= 11
|tip Complete daily quests, weekly quests, and zone quests in The Coiled Isle to gain renown.
|tip The Vaults of Atal'Utek quests and events and The Coiled Isle weekly quests grant large amounts of renown.
|tip Completing the Student of Hissstory achievement grants 2500 reputation.
|loadguide "Achievement Guides\\Exploration\\Midnight\\Student of Hissstory"
step
Reach Renown Level 12 with Zul'jarra's Forces |complete factionrenown(2772) >= 12
|tip Complete daily quests, weekly quests, and zone quests in The Coiled Isle to gain renown.
|tip The Vaults of Atal'Utek quests and events and The Coiled Isle weekly quests grant large amounts of renown.
|tip Completing the Student of Hissstory achievement grants 2500 reputation.
|loadguide "Achievement Guides\\Exploration\\Midnight\\Student of Hissstory"
step
talk Jan'sari the Watchful##268228
accept A Cluster of Voidlight Marl##97672 |goto The Coiled Isle/0 58.78,45.95
|tip If this quest is not available, skip this step.
step
Reach Renown Level 13 with Zul'jarra's Forces |complete factionrenown(2772) >= 13
|tip Complete daily quests, weekly quests, and zone quests in The Coiled Isle to gain renown.
|tip The Vaults of Atal'Utek quests and events and The Coiled Isle weekly quests grant large amounts of renown.
|tip Completing the Student of Hissstory achievement grants 2500 reputation.
|loadguide "Achievement Guides\\Exploration\\Midnight\\Student of Hissstory"
step
Reach Renown Level 14 with Zul'jarra's Forces |complete factionrenown(2772) >= 14
|tip Complete daily quests, weekly quests, and zone quests in The Coiled Isle to gain renown.
|tip The Vaults of Atal'Utek quests and events and The Coiled Isle weekly quests grant large amounts of renown.
|tip Completing the Student of Hissstory achievement grants 2500 reputation.
|loadguide "Achievement Guides\\Exploration\\Midnight\\Student of Hissstory"
step
talk Jan'sari the Watchful##268228
accept More Spirit Corrosion##97384 |goto The Coiled Isle/0 58.78,45.95
step
Bring the Corrosive Bijou to Er'inye in the Vaults of Atal'Utek |q 97384/1 |goto Vaults of Atal'Utek/0 51.16,62.80
step
talk Er'inye##262880
turnin More Spirit Corrosion##97384 |goto Vaults of Atal'Utek/0 51.16,62.80
step
Reach Renown Level 15 with Zul'jarra's Forces |complete factionrenown(2772) >= 15
|tip Complete daily quests, weekly quests, and zone quests in The Coiled Isle to gain renown.
|tip The Vaults of Atal'Utek quests and events and The Coiled Isle weekly quests grant large amounts of renown.
|tip Completing the Student of Hissstory achievement grants 2500 reputation.
|loadguide "Achievement Guides\\Exploration\\Midnight\\Student of Hissstory"
step
Reach Renown Level 16 with Zul'jarra's Forces |complete factionrenown(2772) >= 16
|tip Complete daily quests, weekly quests, and zone quests in The Coiled Isle to gain renown.
|tip The Vaults of Atal'Utek quests and events and The Coiled Isle weekly quests grant large amounts of renown.
|tip Completing the Student of Hissstory achievement grants 2500 reputation.
|loadguide "Achievement Guides\\Exploration\\Midnight\\Student of Hissstory"
step
Reach Renown Level 17 with Zul'jarra's Forces |complete factionrenown(2772) >= 17
|tip Complete daily quests, weekly quests, and zone quests in The Coiled Isle to gain renown.
|tip The Vaults of Atal'Utek quests and events and The Coiled Isle weekly quests grant large amounts of renown.
|tip Completing the Student of Hissstory achievement grants 2500 reputation.
|loadguide "Achievement Guides\\Exploration\\Midnight\\Student of Hissstory"
step
Reach Renown Level 18 with Zul'jarra's Forces |complete factionrenown(2772) >= 18
|tip Complete daily quests, weekly quests, and zone quests in The Coiled Isle to gain renown.
|tip The Vaults of Atal'Utek quests and events and The Coiled Isle weekly quests grant large amounts of renown.
|tip Completing the Student of Hissstory achievement grants 2500 reputation.
|loadguide "Achievement Guides\\Exploration\\Midnight\\Student of Hissstory"
step
Reach Renown Level 19 with Zul'jarra's Forces |complete factionrenown(2772) >= 19
|tip Complete daily quests, weekly quests, and zone quests in The Coiled Isle to gain renown.
|tip The Vaults of Atal'Utek quests and events and The Coiled Isle weekly quests grant large amounts of renown.
|tip Completing the Student of Hissstory achievement grants 2500 reputation.
|loadguide "Achievement Guides\\Exploration\\Midnight\\Student of Hissstory"
step
Reach Renown Level 20 with Zul'jarra's Forces |complete factionrenown(2772) >= 20
|tip Complete daily quests, weekly quests, and zone quests in The Coiled Isle to gain renown.
|tip The Vaults of Atal'Utek quests and events and The Coiled Isle weekly quests grant large amounts of renown.
|tip Completing the Student of Hissstory achievement grants 2500 reputation.
|loadguide "Achievement Guides\\Exploration\\Midnight\\Student of Hissstory"
]])
GoatQuest:RegisterGuide("Achievement Guides\\Exploration\\Midnight\\Student of Hissstory",{
patch='120100',
author="Original guide team",
description="This guide will teach you to obtain the Student of Hissstory achievement.",
achieveid={63662},
startlevel=90,
},[[
step
click Zandalari Logbook
|tip Under the water.
achieve 63662/9 |goto The Coiled Isle/0 71.94,44.91
step
click Worn Tablet
|tip Inside the building.
achieve 63662/3 |goto The Coiled Isle/0 69.99,65.95
step
click Amani Exile's Words
|tip Under the end of the log.
achieve 63662/2 |goto The Coiled Isle/0 57.35,80.36
step
click Abandoned Tablet
achieve 63662/4 |goto The Coiled Isle/0 50.70,68.37
step
Enter the Vaults |goto The Coiled Isle/0 45.75,64.92 < 20 |walk |notravel
click Head Mason's Tablet
|tip This is located straight ahead in the Vaults of Atal'Utek corridor.
achieve 63662/1 |goto The Coiled Isle/0 42.44,65.02 |notravel
step
click Message in a Bottle
achieve 63662/5 |goto The Coiled Isle/0 31.62,83.74
step
Enter the Vaults |goto The Coiled Isle/0 31.76,64.92 < 20 |walk |notravel
click Profaned Plaque
|tip To the left just inside the Vaults of Atal'Utek corridor.
achieve 63662/10 |goto The Coiled Isle/0 32.57,63.66 |notravel
step
click Forum Rules
achieve 63662/7 |goto The Coiled Isle/0 25.02,67.75
step
click Survival Journals
achieve 63662/8 |goto The Coiled Isle/0 34.09,36.45
step
click Oily Black Stone
achieve 63662/6 |goto The Coiled Isle/0 45.76,47.90
step
achieve 63662
]])
GoatQuest:RegisterGuide("Achievement Guides\\Exploration\\Midnight\\The Honored Dead",{
patch='120100',
author="Original guide team",
description="This guide will teach you to obtain the The Honored Dead achievement.",
achieveid={63610},
startlevel=90,
},[[
step
click Funerary Inscription
achieve 63610/7 |goto Vaults of Atal'Utek/0 45.84,61.79
step
click Funerary Inscription
achieve 63610/1 |goto Vaults of Atal'Utek/0 49.50,56.58
step
click Funerary Inscription
|tip Inside the crypt.
achieve 63610/3 |goto Profaned Mausoleum/0 13.00,64.19
step
click Funerary Inscription
achieve 63610/2 |goto Vaults of Atal'Utek/0 52.21,45.20
step
click Funerary Inscription
|tip Just inside the building.
achieve 63610/4 |goto Vaults of Atal'Utek/0 55.63,40.61
step
click Funerary Inscription
achieve 63610/5 |goto Vaults of Atal'Utek/0 52.91,33.89
step
click Funerary Inscription
achieve 63610/8 |goto Vaults of Atal'Utek/0 47.25,28.79
step
click Funerary Inscription
achieve 63610/12 |goto Vaults of Atal'Utek/0 56.48,22.90
step
click Funerary Inscription
achieve 63610/9 |goto Vaults of Atal'Utek/0 46.79,7.54
step
click Funerary Inscription
achieve 63610/11 |goto Vaults of Atal'Utek/0 42.53,33.06
step
click Funerary Inscription
achieve 63610/6 |goto Vaults of Atal'Utek/0 42.88,39.93
step
click Funerary Inscription
achieve 63610/10 |goto Vault of Restless Bones/0 77.01,36.87
step
achieve 63610
]])
