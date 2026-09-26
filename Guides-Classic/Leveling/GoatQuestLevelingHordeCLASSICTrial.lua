local GoatQuest=GoatQuest
if not GoatQuest then return end
if GQ.IsClassicSoD then return end
if UnitFactionGroup("player")~="Horde" then return end
if GQ:DoMutex("LevelingHCLASSIC") then return end
GoatQuest.GuideMenuTier = "TRI"
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Startup Guide Wizard")
GoatQuest:RegisterGuide("Leveling Guides\\Undead Starter (1-13)",{
image=GQ.IMAGESDIR.."Tirisfal Glades",
condition_suggested=function() return raceclass('Scourge') and level <= 13 end,
condition_suggested_exclusive=true,
condition_visible=function() return Undead end,
linked = {"Leveling Guides\\Hidden Guides"},
linkedhidden = true,
hardcore = true,
next="Leveling Guides\\Silverpine Forest (13-15)",
},[[
defaultfor Scourge
step
_NOTE:_
Wrong Character Race
|tip Guide written for {o}Undead{} characters.
|tip Other races may encounter issues.
Click Here to Continue |confirm
|only if not Undead
step
_Destroy This Item:_
|tip Saves bag space.
|tip You'll get one later.
trash Hearthstone##6948 |q 8 |future
step
talk Undertaker Mordo##1568
|tip Outside the crypt.
accept Rude Awakening##363 |goto Tirisfal Glades/0 30.22,71.65
step
kill Duskbat##1512, Young Scavenger##1508
|tip Loot items worth at least {o}10 copper{} to sell.
|tip Allows training a spell early.
|tip Increases leveling speed.
Click Here to Continue |confirm |goto Tirisfal Glades/0 29.40,69.60 |q 364 |future
|mapmarker Tirisfal Glades/0 28.40,67.40
|mapmarker Tirisfal Glades/0 31.60,71.00
|mapmarker Tirisfal Glades/0 32.00,68.40
|only if Warrior or Warlock
step
talk Blacksmith Rand##2116
|tip Inside the building.
Sell Items |vendor Blacksmith Rand##2116 |goto Tirisfal Glades/0 32.38,66.22 |q 364 |future
|only if Warrior or Warlock
step
talk Shadow Priest Sarvis##1569
|tip Inside the building.
turnin Rude Awakening##363 |goto Tirisfal Glades/0 30.84,66.20
accept The Mindless Ones##364 |goto Tirisfal Glades/0 30.84,66.20
step
talk Venya Marthand##5667
|tip Inside the building.
accept Piercing the Veil##1470 |goto Tirisfal Glades 30.98,66.41
|only if Scourge Warlock
step
talk Maximillion##2126
|tip Inside the building.
Select _"I submit myself for further training my master."_ |gossip 98050
Train Abilities |trainer Maximillion##2126 |goto Tirisfal Glades/0 30.91,66.34 |q 1470
|only if Warlock
stickystart "Kill_Mindless_Zombies_And_Wretched_Zombies"
step
kill Rattlecage Skeleton##1890+
collect 3 Rattlecage Skull##6281 |q 1470/1 |goto Tirisfal Glades 32.20,62.60
|mapmarker Tirisfal Glades/0 30.40,61.00
|mapmarker Tirisfal Glades/0 32.20,59.40
|mapmarker Tirisfal Glades/0 33.40,64.60
|only if Scourge Warlock
stickystop "Kill_Mindless_Zombies_And_Wretched_Zombies"
step
talk Venya Marthand##5667
|tip Inside the building.
turnin Piercing the Veil##1470 |goto Tirisfal Glades 30.98,66.41
|only if Scourge Warlock
step
Summon Your Imp |complete warlockpet("Imp") |q 364
|tip Cast {o}Summon Imp{}.
|only if Warlock
step
talk Dannal Stern##2119
|tip Inside the building.
Train Abilities |trainer Dannal Stern##2119 |goto Tirisfal Glades/0 32.65,65.61 |q 364
|only if Warrior
step
label "Kill_Mindless_Zombies_And_Wretched_Zombies"
kill 8 Mindless Zombie##1501 |q 364/1 |goto Tirisfal Glades 32.60,63.40
kill 8 Wretched Zombie##1502 |q 364/2 |goto Tirisfal Glades 32.60,63.40
|mapmarker Tirisfal Glades/0 30.40,62.00
|mapmarker Tirisfal Glades/0 30.40,64.00
|mapmarker Tirisfal Glades/0 33.80,65.60
|mapmarker Tirisfal Glades/0 34.40,62.40
step
talk Shadow Priest Sarvis##1569
|tip Inside the building.
turnin The Mindless Ones##364 |goto Tirisfal Glades 30.84,66.20
accept Simple Scroll##3095 |goto Tirisfal Glades 30.84,66.20		|only if Scourge Warrior
accept Tainted Scroll##3099 |goto Tirisfal Glades 30.84,66.20		|only if Scourge Warlock
accept Encrypted Scroll##3096 |goto Tirisfal Glades 30.84,66.20		|only if Scourge Rogue
accept Hallowed Scroll##3097 |goto Tirisfal Glades 30.84,66.20		|only if Scourge Priest
accept Glyphic Scroll##3098 |goto Tirisfal Glades 30.84,66.20		|only if Scourge Mage
accept Rattling the Rattlecages##3901 |goto Tirisfal Glades 30.84,66.20
step
talk Novice Elreth##1661
|tip Inside the building.
accept The Damned##376 |goto Tirisfal Glades 30.86,66.05
step
talk Isabella##2124
|tip Inside the building.
turnin Glyphic Scroll##3098 |goto Tirisfal Glades 30.94,66.06
|only if Scourge Mage
step
talk Isabella##2124
|tip Inside the building.
Train Abilities |trainer Isabella##2124 |goto Tirisfal Glades 30.94,66.06 |q 3901
|only if Mage
step
talk Maximillion##2126
|tip Inside the building.
turnin Tainted Scroll##3099 |goto Tirisfal Glades 30.91,66.34
|only if Scourge Warlock
step
talk Dark Cleric Duesten##2123
|tip Inside the building.
turnin Hallowed Scroll##3097 |goto Tirisfal Glades 31.11,66.03
|only if Scourge Priest
step
talk Dark Cleric Duesten##2123
|tip Inside the building.
Train Abilities |trainer Dark Cleric Duesten##2123 |goto Tirisfal Glades 31.11,66.03 |q 3901
|only if Priest
stickystart "Collect_Scavenger_Paws"
stickystart "Collect_Duskbat_Wings"
step
kill 12 Rattlecage Skeleton##1890 |q 3901/1 |goto Tirisfal Glades 32.20,62.60
|mapmarker Tirisfal Glades/0 30.40,61.00
|mapmarker Tirisfal Glades/0 32.20,59.40
|mapmarker Tirisfal Glades/0 33.40,64.60
step
label "Collect_Scavenger_Paws"
kill Young Scavenger##1508+
|tip Wolves.
collect 6 Scavenger Paw##3265 |q 376/1 |goto Tirisfal Glades 31.40,58.40
|mapmarker Tirisfal Glades/0 29.00,67.80
|mapmarker Tirisfal Glades/0 29.20,64.40
|mapmarker Tirisfal Glades/0 29.40,58.80
|mapmarker Tirisfal Glades/0 30.20,62.20
|mapmarker Tirisfal Glades/0 31.00,55.40
|mapmarker Tirisfal Glades/0 32.40,67.00
|mapmarker Tirisfal Glades/0 34.40,58.20
|mapmarker Tirisfal Glades/0 34.40,66.40
step
label "Collect_Duskbat_Wings"
kill Duskbat##1512+
|tip Bats.
collect 6 Duskbat Wing##3264 |q 376/2 |goto Tirisfal Glades 31.40,58.40
|mapmarker Tirisfal Glades/0 29.00,67.80
|mapmarker Tirisfal Glades/0 29.20,64.40
|mapmarker Tirisfal Glades/0 29.40,58.80
|mapmarker Tirisfal Glades/0 30.20,62.20
|mapmarker Tirisfal Glades/0 31.00,55.40
|mapmarker Tirisfal Glades/0 32.40,67.00
|mapmarker Tirisfal Glades/0 34.40,58.20
|mapmarker Tirisfal Glades/0 34.40,66.40
step
Kill enemies
|tip Helps reach level 4 after quest turnins.
ding 3,1000 |goto Tirisfal Glades 31.40,58.40
|mapmarker Tirisfal Glades/0 29.00,67.80
|mapmarker Tirisfal Glades/0 29.20,64.40
|mapmarker Tirisfal Glades/0 29.40,58.80
|mapmarker Tirisfal Glades/0 30.20,62.20
|mapmarker Tirisfal Glades/0 31.00,55.40
|mapmarker Tirisfal Glades/0 32.40,67.00
|mapmarker Tirisfal Glades/0 34.40,58.20
|mapmarker Tirisfal Glades/0 34.40,66.40
step
talk Novice Elreth##1661
|tip Inside the building.
turnin The Damned##376 |goto Tirisfal Glades 30.86,66.05
accept Marla's Last Wish##6395 |goto Tirisfal Glades 30.86,66.05
step
talk Shadow Priest Sarvis##1569
|tip Inside the building.
turnin Rattling the Rattlecages##3901 |goto Tirisfal Glades 30.83,66.20
step
talk Isabella##2124
|tip Inside the building.
Train Abilities |trainer Isabella##2124 |goto Tirisfal Glades 30.94,66.06 |q 6395
|only if Mage
step
talk Maximillion##2126
|tip Inside the building.
Select _"I submit myself for further training my master."_ |gossip 98050
Train Abilities |trainer Maximillion##2126 |goto Tirisfal Glades/0 30.91,66.34 |q 6395
|only if Warlock
step
talk Dark Cleric Duesten##2123
|tip Inside the building.
Train Abilities |trainer Dark Cleric Duesten##2123 |goto Tirisfal Glades 31.11,66.03 |q 6395
|only if Priest
step
talk Executor Arren##1570
accept Night Web's Hollow##380 |goto Tirisfal Glades 32.15,66.01
step
talk Dannal Stern##2119
|tip Inside the building.
turnin Simple Scroll##3095 |goto Tirisfal Glades 32.69,65.56
|only if Scourge Warrior
step
talk Dannal Stern##2119
|tip Inside the building.
Train Abilities |trainer Dannal Stern##2119 |goto Tirisfal Glades 32.69,65.56 |q 380
|only if Warrior
step
talk David Trias##2122
|tip Inside the building.
turnin Encrypted Scroll##3096 |goto Tirisfal Glades 32.53,65.65
|only if Scourge Rogue
step
talk David Trias##2122
|tip Inside the building.
Train Abilities |trainer David Trias##2122 |goto Tirisfal Glades 32.53,65.65 |q 380
|only if Rogue
step
talk Deathguard Saltain##1740
|tip Walks around.
accept Scavenging Deathknell##3902 |goto Tirisfal Glades 31.61,65.60
step
click Equipment Boxes+
|tip Piles of brown boxes.
|tip Near and inside buildings.
collect 6 Scavenged Goods##11127 |q 3902/1 |goto Tirisfal Glades 33.60,65.90
|mapmarker Tirisfal Glades/0 31.30,62.40
|mapmarker Tirisfal Glades/0 32.40,64.30
step
kill 10 Young Night Web Spider##1504 |q 380/1 |goto Tirisfal Glades 29.20,59.60
|tip Outside the mine.
|mapmarker Tirisfal Glades/0 27.20,56.80
|mapmarker Tirisfal Glades/0 27.20,59.20
|mapmarker Tirisfal Glades/0 29.40,57.40
step
kill 8 Night Web Spider##1505 |q 380/2 |goto Tirisfal Glades 26.84,59.41
|tip Inside the mine.
|mapmarker Tirisfal Glades/0 23.40,58.20
|mapmarker Tirisfal Glades/0 23.40,60.20
|mapmarker Tirisfal Glades/0 25.40,59.60
step
Kill enemies
|tip Helps reach level 5 after quest turnins.
|tip Inside and outside the mine.
ding 4,1500 |goto Tirisfal Glades/0 26.84,59.41
|mapmarker Tirisfal Glades/0 23.40,58.20
|mapmarker Tirisfal Glades/0 23.40,60.20
|mapmarker Tirisfal Glades/0 25.40,59.60
|mapmarker Tirisfal Glades/0 27.20,56.80
|mapmarker Tirisfal Glades/0 29.40,57.40
|mapmarker Tirisfal Glades/0 29.20,59.60
step
Allow Enemies to Kill You
|tip No death penalty at this level.
|tip Fast travel.
|tip Inside and outside the mine.
Die on Purpose |complete isdead |goto Tirisfal Glades/0 26.84,59.41 |q 380
|mapmarker Tirisfal Glades/0 23.40,58.20
|mapmarker Tirisfal Glades/0 23.40,60.20
|mapmarker Tirisfal Glades/0 25.40,59.60
|mapmarker Tirisfal Glades/0 27.20,56.80
|mapmarker Tirisfal Glades/0 29.40,57.40
|mapmarker Tirisfal Glades/0 29.20,59.60
|only if not hardcore()
step
talk Spirit Healer##6491
Select _"Return me to life."_ |gossip 96031
Resurrect at the Spirit Healer |complete not isdead |goto Tirisfal Glades 31.24,64.89 |q 380 |zombiewalk
|only if not hardcore()
step
Leave the mine |goto Tirisfal Glades/0 26.82,59.42 < 15 |walk |only if subzone("Night Web's Hollow") and indoors()
talk Deathguard Saltain##1740
|tip Walks around.
turnin Scavenging Deathknell##3902 |goto Tirisfal Glades 31.61,65.60
step
talk Executor Arren##1570
turnin Night Web's Hollow##380 |goto Tirisfal Glades 32.15,66.01
accept The Scarlet Crusade##381 |goto Tirisfal Glades 32.15,66.01
step
kill Scarlet Convert##1506, Scarlet Initiate##1507
collect 12 Scarlet Armband##3266 |q 381/1 |goto Tirisfal Glades 35.40,65.80
|mapmarker Tirisfal Glades/0 35.40,68.60
|mapmarker Tirisfal Glades/0 37.00,64.40
|mapmarker Tirisfal Glades/0 37.00,70.80
|mapmarker Tirisfal Glades/0 37.80,66.60
|mapmarker Tirisfal Glades/0 38.60,69.40
step
kill Samuel Fipps##1919
|tip Zombie.
|tip Walks around.
collect Samuel's Remains##16333 |goto Tirisfal Glades 36.68,61.57 |q 6395
step
Allow Enemies to Kill You
|tip No death penalty at this level.
|tip Fast travel.
Die on Purpose |complete isdead |goto Tirisfal Glades 37.61,61.37 |q 6395
|only if not hardcore()
step
talk Spirit Healer##6491
Select _"Return me to life."_ |gossip 96031
Resurrect at the Spirit Healer |complete not isdead |goto Tirisfal Glades 31.22,64.89 |q 6395 |zombiewalk
|only if not hardcore()
step
click Marla's Grave
Bury Samuel's Remains |q 6395/1 |goto Tirisfal Glades 31.17,65.08
step
talk Novice Elreth##1661
|tip Inside the building.
turnin Marla's Last Wish##6395 |goto Tirisfal Glades 30.86,66.05
step
talk Dark Cleric Duesten##2123
|tip Inside the building.
accept In Favor of Darkness##5651 |goto Tirisfal Glades 31.11,66.03
|only if Scourge Priest
step
talk Executor Arren##1570
turnin The Scarlet Crusade##381 |goto Tirisfal Glades 32.15,66.01
accept The Red Messenger##382 |goto Tirisfal Glades 32.15,66.01
step
kill Meven Korgal##1667
collect Scarlet Crusade Documents##2885 |q 382/1 |goto Tirisfal Glades/0 36.51,68.80
step
Kill enemies
|tip Helps reach level 6 after quest turnins.
ding 5,2150 |goto Tirisfal Glades 35.40,65.80
|mapmarker Tirisfal Glades/0 35.40,68.60
|mapmarker Tirisfal Glades/0 37.00,64.40
|mapmarker Tirisfal Glades/0 37.00,70.80
|mapmarker Tirisfal Glades/0 37.80,66.60
|mapmarker Tirisfal Glades/0 38.60,69.40
step
talk Executor Arren##1570
turnin The Red Messenger##382 |goto Tirisfal Glades/0 32.15,66.01
accept Vital Intelligence##383 |goto Tirisfal Glades/0 32.15,66.01
step
talk Isabella##2124
|tip Inside the building.
Train Abilities |trainer Isabella##2124 |goto Tirisfal Glades 30.94,66.06 |q 383
|only if Mage
step
talk Maximillion##2126
|tip Inside the building.
Select _"I submit myself for further training my master."_ |gossip 98050
Train Abilities |trainer Maximillion##2126 |goto Tirisfal Glades/0 30.91,66.34 |q 383
|only if Warlock
step
talk Kayla Smithe##5749
|tip Buy available Grimoires.
|tip Inside the building.
Train Demon Abilities |vendor Kayla Smithe##5749 |goto Tirisfal Glades/0 30.81,66.41 |q 383
|only if Warlock
step
talk Dark Cleric Duesten##2123
|tip Inside the building.
Train Abilities |trainer Dark Cleric Duesten##2123 |goto Tirisfal Glades 31.11,66.03 |q 383
|only if Priest
step
talk Dannal Stern##2119
|tip Inside the building.
Train Abilities |trainer Dannal Stern##2119 |goto Tirisfal Glades 32.69,65.56 |q 383
|only if Warrior
step
talk David Trias##2122
|tip Inside the building.
Train Abilities |trainer David Trias##2122 |goto Tirisfal Glades 32.53,65.65 |q 383
|only if Rogue
step
Watch the dialogue
talk Calvin Montague##6784
accept A Rogue's Deal##8 |goto Tirisfal Glades 38.23,56.79
step
talk Deathguard Simmer##1519
accept Fields of Grief##365 |goto Tirisfal Glades/0 40.91,54.16
step
map Tirisfal Glades
path	follow strictbounce;	loop off;	ants curved;	dist 30;	markers none;		arrow hide
path	40.78,54.49	41.11,54.83	41.44,55.04	42.36,55.03	42.68,54.93
path	43.40,54.44	43.79,54.47	44.36,55.23	45.04,56.24	45.36,56.47
path	45.99,56.70	46.59,56.97	47.23,57.32	48.59,57.85	49.15,57.94
path	50.04,57.90	50.50,57.66	51.21,56.46	51.58,55.83	51.77,55.45
path	51.95,55.09	53.64,53.22	53.92,52.93	54.19,52.78	54.59,52.64
path	55.02,52.32	55.30,52.29	55.73,52.47	56.18,52.48
talk Gordo##10666
|tip Abomination.
|tip Walks along the road.
|tip Sometimes leaves the road to collect plants.
accept Gordo's Task##5481
step
talk Deathguard Dillinger##1496
accept A Putrid Task##404 |goto Tirisfal Glades/0 58.20,51.44
step
talk Apothecary Johaan##1518
|tip Inside the building.
accept A New Plague##367 |goto Tirisfal Glades/0 59.45,52.40
step
talk Executor Zygand##1515
turnin Vital Intelligence##383 |goto Tirisfal Glades/0 60.59,51.76
accept At War With The Scarlet Crusade##427 |goto Tirisfal Glades/0 60.59,51.76
step
talk Innkeeper Renee##5688
|tip Inside the building.
turnin A Rogue's Deal##8 |goto Tirisfal Glades 61.71,52.05
step
talk Innkeeper Renee##5688
|tip Inside the building.
home Gallows' End Tavern |goto Tirisfal Glades 61.71,52.05 |q 837 |future
step
talk Dark Cleric Beryl##2129
|tip Upstairs inside the building.
turnin In Favor of Darkness##5651 |goto Tirisfal Glades 61.57,52.19
accept Garments of Darkness##5650 |goto Tirisfal Glades 61.57,52.19
|only if Scourge Priest
step
Heal and Fortify Deathguard Kel |q 5650/1 |goto Tirisfal Glades 59.18,46.50
|tip Cast {o}Lesser Heal (Rank 2){} on Deathguard Kel.
|tip Cast {o}Power Word: Fortitude{} on Deathguard Kel.
|only if Scourge Priest
step
talk Dark Cleric Beryl##2129
|tip Upstairs inside the building.
turnin Garments of Darkness##5650 |goto Tirisfal Glades 61.57,52.19
|only if Scourge Priest
step
kill Decrepit Darkhound##1547+
|tip Grey demon dogs.
collect 5 Darkhound Blood##2858 |q 367/1 |goto Tirisfal Glades 64.40,53.20
|mapmarker Tirisfal Glades/0 60.20,40.20
|mapmarker Tirisfal Glades/0 60.80,44.80
|mapmarker Tirisfal Glades/0 61.00,36.40
|mapmarker Tirisfal Glades/0 62.40,48.40
|mapmarker Tirisfal Glades/0 63.20,41.20
|mapmarker Tirisfal Glades/0 63.80,44.20
|mapmarker Tirisfal Glades/0 64.20,58.80
|mapmarker Tirisfal Glades/0 65.00,37.20
|mapmarker Tirisfal Glades/0 66.00,50.60
|mapmarker Tirisfal Glades/0 66.00,55.80
|mapmarker Tirisfal Glades/0 68.60,54.20
|mapmarker Tirisfal Glades/0 68.60,57.40
step
talk Apothecary Johaan##1518
|tip Inside the building.
turnin A New Plague##367 |goto Tirisfal Glades/0 59.45,52.40
accept A New Plague##368 |goto Tirisfal Glades/0 59.45,52.40
stickystart "Collect_Gloom_Weeds"
step
kill Ravaged Corpse##1526, Rotting Dead##1525
|tip Zombies.
collect 7 Putrid Claw##2855 |q 404/1 |goto Tirisfal Glades 53.20,54.00
|mapmarker Tirisfal Glades/0 49.20,55.60
|mapmarker Tirisfal Glades/0 51.20,51.40
|mapmarker Tirisfal Glades/0 51.40,47.80
|mapmarker Tirisfal Glades/0 51.40,58.80
|mapmarker Tirisfal Glades/0 53.60,45.40
|mapmarker Tirisfal Glades/0 54.20,50.20
|mapmarker Tirisfal Glades/0 54.80,57.00
|mapmarker Tirisfal Glades/0 56.00,47.60
step
Kill enemies
|tip Work your way {o}west{}.
ding 7 |goto Tirisfal Glades 50.00,56.40
|mapmarker Tirisfal Glades/0 39.60,50.70
|mapmarker Tirisfal Glades/0 39.70,54.20
|mapmarker Tirisfal Glades/0 40.40,57.40
|mapmarker Tirisfal Glades/0 41.40,52.00
|mapmarker Tirisfal Glades/0 41.60,59.10
|mapmarker Tirisfal Glades/0 42.40,54.30
|mapmarker Tirisfal Glades/0 43.30,57.40
|mapmarker Tirisfal Glades/0 43.60,59.80
|mapmarker Tirisfal Glades/0 43.90,51.90
|mapmarker Tirisfal Glades/0 44.50,54.10
|mapmarker Tirisfal Glades/0 45.30,56.20
|mapmarker Tirisfal Glades/0 45.50,59.10
|mapmarker Tirisfal Glades/0 45.70,50.40
|mapmarker Tirisfal Glades/0 46.50,52.40
|mapmarker Tirisfal Glades/0 47.10,61.40
|mapmarker Tirisfal Glades/0 48.00,57.90
|mapmarker Tirisfal Glades/0 48.20,53.70
|mapmarker Tirisfal Glades/0 49.00,60.20
|mapmarker Tirisfal Glades/0 50.30,53.90
|mapmarker Tirisfal Glades/0 50.80,58.90
|mapmarker Tirisfal Glades/0 51.40,52.00
|mapmarker Tirisfal Glades/0 52.10,49.90
|mapmarker Tirisfal Glades/0 52.70,54.70
|mapmarker Tirisfal Glades/0 53.50,57.30
|mapmarker Tirisfal Glades/0 53.60,52.70
|mapmarker Tirisfal Glades/0 55.40,58.00
|mapmarker Tirisfal Glades/0 56.10,53.80
step
label "Collect_Gloom_Weeds"
click Gloom Weed##175566+
|tip Withered purple plants.
|tip Work your way {o}west{}. |notinsticky
collect 3 Gloom Weed##12737 |q 5481/1 |goto Tirisfal Glades 50.00,56.40
|mapmarker Tirisfal Glades/0 39.60,50.70
|mapmarker Tirisfal Glades/0 39.70,54.20
|mapmarker Tirisfal Glades/0 40.40,57.40
|mapmarker Tirisfal Glades/0 41.40,52.00
|mapmarker Tirisfal Glades/0 41.60,59.10
|mapmarker Tirisfal Glades/0 42.40,54.30
|mapmarker Tirisfal Glades/0 43.30,57.40
|mapmarker Tirisfal Glades/0 43.60,59.80
|mapmarker Tirisfal Glades/0 43.90,51.90
|mapmarker Tirisfal Glades/0 44.50,54.10
|mapmarker Tirisfal Glades/0 45.30,56.20
|mapmarker Tirisfal Glades/0 45.50,59.10
|mapmarker Tirisfal Glades/0 45.70,50.40
|mapmarker Tirisfal Glades/0 46.50,52.40
|mapmarker Tirisfal Glades/0 47.10,61.40
|mapmarker Tirisfal Glades/0 48.00,57.90
|mapmarker Tirisfal Glades/0 48.20,53.70
|mapmarker Tirisfal Glades/0 49.00,60.20
|mapmarker Tirisfal Glades/0 50.30,53.90
|mapmarker Tirisfal Glades/0 50.80,58.90
|mapmarker Tirisfal Glades/0 51.40,52.00
|mapmarker Tirisfal Glades/0 52.10,49.90
|mapmarker Tirisfal Glades/0 52.70,54.70
|mapmarker Tirisfal Glades/0 53.50,57.30
|mapmarker Tirisfal Glades/0 53.60,52.70
|mapmarker Tirisfal Glades/0 55.40,58.00
|mapmarker Tirisfal Glades/0 56.10,53.80
step
click Tirisfal Pumpkin##375+
collect 10 Tirisfal Pumpkin##2846 |q 365/1 |goto Tirisfal Glades 36.30,51.20
|mapmarker Tirisfal Glades/0 34.30,49.80
|mapmarker Tirisfal Glades/0 34.40,52.20
|mapmarker Tirisfal Glades/0 37.30,49.00
step
kill 10 Scarlet Warrior##1535 |q 427/1 |goto Tirisfal Glades 32.80,50.40
|mapmarker Tirisfal Glades/0 29.80,49.40
|mapmarker Tirisfal Glades/0 30.80,46.40
|mapmarker Tirisfal Glades/0 33.60,45.20
|mapmarker Tirisfal Glades/0 36.80,48.00
step
Kill enemies
|tip Helps reach level 8 after quest turnins.
ding 7,2535 |goto Tirisfal Glades 32.80,50.40
|mapmarker Tirisfal Glades/0 29.80,49.40
|mapmarker Tirisfal Glades/0 30.80,46.40
|mapmarker Tirisfal Glades/0 33.60,45.20
|mapmarker Tirisfal Glades/0 36.80,48.00
step
talk Executor Zygand##1515
turnin At War With The Scarlet Crusade##427 |goto Tirisfal Glades/0 60.59,51.76
accept At War With The Scarlet Crusade##370 |goto Tirisfal Glades/0 60.59,51.76
step
talk Apothecary Johaan##1518
|tip Inside the building.
turnin Fields of Grief##365 |goto Tirisfal Glades/0 59.45,52.40
accept Fields of Grief##407 |goto Tirisfal Glades/0 59.45,52.40
step
talk Deathguard Dillinger##1496
turnin A Putrid Task##404 |goto Tirisfal Glades/0 58.20,51.45
accept The Mills Overrun##426 |goto Tirisfal Glades/0 58.20,51.45
step
map Tirisfal Glades
path	follow strictbounce;	loop off;	ants curved;	dist 30;	markers none;		arrow hide
path	59.25,46.73	59.10,47.09	58.81,47.44	58.51,47.71	58.17,47.95
path	57.87,48.13	57.68,48.41	57.59,48.81	57.67,48.97	57.67,49.36
path	57.85,49.63	58.13,49.74	58.29,49.90	58.31,50.42	58.20,49.75
path	57.84,49.62	57.62,49.30	57.50,49.33	57.36,49.22	57.37,48.96
path	57.59,48.71
talk Junior Apothecary Holland##10665
|tip Walks a large path.
turnin Gordo's Task##5481
accept Doom Weed##5482
step
talk Austil de Mon##2131
|tip Inside the building.
Train Abilities |trainer Austil de Mon##2131 |goto Tirisfal Glades/0 61.86,52.54 |q 784 |future
|only if Warrior
step
talk Captured Scarlet Zealot##1931
|tip Downstairs inside the building.
turnin Fields of Grief##407 |goto Tirisfal Glades/0 61.97,51.29
step
talk Cain Firesong##2128
|tip Upstairs inside the building.
Train Abilities |trainer Cain Firesong##2128 |goto Tirisfal Glades/0 61.97,52.47 |q 784 |future
|only if Mage
step
talk Rupert Boch##2127
|tip Upstairs inside the building.
Train Abilities |trainer Rupert Boch##2127 |goto Tirisfal Glades/0 61.59,52.40 |q 784 |future
|only if Warlock
step
talk Gina Lang##5750
|tip Upstairs inside the building.
Train Demon Abilities |vendor Gina Lang##5750 |goto Tirisfal Glades/0 61.55,52.61 |q 784 |future
|only if Warlock
step
talk Dark Cleric Beryl##2129
|tip Upstairs inside the building.
Train Abilities |trainer Dark Cleric Beryl##2129 |goto Tirisfal Glades/0 61.57,52.20 |q 784 |future
|only if Priest
step
talk Marion Call##2130
|tip Upstairs inside the building.
Train Abilities |trainer Marion Call##2130 |goto Tirisfal Glades/0 61.75,52.00 |q 784 |future
|only if Rogue
step
_NOTE:_
Use Weapon Stones
|tip We will train Mining and Blacksmithing.
|tip Allows you to make and use {o}Sharpening Stones{}.
|tip Increases damage.
|tip Mine {o}Copper Ore{} as you see it.
|tip Use the {g}Rough Stones{} to make sharpening stones.
Click Here to Continue |confirm |q 2161 |future
|only if Warrior or Rogue
step
talk Krunn##3175
Train Apprentice Mining |skillmax Mining,75 |goto Durotar/0 51.82,40.89
|only if Warrior or Rogue
step
talk Dwukk##3174
Train Apprentice Blacksmithing |skillmax Blacksmithing,75 |goto Durotar/0 52.03,40.72
|only if Warrior or Rogue
step
talk Flakk##3168
buy Mining Pick##2901 |goto Durotar/0 52.98,41.97
|only if Warrior or Rogue
step
talk Gar'Thok##3139
|tip Upstairs inside the building.
accept Vanquish the Betrayers##784 |goto Durotar 51.95,43.50
step
Follow the path up |goto Durotar 50.09,43.01 < 10 |only if walking
talk Furl Scornbrow##3147
|tip Top of the tower.
accept Carry Your Weight##791 |goto Durotar 49.89,40.38
step
talk Ukor##6786
accept A Peon's Burden##2161 |goto Durotar 52.06,68.31
step
talk Lar Prowltusk##3140
|tip Walks around.
|tip Multiple locations.
accept Thwarting Kolkar Aggression##786 |goto Durotar 54.19,73.29
|mapmarker Durotar/0 54.00,76.20
|mapmarker Durotar/0 54.40,74.20
step
talk Vel'rin Fang##3194
|tip Inside the building.
accept Practical Prey##817 |goto Durotar 55.96,73.92
step
talk Master Vornal##3304
accept A Solvent Spirit##818 |goto Durotar 55.94,74.39
step
talk Master Gadrin##3188
accept Minshina's Skull##808 |goto Durotar 55.95,74.72
accept Zalazane##826 |goto Durotar 55.95,74.72
accept Report to Orgnil##823 |goto Durotar 55.95,74.72
stickystart "Collect_Crawler_Mucus_Sticky_Only"
step
kill Makrura Clacker##3103, Makrura Shellhide##3104
|tip Lobsters.
|tip Follow the beach southwest.
|tip Skip when you reach the end of the beach.
|tip Can finish later.
collect 4 Intact Makrura Eye##4887 |q 818/1 |goto Durotar 60.20,70.80
|mapmarker Durotar/0 52.20,83.00
|mapmarker Durotar/0 55.00,81.40
|mapmarker Durotar/0 56.40,78.40
|mapmarker Durotar/0 58.40,73.40
step
label "Collect_Crawler_Mucus_Sticky_Only"
kill Pygmy Surf Crawler##3106+
|tip Crabs.
collect 8 Crawler Mucus##4888 |q 818/2 |goto Durotar 60.20,70.80
|mapmarker Durotar/0 52.20,83.00
|mapmarker Durotar/0 55.00,81.40
|mapmarker Durotar/0 56.40,78.40
|mapmarker Durotar/0 58.40,73.40
|sticky only
step
Follow the path |goto Durotar 50.85,79.14 < 15 |only if walking and not subzone("Kolkar Crag")
click Attack Plan: Valley of Trials
|tip Inside the building.
Destroy the Attack Plan: Valley of Trials |q 786/1 |goto Durotar 49.82,81.28
step
click Attack Plan: Sen'jin Village
Destroy the Attack Plan: Sen'jin Village |q 786/2 |goto Durotar 47.66,77.34
step
click Attack Plan: Orgrimmar
|tip Follow the path around.
Destroy the Attack Plan: Orgrimmar |q 786/3 |goto Durotar 46.23,78.95
step
Stand in the Fire
|tip No death penalty at this level.
|tip Fast travel.
Die on Purpose |complete isdead |goto Durotar 46.41,79.20 |q 786
|only if not hardcore()
step
talk Spirit Healer##6491
Select _"Return me to life."_ |gossip 96031
Resurrect at the Spirit Healer |complete not isdead |goto Durotar 57.49,73.26 |q 786 |zombiewalk
|only if not hardcore()
step
talk Master Vornal##3304
turnin A Solvent Spirit##818 |goto Durotar 55.94,74.39
|only if readyq(818)
step
talk Lar Prowltusk##3140
|tip Walks around.
|tip Multiple locations.
turnin Thwarting Kolkar Aggression##786 |goto Durotar 54.19,73.29
|mapmarker Durotar/0 54.00,76.20
|mapmarker Durotar/0 54.40,74.20
stickystart "Collect_Canvas_Scraps"
stickystart "Kill_Kul_Tiras_Enemies"
step
Enter the building |goto Durotar 58.99,58.30 < 15 |walk |only if not (subzone("Tiragarde Keep") and indoors())
kill Lieutenant Benedict##3192 |q 784/3 |goto Durotar 59.71,58.27
|tip Upstairs inside the building.
|tip May need help.
collect Benedict's Key##4882 |goto Durotar 59.71,58.27 |q 830 |future
step
Follow the path and run further up the stairs |goto Durotar 59.90,57.87 < 7 |walk
click Benedict's Chest
|tip Top of the building.
collect Aged Envelope##4881 |goto Durotar 59.26,57.66 |q 830 |future
step
use Aged Envelope##4881
accept The Admiral's Orders##830
step
label "Collect_Canvas_Scraps"
kill Kul Tiras Sailor##3128, Kul Tiras Marine##3129
collect 8 Canvas Scraps##4870 |q 791/1 |goto Durotar 55.40,51.20
|mapmarker Durotar/0 55.80,53.40
|mapmarker Durotar/0 56.20,56.80
|mapmarker Durotar/0 57.60,52.40
|mapmarker Durotar/0 58.40,58.20
|mapmarker Durotar/0 58.60,55.20
step
label "Kill_Kul_Tiras_Enemies"
kill 8 Kul Tiras Marine##3129 |q 784/2 |goto Durotar 55.80,53.40
kill 10 Kul Tiras Sailor##3128 |q 784/1 |goto Durotar 55.80,53.40
|mapmarker Durotar/0 55.40,51.20
|mapmarker Durotar/0 56.20,56.80
|mapmarker Durotar/0 57.60,52.40
|mapmarker Durotar/0 58.40,58.20
|mapmarker Durotar/0 58.60,55.20
step
talk Orgnil Soulscar##3142
turnin Report to Orgnil##823 |goto Durotar 52.25,43.15
step
talk Gar'Thok##3139
|tip Upstairs inside the building.
turnin Vanquish the Betrayers##784 |goto Durotar 51.95,43.50
accept From The Wreckage....##825 |goto Durotar 51.95,43.50
turnin The Admiral's Orders##830 |goto Durotar 51.95,43.50
accept The Admiral's Orders##831 |goto Durotar 51.95,43.50
accept Encroachment##837 |goto Durotar 51.95,43.50
step
talk Cook Torka##3191
|tip Walks around.
accept Break a Few Eggs##815 |goto Durotar 51.11,42.45
step
Follow the path up |goto Durotar 50.09,43.01 < 10 |only if walking
talk Furl Scornbrow##3147
|tip Top of the tower.
turnin Carry Your Weight##791 |goto Durotar 49.89,40.38
step
talk Innkeeper Grosk##6928
|tip Inside the building.
turnin A Peon's Burden##2161 |goto Durotar/0 51.52,41.65
step
talk Rawrk##5943
|tip Inside the building.
Train Apprentice First Aid |skillmax First Aid,75 |goto Durotar 54.17,41.93
|only if Warrior or Rogue
step
_NOTE:_
Create Bandages in Downtime
|tip While waiting for things like boats.
|tip Increases skill in First Aid.
|tip Need higher skill to make better bandages.
|tip Keep bandages to heal yourself.
Click Here to Continue |confirm |q 825
|only if Warrior or Rogue
stickystart "Collect_Crawler_Mucus"
stickystart "Collect_Intact_Makrura_Eyes"
step
click Gnomish Toolbox
|tip Grey metal chests.
|tip Inside and near sunken ships.
|tip Underwater.
collect 3 Gnomish Tools##4863 |q 825/1 |goto Durotar 61.40,56.20
|mapmarker Durotar/0 61.80,45.90
|mapmarker Durotar/0 62.10,41.80
|mapmarker Durotar/0 62.10,60.70
|mapmarker Durotar/0 63.80,53.00
|mapmarker Durotar/0 64.40,50.30
|mapmarker Durotar/0 63.30,57.40
stickystart "Collect_Taillasher_Eggs"
stickystart "Collect_Durotar_Tiger_Fur"
stickystart "Kill_Hexed_Trolls"
stickystart "Kill_Voodoo_Trolls"
step
kill Zalazane##3205
|tip Troll wearing a red robe.
|tip Walks around.
collect Zalazane's Head##4866 |q 826/3 |goto Durotar 67.40,86.40
|mapmarker Durotar/0 66.40,87.40
|mapmarker Durotar/0 67.60,87.80
stickystop "Collect_Crawler_Mucus"
stickystop "Collect_Intact_Makrura_Eyes"
step
click Imprisoned Darkspear
|tip Skulls.
collect Minshina's Skull##4864 |q 808/1 |goto Durotar 67.45,87.81
step
label "Kill_Hexed_Trolls"
kill 8 Hexed Troll##3207 |q 826/1 |goto Durotar 67.80,86.00
|mapmarker Durotar/0 65.40,83.40
|mapmarker Durotar/0 65.40,86.00
|mapmarker Durotar/0 66.40,88.60
|mapmarker Durotar/0 67.40,83.40
|mapmarker Durotar/0 68.20,81.40
step
label "Kill_Voodoo_Trolls"
kill 8 Voodoo Troll##3206 |q 826/2 |goto Durotar 67.20,87.00
|mapmarker Durotar/0 65.40,83.40
|mapmarker Durotar/0 65.40,86.00
|mapmarker Durotar/0 67.20,85.00
|mapmarker Durotar/0 67.80,82.20
step
label "Collect_Taillasher_Eggs"
click Taillasher Eggs+
|tip Clusters of purple eggs.
|tip Near trees.
collect 3 Taillasher Egg##4890 |q 815/1 |goto Durotar 63.90,86.80
|mapmarker Durotar/0 59.40,83.70
|mapmarker Durotar/0 59.80,89.60
|mapmarker Durotar/0 60.90,78.80
|mapmarker Durotar/0 62.10,96.30
|mapmarker Durotar/0 63.00,94.40
|mapmarker Durotar/0 63.40,74.40
|mapmarker Durotar/0 64.90,82.40
|mapmarker Durotar/0 67.20,80.60
|mapmarker Durotar/0 68.20,88.40
|mapmarker Durotar/0 68.70,74.40
|mapmarker Durotar/0 68.90,71.10
|mapmarker Durotar/0 69.20,82.20
step
label "Collect_Durotar_Tiger_Fur"
kill Durotar Tiger##3121+
collect 4 Durotar Tiger Fur##4892 |q 817/1 |goto Durotar 61.20,89.60
|mapmarker Durotar/0 60.20,82.40
|mapmarker Durotar/0 62.80,96.40
|mapmarker Durotar/0 64.60,81.20
|mapmarker Durotar/0 64.80,85.00
|mapmarker Durotar/0 67.00,71.40
|mapmarker Durotar/0 67.40,74.60
|mapmarker Durotar/0 68.40,80.40
|mapmarker Durotar/0 69.00,85.20
|mapmarker Durotar/0 69.60,69.80
|mapmarker Durotar/0 70.20,73.20
step
Kill enemies
|tip Helps reach level 10 after quest turnins.
ding 9,3550 |goto Durotar 61.20,89.60
|mapmarker Durotar/0 60.20,82.40
|mapmarker Durotar/0 62.80,96.40
|mapmarker Durotar/0 64.60,81.20
|mapmarker Durotar/0 64.80,85.00
|mapmarker Durotar/0 67.00,71.40
|mapmarker Durotar/0 67.40,74.60
|mapmarker Durotar/0 68.40,80.40
|mapmarker Durotar/0 69.00,85.20
|mapmarker Durotar/0 69.60,69.80
|mapmarker Durotar/0 70.20,73.20
|only if Mage
step
Allow Enemies to Kill You
|tip No death penalty at this level.
|tip Fast travel.
|tip Anywhere in Echo Isles.
Die on Purpose |complete isdead |goto Durotar 61.20,89.60 |q 817
|mapmarker Durotar/0 60.20,82.40
|mapmarker Durotar/0 62.80,96.40
|mapmarker Durotar/0 64.60,81.20
|mapmarker Durotar/0 64.80,85.00
|mapmarker Durotar/0 67.00,71.40
|mapmarker Durotar/0 67.40,74.60
|mapmarker Durotar/0 68.40,80.40
|mapmarker Durotar/0 69.00,85.20
|mapmarker Durotar/0 69.60,69.80
|mapmarker Durotar/0 70.20,73.20
|only if not hardcore()
step
talk Spirit Healer##6491
Select _"Return me to life."_ |gossip 96031
Resurrect at the Spirit Healer |complete not isdead |goto Durotar 57.50,73.26 |q 817 |zombiewalk
|only if not hardcore()
stickystart "Collect_Crawler_Mucus"
step
label "Collect_Intact_Makrura_Eyes"
kill Makrura Clacker##3103, Makrura Shellhide##3104
|tip Lobsters.
collect 4 Intact Makrura Eye##4887 |q 818/1 |goto Durotar 60.20,70.80
|mapmarker Durotar/0 52.20,83.00
|mapmarker Durotar/0 55.00,81.40
|mapmarker Durotar/0 56.40,78.40
|mapmarker Durotar/0 58.40,73.40
step
label "Collect_Crawler_Mucus"
kill Pygmy Surf Crawler##3106+
|tip Crabs.
collect 8 Crawler Mucus##4888 |q 818/2 |goto Durotar 60.20,70.80
|mapmarker Durotar/0 52.20,83.00
|mapmarker Durotar/0 55.00,81.40
|mapmarker Durotar/0 56.40,78.40
|mapmarker Durotar/0 58.40,73.40
step
talk Master Gadrin##3188
turnin Minshina's Skull##808 |goto Durotar 55.95,74.72
turnin Zalazane##826 |goto Durotar 55.95,74.72
step
talk Master Vornal##3304
turnin A Solvent Spirit##818 |goto Durotar 55.94,74.39
step
talk Vel'rin Fang##3194
|tip Inside the building.
turnin Practical Prey##817 |goto Durotar 55.95,73.93
step
talk Un'Thuwa##5880
|tip Inside the building.
Train Abilities |trainer Un'Thuwa##5880 |goto Durotar/0 56.31,75.11 |q 825
|only if Mage
step
talk Gar'Thok##3139
|tip Upstairs inside the building.
turnin From The Wreckage....##825 |goto Durotar 51.95,43.50
step
talk Cook Torka##3191
|tip Walks around.
turnin Break a Few Eggs##815 |goto Durotar 51.11,42.45
step
talk Tai'jin##3706
|tip Inside the building.
Train Abilities |trainer Tai'jin##3706 |goto Durotar/0 54.26,42.93 |q 837
|only if Priest
step
talk Tai'jin##3706
|tip Inside the building.
accept Touch of Weakness##5660 |goto Durotar/0 54.26,42.93
|only if Priest
step
talk Kaplak##3170
|tip Upstairs inside the building.
Train Abilities |trainer Kaplak##3170 |goto Durotar/0 51.98,43.69 |q 837
|only if Rogue
step
talk Dhugru Gorelust##3172
|tip Outside behind the building.
Train Abilities |trainer Dhugru Gorelust##3172 |goto Durotar/0 54.38,41.19 |q 837
|only if Warlock
step
talk Kitha##6027
|tip Buy available Grimoires.
|tip Outside behind the building.
Train Demon Abilities |vendor Kitha##6027 |goto Durotar/0 54.71,41.50 |q 837
|only if Warlock
step
talk Tarshaw Jaggedscar##3169
|tip Inside the building.
Train Abilities |trainer Tarshaw Jaggedscar##3169 |goto Durotar/0 54.19,42.47 |q 837
|only if Warrior
step
kill 4 Razormane Quilboar##3111 |q 837/1 |goto Durotar 50.00,49.60
kill 4 Razormane Scout##3112 |q 837/2 |goto Durotar 50.00,49.60
|mapmarker Durotar/0 44.20,49.40
|mapmarker Durotar/0 47.40,48.00
|mapmarker Durotar/0 51.00,48.20
step
kill 4 Razormane Dustrunner##3113 |q 837/3 |goto Durotar 42.40,40.60
kill 4 Razormane Battleguard##3114 |q 837/4 |goto Durotar 42.40,40.60
|mapmarker Durotar/0 41.20,37.80
|mapmarker Durotar/0 44.40,36.00
step
talk Gar'Thok##3139
|tip Upstairs inside the building.
turnin Encroachment##837 |goto Durotar 51.95,43.50
step
talk Innkeeper Grosk##6928
|tip Inside the building.
home Razor Hill |goto Durotar/0 51.52,41.65 |q 887 |future
step
talk Rezlak##3293
accept Winds in the Desert##834 |goto Durotar 46.37,22.94
step
click Stolen Supply Sack+
|tip Tan bags.
collect 5 Sack of Supplies##4918 |q 834/1 |goto Durotar 49.10,22.50
|mapmarker Durotar/0 47.20,29.70
|mapmarker Durotar/0 47.20,30.80
|mapmarker Durotar/0 47.30,33.50
|mapmarker Durotar/0 49.70,24.30
|mapmarker Durotar/0 49.70,32.20
|mapmarker Durotar/0 50.10,25.70
step
talk Rezlak##3293
turnin Winds in the Desert##834 |goto Durotar 46.37,22.94
accept Securing the Lines##835 |goto Durotar 46.37,22.94
step
Follow the path and run through the tunnel |goto Durotar 51.95,27.44 < 15 |only if walking and not subzone("Drygulch Ravine")
kill 8 Dustwind Storm Witch##3118 |q 835/2 |goto Durotar 53.20,24.60
kill 12 Dustwind Savage##3117 |q 835/1 |goto Durotar 53.20,24.60
|mapmarker Durotar/0 51.20,19.20
|mapmarker Durotar/0 51.40,21.00
|mapmarker Durotar/0 51.40,23.40
|mapmarker Durotar/0 52.60,21.40
|mapmarker Durotar/0 54.00,22.40
step
Allow Enemies to Kill You
|tip Fast travel.
Die on Purpose |complete isdead |goto Durotar 53.20,24.60 |q 835
|mapmarker Durotar/0 51.20,19.20
|mapmarker Durotar/0 51.40,21.00
|mapmarker Durotar/0 51.40,23.40
|mapmarker Durotar/0 52.60,21.40
|mapmarker Durotar/0 54.00,22.40
|only if not hardcore()
step
talk Spirit Healer##6491
Select _"Return me to life."_ |gossip 96031
Resurrect at the Spirit Healer |complete not isdead |goto Durotar 47.05,17.59 |q 835 |zombiewalk
|only if not hardcore()
step
Run through the tunnel |goto Durotar/0 53.51,27.79 < 15 |only if walking and subzone("Drygulch Ravine")
talk Rezlak##3293
turnin Securing the Lines##835 |goto Durotar 46.37,22.94
step
talk Doras##3310
|tip Top of the tower.
fpath Orgrimmar |goto Orgrimmar 45.13,63.90
step
talk Nazgrel##3230
|tip Inside the building.
turnin The Admiral's Orders##831 |goto Orgrimmar/0 32.27,35.80
step
talk Hanashi##2704
|tip Inside the building.
Train Staves |complete weaponskill("TH_STAFF") > 0 |goto Orgrimmar/0 81.53,19.63
|only if Warrior
step
talk Austil de Mon##2131
|tip Inside the building.
accept Speak with Dillinger##1818 |goto Tirisfal Glades 61.85,52.54
|only if Warrior
step
talk Coleman Farthing##1500
|tip Inside the building.
accept Deaths in the Family##354 |goto Tirisfal Glades/0 61.72,52.29
accept The Haunted Mills##362 |goto Tirisfal Glades/0 61.72,52.29
step
talk Cain Firesong##2128
|tip Upstairs inside the building.
accept Speak with Anastasia##1881 |goto Tirisfal Glades/0 61.97,52.47
|only if Mage
step
talk Gretchen Dedmar##1521
|tip Upstairs inside the building.
accept The Chill of Death##375 |goto Tirisfal Glades/0 61.89,52.73
step
talk Ageron Kargal##5724
|tip Upstairs inside the building.
accept Halgar's Summons##1478 |goto Tirisfal Glades/0 61.62,52.68
|only if Warlock
step
talk Marion Call##2130
|tip Upstairs inside the building.
accept Mennet Carkad##1885 |goto Tirisfal Glades 61.75,52.00
|only if Rogue
step
talk Deathguard Burgess##1652
accept Proof of Demise##374 |goto Tirisfal Glades/0 60.93,52.01
step
talk Magistrate Sevren##1499
|tip Inside the building.
accept Graverobbers##358 |goto Tirisfal Glades/0 61.26,50.84
step
click Wanted!
|tip Wanted poster.
accept Wanted: Maggot Eye##398 |goto Tirisfal Glades 60.73,51.52
step
talk Deathguard Dillinger##1496
turnin Speak with Dillinger##1818 |goto Tirisfal Glades 58.20,51.45
accept Ulag the Cleaver##1819 |goto Tirisfal Glades 58.20,51.45
|only if Warrior
step
click Mausoleum Trigger##104593
|tip Metal plate with skull icon.
Watch the dialogue
kill Ulag the Cleaver##6390 |q 1819/1 |goto Tirisfal Glades 59.16,48.51
|only if Warrior
step
talk Deathguard Dillinger##1496
turnin Ulag the Cleaver##1819 |goto Tirisfal Glades 58.20,51.45
accept Speak with Coleman##1820 |goto Tirisfal Glades 58.20,51.45
|only if Warrior
step
talk Coleman Farthing##1500
|tip Inside the building.
turnin Speak with Coleman##1820 |goto Tirisfal Glades 61.72,52.29
|only if Warrior
step
talk Carendin Halgar##5675
turnin Halgar's Summons##1478 |goto Undercity 85.04,26.01
accept Creature of the Void##1473 |goto Undercity 85.04,26.01
|only if Warlock
step
talk Mennet Carkad##6467
turnin Mennet Carkad##1885 |goto Undercity/0 83.51,69.11
accept The Deathstalkers##1886 |goto Undercity/0 83.51,69.11
|only if Rogue
step
talk Archibald##11870
Train Swords |complete weaponskill("SWORD") > 0 |goto Undercity 57.31,32.77
|only if Rogue
step
talk Aelthalyste##4606
turnin Touch of Weakness##5660 |goto Undercity/0 49.26,17.12
|only if Priest
step
talk Anastasia Hartwell##4568
|tip Upstairs inside the building.
turnin Speak with Anastasia##1881 |goto Undercity/0 85.14,10.03
accept The Balnir Farmstead##1882 |goto Undercity/0 85.14,10.03
|only if Mage
stickystart "Collect_Scarlet_Insignia_Rings"
stickystart "Kill_Scarlet_Zealots_And_Missionaries"
step
kill Captain Perrine##1662 |q 370/1 |goto Tirisfal Glades 51.13,67.80
|tip Inside the building. |notinsticky
step
click Perrine's Chest
|tip Inside the building.
collect Egalin's Grimoire##6285 |q 1473/1 |goto Tirisfal Glades 51.06,67.57
|only if Warlock
step
label "Collect_Scarlet_Insignia_Rings"
kill Scarlet Missionary##1536, Scarlet Zealot##1537
collect 10 Scarlet Insignia Ring##2875 |q 374/1 |goto Tirisfal Glades 53.40,65.40
|mapmarker Tirisfal Glades/0 50.40,68.20
|mapmarker Tirisfal Glades/0 53.60,69.00
step
label "Kill_Scarlet_Zealots_And_Missionaries"
kill 3 Scarlet Zealot##1537 |q 370/2 |goto Tirisfal Glades 53.40,65.40
kill 3 Scarlet Missionary##1536 |q 370/3 |goto Tirisfal Glades 53.40,65.40
|mapmarker Tirisfal Glades/0 50.40,68.20
|mapmarker Tirisfal Glades/0 53.60,69.00
step
talk Carendin Halgar##5675
turnin Creature of the Void##1473 |goto Undercity 85.04,26.01
accept The Binding##1471 |goto Undercity 85.04,26.01
|only if Warlock
step
use Runes of Summoning##6284
|tip On the pink symbol.
kill Summoned Voidwalker##5676 |q 1471/1 |goto Undercity 86.62,27.10
|only if Warlock
step
talk Carendin Halgar##5675
turnin The Binding##1471 |goto Undercity 85.04,26.01
|only if Warlock
step
kill Greater Duskbat##1553+
|tip Work your way {o}northwest{} to {o}Agamand Mills{}.
collect 5 Duskbat Pelt##2876 |q 375/1 |goto Tirisfal Glades 58.40,54.40
|mapmarker Tirisfal Glades/0 37.40,43.80
|mapmarker Tirisfal Glades/0 37.40,47.40
|mapmarker Tirisfal Glades/0 38.20,38.60
|mapmarker Tirisfal Glades/0 39.20,52.00
|mapmarker Tirisfal Glades/0 39.40,41.40
|mapmarker Tirisfal Glades/0 40.20,56.00
|mapmarker Tirisfal Glades/0 41.00,46.60
|mapmarker Tirisfal Glades/0 42.00,49.60
|mapmarker Tirisfal Glades/0 42.20,52.60
|mapmarker Tirisfal Glades/0 42.40,42.40
|mapmarker Tirisfal Glades/0 43.20,55.60
|mapmarker Tirisfal Glades/0 44.20,47.00
|mapmarker Tirisfal Glades/0 45.20,50.40
|mapmarker Tirisfal Glades/0 45.40,58.60
|mapmarker Tirisfal Glades/0 46.20,54.40
|mapmarker Tirisfal Glades/0 47.60,47.00
|mapmarker Tirisfal Glades/0 48.40,57.80
|mapmarker Tirisfal Glades/0 49.40,50.20
|mapmarker Tirisfal Glades/0 52.40,62.40
|mapmarker Tirisfal Glades/0 52.60,48.20
|mapmarker Tirisfal Glades/0 53.00,65.60
|mapmarker Tirisfal Glades/0 54.80,60.20
|mapmarker Tirisfal Glades/0 55.40,53.00
|mapmarker Tirisfal Glades/0 56.20,57.40
|mapmarker Tirisfal Glades/0 56.80,62.60
|mapmarker Tirisfal Glades/0 59.40,57.80
|mapmarker Tirisfal Glades/0 60.40,61.00
stickystart "Collect_Notched_Ribs"
stickystart "Collect_Blackened_Skulls"
step
kill Devlin Agamand##1657
|tip Armored skeleton mage.
|tip Walks around.
collect Devlin's Remains##2831 |q 362/1 |goto Tirisfal Glades 47.40,41.60
|mapmarker Tirisfal Glades/0 46.80,39.40
step
kill Nissa Agamand##1655
|tip Banshee.
|tip Walks around.
|tip {o}Both floors{} inside the building.
collect Nissa's Remains##2828 |q 354/2 |goto Tirisfal Glades 49.54,36.02
step
kill Gregor Agamand##1654
|tip Ghoul.
|tip Walks around.
collect Gregor's Remains##2829 |q 354/1 |goto Tirisfal Glades 46.40,30.60
|mapmarker Tirisfal Glades/0 44.40,30.20
|mapmarker Tirisfal Glades/0 45.40,28.40
step
kill Thurman Agamand##1656
|tip Zombie.
|tip Walks around.
collect Thurman's Remains##2830 |q 354/3 |goto Tirisfal Glades 43.40,34.20
|mapmarker Tirisfal Glades/0 42.40,31.80
step
label "Collect_Notched_Ribs"
kill Cracked Skull Soldier##1523, Rattlecage Soldier##1520
|tip Armored skeletons.
collect 5 Notched Rib##3162 |q 426/1 |goto Tirisfal Glades 48.40,35.80
|mapmarker Tirisfal Glades/0 42.40,33.20
|mapmarker Tirisfal Glades/0 43.40,39.80
|mapmarker Tirisfal Glades/0 44.00,36.00
|mapmarker Tirisfal Glades/0 44.40,29.20
|mapmarker Tirisfal Glades/0 45.40,42.60
|mapmarker Tirisfal Glades/0 46.00,33.40
|mapmarker Tirisfal Glades/0 48.20,28.40
|mapmarker Tirisfal Glades/0 48.20,41.40
|mapmarker Tirisfal Glades/0 49.60,32.40
|mapmarker Tirisfal Glades/0 50.60,43.40
step
label "Collect_Blackened_Skulls"
kill Darkeye Bonecaster##1522+
|tip Skeleton mages.
collect 3 Blackened Skull##3163 |q 426/2 |goto Tirisfal Glades 48.00,37.60
|mapmarker Tirisfal Glades/0 42.80,32.20
|mapmarker Tirisfal Glades/0 44.40,37.40
|mapmarker Tirisfal Glades/0 45.40,30.60
|mapmarker Tirisfal Glades/0 45.40,40.60
|mapmarker Tirisfal Glades/0 46.60,33.40
|mapmarker Tirisfal Glades/0 47.40,43.00
|mapmarker Tirisfal Glades/0 49.60,34.60
step
use A Letter to Yvette##2839
accept A Letter Undelivered##361
|only if itemcount(2839) > 0
stickystart "Kill_Rot_Hide_Mongrels"
stickystart "Collect_Embalming_Ichors"
step
Jump down carefully |goto Tirisfal Glades/0 54.28,31.67 < 30 |only if walking and subzone("Agamand Mills")
kill Maggot Eye##1753
|tip Inside the building.
collect Maggot Eye's Paw##3635 |q 398/1 |goto Tirisfal Glades 58.66,30.76
stickystop "Kill_Rot_Hide_Mongrels"
stickystop "Collect_Embalming_Ichors"
step
kill Vile Fin Puddlejumper##1543, Vile Fin Minor Oracle##1544, Vile Fin Muckdweller##1545
|tip Murlocs.
collect 5 Vile Fin Scale##2859 |q 368/1 |goto Tirisfal Glades 62.40,28.80
|mapmarker Tirisfal Glades/0 65.00,27.20
|mapmarker Tirisfal Glades/0 65.20,31.60
|mapmarker Tirisfal Glades/0 67.40,29.20
|mapmarker Tirisfal Glades/0 69.00,25.40
|mapmarker Tirisfal Glades/0 70.60,28.00
|mapmarker Tirisfal Glades/0 72.00,24.20
|mapmarker Tirisfal Glades/0 74.00,28.60
|mapmarker Tirisfal Glades/0 75.80,25.40
stickystart "Collect_Embalming_Ichors"
step
label "Kill_Rot_Hide_Mongrels"
kill 5 Rot Hide Mongrel##1675 |q 358/2 |goto Tirisfal Glades 59.40,33.60
|mapmarker Tirisfal Glades/0 56.40,33.40
|mapmarker Tirisfal Glades/0 56.40,40.20
|mapmarker Tirisfal Glades/0 58.20,30.40
|mapmarker Tirisfal Glades/0 58.20,36.60
|mapmarker Tirisfal Glades/0 60.60,38.60
stickystart "Collect_Doom_Weed"
step
kill 8 Rot Hide Graverobber##1941 |q 358/1 |goto Tirisfal Glades 55.37,42.34
|mapmarker Tirisfal Glades/0 53.20,43.40
|mapmarker Tirisfal Glades/0 55.40,39.20
|mapmarker Tirisfal Glades/0 56.20,44.80
|mapmarker Tirisfal Glades/0 57.80,41.80
step
label "Collect_Doom_Weed"
click Doom Weed##176753+
|tip Withered purple plants.
collect 10 Doom Weed##13702 |q 5482/1 |goto Tirisfal Glades 57.80,38.40
|mapmarker Tirisfal Glades/0 54.80,39.00
|mapmarker Tirisfal Glades/0 54.90,43.10
|mapmarker Tirisfal Glades/0 57.00,34.80
|mapmarker Tirisfal Glades/0 58.30,42.00
step
label "Collect_Embalming_Ichors"
kill Rot Hide Graverobber##1941, Rot Hide Gnoll##1674, Rot Hide Mongrel##1675
|tip Gnolls.
collect 8 Embalming Ichor##2834 |q 358/3 |goto Tirisfal Glades 58.20,41.20
|mapmarker Tirisfal Glades/0 53.20,43.40
|mapmarker Tirisfal Glades/0 55.40,39.20
|mapmarker Tirisfal Glades/0 56.40,34.40
|mapmarker Tirisfal Glades/0 58.20,30.40
|mapmarker Tirisfal Glades/0 58.40,44.80
|mapmarker Tirisfal Glades/0 59.60,33.40
|mapmarker Tirisfal Glades/0 60.60,38.60
step
map Tirisfal Glades
path	follow strictbounce;	loop off;	ants curved;	dist 30;	markers none;		arrow hide
path	59.25,46.73	59.10,47.09	58.81,47.44	58.51,47.71	58.17,47.95
path	57.87,48.13	57.68,48.41	57.59,48.81	57.67,48.97	57.67,49.36
path	57.85,49.63	58.13,49.74	58.29,49.90	58.31,50.42	58.20,49.75
path	57.84,49.62	57.62,49.30	57.50,49.33	57.36,49.22	57.37,48.96
path	57.59,48.71
talk Junior Apothecary Holland##10665
|tip Walks a large path.
turnin Doom Weed##5482
step
talk Deathguard Dillinger##1496
turnin The Mills Overrun##426 |goto Tirisfal Glades/0 58.20,51.45
step
talk Apothecary Johaan##1518
|tip Inside the building.
turnin A New Plague##368 |goto Tirisfal Glades/0 59.45,52.40
accept A New Plague##369 |goto Tirisfal Glades/0 59.45,52.40
step
talk Executor Zygand##1515
turnin At War With The Scarlet Crusade##370 |goto Tirisfal Glades/0 60.59,51.76
accept At War With The Scarlet Crusade##371 |goto Tirisfal Glades/0 60.59,51.76
turnin Wanted: Maggot Eye##398 |goto Tirisfal Glades/0 60.59,51.76
step
talk Magistrate Sevren##1499
|tip Inside the building.
turnin Graverobbers##358 |goto Tirisfal Glades/0 61.26,50.84
accept Forsaken Duties##359 |goto Tirisfal Glades/0 61.26,50.84
step
talk Deathguard Burgess##1652
turnin Proof of Demise##374 |goto Tirisfal Glades/0 60.93,52.01
step
talk Abigail Shiel##2118
buy Coarse Thread##2320 |q 375/2 |goto Tirisfal Glades 61.03,52.37
step
talk Yvette Farthing##1560
|tip Inside the building.
turnin A Letter Undelivered##361 |goto Tirisfal Glades/0 61.58,52.60
|only if haveq(361) or completedq(361)
step
talk Coleman Farthing##1500
|tip Inside the building.
turnin Deaths in the Family##354 |goto Tirisfal Glades/0 61.72,52.29
turnin The Haunted Mills##362 |goto Tirisfal Glades/0 61.72,52.29
accept Speak with Sevren##355 |goto Tirisfal Glades/0 61.72,52.29
step
talk Gretchen Dedmar##1521
|tip Upstairs inside the building.
turnin The Chill of Death##375 |goto Tirisfal Glades 61.89,52.73
step
talk Austil de Mon##2131
|tip Inside the building.
Train Abilities |trainer Austil de Mon##2131 |goto Tirisfal Glades/0 61.86,52.54 |q 359
|only if Warrior
step
talk Cain Firesong##2128
|tip Upstairs inside the building.
Train Abilities |trainer Cain Firesong##2128 |goto Tirisfal Glades/0 61.97,52.47 |q 359
|only if Mage
step
talk Rupert Boch##2127
|tip Upstairs inside the building.
Train Abilities |trainer Rupert Boch##2127 |goto Tirisfal Glades/0 61.59,52.40 |q 359
|only if Warlock
step
talk Gina Lang##5750
|tip Upstairs inside the building.
Train Demon Abilities |vendor Gina Lang##5750 |goto Tirisfal Glades/0 61.55,52.61 |q 359
|only if Warlock
step
talk Dark Cleric Beryl##2129
|tip Upstairs inside the building.
Train Abilities |trainer Dark Cleric Beryl##2129 |goto Tirisfal Glades/0 61.57,52.20 |q 359
|only if Priest
step
talk Marion Call##2130
|tip Upstairs inside the building.
Train Abilities |trainer Marion Call##2130 |goto Tirisfal Glades/0 61.75,52.00 |q 359
|only if Rogue
step
talk Deathguard Linnea##1495
turnin Forsaken Duties##359 |goto Tirisfal Glades 65.49,60.25
accept Return to the Magistrate##360 |goto Tirisfal Glades 65.49,60.25
accept Rear Guard Patrol##356 |goto Tirisfal Glades 65.49,60.25
stickystart "Kill_Bleeding_Horrors_And_Wandering_Spirits"
step
click Balnir Snapdragons
collect Balnir Snapdragons##7227 |q 1882/1 |goto Tirisfal Glades/0 76.94,62.38
|only if Mage
step
label "Kill_Bleeding_Horrors_And_Wandering_Spirits"
kill 8 Bleeding Horror##1529 |q 356/1 |goto Tirisfal Glades 75.54,60.85
kill 8 Wandering Spirit##1532 |q 356/2 |goto Tirisfal Glades 75.54,60.85
|mapmarker Tirisfal Glades/0 73.40,61.20
|mapmarker Tirisfal Glades/0 75.20,58.40
|mapmarker Tirisfal Glades/0 76.40,62.60
|mapmarker Tirisfal Glades/0 78.60,59.00
stickystart "Kill_Scarlet_Friars"
step
kill Captain Vachon##1664 |q 371/1 |goto Tirisfal Glades 78.82,56.13
|tip Inside the building.
step
label "Kill_Scarlet_Friars"
kill 5 Scarlet Friar##1538 |q 371/2 |goto Tirisfal Glades 79.60,55.80
|mapmarker Tirisfal Glades/0 76.40,54.80
|mapmarker Tirisfal Glades/0 81.60,53.00
step
kill Vicious Night Web Spider##1555+
collect 4 Vicious Night Web Spider Venom##2872 |q 369/1 |goto Tirisfal Glades 83.40,51.40
|mapmarker Tirisfal Glades/0 82.00,54.20
|mapmarker Tirisfal Glades/0 84.20,45.40
|mapmarker Tirisfal Glades/0 85.00,54.60
|mapmarker Tirisfal Glades/0 85.20,48.40
|mapmarker Tirisfal Glades/0 85.40,58.00
|mapmarker Tirisfal Glades/0 87.20,51.60
|mapmarker Tirisfal Glades/0 90.20,49.40
step
Kill enemies
|tip Helps reach level 13 after quest turnins.
ding 12,7030 |goto Tirisfal Glades 83.40,51.40
|mapmarker Tirisfal Glades/0 82.00,54.20
|mapmarker Tirisfal Glades/0 84.20,45.40
|mapmarker Tirisfal Glades/0 85.00,54.60
|mapmarker Tirisfal Glades/0 85.20,48.40
|mapmarker Tirisfal Glades/0 85.40,58.00
|mapmarker Tirisfal Glades/0 87.20,51.60
|mapmarker Tirisfal Glades/0 90.20,49.40
step
talk Deathguard Linnea##1495
turnin Rear Guard Patrol##356 |goto Tirisfal Glades 65.49,60.25
step
talk Magistrate Sevren##1499
|tip Inside the building.
turnin Speak with Sevren##355 |goto Tirisfal Glades 61.26,50.84
turnin Return to the Magistrate##360 |goto Tirisfal Glades 61.26,50.84
step
talk Executor Zygand##1515
turnin At War With The Scarlet Crusade##371 |goto Tirisfal Glades 60.58,51.77
step
talk Apothecary Johaan##1518
|tip Inside the building.
turnin A New Plague##369 |goto Tirisfal Glades 59.45,52.40
accept A New Plague##492 |goto Tirisfal Glades 59.45,52.40
accept Delivery to Silverpine Forest##445 |goto Tirisfal Glades 59.45,52.40
step
talk Captured Mountaineer##2211
|tip Downstairs inside the building.
turnin A New Plague##492 |goto Tirisfal Glades 61.94,51.40
step
talk Anastasia Hartwell##4568
|tip Upstairs inside the building.
turnin The Balnir Farmstead##1882 |goto Undercity/0 85.14,10.03
|only if Mage
step
map Tirisfal Glades
path follow strictbounce;	loop off;	ants straight;		dist 30;	markers none;		arrow hide
path	61.56,53.14	61.60,53.36	61.64,53.56	61.57,53.84	61.82,54.60
path	62.06,55.15	62.24,55.46	62.42,55.59	62.71,55.62	63.02,55.65
path	63.20,55.82	63.39,56.32	63.63,57.16	63.72,57.75	63.73,58.47
path	63.69,58.86	63.50,59.59	63.34,59.98	63.08,60.39	62.40,61.00
path	61.63,61.79	61.26,62.15	60.75,62.60	59.92,63.22	59.23,63.78
path	58.78,64.10	58.37,64.30	57.47,64.66	56.86,65.04	56.39,65.51
path	56.04,66.14	55.90,66.56	55.56,68.13	55.35,69.34	55.30,69.84
path	55.13,70.67	54.93,72.43	54.64,74.02	54.35,75.15
map Silverpine Forest
path	67.83,4.94	67.37,5.83	66.52,7.07	65.77,7.97	64.60,8.89
path	63.41,9.66	62.98,9.99	61.82,10.67	60.88,11.21	59.11,11.78
path	58.05,12.22	57.29,12.76	56.66,13.46	55.50,15.32	54.85,16.58
path	53.91,18.70	53.06,20.64	52.04,22.17	51.32,23.71	50.64,25.30
path	50.22,26.19	49.98,26.95	49.74,28.76	49.74,30.13	49.67,32.29
path	49.73,33.04	49.97,33.84	50.33,34.49	50.69,35.08	50.99,35.71
path	51.12,36.33	51.04,36.69	50.57,37.18	49.83,37.76	49.08,38.27
path	48.38,38.77	48.01,39.14	47.50,39.80
talk Astor Hadren##6497
|tip Undead.
Select _"You're Astor Hadren, right?"_
Select _"You've got something I need, Astor. And I'll be taking it now."_
kill Astor Hadren##6497
|tip Walks the road between {o}Brill{} and {o}The Sepulcher{}.
collect Astor's Letter of Introduction##7231 |q 1886/1
Spawns near The Sepulcher at [Silverpine Forest/0 47.50,39.80] |noway
|only if Rogue
]])
GoatQuest:RegisterGuide("Leveling Guides\\Tauren Starter (1-13)",{
image=GQ.IMAGESDIR.."Mulgore",
condition_suggested=function() return raceclass('Tauren') and level <= 13 end,
condition_suggested_exclusive=true,
condition_visible=function() return Tauren end,
linked = {"Leveling Guides\\Hidden Guides"},
linkedhidden = true,
hardcore = true,
next="Leveling Guides\\Silverpine Forest (13-15)",
},[[
defaultfor Tauren
step
_NOTE:_
Wrong Character Race
|tip Guide written for {o}Tauren{} characters.
|tip Other races may encounter issues.
Click Here to Continue |confirm
|only if not Tauren
step
_Destroy This Item:_
|tip Saves bag space.
|tip You'll get one later.
trash Hearthstone##6948 |q 1656 |future
|only if not hardcore()
step
_NOTE:_
Manage Your Ammo
|tip Make sure you always have ammo.
|tip You need it to attack enemies.
|tip {o}General Goods{} vendors sell it (also Bow & Gun vendors).
|tip Try to keep your ammo bag full.
Click Here to Continue |confirm |q 747 |future
|only if Hunter
step
kill Plainstrider##2955+
|tip Loot items worth at least {o}10 copper{} to sell.
|tip Allows training a spell early.
|tip Increases leveling speed.
Click Here to Continue |confirm |goto Mulgore 45.40,81.20 |q 747 |future
|mapmarker Mulgore/0 42.40,76.40
|mapmarker Mulgore/0 42.40,80.40
|mapmarker Mulgore/0 43.40,85.00
|mapmarker Mulgore/0 44.20,88.20
|mapmarker Mulgore/0 45.40,74.00
|mapmarker Mulgore/0 46.60,85.80
|mapmarker Mulgore/0 48.00,82.80
|mapmarker Mulgore/0 48.20,75.20
|mapmarker Mulgore/0 49.00,79.80
|mapmarker Mulgore/0 49.60,86.80
|mapmarker Mulgore/0 50.60,77.20
|mapmarker Mulgore/0 51.60,74.00
|mapmarker Mulgore/0 51.60,81.60
|mapmarker Mulgore/0 52.00,84.80
|mapmarker Mulgore/0 54.00,87.40
|only if Warrior or Shaman
step
talk Kawnie Softbreeze##3072
|tip Inside the building.
Sell Items |vendor Kawnie Softbreeze##3072 |goto Mulgore/0 45.30,76.52 |q 747 |future
|only if Warrior or Shaman
step
talk Grull Hawkwind##2980
accept The Hunt Begins##747 |goto Mulgore/0 44.88,77.07
step
talk Meela Dawnstrider##3062
|tip Inside the building.
Train Abilities |trainer Meela Dawnstrider##3062 |goto Mulgore/0 45.02,75.95 |q 747
|only if Shaman
step
talk Chief Hawkwind##2981
|tip Inside the building.
accept A Humble Task##752 |goto Mulgore/0 44.18,76.06
step
talk Harutt Thunderhorn##3059
|tip Inside the building.
Train Abilities |trainer Harutt Thunderhorn##3059 |goto Mulgore/0 44.01,76.13 |q 752
|only if Warrior
stickystart "Collect_Plainstrider_Meat_And_Feathers"
step
talk Greatmother Hawkwind##2991
turnin A Humble Task##752 |goto Mulgore/0 50.03,81.16
accept A Humble Task##753 |goto Mulgore/0 50.03,81.16
step
click Water Pitcher
collect Water Pitcher##4755 |q 753/1 |goto Mulgore/0 50.21,81.36
step
label "Collect_Plainstrider_Meat_And_Feathers"
kill Plainstrider##2955+
collect 7 Plainstrider Meat##4739 |q 747/1 |goto Mulgore/0 49.00,79.80
collect 7 Plainstrider Feather##4740 |q 747/2 |goto Mulgore/0 49.00,79.80
|mapmarker Mulgore/0 42.40,76.40
|mapmarker Mulgore/0 42.40,80.40
|mapmarker Mulgore/0 43.40,85.00
|mapmarker Mulgore/0 44.20,88.20
|mapmarker Mulgore/0 45.40,74.00
|mapmarker Mulgore/0 46.60,85.80
|mapmarker Mulgore/0 48.00,82.80
|mapmarker Mulgore/0 48.20,75.20
|mapmarker Mulgore/0 45.40,81.20
|mapmarker Mulgore/0 49.60,86.80
|mapmarker Mulgore/0 50.60,77.20
|mapmarker Mulgore/0 51.60,74.00
|mapmarker Mulgore/0 51.60,81.60
|mapmarker Mulgore/0 52.00,84.80
|mapmarker Mulgore/0 54.00,87.40
step
talk Grull Hawkwind##2980
turnin The Hunt Begins##747 |goto Mulgore/0 44.88,77.07
accept Simple Note##3091 |goto Mulgore/0 44.88,77.07			|only Tauren Warrior
accept Rune-Inscribed Note##3093 |goto Mulgore/0 44.88,77.07		|only Tauren Shaman
accept Etched Note##3092 |goto Mulgore/0 44.88,77.07			|only Tauren Hunter
accept Verdant Note##3094 |goto Mulgore/0 44.88,77.07			|only Tauren Druid
accept The Hunt Continues##750 |goto Mulgore/0 44.88,77.07
step
talk Meela Dawnstrider##3062
|tip Inside the building.
turnin Rune-Inscribed Note##3093 |goto Mulgore 45.01,75.94
|only if Tauren Shaman
step
talk Gart Mistrunner##3060
|tip Inside the building.
turnin Verdant Note##3094 |goto Mulgore 45.09,75.93
|only if Tauren Druid
step
talk Gart Mistrunner##3060
|tip Inside the building.
Train Abilities |trainer Gart Mistrunner##3060 |goto Mulgore 45.09,75.93 |q 753
|only if Druid
step
talk Chief Hawkwind##2981
|tip Inside the building.
turnin A Humble Task##753 |goto Mulgore 44.18,76.06
accept Rites of the Earthmother##755 |goto Mulgore 44.18,76.06
step
talk Harutt Thunderhorn##3059
|tip Inside the building.
turnin Simple Note##3091 |goto Mulgore 44.01,76.13
|only if Tauren Warrior
step
talk Lanka Farshot##3061
|tip Inside the building.
turnin Etched Note##3092 |goto Mulgore 44.26,75.69
|only if Tauren Hunter
step
talk Lanka Farshot##3061
|tip Inside the building.
Train Abilities |trainer Lanka Farshot##3061 |goto Mulgore 44.26,75.69 |q 755
|only if Hunter
stickystart "Collect_Mountain_Cougar_Pelts"
step
talk Seer Graytongue##2982
turnin Rites of the Earthmother##755 |goto Mulgore 42.58,92.18
accept Rite of Strength##757 |goto Mulgore 42.58,92.18
step
label "Collect_Mountain_Cougar_Pelts"
kill Mountain Cougar##2961+
collect 10 Mountain Cougar Pelt##4742 |q 750/1 |goto Mulgore 47.00,88.40
|mapmarker Mulgore/0 40.80,89.60
|mapmarker Mulgore/0 43.20,93.80
|mapmarker Mulgore/0 43.60,88.00
|mapmarker Mulgore/0 44.60,91.00
|mapmarker Mulgore/0 47.40,92.60
|mapmarker Mulgore/0 49.80,90.20
|mapmarker Mulgore/0 52.20,88.00
|mapmarker Mulgore/0 52.40,92.20
|mapmarker Mulgore/0 55.40,88.00
|mapmarker Mulgore/0 55.40,91.40
step
Kill enemies
|tip Helps reach level 4 after quest turnins.
ding 3,1150 |goto Mulgore 47.00,88.40
|mapmarker Mulgore/0 40.80,89.60
|mapmarker Mulgore/0 43.20,93.80
|mapmarker Mulgore/0 43.60,88.00
|mapmarker Mulgore/0 44.60,91.00
|mapmarker Mulgore/0 47.40,92.60
|mapmarker Mulgore/0 49.80,90.20
|mapmarker Mulgore/0 52.20,88.00
|mapmarker Mulgore/0 52.40,92.20
|mapmarker Mulgore/0 55.40,88.00
|mapmarker Mulgore/0 55.40,91.40
step
talk Grull Hawkwind##2980
turnin The Hunt Continues##750 |goto Mulgore/0 44.88,77.07
accept The Battleboars##780 |goto Mulgore/0 44.88,77.07
step
talk Brave Windfeather##3209
|tip Walks around.
accept Break Sharptusk!##3376 |goto Mulgore/0 44.94,77.04
step
talk Seer Ravenfeather##5888
accept Call of Earth##1519 |goto Mulgore 44.73,76.18
|only if Tauren Shaman
step
talk Meela Dawnstrider##3062
|tip Inside the building.
Train Abilities |trainer Meela Dawnstrider##3062 |goto Mulgore/0 45.01,75.94 |q 3376
|only if Shaman
step
talk Harutt Thunderhorn##3059
|tip Inside the building.
Train Abilities |trainer Harutt Thunderhorn##3059 |goto Mulgore 44.01,76.13 |q 3376
|only if Warrior
step
talk Gart Mistrunner##3060
|tip Inside the building.
Train Abilities |trainer Gart Mistrunner##3060 |goto Mulgore 45.09,75.93 |q 3376
|only if Druid
step
talk Lanka Farshot##3061
|tip Inside the building.
Train Abilities |trainer Lanka Farshot##3061 |goto Mulgore 44.26,75.69 |q 3376
|only if Hunter
step
kill Battleboar##2966+
collect 8 Battleboar Snout##4848 |q 780/1 |goto Mulgore 52.40,79.00
collect 8 Battleboar Flank##4849 |q 780/2 |goto Mulgore 52.40,79.00
|mapmarker Mulgore/0 52.40,75.20
|mapmarker Mulgore/0 54.00,81.60
|mapmarker Mulgore/0 54.40,86.20
|mapmarker Mulgore/0 55.20,76.60
|mapmarker Mulgore/0 56.40,89.00
|mapmarker Mulgore/0 56.60,83.40
|mapmarker Mulgore/0 59.80,88.00
stickystart "Collect_Ritual_Salves_Shaman"
stickystart "Collect_Bristleback_Belts"
step
Run through the tunnel |goto Mulgore 58.15,85.02 < 15 |only if walking and not subzone("Brambleblade Ravine")
kill Chief Sharptusk Thornmantle##8554
|tip Inside the building.
collect Chief Sharptusk Thornmantle's Head##10459 |q 3376/1 |goto Mulgore 64.70,77.66
step
click Dirt-stained Map
|tip Inside the small cave.
collect Dirt-stained Map##4851 |n
use Dirt-stained Map##4851
accept Attack on Camp Narache##781 |goto Mulgore 63.24,82.70
step
label "Collect_Ritual_Salves_Shaman"
kill Bristleback Shaman##2953+
|tip Uncommon and spread out.
collect 2 Ritual Salve##6634 |q 1519/1 |goto Mulgore 63.80,79.40
|mapmarker Mulgore/0 59.40,78.20
|mapmarker Mulgore/0 59.60,75.20
|mapmarker Mulgore/0 63.40,76.20
|mapmarker Mulgore/0 63.60,81.80
|mapmarker Mulgore/0 66.00,77.80
|only if Tauren Shaman
step
label "Collect_Bristleback_Belts"
kill Bristleback Quilboar##2952, Bristleback Shaman##2953
|tip Quilboars.
collect 12 Bristleback Belt##4770 |q 757/1 |goto Mulgore 61.60,78.40
|mapmarker Mulgore/0 58.20,78.40
|mapmarker Mulgore/0 58.40,84.40
|mapmarker Mulgore/0 60.00,75.40
|mapmarker Mulgore/0 60.00,81.60
|mapmarker Mulgore/0 63.60,81.00
|mapmarker Mulgore/0 64.60,77.80
step
Kill enemies
|tip Helps reach level 6 after quest turnins.
ding 5,595 |goto Mulgore 61.60,78.40 |only if Shaman
ding 5,865 |goto Mulgore 61.60,78.40 |only if not Shaman
|mapmarker Mulgore/0 58.20,78.40
|mapmarker Mulgore/0 58.40,84.40
|mapmarker Mulgore/0 60.00,75.40
|mapmarker Mulgore/0 60.00,81.60
|mapmarker Mulgore/0 63.60,81.00
|mapmarker Mulgore/0 64.60,77.80
step
Allow Enemies to Kill You
|tip No death penalty at this level.
|tip Fast travel.
Die on Purpose |complete isdead |goto Mulgore 61.60,78.40 |q 757
|mapmarker Mulgore/0 58.20,78.40
|mapmarker Mulgore/0 58.40,84.40
|mapmarker Mulgore/0 60.00,75.40
|mapmarker Mulgore/0 60.00,81.60
|mapmarker Mulgore/0 63.60,81.00
|mapmarker Mulgore/0 64.60,77.80
|only if not hardcore()
step
talk Spirit Healer##6491
Select _"Return me to life."_ |gossip 96031
Resurrect at the Spirit Healer |complete not isdead |goto Mulgore/0 42.64,78.10 |q 757 |zombiewalk
|only if not hardcore()
step
use Hearthstone##6948
Hearth to Camp Narache |complete subzone("Camp Narache") |q 757
|only if subzone("Brambleblade Ravine") and hardcore()
step
talk Grull Hawkwind##2980
turnin The Battleboars##780 |goto Mulgore/0 44.87,77.08
step
talk Brave Windfeather##3209
|tip Walks around.
turnin Break Sharptusk!##3376 |goto Mulgore/0 44.94,77.04
step
talk Chief Hawkwind##2981
|tip Inside the building.
turnin Attack on Camp Narache##781 |goto Mulgore 44.18,76.06
turnin Rite of Strength##757 |goto Mulgore 44.18,76.06
accept Rites of the Earthmother##763 |goto Mulgore 44.18,76.06
step
talk Harutt Thunderhorn##3059
|tip Inside the building.
Train Abilities |trainer Harutt Thunderhorn##3059 |goto Mulgore/0 44.01,76.13 |q 763
|only if Warrior
step
talk Lanka Farshot##3061
|tip Inside the building.
Train Abilities |trainer Lanka Farshot##3061 |goto Mulgore/0 44.26,75.70 |q 763
|only if Hunter
step
talk Gart Mistrunner##3060
|tip Inside the building.
Train Abilities |trainer Gart Mistrunner##3060 |goto Mulgore 45.09,75.93 |q 763
|only if Druid
step
talk Seer Ravenfeather##5888
turnin Call of Earth##1519 |goto Mulgore 44.73,76.19
accept Call of Earth##1520 |goto Mulgore 44.73,76.19
|only if Tauren Shaman
step
talk Meela Dawnstrider##3062
|tip Inside the building.
Train Abilities |trainer Meela Dawnstrider##3062 |goto Mulgore/0 45.01,75.94 |q 763
|only if Shaman
step
use Earth Sapta##6635
talk Minor Manifestation of Earth##5891
turnin Call of Earth##1520 |goto Mulgore/0 53.83,80.58
accept Call of Earth##1521 |goto Mulgore/0 53.83,80.58
|only if Tauren Shaman
step
talk Seer Ravenfeather##5888
turnin Call of Earth##1521 |goto Mulgore 44.73,76.19
|only if Tauren Shaman
step
talk Antur Fallow##6775
|tip Follow the road.
accept A Task Unfinished##1656 |goto Mulgore 38.52,81.56
step
Allow Enemies to Kill You
|tip No death penalty at this level.
|tip Fast travel.
Die on Purpose |complete isdead |goto Mulgore/0 34.86,78.89 |q 1656
|only if not hardcore()
step
talk Spirit Healer##6491
Select _"Return me to life."_ |gossip 96031
Resurrect at the Spirit Healer |complete not isdead |goto Mulgore/0 46.42,55.58 |q 1656 |zombiewalk
|only if not hardcore()
step
talk Maur Raincaller##3055
accept Mazzranache##766 |goto Mulgore/0 46.99,57.07
step
talk Harken Windtotem##2947
|tip Inside the building.
accept Swoop Hunting##761 |goto Mulgore/0 48.71,59.33
step
talk Mull Thunderhorn##2948
accept Poison Water##748 |goto Mulgore/0 48.53,60.40
|only if Tauren
step
talk Ruul Eagletalon##2985
accept Dangers of the Windfury##743 |goto Mulgore/0 47.36,62.02
step
talk Baine Bloodhoof##2993
turnin Rites of the Earthmother##763 |goto Mulgore/0 47.52,60.17
accept Sharing the Land##745 |goto Mulgore/0 47.52,60.17
accept Rite of Vision##767 |goto Mulgore/0 47.52,60.17
accept Dwarven Digging##746 |goto Mulgore/0 47.52,60.17
step
talk Innkeeper Kauth##6747
|tip Inside the building.
turnin A Task Unfinished##1656 |goto Mulgore/0 46.62,61.09
step
talk Innkeeper Kauth##6747
|tip Inside the building.
home Bloodhoof Village |goto Mulgore/0 46.62,61.09 |q 2161 |future
step
talk Zarlman Two-Moons##3054
turnin Rite of Vision##767 |goto Mulgore/0 47.76,57.54
accept Rite of Vision##771 |goto Mulgore/0 47.76,57.54
stickystart "Collect_Prairie_Wolf_Items"
stickystart "Collect_Plainstrider_Items"
stickystart "Collect_Swoop_Items"
step
click Ambercorn+
|tip Small brown pinecones.
|tip Near trees.
collect 2 Ambercorn##4809 |q 771/2 |goto Mulgore/0 38.90,59.80
|mapmarker Mulgore/0 35.40,57.60
|mapmarker Mulgore/0 37.40,68.40
|mapmarker Mulgore/0 38.90,63.70
|mapmarker Mulgore/0 38.90,71.40
|mapmarker Mulgore/0 40.80,51.40
|mapmarker Mulgore/0 41.10,53.60
|mapmarker Mulgore/0 41.20,64.00
|mapmarker Mulgore/0 42.20,56.40
|mapmarker Mulgore/0 42.80,70.20
|mapmarker Mulgore/0 43.60,72.30
|mapmarker Mulgore/0 44.40,67.10
|mapmarker Mulgore/0 44.70,49.10
|mapmarker Mulgore/0 44.80,70.20
|mapmarker Mulgore/0 45.40,52.30
|mapmarker Mulgore/0 47.80,68.20
|mapmarker Mulgore/0 48.70,64.40
|mapmarker Mulgore/0 50.40,66.40
|mapmarker Mulgore/0 51.10,71.00
|mapmarker Mulgore/0 51.60,63.40
|mapmarker Mulgore/0 52.00,61.00
|mapmarker Mulgore/0 53.00,73.60
|mapmarker Mulgore/0 53.50,57.90
|mapmarker Mulgore/0 55.70,66.60
|mapmarker Mulgore/0 56.00,62.30
|mapmarker Mulgore/0 56.70,73.00
|mapmarker Mulgore/0 57.20,69.90
|mapmarker Mulgore/0 57.70,64.80
|mapmarker Mulgore/0 59.80,67.00
step
label "Collect_Prairie_Wolf_Items"
kill Prairie Wolf##2958+
collect Prairie Wolf Heart##4804 |q 766/1 |goto Mulgore 40.40,61.80
collect 6 Prairie Wolf Paw##4758 |q 748/1 |goto Mulgore 40.40,61.80
|mapmarker Mulgore/0 33.00,76.20
|mapmarker Mulgore/0 34.00,72.60
|mapmarker Mulgore/0 35.00,52.60
|mapmarker Mulgore/0 35.00,68.40
|mapmarker Mulgore/0 35.40,55.60
|mapmarker Mulgore/0 35.40,59.40
|mapmarker Mulgore/0 36.00,65.40
|mapmarker Mulgore/0 36.00,75.80
|mapmarker Mulgore/0 36.80,71.40
|mapmarker Mulgore/0 37.40,62.40
|mapmarker Mulgore/0 38.20,47.80
|mapmarker Mulgore/0 38.20,53.40
|mapmarker Mulgore/0 38.40,59.40
|mapmarker Mulgore/0 38.40,68.80
|mapmarker Mulgore/0 38.80,74.20
|mapmarker Mulgore/0 39.40,56.20
|mapmarker Mulgore/0 39.80,50.60
|mapmarker Mulgore/0 40.20,65.80
|mapmarker Mulgore/0 40.80,71.40
|mapmarker Mulgore/0 41.80,54.40
|mapmarker Mulgore/0 43.80,71.80
|mapmarker Mulgore/0 45.40,69.20
|mapmarker Mulgore/0 48.40,68.40
|mapmarker Mulgore/0 50.60,66.20
|mapmarker Mulgore/0 50.80,70.60
|mapmarker Mulgore/0 53.00,61.40
|mapmarker Mulgore/0 53.00,68.20
|mapmarker Mulgore/0 53.80,64.60
|mapmarker Mulgore/0 53.80,71.60
|mapmarker Mulgore/0 54.80,58.40
|mapmarker Mulgore/0 56.40,66.40
|mapmarker Mulgore/0 56.60,62.40
|mapmarker Mulgore/0 57.00,69.60
step
label "Collect_Plainstrider_Items"
kill Adult Plainstrider##2956+
|tip Large walking birds.
collect Plainstrider Scale##4806	|q 766/3	|goto Mulgore 40.40,61.80
collect 4 Plainstrider Talon##4759	|q 748/2	|goto Mulgore 40.40,61.80
|mapmarker Mulgore/0 33.00,76.20
|mapmarker Mulgore/0 34.00,72.60
|mapmarker Mulgore/0 35.00,52.60
|mapmarker Mulgore/0 35.00,68.40
|mapmarker Mulgore/0 35.40,55.60
|mapmarker Mulgore/0 35.40,59.40
|mapmarker Mulgore/0 36.00,65.40
|mapmarker Mulgore/0 36.00,75.80
|mapmarker Mulgore/0 36.80,71.40
|mapmarker Mulgore/0 37.40,62.40
|mapmarker Mulgore/0 38.20,47.80
|mapmarker Mulgore/0 38.20,53.40
|mapmarker Mulgore/0 38.40,59.40
|mapmarker Mulgore/0 38.40,68.80
|mapmarker Mulgore/0 38.80,74.20
|mapmarker Mulgore/0 39.40,56.20
|mapmarker Mulgore/0 39.80,50.60
|mapmarker Mulgore/0 40.20,65.80
|mapmarker Mulgore/0 40.80,71.40
|mapmarker Mulgore/0 41.80,54.40
|mapmarker Mulgore/0 43.80,71.80
|mapmarker Mulgore/0 45.40,69.20
|mapmarker Mulgore/0 48.40,68.40
|mapmarker Mulgore/0 50.60,66.20
|mapmarker Mulgore/0 50.80,70.60
|mapmarker Mulgore/0 53.00,61.40
|mapmarker Mulgore/0 53.00,68.20
|mapmarker Mulgore/0 53.80,64.60
|mapmarker Mulgore/0 53.80,71.60
|mapmarker Mulgore/0 54.80,58.40
|mapmarker Mulgore/0 56.40,66.40
|mapmarker Mulgore/0 56.60,62.40
|mapmarker Mulgore/0 57.00,69.60
step
label "Collect_Swoop_Items"
kill Wiry Swoop##2969+
|tip Black birds.
|tip Uncommon and spread out.
collect Swoop Gizzard##4807 |q 766/4 |goto Mulgore 40.40,62.20
collect 8 Trophy Swoop Quill##4769 |q 761/1 |goto Mulgore 40.40,62.20
|mapmarker Mulgore/0 34.20,78.00
|mapmarker Mulgore/0 34.40,65.60
|mapmarker Mulgore/0 34.80,68.80
|mapmarker Mulgore/0 35.40,57.60
|mapmarker Mulgore/0 36.20,53.40
|mapmarker Mulgore/0 36.40,71.80
|mapmarker Mulgore/0 37.40,61.80
|mapmarker Mulgore/0 37.40,65.80
|mapmarker Mulgore/0 38.20,56.20
|mapmarker Mulgore/0 39.40,69.20
|mapmarker Mulgore/0 39.60,52.20
|mapmarker Mulgore/0 40.40,59.00
|mapmarker Mulgore/0 40.40,65.80
|mapmarker Mulgore/0 41.60,56.00
|mapmarker Mulgore/0 44.40,71.00
|mapmarker Mulgore/0 49.00,65.00
|mapmarker Mulgore/0 49.40,68.20
|mapmarker Mulgore/0 52.20,61.40
|mapmarker Mulgore/0 52.20,66.40
|mapmarker Mulgore/0 52.20,69.60
|mapmarker Mulgore/0 54.40,72.40
|mapmarker Mulgore/0 54.80,56.20
|mapmarker Mulgore/0 55.00,68.00
|mapmarker Mulgore/0 55.40,62.40
|mapmarker Mulgore/0 56.60,65.40
step
talk Mull Thunderhorn##2948
turnin Poison Water##748 |goto Mulgore 48.53,60.39
accept Winterhoof Cleansing##754 |goto Mulgore 48.53,60.40
step
talk Harken Windtotem##2947
|tip Inside the building.
turnin Swoop Hunting##761 |goto Mulgore 48.71,59.33
step
click Well Stone+
|tip Flat grey rocks.
collect 2 Well Stone##4808 |q 771/1 |goto Mulgore 53.50,66.20
step
use Winterhoof Cleansing Totem##5411
Cleanse the Winterhoof Water Well |q 754/1 |goto Mulgore 53.64,66.15
stickystart "Kill_Palemane_Skinners_And_Tanners"
step
kill 5 Palemane Poacher##2951 |q 745/3 |goto Mulgore 52.40,71.80
|mapmarker Mulgore/0 55.40,73.60
step
label "Kill_Palemane_Skinners_And_Tanners"
kill 8 Palemane Skinner##2950 |q 745/2 |goto Mulgore 53.20,71.80
kill 10 Palemane Tanner##2949 |q 745/1 |goto Mulgore 53.20,71.80
|mapmarker Mulgore/0 48.00,71.20
|mapmarker Mulgore/0 53.60,74.60
|mapmarker Mulgore/0 55.40,71.00
|mapmarker Mulgore/0 55.80,73.00
|mapmarker Mulgore/0 48.20,74.00
step
Kill enemies
|tip Helps reach level 8 after quest turnins.
ding 7,2775 |goto Mulgore 53.20,71.80
|mapmarker Mulgore/0 48.00,71.20
|mapmarker Mulgore/0 53.60,74.60
|mapmarker Mulgore/0 55.40,71.00
|mapmarker Mulgore/0 55.80,73.00
|mapmarker Mulgore/0 48.20,74.00
step
talk Mull Thunderhorn##2948
turnin Winterhoof Cleansing##754 |goto Mulgore/0 48.53,60.39
accept Thunderhorn Totem##756 |goto Mulgore/0 48.53,60.39
step
talk Baine Bloodhoof##2993
turnin Sharing the Land##745 |goto Mulgore/0 47.51,60.16
step
talk Zarlman Two-Moons##3054
turnin Rite of Vision##771 |goto Mulgore/0 47.76,57.54
accept Rite of Vision##772 |goto Mulgore/0 47.76,57.54
|tip Don't follow the wolf.
step
talk Yaw Sharpmane##3065
Train Abilities |trainer Yaw Sharpmane##3065 |goto Mulgore/0 47.82,55.68 |q 749 |future
|only if Hunter
step
talk Krang Stonehoof##3063
Train Abilities |trainer Krang Stonehoof##3063 |goto Mulgore/0 49.52,60.59 |q 749 |future
|only if Warrior
step
talk Gennia Runetotem##3064
|tip Inside the building.
Train Abilities |trainer Gennia Runetotem##3064 |goto Mulgore/0 48.48,59.64 |q 749 |future
|only if Druid
step
talk Narm Skychaser##3066
|tip Inside the building.
Train Abilities |trainer Narm Skychaser##3066 |goto Mulgore/0 48.38,59.15 |q 749 |future
|only if Shaman
step
map Mulgore
path	follow strictbounce;	loop off;	ants curved;	dist 30;	markers none;		arrow hide
path	51.94,59.61	53.08,60.28	54.83,60.54	56.19,61.05	57.37,61.24
path	59.72,62.45
talk Morin Cloudstalker##2988
|tip Walks along the road.
accept The Ravaged Caravan##749
stickystart "Collect_Cougar_Items"
stickystart "Collect_Stalker_Claws"
step
click Sealed Supply Crate
turnin The Ravaged Caravan##749 |goto Mulgore 53.74,48.18
accept The Ravaged Caravan##751 |goto Mulgore 53.74,48.18
step
label "Collect_Cougar_Items"
kill Flatland Cougar##3035+
collect Flatland Cougar Femur##4805	|q 766/2	|goto Mulgore 51.00,40.80
collect 6 Cougar Claws##4802		|q 756/2	|goto Mulgore 51.00,40.80
|mapmarker Mulgore/0 34.20,43.60
|mapmarker Mulgore/0 34.20,49.80
|mapmarker Mulgore/0 35.40,47.00
|mapmarker Mulgore/0 36.40,52.60
|mapmarker Mulgore/0 37.20,44.00
|mapmarker Mulgore/0 37.20,49.40
|mapmarker Mulgore/0 40.00,51.60
|mapmarker Mulgore/0 40.20,45.40
|mapmarker Mulgore/0 40.80,42.00
|mapmarker Mulgore/0 41.40,48.60
|mapmarker Mulgore/0 42.40,53.80
|mapmarker Mulgore/0 43.20,46.00
|mapmarker Mulgore/0 44.20,39.80
|mapmarker Mulgore/0 44.20,51.00
|mapmarker Mulgore/0 45.20,43.00
|mapmarker Mulgore/0 45.60,48.20
|mapmarker Mulgore/0 47.00,37.80
|mapmarker Mulgore/0 47.80,41.00
|mapmarker Mulgore/0 47.80,45.60
|mapmarker Mulgore/0 47.80,50.60
|mapmarker Mulgore/0 49.00,35.40
|mapmarker Mulgore/0 50.00,47.80
|mapmarker Mulgore/0 52.00,35.20
|mapmarker Mulgore/0 52.20,44.40
|mapmarker Mulgore/0 53.80,38.20
|mapmarker Mulgore/0 54.20,57.00
|mapmarker Mulgore/0 54.40,60.80
|mapmarker Mulgore/0 54.60,42.40
|mapmarker Mulgore/0 55.20,50.00
|mapmarker Mulgore/0 55.40,53.20
|mapmarker Mulgore/0 55.40,70.20
|mapmarker Mulgore/0 55.80,64.40
|mapmarker Mulgore/0 56.80,38.60
|mapmarker Mulgore/0 57.00,73.60
|mapmarker Mulgore/0 57.20,56.60
|mapmarker Mulgore/0 57.40,45.40
|mapmarker Mulgore/0 58.20,51.00
|mapmarker Mulgore/0 58.20,60.60
|mapmarker Mulgore/0 58.20,67.40
|mapmarker Mulgore/0 58.40,42.40
|mapmarker Mulgore/0 58.60,70.40
|mapmarker Mulgore/0 59.20,63.80
|mapmarker Mulgore/0 59.80,54.20
|mapmarker Mulgore/0 60.00,58.00
|mapmarker Mulgore/0 60.40,46.80
|mapmarker Mulgore/0 61.20,68.40
|mapmarker Mulgore/0 61.60,61.20
|mapmarker Mulgore/0 61.60,71.60
|mapmarker Mulgore/0 62.40,51.00
|mapmarker Mulgore/0 62.80,64.40
|mapmarker Mulgore/0 63.00,55.20
step
label "Collect_Stalker_Claws"
kill Prairie Stalker##2959+
|tip Wolves.
collect 6 Stalker Claws##4801 |q 756/1 |goto Mulgore 51.00,40.80
|mapmarker Mulgore/0 34.20,43.60
|mapmarker Mulgore/0 34.20,49.80
|mapmarker Mulgore/0 35.40,47.00
|mapmarker Mulgore/0 36.40,52.60
|mapmarker Mulgore/0 37.20,44.00
|mapmarker Mulgore/0 37.20,49.40
|mapmarker Mulgore/0 40.00,51.60
|mapmarker Mulgore/0 40.20,45.40
|mapmarker Mulgore/0 40.80,42.00
|mapmarker Mulgore/0 41.40,48.60
|mapmarker Mulgore/0 42.40,53.80
|mapmarker Mulgore/0 43.20,46.00
|mapmarker Mulgore/0 44.20,39.80
|mapmarker Mulgore/0 44.20,51.00
|mapmarker Mulgore/0 45.20,43.00
|mapmarker Mulgore/0 45.60,48.20
|mapmarker Mulgore/0 47.00,37.80
|mapmarker Mulgore/0 47.80,41.00
|mapmarker Mulgore/0 47.80,45.60
|mapmarker Mulgore/0 47.80,50.60
|mapmarker Mulgore/0 49.00,35.40
|mapmarker Mulgore/0 50.00,47.80
|mapmarker Mulgore/0 52.00,35.20
|mapmarker Mulgore/0 52.20,44.40
|mapmarker Mulgore/0 53.80,38.20
|mapmarker Mulgore/0 54.20,57.00
|mapmarker Mulgore/0 54.40,60.80
|mapmarker Mulgore/0 54.60,42.40
|mapmarker Mulgore/0 55.20,50.00
|mapmarker Mulgore/0 55.40,53.20
|mapmarker Mulgore/0 55.40,70.20
|mapmarker Mulgore/0 55.80,64.40
|mapmarker Mulgore/0 56.80,38.60
|mapmarker Mulgore/0 57.00,73.60
|mapmarker Mulgore/0 57.20,56.60
|mapmarker Mulgore/0 57.40,45.40
|mapmarker Mulgore/0 58.20,51.00
|mapmarker Mulgore/0 58.20,60.60
|mapmarker Mulgore/0 58.20,67.40
|mapmarker Mulgore/0 58.40,42.40
|mapmarker Mulgore/0 58.60,70.40
|mapmarker Mulgore/0 59.20,63.80
|mapmarker Mulgore/0 59.80,54.20
|mapmarker Mulgore/0 60.00,58.00
|mapmarker Mulgore/0 60.40,46.80
|mapmarker Mulgore/0 61.20,68.40
|mapmarker Mulgore/0 61.60,61.20
|mapmarker Mulgore/0 61.60,71.60
|mapmarker Mulgore/0 62.40,51.00
|mapmarker Mulgore/0 62.80,64.40
|mapmarker Mulgore/0 63.00,55.20
|only if Tauren
step
Kill enemies
|tip Helps reach level 9 after quest turnins.
ding 8,4075 |goto Mulgore 51.00,40.80
|mapmarker Mulgore/0 34.20,43.60
|mapmarker Mulgore/0 34.20,49.80
|mapmarker Mulgore/0 35.40,47.00
|mapmarker Mulgore/0 36.40,52.60
|mapmarker Mulgore/0 37.20,44.00
|mapmarker Mulgore/0 37.20,49.40
|mapmarker Mulgore/0 40.00,51.60
|mapmarker Mulgore/0 40.20,45.40
|mapmarker Mulgore/0 40.80,42.00
|mapmarker Mulgore/0 41.40,48.60
|mapmarker Mulgore/0 42.40,53.80
|mapmarker Mulgore/0 43.20,46.00
|mapmarker Mulgore/0 44.20,39.80
|mapmarker Mulgore/0 44.20,51.00
|mapmarker Mulgore/0 45.20,43.00
|mapmarker Mulgore/0 45.60,48.20
|mapmarker Mulgore/0 47.00,37.80
|mapmarker Mulgore/0 47.80,41.00
|mapmarker Mulgore/0 47.80,45.60
|mapmarker Mulgore/0 47.80,50.60
|mapmarker Mulgore/0 49.00,35.40
|mapmarker Mulgore/0 50.00,47.80
|mapmarker Mulgore/0 52.00,35.20
|mapmarker Mulgore/0 52.20,44.40
|mapmarker Mulgore/0 53.80,38.20
|mapmarker Mulgore/0 54.20,57.00
|mapmarker Mulgore/0 54.40,60.80
|mapmarker Mulgore/0 54.60,42.40
|mapmarker Mulgore/0 55.20,50.00
|mapmarker Mulgore/0 55.40,53.20
|mapmarker Mulgore/0 55.40,70.20
|mapmarker Mulgore/0 55.80,64.40
|mapmarker Mulgore/0 56.80,38.60
|mapmarker Mulgore/0 57.00,73.60
|mapmarker Mulgore/0 57.20,56.60
|mapmarker Mulgore/0 57.40,45.40
|mapmarker Mulgore/0 58.20,51.00
|mapmarker Mulgore/0 58.20,60.60
|mapmarker Mulgore/0 58.20,67.40
|mapmarker Mulgore/0 58.40,42.40
|mapmarker Mulgore/0 58.60,70.40
|mapmarker Mulgore/0 59.20,63.80
|mapmarker Mulgore/0 59.80,54.20
|mapmarker Mulgore/0 60.00,58.00
|mapmarker Mulgore/0 60.40,46.80
|mapmarker Mulgore/0 61.20,68.40
|mapmarker Mulgore/0 61.60,61.20
|mapmarker Mulgore/0 61.60,71.60
|mapmarker Mulgore/0 62.40,51.00
|mapmarker Mulgore/0 62.80,64.40
|mapmarker Mulgore/0 63.00,55.20
step
Allow Enemies to Kill You
|tip No death penalty at this level.
|tip Fast travel.
Die on Purpose |complete isdead |goto Mulgore 51.00,40.80 |q 766
|mapmarker Mulgore/0 34.20,43.60
|mapmarker Mulgore/0 34.20,49.80
|mapmarker Mulgore/0 35.40,47.00
|mapmarker Mulgore/0 36.40,52.60
|mapmarker Mulgore/0 37.20,44.00
|mapmarker Mulgore/0 37.20,49.40
|mapmarker Mulgore/0 40.00,51.60
|mapmarker Mulgore/0 40.20,45.40
|mapmarker Mulgore/0 40.80,42.00
|mapmarker Mulgore/0 41.40,48.60
|mapmarker Mulgore/0 42.40,53.80
|mapmarker Mulgore/0 43.20,46.00
|mapmarker Mulgore/0 44.20,39.80
|mapmarker Mulgore/0 44.20,51.00
|mapmarker Mulgore/0 45.20,43.00
|mapmarker Mulgore/0 45.60,48.20
|mapmarker Mulgore/0 47.00,37.80
|mapmarker Mulgore/0 47.80,41.00
|mapmarker Mulgore/0 47.80,45.60
|mapmarker Mulgore/0 47.80,50.60
|mapmarker Mulgore/0 49.00,35.40
|mapmarker Mulgore/0 50.00,47.80
|mapmarker Mulgore/0 52.00,35.20
|mapmarker Mulgore/0 52.20,44.40
|mapmarker Mulgore/0 53.80,38.20
|mapmarker Mulgore/0 54.20,57.00
|mapmarker Mulgore/0 54.40,60.80
|mapmarker Mulgore/0 54.60,42.40
|mapmarker Mulgore/0 55.20,50.00
|mapmarker Mulgore/0 55.40,53.20
|mapmarker Mulgore/0 55.40,70.20
|mapmarker Mulgore/0 55.80,64.40
|mapmarker Mulgore/0 56.80,38.60
|mapmarker Mulgore/0 57.00,73.60
|mapmarker Mulgore/0 57.20,56.60
|mapmarker Mulgore/0 57.40,45.40
|mapmarker Mulgore/0 58.20,51.00
|mapmarker Mulgore/0 58.20,60.60
|mapmarker Mulgore/0 58.20,67.40
|mapmarker Mulgore/0 58.40,42.40
|mapmarker Mulgore/0 58.60,70.40
|mapmarker Mulgore/0 59.20,63.80
|mapmarker Mulgore/0 59.80,54.20
|mapmarker Mulgore/0 60.00,58.00
|mapmarker Mulgore/0 60.40,46.80
|mapmarker Mulgore/0 61.20,68.40
|mapmarker Mulgore/0 61.60,61.20
|mapmarker Mulgore/0 61.60,71.60
|mapmarker Mulgore/0 62.40,51.00
|mapmarker Mulgore/0 62.80,64.40
|mapmarker Mulgore/0 63.00,55.20
|only if not hardcore()
step
talk Spirit Healer##6491
Select _"Return me to life."_ |gossip 96031
Resurrect at the Spirit Healer |complete not isdead |goto Mulgore 46.41,55.57 |q 766 |zombiewalk
|only if not hardcore()
step
talk Maur Raincaller##3055
turnin Mazzranache##766 |goto Mulgore 46.98,57.07
step
talk Mull Thunderhorn##2948
turnin Thunderhorn Totem##756 |goto Mulgore 48.53,60.40
accept Thunderhorn Cleansing##758 |goto Mulgore 48.53,60.40
step
talk Vira Younghoof##5939
|tip Inside the building.
Learn First Aid |skillmax First Aid,75 |goto Mulgore/0 46.80,60.85
|only if Warrior
step
_NOTE:_
Create Bandages in Downtime
|tip While waiting for things like boats.
|tip Increases skill in First Aid.
|tip Need higher skill to make better bandages.
|tip Keep bandages to heal yourself.
Click Here to Continue |confirm |q 758
|only if Warrior
step
use Thunderhorn Cleansing Totem##5415
Cleanse the Thunderhorn Water Well |q 758/1 |goto Mulgore 44.59,45.43
step
kill Bael'dun Digger##2989, Bael'dun Appraiser##2990
|tip Dwarves.
collect 5 Prospector's Pick##4702 |goto Mulgore 34.40,47.20 |q 746
|mapmarker Mulgore/0 31.00,49.20
|mapmarker Mulgore/0 32.00,47.40
|mapmarker Mulgore/0 33.40,49.60
step
kill Windfury Harpy##2962, Windfury Wind Witch##2963
|tip Harpies.
collect 8 Windfury Talon##4751 |q 743/1 |goto Mulgore 34.60,41.40
|mapmarker Mulgore/0 32.40,41.20
step
talk Seer Wiserunner##2984
|tip Inside the small cave.
|tip Run around the mountain.
turnin Rite of Vision##772 |goto Mulgore 32.72,36.09
accept Rite of Wisdom##773 |goto Mulgore 32.72,36.09
step
_Destroy This Item:_
|tip Not needed.
trash Water of the Seers##4823
step
Ride an elevator up into Thunder Bluff |goto Thunder Bluff/0 32.10,67.13 < 20 |only if walking
use Prospector's Pick##4702+
|tip Next to the forge.
collect 5 Broken Tools##4703 |q 746/1 |goto Thunder Bluff 39.63,55.93
step
_Destroy This Item:_
|tip Saves bag space.
|tip You'll get one later.
trash Hearthstone##6948 |q 833 |future
|only if Druid
step
Ride an elevator down to leave Thunder Bluff |goto Thunder Bluff/0 51.20,31.51 < 20 |only if walking and zone("Thunder Bluff")
talk Lorekeeper Raintotem##3233
accept A Sacred Burial##833 |goto Mulgore 59.86,25.63
stickystart "Kill_Bristleback_Interlopers"
step
talk Ancestral Spirit##2994
turnin Rite of Wisdom##773 |goto Mulgore 61.45,21.02
accept Journey into Thunder Bluff##775 |goto Mulgore 61.45,21.02
step
label "Kill_Bristleback_Interlopers"
kill 8 Bristleback Interloper##3232 |q 833/1 |goto Mulgore 60.40,22.00
|mapmarker Mulgore/0 60.00,20.00
|mapmarker Mulgore/0 61.60,23.60
|mapmarker Mulgore/0 62.60,21.40
step
talk Lorekeeper Raintotem##3233
turnin A Sacred Burial##833 |goto Mulgore 59.86,25.63
step
Kill enemies
|tip Helps reach level 10 after quest turnins.
ding 9,4400 |goto Mulgore 60.40,22.00
|mapmarker Mulgore/0 60.00,20.00
|mapmarker Mulgore/0 61.60,23.60
|mapmarker Mulgore/0 62.60,21.40
step
talk Ruul Eagletalon##2985
turnin Dangers of the Windfury##743 |goto Mulgore 47.35,62.02
step
talk Baine Bloodhoof##2993
turnin Dwarven Digging##746 |goto Mulgore 47.51,60.17
step
talk Mull Thunderhorn##2948
turnin Thunderhorn Cleansing##758 |goto Mulgore 48.53,60.40
step
_NOTE:_
Stronger Ammo Available
|tip Buy level 10 ammo when restocking.
Click Here to Continue |confirm |q 6061 |future
|only if Hunter
step
talk Yaw Sharpmane##3065
accept Taming the Beast##6061 |goto Mulgore 47.82,55.69
|only if Hunter
step
talk Yaw Sharpmane##3065
Train Abilities |trainer Yaw Sharpmane##3065 |goto Mulgore/0 47.82,55.68 |q 6061
|only if Hunter
step
use Taming Rod##15914
|tip On an Adult Plainstrider.
|tip Large walking birds.
Tame an Adult Plainstrider |q 6061/1 |goto Mulgore 41.80,54.40
|mapmarker Mulgore/0 33.00,76.20
|mapmarker Mulgore/0 34.00,72.60
|mapmarker Mulgore/0 35.00,52.60
|mapmarker Mulgore/0 35.00,68.40
|mapmarker Mulgore/0 35.40,55.60
|mapmarker Mulgore/0 35.40,59.40
|mapmarker Mulgore/0 36.00,65.40
|mapmarker Mulgore/0 36.00,75.80
|mapmarker Mulgore/0 36.80,71.40
|mapmarker Mulgore/0 37.40,62.40
|mapmarker Mulgore/0 38.20,47.80
|mapmarker Mulgore/0 38.20,53.40
|mapmarker Mulgore/0 38.40,59.40
|mapmarker Mulgore/0 38.40,68.80
|mapmarker Mulgore/0 38.80,74.20
|mapmarker Mulgore/0 39.40,56.20
|mapmarker Mulgore/0 39.80,50.60
|mapmarker Mulgore/0 40.20,65.80
|mapmarker Mulgore/0 40.80,71.40
|mapmarker Mulgore/0 40.40,61.80
|mapmarker Mulgore/0 43.80,71.80
|mapmarker Mulgore/0 45.40,69.20
|mapmarker Mulgore/0 48.40,68.40
|mapmarker Mulgore/0 50.60,66.20
|mapmarker Mulgore/0 50.80,70.60
|mapmarker Mulgore/0 53.00,61.40
|mapmarker Mulgore/0 53.00,68.20
|mapmarker Mulgore/0 53.80,64.60
|mapmarker Mulgore/0 53.80,71.60
|mapmarker Mulgore/0 54.80,58.40
|mapmarker Mulgore/0 56.40,66.40
|mapmarker Mulgore/0 56.60,62.40
|mapmarker Mulgore/0 57.00,69.60
|only if Hunter
step
talk Yaw Sharpmane##3065
turnin Taming the Beast##6061 |goto Mulgore 47.82,55.69
accept Taming the Beast##6087 |goto Mulgore 47.82,55.69
|only if Hunter
step
use Taming Rod##15915
|tip On a Prairie Stalker.
|tip Wolves.
Tame a Prairie Stalker |q 6087/1 |goto Mulgore 47.80,50.60
|mapmarker Mulgore/0 34.20,43.60
|mapmarker Mulgore/0 34.20,49.80
|mapmarker Mulgore/0 35.40,47.00
|mapmarker Mulgore/0 36.40,52.60
|mapmarker Mulgore/0 37.20,44.00
|mapmarker Mulgore/0 37.20,49.40
|mapmarker Mulgore/0 40.00,51.60
|mapmarker Mulgore/0 40.20,45.40
|mapmarker Mulgore/0 40.80,42.00
|mapmarker Mulgore/0 41.40,48.60
|mapmarker Mulgore/0 42.40,53.80
|mapmarker Mulgore/0 43.20,46.00
|mapmarker Mulgore/0 44.20,39.80
|mapmarker Mulgore/0 44.20,51.00
|mapmarker Mulgore/0 45.20,43.00
|mapmarker Mulgore/0 45.60,48.20
|mapmarker Mulgore/0 47.00,37.80
|mapmarker Mulgore/0 47.80,41.00
|mapmarker Mulgore/0 47.80,45.60
|mapmarker Mulgore/0 51.00,40.80
|mapmarker Mulgore/0 49.00,35.40
|mapmarker Mulgore/0 50.00,47.80
|mapmarker Mulgore/0 52.00,35.20
|mapmarker Mulgore/0 52.20,44.40
|mapmarker Mulgore/0 53.80,38.20
|mapmarker Mulgore/0 54.20,57.00
|mapmarker Mulgore/0 54.40,60.80
|mapmarker Mulgore/0 54.60,42.40
|mapmarker Mulgore/0 55.20,50.00
|mapmarker Mulgore/0 55.40,53.20
|mapmarker Mulgore/0 55.40,70.20
|mapmarker Mulgore/0 55.80,64.40
|mapmarker Mulgore/0 56.80,38.60
|mapmarker Mulgore/0 57.00,73.60
|mapmarker Mulgore/0 57.20,56.60
|mapmarker Mulgore/0 57.40,45.40
|mapmarker Mulgore/0 58.20,51.00
|mapmarker Mulgore/0 58.20,60.60
|mapmarker Mulgore/0 58.20,67.40
|mapmarker Mulgore/0 58.40,42.40
|mapmarker Mulgore/0 58.60,70.40
|mapmarker Mulgore/0 59.20,63.80
|mapmarker Mulgore/0 59.80,54.20
|mapmarker Mulgore/0 60.00,58.00
|mapmarker Mulgore/0 60.40,46.80
|mapmarker Mulgore/0 61.20,68.40
|mapmarker Mulgore/0 61.60,61.20
|mapmarker Mulgore/0 61.60,71.60
|mapmarker Mulgore/0 62.40,51.00
|mapmarker Mulgore/0 62.80,64.40
|mapmarker Mulgore/0 63.00,55.20
|only if Hunter
step
talk Yaw Sharpmane##3065
turnin Taming the Beast##6087 |goto Mulgore 47.82,55.69
accept Taming the Beast##6088 |goto Mulgore 47.82,55.69
|only if Hunter
step
use Taming Rod##15916
|tip On a Swoop.
|tip Black birds.
Tame a Swoop |q 6088/1 |goto Mulgore 45.20,50.00
|mapmarker Mulgore/0 34.40,42.00
|mapmarker Mulgore/0 34.40,49.40
|mapmarker Mulgore/0 36.20,44.40
|mapmarker Mulgore/0 38.00,41.60
|mapmarker Mulgore/0 41.20,42.00
|mapmarker Mulgore/0 41.20,48.20
|mapmarker Mulgore/0 42.40,52.40
|mapmarker Mulgore/0 44.80,35.60
|mapmarker Mulgore/0 45.00,40.80
|mapmarker Mulgore/0 47.00,45.40
|mapmarker Mulgore/0 48.60,48.40
|mapmarker Mulgore/0 49.60,40.40
|mapmarker Mulgore/0 50.00,45.60
|mapmarker Mulgore/0 51.20,34.40
|mapmarker Mulgore/0 52.40,37.20
|mapmarker Mulgore/0 53.40,45.20
|mapmarker Mulgore/0 55.40,42.40
|mapmarker Mulgore/0 56.80,46.20
|mapmarker Mulgore/0 57.00,57.80
|mapmarker Mulgore/0 57.20,68.00
|mapmarker Mulgore/0 57.40,49.40
|mapmarker Mulgore/0 58.40,64.20
|mapmarker Mulgore/0 59.40,59.80
|mapmarker Mulgore/0 60.20,55.20
|only if Hunter
step
talk Yaw Sharpmane##3065
turnin Taming the Beast##6088 |goto Mulgore 47.82,55.69
accept Training the Beast##6089 |goto Mulgore 47.82,55.69
|only if Hunter
step
talk Krang Stonehoof##3063
Train Abilities |trainer Krang Stonehoof##3063 |goto Mulgore/0 49.52,60.59 |q 1505
|only if Warrior
step
talk Narm Skychaser##3066
|tip Inside the building.
accept Call of Fire##2984 |goto Mulgore 48.39,59.16
|only if Tauren Shaman
step
talk Narm Skychaser##3066
|tip Inside the building.
Train Abilities |trainer Narm Skychaser##3066 |goto Mulgore/0 48.38,59.15 |q 2984
|only if Shaman
step
talk Gennia Runetotem##3064
|tip Inside the building.
accept Heeding the Call##5928 |goto Mulgore 48.48,59.64
|only if Druid
step
talk Gennia Runetotem##3064
|tip Inside the building.
Train Abilities |trainer Gennia Runetotem##3064 |goto Mulgore/0 48.48,59.64 |q 5928
|only if Druid
step
map Mulgore
path	follow strictbounce;	loop off;	ants curved;	dist 30;	markers none;		arrow hide
path	51.94,59.61	53.08,60.28	54.83,60.54	56.19,61.05	57.37,61.24
path	59.72,62.45
talk Morin Cloudstalker##2988
|tip Walks along the road.
turnin The Ravaged Caravan##751
step
_NOTE:_
Tame Any Beast
|tip Cast {o}Tame Beast{} on any {o}level 9-10{} beast.
|tip You'll replace it with a new permanent pet soon.
Click Here to Continue |confirm |goto Mulgore 60.00,59.00 |q 854 |future
|mapmarker Mulgore/0 57.40,60.60
|mapmarker Mulgore/0 58.00,67.00
|mapmarker Mulgore/0 58.40,55.00
|mapmarker Mulgore/0 59.80,64.00
|mapmarker Mulgore/0 60.40,69.20
|mapmarker Mulgore/0 61.40,53.00
|mapmarker Mulgore/0 62.20,56.20
|mapmarker Mulgore/0 62.40,61.60
|mapmarker Mulgore/0 62.40,65.60
|mapmarker Mulgore/0 64.00,69.00
|mapmarker Mulgore/0 65.20,57.40
|mapmarker Mulgore/0 65.20,64.20
|mapmarker Mulgore/0 66.00,60.60
|mapmarker Mulgore/0 66.60,67.40
|mapmarker Mulgore/0 67.40,70.80
|mapmarker Mulgore/0 68.20,63.40
|only if Hunter
step
talk Omusa Thunderhorn##10378
fpath Camp Taurajo |goto The Barrens 44.45,59.15
step
talk Omusa Thunderhorn##10378
|tip Open the flight map.
|tip Allows the guide to learn your flight paths.
fpath Thunder Bluff |goto The Barrens 44.45,59.15
step
talk Kirge Sternhorn##3418
accept Journey to the Crossroads##854 |goto The Barrens 44.88,58.61
step
talk Thork##3429
|tip Carefully follow the road.
|tip Higher level enemies.
turnin Journey to the Crossroads##854 |goto The Barrens 51.50,30.87
step
talk Devrak##3615
fpath Crossroads |goto The Barrens 51.51,30.34
step
talk Jahan Hawkwing##3483
accept A Bundle of Hides##6361 |goto The Barrens 51.21,29.05
step
talk Devrak##3615
turnin A Bundle of Hides##6361 |goto The Barrens 51.50,30.34
accept Ride to Thunder Bluff##6362 |goto The Barrens 51.50,30.34
step
talk Ahanu##8359
|tip Inside the building.
turnin Ride to Thunder Bluff##6362 |goto Thunder Bluff 45.77,55.84
accept Tal the Wind Rider Master##6363 |goto Thunder Bluff 45.77,55.84
step
_NOTE:_
Use Weapon Stones
|tip We will train Mining and Blacksmithing.
|tip Allows you to make and use {o}Sharpening Stones{}.
|tip Increases damage.
|tip Mine {o}Copper Ore{} as you see it.
|tip Use the {g}Rough Stones{} to make sharpening stones.
Click Here to Continue |confirm |q 744
|only if Warrior
step
talk Karn Stonehoof##2998
Train Apprentice Blacksmithing |skillmax Blacksmithing,75 |goto Thunder Bluff/0 39.38,55.09
|only if Warrior
step
talk Brek Stonehoof##3001
|tip Inside the building.
Train Apprentice Mining |skillmax Mining,75 |goto Thunder Bluff/0 34.37,57.90
|only if Warrior
step
talk Kurm Stonehoof##3002
|tip Inside the building.
buy Mining Pick##2901 |goto Thunder Bluff/0 34.35,56.56
|only if Warrior
step
talk Ansekhwa##11869
Train Staves		|complete weaponskill("TH_STAFF") > 0		|goto Thunder Bluff 40.93,62.73		|only if Warrior or Hunter
Train Two-Handed Maces	|complete weaponskill("TH_MACE") > 0		|goto Thunder Bluff 40.93,62.73		|only if Druid
|only if Warrior or Hunter or Druid
step
talk Innkeeper Pala##6746
|tip Inside the building.
home Thunder Bluff |goto Thunder Bluff 45.81,64.71 |q 775
|only if Druid
step
talk Holt Thunderhorn##3039
|tip Inside the building.
turnin Training the Beast##6089 |goto Thunder Bluff 57.31,89.76
|only if Hunter
step
talk Hesuwa Thunderhorn##10086
|tip Inside the building.
Train Pet Abilities |trainer Hesuwa Thunderhorn##10086 |goto Thunder Bluff/0 54.09,83.97 |q 775
|only if Hunter
step
talk Kaga Mistrunner##3025
buy Tough Jerky##117+ |n
|tip Buy {o}20{}, if possible.
|tip Used to feed your pet.
Visit the Vendor |vendor Kaga Mistrunner##3025 |goto Thunder Bluff/0 52.32,47.77 |q 775
|only if Hunter
step
talk Cairne Bloodhoof##3057
|tip Inside the building.
turnin Journey into Thunder Bluff##775 |goto Thunder Bluff 60.30,51.68
step
talk Turak Runetotem##3033
|tip Inside the building.
turnin Heeding the Call##5928 |goto Thunder Bluff 76.46,27.23
accept Moonglade##5922 |goto Thunder Bluff 76.46,27.23
|only if Druid
step
talk Arch Druid Hamuul Runetotem##5769
|tip Inside the building.
accept The Barrens Oases##886 |goto Thunder Bluff 78.62,28.56
|only if Druid
step
talk Dendrite Starblaze##11802
|tip Upstairs inside the building.
turnin Moonglade##5922 |goto Moonglade 56.21,30.64
accept Great Bear Spirit##5930 |goto Moonglade 56.21,30.64
|only if Druid
step
talk Great Bear Spirit##11956
Select _"What do you represent, spirit?"_
Seek Out the Great Bear Spirit and Learn what it Has to Share with You About the Nature of the Bear |q 5930/1 |goto Moonglade 39.11,27.51
|only if Druid
step
talk Dendrite Starblaze##11802
|tip Upstairs inside the building.
turnin Great Bear Spirit##5930 |goto Moonglade 56.21,30.64
accept Back to Thunder Bluff##5932 |goto Moonglade 56.21,30.64
|only if Druid
step
talk Turak Runetotem##3033
|tip Inside the building.
turnin Back to Thunder Bluff##5932 |goto Thunder Bluff 76.46,27.23
accept Body and Heart##6002 |goto Thunder Bluff 76.46,27.23
|only if Druid
step
talk Tal##2995
|tip Top of the tower.
turnin Tal the Wind Rider Master##6363 |goto Thunder Bluff 47.00,49.83
accept Return to Jahan##6364 |goto Thunder Bluff 47.00,49.83
step
use Cenarion Lunardust##15710
kill Lunaclaw##12138
|tip Spirit appears.
talk Lunaclaw Spirit##12144
Select _"You have fought well, spirit. I ask you to grant me the strength of your body and the strength of your heart."_
Face Lunaclaw and Earn the Strength of Body and Heart it Possesses |q 6002/1 |goto The Barrens 42.00,60.86
|only if Druid
step
talk Turak Runetotem##3033
|tip Inside the building.
turnin Body and Heart##6002 |goto Thunder Bluff 76.46,27.23
|only if Druid
step
talk Tonga Runetotem##3448
turnin The Barrens Oases##886 |goto The Barrens/0 52.26,31.93
|only if Druid
step
talk Jahan Hawkwing##3483
turnin Return to Jahan##6364 |goto The Barrens 51.21,29.05
step
_NOTE:_
Tame a Venomtail Scorpid
|tip Cast {o}Tame Beast{} on a Venomtail Scorpid.
|tip Abandon your pet first.
|tip New permanent pet.
Click Here to Continue |confirm |goto Durotar/0 35.40,47.40 |q 791 |future
|mapmarker Durotar/0 35.40,53.80
|mapmarker Durotar/0 37.80,51.20
|only if Hunter
step
talk Kranal Fiss##5907
|tip Walks around.
turnin Call of Fire##2984 |goto The Barrens 56.03,19.89
accept Call of Fire##1524 |goto The Barrens 56.03,19.89
|only if Shaman
step
Follow the path up |goto Durotar 36.59,57.07 < 15 |only if walking
talk Telf Joolam##5900
|tip On top of the mountain.
turnin Call of Fire##1524 |goto Durotar 38.55,58.96
accept Call of Fire##1525 |goto Durotar 38.55,58.96
|only if Shaman
step
kill Razormane Thornweaver##3268, Razormane Water Seeker##3267
|tip Thornweavers and Water Seekers.
collect Fire Tar##5026 |q 1525/1 |goto The Barrens 55.60,25.40
|mapmarker The Barrens/0 53.00,25.20
|mapmarker The Barrens/0 54.40,27.20
|only if Shaman
step
talk Furl Scornbrow##3147
|tip Top of the tower.
accept Carry Your Weight##791 |goto Durotar 49.89,40.38
step
talk Cook Torka##3191
|tip Walks around.
accept Break a Few Eggs##815 |goto Durotar 51.11,42.45
step
talk Gar'Thok##3139
|tip Upstairs inside the building.
accept Vanquish the Betrayers##784 |goto Durotar 51.95,43.50
accept Encroachment##837 |goto Durotar 51.95,43.50
step
Follow the path up |goto 54.54,38.79 < 40 |only if walking and not (subzone("Dustwind Cave") and indoors())
kill Burning Blade Cultist##3199+
|tip Inside the cave.
|tip In the back.
collect Reagent Pouch##6652 |q 1525/2 |goto Durotar/0 52.80,28.60
|mapmarker Durotar/0 51.80,25.80
|only if Shaman
stickystart "Collect_Canvas_Scraps"
stickystart "Kill_Kul_Tiras_Enemies"
step
Leave the cave |goto Durotar/0 52.80,28.60 < 15 |walk |only if subzone("Dustwind Cave") and indoors()
Enter the building |goto Durotar 58.99,58.30 < 15 |walk |only if not (subzone("Tiragarde Keep") and indoors())
kill Lieutenant Benedict##3192 |q 784/3 |goto Durotar 59.71,58.27
|tip Upstairs inside the building.
|tip May need help.
collect Benedict's Key##4882 |goto Durotar 59.71,58.27 |q 830 |future
step
Follow the path and run further up the stairs |goto Durotar 59.90,57.87 < 7 |walk
click Benedict's Chest
|tip Top of the building.
collect Aged Envelope##4881 |goto Durotar 59.26,57.66 |q 830 |future
step
use Aged Envelope##4881
accept The Admiral's Orders##830
step
label "Collect_Canvas_Scraps"
kill Kul Tiras Sailor##3128, Kul Tiras Marine##3129
collect 8 Canvas Scraps##4870 |q 791/1 |goto Durotar 55.40,51.20
|mapmarker Durotar/0 55.80,53.40
|mapmarker Durotar/0 56.20,56.80
|mapmarker Durotar/0 57.60,52.40
|mapmarker Durotar/0 58.40,58.20
|mapmarker Durotar/0 58.60,55.20
step
label "Kill_Kul_Tiras_Enemies"
kill 8 Kul Tiras Marine##3129 |q 784/2 |goto Durotar 55.80,53.40
kill 10 Kul Tiras Sailor##3128 |q 784/1 |goto Durotar 55.80,53.40
|mapmarker Durotar/0 55.40,51.20
|mapmarker Durotar/0 56.20,56.80
|mapmarker Durotar/0 57.60,52.40
|mapmarker Durotar/0 58.40,58.20
|mapmarker Durotar/0 58.60,55.20
step
talk Ukor##6786
accept A Peon's Burden##2161 |goto Durotar 52.06,68.31
step
talk Vel'rin Fang##3194
|tip Inside the building.
accept Practical Prey##817 |goto Durotar 55.96,73.92
step
talk Master Vornal##3304
accept A Solvent Spirit##818 |goto Durotar 55.94,74.39
step
talk Master Gadrin##3188
accept Minshina's Skull##808 |goto Durotar 55.95,74.72
accept Zalazane##826 |goto Durotar 55.95,74.72
accept Report to Orgnil##823 |goto Durotar 55.95,74.72
stickystart "Collect_Taillasher_Eggs"
stickystart "Collect_Durotar_Tiger_Fur"
stickystart "Kill_Hexed_Trolls"
stickystart "Kill_Voodoo_Trolls"
stickystart "Collect_Intact_Makrura_Eyes"
stickystart "Collect_Crawler_Mucus"
step
kill Zalazane##3205
|tip Troll wearing a red robe.
|tip Walks around.
collect Zalazane's Head##4866 |q 826/3 |goto Durotar 67.40,86.40
|mapmarker Durotar/0 66.40,87.40
|mapmarker Durotar/0 67.60,87.80
step
click Imprisoned Darkspear
|tip Skulls.
collect Minshina's Skull##4864 |q 808/1 |goto Durotar 67.45,87.81
step
label "Kill_Hexed_Trolls"
kill 8 Hexed Troll##3207 |q 826/1 |goto Durotar 67.80,86.00
|mapmarker Durotar/0 65.40,83.40
|mapmarker Durotar/0 65.40,86.00
|mapmarker Durotar/0 66.40,88.60
|mapmarker Durotar/0 67.40,83.40
|mapmarker Durotar/0 68.20,81.40
step
label "Kill_Voodoo_Trolls"
kill 8 Voodoo Troll##3206 |q 826/2 |goto Durotar 67.20,87.00
|mapmarker Durotar/0 65.40,83.40
|mapmarker Durotar/0 65.40,86.00
|mapmarker Durotar/0 67.20,85.00
|mapmarker Durotar/0 67.80,82.20
step
label "Collect_Taillasher_Eggs"
click Taillasher Eggs+
|tip Clusters of purple eggs.
|tip Near trees.
collect 3 Taillasher Egg##4890 |q 815/1 |goto Durotar 63.90,86.80
|mapmarker Durotar/0 59.40,83.70
|mapmarker Durotar/0 59.80,89.60
|mapmarker Durotar/0 60.90,78.80
|mapmarker Durotar/0 62.10,96.30
|mapmarker Durotar/0 63.00,94.40
|mapmarker Durotar/0 63.40,74.40
|mapmarker Durotar/0 64.90,82.40
|mapmarker Durotar/0 67.20,80.60
|mapmarker Durotar/0 68.20,88.40
|mapmarker Durotar/0 68.70,74.40
|mapmarker Durotar/0 68.90,71.10
|mapmarker Durotar/0 69.20,82.20
step
label "Collect_Durotar_Tiger_Fur"
kill Durotar Tiger##3121+
collect 4 Durotar Tiger Fur##4892 |q 817/1 |goto Durotar 61.20,89.60
|mapmarker Durotar/0 60.20,82.40
|mapmarker Durotar/0 62.80,96.40
|mapmarker Durotar/0 64.60,81.20
|mapmarker Durotar/0 64.80,85.00
|mapmarker Durotar/0 67.00,71.40
|mapmarker Durotar/0 67.40,74.60
|mapmarker Durotar/0 68.40,80.40
|mapmarker Durotar/0 69.00,85.20
|mapmarker Durotar/0 69.60,69.80
|mapmarker Durotar/0 70.20,73.20
step
label "Collect_Intact_Makrura_Eyes"
kill Makrura Clacker##3103, Makrura Shellhide##3104
|tip Lobsters.
collect 4 Intact Makrura Eye##4887 |q 818/1 |goto Durotar 60.20,70.80
|mapmarker Durotar/0 52.20,83.00
|mapmarker Durotar/0 55.00,81.40
|mapmarker Durotar/0 56.40,78.40
|mapmarker Durotar/0 58.40,73.40
step
label "Collect_Crawler_Mucus"
kill Pygmy Surf Crawler##3106+
|tip Crabs.
collect 8 Crawler Mucus##4888 |q 818/2 |goto Durotar 60.20,70.80
|mapmarker Durotar/0 52.20,83.00
|mapmarker Durotar/0 55.00,81.40
|mapmarker Durotar/0 56.40,78.40
|mapmarker Durotar/0 58.40,73.40
step
talk Master Gadrin##3188
turnin Minshina's Skull##808 |goto Durotar 55.95,74.72
turnin Zalazane##826 |goto Durotar 55.95,74.72
step
talk Master Vornal##3304
turnin A Solvent Spirit##818 |goto Durotar 55.94,74.39
step
talk Vel'rin Fang##3194
|tip Inside the building.
turnin Practical Prey##817 |goto Durotar 55.95,73.93
step
kill 4 Razormane Quilboar##3111 |q 837/1 |goto Durotar 50.00,49.60
kill 4 Razormane Scout##3112 |q 837/2 |goto Durotar 50.00,49.60
|mapmarker Durotar/0 44.20,49.40
|mapmarker Durotar/0 47.40,48.00
|mapmarker Durotar/0 51.00,48.20
step
kill 4 Razormane Dustrunner##3113 |q 837/3 |goto Durotar 42.40,40.60
kill 4 Razormane Battleguard##3114 |q 837/4 |goto Durotar 42.40,40.60
|mapmarker Durotar/0 41.20,37.80
|mapmarker Durotar/0 44.40,36.00
step
talk Misha Tor'kren##3193
|tip Walks around.
|tip Inside the building.
accept Lost But Not Forgotten##816 |goto Durotar 43.11,30.24
step
kill Dreadmaw Crocolisk##3110+
collect Kron's Amulet##4891 |q 816/1 |goto Durotar/0 34.80,36.40
|mapmarker Durotar/0 34.20,44.00
|mapmarker Durotar/0 34.20,49.00
|mapmarker Durotar/0 34.40,52.00
|mapmarker Durotar/0 37.40,17.00
|mapmarker Durotar/0 34.80,30.60
|mapmarker Durotar/0 34.80,40.60
|mapmarker Durotar/0 35.00,55.80
|mapmarker Durotar/0 35.40,24.80
|mapmarker Durotar/0 36.20,21.40
step
Follow the path up |goto Durotar 36.59,57.07 < 15 |only if walking
talk Telf Joolam##5900
|tip Top of the mountain.
turnin Call of Fire##1525 |goto Durotar 38.55,58.96
accept Call of Fire##1526 |goto Durotar 38.55,58.96
|only if Shaman
step
use Fire Sapta##6636
|tip Top of the mountain.
Gain Sapta Sight |havebuff Sapta Sight##8898 |goto Durotar 38.16,58.54 |q 1526
|only if Shaman
step
kill Minor Manifestation of Fire##5893
|tip Top of the mountain.
collect Glowing Ember##6655 |q 1526/1 |goto Durotar 38.72,58.29
|only if Shaman
step
click Brazier of the Dormant Flame
|tip Top of the mountain.
turnin Call of Fire##1526 |goto Durotar 38.95,58.22
accept Call of Fire##1527 |goto Durotar 38.95,58.22
|only if Shaman
step
talk Kranal Fiss##5907
|tip Walks around.
turnin Call of Fire##1527 |goto The Barrens 56.04,19.89
|only if Shaman
step
talk Misha Tor'kren##3193
|tip Walks around.
|tip Inside the building.
turnin Lost But Not Forgotten##816 |goto Durotar 43.11,30.24
step
Kill enemies
ding 12 |goto Durotar 42.40,40.60
|mapmarker Durotar/0 41.20,37.80
|mapmarker Durotar/0 44.40,36.00
step
talk Furl Scornbrow##3147
|tip Top of the tower.
turnin Carry Your Weight##791 |goto Durotar 49.89,40.38
step
talk Cook Torka##3191
|tip Walks around.
turnin Break a Few Eggs##815 |goto Durotar 51.11,42.45
step
talk Innkeeper Grosk##6928
|tip Inside the building.
turnin A Peon's Burden##2161 |goto Durotar/0 51.52,41.65
step
talk Innkeeper Grosk##6928
|tip Inside the building.
home Razor Hill |goto Durotar/0 51.52,41.65 |q 887 |future
step
talk Loganaar##12042
Train Abilities |trainer Loganaar##12042 |goto Moonglade/0 52.53,40.57 |q 784
|only if Druid
step
talk Thotar##3171
|tip Inside the building.
Train Abilities |trainer Thotar##3171 |goto Durotar/0 51.85,43.49 |q 784
|only if Hunter
step
talk Harruk##3620
|tip Inside the building.
Train Pet Abilities |trainer Harruk##3620 |goto Durotar/0 52.02,43.54 |q 784
|only if Hunter
step
talk Gar'Thok##3139
|tip Upstairs inside the building.
turnin Vanquish the Betrayers##784 |goto Durotar 51.95,43.50
turnin Encroachment##837 |goto Durotar 51.95,43.50
turnin The Admiral's Orders##830 |goto Durotar 51.95,43.50
accept The Admiral's Orders##831 |goto Durotar 51.95,43.50
step
talk Orgnil Soulscar##3142
turnin Report to Orgnil##823 |goto Durotar 52.25,43.15
step
talk Tarshaw Jaggedscar##3169
|tip Inside the building.
Train Abilities |trainer Tarshaw Jaggedscar##3169 |goto Durotar/0 54.19,42.47 |q 834 |future
|only if Warrior
step
talk Swart##3173
|tip Inside the building.
Train Abilities |trainer Swart##3173 |goto Durotar/0 54.42,42.59 |q 834 |future
|only if Shaman
step
talk Rezlak##3293
accept Winds in the Desert##834 |goto Durotar 46.37,22.94
step
click Stolen Supply Sack+
|tip Tan bags.
collect 5 Sack of Supplies##4918 |q 834/1 |goto Durotar 49.10,22.50
|mapmarker Durotar/0 47.20,29.70
|mapmarker Durotar/0 47.20,30.80
|mapmarker Durotar/0 47.30,33.50
|mapmarker Durotar/0 49.70,24.30
|mapmarker Durotar/0 49.70,32.20
|mapmarker Durotar/0 50.10,25.70
step
talk Rezlak##3293
turnin Winds in the Desert##834 |goto Durotar 46.37,22.94
accept Securing the Lines##835 |goto Durotar 46.37,22.94
step
Follow the path and run through the tunnel |goto Durotar 51.95,27.44 < 15 |only if walking and not subzone("Drygulch Ravine")
kill 8 Dustwind Storm Witch##3118 |q 835/2 |goto Durotar 53.20,24.60
kill 12 Dustwind Savage##3117 |q 835/1 |goto Durotar 53.20,24.60
|mapmarker Durotar/0 51.20,19.20
|mapmarker Durotar/0 51.40,21.00
|mapmarker Durotar/0 51.40,23.40
|mapmarker Durotar/0 52.60,21.40
|mapmarker Durotar/0 54.00,22.40
step
Allow Enemies to Kill You
|tip Fast travel.
Die on Purpose |complete isdead |goto Durotar 53.20,24.60 |q 835
|mapmarker Durotar/0 51.20,19.20
|mapmarker Durotar/0 51.40,21.00
|mapmarker Durotar/0 51.40,23.40
|mapmarker Durotar/0 52.60,21.40
|mapmarker Durotar/0 54.00,22.40
|only if not hardcore()
step
talk Spirit Healer##6491
Select _"Return me to life."_ |gossip 96031
Resurrect at the Spirit Healer |complete not isdead |goto Durotar 47.05,17.59 |q 835 |zombiewalk
|only if not hardcore()
step
Run through the tunnel |goto Durotar/0 53.51,27.79 < 15 |only if walking and subzone("Drygulch Ravine")
talk Rezlak##3293
turnin Securing the Lines##835 |goto Durotar 46.37,22.94
step
talk Rhinag##3190
|tip Between the rocks.
|tip {o}Hurry{}, timed quest.
accept Need for a Cure##812 |goto Durotar/0 41.55,18.61
step
talk Doras##3310
|tip Top of the tower.
fpath Orgrimmar |goto Orgrimmar 45.13,63.90
step
talk Nazgrel##3230
|tip Inside the building.
turnin The Admiral's Orders##831 |goto Orgrimmar/0 32.27,35.80
step
talk Kor'ghan##3189
|tip Inside the Cleft of Shadow.
accept Finding the Antidote##813 |goto Orgrimmar 47.24,53.58
|only if haveq(812)
step
Abandon the {y}Need for a Cure{} Quest |complete not haveq(812)
|tip Not needed.
|tip Removes the quest timer.
step
talk Hanashi##2704
|tip Inside the building.
Train Staves |complete weaponskill("TH_STAFF") > 0 |goto Orgrimmar/0 81.53,19.63	|only if Warrior
Train Bows |complete weaponskill("BOW") > 0 |goto Orgrimmar/0 81.53,19.63		|only if Hunter
|only if Warrior or Hunter
step
kill Venomtail Scorpid##3127+
|tip Scorpions.
collect 4 Venomtail Poison Sac##4886 |q 813/1 |goto Durotar 43.40,16.60
|mapmarker Durotar/0 38.00,19.20
|mapmarker Durotar/0 38.20,22.40
|mapmarker Durotar/0 39.20,16.40
|mapmarker Durotar/0 41.40,19.40
|mapmarker Durotar/0 44.40,21.00
|mapmarker Durotar/0 55.40,15.20
|mapmarker Durotar/0 52.80,12.80
|mapmarker Durotar/0 49.80,17.40
|mapmarker Durotar/0 55.80,12.20
step
talk Kor'ghan##3189
|tip Inside the Cleft of Shadow.
turnin Finding the Antidote##813 |goto Orgrimmar 47.24,53.59
step
talk Rhinag##3190
|tip Between the rocks.
accept Need for a Cure##812 |goto Durotar/0 41.55,18.61
step
talk Rhinag##3190
|tip Between the rocks.
turnin Need for a Cure##812 |goto Durotar/0 41.55,18.61
step
Kill enemies
ding 13 |goto Durotar 43.40,16.60
|mapmarker Durotar/0 38.00,19.20
|mapmarker Durotar/0 38.20,22.40
|mapmarker Durotar/0 39.20,16.40
|mapmarker Durotar/0 41.40,19.40
|mapmarker Durotar/0 44.40,21.00
|mapmarker Durotar/0 55.40,15.20
|mapmarker Durotar/0 52.80,12.80
|mapmarker Durotar/0 49.80,17.40
|mapmarker Durotar/0 55.80,12.20
step
talk Austil de Mon##2131
|tip Inside the building.
accept Speak with Dillinger##1818 |goto Tirisfal Glades 61.85,52.54
|only if Warrior
step
talk Deathguard Dillinger##1496
turnin Speak with Dillinger##1818 |goto Tirisfal Glades 58.20,51.45
accept Ulag the Cleaver##1819 |goto Tirisfal Glades 58.20,51.45
|only if Warrior
step
click Mausoleum Trigger##104593
|tip Metal plate with skull icon.
Watch the dialogue
kill Ulag the Cleaver##6390 |q 1819/1 |goto Tirisfal Glades 59.16,48.51
|only if Warrior
step
talk Deathguard Dillinger##1496
turnin Ulag the Cleaver##1819 |goto Tirisfal Glades 58.20,51.45
accept Speak with Coleman##1820 |goto Tirisfal Glades 58.20,51.45
|only if Warrior
step
talk Coleman Farthing##1500
|tip Inside the building.
turnin Speak with Coleman##1820 |goto Tirisfal Glades 61.72,52.29
|only if Warrior
step
talk Apothecary Johaan##1518
|tip Inside the building.
accept Delivery to Silverpine Forest##445 |goto Tirisfal Glades 59.45,52.40
step
talk Michael Garrett##4551
fpath Undercity |goto Undercity 63.28,48.58
]])
GoatQuest:RegisterGuide("Leveling Guides\\Orc & Troll Starter (1-13)",{
image=GQ.IMAGESDIR.."Durotar",
condition_suggested=function() return (raceclass('Orc') or raceclass('Troll')) and level <= 13 end,
condition_suggested_exclusive=true,
condition_visible=function() return (Orc or Troll) end,
linked = {"Leveling Guides\\Hidden Guides"},
linkedhidden = true,
hardcore = true,
next="Leveling Guides\\Silverpine Forest (13-15)",
},[[
defaultfor Orc,Troll
step
_NOTE:_
Wrong Character Race
|tip Guide written for {o}Orc & Troll{} characters.
|tip Other races may encounter issues.
Click Here to Continue |confirm
|only if not (Orc or Troll)
step
_NOTE:_
Manage Your Ammo
|tip Make sure you always have ammo.
|tip You need it to attack enemies.
|tip {o}General Goods{} vendors sell it (also Bow & Gun vendors).
|tip Try to keep your ammo bag full.
Click Here to Continue |confirm |q 4641 |future
|only if Hunter
step
talk Kaltunk##10176
accept Your Place In The World##4641 |goto Durotar/0 43.29,68.53
step
kill Mottled Boar##3098+
|tip Loot items worth at least {o}10 copper{} to sell.
|tip Allows training a spell early.
|tip Increases leveling speed.
Click to Continue |confirm |goto Durotar/0 43.80,70.40 |q 4641
|mapmarker Durotar/0 43.40,72.40
|mapmarker Durotar/0 41.40,71.60
|only if Warrior or Warlock or Shaman
step
talk Duokna##3158
Sell Items |vendor Duokna##3158  |goto Durotar/0 42.58,67.34 |q 4641
|only if Warrior or Warlock or Shaman
step
talk Frang##3153
Train Abilities |trainer Frang##3153 |goto Durotar 42.89,69.43 |q 4641
|only if Warrior
step
talk Shikrik##3157
Train Abilities |trainer Shikrik##3157 |goto Durotar 42.39,69.00 |q 4641
|only if Shaman
step
talk Ruzan##5765
accept Vile Familiars##1485 |goto Durotar 42.59,69.00
|only if Warlock
step
talk Gornek##3143
|tip Inside the cave.
turnin Your Place In The World##4641 |goto Durotar 42.06,68.33
accept Cutting Teeth##788 |goto Durotar 42.06,68.33
step
talk Nartok##3156
|tip Inside the cave.
Train Abilities |trainer Nartok##3156 |goto Durotar 40.65,68.51 |q 788
|only if Warlock
step
kill 10 Mottled Boar##3098 |q 788/1 |goto Durotar 43.80,66.20
|mapmarker Durotar/0 41.00,64.20
|mapmarker Durotar/0 42.20,61.00
|mapmarker Durotar/0 44.40,63.20
|mapmarker Durotar/0 46.40,68.20
|mapmarker Durotar/0 47.00,64.80
step
Kill enemies
ding 2,450 |goto Durotar 44.40,63.20
|mapmarker Durotar/0 41.00,64.20
|mapmarker Durotar/0 42.20,61.00
|mapmarker Durotar/0 43.80,66.20
|mapmarker Durotar/0 46.40,68.20
|mapmarker Durotar/0 47.00,64.80
step
label "Collect_Vile_Familiar_Heads"
kill Vile Familiar##3101+
|tip Avoid going inside the cave, if possible.
|tip Next step outside the cave.
collect 6 Vile Familiar Head##6487 |q 1485/1 |goto Durotar 45.80,57.40
|mapmarker Durotar/0 43.80,58.40
|only if Orc Warlock
step
talk Hana'zua##3287
accept Sarkoth##790 |goto Durotar 40.60,62.59
step
kill Sarkoth##3281
|tip Black scorpion.
|tip Walks around.
collect Sarkoth's Mangled Claw##4905 |q 790/1 |goto Durotar 40.60,65.40
|mapmarker Durotar/0 40.60,67.60
step
talk Hana'zua##3287
turnin Sarkoth##790 |goto Durotar 40.60,62.59
accept Sarkoth##804 |goto Durotar 40.60,62.59
step
Kill enemies
|tip Helps reach level 4 after quest turnins.
ding 3,1080 |goto Durotar 44.40,63.20
|mapmarker Durotar/0 41.00,64.20
|mapmarker Durotar/0 42.20,61.00
|mapmarker Durotar/0 43.80,66.20
|mapmarker Durotar/0 46.40,68.20
|mapmarker Durotar/0 47.00,64.80
step
talk Ruzan##5765
turnin Vile Familiars##1485 |goto Durotar 42.59,69.00
accept Vile Familiars##1499 |goto Durotar 42.59,69.00
|only if Warlock
step
Summon Your Imp |complete warlockpet("Imp")
|tip Cast {o}Summon Imp{}.
|only if Warlock
step
talk Zureetha Fargaze##3145
turnin Vile Familiars##1499 |goto Durotar 42.85,69.15
|only if Warlock
step
talk Gornek##3143
|tip Inside the cave.
turnin Cutting Teeth##788		|goto Durotar 42.06,68.33
turnin Sarkoth##804			|goto Durotar 42.06,68.33
accept Simple Parchment##2383		|goto Durotar 42.06,68.33	|only Orc Warrior
accept Rune-Inscribed Parchment##3089	|goto Durotar 42.06,68.33	|only Orc Shaman
accept Encrypted Parchment##3088	|goto Durotar 42.06,68.33	|only Orc Rogue
accept Etched Parchment##3087		|goto Durotar 42.06,68.33	|only Orc Hunter
accept Tainted Parchment##3090		|goto Durotar 42.06,68.33	|only Orc Warlock
accept Simple Tablet##3065		|goto Durotar 42.06,68.33	|only Troll Warrior
accept Etched Tablet##3082		|goto Durotar 42.06,68.33	|only Troll Hunter
accept Encrypted Tablet##3083		|goto Durotar 42.06,68.33	|only Troll Rogue
accept Hallowed Tablet##3085		|goto Durotar 42.06,68.33	|only Troll Priest
accept Rune-Inscribed Tablet##3084	|goto Durotar 42.06,68.33	|only Troll Shaman
accept Glyphic Tablet##3086		|goto Durotar 42.06,68.33	|only Troll Mage
accept Sting of the Scorpid##789	|goto Durotar 42.06,68.33
step
talk Rwag##3155
|tip Inside the cave.
turnin Encrypted Parchment##3088 |goto Durotar 41.28,68.00	|only if Orc Rogue
turnin Encrypted Tablet##3083 |goto Durotar 41.28,68.00		|only if Troll Rogue
|only if Rogue
step
talk Rwag##3155
|tip Inside the cave.
Train Abilities |trainer Rwag##3155 |goto Durotar 41.28,68.00 |q 5441 |future
|only if Rogue
step
talk Nartok##3156
|tip Inside the cave.
turnin Tainted Parchment##3090 |goto Durotar 40.65,68.51
|only if Warlock
step
talk Nartok##3156
|tip Inside the cave.
Train Abilities |trainer Nartok##3156 |goto Durotar 40.65,68.51 |q 5441 |future
|only if Warlock
step
talk Hraug##12776
|tip Buy available Grimoires.
|tip Inside the cave.
Train Demon Abilities |vendor Hraug##12776 |goto Durotar 40.56,68.43 |q 5441 |future
|only if Warlock
step
talk Galgar##9796
accept Galgar's Cactus Apple Surprise##4402 |goto Durotar 42.73,67.24
step
talk Ken'jai##3707
turnin Hallowed Tablet##3085 |goto Durotar 42.36,68.82
|only if Troll Priest
step
talk Ken'jai##3707
Train Abilities |trainer Ken'jai##3707 |goto Durotar 42.36,68.82 |q 5441 |future
|only if Priest
step
talk Shikrik##3157
turnin Rune-Inscribed Parchment##3089 |goto Durotar 42.39,69.00		|only if Orc Shaman
turnin Rune-Inscribed Tablet##3084 |goto Durotar 42.39,69.00		|only if Troll Shaman
|only if Shaman
step
talk Shikrik##3157
Train Abilities |trainer Shikrik##3157 |goto Durotar 42.39,69.00 |q 5441 |future
|only if Shaman
step
talk Canaga Earthcaller##5887
accept Call of Earth##1516 |goto Durotar 42.41,69.17
|only if Shaman
step
talk Mai'ah##5884
turnin Glyphic Tablet##3086 |goto Durotar 42.51,69.04
|only if Troll Mage
step
talk Mai'ah##5884
Train Abilities |trainer Mai'ah##5884 |goto Durotar 42.51,69.04 |q 5441 |future
|only if Mage
step
talk Zureetha Fargaze##3145
accept Vile Familiars##792 |goto Durotar 42.85,69.14
|only if not Warlock
step
talk Frang##3153
turnin Simple Parchment##2383 |goto Durotar 42.89,69.43		|only if Orc Warrior
turnin Simple Tablet##3065 |goto Durotar 42.89,69.43		|only if Troll Warrior
|only if Warrior
step
talk Frang##3153
Train Abilities |trainer Frang##3153 |goto Durotar 42.89,69.43 |q 5441 |future
|only if Warrior
step
talk Jen'shan##3154
turnin Etched Parchment##3087 |goto Durotar 42.84,69.32		|only if Orc Hunter
turnin Etched Tablet##3082 |goto Durotar 42.84,69.32		|only if Troll Hunter
|only if Hunter
step
talk Jen'shan##3154
Train Abilities |trainer Jen'shan##3154 |goto Durotar 42.84,69.32 |q 5441 |future
|only if Hunter
step
talk Foreman Thazz'ril##11378
accept Lazy Peons##5441 |goto Durotar 44.62,68.64
stickystart "Collect_Scorpid_Worker_Tails"
stickystart "Awaken_Lazy_Peons"
stickystart "Collect_Cactus_Apples"
step
kill 12 Vile Familiar##3101 |q 792/1 |goto Durotar 45.80,57.40
|tip Avoid going inside the cave, if possible.
|tip Next step outside the cave.
|mapmarker Durotar/0 43.80,58.40
|only if not Warlock
step
label "Collect_Scorpid_Worker_Tails"
kill Scorpid Worker##3124+
|tip Scorpions.
collect 10 Scorpid Worker Tail##4862 |q 789/1 |goto Durotar 41.40,59.00
|mapmarker Durotar/0 39.40,61.40
|mapmarker Durotar/0 43.20,56.40
|mapmarker Durotar/0 45.20,59.40
|mapmarker Durotar/0 46.40,64.20
step
label "Awaken_Lazy_Peons"
use Foreman's Blackjack##16114
|tip On Lazy Peons.
|tip Sleeping orcs.
|tip Near trees.
|tip If not sleeping, skip them.
Awaken #5# Lazy Peons |q 5441/1 |goto Durotar 46.60,60.40
|mapmarker Durotar/0 39.00,61.80
|mapmarker Durotar/0 40.80,60.60
|mapmarker Durotar/0 41.40,72.60
|mapmarker Durotar/0 43.80,57.40
|mapmarker Durotar/0 44.40,72.80
|mapmarker Durotar/0 44.80,69.00
|mapmarker Durotar/0 45.40,65.80
|mapmarker Durotar/0 47.00,58.00
|mapmarker Durotar/0 47.20,65.40
|mapmarker Durotar/0 47.40,69.20
step
label "Collect_Cactus_Apples"
click Cactus Apple+
|tip Cactuses with red fruit.
collect 10 Cactus Apple##11583 |q 4402/1 |goto Durotar 45.70,64.40
|mapmarker Durotar/0 39.70,63.00
|mapmarker Durotar/0 40.50,60.40
|mapmarker Durotar/0 41.60,58.70
|mapmarker Durotar/0 41.90,63.30
|mapmarker Durotar/0 42.00,56.60
|mapmarker Durotar/0 43.40,62.80
|mapmarker Durotar/0 44.10,67.00
|mapmarker Durotar/0 44.60,58.20
|mapmarker Durotar/0 44.60,64.80
|mapmarker Durotar/0 44.80,61.70
|mapmarker Durotar/0 44.90,59.60
|mapmarker Durotar/0 47.30,65.20
step
talk Galgar##9796
turnin Galgar's Cactus Apple Surprise##4402 |goto Durotar 42.73,67.24
step
talk Gornek##3143
|tip Inside the cave.
turnin Sting of the Scorpid##789 |goto Durotar 42.05,68.32
step
talk Zureetha Fargaze##3145
turnin Vile Familiars##792 |goto Durotar 42.85,69.15 |only if not Warlock
accept Burning Blade Medallion##794 |goto Durotar 42.85,69.15
step
talk Foreman Thazz'ril##11378
turnin Lazy Peons##5441 |goto Durotar 44.62,68.64
accept Thazz'ril's Pick##6394 |goto Durotar 44.62,68.64
stickystart "Collect_Felstalker_Hoofs_Shaman"
step
Enter the cave |goto Durotar 45.34,56.36 < 15 |walk |only if not (subzone("Burning Blade Coven") and indoors())
click Thazz'ril's Pick
|tip Inside the cave.
collect Thazz'ril's Pick##16332 |q 6394/1 |goto Durotar 43.73,53.79
step
Follow the path |goto Durotar 44.76,54.54 < 10 |walk
kill Yarrog Baneshadow##3183
|tip Inside the cave.
collect Burning Blade Medallion##4859 |q 794/1 |goto Durotar 42.71,52.95
step
label "Collect_Felstalker_Hoofs_Shaman"
kill Felstalker##3102+
|tip Demon dogs.
|tip Inside the cave. |notinsticky
collect 2 Felstalker Hoof##6640 |q 1516/1 |goto Durotar 45.34,56.36
|mapmarker Durotar/0 42.40,53.40
|mapmarker Durotar/0 43.20,55.40
|mapmarker Durotar/0 44.80,52.40
|only if Shaman
step
Kill enemies
|tip Inside the cave.
ding 6 |goto Durotar 45.34,56.36
|mapmarker Durotar/0 42.40,53.40
|mapmarker Durotar/0 43.20,55.40
|mapmarker Durotar/0 44.80,52.40
step
use Hearthstone##6948
Hearth to Valley of Trials |complete subzone("Valley of Trials") |q 6394
|only if subzone("Burning Blade Coven") and indoors()
step
talk Frang##3153
Train Abilities |trainer Frang##3153 |goto Durotar 42.89,69.43 |q 6394
|only if Warrior
step
talk Jen'shan##3154
Train Abilities |trainer Jen'shan##3154 |goto Durotar 42.84,69.32 |q 6394
|only if Hunter
step
talk Zureetha Fargaze##3145
turnin Burning Blade Medallion##794 |goto Durotar 42.85,69.15
accept Report to Sen'jin Village##805 |goto Durotar 42.85,69.15
step
talk Ken'jai##3707
accept In Favor of Spirituality##5649 |goto Durotar 42.36,68.81
|only if Priest
step
talk Ken'jai##3707
Train Abilities |trainer Ken'jai##3707 |goto Durotar 42.36,68.81 |q 6394
|only if Troll Priest
step
talk Canaga Earthcaller##5887
turnin Call of Earth##1516 |goto Durotar 42.41,69.17
accept Call of Earth##1517 |goto Durotar 42.41,69.17
|only if Shaman
step
talk Shikrik##3157
Train Abilities |trainer Shikrik##3157 |goto Durotar 42.39,69.00 |q 6394
|only if Shaman
step
Follow the path up |goto Durotar 41.56,73.28 < 15 |only if walking
use Earth Sapta##6635
|tip Top of the mountain.
talk Minor Manifestation of Earth##5891
turnin Call of Earth##1517 |goto Durotar 44.03,76.20
accept Call of Earth##1518 |goto Durotar 44.03,76.20
|only if Shaman
step
talk Canaga Earthcaller##5887
turnin Call of Earth##1518 |goto Durotar 42.41,69.17
|only if Shaman
step
talk Mai'ah##5884
Train Abilities |trainer Mai'ah##5884 |goto Durotar 42.51,69.04 |q 6394
|only if Mage
step
Enter the cave |goto Durotar/0 42.28,68.43 < 10 |walk |only if not (subzone("The Den") and indoors())
talk Nartok##3156
|tip Inside the cave.
Train Abilities |trainer Nartok##3156 |goto Durotar 40.65,68.51 |q 6394
|only if Warlock
step
talk Hraug##12776
|tip Buy available Grimoires.
|tip Inside the cave.
Train Demon Abilities |vendor Hraug##12776 |goto Durotar 40.56,68.43 |q 6394
|only if Warlock
step
Enter the cave |goto Durotar/0 42.28,68.43 < 10 |walk |only if not (subzone("The Den") and indoors())
talk Rwag##3155
|tip Inside the cave.
Train Abilities |trainer Rwag##3155 |goto |goto Durotar 41.28,68.00 |q 6394
|only if Rogue
step
talk Foreman Thazz'ril##11378
turnin Thazz'ril's Pick##6394 |goto Durotar 44.62,68.64
step
talk Ukor##6786
accept A Peon's Burden##2161 |goto Durotar 52.06,68.31
step
talk Lar Prowltusk##3140
|tip Walks around.
|tip Multiple locations.
accept Thwarting Kolkar Aggression##786 |goto Durotar 54.19,73.29
|mapmarker Durotar/0 54.00,76.20
|mapmarker Durotar/0 54.40,74.20
step
talk Vel'rin Fang##3194
|tip Inside the building.
accept Practical Prey##817 |goto Durotar 55.96,73.92
step
talk Master Vornal##3304
accept A Solvent Spirit##818 |goto Durotar 55.94,74.39
step
talk Master Gadrin##3188
turnin Report to Sen'jin Village##805 |goto Durotar 55.95,74.72 |only if haveq(805) or completedq(805)
accept Minshina's Skull##808 |goto Durotar 55.95,74.72
accept Zalazane##826 |goto Durotar 55.95,74.72
accept Report to Orgnil##823 |goto Durotar 55.95,74.72
stickystart "Collect_Crawler_Mucus_Sticky_Only"
step
kill Makrura Clacker##3103, Makrura Shellhide##3104
|tip Lobsters.
|tip Follow the beach southwest.
|tip Skip when you reach the end of the beach.
|tip Can finish later.
collect 4 Intact Makrura Eye##4887 |q 818/1 |goto Durotar 60.20,70.80
|mapmarker Durotar/0 52.20,83.00
|mapmarker Durotar/0 55.00,81.40
|mapmarker Durotar/0 56.40,78.40
|mapmarker Durotar/0 58.40,73.40
step
label "Collect_Crawler_Mucus_Sticky_Only"
kill Pygmy Surf Crawler##3106, Surf Crawler##3107
|tip Crabs.
collect 8 Crawler Mucus##4888 |q 818/2 |goto Durotar 60.20,70.80
|mapmarker Durotar/0 52.20,83.00
|mapmarker Durotar/0 55.00,81.40
|mapmarker Durotar/0 56.40,78.40
|mapmarker Durotar/0 58.40,73.40
|sticky only
step
Follow the path |goto Durotar 50.85,79.14 < 15 |only if walking and not subzone("Kolkar Crag")
click Attack Plan: Valley of Trials
|tip Inside the building.
Destroy the Attack Plan: Valley of Trials |q 786/1 |goto Durotar 49.82,81.28
step
click Attack Plan: Sen'jin Village
Destroy the Attack Plan: Sen'jin Village |q 786/2 |goto Durotar 47.66,77.34
step
click Attack Plan: Orgrimmar
|tip Follow the path around.
Destroy the Attack Plan: Orgrimmar |q 786/3 |goto Durotar 46.23,78.95
step
Stand in the Fire
|tip No death penalty at this level.
|tip Fast travel.
Die on Purpose |complete isdead |goto Durotar 46.41,79.20 |q 786
|only if not hardcore()
step
talk Spirit Healer##6491
Select _"Return me to life."_ |gossip 96031
Resurrect at the Spirit Healer |complete not isdead |goto Durotar 57.49,73.26 |q 786 |zombiewalk
|only if not hardcore()
step
talk Master Vornal##3304
turnin A Solvent Spirit##818 |goto Durotar 55.94,74.39
|only if readyq(818)
step
talk Lar Prowltusk##3140
|tip Walks around.
|tip Multiple locations.
turnin Thwarting Kolkar Aggression##786 |goto Durotar 54.19,73.29
|mapmarker Durotar/0 54.00,76.20
|mapmarker Durotar/0 54.40,74.20
step
talk Orgnil Soulscar##3142
turnin Report to Orgnil##823 |goto Durotar 52.25,43.15
accept Dark Storms##806 |goto Durotar 52.25,43.15 |only if Warrior or Shaman
step
talk Gar'Thok##3139
|tip Upstairs inside the building.
accept Vanquish the Betrayers##784 |goto Durotar 51.95,43.50
accept Encroachment##837 |goto Durotar 51.95,43.50
step
talk Cook Torka##3191
|tip Walks around.
accept Break a Few Eggs##815 |goto Durotar 51.11,42.45
step
Follow the path up |goto Durotar 50.09,43.01 < 10 |only if walking
talk Furl Scornbrow##3147
|tip Top of the tower.
accept Carry Your Weight##791 |goto Durotar 49.89,40.38
step
talk Innkeeper Grosk##6928
|tip Inside the building.
turnin A Peon's Burden##2161 |goto Durotar/0 51.52,41.65
step
_NOTE:_
Use Weapon Stones
|tip We will train Mining and Blacksmithing.
|tip Allows you to make and use {o}Sharpening Stones{}.
|tip Increases damage.
|tip Mine {o}Copper Ore{} as you see it.
|tip Use the {g}Rough Stones{} to make sharpening stones.
Click Here to Continue |confirm |q 791
|only if Warrior or Rogue
step
talk Krunn##3175
Train Apprentice Mining |skillmax Mining,75 |goto Durotar/0 51.82,40.89
|only if Warrior or Rogue
step
talk Dwukk##3174
Train Apprentice Blacksmithing |skillmax Blacksmithing,75 |goto Durotar/0 52.03,40.72
|only if Warrior or Rogue
step
talk Flakk##3168
buy Mining Pick##2901 |goto Durotar/0 52.98,41.97
|only if Warrior or Rogue
step
talk Tai'jin##3706
|tip Inside the building.
turnin In Favor of Spirituality##5649 |goto Durotar 54.26,42.93
accept Garments of Spirituality##5648 |goto Durotar 54.26,42.93
|only if Priest
step
Heal and Fortify Grunt Kor'ja |q 5648/1 |goto Durotar 53.10,46.46
|tip Cast {o}Lesser Heal (Rank 2){} on Grunt Kor'ja.
|tip Cast {o}Power Word: Fortitude{} on Grunt Kor'ja.
|only if Priest
step
talk Tai'jin##3706
|tip Inside the building.
turnin Garments of Spirituality##5648 |goto Durotar 54.26,42.93
|only if Priest
stickystart "Collect_Canvas_Scraps"
stickystart "Kill_Kul_Tiras_Enemies"
step
Enter the building |goto Durotar 58.99,58.30 < 15 |walk |only if not (subzone("Tiragarde Keep") and indoors())
kill Lieutenant Benedict##3192 |q 784/3 |goto Durotar 59.71,58.27
|tip Upstairs inside the building.
|tip May need help.
collect Benedict's Key##4882 |goto Durotar 59.71,58.27 |q 830 |future
step
Follow the path and run further up the stairs |goto Durotar 59.90,57.87 < 7 |walk
click Benedict's Chest
|tip Top of the building.
collect Aged Envelope##4881 |goto Durotar 59.26,57.66 |q 830 |future
step
use Aged Envelope##4881
accept The Admiral's Orders##830
step
label "Collect_Canvas_Scraps"
kill Kul Tiras Sailor##3128, Kul Tiras Marine##3129
collect 8 Canvas Scraps##4870 |q 791/1 |goto Durotar 55.40,51.20
|mapmarker Durotar/0 55.80,53.40
|mapmarker Durotar/0 56.20,56.80
|mapmarker Durotar/0 57.60,52.40
|mapmarker Durotar/0 58.40,58.20
|mapmarker Durotar/0 58.60,55.20
step
label "Kill_Kul_Tiras_Enemies"
kill 8 Kul Tiras Marine##3129 |q 784/2 |goto Durotar 55.80,53.40
kill 10 Kul Tiras Sailor##3128 |q 784/1 |goto Durotar 55.80,53.40
|mapmarker Durotar/0 55.40,51.20
|mapmarker Durotar/0 56.20,56.80
|mapmarker Durotar/0 57.60,52.40
|mapmarker Durotar/0 58.40,58.20
|mapmarker Durotar/0 58.60,55.20
step
Kill enemies
ding 8 |goto Durotar 55.80,53.40
|mapmarker Durotar/0 55.40,51.20
|mapmarker Durotar/0 56.20,56.80
|mapmarker Durotar/0 57.60,52.40
|mapmarker Durotar/0 58.40,58.20
|mapmarker Durotar/0 58.60,55.20
step
Allow Enemies to Kill You
|tip No death penalty at this level.
|tip Fast travel.
Die on Purpose |complete isdead |goto Durotar 55.80,53.40 |q 830
|mapmarker Durotar/0 55.40,51.20
|mapmarker Durotar/0 56.20,56.80
|mapmarker Durotar/0 57.60,52.40
|mapmarker Durotar/0 58.40,58.20
|mapmarker Durotar/0 58.60,55.20
|only if not hardcore()
step
talk Spirit Healer##6491
Select _"Return me to life."_ |gossip 96031
Resurrect at the Spirit Healer |complete not isdead |goto Durotar 53.51,44.45 |q 830 |zombiewalk
|only if not hardcore()
step
talk Thotar##3171
|tip Inside the building.
Train Abilities |trainer Thotar##3171 |goto Durotar/0 51.85,43.49 |q 784
|only if Hunter
step
talk Kaplak##3170
|tip Upstairs inside the building.
Train Abilities |trainer Kaplak##3170 |goto Durotar/0 51.98,43.69 |q 784
|only if Rogue
step
talk Gar'Thok##3139
|tip Upstairs inside the building.
turnin Vanquish the Betrayers##784 |goto Durotar 51.95,43.50
accept From The Wreckage....##825 |goto Durotar 51.95,43.50
turnin The Admiral's Orders##830 |goto Durotar 51.95,43.50
accept The Admiral's Orders##831 |goto Durotar 51.95,43.50
step
Follow the path up |goto Durotar 50.09,43.01 < 10 |only if walking
talk Furl Scornbrow##3147
|tip Top of the tower.
turnin Carry Your Weight##791 |goto Durotar 49.89,40.38
step
talk Innkeeper Grosk##6928
|tip Inside the building.
home Razor Hill |goto Durotar/0 51.52,41.65 |q 887 |future
step
talk Dhugru Gorelust##3172
|tip Outside behind the building.
Train Abilities |trainer Dhugru Gorelust##3172 |goto Durotar/0 54.38,41.19 |q 825
|only if Warlock
step
talk Kitha##6027
|tip Buy available Grimoires.
|tip Outside behind the building.
Train Demon Abilities |vendor Kitha##6027 |goto Durotar/0 54.71,41.50 |q 825
|only if Warlock
step
talk Tai'jin##3706
|tip Inside the building.
Train Abilities |trainer Tai'jin##3706 |goto Durotar/0 54.26,42.93 |q 825
|only if Priest
step
talk Tarshaw Jaggedscar##3169
|tip Inside the building.
Train Abilities |trainer Tarshaw Jaggedscar##3169 |goto Durotar/0 54.19,42.47 |q 825
|only if Warrior
step
talk Swart##3173
|tip Inside the building.
Train Abilities |trainer Swart##3173 |goto Durotar/0 54.42,42.59 |q 825
|only if Shaman
step
talk Rawrk##5943
|tip Inside the building.
Train Apprentice First Aid |skillmax First Aid,75 |goto Durotar 54.17,41.93
|only if Warrior or Rogue
step
_NOTE:_
Create Bandages in Downtime
|tip While waiting for things like boats.
|tip Increases skill in First Aid.
|tip Need higher skill to make better bandages.
|tip Keep bandages to heal yourself.
Click Here to Continue |confirm |q 825
|only if Warrior or Rogue
stickystart "Collect_Crawler_Mucus"
stickystart "Collect_Intact_Makrura_Eyes"
step
click Gnomish Toolbox
|tip Grey metal chests.
|tip Inside and near sunken ships.
|tip Underwater.
collect 3 Gnomish Tools##4863 |q 825/1 |goto Durotar 61.40,56.20
|mapmarker Durotar/0 61.80,45.90
|mapmarker Durotar/0 62.10,41.80
|mapmarker Durotar/0 62.10,60.70
|mapmarker Durotar/0 63.80,53.00
|mapmarker Durotar/0 64.40,50.30
|mapmarker Durotar/0 63.30,57.40
stickystart "Collect_Taillasher_Eggs"
stickystart "Collect_Durotar_Tiger_Fur"
stickystart "Kill_Hexed_Trolls"
stickystart "Kill_Voodoo_Trolls"
step
kill Zalazane##3205
|tip Troll wearing a red robe.
|tip Walks around.
collect Zalazane's Head##4866 |q 826/3 |goto Durotar 67.40,86.40
|mapmarker Durotar/0 66.40,87.40
|mapmarker Durotar/0 67.60,87.80
stickystop "Collect_Crawler_Mucus"
stickystop "Collect_Intact_Makrura_Eyes"
step
click Imprisoned Darkspear
|tip Skulls.
collect Minshina's Skull##4864 |q 808/1 |goto Durotar 67.45,87.81
step
label "Kill_Hexed_Trolls"
kill 8 Hexed Troll##3207 |q 826/1 |goto Durotar 67.80,86.00
|mapmarker Durotar/0 65.40,83.40
|mapmarker Durotar/0 65.40,86.00
|mapmarker Durotar/0 66.40,88.60
|mapmarker Durotar/0 67.40,83.40
|mapmarker Durotar/0 68.20,81.40
step
label "Kill_Voodoo_Trolls"
kill 8 Voodoo Troll##3206 |q 826/2 |goto Durotar 67.20,87.00
|mapmarker Durotar/0 65.40,83.40
|mapmarker Durotar/0 65.40,86.00
|mapmarker Durotar/0 67.20,85.00
|mapmarker Durotar/0 67.80,82.20
step
label "Collect_Taillasher_Eggs"
click Taillasher Eggs+
|tip Clusters of purple eggs.
|tip Near trees.
collect 3 Taillasher Egg##4890 |q 815/1 |goto Durotar 63.90,86.80
|mapmarker Durotar/0 59.40,83.70
|mapmarker Durotar/0 59.80,89.60
|mapmarker Durotar/0 60.90,78.80
|mapmarker Durotar/0 62.10,96.30
|mapmarker Durotar/0 63.00,94.40
|mapmarker Durotar/0 63.40,74.40
|mapmarker Durotar/0 64.90,82.40
|mapmarker Durotar/0 67.20,80.60
|mapmarker Durotar/0 68.20,88.40
|mapmarker Durotar/0 68.70,74.40
|mapmarker Durotar/0 68.90,71.10
|mapmarker Durotar/0 69.20,82.20
step
label "Collect_Durotar_Tiger_Fur"
kill Durotar Tiger##3121+
collect 4 Durotar Tiger Fur##4892 |q 817/1 |goto Durotar 61.20,89.60
|mapmarker Durotar/0 60.20,82.40
|mapmarker Durotar/0 62.80,96.40
|mapmarker Durotar/0 64.60,81.20
|mapmarker Durotar/0 64.80,85.00
|mapmarker Durotar/0 67.00,71.40
|mapmarker Durotar/0 67.40,74.60
|mapmarker Durotar/0 68.40,80.40
|mapmarker Durotar/0 69.00,85.20
|mapmarker Durotar/0 69.60,69.80
|mapmarker Durotar/0 70.20,73.20
step
Allow Enemies to Kill You
|tip No death penalty at this level.
|tip Fast travel.
|tip Anywhere in Echo Isles.
Die on Purpose |complete isdead |goto Durotar 61.20,89.60 |q 817
|mapmarker Durotar/0 60.20,82.40
|mapmarker Durotar/0 62.80,96.40
|mapmarker Durotar/0 64.60,81.20
|mapmarker Durotar/0 64.80,85.00
|mapmarker Durotar/0 67.00,71.40
|mapmarker Durotar/0 67.40,74.60
|mapmarker Durotar/0 68.40,80.40
|mapmarker Durotar/0 69.00,85.20
|mapmarker Durotar/0 69.60,69.80
|mapmarker Durotar/0 70.20,73.20
|only if not hardcore()
step
talk Spirit Healer##6491
Select _"Return me to life."_ |gossip 96031
Resurrect at the Spirit Healer |complete not isdead |goto Durotar 57.50,73.26 |q 817 |zombiewalk
|only if not hardcore()
step
talk Un'Thuwa##5880
|tip Inside the building.
Train Abilities |trainer Un'Thuwa##5880 |goto Durotar/0 56.31,75.11 |q 808
|only if Mage
stickystart "Collect_Crawler_Mucus"
step
label "Collect_Intact_Makrura_Eyes"
kill Makrura Clacker##3103, Makrura Shellhide##3104
|tip Lobsters.
collect 4 Intact Makrura Eye##4887 |q 818/1 |goto Durotar 60.20,70.80
|mapmarker Durotar/0 52.20,83.00
|mapmarker Durotar/0 55.00,81.40
|mapmarker Durotar/0 56.40,78.40
|mapmarker Durotar/0 58.40,73.40
step
label "Collect_Crawler_Mucus"
kill Pygmy Surf Crawler##3106, Surf Crawler##3107
|tip Crabs.
collect 8 Crawler Mucus##4888 |q 818/2 |goto Durotar 60.20,70.80
|mapmarker Durotar/0 52.20,83.00
|mapmarker Durotar/0 55.00,81.40
|mapmarker Durotar/0 56.40,78.40
|mapmarker Durotar/0 58.40,73.40
step
talk Master Gadrin##3188
turnin Minshina's Skull##808 |goto Durotar 55.95,74.72
turnin Zalazane##826 |goto Durotar 55.95,74.72
step
talk Master Vornal##3304
turnin A Solvent Spirit##818 |goto Durotar 55.94,74.39
step
talk Vel'rin Fang##3194
|tip Inside the building.
turnin Practical Prey##817 |goto Durotar 55.95,73.93
step
talk Gar'Thok##3139
|tip Upstairs inside the building.
turnin From The Wreckage....##825 |goto Durotar 51.95,43.50
step
talk Cook Torka##3191
|tip Walks around.
turnin Break a Few Eggs##815 |goto Durotar 51.11,42.45
step
kill 4 Razormane Quilboar##3111 |q 837/1 |goto Durotar 50.00,49.60
kill 4 Razormane Scout##3112 |q 837/2 |goto Durotar 50.00,49.60
|mapmarker Durotar/0 44.20,49.40
|mapmarker Durotar/0 47.40,48.00
|mapmarker Durotar/0 51.00,48.20
step
kill 4 Razormane Dustrunner##3113 |q 837/3 |goto Durotar 42.40,40.60
kill 4 Razormane Battleguard##3114 |q 837/4 |goto Durotar 42.40,40.60
|mapmarker Durotar/0 41.20,37.80
|mapmarker Durotar/0 44.40,36.00
step
Kill enemies
|tip Helps reach level 10 after quest turnins.
ding 9,5875 |goto Durotar 42.40,40.60
|mapmarker Durotar/0 41.20,37.80
|mapmarker Durotar/0 44.40,36.00
step
Allow Enemies to Kill You
|tip No death penalty at this level.
|tip Fast travel.
Die on Purpose |complete isdead |goto Durotar 42.40,40.60 |q 837
|mapmarker Durotar/0 41.20,37.80
|mapmarker Durotar/0 44.40,36.00
|only if not hardcore()
step
talk Spirit Healer##6491
Select _"Return me to life."_ |gossip 96031
Resurrect at the Spirit Healer |complete not isdead |goto Durotar 53.51,44.45 |q 837 |zombiewalk
|only if not hardcore()
step
talk Gar'Thok##3139
|tip Upstairs inside the building.
turnin Encroachment##837 |goto Durotar 51.95,43.50
step
talk Tai'jin##3706
|tip Inside the building.
Train Abilities |trainer Tai'jin##3706 |goto Durotar/0 54.26,42.93 |q 834 |future
|only if Priest
step
talk Tai'jin##3706
|tip Inside the building.
accept Hex of Weakness##5654 |goto Durotar/0 54.26,42.93
|only if Priest
step
talk Kaplak##3170
|tip Upstairs inside the building.
Train Abilities |trainer Kaplak##3170 |goto Durotar/0 51.98,43.69 |q 1859 |future
|only if Rogue
step
talk Dhugru Gorelust##3172
|tip Outside behind the building.
Train Abilities |trainer Dhugru Gorelust##3172 |goto Durotar/0 54.38,41.19 |q 1506 |future
|only if Warlock
step
talk Kitha##6027
|tip Buy available Grimoires.
|tip Outside behind the building.
Train Demon Abilities |vendor Kitha##6027 |goto Durotar/0 54.71,41.50 |q 1506
|only if Warlock
step
talk Tarshaw Jaggedscar##3169
|tip Inside the building.
Train Abilities |trainer Tarshaw Jaggedscar##3169 |goto Durotar/0 54.19,42.47 |q 834 |future
|only if Warrior
step
_NOTE:_
Stronger Ammo Available
|tip Buy level 10 ammo when restocking.
Click Here to Continue |confirm |q 6062 |future
|only if Hunter
step
talk Thotar##3171
|tip Inside the building.
Train Abilities |trainer Thotar##3171 |goto Durotar/0 51.85,43.49 |q 6062 |future
|only if Hunter
step
talk Thotar##3171
|tip Inside the building.
accept Taming the Beast##6062 |goto Durotar/0 51.85,43.49
|only if Hunter
step
use Taming Rod##15917
|tip On a Dire Mottled Boar.
Tame a Dire Mottled Boar |q 6062/1 |goto Durotar/0 51.40,48.00
|mapmarker Durotar/0 50.40,44.40
|mapmarker Durotar/0 50.40,52.00
|mapmarker Durotar/0 54.00,45.40
|mapmarker Durotar/0 54.20,50.60
|mapmarker Durotar/0 56.60,47.00
|mapmarker Durotar/0 57.20,50.20
|only if Hunter
step
talk Thotar##3171
|tip Inside the building.
turnin Taming the Beast##6062 |goto Durotar/0 51.85,43.49
accept Taming the Beast##6083 |goto Durotar/0 51.85,43.49
|only if Hunter
step
use Taming Rod##15919
|tip On a Surf Crawler.
|tip Crabs.
Tame a Surf Crawler |q 6083/1 |goto Durotar/0 57.80,28.00
|mapmarker Durotar/0 59.40,23.00
|mapmarker Durotar/0 59.80,31.00
|mapmarker Durotar/0 60.40,26.00
|only if Hunter
step
talk Thotar##3171
|tip Inside the building.
turnin Taming the Beast##6083 |goto Durotar/0 51.85,43.49
accept Taming the Beast##6082 |goto Durotar/0 51.85,43.49
|only if Hunter
step
use Taming Rod##15920
|tip On an Armored Scorpid.
Tame an Armored Scorpid |q 6082/1 |goto Durotar/0 55.00,38.20
|mapmarker Durotar/0 54.00,33.80
|mapmarker Durotar/0 54.20,30.40
|mapmarker Durotar/0 57.20,29.00
|only if Hunter
step
talk Thotar##3171
|tip Inside the building.
turnin Taming the Beast##6082 |goto Durotar/0 51.85,43.49
accept Training the Beast##6081 |goto Durotar/0 51.85,43.49
|only if Hunter
step
talk Grimtak##3881
buy Tough Jerky##117 |n
|tip Buy {o}20{}, or whatever you can afford.
|tip Used to feed your pet soon.
Visit the Vendor |vendor Grimtak##3881 |goto Durotar 51.13,42.63 |q 6081
|only if Hunter
step
talk Rhinag##3190
|tip Between the rocks.
|tip {o}Hurry{}, timed quest.
accept Need for a Cure##812 |goto Durotar/0 41.55,18.61
|only if Hunter
step
talk Doras##3310
|tip Top of the tower.
fpath Orgrimmar |goto Orgrimmar 45.13,63.90
|only if Hunter
step
talk Nazgrel##3230
|tip Inside the building.
turnin The Admiral's Orders##831 |goto Orgrimmar/0 32.27,35.80
|only if Hunter
step
talk Kor'ghan##3189
|tip Inside the Cleft of Shadow.
accept Finding the Antidote##813 |goto Orgrimmar 47.24,53.58
|only if haveq(812) and Hunter
step
Abandon the {y}Need for a Cure{} Quest |complete not haveq(812)
|tip Not needed.
|tip Removes the quest timer.
|only if Hunter
step
talk Ormak Grimshot##3352
|tip Top of the building.
turnin Training the Beast##6081 |goto Orgrimmar/0 66.05,18.54
|only if Hunter
step
_NOTE:_
Train Your Pet
|tip Learn pet abilities from Pet Trainers.
|tip Cast {o}Beast Training{} to teach your pet.
Click Here to Continue |confirm |q 834 |future
|only if Dwarf Hunter
step
talk Xao'tsu##10088
|tip Top of the building.
Train Pet Abilities |trainer Xao'tsu##10088 |goto Orgrimmar/0 66.34,14.83 |q 834 |future
|only if Hunter
step
_NOTE:_
Tame a Venomtail Scorpid
|tip Cast {o}Tame Beast{} on a {o}Venomtail Scorpid{}.
|tip Scorpions.
|tip New permanent pet.
Click Here to Continue |confirm |goto Durotar 49.80,17.40 |q 834 |future
|mapmarker Durotar/0 38.00,19.20
|mapmarker Durotar/0 38.20,22.40
|mapmarker Durotar/0 39.20,16.40
|mapmarker Durotar/0 41.40,19.40
|mapmarker Durotar/0 44.40,21.00
|mapmarker Durotar/0 43.40,16.60
|mapmarker Durotar/0 52.80,12.80
|mapmarker Durotar/0 55.40,15.20
|mapmarker Durotar/0 55.80,12.20
|only if Hunter
step
talk Swart##3173
|tip Inside the building.
Train Abilities |trainer Swart##3173 |goto Durotar/0 54.42,42.59 |q 834 |future
|only if Shaman
step
talk Swart##3173
|tip Inside the building.
accept Call of Fire##2983 |goto Durotar/0 54.42,42.59
|only if Shaman
step
talk Kranal Fiss##5907
|tip Walks around.
turnin Call of Fire##2983 |goto The Barrens 56.03,19.89
accept Call of Fire##1524 |goto The Barrens 56.03,19.89
|only if Shaman
step
Follow the path up |goto Durotar 36.59,57.07 < 20 |only if walking
talk Telf Joolam##5900
|tip Top of the mountain.
turnin Call of Fire##1524 |goto Durotar 38.55,58.96
accept Call of Fire##1525 |goto Durotar 38.55,58.96
|only if Shaman
step
kill Razormane Geomancer##3269, Razormane Thornweaver##3268, Razormane Mystic##3271, Razormane Water Seeker##3267
|tip Thornweavers and Water Seekers.
collect Fire Tar##5026 |q 1525/1 |goto The Barrens 55.60,25.40
|mapmarker The Barrens/0 53.00,25.20
|mapmarker The Barrens/0 54.40,27.20
|only if Shaman
step
Follow the path up |goto 54.54,38.79 < 40 |only if walking and not (subzone("Dustwind Cave") and indoors())
kill Burning Blade Cultist##3199+
|tip Inside the cave.
|tip In the back.
collect Reagent Pouch##6652 |q 1525/2 |goto Durotar/0 52.80,28.60
|mapmarker Durotar/0 51.80,25.80
|only if Shaman
step
Leave the cave |goto Durotar/0 52.80,28.60 < 15 |walk |only if subzone("Dustwind Cave") and indoors()
talk Rezlak##3293
accept Winds in the Desert##834 |goto Durotar 46.37,22.94
step
click Stolen Supply Sack+
|tip Tan bags.
collect 5 Sack of Supplies##4918 |q 834/1 |goto Durotar 49.10,22.50
|mapmarker Durotar/0 47.20,29.70
|mapmarker Durotar/0 47.20,30.80
|mapmarker Durotar/0 47.30,33.50
|mapmarker Durotar/0 49.70,24.30
|mapmarker Durotar/0 49.70,32.20
|mapmarker Durotar/0 50.10,25.70
step
talk Rezlak##3293
turnin Winds in the Desert##834 |goto Durotar 46.37,22.94
accept Securing the Lines##835 |goto Durotar 46.37,22.94
step
Follow the path and run through the tunnel |goto Durotar 51.95,27.44 < 15 |only if walking and not subzone("Drygulch Ravine")
kill 8 Dustwind Storm Witch##3118 |q 835/2 |goto Durotar 53.20,24.60
kill 12 Dustwind Savage##3117 |q 835/1 |goto Durotar 53.20,24.60
|mapmarker Durotar/0 51.20,19.20
|mapmarker Durotar/0 51.40,21.00
|mapmarker Durotar/0 51.40,23.40
|mapmarker Durotar/0 52.60,21.40
|mapmarker Durotar/0 54.00,22.40
step
Allow Enemies to Kill You
|tip Fast travel.
Die on Purpose |complete isdead |goto Durotar 53.20,24.60 |q 835
|mapmarker Durotar/0 51.20,19.20
|mapmarker Durotar/0 51.40,21.00
|mapmarker Durotar/0 51.40,23.40
|mapmarker Durotar/0 52.60,21.40
|mapmarker Durotar/0 54.00,22.40
|only if not hardcore()
step
talk Spirit Healer##6491
Select _"Return me to life."_ |gossip 96031
Resurrect at the Spirit Healer |complete not isdead |goto Durotar 47.05,17.59 |q 835 |zombiewalk
|only if not hardcore()
step
Run through the tunnel |goto Durotar/0 53.51,27.79 < 15 |only if walking and subzone("Drygulch Ravine")
talk Rezlak##3293
turnin Securing the Lines##835 |goto Durotar 46.37,22.94
step
talk Misha Tor'kren##3193
|tip Walks around.
|tip Inside the building.
accept Lost But Not Forgotten##816 |goto Durotar 43.11,30.24
step
kill Dreadmaw Crocolisk##3110+
collect Kron's Amulet##4891 |q 816/1 |goto Durotar/0 34.80,36.40
|mapmarker Durotar/0 34.20,44.00
|mapmarker Durotar/0 34.20,49.00
|mapmarker Durotar/0 34.40,52.00
|mapmarker Durotar/0 37.40,17.00
|mapmarker Durotar/0 34.80,30.60
|mapmarker Durotar/0 34.80,40.60
|mapmarker Durotar/0 35.00,55.80
|mapmarker Durotar/0 35.40,24.80
|mapmarker Durotar/0 36.20,21.40
step
Follow the path up |goto Durotar 36.59,57.07 < 15 |only if walking
talk Telf Joolam##5900
|tip Top of the mountain.
turnin Call of Fire##1525 |goto Durotar 38.55,58.96
accept Call of Fire##1526 |goto Durotar 38.55,58.96
|only if Shaman
step
use Fire Sapta##6636
|tip Top of the mountain.
Gain Sapta Sight |havebuff Sapta Sight##8898 |goto Durotar 38.16,58.54 |q 1526
|only if Shaman
step
kill Minor Manifestation of Fire##5893
|tip Top of the mountain.
collect Glowing Ember##6655 |q 1526/1 |goto Durotar 38.72,58.29
|only if Shaman
step
click Brazier of the Dormant Flame
|tip Top of the mountain.
turnin Call of Fire##1526 |goto Durotar 38.95,58.22
accept Call of Fire##1527 |goto Durotar 38.95,58.22
|only if Shaman
step
talk Kranal Fiss##5907
|tip Walks around.
turnin Call of Fire##1527 |goto The Barrens 56.04,19.89
|only if Shaman
step
Kill enemies
ding 11,4400 |goto Durotar 42.40,40.60
|mapmarker Durotar/0 41.20,37.80
|mapmarker Durotar/0 44.40,36.00
step
talk Misha Tor'kren##3193
|tip Walks around.
|tip Inside the building.
turnin Lost But Not Forgotten##816 |goto Durotar 43.11,30.24
step
talk Rhinag##3190
|tip Between the rocks.
|tip {o}Hurry{}, timed quest.
accept Need for a Cure##812 |goto Durotar/0 41.55,18.61
|only if not Hunter
step
talk Doras##3310
|tip Top of the tower.
fpath Orgrimmar |goto Orgrimmar 45.13,63.90
step
talk Ur'kyo##6018
|tip Inside the building.
turnin Hex of Weakness##5654 |goto Orgrimmar/0 35.59,87.80
|only if Priest
step
talk Nazgrel##3230
|tip Inside the building.
turnin The Admiral's Orders##831 |goto Orgrimmar/0 32.27,35.80
step
talk Kor'ghan##3189
|tip Inside the Cleft of Shadow.
accept Finding the Antidote##813 |goto Orgrimmar 47.24,53.58
|only if haveq(812)
step
Abandon the {y}Need for a Cure{} Quest |complete not haveq(812)
|tip Not needed.
|tip Removes the quest timer.
step
Leave the cave |goto Durotar 55.02,9.79 < 15 |walk |only if subzone("Skull Rock") and indoors()
kill Venomtail Scorpid##3127+
|tip Scorpions.
collect 4 Venomtail Poison Sac##4886 |q 813/1 |goto Durotar 43.40,16.60
|mapmarker Durotar/0 38.00,19.20
|mapmarker Durotar/0 38.20,22.40
|mapmarker Durotar/0 39.20,16.40
|mapmarker Durotar/0 41.40,19.40
|mapmarker Durotar/0 44.40,21.00
|mapmarker Durotar/0 55.40,15.20
|mapmarker Durotar/0 52.80,12.80
|mapmarker Durotar/0 49.80,17.40
|mapmarker Durotar/0 55.80,12.20
step
talk Kor'ghan##3189
|tip Inside the Cleft of Shadow.
turnin Finding the Antidote##813 |goto Orgrimmar 47.24,53.59
step
talk Rhinag##3190
|tip Between the rocks.
accept Need for a Cure##812 |goto Durotar/0 41.55,18.61
step
talk Rhinag##3190
|tip Between the rocks.
turnin Need for a Cure##812 |goto Durotar/0 41.55,18.61
step
Kill enemies
ding 12 |goto Durotar 43.40,16.60
|mapmarker Durotar/0 38.00,19.20
|mapmarker Durotar/0 38.20,22.40
|mapmarker Durotar/0 39.20,16.40
|mapmarker Durotar/0 41.40,19.40
|mapmarker Durotar/0 44.40,21.00
|mapmarker Durotar/0 55.40,15.20
|mapmarker Durotar/0 52.80,12.80
|mapmarker Durotar/0 49.80,17.40
|mapmarker Durotar/0 55.80,12.20
step
talk Enyo##5883
|tip Inside the building.
Train Abilities |trainer Enyo##5883 |goto Orgrimmar/0 38.79,85.65 |q 375 |future
|only if Mage
step
talk Ur'kyo##6018
|tip Inside the building.
Train Abilities |trainer Ur'kyo##6018 |goto Orgrimmar/0 35.59,87.80 |q 375 |future
|only if Priest
step
talk Kardris Dreamseeker##3344
|tip Inside the building.
Train Abilities |trainer Kardris Dreamseeker##3344 |goto Orgrimmar/0 38.80,36.38 |q 375 |future
|only if Shaman
step
talk Ormok##3328
|tip Inside the Cleft of Shadow.
Train Abilities |trainer Ormok##3328 |goto Orgrimmar/0 43.91,54.63 |q 375 |future
|only if Rogue
step
talk Mirket##3325
|tip Inside the Cleft of Shadow.
Train Abilities |trainer Mirket##3325 |goto Orgrimmar/0 48.62,46.95 |q 375 |future
|only if Warlock
step
talk Kurgul##5815
|tip Buy available Grimoires.
|tip Inside the Cleft of Shadow.
Train Demon Abilities |vendor Kurgul##5815 |goto Orgrimmar 47.52,46.72 |q 375 |future
|only if Warlock
step
talk Grezz Ragefist##3353
|tip Inside the building.
Train Abilities |trainer Grezz Ragefist##3353 |goto Orgrimmar/0 79.78,31.42 |q 375 |future
|only if Warrior
step
talk Hanashi##2704
|tip Inside the building.
Train Staves |complete weaponskill("TH_STAFF") > 0 |goto Orgrimmar/0 81.53,19.63
|only if Warrior
step
talk Ormak Grimshot##3352
|tip Top of the building.
Train Abilities |trainer Ormak Grimshot##3352 |goto Orgrimmar/0 66.06,18.54 |q 375 |future
|only if Hunter
step
talk Xao'tsu##10088
|tip Top of the building.
Train Pet Abilities |trainer Xao'tsu##10088 |goto Orgrimmar/0 66.33,14.82 |q 375 |future
|only if Hunter
step
talk Michael Garrett##4551
fpath Undercity |goto Undercity 63.28,48.58
|only if not (Rogue or Warlock)
step
talk Austil de Mon##2131
|tip Inside the building.
accept Speak with Dillinger##1818 |goto Tirisfal Glades 61.85,52.54
|only if Warrior
step
talk Coleman Farthing##1500
|tip Inside the building.
accept Deaths in the Family##354 |goto Tirisfal Glades/0 61.72,52.29
accept The Haunted Mills##362 |goto Tirisfal Glades/0 61.72,52.29
step
talk Cain Firesong##2128
|tip Upstairs inside the building.
accept Speak with Anastasia##1881 |goto Tirisfal Glades/0 61.97,52.47
|only if Mage
step
talk Gretchen Dedmar##1521
|tip Upstairs inside the building.
accept The Chill of Death##375 |goto Tirisfal Glades/0 61.89,52.73
step
talk Ageron Kargal##5724
|tip Upstairs inside the building.
accept Halgar's Summons##1478 |goto Tirisfal Glades/0 61.62,52.68
|only if Warlock
step
talk Magistrate Sevren##1499
|tip Inside the building.
accept Graverobbers##358 |goto Tirisfal Glades/0 61.26,50.84
step
click Wanted!
|tip Wanted poster.
accept Wanted: Maggot Eye##398 |goto Tirisfal Glades 60.73,51.52
step
talk Apothecary Johaan##1518
|tip Inside the building.
accept A New Plague##367 |goto Tirisfal Glades/0 59.45,52.40
step
talk Deathguard Dillinger##1496
turnin Speak with Dillinger##1818 |goto Tirisfal Glades 58.20,51.45
accept Ulag the Cleaver##1819 |goto Tirisfal Glades 58.20,51.45
|only if Warrior
step
click Mausoleum Trigger##104593
|tip Metal plate with skull icon.
Watch the dialogue
kill Ulag the Cleaver##6390 |q 1819/1 |goto Tirisfal Glades 59.16,48.51
|only if Warrior
step
talk Deathguard Dillinger##1496
turnin Ulag the Cleaver##1819 |goto Tirisfal Glades 58.20,51.45
accept Speak with Coleman##1820 |goto Tirisfal Glades 58.20,51.45
|only if Warrior
step
talk Coleman Farthing##1500
|tip Inside the building.
turnin Speak with Coleman##1820 |goto Tirisfal Glades 61.72,52.29
|only if Warrior
step
talk Michael Garrett##4551
fpath Undercity |goto Undercity 63.28,48.58
|only if Rogue or Warlock or Mage
step
talk Archibald##11870
Train Swords |complete weaponskill("SWORD") > 0 |goto Undercity 57.31,32.77
|only if Rogue
step
talk Carendin Halgar##5675
turnin Halgar's Summons##1478 |goto Undercity 85.04,26.01
accept Creature of the Void##1473 |goto Undercity 85.04,26.01
|only if Warlock
step
click Perrine's Chest
|tip Inside the building.
collect Egalin's Grimoire##6285 |q 1473/1 |goto Tirisfal Glades 51.06,67.57
|only if Warlock
step
talk Carendin Halgar##5675
turnin Creature of the Void##1473 |goto Undercity 85.04,26.01
accept The Binding##1471 |goto Undercity 85.04,26.01
|only if Warlock
step
use Runes of Summoning##6284
|tip On the pink symbol.
kill Summoned Voidwalker##5676 |q 1471/1 |goto Undercity 86.62,27.10
|only if Warlock
step
talk Carendin Halgar##5675
turnin The Binding##1471 |goto Undercity 85.04,26.01
|only if Warlock
step
talk Anastasia Hartwell##4568
|tip Upstairs inside the building.
turnin Speak with Anastasia##1881 |goto Undercity/0 85.14,10.03
accept The Balnir Farmstead##1882 |goto Undercity/0 85.14,10.03
|only if Mage
stickystart "Collect_Darkhound_Blood"
step
kill Vampiric Duskbat##1554+
collect 5 Duskbat Pelt##2876 |q 375/1 |goto Tirisfal Glades 51.20,61.40
|mapmarker Tirisfal Glades/0 42.20,58.20
|mapmarker Tirisfal Glades/0 45.20,62.60
|mapmarker Tirisfal Glades/0 45.20,69.40
|mapmarker Tirisfal Glades/0 46.00,58.80
|mapmarker Tirisfal Glades/0 47.80,65.60
|mapmarker Tirisfal Glades/0 48.40,62.60
|mapmarker Tirisfal Glades/0 48.40,68.60
|mapmarker Tirisfal Glades/0 49.40,58.80
step
label "Collect_Darkhound_Blood"
kill Cursed Darkhound##1548+
|tip Grey demon dogs.
collect 5 Darkhound Blood##2858 |q 367/1 |goto Tirisfal Glades49.60,62.20
|tip Unlocks higher level quest.
|mapmarker Tirisfal Glades/0 40.40,57.20
|mapmarker Tirisfal Glades/0 41.20,64.80
|mapmarker Tirisfal Glades/0 43.80,57.40
|mapmarker Tirisfal Glades/0 44.60,66.20
|mapmarker Tirisfal Glades/0 45.20,61.20
|mapmarker Tirisfal Glades/0 47.20,64.40
|mapmarker Tirisfal Glades/0 47.80,58.60
step
talk Apothecary Johaan##1518
|tip Inside the building.
turnin A New Plague##367 |goto Tirisfal Glades/0 59.45,52.40
accept A New Plague##368 |goto Tirisfal Glades/0 59.45,52.40
step
talk Abigail Shiel##2118
buy Coarse Thread##2320 |q 375/2 |goto Tirisfal Glades 61.03,52.37
step
talk Gretchen Dedmar##1521
|tip Upstairs inside the building.
turnin The Chill of Death##375 |goto Tirisfal Glades 61.89,52.73
step
kill Devlin Agamand##1657
|tip Armored skeleton mage.
|tip Walks around.
collect Devlin's Remains##2831 |q 362/1 |goto Tirisfal Glades 47.40,41.60
|mapmarker Tirisfal Glades/0 46.80,39.40
step
kill Nissa Agamand##1655
|tip Banshee.
|tip Walks around.
|tip {o}Both floors{} inside the building.
collect Nissa's Remains##2828 |q 354/2 |goto Tirisfal Glades 49.54,36.02
step
kill Gregor Agamand##1654
|tip Ghoul.
|tip Walks around.
collect Gregor's Remains##2829 |q 354/1 |goto Tirisfal Glades 46.40,30.60
|mapmarker Tirisfal Glades/0 44.40,30.20
|mapmarker Tirisfal Glades/0 45.40,28.40
step
kill Thurman Agamand##1656
|tip Zombie.
|tip Walks around.
collect Thurman's Remains##2830 |q 354/3 |goto Tirisfal Glades 43.40,34.20
|mapmarker Tirisfal Glades/0 42.40,31.80
step
use A Letter to Yvette##2839
accept A Letter Undelivered##361
|only if itemcount(2839) > 0
stickystart "Kill_Rot_Hide_Mongrels"
stickystart "Collect_Embalming_Ichors"
step
Jump down carefully |goto Tirisfal Glades/0 54.28,31.67 < 30 |only if walking and subzone("Agamand Mills")
kill Maggot Eye##1753
|tip Inside the building.
collect Maggot Eye's Paw##3635 |q 398/1 |goto Tirisfal Glades 58.66,30.76
stickystop "Kill_Rot_Hide_Mongrels"
stickystop "Collect_Embalming_Ichors"
step
kill Vile Fin Puddlejumper##1543, Vile Fin Minor Oracle##1544, Vile Fin Muckdweller##1545
|tip Murlocs.
collect 5 Vile Fin Scale##2859 |q 368/1 |goto Tirisfal Glades 62.40,28.80
|mapmarker Tirisfal Glades/0 65.00,27.20
|mapmarker Tirisfal Glades/0 65.20,31.60
|mapmarker Tirisfal Glades/0 67.40,29.20
|mapmarker Tirisfal Glades/0 69.00,25.40
|mapmarker Tirisfal Glades/0 70.60,28.00
|mapmarker Tirisfal Glades/0 72.00,24.20
|mapmarker Tirisfal Glades/0 74.00,28.60
|mapmarker Tirisfal Glades/0 75.80,25.40
stickystart "Collect_Embalming_Ichors"
step
label "Kill_Rot_Hide_Mongrels"
kill 5 Rot Hide Mongrel##1675 |q 358/2 |goto Tirisfal Glades 59.40,33.60
|mapmarker Tirisfal Glades/0 56.40,33.40
|mapmarker Tirisfal Glades/0 56.40,40.20
|mapmarker Tirisfal Glades/0 58.20,30.40
|mapmarker Tirisfal Glades/0 58.20,36.60
|mapmarker Tirisfal Glades/0 60.60,38.60
step
kill 8 Rot Hide Graverobber##1941 |q 358/1 |goto Tirisfal Glades 55.37,42.34
|mapmarker Tirisfal Glades/0 53.20,43.40
|mapmarker Tirisfal Glades/0 55.40,39.20
|mapmarker Tirisfal Glades/0 56.20,44.80
|mapmarker Tirisfal Glades/0 57.80,41.80
step
label "Collect_Embalming_Ichors"
kill Rot Hide Graverobber##1941, Rot Hide Gnoll##1674, Rot Hide Mongrel##1675
|tip Gnolls.
collect 8 Embalming Ichor##2834 |q 358/3 |goto Tirisfal Glades 58.20,41.20
|mapmarker Tirisfal Glades/0 53.20,43.40
|mapmarker Tirisfal Glades/0 55.40,39.20
|mapmarker Tirisfal Glades/0 56.40,34.40
|mapmarker Tirisfal Glades/0 58.20,30.40
|mapmarker Tirisfal Glades/0 58.40,44.80
|mapmarker Tirisfal Glades/0 59.60,33.40
|mapmarker Tirisfal Glades/0 60.60,38.60
step
talk Yvette Farthing##1560
|tip Inside the building.
turnin A Letter Undelivered##361 |goto Tirisfal Glades/0 61.58,52.60
|only if haveq(361) or completedq(361)
step
talk Coleman Farthing##1500
|tip Inside the building.
turnin Deaths in the Family##354 |goto Tirisfal Glades/0 61.72,52.29
turnin The Haunted Mills##362 |goto Tirisfal Glades/0 61.72,52.29
accept Speak with Sevren##355 |goto Tirisfal Glades/0 61.72,52.29
step
talk Magistrate Sevren##1499
|tip Inside the building.
turnin Speak with Sevren##355 |goto Tirisfal Glades 61.26,50.84
turnin Graverobbers##358 |goto Tirisfal Glades/0 61.26,50.84
step
talk Executor Zygand##1515
turnin Wanted: Maggot Eye##398 |goto Tirisfal Glades/0 60.59,51.76
step
talk Apothecary Johaan##1518
|tip Inside the building.
turnin A New Plague##368 |goto Tirisfal Glades/0 59.45,52.40
accept Delivery to Silverpine Forest##445 |goto Tirisfal Glades 59.45,52.40
step
talk Deathguard Linnea##1495
accept Rear Guard Patrol##356 |goto Tirisfal Glades 65.49,60.25
stickystart "Kill_Bleeding_Horrors_And_Wandering_Spirits"
step
click Balnir Snapdragons
collect Balnir Snapdragons##7227 |q 1882/1 |goto Tirisfal Glades/0 76.94,62.38
|only if Mage
step
label "Kill_Bleeding_Horrors_And_Wandering_Spirits"
kill 8 Bleeding Horror##1529 |q 356/1 |goto Tirisfal Glades 75.54,60.85
kill 8 Wandering Spirit##1532 |q 356/2 |goto Tirisfal Glades 75.54,60.85
|mapmarker Tirisfal Glades/0 73.40,61.20
|mapmarker Tirisfal Glades/0 75.20,58.40
|mapmarker Tirisfal Glades/0 76.40,62.60
|mapmarker Tirisfal Glades/0 78.60,59.00
step
Kill enemies
|tip Helps reach level 13 after quest turnins.
ding 12,9450 |goto Tirisfal Glades 75.54,60.85
|mapmarker Tirisfal Glades/0 73.40,61.20
|mapmarker Tirisfal Glades/0 75.20,58.40
|mapmarker Tirisfal Glades/0 76.40,62.60
|mapmarker Tirisfal Glades/0 78.60,59.00
step
talk Deathguard Linnea##1495
turnin Rear Guard Patrol##356 |goto Tirisfal Glades 65.49,60.25
step
talk Anastasia Hartwell##4568
|tip Upstairs inside the building.
turnin The Balnir Farmstead##1882 |goto Undercity/0 85.14,10.03
|only if Mage
]])
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Silverpine Forest (13-15)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\The Barrens & Stonetalon Mountain (15-21)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Ashenvale (21-22)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Hillsbrad Foothills (22-24)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\The Barrens (24-25)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Stonetalon Mountains (25-26)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Ashenvale (26-28)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Thousand Needles (28-30)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Hillsbrad Foothills (30-32)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Arathi Highlands (32-33)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Thousand Needles (33-34)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Desolace (34-36)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Stranglethorn Vale (36-37)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Dustwallow Marsh (37-38)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Alterac Mountains & Arathi Highlands (38-39)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Badlands (39-40)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Stranglethorn Vale & Swamp of Sorrows (40-41)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Desolace (41-41)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Tanaris (41-42)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Dustwallow Marsh (42-42)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Tanaris (42-43)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Feralas (43-44)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Stranglethorn Vale (44-45)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Swamp of Sorrows (45-46)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Tanaris & Dustwallow Marsh (46-48)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\The Hinterlands (48-49)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Feralas & Un'Goro Crater (49-50)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Stranglethorn Vale & Swamp of Sorrows (50-50)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Blasted Lands (50-51)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Searing Gorge (51-51)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Burning Steppes & Azshara (51-52)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Felwood & Winterspring (52-53)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Un'Goro Crater (53-54)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Azshara (54-54)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Felwood & Winterspring (54-56)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Western & Eastern Plaguelands (56-58)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Winterspring (58-59)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Silithus (59-60)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Ahn'Qiraj Gear\\Ruins of Ahn'Qiraj Cloak Quest")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Ahn'Qiraj Gear\\Ruins of Ahn'Qiraj Ring Quest")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Ahn'Qiraj Gear\\Ruins of Ahn'Qiraj Weapon Quest")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Ahn'Qiraj Gear\\Temple of Ahn'Qiraj Shoulder Quest")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Ahn'Qiraj Gear\\Temple of Ahn'Qiraj Boots Quest")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Ahn'Qiraj Gear\\Temple of Ahn'Qiraj Helm Quest")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Ahn'Qiraj Gear\\Temple of Ahn'Qiraj Legs Quest")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Ahn'Qiraj Gear\\Temple of Ahn'Qiraj Chest Quest")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Scepter of the Shifting Sands")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Ahn'Qiraj Gear\\Signet Ring of the Bronze Dragonflight")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Ahn'Qiraj Gear\\Cenarion Battlegear")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Cenarion Field Duty Combat Assignments")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Cenarion Field Duty Tactical Assignments")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Cenarion Field Duty Logistics Assignments")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Druid Class Quests")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Priest Class Quests")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Warrior Class Quests")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Hunter Class Quests")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Mage Class Quests")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Rogue Class Quests")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Shaman Class Quests")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Warlock Class Quests")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Blood Frenzy [Durotar]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Blood Frenzy [Mulgore]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Blood Frenzy [Tirisfal Glades]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Consumed by Rage [Wetlands]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Devastate [Durotar]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Devastate [Mulgore]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Devastate [Tirisfal Glades]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Endless Rage [The Barrens]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Flagellation [Duskwood]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Frenzied Assault (Thunder Bluff)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Frenzied Assault (Tirisfal Glades)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Frenzied Assault (Orgrimmar)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Furious Thunder (Durotar)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Furious Thunder (Mulgore)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Furious Thunder (Tirisfal Glades)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Quick Strike [The Barrens]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Raging Blow [Ashenvale]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Single-Minded Fury")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Phase 2 Runes\\Blood Surge")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Phase 2 Runes\\Enraged Regeneration")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Phase 2 Runes\\Focused Rage [Arathi Highlands]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Phase 2 Runes\\Intervene [Thousand Needles]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Phase 2 Runes\\Precise Timing")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Phase 2 Runes\\Rallying Cry [Badlands]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Phase 3 Runes\\Rampage")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Phase 3 Runes\\Sword and Board")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Phase 3 Runes\\Shield Mastery")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Phase 3 Runes\\Gladiator Stance")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Phase 3 Runes\\Wrecking Crew")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Phase 3 Runes\\Taste for Blood")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Phase 3 Runes\\Vigilance")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Phase 4 Runes\\Fresh Meat")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Phase 4 Runes\\Sudden Death")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Phase 4 Runes\\Shockwave")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Phase 4 Runes\\Commanding Shout (Skill Book)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Between the Eyes [Orgrimmar]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Between the Eyes [Tirisfal Glades]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Blade Dance [The Barrens]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Deadly Brew [Silvepine Forest]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Envenom [Hillsbrad Foothills]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Just a Flesh Wound")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Main Gauche [The Barrens]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Mutilate [Durotar]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Mutilate [Tirisfal Glades]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Quick Draw [Durotar]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Quick Draw [Tirisfal Glades]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Saber Slash [The Barrens]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Saber Slash [Silverpine Forest]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Shadowstrike (Orc Only) [Durotar]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Shadowstrike (Troll Only) [Durotar]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Shadowstrike (Undead Only) [Tirisfal Glades]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Shiv [Duskwood]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Slaughter from the Shadows [Durotar]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Slaughter from the Shadows [Tirisfal Glades]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Phase 2 Runes\\Master of Subtlety [Stranglethorn Vale]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Phase 2 Runes\\Poisoned Knife")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Phase 2 Runes\\Rolling with the Punches [Thousand Needles]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Phase 2 Runes\\Shadowstep")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Phase 2 Runes\\Shuriken Toss [Swamp of Sorrows]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Phase 2 Runes\\Waylay")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Phase 3 Runes\\Combat Potency")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Phase 3 Runes\\Carnage")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Phase 3 Runes\\Unfair Advantage")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Phase 3 Runes\\Focused Attacks")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Phase 3 Runes\\Honor Among Thieves")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Phase 3 Runes\\Cut to the Chase")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Phase 4 Runes\\Blunderbuss")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Phase 4 Runes\\Crimson Tempest")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Phase 4 Runes\\Fan of Knives")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Phase 4 Runes\\Redirect (Skill Book)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Phase 4 Runes\\Atrophic Poison (Skill Book)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Phase 4 Runes\\Numbing Poison (Skill Book)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Phase 4 Runes\\Occult Poison (Skill Book)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Phase 4 Runes\\Sebacious Poison (Skill Book)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Second Meditation Unlock\\Second Meditation Unlock (Troll Only)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Second Meditation Unlock\\Second Meditation Unlock (Undead Only)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Circle of Healing [Duskwood]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Homunculi [Durotar]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Homunculi [Tirisfal Glades]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Mind Sear")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Penanace (Troll Only) [Durotar]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Penanace (Undead Only) [Tirisfal Glades]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Power Word: Barrier [Redridge Mountains]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Prayer of Mending [Durotar]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Serendipity [The Barrens]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Shadow Word: Death [The Barrens]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Shared Pain [Durotar]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Shared Pain [Tirisfal Glades]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Strength of Soul [Ashenvale]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Twisted Faith [The Barrens]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Void Plague [Durotar]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Void Plague [Tirisfal Glades]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Phase 2 Runes\\Dispersion [Stranglethorn Vale]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Phase 2 Runes\\Empowered Renew [Alterac Mountains]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Phase 2 Runes\\Mind Spike")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Phase 2 Runes\\Pain Suppression")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Phase 2 Runes\\Renewed Hope [Desolace]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Phase 2 Runes\\Spirit of the Redeemer")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Phase 3 Runes\\Divine Aegis")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Phase 3 Runes\\Surge of Light")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Phase 3 Runes\\Eye of the Void")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Phase 3 Runes\\Pain and Suffering")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Phase 3 Runes\\Despair")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Phase 3 Runes\\Void Zone")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Phase 4 Runes\\Binding Heal")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Phase 4 Runes\\Soul Warding")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Phase 4 Runes\\Vampiric Touch")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Phase 4 Runes\\Increased Fortitude (Skill Book)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Phase 4 Runes\\Shadowfiend (Skill Book)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Arcane Blast [Ashenvale]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Arcane Surge")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Burnout [Durotar]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Burnout [Tirisfal Glades]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Enlightenment [Tirisfal Glades]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Fingers of Frost [Durotar]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Fingers of Frost [Tirisfal Glades]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Ice Lance [Durotar]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Ice Lance [Tirisfal Glades]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Icy Veins")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Living Bomb [Loch Modan]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Living Flame [Durotar]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Living Flame [Tirisfal Glades]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Mass Regeneration [Duskwood]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Regeneration [Silverpine Forest]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Regeneration [The Barrens]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Rewind Time [The Barrens]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Phase 2 Runes\\Brain Freeze [Various Zones]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Phase 2 Runes\\Chronostatic Preservation [Thousand Needles]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Phase 2 Runes\\Frostfire Bolt [Stranglethorn Vale]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Phase 2 Runes\\Hot Streak [Alterac Mountains]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Phase 2 Runes\\Missile Barrage [Deadwind Pass]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Phase 2 Runes\\Spellfrost Bolt [Stranglethorn Vale]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Phase 2 Runes\\Spell Power [Various Zones]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Phase 3 Runes\\Advanced Warding")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Phase 3 Runes\\Balefire Bolt")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Phase 3 Runes\\Displacement")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Phase 3 Runes\\Deep Freeze")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Phase 3 Runes\\Temporal Anomaly")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Phase 3 Runes\\Molten Armor")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Phase 4 Runes\\Arcane Barrage")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Phase 4 Runes\\Overheat")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Phase 4 Runes\\Frozen Orb")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Phase 4 Runes\\Expanded Intellect (Skill Book)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Chaos Bolt [Durotar]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Chaos Bolt [Tirisfal Glades]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Demonic Grace [Durotar]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Demonic Grace [Tirisfal Glades]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Demonic Pact [The Barrens]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Demonic Tactics [Tirisfal Glades]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Everlasting Affliction")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Haunt (Orc Only) [Durotar]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Haunt (Undead Only) [Tirisfal Glades]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Incinerate [Redridge Mountains]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Lake of Fire [Hillsbrad Foothills]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Master Channeler [The Barrens]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Master Channeler [Silverpine Forest]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Metamorphosis [The Barrens]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Shadow Bolt Volley [The Barrens]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Shadow Bolt Volley [Silverpine Forest]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Soul Siphon [Durotar]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Soul Siphon [Tirisfal Glades]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Phase 2 Runes\\Dance of the Wicked [Thousand Needles]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Phase 2 Runes\\Demonic Knowledge")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Phase 2 Runes\\Grimoire of Synergy")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Phase 2 Runes\\Invocation [Arathi Highlands]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Phase 2 Runes\\Shadow and Flame")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Phase 2 Runes\\Shadowflame [Desolace]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Phase 3 Runes\\Summon Felguard")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Phase 3 Runes\\Vengeance")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Phase 3 Runes\\Explorer Imp & Fel Portal Locations")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Phase 3 Runes\\Immolation Aura")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Phase 3 Runes\\Unstable Affliction")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Phase 3 Runes\\Backdraft")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Phase 3 Runes\\Pandemic")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Phase 4 Runes\\Decimation")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Phase 4 Runes\\Mark of Chaos")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Phase 4 Runes\\Infernal Armor")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Phase 4 Runes\\Fel Armor (Skill Book)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Phase 4 Runes\\Portal of Summoning (Skill Book)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Phase 4 Runes\\Soul Harvesting (Skill Book)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Cobra Slayer [Wetlands]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Beast Mastery [The Barrens]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Beast Mastery [Silverpine Forest]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Carve [Durotar]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Carve [Mulgore]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Chimera Shot (Orc Only) [Durotar]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Chimera Shot (Troll Only) [Durotar]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Chimera Shot (Tauren Only) [Mulgore]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Cobra Strikes [Hillsbrad Foothills]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Explosive Shot [Durotar]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Explosive Shot [Mulgore]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Flanking Strike [Durotar]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Flanking Strike [Mulgore]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Kill Shot [Stonetalon Mountains]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Lone Wolf [The Barrens]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Master Marksman [Durotar]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Master Marksman [Mulgore]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Serpent Spread")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Sniper Training [The Barrens]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Phase 2 Runes\\Dual Wield Specialization [Stranglethorn Vale]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Phase 2 Runes\\Expose Weakness")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Phase 2 Runes\\Wyvern Strike")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Phase 2 Runes\\Melee Specialist")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Phase 2 Runes\\Steady Shot [Arathi Highlands]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Phase 2 Runes\\Trap Launcher")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Phase 3 Runes\\Focus Fire")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Phase 3 Runes\\Raptor Fury")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Phase 3 Runes\\T.N.T.")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Phase 3 Runes\\Catlike Reflexes")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Phase 3 Runes\\Lock and Load")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Phase 3 Runes\\Rapid Killing Rune & Core Hound Pet")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Phase 4 Runes\\Improved Volley")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Phase 4 Runes\\Resourcefulness")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Phase 4 Runes\\Hit and Run")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Phase 4 Runes\\Aspect of the Viper (Skill Book)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Phase 4 Runes\\Heart of the Lion (Skill Book)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Druid\\Fury of Stormrage (Tauren Only) [Mulgore]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Druid\\Lacerate [The Barrens]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Druid\\Lifebloom [Mulgore]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Druid\\Living Seed [Mulgore]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Druid\\Mangle [Mulgore]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Druid\\Savage Roar [Darkshore]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Druid\\Skull Bash")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Druid\\Starsurge [Wetlands]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Druid\\Sunfire [Mulgore]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Druid\\Survival of the Fittest [The Barrens]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Druid\\Wild Growth [Moonglade]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Druid\\Wild Strikes [Stonetalon Mountains]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Druid\\Phase 2 Runes\\Berserk [Thousand Needles]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Druid\\Phase 2 Runes\\Dreamstate [Desolace]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Druid\\Phase 2 Runes\\Eclipse")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Druid\\Phase 2 Runes\\King of the Jungle")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Druid\\Phase 2 Runes\\Nourish")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Druid\\Phase 2 Runes\\Survival Instincts")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Druid\\Phase 3 Runes\\Efflorescence")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Druid\\Phase 3 Runes\\Elune's Fires")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Druid\\Phase 3 Runes\\Improved Frenzied Regeneration")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Druid\\Phase 3 Runes\\Gale Winds")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Druid\\Phase 3 Runes\\Gore")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Druid\\Phase 3 Runes\\Improved Barkskin")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Shaman\\Ancestral Guidance [Durotar]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Shaman\\Ancestral Guidance [Mulgore]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Shaman\\Dual Wield Specialization [The Barrens]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Shaman\\Earth Shield [Ashenvale]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Shaman\\Healing Rain")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Shaman\\Lava Burst [Hillsbrad Foothills]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Shaman\\Dual Wield & Lava Lash [Thunder Bluff]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Shaman\\Molten Blast [Durotar]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Shaman\\Molten Blast [Mulgore]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Shaman\\Overload (Orc Only) [Durotar]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Shaman\\Overload (Troll Only) [Durotar]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Shaman\\Overload (Tauren Only) [Mulgore]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Shaman\\Greater Ghost Wolf [Stonetalon Mountains]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Shaman\\Shield Mastery [Durotar]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Shaman\\Shield Mastery [Mulgore]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Shaman\\Water Shield [The Barrens]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Shaman\\Way of Earth [The Barrens]")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Shaman\\Phase 2 Runes\\Ancestral Awakening")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Shaman\\Phase 2 Runes\\Decoy Totem")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Shaman\\Phase 2 Runes\\Fire Nova")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Shaman\\Phase 2 Runes\\Maelstrom Weapon")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Shaman\\Phase 2 Runes\\Power Surge")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Shaman\\Phase 2 Runes\\Spirit of the Alpha")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Shaman\\Phase 2 Runes\\Two-Handed Mastery")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Shaman\\Phase 3 Runes\\Riptide")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Shaman\\Phase 3 Runes\\Burn")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Shaman\\Phase 3 Runes\\Overcharged")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Shaman\\Phase 3 Runes\\Rolling Thunder")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Shaman\\Phase 3 Runes\\Static Shock")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Shaman\\Phase 3 Runes\\Mental Dexterity")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Shaman\\Phase 3 Runes\\Tidal Waves")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Shaman\\Phase 4 Runes\\Storm, Earth, and Fire")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Shaman\\Phase 4 Runes\\Feral Spirit")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Shaman\\Phase 4 Runes\\Coherence")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Shaman\\Phase 4 Runes\\Shamanistic Rage (Skill Book)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Shaman\\Phase 4 Runes\\Totemic Projection (Skill Book)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Phase 4 Ring Runes\\Rune of Arcane Specialization")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Phase 4 Ring Runes\\Rune of Axe Specialization")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Phase 4 Ring Runes\\Rune of Dagger Specialization")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Phase 4 Ring Runes\\Rune of Defense Specialization")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Phase 4 Ring Runes\\Rune of Feral Combat Specialization")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Phase 4 Ring Runes\\Rune of Fire Specialization")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Phase 4 Ring Runes\\Rune of Fist Weapon Specialization")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Phase 4 Ring Runes\\Rune of Frost Specialization")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Phase 4 Ring Runes\\Rune of Holy Specialization")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Phase 4 Ring Runes\\Rune of Mace Specialization")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Phase 4 Ring Runes\\Rune of Nature Specialization")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Phase 4 Ring Runes\\Rune of Pole Weapon Specialization")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Phase 4 Ring Runes\\Rune of Ranged Weapon Specialization")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Phase 4 Ring Runes\\Rune of Shadow Specialization")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Phase 4 Ring Runes\\Rune of Sword Specialization")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Phase 5 Ring Runes\\Rune of Meditation Specialization")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Phase 5 Ring Runes\\Rune of Healing Specialization")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Items\\Cozy Sleeping Bag")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Items\\Wild Offering (Currency)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Events\\Nightmare Incursion\\Ashenvale Nightmare Incursion")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Events\\Nightmare Incursion\\Duskwood Nightmare Incursion")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Events\\Nightmare Incursion\\Hinterlands Nightmare Incursion")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Events\\Nightmare Incursion\\Feralas Nightmare Incursion")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Events\\Blackrock Eruption")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Events\\Demon Fall Canyon Dungeon Unlock")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Events\\Karazhan Crypts Attunement")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Events\\Scarlet Insignia / Scarlet Uniform")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Scourge Invasion")
