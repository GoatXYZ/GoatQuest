local GoatQuest=GoatQuest
if not GoatQuest then return end
if not GQ.IsClassicSoD then return end
if UnitFactionGroup("player")~="Horde" then return end
if GQ:DoMutex("LevelingHCLASSIC") then return end
GoatQuest.GuideMenuTier = "CLA"
GoatQuest:RegisterGuide("Leveling Guides\\Startup Guide Wizard",{
condition_visible=function() return false end,
noscoring = true,
orientation = true,
hardcore = true,
},[[
step
Welcome to the GoatQuest Startup Wizard!
In order for GoatQuest to perform at its best we need to collect some character data.
This wizard will walk you through a few simple steps to do this.
confirm begin
step
Open the Talent Advisor tab in GoatQuest Settings, and select your preferred build. |complete GQ.TalentAdvisor:IsBuildSelected()
step
findcity Main City
|tip You need to be in a capital city for the upcoming steps.
step
talknpcs Auctioneer |autoscript GQ.ATWereEnabled=GQ.db.profile.auction_enable GQ.db.profile.auction_enable=true
Click the Scan button in the bottom right corner.
Record auction pricing data for the Gold Guide |complete GQ.Gold:LastScan(15)
step
talknpcs Banker
|only if not GQ.Inventory:CharacterBankKnown()
Record the items you have placed in your bank inventory. |complete GQ.Inventory:CharacterBankKnown()
step
talknpcs Flightmaster
Record what flight points you have for the Travel System. | complete LibTaxi:IsContinentKnown()
step
openskill Alchemy
|only if hasprofunscanned("Alchemy")
Record your profession data for the Gold Guide. |complete hasprof("Alchemy",1)
step
openskill Blacksmithing
|only if hasprofunscanned("Blacksmithing")
Record your profession data for the Gold Guide. |complete hasprof("Blacksmithing",1)
step
openskill Cooking
|only if hasprofunscanned("Cooking")
Record your profession data for the Gold Guide. |complete hasprof("Cooking",1)
step
openskill Enchanting
|only if hasprofunscanned("Enchanting")
Record your profession data for the Gold Guide. |complete hasprof("Enchanting",1)
step
openskill Engineering
|only if hasprofunscanned("Engineering")
Record your profession data for the Gold Guide. |complete hasprof("Engineering",1)
step
openskill First Aid
|only if hasprofunscanned("First Aid")
Record your profession data for the Gold Guide. |complete hasprof("First Aid",1)
step
openskill Leatherworking
|only if hasprofunscanned("Leatherworking")
Record your profession data for the Gold Guide. |complete hasprof("Leatherworking",1)
step
openskill Mining
|only if hasprofunscanned("Mining")
Record your profession data for the Gold Guide. |complete hasprof("Mining",1)
step
openskill Tailoring
|only if hasprofunscanned("Tailoring")
Record your profession data for the Gold Guide. |complete hasprof("Tailoring",1)
step
You''re all set!
]])
GoatQuest:RegisterGuide("Leveling Guides\\Undead Starter (1-13)",{
image=GQ.IMAGESDIR.."Tirisfal Glades",
condition_suggested=function() return raceclass('Scourge') and level <= 13 end,
condition_suggested_exclusive=true,
condition_visible=function() return Undead end,
linked = {"Leveling Guides\\Hidden Guides"},
linkedhidden = true,
next="Leveling Guides\\The Barrens (13-26)",
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
talk Rune Broker##233428
|tip Kill enemies nearby.
|tip Sell items for money.
|tip Buy all runes and books.
Click Here to Continue |confirm|tip Buy all runes and books.
Click Here to Continue |confirm |goto Tirisfal Glades/0 31.35,66.41 |q 363
|only if GQ.IsClassicSoD
step
_NOTE:_
Recommended Runes
|tip Head: {o}Endless Rage{} early, {o}Taste for Blood{} later							|only if Warrior
|tip Chest: {o}Blood Frenzy{} early, {o}Flagellation{} later							|only if Warrior
|tip Waist: {o}Focused Rage{} early, {o}Precise Timing{} later							|only if Warrior
|tip Legs: {o}Frenzied Assault{}										|only if Warrior
|tip Feet: {o}Enraged Regeneration{}										|only if Warrior
|tip Wrist: {o}Wrecking Crew{}											|only if Warrior
|tip Hands: {o}Victory Ruse{}											|only if Warrior
|tip Finger: {o}Weapon Specialization{} + {o}Defense Specialization{}						|only if Warrior
|tip Back: {o}Sudden Death{} early, {o}Fresh Meat{} later							|only if Warrior
|tip Head: {o}Focused Attacks{} early, {o}Combat Potency{} later						|only if Rogue
|tip Chest: {o}Slaughter from the Shadows{}									|only if Rogue
|tip Waist: {o}Shadowstep{}											|only if Rogue
|tip Legs: {o}Between the Eyes{}										|only if Rogue
|tip Feet: {o}Master of Subtlety{}										|only if Rogue
|tip Wrist: {o}Unfair Advantage{}										|only if Rogue
|tip Hands: {o}Cutthroat{}											|only if Rogue
|tip Finger: {o}Dagger Specialization{} + {o}Nature Specialization{}						|only if Rogue
|tip Back: {o}Blunderbuss{}											|only if Rogue
|tip Head: {o}Eye of the Void{}											|only if Priest
|tip Chest: {o}Twisted Faith{}											|only if Priest
|tip Waist: {o}Mind Spike{}											|only if Priest
|tip Legs: {o}Homunculi{}											|only if Priest
|tip Feet: {o}Void Plague{}											|only if Priest
|tip Wrist: {o}Despair{}											|only if Priest
|tip Hands: {o}Penance{} early, {o}Shadow Word: Death{} later							|only if Priest
|tip Finger: {o}Holy Specialization{} + {o}Shadow Specialization{}						|only if Priest
|tip Back: {o}Vampiric Touch{}											|only if Priest
|tip Head: {o}Deep Freeze{}											|only if Mage
|tip Chest: {o}Burnout{} early, {o}Fingers of Frost{} later							|only if Mage
|tip Waist: {o}Frostfire Bolt{}											|only if Mage
|tip Legs: {o}Living Flame{}											|only if Mage
|tip Feet: {o}Brain Freeze{}											|only if Mage
|tip Wrist: {o}Balefire Bolt{}											|only if Mage
|tip Hands: {o}Living Bomb{}											|only if Mage
|tip Finger: {o}Frost Specialization{} + {o}Arcane Specialization{}						|only if Mage
|tip Back: {o}Frozen Orb{}											|only if Mage
|tip Head: {o}Pandemic{}											|only if Warlock
|tip Chest: {o}Demonic Tactics{} early, {o}Master Channeler{} later						|only if Warlock
|tip Waist: {o}Shadow and Flame{}										|only if Warlock
|tip Legs: {o}Demonic Pact{}											|only if Warlock
|tip Feet: {o}Shadowflame{}											|only if Warlock
|tip Wrist: {o}Incinerate{}											|only if Warlock
|tip Hands: {o}Haunt{}												|only if Warlock
|tip Finger: {o}Shadow Specialization{} + {o}Fire Specialization{}						|only if Warlock
|tip Back: {o}Soul Siphon{}											|only if Warlock
|tip Head: {o}Catlike Reflexes{} early, {o}Lock and Load{} later						|only if Hunter
|tip Chest: {o}Lone Wolf{} early, {o}Beast Mastery{} later							|only if Hunter
|tip Waist: {o}Expose Weakness{}										|only if Hunter
|tip Legs: {o}Kill Shot{}											|only if Hunter
|tip Feet: {o}Trap Launcher{}											|only if Hunter
|tip Wrist: {o}Focus Fire{}											|only if Hunter
|tip Hands: {o}Chimera Shot{}											|only if Hunter
|tip Finger: {o}Ranged Weapon Specialization{} + {o}Fire Specialization{}					|only if Hunter
|tip Back: {o}Hit and Run{}											|only if Hunter
|tip Head: {o}Burn{} early, {o}Mental Dexterity{} later								|only if Shaman
|tip Chest: {o}Two-Handed Mastery{} early, {o}Dual Wield Specialization{} later					|only if Shaman
|tip Waist: {o}Maelstrom Weapon{}										|only if Shaman
|tip Legs: {o}Ancestral Guidance{} early, {o}Greater Ghost Wolf{} later						|only if Shaman
|tip Feet: {o}Decoy Totem{}											|only if Shaman
|tip Wrist: {o}Overcharged{}											|only if Shaman
|tip Hands: {o}Lava Burst{} early, {o}Lava Lash{} later								|only if Shaman
|tip Finger: {o}Nature Specialization{} + {o}Weapon Specialization{}						|only if Shaman
|tip Back: {o}Feral Spirit{}											|only if Shaman
|tip Head: {o}Gore{}												|only if Druid
|tip Chest: {o}Fury of Stormrage{} early, {o}Wild Strikes{} later						|only if Druid
|tip Waist: {o}Eclipse{} early, {o}Berserk{} later								|only if Druid
|tip Legs: {o}Starsurge{} early, {o}Savage Roar{} later								|only if Druid
|tip Feet: {o}Dreamstate{} early, {o}Survival Instincts{} (level 20), {o}King of the Jungle{} (level 24)	|only if Druid
|tip Wrist: {o}Elune�s Fires{} early, {o}Improved Frenzied Regeneration{} later					|only if Druid
|tip Hands: {o}Sunfire{} early, {o}Mangle{} later								|only if Druid
|tip Finger: {o}Feral Combat Specialization{} + {o}Defense Specialization{}					|only if Druid
|tip Back: {o}Starfall{} early, {o}Improved Swipe{} later							|only if Druid
|tip Head: {o}Wrath{}												|only if Paladin
|tip Chest: {o}Divine Storm{}											|only if Paladin
|tip Waist: {o}Sheath of Light{}										|only if Paladin
|tip Legs: {o}Rebuke{} early, {o}Aura Mastery{} later								|only if Paladin
|tip Feet: {o}Guarded by the Light{}										|only if Paladin
|tip Wrist: {o}Purifying Power{}										|only if Paladin
|tip Hands: {o}Crusader Strike{}										|only if Paladin
|tip Finger: {o}Holy Specialization{} + {o}Weapon Specialization{}						|only if Paladin
|tip Back: {o}Righteous Vengeance{}										|only if Paladin
Click Here to Continue |confirm |q 363
|only if GQ.IsClassicSoD
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
Kill enemies
ding 2 |goto Tirisfal Glades/0 29.40,69.60
|mapmarker Tirisfal Glades/0 28.40,67.40
|mapmarker Tirisfal Glades/0 31.60,71.00
|mapmarker Tirisfal Glades/0 32.00,68.40
step
talk Novice Elreth##1661
|tip Inside the building.
accept The Damned##376 |goto Tirisfal Glades 30.86,66.05
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
stickystart "Collect_Duskbat_Wings"
step
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
talk Novice Elreth##1661
|tip Inside the building.
turnin The Damned##376 |goto Tirisfal Glades 30.86,66.05
accept Marla's Last Wish##6395 |goto Tirisfal Glades 30.86,66.05
step
talk Shadow Priest Sarvis##1569
|tip Inside the building.
turnin The Mindless Ones##364	|goto Tirisfal Glades 30.84,66.20
accept Simple Scroll##3095	|goto Tirisfal Glades 30.84,66.20	|only if Scourge Warrior
accept Tainted Scroll##3099	|goto Tirisfal Glades 30.84,66.20	|only if Scourge Warlock
accept Encrypted Scroll##3096	|goto Tirisfal Glades 30.84,66.20	|only if Scourge Rogue
accept Hallowed Scroll##3097	|goto Tirisfal Glades 30.84,66.20	|only if Scourge Priest
accept Glyphic Scroll##3098	|goto Tirisfal Glades 30.84,66.20	|only if Scourge Mage
step
talk Isabella##2124
|tip Inside the building.
turnin Glyphic Scroll##3098 |goto Tirisfal Glades 30.94,66.06
|only if Scourge Mage
step
talk Isabella##2124
|tip Inside the building.
Train Abilities |trainer Isabella##2124 |goto Tirisfal Glades 30.94,66.06 |q 6395
|only if Mage
step
talk Maximillion##2126
|tip Inside the building.
turnin Tainted Scroll##3099 |goto Tirisfal Glades 30.91,66.34
|only if Scourge Warlock
step
talk Maximillion##2126
|tip Inside the building.
Select _"I submit myself for further training my master."_ |gossip 98050
Train Abilities |trainer Maximillion##2126 |goto Tirisfal Glades/0 30.91,66.34 |q 6395
|only if Warlock
step
talk Dark Cleric Duesten##2123
|tip Inside the building.
turnin Hallowed Scroll##3097 |goto Tirisfal Glades 31.11,66.03
|only if Scourge Priest
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
step
talk Spirit Healer##6491
Select _"Return me to life."_ |gossip 96031
Resurrect at the Spirit Healer |complete not isdead |goto Tirisfal Glades 31.24,64.89 |q 380 |zombiewalk
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
step
talk Spirit Healer##6491
Select _"Return me to life."_ |gossip 96031
Resurrect at the Spirit Healer |complete not isdead |goto Tirisfal Glades 31.22,64.89 |q 6395 |zombiewalk
step
click Marla's Grave
Bury Samuel's Remains |q 6395/1 |goto Tirisfal Glades 31.17,65.08
step
talk Novice Elreth##1661
|tip Inside the building.
turnin Marla's Last Wish##6395 |goto Tirisfal Glades 30.86,66.05
step
talk Isabella##2124
|tip Inside the building.
Train Abilities |trainer Isabella##2124 |goto Tirisfal Glades 30.94,66.06 |q 381
|only if Mage
step
talk Maximillion##2126
|tip Inside the building.
Select _"I submit myself for further training my master."_ |gossip 98050
Train Abilities |trainer Maximillion##2126 |goto Tirisfal Glades/0 30.91,66.34 |q 381
|only if Warlock
step
talk Dark Cleric Duesten##2123
|tip Inside the building.
accept In Favor of Darkness##5651 |goto Tirisfal Glades 31.11,66.03
|only if Scourge Priest
step
talk Dark Cleric Duesten##2123
|tip Inside the building.
Train Abilities |trainer Dark Cleric Duesten##2123 |goto Tirisfal Glades 31.11,66.03 |q 381
|only if Priest
step
talk Dannal Stern##2119
|tip Inside the building.
Train Abilities |trainer Dannal Stern##2119 |goto Tirisfal Glades 32.69,65.56 |q 381
|only if Warrior
step
talk David Trias##2122
|tip Inside the building.
Train Abilities |trainer David Trias##2122 |goto Tirisfal Glades 32.53,65.65 |q 381
|only if Rogue
step
talk Executor Arren##1570
turnin The Scarlet Crusade##381 |goto Tirisfal Glades 32.15,66.01
accept The Red Messenger##382 |goto Tirisfal Glades 32.15,66.01
step
kill Meven Korgal##1667
collect Scarlet Crusade Documents##2885 |q 382/1 |goto Tirisfal Glades/0 36.51,68.80
step
talk Executor Arren##1570
turnin The Red Messenger##382 |goto Tirisfal Glades/0 32.15,66.01
accept Vital Intelligence##383 |goto Tirisfal Glades/0 32.15,66.01
step
Watch the dialogue
talk Calvin Montague##6784
accept A Rogue's Deal##8 |goto Tirisfal Glades 38.23,56.79
step
talk Deathguard Simmer##1519
accept Fields of Grief##365 |goto Tirisfal Glades/0 40.91,54.16
step
Allow Enemies to Kill You
|tip No death penalty at this level.
|tip Fast travel.
Die on Purpose |complete isdead |goto Tirisfal Glades/0 44.86,52.57 |q 383
step
talk Spirit Healer##6491
Select _"Return me to life."_ |gossip 96031
Resurrect at the Spirit Healer |complete not isdead |goto Tirisfal Glades/0 56.40,49.39 |q 383 |zombiewalk
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
home Gallows' End Tavern |goto Tirisfal Glades 61.71,52.05 |q 903 |future
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
talk Gina Lang##5750
|tip Upstairs inside the building.
Train Demon Abilities |vendor Gina Lang##5750 |goto Tirisfal Glades/0 61.55,52.61 |q 367
|only if Warlock
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
Allow Enemies to Kill You
|tip No death penalty at this level.
|tip Fast travel.
Die on Purpose |complete isdead |goto Tirisfal Glades 32.80,50.40 |q 427
|mapmarker Tirisfal Glades/0 29.80,49.40
|mapmarker Tirisfal Glades/0 30.80,46.40
|mapmarker Tirisfal Glades/0 33.60,45.20
|mapmarker Tirisfal Glades/0 36.80,48.00
step
talk Spirit Healer##6491
Select _"Return me to life."_ |gossip 96031
Resurrect at the Spirit Healer |complete not isdead |goto Tirisfal Glades/0 56.40,49.39 |q 427 |zombiewalk
step
talk Deathguard Dillinger##1496
turnin A Putrid Task##404 |goto Tirisfal Glades/0 58.20,51.45
accept The Mills Overrun##426 |goto Tirisfal Glades/0 58.20,51.45
step
talk Apothecary Johaan##1518
|tip Inside the building.
turnin Fields of Grief##365 |goto Tirisfal Glades/0 59.45,52.40
accept Fields of Grief##407 |goto Tirisfal Glades/0 59.45,52.40
step
talk Executor Zygand##1515
turnin At War With The Scarlet Crusade##427 |goto Tirisfal Glades/0 60.59,51.76
accept At War With The Scarlet Crusade##370 |goto Tirisfal Glades/0 60.59,51.76
step
click Wanted!
|tip Wanted poster.
accept Wanted: Maggot Eye##398 |goto Tirisfal Glades 60.73,51.52
step
talk Magistrate Sevren##1499
|tip Inside the building.
accept Graverobbers##358 |goto Tirisfal Glades/0 61.26,50.84
step
talk Deathguard Burgess##1652
accept Proof of Demise##374 |goto Tirisfal Glades/0 60.93,52.01
step
talk Nurse Neela##5759
|tip Inside the building.
Train Apprentice First Aid |skillmax First Aid,75 |goto Tirisfal Glades/0 61.82,52.83
|only if Warrior or Rogue
step
_NOTE:_
Create Bandages in Downtime
|tip While waiting for things like boats.
|tip Increases skill in First Aid.
|tip Need higher skill to make better bandages.
|tip Keep bandages to heal yourself.
Click Here to Continue |confirm |q 407
|only if Warrior or Rogue
step
talk Austil de Mon##2131
|tip Inside the building.
Train Abilities |trainer Austil de Mon##2131 |goto Tirisfal Glades/0 61.86,52.54 |q 407
|only if Warrior
step
talk Captured Scarlet Zealot##1931
|tip Downstairs inside the building.
turnin Fields of Grief##407 |goto Tirisfal Glades/0 61.97,51.29
step
talk Cain Firesong##2128
|tip Upstairs inside the building.
Train Abilities |trainer Cain Firesong##2128 |goto Tirisfal Glades/0 61.97,52.47 |q 358
|only if Mage
step
talk Rupert Boch##2127
|tip Upstairs inside the building.
Train Abilities |trainer Rupert Boch##2127 |goto Tirisfal Glades/0 61.59,52.40 |q 358
|only if Warlock
step
talk Gina Lang##5750
|tip Upstairs inside the building.
Train Demon Abilities |vendor Gina Lang##5750 |goto Tirisfal Glades/0 61.55,52.61 |q 358
|only if Warlock
step
talk Dark Cleric Beryl##2129
|tip Upstairs inside the building.
Train Abilities |trainer Dark Cleric Beryl##2129 |goto Tirisfal Glades/0 61.57,52.20 |q 358
|only if Priest
step
talk Marion Call##2130
|tip Upstairs inside the building.
Train Abilities |trainer Marion Call##2130 |goto Tirisfal Glades/0 61.75,52.00 |q 358
|only if Rogue
stickystart "Collect_Embalming_Ichors"
step
kill 8 Rot Hide Graverobber##1941 |q 358/1 |goto Tirisfal Glades 55.37,42.34
|mapmarker Tirisfal Glades/0 53.20,43.40
|mapmarker Tirisfal Glades/0 55.40,39.20
|mapmarker Tirisfal Glades/0 56.20,44.80
|mapmarker Tirisfal Glades/0 57.80,41.80
stickystart "Kill_Rot_Hide_Mongrels"
step
kill Maggot Eye##1753
|tip Inside the building.
collect Maggot Eye's Paw##3635 |q 398/1 |goto Tirisfal Glades 58.66,30.76
step
label "Kill_Rot_Hide_Mongrels"
kill 5 Rot Hide Mongrel##1675 |q 358/2 |goto Tirisfal Glades 59.40,33.60
|mapmarker Tirisfal Glades/0 56.40,33.40
|mapmarker Tirisfal Glades/0 56.40,40.20
|mapmarker Tirisfal Glades/0 58.20,30.40
|mapmarker Tirisfal Glades/0 58.20,36.60
|mapmarker Tirisfal Glades/0 60.60,38.60
step
label "Collect_Embalming_Ichors"
kill Rot Hide Graverobber##1941, Rot Hide Gnoll##1674, Rot Hide Mongrel##1675
|tip Gnolls.
collect 8 Embalming Ichor##2834 |q 358/3 |goto Tirisfal Glades 59.60,33.40
|mapmarker Tirisfal Glades/0 53.20,43.40
|mapmarker Tirisfal Glades/0 55.40,39.20
|mapmarker Tirisfal Glades/0 56.40,34.40
|mapmarker Tirisfal Glades/0 58.20,30.40
|mapmarker Tirisfal Glades/0 58.40,44.80
|mapmarker Tirisfal Glades/0 58.20,41.20
|mapmarker Tirisfal Glades/0 60.60,38.60
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
step
Allow Enemies to Kill You
|tip No death penalty at this level.
|tip Fast travel.
Die on Purpose |complete isdead |goto Tirisfal Glades 62.40,28.80 |q 368
|mapmarker Tirisfal Glades/0 65.00,27.20
|mapmarker Tirisfal Glades/0 65.20,31.60
|mapmarker Tirisfal Glades/0 67.40,29.20
|mapmarker Tirisfal Glades/0 69.00,25.40
|mapmarker Tirisfal Glades/0 70.60,28.00
|mapmarker Tirisfal Glades/0 72.00,24.20
|mapmarker Tirisfal Glades/0 74.00,28.60
|mapmarker Tirisfal Glades/0 75.80,25.40
step
talk Spirit Healer##6491
Select _"Return me to life."_ |gossip 96031
Resurrect at the Spirit Healer |complete not isdead |goto Tirisfal Glades/0 56.40,49.39 |q 368 |zombiewalk
step
talk Apothecary Johaan##1518
|tip Inside the building.
turnin A New Plague##368 |goto Tirisfal Glades/0 59.45,52.40
step
talk Executor Zygand##1515
turnin Wanted: Maggot Eye##398 |goto Tirisfal Glades/0 60.59,51.76
step
talk Magistrate Sevren##1499
|tip Inside the building.
turnin Graverobbers##358 |goto Tirisfal Glades/0 61.26,50.84
step
talk Austil de Mon##2131
|tip Inside the building.
accept Speak with Dillinger##1818 |goto Tirisfal Glades/0 61.86,52.54
|only if Warrior
step
talk Austil de Mon##2131
|tip Inside the building.
Train Abilities |trainer Austil de Mon##2131 |goto Tirisfal Glades/0 61.86,52.54 |q 405
|only if Warrior
step
talk Coleman Farthing##1500
|tip Inside the building.
accept Deaths in the Family##354 |goto Tirisfal Glades/0 61.72,52.29
accept The Haunted Mills##362 |goto Tirisfal Glades/0 61.72,52.29
step
talk Cain Firesong##2128
|tip Upstairs inside the building.
Train Abilities |trainer Cain Firesong##2128 |goto Tirisfal Glades/0 61.97,52.47 |q 405
|only if Mage
step
talk Ageron Kargal##5724
|tip Upstairs inside the building.
accept Halgar's Summons##1478 |goto Tirisfal Glades/0 61.62,52.68
|only if Warlock
step
talk Rupert Boch##2127
|tip Upstairs inside the building.
Train Abilities |trainer Rupert Boch##2127 |goto Tirisfal Glades/0 61.59,52.40 |q 405
|only if Warlock
step
talk Gina Lang##5750
|tip Upstairs inside the building.
Train Demon Abilities |vendor Gina Lang##5750 |goto Tirisfal Glades/0 61.55,52.61 |q 405
|only if Warlock
step
talk Dark Cleric Beryl##2129
|tip Upstairs inside the building.
Train Abilities |trainer Dark Cleric Beryl##2129 |goto Tirisfal Glades/0 61.57,52.20 |q 405
|only if Priest
step
talk Marion Call##2130
|tip Upstairs inside the building.
Train Abilities |trainer Marion Call##2130 |goto Tirisfal Glades/0 61.75,52.00 |q 405
|only if Rogue
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
talk Aelthalyste##4606
accept Touch of Weakness##5660 |goto Undercity/0 49.26,17.12
|only if Priest
step
talk Aelthalyste##4606
turnin Touch of Weakness##5660 |goto Undercity/0 49.26,17.12
|only if Priest
step
talk Archibald##11870
Train Swords |complete weaponskill("SWORD") > 0 |goto Undercity 57.31,32.77
|only if Rogue
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
talk Gretchen Dedmar##1521
|tip Upstairs inside the building.
accept The Chill of Death##375 |goto Tirisfal Glades/0 61.89,52.73
step
talk Deathguard Burgess##1652
turnin Proof of Demise##374 |goto Tirisfal Glades/0 60.93,52.01
step
talk Executor Zygand##1515
turnin At War With The Scarlet Crusade##370 |goto Tirisfal Glades/0 60.59,51.76
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
step
Allow Enemies to Kill You
|tip No death penalty at this level.
|tip Fast travel.
Die on Purpose |complete isdead |goto Tirisfal Glades 48.00,37.60 |q 426
|mapmarker Tirisfal Glades/0 42.80,32.20
|mapmarker Tirisfal Glades/0 44.40,37.40
|mapmarker Tirisfal Glades/0 45.40,30.60
|mapmarker Tirisfal Glades/0 45.40,40.60
|mapmarker Tirisfal Glades/0 46.60,33.40
|mapmarker Tirisfal Glades/0 47.40,43.00
|mapmarker Tirisfal Glades/0 49.60,34.60
step
talk Spirit Healer##6491
Select _"Return me to life."_ |gossip 96031
Resurrect at the Spirit Healer |complete not isdead |goto Tirisfal Glades/0 56.40,49.39 |q 426 |zombiewalk
step
talk Deathguard Dillinger##1496
turnin The Mills Overrun##426 |goto Tirisfal Glades/0 58.20,51.45
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
step
talk Austil de Mon##2131
|tip Inside the building.
Train Abilities |trainer Austil de Mon##2131 |goto Tirisfal Glades/0 61.86,52.54 |q 840 |future
|only if Warrior
step
talk Gretchen Dedmar##1521
|tip Upstairs inside the building.
turnin The Chill of Death##375 |goto Tirisfal Glades 61.89,52.73
step
talk Cain Firesong##2128
|tip Upstairs inside the building.
Train Abilities |trainer Cain Firesong##2128 |goto Tirisfal Glades/0 61.97,52.47 |q 840 |future
|only if Mage
step
talk Rupert Boch##2127
|tip Upstairs inside the building.
Train Abilities |trainer Rupert Boch##2127 |goto Tirisfal Glades/0 61.59,52.40 |q 840 |future
|only if Warlock
step
talk Gina Lang##5750
|tip Upstairs inside the building.
Train Demon Abilities |vendor Gina Lang##5750 |goto Tirisfal Glades/0 61.55,52.61 |q 840 |future
|only if Warlock
step
talk Dark Cleric Beryl##2129
|tip Upstairs inside the building.
Train Abilities |trainer Dark Cleric Beryl##2129 |goto Tirisfal Glades/0 61.57,52.20 |q 840 |future
|only if Priest
step
talk Marion Call##2130
|tip Upstairs inside the building.
Train Abilities |trainer Marion Call##2130 |goto Tirisfal Glades/0 61.75,52.00 |q 840 |future
|only if Rogue
step
talk Doras##3310
|tip Top of the tower.
fpath Orgrimmar |goto Orgrimmar 45.13,63.90
step
_NOTE:_
Use Weapon Stones
|tip We will train Mining and Blacksmithing.
|tip Allows you to make and use {o}Sharpening Stones{}.
|tip Increases damage.
|tip Mine {o}Copper Ore{} as you see it.
|tip Use the {g}Rough Stones{} to make sharpening stones.
Click Here to Continue |confirm |q 840 |future
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
talk Takrin Pathseeker##3336
accept Conscript of the Horde##840 |goto Durotar/0 50.85,43.59
]])
GoatQuest:RegisterGuide("Leveling Guides\\Tauren Starter (1-13)",{
image=GQ.IMAGESDIR.."Mulgore",
condition_suggested=function() return raceclass('Tauren') and level <= 13 end,
condition_suggested_exclusive=true,
condition_visible=function() return Tauren end,
linked = {"Leveling Guides\\Hidden Guides"},
linkedhidden = true,
next="Leveling Guides\\The Barrens (13-26)",
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
talk Rune Broker##233428
|tip Kill enemies nearby.
|tip Sell items for money.
|tip Buy all runes and books.
Click Here to Continue |confirm |goto Mulgore/0 44.34,76.69 |q 747 |future
|only if GQ.IsClassicSoD
step
_NOTE:_
Recommended Runes
|tip Head: {o}Endless Rage{} early, {o}Taste for Blood{} later							|only if Warrior
|tip Chest: {o}Blood Frenzy{} early, {o}Flagellation{} later							|only if Warrior
|tip Waist: {o}Focused Rage{} early, {o}Precise Timing{} later							|only if Warrior
|tip Legs: {o}Frenzied Assault{}										|only if Warrior
|tip Feet: {o}Enraged Regeneration{}										|only if Warrior
|tip Wrist: {o}Wrecking Crew{}											|only if Warrior
|tip Hands: {o}Victory Ruse{}											|only if Warrior
|tip Finger: {o}Weapon Specialization{} + {o}Defense Specialization{}						|only if Warrior
|tip Back: {o}Sudden Death{} early, {o}Fresh Meat{} later							|only if Warrior
|tip Head: {o}Focused Attacks{} early, {o}Combat Potency{} later						|only if Rogue
|tip Chest: {o}Slaughter from the Shadows{}									|only if Rogue
|tip Waist: {o}Shadowstep{}											|only if Rogue
|tip Legs: {o}Between the Eyes{}										|only if Rogue
|tip Feet: {o}Master of Subtlety{}										|only if Rogue
|tip Wrist: {o}Unfair Advantage{}										|only if Rogue
|tip Hands: {o}Cutthroat{}											|only if Rogue
|tip Finger: {o}Dagger Specialization{} + {o}Nature Specialization{}						|only if Rogue
|tip Back: {o}Blunderbuss{}											|only if Rogue
|tip Head: {o}Eye of the Void{}											|only if Priest
|tip Chest: {o}Twisted Faith{}											|only if Priest
|tip Waist: {o}Mind Spike{}											|only if Priest
|tip Legs: {o}Homunculi{}											|only if Priest
|tip Feet: {o}Void Plague{}											|only if Priest
|tip Wrist: {o}Despair{}											|only if Priest
|tip Hands: {o}Penance{} early, {o}Shadow Word: Death{} later							|only if Priest
|tip Finger: {o}Holy Specialization{} + {o}Shadow Specialization{}						|only if Priest
|tip Back: {o}Vampiric Touch{}											|only if Priest
|tip Head: {o}Deep Freeze{}											|only if Mage
|tip Chest: {o}Burnout{} early, {o}Fingers of Frost{} later							|only if Mage
|tip Waist: {o}Frostfire Bolt{}											|only if Mage
|tip Legs: {o}Living Flame{}											|only if Mage
|tip Feet: {o}Brain Freeze{}											|only if Mage
|tip Wrist: {o}Balefire Bolt{}											|only if Mage
|tip Hands: {o}Living Bomb{}											|only if Mage
|tip Finger: {o}Frost Specialization{} + {o}Arcane Specialization{}						|only if Mage
|tip Back: {o}Frozen Orb{}											|only if Mage
|tip Head: {o}Pandemic{}											|only if Warlock
|tip Chest: {o}Demonic Tactics{} early, {o}Master Channeler{} later						|only if Warlock
|tip Waist: {o}Shadow and Flame{}										|only if Warlock
|tip Legs: {o}Demonic Pact{}											|only if Warlock
|tip Feet: {o}Shadowflame{}											|only if Warlock
|tip Wrist: {o}Incinerate{}											|only if Warlock
|tip Hands: {o}Haunt{}												|only if Warlock
|tip Finger: {o}Shadow Specialization{} + {o}Fire Specialization{}						|only if Warlock
|tip Back: {o}Soul Siphon{}											|only if Warlock
|tip Head: {o}Catlike Reflexes{} early, {o}Lock and Load{} later						|only if Hunter
|tip Chest: {o}Lone Wolf{} early, {o}Beast Mastery{} later							|only if Hunter
|tip Waist: {o}Expose Weakness{}										|only if Hunter
|tip Legs: {o}Kill Shot{}											|only if Hunter
|tip Feet: {o}Trap Launcher{}											|only if Hunter
|tip Wrist: {o}Focus Fire{}											|only if Hunter
|tip Hands: {o}Chimera Shot{}											|only if Hunter
|tip Finger: {o}Ranged Weapon Specialization{} + {o}Fire Specialization{}					|only if Hunter
|tip Back: {o}Hit and Run{}											|only if Hunter
|tip Head: {o}Burn{} early, {o}Mental Dexterity{} later								|only if Shaman
|tip Chest: {o}Two-Handed Mastery{} early, {o}Dual Wield Specialization{} later					|only if Shaman
|tip Waist: {o}Maelstrom Weapon{}										|only if Shaman
|tip Legs: {o}Ancestral Guidance{} early, {o}Greater Ghost Wolf{} later						|only if Shaman
|tip Feet: {o}Decoy Totem{}											|only if Shaman
|tip Wrist: {o}Overcharged{}											|only if Shaman
|tip Hands: {o}Lava Burst{} early, {o}Lava Lash{} later								|only if Shaman
|tip Finger: {o}Nature Specialization{} + {o}Weapon Specialization{}						|only if Shaman
|tip Back: {o}Feral Spirit{}											|only if Shaman
|tip Head: {o}Gore{}												|only if Druid
|tip Chest: {o}Fury of Stormrage{} early, {o}Wild Strikes{} later						|only if Druid
|tip Waist: {o}Eclipse{} early, {o}Berserk{} later								|only if Druid
|tip Legs: {o}Starsurge{} early, {o}Savage Roar{} later								|only if Druid
|tip Feet: {o}Dreamstate{} early, {o}Survival Instincts{} (level 20), {o}King of the Jungle{} (level 24)	|only if Druid
|tip Wrist: {o}Elune�s Fires{} early, {o}Improved Frenzied Regeneration{} later					|only if Druid
|tip Hands: {o}Sunfire{} early, {o}Mangle{} later								|only if Druid
|tip Finger: {o}Feral Combat Specialization{} + {o}Defense Specialization{}					|only if Druid
|tip Back: {o}Starfall{} early, {o}Improved Swipe{} later							|only if Druid
|tip Head: {o}Wrath{}												|only if Paladin
|tip Chest: {o}Divine Storm{}											|only if Paladin
|tip Waist: {o}Sheath of Light{}										|only if Paladin
|tip Legs: {o}Rebuke{} early, {o}Aura Mastery{} later								|only if Paladin
|tip Feet: {o}Guarded by the Light{}										|only if Paladin
|tip Wrist: {o}Purifying Power{}										|only if Paladin
|tip Hands: {o}Crusader Strike{}										|only if Paladin
|tip Finger: {o}Holy Specialization{} + {o}Weapon Specialization{}						|only if Paladin
|tip Back: {o}Righteous Vengeance{}										|only if Paladin
Click Here to Continue |confirm |q 747 |future
|only if GQ.IsClassicSoD
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
talk Meela Dawnstrider##3062
|tip Inside the building.
Train Abilities |trainer Meela Dawnstrider##3062 |goto Mulgore/0 45.02,75.95 |q 753
|only if Shaman
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
talk Harutt Thunderhorn##3059
|tip Inside the building.
Train Abilities |trainer Harutt Thunderhorn##3059 |goto Mulgore/0 44.01,76.13 |q 755
|only if Warrior
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
step
talk Spirit Healer##6491
Select _"Return me to life."_ |gossip 96031
Resurrect at the Spirit Healer |complete not isdead |goto Mulgore/0 42.64,78.10 |q 757 |zombiewalk
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
step
talk Spirit Healer##6491
Select _"Return me to life."_ |gossip 96031
Resurrect at the Spirit Healer |complete not isdead |goto Mulgore/0 46.42,55.58 |q 1656 |zombiewalk
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
accept Rite of Vision##767 |goto Mulgore/0 47.52,60.17
accept Dwarven Digging##746 |goto Mulgore/0 47.52,60.17
step
talk Innkeeper Kauth##6747
|tip Inside the building.
turnin A Task Unfinished##1656 |goto Mulgore/0 46.62,61.09
step
talk Innkeeper Kauth##6747
|tip Inside the building.
home Bloodhoof Village |goto Mulgore/0 46.62,61.09 |q 903 |future
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
talk Yaw Sharpmane##3065
Train Abilities |trainer Yaw Sharpmane##3065 |goto Mulgore/0 47.82,55.68 |q 771
|only if Hunter
step
talk Krang Stonehoof##3063
Train Abilities |trainer Krang Stonehoof##3063 |goto Mulgore/0 49.52,60.59 |q 771
|only if Warrior
step
talk Gennia Runetotem##3064
|tip Inside the building.
Train Abilities |trainer Gennia Runetotem##3064 |goto Mulgore/0 48.48,59.64 |q 771
|only if Druid
step
talk Narm Skychaser##3066
|tip Inside the building.
Train Abilities |trainer Narm Skychaser##3066 |goto Mulgore/0 48.38,59.15 |q 771
|only if Shaman
step
click Well Stone+
|tip Flat grey rocks.
collect 2 Well Stone##4808 |q 771/1 |goto Mulgore 53.50,66.20
step
use Winterhoof Cleansing Totem##5411
Cleanse the Winterhoof Water Well |q 754/1 |goto Mulgore 53.64,66.15
step
talk Mull Thunderhorn##2948
turnin Winterhoof Cleansing##754 |goto Mulgore/0 48.53,60.39
accept Thunderhorn Totem##756 |goto Mulgore/0 48.53,60.39
step
talk Zarlman Two-Moons##3054
turnin Rite of Vision##771 |goto Mulgore/0 47.76,57.54
accept Rite of Vision##772 |goto Mulgore/0 47.76,57.54
|tip Don't follow the wolf.
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
Allow Enemies to Kill You
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
step
talk Spirit Healer##6491
Select _"Return me to life."_ |gossip 96031
Resurrect at the Spirit Healer |complete not isdead |goto Mulgore 46.41,55.57 |q 766 |zombiewalk
step
talk Maur Raincaller##3055
turnin Mazzranache##766 |goto Mulgore 46.98,57.07
step
talk Mull Thunderhorn##2948
turnin Thunderhorn Totem##756 |goto Mulgore 48.53,60.40
accept Thunderhorn Cleansing##758 |goto Mulgore 48.53,60.40
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
accept Veteran Uzzek##1505 |goto Mulgore/0 49.52,60.59
|only if Warrior
step
talk Krang Stonehoof##3063
Train Abilities |trainer Krang Stonehoof##3063 |goto Mulgore/0 49.52,60.59 |q 758
|only if Warrior
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
talk Narm Skychaser##3066
|tip Inside the building.
accept Call of Fire##2984 |goto Mulgore 48.39,59.16
|only if Shaman
step
talk Narm Skychaser##3066
|tip Inside the building.
Train Abilities |trainer Narm Skychaser##3066 |goto Mulgore/0 48.38,59.15 |q 758
|only if Shaman
step
talk Gennia Runetotem##3064
|tip Inside the building.
accept Heeding the Call##5928 |goto Mulgore 48.48,59.64
|only if Druid
step
talk Gennia Runetotem##3064
|tip Inside the building.
Train Abilities |trainer Gennia Runetotem##3064 |goto Mulgore/0 48.48,59.64 |q 758
|only if Druid
step
use Thunderhorn Cleansing Totem##5415
Cleanse the Thunderhorn Water Well |q 758/1 |goto Mulgore 44.59,45.43
step
kill Bael'dun Digger##2989, Bael'dun Appraiser##2990
|tip Dwarves.
collect Prospector's Pick##4702+ |n
use Prospector's Pick##4702+
|tip Next to the forge.
collect 5 Broken Tools##4703 |q 746/1 |goto Mulgore/0 31.28,49.86 |q 746
|mapmarker Mulgore/0 34.40,47.20
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
step
_Destroy This Item:_
|tip Not needed.
trash Water of the Seers##4823
step
Ride an elevator up into Thunder Bluff |goto Thunder Bluff/0 32.10,67.13 < 20 |only if walking
talk Holt Thunderhorn##3039
|tip Inside the building.
turnin Training the Beast##6089 |goto Thunder Bluff 57.31,89.76
|only if Hunter
step
talk Urek Thunderhorn##3040
|tip Inside the building.
Train Abilities |trainer Urek Thunderhorn##3040 |goto Thunder Bluff/0 59.11,86.86 |q 743
|only if Hunter
step
talk Hesuwa Thunderhorn##10086
|tip Inside the building.
Train Pet Abilities |trainer Hesuwa Thunderhorn##10086 |goto Thunder Bluff/0 54.09,83.97 |q 743
|only if Hunter
step
talk Kaga Mistrunner##3025
buy Tough Jerky##117+ |n
|tip Buy {o}20{}, if possible.
|tip Used to feed your pet.
Visit the Vendor |vendor Kaga Mistrunner##3025 |goto Thunder Bluff/0 52.32,47.77 |q 743
|only if Hunter
step
Ride an elevator up into Thunder Bluff |goto Thunder Bluff/0 32.10,67.13 < 20 |only if walking
talk Innkeeper Pala##6746
|tip Inside the building.
home Thunder Bluff |goto Thunder Bluff 45.81,64.71 |q 903 |future
|only if Druid
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
talk Ruul Eagletalon##2985
turnin Dangers of the Windfury##743 |goto Mulgore 47.35,62.02
step
talk Baine Bloodhoof##2993
turnin Dwarven Digging##746 |goto Mulgore 47.51,60.17
step
talk Mull Thunderhorn##2948
turnin Thunderhorn Cleansing##758 |goto Mulgore 48.53,60.40
step
talk Krang Stonehoof##3063
Train Abilities |trainer Krang Stonehoof##3063 |goto Mulgore/0 49.52,60.59 |q 751
|only if Warrior
step
talk Narm Skychaser##3066
|tip Inside the building.
Train Abilities |trainer Narm Skychaser##3066 |goto Mulgore/0 48.38,59.15 |q 751
|only if Shaman
step
talk Gennia Runetotem##3064
|tip Inside the building.
Train Abilities |trainer Gennia Runetotem##3064 |goto Mulgore/0 48.48,59.64 |q 751
|only if Druid
step
map Mulgore
path	follow strictbounce;	loop off;	ants curved;	dist 30;	markers none;		arrow hide
path	51.94,59.61	53.08,60.28	54.83,60.54	56.19,61.05	57.37,61.24
path	59.72,62.45
talk Morin Cloudstalker##2988
|tip Walks along the road.
turnin The Ravaged Caravan##751
accept The Venture Co.##764
accept Supervisor Fizsprocket##765
step
_NOTE:_
Tame Any Beast
|tip Cast {o}Tame Beast{} on any {o}level 9-10{} beast.
|tip You'll replace it with a new permanent pet soon.
Click Here to Continue |confirm |goto Mulgore 60.00,59.00 |q 765
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
stickystart "Kill_Venture_Co_Supervisors_And_Venture_Co_Workers"
step
Follow the path up and enter the mine |goto Mulgore 61.56,46.90 < 15 |walk |only if not (subzone("The Venture Co. Mine") and indoors())
kill Supervisor Fizsprocket##3051
|tip Inside the mine.
collect Fizsprocket's Clipboard##4819 |q 765/1 |goto Mulgore 64.90,43.31
step
label "Kill_Venture_Co_Supervisors_And_Venture_Co_Workers"
kill 6 Venture Co. Supervisor##2979 |q 764/2 |goto Mulgore 61.56,46.90
kill 14 Venture Co. Worker##2978 |q 764/1 |goto Mulgore 61.56,46.90
|tip Inside and outside the mine. |notinsticky
|mapmarker Mulgore/0 59.40,47.40
|mapmarker Mulgore/0 60.20,42.80
|mapmarker Mulgore/0 60.40,49.60
|mapmarker Mulgore/0 62.20,42.00
|mapmarker Mulgore/0 62.40,44.00
|mapmarker Mulgore/0 62.80,40.00
|mapmarker Mulgore/0 64.20,42.40
|mapmarker Mulgore/0 64.80,44.60
step
Leave the mine |goto 61.56,46.90 < 15 |c |q 765
|only if subzone("The Venture Co. Mine") and indoors()
step
map Mulgore
path	follow strictbounce;	loop off;	ants curved;	dist 30;	markers none;		arrow hide
path	51.94,59.61	53.08,60.28	54.83,60.54	56.19,61.05	57.37,61.24
path	59.72,62.45
talk Morin Cloudstalker##2988
|tip Walks along the road.
turnin The Venture Co.##764
turnin Supervisor Fizsprocket##765
step
use Cenarion Lunardust##15710
kill Lunaclaw##12138
|tip Spirit appears.
talk Lunaclaw Spirit##12144
Select _"You have fought well, spirit. I ask you to grant me the strength of your body and the strength of your heart."_
Face Lunaclaw and Earn the Strength of Body and Heart it Possesses |q 6002/1 |goto The Barrens 42.00,60.86
|only if Druid
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
talk Tonga Runetotem##3448
|tip Carefully follow the road.
|tip Higher level enemies.
turnin The Barrens Oases##886 |goto The Barrens/0 52.26,31.93
|only if Druid
step
talk Thork##3429
|tip Carefully follow the road.	|only if not Druid
|tip Higher level enemies.	|only if not Druid
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
Click Here to Continue |confirm |q 775
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
talk Turak Runetotem##3033
|tip Inside the building.
turnin Body and Heart##6002 |goto Thunder Bluff 76.46,27.23
|only if Druid
step
talk Tal##2995
|tip Top of the tower.
turnin Tal the Wind Rider Master##6363 |goto Thunder Bluff 47.00,49.83
accept Return to Jahan##6364 |goto Thunder Bluff 47.00,49.83
step
talk Jahan Hawkwing##3483
turnin Return to Jahan##6364 |goto The Barrens 51.21,29.05
step
talk Uzzek##5810
turnin Veteran Uzzek##1505 |goto The Barrens 61.38,21.11
accept Path of Defense##1498 |goto The Barrens 61.38,21.11
|only if Warrior
step
_NOTE:_
Tame a Venomtail Scorpid
|tip Cast {o}Tame Beast{} on a Venomtail Scorpid.
|tip Abandon your pet first.
|tip New permanent pet.
Click Here to Continue |confirm |goto Durotar/0 35.40,47.40 |q 840 |future
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
talk Takrin Pathseeker##3336
accept Conscript of the Horde##840 |goto Durotar/0 50.85,43.59
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
talk Doras##3310
|tip Top of the tower.
|tip Saves time later.
fpath Orgrimmar |goto Orgrimmar 45.13,63.90
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
kill Thunder Lizard##3130+
collect 5 Singed Scale##6486 |q 1498/1 |goto Durotar 40.00,24.20
|mapmarker Durotar/0 39.00,26.40
|mapmarker Durotar/0 40.40,29.00
|only if Warrior
step
talk Uzzek##5810
turnin Path of Defense##1498 |goto The Barrens 61.38,21.11
accept Thun'grim Firegaze##1502 |goto The Barrens 61.38,21.12
|only if Warrior
]])
GoatQuest:RegisterGuide("Leveling Guides\\Orc & Troll Starter (1-13)",{
image=GQ.IMAGESDIR.."Durotar",
condition_suggested=function() return (raceclass('Orc') or raceclass('Troll')) and level <= 13 end,
condition_suggested_exclusive=true,
condition_visible=function() return (Orc or Troll) end,
linked = {"Leveling Guides\\Hidden Guides"},
linkedhidden = true,
next="Leveling Guides\\The Barrens (13-26)",
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
talk Rune Broker##233428
|tip Kill enemies nearby.
|tip Sell items for money.
|tip Buy all runes and books.
Click Here to Continue |confirm |goto Durotar/0 42.73,68.01 |q 4641 |future
|only if GQ.IsClassicSoD
step
_NOTE:_
Recommended Runes
|tip Head: {o}Endless Rage{} early, {o}Taste for Blood{} later							|only if Warrior
|tip Chest: {o}Blood Frenzy{} early, {o}Flagellation{} later							|only if Warrior
|tip Waist: {o}Focused Rage{} early, {o}Precise Timing{} later							|only if Warrior
|tip Legs: {o}Frenzied Assault{}										|only if Warrior
|tip Feet: {o}Enraged Regeneration{}										|only if Warrior
|tip Wrist: {o}Wrecking Crew{}											|only if Warrior
|tip Hands: {o}Victory Ruse{}											|only if Warrior
|tip Finger: {o}Weapon Specialization{} + {o}Defense Specialization{}						|only if Warrior
|tip Back: {o}Sudden Death{} early, {o}Fresh Meat{} later							|only if Warrior
|tip Head: {o}Focused Attacks{} early, {o}Combat Potency{} later						|only if Rogue
|tip Chest: {o}Slaughter from the Shadows{}									|only if Rogue
|tip Waist: {o}Shadowstep{}											|only if Rogue
|tip Legs: {o}Between the Eyes{}										|only if Rogue
|tip Feet: {o}Master of Subtlety{}										|only if Rogue
|tip Wrist: {o}Unfair Advantage{}										|only if Rogue
|tip Hands: {o}Cutthroat{}											|only if Rogue
|tip Finger: {o}Dagger Specialization{} + {o}Nature Specialization{}						|only if Rogue
|tip Back: {o}Blunderbuss{}											|only if Rogue
|tip Head: {o}Eye of the Void{}											|only if Priest
|tip Chest: {o}Twisted Faith{}											|only if Priest
|tip Waist: {o}Mind Spike{}											|only if Priest
|tip Legs: {o}Homunculi{}											|only if Priest
|tip Feet: {o}Void Plague{}											|only if Priest
|tip Wrist: {o}Despair{}											|only if Priest
|tip Hands: {o}Penance{} early, {o}Shadow Word: Death{} later							|only if Priest
|tip Finger: {o}Holy Specialization{} + {o}Shadow Specialization{}						|only if Priest
|tip Back: {o}Vampiric Touch{}											|only if Priest
|tip Head: {o}Deep Freeze{}											|only if Mage
|tip Chest: {o}Burnout{} early, {o}Fingers of Frost{} later							|only if Mage
|tip Waist: {o}Frostfire Bolt{}											|only if Mage
|tip Legs: {o}Living Flame{}											|only if Mage
|tip Feet: {o}Brain Freeze{}											|only if Mage
|tip Wrist: {o}Balefire Bolt{}											|only if Mage
|tip Hands: {o}Living Bomb{}											|only if Mage
|tip Finger: {o}Frost Specialization{} + {o}Arcane Specialization{}						|only if Mage
|tip Back: {o}Frozen Orb{}											|only if Mage
|tip Head: {o}Pandemic{}											|only if Warlock
|tip Chest: {o}Demonic Tactics{} early, {o}Master Channeler{} later						|only if Warlock
|tip Waist: {o}Shadow and Flame{}										|only if Warlock
|tip Legs: {o}Demonic Pact{}											|only if Warlock
|tip Feet: {o}Shadowflame{}											|only if Warlock
|tip Wrist: {o}Incinerate{}											|only if Warlock
|tip Hands: {o}Haunt{}												|only if Warlock
|tip Finger: {o}Shadow Specialization{} + {o}Fire Specialization{}						|only if Warlock
|tip Back: {o}Soul Siphon{}											|only if Warlock
|tip Head: {o}Catlike Reflexes{} early, {o}Lock and Load{} later						|only if Hunter
|tip Chest: {o}Lone Wolf{} early, {o}Beast Mastery{} later							|only if Hunter
|tip Waist: {o}Expose Weakness{}										|only if Hunter
|tip Legs: {o}Kill Shot{}											|only if Hunter
|tip Feet: {o}Trap Launcher{}											|only if Hunter
|tip Wrist: {o}Focus Fire{}											|only if Hunter
|tip Hands: {o}Chimera Shot{}											|only if Hunter
|tip Finger: {o}Ranged Weapon Specialization{} + {o}Fire Specialization{}					|only if Hunter
|tip Back: {o}Hit and Run{}											|only if Hunter
|tip Head: {o}Burn{} early, {o}Mental Dexterity{} later								|only if Shaman
|tip Chest: {o}Two-Handed Mastery{} early, {o}Dual Wield Specialization{} later					|only if Shaman
|tip Waist: {o}Maelstrom Weapon{}										|only if Shaman
|tip Legs: {o}Ancestral Guidance{} early, {o}Greater Ghost Wolf{} later						|only if Shaman
|tip Feet: {o}Decoy Totem{}											|only if Shaman
|tip Wrist: {o}Overcharged{}											|only if Shaman
|tip Hands: {o}Lava Burst{} early, {o}Lava Lash{} later								|only if Shaman
|tip Finger: {o}Nature Specialization{} + {o}Weapon Specialization{}						|only if Shaman
|tip Back: {o}Feral Spirit{}											|only if Shaman
|tip Head: {o}Gore{}												|only if Druid
|tip Chest: {o}Fury of Stormrage{} early, {o}Wild Strikes{} later						|only if Druid
|tip Waist: {o}Eclipse{} early, {o}Berserk{} later								|only if Druid
|tip Legs: {o}Starsurge{} early, {o}Savage Roar{} later								|only if Druid
|tip Feet: {o}Dreamstate{} early, {o}Survival Instincts{} (level 20), {o}King of the Jungle{} (level 24)	|only if Druid
|tip Wrist: {o}Elune�s Fires{} early, {o}Improved Frenzied Regeneration{} later					|only if Druid
|tip Hands: {o}Sunfire{} early, {o}Mangle{} later								|only if Druid
|tip Finger: {o}Feral Combat Specialization{} + {o}Defense Specialization{}					|only if Druid
|tip Back: {o}Starfall{} early, {o}Improved Swipe{} later							|only if Druid
|tip Head: {o}Wrath{}												|only if Paladin
|tip Chest: {o}Divine Storm{}											|only if Paladin
|tip Waist: {o}Sheath of Light{}										|only if Paladin
|tip Legs: {o}Rebuke{} early, {o}Aura Mastery{} later								|only if Paladin
|tip Feet: {o}Guarded by the Light{}										|only if Paladin
|tip Wrist: {o}Purifying Power{}										|only if Paladin
|tip Hands: {o}Crusader Strike{}										|only if Paladin
|tip Finger: {o}Holy Specialization{} + {o}Weapon Specialization{}						|only if Paladin
|tip Back: {o}Righteous Vengeance{}										|only if Paladin
Click Here to Continue |confirm |q 4641 |future
|only if GQ.IsClassicSoD
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
talk Rwag##3155
|tip Inside the cave.
Train Abilities |trainer Rwag##3155 |goto Durotar 41.28,68.00 |q 5441
|only if Rogue
step
talk Nartok##3156
|tip Inside the cave.
Train Abilities |trainer Nartok##3156 |goto Durotar 40.65,68.51 |q 5441
|only if Warlock
step
talk Hraug##12776
|tip Buy available Grimoires.
|tip Inside the cave.
Train Demon Abilities |vendor Hraug##12776 |goto Durotar 40.56,68.43 |q 5441
|only if Warlock
step
talk Ken'jai##3707
Train Abilities |trainer Ken'jai##3707 |goto Durotar 42.36,68.82 |q 5441
|only if Priest
step
talk Shikrik##3157
Train Abilities |trainer Shikrik##3157 |goto Durotar 42.39,69.00 |q 5441
|only if Shaman
step
talk Mai'ah##5884
Train Abilities |trainer Mai'ah##5884 |goto Durotar 42.51,69.04 |q 5441
|only if Mage
step
talk Zureetha Fargaze##3145
turnin Vile Familiars##792 |goto Durotar 42.85,69.15 |only if not Warlock
accept Burning Blade Medallion##794 |goto Durotar 42.85,69.15
step
talk Frang##3153
Train Abilities |trainer Frang##3153 |goto Durotar 42.89,69.43 |q 5441
|only if Warrior
step
talk Jen'shan##3154
Train Abilities |trainer Jen'shan##3154 |goto Durotar 42.84,69.32 |q 5441
|only if Hunter
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
use Hearthstone##6948
Hearth to Valley of Trials |complete subzone("Valley of Trials") |q 6394
|only if subzone("Burning Blade Coven") and indoors()
step
talk Zureetha Fargaze##3145
turnin Burning Blade Medallion##794 |goto Durotar 42.85,69.15
accept Report to Sen'jin Village##805 |goto Durotar 42.85,69.15
step
talk Canaga Earthcaller##5887
turnin Call of Earth##1516 |goto Durotar 42.41,69.17
accept Call of Earth##1517 |goto Durotar 42.41,69.17
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
talk Ken'jai##3707
accept In Favor of Spirituality##5649 |goto Durotar 42.36,68.81
|only if Priest
step
talk Foreman Thazz'ril##11378
turnin Thazz'ril's Pick##6394 |goto Durotar 44.62,68.64
step
talk Ukor##6786
accept A Peon's Burden##2161 |goto Durotar 52.06,68.31
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
talk Innkeeper Grosk##6928
|tip Inside the building.
home Razor Hill |goto Durotar/0 51.52,41.65 |q 903 |future
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
step
kill 4 Razormane Quilboar##3111 |q 837/1 |goto Durotar 50.00,49.60
kill 4 Razormane Scout##3112 |q 837/2 |goto Durotar 50.00,49.60
|mapmarker Durotar/0 44.20,49.40
|mapmarker Durotar/0 47.40,48.00
|mapmarker Durotar/0 51.00,48.20
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
collect Aged Envelope##4881 |n
use Aged Envelope##4881
accept The Admiral's Orders##830 |goto Durotar 59.26,57.66
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
talk Vel'rin Fang##3194
|tip Inside the building.
accept Practical Prey##817 |goto Durotar 55.96,73.92
step
talk Master Vornal##3304
accept A Solvent Spirit##818 |goto Durotar 55.94,74.39
step
talk Master Gadrin##3188
turnin Report to Sen'jin Village##805 |goto Durotar 55.95,74.72
accept Minshina's Skull##808 |goto Durotar 55.95,74.72
accept Zalazane##826 |goto Durotar 55.95,74.72
accept Report to Orgnil##823 |goto Durotar 55.95,74.72
stickystart "Collect_Taillasher_Eggs"
stickystart "Collect_Durotar_Tiger_Fur"
stickystart "Kill_Hexed_Trolls"
stickystart "Kill_Voodoo_Trolls"
stickystart "Collect_Crawler_Mucus"
stickystart "Collect_Intact_Makrura_Eyes"
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
stickystart "Collect_Crawler_Mucus"
stickystart "Collect_Intact_Makrura_Eyes"
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
stickystop "Collect_Crawler_Mucus"
stickystop "Collect_Intact_Makrura_Eyes"
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
step
talk Spirit Healer##6491
Select _"Return me to life."_ |gossip 96031
Resurrect at the Spirit Healer |complete not isdead |goto Durotar 57.50,73.26 |q 817 |zombiewalk
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
_NOTE:_
Stronger Ammo Available
|tip Buy level 10 ammo when restocking.
Click Here to Continue |confirm |q 823
|only if Hunter
step
talk Orgnil Soulscar##3142
turnin Report to Orgnil##823 |goto Durotar 52.25,43.15
step
talk Gar'Thok##3139
|tip Upstairs inside the building.
turnin Vanquish the Betrayers##784 |goto Durotar 51.95,43.50
turnin The Admiral's Orders##830 |goto Durotar 51.95,43.50
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
talk Kaplak##3170
|tip Upstairs inside the building.
Train Abilities |trainer Kaplak##3170 |goto Durotar/0 51.98,43.69 |q 815
|only if Rogue
step
talk Cook Torka##3191
|tip Walks around.
turnin Break a Few Eggs##815 |goto Durotar 51.11,42.45
step
Follow the path up |goto Durotar 50.09,43.01 < 10 |only if walking
talk Furl Scornbrow##3147
|tip Top of the tower.
turnin Carry Your Weight##791 |goto Durotar 49.89,40.38
step
kill 4 Razormane Dustrunner##3113 |q 837/3 |goto Durotar 42.40,40.60
kill 4 Razormane Battleguard##3114 |q 837/4 |goto Durotar 42.40,40.60
|mapmarker Durotar/0 41.20,37.80
|mapmarker Durotar/0 44.40,36.00
step
talk Takrin Pathseeker##3336
accept Conscript of the Horde##840 |goto Durotar/0 50.85,43.59
step
talk Gar'Thok##3139
|tip Upstairs inside the building.
turnin Encroachment##837 |goto Durotar 51.95,43.50
step
talk Dhugru Gorelust##3172
|tip Outside behind the building.
Train Abilities |trainer Dhugru Gorelust##3172 |goto Durotar/0 54.38,41.19 |q 840 |future
|only if Warlock
step
talk Ophek##3294
|tip Outside behind the building.
accept Gan'rul's Summons##1506 |goto Durotar 54.37,41.29
|only if Warlock
step
talk Kitha##6027
|tip Buy available Grimoires.
|tip Outside behind the building.
Train Demon Abilities |vendor Kitha##6027 |goto Durotar/0 54.71,41.50 |q 840 |future
|only if Warlock
step
talk Tai'jin##3706
|tip Inside the building.
Train Abilities |trainer Tai'jin##3706 |goto Durotar/0 54.26,42.93 |q 840 |future
|only if Priest
step
talk Tai'jin##3706
|tip Inside the building.
accept Hex of Weakness##5654 |goto Durotar/0 54.26,42.93
|only if Priest
step
talk Tarshaw Jaggedscar##3169
|tip Inside the building.
Train Abilities |trainer Tarshaw Jaggedscar##3169 |goto Durotar/0 54.19,42.47 |q 840 |future
|only if Warrior
step
talk Tarshaw Jaggedscar##3169
|tip Inside the building.
accept Veteran Uzzek##1505 |goto Durotar/0 54.19,42.47
|only if Warrior
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
Click Here to Continue |confirm |q 840 |future
|only if Warrior or Rogue
step
talk Swart##3173
|tip Inside the building.
Train Abilities |trainer Swart##3173 |goto Durotar/0 54.42,42.59 |q 840 |future
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
talk Gan'rul Bloodeye##5875
|tip Inside the tent.
|tip Inside the Cleft of Shadow.
turnin Gan'rul's Summons##1506 |goto Orgrimmar/0 48.24,45.29
accept Creature of the Void##1501 |goto Orgrimmar/0 48.24,45.29
|only if Warlock
step
Enter the cave |goto Durotar 55.02,9.79 < 15 |walk |only if not (subzone("Skull Rock") and indoors())
Follow the path |goto Durotar 53.71,8.71 < 10 |walk
click Burning Blade Stash
|tip Inside the cave.
collect Tablet of Verga##6535 |q 1501/1 |goto Durotar 51.62,9.74
|only if Warlock
step
Allow Enemies to Kill You
|tip Fast travel.
|tip Anywhere inside the cave.
Die on Purpose |complete isdead |goto Durotar 55.02,9.79 |q 1501
|only if Warlock
step
talk Spirit Healer##6491
Select _"Return me to life."_ |gossip 115118
Resurrect at the Spirit Healer |complete not isdead |goto Durotar 47.05,17.59 |q 1501 |zombiewalk
|only if Warlock
step
use Eye of Burning Shadow##4903
accept Burning Shadows##832
|only if Warlock and itemcount(4903) > 0
step
talk Gan'rul Bloodeye##5875
|tip Inside the tent.
|tip Inside the Cleft of Shadow.
turnin Creature of the Void##1501 |goto Orgrimmar 48.24,45.29
accept The Binding##1504 |goto Orgrimmar 48.24,45.29
|only if Warlock
step
talk Neeru Fireblade##3216
|tip Inside the tent.
turnin Burning Shadows##832 |goto Orgrimmar 49.47,50.59
|only if Warlock and (haveq(832) or completedq(832))
step
use Glyphs of Summoning##7464
|tip Stand on the pink symbol.
|tip Inside the tent.
kill Summoned Voidwalker##5676 |q 1504/1 |goto Orgrimmar 49.44,50.02
|only if Warlock
step
talk Gan'rul Bloodeye##5875
|tip Inside the tent.
turnin The Binding##1504 |goto Orgrimmar 48.24,45.29
|only if Warlock
step
talk Ormak Grimshot##3352
|tip Top of the building.
turnin Training the Beast##6081 |goto Orgrimmar/0 66.05,18.54
|only if Hunter
step
talk Ormak Grimshot##3352
|tip Top of the building.
Train Abilities |trainer Ormak Grimshot##3352 |goto Orgrimmar/0 66.06,18.54 |q 834
|only if Hunter
step
_NOTE:_
Train Your Pet
|tip Learn pet abilities from Pet Trainers.
|tip Cast {o}Beast Training{} to teach your pet.
Click Here to Continue |confirm |q 834
|only if Dwarf Hunter
step
talk Xao'tsu##10088
|tip Top of the building.
Train Pet Abilities |trainer Xao'tsu##10088 |goto Orgrimmar/0 66.34,14.83 |q 834
|only if Hunter
step
_NOTE:_
Tame a Venomtail Scorpid
|tip Cast {o}Tame Beast{} on a {o}Venomtail Scorpid{}.
|tip Scorpions.
|tip New permanent pet.
Click Here to Continue |confirm |goto Durotar 49.80,17.40 |q 834
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
step
talk Spirit Healer##6491
Select _"Return me to life."_ |gossip 96031
Resurrect at the Spirit Healer |complete not isdead |goto Durotar 47.05,17.59 |q 835 |zombiewalk
step
talk Rezlak##3293
turnin Securing the Lines##835 |goto Durotar 46.37,22.94
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
]])
GoatQuest:RegisterGuide("Leveling Guides\\The Barrens (13-26)",{
image=GQ.IMAGESDIR.."The Barrens",
next="Leveling Guides\\Ashenvale (26-29)",
},[[
step
talk Kargal Battlescar##3337
turnin Conscript of the Horde##840 |goto The Barrens 62.26,19.38
accept Crossroads Conscription##842 |goto The Barrens 62.26,19.38
step
talk Uzzek##5810
turnin Veteran Uzzek##1505 |goto The Barrens 61.38,21.11
accept Path of Defense##1498 |goto The Barrens 61.38,21.11
|only if Warrior
step
kill Thunder Lizard##3130+
collect 5 Singed Scale##6486 |q 1498/1 |goto Durotar 40.00,24.20
|mapmarker Durotar/0 39.00,26.40
|mapmarker Durotar/0 40.40,29.00
|only if Warrior
step
talk Uzzek##5810
turnin Path of Defense##1498 |goto The Barrens 61.38,21.11
|only if Warrior
step
talk Zargh##3489
accept Meats to Orgrimmar##6365 |goto The Barrens 52.62,29.84
|only if Orc or Troll
step
talk Gazrog##3464
accept Raptor Thieves##869 |goto The Barrens 51.93,30.32
step
talk Sergra Darkthorn##3338
turnin Crossroads Conscription##842 |goto The Barrens 52.24,31.01
accept Plainstrider Menace##844 |goto The Barrens 52.24,31.01
step
talk Tonga Runetotem##3448
accept The Forgotten Pools##870 |goto The Barrens 52.26,31.93
step
talk Thork##3429
accept Disrupt the Attacks##871 |goto The Barrens 51.50,30.87
step
talk Devrak##3615
fpath Crossroads |goto The Barrens 51.50,30.34
step
talk Devrak##3615
turnin Meats to Orgrimmar##6365 |goto The Barrens 51.50,30.34
accept Ride to Orgrimmar##6384 |goto The Barrens 51.50,30.34
|only if Orc or Troll
step
talk Innkeeper Gryshka##6929
|tip Inside the building.
turnin Ride to Orgrimmar##6384 |goto Orgrimmar 54.09,68.41
accept Doras the Wind Rider Master##6385 |goto Orgrimmar 54.09,68.41
|only if Orc or Troll
step
talk Hanashi##2704
|tip Inside the building.
Train Staves |complete weaponskill("TH_STAFF") > 0 |goto Orgrimmar/0 81.53,19.63
|only if Warrior
step
talk Doras##3310
|tip Top of the tower.
turnin Doras the Wind Rider Master##6385 |goto Orgrimmar 45.12,63.89
accept Return to the Crossroads.##6386 |goto Orgrimmar 45.12,63.89
|only if Orc or Troll
step
talk Ur'kyo##6018
|tip Inside the building.
turnin Hex of Weakness##5654 |goto Orgrimmar/0 35.59,87.80
|only if Priest
step
talk Apothecary Helbrim##3390
accept Fungal Spores##848 |goto The Barrens 51.44,30.15
accept Wharfmaster Dizzywig##1492 |goto The Barrens 51.44,30.15
step
talk Zargh##3489
turnin Return to the Crossroads.##6386 |goto The Barrens/0 52.62,29.84
|only if Orc or Troll
stickystart "Collect_Raptor_Heads"
stickystart "Kill_Razormane_Enemies"
stickystart "Collect_Plainstrider_Beaks"
step
click Chen's Empty Keg
|tip Skip if not here.
|tip Can try again later.
collect Chen's Empty Keg##4926 |goto The Barrens 55.70,27.29 |q 819 |future
stickystop "Collect_Raptor_Heads"
stickystop "Collect_Plainstrider_Beaks"
step
use Chen's Empty Keg##4926
accept Chen's Empty Keg##819
|only if itemcount(4926) > 0
step
label "Kill_Razormane_Enemies"
kill 3 Razormane Hunter##3265 |q 871/3 |goto The Barrens 55.60,25.40
kill 8 Razormane Water Seeker##3267 |q 871/1 |goto The Barrens 55.60,25.40
kill 8 Razormane Thornweaver##3268 |q 871/2 |goto The Barrens 55.60,25.40
|mapmarker The Barrens/0 53.00,25.20
|mapmarker The Barrens/0 54.40,27.20
stickystart "Collect_Raptor_Heads"
stickystart "Collect_Plainstrider_Beaks"
step
click Chen's Empty Keg
|tip Wait until it appears, if missing.
collect Chen's Empty Keg##4926 |goto The Barrens 55.78,20.01 |q 819 |future
step
use Chen's Empty Keg##4926
accept Chen's Empty Keg##819
step
label "Collect_Plainstrider_Beaks"
kill Greater Plainstrider##3244, Fleeting Plainstrider##3246
collect 7 Plainstrider Beak##5087 |q 844/1 |goto The Barrens 53.00,22.40
|mapmarker The Barrens/0 47.40,26.40
|mapmarker The Barrens/0 48.40,29.60
|mapmarker The Barrens/0 48.80,23.40
|mapmarker The Barrens/0 50.40,33.40
|mapmarker The Barrens/0 51.00,19.60
|mapmarker The Barrens/0 51.00,27.40
|mapmarker The Barrens/0 53.00,30.40
|mapmarker The Barrens/0 55.40,25.20
step
talk Thork##3429
turnin Disrupt the Attacks##871 |goto The Barrens 51.50,30.87
accept The Disruption Ends##872 |goto The Barrens 51.50,30.87
accept Supplies for the Crossroads##5041 |goto The Barrens 51.50,30.87
stickystop "Collect_Raptor_Heads"
step
talk Sergra Darkthorn##3338
turnin Plainstrider Menace##844 |goto The Barrens 52.24,31.01
accept The Zhevra##845 |goto The Barrens 52.24,31.01
stickystart "Collect_Crossroads_Cupply_Crates"
stickystart "Kill_Razormane_Geomancers_And_Defenders"
stickystart "Collect_Zhevra_Hooves"
stickystart "Collect_Raptor_Heads"
step
kill Kreenig Snarlsnout##3438
|tip Run around the {o}north side{} of the mountain.
|tip Walks around.
collect Kreenig Snarlsnout's Tusk##5063 |q 872/3 |goto The Barrens 58.53,27.04 |usebank
stickystop "Collect_Zhevra_Hooves"
stickystop "Collect_Raptor_Heads"
step
label "Collect_Crossroads_Cupply_Crates"
click Crossroads' Supply Crates
|tip Piles of brown boxes.
|tip Multiple locations.
collect Crossroads' Supply Crates##12708 |q 5041/1 |goto The Barrens 58.40,27.00 |usebank
|mapmarker The Barrens/0 58.50,25.80
|mapmarker The Barrens/0 59.10,24.40
step
label "Kill_Razormane_Geomancers_And_Defenders"
kill 8 Razormane Geomancer##3269 |q 872/1 |goto The Barrens 59.00,24.40
kill 8 Razormane Defender##3266 |q 872/2 |goto The Barrens 59.00,24.40
|mapmarker The Barrens/0 56.40,24.40
|mapmarker The Barrens/0 58.20,26.40
stickystart "Collect_Zhevra_Hooves"
stickystart "Collect_Raptor_Heads"
step
talk Gazlowe##3391
|tip Upstairs inside the building.
accept Southsea Freebooters##887 |goto The Barrens 62.68,36.23
stickystop "Collect_Zhevra_Hooves"
stickystop "Collect_Raptor_Heads"
step
talk Bragok##16227
fpath Ratchet |goto The Barrens 63.09,37.16
step
talk Sputtervalve##3442
accept Samophlange##894 |goto The Barrens 62.98,37.22
|delay 0.2
step
_Destroy This Item:_
|tip Not needed.
trash Control Console Operating Manual##5088
step
talk Fuzruckle##3496
|tip Deposit into the bank.
bank Kreenig Snarlsnout's Tusk##5063 |goto The Barrens 62.64,37.42 |q 872
bank Crossroads' Supply Crates##12708 |goto The Barrens 62.64,37.42 |q 5041
step
click WANTED
accept WANTED: Baron Longshore##895 |goto The Barrens 62.59,37.47
step
talk Brewmaster Drohn##3292
turnin Chen's Empty Keg##819 |goto The Barrens 62.26,38.39
accept Chen's Empty Keg##821 |goto The Barrens 62.26,38.39
stickystart "Kill_Southsea_Cannoneers_And_Brigands"
step
kill Baron Longshore##3467
|tip Human wearing a red trenchcoat.
|tip Walks around.
|tip Multiple locations.
collect Baron Longshore's Head##5084 |q 895/1 |goto The Barrens 64.20,47.20
|mapmarker The Barrens/0 62.40,49.40
|mapmarker The Barrens/0 63.40,49.20
step
label "Kill_Southsea_Cannoneers_And_Brigands"
kill 6 Southsea Cannoneer##3382 |q 887/2 |goto The Barrens 63.40,45.80
kill 12 Southsea Brigand##3381 |q 887/1 |goto The Barrens 63.40,45.80
|mapmarker The Barrens/0 62.80,49.80
|mapmarker The Barrens/0 63.40,43.20
step
talk Fuzruckle##3496
|tip Collect from the bank.
collect Kreenig Snarlsnout's Tusk##5063 |goto The Barrens 62.64,37.42 |q 872
collect Crossroads' Supply Crates##12708 |goto The Barrens 62.64,37.42 |q 5041
step
talk Gazlowe##3391
|tip Upstairs inside the building.
turnin Southsea Freebooters##887 |goto The Barrens 62.68,36.23
accept The Missing Shipment##890 |goto The Barrens 62.68,36.23
turnin WANTED: Baron Longshore##895 |goto The Barrens 62.68,36.23
step
talk Wharfmaster Dizzywig##3453
turnin Wharfmaster Dizzywig##1492 |goto The Barrens 63.35,38.45
turnin The Missing Shipment##890 |goto The Barrens 63.35,38.45
accept The Missing Shipment##892 |goto The Barrens 63.35,38.45
accept Miner's Fortune##896 |goto The Barrens 63.35,38.45
step
talk Gazlowe##3391
|tip Upstairs inside the building.
turnin The Missing Shipment##892 |goto The Barrens 62.68,36.23
accept Stolen Booty##888 |goto The Barrens 62.68,36.23
step
talk Thork##3429
turnin The Disruption Ends##872 |goto The Barrens 51.50,30.87
turnin Supplies for the Crossroads##5041 |goto The Barrens 51.50,30.87
stickystart "Collect_Plainstrider_Kidneys"
stickystart "Collect_Raptor_Heads"
step
label "Collect_Zhevra_Hooves"
kill Zhevra Runner##3242+
|tip Zebras.
collect 4 Zhevra Hooves##5086 |q 845/1 |goto The Barrens/0 53.20,34.20
|mapmarker The Barrens/0 49.40,36.80
|mapmarker The Barrens/0 50.80,34.00
|mapmarker The Barrens/0 51.40,37.00
|mapmarker The Barrens/0 53.00,38.40
|mapmarker The Barrens/0 53.60,36.20
|mapmarker The Barrens/0 55.00,38.60
|mapmarker The Barrens/0 55.40,33.40
|mapmarker The Barrens/0 55.60,36.20
|only if not subzone("Thorn Hill")
step
talk Sergra Darkthorn##3338
turnin The Zhevra##845 |goto The Barrens 52.23,31.01
accept Prowlers of the Barrens##903 |goto The Barrens 52.23,31.01
step
talk Darsok Swiftdagger##3449
|tip Top of the tower.
accept Harpy Raiders##867 |goto The Barrens 51.62,30.89
step
talk Regthar Deathgate##3389
|tip Upstairs inside the building.
accept Kolkar Leaders##850 |goto The Barrens 45.34,28.41
stickystart "Collect_Fungal_Spores"
step
Explore the Waters of the Forgotten Pools |q 870/1 |goto The Barrens 45.07,22.53
|tip Swim next to the bubbling rock.
|tip Underwater.
step
label "Collect_Fungal_Spores"
click Laden Mushroom+
|tip Large blue mushrooms.
collect 4 Fungal Spores##5012 |q 848/1 |goto The Barrens 44.70,23.10
|mapmarker The Barrens/0 43.90,24.40
|mapmarker The Barrens/0 45.53,21.80
step
kill Barak Kodobane##3394
|tip Walks around.
collect Barak's Head##5022 |q 850/1 |goto The Barrens 42.72,23.61
step
kill Savannah Prowler##3425+
collect 5 Savannah Lion Tusk##4893 |q 821/1 |goto The Barrens 41.20,28.40 |usebank
collect 7 Prowler Claws##5096 |q 903/1 |goto The Barrens 41.20,28.40
|mapmarker The Barrens/0 40.40,20.60
|mapmarker The Barrens/0 40.80,26.20
|mapmarker The Barrens/0 42.00,23.40
|mapmarker The Barrens/0 43.20,33.20
|mapmarker The Barrens/0 43.40,39.40
|mapmarker The Barrens/0 44.60,31.40
stickystop "Collect_Raptor_Heads"
stickystop "Collect_Plainstrider_Kidneys"
step
kill Witchwing Harpy##3276, Witchwing Roguefeather##3277
|tip Harpies.
collect 8 Witchwing Talon##5064 |q 867/1 |goto The Barrens 40.86,18.45
|mapmarker The Barrens/0 40.20,16.60
|mapmarker The Barrens/0 40.40,14.40
|mapmarker The Barrens/0 40.40,19.40
stickystart "Collect_Raptor_Heads"
stickystart "Collect_Plainstrider_Kidneys"
step
talk Regthar Deathgate##3389
|tip Upstairs inside the building.
turnin Kolkar Leaders##850 |goto The Barrens 45.34,28.41
step
talk Makaba Flathoof##11857
accept Avenge My Village##6548 |goto The Barrens 35.19,27.79
step
kill 6 Grimtotem Mercenary##11911 |q 6548/2 |goto Stonetalon Mountains 80.20,90.60
kill 8 Grimtotem Ruffian##11910 |q 6548/1 |goto Stonetalon Mountains 80.20,90.60
|mapmarker Stonetalon Mountains/0 80.40,88.40
|mapmarker Stonetalon Mountains/0 81.40,86.20
|mapmarker Stonetalon Mountains/0 82.60,88.20
|mapmarker Stonetalon Mountains/0 83.80,85.00
step
talk Makaba Flathoof##11857
|tip Follow the road.
turnin Avenge My Village##6548 |goto The Barrens 35.19,27.79
accept Kill Grundig Darkcloud##6629 |goto The Barrens 35.19,27.79
stickystop "Collect_Plainstrider_Kidneys"
stickystop "Collect_Raptor_Heads"
stickystart "Kill_Grimtotem_Brutes"
step
Follow the path |goto Stonetalon Mountains 71.50,88.59 < 30 |only if walking and not subzone("Grimtotem Post")
kill Grundig Darkcloud##11858 |q 6629/1 |goto Stonetalon Mountains 73.65,86.13
step
label "Kill_Grimtotem_Brutes"
kill 6 Grimtotem Brute##11912 |q 6629/2 |goto Stonetalon Mountains 74.00,85.40
|mapmarker Stonetalon Mountains/0 71.40,86.60
|mapmarker Stonetalon Mountains/0 75.40,83.60
|mapmarker Stonetalon Mountains/0 76.40,86.60
|mapmarker Stonetalon Mountains/0 79.40,86.80
step
talk Kaya Flathoof##11856
|tip Escort quest.
|tip Wait until she respawns, if missing.
|tip Inside the building.
accept Protect Kaya##6523 |goto Stonetalon Mountains 73.48,85.59 |noautoaccept inparty
step
Watch the dialogue
|tip Follow and protect {o}Kaya Flathoof{}.
|tip Group of {o}3 enemies attack{} near end of escort.
|tip Kill the {o}Grimtotem Sorcerer{} first.
Escort Kaya to Camp Aparaje |q 6523/1 |goto Stonetalon Mountains 77.10,90.84
step
talk Makaba Flathoof##11857
turnin Protect Kaya##6523 |goto The Barrens 35.19,27.79
accept Kaya's Alive##6401 |goto The Barrens 35.19,27.79
turnin Kill Grundig Darkcloud##6629 |goto The Barrens 35.19,27.79
step
talk Tammra Windfield##11864
turnin Kaya's Alive##6401 |goto Stonetalon Mountains/0 47.46,58.38
step
talk Tharm##4312
fpath Sun Rock Retreat |goto Stonetalon Mountains/0 45.13,59.84
step
talk Apothecary Helbrim##3390
turnin Fungal Spores##848 |goto The Barrens 51.44,30.15
step
talk Darsok Swiftdagger##3449
|tip Top of the tower.
turnin Harpy Raiders##867 |goto The Barrens 51.62,30.90
step
talk Tonga Runetotem##3448
turnin The Forgotten Pools##870 |goto The Barrens 52.26,31.93
accept The Stagnant Oasis##877 |goto The Barrens 52.26,31.93
step
talk Sergra Darkthorn##3338
turnin Prowlers of the Barrens##903 |goto The Barrens 52.24,31.01
accept Echeyakee##881 |goto The Barrens 52.24,31.01
step
talk Innkeeper Boorand Plainswind##3934
|tip Inside the building.
home The Crossroads |goto The Barrens 51.99,29.89 |q 3261 |future
stickystart "Collect_Plainstrider_Kidneys"
stickystart "Collect_Raptor_Heads"
step
use Horn of Echeyakee##10327
|tip Run around the mountain.
kill Echeyakee##3475
|tip White lion.
|tip Spawns nearby.
collect Echeyakee's Hide##5100 |q 881/1 |goto The Barrens 55.85,17.08
step
label "Collect_Plainstrider_Kidneys"
kill Fleeting Plainstrider##3246, Greater Plainstrider##3244, Ornery Plainstrider##3245
|tip Large walking birds.
collect 5 Plainstrider Kidney##4894 |q 821/2 |goto The Barrens 48.00,13.20 |usebank
|mapmarker The Barrens/0 42.20,15.20
|mapmarker The Barrens/0 43.60,17.00
|mapmarker The Barrens/0 44.00,14.20
|mapmarker The Barrens/0 45.60,15.60
|mapmarker The Barrens/0 46.00,13.20
|mapmarker The Barrens/0 48.00,11.20
step
click Control Console
turnin Samophlange##894 |goto The Barrens 52.41,11.64
accept Samophlange##900 |goto The Barrens 52.41,11.64
step
click the Fuel Control Valve
|tip Two enemies may attack.
Shut Off the Fuel Control Valve |q 900/2 |goto The Barrens 52.40,11.41
step
click the Regulator Valve
|tip Two enemies may attack.
Shut Off the Regulator Valve |q 900/3 |goto The Barrens 52.29,11.40
step
click Main Control Valve
|tip Two enemies may attack.
Shut Off the Main Control Valve |q 900/1 |goto The Barrens 52.33,11.57
step
click Control Console
turnin Samophlange##900 |goto The Barrens 52.41,11.64
accept Samophlange##901 |goto The Barrens 52.41,11.64
step
kill Tinkerer Sniggles##3471
|tip Inside the building.
collect Console Key##5089 |q 901/1 |goto The Barrens 52.84,10.39
step
click Control Console
turnin Samophlange##901 |goto The Barrens 52.41,11.64
accept Samophlange##902 |goto The Barrens 52.41,11.64
step
label "Collect_Raptor_Heads"
kill Sunscale Lashtail##3254, Sunscale Screecher##3255
|tip Purple raptors.
|tip All around the Barrens.
|tip Kill them as you see them.
collect 12 Raptor Head##5062 |q 869/1 |goto The Barrens 53.00,12.60
|mapmarker The Barrens/0 50.40,13.00
|mapmarker The Barrens/0 52.00,14.60
|mapmarker The Barrens/0 52.40,16.60
|mapmarker The Barrens/0 52.80,19.40
|mapmarker The Barrens/0 54.00,10.40
|mapmarker The Barrens/0 54.80,15.40
|mapmarker The Barrens/0 55.40,21.00
|mapmarker The Barrens/0 56.20,11.20
|mapmarker The Barrens/0 56.40,17.40
|mapmarker The Barrens/0 58.00,20.40
|mapmarker The Barrens/0 58.40,15.20
|mapmarker The Barrens/0 59.40,17.40
step
talk Wizzlecrank's Shredder##3439
|tip Escort quest.
|tip Long respawn time.
|tip Skip if missing.
accept Ignition##858 |goto The Barrens 56.51,7.45
step
kill Supervisor Lugwizzle##3445
|tip Walks around.
|tip Both levels of the platform.
|tip Skip if too difficult.
collect Ignition Key##5050 |q 858/1 |goto The Barrens 56.20,8.25
|only if haveq(858) or completedq(858)
step
talk Wizzlecrank's Shredder##3439
|tip Escort quest.
|tip Long respawn time.
|tip Skip if missing.
turnin Ignition##858 |goto The Barrens 56.51,7.45
accept The Escape##863 |goto The Barrens 56.51,7.45 |noautoaccept inparty
|only if haveq(858) or completedq(858)
step
Watch the dialogue
|tip Follow and protect Wizzlecrank's Shredder.
|tip Skip if too difficult.
Escort Wizzlecrank Out of the Venture Co. Drill Site |q 863/1 |goto The Barrens 55.35,7.70
|only if haveq(863) or completedq(863)
step
Follow the path up |goto The Barrens 61.54,6.68 < 40 |only if walking and not subzone("Boulder Lode Mine")
kill Venture Co. Enforcer##3283, Venture Co. Overseer##3286
collect Cats Eye Emerald##5097 |q 896/1 |goto The Barrens 61.20,5.00
|mapmarker The Barrens/0 60.00,3.20
|mapmarker The Barrens/0 61.80,3.80
|mapmarker The Barrens/0 60.92,3.82
step
Cross the bridge and enter Orgrimmar |complete zone ("Orgrimmar") |goto Orgrimmar/0 11.55,66.96 |q 896 |notravel
|only if zone("The Barrens")
step
Enter Orgrimmar |goto Orgrimmar/0 16.08,62.28 < 20 |q 896 |notravel
|only if subzone("Southfury River")
step
talk Enyo##5883
|tip Inside the building.
Train Abilities |trainer Enyo##5883 |goto Orgrimmar/0 38.79,85.65 |q 869
|only if Mage
step
talk Ur'kyo##6018
|tip Inside the building.
Train Abilities |trainer Ur'kyo##6018 |goto Orgrimmar/0 35.59,87.80 |q 869
|only if Priest
step
talk Kardris Dreamseeker##3344
|tip Inside the building.
Train Abilities |trainer Kardris Dreamseeker##3344 |goto Orgrimmar/0 38.80,36.38 |q 869
|only if Shaman
step
talk Ormok##3328
|tip Inside the Cleft of Shadow.
Train Abilities |trainer Ormok##3328 |goto Orgrimmar/0 43.91,54.63 |q 869
|only if Rogue
step
talk Shenthul##3401
|tip Inside the tent.
|tip Inside the Cleft of Shadow.
accept Zando'zan##2379 |goto Orgrimmar/0 43.05,53.72
|only if Rogue
step
talk Zando'zan##3402
|tip Inside the tent.
|tip Inside the Cleft of Shadow.
turnin Zando'zan##2379 |goto 42.73,52.95
accept Wrenix of Ratchet##2382 |goto 42.73,52.95
|only if Rogue
step
talk Mirket##3325
|tip Inside the Cleft of Shadow.
Train Abilities |trainer Mirket##3325 |goto Orgrimmar/0 48.62,46.95 |q 869
|only if Warlock
step
talk Kurgul##5815
|tip Buy available Grimoires.
|tip Inside the Cleft of Shadow.
Train Demon Abilities |vendor Kurgul##5815 |goto Orgrimmar 47.52,46.72 |q 869
|only if Warlock
step
talk Grezz Ragefist##3353
|tip Inside the building.
Train Abilities |trainer Grezz Ragefist##3353 |goto Orgrimmar/0 79.78,31.42 |q 869
|only if Warrior
step
talk Ormak Grimshot##3352
|tip Top of the building.
Train Abilities |trainer Ormak Grimshot##3352 |goto Orgrimmar/0 66.06,18.54 |q 869
|only if Hunter
step
talk Xao'tsu##10088
|tip Top of the building.
Train Pet Abilities |trainer Xao'tsu##10088 |goto Orgrimmar/0 66.33,14.82 |q 869
|only if Hunter
step
talk Hanashi##2704
|tip Inside the building.
Train Bows		|complete weaponskill("BOW") > 0	|goto Orgrimmar/0 81.53,19.63		|only if Tauren Hunter
Train Staves		|complete weaponskill("TH_STAFF") > 0	|goto Orgrimmar/0 81.53,19.63		|only if Priest or Hunter
Train Two-Handed Axes	|complete weaponskill("TH_AXE") > 0	|goto Orgrimmar/0 81.53,19.61		|only if Warrior
|only if Hunter or Priest or Warrior
step
talk Loganaar##12042
Train Abilities |trainer Loganaar##12042 |goto Moonglade/0 52.53,40.57 |q 869
|only if Druid
step
talk Gazrog##3464
turnin Raptor Thieves##869 |goto The Barrens 51.93,30.32
accept Stolen Silver##3281 |goto The Barrens 51.93,30.32
step
talk Sergra Darkthorn##3338
turnin Echeyakee##881 |goto The Barrens 52.23,31.00
accept The Angry Scytheclaws##905 |goto The Barrens 52.23,31.00
step
_Destroy This Item:_
|tip Not needed.
trash Horn of Echeyakee##10327
step
talk Mankrik##3432
accept Lost in Battle##4921 |goto The Barrens 51.95,31.58
step
talk Wrenix the Wretched##7161
turnin Wrenix of Ratchet##2382 |goto The Barrens/0 63.07,36.32
accept Plundering the Plunderers##2381 |goto The Barrens/0 63.07,36.32
|only if Rogue
step
talk Wrenix's Gizmotronic Apparatus##7166
Select _"Press the yellow button labeled 'Thieves' Tools.'"_
collect Thieves' Tools##5060 |goto The Barrens 63.12,36.32 |q 2381
|only if Rogue
step
talk Wrenix's Gizmotronic Apparatus##7166
Select _"Press the red button labeled 'E.C.A.C.'"_
collect E.C.A.C.##7970 |goto The Barrens 63.12,36.32 |q 2381
|only if Rogue
step
talk Sputtervalve##3442
turnin Samophlange##902 |goto The Barrens 62.98,37.22
turnin The Escape##863 |goto The Barrens 62.98,37.22
step
talk Wharfmaster Dizzywig##3453
turnin Miner's Fortune##896 |goto The Barrens 63.35,38.45
|only if haveq(896) or completedq(896)
step
talk Fuzruckle##3496
|tip Deposit into the bank.
bank Savannah Lion Tusk##4893	|goto The Barrens 62.64,37.42 |q 821
bank Plainstrider Kidney##4894	|goto The Barrens 62.64,37.42 |q 821
step
talk Mebok Mizzyrix##3446
accept Raptor Horns##865 |goto The Barrens 62.37,37.62
step
click Buccaneer's Strongbox+
|tip Grey metal chests.
|tip {o}Middle floor{} inside the ship.
skill Lockpicking,85 |goto The Barrens 65.07,45.44
|tip Needed for quest soon.
|only if Rogue
step
_NOTE:_
During the Next Step
|tip A {o}level 50{} bird appears after looting a chest.
|tip Use the {o}E.C.A.C.{} on it.
|tip Weakens it to {o}level 18{}.
Click Here to Continue |confirm |q 2381
|only if Rogue
step
click The Jewel of the Southsea##123462
|tip Small wooden chest.
|tip {o}Middle floor{} inside the ship.
use E.C.A.C.##7970
|tip On Polly.
|tip {o}Level 50{} bird that appears.
|tip Weakens it to {o}level 18{}.
collect Southsea Treasure##7968 |q 2381/1 |goto The Barrens 64.95,45.44
|only if Rogue
step
click Fragile - Do NOT Drop
collect Telescopic Lens##5077 |q 888/2 |goto The Barrens 63.58,49.24
step
click Drizzlik's Emporium
collect Shipment of Boots##5076 |q 888/1 |goto The Barrens 62.63,49.64
stickystart "Collect_Sunscale_Feathers_And_Intact_Raptor_Horns"
step
Run around the mountain and follow the path |goto The Barrens 57.35,52.24 < 30 |only if walking and not subzone("Raptor Grounds")
click Stolen Silver
collect Stolen Silver##5061 |q 3281/1 |goto The Barrens 58.03,53.87
step
label "Collect_Sunscale_Feathers_And_Intact_Raptor_Horns"
kill Sunscale Scytheclaw##3256+
|tip Purple raptors.
collect 3 Sunscale Feather##5165 |goto The Barrens 57.20,53.00 |q 905
|tip Don't vendor them.
collect 5 Intact Raptor Horn##5055 |q 865/1 |goto The Barrens/0 57.36,52.38
|mapmarker The Barrens/0 57.01,54.45
|mapmarker The Barrens/0 57.85,53.90
step
click Bubbling Fissure
|tip Underwater.
Test the Dried Seeds |q 877/1 |goto The Barrens 55.61,42.74
step
click Blue Raptor Nest
Visit the Blue Raptor Nest |q 905/1 |goto The Barrens 52.60,46.11
step
click Red Raptor Nest
Visit the Red Raptor Nest |q 905/3 |goto The Barrens 52.46,46.57
step
click Yellow Raptor Nest
Visit the Yellow Raptor Nest |q 905/2 |goto The Barrens 52.02,46.47
step
_Destroy These Items:_
|tip Not needed.
trash Sunscale Feather##5165
step
clicknpc Beaten Corpse##10668
Select _"I inspect the body further."_ |gossip 96232
Find Mankrik's Wife |q 4921/1 |goto The Barrens/0 49.33,50.32
stickystart "Collect_Thunder_Lizard_Horn"
step
kill Lakota'mani##3474
|tip Grey kodo.
|tip Walks around.
|tip Multiple locations.
collect Hoof of Lakota'mani##5099 |goto The Barrens 49.40,53.00 |q 883 |future
|mapmarker The Barrens/0 45.20,52.40
|mapmarker The Barrens/0 46.00,49.40
|mapmarker The Barrens/0 47.20,51.60
step
use Hoof of Lakota'mani##5099
accept Lakota'mani##883
step
label "Collect_Thunder_Lizard_Horn"
kill Stormsnout##3240+
|tip Pink dinosaurs.
collect Thunder Lizard Horn##4895 |q 821/3 |goto The Barrens 46.20,51.40
|mapmarker The Barrens/0 42.20,48.80
|mapmarker The Barrens/0 42.20,57.80
|mapmarker The Barrens/0 43.40,53.40
|mapmarker The Barrens/0 45.20,45.00
|mapmarker The Barrens/0 45.20,48.40
|mapmarker The Barrens/0 45.20,56.00
|mapmarker The Barrens/0 48.40,57.20
|mapmarker The Barrens/0 49.40,53.40
step
talk Jorn Skyseer##3387
turnin Lakota'mani##883 |goto The Barrens 44.86,59.14
step
talk Omusa Thunderhorn##10378
fpath Camp Taurajo |goto The Barrens 44.45,59.15
step
talk Turak Runetotem##3033
|tip Inside the building.
accept A Lesson to Learn##27 |goto Thunder Bluff 76.48,27.22
|only if Druid
step
talk Mankrik##3432
turnin Lost in Battle##4921 |goto The Barrens/0 51.95,31.58
accept Consumed by Hatred##899 |goto The Barrens 51.95,31.58
step
talk Tonga Runetotem##3448
turnin The Stagnant Oasis##877 |goto The Barrens/0 52.26,31.93
accept Altered Beings##880 |goto The Barrens/0 52.26,31.93
step
_Destroy This Item:_
|tip Not needed.
trash Dried Seeds##5068
step
talk Sergra Darkthorn##3338
turnin The Angry Scytheclaws##905 |goto The Barrens/0 52.23,31.01
accept Jorn Skyseer##3261 |goto The Barrens/0 52.23,31.01
step
talk Gazrog##3464
turnin Stolen Silver##3281 |goto The Barrens/0 51.93,30.32
step
talk Loganaar##12042
Train Abilities |trainer Loganaar##12042 |goto Moonglade/0 52.53,40.57 |q 3261
|only if Druid
step
talk Dendrite Starblaze##11802
|tip Upstairs inside the building.
turnin A Lesson to Learn##27 |goto Moonglade 56.21,30.64
accept Trial of the Lake##28 |goto Moonglade 56.21,30.64
|only if Druid
step
click Bauble Container
|tip Wicker vase.
|tip Underwater.
|tip Random locoations.
collect Shrine Bauble##15877 |q 28/1 |goto Moonglade 54.33,55.65
|only if Druid
step
use Shrine Bauble##15877
Complete the Trial of the Lake |q 28/2 |goto Moonglade 35.92,41.38
|only if Druid
step
talk Tajarri##11799
turnin Trial of the Lake##28 |goto Moonglade 36.52,40.10
accept Trial of the Sea Lion##30 |goto Moonglade 36.52,40.10
|only if Druid
step
talk Enyo##5883
|tip Inside the building.
Train Abilities |trainer Enyo##5883 |goto Orgrimmar/0 38.79,85.65 |q 3261
|only if Mage
step
talk Thuul##5958
|tip Top of the building.
learnspell Teleport: Orgrimmar##3567 |goto Orgrimmar 38.68,85.41
|only if Mage
step
talk Ur'kyo##6018
|tip Inside the building.
Train Abilities |trainer Ur'kyo##6018 |goto Orgrimmar/0 35.59,87.80 |q 3261
|only if Priest
step
talk Searn Firewarder##5892
|tip Inside the building.
accept Call of Water##1528 |goto Orgrimmar 37.96,37.73
|only if Shaman
step
talk Kardris Dreamseeker##3344
|tip Inside the building.
Train Abilities |trainer Kardris Dreamseeker##3344 |goto Orgrimmar/0 38.80,36.38 |q 3261
|only if Shaman
step
talk Islen Waterseer##5901
turnin Call of Water##1528 |goto The Barrens 65.83,43.78
accept Call of Water##1530 |goto The Barrens 65.83,43.78
|only if Shaman
step
talk Ormok##3328
|tip Inside the Cleft of Shadow.
Train Abilities |trainer Ormok##3328 |goto Orgrimmar/0 43.91,54.63 |q 3261
|only if Rogue
step
talk Mirket##3325
|tip Inside the Cleft of Shadow.
Train Abilities |trainer Mirket##3325 |goto Orgrimmar/0 48.62,46.95 |q 3261
|only if Warlock
step
talk Gan'rul Bloodeye##5875
|tip Inside the tent.
|tip Inside the Cleft of Shadow.
accept Devourer of Souls##1507 |goto Orgrimmar 48.25,45.29
|only if Warlock
step
talk Kurgul##5815
|tip Buy available Grimoires.
|tip Inside the Cleft of Shadow.
Train Demon Abilities |vendor Kurgul##5815 |goto Orgrimmar 47.52,46.72 |q 3261
|only if Warlock
step
talk Cazul##5909
|tip Inside the Cleft of Shadow.
turnin Devourer of Souls##1507 |goto Orgrimmar 47.06,46.48
accept Blind Cazul##1508 |goto Orgrimmar 47.06,46.48
|only if Warlock
step
talk Zankaja##5910
|tip Inside the building.
turnin Blind Cazul##1508 |goto Orgrimmar 37.03,59.45
accept News of Dogran##1509 |goto Orgrimmar 37.03,59.45
|only if Warlock
step
talk Gazrog##3464
turnin News of Dogran##1509 |goto The Barrens 51.93,30.32
accept News of Dogran##1510 |goto The Barrens 51.93,30.32
|only if Warlock
step
Follow the path up and through the mountains |goto Stonetalon Mountains 82.07,98.57 < 30 |only if walking and subzone("The Barrens")
talk Ken'zigla##4197
turnin News of Dogran##1510 |goto Stonetalon Mountains 73.25,95.13
accept Ken'zigla's Draught##1511 |goto Stonetalon Mountains 73.25,95.13
|only if Warlock
step
talk Grezz Ragefist##3353
|tip Inside the building.
Train Abilities |trainer Grezz Ragefist##3353 |goto Orgrimmar/0 79.78,31.42 |q 3261
|only if Warrior
step
talk Ormak Grimshot##3352
|tip Top of the building.
Train Abilities |trainer Ormak Grimshot##3352 |goto Orgrimmar/0 66.06,18.54 |q 3261
|only if Hunter
step
talk Xao'tsu##10088
|tip Top of the building.
Train Pet Abilities |trainer Xao'tsu##10088 |goto Orgrimmar/0 66.33,14.82 |q 3261
|only if Hunter
step
talk Wrenix the Wretched##7161
turnin Plundering the Plunderers##2381 |goto The Barrens 63.07,36.32
|only if Rogue
step
talk Gazlowe##3391
|tip Upstairs inside the building.
turnin Stolen Booty##888 |goto The Barrens 62.68,36.23
step
talk Fuzruckle##3496
|tip Collect from the bank.
collect 5 Plainstrider Kidney##4894 |goto The Barrens 62.64,37.42 |q 821
collect 5 Savannah Lion Tusk##4893 |goto The Barrens 62.64,37.42 |q 821
step
talk Mebok Mizzyrix##3446
turnin Raptor Horns##865 |goto The Barrens 62.37,37.62
step
talk Brewmaster Drohn##3292
turnin Chen's Empty Keg##821 |goto The Barrens 62.26,38.39
step
talk Jorn Skyseer##3387
turnin Jorn Skyseer##3261 |goto The Barrens 44.86,59.14
accept Ishamuhale##882 |goto The Barrens 44.86,59.14
step
talk Grunt Logmar##5911
turnin Ken'zigla's Draught##1511 |goto The Barrens 44.62,59.27
accept Dogran's Captivity##1515 |goto The Barrens 44.62,59.27
|only if Warlock
step
talk Mangletooth##3430
accept Tribes at War##878 |goto The Barrens/0 44.55,59.24
step
talk Innkeeper Byula##7714
|tip Inside the building.
home Camp Taurajo |goto The Barrens 45.58,59.04 |q 1195 |future
stickystart "Collect_Bristleback_Quilboar_Tusks"
stickystart "Kill_Bristleback_Enemies"
step
talk Grunt Dogran##5908
|tip Inside the hut.
turnin Dogran's Captivity##1515 |goto The Barrens 43.31,47.89
accept Love's Gift##1512 |goto The Barrens 43.31,47.89
|only if Warlock
step
label "Collect_Bristleback_Quilboar_Tusks"
kill Bristleback Water Seeker##3260, Bristleback Hunter##3258, Bristleback Thornweaver##3261, Bristleback Geomancer##3263
collect Blood Shard##5075 |goto The Barrens 50.40,54.60 |q 5052 |future
|tip Don't vendor them.
collect 60 Bristleback Quilboar Tusk##5085 |q 899/1 |goto The Barrens 50.40,54.60
|mapmarker The Barrens/0 50.60,57.60
|mapmarker The Barrens/0 53.00,54.60
|mapmarker The Barrens/0 53.20,52.60
|mapmarker The Barrens/0 46.40,54.20
|mapmarker The Barrens/0 43.40,54.80
|mapmarker The Barrens/0 47.80,52.40
step
label "Kill_Bristleback_Enemies"
kill 6 Bristleback Water Seeker##3260 |q 878/1 |goto The Barrens 50.40,54.60
kill 12 Bristleback Thornweaver##3261 |q 878/2 |goto The Barrens 50.40,54.60
kill 12 Bristleback Geomancer##3263 |q 878/3 |goto The Barrens 50.40,54.60
|mapmarker The Barrens/0 50.60,57.60
|mapmarker The Barrens/0 53.00,54.60
|mapmarker The Barrens/0 53.20,52.60
|mapmarker The Barrens/0 46.40,54.20
|mapmarker The Barrens/0 43.40,54.80
|mapmarker The Barrens/0 47.80,52.40
step
kill Oasis Snapjaw##3461+
|tip Turtles.
|tip Underwater and around the water edge.
collect 8 Altered Snapjaw Shell##5098 |q 880/1 |goto The Barrens 55.53,42.70
step
kill Zhevra Charger##3426+
collect Fresh Zhevra Carcass##10338 |goto The Barrens 60.60,35.60 |q 882
|mapmarker The Barrens/0 61.00,31.80
|mapmarker The Barrens/0 62.60,33.40
step
use Fresh Zhevra Carcass##10338
kill Ishamuhale##3257
|tip Raptor.
|tip Appears nearby.
collect Ishamuhale's Fang##5101 |q 882/1 |goto The Barrens 59.89,30.29
step
talk Tonga Runetotem##3448
turnin Altered Beings##880 |goto The Barrens 52.26,31.93
accept Hamuul Runetotem##1489 |goto The Barrens 52.26,31.93
step
talk Mankrik##3432
turnin Consumed by Hatred##899 |goto The Barrens 51.95,31.58
step
_Destroy These Items:_
|tip Not needed.
trash Bristleback Quilboar Tusk##5085
step
talk Mangletooth##3430
turnin Tribes at War##878 |goto The Barrens 44.55,59.24
accept Blood Shards of Agamaggan##5052 |goto The Barrens 44.55,59.24
step
talk Mangletooth##3430
turnin Blood Shards of Agamaggan##5052 |goto The Barrens 44.55,59.24
step
_NOTE:_
talk Mangletooth##3430
|tip Exchange Blood Shards for buffs.
|tip When questing in the Barrens, spend extra Blood Shards here.
|tip
|tip {o}SPIRIT OF THE WIND{}
|tip +30% Movement Speed (5 Minutes)
|tip Note: Does {o}NOT{} stack with other run speed abilities.
|tip
|tip {o}AGAMAGGAN'S STRENGTH{}
|tip +10 Strength (30 Minutes)
|tip
|tip {o}AGAMAGGAN'S AGILITY{}
|tip +10 Agility (30 Minutes)
|tip
|tip {o}WISDOM OF AGAMAGGAN{}
|tip +10 Intellect (30 Minutes)
|tip
|tip {o}RISING SPIRIT{}
|tip +25 Spirit (30 Minutes)
|tip
|tip {o}RAZORHIDE{}
|tip +95 Armor and Returns Damage to Enemies (10 Minutes)
|tip
Click Here to Continue |confirm |goto The Barrens 44.55,59.24 |q 882
step
talk Jorn Skyseer##3387
turnin Ishamuhale##882 |goto The Barrens 44.86,59.14
accept Enraged Thunder Lizards##907 |goto The Barrens 44.86,59.14
stickystart "Collect_Thunder_Lizard_Blood"
step
kill Owatanka##3473
|tip Blue dinosuar.
|tip Multiple locations.
collect Owatanka's Tailspike##5102 |n
use Owatanka's Tailspike##5102
accept Owatanka##884 |goto The Barrens 44.40,61.40
|mapmarker The Barrens/0 45.40,62.80
|mapmarker The Barrens/0 49.20,61.40
|mapmarker The Barrens/0 49.40,59.20
step
label "Collect_Thunder_Lizard_Blood"
kill Stormsnout##3240, Thunderhead##3239
|tip Pink dinosaurs.
collect 3 Thunder Lizard Blood##5143 |q 907/1 |goto The Barrens/0 44.00,62.60
|mapmarker The Barrens/0 42.20,48.80
|mapmarker The Barrens/0 42.40,60.00
|mapmarker The Barrens/0 43.40,53.40
|mapmarker The Barrens/0 45.20,45.00
|mapmarker The Barrens/0 45.20,48.40
|mapmarker The Barrens/0 45.20,56.00
|mapmarker The Barrens/0 45.20,67.60
|mapmarker The Barrens/0 46.20,51.40
|mapmarker The Barrens/0 47.00,62.00
|mapmarker The Barrens/0 47.00,65.00
|mapmarker The Barrens/0 48.40,57.20
|mapmarker The Barrens/0 49.40,53.40
|mapmarker The Barrens/0 50.40,60.20
step
talk Jorn Skyseer##3387
turnin Owatanka##884 |goto The Barrens 44.86,59.14
turnin Enraged Thunder Lizards##907 |goto The Barrens 44.86,59.14
accept Cry of the Thunderhawk##913 |goto The Barrens 44.86,59.14
stickystart "Collect_Thunderhawk_Wings"
step
talk Brine##5899
|tip Top of the hill.
turnin Call of Water##1530 |goto The Barrens 43.42,77.41
accept Call of Water##1535 |goto The Barrens 43.42,77.41
|only if Shaman
step
use Empty Brown Waterskin##7766
collect Filled Brown Waterskin##7769 |q 1535/1 |goto The Barrens 44.35,76.97
|only if Shaman
step
talk Brine##5899
|tip Top of the hill.
turnin Call of Water##1535 |goto The Barrens 43.42,77.41
accept Call of Water##1536 |goto The Barrens 43.42,77.41
|only if Shaman
step
label "Collect_Thunderhawk_Wings"
kill Thunderhawk Hatchling##3247, Thunderhawk Cloudscraper##3424
|tip Flying snakes.
collect Thunderhawk Wings##5164 |q 913/1 |goto The Barrens 45.60,56.20
|mapmarker The Barrens/0 43.40,55.20
|mapmarker The Barrens/0 44.20,53.20
|mapmarker The Barrens/0 44.40,47.40
|mapmarker The Barrens/0 46.60,49.60
|mapmarker The Barrens/0 48.20,56.40
|mapmarker The Barrens/0 49.80,53.40
|mapmarker The Barrens/0 44.40,61.40
|mapmarker The Barrens/0 45.20,67.20
|mapmarker The Barrens/0 48.00,59.40
|mapmarker The Barrens/0 48.40,61.80
step
talk Jorn Skyseer##3387
turnin Cry of the Thunderhawk##913 |goto The Barrens 44.86,59.14
accept Mahren Skyseer##874 |goto The Barrens 44.86,59.14
step
talk Apothecary Helbrim##3390
accept Apothecary Zamah##853 |goto The Barrens/0 51.44,30.15
step
talk Korran##3428
accept Egg Hunt##868 |goto The Barrens 51.07,29.63
step
talk Mangletooth##3430
|tip Complete the {o}Spirit of the Wind{} quest.
Get the {y}Spirit of the Wind{} Buff |havebuff Spirit of the Wind##16618 |goto The Barrens 44.55,59.24 |q 853
|tip Long run to Thunder Bluff now.
|tip Increases run speed.
|only if itemcount(5075) >= 10 and not Tauren
step
Ride an elevator up to enter Thunder Bluff |goto Thunder Bluff 31.78,66.01 < 15 |only if walking and not Tauren
talk Ansekhwa##11869
Train Two-Handed Maces	|complete weaponskill("TH_MACE") > 0		|goto Thunder Bluff 40.93,62.73		|only if Warrior
Train One-Handed Maces	|complete weaponskill("MACE") > 0		|goto Thunder Bluff 40.93,62.73		|only if Rogue
Train Staves		|complete weaponskill("TH_STAFF") > 0		|goto Thunder Bluff 40.93,62.73		|only if Warlock or Priest or Warrior
Train Guns		|complete weaponskill("GUN") > 0		|goto Thunder Bluff 40.93,62.73		|only if Hunter
step
Enter the cave |goto Thunder Bluff 29.84,29.88 < 15 |walk |only if not subzone("The Pools of Vision")
talk Apothecary Zamah##3419
|tip Inside the cave.
turnin Apothecary Zamah##853 |goto Thunder Bluff 22.81,20.90
step
talk Malakai Cross##3045
|tip Inside the cave.
Train Abilities |trainer Malakai Cross##3045 |goto Thunder Bluff/0 24.55,22.58 |q 1489
|only if Priest
step
talk Miles Welsh##3044
|tip Inside the cave.
accept Shadowguard##5642	|goto Thunder Bluff/0 25.32,15.29 |only if Troll
accept Devouring Plague##5644	|goto Thunder Bluff/0 25.32,15.29 |only if Scourge
|only if Priest
step
talk Archmage Shymm##3047
|tip Inside the cave.
Train Abilities |trainer Archmage Shymm##3047 |goto Thunder Bluff/0 22.76,14.52 |q 1489
|only if Mage
step
Leave the cave |goto Thunder Bluff/0 29.81,29.82 < 15 |walk |only if subzone("The Pools of Vision")
talk Siln Skychaser##3030
|tip Inside the building.
Train Abilities |trainer Siln Skychaser##3030 |goto Thunder Bluff/0 22.83,21.10 |q 1489
|only if Shaman
step
Leave the cave |goto Thunder Bluff/0 29.81,29.82 < 15 |walk |only if subzone("The Pools of Vision")
talk Hesuwa Thunderhorn##10086
|tip Inside the building.
Train Pet Abilities |trainer Hesuwa Thunderhorn##10086 |goto Thunder Bluff/0 54.09,83.97 |q 1489
|only if Hunter
step
talk Urek Thunderhorn##3040
|tip Inside the building.
Train Abilities |trainer Urek Thunderhorn##3040 |goto Thunder Bluff/0 59.11,86.86 |q 1489
|only if Hunter
step
Leave the cave |goto Thunder Bluff/0 29.81,29.82 < 15 |walk |only if subzone("The Pools of Vision")
talk Ker Ragetotem##3043
|tip Inside the building.
Train Abilities |trainer Ker Ragetotem##3043 |goto Thunder Bluff/0 57.58,85.52 |q 1489
|only if Warrior
step
Leave the cave |goto Thunder Bluff/0 29.81,29.82 < 15 |walk |only if subzone("The Pools of Vision")
talk Zangen Stonehoof##4721
accept The Sacred Flame##1195 |goto Thunder Bluff/0 54.97,51.41
step
talk Kym Wildmane##3036
|tip Inside the building.
Train Abilities |trainer Kym Wildmane##3036 |goto Thunder Bluff/0 77.13,29.80 |q 1489
|only if Druid
step
talk Arch Druid Hamuul Runetotem##5769
|tip Inside the building.
turnin Hamuul Runetotem##1489 |goto Thunder Bluff 78.62,28.56
accept Nara Wildmane##1490 |goto Thunder Bluff 78.62,28.56
step
talk Nara Wildmane##5770
|tip Inside the building.
turnin Nara Wildmane##1490 |goto Thunder Bluff 75.65,31.61
step
talk Tal##2995
|tip Top of the tower.
fpath Thunder Bluff |goto Thunder Bluff 46.98,49.84
step
talk Mangletooth##3430
accept Betrayal from Within##879 |goto The Barrens 44.55,59.24
step
_NOTE:_
talk Mangletooth##3430
|tip Exchange Blood Shards for buffs.
|tip When questing in the Barrens, spend extra Blood Shards here.
|tip
|tip {o}SPIRIT OF THE WIND{}
|tip +30% Movement Speed (5 Minutes)
|tip Note: Does {o}NOT{} stack with other run speed abilities.
|tip
|tip {o}AGAMAGGAN'S STRENGTH{}
|tip +10 Strength (30 Minutes)
|tip
|tip {o}AGAMAGGAN'S AGILITY{}
|tip +10 Agility (30 Minutes)
|tip
|tip {o}WISDOM OF AGAMAGGAN{}
|tip +10 Intellect (30 Minutes)
|tip
|tip {o}RISING SPIRIT{}
|tip +25 Spirit (30 Minutes)
|tip
|tip {o}RAZORHIDE{}
|tip +95 Armor and Returns Damage to Enemies (10 Minutes)
|tip
Click Here to Continue |confirm |goto The Barrens 44.55,59.24 |q 879
|only if itemcount(5075) >= 4
step
talk Tatternack Steelforge##3433
accept Weapons of Choice##893 |goto The Barrens 45.10,57.68
step
click Silithid Mound##3685+
|tip Large rocks leaking green liquid.
|tip May be attacked.
collect 12 Silithid Egg##5058 |q 868/1 |goto The Barrens/0 47.38,70.12
|mapmarker The Barrens/0 47.92,70.86
|mapmarker The Barrens/0 48.51,69.98
|mapmarker The Barrens/0 45.07,69.69
|mapmarker The Barrens/0 43.49,70.26
|mapmarker The Barrens/0 42.73,69.80
|mapmarker The Barrens/0 42.95,71.36
|mapmarker The Barrens/0 44.18,71.50
|mapmarker The Barrens/0 44.17,72.37
|mapmarker The Barrens/0 45.20,72.33
step
use Harvester's Head##5138
accept The Harvester##897
|only if itemcount(5138) > 0
step
talk Gann Stonespire##3341
|tip Walks along the road.
accept Gann's Reclamation##843 |goto The Barrens/0 46.13,75.54
|mapmarker The Barrens/0 45.80,78.80
|mapmarker The Barrens/0 46.12,81.24
stickystart "Collect_Razormane_Backstabber"
stickystart "Collect_Razormane_Wand"
stickystart "Collect_Razormane_War_Shield"
stickystart "Collect_Washte_Pawnes_Feather"
step
kill Kuz##3436
|tip Quilboar in a red robe.
|tip Walks around.
|tip Spawns here.
collect Kuz's Skull##5074 |q 879/1 |goto The Barrens 43.96,79.57
|mapmarker The Barrens/0 42.80,79.60
|mapmarker The Barrens/0 44.00,81.60
|mapmarker The Barrens/0 45.60,80.20
step
kill Nak##3434
|tip Walks around.
|tip Careful, stealthed enemies.
collect Nak's Skull##5073 |q 879/2 |goto The Barrens 43.82,83.10
step
kill Lok Orcbane##3435
|tip Careful, stealthed enemies.
|tip Inside the building.
collect Lok's Skull##5072 |q 879/3 |goto The Barrens 40.15,80.54
step
label "Collect_Razormane_Backstabber"
kill Razormane Stalker##3457, Razormane Pathfinder##3456
|tip Pathfinders and Stalkers.
|tip Careful, stealthed enemies. |notinsticky
collect Razormane Backstabber##5093 |q 893/1 |goto The Barrens 44.20,81.40
|tip Don't vendor it.
|mapmarker The Barrens/0 41.20,80.40
|mapmarker The Barrens/0 42.40,82.60
|mapmarker The Barrens/0 44.80,83.80
step
label "Collect_Razormane_Wand"
kill Razormane Seer##3458+
|tip Careful, stealthed enemies. |notinsticky
collect Charred Razormane Wand##5092 |q 893/2 |goto The Barrens 42.40,82.20
|tip Don't vendor it.
|mapmarker The Barrens/0 40.40,80.80
|mapmarker The Barrens/0 41.60,78.80
|mapmarker The Barrens/0 44.40,83.60
step
label "Collect_Razormane_War_Shield"
kill Razormane Warfrenzy##3459+
|tip Careful, stealthed enemies. |notinsticky
collect Razormane War Shield##5094 |q 893/3 |goto The Barrens 42.20,82.60
|tip Don't vendor it.
|mapmarker The Barrens/0 40.40,80.80
|mapmarker The Barrens/0 41.40,78.40
step
label "Collect_Washte_Pawnes_Feather"
kill Washte Pawne##3472
|tip Red flying snake.
|tip Moves around.
collect Washte Pawne's Feather##5103 |n
use Washte Pawne's Feather##5103
accept Washte Pawne##885 |goto The Barrens 43.20,80.80
|mapmarker The Barrens/0 44.40,74.80
|mapmarker The Barrens/0 44.40,78.80
|mapmarker The Barrens/0 47.20,79.40
stickystart "Kill_Baeldun_Foremen_And_Excavators"
step
kill Prospector Khazgorm##3392
|tip Walks around.
|tip Multiple locations.
collect Khazgorm's Journal##5006 |q 843/3 |goto The Barrens 47.55,85.26
|mapmarker The Barrens/0 48.33,86.22
step
label "Kill_Baeldun_Foremen_And_Excavators"
kill 5 Bael'dun Foreman##3375 |q 843/2 |goto The Barrens 47.41,84.99
kill 15 Bael'dun Excavator##3374 |q 843/1 |goto The Barrens 47.41,84.99
|mapmarker The Barrens/0 46.40,85.20
|mapmarker The Barrens/0 48.00,85.80
step
Follow the path up |goto The Barrens 46.85,84.89 < 40 |only if walking and subzone("Bael Modan")
talk Gann Stonespire##3341
|tip Walks along the road.
turnin Gann's Reclamation##843 |goto The Barrens 46.12,81.24
accept Revenge of Gann##846 |goto The Barrens 46.12,81.24
|mapmarker The Barrens/0 45.80,78.80
|mapmarker The Barrens/0 46.13,75.54
step
kill Bael'dun Rifleman##3377, Bael'dun Soldier##3376, Bael'dun Officer##3378
|tip Inside and outside the building.
collect 6 Nitroglycerin##5017 |q 846/1 |goto The Barrens 48.75,84.49
collect 6 Wood Pulp##5018 |q 846/2 |goto The Barrens 48.75,84.49
collect 6 Sodium Nitrate##5019 |q 846/3 |goto The Barrens 48.75,84.49
step
talk Gann Stonespire##3341
|tip Walks along the road.
turnin Revenge of Gann##846 |goto The Barrens 46.12,81.24
accept Revenge of Gann##849 |goto The Barrens 46.12,81.24
|mapmarker The Barrens/0 45.80,78.80
|mapmarker The Barrens/0 46.13,75.54
step
click Bael Modan Flying Machine
|tip Top of the platform.
|tip Click it from a distance.
Destroy the Bael Modan Flying Machine |q 849/1 |goto The Barrens 47.00,85.60
step
talk Gann Stonespire##3341
|tip Walks along the road.
turnin Revenge of Gann##849 |goto The Barrens 46.12,81.24
|mapmarker The Barrens/0 45.80,78.80
|mapmarker The Barrens/0 46.13,75.54
step
talk Shardi##11899
|tip Careful, higher level enemies.
fpath Brackenwall Village |goto Dustwallow Marsh 35.56,31.88
step
talk Tatternack Steelforge##3433
turnin Weapons of Choice##893 |goto The Barrens 45.10,57.68
step
talk Jorn Skyseer##3387
turnin The Harvester##897	|goto The Barrens 44.86,59.14 |only if haveq(897) or completedq(897)
turnin Washte Pawne##885	|goto The Barrens 44.86,59.14
accept The Ashenvale Hunt##6382 |goto The Barrens 44.86,59.14
step
talk Mangletooth##3430
turnin Betrayal from Within##879 |goto The Barrens 44.55,59.24
accept Betrayal from Within##906 |goto The Barrens 44.55,59.24
step
_NOTE:_
Stronger Ammo Available
|tip Buy level 25 ammo when restocking.
Click Here to Continue |confirm |q 906
|only if Hunter
step
talk Thork##3429
turnin Betrayal from Within##906 |goto The Barrens 51.50,30.87
step
talk Korran##3428
turnin Egg Hunt##868 |goto The Barrens 51.07,29.63
step
_Destroy These Items:_
|tip Not needed.
trash Silithid Egg##5058
step
talk Mahren Skyseer##3388
turnin Mahren Skyseer##874 |goto The Barrens 65.84,43.86
accept Isha Awak##873 |goto The Barrens 65.84,43.86
step
kill Isha Awak##3476
|tip Water dinosaur.
|tip Swims around.
|tip Multiple locations.
collect Heart of Isha Awak##5104 |q 873/1 |goto The Barrens/0 65.40,47.20
|mapmarker The Barrens/0 63.40,53.40
|mapmarker The Barrens/0 64.20,50.40
step
talk Mahren Skyseer##3388
turnin Isha Awak##873 |goto The Barrens 65.84,43.86
step
talk Loganaar##12042
Train Abilities |trainer Loganaar##12042 |goto Moonglade/0 52.53,40.57 |q 6382
|only if Druid
step
talk Enyo##5883
|tip Inside the building.
Train Abilities |trainer Enyo##5883 |goto Orgrimmar/0 38.79,85.65 |q 6382
|only if Mage
step
talk Ur'kyo##6018
|tip Inside the building.
Train Abilities |trainer Ur'kyo##6018 |goto Orgrimmar/0 35.59,87.80 |q 6382
|only if Priest
step
talk Kardris Dreamseeker##3344
|tip Inside the building.
Train Abilities |trainer Kardris Dreamseeker##3344 |goto Orgrimmar/0 38.80,36.38 |q 6382
|only if Shaman
step
talk Ormok##3328
|tip Inside the Cleft of Shadow.
Train Abilities |trainer Ormok##3328 |goto Orgrimmar/0 43.91,54.63 |q 6382
|only if Rogue
step
talk Shenthul##3401
|tip Inside the tent.
|tip Inside the Cleft of Shadow.
accept The Shattered Salute##2460 |goto Orgrimmar/0 43.05,53.74
|only if Rogue
step
Watch the dialogue
|tip Inside the tent.
|tip Inside the Cleft of Shadow.
|tip Wait for Shenthul to salute you.
Perform the Shattered Salute |q 2460/1 |goto Orgrimmar/0 43.05,53.74
|tip Perform the {o}/salute{} emote on Shenthul. |macro /salute
|only if Rogue
step
talk Shenthul##3401
|tip Inside the tent.
|tip Inside the Cleft of Shadow.
turnin The Shattered Salute##2460 |goto Orgrimmar/0 43.05,53.74
accept Deep Cover##2458 |goto Orgrimmar/0 43.05,53.74
|only if Rogue
step
talk Mirket##3325
|tip Inside the Cleft of Shadow.
Train Abilities |trainer Mirket##3325 |goto Orgrimmar/0 48.62,46.95 |q 6382
|only if Warlock
step
talk Kurgul##5815
|tip Buy available Grimoires.
|tip Inside the Cleft of Shadow.
Train Demon Abilities |vendor Kurgul##5815 |goto Orgrimmar 47.52,46.72 |q 6382
|only if Warlock
step
talk Gan'rul Bloodeye##5875
|tip Inside the tent.
|tip Inside the Cleft of Shadow.
turnin Love's Gift##1512 |goto Orgrimmar 48.25,45.29
accept The Binding##1513 |goto Orgrimmar 48.25,45.29
|only if Warlock
step
use Dogran's Pendant##6626
|tip Stand on the pink symbol.
|tip Inside the tent.
|tip Inside the Cleft of Shadow.
kill Summoned Succubus##5677 |q 1513/1 |goto Orgrimmar 49.45,50.03
|only if Warlock
step
talk Gan'rul Bloodeye##5875
|tip Inside the tent.
|tip Inside the Cleft of Shadow.
turnin The Binding##1513 |goto Orgrimmar 48.24,45.29
|only if Warlock
step
talk Grezz Ragefist##3353
|tip Inside the building.
Train Abilities |trainer Grezz Ragefist##3353 |goto Orgrimmar/0 79.78,31.42 |q 6382
|only if Warrior
step
talk Ormak Grimshot##3352
|tip Top of the building.
Train Abilities |trainer Ormak Grimshot##3352 |goto Orgrimmar/0 66.06,18.54 |q 6382
|only if Hunter
step
talk Hanashi##2704
|tip Inside the building.
Train Two-Handed Axes |complete weaponskill("TH_AXE") > 0 |goto Orgrimmar/0 81.53,19.61
|only if Hunter
]])
GoatQuest:RegisterGuide("Leveling Guides\\Ashenvale (26-29)",{
image=GQ.IMAGESDIR.."Ashenvale",
next="Leveling Guides\\Stonetalon Mountains (29-30)",
},[[
step
talk Auctioneer Thathung##8673
|tip Buy from the Auction House, if possible.
|tip Inside the building.
collect Shredder Operating Manual - Page 1##16645 |goto Orgrimmar 55.90,62.71 |q 6504 |future
collect Shredder Operating Manual - Page 2##16646 |goto Orgrimmar 55.90,62.71 |q 6504 |future
collect Shredder Operating Manual - Page 3##16647 |goto Orgrimmar 55.90,62.71 |q 6504 |future
collect Shredder Operating Manual - Page 4##16648 |goto Orgrimmar 55.90,62.71 |q 6504 |future
collect Shredder Operating Manual - Page 5##16649 |goto Orgrimmar 55.90,62.71 |q 6504 |future
collect Shredder Operating Manual - Page 6##16650 |goto Orgrimmar 55.90,62.71 |q 6504 |future
collect Shredder Operating Manual - Page 7##16651 |goto Orgrimmar 55.90,62.71 |q 6504 |future
collect Shredder Operating Manual - Page 8##16652 |goto Orgrimmar 55.90,62.71 |q 6504 |future
collect Shredder Operating Manual - Page 9##16653 |goto Orgrimmar 55.90,62.71 |q 6504 |future
collect Shredder Operating Manual - Page 10##16654 |goto Orgrimmar 55.90,62.71 |q 6504 |future
collect Shredder Operating Manual - Page 11##16655 |goto Orgrimmar 55.90,62.71 |q 6504 |future
collect Shredder Operating Manual - Page 12##16656 |goto Orgrimmar 55.90,62.71 |q 6504 |future
step
use Flare Gun##8051
|tip On Taskmaster Fizzule {o}two times{}.
|tip Nearby to the north.
Signal Taskmaster Fizzule |q 2458/1 |goto The Barrens 55.47,6.08
|tip Perform the {o}/salute{} emote on Taskmaster Fizzule. |macro /salute
|tip Wait for him to salute you back.
|only if Rogue
step
talk Taskmaster Fizzule##7233
turnin Deep Cover##2458 |goto The Barrens 55.44,5.56
accept Mission: Possible But Not Probable##2478 |goto The Barrens 55.44,5.56
|only if Rogue
step
collect Silixiz's Tower Key##8072 |q 2478/5 |goto The Barrens 54.80,5.97
|tip {o}Pickpocket{} Foreman Silixiz.
|only if Rogue
step
kill 2 Mutated Venture Co. Drone##7310 |q 2478/1 |goto The Barrens 54.71,5.73
|tip Use {o}Ambush{} to deal extra damage.
|tip {o}Ground floor{} inside the building.
|only if Rogue
step
kill 2 Venture Co. Patroller##7308 |q 2478/3 |goto The Barrens 54.81,5.59
|tip Use {o}Rupture{} to deal extra damage.
|tip {o}Middle floor{} inside the building.
|only if Rogue
step
kill 2 Venture Co. Lookout##7307 |q 2478/2 |goto The Barrens 54.63,5.64
|tip Use {o}Eviscerate{} to deal extra damage.
|tip Up on the balcony.
|tip {o}Middle floor{} inside the building.
|only if Rogue
step
kill Grand Foreman Puzik Gallywix##7288
|tip Use {o}Ambush{} to deal extra damage.
|tip {o}Top floor{} inside the building.
collect Gallywix's Head##8074 |q 2478/4 |goto The Barrens 54.75,5.59
|only if Rogue
step
click Gallywix's Lockbox##129127
|tip Lockpick it.
|tip {o}Top floor{} inside the building.
collect Cache of Zanzil's Altered Mixture##8073 |q 2478/6 |goto The Barrens 54.75,5.55
|only if Rogue
step
_NOTE:_
Tame an Elder Ashenvale Bear
|tip Cast {o}Tame Beast{} on an Elder Ashenvale Bear.
|tip Find one that's {o}level 26{}.
|tip Abandon your pet first.
|tip New permanent pet.
Click Here to Continue |confirm |goto Ashenvale/0 62.20,68.00 |q 6503 |future
|mapmarker Ashenvale/0 59.00,61.60
|mapmarker Ashenvale/0 60.40,64.60
|mapmarker Ashenvale/0 62.20,61.40
|mapmarker Ashenvale/0 69.00,59.60
|mapmarker Ashenvale/0 64.20,57.00
|mapmarker Ashenvale/0 64.40,64.00
|mapmarker Ashenvale/0 65.40,60.00
|mapmarker Ashenvale/0 67.40,62.40
|only if Hunter
step
talk Gurda Ragescar##12718
accept The Lost Pages##6504 |goto Ashenvale/0 70.00,71.15
|only if itemcount(16645) > 0 and itemcount(16646) > 0 and itemcount(16647) > 0 and itemcount(16648) > 0 and itemcount(16649) > 0 and itemcount(16650) > 0 and itemcount(16651) > 0 and itemcount(16652) > 0 and itemcount(16653) > 0 and itemcount(16654) > 0 and itemcount(16655) > 0 and itemcount(16656) > 0
step
use Shredder Operating Manual - Page 1##16645
collect Shredder Operating Manual - Chapter 1##16642 |q 6504/1
|only if haveq(6504) or completedq(6504)
step
use Shredder Operating Manual - Page 5##16649
collect Shredder Operating Manual - Chapter 2##16643 |q 6504/2
|only if haveq(6504) or completedq(6504)
step
use Shredder Operating Manual - Page 9##16653
collect Shredder Operating Manual - Chapter 3##16644 |q 6504/3
|only if haveq(6504) or completedq(6504)
step
talk Gurda Ragescar##12718
turnin The Lost Pages##6504 |goto Ashenvale/0 70.00,71.15
|only if haveq(6504) or completedq(6504)
step
talk Kuray'bin##12867
accept Ashenvale Outrunners##6503 |goto Ashenvale 71.10,68.12
step
talk Senani Thunderheart##12696
turninany The Ashenvale Hunt##6382,235,742
accept The Ashenvale Hunt##6383 |goto Ashenvale/0 73.78,61.46 |instant
step
talk Mastok Wrilehiss##12737
accept Stonetalon Standstill##25 |goto Ashenvale/0 73.67,60.01
step
talk Pixel##12724
accept Satyr Horns##6441 |goto Ashenvale/0 73.06,61.48
step
talk Vhulgra##12616
fpath Splintertree Post |goto Ashenvale/0 73.18,61.59
step
talk Shenthul##3401
|tip Inside the tent.
|tip Inside the Cleft of Shadow.
turnin Mission: Possible But Not Probable##2478 |goto Orgrimmar 43.05,53.74
accept Hinott's Assistance##2479 |goto Orgrimmar 43.05,53.74
|only if Rogue
step
_Destroy These Items:_
|tip Not needed.
trash Flare Gun##8051
trash Fizzule's Whistle##8066
|only if Rogue
step
talk Rekkul##3334
|tip Inside the tent.
|tip Inside the Cleft of Shadow.
|tip Buy {o}20+{} Dust of Decay and Empty Vials.
|tip Used to create poisons.
Visit the Vendor |vendor Rekkul##3334 |goto Orgrimmar 42.09,49.48 |q 2479
|only if Rogue
step
Remove the Touch of Zanzil |nobuff Touch of Zanzil##9991
|tip Multiple options.
|tip Create {o}Anti-Venom{} with First Aid.
|tip Buy {o}Jungle Remedy{} from Auction House.
|tip Ask a {o}Druid{} to cast {o}Cure Poison{} on you.
|only if Rogue
step
kill 9 Ashenvale Outrunner##12856 |q 6503/1 |goto Ashenvale 72.80,70.20
|tip Stealthed night elves.
|tip Usually near trees.
|tip Cast {o}Track Hidden{} to find them easier. |only if Hunter
|tip Avoid {o}Sharptalon{}.
|tip {o}Level 31{} large blue bird.
|mapmarker Ashenvale/0 68.20,70.20
|mapmarker Ashenvale/0 68.20,73.20
|mapmarker Ashenvale/0 69.80,74.40
|mapmarker Ashenvale/0 69.80,76.00
|mapmarker Ashenvale/0 72.40,72.40
|mapmarker Ashenvale/0 73.40,74.40
|mapmarker Ashenvale/0 74.40,69.40
|mapmarker Ashenvale/0 74.40,72.40
|mapmarker Ashenvale/0 76.00,69.00
|mapmarker Ashenvale/0 76.00,73.00
|mapmarker Ashenvale/0 76.20,67.40
|mapmarker Ashenvale/0 72.22,76.28
|mapmarker Ashenvale/0 70.92,72.60
step
_NOTE:_
During the Next Steps
|tip Make sure {o}3 Splintertree Raiders{} are next to {o}Torek{}.
|tip Don't accept the quest unless there are.
|tip They help you fight during the escort.
Move to the Balcony
|tip You enter a building during the escort.
|tip {o}Move onto the balcony{} before more enemies appear.
|tip Let your allies get attacked by the enemies.
|tip Protect {o}Torek{}, he {o}must survive{}.
Click Here to Continue |confirm |q 6544 |future
step
talk Torek##12858
|tip Escort quest.
|tip Wait until he respawns, if missing.
accept Torek's Assault##6544 |goto Ashenvale 68.34,75.30 |noautoaccept inparty
step
Watch the dialogue
|tip Follow and protect Torek.
|tip He must survive.
|tip {o}Move to the balcony{} inside the building.
|tip Let your allies get attacked by the enemies.
Take Silverwing Outpost |q 6544/1 |goto Ashenvale 64.66,75.34
step
Follow the path along the river and follow this path up |goto Ashenvale 72.33,49.92 < 30 |only if walking and not subzone("Night Run")
kill Felmusk Felsworn##3762, Felmusk Rogue##3759, Felmusk Satyr##3758, Felmusk Shadowstalker##3763
|tip Satyrs.
|tip Careful, stealthed enemies.
collect 16 Satyr Horns##5481 |q 6441/1 |goto Ashenvale 68.60,53.40
|mapmarker Ashenvale/0 66.20,54.20
|mapmarker Ashenvale/0 66.40,51.80
|mapmarker Ashenvale/0 67.60,54.60
|mapmarker Ashenvale/0 66.60,56.60
stickystart "Collect_Etched_Phial"
step
map Ashenvale
path follow strictbounce;	loop off;	ants curved;	dist 30;	markers none;		arrow hide
path	62.52,49.81	62.10,49.78	61.35,49.99	61.02,50.36	61.03,50.93
path	60.97,51.46	60.51,52.38	59.83,53.40	59.58,53.68	59.32,54.12
path	59.09,54.78	58.88,55.19	57.81,55.97	57.46,56.05	56.93,56.04
path	56.39,55.92	56.20,55.46	55.70,55.42	54.13,54.92	52.15,54.34
kill Shadumbra##12677
|tip Black panther.
|tip Walks a large pattern.
collect Shadumbra's Head##16304 |n
use Shadumbra's Head##16304
accept Shadumbra's Head##24
Spawns near [Ashenvale/0 62.35,50.04] |noway
|only if completedq(6383)
step
label "Collect_Etched_Phial"
kill Laughing Sister##4054+
collect Etched Phial##5867 |goto Ashenvale 59.20,54.40 |q 1195
|mapmarker Ashenvale/0 57.40,56.00
|mapmarker Ashenvale/0 58.40,58.20
|mapmarker Ashenvale/0 59.60,56.60
|mapmarker Ashenvale/0 60.40,52.40
|mapmarker Ashenvale/0 60.80,49.00
|mapmarker Ashenvale/0 62.60,50.20
step
map Ashenvale
path follow strict;	loop off;	ants curved;	dist 30;	markers none;		arrow hide
path	42.69,63.22	43.09,63.07	43.24,63.76	43.71,63.87	43.25,63.81
path	43.13,63.09	42.70,63.17	42.55,63.96	42.25,64.80	41.87,65.35
path	40.85,66.35	40.23,66.26	39.77,65.43	39.66,63.82	39.80,62.90
path	39.65,63.77	39.77,65.41	41.40,66.60	41.47,67.53	41.77,68.25
path	42.05,68.75	42.43,68.43	42.93,68.43	43.32,68.07	43.78,68.87
path	43.36,68.13	42.46,68.38	42.05,68.75	41.73,68.15	41.47,67.49
path	41.40,66.52	40.22,66.23	39.77,65.45	39.68,64.37	39.64,63.81
path	39.83,62.80	39.66,63.78	39.78,65.45	40.20,66.23	40.54,65.96
path	41.57,65.66	42.19,64.90	42.53,64.04
kill Ursangous##12678
|tip Grey druid bear.
|tip Walks a large pattern.
|tip Despawns while {o}Battle for Ashenvale{} is in progress.	|only if GQ.IsClassicSoD
|tip Wait for it to end, or come back later.			|only if GQ.IsClassicSoD
collect Ursangous's Paw##16303 |n
use Ursangous's Paw##16303
accept Ursangous's Paw##23
Spawns at [Ashenvale/0 43.77,68.87] |noway
|only if completedq(6383)
stickystart "Collect_Befouled_Water_Globe"
stickystart "Kill_Befouled_Water_Elementals"
step
Scout the Gazebo on Mystral Lake that Overlooks the Nearby Alliance Outpost |q 25/2 |goto Ashenvale 48.92,69.57
step
label "Collect_Befouled_Water_Globe"
kill Tideress##12759
|tip Darker green water elemental.
|tip Moves around.
collect Befouled Water Globe##16408 |n
use Befouled Water Globe##16408
accept The Befouled Element##1918 |goto Ashenvale 48.40,69.40
|mapmarker Ashenvale/0 46.40,70.40
|mapmarker Ashenvale/0 50.40,71.60
|mapmarker Ashenvale/0 52.60,71.20
step
label "Kill_Befouled_Water_Elementals"
kill 12 Befouled Water Elemental##3917 |q 25/1 |goto Ashenvale 49.60,69.20
|mapmarker Ashenvale/0 45.00,69.40
|mapmarker Ashenvale/0 47.20,67.20
|mapmarker Ashenvale/0 48.00,72.40
|mapmarker Ashenvale/0 51.40,72.80
|mapmarker Ashenvale/0 52.00,69.40
step
use Etched Phial##5867
collect Filled Etched Phial##5868 |q 1195/1 |goto Ashenvale 60.20,72.90
step
Follow the path up and follow the road back to Splintertree Post |goto Ashenvale 59.51,68.25 < 30 |only if walking and (subzone("Moonwell") or subzone("Nightsong Woods"))
talk Kuray'bin##12867
turnin Ashenvale Outrunners##6503 |goto Ashenvale 71.11,68.12
step
map Ashenvale
path follow strict;	loop off;	ants curved;	dist 30;	markers none;		arrow hide
path	71.49,70.11	72.04,70.46	72.56,70.62	73.41,70.57	74.38,70.07
path	75.07,70.01	75.94,69.80	76.09,69.00	76.85,68.13	77.57,66.41
path	77.89,65.98	78.32,65.65
path	77.89,65.98	77.57,66.41	76.85,68.13	76.09,69.00	75.94,69.80
path	75.07,70.01	74.38,70.07	73.41,70.57	72.56,70.62	72.04,70.46
kill Sharptalon##12676
|tip {o}Level 31{} large blue bird.
|tip Flies a large pattern.
collect Sharptalon's Claw##16305 |n
use Sharptalon's Claw##16305
accept Sharptalon's Claw##2
Spawns around [Ashenvale/0 78.00,66.0] |noway
|only if completedq(6383)
step
talk Ertog Ragetusk##12877
turnin Torek's Assault##6544 |goto Ashenvale 73.03,62.47
step
talk Senani Thunderheart##12696
turnin Sharptalon's Claw##2 |goto Ashenvale/0 73.78,61.46
turnin Shadumbra's Head##24 |goto Ashenvale 73.78,61.46
turnin Ursangous's Paw##23 |goto Ashenvale 73.78,61.46
accept The Hunt Completed##247 |goto Ashenvale/0 73.78,61.46 |instant
step
talk Mastok Wrilehiss##12737
turnin Stonetalon Standstill##25 |goto Ashenvale 73.67,60.00
turnin The Befouled Element##1918 |goto Ashenvale 73.67,60.00
step
talk Pixel##12724
turnin Satyr Horns##6441 |goto Ashenvale 73.06,61.48
]])
GoatQuest:RegisterGuide("Leveling Guides\\Stonetalon Mountains (29-30)",{
image=GQ.IMAGESDIR.."Stonetalon Mountains",
next="Leveling Guides\\Thousand Needles (30-35)",
},[[
step
talk Tammra Windfield##11864
accept Cycle of Rebirth##6301 |goto Stonetalon Mountains 47.46,58.38
step
talk Maggran Earthbinder##11860
accept Harpies Threaten##6282 |goto Stonetalon Mountains 47.20,61.15
step
Follow the path up |goto Stonetalon Mountains/0 49.20,61.91 < 20 |only if walking
talk Tsunaman##11862
|tip Walks around.
accept Elemental War##6393 |goto Stonetalon Mountains/0 47.37,64.29
step
click Gaea Seed+
|tip Brown pine cones.
|tip Avoid the elite windstrider.
collect 10 Gaea Seed##16205 |q 6301/1 |goto Stonetalon Mountains/0 48.00,44.30
|mapmarker Stonetalon Mountains/0 45.80,43.10
|mapmarker Stonetalon Mountains/0 46.00,40.80
|mapmarker Stonetalon Mountains/0 48.00,39.80
|mapmarker Stonetalon Mountains/0 46.70,37.40
|mapmarker Stonetalon Mountains/0 48.40,35.90
|mapmarker Stonetalon Mountains/0 50.20,39.20
|mapmarker Stonetalon Mountains/0 50.40,37.30
|mapmarker Stonetalon Mountains/0 50.90,41.20
stickystart "Kill_Bloodfury_Harpies"
stickystart "Kill_Bloodfury_Ambushers"
stickystart "Kill_Bloodfury_Slayers"
stickystart "Kill_Bloodfury_Roguefeathers"
step
kill Burning Ravager##4037, Rogue Flame Spirit##4036, Burning Destroyer##4038
|tip Fire elementals.
|tip Shared spawns with {o}basilisks{} and {o}walking trees{}.
collect 10 Incendrites##16312 |q 6393/1 |goto Stonetalon Mountains 44.80,43.40
|mapmarker Stonetalon Mountains/0 28.00,66.20
|mapmarker Stonetalon Mountains/0 28.40,63.20
|mapmarker Stonetalon Mountains/0 29.40,72.40
|mapmarker Stonetalon Mountains/0 32.40,73.60
|mapmarker Stonetalon Mountains/0 34.40,60.00
|mapmarker Stonetalon Mountains/0 35.20,53.40
|mapmarker Stonetalon Mountains/0 35.40,73.40
|mapmarker Stonetalon Mountains/0 35.60,47.40
|mapmarker Stonetalon Mountains/0 35.60,65.60
|mapmarker Stonetalon Mountains/0 36.20,70.40
|mapmarker Stonetalon Mountains/0 37.60,50.60
|mapmarker Stonetalon Mountains/0 44.00,39.40
|mapmarker Stonetalon Mountains/0 32.60,67.40
step
label "Kill_Bloodfury_Harpies"
kill 7 Bloodfury Harpy##4022 |q 6282/1 |goto Stonetalon Mountains/0 32.60,61.60
|mapmarker Stonetalon Mountains/0 29.20,63.20
|mapmarker Stonetalon Mountains/0 30.40,59.40
|mapmarker Stonetalon Mountains/0 31.40,66.00
|mapmarker Stonetalon Mountains/0 35.20,63.40
step
label "Kill_Bloodfury_Ambushers"
kill 7 Bloodfury Ambusher##4025 |q 6282/2 |goto Stonetalon Mountains/0 32.20,63.80
|mapmarker Stonetalon Mountains/0 29.20,63.60
|mapmarker Stonetalon Mountains/0 30.80,59.60
|mapmarker Stonetalon Mountains/0 31.40,66.80
|mapmarker Stonetalon Mountains/0 34.40,61.20
|mapmarker Stonetalon Mountains/0 35.20,64.60
step
label "Kill_Bloodfury_Slayers"
kill 7 Bloodfury Slayer##4024 |q 6282/3 |goto Stonetalon Mountains/0 34.40,67.40
|mapmarker Stonetalon Mountains/0 26.40,68.00
|mapmarker Stonetalon Mountains/0 27.00,71.00
|mapmarker Stonetalon Mountains/0 29.40,68.40
|mapmarker Stonetalon Mountains/0 30.00,71.60
|mapmarker Stonetalon Mountains/0 34.00,70.80
|mapmarker Stonetalon Mountains/0 37.00,70.80
|mapmarker Stonetalon Mountains/0 37.20,65.40
step
label "Kill_Bloodfury_Roguefeathers"
kill 7 Bloodfury Roguefeather##4023 |q 6282/4 |goto Stonetalon Mountains/0 34.40,67.40
|mapmarker Stonetalon Mountains/0 26.40,68.00
|mapmarker Stonetalon Mountains/0 27.00,71.00
|mapmarker Stonetalon Mountains/0 29.40,68.40
|mapmarker Stonetalon Mountains/0 30.00,71.60
|mapmarker Stonetalon Mountains/0 34.00,70.80
|mapmarker Stonetalon Mountains/0 37.00,70.80
|mapmarker Stonetalon Mountains/0 37.20,65.40
step
Follow the path to Sun Rock Retreat |goto Stonetalon Mountains/0 37.93,67.96 < 20 |only if walking and subzone("The Charred Vale")
talk Tsunaman##11862
|tip Walks around.
turnin Elemental War##6393 |goto Stonetalon Mountains/0 47.37,64.29
step
talk Maggran Earthbinder##11860
turnin Harpies Threaten##6282 |goto Stonetalon Mountains/0 47.20,61.15
accept Bloodfury Bloodline##6283 |goto Stonetalon Mountains/0 47.20,61.15
step
talk Tammra Windfield##11864
turnin Cycle of Rebirth##6301 |goto Stonetalon Mountains/0 47.46,58.38
accept New Life##6381 |goto Stonetalon Mountains/0 47.46,58.38
stickystart "Plant_Gaea_Seeds"
step
Follow the path to the Charred Vale |goto Stonetalon Mountains/0 44.63,61.81 < 20 |only if walking and not subzone("The Charred Vale")
kill Bloodfury Ripper##12579
|tip Blue harpy.
|tip {o}Elite enemy{}.
|tip Skip if too difficult.
collect Bloodfury Ripper's Remains##16190 |q 6283/1 |goto Stonetalon Mountains/0 30.76,61.92
step
label "Plant_Gaea_Seeds"
click Gaea Dirt Mound+
|tip Piles of dirt.
|tip All around the Charred Vale.
Plant #10# Gaea Seeds |q 6381/1 |goto Stonetalon Mountains/0 32.25,68.16
step
Follow the path to Sun Rock Retreat |goto Stonetalon Mountains/0 37.93,67.96 < 20 |only if walking and subzone("The Charred Vale")
talk Maggran Earthbinder##11860
turnin Bloodfury Bloodline##6283 |goto Stonetalon Mountains/0 47.20,61.15 |only if readyq(6283) or completedq(6283)
accept Calling in the Reserves##5881 |goto Stonetalon Mountains 47.20,61.15
step
Abandon the {y}Bloodfury Bloodline{} Quest |complete not haveq(6283)
|tip Not needed.
|only if haveq(6283) and not completedq(6283)
step
talk Tammra Windfield##11864
turnin New Life##6381 |goto Stonetalon Mountains/0 47.46,58.38
]])
GoatQuest:RegisterGuide("Leveling Guides\\Thousand Needles (30-35)",{
image=GQ.IMAGESDIR.."Thousand Needles",
next="Leveling Guides\\Stranglethorn Vale (35-38)",
},[[
step
talk Ormok##3328
|tip Inside the Cleft of Shadow.
Train Abilities |trainer Ormok##3328 |goto Orgrimmar/0 43.91,54.63 |q 1195
|only if Rogue
step
talk Mirket##3325
|tip Inside the Cleft of Shadow.
Train Abilities |trainer Mirket##3325 |goto Orgrimmar/0 48.62,46.95 |q 1195
|only if Warlock
step
talk Kurgul##5815
|tip Buy available Grimoires.
|tip Inside the Cleft of Shadow.
Train Demon Abilities |vendor Kurgul##5815 |goto Orgrimmar 47.52,46.72 |q 1195
|only if Warlock
step
Enter the cave |goto Thunder Bluff 29.81,29.82 < 15 |walk |only if not subzone("The Pools of Vision")
talk Malakai Cross##3045
|tip Inside the cave.
Train Abilities |trainer Malakai Cross##3045 |goto Thunder Bluff/0 24.55,22.58 |q 1195
|only if Priest
step
Enter the cave |goto Thunder Bluff 29.81,29.82 < 15 |walk |only if not subzone("The Pools of Vision")
talk Archmage Shymm##3047
|tip Inside the cave.
Train Abilities |trainer Archmage Shymm##3047 |goto Thunder Bluff/0 22.76,14.52 |q 1195
|only if Mage
step
talk Birgitte Cranston##5957
|tip Inside the cave.
learnspell Teleport: Thunder Bluff##3566 |goto Thunder Bluff 22.50,16.91
|only if Mage
step
talk Siln Skychaser##3030
|tip Inside the building.
Train Abilities |trainer Siln Skychaser##3030 |goto Thunder Bluff/0 22.83,21.10 |q 1195
|only if Shaman
step
Leave the cave |goto Thunder Bluff/0 29.81,29.82 < 15 |walk |only if subzone("The Pools of Vision")
talk Zangen Stonehoof##4721
turnin The Sacred Flame##1195 |goto Thunder Bluff/0 54.97,51.41
accept The Sacred Flame##1196 |goto Thunder Bluff/0 54.97,51.41
step
talk Kym Wildmane##3036
|tip Inside the building.
Train Abilities |trainer Kym Wildmane##3036 |goto Thunder Bluff/0 77.13,29.80 |q 4542 |future
|only if Druid
step
talk Melor Stonehoof##3441
accept Steelsnap##1131 |goto Thunder Bluff/0 61.54,80.92
step
talk Urek Thunderhorn##3040
|tip Inside the building.
Train Abilities |trainer Urek Thunderhorn##3040 |goto Thunder Bluff/0 59.11,86.86 |q 4542 |future
|only if Hunter
step
talk Hesuwa Thunderhorn##10086
|tip Inside the building.
Train Pet Abilities |trainer Hesuwa Thunderhorn##10086 |goto Thunder Bluff/0 54.09,83.97 |q 4542 |future
|only if Hunter
step
talk Ker Ragetotem##3043
|tip Inside the building.
Train Abilities |trainer Ker Ragetotem##3043 |goto Thunder Bluff/0 57.58,85.52 |q 4542 |future
|only if Warrior
step
talk Torm Ragetotem##3041
|tip Inside the building.
accept The Islander##1718 |goto Thunder Bluff/0 57.24,87.37
|only if Warrior
step
talk Innkeeper Pala##6746
|tip Inside the building.
home Thunder Bluff |goto Thunder Bluff 45.81,64.71 |q 5147 |future
step
talk Grish Longrunner##12576
|tip Wait until he respawns, if missing.
turnin Calling in the Reserves##5881 |goto Thousand Needles 31.86,21.66
step
talk Brave Moonhorn##10079
|tip Wait until he respawns, if missing.
accept Message to Freewind Post##4542 |goto Thousand Needles 32.24,22.17
step
Ride an elevator down into Thousand Needles, follow the road to Freewind Post, and ride an elevator up |goto Thousand Needles 47.02,48.32 < 50 |only if walking
talk Nyse##4317
fpath Freewind Post |goto Thousand Needles 45.14,49.11
step
talk Elu##10377
|tip Walks around.
accept Wind Rider##4767 |goto Thousand Needles 44.93,48.93
step
talk Hagar Lightninghoof##10539
accept Alien Egg##4821 |goto Thousand Needles 44.64,50.29
step
talk Cliffwatcher Longhorn##10537
|tip Walks around.
turnin Message to Freewind Post##4542 |goto Thousand Needles 45.65,50.80
accept Pacify the Centaur##4841 |goto Thousand Needles 45.65,50.80
step
talk Rau Cliffrunner##4722
|tip Inside the building.
turnin The Sacred Flame##1196 |goto Thousand Needles 46.14,51.72
accept The Sacred Flame##1197 |goto Thousand Needles 46.14,51.72
stickystart "Kill_Galak_Enemies"
step
Enter the cave |goto Thousand Needles 44.05,37.34 < 20 |walk |only if not subzone("Splithoof Hold")
Follow the path |goto Thousand Needles 42.06,34.68 < 10 |walk
click Ancient Brazier
|tip Two {o}level 30{} enemies guarding it.
|tip Inside the cave.
collect Cloven Hoof##5869 |q 1197/1 |goto Thousand Needles 42.01,31.51
step
label "Kill_Galak_Enemies"
Leave the cave |goto Thousand Needles 44.05,37.34 < 20 |only if walking and subzone("Splithoof Hold")
kill 6 Galak Windchaser##4096 |q 4841/3 |goto Thousand Needles 44.40,40.20
kill 10 Galak Wrangler##4093 |q 4841/2 |goto Thousand Needles 44.40,40.20
kill 12 Galak Scout##4094 |q 4841/1 |goto Thousand Needles 44.40,40.20
|mapmarker Thousand Needles/0 39.00,32.20
|mapmarker Thousand Needles/0 39.00,37.60
|mapmarker Thousand Needles/0 41.00,41.20
|mapmarker Thousand Needles/0 42.00,38.00
|mapmarker Thousand Needles/0 43.40,35.20
|mapmarker Thousand Needles/0 45.40,44.00
|mapmarker Thousand Needles/0 47.60,41.00
step
Leave the cave |goto Thousand Needles 44.05,37.34 < 20 |only if walking and subzone("Splithoof Hold")
Follow the path up |goto Thousand Needles 54.68,44.78 < 20 |only if walking
talk Dorn Plainstalker##2986
|tip Inside the small cave.
accept Test of Faith##1149 |goto Thousand Needles 53.94,41.48
step
Watch the dialogue
Teleport to the Plateau |goto Thousand Needles 26.43,31.29 < 30 |noway |c |q 1149
step
Return to Dorn Plainstalker |complete subzone("The Weathered Nook") |goto Thousand Needles 26.43,32.41 |q 1149
|tip Jump off the cliff.
|tip You won't die.
step
talk Dorn Plainstalker##2986
|tip Inside the small cave.
turnin Test of Faith##1149 |goto Thousand Needles 53.94,41.48
step
click Alien Egg
|tip Large white egg.
|tip Multiple locations.
collect Alien Egg##12467 |q 4821/1 |goto Thousand Needles/0 56.35,50.36
|mapmarker Thousand Needles/0 52.33,55.21
step
Ride an elevator up |goto Thousand Needles 47.02,48.32 < 50 |only if walking
talk Hagar Lightninghoof##10539
turnin Alien Egg##4821 |goto Thousand Needles 44.64,50.29
accept Serpent Wild##4865 |goto Thousand Needles 44.64,50.29
step
talk Cliffwatcher Longhorn##10537
|tip Walks around.
turnin Pacify the Centaur##4841 |goto Thousand Needles 45.65,50.80
step
talk Rau Cliffrunner##4722
|tip Inside the building.
turnin The Sacred Flame##1197 |goto Thousand Needles 46.14,51.71
step
Follow the path up |goto Thousand Needles 14.75,32.83 < 20 |only if walking and not subzone("Highperch")
click Highperch Wyvern Egg+
|tip Large eggs.
collect 10 Highperch Wyvern Egg##12356 |q 4767/1 |goto Thousand Needles 12.60,35.00
|mapmarker Thousand Needles/0 9.40,35.50
|mapmarker Thousand Needles/0 10.10,39.40
|mapmarker Thousand Needles/0 10.20,32.90
|mapmarker Thousand Needles/0 10.70,30.90
|mapmarker Thousand Needles/0 11.60,37.20
|mapmarker Thousand Needles/0 13.40,38.50
step
Follow the path up |goto Thousand Needles 13.17,39.51 < 20 |only if walking
talk Pao'ka Swiftmountain##10427
|tip Escort quest.
|tip Wait until he respawns, if missing.
|tip Avoid {o}Heartrazor{}.
|tip {o}Level 32 elite{} wyvern.
|tip Skip if he's nearby.
accept Homeward Bound##4770 |goto Thousand Needles 17.89,40.57 |noautoaccept inparty
step
Watch the dialogue
|tip Follow and protect {o}Pao'ka Swiftmountain{}.
|tip Clear the path of enemies, as much as possible.
|tip Group of {o}3 wyverns{} ambush you in the wide open area.
|tip Attack the one {o}nearest the Highperch exit{}.
|tip Ignore the others, they should disappear.
Escort Pao'ka Swiftmountain to Safety |q 4770/1 |goto Thousand Needles 15.16,32.67
stickystart "Accept_Assassination_Plot"
step
map Thousand Needles
path	follow strict;		loop on;	ants curved;	dist 30;	markers none;		arrow hide
path	18.21,26.63		17.18,29.62		14.66,30.75		11.08,22.60
path	13.29,19.81		14.83,19.58		17.19,18.92		18.71,24.78
kill Steelsnap##4548
|tip Brown hyena with 2 hyena guards.
|tip Walks a large path.
collect Steelsnap's Rib##5837 |q 1131/1
Spawns at [Thousand Needles/0 17.32,22.20] |noway
step
talk Motega Firemane##10428
|tip Walks around.
turnin Homeward Bound##4770 |goto Thousand Needles 21.55,32.35 |only if haveq(4770) or completedq(4770)
turnin Serpent Wild##4865 |goto Thousand Needles 21.55,32.35
accept Sacred Fire##5062 |goto Thousand Needles 21.55,32.35
step
label "Accept_Assassination_Plot"
map Thousand Needles
path follow strictbounce;	loop off;	ants curved;	dist 30;	markers none;		arrow hide
path	18.31,22.24	18.58,25.92	20.01,27.62	21.87,30.19	23.27,31.50
path	25.29,34.22	26.34,34.21	29.31,34.01	31.42,30.78	32.92,30.73
path	35.08,28.16	36.95,29.43	38.71,31.64	39.36,33.09
kill Galak Messenger##10617
|tip Black centaur.
|tip Runs a large path.
|tip Skip if don't want to search. |notinsticky
|tip Can wait for him to come to you. |notinsticky
collect Assassination Note##12564 |n
use Assassination Note##12564
accept Assassination Plot##4881
Spawns at [Thousand Needles/0 39.60,32.80] |noway
step
kill Galak Messenger##10617
|tip Black centaur.
|tip Runs a large path.
|tip Passes here twice in his route.
|tip Wait for him.
collect Assassination Note##12564 |n
use Assassination Note##12564
accept Assassination Plot##4881 |goto Thousand Needles 31.50,29.96
Spawns at [Thousand Needles/0 39.60,32.80] |noway
step
talk Kanati Greycloud##10638
turnin Assassination Plot##4881 |goto Thousand Needles/0 21.21,32.10
accept Protect Kanati Greycloud##4966 |goto Thousand Needles/0 21.21,32.10
|tip Three enemies attack.
step
Kill the enemies that attack
Protect Kanati Greycloud |q 4966/1 |goto Thousand Needles/0 21.21,32.10
step
talk Kanati Greycloud##10638
turnin Protect Kanati Greycloud##4966 |goto Thousand Needles/0 21.21,32.10
step
click Incendia Agave+
|tip Spikey plants.
|tip Underwater and around the water edge.
collect 10 Incendia Agave##12732 |q 5062/1 |goto Thousand Needles/0 33.60,34.10
|mapmarker Thousand Needles/0 35.00,33.30
|mapmarker Thousand Needles/0 35.70,36.20
|mapmarker Thousand Needles/0 37.80,38.10
step
talk Melor Stonehoof##3441
turnin Steelsnap##1131 |goto Thunder Bluff 61.53,80.90
step
talk Magatha Grimtotem##4046
|tip Inside the tent.
turnin Sacred Fire##5062 |goto Thunder Bluff 69.86,30.92
accept Arikara##5088 |goto Thunder Bluff 69.86,30.92
step
talk Kym Wildmane##3036
|tip Inside the building.
Train Abilities |trainer Kym Wildmane##3036 |goto Thunder Bluff/0 77.13,29.80 |q 4767
|only if Druid
step
Enter the cave |goto Thunder Bluff 29.81,29.82 < 15 |walk |only if not subzone("The Pools of Vision")
talk Malakai Cross##3045
|tip Inside the cave.
Train Abilities |trainer Malakai Cross##3045 |goto Thunder Bluff/0 24.55,22.58 |q 4767
|only if Priest
step
Enter the cave |goto Thunder Bluff 29.81,29.82 < 15 |walk |only if not subzone("The Pools of Vision")
talk Archmage Shymm##3047
|tip Inside the cave.
Train Abilities |trainer Archmage Shymm##3047 |goto Thunder Bluff/0 22.76,14.52 |q 4767
|only if Mage
step
talk Siln Skychaser##3030
|tip Inside the building.
Train Abilities |trainer Siln Skychaser##3030 |goto Thunder Bluff/0 22.83,21.10 |q 4767
|only if Shaman
step
talk Urek Thunderhorn##3040
|tip Inside the building.
Train Abilities |trainer Urek Thunderhorn##3040 |goto Thunder Bluff/0 59.11,86.86 |q 4767
|only if Hunter
step
talk Ker Ragetotem##3043
|tip Inside the building.
Train Abilities |trainer Ker Ragetotem##3043 |goto Thunder Bluff/0 57.58,85.52 |q 4767
|only if Warrior
step
talk Ormok##3328
|tip Inside the Cleft of Shadow.
Train Abilities |trainer Ormok##3328 |goto Orgrimmar/0 43.91,54.63 |q 4767
|only if Rogue
step
talk Mirket##3325
|tip Inside the Cleft of Shadow.
Train Abilities |trainer Mirket##3325 |goto Orgrimmar/0 48.62,46.95 |q 4767
|only if Warlock
step
talk Kurgul##5815
|tip Buy available Grimoires.
|tip Inside the Cleft of Shadow.
Train Demon Abilities |vendor Kurgul##5815 |goto Orgrimmar 47.52,46.72 |q 4767
|only if Warlock
step
Leave the cave |goto Thunder Bluff 29.81,29.82 < 15 |walk |only if subzone("The Pools of Vision")
talk Elu##10377
|tip Walks around.
turnin Wind Rider##4767 |goto Thousand Needles 44.93,48.93
step
talk Cliffwatcher Longhorn##10537
|tip Walks around.
accept Grimtotem Spying##5064 |goto Thousand Needles 45.65,50.80
step
click Wanted Poster - Arnak Grimtotem
accept Wanted - Arnak Grimtotem##5147 |goto Thousand Needles 46.00,50.84
step
Follow the path up and across the hanging bridges |goto Thousand Needles 31.24,36.88 < 20 |only if walking
Cross the hanging bridge |goto Thousand Needles 34.99,31.50 < 15 |only if walking
click Document Chest
|tip Up on the plateau.
|tip Inside the building.
collect Secret Note #3##12768 |q 5064/3 |goto Thousand Needles 39.32,41.52
step
click Document Chest
|tip Up on the plateau.
|tip Inside the building.
collect Secret Note #2##12766 |q 5064/2 |goto Thousand Needles 33.78,39.97
step
click Document Chest
|tip Up on the plateau.
collect Secret Note #1##12765 |q 5064/1 |goto Thousand Needles 31.80,32.59
step
Cross the hanging bridge |goto Thousand Needles/0 35.68,31.00 < 15 |only if walking
click Sacred Fire of Life
|tip Up on the plateau.
|tip You will be attacked.
|tip {o}Level 28 elite{} enemy.
|tip Pretty easy to kill solo.
|tip May need help.
Light the Sacred Fire of Life |q 5088/2 |goto Thousand Needles/0 38.02,35.32
step
kill Arikara##10882
|tip {o}Level 28 elite{} enemy.
|tip Pretty easy to kill solo.
|tip May need help.
|tip Skip if too difficult.
|tip Up on the plateau.
collect Arikara Serpent Skin##12925 |q 5088/1 |goto Thousand Needles/0 38.29,35.54
step
kill Arnak Grimtotem##10896
|tip Up on the plateau.
|tip Walks around.
collect Arnak's Hoof##12884 |q 5147/1 |goto Thousand Needles/0 38.08,26.85
step
talk Lakota Windsong##10646
|tip Escort quest.
|tip Wait until she respawns, if missing.
accept Free at Last##4904 |goto Thousand Needles/0 37.99,26.59 |noautoaccept inparty
step
Watch the dialogue
|tip Follow and protect Lakota Windsong.
|tip Kill enemies to clear a path for her.
|tip {o}Two enemies{} appear on each plateau.
|tip Skip if too difficult.
Escort Lakota Windsong from the Darkcloud Pinnacle |q 4904/1 |goto Thousand Needles/0 30.97,37.09
step
talk Motega Firemane##10428
|tip Walks around.
turnin Arikara##5088 |goto Thousand Needles/0 21.55,32.35
step
talk Wizlo Bearingshiner##10941
accept Hypercapacitor Gizmo##5151 |goto Thousand Needles/0 21.43,32.55
step
click Panther Cage
kill Enraged Panther##10992
|tip {o}Level 30 elite{} enemy.
|tip May need help.
|tip Skip if too difficult.
collect Hypercapacitor Gizmo##12946 |q 5151/1 |goto Thousand Needles/0 22.79,24.54
step
talk Wizlo Bearingshiner##10941
turnin Hypercapacitor Gizmo##5151 |goto Thousand Needles/0 21.43,32.55
|only if haveq(5151) or completedq(5151)
step
Abandon the {y}Hypercapacitor Gizmo{} Quest |complete not haveq(5151)
|tip Not needed.
|only if haveq(5151) and not completedq(5151)
step
Follow the road up into Feralas |goto Thousand Needles/0 7.68,10.62 < 40 |only if walking and zone("Thousand Needles")
talk Shyn##8020
|tip Careful, higher level enemies.
|tip If you die, resurrect at Camp Mojache.
fpath Camp Mojache |goto Feralas 75.45,44.36
step
talk Cliffwatcher Longhorn##10537
|tip Walks around.
turnin Grimtotem Spying##5064 |goto Thousand Needles 45.65,50.80
turnin Wanted - Arnak Grimtotem##5147 |goto Thousand Needles 45.65,50.80
step
talk Innkeeper Abeqwa##11116
|tip Inside the building.
home Freewind Post |goto Thousand Needles 46.07,51.51 |q 1184 |future
step
talk Thalia Amberhide##10645
|tip Inside the building.
turnin Free at Last##4904 |goto Thousand Needles 45.97,51.61
step
talk Kravel Koalbeard##4452
accept Wharfmaster Dizzywig##1111 |goto Thousand Needles 77.79,77.27
step
talk Bulkrek Ragefist##7824
|tip Careful, higher level enemies.
fpath Gadgetzan |goto Tanaris 51.60,25.44
step
talk Korran##3428
accept The Swarm Grows##1145 |goto The Barrens 51.07,29.63
step
talk Wharfmaster Dizzywig##3453
turnin Wharfmaster Dizzywig##1111 |goto The Barrens 63.35,38.45
accept Parts for Kravel##1112 |goto The Barrens 63.35,38.45
step
talk Klannoc Macleod##6236
turnin The Islander##1718 |goto The Barrens 68.62,49.17
accept The Affray##1719 |goto The Barrens 68.62,49.17
|only if Warrior
step
kill Affray Challenger##6240+
|tip Step on the grate to start the fight.
kill Big Will##6238 |q 1719/1 |goto The Barrens 68.61,48.72
|tip Appears after killing {o}six challengers{}.
|only if Warrior
step
talk Klannoc Macleod##6236
turnin The Affray##1719 |goto The Barrens 68.62,49.17
|only if Warrior
step
talk Ormok##3328
|tip Inside the Cleft of Shadow.
Train Abilities |trainer Ormok##3328 |goto Orgrimmar/0 43.91,54.63 |q 1145
|only if Rogue
step
talk Mirket##3325
|tip Inside the Cleft of Shadow.
Train Abilities |trainer Mirket##3325 |goto Orgrimmar/0 48.62,46.95 |q 1145
|only if Warlock
step
talk Kurgul##5815
|tip Buy available Grimoires.
|tip Inside the Cleft of Shadow.
Train Demon Abilities |vendor Kurgul##5815 |goto Orgrimmar 47.52,46.72 |q 1145
|only if Warlock
step
talk Searn Firewarder##5892
|tip Inside the building.
accept Call of Air##1531 |goto Orgrimmar 37.96,37.73
|only if Shaman
step
talk Kardris Dreamseeker##3344
|tip Inside the building.
Train Abilities |trainer Kardris Dreamseeker##3344 |goto Orgrimmar/0 38.80,36.38 |q 1145
|only if Shaman
step
talk Belgrom Rockmaul##4485
turnin The Swarm Grows##1145 |goto Orgrimmar 75.23,34.23
accept The Swarm Grows##1146 |goto Orgrimmar 75.23,34.23
step
talk Grezz Ragefist##3353
|tip Inside the building.
Train Abilities |trainer Grezz Ragefist##3353 |goto Orgrimmar/0 79.78,31.42 |q 1112
|only if Warrior
step
talk Ormak Grimshot##3352
|tip Top of the building.
Train Abilities |trainer Ormak Grimshot##3352 |goto Orgrimmar/0 66.06,18.54 |q 1112
|only if Hunter
step
talk Ur'kyo##6018
|tip Inside the building.
Train Abilities |trainer Ur'kyo##6018 |goto Orgrimmar/0 35.59,87.80 |q 1112
|only if Priest
step
talk Loganaar##12042
Train Abilities |trainer Loganaar##12042 |goto Moonglade/0 52.53,40.57 |q 1112
|only if Druid
step
Jump up and follow the path behind the tree |goto Silverpine Forest 42.03,40.66 < 7 |only if walking
use Water Sapta##6637
kill Corrupt Water Spirit##5897+
collect Corrupt Manifestation's Bracers##7812 |q 63/1 |goto Silverpine Forest 38.28,44.56
|only if Shaman
step
click Brazier of Everfount
turnin Call of Water##63 |goto Silverpine Forest 38.28,44.56
accept Call of Water##100 |goto Silverpine Forest 38.28,44.56
|only if Shaman
step
Watch the dialogue
talk Minor Manifestation of Water##5895
turnin Call of Water##100 |goto Silverpine Forest 38.75,44.62
accept Call of Water##96 |goto Silverpine Forest 38.75,44.62
|only if Shaman
step
Follow the path up |goto Thousand Needles 54.67,44.77 < 20 |only if walking
talk Prate Cloudseer##5905
turnin Call of Air##1531 |goto Thousand Needles 53.54,42.65
|only if Shaman
step
talk Moktar Krin##4483
turnin The Swarm Grows##1146 |goto Thousand Needles 67.58,63.94
accept The Swarm Grows##1147 |goto Thousand Needles 67.58,63.94
step
talk Kravel Koalbeard##4452
turnin Parts for Kravel##1112 |goto Thousand Needles 77.79,77.27
step
Watch the dialogue
talk Kravel Koalbeard##4452
accept Rocket Car Parts##1110 |goto Thousand Needles 77.79,77.27
accept Delivery to the Gnomes##1114 |goto Thousand Needles 77.79,77.27
step
talk Fizzle Brassbolts##4454
turnin Delivery to the Gnomes##1114 |goto Thousand Needles 78.06,77.13
accept Salt Flat Venom##1104 |goto Thousand Needles 78.06,77.13
step
talk Kravel Koalbeard##4452
accept The Rumormonger##1115 |goto Thousand Needles 77.79,77.27
step
talk Wizzle Brassbolts##4453
accept Hardened Shells##1105 |goto Thousand Needles 78.14,77.12
step
talk Pozzik##4630
accept Load Lightening##1176 |goto Thousand Needles 80.18,75.89
step
talk Trackmaster Zherin##4629
accept A Bump in the Road##1175 |goto Thousand Needles 81.64,77.95
step
_NOTE:_
During the Next Steps
|tip Careful, insect enemies call for help.
|tip Try to pull them away from other enemies.
Click Here to Continue |confirm |q 1148 |future
stickystart "Kill_Silithid_Searchers"
stickystart "Accept_Parts_Of_The_Swarm"
stickystart "Kill_Silithid_Hive_Drones"
stickystart "Collect_Silithid_Items"
step
kill 5 Silithid Invader##4131 |q 1147/3 |goto Thousand Needles 66.32,86.18
|tip Shared spawns with Hive Drones.
|tip Inside the cave.
|mapmarker Thousand Needles/0 63.40,85.80
step
label "Kill_Silithid_Searchers"
Leave the cave |goto Thousand Needles 66.32,86.18 < 15 |walk |only if subzone("The Rustmaul Dig Site") and indoors()
kill 5 Silithid Searcher##4130 |q 1147/1 |goto Thousand Needles 70.20,82.60
|tip Outside the cave. |notinsticky
|mapmarker Thousand Needles/0 67.40,81.40
|mapmarker Thousand Needles/0 67.40,84.60
|mapmarker Thousand Needles/0 68.40,87.60
|mapmarker Thousand Needles/0 71.40,85.80
step
label "Accept_Parts_Of_The_Swarm"
kill Silithid Searcher##4130, Silithid Hive Drone##4133, Silithid Ravager##4132, Silithid Invader##4131
|tip Inside and outside the cave. |notinsticky
collect Cracked Silithid Carapace##5877 |n
use Cracked Silithid Carapace##5877
accept Parts of the Swarm##1148 |goto Thousand Needles 70.20,82.60
|mapmarker Thousand Needles/0 67.40,81.40
|mapmarker Thousand Needles/0 67.40,84.60
|mapmarker Thousand Needles/0 68.40,87.60
|mapmarker Thousand Needles/0 71.40,85.80
|only if (haveq(1147) or completedq(1147)) or (haveq(1148) or completedq(1148))
step
label "Kill_Silithid_Hive_Drones"
kill 5 Silithid Hive Drone##4133 |q 1147/2 |goto Thousand Needles 70.00,84.60
|tip Inside and outside the cave. |notinsticky
|mapmarker Thousand Needles/0 67.00,83.80
|mapmarker Thousand Needles/0 67.80,88.00
|mapmarker Thousand Needles/0 69.20,81.60
|mapmarker Thousand Needles/0 66.32,86.18
step
label "Collect_Silithid_Items"
Leave the cave |goto Thousand Needles 66.32,86.18 < 15 |walk |only if subzone("The Rustmaul Dig Site") and indoors()
kill Silithid Searcher##4130, Silithid Hive Drone##4133, Silithid Ravager##4132, Silithid Invader##4131
|tip Inside and outside the cave. |notinsticky
collect Silithid Heart##5855 |q 1148/1 |goto Thousand Needles 70.20,82.60
collect 3 Intact Silithid Carapace##5853 |q 1148/3 |goto Thousand Needles 70.20,82.60
collect 5 Silithid Talon##5854 |q 1148/2 |goto Thousand Needles 70.20,82.60
|mapmarker Thousand Needles/0 67.40,81.40
|mapmarker Thousand Needles/0 67.40,84.60
|mapmarker Thousand Needles/0 68.40,87.60
|mapmarker Thousand Needles/0 71.40,85.80
|mapmarker Thousand Needles/0 66.32,86.18
|only if haveq(1148) or completedq(1148)
stickystart "Collect_Hardened_Tortoise_Shells"
stickystart "Collect_Salty_Scorpid_Venom"
stickystart "Kill_Saltstone_Basilisks"
stickystart "Collect_Rocket_Car_Parts"
stickystart "Kill_Saltstone_Crystalhides"
step
Leave the cave |goto Thousand Needles 66.32,86.18 < 15 |walk |only if subzone("The Rustmaul Dig Site") and indoors()
kill 6 Saltstone Gazer##4150 |q 1175/3 |goto Thousand Needles 77.40,88.00
|mapmarker Thousand Needles/0 75.40,82.80
|mapmarker Thousand Needles/0 75.40,85.40
|mapmarker Thousand Needles/0 75.40,87.80
|mapmarker Thousand Needles/0 75.40,89.80
|mapmarker Thousand Needles/0 76.40,91.60
|mapmarker Thousand Needles/0 77.40,82.40
|mapmarker Thousand Needles/0 78.40,84.40
|mapmarker Thousand Needles/0 78.40,90.20
|mapmarker Thousand Needles/0 79.60,87.00
|mapmarker Thousand Needles/0 80.60,89.20
|mapmarker Thousand Needles/0 81.80,87.20
step
kill Salt Flats Scavenger##4154, Salt Flats Vulture##4158
|tip Vultures.
|tip Mostly here, otherwise uncommon.
collect 10 Hollow Vulture Bone##5848 |q 1176/1 |goto Thousand Needles 88.00,66.00
|tip Revisit this location while working on other quests.
|mapmarker Thousand Needles/0 69.40,63.60
|mapmarker Thousand Needles/0 70.20,66.40
|mapmarker Thousand Needles/0 71.80,71.20
|mapmarker Thousand Needles/0 73.20,58.20
|mapmarker Thousand Needles/0 73.40,60.20
|mapmarker Thousand Needles/0 79.80,55.20
|mapmarker Thousand Needles/0 81.40,53.80
|mapmarker Thousand Needles/0 82.40,63.80
|mapmarker Thousand Needles/0 83.40,56.20
|mapmarker Thousand Needles/0 83.80,60.40
step
label "Collect_Hardened_Tortoise_Shells"
kill Sparkleshell Borer##4144, Sparkleshell Tortoise##4142, Sparkleshell Snapper##4143
|tip Turtles.
collect 9 Hardened Tortoise Shell##5795 |q 1105/1 |goto Thousand Needles 82.80,55.20
|mapmarker Thousand Needles/0 69.20,59.80
|mapmarker Thousand Needles/0 69.40,64.40
|mapmarker Thousand Needles/0 69.80,67.40
|mapmarker Thousand Needles/0 71.20,54.40
|mapmarker Thousand Needles/0 72.20,57.40
|mapmarker Thousand Needles/0 72.40,61.40
|mapmarker Thousand Needles/0 74.20,53.40
|mapmarker Thousand Needles/0 74.80,64.80
|mapmarker Thousand Needles/0 75.20,57.60
|mapmarker Thousand Needles/0 77.20,54.40
|mapmarker Thousand Needles/0 72.00,69.40
|mapmarker Thousand Needles/0 76.00,67.80
|mapmarker Thousand Needles/0 76.20,71.80
|mapmarker Thousand Needles/0 78.20,52.20
|mapmarker Thousand Needles/0 79.00,56.60
|mapmarker Thousand Needles/0 79.40,70.20
|mapmarker Thousand Needles/0 81.20,52.40
|mapmarker Thousand Needles/0 82.40,61.00
|mapmarker Thousand Needles/0 82.40,70.20
|mapmarker Thousand Needles/0 82.80,66.40
|mapmarker Thousand Needles/0 83.60,58.20
|mapmarker Thousand Needles/0 85.40,62.40
|mapmarker Thousand Needles/0 86.60,57.40
|mapmarker Thousand Needles/0 86.80,70.00
step
label "Collect_Salty_Scorpid_Venom"
kill Scorpid Reaver##4140, Scorpid Terror##4139
|tip Scorpions.
collect 6 Salty Scorpid Venom##5794 |q 1104/1 |goto Thousand Needles 82.40,60.00
|mapmarker Thousand Needles/0 69.20,60.20
|mapmarker Thousand Needles/0 69.40,63.40
|mapmarker Thousand Needles/0 69.40,67.00
|mapmarker Thousand Needles/0 70.40,57.40
|mapmarker Thousand Needles/0 70.40,72.40
|mapmarker Thousand Needles/0 71.20,54.40
|mapmarker Thousand Needles/0 72.00,69.60
|mapmarker Thousand Needles/0 72.40,61.40
|mapmarker Thousand Needles/0 72.60,65.80
|mapmarker Thousand Needles/0 72.60,74.80
|mapmarker Thousand Needles/0 73.40,56.80
|mapmarker Thousand Needles/0 74.20,53.20
|mapmarker Thousand Needles/0 75.40,68.40
|mapmarker Thousand Needles/0 75.60,62.20
|mapmarker Thousand Needles/0 75.60,65.40
|mapmarker Thousand Needles/0 76.40,58.80
|mapmarker Thousand Needles/0 76.40,71.80
|mapmarker Thousand Needles/0 77.20,53.00
|mapmarker Thousand Needles/0 78.40,66.80
|mapmarker Thousand Needles/0 79.00,56.60
|mapmarker Thousand Needles/0 79.40,50.60
|mapmarker Thousand Needles/0 79.40,69.80
|mapmarker Thousand Needles/0 82.40,64.00
|mapmarker Thousand Needles/0 82.40,69.20
|mapmarker Thousand Needles/0 83.60,57.20
|mapmarker Thousand Needles/0 84.20,66.80
|mapmarker Thousand Needles/0 85.40,59.80
|mapmarker Thousand Needles/0 86.40,63.80
step
label "Kill_Saltstone_Basilisks"
kill 10 Saltstone Basilisk##4147 |q 1175/1 |goto Thousand Needles 78.40,59.00
|mapmarker Thousand Needles/0 68.40,61.00
|mapmarker Thousand Needles/0 69.20,64.00
|mapmarker Thousand Needles/0 69.40,68.40
|mapmarker Thousand Needles/0 70.40,57.40
|mapmarker Thousand Needles/0 71.20,54.40
|mapmarker Thousand Needles/0 72.00,66.20
|mapmarker Thousand Needles/0 72.20,70.60
|mapmarker Thousand Needles/0 72.40,61.40
|mapmarker Thousand Needles/0 73.40,56.80
|mapmarker Thousand Needles/0 74.40,53.40
|mapmarker Thousand Needles/0 75.00,64.60
|mapmarker Thousand Needles/0 75.60,61.40
|mapmarker Thousand Needles/0 76.60,56.40
|mapmarker Thousand Needles/0 77.40,51.40
|mapmarker Thousand Needles/0 78.40,63.80
|mapmarker Thousand Needles/0 79.60,66.80
step
label "Kill_Saltstone_Crystalhides"
kill 10 Saltstone Crystalhide##4151 |q 1175/2 |goto Thousand Needles 78.80,86.80
|mapmarker Thousand Needles/0 70.40,76.20
|mapmarker Thousand Needles/0 72.00,69.20
|mapmarker Thousand Needles/0 72.40,80.80
|mapmarker Thousand Needles/0 73.60,76.40
|mapmarker Thousand Needles/0 74.80,65.60
|mapmarker Thousand Needles/0 75.40,68.60
|mapmarker Thousand Needles/0 75.40,86.00
|mapmarker Thousand Needles/0 75.40,89.80
|mapmarker Thousand Needles/0 76.20,60.40
|mapmarker Thousand Needles/0 76.20,72.60
|mapmarker Thousand Needles/0 77.80,65.60
|mapmarker Thousand Needles/0 78.20,83.40
|mapmarker Thousand Needles/0 78.40,52.40
|mapmarker Thousand Needles/0 78.40,90.00
|mapmarker Thousand Needles/0 79.00,56.60
|mapmarker Thousand Needles/0 79.20,61.60
|mapmarker Thousand Needles/0 79.20,69.40
|mapmarker Thousand Needles/0 82.40,61.20
|mapmarker Thousand Needles/0 82.40,65.80
|mapmarker Thousand Needles/0 82.40,69.40
|mapmarker Thousand Needles/0 83.20,73.40
|mapmarker Thousand Needles/0 83.40,57.40
|mapmarker Thousand Needles/0 83.40,76.80
|mapmarker Thousand Needles/0 85.40,60.20
|mapmarker Thousand Needles/0 86.40,63.60
|mapmarker Thousand Needles/0 86.40,69.20
|mapmarker Thousand Needles/0 86.40,74.40
|mapmarker Thousand Needles/0 86.60,57.40
|mapmarker Thousand Needles/0 87.40,77.80
step
label "Collect_Rocket_Car_Parts"
click Rocket Car Rubble##19868+
|tip Various machine parts.
|tip Throughout the Shimmering Flats.
collect 30 Rocket Car Parts##5798 |q 1110/1 |goto Thousand Needles 83.00,64.60
|mapmarker Thousand Needles/0 69.60,61.20
|mapmarker Thousand Needles/0 69.90,78.50
|mapmarker Thousand Needles/0 70.20,57.20
|mapmarker Thousand Needles/0 71.40,64.40
|mapmarker Thousand Needles/0 71.70,68.50
|mapmarker Thousand Needles/0 72.40,72.30
|mapmarker Thousand Needles/0 72.50,80.70
|mapmarker Thousand Needles/0 73.10,59.70
|mapmarker Thousand Needles/0 75.40,56.30
|mapmarker Thousand Needles/0 76.20,86.90
|mapmarker Thousand Needles/0 77.00,53.20
|mapmarker Thousand Needles/0 78.40,90.10
|mapmarker Thousand Needles/0 79.40,85.50
|mapmarker Thousand Needles/0 79.50,59.10
|mapmarker Thousand Needles/0 80.70,54.20
|mapmarker Thousand Needles/0 81.90,87.30
|mapmarker Thousand Needles/0 85.30,58.40
|mapmarker Thousand Needles/0 85.60,61.40
|mapmarker Thousand Needles/0 86.20,74.40
|mapmarker Thousand Needles/0 86.60,64.70
|mapmarker Thousand Needles/0 86.90,67.90
|mapmarker Thousand Needles/0 87.50,71.20
|mapmarker Thousand Needles/0 88.00,79.80
step
talk Moktar Krin##4483
turnin The Swarm Grows##1147 |goto Thousand Needles 67.58,63.94
step
talk Kravel Koalbeard##4452
turnin Rocket Car Parts##1110 |goto Thousand Needles 77.79,77.27
accept Hemet Nesingwary Jr.##5762 |goto Thousand Needles 77.79,77.27
step
talk Fizzle Brassbolts##4454
turnin Salt Flat Venom##1104 |goto Thousand Needles 78.06,77.13
step
talk Wizzle Brassbolts##4453
turnin Hardened Shells##1105 |goto Thousand Needles 78.14,77.12
step
talk Pozzik##4630
turnin Load Lightening##1176 |goto Thousand Needles 80.18,75.88
accept Goblin Sponsorship##1178 |goto Thousand Needles 80.18,75.88
step
talk Trackmaster Zherin##4629
turnin A Bump in the Road##1175 |goto Thousand Needles 81.63,77.95
step
talk Loganaar##12042
Train Abilities |trainer Loganaar##12042 |goto Moonglade/0 52.53,40.57 |q 1148
|only if Druid
step
talk Korran##3428
turnin Parts of the Swarm##1148 |goto The Barrens 51.07,29.63
accept Parts of the Swarm##1184 |goto The Barrens 51.07,29.63
step
_Destroy This Item:_
|tip Not needed.
trash Cracked Silithid Carapace##5877
step
talk Enyo##5883
|tip Inside the building.
Train Abilities |trainer Enyo##5883 |goto Orgrimmar/0 38.79,85.65 |q 1184
|only if Mage
step
talk Ur'kyo##6018
|tip Inside the building.
Train Abilities |trainer Ur'kyo##6018 |goto Orgrimmar/0 35.59,87.80 |q 1184
|only if Priest
step
talk Ormok##3328
|tip Inside the Cleft of Shadow.
Train Abilities |trainer Ormok##3328 |goto Orgrimmar/0 43.91,54.63 |q 1184
|only if Rogue
step
talk Mirket##3325
|tip Inside the Cleft of Shadow.
Train Abilities |trainer Mirket##3325 |goto Orgrimmar/0 48.62,46.95 |q 1184
|only if Warlock
step
talk Kurgul##5815
|tip Buy available Grimoires.
|tip Inside the Cleft of Shadow.
Train Demon Abilities |vendor Kurgul##5815 |goto Orgrimmar 47.52,46.72 |q 1184
|only if Warlock
step
talk Kardris Dreamseeker##3344
|tip Inside the building.
Train Abilities |trainer Kardris Dreamseeker##3344 |goto Orgrimmar/0 38.80,36.38 |q 1184
|only if Shaman
step
talk Belgrom Rockmaul##4485
turnin Parts of the Swarm##1184 |goto Orgrimmar 75.23,34.24
step
talk Grezz Ragefist##3353
|tip Inside the building.
Train Abilities |trainer Grezz Ragefist##3353 |goto Orgrimmar/0 79.78,31.42 |q 1178
|only if Warrior
step
talk Ormak Grimshot##3352
|tip Top of the building.
Train Abilities |trainer Ormak Grimshot##3352 |goto Orgrimmar/0 66.06,18.54 |q 1178
|only if Hunter
step
talk Zandalarian Emissary##15076
Select _"Emissary, may you grant me protection from the blood moon?"_ |gossip 120797
Gain the Zandalari Ward Buff |havebuff  Zandalari Ward##436351 |goto Durotar/0 50.65,12.64
|tip Protects you from the {o}PVP event{} in Stranglethorn Vale.
|only if GQ.IsClassicSoD
step
talk Thysta##1387
fpath Grom'gol |goto Stranglethorn Vale 32.54,29.35
step
talk Innkeeper Gryshka##6929
|tip Inside the building.
home Orgrimmar |goto Orgrimmar 54.09,68.42 |q 600 |future
step
talk Gazlowe##3391
|tip Upstairs inside the building.
turnin Goblin Sponsorship##1178 |goto The Barrens 62.68,36.23
accept Goblin Sponsorship##1180 |goto The Barrens 62.68,36.23
step
talk Islen Waterseer##5901
turnin Call of Water##96 |goto The Barrens 65.83,43.78
|only if Shaman
]])
GoatQuest:RegisterGuide("Leveling Guides\\Stranglethorn Vale (35-38)",{
image=GQ.IMAGESDIR.."Stranglethorn Vale",
next="Leveling Guides\\Dustwallow Marsh (38-40)",
},[[
step
talk Wharfmaster Lozgil##4631
turnin Goblin Sponsorship##1180 |goto Stranglethorn Vale 26.34,73.56
accept Goblin Sponsorship##1181 |goto Stranglethorn Vale 26.34,73.56
step
talk Drizzlik##2495
|tip Upper level of the docks.
|tip Inside the building.
accept Supply and Demand##575 |goto Stranglethorn Vale 28.29,77.59
step
talk Crank Fizzlebub##2498
|tip {o}Bottom floor{} inside the building.
accept Singing Blue Shards##605 |goto Stranglethorn Vale 27.12,77.21
step
talk Krazek##773
|tip {o}Top floor{} inside the building.
turnin The Rumormonger##1115 |goto Stranglethorn Vale 26.94,77.21
accept Investigate the Camp##201 |goto Stranglethorn Vale 26.95,77.21
step
talk Kebok##737
|tip {o}Top floor{} inside the building.
accept Bloodscalp Ears##189 |goto Stranglethorn Vale 27.00,77.12
accept Hostile Takeover##213 |goto Stranglethorn Vale 27.00,77.12
step
talk Baron Revilgaz##2496
|tip Up on the balcony of the building.
turnin Goblin Sponsorship##1181 |goto Stranglethorn Vale 27.23,76.87
accept Goblin Sponsorship##1182 |goto Stranglethorn Vale 27.23,76.87
step
talk Gringer##2858
|tip Up on the balcony of the building.
fpath Booty Bay |goto Stranglethorn Vale 26.87,77.10
step
talk Aelthalyste##4606
turnin Devouring Plague##5644 |goto Undercity/0 49.26,17.12
|only if Scourge Priest
step
talk Commander Aggro'gosh##2464
|tip Walks around.
accept The Defense of Grom'gol##568 |goto Stranglethorn Vale 32.17,28.90
step
talk Nimboya##2497
accept Hunt for Yenniku##581 |goto Stranglethorn Vale 32.16,27.73
step
talk Kin'weelay##2519
accept Bloody Bone Necklaces##596 |goto Stranglethorn Vale 32.27,27.71
step
talk Uthok##1149
|tip Long questing session soon.
Buy Extra Ammo |vendor Uthok##1149 |goto Stranglethorn Vale/0 31.56,27.96 |q 5762
|only if Hunter
step
Locate the Hunters' Camp |q 201/1 |goto Stranglethorn Vale 35.55,10.55
step
talk Hemet Nesingwary Jr.##715
turnin Hemet Nesingwary Jr.##5762 |goto Stranglethorn Vale 35.66,10.81
step
talk Barnil Stonepot##716
accept Welcome to the Jungle##583 |goto Stranglethorn Vale 35.66,10.53
step
talk Hemet Nesingwary Jr.##715
turnin Welcome to the Jungle##583 |goto Stranglethorn Vale 35.66,10.81
accept Raptor Mastery##194 |goto Stranglethorn Vale 35.66,10.81
step
talk Ajeck Rouack##717
accept Tiger Mastery##185 |goto Stranglethorn Vale 35.61,10.62
step
talk Sir S. J. Erlgadin##718
accept Panther Mastery##190 |goto Stranglethorn Vale 35.55,10.55
stickystart "Kill_Young_Panthers"
stickystart "Collect_Large_River_Crocolisk_Skins"
step
kill 10 Young Stranglethorn Tiger##681 |q 185/1 |goto Stranglethorn Vale 33.80,13.00
|mapmarker Stranglethorn Vale/0 30.40,7.40
|mapmarker Stranglethorn Vale/0 31.40,10.00
|mapmarker Stranglethorn Vale/0 33.40,10.80
|mapmarker Stranglethorn Vale/0 34.60,17.60
|mapmarker Stranglethorn Vale/0 35.20,15.00
|mapmarker Stranglethorn Vale/0 37.20,11.40
|mapmarker Stranglethorn Vale/0 37.20,14.20
step
talk Ajeck Rouack##717
turnin Tiger Mastery##185 |goto Stranglethorn Vale 35.61,10.62
accept Tiger Mastery##186 |goto Stranglethorn Vale 35.61,10.62
step
label "Kill_Young_Panthers"
kill 10 Young Panther##683 |q 190/1 |goto Stranglethorn Vale 40.00,10.00
|mapmarker Stranglethorn Vale/0 41.40,13.00
|mapmarker Stranglethorn Vale/0 41.20,8.20
|mapmarker Stranglethorn Vale/0 42.00,10.80
stickystop "Collect_Large_River_Crocolisk_Skins"
step
kill Crystal Spine Basilisk##689+
|tip Skip once no more to kill.
|tip Can finish later.
collect 10 Singing Crystal Shard##3918 |q 605/1 |goto Stranglethorn Vale/0 47.60,9.00
|mapmarker Stranglethorn Vale/0 46.60,5.80
|mapmarker Stranglethorn Vale/0 48.80,10.20
step
kill 10 Stranglethorn Tiger##682 |q 186/1 |goto Stranglethorn Vale/0 46.40,12.80
|mapmarker Stranglethorn Vale/0 42.80,15.00
|mapmarker Stranglethorn Vale/0 44.00,13.40
|mapmarker Stranglethorn Vale/0 46.00,15.20
|mapmarker Stranglethorn Vale/0 46.40,17.60
step
label "Collect_Large_River_Crocolisk_Skins"
kill River Crocolisk##1150+
|tip Along the river.
collect 2 Large River Crocolisk Skin##4053 |q 575/1 |goto Stranglethorn Vale/0 36.80,10.40
|mapmarker Stranglethorn Vale/0 32.40,8.80
|mapmarker Stranglethorn Vale/0 34.60,8.00
|mapmarker Stranglethorn Vale/0 34.60,10.40
|mapmarker Stranglethorn Vale/0 39.40,14.40
|mapmarker Stranglethorn Vale/0 40.60,12.20
step
talk Ajeck Rouack##717
turnin Tiger Mastery##186 |goto Stranglethorn Vale 35.61,10.62
accept Tiger Mastery##187 |goto Stranglethorn Vale 35.61,10.62
step
talk Sir S. J. Erlgadin##718
turnin Panther Mastery##190 |goto Stranglethorn Vale 35.55,10.55
accept Panther Mastery##191 |goto Stranglethorn Vale 35.55,10.55
stickystart "Collect_Bloodscalp_Items"
step
kill 10 Elder Stranglethorn Tiger##1085 |q 187/1 |goto Stranglethorn Vale 31.40,14.20
|mapmarker Stranglethorn Vale/0 30.40,17.40
|mapmarker Stranglethorn Vale/0 31.40,19.80
|mapmarker Stranglethorn Vale/0 33.00,17.40
|mapmarker Stranglethorn Vale/0 35.00,19.00
stickystop "Collect_Bloodscalp_Items"
stickystart "Kill_Stranglethorn_Raptors"
step
kill 10 Panther##736 |q 191/1 |goto Stranglethorn Vale 28.20,16.40
|mapmarker Stranglethorn Vale/0 27.80,9.60
|mapmarker Stranglethorn Vale/0 28.20,12.00
|mapmarker Stranglethorn Vale/0 30.40,15.20
|mapmarker Stranglethorn Vale/0 29.40,8.20
|mapmarker Stranglethorn Vale/0 30.40,12.80
|mapmarker Stranglethorn Vale/0 30.40,10.60
step
label "Kill_Stranglethorn_Raptors"
kill 10 Stranglethorn Raptor##685 |q 194/1 |goto Stranglethorn Vale 27.40,14.40
|mapmarker Stranglethorn Vale/0 23.40,15.40
|mapmarker Stranglethorn Vale/0 25.60,16.00
|mapmarker Stranglethorn Vale/0 26.80,17.60
step
kill Crystal Spine Basilisk##689+
collect 10 Singing Crystal Shard##3918 |q 605/1 |goto Stranglethorn Vale/0 24.00,17.60
|mapmarker Stranglethorn Vale/0 27.60,18.40
step
label "Collect_Bloodscalp_Items"
kill Bloodscalp Axe Thrower##694, Bloodscalp Beastmaster##699, Bloodscalp Berserker##597, Bloodscalp Headhunter##671, Bloodscalp Hunter##595, Bloodscalp Mystic##701, Bloodscalp Scavenger##702, Bloodscalp Scout##588, Bloodscalp Shaman##697, Bloodscalp Warrior##587, Bloodscalp Witch Doctor##660
|tip Trolls.
collect 9 Bloodscalp Tusk##3901 |q 581/1 |goto Stranglethorn Vale 28.80,19.20
collect 15 Bloodscalp Ear##1519 |q 189/1 |goto Stranglethorn Vale 28.80,19.20
collect 25 Bloody Bone Necklace##3915 |q 596/1 |goto Stranglethorn Vale 28.80,19.20
|mapmarker Stranglethorn Vale/0 30.20,16.40
|mapmarker Stranglethorn Vale/0 30.80,19.00
|mapmarker Stranglethorn Vale/0 33.20,15.80
|mapmarker Stranglethorn Vale/0 33.40,13.80
|mapmarker Stranglethorn Vale/0 31.57,12.41
step
talk Hemet Nesingwary Jr.##715
turnin Raptor Mastery##194 |goto Stranglethorn Vale 35.66,10.81
accept Raptor Mastery##195 |goto Stranglethorn Vale 35.66,10.81
step
talk Ajeck Rouack##717
turnin Tiger Mastery##187 |goto Stranglethorn Vale 35.62,10.62
accept Tiger Mastery##188 |goto Stranglethorn Vale 35.62,10.62
step
talk Sir S. J. Erlgadin##718
turnin Panther Mastery##191 |goto Stranglethorn Vale 35.55,10.55
accept Panther Mastery##192 |goto Stranglethorn Vale 35.55,10.55
step
kill Sin'Dall##729
|tip Orange tiger.
|tip Usually on top of the hill.
|tip Walks around.
collect Paw of Sin'Dall##3879 |q 188/1 |goto Stranglethorn Vale 32.21,17.39
|mapmarker Stranglethorn Vale/0 32.00,17.40
|mapmarker Stranglethorn Vale/0 32.60,17.20
|mapmarker Stranglethorn Vale/0 32.60,18.80
|mapmarker Stranglethorn Vale/0 32.80,18.00
step
kill 10 Lashtail Raptor##686 |q 195/1 |goto Stranglethorn Vale 32.20,20.40
kill 15 Lashtail Raptor##686 |q 568/1 |goto Stranglethorn Vale 32.20,20.40
|mapmarker Stranglethorn Vale/0 30.20,24.60
|mapmarker Stranglethorn Vale/0 30.40,21.40
|mapmarker Stranglethorn Vale/0 37.20,23.60
|mapmarker Stranglethorn Vale/0 32.40,23.00
|mapmarker Stranglethorn Vale/0 33.80,25.40
|mapmarker Stranglethorn Vale/0 35.00,27.60
|mapmarker Stranglethorn Vale/0 36.00,25.40
|mapmarker Stranglethorn Vale/0 37.40,19.80
|mapmarker Stranglethorn Vale/0 37.40,27.40
|mapmarker Stranglethorn Vale/0 38.80,21.40
|mapmarker Stranglethorn Vale/0 39.60,19.00
step
talk Nimboya##2497
turnin Hunt for Yenniku##581 |goto Stranglethorn Vale 32.16,27.72
accept Headhunting##582 |goto Stranglethorn Vale 32.16,27.72
step
talk Kin'weelay##2519
turnin Bloody Bone Necklaces##596 |goto Stranglethorn Vale/0 32.27,27.71
accept The Vile Reef##629 |goto Stranglethorn Vale 32.27,27.71
step
talk Commander Aggro'gosh##2464
|tip Walks around.
turnin The Defense of Grom'gol##568 |goto Stranglethorn Vale 32.17,28.91
accept The Defense of Grom'gol##569 |goto Stranglethorn Vale 32.17,28.91
step
talk Kragg##1404
Train Abilities |trainer Kragg##1404 |goto Stranglethorn Vale/0 31.24,28.68 |q 582
|only if Hunter
step
talk Zudd##3624
Train Pet Abilities |trainer Zudd##3624 |goto Stranglethorn Vale/0 31.11,28.94 |q 582
|only if Hunter
step
click Gri'lek the Wanderer
|tip Avoid the {o}elite murlocs{}.
|tip Underwater.
collect Tablet Shard##4094 |q 629/1 |goto Stranglethorn Vale 24.75,22.84
step
kill Bloodscalp Headhunter##671+
collect 20 Shrunken Head##1532 |q 582/1 |goto Stranglethorn Vale 20.80,15.20
|mapmarker Stranglethorn Vale/0 19.20,12.20
|mapmarker Stranglethorn Vale/0 21.40,10.20
|mapmarker Stranglethorn Vale/0 22.60,8.40
|mapmarker Stranglethorn Vale/0 23.40,10.80
|mapmarker Stranglethorn Vale/0 24.60,9.00
step
talk Nimboya##2497
turnin Headhunting##582 |goto Stranglethorn Vale 32.16,27.73
step
_Destroy These Items:_
|tip Not needed.
trash Shrunken Head##1532
step
talk Kin'weelay##2519
turnin The Vile Reef##629 |goto Stranglethorn Vale 32.27,27.70
step
talk Far Seer Mok'thardin##2465
accept Mok'thardin's Enchantment##570 |goto Stranglethorn Vale 32.12,29.24
step
kill 5 Mosh'Ogg Witch Doctor##1144 |q 569/2 |goto Stranglethorn Vale 35.40,30.80
kill 10 Mosh'Ogg Brute##1142 |q 569/1 |goto Stranglethorn Vale 35.40,30.80
|mapmarker Stranglethorn Vale/0 37.00,28.40
|mapmarker Stranglethorn Vale/0 37.40,31.40
stickystart "Collect_Shadowmaw_Claws"
stickystart "Kill_Shadowmaw_Panthers"
step
kill Stranglethorn Tigress##772+
|tip Shared spawns with panthers.
|tip Shadowmaw Panthers are {o}stealthed{}.
collect Pristine Tigress Fang##3839|q 570/2 |goto Stranglethorn Vale 37.40,32.80
|mapmarker Stranglethorn Vale/0 35.00,36.80
|mapmarker Stranglethorn Vale/0 36.60,39.60
|mapmarker Stranglethorn Vale/0 37.20,45.40
|mapmarker Stranglethorn Vale/0 38.20,37.00
|mapmarker Stranglethorn Vale/0 39.40,42.40
|mapmarker Stranglethorn Vale/0 40.40,31.40
|mapmarker Stranglethorn Vale/0 41.20,34.80
|mapmarker Stranglethorn Vale/0 41.20,38.20
|mapmarker Stranglethorn Vale/0 45.60,25.00
|mapmarker Stranglethorn Vale/0 46.40,22.00
|mapmarker Stranglethorn Vale/0 47.00,27.80
|mapmarker Stranglethorn Vale/0 49.20,20.00
|mapmarker Stranglethorn Vale/0 49.20,23.20
step
label "Collect_Shadowmaw_Claws"
kill Shadowmaw Panther##684+
|tip Stealthed. |notinsticky
|tip Shared spawns with tigers. |notinsticky
collect 8 Shadowmaw Claw##3838 |q 570/1 |goto Stranglethorn Vale 37.40,32.80
|mapmarker Stranglethorn Vale/0 35.00,36.80
|mapmarker Stranglethorn Vale/0 36.60,39.60
|mapmarker Stranglethorn Vale/0 37.20,45.40
|mapmarker Stranglethorn Vale/0 38.20,37.00
|mapmarker Stranglethorn Vale/0 39.40,42.40
|mapmarker Stranglethorn Vale/0 40.40,31.40
|mapmarker Stranglethorn Vale/0 41.20,34.80
|mapmarker Stranglethorn Vale/0 41.20,38.20
|mapmarker Stranglethorn Vale/0 45.60,25.00
|mapmarker Stranglethorn Vale/0 46.40,22.00
|mapmarker Stranglethorn Vale/0 47.00,27.80
|mapmarker Stranglethorn Vale/0 49.20,20.00
|mapmarker Stranglethorn Vale/0 49.20,23.20
step
label "Kill_Shadowmaw_Panthers"
kill 10 Shadowmaw Panther##684 |q 192/1 |goto Stranglethorn Vale 37.40,32.80
|tip Stealthed. |notinsticky
|mapmarker Stranglethorn Vale/0 35.00,36.80
|mapmarker Stranglethorn Vale/0 36.60,39.60
|mapmarker Stranglethorn Vale/0 37.20,45.40
|mapmarker Stranglethorn Vale/0 38.20,37.00
|mapmarker Stranglethorn Vale/0 39.40,42.40
|mapmarker Stranglethorn Vale/0 40.40,31.40
|mapmarker Stranglethorn Vale/0 41.20,34.80
|mapmarker Stranglethorn Vale/0 41.20,38.20
|mapmarker Stranglethorn Vale/0 45.60,25.00
|mapmarker Stranglethorn Vale/0 46.40,22.00
|mapmarker Stranglethorn Vale/0 47.00,27.80
|mapmarker Stranglethorn Vale/0 49.20,20.00
|mapmarker Stranglethorn Vale/0 49.20,23.20
stickystart "Collect_Tumbled_Crystals"
step
kill Foreman Cozzle##4723
|tip Top of the platform.
|tip Inside the building.
collect Cozzle's Key##5851 |goto Stranglethorn Vale 42.65,18.35 |q 1182
step
click Cozzle's Footlocker
|tip Inside the building.
collect Fuel Regulator Blueprints##5852 |q 1182/1 |goto Stranglethorn Vale 43.34,20.34
step
label "Collect_Tumbled_Crystals"
kill Venture Co. Geologist##1096+
collect 8 Tumbled Crystal##4106 |q 213/1 |goto Stranglethorn Vale/0 44.20,20.20
|mapmarker Stranglethorn Vale/0 42.40,18.40
|mapmarker Stranglethorn Vale/0 42.40,22.00
|mapmarker Stranglethorn Vale/0 43.40,16.20
|mapmarker Stranglethorn Vale/0 44.40,23.60
|mapmarker Stranglethorn Vale/0 45.20,18.00
|mapmarker Stranglethorn Vale/0 46.00,21.80
|mapmarker Stranglethorn Vale/0 47.60,19.00
step
talk Hemet Nesingwary Jr.##715
turnin Raptor Mastery##195 |goto Stranglethorn Vale 35.66,10.81
accept Raptor Mastery##196 |goto Stranglethorn Vale 35.66,10.81
step
talk Ajeck Rouack##717
turnin Tiger Mastery##188 |goto Stranglethorn Vale 35.62,10.62
step
talk Sir S. J. Erlgadin##718
turnin Panther Mastery##192 |goto Stranglethorn Vale 35.56,10.55
accept Panther Mastery##193 |goto Stranglethorn Vale 35.56,10.55
step
talk Commander Aggro'gosh##2464
|tip Walks around.
turnin The Defense of Grom'gol##569 |goto Stranglethorn Vale 32.17,28.90
step
talk Far Seer Mok'thardin##2465
turnin Mok'thardin's Enchantment##570 |goto Stranglethorn Vale 32.12,29.24
step
talk Kragg##1404
Train Abilities |trainer Kragg##1404 |goto Stranglethorn Vale/0 31.24,28.68 |q 1182
|only if Hunter
step
talk Baron Revilgaz##2496
|tip Up on the balcony of the building.
turnin Goblin Sponsorship##1182 |goto Stranglethorn Vale 27.23,76.87
step
talk Kebok##737
|tip {o}Top floor{} inside the building.
turnin Bloodscalp Ears##189 |goto Stranglethorn Vale 27.00,77.13
turnin Hostile Takeover##213 |goto Stranglethorn Vale 27.00,77.13
step
talk Krazek##773
|tip {o}Top floor{} inside the building.
turnin Investigate the Camp##201 |goto Stranglethorn Vale 26.94,77.21
step
talk Crank Fizzlebub##2498
|tip {o}Bottom floor{} inside the building
turnin Singing Blue Shards##605 |goto Stranglethorn Vale 27.12,77.21
step
talk Drizzlik##2495
|tip Upper level of the docks.
|tip Inside the building.
turnin Supply and Demand##575 |goto Stranglethorn Vale 28.29,77.59
step
talk Loganaar##12042
Train Abilities |trainer Loganaar##12042 |goto Moonglade/0 52.53,40.57 |q 1268 |future
|only if Druid
]])
GoatQuest:RegisterGuide("Leveling Guides\\Dustwallow Marsh (38-40)",{
image=GQ.IMAGESDIR.."Dustwallow Marsh",
next="Leveling Guides\\Stranglethorn Vale (40-41)",
},[[
step
talk Enyo##5883
|tip Inside the building.
Train Abilities |trainer Enyo##5883 |goto Orgrimmar/0 38.79,85.65 |q 1268 |future
|only if Mage
step
talk Auctioneer Thathung##8673
|tip Buy from the Auction House, if possible.
collect Moonsteel Broadsword##3853 |goto Orgrimmar 55.69,62.86 |q 1203 |future
|tip Needed for quest soon.
|only if level <= 40
step
talk Ur'kyo##6018
|tip Inside the building.
Train Abilities |trainer Ur'kyo##6018 |goto Orgrimmar/0 35.59,87.80 |q 1203 |future
|only if Priest
step
talk Ormok##3328
|tip Inside the Cleft of Shadow.
Train Abilities |trainer Ormok##3328 |goto Orgrimmar/0 43.91,54.63 |q 1203 |future
|only if Rogue
step
talk Mirket##3325
|tip Inside the Cleft of Shadow.
Train Abilities |trainer Mirket##3325 |goto Orgrimmar/0 48.62,46.95 |q 1203 |future
|only if Warlock
step
talk Kurgul##5815
|tip Buy available Grimoires.
|tip Inside the Cleft of Shadow.
Train Demon Abilities |vendor Kurgul##5815 |goto Orgrimmar 47.52,46.72 |q 1203 |future
|only if Warlock
step
talk Kardris Dreamseeker##3344
|tip Inside the building.
Train Abilities |trainer Kardris Dreamseeker##3344 |goto Orgrimmar/0 38.80,36.38 |q 1203 |future
|only if Shaman
step
Run up the stairs |goto Orgrimmar/0 56.35,56.89 < 15 |only if walking
talk Xen'to##3400
|tip Inside the building.
buy 3 Soothing Spices##3713 |goto Orgrimmar/0 57.57,52.89 |q 1218 |future
|tip Don't vendor them.
step
talk Grezz Ragefist##3353
|tip Inside the building.
Train Abilities |trainer Grezz Ragefist##3353 |goto Orgrimmar/0 79.78,31.42 |q 1268 |future
|only if Warrior
step
talk Nazeer Bloodpike##4791
accept Theramore Spies##1201 |goto Dustwallow Marsh 35.21,30.66
step
click Hoofprints##21015
accept Suspicious Hoofprints##1268 |goto Dustwallow Marsh 29.70,47.63
step
click Theramore Guard Badge
|tip Tiny metal object.
accept Lieutenant Paval Reethe##1269 |goto Dustwallow Marsh 29.83,48.24
step
click Black Shield
accept The Black Shield##1251 |goto Dustwallow Marsh 29.63,48.59
step
talk Mudcrush Durtfeet##4503
accept Hungry!##1177 |goto Dustwallow Marsh 35.15,38.25
step
talk Krog##4926
turnin Suspicious Hoofprints##1268 |goto Dustwallow Marsh 36.42,31.88
turnin Lieutenant Paval Reethe##1269 |goto Dustwallow Marsh 36.42,31.88
turnin The Black Shield##1251 |goto Dustwallow Marsh 36.42,31.88
accept The Black Shield##1321 |goto Dustwallow Marsh 36.42,31.88
step
talk Do'gol##5087
turnin The Black Shield##1321 |goto Dustwallow Marsh 36.53,30.80
accept The Black Shield##1322 |goto Dustwallow Marsh 36.53,30.80
stickystart "Collect_Acidic_Venom_Sacs"
step
kill 9 Theramore Infiltrator##4834 |q 1201/1 |goto Dustwallow Marsh/0 38.00,33.40
|tip Stealthed.
|mapmarker Dustwallow Marsh/0 36.40,35.40
|mapmarker Dustwallow Marsh/0 37.00,38.40
|mapmarker Dustwallow Marsh/0 37.40,27.00
|mapmarker Dustwallow Marsh/0 38.00,23.60
|mapmarker Dustwallow Marsh/0 38.00,33.40
|mapmarker Dustwallow Marsh/0 38.80,22.60
|mapmarker Dustwallow Marsh/0 40.40,33.40
|mapmarker Dustwallow Marsh/0 40.40,35.20
|mapmarker Dustwallow Marsh/0 41.60,25.40
|mapmarker Dustwallow Marsh/0 42.80,31.20
|mapmarker Dustwallow Marsh/0 44.00,27.20
|mapmarker Dustwallow Marsh/0 37.95,37.53
step
talk "Stinky" Ignatz##4880
|tip Escort quest.
|tip Wait until he respawns, if missing.
|tip Kill nearby raptors first.
accept Stinky's Escape##1270 |goto Dustwallow Marsh 46.88,17.52 |noautoaccept inparty
step
Watch the dialogue
|tip Follow and protect "Stinky" Ignatz.
Help Stinky Find Bogbean Leaves |q 1270/1 |goto Dustwallow Marsh 48.86,24.65
step
talk "Swamp Eye" Jarl##4792
accept Soothing Spices##1218 |goto Dustwallow Marsh/0 55.44,26.27
step
talk "Swamp Eye" Jarl##4792
turnin Soothing Spices##1218 |goto Dustwallow Marsh/0 55.44,26.27
step
click Loose Dirt
accept The Lost Report##1238 |goto Dustwallow Marsh/0 55.44,25.93
step
kill Mirefin Coastrunner##4362, Mirefin Murloc##4359, Mirefin Muckdweller##4361, Mirefin Puddlejumper##4358, Mirefin Warrior##4360, Mirefin Oracle##4363
|tip Murlocs.
collect 12 Mirefin Head##5847 |q 1177/1 |goto Dustwallow Marsh 57.83,21.37
|mapmarker Dustwallow Marsh/0 53.40,15.80
|mapmarker Dustwallow Marsh/0 54.00,12.20
|mapmarker Dustwallow Marsh/0 55.80,20.40
|mapmarker Dustwallow Marsh/0 58.60,17.60
|mapmarker Dustwallow Marsh/0 59.00,15.40
|mapmarker Dustwallow Marsh/0 59.40,9.80
|mapmarker Dustwallow Marsh/0 62.80,8.00
|mapmarker Dustwallow Marsh/0 63.40,17.60
|mapmarker Dustwallow Marsh/0 63.80,28.00
step
talk "Swamp Eye" Jarl##4792
accept Jarl Needs Eyes##1206 |goto Dustwallow Marsh 55.44,26.27
step
label "Collect_Acidic_Venom_Sacs"
kill Darkfang Spider##4413, Darkfang Lurker##4411
|tip Orange spiders.
|tip Careful, {o}Darkfang Lurkers{} are stealthed.
|tip Shared spawns with raptors.
collect 6 Acidic Venom Sac##5959 |q 1322/1 |goto Dustwallow Marsh/0 51.60,25.20
|mapmarker Dustwallow Marsh/0 35.80,15.00
|mapmarker Dustwallow Marsh/0 37.00,12.20
|mapmarker Dustwallow Marsh/0 37.40,25.80
|mapmarker Dustwallow Marsh/0 38.00,18.60
|mapmarker Dustwallow Marsh/0 39.20,14.40
|mapmarker Dustwallow Marsh/0 39.40,22.40
|mapmarker Dustwallow Marsh/0 41.00,25.60
|mapmarker Dustwallow Marsh/0 41.20,17.40
|mapmarker Dustwallow Marsh/0 41.60,11.40
|mapmarker Dustwallow Marsh/0 43.20,23.40
|mapmarker Dustwallow Marsh/0 44.20,15.40
|mapmarker Dustwallow Marsh/0 44.80,28.60
|mapmarker Dustwallow Marsh/0 47.80,25.40
|mapmarker Dustwallow Marsh/0 49.40,28.40
|mapmarker Dustwallow Marsh/0 51.00,21.40
|mapmarker Dustwallow Marsh/0 51.20,15.40
|mapmarker Dustwallow Marsh/0 51.80,32.20
|mapmarker Dustwallow Marsh/0 54.60,21.60
|mapmarker Dustwallow Marsh/0 56.00,30.60
|mapmarker Dustwallow Marsh/0 57.40,27.60
|mapmarker Dustwallow Marsh/0 57.40,34.20
|mapmarker Dustwallow Marsh/0 57.40,37.60
|mapmarker Dustwallow Marsh/0 59.60,23.60
|mapmarker Dustwallow Marsh/0 60.20,29.40
|mapmarker Dustwallow Marsh/0 61.40,36.60
|mapmarker Dustwallow Marsh/0 63.20,40.20
step
kill Darkmist Silkspinner##4379, Darkmist Spider##4376, Darkmist Widow##4380, Darkmist Recluse##4378
|tip Spiders.
|tip Inside and outside the mine.
collect 40 Unpopped Darkmist Eye##5884 |q 1206/1 |goto Dustwallow Marsh 33.22,22.76
|mapmarker Dustwallow Marsh/0 30.40,21.80
|mapmarker Dustwallow Marsh/0 33.40,20.40
|mapmarker Dustwallow Marsh/0 34.40,25.60
|mapmarker Dustwallow Marsh/0 35.60,20.80
step
Leave the mine |goto Dustwallow Marsh 33.22,22.76 < 15 |walk |only if subzone("Darkmist Cavern") and indoors()
talk Nazeer Bloodpike##4791
turnin Theramore Spies##1201 |goto Dustwallow Marsh 35.21,30.66
accept The Theramore Docks##1202 |goto Dustwallow Marsh/0 35.21,30.66 |only if not hardcore()
turnin The Lost Report##1238 |goto Dustwallow Marsh 35.21,30.66
step
talk Do'gol##5087
turnin The Black Shield##1322 |goto Dustwallow Marsh 36.53,30.80
accept The Black Shield##1323 |goto Dustwallow Marsh 36.53,30.80
step
talk Krog##4926
turnin The Black Shield##1323 |goto Dustwallow Marsh 36.42,31.88
step
talk Ogron##4983
|tip Escort quest.
|tip Wait until he respawns, if missing.
accept Questioning Reethe##1273 |goto Dustwallow Marsh 40.96,36.69 |noautoaccept inparty
step
Watch the dialogue
|tip Follow and protect Ogron.
Kill the enemies that attack
|tip Group of 4 enemies.
|tip Let Ogron tank some of them.
|tip Ogron {o}must survive{}.
|tip May need help.
Question Reethe with Ogron |q 1273/1 |goto Dustwallow Marsh 42.65,38.07
step
talk Mudcrush Durtfeet##4503
turnin Hungry!##1177 |goto Dustwallow Marsh 35.15,38.25
step
talk Krog##4926
turnin Questioning Reethe##1273 |goto Dustwallow Marsh 36.42,31.88
accept The Black Shield##1276 |goto Dustwallow Marsh 36.42,31.88
step
talk "Swamp Eye" Jarl##4792
turnin Jarl Needs Eyes##1206 |goto Dustwallow Marsh 55.43,26.27
accept Jarl Needs a Blade##1203 |goto Dustwallow Marsh 55.44,26.27 |only if itemcount(3853) > 0
step
talk "Swamp Eye" Jarl##4792
turnin Jarl Needs a Blade##1203 |goto Dustwallow Marsh 55.44,26.27
|only if itemcount(3853) > 0
step
_Destroy These Items:_
|tip Not needed.
trash Unpopped Darkmist Eye##5884
step
click Loose Dirt
accept The Severed Head##1239 |goto Dustwallow Marsh 55.44,25.93
step
Kill enemies
|tip Helps reach level 40 after quest turnins.
|tip Higher level quests soon.
|tip Going to Orgrimmar soon.
|tip Good time to train abilities.
ding 39,78825 |goto Dustwallow Marsh 57.83,21.37 |only if hardcore()
ding 39,73700 |goto Dustwallow Marsh 57.83,21.37 |only if not hardcore()
|mapmarker Dustwallow Marsh/0 53.40,15.80
|mapmarker Dustwallow Marsh/0 54.00,12.20
|mapmarker Dustwallow Marsh/0 55.80,20.40
|mapmarker Dustwallow Marsh/0 58.60,17.60
|mapmarker Dustwallow Marsh/0 59.00,15.40
|mapmarker Dustwallow Marsh/0 59.40,9.80
|mapmarker Dustwallow Marsh/0 62.80,8.00
|mapmarker Dustwallow Marsh/0 63.40,17.60
|mapmarker Dustwallow Marsh/0 63.80,28.00
step
click Captain's Footlocker##20925
|tip Avoid {o}Theramore Isle{}.
|tip Underwater.
collect Captain's Documents##5882 |q 1202/1 |goto Dustwallow Marsh 71.53,51.18
|only if not hardcore()
step
Drown Yourself
|tip Fast travel.
Die on Purpose |complete isdead |goto Dustwallow Marsh 71.53,51.18 |q 1202
|only if not hardcore()
step
talk Spirit Healer##6491
Select _"Return me to life."_ |gossip 96031
Resurrect at the Spirit Healer |complete not isdead |goto Dustwallow Marsh/0 39.70,30.77 |q 1202 |zombiewalk
|only if not hardcore()
step
talk Nazeer Bloodpike##4791
turnin The Theramore Docks##1202 |goto Dustwallow Marsh/0 35.21,30.66 |only if not hardcore()
turnin The Severed Head##1239 |goto Dustwallow Marsh/0 35.21,30.66
accept The Troll Witchdoctor##1240 |goto Dustwallow Marsh/0 35.21,30.66
step
_NOTE:_
Stronger Ammo Available
|tip Buy level 40 ammo when restocking.
Click Here to Continue |confirm |q 1240
|only if Hunter
step
talk Kar Stormsinger##3690
Train Kodo Riding |learnspell Kodo Riding##18995 |goto Mulgore/0 47.65,58.47
Buy a mount from Harb Clawhoof nearby at [Mulgore/0 47.49,58.60]
|only if Tauren and discountgold('Thunder Bluff',500000)
step
talk Loganaar##12042
Train Abilities |trainer Loganaar##12042 |goto Moonglade/0 52.53,40.57 |q 1240
|only if Druid
step
talk Enyo##5883
|tip Inside the building.
Train Abilities |trainer Enyo##5883 |goto Orgrimmar/0 38.79,85.65 |q 1240
|only if Mage
step
talk Karus##3309
|tip Deposit into the bank.
|tip Inside the building.
bank Blackened Iron Shield##5919 |goto Orgrimmar/0 49.58,69.14 |q 1276
step
talk Ur'kyo##6018
|tip Inside the building.
Train Abilities |trainer Ur'kyo##6018 |goto Orgrimmar/0 35.59,87.80 |q 1240
|only if Priest
step
talk Ormok##3328
|tip Inside the Cleft of Shadow.
Train Abilities |trainer Ormok##3328 |goto Orgrimmar/0 43.91,54.63 |q 1240
|only if Rogue
step
talk Mirket##3325
|tip Inside the Cleft of Shadow.
Train Abilities |trainer Mirket##3325 |goto Orgrimmar/0 48.62,46.95 |q 1240
|only if Warlock
step
talk Kurgul##5815
|tip Buy available Grimoires.
|tip Inside the Cleft of Shadow.
Train Demon Abilities |vendor Kurgul##5815 |goto Orgrimmar 47.52,46.72 |q 1240
|only if Warlock
step
talk Zevrost##3326
|tip Inside the building.
|tip Inside the Cleft of Shadow.
accept Summon Felsteed##3631 |goto Orgrimmar 48.48,45.44
|only if Warlock
step
talk Kardris Dreamseeker##3344
|tip Inside the building.
Train Abilities |trainer Kardris Dreamseeker##3344 |goto Orgrimmar/0 38.80,36.38 |q 1240
|only if Shaman
step
talk Grezz Ragefist##3353
|tip Inside the building.
Train Abilities |trainer Grezz Ragefist##3353 |goto Orgrimmar/0 79.78,31.42 |q 1240
|only if Warrior
step
talk Ormak Grimshot##3352
|tip Top of the building.
Train Abilities |trainer Ormak Grimshot##3352 |goto Orgrimmar/0 66.06,18.54 |q 1240
|only if Hunter
step
talk Xao'tsu##10088
|tip Top of the building.
Train Pet Abilities |trainer Xao'tsu##10088 |goto Orgrimmar/0 66.33,14.82 |q 1240
|only if Hunter
step
talk Kildar##4752
Train Wolf Riding |learnspell Wolf Riding##825 |goto Orgrimmar/0 69.40,13.10
Buy a mount from Ogunaro Wolfrunner nearby at [Orgrimmar/0 69.38,12.26]
|only if Orc and discountgold('Orgrimmar',500000)
step
talk Auctioneer Thathung##8673
|tip Buy from the Auction House, if possible.
|tip Makes quests easier later.
|tip Inside the building.
collect Elixir of Water Breathing##5996	|goto Orgrimmar/0 55.69,62.86 |q 1424 |future	|only if not (Undead or Druid or Warlock or Shaman)
collect Shiny Fish Scales##17057	|goto Orgrimmar/0 55.69,62.86 |q 1424 |future	|only if Shaman
|only if not (Undead or Druid or Warlock)
step
talk Xar'Ti##7953
Train Raptor Riding |learnspell Raptor Riding##10861 |goto Durotar/0 55.28,75.49
Buy a mount from Zjolnir nearby at [Durotar/0 55.23,75.65]
|only if Troll and discountgold('Darkspear Trolls',500000)
step
talk Velma Warnam##4773
Train Undead Horsemanship |learnspell Undead Horsemanship##10906 |goto Tirisfal Glades/0 60.08,52.57
Buy a mount from Zachariah Post nearby at [Tirisfal Glades/0 59.87,52.68]
|only if Undead and discountgold('Undercity',500000)
]])
GoatQuest:RegisterGuide("Leveling Guides\\Stranglethorn Vale (40-41)",{
image=GQ.IMAGESDIR.."Stranglethorn Vale",
next="Leveling Guides\\Swamp of Sorrows (41-42)",
},[[
step
talk Strahad Farsan##6251
turninany Summon Felsteed##3631,4489 |goto The Barrens/0 62.63,35.50
accept Summon Felsteed##4490 |goto The Barrens/0 62.63,35.50
|only if Warlock
step
talk Strahad Farsan##6251
turnin Summon Felsteed##4490 |goto The Barrens/0 62.63,35.50
|only if Warlock
step
talk Mebok Mizzyrix##3446
turnin Stinky's Escape##1270 |goto The Barrens 62.37,37.62
step
talk Drizzlik##2495
|tip Upper level of the docks.
|tip Inside the building.
accept Some Assembly Required##577 |goto Stranglethorn Vale 28.29,77.59
step
talk Crank Fizzlebub##2498
|tip {o}Ground floor{} inside the building.
accept Venture Company Mining##600 |goto Stranglethorn Vale 27.12,77.21
step
talk Kebok##737
|tip {o}Top floor{} inside the building.
accept Skullsplitter Tusks##209 |goto Stranglethorn Vale 27.00,77.13
step
talk Far Seer Mok'thardin##2465
accept Mok'thardin's Enchantment##572 |goto Stranglethorn Vale 32.12,29.24
step
talk Nimboya##2497
accept Bloodscalp Clan Heads##584 |goto Stranglethorn Vale 32.16,27.72
step
talk Kin'weelay##2519
accept Split Bone Necklace##598 |goto Stranglethorn Vale 32.27,27.71
turnin The Troll Witchdoctor##1240 |goto Stranglethorn Vale 32.27,27.71
step
Run down the coast and follow the path up |goto Stranglethorn Vale 21.43,10.13 < 15 |only if walking
kill Nezzliok the Dire##1062
|tip Walks around.
collect Nezzliok's Head##3905 |q 584/2 |goto Stranglethorn Vale 23.52,9.53
step
kill Gan'zulah##1061
collect Gan'zulah's Head##3904 |q 584/1 |goto Stranglethorn Vale 23.44,8.12
step
click Bubbling Cauldron
turnin Bloodscalp Clan Heads##584 |goto Stranglethorn Vale 32.22,27.60
accept Speaking with Nezzliok##585 |goto Stranglethorn Vale 32.22,27.60
stickystart "Kill_Jungle_Stalkers"
step
kill Jungle Stalker##687+
collect 10 Jungle Stalker Feather##3863 |q 572/1 |goto Stranglethorn Vale 33.40,40.40
|mapmarker Stranglethorn Vale/0 23.00,49.80
|mapmarker Stranglethorn Vale/0 26.00,51.20
|mapmarker Stranglethorn Vale/0 27.40,43.20
|mapmarker Stranglethorn Vale/0 30.40,41.80
|mapmarker Stranglethorn Vale/0 31.80,37.80
|mapmarker Stranglethorn Vale/0 27.20,48.20
step
label "Kill_Jungle_Stalkers"
kill 10 Jungle Stalker##687 |q 196/1 |goto Stranglethorn Vale 33.40,40.40
|mapmarker Stranglethorn Vale/0 23.00,49.80
|mapmarker Stranglethorn Vale/0 26.00,51.20
|mapmarker Stranglethorn Vale/0 27.40,43.20
|mapmarker Stranglethorn Vale/0 30.40,41.80
|mapmarker Stranglethorn Vale/0 31.80,37.80
|mapmarker Stranglethorn Vale/0 27.20,48.20
step
kill Venture Co. Strip Miner##674, Venture Co. Tinkerer##677, Venture Co. Surveyor##676, Venture Co. Foreman##675
|tip Goblins.
collect 10 Singing Blue Crystal##3917 |q 600/1 |goto Stranglethorn Vale 41.40,44.60
|mapmarker Stranglethorn Vale/0 40.20,42.40
|mapmarker Stranglethorn Vale/0 40.40,43.80
|mapmarker Stranglethorn Vale/0 41.40,41.40
|mapmarker Stranglethorn Vale/0 42.00,46.00
stickystart "Collect_Skullsplitter_Tusks_And_Split_Bones_Necklaces"
step
click Ziata'jai Trophy Skulls
collect Ziata'jai Trophy##3907 |q 585/2 |goto Stranglethorn Vale 42.21,36.12
step
click Balia'mah Trophy Skulls
collect Balia'mah Trophy##3906 |q 585/1 |goto Stranglethorn Vale 46.14,32.33
step
click Zul'Mamwe Trophy Skulls
collect Zul'Mamwe Trophy##3908 |q 585/3 |goto Stranglethorn Vale 47.65,39.54
step
label "Collect_Skullsplitter_Tusks_And_Split_Bones_Necklaces"
kill Skullsplitter Warrior##667, Skullsplitter Axe Thrower##696, Skullsplitter Mystic##780, Skullsplitter Scout##782, Skullsplitter Beastmaster##784, Skullsplitter Witch Doctor##670, Skullsplitter Hunter##669, Skullsplitter Berserker##783, Skullsplitter Spiritchaser##672, Skullsplitter Headhunter##781
|tip Trolls.
collect 18 Skullsplitter Tusk##1524 |q 209/1 |goto Stranglethorn Vale 42.20,36.20
collect 25 Split Bone Necklace##3916 |q 598/1 |goto Stranglethorn Vale 42.20,36.20
|mapmarker Stranglethorn Vale/0 42.40,33.40
|mapmarker Stranglethorn Vale/0 43.40,39.40
|mapmarker Stranglethorn Vale/0 45.00,32.60
|mapmarker Stranglethorn Vale/0 46.00,38.00
|mapmarker Stranglethorn Vale/0 46.40,30.20
|mapmarker Stranglethorn Vale/0 46.40,40.60
|mapmarker Stranglethorn Vale/0 47.00,34.60
step
kill Bhag'thera##728
|tip Unstealthed {o}level 40 elite{} black panther.
|tip Walks around.
|tip Multiple locations.
|tip Skip if too difficult.
collect Fang of Bhag'thera##3876 |q 193/1 |goto Stranglethorn Vale 46.37,29.05
|mapmarker Stranglethorn Vale 49.60,24.03
|mapmarker Stranglethorn Vale 48.99,20.20
step
kill Snapjaw Crocolisk##1152+
|tip In and around the water.
collect 5 Snapjaw Crocolisk Skin##4104 |q 577/1 |goto Stranglethorn Vale 38.40,30.60
|mapmarker Stranglethorn Vale/0 40.40,25.00
|mapmarker Stranglethorn Vale/0 39.40,17.80
|mapmarker Stranglethorn Vale/0 39.40,21.40
|mapmarker Stranglethorn Vale/0 40.00,27.20
|mapmarker Stranglethorn Vale/0 41.80,15.80
|mapmarker Stranglethorn Vale/0 42.60,21.00
step
talk Far Seer Mok'thardin##2465
turnin Mok'thardin's Enchantment##572 |goto Stranglethorn Vale 32.12,29.24
step
talk Drizzlik##2495
|tip Upper level of the docks.
|tip Inside the building.
turnin Some Assembly Required##577 |goto Stranglethorn Vale 28.29,77.59
accept Excelsior##628 |goto Stranglethorn Vale 28.29,77.59
step
talk Crank Fizzlebub##2498
|tip {o}Ground floor{} inside the building.
turnin Venture Company Mining##600 |goto Stranglethorn Vale 27.12,77.21
step
talk Innkeeper Skindle##6807
|tip {o}Ground floor{} inside the building.
home Booty Bay |goto Stranglethorn Vale/0 27.04,77.31 |q 1707 |future
step
talk Krazek##773
|tip {o}Top floor{} inside the building.
accept Dream Dust in the Swamp##1116 |goto Stranglethorn Vale/0 26.94,77.21
step
talk Kebok##737
|tip {o}Top floor{} inside the building.
turnin Skullsplitter Tusks##209 |goto Stranglethorn Vale 27.00,77.13
step
talk Kin'weelay##2519
turnin Split Bone Necklace##598 |goto Stranglethorn Vale/0 32.27,27.71
step
click Bubbling Cauldron
turnin Speaking with Nezzliok##585 |goto Stranglethorn Vale 32.22,27.60
accept Marg Speaks##1261 |goto Stranglethorn Vale 32.22,27.60
step
talk Velma Warnam##4773
Train Undead Horsemanship |learnspell Undead Horsemanship##10906 |goto Tirisfal Glades/0 60.08,52.57
Buy a mount from Zachariah Post nearby at [Tirisfal Glades/0 59.87,52.68]
|only if Undead and discountgold('Undercity',500000)
step
kill Elder Saltwater Crocolisk##2635
|tip {o}Level 38 elite{} enemies.
|tip Shared spawns with Saltwater Crocolisks.
|tip Skip if too difficult.
collect Elder Crocolisk Skin##4105 |q 628/1 |goto Stranglethorn Vale 29.20,22.40
|mapmarker Stranglethorn Vale/0 21.40,15.80
|mapmarker Stranglethorn Vale/0 22.40,19.00
|mapmarker Stranglethorn Vale/0 25.20,19.20
|mapmarker Stranglethorn Vale/0 29.40,25.20
|mapmarker Stranglethorn Vale/0 33.60,32.60
step
talk Hemet Nesingwary##715
turnin Raptor Mastery##196 |goto Stranglethorn Vale 35.66,10.81
step
talk Sir S. J. Erlgadin##718
turnin Panther Mastery##193 |goto Stranglethorn Vale 35.56,10.55
|only if readyq(193) or completedq(193)
step
Abandon the {y}Panther Mastery{} Quest |complete not haveq(193)
|tip Not needed.
|only if haveq(193)
]])
GoatQuest:RegisterGuide("Leveling Guides\\Swamp of Sorrows (41-42)",{
image=GQ.IMAGESDIR.."Swamp of Sorrows",
next="Leveling Guides\\Tanaris & Dustwallow Marsh (42-44)",
},[[
step
talk Deathstalker Zraedus##5418
|tip Avoid Darkshire.
accept Nothing But The Truth##1372 |goto Duskwood 87.81,35.63
step
talk Apothecary Faustin##5414
turnin Nothing But The Truth##1372 |goto Duskwood 87.46,35.25
step
kill Adolescent Whelp##740, Dreaming Whelp##741
|tip Tiny flying dragons.
|tip Skip once no more to kill.
|tip Can finish later.
collect 10 Speck of Dream Dust##5803 |q 1116/1 |goto Swamp of Sorrows/0 12.40,57.40
|mapmarker Swamp of Sorrows/0 11.40,62.00
|mapmarker Swamp of Sorrows/0 11.40,65.40
|mapmarker Swamp of Sorrows/0 15.00,61.60
|mapmarker Swamp of Sorrows/0 15.00,66.60
|mapmarker Swamp of Sorrows/0 16.80,58.40
step
talk Dar##5591
|tip Inside the building.
accept Lack of Surplus##698 |goto Swamp of Sorrows 44.70,57.20
step
talk Breyk##6026
fpath Stonard |goto Swamp of Sorrows 46.07,54.82
step
talk Fel'zerul##1443
|tip Upstairs inside the building.
accept Pool of Tears##1424 |goto Swamp of Sorrows 47.93,54.80
stickystart "Collect_Unprepared_Sawtooth_Flanks"
step
path	follow strictbounce;	loop off;	ants curved;	dist 30;	markers none;		arrow hide
path	32.20,36.29	33.36,40.42	33.49,43.89	36.69,46.29	37.91,43.12
path	38.87,35.52	40.22,34.56	40.86,32.25	42.27,32.35	45.61,36.48
path	46.38,38.60	47.66,38.21	53.11,39.08	55.48,37.44	55.87,35.71
path	55.54,33.98
kill Noboru the Cudgel##5477
|tip Humanoid creature with 2 guards.
|tip Walks a large path.
collect Noboru's Cudgel##6196 |n
use Noboru's Cudgel##6196 |forceuse
accept Noboru the Cudgel##1392
stickystop "Collect_Unprepared_Sawtooth_Flanks"
step
talk Magtoor##1776
turnin Noboru the Cudgel##1392 |goto Swamp of Sorrows 25.99,31.40
accept Draenethyst Crystals##1389 |goto Swamp of Sorrows 25.99,31.40
stickystart "Collect_Draenethyst_Crystals"
stickystart "Collect_Unprepared_Sawtooth_Flanks"
step
talk Galen Goodward##5391
|tip Escort quest.
|tip Wait until he respawns, if missing.
|tip Kill nearby enemies to the {o}south{} first.
accept Galen's Escape##1393 |goto Swamp of Sorrows 65.41,18.23 |noautoaccept inparty
|only if not hardcore()
step
Watch the dialogue
|tip Follow and protect Galen Goodward.
Escort Galen Out of the Fallow Sanctuary |q 1393/1 |goto Swamp of Sorrows 53.05,29.64
|only if not hardcore()
step
label "Collect_Draenethyst_Crystals"
click Draenethyst Crystal##22550+
|tip Large blue crystals.
collect 6 Draenethyst Crystal##6071 |q 1389/1 |goto Swamp of Sorrows 55.00,30.20
|mapmarker Swamp of Sorrows/0 57.30,25.10
|mapmarker Swamp of Sorrows/0 60.10,22.40
|mapmarker Swamp of Sorrows/0 62.10,23.50
|mapmarker Swamp of Sorrows/0 64.80,22.40
|mapmarker Swamp of Sorrows/0 65.40,20.10
step
click Galen's Strongbox
turnin Galen's Escape##1393 |goto Swamp of Sorrows 47.81,39.76
|only if not hardcore()
step
label "Collect_Unprepared_Sawtooth_Flanks"
kill Sawtooth Crocolisk##1082+
collect 8 Unprepared Sawtooth Flank##6169 |q 698/1 |goto Swamp of Sorrows 46.40,41.20
|mapmarker Swamp of Sorrows/0 47.40,45.00
|mapmarker Swamp of Sorrows/0 48.20,38.40
|mapmarker Swamp of Sorrows/0 50.20,40.80
|mapmarker Swamp of Sorrows/0 52.20,37.40
|mapmarker Swamp of Sorrows/0 53.40,47.20
|mapmarker Swamp of Sorrows/0 53.60,43.00
|mapmarker Swamp of Sorrows/0 55.40,38.60
|mapmarker Swamp of Sorrows/0 55.80,52.20
|mapmarker Swamp of Sorrows/0 56.00,56.60
|mapmarker Swamp of Sorrows/0 56.40,34.40
|mapmarker Swamp of Sorrows/0 56.40,47.60
|mapmarker Swamp of Sorrows/0 59.40,34.40
|mapmarker Swamp of Sorrows/0 62.80,26.00
|mapmarker Swamp of Sorrows/0 63.60,32.20
|mapmarker Swamp of Sorrows/0 65.00,28.20
|mapmarker Swamp of Sorrows/0 69.40,15.40
|mapmarker Swamp of Sorrows/0 69.40,19.20
step
use Elixir of Water Breathing##5996 |only if itemcount(5996) > 0 and not hasbuff(7178) and not (Druid or Warlock or Shaman)
click Atal'ai Artifact##30854+
|tip Various small brown objects.
|tip Underwater.
|tip Reduce the {o}Ground Clutter{} setting to {o}1{}.
|tip In {o}System > Graphics{} game settings.
|tip Makes them easier to see.
collect 10 Atal'ai Artifact##6175 |q 1424/1 |goto Swamp of Sorrows 65.90,47.20
|mapmarker Swamp of Sorrows/0 61.40,57.80
|mapmarker Swamp of Sorrows/0 62.40,53.00
|mapmarker Swamp of Sorrows/0 65.40,43.50
|mapmarker Swamp of Sorrows/0 65.40,51.80
|mapmarker Swamp of Sorrows/0 65.40,55.40
|mapmarker Swamp of Sorrows/0 66.40,59.10
|mapmarker Swamp of Sorrows/0 67.30,45.90
|mapmarker Swamp of Sorrows/0 67.40,62.80
|mapmarker Swamp of Sorrows/0 68.00,61.20
|mapmarker Swamp of Sorrows/0 68.30,43.20
|mapmarker Swamp of Sorrows/0 70.30,65.00
|mapmarker Swamp of Sorrows/0 71.90,60.40
|mapmarker Swamp of Sorrows/0 73.70,64.70
|mapmarker Swamp of Sorrows/0 73.80,42.30
|mapmarker Swamp of Sorrows/0 74.20,47.90
|mapmarker Swamp of Sorrows/0 74.20,61.70
|mapmarker Swamp of Sorrows/0 74.80,55.90
|mapmarker Swamp of Sorrows/0 75.40,60.30
|mapmarker Swamp of Sorrows/0 76.20,63.40
|mapmarker Swamp of Sorrows/0 76.30,53.40
|mapmarker Swamp of Sorrows/0 78.20,48.60
step
talk Tok'Kar##5592
turnin Lack of Surplus##698 |goto Swamp of Sorrows 81.32,80.97
step
talk Fel'zerul##1443
|tip Upstairs inside the building.
turnin Pool of Tears##1424 |goto Swamp of Sorrows 47.93,54.79
step
talk Magtoor##1776
turnin Draenethyst Crystals##1389 |goto Swamp of Sorrows 25.99,31.40
step
kill Adolescent Whelp##740, Dreaming Whelp##741
|tip Tiny flying dragons.
collect 10 Speck of Dream Dust##5803 |q 1116/1 |goto Swamp of Sorrows/0 12.40,57.40
|mapmarker Swamp of Sorrows/0 11.40,62.00
|mapmarker Swamp of Sorrows/0 11.40,65.40
|mapmarker Swamp of Sorrows/0 15.00,61.60
|mapmarker Swamp of Sorrows/0 15.00,66.60
|mapmarker Swamp of Sorrows/0 16.80,58.40
step
talk Loganaar##12042
Train Abilities |trainer Loganaar##12042 |goto Moonglade/0 52.53,40.57 |q 1116
|only if Druid
step
talk Krazek##773
|tip {o}Top floor{} inside the building.
turnin Dream Dust in the Swamp##1116 |goto Stranglethorn Vale 26.94,77.21
step
Watch the dialogue
|tip {o}Top floor{} inside the building.
talk Krazek##773
accept Rumors for Kravel##1117 |goto Stranglethorn Vale 26.94,77.21
accept Tran'rek##2864 |goto Stranglethorn Vale 26.94,77.21
step
talk Baron Revilgaz##2496
|tip Up on the balcony of the building.
accept Goblin Sponsorship##1183 |goto Stranglethorn Vale 27.23,76.87
step
talk Viznik Goldgrubber##2625
|tip Collect from the bank.
|tip Inside the building.
collect Blackened Iron Shield##5919 |goto Stranglethorn Vale 26.54,76.57 |q 1276
step
talk "Sea Wolf" MacKinley##2501
|tip Inside the building.
accept Stoley's Debt##2872 |goto Stranglethorn Vale 27.78,77.07
step
talk Drizzlik##2495
|tip Upper level of the docks.
|tip Inside the building.
turnin Excelsior##628 |goto Stranglethorn Vale 28.29,77.59
|only if readyq(628) or completedq(628)
step
Abandon the {y}Excelsior{} Quest |complete not haveq(628)
|tip Not needed.
|only if haveq(628)
step
talk Thuul##5958
|tip Upstairs inside the building.
learnspell Portal: Orgrimmar##11417 |goto Orgrimmar/0 38.68,85.41
|only if Mage
step
talk Enyo##5883
|tip Inside the building.
Train Abilities |trainer Enyo##5883 |goto Orgrimmar/0 38.79,85.65 |q 1240
|only if Mage
step
talk Ur'kyo##6018
|tip Inside the building.
Train Abilities |trainer Ur'kyo##6018 |goto Orgrimmar/0 35.59,87.80 |q 1276
|only if Priest
step
talk Ormok##3328
|tip Inside the Cleft of Shadow.
Train Abilities |trainer Ormok##3328 |goto Orgrimmar/0 43.91,54.63 |q 1276
|only if Rogue
step
talk Mirket##3325
|tip Inside the Cleft of Shadow.
Train Abilities |trainer Mirket##3325 |goto Orgrimmar/0 48.62,46.95 |q 1276
|only if Warlock
step
talk Kurgul##5815
|tip Buy available Grimoires.
|tip Inside the Cleft of Shadow.
Train Demon Abilities |vendor Kurgul##5815 |goto Orgrimmar 47.52,46.72 |q 1276
|only if Warlock
step
talk Kardris Dreamseeker##3344
|tip Inside the building.
Train Abilities |trainer Kardris Dreamseeker##3344 |goto Orgrimmar/0 38.80,36.38 |q 1276
|only if Shaman
step
talk Grezz Ragefist##3353
|tip Inside the building.
Train Abilities |trainer Grezz Ragefist##3353 |goto Orgrimmar/0 79.78,31.42 |q 1276
|only if Warrior
step
talk Ormak Grimshot##3352
|tip Top of the building.
Train Abilities |trainer Ormak Grimshot##3352 |goto Orgrimmar/0 66.06,18.54 |q 1276
|only if Hunter
step
talk Xao'tsu##10088
|tip Top of the building.
Train Pet Abilities |trainer Xao'tsu##10088 |goto Orgrimmar/0 66.33,14.82 |q 1276
|only if Hunter
step
talk Kildar##4752
Train Wolf Riding |learnspell Wolf Riding##825 |goto Orgrimmar/0 69.40,13.10
Buy a mount from Ogunaro Wolfrunner nearby at [Orgrimmar/0 69.38,12.26]
|only if Orc and discountgold('Orgrimmar',500000)
step
talk Xar'Ti##7953
Train Raptor Riding |learnspell Raptor Riding##10861 |goto Durotar/0 55.28,75.49
Buy a mount from Zjolnir nearby at [Durotar/0 55.23,75.65]
|only if Troll and discountgold('Darkspear Trolls',500000)
step
talk Velma Warnam##4773
Train Undead Horsemanship |learnspell Undead Horsemanship##10906 |goto Tirisfal Glades/0 60.08,52.57
Buy a mount from Zachariah Post nearby at [Tirisfal Glades/0 59.87,52.68]
|only if Undead and discountgold('Undercity',500000)
step
talk Kar Stormsinger##3690
Train Kodo Riding |learnspell Kodo Riding##18995 |goto Mulgore/0 47.65,58.47
Buy a mount from Harb Clawhoof nearby at [Mulgore/0 47.49,58.60]
|only if Tauren and discountgold('Thunder Bluff',500000)
step
talk Mosarn##4943
|tip Inside the tent.
turnin The Black Shield##1276 |goto Thunder Bluff 54.01,80.77
step
talk Melor Stonehoof##3441
accept Deadmire##1205 |goto Thunder Bluff 61.53,80.90
]])
GoatQuest:RegisterGuide("Leveling Guides\\Tanaris & Dustwallow Marsh (42-44)",{
image=GQ.IMAGESDIR.."Tanaris",
next="Leveling Guides\\Feralas (44-46)",
},[[
step
talk Tran'rek##7876
turnin Tran'rek##2864 |goto Tanaris 51.57,26.76
step
talk Spigot Operator Luglunket##7408
accept Water Pouch Bounty##1707 |goto Tanaris 52.48,28.44
step
talk Chief Engineer Bilgewhizzle##7407
accept Wastewander Justice##1690 |goto Tanaris 52.46,28.51
step
talk Laziphus##9985
Stable Your Pet |stablemaster Laziphus##9985 |goto Tanaris/0 52.25,28.00 |q 1690
|tip Taming a temporary pet soon.
|tip Learning {o}Claw (Rank 6){}.
|only if Hunter
step
Learn the {y}Claw (Rank 6){} Pet Ability |learnspell Claw##2976 |goto Tanaris/0 50.00,31.00 |q 1690
|tip Cast {o}Tame Beast{} on a {o}Scorpid Hunter{}.
|tip Scorpions.
|tip Kill enemies nearby.
|mapmarker Tanaris/0 47.00,25.40
|mapmarker Tanaris/0 47.00,31.80
|mapmarker Tanaris/0 47.20,28.60
|mapmarker Tanaris/0 51.20,34.40
|mapmarker Tanaris/0 52.40,24.40
|mapmarker Tanaris/0 53.20,31.20
|mapmarker Tanaris/0 53.80,36.80
|mapmarker Tanaris/0 55.20,25.60
|mapmarker Tanaris/0 55.20,33.80
|mapmarker Tanaris/0 56.80,23.00
|mapmarker Tanaris/0 57.20,31.00
|mapmarker Tanaris/0 59.00,26.40
|only if Hunter
step
talk Laziphus##9985
Retrieve Your Pet |stablemaster Laziphus##9985 |goto Tanaris/0 52.25,28.00 |q 1690
|tip Abandon your temporary pet.
|only if Hunter
step
Teach {y}Claw (Rank 6){} to Your Pet |learnpetspell Claw##16832 |q 1690
|tip Use {o}Beast Training{} ability.
|only if Hunter
step
talk Yeh'kinya##8579
accept Screecher Spirits##3520 |goto Tanaris 66.99,22.36
step
talk Stoley##7881
|tip Inside the building.
turnin Stoley's Debt##2872 |goto Tanaris 67.11,23.98
stickystart "Kill_Wastewander_Bandits_And_Thieves"
step
label "Collect_Wastewander_Water_Pouches"
kill Wastewander Shadow Mage##5617, Wastewander Thief##5616, Wastewander Bandit##5618, Wastewander Rogue##5615, Wastewander Assassin##5623
|tip Humans.
collect 5 Wastewander Water Pouch##8483 |q 1707/1 |goto Tanaris 62.80,30.40
|tip Don't vendor them.
|mapmarker Tanaris/0 59.80,24.00
|mapmarker Tanaris/0 63.20,32.40
|mapmarker Tanaris/0 63.20,34.60
|mapmarker Tanaris/0 64.00,28.40
|mapmarker Tanaris/0 65.20,32.80
step
label "Kill_Wastewander_Bandits_And_Thieves"
kill 10 Wastewander Bandit##5618 |q 1690/1 |goto Tanaris 62.80,30.40
kill 10 Wastewander Thief##5616 |q 1690/2 |goto Tanaris 62.80,30.40
|mapmarker Tanaris/0 59.80,24.00
|mapmarker Tanaris/0 63.20,32.40
|mapmarker Tanaris/0 63.20,34.60
|mapmarker Tanaris/0 64.00,28.40
|mapmarker Tanaris/0 65.20,32.80
step
talk Chief Engineer Bilgewhizzle##7407
turnin Wastewander Justice##1690 |goto Tanaris 52.46,28.51
step
talk Spigot Operator Luglunket##7408
turnin Water Pouch Bounty##1707 |goto Tanaris 52.48,28.44
step
_Destroy This Item:_
|tip Not needed.
|tip Loot it.
trash Gadgetzan Water Co. Care Package##8484
step
talk Innkeeper Fizzgrimble##7733
|tip Inside the building.
home Gadgetzan |goto Tanaris 52.51,27.92 |q 2974 |future
step
talk Gimblethorn##7799
|tip Deposit into the bank.
|tip Inside the building.
bank Yeh'kinya's Bramble##10699		|goto Tanaris 52.30,28.91 |q 3520
step
talk Kravel Koalbeard##4452
turnin Rumors for Kravel##1117 |goto Thousand Needles 77.79,77.27
step
Watch the dialogue
talk Kravel Koalbeard##4452
accept Back to Booty Bay##1118 |goto Thousand Needles 77.79,77.27
step
talk Pozzik##4630
turnin Goblin Sponsorship##1183 |goto Thousand Needles 80.18,75.88
accept The Eighteenth Pilot##1186 |goto Thousand Needles 80.18,75.88
step
talk Razzeric##4706
turnin The Eighteenth Pilot##1186 |goto Thousand Needles 80.33,76.09
accept Razzeric's Tweaking##1187 |goto Thousand Needles 80.33,76.09
step
talk Gimblethorn##7799
|tip Deposit into the bank.
|tip Inside the building.
bank Kravel's Scheme##5826 |goto Tanaris 52.30,28.91 |q 1118 |future
step
talk Overlord Mok'Morokk##4500
accept Overlord Mok'Morokk's Concern##1166 |goto Dustwallow Marsh 36.30,31.42
step
talk Draz'Zilb##4501
|tip Inside the small cave.
accept Identifying the Brood##1169 |goto Dustwallow Marsh 37.15,33.08
step
talk Tharg##4502
accept Army of the Black Dragon##1168 |goto Dustwallow Marsh 37.37,31.39
step
map Dustwallow Marsh
path	follow strictbounce;	loop off;	ants curved;	dist 30;	markers none;		arrow hide
path	47.10,51.36	47.61,52.53	47.61,53.26	47.05,54.32	46.40,54.20
path	45.65,52.97	46.41,54.19	47.57,54.87	47.75,55.92	45.92,61.67
path	44.65,62.27	45.91,61.67	47.62,56.05	48.13,55.79	48.92,57.12
path	49.56,56.90	50.94,54.14	50.94,53.28	49.93,52.67
kill Deadmire##4841
|tip White crocodile.
|tip Walks a large pattern in the water.
collect Deadmire's Tooth##5945 |q 1205/1 |usebank
step
click Gizmorium Shipping Crate
collect Seaforium Booster##5862 |q 1187/1 |goto Dustwallow Marsh 54.07,56.49
step
kill Muckshell Razorclaw##4405, Muckshell Scrabbler##4404, Muckshell Clacker##4401, Muckshell Pincer##4403
collect Jeweled Pendant##5942 |q 1261/1 |goto Dustwallow Marsh/0 56.40,60.40
|tip Low drop rate.
|mapmarker Dustwallow Marsh/0 52.80,63.00
|mapmarker Dustwallow Marsh/0 54.80,62.20
|mapmarker Dustwallow Marsh/0 54.80,64.20
|mapmarker Dustwallow Marsh/0 57.60,62.20
stickystart "Kill_Firemane_Scouts_And_Ash_Tails"
stickystart "Collect_Searing_Tongues_And_Searing_Hearts"
step
Follow the path up |goto Dustwallow Marsh/0 55.55,65.32 < 20 |only if walking and subzone("Tidefury Cove")
click Mok'Morokk's Snuff
collect Mok'Morokk's Snuff##5834 |q 1166/1 |goto Dustwallow Marsh/0 44.53,66.04
step
click Mok'Morokk's Grog
collect Mok'Morokk's Grog##5835 |q 1166/2 |goto Dustwallow Marsh/0 38.67,65.58
stickystop "Collect_Searing_Tongues_And_Searing_Hearts"
stickystart "Kill_Firemane_Scalebanes"
step
Enter the cave |goto Dustwallow Marsh/0 38.41,66.04 < 15 |walk |only if not (subzone("The Den of Flame") and indoors())
click Mok'Morokk's Strongbox
|tip Inside the cave.
collect Mok'Morokk's Strongbox##5836 |q 1166/3 |goto Dustwallow Marsh/0 36.64,69.57
step
label "Kill_Firemane_Scalebanes"
kill 5 Firemane Scalebane##4328 |q 1168/3 |goto Dustwallow Marsh/0 38.46,65.96
|tip Inside the cave. |notinsticky
|mapmarker Dustwallow Marsh/0 36.40,69.40
|mapmarker Dustwallow Marsh/0 38.00,68.20
stickystart "Collect_Searing_Tongues_And_Searing_Hearts"
step
label "Kill_Firemane_Scouts_And_Ash_Tails"
Leave the cave |goto Dustwallow Marsh/0 38.46,65.96 < 15 |walk |only if subzone("The Den of Flame") and indoors()
kill 10 Firemane Ash Tail##4331 |q 1168/2 |goto Dustwallow Marsh/0 42.00,67.20
kill 15 Firemane Scout##4329 |q 1168/1 |goto Dustwallow Marsh/0 42.00,67.20
|mapmarker Dustwallow Marsh/0 36.80,69.00
|mapmarker Dustwallow Marsh/0 38.46,65.96
|mapmarker Dustwallow Marsh/0 43.60,69.20
|mapmarker Dustwallow Marsh/0 43.80,65.40
|mapmarker Dustwallow Marsh/0 46.00,67.20
step
label "Collect_Searing_Tongues_And_Searing_Hearts"
kill Searing Whelp##4324, Searing Hatchling##4323
|tip Small flying dragons.
collect 15 Searing Tongue##5840 |q 1169/1 |goto Dustwallow Marsh/0 41.00,74.60
collect 15 Searing Heart##5841 |q 1169/2 |goto Dustwallow Marsh/0 41.00,74.60
|mapmarker Dustwallow Marsh/0 37.40,74.20
|mapmarker Dustwallow Marsh/0 40.60,70.80
|mapmarker Dustwallow Marsh/0 46.40,77.00
|mapmarker Dustwallow Marsh/0 41.20,77.60
|mapmarker Dustwallow Marsh/0 41.80,80.80
|mapmarker Dustwallow Marsh/0 42.60,68.40
|mapmarker Dustwallow Marsh/0 43.40,65.00
|mapmarker Dustwallow Marsh/0 45.40,73.20
|mapmarker Dustwallow Marsh/0 45.80,84.40
|mapmarker Dustwallow Marsh/0 47.20,67.00
|mapmarker Dustwallow Marsh/0 47.60,70.20
|mapmarker Dustwallow Marsh/0 48.20,80.40
|mapmarker Dustwallow Marsh/0 50.20,72.20
|mapmarker Dustwallow Marsh/0 51.80,67.40
|mapmarker Dustwallow Marsh/0 54.20,70.60
step
talk Draz'Zilb##4501
|tip Inside the small cave.
turnin Identifying the Brood##1169 |goto Dustwallow Marsh/0 37.15,33.08 |only if not zone("Dustwallow Marsh")
turnin Identifying the Brood##1169 |goto Dustwallow Marsh/0 37.15,33.08 |nohearth |only if zone("Dustwallow Marsh")
step
Watch the dialogue
|tip Inside the small cave.
talk Draz'Zilb##4501
accept The Brood of Onyxia##1170 |goto Dustwallow Marsh/0 37.15,33.08
step
talk Tharg##4502
turnin Army of the Black Dragon##1168 |goto Dustwallow Marsh/0 37.37,31.39
step
talk Overlord Mok'Morokk##4500
turnin Overlord Mok'Morokk's Concern##1166 |goto Dustwallow Marsh/0 36.30,31.42
turnin The Brood of Onyxia##1170 |goto Dustwallow Marsh/0 36.30,31.42
accept The Brood of Onyxia##1171 |goto Dustwallow Marsh/0 36.30,31.42
step
talk Draz'Zilb##4501
|tip Inside the small cave.
turnin The Brood of Onyxia##1171 |goto Dustwallow Marsh/0 37.15,33.08
step
talk Nazeer Bloodpike##4791
turnin Marg Speaks##1261 |goto Dustwallow Marsh/0 35.21,30.66
accept Report to Zor##1262 |goto Dustwallow Marsh/0 35.21,30.66
step
talk Loganaar##12042
Train Abilities |trainer Loganaar##12042 |goto Moonglade/0 52.53,40.57 |q 2981 |future
|only if Druid
step
talk Enyo##5883
|tip Inside the building.
Train Abilities |trainer Enyo##5883 |goto Orgrimmar/0 38.79,85.65 |q 2981 |future
|only if Mage
step
talk Ur'kyo##6018
|tip Inside the building.
Train Abilities |trainer Ur'kyo##6018 |goto Orgrimmar/0 35.59,87.80 |q 2981 |future
|only if Priest
step
talk Zor Lonetree##4047
|tip Inside the building.
turnin Report to Zor##1262 |goto Orgrimmar 38.93,38.38
accept Service to the Horde##7541 |goto Orgrimmar 38.93,38.38 |instant
step
talk Kardris Dreamseeker##3344
|tip Inside the building.
Train Abilities |trainer Kardris Dreamseeker##3344 |goto Orgrimmar/0 38.80,36.38 |q 2981 |future
|only if Shaman
step
talk Ormok##3328
|tip Inside the Cleft of Shadow.
Train Abilities |trainer Ormok##3328 |goto Orgrimmar/0 43.91,54.63 |q 2981 |future
|only if Rogue
step
talk Mirket##3325
|tip Inside the Cleft of Shadow.
Train Abilities |trainer Mirket##3325 |goto Orgrimmar/0 48.62,46.95 |q 2981 |future
|only if Warlock
step
talk Kurgul##5815
|tip Buy available Grimoires.
|tip Inside the Cleft of Shadow.
Train Demon Abilities |vendor Kurgul##5815 |goto Orgrimmar 47.52,46.72 |q 2981 |future
|only if Warlock
step
talk Grezz Ragefist##3353
|tip Inside the building.
Train Abilities |trainer Grezz Ragefist##3353 |goto Orgrimmar/0 79.78,31.42 |q 2981 |future
|only if Warrior
step
talk Belgrom Rockmaul##4485
accept A Threat in Feralas##2981 |goto Orgrimmar/0 75.22,34.22
step
talk Ormak Grimshot##3352
|tip Top of the building.
Train Abilities |trainer Ormak Grimshot##3352 |goto Orgrimmar/0 66.06,18.54 |q 2981
|only if Hunter
step
talk Kar Stormsinger##3690
Train Kodo Riding |learnspell Kodo Riding##18995 |goto Mulgore/0 47.65,58.47
Buy a mount from Harb Clawhoof nearby at [Mulgore/0 47.49,58.60]
|only if Tauren and discountgold('Thunder Bluff',500000)
step
talk Kildar##4752
Train Wolf Riding |learnspell Wolf Riding##825 |goto Orgrimmar/0 69.40,13.10
Buy a mount from Ogunaro Wolfrunner nearby at [Orgrimmar/0 69.38,12.26]
|only if Orc and discountgold('Orgrimmar',500000)
step
talk Xar'Ti##7953
Train Raptor Riding |learnspell Raptor Riding##10861 |goto Durotar/0 55.28,75.49
Buy a mount from Zjolnir nearby at [Durotar/0 55.23,75.65]
|only if Troll and discountgold('Darkspear Trolls',500000)
step
talk Velma Warnam##4773
Train Undead Horsemanship |learnspell Undead Horsemanship##10906 |goto Tirisfal Glades/0 60.08,52.57
Buy a mount from Zachariah Post nearby at [Tirisfal Glades/0 59.87,52.68]
|only if Undead and discountgold('Undercity',500000)
step
talk Razzeric##4706
turnin Razzeric's Tweaking##1187 |goto Thousand Needles 80.33,76.10
accept Safety First##1188 |goto Thousand Needles 80.33,76.10
step
talk Shreev##4708
turnin Safety First##1188 |goto Tanaris 50.96,27.24
step
talk Senior Surveyor Fizzledowser##7724
accept Gadgetzan Water Survey##992 |goto Tanaris 50.21,27.48
|only if not hardcore()
step
use Untapped Dowsing Widget##8584
|tip Avoid {o}elite enemies{}.
|tip You will be attacked.
|tip Careful, {o}two higher level enemies{}.
|tip Run away quickly.
collect Tapped Dowsing Widget##8585 |q 992/1 |goto Tanaris 39.09,29.17
|only if not hardcore()
step
talk Senior Surveyor Fizzledowser##7724
turnin Gadgetzan Water Survey##992 |goto Tanaris 50.21,27.48
|only if not hardcore()
step
talk Gimblethorn##7799
|tip Collect from the bank.
|tip Inside the building.
collect Yeh'kinya's Bramble##10699 |goto Tanaris 52.30,28.91 |q 3520
step
talk Gimblethorn##7799
|tip Inside the building.
|tip Deposit into the bank.
bank Deadmire's Tooth##5945 |goto Tanaris 52.30,28.91 |q 1205
]])
GoatQuest:RegisterGuide("Leveling Guides\\Feralas (44-46)",{
image=GQ.IMAGESDIR.."Feralas",
next="Leveling Guides\\Stranglethorn Vale (46-47)",
},[[
step
Follow the road up into Feralas |goto Thousand Needles/0 7.68,10.62 < 40 |only if walking and zone("Thousand Needles")
talk Shyn##8020
fpath Camp Mojache |goto Feralas 75.45,44.36
|only if hardcore()
step
talk Orwin Gizzmick##8021
accept Gordunni Cobalt##2987 |goto Feralas 75.70,44.30
stickystart "Accept_Ogres_Of_Feralas"
step
talk Krueg Skullsplitter##4544
accept A New Cloak's Sheen##2973 |goto Feralas 75.94,42.74
step
talk Hadoken Swiftstrider##7875
accept War on the Woodpaw##2862 |goto Feralas 74.91,42.47
step
talk Jangdor Swiftstrider##7854
|tip Inside the building.
accept The Mark of Quality##2822 |goto Feralas 74.43,42.91
step
label "Accept_Ogres_Of_Feralas"
talk Rok Orhan##7777
|tip Wearing red armor.
|tip Walks around.
turnin A Threat in Feralas##2981 |goto Feralas 75.60,43.60
accept The Ogres of Feralas##2975 |goto Feralas 75.60,43.60
|mapmarker Feralas/0 73.40,45.40
|mapmarker Feralas/0 74.40,44.00
step
kill Woodpaw Mongrel##5249, Woodpaw Trapper##5251, Woodpaw Brute##5253
|tip Gnolls.
collect 10 Woodpaw Gnoll Mane##9237 |q 2862/1 |goto Feralas 73.00,39.80
|mapmarker Feralas/0 72.20,36.40
stickystart "Collect_Gordunni_Cobalt"
stickystart "Kill_Gordunni_Brutes_Ogres_Ogre_Mages"
step
Follow the path up into Gordunni Outpost |goto Feralas 75.00,35.15 < 20 |only if walking and not subzone("Gordunni Outpost")
Follow the path |goto Feralas 76.29,32.90 < 20 |only if walking
click Gordunni Scroll
|tip White unrolled scroll.
|tip Multiple locations.
collect Gordunni Scroll##9370 |n
use Gordunni Scroll##9370
accept The Gordunni Scroll##2978 |goto Feralas 75.13,29.73 |q 2978 |future
|mapmarker Feralas 75.21,28.71
|mapmarker Feralas 74.51,27.92
|mapmarker Feralas 79.40,34.80
|mapmarker Feralas 80.50,34.30
|mapmarker Feralas 80.80,35.00
step
label "Collect_Gordunni_Cobalt"
use Orwin's Shovel##9466
|tip Next to glowing blue circles.
click Gordunni Dirt Mound+
|tip Piles of dirt that appear.
|tip They {o}glow blue{} if containing quest item.
collect 12 Gordunni Cobalt##9463 |q 2987/1 |goto Feralas 76.70,33.80
|mapmarker Feralas/0 74.60,30.20
|mapmarker Feralas/0 74.80,26.60
|mapmarker Feralas/0 75.10,32.40
|mapmarker Feralas/0 76.70,33.80
|mapmarker Feralas/0 81.60,35.10
|mapmarker Feralas/0 79.50,34.90
step
label "Kill_Gordunni_Brutes_Ogres_Ogre_Mages"
kill 5 Gordunni Brute##5232 |q 2975/3 |goto Feralas 76.70,33.80
kill 10 Gordunni Ogre##5229 |q 2975/1 |goto Feralas 76.70,33.80
kill 10 Gordunni Ogre Mage##5237 |q 2975/2 |goto Feralas 76.70,33.80
|mapmarker Feralas/0 74.60,30.20
|mapmarker Feralas/0 74.80,26.60
|mapmarker Feralas/0 75.10,32.40
|mapmarker Feralas/0 81.60,35.10
|mapmarker Feralas/0 79.50,34.90
step
talk Hadoken Swiftstrider##7875
turnin War on the Woodpaw##2862 |goto Feralas 74.91,42.47
accept Alpha Strike##2863 |goto Feralas 74.91,42.47
stickystart "Accept_Dark_Ceremony"
step
talk Orwin Gizzmick##8021
turnin Gordunni Cobalt##2987 |goto Feralas 75.70,44.31
step
label "Accept_Dark_Ceremony"
talk Rok Orhan##7777
|tip Wearing red armor.
|tip Walks around.
turnin The Ogres of Feralas##2975 |goto Feralas 75.60,43.60
accept The Ogres of Feralas##2980 |goto Feralas 75.60,43.60
turnin The Gordunni Scroll##2978 |goto Feralas 75.60,43.60
accept Dark Ceremony##2979 |goto Feralas 75.60,43.60
|mapmarker Feralas/0 73.40,45.40
|mapmarker Feralas/0 74.40,44.00
step
_NOTE:_
During the Next Steps
|tip {o}Hurry{}, you have a timed quest.
Click Here to Continue |confirm |q 2863
step
kill Sprite Darter##5278+
collect 10 Iridescent Sprite Darter Wing##9369 |q 2973/1 |goto Feralas 69.40,46.80
|mapmarker Feralas/0 64.40,48.40
|mapmarker Feralas/0 66.40,47.80
|mapmarker Feralas/0 68.40,44.80
|mapmarker Feralas/0 68.40,49.20
step
kill 5 Woodpaw Alpha##5258 |q 2863/1 |goto Feralas 68.60,54.20
|mapmarker Feralas 75.48,56.48
|mapmarker Feralas 73.27,56.17
|mapmarker Feralas 72.40,56.55
|mapmarker Feralas 71.42,55.92
|mapmarker Feralas 77.20,56.80
|mapmarker Feralas 69.00,55.80
|mapmarker Feralas 74.34,54.96
step
talk Hadoken Swiftstrider##7875
turnin Alpha Strike##2863 |goto Feralas 74.91,42.46
accept Woodpaw Investigation##2902 |goto Feralas 74.91,42.46
step
talk Krueg Skullsplitter##4544
turnin A New Cloak's Sheen##2973 |goto Feralas 75.94,42.74
accept A Grim Discovery##2974 |goto Feralas 75.94,42.74
step
_Destroy These Items:_
|tip Not needed.
trash Iridescent Sprite Darter Wing##9369
step
click Woodpaw Battle Map
turnin Woodpaw Investigation##2902 |goto Feralas 71.63,55.92
accept The Battle Plans##2903 |goto Feralas 71.63,55.92
step
kill Grimtotem Shaman##7727, Grimtotem Raider##7725, Grimtotem Naturalist##7726
|tip Tauren.
collect 20 Grimtotem Horn##9460 |q 2974/1 |goto Feralas 67.40,46.40
|mapmarker Feralas/0 65.40,47.40
|mapmarker Feralas/0 66.60,38.40
|mapmarker Feralas/0 68.80,39.40
step
talk Hadoken Swiftstrider##7875
turnin The Battle Plans##2903 |goto Feralas 74.91,42.47
accept Zukk'ash Infestation##7730 |goto Feralas 74.91,42.47
accept Stinglasher##7731 |goto Feralas 74.91,42.47
step
talk Krueg Skullsplitter##4544
turnin A Grim Discovery##2974 |goto Feralas 75.94,42.74
accept A Grim Discovery##2976 |goto Feralas 75.94,42.74
step
_Destroy These Items:_
|tip Not needed.
trash Grimtotem Horn##9460
step
talk Innkeeper Greul##7737
home Camp Mojache |goto Feralas 74.80,45.18 |q 2605 |future
stickystart "Collect_Zukkash_Carapaces"
step
kill Stinglasher##14661
|tip Flies around.
|tip Also inside the insect caves, but mostly outside.
collect Stinglasher's Glands##18962 |q 7731/1 |goto Feralas 75.60,61.60
|mapmarker Feralas/0 73.20,63.40
|mapmarker Feralas/0 73.60,64.60
|mapmarker Feralas/0 74.40,62.40
|mapmarker Feralas/0 75.20,60.40
|mapmarker Feralas/0 76.98,61.55
|mapmarker Feralas/0 78.00,62.60
step
label "Collect_Zukkash_Carapaces"
kill Zukk'ash Worker##5246, Zukk'ash Wasp##5245, Zukk'ash Stinger##5244, Zukk'ash Tunneler##5247
|tip Insects.
|tip More inside the insect caves. |notinsticky
collect 20 Zukk'ash Carapace##18961 |q 7730/1 |goto Feralas 75.40,61.20
|mapmarker Feralas/0 72.40,61.20
|mapmarker Feralas/0 72.40,63.40
|mapmarker Feralas/0 74.40,59.40
|mapmarker Feralas/0 74.40,63.60
|mapmarker Feralas/0 76.60,59.40
|mapmarker Feralas/0 76.60,63.00
step
Follow the road |goto Feralas 67.56,49.82 < 40 |only if walking and not subzone("High Wilderness")
kill Vale Screecher##5307, Rogue Vale Screecher##5308
|tip Red flying snakes.
use Yeh'kinya's Bramble##10699
|tip On their corpses.
talk Screecher Spirit##8612+
|tip Ghosts that appear.
Collect #3# Screecher Spirits |q 3520/1 |goto Feralas 60.40,50.80
|mapmarker Feralas/0 50.60,47.40
|mapmarker Feralas/0 52.20,49.60
|mapmarker Feralas/0 53.20,46.40
|mapmarker Feralas/0 54.80,47.80
|mapmarker Feralas/0 56.20,50.00
|mapmarker Feralas/0 56.80,47.80
|mapmarker Feralas/0 58.40,52.00
|mapmarker Feralas/0 55.40,53.40
|mapmarker Feralas/0 56.40,55.80
|mapmarker Feralas/0 57.00,60.80
|mapmarker Feralas/0 57.40,58.40
|mapmarker Feralas/0 57.60,53.80
|mapmarker Feralas/0 58.40,56.20
|mapmarker Feralas/0 59.00,60.60
|mapmarker Feralas/0 59.20,62.60
stickystart "Kill_Gordunni_Warlocks"
stickystart "Kill_Gordunni_Shamans"
step
kill 5 Gordunni Mauler##5234 |q 2980/3 |goto Feralas 61.80,54.40
|mapmarker Feralas/0 58.60,67.80
|mapmarker Feralas/0 59.00,65.00
|mapmarker Feralas/0 59.40,62.40
|mapmarker Feralas/0 60.40,57.00
step
kill Gordunni Mage-Lord##5239+
collect Gordunni Orb##9371 |q 2979/1 |goto Feralas 58.40,67.60
|mapmarker Feralas/0 57.80,70.20
|mapmarker Feralas/0 58.40,73.40
|mapmarker Feralas/0 60.20,70.40
|mapmarker Feralas/0 60.40,68.00
|mapmarker Feralas/0 61.20,72.20
|mapmarker Feralas/0 62.40,68.00
step
label "Kill_Gordunni_Shamans"
kill 10 Gordunni Shaman##5236 |q 2980/1 |goto Feralas 60.40,68.00
|mapmarker Feralas/0 57.80,70.20
|mapmarker Feralas/0 58.40,67.40
|mapmarker Feralas/0 59.40,65.40
|mapmarker Feralas/0 59.80,63.20
|mapmarker Feralas/0 60.20,70.40
|mapmarker Feralas/0 62.80,68.40
step
label "Kill_Gordunni_Warlocks"
kill 10 Gordunni Warlock##5240 |q 2980/2 |goto Feralas 58.20,66.40
|mapmarker Feralas/0 59.40,64.60
|mapmarker Feralas/0 60.40,57.00
|mapmarker Feralas/0 60.40,71.00
|mapmarker Feralas/0 61.80,54.40
stickystart "Collect_Long_Elegant_Feathers"
step
Follow the path up |goto Feralas 54.10,68.24 < 40 |only if walking and not subzone("Frayfeather Highlands")
click Hippogryph Egg
|tip Large white egg.
|tip Multiple locations.
collect Hippogryph Egg##8564 |goto Feralas 56.60,75.90 |q 2741 |future |usebank
|tip Don't vendor it.
|tip Needed for future quest.
|mapmarker Feralas/0 55.90,76.00
|mapmarker Feralas/0 56.40,77.40
|mapmarker Feralas/0 56.70,76.70
|mapmarker Feralas/0 57.00,78.20
|mapmarker Feralas/0 58.00,76.30
|mapmarker Feralas/0 58.30,76.80
|mapmarker Feralas/0 58.60,75.60
step
label "Collect_Long_Elegant_Feathers"
kill Frayfeather Hippogryph##5300+
|tip Stagwings and Skystormers won't drop.
collect 10 Long Elegant Feather##4589 |goto Feralas 56.99,64.45 |q 7842 |future |usebank
|tip Don't vendor them.
|tip Needed for future quest.
|mapmarker Feralas/0 54.80,60.20
|mapmarker Feralas/0 55.40,63.40
|mapmarker Feralas/0 55.80,66.00
|mapmarker Feralas/0 56.60,61.40
|mapmarker Feralas/0 53.80,66.20
step
kill Feral Scar Yeti##5292, Enraged Feral Scar##5295, Hulking Feral Scar##5293
|tip Yetis.
|tip More through the tunnel.
collect 10 Thick Yeti Hide##8973 |q 2822/1 |goto Feralas 55.40,57.40
|mapmarker Feralas/0 52.40,57.40
|mapmarker Feralas/0 53.40,55.40
|mapmarker Feralas/0 55.20,54.40
|mapmarker Feralas/0 50.40,58.40
|mapmarker Feralas/0 51.80,60.60
step
use OOX-22/FE Distress Beacon##8705
accept Find OOX-22/FE!##2766
|only if itemcount(8705) > 0
step
Run through the tunnel |goto Feralas 55.22,56.39 < 20 |only if walking and (subzone("Feral Scar Vale") and not indoors())
talk Homing Robot OOX-22/FE##7807
|tip In the clearing between the tunnel and cave.
turnin Find OOX-22/FE!##2766 |goto Feralas 53.35,55.70
|only if haveq(2766) or completedq(2766)
stickystart "Accept_The_Gordunni_Orb"
step
talk Witch Doctor Uzer'i##8115
accept A Strange Request##3121 |goto Feralas 74.42,43.36
step
talk Jangdor Swiftstrider##7854
|tip Inside the building.
turnin The Mark of Quality##2822 |goto Feralas 74.43,42.91
step
talk Hadoken Swiftstrider##7875
turnin Zukk'ash Infestation##7730 |goto Feralas 74.91,42.47
turnin Stinglasher##7731 |goto Feralas 74.91,42.47
accept Zukk'ash Report##7732 |goto Feralas 74.91,42.47
step
label "Accept_The_Gordunni_Orb"
talk Rok Orhan##7777
|tip Wearing red armor.
|tip Walks around.
turnin The Ogres of Feralas##2980 |goto Feralas 75.60,43.60
turnin Dark Ceremony##2979 |goto Feralas 75.60,43.60
accept The Gordunni Orb##3002 |goto Feralas 75.60,43.60
|mapmarker Feralas/0 73.40,45.40
|mapmarker Feralas/0 74.40,44.00
step
talk Chesmu##8356
|tip Collect from the bank.
|tip Inside the building.
collect Deadmire's Tooth##5945 |goto Thunder Bluff/0 47.13,57.89 |q 1205
step
talk Chesmu##8356
|tip Deposit into the bank.
|tip Inside the building.
bank Long Elegant Feather##4589 |goto Thunder Bluff/0 47.13,57.89 |q 7842 |future
bank Yeh'kinya's Bramble##10699 |goto Thunder Bluff/0 47.13,57.89 |q 3520
bank Hippogryph Egg##8564	|goto Thunder Bluff/0 47.13,57.89 |q 2741 |future
step
talk Melor Stonehoof##3441
turnin Deadmire##1205 |goto Thunder Bluff 61.54,80.91
step
talk Kym Wildmane##3036
|tip Inside the building.
Train Abilities |trainer Kym Wildmane##3036 |goto Thunder Bluff/0 77.13,29.80 |q 4767
|only if Druid
step
talk Kar Stormsinger##3690
Train Kodo Riding |learnspell Kodo Riding##18995 |goto Mulgore/0 47.65,58.47
Buy a mount from Harb Clawhoof nearby at [Mulgore/0 47.49,58.60]
|only if Tauren and discountgold('Thunder Bluff',500000)
step
talk Enyo##5883
|tip Inside the building.
Train Abilities |trainer Enyo##5883 |goto Orgrimmar/0 38.79,85.65 |q 3002
|only if Mage
step
talk Uthel'nay##7311
|tip Inside the building.
turnin The Gordunni Orb##3002 |goto Orgrimmar 39.16,86.24
step
talk Ur'kyo##6018
|tip Inside the building.
Train Abilities |trainer Ur'kyo##6018 |goto Orgrimmar/0 35.59,87.80 |q 3121
|only if Priest
step
talk Kardris Dreamseeker##3344
|tip Inside the building.
Train Abilities |trainer Kardris Dreamseeker##3344 |goto Orgrimmar/0 38.80,36.38 |q 3121
|only if Shaman
step
talk Ormok##3328
|tip Inside the Cleft of Shadow.
Train Abilities |trainer Ormok##3328 |goto Orgrimmar/0 43.91,54.63 |q 3121
|only if Rogue
step
talk Mirket##3325
|tip Inside the Cleft of Shadow.
Train Abilities |trainer Mirket##3325 |goto Orgrimmar/0 48.62,46.95 |q 3121
|only if Warlock
step
talk Kurgul##5815
|tip Buy available Grimoires.
|tip Inside the Cleft of Shadow.
Train Demon Abilities |vendor Kurgul##5815 |goto Orgrimmar 47.52,46.72 |q 3121
|only if Warlock
step
talk Neeru Fireblade##3216
|tip Inside the tent.
|tip Inside the Cleft of Shadow.
turnin A Strange Request##3121 |goto Orgrimmar 49.49,50.59
accept Return to Witch Doctor Uzer'i##3122 |goto Orgrimmar 49.49,50.59
step
talk Belgrom Rockmaul##4485
turnin A Grim Discovery##2976 |goto Orgrimmar 75.23,34.24
step
talk Grezz Ragefist##3353
|tip Inside the building.
Train Abilities |trainer Grezz Ragefist##3353 |goto Orgrimmar/0 79.78,31.42 |q 7732
|only if Warrior
step
talk Ormak Grimshot##3352
|tip Top of the building.
Train Abilities |trainer Ormak Grimshot##3352 |goto Orgrimmar/0 66.06,18.54 |q 7732
|only if Hunter
step
talk Kildar##4752
Train Wolf Riding |learnspell Wolf Riding##825 |goto Orgrimmar/0 69.40,13.10
Buy a mount from Ogunaro Wolfrunner nearby at [Orgrimmar/0 69.38,12.26]
|only if Orc and discountgold('Orgrimmar',500000)
step
Run up the stairs |goto Orgrimmar 56.33,56.94 < 15 |only if walking
talk Zilzibin Drumlore##7010
|tip Upstairs inside the building.
turnin Zukk'ash Report##7732 |goto Orgrimmar 56.28,46.67
step
talk Karus##3309
|tip Deposit into the bank.
|tip Inside the building.
bank Neeru's Herb Pouch##9628 |goto Orgrimmar 49.58,69.12 |q 3122
step
talk Xar'Ti##7953
Train Raptor Riding |learnspell Raptor Riding##10861 |goto Durotar/0 55.28,75.49
Buy a mount from Zjolnir nearby at [Durotar/0 55.23,75.65]
|only if Troll and discountgold('Darkspear Trolls',500000)
step
talk Velma Warnam##4773
Train Undead Horsemanship |learnspell Undead Horsemanship##10906 |goto Tirisfal Glades/0 60.08,52.57
Buy a mount from Zachariah Post nearby at [Tirisfal Glades/0 59.87,52.68]
|only if Undead and discountgold('Undercity',500000)
]])
GoatQuest:RegisterGuide("Leveling Guides\\Stranglethorn Vale (46-47)",{
image=GQ.IMAGESDIR.."Stranglethorn Vale",
next="Leveling Guides\\Swamp of Sorrows (47-48)",
},[[
step
click Bubbling Cauldron
accept Speaking with Gan'zulah##586 |goto Stranglethorn Vale 32.22,27.60
stickystart "Kill_Skullsplitter_Headhunters"
stickystart "Kill_Skullsplitter_Berserkers_And_Hunters"
step
kill Ana'thek the Cruel##1059
|tip Larger troll with wooden mallet.
|tip Walks around with 2 guards.
|tip Sometimes stands inside this small cave.
|tip Careful, {o}dangerous area{}.	|only if hardcore()
collect Broken Armor of Ana'thek##3909 |q 586/4 |goto Stranglethorn Vale/0 44.40,44.40
|mapmarker Stranglethorn Vale/0 44.00,43.00
|mapmarker Stranglethorn Vale/0 45.20,42.20
|mapmarker Stranglethorn Vale/0 46.00,41.00
step
label "Kill_Skullsplitter_Headhunters"
kill 6 Skullsplitter Headhunter##781 |q 586/2 |goto Stranglethorn Vale/0 47.20,43.80
|tip Uncommon.
|mapmarker Stranglethorn Vale/0 46.20,44.60
|mapmarker Stranglethorn Vale/0 47.40,42.00
step
label "Kill_Skullsplitter_Berserkers_And_Hunters"
kill 4 Skullsplitter Berserker##783 |q 586/3 |goto Stranglethorn Vale/0 47.20,39.60
kill 8 Skullsplitter Hunter##669 |q 586/1 |goto Stranglethorn Vale/0 47.20,39.60
|mapmarker Stranglethorn Vale/0 44.40,40.40
|mapmarker Stranglethorn Vale/0 44.40,42.60
|mapmarker Stranglethorn Vale/0 45.40,38.40
|mapmarker Stranglethorn Vale/0 46.60,42.20
step
click Bubbling Cauldron
turnin Speaking with Gan'zulah##586 |goto Stranglethorn Vale/0 32.22,27.60
accept The Fate of Yenniku##588 |goto Stranglethorn Vale/0 32.22,27.60
step
talk Kin'weelay##2519
turnin The Fate of Yenniku##588 |goto Stranglethorn Vale/0 32.27,27.71
step
talk Viznik Goldgrubber##2625
|tip Collect from the bank.
collect Kravel's Scheme##5826 |goto Stranglethorn Vale 26.54,76.57 |q 1118
step
talk Crank Fizzlebub##2498
|tip {o}Ground floor{} inside the building.
turnin Back to Booty Bay##1118 |goto Stranglethorn Vale/0 27.12,77.21
step
talk First Mate Crazz##2490
accept The Bloodsail Buccaneers##595 |goto Stranglethorn Vale 28.10,76.22
step
Run through the tunnel to leave Booty Bay |goto Stranglethorn Vale 28.00,73.46 < 15 |only if walking and (subzone("Booty Bay") or subzone("The Old Port Authority") or subzone("The Salty Sailor Tavern"))
click Bloodsail Correspondence
turnin The Bloodsail Buccaneers##595 |goto Stranglethorn Vale 27.28,69.52
accept The Bloodsail Buccaneers##597 |goto Stranglethorn Vale 27.28,69.52
step
Run through the tunnel to enter Booty Bay |goto Stranglethorn Vale 29.56,72.51 < 15 |only if walking and not (subzone("Booty Bay") or subzone("The Old Port Authority") or subzone("The Salty Sailor Tavern"))
talk First Mate Crazz##2490
turnin The Bloodsail Buccaneers##597 |goto Stranglethorn Vale 28.10,76.21
accept The Bloodsail Buccaneers##599 |goto Stranglethorn Vale 28.10,76.21
step
talk Deeg##2488
|tip {o}Top floor{} inside the building.
accept Up to Snuff##587 |goto Stranglethorn Vale 26.92,77.35
step
talk Fleet Master Seahorn##2487
|tip Upstairs on the balcony of the building.
turnin The Bloodsail Buccaneers##599 |goto Stranglethorn Vale 27.17,77.01
accept The Bloodsail Buccaneers##604 |goto Stranglethorn Vale 27.17,77.01
step
talk Dizzy One-Eye##2493
|tip Upper level of the docks.
accept Keep An Eye Out##576 |goto Stranglethorn Vale 28.59,75.90
stickystart "Collect_Bloodsail_Orders"
stickystart "Collect_Dizzys_Eye_And_Snuff"
stickystart "Kill_Bloodsail_Swashbucklers"
step
Run through the tunnel to leave Booty Bay |goto Stranglethorn Vale 28.00,73.46 < 15 |only if walking and (subzone("Booty Bay") or subzone("The Old Port Authority") or subzone("The Salty Sailor Tavern"))
Run along the beach |goto Stranglethorn Vale 32.89,73.75 < 50 |only if walking and not subzone("Wild Shore")
click Bloodsail Charts
|tip Brown paper.
|tip Multiple locations.
collect Bloodsail Charts##3920 |q 604/2 |goto Stranglethorn Vale 29.59,80.83
|mapmarker Stranglethorn Vale 27.15,82.69
|mapmarker Stranglethorn Vale 27.74,83.13
step
label "Collect_Bloodsail_Orders"
click Bloodsail Orders
|tip White unrolled scroll.
|tip Multiple locations. |notinsticky
collect Bloodsail Orders##3921 |q 604/3 |goto Stranglethorn Vale 29.59,80.80
|mapmarker Stranglethorn Vale 27.18,82.66
|mapmarker Stranglethorn Vale 27.74,83.13
step
label "Collect_Dizzys_Eye_And_Snuff"
kill Bloodsail Warlock##1564, Bloodsail Swashbuckler##1563, Bloodsail Mage##1562, Bloodsail Raider##1561
collect Dizzy's Eye##3897 |q 576/1 |goto Stranglethorn Vale 27.00,82.80
collect 15 Snuff##3910 |q 587/1 |goto Stranglethorn Vale 27.00,82.80
|mapmarker Stranglethorn Vale/0 29.40,80.40
|mapmarker Stranglethorn Vale/0 32.00,79.60
|mapmarker Stranglethorn Vale/0 33.00,77.00
|mapmarker Stranglethorn Vale/0 29.60,87.40
|mapmarker Stranglethorn Vale/0 33.60,86.60
step
label "Kill_Bloodsail_Swashbucklers"
kill 10 Bloodsail Swashbuckler##1563 |q 604/1 |goto Stranglethorn Vale 27.00,82.80
|mapmarker Stranglethorn Vale/0 29.40,80.40
|mapmarker Stranglethorn Vale/0 32.00,79.60
|mapmarker Stranglethorn Vale/0 33.00,77.00
|mapmarker Stranglethorn Vale/0 29.60,87.40
|mapmarker Stranglethorn Vale/0 33.60,86.60
step
Run through the tunnel to enter Booty Bay |goto Stranglethorn Vale 29.56,72.51 < 15 |only if walking and not (subzone("Booty Bay") or subzone("The Old Port Authority") or subzone("The Salty Sailor Tavern"))
talk Dizzy One-Eye##2493
|tip Upper level of the docks.
turnin Keep An Eye Out##576 |goto Stranglethorn Vale 28.59,75.90
step
talk Viznik Goldgrubber##2625
|tip Collect from the bank.
collect Neeru's Herb Pouch##9628 |goto Stranglethorn Vale/0 26.54,76.57 |q 3122
step
talk Deeg##2488
|tip {o}Top floor{} inside the building.
turnin Up to Snuff##587 |goto Stranglethorn Vale 26.92,77.35
step
talk Fleet Master Seahorn##2487
|tip Up on the balcony of the building.
turnin The Bloodsail Buccaneers##604 |goto Stranglethorn Vale 27.17,77.01
]])
GoatQuest:RegisterGuide("Leveling Guides\\Swamp of Sorrows (47-48)",{
image=GQ.IMAGESDIR.."Swamp of Sorrows",
next="Leveling Guides\\Tanaris & Dustwallow Marsh (48-50)",
},[[
step
talk Fallen Hero of the Horde##7572
accept Fall From Grace##2784 |goto Swamp of Sorrows 34.29,66.13
step
talk Fallen Hero of the Horde##7572
Select _"Why are you here?"_ |gossip 95944
Select _"Continue with your story."_ |gossip 95945
Select _"Tragic..."_ |gossip 98462
Listen to the Tale of Sorrow |q 2784/1 |goto Swamp of Sorrows 34.29,66.13
step
talk Fallen Hero of the Horde##7572
turnin Fall From Grace##2784	 |goto Swamp of Sorrows 34.29,66.13
accept The Disgraced One##2621	 |goto Swamp of Sorrows 34.29,66.13
step
talk Dispatch Commander Ruag##7623
|tip Upstairs inside the building.
turnin The Disgraced One##2621 |goto Swamp of Sorrows 47.79,54.95
accept The Missing Orders##2622 |goto Swamp of Sorrows 47.79,54.95
step
talk Bengor##7643
|tip Inside the building.
turnin The Missing Orders##2622 |goto Swamp of Sorrows 44.98,57.34
accept The Swamp Talker##2623 |goto Swamp of Sorrows 44.98,57.34
step
talk Tok'Kar##5592
accept Lack of Surplus##699 |goto Swamp of Sorrows 81.32,80.97
step
kill Sawtooth Snapper##1087+
|tip Crocodiles.
|tip Careful, stealthed enemies.
collect 6 Sawtooth Snapper Claw##6168 |q 699/1 |goto Swamp of Sorrows 82.00,73.00
|mapmarker Swamp of Sorrows/0 74.00,15.60
|mapmarker Swamp of Sorrows/0 75.60,18.40
|mapmarker Swamp of Sorrows/0 76.40,12.40
|mapmarker Swamp of Sorrows/0 77.40,21.80
|mapmarker Swamp of Sorrows/0 78.20,25.40
|mapmarker Swamp of Sorrows/0 78.20,31.00
|mapmarker Swamp of Sorrows/0 78.40,16.00
|mapmarker Swamp of Sorrows/0 79.40,28.20
|mapmarker Swamp of Sorrows/0 80.00,18.60
|mapmarker Swamp of Sorrows/0 80.40,22.60
|mapmarker Swamp of Sorrows/0 80.40,65.40
|mapmarker Swamp of Sorrows/0 81.00,33.60
|mapmarker Swamp of Sorrows/0 81.40,25.80
|mapmarker Swamp of Sorrows/0 81.40,69.80
|mapmarker Swamp of Sorrows/0 82.40,30.40
|mapmarker Swamp of Sorrows/0 83.20,59.20
|mapmarker Swamp of Sorrows/0 83.40,22.60
|mapmarker Swamp of Sorrows/0 83.40,36.40
|mapmarker Swamp of Sorrows/0 83.40,39.40
|mapmarker Swamp of Sorrows/0 83.40,64.40
|mapmarker Swamp of Sorrows/0 84.60,26.80
|mapmarker Swamp of Sorrows/0 84.60,71.00
|mapmarker Swamp of Sorrows/0 85.00,32.60
|mapmarker Swamp of Sorrows/0 85.00,67.00
|mapmarker Swamp of Sorrows/0 85.20,54.40
|mapmarker Swamp of Sorrows/0 85.40,61.40
|mapmarker Swamp of Sorrows/0 86.20,40.60
|mapmarker Swamp of Sorrows/0 86.40,35.60
|mapmarker Swamp of Sorrows/0 86.40,58.20
|mapmarker Swamp of Sorrows/0 86.80,51.00
|mapmarker Swamp of Sorrows/0 88.60,55.80
|mapmarker Swamp of Sorrows/0 88.60,60.80
|mapmarker Swamp of Sorrows/0 89.40,44.60
|mapmarker Swamp of Sorrows/0 89.80,52.60
step
talk Tok'Kar##5592
turnin Lack of Surplus##699 |goto Swamp of Sorrows 81.32,80.97
accept Threat From the Sea##1422 |goto Swamp of Sorrows 81.32,80.97
step
talk Katar##5593
turnin Threat From the Sea##1422 |goto Swamp of Sorrows 83.75,80.42
accept Threat From the Sea##1426 |goto Swamp of Sorrows 83.75,80.42
stickystart "Kill_Marsh_Flesheaters"
stickystart "Kill_Marsh_Inkspewers"
step
kill 10 Marsh Murloc##747 |q 1426/1 |goto Swamp of Sorrows 85.20,82.20
|mapmarker Swamp of Sorrows/0 79.40,93.40
|mapmarker Swamp of Sorrows/0 81.40,90.40
|mapmarker Swamp of Sorrows/0 83.00,94.60
|mapmarker Swamp of Sorrows/0 83.20,87.20
|mapmarker Swamp of Sorrows/0 84.60,90.80
|mapmarker Swamp of Sorrows/0 86.20,88.00
|mapmarker Swamp of Sorrows/0 86.40,79.40
|mapmarker Swamp of Sorrows/0 87.80,84.80
|mapmarker Swamp of Sorrows/0 89.20,81.20
step
label "Kill_Marsh_Flesheaters"
kill 10 Marsh Flesheater##751 |q 1426/3 |goto Swamp of Sorrows 86.00,80.20
|mapmarker Swamp of Sorrows/0 87.20,75.60
|mapmarker Swamp of Sorrows/0 88.60,78.40
|mapmarker Swamp of Sorrows/0 89.80,74.00
|mapmarker Swamp of Sorrows/0 90.00,71.00
|mapmarker Swamp of Sorrows/0 91.00,66.40
|mapmarker Swamp of Sorrows/0 92.40,62.20
|mapmarker Swamp of Sorrows/0 92.60,69.40
|mapmarker Swamp of Sorrows/0 93.20,58.80
|mapmarker Swamp of Sorrows/0 93.40,48.40
|mapmarker Swamp of Sorrows/0 93.40,51.80
|mapmarker Swamp of Sorrows/0 93.40,55.20
step
label "Kill_Marsh_Inkspewers"
kill 10 Marsh Inkspewer##750 |q 1426/2 |goto Swamp of Sorrows 86.40,83.00
|mapmarker Swamp of Sorrows/0 80.00,93.80
|mapmarker Swamp of Sorrows/0 81.20,89.20
|mapmarker Swamp of Sorrows/0 83.40,84.40
|mapmarker Swamp of Sorrows/0 83.40,93.60
|mapmarker Swamp of Sorrows/0 84.40,87.60
|mapmarker Swamp of Sorrows/0 84.60,90.80
|mapmarker Swamp of Sorrows/0 85.40,79.40
|mapmarker Swamp of Sorrows/0 88.20,75.40
|mapmarker Swamp of Sorrows/0 88.60,78.40
|mapmarker Swamp of Sorrows/0 90.40,68.60
|mapmarker Swamp of Sorrows/0 90.40,72.40
|mapmarker Swamp of Sorrows/0 92.20,65.20
|mapmarker Swamp of Sorrows/0 93.00,53.80
|mapmarker Swamp of Sorrows/0 93.20,59.60
|mapmarker Swamp of Sorrows/0 93.40,49.60
|mapmarker Swamp of Sorrows/0 93.60,68.80
|mapmarker Swamp of Sorrows/0 95.20,56.00
|mapmarker Swamp of Sorrows/0 95.80,52.20
|mapmarker Swamp of Sorrows/0 95.80,62.80
step
talk Katar##5593
turnin Threat From the Sea##1426 |goto Swamp of Sorrows 83.76,80.43
accept Threat From the Sea##1427 |goto Swamp of Sorrows 83.76,80.43
step
talk Tok'Kar##5592
turnin Threat From the Sea##1427 |goto Swamp of Sorrows 81.31,80.97
step
talk Katar##5593
accept Continued Threat##1428 |goto Swamp of Sorrows 83.76,80.41
stickystart "Kill_Marsh_Inkspewers_Flesheaters_And_Oracles"
step
Enter the cave |goto Swamp of Sorrows 66.37,76.54 < 20 |walk |only if not subzone("Stagalbog Cave")
Follow the path up |goto Swamp of Sorrows/0 64.07,87.93 <  15 |walk
kill Swamp Talker##950
|tip {o}Level 50{} grey murloc.
|tip Walks around.
|tip Upstairs inside the cave.
|tip May spawn in other locations.
collect Warchief's Orders##8463 |q 2623/1 |goto Swamp of Sorrows 62.60,88.08
step
label "Kill_Marsh_Inkspewers_Flesheaters_And_Oracles"
kill 10 Marsh Inkspewer##750 |q 1428/1 |goto Swamp of Sorrows 66.37,76.54
kill 10 Marsh Flesheater##751 |q 1428/2 |goto Swamp of Sorrows 66.37,76.54
kill 10 Marsh Oracle##752 |q 1428/3 |goto Swamp of Sorrows 66.37,76.54
|tip Inside the cave. |notinsticky
|mapmarker Swamp of Sorrows/0 60.40,85.40
|mapmarker Swamp of Sorrows/0 61.60,80.40
|mapmarker Swamp of Sorrows/0 62.40,89.00
|mapmarker Swamp of Sorrows/0 63.40,84.40
|mapmarker Swamp of Sorrows/0 64.60,81.60
|mapmarker Swamp of Sorrows/0 65.60,86.60
step
Leave the cave |goto Swamp of Sorrows 66.37,76.54 < 20 |walk |only if subzone("Stagalbog Cave")
talk Katar##5593
turnin Continued Threat##1428 |goto Swamp of Sorrows 83.75,80.42
step
talk Haromm##986
Train Abilities |trainer Haromm##986 |goto Swamp of Sorrows/0 48.18,57.93 |q 2623
|only if Shaman
step
talk Kartosh##988
|tip Inside the building.
Train Abilities |trainer Kartosh##988 |goto Swamp of Sorrows/0 48.64,55.63 |q 2623
|only if Warlock
step
talk Greshka##12807
|tip Buy available Grimoires.
|tip Inside the building.
Train Demon Abilities |vendor Greshka##12807 |goto Swamp of Sorrows/0 48.59,55.27 |q 2623
|only if Warlock
step
talk Ogromm##987
Train Abilities |trainer Ogromm##987 |goto Swamp of Sorrows/0 47.27,53.42 |q 2623
|only if Hunter
step
talk Grokor##3622
Train Pet Abilities |trainer Grokor##3622 |goto Swamp of Sorrows/0 47.35,52.91 |q 2623
|only if Hunter
step
talk Malosh##985
|tip Inside the building.
Train Abilities |trainer Malosh##985 |goto Swamp of Sorrows/0 44.90,57.61 |q 2623
|only if Warrior
step
talk Fallen Hero of the Horde##7572
turnin The Swamp Talker##2623 |goto Swamp of Sorrows 34.29,66.13
accept A Tale of Sorrow##2801 |goto Swamp of Sorrows 34.29,66.13
step
talk Fallen Hero of the Horde##7572
Select _"Please continue, Hero..."_ |gossip 95943
Select _"What could be worse than death?"_ |gossip 95715
Select _"Subordinates?"_ |gossip 95838
Select _"What are the stones of binding?"_ |gossip 95837
Select _"You can count on me, Hero."_ |gossip 95641
Select _"I shall."_ |gossip 95640
Listen to a Tale of Sorrow |q 2801/1 |goto Swamp of Sorrows 34.29,66.13
step
talk Fallen Hero of the Horde##7572
turnin A Tale of Sorrow##2801 |goto Swamp of Sorrows 34.29,66.13
step
talk Loganaar##12042
Train Abilities |trainer Loganaar##12042 |goto Moonglade/0 52.53,40.57 |q 3122
|only if Druid
step
talk Enyo##5883
|tip Inside the building.
Train Abilities |trainer Enyo##5883 |goto Orgrimmar/0 38.79,85.65 |q 3122
|only if Mage
step
talk Witch Doctor Uzer'i##8115
turnin Return to Witch Doctor Uzer'i##3122 |goto Feralas 74.42,43.36
step
Watch the dialogue
talk Witch Doctor Uzer'i##8115
accept Testing the Vessel##3123 |goto Feralas 74.42,43.36
accept The Sunken Temple##3380 |goto Feralas 74.42,43.36
]])
GoatQuest:RegisterGuide("Leveling Guides\\Tanaris & Dustwallow Marsh (48-50)",{
image=GQ.IMAGESDIR.."Tanaris",
next="Leveling Guides\\The Hinterlands (50-52)",
},[[
step
talk Tran'rek##7876
accept Thistleshrub Valley##3362 |goto Tanaris 51.57,26.76
step
talk Senior Surveyor Fizzledowser##7724
accept Gadgetzan Water Survey##992 |goto Tanaris 50.21,27.48
step
use Untapped Dowsing Widget##8584
|tip Avoid {o}elite enemies{}.
|tip You will be attacked.
|tip Careful, {o}two higher level enemies{}.
|tip Run away quickly.
collect Tapped Dowsing Widget##8585 |q 992/1 |goto Tanaris 39.09,29.17
step
talk Senior Surveyor Fizzledowser##7724
turnin Gadgetzan Water Survey##992 |goto Tanaris 50.21,27.48
step
talk Senior Surveyor Fizzledowser##7724
accept Noxious Lair Investigation##82 |goto Tanaris 50.21,27.48
step
talk Gimblethorn##7799
|tip Collect from the bank.
|tip Inside the building.
collect Yeh'kinya's Bramble##10699	|goto Tanaris 52.30,28.91 |q 3520
collect Hippogryph Egg##8564		|goto Tanaris 52.30,28.91 |q 2741 |future
step
talk Gimblethorn##7799
|tip Deposit into the bank.
|tip Inside the building.
bank Wildkin Muisek Vessel##9618	|goto Tanaris 52.30,28.91 |q 3123
step
click Wanted Poster
accept WANTED: Caliph Scorpidsting##2781 |goto Tanaris 51.84,27.02
accept WANTED: Andre Firebeard##2875 |goto Tanaris 51.84,27.02
step
click Egg-O-Matic
accept The Super Egg-O-Matic##2741 |goto Tanaris 52.37,26.97 |instant
|delay 0.2
step
use Egg Crate##8647
collect A Bad Egg##8646			|or
collect An Ordinary Egg##8645		|or
collect A Fine Egg##8644		|or
collect An Extraordinary Egg##8643	|or
|only if itemcount(8647) > 0
|delay 0.2
step
talk Curgle Cranklehop##7763
accept A Bad Egg##2750			|goto Tanaris/0 52.36,26.91	|instant	|only if itemcount(8646) > 0
accept An Ordinary Egg##2749		|goto Tanaris/0 52.36,26.91	|instant	|only if itemcount(8645) > 0
accept A Fine Egg##2748			|goto Tanaris/0 52.36,26.91	|instant	|only if itemcount(8644) > 0
accept An Extraordinary Egg##2747	|goto Tanaris/0 52.36,26.91	|instant	|only if itemcount(8643) > 0
step
talk Andi Lynn##11758
accept The Dunemaul Compound##5863 |goto Tanaris 52.82,27.40
step
talk Chief Engineer Bilgewhizzle##7407
accept More Wastewander Justice##1691 |goto Tanaris 52.46,28.51
step
talk Marin Noggenfogger##7564
accept The Thirsty Goblin##2605 |goto Tanaris 51.81,28.66
step
talk Haughty Modiste##15165
accept Pirate Hats Ahoy!##8365 |goto Tanaris 66.56,22.27
step
talk Yeh'kinya##8579
turnin Screecher Spirits##3520 |goto Tanaris 66.99,22.36
step
talk Security Chief Bilgewhizzle##7882
|tip Inside the building.
accept Southsea Shakedown##8366 |goto Tanaris 67.06,23.89
step
talk Stoley##7881
|tip Inside the building.
accept Stoley's Shipment##2873 |goto Tanaris 67.11,23.98
stickystart "Kill_Wastewander_Assassins_Rogues_Shadow_Mages"
step
map Tanaris/0
path	follow strictbounce;	loop;	ants curved;	dist 40;	markers none;		arrow hide
path	63.84,31.89		63.30,37.23		62.29,37.83		59.52,41.19
path	58.71,38.17		61.87,33.42
kill Caliph Scorpidsting##7847
|tip Walks a large counter-clockwise pattern.
|tip Careful, two stealthed guards.
collect Caliph Scorpidsting's Head##8723 |q 2781/1
Spawns at [Tanaris 58.90,39.30] |noway
step
label "Kill_Wastewander_Assassins_Rogues_Shadow_Mages"
kill 6 Wastewander Assassin##5623 |q 1691/2 |goto Tanaris 60.80,36.60
kill 8 Wastewander Rogue##5615 |q 1691/1 |goto Tanaris 60.80,36.60
|tip Stealthed.
kill 10 Wastewander Shadow Mage##5617 |q 1691/3 |goto Tanaris 60.80,36.60
|mapmarker Tanaris/0 58.40,36.40
|mapmarker Tanaris/0 58.40,38.40
|mapmarker Tanaris/0 60.40,32.40
|mapmarker Tanaris/0 60.40,39.20
|mapmarker Tanaris/0 61.80,34.20
|mapmarker Tanaris/0 63.40,37.40
|mapmarker Tanaris/0 63.40,39.80
|mapmarker Tanaris/0 65.08,39.21
stickystart "Collect_Ship_Schedule"
stickystart "Accept_Find_OOX_17TN"
stickystart "Collect_Southsea_Pirate_Hats"
stickystart "Kill_Southsea_Pirates_And_Freebooters"
stickystart "Kill_Southsea_Dock_Workers"
stickystart "Kill_Southsea_Swashbucklers"
step
Run through the tunnel to enter Lost Rigger Cove |goto Tanaris 68.62,41.46 < 20 |only if walking and not subzone("Lost Rigger Cove")
click Stolen Cargo
|tip Upstairs inside the building.
collect Stoley's Shipment##9244 |q 2873/1 |goto Tanaris 72.19,46.77
step
kill Andre Firebeard##7883
collect Firebeard's Head##9246 |q 2875/1 |goto Tanaris 73.37,47.14
step
label "Collect_Ship_Schedule"
kill Southsea Pirate##7855, Southsea Freebooter##7856, Southsea Dock Worker##7857, Southsea Swashbuckler##7858
collect Pirate's Footlocker##9276+ |n
use Pirate's Footlocker##9276+
collect Ship Schedule##9250 |n
use Ship Schedule##9250
accept Ship Schedules##2876 |goto Tanaris 73.80,46.60 |q 2876 |future
|tip Rare.
|mapmarker Tanaris/0 70.40,42.40
|mapmarker Tanaris/0 71.00,47.20
|mapmarker Tanaris/0 72.40,45.00
|mapmarker Tanaris/0 73.20,48.60
|only if level < 49
step
label "Accept_Find_OOX_17TN"
kill Southsea Pirate##7855, Southsea Freebooter##7856, Southsea Dock Worker##7857, Southsea Swashbuckler##7858
collect OOX-17/TN Distress Beacon##8623 |n
|tip Rare.
use OOX-17/TN Distress Beacon##8623
accept Find OOX-17/TN!##351 |goto Tanaris 73.80,46.60
|mapmarker Tanaris/0 70.40,42.40
|mapmarker Tanaris/0 71.00,47.20
|mapmarker Tanaris/0 72.40,45.00
|mapmarker Tanaris/0 73.20,48.60
|only if level < 49
step
label "Collect_Southsea_Pirate_Hats"
kill Southsea Pirate##7855, Southsea Freebooter##7856, Southsea Dock Worker##7857, Southsea Swashbuckler##7858
collect 20 Southsea Pirate Hat##20519 |q 8365/1 |goto Tanaris 73.80,46.60
|mapmarker Tanaris/0 70.40,42.40
|mapmarker Tanaris/0 71.00,47.20
|mapmarker Tanaris/0 72.40,45.00
|mapmarker Tanaris/0 73.20,48.60
|mapmarker Tanaris/0 76.20,45.60
step
label "Kill_Southsea_Pirates_And_Freebooters"
kill 10 Southsea Pirate##7855 |q 8366/1 |goto Tanaris 73.80,46.60
kill 10 Southsea Freebooter##7856 |q 8366/2 |goto Tanaris 73.80,46.60
|mapmarker Tanaris/0 70.40,42.40
|mapmarker Tanaris/0 71.00,47.20
|mapmarker Tanaris/0 72.40,45.00
|mapmarker Tanaris/0 73.20,48.60
step
label "Kill_Southsea_Dock_Workers"
kill 10 Southsea Dock Worker##7857 |q 8366/3 |goto Tanaris 73.00,47.80
|tip More up on the wooden platforms nearby. |notinsticky
|mapmarker Tanaris/0 74.60,46.40
step
label "Kill_Southsea_Swashbucklers"
kill 10 Southsea Swashbuckler##7858 |q 8366/4 |goto Tanaris 74.40,45.20
|tip More inside buildings. |notinsticky
|mapmarker Tanaris/0 72.20,46.40
|mapmarker Tanaris/0 76.20,45.60
step
Run through the tunnel to leave Lost Rigger Cove |goto Tanaris/0 69.63,42.37 < 20 |only if walking and subzone("Lost Rigger Cove")
talk Security Chief Bilgewhizzle##7882
|tip Inside the building.
turnin WANTED: Andre Firebeard##2875 |goto Tanaris 67.06,23.89
turnin Southsea Shakedown##8366 |goto Tanaris 67.06,23.89
turnin Ship Schedules##2876 |goto Tanaris 67.06,23.89 |only if haveq(2876) or completedq(2876)
step
talk Stoley##7881
|tip Inside the building.
turnin Stoley's Shipment##2873 |goto Tanaris 67.11,23.97
step
talk Haughty Modiste##15165
turnin Pirate Hats Ahoy!##8365 |goto Tanaris 66.56,22.27
step
talk Chief Engineer Bilgewhizzle##7407
turnin WANTED: Caliph Scorpidsting##2781 |goto Tanaris 52.46,28.51
turnin More Wastewander Justice##1691 |goto Tanaris 52.46,28.51
step
talk Marvon Rivetseeker##7771
turnin The Sunken Temple##3380 |goto Tanaris 52.71,45.93
accept The Stone Circle##3444 |goto Tanaris 52.71,45.93
accept Gahz'ridian##3161 |goto Tanaris 52.71,45.93
step
kill Centipaar Wasp##5455, Centipaar Stinger##5456, Centipaar Swarmer##5457, Centipaar Worker##5458, Centipaar Sandreaver##5460, Centipaar Tunneler##5459
|tip Insects.
|tip  {o}Swarmers{} spawn minions. |only if hardcore()
|tip  {o}Stingers{} and {o}Wasps{} cast poison DoTs. |only if hardcore()
collect 5 Centipaar Insect Parts##8587 |q 82/1 |goto Tanaris 36.00,40.00
|mapmarker Tanaris/0 30.40,47.40
|mapmarker Tanaris/0 31.20,44.00
|mapmarker Tanaris/0 31.20,52.60
|mapmarker Tanaris/0 33.00,40.40
|mapmarker Tanaris/0 33.40,47.20
|mapmarker Tanaris/0 34.20,37.40
|mapmarker Tanaris/0 34.20,43.20
|mapmarker Tanaris/0 34.20,50.20
|mapmarker Tanaris/0 36.40,45.60
stickystart "Kill_Dunemaul_Brutes_And_Enforcers"
stickystart "Collect_Gahzridian_Ornaments"
step
kill Gor'marok the Ravager##12046 |q 5863/3 |goto Tanaris 41.50,57.81
|tip Inside the small cave.
step
label "Kill_Dunemaul_Brutes_And_Enforcers"
kill 10 Dunemaul Brute##5474 |q 5863/1 |goto Tanaris 40.40,56.00
kill 10 Dunemaul Enforcer##5472 |q 5863/2 |goto Tanaris 40.40,56.00
|mapmarker Tanaris/0 37.40,56.40
|mapmarker Tanaris/0 38.00,59.20
|mapmarker Tanaris/0 38.20,52.20
|mapmarker Tanaris/0 38.40,54.40
|mapmarker Tanaris/0 39.40,50.40
|mapmarker Tanaris/0 40.00,58.00
|mapmarker Tanaris/0 40.40,53.40
|mapmarker Tanaris/0 41.60,51.40
|mapmarker Tanaris/0 42.40,55.20
|mapmarker Tanaris/0 42.60,53.20
step
label "Collect_Gahzridian_Ornaments"
click Gahz'ridian+
|tip Piles of sand.
collect 30 Gahz'ridian Ornament##8443 |q 3161/1 |goto Tanaris/0 48.20,64.70
|mapmarker Tanaris/0 38.90,73.00
|mapmarker Tanaris/0 39.10,70.70
|mapmarker Tanaris/0 40.30,68.90
|mapmarker Tanaris/0 41.10,71.10
|mapmarker Tanaris/0 41.50,73.70
|mapmarker Tanaris/0 45.60,64.60
|mapmarker Tanaris/0 48.10,67.50
stickystart "Kill_Gnarled_Thistleshrubs_And_Rootshapers"
step
kill Thistleshrub Dew Collector##5481+
|tip Shares spawns.
collect Laden Dew Gland##8428 |q 2605/1 |goto Tanaris 29.80,66.80
|mapmarker Tanaris/0 27.40,63.40
|mapmarker Tanaris/0 27.40,67.20
|mapmarker Tanaris/0 29.40,62.40
|mapmarker Tanaris/0 30.40,64.20
step
label "Kill_Gnarled_Thistleshrubs_And_Rootshapers"
kill 8 Gnarled Thistleshrub##5490 |q 3362/1 |goto Tanaris 29.80,66.80
kill 8 Thistleshrub Rootshaper##5485 |q 3362/2 |goto Tanaris 29.80,66.80
|mapmarker Tanaris/0 27.40,63.40
|mapmarker Tanaris/0 27.40,67.20
|mapmarker Tanaris/0 29.40,62.40
|mapmarker Tanaris/0 30.40,64.20
step
talk Marvon Rivetseeker##7771
turnin Gahz'ridian##3161 |goto Tanaris 52.71,45.93
step
talk Marin Noggenfogger##7564
turnin The Thirsty Goblin##2605 |goto Tanaris 51.81,28.66
accept In Good Taste##2606 |goto Tanaris 51.81,28.66
step
talk Innkeeper Fizzgrimble##7733
|tip Inside the building.
home Gadgetzan |goto Tanaris 52.51,27.92 |q 649 |future
step
talk Andi Lynn##11758
turnin The Dunemaul Compound##5863 |goto Tanaris 52.82,27.40
step
talk Tran'rek##7876
turnin Thistleshrub Valley##3362 |goto Tanaris 51.57,26.76
step
talk Sprinkle##7583
turnin In Good Taste##2606 |goto Tanaris 51.06,26.87
accept Sprinkle's Secret Ingredient##2641 |goto Tanaris 51.06,26.87
step
talk Alchemist Pestlezugg##5594
|tip Inside the building.
turnin Noxious Lair Investigation##82 |goto Tanaris 50.89,26.96
step
talk Senior Surveyor Fizzledowser##7724
accept The Scrimshank Redemption##10 |goto Tanaris 50.21,27.48
step
talk Homing Robot OOX-17/TN##7784
|tip Escort quest.
|tip Wait until it respawns, if missing.
turnin Find OOX-17/TN!##351 |goto Tanaris 60.23,64.72
step
Enter the cave |goto Tanaris 55.78,68.91 < 15 |walk |only if not (subzone("The Gaping Chasm") and indoors())
Follow the path down |goto Tanaris 57.61,70.67 < 10 |walk
click Scrimshank's Surveying Gear
|tip Inside the cave.
collect Scrimshank's Surveying Gear##8593 |q 10/1 |goto Tanaris 55.97,71.18
step
talk Loganaar##12042
Train Abilities |trainer Loganaar##12042 |goto Moonglade/0 52.53,40.57 |q 10
|only if Druid
step
talk Senior Surveyor Fizzledowser##7724
turnin The Scrimshank Redemption##10 |goto Tanaris 50.21,27.48
accept Insect Part Analysis##110 |goto Tanaris 50.21,27.48
step
talk Alchemist Pestlezugg##5594
|tip Inside the building.
turnin Insect Part Analysis##110 |goto Tanaris 50.89,26.96
accept Insect Part Analysis##113 |goto Tanaris 50.89,26.96
step
talk Senior Surveyor Fizzledowser##7724
turnin Insect Part Analysis##113 |goto Tanaris 50.21,27.48
accept Rise of the Silithid##32 |goto Tanaris 50.21,27.48
step
click Marvon's Chest
collect Stone Circle##10556 |q 3444/1 |goto The Barrens 62.50,38.54 |usebank
step
talk Kar Stormsinger##3690
Train Kodo Riding |learnspell Kodo Riding##18995 |goto Mulgore/0 47.65,58.47
Buy a mount from Harb Clawhoof nearby at [Mulgore/0 47.49,58.60]
|only if Tauren and discountgold('Thunder Bluff',500000)
step
talk Enyo##5883
|tip Inside the building.
Train Abilities |trainer Enyo##5883 |goto Orgrimmar/0 38.79,85.65 |q 32
|only if Mage
step
talk Ur'kyo##6018
|tip Inside the building.
Train Abilities |trainer Ur'kyo##6018 |goto Orgrimmar/0 35.59,87.80 |q 32
|only if Priest
step
talk Kardris Dreamseeker##3344
|tip Inside the building.
Train Abilities |trainer Kardris Dreamseeker##3344 |goto Orgrimmar/0 38.80,36.38 |q 32
|only if Shaman
step
talk Ormok##3328
|tip Inside the Cleft of Shadow.
Train Abilities |trainer Ormok##3328 |goto Orgrimmar/0 43.91,54.63 |q 32
|only if Rogue
step
talk Mirket##3325
|tip Inside the Cleft of Shadow.
Train Abilities |trainer Mirket##3325 |goto Orgrimmar/0 48.62,46.95 |q 32
|only if Warlock
step
talk Kurgul##5815
|tip Buy available Grimoires.
|tip Inside the Cleft of Shadow.
Train Demon Abilities |vendor Kurgul##5815 |goto Orgrimmar 47.52,46.72 |q 32
|only if Warlock
step
Run up the stairs |goto Orgrimmar/0 56.42,56.92 < 15 |only if walking
talk Zilzibin Drumlore##7010
|tip Inside the building.
turnin Rise of the Silithid##32 |goto Orgrimmar/0 56.27,46.67
step
talk Dran Droffers##6986
|tip Inside the building.
accept Ripple Recovery##649 |goto Orgrimmar/0 59.48,36.59
step
talk Malton Droffers##6987
|tip Inside the building.
turnin Ripple Recovery##649 |goto Orgrimmar/0 59.64,36.92
accept Ripple Recovery##650 |goto Orgrimmar/0 59.64,36.92
step
talk Grezz Ragefist##3353
|tip Inside the building.
Train Abilities |trainer Grezz Ragefist##3353 |goto Orgrimmar/0 79.78,31.42 |q 650
|only if Warrior
step
talk Ormak Grimshot##3352
|tip Top of the building.
Train Abilities |trainer Ormak Grimshot##3352 |goto Orgrimmar/0 66.06,18.54 |q 650
|only if Hunter
step
talk Xao'tsu##10088
|tip Top of the building.
Train Pet Abilities |trainer Xao'tsu##10088 |goto Orgrimmar/0 66.33,14.82 |q 650
|only if Hunter
step
talk Kildar##4752
Train Wolf Riding |learnspell Wolf Riding##825 |goto Orgrimmar/0 69.40,13.10
Buy a mount from Ogunaro Wolfrunner nearby at [Orgrimmar/0 69.38,12.26]
|only if Orc and discountgold('Orgrimmar',500000)
step
talk Karus##3309
|tip Collect from the bank.
|tip Inside the building.
collect 10 Long Elegant Feather##4589		|goto Orgrimmar 49.58,69.12 |q 7842 |future
collect Wildkin Muisek Vessel##9618		|goto Orgrimmar 49.58,69.12 |q 3123
step
talk Karus##3309
|tip Deposit into the bank.
|tip Inside the building.
bank Stone Circle##10556		|goto Orgrimmar 49.58,69.12 |q 3444
step
talk Innkeeper Gryshka##6929
|tip Inside the building.
home Orgrimmar |goto Orgrimmar 54.09,68.42 |q 4120 |future
step
talk Xar'Ti##7953
Train Raptor Riding |learnspell Raptor Riding##10861 |goto Durotar/0 55.28,75.49
Buy a mount from Zjolnir nearby at [Durotar/0 55.23,75.65]
|only if Troll and discountgold('Darkspear Trolls',500000)
step
talk Velma Warnam##4773
Train Undead Horsemanship |learnspell Undead Horsemanship##10906 |goto Tirisfal Glades/0 60.08,52.57
Buy a mount from Zachariah Post nearby at [Tirisfal Glades/0 59.87,52.68]
|only if Undead and discountgold('Undercity',500000)
step
talk Michael Garrett##4551
fpath Undercity |goto Undercity 63.28,48.58
]])
GoatQuest:RegisterGuide("Leveling Guides\\The Hinterlands (50-52)",{
image=GQ.IMAGESDIR.."The Hinterlands",
next="Leveling Guides\\Un'Goro Crater (52-53)",
},[[
step
talk Oran Snakewrithe##7825
accept Lines of Communication##2995 |goto Undercity 73.06,32.85
step
talk Karos Razok##2226
fpath The Sepulcher |goto Silverpine Forest 45.62,42.60
step
talk Zarise##2389
fpath Tarren Mill |goto Hillsbrad Foothills 60.14,18.62
step
talk Kayren Soothallow##2401
|tip Stock up on ammo.
|tip No level 40 ammo in the Hinterlands.
Visit the Vendor |vendor Kayren Soothallow##2401 |goto Hillsbrad Foothills 62.56,19.91 |q 650
|only if Hunter
step
click Venom Bottle
accept Venom Bottles##2933 |goto The Hinterlands/0 22.99,57.72
step
Follow the path up |goto The Hinterlands 20.80,47.91 < 30 |only if walking and not subzone("Shindigger's Camp")
talk Gilveradin Sunchaser##7801
turnin Ripple Recovery##650 |goto The Hinterlands 26.71,48.59
accept A Sticky Situation##77 |goto The Hinterlands 26.71,48.59
step
click Violet Tragan+
|tip Brown mushrooms.
|tip Underwater.
collect Violet Tragan##8526 |q 2641/1 |goto The Hinterlands 41.04,59.79
step
Follow the road around the mountain and run down the path |goto The Hinterlands 72.48,66.10 < 30 |only if walking and not (subzone("Revantusk Village") or subzone("The Overlook Cliffs"))
talk Smith Slagtree##14737
|tip Walks around.
accept Vilebranch Hooligans##7839 |goto The Hinterlands 77.23,80.12
step
talk Lard##14731
|tip Inside the building.
accept Lard Lost His Lunch##7840 |goto The Hinterlands 78.14,81.38
step
talk Katoom the Angler##14740
accept Snapjaws, Mon!##7815 |goto The Hinterlands 80.33,81.53
step
talk Gorkas##4314
fpath Revantusk Village |goto The Hinterlands 81.70,81.76
stickystart "Kill_Saltwater_Snapjaws"
step
click Lard's Picnic Basket
kill Vilebranch Kidnapper##14748+
|tip Three attack.
collect Lard's Lunch##19034 |q 7840/1 |goto The Hinterlands/0 84.47,41.22
step
label "Kill_Saltwater_Snapjaws"
kill 15 Saltwater Snapjaw##2505 |q 7815/1 |goto The Hinterlands/0 78.20,68.20
|mapmarker The Hinterlands/0 74.40,70.80
|mapmarker The Hinterlands/0 75.40,66.40
|mapmarker The Hinterlands/0 76.40,73.40
|mapmarker The Hinterlands/0 77.20,61.40
|mapmarker The Hinterlands/0 78.60,64.20
|mapmarker The Hinterlands/0 79.40,58.00
|mapmarker The Hinterlands/0 80.00,70.80
|mapmarker The Hinterlands/0 80.40,61.60
|mapmarker The Hinterlands/0 81.40,47.40
|mapmarker The Hinterlands/0 81.40,50.40
|mapmarker The Hinterlands/0 81.40,53.60
step
talk Lard##14731
|tip Inside the building.
turnin Lard Lost His Lunch##7840 |goto The Hinterlands 78.14,81.38
step
talk Katoom the Angler##14740
turnin Snapjaws, Mon!##7815 |goto The Hinterlands 80.33,81.53
step
talk Huntsman Markhor##14741
accept Stalking the Stalkers##7828 |goto The Hinterlands 79.16,79.52
accept Hunt the Savages##7829 |goto The Hinterlands 79.16,79.52
accept Avenging the Fallen##7830 |goto The Hinterlands 79.16,79.52
step
talk Otho Moji'ko##14738
|tip Inside the building.
accept Message to the Wildhammer##7841 |goto The Hinterlands/0 79.40,79.09
step
talk Mystic Yayo'jin##14739
|tip Walks around.
|tip Inside the building.
accept Cannibalistic Cousins##7844 |goto The Hinterlands/0 78.80,78.24
stickystart "Kill_Vilebranch__Soothsayers"
stickystart "Kill_Vilebranch_Scalpers"
stickystart "Collect_Skylord_Plume"
stickystart "Kill_Silvermane_Stalkers"
stickystart "Collect_Wildkin_Muiseks"
stickystart "Kill_Savage_Owlbeasts"
step
Follow the path up |goto The Hinterlands/0 76.06,61.17 < 30 |only if walking and (subzone("Revantusk Village") or subzone("The Overlook Cliffs"))
click Slagtree's Lost Tools
|tip Small silver bucket of tools.
|tip Multiple locations.
collect Slagtree's Lost Tools##19033 |q 7839/1 |goto The Hinterlands/0 72.60,53.00
|mapmarker The Hinterlands/0 53.30,38.80
|mapmarker The Hinterlands/0 57.40,42.40
|mapmarker The Hinterlands/0 66.40,44.80
|mapmarker The Hinterlands/0 71.00,48.60
stickystop "Kill_Vilebranch__Soothsayers"
stickystop "Kill_Vilebranch_Scalpers"
step
label "Collect_Skylord_Plume"
kill Razorbeak Skylord##2659+
|tip Large eagle beasts.
|tip Shared spawns with wolves and owlbeasts.
collect Skylord Plume##19025 |q 7830/1 |goto The Hinterlands/0 60.20,50.60
|mapmarker The Hinterlands/0 49.80,50.20
|mapmarker The Hinterlands/0 50.20,45.20
|mapmarker The Hinterlands/0 50.60,55.40
|mapmarker The Hinterlands/0 50.60,59.80
|mapmarker The Hinterlands/0 52.20,48.00
|mapmarker The Hinterlands/0 52.60,51.60
|mapmarker The Hinterlands/0 53.40,58.20
|mapmarker The Hinterlands/0 53.60,43.60
|mapmarker The Hinterlands/0 55.00,53.60
|mapmarker The Hinterlands/0 55.80,48.40
|mapmarker The Hinterlands/0 57.40,51.80
|mapmarker The Hinterlands/0 58.80,55.80
|mapmarker The Hinterlands/0 60.40,47.00
|mapmarker The Hinterlands/0 61.00,41.20
|mapmarker The Hinterlands/0 61.20,57.80
|mapmarker The Hinterlands/0 62.00,54.40
|mapmarker The Hinterlands/0 62.20,44.20
|mapmarker The Hinterlands/0 63.00,49.40
|mapmarker The Hinterlands/0 64.20,56.60
|mapmarker The Hinterlands/0 64.60,46.40
|mapmarker The Hinterlands/0 65.20,53.00
|mapmarker The Hinterlands/0 65.60,60.20
|mapmarker The Hinterlands/0 65.80,42.00
|mapmarker The Hinterlands/0 66.60,49.80
stickystop "Kill_Silvermane_Stalkers"
stickystop "Collect_Wildkin_Muiseks"
stickystop "Kill_Savage_Owlbeasts"
step
click Horde Supply Crate+
|tip Wooden boxes.
|tip Inside the cave.
collect 10 Hinterlands Honey Ripple##8684 |q 77/1 |goto The Hinterlands/0 57.46,38.88
|mapmarker The Hinterlands/0 56.50,43.90
|mapmarker The Hinterlands/0 57.30,41.20
|mapmarker The Hinterlands/0 59.90,42.40
stickystart "Kill_Vilebranch__Soothsayers"
stickystart "Kill_Vilebranch_Scalpers"
stickystart "Collect_Wildkin_Muiseks"
step
Leave the cave |goto The Hinterlands/0 57.46,38.88 < 20 |walk |only if subzone("Skulk Rock") and indoors()
kill 15 Silvermane Howler##2925 |q 7828/2 |goto The Hinterlands/0 46.60,53.60
|tip Wolves.
|mapmarker The Hinterlands/0 35.40,58.20
|mapmarker The Hinterlands/0 35.80,61.60
|mapmarker The Hinterlands/0 37.00,45.60
|mapmarker The Hinterlands/0 37.40,49.40
|mapmarker The Hinterlands/0 38.20,53.40
|mapmarker The Hinterlands/0 38.40,63.20
|mapmarker The Hinterlands/0 38.60,57.60
|mapmarker The Hinterlands/0 39.00,43.20
|mapmarker The Hinterlands/0 40.40,46.60
|mapmarker The Hinterlands/0 40.40,50.20
|mapmarker The Hinterlands/0 41.00,55.60
|mapmarker The Hinterlands/0 41.20,61.80
|mapmarker The Hinterlands/0 42.20,44.00
|mapmarker The Hinterlands/0 42.20,58.40
|mapmarker The Hinterlands/0 42.60,65.00
|mapmarker The Hinterlands/0 43.40,53.80
|mapmarker The Hinterlands/0 43.60,47.00
|mapmarker The Hinterlands/0 44.60,61.60
|mapmarker The Hinterlands/0 45.40,50.40
|mapmarker The Hinterlands/0 45.40,56.40
|mapmarker The Hinterlands/0 47.00,59.00
|mapmarker The Hinterlands/0 47.20,46.40
|mapmarker The Hinterlands/0 49.80,57.40
|mapmarker The Hinterlands/0 49.80,60.60
step
label "Kill_Vilebranch__Soothsayers"
kill 15 Vilebranch Soothsayer##4467 |q 7844/2 |goto The Hinterlands/0 46.80,63.20
|mapmarker The Hinterlands/0 44.40,65.40
|mapmarker The Hinterlands/0 46.00,68.20
|mapmarker The Hinterlands/0 48.00,67.20
|mapmarker The Hinterlands/0 49.60,63.00
stickystart "Kill_Silvermane_Stalkers"
stickystart "Kill_Savage_Owlbeasts"
step
label "Kill_Vilebranch_Scalpers"
kill 30 Vilebranch Scalper##4466 |q 7844/1 |goto The Hinterlands/0 45.60,63.40
|tip Multiple locations. |notinsticky
|mapmarker The Hinterlands/0 43.80,61.80
|mapmarker The Hinterlands/0 44.60,66.80
|mapmarker The Hinterlands/0 47.40,70.60
|mapmarker The Hinterlands/0 50.20,65.80
|mapmarker The Hinterlands/0 50.60,62.40
|mapmarker The Hinterlands/0 52.20,39.40
|mapmarker The Hinterlands/0 53.20,37.40
|mapmarker The Hinterlands/0 54.60,39.40
|mapmarker The Hinterlands/0 65.20,44.40
|mapmarker The Hinterlands/0 65.60,42.40
|mapmarker The Hinterlands/0 67.60,43.80
|mapmarker The Hinterlands/0 69.40,47.40
|mapmarker The Hinterlands/0 70.60,49.20
|mapmarker The Hinterlands/0 72.60,47.20
step
label "Kill_Silvermane_Stalkers"
kill 15 Silvermane Stalker##2926 |q 7828/1 |goto The Hinterlands/0 51.80,49.40
|tip Stealthed wolves.
|mapmarker The Hinterlands/0 51.40,54.40
|mapmarker The Hinterlands/0 51.60,62.60
|mapmarker The Hinterlands/0 51.80,59.60
|mapmarker The Hinterlands/0 54.20,45.40
|mapmarker The Hinterlands/0 54.40,52.40
|mapmarker The Hinterlands/0 57.40,54.00
|mapmarker The Hinterlands/0 58.40,49.40
|mapmarker The Hinterlands/0 60.40,54.40
|mapmarker The Hinterlands/0 61.20,46.80
|mapmarker The Hinterlands/0 62.00,43.40
|mapmarker The Hinterlands/0 62.20,49.80
|mapmarker The Hinterlands/0 63.00,52.80
|mapmarker The Hinterlands/0 65.40,56.40
|mapmarker The Hinterlands/0 66.40,59.40
|mapmarker The Hinterlands/0 66.60,48.00
|mapmarker The Hinterlands/0 67.60,51.40
|mapmarker The Hinterlands/0 68.20,62.40
|mapmarker The Hinterlands/0 68.80,45.40
|mapmarker The Hinterlands/0 69.00,54.40
|mapmarker The Hinterlands/0 70.40,57.40
|mapmarker The Hinterlands/0 70.80,64.40
|mapmarker The Hinterlands/0 71.40,52.00
|mapmarker The Hinterlands/0 71.40,60.40
|mapmarker The Hinterlands/0 73.40,55.40
|mapmarker The Hinterlands/0 74.00,50.40
|mapmarker The Hinterlands/0 76.00,53.40
|mapmarker The Hinterlands/0 78.00,48.40
step
label "Collect_Wildkin_Muiseks"
kill Savage Owlbeast##2929, Primitive Owlbeast##2928
use Wildkin Muisek Vessel##9618
|tip On their corpses.
collect 10 Wildkin Muisek##9594 |q 3123/1 |goto The Hinterlands/0 57.40,50.40
|mapmarker The Hinterlands/0 51.40,45.60
|mapmarker The Hinterlands/0 51.40,49.40
|mapmarker The Hinterlands/0 51.40,54.20
|mapmarker The Hinterlands/0 51.40,58.40
|mapmarker The Hinterlands/0 51.40,61.40
|mapmarker The Hinterlands/0 54.00,41.20
|mapmarker The Hinterlands/0 54.40,44.20
|mapmarker The Hinterlands/0 54.40,50.40
|mapmarker The Hinterlands/0 55.40,53.60
|mapmarker The Hinterlands/0 56.20,46.80
|mapmarker The Hinterlands/0 58.40,54.60
|mapmarker The Hinterlands/0 60.40,47.40
|mapmarker The Hinterlands/0 60.60,57.80
|mapmarker The Hinterlands/0 61.20,41.40
|mapmarker The Hinterlands/0 62.00,54.20
|mapmarker The Hinterlands/0 62.20,50.60
|mapmarker The Hinterlands/0 63.60,44.40
|mapmarker The Hinterlands/0 63.60,57.00
|mapmarker The Hinterlands/0 65.20,52.20
step
label "Kill_Savage_Owlbeasts"
kill 20 Savage Owlbeast##2929 |q 7829/1 |goto The Hinterlands/0 57.40,50.40
|mapmarker The Hinterlands/0 51.40,45.60
|mapmarker The Hinterlands/0 51.40,49.40
|mapmarker The Hinterlands/0 51.40,54.20
|mapmarker The Hinterlands/0 51.40,58.40
|mapmarker The Hinterlands/0 51.40,61.40
|mapmarker The Hinterlands/0 54.00,41.20
|mapmarker The Hinterlands/0 54.40,44.20
|mapmarker The Hinterlands/0 54.40,50.40
|mapmarker The Hinterlands/0 55.40,53.60
|mapmarker The Hinterlands/0 56.20,46.80
|mapmarker The Hinterlands/0 58.40,54.60
|mapmarker The Hinterlands/0 60.40,47.40
|mapmarker The Hinterlands/0 60.60,57.80
|mapmarker The Hinterlands/0 61.20,41.40
|mapmarker The Hinterlands/0 62.00,54.20
|mapmarker The Hinterlands/0 62.20,50.60
|mapmarker The Hinterlands/0 63.60,44.40
|mapmarker The Hinterlands/0 63.60,57.00
|mapmarker The Hinterlands/0 65.20,52.20
step
Follow the path up |goto The Hinterlands 20.44,48.08 < 30 |only if walking and not subzone("Shindigger's Camp")
talk Gilveradin Sunchaser##7801
turnin A Sticky Situation##77 |goto The Hinterlands 26.71,48.59
accept Ripple Delivery##81 |goto The Hinterlands 26.71,48.59
step
_Destroy These Items:_
|tip Not needed.
trash Hinterlands Honey Ripple##8684
stickystart "Kill_Highvale_Marksmen"
stickystart "Kill_Highvale_Outrunners"
stickystart "Kill_Highvale_Rangers"
stickystart "Kill_Highvale_Scouts"
step
click Highvale Records
|tip Inside the building.
Burn the Highvale Records |q 2995/1 |goto The Hinterlands/0 31.98,46.83
step
talk Rin'ji##7780
|tip Escort quest.
|tip Wait until he respawns, if missing.
|tip Inside the building.
accept Rin'ji is Trapped!##2742 |goto The Hinterlands/0 30.73,46.97 |noautoaccept inparty
step
Watch the dialogue
|tip Follow and protect Rin'ji.
|tip Two groups of three enemies attack.
Escort Rin'ji to Safety |q 2742/1 |goto The Hinterlands/0 34.64,56.38
step
click Highvale Notes
Burn the Highvale Notes |q 2995/2 |goto The Hinterlands/0 29.63,48.66
step
click Highvale Report
Burn the Highvale Report |q 2995/3 |goto The Hinterlands/0 28.56,46.05
step
label "Kill_Highvale_Marksmen"
kill 15 Highvale Marksman##2693 |q 7841/4 |goto The Hinterlands/0 31.74,49.40
|mapmarker The Hinterlands/0 28.40,46.40
|mapmarker The Hinterlands/0 29.20,49.20
|mapmarker The Hinterlands/0 32.00,46.00
|mapmarker The Hinterlands/0 32.40,43.60
step
label "Kill_Highvale_Outrunners"
kill 15 Highvale Outrunner##2691 |q 7841/2 |goto The Hinterlands/0 32.20,51.00
|mapmarker The Hinterlands/0 29.00,51.20
|mapmarker The Hinterlands/0 33.20,42.60
|mapmarker The Hinterlands/0 33.60,53.40
|mapmarker The Hinterlands/0 33.80,48.40
step
label "Kill_Highvale_Rangers"
kill 15 Highvale Ranger##2694 |q 7841/3 |goto The Hinterlands/0 32.40,50.40
|mapmarker The Hinterlands/0 28.40,45.20
|mapmarker The Hinterlands/0 30.40,48.40
|mapmarker The Hinterlands/0 30.80,43.40
|mapmarker The Hinterlands/0 33.40,53.20
step
label "Kill_Highvale_Scouts"
kill 15 Highvale Scout##2692 |q 7841/1 |goto The Hinterlands/0 32.20,50.60
|mapmarker The Hinterlands/0 29.20,48.40
|mapmarker The Hinterlands/0 29.40,50.80
|mapmarker The Hinterlands/0 31.20,48.20
|mapmarker The Hinterlands/0 32.40,43.40
|mapmarker The Hinterlands/0 32.40,45.40
|mapmarker The Hinterlands/0 33.20,48.20
step
use OOX-09/HL Distress Beacon##8704
accept Find OOX-09/HL!##485
|only if itemcount(8704) > 0
step
talk Homing Robot OOX-09/HL##7806
turnin Find OOX-09/HL!##485 |goto The Hinterlands/0 49.35,37.66
|only if haveq(485) or completedq(485)
step
click Rin'ji's Secret
|tip Follow the road down to the coast.
|tip Can also follow the river and jump off the waterfall.
turnin Rin'ji is Trapped!##2742 |goto The Hinterlands/0 86.30,59.01
accept Rin'ji's Secret##2782 |goto The Hinterlands/0 86.30,59.01
step
talk Smith Slagtree##14737
|tip Walks around.
turnin Vilebranch Hooligans##7839 |goto The Hinterlands/0 77.24,80.12
step
talk Mystic Yayo'jin##14739
|tip Walks around.
|tip Inside the building.
turnin Cannibalistic Cousins##7844 |goto The Hinterlands/0 78.80,78.25
step
talk Otho Moji'ko##14738
|tip Inside the building.
turnin Message to the Wildhammer##7841 |goto The Hinterlands/0 79.40,79.08
accept Another Message to the Wildhammer##7842 |goto The Hinterlands/0 79.40,79.08
step
talk Otho Moji'ko##14738
|tip Inside the building.
turnin Another Message to the Wildhammer##7842 |goto The Hinterlands/0 79.40,79.08
step
_Destroy These Items:_
|tip Not needed.
trash Long Elegant Feather##4589
step
talk Huntsman Markhor##14741
turnin Stalking the Stalkers##7828 |goto The Hinterlands/0 79.16,79.53
turnin Hunt the Savages##7829 |goto The Hinterlands/0 79.16,79.53
turnin Avenging the Fallen##7830 |goto The Hinterlands/0 79.16,79.53
step
talk Apothecary Lydon##2216
|tip Inside the building.
turnin Venom Bottles##2933 |goto Hillsbrad Foothills 61.44,19.06
step
talk Oran Snakewrithe##7825
turnin Lines of Communication##2995 |goto Undercity 73.07,32.85
turnin Rin'ji's Secret##2782 |goto Undercity 73.07,32.85
accept Ora's Gratitude##8273 |goto Undercity 73.07,32.85 |instant
step
talk Velma Warnam##4773
Train Undead Horsemanship |learnspell Undead Horsemanship##10906 |goto Tirisfal Glades/0 60.08,52.57
Buy a mount from Zachariah Post nearby at [Tirisfal Glades/0 59.87,52.68]
|only if Undead and discountgold('Undercity',500000)
step
talk Loganaar##12042
Train Abilities |trainer Loganaar##12042 |goto Moonglade/0 52.53,40.57 |q 81
|only if Druid
step
talk Enyo##5883
|tip Inside the building.
Train Abilities |trainer Enyo##5883 |goto Orgrimmar/0 38.79,85.65 |q 81
|only if Mage
step
talk Ur'kyo##6018
|tip Inside the building.
Train Abilities |trainer Ur'kyo##6018 |goto Orgrimmar/0 35.59,87.80 |q 81
|only if Priest
step
talk Kardris Dreamseeker##3344
|tip Inside the building.
Train Abilities |trainer Kardris Dreamseeker##3344 |goto Orgrimmar/0 38.80,36.38 |q 81
|only if Shaman
step
talk Ormok##3328
|tip Inside the Cleft of Shadow.
Train Abilities |trainer Ormok##3328 |goto Orgrimmar/0 43.91,54.63 |q 81
|only if Rogue
step
talk Mirket##3325
|tip Inside the Cleft of Shadow.
Train Abilities |trainer Mirket##3325 |goto Orgrimmar/0 48.62,46.95 |q 81
|only if Warlock
step
talk Kurgul##5815
|tip Buy available Grimoires.
|tip Inside the Cleft of Shadow.
Train Demon Abilities |vendor Kurgul##5815 |goto Orgrimmar 47.52,46.72 |q 81
|only if Warlock
step
talk Dran Droffers##6986
|tip Inside the building.
turnin Ripple Delivery##81 |goto Orgrimmar/0 59.48,36.59
step
talk Jes'rimon##8659
|tip Up on the balcony of the building.
accept Bone-Bladed Weapons##4300 |goto Orgrimmar 55.51,34.09
step
talk Ormak Grimshot##3352
|tip Top of the building.
Train Abilities |trainer Ormak Grimshot##3352 |goto Orgrimmar/0 66.06,18.54 |q 2641
|only if Hunter
step
talk Grezz Ragefist##3353
|tip Inside the building.
Train Abilities |trainer Grezz Ragefist##3353 |goto Orgrimmar/0 79.78,31.42 |q 2641
|only if Warrior
step
talk Kildar##4752
Train Wolf Riding |learnspell Wolf Riding##825 |goto Orgrimmar/0 69.40,13.10
Buy a mount from Ogunaro Wolfrunner nearby at [Orgrimmar/0 69.38,12.26]
|only if Orc and discountgold('Orgrimmar',500000)
step
talk Auctioneer Thathung##8673
|tip Buy from the Auction House, if possible.
|tip Saves time in Un'Goro Crater.
|tip Inside the building.
collect 7 Red Power Crystal##11186	|goto Orgrimmar 55.69,62.86 |q 4284 |future
collect 7 Yellow Power Crystal##11188	|goto Orgrimmar 55.69,62.86 |q 4284 |future
collect 7 Green Power Crystal##11185	|goto Orgrimmar 55.69,62.86 |q 4284 |future
collect 7 Blue Power Crystal##11184	|goto Orgrimmar 55.69,62.86 |q 4284 |future
step
talk Karus##3309
|tip Collect from the bank.
|tip Inside the building.
collect Stone Circle##10556 |goto Orgrimmar 49.58,69.12 |q 3444
step
talk Xar'Ti##7953
Train Raptor Riding |learnspell Raptor Riding##10861 |goto Durotar/0 55.28,75.49
Buy a mount from Zjolnir nearby at [Durotar/0 55.23,75.65]
|only if Troll and discountgold('Darkspear Trolls',500000)
step
talk Kar Stormsinger##3690
Train Kodo Riding |learnspell Kodo Riding##18995 |goto Mulgore/0 47.65,58.47
Buy a mount from Harb Clawhoof nearby at [Mulgore/0 47.49,58.60]
|only if Tauren and discountgold('Thunder Bluff',500000)
step
talk Talo Thornhoof##7776
|tip Inside the building.
accept The Strength of Corruption##4120 |goto Feralas 76.18,43.83
step
talk Witch Doctor Uzer'i##8115
turnin Testing the Vessel##3123 |goto Feralas 74.42,43.36
step
talk Sprinkle##7583
turnin Sprinkle's Secret Ingredient##2641 |goto Tanaris 51.06,26.87
step
Watch the dialogue
talk Sprinkle##7583
accept Delivery for Marin##2661 |goto Tanaris 51.06,26.87
step
talk Marin Noggenfogger##7564
turnin Delivery for Marin##2661 |goto Tanaris 51.81,28.66
accept Noggenfogger Elixir##2662 |goto Tanaris 51.81,28.66
step
Watch the dialogue
talk Marin Noggenfogger##7564
turnin Noggenfogger Elixir##2662 |goto Tanaris 51.81,28.66
step
talk Marvon Rivetseeker##7771
turnin The Stone Circle##3444 |goto Tanaris 52.71,45.93
]])
GoatQuest:RegisterGuide("Leveling Guides\\Un'Goro Crater (52-53)",{
image=GQ.IMAGESDIR.."Un'Goro Crater",
next="Leveling Guides\\Felwood & Winterspring (53-54)",
},[[
step
talk Torwa Pathfinder##9619
accept The Apes of Un'Goro##4289 |goto Un'Goro Crater 71.64,75.96
accept The Fare of Lar'korwi##4290 |goto Un'Goro Crater 71.64,75.96
stickystart "Collect_White_Ravasaur_Claws"
stickystart "Accept_Willidens_Journal"
stickystart "Collect_Power_Crystals"
stickystart "Collect_UnGoro_Soil"
step
click A Wrecked Raft
accept It's a Secret to Everybody##3844 |goto Un'Goro Crater 63.02,68.50
step
click A Small Pack
|tip Underwater.
turnin It's a Secret to Everybody##3844 |goto Un'Goro Crater 63.12,69.02
accept It's a Secret to Everybody##3845 |goto Un'Goro Crater 63.12,69.02
step
click Fresh Threshadon Carcass
|tip Avoid the elite t-rex.
collect Piece of Threshadon Carcass##11504 |q 4290/1 |goto Un'Goro Crater 68.75,56.66
step
talk Torwa Pathfinder##9619
turnin The Fare of Lar'korwi##4290 |goto Un'Goro Crater 71.64,75.97
accept The Scent of Lar'korwi##4291 |goto Un'Goro Crater 71.64,75.97
step
kill Lar'korwi Mate##9683+
|tip Stand on piles of purple eggs.
collect 2 Ravasaur Pheromone Gland##11509 |q 4291/1 |goto Un'Goro Crater 67.20,73.00
|mapmarker Un'Goro Crater/0 58.20,78.20
|mapmarker Un'Goro Crater/0 60.80,72.20
|mapmarker Un'Goro Crater/0 62.20,65.40
|mapmarker Un'Goro Crater/0 62.80,80.40
|mapmarker Un'Goro Crater/0 63.20,77.20
|mapmarker Un'Goro Crater/0 63.80,62.80
|mapmarker Un'Goro Crater/0 66.40,66.80
|mapmarker Un'Goro Crater/0 67.00,62.40
|mapmarker Un'Goro Crater/0 67.20,60.40
|mapmarker Un'Goro Crater/0 68.40,54.40
|mapmarker Un'Goro Crater/0 71.40,60.00
step
label "Collect_White_Ravasaur_Claws"
kill Ravasaur Hunter##6507, Venomhide Ravasaur##6508, Ravasaur##6505, Ravasaur Runner##6506
|tip Raptors.
collect 8 White Ravasaur Claw##11477 |q 4300/1 |goto Un'Goro Crater 65.00,70.40
|mapmarker Un'Goro Crater/0 57.20,77.40
|mapmarker Un'Goro Crater/0 59.40,72.60
|mapmarker Un'Goro Crater/0 59.40,81.00
|mapmarker Un'Goro Crater/0 60.20,75.60
|mapmarker Un'Goro Crater/0 60.40,66.40
|mapmarker Un'Goro Crater/0 60.40,69.40
|mapmarker Un'Goro Crater/0 61.80,79.00
|mapmarker Un'Goro Crater/0 62.00,82.60
|mapmarker Un'Goro Crater/0 62.40,72.00
|mapmarker Un'Goro Crater/0 63.20,75.20
|mapmarker Un'Goro Crater/0 63.40,62.80
|mapmarker Un'Goro Crater/0 63.80,66.20
|mapmarker Un'Goro Crater/0 64.80,78.20
|mapmarker Un'Goro Crater/0 67.00,73.40
|mapmarker Un'Goro Crater/0 67.60,68.40
|mapmarker Un'Goro Crater/0 68.00,61.60
|mapmarker Un'Goro Crater/0 68.20,78.00
|mapmarker Un'Goro Crater/0 60.60,49.40
|mapmarker Un'Goro Crater/0 60.80,52.40
|mapmarker Un'Goro Crater/0 61.00,56.60
|mapmarker Un'Goro Crater/0 62.20,59.40
|mapmarker Un'Goro Crater/0 63.20,47.80
|mapmarker Un'Goro Crater/0 63.40,44.20
|mapmarker Un'Goro Crater/0 63.60,54.40
|mapmarker Un'Goro Crater/0 65.20,50.60
|mapmarker Un'Goro Crater/0 65.40,59.00
|mapmarker Un'Goro Crater/0 66.20,42.00
|mapmarker Un'Goro Crater/0 66.60,46.20
|mapmarker Un'Goro Crater/0 67.20,54.00
|mapmarker Un'Goro Crater/0 67.40,64.60
|mapmarker Un'Goro Crater/0 68.40,49.80
|mapmarker Un'Goro Crater/0 68.80,56.60
|mapmarker Un'Goro Crater/0 69.00,43.60
|mapmarker Un'Goro Crater/0 70.00,52.40
|mapmarker Un'Goro Crater/0 70.20,46.80
|mapmarker Un'Goro Crater/0 70.40,63.20
|mapmarker Un'Goro Crater/0 70.60,59.40
|mapmarker Un'Goro Crater/0 71.60,55.00
|mapmarker Un'Goro Crater/0 72.00,42.60
|mapmarker Un'Goro Crater/0 72.40,49.80
|mapmarker Un'Goro Crater/0 73.40,62.80
|mapmarker Un'Goro Crater/0 74.00,57.20
|mapmarker Un'Goro Crater/0 75.40,51.40
step
label "Accept_Willidens_Journal"
Kill enemies
|tip Any in Un'Goro Crater.
collect A Mangled Journal##11116 |n
use A Mangled Journal##11116
accept Williden's Journal##3884 |goto Un'Goro Crater 65.00,70.40
|mapmarker Un'Goro Crater/0 57.20,77.40
|mapmarker Un'Goro Crater/0 59.40,72.60
|mapmarker Un'Goro Crater/0 59.40,81.00
|mapmarker Un'Goro Crater/0 60.20,75.60
|mapmarker Un'Goro Crater/0 60.40,66.40
|mapmarker Un'Goro Crater/0 60.40,69.40
|mapmarker Un'Goro Crater/0 61.80,79.00
|mapmarker Un'Goro Crater/0 62.00,82.60
|mapmarker Un'Goro Crater/0 62.40,72.00
|mapmarker Un'Goro Crater/0 63.20,75.20
|mapmarker Un'Goro Crater/0 63.40,62.80
|mapmarker Un'Goro Crater/0 63.80,66.20
|mapmarker Un'Goro Crater/0 64.80,78.20
|mapmarker Un'Goro Crater/0 67.00,73.40
|mapmarker Un'Goro Crater/0 67.60,68.40
|mapmarker Un'Goro Crater/0 68.00,61.60
|mapmarker Un'Goro Crater/0 68.20,78.00
|mapmarker Un'Goro Crater/0 60.60,49.40
|mapmarker Un'Goro Crater/0 60.80,52.40
|mapmarker Un'Goro Crater/0 61.00,56.60
|mapmarker Un'Goro Crater/0 62.20,59.40
|mapmarker Un'Goro Crater/0 63.20,47.80
|mapmarker Un'Goro Crater/0 63.40,44.20
|mapmarker Un'Goro Crater/0 63.60,54.40
|mapmarker Un'Goro Crater/0 65.20,50.60
|mapmarker Un'Goro Crater/0 65.40,59.00
|mapmarker Un'Goro Crater/0 66.20,42.00
|mapmarker Un'Goro Crater/0 66.60,46.20
|mapmarker Un'Goro Crater/0 67.20,54.00
|mapmarker Un'Goro Crater/0 67.40,64.60
|mapmarker Un'Goro Crater/0 68.40,49.80
|mapmarker Un'Goro Crater/0 68.80,56.60
|mapmarker Un'Goro Crater/0 69.00,43.60
|mapmarker Un'Goro Crater/0 70.00,52.40
|mapmarker Un'Goro Crater/0 70.20,46.80
|mapmarker Un'Goro Crater/0 70.40,63.20
|mapmarker Un'Goro Crater/0 70.60,59.40
|mapmarker Un'Goro Crater/0 71.60,55.00
|mapmarker Un'Goro Crater/0 72.00,42.60
|mapmarker Un'Goro Crater/0 72.40,49.80
|mapmarker Un'Goro Crater/0 73.40,62.80
|mapmarker Un'Goro Crater/0 74.00,57.20
|mapmarker Un'Goro Crater/0 75.40,51.40
step
talk Torwa Pathfinder##9619
turnin The Scent of Lar'korwi##4291 |goto Un'Goro Crater 71.63,75.97
accept The Bait for Lar'korwi##4292 |goto Un'Goro Crater 71.63,75.97
step
label "Collect_Power_Crystals"
click Power Crystal+
|tip Clusters of colored crystals.
|tip Shared spawns, loot all you see.
|tip Makes other colors spawn.
collect 7 Red Power Crystal##11186	|q 4284		|future		|only if itemcount(11186) < 7
collect 7 Yellow Power Crystal##11188	|q 4284		|future		|only if itemcount(11188) < 7
collect 7 Green Power Crystal##11185	|q 4284		|future		|only if itemcount(11185) < 7
collect 7 Blue Power Crystal##11184	|q 4284		|future		|only if itemcount(11184) < 7
|mapmarker Un'Goro Crater/0 54.10,18.10
|mapmarker Un'Goro Crater/0 55.80,7.90
|mapmarker Un'Goro Crater/0 56.00,18.50
|mapmarker Un'Goro Crater/0 56.40,12.30
|mapmarker Un'Goro Crater/0 57.30,10.20
|mapmarker Un'Goro Crater/0 58.10,8.80
|mapmarker Un'Goro Crater/0 59.20,20.40
|mapmarker Un'Goro Crater/0 61.00,15.10
|mapmarker Un'Goro Crater/0 62.30,68.50
|mapmarker Un'Goro Crater/0 62.40,70.30
|mapmarker Un'Goro Crater/0 62.60,16.70
|mapmarker Un'Goro Crater/0 62.60,26.90
|mapmarker Un'Goro Crater/0 63.20,75.20
|mapmarker Un'Goro Crater/0 63.30,23.10
|mapmarker Un'Goro Crater/0 64.20,54.00
|mapmarker Un'Goro Crater/0 65.20,79.70
|mapmarker Un'Goro Crater/0 66.10,21.10
|mapmarker Un'Goro Crater/0 66.60,47.00
|mapmarker Un'Goro Crater/0 66.80,73.30
|mapmarker Un'Goro Crater/0 67.70,40.40
|mapmarker Un'Goro Crater/0 68.10,51.40
|mapmarker Un'Goro Crater/0 68.30,25.30
|mapmarker Un'Goro Crater/0 68.40,59.70
|mapmarker Un'Goro Crater/0 69.10,28.90
|mapmarker Un'Goro Crater/0 69.40,79.90
|mapmarker Un'Goro Crater/0 69.60,35.10
|mapmarker Un'Goro Crater/0 69.60,69.40
|mapmarker Un'Goro Crater/0 69.90,18.90
|mapmarker Un'Goro Crater/0 70.10,77.10
|mapmarker Un'Goro Crater/0 71.10,42.90
|mapmarker Un'Goro Crater/0 71.60,73.60
|mapmarker Un'Goro Crater/0 71.70,63.50
|mapmarker Un'Goro Crater/0 71.90,23.00
|mapmarker Un'Goro Crater/0 72.10,33.10
|mapmarker Un'Goro Crater/0 72.30,21.10
|mapmarker Un'Goro Crater/0 72.40,35.40
|mapmarker Un'Goro Crater/0 72.80,52.10
|mapmarker Un'Goro Crater/0 72.90,46.90
|mapmarker Un'Goro Crater/0 73.00,65.40
|mapmarker Un'Goro Crater/0 73.80,53.40
|mapmarker Un'Goro Crater/0 74.40,57.00
|mapmarker Un'Goro Crater/0 74.40,63.80
|mapmarker Un'Goro Crater/0 74.80,29.60
|mapmarker Un'Goro Crater/0 74.80,58.90
|mapmarker Un'Goro Crater/0 74.90,70.50
|mapmarker Un'Goro Crater/0 75.10,37.40
|mapmarker Un'Goro Crater/0 75.20,61.60
|mapmarker Un'Goro Crater/0 75.90,40.10
|mapmarker Un'Goro Crater/0 76.60,43.80
|mapmarker Un'Goro Crater/0 76.80,57.70
|mapmarker Un'Goro Crater/0 78.20,40.10
|mapmarker Un'Goro Crater/0 79.30,57.90
|mapmarker Un'Goro Crater/0 79.90,61.90
|mapmarker Un'Goro Crater/0 80.40,49.70
|mapmarker Un'Goro Crater/0 80.60,43.00
|mapmarker Un'Goro Crater/0 81.40,39.10
|mapmarker Un'Goro Crater/0 81.60,60.60
|only if itemcount(11186) < 7 or itemcount(11188) < 7 or itemcount(11185) < 7 or itemcount(11184) < 7
step
use A Small Pack##11107
collect Large Compass##11104 |q 3845/1
collect Curled Map Parchment##11105 |q 3845/2
collect Lion-headed Key##11106 |q 3845/3
step
_Destroy This Item:_
|tip Not needed.
trash Faded Photograph##11108
trash Heavy Throwing Dagger##3108
step
talk Linken##8737
turnin It's a Secret to Everybody##3845 |goto Un'Goro Crater 44.66,8.11
accept It's a Secret to Everybody##3908 |goto Un'Goro Crater 44.66,8.11
stickystop "Collect_UnGoro_Soil"
step
talk Williden Marshal##9270
turnin Williden's Journal##3884 |goto Un'Goro Crater 43.95,7.14
step
Enter the cave |goto Un'Goro Crater 43.47,6.79 < 15 |walk |only if not (subzone("Marshal's Refuge") and indoors())
talk J.D. Collie##9117
|tip Inside the cave.
accept Crystals of Power##4284 |goto Un'Goro Crater 41.92,2.70
step
talk J.D. Collie##9117
|tip Inside the cave.
turnin Crystals of Power##4284 |goto Un'Goro Crater 41.92,2.70
step
_Destroy These Items:_
|tip Not needed.
trash Red Power Crystal##11186
trash Yellow Power Crystal##11188
trash Green Power Crystal##11185
trash Blue Power Crystal##11184
step
Leave the cave |goto Un'Goro Crater 43.47,6.81 < 15 |walk |only if subzone("Marshal's Refuge") and indoors()
talk Gryfe##10583
fpath Marshal's Refuge |goto Un'Goro Crater/0 45.23,5.84
step
label "Collect_UnGoro_Soil"
click Un'Goro Dirt Pile+
Kill enemies
collect 25 Un'Goro Soil##11018 |multiq 3761,4496 |future |usebank
|tip Don't vendor them.
|sticky only
step
talk Jes'rimon##8659
|tip Up on the balcony of the building.
turnin Bone-Bladed Weapons##4300 |goto Orgrimmar 55.51,34.09
step
talk Karus##3309
|tip Deposit into the bank.
|tip Inside the building.
bank Torwa's Pouch##11568	|goto Orgrimmar 49.58,69.12 |q 4292
bank Un'Goro Soil##11018	|goto Orgrimmar 49.58,69.12 |multiq 3761,4496 |future
]])
GoatQuest:RegisterGuide("Leveling Guides\\Felwood & Winterspring (53-54)",{
image=GQ.IMAGESDIR.."Felwood",
next="Leveling Guides\\Un'Goro Crater (54-56)",
},[[
step
talk Greta Mosshoof##10922
|tip Walks around.
accept Forces of Jaedenar##5155 |goto Felwood 51.21,82.11
step
talk Taronn Redfeather##10921
|tip Inside the building.
accept Verifying the Corruption##5156 |goto Felwood 50.89,81.62
step
talk Grazle##11554
accept Timbermaw Ally##8460 |goto Felwood 50.93,85.01
step
kill 6 Deadwood Warrior##7153 |q 8460/1 |goto Felwood 48.40,89.20
kill 6 Deadwood Pathfinder##7155 |q 8460/2 |goto Felwood 48.40,89.20
kill 6 Deadwood Gardener##7154 |q 8460/3 |goto Felwood 48.40,89.20
|mapmarker Felwood/0 46.20,89.20
|mapmarker Felwood/0 46.80,91.80
|mapmarker Felwood/0 48.00,93.40
|mapmarker Felwood/0 49.40,91.60
step
talk Grazle##11554
turnin Timbermaw Ally##8460 |goto Felwood 50.93,85.02
accept Speak to Nafien##8462 |goto Felwood 50.93,85.02
step
kill Deadwood Warrior##7153, Deadwood Pathfinder##7155, Deadwood Gardener##7154
collect 5 Deadwood Headdress Feather##21377 |goto Felwood 48.40,89.20 |q 8466 |future
|mapmarker Felwood/0 46.20,89.20
|mapmarker Felwood/0 46.80,91.80
|mapmarker Felwood/0 48.00,93.40
|mapmarker Felwood/0 49.40,91.60
|only if rep('Timbermaw Hold') < Unfriendly
step
talk Grazle##11554
accept Feathers for Grazle##8466 |goto Felwood 50.93,85.02
|only if rep('Timbermaw Hold') < Unfriendly
step
kill Deadwood Warrior##7153, Deadwood Pathfinder##7155, Deadwood Gardener##7154
collect Deadwood Headdress Feather##21377+ |n
|tip Don't vendor them.
|tip Can be turned in later for {o}xp and reputation{}.
Reach {y}Unfriendly{} Reputation with the Timbermaw Hold Faction |complete rep('Timbermaw Hold') >= Unfriendly |goto Felwood 48.40,89.20
|mapmarker Felwood/0 46.20,89.20
|mapmarker Felwood/0 46.80,91.80
|mapmarker Felwood/0 48.00,93.40
|mapmarker Felwood/0 49.40,91.60
step
talk Maybess Riverbreeze##9529
|tip Walks around.
accept Cleansing Felwood##4102 |goto Felwood 46.68,82.98
step
kill 4 Jaedenar Hound##7125 |q 5155/1 |goto Felwood 40.40,57.60
kill 4 Jaedenar Guardian##7113 |q 5155/2 |goto Felwood 40.40,57.60
kill 6 Jaedenar Adept##7115 |q 5155/3 |goto Felwood 40.40,57.60
kill 6 Jaedenar Cultist##7112 |q 5155/4 |goto Felwood 40.40,57.60
|tip More inside the caves.
|mapmarker Felwood/0 35.39,58.57
|mapmarker Felwood/0 36.40,61.20
|mapmarker Felwood/0 38.20,60.20
|mapmarker Felwood/0 38.60,57.60
|mapmarker Felwood/0 39.11,59.52
|mapmarker Felwood/0 38.60,57.60
step
Follow the path |goto Felwood 38.65,57.32 < 40 |only if walking and subzone("Jaedenar")
Follow the river west |goto Felwood 37.54,49.25 < 40 |only if walking and not subzone("Bloodvenom Post ")
talk Winna Hazzard##9996
accept Well of Corruption##4505 |goto Felwood 34.21,52.34
step
talk Dreka'Sur##9620
accept A Husband's Last Battle##6162 |goto Felwood 34.80,52.73
step
talk Brakkar##11900
fpath Bloodvenom Post |goto Felwood 34.44,53.96
step
Run around the mountain and follow the path |goto Felwood 36.64,66.86 < 40 |only if walking
use Hardened Flasket##12566
|tip Careful, stealthed enemies.
collect Filled Flasket##12567 |q 4505/1 |goto Felwood 32.41,66.58
step
kill Overlord Ror##9464
collect Overlord Ror's Claw##15879 |q 6162/1 |goto Felwood 48.23,94.27
step
talk Greta Mosshoof##10922
|tip Walks around.
turnin Forces of Jaedenar##5155 |goto Felwood 51.21,82.11
accept Collection of the Corrupt Water##5157 |goto Felwood 51.21,82.11
step
Follow the path into Jaedenar |goto Felwood 38.43,59.68 < 30 |only if walking
use Empty Canteen##12922
collect Corrupt Moonwell Water##12907 |q 5157/1 |goto Felwood 35.19,59.95
stickystart "Kill_Entropic_Beasts_And_Horrors"
step
Explore the Craters in Shatter Scar Vale |q 5156/3 |goto Felwood 41.54,42.98
step
label "Kill_Entropic_Beasts_And_Horrors"
kill 2 Entropic Beast##9878 |q 5156/1 |goto Felwood 42.60,41.40
kill 2 Entropic Horror##9879 |q 5156/2 |goto Felwood 42.60,41.40
|mapmarker Felwood/0 40.00,38.40
|mapmarker Felwood/0 40.00,43.40
|mapmarker Felwood/0 40.40,41.00
|mapmarker Felwood/0 41.40,36.40
|mapmarker Felwood/0 42.20,43.60
|mapmarker Felwood/0 42.60,38.00
|mapmarker Felwood/0 44.20,42.80
|mapmarker Felwood/0 44.40,40.40
|mapmarker Felwood/0 45.20,38.00
|mapmarker Felwood/0 46.60,39.60
step
_NOTE:_
Attack an Angermaw Grizzly
|tip Find one that's {o}level 52{}.
|tip Make your pet attack an Angermaw Grizzly.
|tip Angermaw Grizzly does a {o}stun attack{}.
|tip Wait for your pet to get {o}stunned{}, then {o}abandon it{}.
Tame the Angermaw Grizzly
|tip Cast {o}Tame Beast{} on the Angermaw Grizzly.
|tip It shouldn't stun you.
|tip New permanent pet.
Click Here to Continue |confirm |goto Felwood/0 52.00,16.00 |q 4102
|mapmarker Felwood/0 50.00,13.20
|mapmarker Felwood/0 52.40,27.20
|mapmarker Felwood/0 53.80,13.40
|mapmarker Felwood/0 54.60,25.00
|mapmarker Felwood/0 55.40,10.40
|mapmarker Felwood/0 55.40,21.20
|mapmarker Felwood/0 56.40,6.40
|mapmarker Felwood/0 57.40,18.40
|mapmarker Felwood/0 58.20,15.20
|mapmarker Felwood/0 60.80,17.00
|mapmarker Felwood/0 63.40,13.40
|mapmarker Felwood/0 64.40,19.80
|only if Hunter
step
kill Warpwood Moss Flayer##7100, Warpwood Shredder##7101
|tip Swamp elementals.
|tip Inside and outside the cave.
collect 15 Blood Amber##11503 |q 4102/1 |goto Felwood 55.78,16.85
|mapmarker Felwood/0 54.40,16.20
|mapmarker Felwood/0 58.00,17.60
|mapmarker Felwood/0 57.00,21.00
|mapmarker Felwood/0 59.20,20.40
|mapmarker Felwood/0 54.91,19.04
step
Leave the cave |goto Felwood 55.88,17.15 < 40 |walk |only if subzone("Irontree Cavern")
kill 12 Angerclaw Grizzly##8957 |q 4120/1 |goto Felwood/0 52.00,16.00
|tip Bears.
kill 12 Felpaw Ravager##8961 |q 4120/2 |goto Felwood/0 52.00,16.00
|tip Wolves.
|mapmarker Felwood/0 50.00,13.20
|mapmarker Felwood/0 52.40,27.20
|mapmarker Felwood/0 53.80,13.40
|mapmarker Felwood/0 54.60,25.00
|mapmarker Felwood/0 55.40,10.40
|mapmarker Felwood/0 55.40,21.20
|mapmarker Felwood/0 56.40,6.40
|mapmarker Felwood/0 57.40,18.40
|mapmarker Felwood/0 58.20,15.20
|mapmarker Felwood/0 60.80,17.00
|mapmarker Felwood/0 63.40,13.40
|mapmarker Felwood/0 64.40,19.80
step
talk Nafien##15395
|tip Follow the road.
turnin Speak to Nafien##8462 |goto Felwood 64.77,8.13
step
talk Donova Snowden##9298
accept Threat of the Winterfall##5082 |goto Winterspring 31.27,45.16
turnin It's a Secret to Everybody##3908 |goto Winterspring 31.27,45.16
step
_NOTE:_
Tame a Shardtooth Bear
|tip Cast {o}Tame Beast{} on a Shardtooth Bear.
|tip Find one that's {o}level 53{}. |only if level < 54
|tip Find one that's {o}level 54{}. |only if level >= 54
|tip Abandon your pet first.
|tip New permanent pet.
Click Here to Continue |confirm |goto Winterspring/0 30.20,46.20 |q 5082
|mapmarker Winterspring/0 30.40,39.40
|mapmarker Winterspring/0 33.40,39.40
|mapmarker Winterspring/0 34.20,43.60
|mapmarker Winterspring/0 39.80,38.20
|mapmarker Winterspring/0 42.80,38.20
|mapmarker Winterspring/0 44.20,35.20
|mapmarker Winterspring/0 44.40,41.40
|mapmarker Winterspring/0 45.40,45.40
|mapmarker Winterspring/0 47.20,37.00
|mapmarker Winterspring/0 48.60,46.20
|mapmarker Winterspring/0 49.00,34.40
|mapmarker Winterspring/0 50.20,39.40
|mapmarker Winterspring/0 54.00,37.20
|only if Hunter
stickystart "Kill_Winterfall_Enemies"
step
kill Winterfall Totemic##7441, Winterfall Pathfinder##7442, Winterfall Den Watcher##7440
|tip Furbolgs.
collect Empty Firewater Flask##12771 |n
use Empty Firewater Flask##12771
accept Winterfall Firewater##5083 |goto Winterspring 30.00,35.40
|mapmarker Winterspring/0 33.60,37.00
|mapmarker Winterspring/0 40.40,42.40
|mapmarker Winterspring/0 42.60,43.20
step
label "Kill_Winterfall_Enemies"
kill 8 Winterfall Totemic##7441 |q 5082/3 |goto Winterspring 30.00,35.40
kill 8 Winterfall Pathfinder##7442 |q 5082/1 |goto Winterspring 30.00,35.40
kill 8 Winterfall Den Watcher##7440 |q 5082/2 |goto Winterspring 30.00,35.40
|tip Shared spawns.
|mapmarker Winterspring/0 33.60,37.00
|mapmarker Winterspring/0 40.40,42.40
|mapmarker Winterspring/0 42.60,43.20
step
talk Donova Snowden##9298
turnin Threat of the Winterfall##5082 |goto Winterspring 31.27,45.16
turnin Winterfall Firewater##5083 |goto Winterspring 31.27,45.16
step
talk Gregor Greystone##10431
|tip Inside the building.
accept The Everlook Report##6029 |goto Winterspring 61.35,38.97
accept Duke Nicholas Zverenhoff##6030 |goto Winterspring 61.35,38.97
step
talk Jessica Redpath##11629
|tip Inside the building.
accept Sister Pamela##5601 |goto Winterspring 61.28,38.98
step
talk Izzy Coppergrab##13917
|tip Deposit into the bank.
|tip Inside the building.
bank Everlook Report##15788		|goto Winterspring 61.45,36.98 |q 6029
bank Studies in Spirit Speaking##15790	|goto Winterspring 61.45,36.98 |q 6030
step
talk Yugrek##11139
fpath Everlook |goto Winterspring 60.47,36.30
step
talk Dreka'Sur##9620
turnin A Husband's Last Battle##6162 |goto Felwood 34.80,52.73
step
talk Winna Hazzard##9996
turnin Well of Corruption##4505 |goto Felwood 34.21,52.34
step
talk Maybess Riverbreeze##9529
|tip Walks around.
turnin Cleansing Felwood##4102 |goto Felwood 46.72,83.07
step
talk Maybess Riverbreeze##9529
|tip Walks around.
Select _"I need a Cenarion beacon."_ |gossip 96156
collect Cenarion Beacon##11511 |goto Felwood 46.72,83.07 |q 5887 |future
step
talk Greta Mosshoof##10922
|tip Walks around.
turnin Collection of the Corrupt Water##5157 |goto Felwood 51.21,82.11
step
talk Taronn Redfeather##10921
|tip Inside the building.
turnin Verifying the Corruption##5156 |goto Felwood 50.89,81.62
step
kill Deadwood Warrior##7153, Deadwood Pathfinder##7155, Deadwood Gardener##7154
collect 6 Corrupted Soul Shard##11515 |goto Felwood 48.40,89.20 |q 5887 |future
|mapmarker Felwood/0 46.20,89.20
|mapmarker Felwood/0 46.80,91.80
|mapmarker Felwood/0 48.00,93.40
|mapmarker Felwood/0 49.40,91.60
step
talk Maybess Riverbreeze##9529
|tip Walks around.
accept Salve via Hunting##5887 |goto Felwood 46.72,83.07 |instant
step
_Destroy These Items:_
|tip Not needed.
trash Cenarion Plant Salve##11516
trash Cenarion Beacon##11511
trash Corrupted Soul Shard##11515
step
talk Loganaar##12042
Train Abilities |trainer Loganaar##12042 |goto Moonglade/0 52.53,40.57 |q 4120
|only if Druid
step
talk Enyo##5883
|tip Inside the building.
Train Abilities |trainer Enyo##5883 |goto Orgrimmar/0 38.79,85.65 |q 4120
|only if Mage
step
talk Ur'kyo##6018
|tip Inside the building.
Train Abilities |trainer Ur'kyo##6018 |goto Orgrimmar/0 35.59,87.80 |q 4120
|only if Priest
step
talk Kardris Dreamseeker##3344
|tip Inside the building.
Train Abilities |trainer Kardris Dreamseeker##3344 |goto Orgrimmar/0 38.80,36.38 |q 4120
|only if Shaman
step
talk Ormok##3328
|tip Inside the Cleft of Shadow.
Train Abilities |trainer Ormok##3328 |goto Orgrimmar/0 43.91,54.63 |q 4120
|only if Rogue
step
talk Mirket##3325
|tip Inside the Cleft of Shadow.
Train Abilities |trainer Mirket##3325 |goto Orgrimmar/0 48.62,46.95 |q 4120
|only if Warlock
step
talk Kurgul##5815
|tip Buy available Grimoires.
|tip Inside the Cleft of Shadow.
Train Demon Abilities |vendor Kurgul##5815 |goto Orgrimmar 47.52,46.72 |q 4120
|only if Warlock
step
talk Grezz Ragefist##3353
|tip Inside the building.
Train Abilities |trainer Grezz Ragefist##3353 |goto Orgrimmar/0 79.78,31.42 |q 4120
|only if Warrior
step
talk Ormak Grimshot##3352
|tip Top of the building.
Train Abilities |trainer Ormak Grimshot##3352 |goto Orgrimmar/0 66.06,18.54 |q 4120
|only if Hunter
step
talk Xao'tsu##10088
|tip Top of the building.
Train Pet Abilities |trainer Xao'tsu##10088 |goto Orgrimmar/0 66.33,14.82 |q 4120
|only if Hunter
step
talk Kildar##4752
Train Wolf Riding |learnspell Wolf Riding##825 |goto Orgrimmar/0 69.40,13.10
Buy a mount from Ogunaro Wolfrunner nearby at [Orgrimmar/0 69.38,12.26]
|only if Orc and discountgold('Orgrimmar',500000)
step
Run up the stairs |goto Orgrimmar/0 56.42,56.92 < 15 |only if walking
talk Zilzibin Drumlore##7010
|tip Inside the building.
accept March of the Silithid##4494 |goto Orgrimmar/0 56.27,46.67
step
talk Karus##3309
|tip Collect from the bank.
|tip Inside the building.
collect Torwa's Pouch##11568						|goto Orgrimmar 49.58,69.12 |q 4292
collect 25 Un'Goro Soil##11018 |complete itembanked(11018) == 0		|goto Orgrimmar 49.58,69.12 |multiq 3761,4496 |future
step
talk Xar'Ti##7953
Train Raptor Riding |learnspell Raptor Riding##10861 |goto Durotar/0 55.28,75.49
Buy a mount from Zjolnir nearby at [Durotar/0 55.23,75.65]
|only if Troll and discountgold('Darkspear Trolls',500000)
step
talk Velma Warnam##4773
Train Undead Horsemanship |learnspell Undead Horsemanship##10906 |goto Tirisfal Glades/0 60.08,52.57
Buy a mount from Zachariah Post nearby at [Tirisfal Glades/0 59.87,52.68]
|only if Undead and discountgold('Undercity',500000)
]])
GoatQuest:RegisterGuide("Leveling Guides\\Un'Goro Crater (54-56)",{
image=GQ.IMAGESDIR.."Un'Goro Crater",
next="Leveling Guides\\Western & Eastern Plaguelands (56-60)",
},[[
step
talk Liv Rizzlefix##8496
|tip Inside the building.
accept Volcanic Activity##4502 |goto The Barrens 62.45,38.74
step
talk Innkeeper Byula##7714
|tip Inside the building.
home Camp Taurajo |goto The Barrens/0 45.58,59.04 |q 4987 |future
step
talk Kar Stormsinger##3690
Train Kodo Riding |learnspell Kodo Riding##18995 |goto Mulgore/0 47.65,58.47
Buy a mount from Harb Clawhoof nearby at [Mulgore/0 47.49,58.60]
|only if Tauren and discountgold('Thunder Bluff',500000)
step
talk Talo Thornhoof##7776
|tip Inside the building.
turnin The Strength of Corruption##4120 |goto Feralas 76.18,43.83
step
talk Tran'rek##7876
accept Super Sticky##4504 |goto Tanaris 51.57,26.76
step
talk Alchemist Pestlezugg##5594
|tip Inside the building.
turnin March of the Silithid##4494 |goto Tanaris 50.89,26.96
accept Bungle in the Jungle##4496 |goto Tanaris 50.89,26.96
step
talk Larion##9118
accept Larion and Muigin##4145 |goto Un'Goro Crater/0 45.54,8.72
step
talk Williden Marshal##9270
accept Expedition Salvation##3881 |goto Un'Goro Crater/0 43.95,7.14
step
talk Hol'anyee Marshal##9271
accept Alien Ecology##3883 |goto Un'Goro Crater/0 43.89,7.24
step
talk Spark Nilminer##9272
accept Roll the Bones##3882 |goto Un'Goro Crater/0 43.50,7.42
step
Enter the cave |goto Un'Goro Crater 43.47,6.79 < 15 |walk |only if not (subzone("Marshal's Refuge") and indoors())
talk J.D. Collie##9117
|tip Inside the cave.
accept The Northern Pylon##4285 |goto Un'Goro Crater/0 41.92,2.70
accept The Eastern Pylon##4287 |goto Un'Goro Crater/0 41.92,2.70
accept The Western Pylon##4288 |goto Un'Goro Crater/0 41.92,2.70
step
Leave the cave |goto Un'Goro Crater/0 43.47,6.81 < 15 |walk |only if subzone("Marshal's Refuge") and indoors()
click Beware of Pterrordax
accept Beware of Pterrordax##4501 |goto Un'Goro Crater/0 43.55,8.42
step
talk Spraggle Frock##9997
accept Lost!##4492 |goto Un'Goro Crater/0 43.62,8.50
step
talk Shizzle##9998
accept Shizzle's Flyer##4503 |goto Un'Goro Crater/0 44.24,11.59
stickystart "Kill_Bloodpetal_Flayers"
stickystart "Collect_Webbed_Pterrordax_Scales"
stickystart "Collect_Dinosaur_Bones_And_Webbed_Diemetradon_Scales"
stickystart "Collect_UnGoro_Soil"
step
click Northern Crystal Pylon
|tip Up on the cliff.
Select _"I want to examine this pylon."_ |gossip 98545
Discover and Examine the Northern Crystal Pylon |q 4285/1 |goto Un'Goro Crater/0 56.48,12.45
step
kill 10 Pterrordax##9166 |q 4501/1 |goto Un'Goro Crater/0 56.00,9.80
|tip Skip once no more to kill.
|tip Can finish later.
|mapmarker Un'Goro Crater/0 57.40,8.20
|mapmarker Un'Goro Crater/0 57.60,12.80
step
label "Kill_Bloodpetal_Flayers"
kill 5 Bloodpetal Flayer##6510 |q 4145/3 |goto Un'Goro Crater/0 55.80,16.00
|tip Walking plants.
|mapmarker Un'Goro Crater/0 43.60,26.60
|mapmarker Un'Goro Crater/0 44.20,29.60
|mapmarker Un'Goro Crater/0 45.00,37.60
|mapmarker Un'Goro Crater/0 46.20,22.00
|mapmarker Un'Goro Crater/0 48.40,28.20
|mapmarker Un'Goro Crater/0 50.40,35.00
|mapmarker Un'Goro Crater/0 51.40,20.40
|mapmarker Un'Goro Crater/0 52.20,13.40
|mapmarker Un'Goro Crater/0 52.40,16.80
|mapmarker Un'Goro Crater/0 53.20,31.00
|mapmarker Un'Goro Crater/0 55.20,22.40
|mapmarker Un'Goro Crater/0 55.80,29.40
|mapmarker Un'Goro Crater/0 56.40,25.40
|mapmarker Un'Goro Crater/0 57.20,19.40
|mapmarker Un'Goro Crater/0 60.20,20.20
stickystop "Collect_Webbed_Pterrordax_Scales"
stickystop "Collect_Dinosaur_Bones_And_Webbed_Diemetradon_Scales"
stickystart "Collect_UnGoro_Thunderer_Pelts"
stickystart "Collect_UnGoro_Stomper_Pelts"
step
kill Un'Goro Gorilla##6514+
|tip Inside and outside the cave.
collect 2 Un'Goro Gorilla Pelt##11478 |q 4289/1 |goto Un'Goro Crater/0 64.23,16.36
|mapmarker Un'Goro Crater/0 60.40,17.00
|mapmarker Un'Goro Crater/0 62.40,16.40
|mapmarker Un'Goro Crater/0 62.40,19.40
|mapmarker Un'Goro Crater/0 65.00,16.60
|mapmarker Un'Goro Crater/0 65.20,14.40
|mapmarker Un'Goro Crater/0 66.80,17.60
|mapmarker Un'Goro Crater/0 67.20,14.80
|mapmarker Un'Goro Crater/0 68.40,13.20
|mapmarker Un'Goro Crater/0 68.80,17.40
step
label "Collect_UnGoro_Stomper_Pelts"
kill Un'Goro Stomper##6513+
|tip Inside and outside the cave. |notinsticky
collect 2 Un'Goro Stomper Pelt##11479 |q 4289/2 |goto Un'Goro Crater/0 64.23,16.36
|mapmarker Un'Goro Crater/0 60.40,17.00
|mapmarker Un'Goro Crater/0 62.40,16.40
|mapmarker Un'Goro Crater/0 62.40,19.40
|mapmarker Un'Goro Crater/0 65.00,16.60
|mapmarker Un'Goro Crater/0 65.20,14.40
|mapmarker Un'Goro Crater/0 66.80,17.60
|mapmarker Un'Goro Crater/0 67.20,14.80
|mapmarker Un'Goro Crater/0 68.40,13.20
|mapmarker Un'Goro Crater/0 68.80,17.40
step
label "Collect_UnGoro_Thunderer_Pelts"
kill Un'Goro Thunderer##6516+
|tip Inside and outside the cave. |notinsticky
collect 2 Un'Goro Thunderer Pelt##11480 |q 4289/3 |goto Un'Goro Crater/0 64.23,16.36
|mapmarker Un'Goro Crater/0 60.40,17.00
|mapmarker Un'Goro Crater/0 62.40,16.40
|mapmarker Un'Goro Crater/0 62.40,19.40
|mapmarker Un'Goro Crater/0 65.00,16.60
|mapmarker Un'Goro Crater/0 65.20,14.40
|mapmarker Un'Goro Crater/0 66.80,17.60
|mapmarker Un'Goro Crater/0 67.20,14.80
|mapmarker Un'Goro Crater/0 68.40,13.20
|mapmarker Un'Goro Crater/0 68.80,17.40
stickystart "Kill_Bloodpetal_Threshers_And_Lashers"
stickystart "Collect_Webbed_Pterrordax_Scales"
stickystart "Collect_Dinosaur_Bones_And_Webbed_Diemetradon_Scales"
step
Leave the cave |goto Un'Goro Crater/0 64.23,16.36 < 15 |walk |only if subzone("Fungal Rock") and indoors()
click Crate of Foodstuffs
collect Crate of Foodstuffs##11113 |q 3881/1 |goto Un'Goro Crater/0 68.51,36.54
step
label "Kill_Bloodpetal_Threshers_And_Lashers"
kill 5 Bloodpetal Thresher##6511 |q 4145/4 |goto Un'Goro Crater/0 67.60,34.60
kill 5 Bloodpetal Lasher##6509 |q 4145/1 |goto Un'Goro Crater/0 67.60,34.60
|tip Walking plants. |notinsticky
|mapmarker Un'Goro Crater/0 57.00,33.40
|mapmarker Un'Goro Crater/0 57.20,38.60
|mapmarker Un'Goro Crater/0 60.00,35.20
|mapmarker Un'Goro Crater/0 60.20,40.80
|mapmarker Un'Goro Crater/0 61.00,27.40
|mapmarker Un'Goro Crater/0 62.40,31.20
|mapmarker Un'Goro Crater/0 62.40,38.40
|mapmarker Un'Goro Crater/0 63.20,42.00
|mapmarker Un'Goro Crater/0 64.40,27.40
|mapmarker Un'Goro Crater/0 64.40,33.60
|mapmarker Un'Goro Crater/0 65.40,39.40
|mapmarker Un'Goro Crater/0 65.60,30.60
|mapmarker Un'Goro Crater/0 67.20,25.60
|mapmarker Un'Goro Crater/0 68.20,22.60
|mapmarker Un'Goro Crater/0 68.60,29.40
|mapmarker Un'Goro Crater/0 69.40,38.20
|mapmarker Un'Goro Crater/0 70.60,41.00
|mapmarker Un'Goro Crater/0 71.00,24.80
|mapmarker Un'Goro Crater/0 71.60,28.40
|mapmarker Un'Goro Crater/0 72.40,37.20
|mapmarker Un'Goro Crater/0 73.20,33.00
|mapmarker Un'Goro Crater/0 73.40,46.40
|mapmarker Un'Goro Crater/0 74.20,40.00
|mapmarker Un'Goro Crater/0 74.20,50.40
|mapmarker Un'Goro Crater/0 74.80,43.40
|mapmarker Un'Goro Crater/0 76.40,47.40
step
click Eastern Crystal Pylon
|tip Up on the cliff.
Select _"I want to examine this pylon."_ |gossip 96122
Discover and Examine the Eastern Crystal Pylon |q 4287/1 |goto Un'Goro Crater/0 77.24,49.97
step
use Torwa's Pouch##11568
collect Preserved Threshadon Meat##11569 |q 4292
collect Preserved Pheromone Mixture##11570 |q 4292
step
use Preserved Threshadon Meat##11569
use Preserved Pheromone Mixture##11570
kill Lar'korwi##9684
collect Lar'korwi's Head##11510 |q 4292/1 |goto Un'Goro Crater/0 79.92,49.90
step
talk Torwa Pathfinder##9619
turnin The Apes of Un'Goro##4289 |goto Un'Goro Crater/0 71.64,75.97
turnin The Bait for Lar'korwi##4292 |goto Un'Goro Crater/0 71.63,75.96
accept The Mighty U'cha##4301 |goto Un'Goro Crater/0 71.64,75.97
stickystop "Collect_Dinosaur_Bones_And_Webbed_Diemetradon_Scales"
step
kill 10 Pterrordax##9166 |q 4501/1 |goto Un'Goro Crater/0 58.00,86.40
|mapmarker Un'Goro Crater/0 42.80,86.00
|mapmarker Un'Goro Crater/0 43.40,92.40
|mapmarker Un'Goro Crater/0 44.20,88.40
|mapmarker Un'Goro Crater/0 50.40,87.20
|mapmarker Un'Goro Crater/0 50.40,89.60
|mapmarker Un'Goro Crater/0 56.60,91.60
|mapmarker Un'Goro Crater/0 56.20,88.20
stickystop "Collect_Webbed_Pterrordax_Scales"
stickystart "Collect_Gorishi_Scent_Gland"
step
Enter the cave |goto Un'Goro Crater/0 49.95,81.70 < 15 |walk |only if not (subzone("The Slithering Scar") and indoors())
use Unused Scraping Vial##11132
|tip Inside the cave.
collect Hive Wall Sample##11131 |q 3883/1 |goto Un'Goro Crater/0 48.74,85.21
step
label "Collect_Gorishi_Scent_Gland"
kill Gorishi Worker##6552, Gorishi Wasp##6551, Gorishi Reaver##6553, Gorishi Tunneler##6555, Gorishi Stinger##6554, Gorishi Hive Guard##10040
|tip Insects.
|tip Inside and outside the cave. |notinsticky
collect Gorishi Scent Gland##11837 |q 4496/1 |goto Un'Goro Crater/0 49.95,81.70
|mapmarker Un'Goro Crater/0 42.00,79.40
|mapmarker Un'Goro Crater/0 42.40,82.40
|mapmarker Un'Goro Crater/0 43.20,75.20
|mapmarker Un'Goro Crater/0 44.20,85.20
|mapmarker Un'Goro Crater/0 45.00,78.40
|mapmarker Un'Goro Crater/0 45.40,82.00
|mapmarker Un'Goro Crater/0 46.20,73.40
|mapmarker Un'Goro Crater/0 47.40,84.80
|mapmarker Un'Goro Crater/0 47.60,76.40
|mapmarker Un'Goro Crater/0 48.00,80.20
|mapmarker Un'Goro Crater/0 50.20,74.20
|mapmarker Un'Goro Crater/0 50.60,78.40
|mapmarker Un'Goro Crater/0 51.20,84.40
|mapmarker Un'Goro Crater/0 51.40,71.40
|mapmarker Un'Goro Crater/0 52.80,75.80
|mapmarker Un'Goro Crater/0 53.80,79.80
|mapmarker Un'Goro Crater/0 53.80,86.60
|mapmarker Un'Goro Crater/0 55.40,83.00
stickystart "Kill_Bloodpetal_Trappers"
stickystart "Collect_Dinosaur_Bones_And_Webbed_Diemetradon_Scales"
stickystart "Kill_Frenzied_Pterrordax"
stickystart "Collect_Webbed_Pterrordax_Scales"
step
Leave the cave |goto Un'Goro Crater/0 49.94,81.65 < 10 |only if subzone("The Slithering Scar") and indoors()
click Research Equipment
collect Research Equipment##11112 |q 3881/2 |goto Un'Goro Crater/0 38.47,66.11
step
click Western Crystal Pylon
|tip Up on the cliff.
Select _"I want to examine this pylon."_ |gossip 96123
Discover and Examine the Western Crystal Pylon |q 4288/1 |goto Un'Goro Crater/0 23.79,59.19
step
talk Krakle##10302
accept Finding the Source##974 |goto Un'Goro Crater/0 30.93,50.43
stickystart "Collect_UnGoro_Ash"
step
Follow the path up |goto Un'Goro Crater/0 46.30,45.65 < 20 |only if walking
use Krakle's Thermometer##12472
|tip Top of the mountain.
Find the Hottest Area of Fire Plume Ridge |q 974/1 |goto Un'Goro Crater/0 49.70,45.74
step
talk Krakle##10302
turnin Finding the Source##974 |goto Un'Goro Crater/0 30.93,50.43
stickystop "Collect_UnGoro_Ash"
step
label "Kill_Bloodpetal_Trappers"
kill 5 Bloodpetal Trapper##6512 |q 4145/2 |goto Un'Goro Crater/0 34.80,40.00
|tip Walking plants. |notinsticky
|mapmarker Un'Goro Crater/0 24.60,43.80
|mapmarker Un'Goro Crater/0 25.40,39.80
|mapmarker Un'Goro Crater/0 26.20,35.20
|mapmarker Un'Goro Crater/0 27.40,31.40
|mapmarker Un'Goro Crater/0 28.40,38.20
|mapmarker Un'Goro Crater/0 28.40,42.40
|mapmarker Un'Goro Crater/0 29.40,45.60
|mapmarker Un'Goro Crater/0 30.20,28.20
|mapmarker Un'Goro Crater/0 31.00,34.20
|mapmarker Un'Goro Crater/0 31.40,41.80
|mapmarker Un'Goro Crater/0 31.60,37.20
|mapmarker Un'Goro Crater/0 32.00,47.60
|mapmarker Un'Goro Crater/0 33.20,44.40
|mapmarker Un'Goro Crater/0 33.40,28.80
|mapmarker Un'Goro Crater/0 33.80,32.60
|mapmarker Un'Goro Crater/0 34.60,35.80
|mapmarker Un'Goro Crater/0 35.40,46.60
|mapmarker Un'Goro Crater/0 36.80,28.80
|mapmarker Un'Goro Crater/0 37.20,32.00
|mapmarker Un'Goro Crater/0 37.40,42.40
|mapmarker Un'Goro Crater/0 37.40,49.40
|mapmarker Un'Goro Crater/0 37.60,36.20
|mapmarker Un'Goro Crater/0 38.80,39.60
|mapmarker Un'Goro Crater/0 39.20,46.60
|mapmarker Un'Goro Crater/0 40.00,33.80
|mapmarker Un'Goro Crater/0 40.00,51.80
|mapmarker Un'Goro Crater/0 40.60,36.80
|mapmarker Un'Goro Crater/0 40.60,43.60
|mapmarker Un'Goro Crater/0 41.00,30.00
|mapmarker Un'Goro Crater/0 42.20,49.60
|mapmarker Un'Goro Crater/0 42.80,46.40
step
label "Collect_Dinosaur_Bones_And_Webbed_Diemetradon_Scales"
kill Young Diemetradon##9162, Diemetradon##9163, Elder Diemetradon##9164
collect 8 Dinosaur Bone##11114 |q 3882/1 |goto Un'Goro Crater/0 34.80,40.00
collect 8 Webbed Diemetradon Scale##11830 |q 4503/1 |goto Un'Goro Crater/0 34.80,40.00
|mapmarker Un'Goro Crater/0 24.60,43.80
|mapmarker Un'Goro Crater/0 25.40,39.80
|mapmarker Un'Goro Crater/0 26.20,35.20
|mapmarker Un'Goro Crater/0 27.40,31.40
|mapmarker Un'Goro Crater/0 28.40,38.20
|mapmarker Un'Goro Crater/0 28.40,42.40
|mapmarker Un'Goro Crater/0 29.40,45.60
|mapmarker Un'Goro Crater/0 30.20,28.20
|mapmarker Un'Goro Crater/0 31.00,34.20
|mapmarker Un'Goro Crater/0 31.40,41.80
|mapmarker Un'Goro Crater/0 31.60,37.20
|mapmarker Un'Goro Crater/0 32.00,47.60
|mapmarker Un'Goro Crater/0 33.20,44.40
|mapmarker Un'Goro Crater/0 33.40,28.80
|mapmarker Un'Goro Crater/0 33.80,32.60
|mapmarker Un'Goro Crater/0 34.60,35.80
|mapmarker Un'Goro Crater/0 35.40,46.60
|mapmarker Un'Goro Crater/0 36.80,28.80
|mapmarker Un'Goro Crater/0 37.20,32.00
|mapmarker Un'Goro Crater/0 37.40,42.40
|mapmarker Un'Goro Crater/0 37.40,49.40
|mapmarker Un'Goro Crater/0 37.60,36.20
|mapmarker Un'Goro Crater/0 38.80,39.60
|mapmarker Un'Goro Crater/0 39.20,46.60
|mapmarker Un'Goro Crater/0 40.00,33.80
|mapmarker Un'Goro Crater/0 40.00,51.80
|mapmarker Un'Goro Crater/0 40.60,36.80
|mapmarker Un'Goro Crater/0 40.60,43.60
|mapmarker Un'Goro Crater/0 41.00,30.00
|mapmarker Un'Goro Crater/0 42.20,49.60
|mapmarker Un'Goro Crater/0 42.80,46.40
step
label "Collect_Webbed_Pterrordax_Scales"
kill Fledgling Pterrordax##9165, Pterrordax##9166, Frenzied Pterrordax##9167
|tip Pterodactyls.
collect 8 Webbed Pterrordax Scale##11831 |q 4503/2 |goto Un'Goro Crater/0 34.80,39.60
|mapmarker Un'Goro Crater/0 20.20,38.80
|mapmarker Un'Goro Crater/0 20.40,60.40
|mapmarker Un'Goro Crater/0 20.80,42.40
|mapmarker Un'Goro Crater/0 22.80,50.00
|mapmarker Un'Goro Crater/0 23.40,40.20
|mapmarker Un'Goro Crater/0 22.80,58.40
|mapmarker Un'Goro Crater/0 24.40,61.40
|mapmarker Un'Goro Crater/0 26.20,64.20
|mapmarker Un'Goro Crater/0 26.40,37.20
|mapmarker Un'Goro Crater/0 27.20,45.60
|mapmarker Un'Goro Crater/0 27.60,56.80
|mapmarker Un'Goro Crater/0 28.00,53.20
|mapmarker Un'Goro Crater/0 29.20,42.40
|mapmarker Un'Goro Crater/0 29.40,31.80
|mapmarker Un'Goro Crater/0 29.60,37.40
|mapmarker Un'Goro Crater/0 30.60,45.60
|mapmarker Un'Goro Crater/0 32.00,26.60
|mapmarker Un'Goro Crater/0 32.40,42.00
|mapmarker Un'Goro Crater/0 32.80,37.00
|mapmarker Un'Goro Crater/0 34.20,45.80
|mapmarker Un'Goro Crater/0 34.40,29.60
|mapmarker Un'Goro Crater/0 24.40,43.60
|mapmarker Un'Goro Crater/0 35.80,35.40
|mapmarker Un'Goro Crater/0 36.20,32.00
|mapmarker Un'Goro Crater/0 36.40,42.60
|mapmarker Un'Goro Crater/0 37.80,39.20
|mapmarker Un'Goro Crater/0 38.40,28.40
|mapmarker Un'Goro Crater/0 38.80,45.20
|mapmarker Un'Goro Crater/0 38.80,49.80
|mapmarker Un'Goro Crater/0 39.40,42.00
|mapmarker Un'Goro Crater/0 40.20,31.40
|mapmarker Un'Goro Crater/0 41.20,52.40
|mapmarker Un'Goro Crater/0 41.40,39.20
|mapmarker Un'Goro Crater/0 42.60,36.40
step
label "Kill_Frenzied_Pterrordax"
kill 15 Frenzied Pterrordax##9167 |q 4501/2 |goto Un'Goro Crater/0 34.80,39.60
|mapmarker Un'Goro Crater/0 20.20,38.80
|mapmarker Un'Goro Crater/0 20.40,60.40
|mapmarker Un'Goro Crater/0 20.80,42.40
|mapmarker Un'Goro Crater/0 22.80,50.00
|mapmarker Un'Goro Crater/0 23.40,40.20
|mapmarker Un'Goro Crater/0 22.80,58.40
|mapmarker Un'Goro Crater/0 24.40,61.40
|mapmarker Un'Goro Crater/0 26.20,64.20
|mapmarker Un'Goro Crater/0 26.40,37.20
|mapmarker Un'Goro Crater/0 27.20,45.60
|mapmarker Un'Goro Crater/0 27.60,56.80
|mapmarker Un'Goro Crater/0 28.00,53.20
|mapmarker Un'Goro Crater/0 29.20,42.40
|mapmarker Un'Goro Crater/0 29.40,31.80
|mapmarker Un'Goro Crater/0 29.60,37.40
|mapmarker Un'Goro Crater/0 30.60,45.60
|mapmarker Un'Goro Crater/0 32.00,26.60
|mapmarker Un'Goro Crater/0 32.40,42.00
|mapmarker Un'Goro Crater/0 32.80,37.00
|mapmarker Un'Goro Crater/0 34.20,45.80
|mapmarker Un'Goro Crater/0 34.40,29.60
|mapmarker Un'Goro Crater/0 24.40,43.60
|mapmarker Un'Goro Crater/0 35.80,35.40
|mapmarker Un'Goro Crater/0 36.20,32.00
|mapmarker Un'Goro Crater/0 36.40,42.60
|mapmarker Un'Goro Crater/0 37.80,39.20
|mapmarker Un'Goro Crater/0 38.40,28.40
|mapmarker Un'Goro Crater/0 38.80,45.20
|mapmarker Un'Goro Crater/0 38.80,49.80
|mapmarker Un'Goro Crater/0 39.40,42.00
|mapmarker Un'Goro Crater/0 40.20,31.40
|mapmarker Un'Goro Crater/0 41.20,52.40
|mapmarker Un'Goro Crater/0 41.40,39.20
|mapmarker Un'Goro Crater/0 42.60,36.40
step
label "Collect_UnGoro_Soil"
click Un'Goro Dirt Pile+
Kill enemies
collect 25 Un'Goro Soil##11018 |goto Un'Goro Crater/0 34.80,40.00 |multiq 3761,4496 |future
|tip Don't vendor them.
|mapmarker Un'Goro Crater/0 24.60,43.80
|mapmarker Un'Goro Crater/0 25.40,39.80
|mapmarker Un'Goro Crater/0 26.20,35.20
|mapmarker Un'Goro Crater/0 27.40,31.40
|mapmarker Un'Goro Crater/0 28.40,38.20
|mapmarker Un'Goro Crater/0 28.40,42.40
|mapmarker Un'Goro Crater/0 29.40,45.60
|mapmarker Un'Goro Crater/0 30.20,28.20
|mapmarker Un'Goro Crater/0 31.00,34.20
|mapmarker Un'Goro Crater/0 31.40,41.80
|mapmarker Un'Goro Crater/0 31.60,37.20
|mapmarker Un'Goro Crater/0 32.00,47.60
|mapmarker Un'Goro Crater/0 33.20,44.40
|mapmarker Un'Goro Crater/0 33.40,28.80
|mapmarker Un'Goro Crater/0 33.80,32.60
|mapmarker Un'Goro Crater/0 34.60,35.80
|mapmarker Un'Goro Crater/0 35.40,46.60
|mapmarker Un'Goro Crater/0 36.80,28.80
|mapmarker Un'Goro Crater/0 37.20,32.00
|mapmarker Un'Goro Crater/0 37.40,42.40
|mapmarker Un'Goro Crater/0 37.40,49.40
|mapmarker Un'Goro Crater/0 37.60,36.20
|mapmarker Un'Goro Crater/0 38.80,39.60
|mapmarker Un'Goro Crater/0 39.20,46.60
|mapmarker Un'Goro Crater/0 40.00,33.80
|mapmarker Un'Goro Crater/0 40.00,51.80
|mapmarker Un'Goro Crater/0 40.60,36.80
|mapmarker Un'Goro Crater/0 40.60,43.60
|mapmarker Un'Goro Crater/0 41.00,30.00
|mapmarker Un'Goro Crater/0 42.20,49.60
|mapmarker Un'Goro Crater/0 42.80,46.40
step
label "Collect_UnGoro_Ash"
Follow the path up |goto Un'Goro Crater/0 46.30,45.65 < 20 |only if walking
kill Scorching Elemental##6520, Living Blaze##6521, Blazing Invader##14460
|tip Fire elementals.
|tip Avoid the {o}elite enemy{} at the top of the mountain.
collect 9 Un'Goro Ash##11829 |q 4502/1 |goto Un'Goro Crater/0 50.98,47.18
|mapmarker Un'Goro Crater/0 46.60,53.60
|mapmarker Un'Goro Crater/0 47.40,50.60
|mapmarker Un'Goro Crater/0 49.40,46.20
|mapmarker Un'Goro Crater/0 49.80,53.20
|mapmarker Un'Goro Crater/0 50.80,49.20
|mapmarker Un'Goro Crater/0 52.40,42.40
|mapmarker Un'Goro Crater/0 52.40,45.60
|mapmarker Un'Goro Crater/0 53.40,50.80
|mapmarker Un'Goro Crater/0 53.80,54.40
|mapmarker Un'Goro Crater/0 55.40,57.40
step
talk Ringo##9999
|tip Escort quest.
|tip Wait until he respawns, if missing.
|tip Inside the small cave.
|tip Midway up the mountain.
turnin Lost!##4492 |goto Un'Goro Crater/0 51.90,49.85
accept A Little Help From My Friends##4491 |goto Un'Goro Crater/0 51.90,49.85 |noautoaccept inparty
step
Watch the dialogue
|tip Protect Ringo as he follows you.
|tip Stay close, he faints.
|tip Message in chat when he faints.
use Spraggle's Canteen##11804
|tip Near Ringo when he faints.
Escort Ringo to Spraggle Frock at Marshal's Refuge |q 4491/1 |goto Un'Goro Crater/0 43.62,8.51 |notravel	|only if zone("Un'Goro Crater")
Escort Ringo to Spraggle Frock at Marshal's Refuge |q 4491/1 |goto Un'Goro Crater/0 43.62,8.51			|only if not zone("Un'Goro Crater")
|tip {o}HURRY{}, timed quest.
step
Watch the dialogue
talk Spraggle Frock##9997
turnin A Little Help From My Friends##4491 |goto Un'Goro Crater/0 43.62,8.51
turnin Beware of Pterrordax##4501 |goto Un'Goro Crater/0 43.62,8.50
step
_Destroy This Item:_
|tip Not needed.
trash Spraggle's Canteen##11804
step
talk Spark Nilminer##9272
turnin Roll the Bones##3882 |goto Un'Goro Crater/0 43.50,7.43
step
Enter the cave |goto Un'Goro Crater 43.47,6.79 < 15 |walk |only if not (subzone("Marshal's Refuge") and indoors())
talk J.D. Collie##9117
|tip Inside the cave.
turnin The Northern Pylon##4285 |goto Un'Goro Crater/0 41.92,2.70
turnin The Eastern Pylon##4287 |goto Un'Goro Crater/0 41.92,2.70
turnin The Western Pylon##4288 |goto Un'Goro Crater/0 41.92,2.70
accept Making Sense of It##4321 |goto Un'Goro Crater/0 41.92,2.70
step
talk J.D. Collie##9117
|tip Inside the cave.
turnin Making Sense of It##4321 |goto Un'Goro Crater/0 41.92,2.70
|delay 0.2
step
_Destroy This Item:_
|tip Not needed.
trash Crystal Pylon User's Manual##11482
step
Leave the cave |goto Un'Goro Crater/0 43.47,6.79 < 15 |walk |only if subzone("Marshal's Refuge") and indoors()
talk Hol'anyee Marshal##9271
turnin Alien Ecology##3883 |goto Un'Goro Crater/0 43.89,7.24
step
talk Williden Marshal##9270
turnin Expedition Salvation##3881 |goto Un'Goro Crater/0 43.95,7.14
step
talk Larion##9118
turnin Larion and Muigin##4145 |goto Un'Goro Crater/0 45.54,8.72
accept Marvon's Workshop##4147 |goto Un'Goro Crater/0 45.54,8.72
step
talk Shizzle##9998
turnin Shizzle's Flyer##4503 |goto Un'Goro Crater/0 44.23,11.59
step
talk Karna Remtravel##9618
accept Chasing A-Me 01##4243 |goto Un'Goro Crater/0 46.38,13.45
step
Enter the cave |goto Un'Goro Crater/0 63.88,16.44 < 15 |walk |only if not (subzone("Fungal Rock") and indoors())
Follow the path up |goto Un'Goro Crater/0 69.07,17.62 < 10 |walk
kill U'cha##9622
|tip Walks around.
|tip Upstairs inside the cave.
collect U'cha's Pelt##11476 |q 4301/1 |goto Un'Goro Crater/0 68.15,12.58
step
Follow the path inside the cave |goto Un'Goro Crater/0 65.87,16.75 < 10 |walk
talk A-Me 01##9623
|tip Escort quest.
|tip Wait until she respawns, if missing.
|tip Inside the cave.
turnin Chasing A-Me 01##4243 |goto Un'Goro Crater/0 67.65,16.76
step
Leave the cave |goto Un'Goro Crater/0 64.23,16.36 < 15 |walk |only if subzone("Fungal Rock") and indoors()
talk Torwa Pathfinder##9619
turnin The Mighty U'cha##4301 |goto Un'Goro Crater/0 71.63,75.96
step
kill Tar Beast##6517, Tar Creeper##6527, Tar Lord##6519, Tar Lurker##6518
|tip Swamp elementals.
collect 12 Super Sticky Tar##11834 |q 4504/1 |goto Un'Goro Crater 60.00,33.20
|mapmarker Un'Goro Crater/0 46.40,32.40
|mapmarker Un'Goro Crater/0 46.40,35.40
|mapmarker Un'Goro Crater/0 49.20,34.20
|mapmarker Un'Goro Crater/0 58.20,30.20
|mapmarker Un'Goro Crater/0 45.40,15.40
|mapmarker Un'Goro Crater/0 61.40,30.40
|mapmarker Un'Goro Crater/0 65.00,24.00
|mapmarker Un'Goro Crater/0 41.80,20.60
|mapmarker Un'Goro Crater/0 42.40,16.20
|mapmarker Un'Goro Crater/0 44.60,19.40
|mapmarker Un'Goro Crater/0 60.00,22.40
|mapmarker Un'Goro Crater/0 47.40,22.20
|mapmarker Un'Goro Crater/0 48.40,18.20
|mapmarker Un'Goro Crater/0 49.40,25.20
|mapmarker Un'Goro Crater/0 49.40,28.80
|mapmarker Un'Goro Crater/0 50.60,22.40
|mapmarker Un'Goro Crater/0 52.40,26.20
|mapmarker Un'Goro Crater/0 54.20,23.40
step
talk Tran'rek##7876
turnin Super Sticky##4504 |goto Tanaris 51.57,26.76
step
talk Alchemist Pestlezugg##5594
|tip Inside the building.
turnin Bungle in the Jungle##4496 |goto Tanaris/0 50.89,26.96
step
talk Loganaar##12042
Train Abilities |trainer Loganaar##12042 |goto Moonglade/0 52.53,40.57 |q 3762 |future
|only if Druid
step
talk Archmage Shymm##3047
|tip Inside the cave.
Train Abilities |trainer Archmage Shymm##3047 |goto Thunder Bluff/0 22.76,14.52 |q 3762 |future
|only if Mage
step
Leave the cave |goto Thunder Bluff 29.81,29.82 < 15 |walk |only if subzone("The Pools of Vision")
talk Chesmu##8356
|tip Collect from the bank.
|tip Inside the building.
collect Everlook Report##15788			|goto Thunder Bluff 47.13,57.89 |q 6029
collect Studies in Spirit Speaking##15790	|goto Thunder Bluff 47.13,57.89 |q 6030
step
talk Kuruk##8362
|tip Long questing session soon.
|tip No ammo vendor available.
Buy Extra Ammo |vendor Kuruk##8362 |goto Thunder Bluff/0 38.91,64.68 |q 3762 |future
|only if Hunter
step
talk Innkeeper Pala##6746
|tip Inside the building.
accept Assisting Arch Druid Runetotem##3762 |goto Thunder Bluff/0 45.82,64.72
stickystart "Accept_A_Call_To_Arms_Plaguelands_And_The_New_Frontier"
step
Enter the cave |goto Thunder Bluff 29.81,29.82 < 15 |walk |only if not subzone("The Pools of Vision")
talk Malakai Cross##3045
|tip Inside the cave.
Train Abilities |trainer Malakai Cross##3045 |goto Thunder Bluff/0 24.55,22.58 |q 3762 |future
|only if Priest
step
talk Siln Skychaser##3030
|tip Inside the building.
Train Abilities |trainer Siln Skychaser##3030 |goto Thunder Bluff/0 22.83,21.10 |q 3762 |future
|only if Shaman
step
talk Urek Thunderhorn##3040
|tip Inside the building.
Train Abilities |trainer Urek Thunderhorn##3040 |goto Thunder Bluff/0 59.11,86.86 |q 3762 |future
|only if Hunter
step
talk Ker Ragetotem##3043
|tip Inside the building.
Train Abilities |trainer Ker Ragetotem##3043 |goto Thunder Bluff/0 57.58,85.52 |q 3762 |future
|only if Warrior
step
label "Accept_A_Call_To_Arms_Plaguelands_And_The_New_Frontier"
map Thunder Bluff
path follow strictbounce;	loop off;	ants straight;		dist 20;	markers none;		arrow hide
path	42.59,59.42	39.25,63.11	37.23,59.78	36.31,54.06	37.87,51.02
path	42.85,56.51	44.30,68.39	46.19,69.23	49.04,66.75	49.85,61.95
path	56.77,61.65	56.26,54.51	58.95,52.31	57.74,48.48	54.32,48.53
path	52.58,51.30	55.21,54.51
talk Bluff Runner Windstrider##10881
|tip Walks a large path.
accept A Call to Arms: The Plaguelands!##5095
accept The New Frontier##1000
step
talk Arch Druid Hamuul Runetotem##5769
|tip Inside the building.
turnin Assisting Arch Druid Runetotem##3762 |goto Thunder Bluff/0 78.59,28.57
accept Un'Goro Soil##3761 |goto Thunder Bluff/0 78.59,28.57
turnin The New Frontier##1000 |goto Thunder Bluff/0 78.59,28.57
step
talk Ghede##9076
turnin Un'Goro Soil##3761 |goto Thunder Bluff/0 77.45,21.98
step
_Destroy or Sell These Items:_
|tip Not needed.
trash Un'Goro Soil##11018
step
talk Arch Druid Hamuul Runetotem##5769
|tip Inside the building.
accept Morrowgrain Research##3782 |goto Thunder Bluff/0 78.59,28.57
step
talk Bashana Runetotem##9087
|tip Inside the building.
turnin Morrowgrain Research##3782 |goto Thunder Bluff/0 71.06,34.18
step
talk Kar Stormsinger##3690
Train Kodo Riding |learnspell Kodo Riding##18995 |goto Mulgore/0 47.65,58.47
Buy a mount from Harb Clawhoof nearby at [Mulgore/0 47.49,58.60]
|only if Tauren and discountgold('Thunder Bluff',500000)
step
talk Liv Rizzlefix##8496
|tip Inside the building.
turnin Marvon's Workshop##4147 |goto The Barrens 62.45,38.73
turnin Volcanic Activity##4502 |goto The Barrens 62.45,38.73
step
talk Ormok##3328
|tip Inside the Cleft of Shadow.
Train Abilities |trainer Ormok##3328 |goto Orgrimmar/0 43.91,54.63 |q 5094 |future
|only if Rogue
step
talk Mirket##3325
|tip Inside the Cleft of Shadow.
Train Abilities |trainer Mirket##3325 |goto Orgrimmar/0 48.62,46.95 |q 5094 |future
|only if Warlock
step
talk Kurgul##5815
|tip Buy available Grimoires.
|tip Inside the Cleft of Shadow.
Train Demon Abilities |vendor Kurgul##5815 |goto Orgrimmar 47.52,46.72 |q 5094 |future
|only if Warlock
step
talk Kildar##4752
Train Wolf Riding |learnspell Wolf Riding##825 |goto Orgrimmar/0 69.40,13.10
Buy a mount from Ogunaro Wolfrunner nearby at [Orgrimmar/0 69.38,12.26]
|only if Orc and discountgold('Orgrimmar',500000)
step
talk Xar'Ti##7953
Train Raptor Riding |learnspell Raptor Riding##10861 |goto Durotar/0 55.28,75.49
Buy a mount from Zjolnir nearby at [Durotar/0 55.23,75.65]
|only if Troll and discountgold('Darkspear Trolls',500000)
step
talk Velma Warnam##4773
Train Undead Horsemanship |learnspell Undead Horsemanship##10906 |goto Tirisfal Glades/0 60.08,52.57
Buy a mount from Zachariah Post nearby at [Tirisfal Glades/0 59.87,52.68]
|only if Undead and discountgold('Undercity',500000)
]])
GoatQuest:RegisterGuide("Leveling Guides\\Western & Eastern Plaguelands (56-60)",{
image=GQ.IMAGESDIR.."Western Plaguelands",
},[[
step
talk High Executor Derrington##10837
turninany A Call to Arms: The Plaguelands!##5093,5094,5095 |goto Tirisfal Glades 83.13,68.93
accept Scarlet Diversions##5096 |goto Tirisfal Glades 83.13,68.93
step
click Box of Incendiaries
collect Flame in a Bottle##12814 |goto Tirisfal Glades 83.17,69.09 |q 5096
step
talk Argent Officer Garush##10839
turnin The Everlook Report##6029 |goto Tirisfal Glades 83.19,68.45
accept Argent Dawn Commission##5405 |goto Tirisfal Glades 83.19,68.45 |instant
step
equip Argent Dawn Commission##12846 |n
|tip Allows {o}Minion's Scourgestones{} to drop.
|tip From undead enemies in Western and Eastern Plaguelands.
Gain the Argent Dawn Commission Buff |havebuff Argent Dawn Commission##17670 |q 5402 |future
step
click Command Tent
use Scourge Banner##12807
Destroy the Command Tent and Plant the Scourge Banner in the Camp |q 5096/1 |goto Western Plaguelands 40.68,51.98
step
talk High Executor Derrington##10837
turnin Scarlet Diversions##5096 |goto Tirisfal Glades 83.13,68.93
accept All Along the Watchtowers##5098 |goto Tirisfal Glades 83.13,68.94
accept The Scourge Cauldrons##5228 |goto Tirisfal Glades 83.13,68.93
step
_Destroy This Item:_
|tip Not needed.
trash Flame in a Bottle##12814
step
talk Shadow Priestess Vandis##11055
turnin The Scourge Cauldrons##5228 |goto Tirisfal Glades 83.03,71.91
accept Target: Felstone Field##5229 |goto Tirisfal Glades 83.03,71.91
step
kill Cauldron Lord Bilemaw##11075
collect Felstone Field Cauldron Key##13194 |q 5229/1 |goto Western Plaguelands 37.03,57.11
step
click Scourge Cauldron
turnin Target: Felstone Field##5229 |goto Western Plaguelands 37.19,56.87
accept Return to the Bulwark##5230 |goto Western Plaguelands 37.19,56.87
step
talk Janice Felstone##10778
|tip Upstairs inside the building.
accept Better Late Than Never##5021 |goto Western Plaguelands 38.40,54.05
step
click Janice's Parcel
|tip Inside the building.
turnin Better Late Than Never##5021 |goto Western Plaguelands 38.73,55.24
accept Better Late Than Never##5023 |goto Western Plaguelands 38.73,55.24
step
talk Shadow Priestess Vandis##11055
turnin Return to the Bulwark##5230 |goto Tirisfal Glades 83.04,71.91
accept Target: Dalson's Tears##5231 |goto Tirisfal Glades 83.04,71.91
step
kill Cauldron Lord Malvinious##11077
collect Dalson's Tears Cauldron Key##13195 |q 5231/1 |goto Western Plaguelands 46.18,52.38
step
click Scourge Cauldron
turnin Target: Dalson's Tears##5231 |goto Western Plaguelands 46.18,52.02
accept Return to the Bulwark##5232 |goto Western Plaguelands 46.18,52.02
step
click Mrs. Dalson's Diary
|tip Inside the building.
accept Mrs. Dalson's Diary##5058 |goto Western Plaguelands 47.79,50.67 |instant
step
kill Wandering Skeleton##10816
|tip White skeleton.
|tip Walks around.
|tip Multiple spawn locations.
collect Dalson Outhouse Key##12738 |goto Western Plaguelands/0 48.34,49.27 |q 5060 |future
|mapmarker Western Plaguelands/0 46.40,50.20
|mapmarker Western Plaguelands/0 46.80,48.40
|mapmarker Western Plaguelands/0 47.20,51.40
|mapmarker Western Plaguelands/0 47.80,52.60
step
click Outhouse
|tip Complete the {o}Locked Away{} quest.
kill Farmer Dalson##10836
collect Dalson Cabinet Key##12739 |goto Western Plaguelands 48.11,49.71 |q 5060 |future
step
click Locked Cabinet
|tip Upstairs inside the building.
|tip Skip if too difficult due to respawn rate. |only if GQ.IsClassicSoD
accept Locked Away##5060 |goto Western Plaguelands 47.37,49.65 |instant
step
talk Chromie##10667
|tip Upstairs inside the building.
accept A Matter of Time##4971 |goto Western Plaguelands 39.45,66.76
step
use Beacon Torch##12815
|tip Tower entrance.
|tip Avoid the {o}elite enemy{} inside.
Mark Tower One |q 5098/1 |goto Western Plaguelands 40.13,71.52
step
use Beacon Torch##12815
|tip Tower entrance.
|tip Avoid the {o}elite enemy{} inside.
Mark Tower Four |q 5098/4 |goto Western Plaguelands 46.70,71.10
step
use Temporal Displacer##12627
|tip Near large structures with blue lights.
kill 15 Temporal Parasite##10717 |q 4971/1 |goto Western Plaguelands 45.00,63.00
|tip Another can spawn when they die.
|mapmarker Western Plaguelands/0 47.40,66.40
|mapmarker Western Plaguelands/0 48.00,62.80
|mapmarker Western Plaguelands/0 49.20,68.40
|mapmarker Western Plaguelands/0 49.80,66.40
step
use Beacon Torch##12815
|tip Tower entrance.
|tip Avoid the {o}elite enemy{} inside.
Mark Tower Three |q 5098/3 |goto Western Plaguelands/0 44.22,63.37
step
use Beacon Torch##12815
|tip Tower entrance.
|tip Avoid the {o}elite enemy{} inside.
Mark Tower Two |q 5098/2 |goto Western Plaguelands/0 42.44,66.27
step
talk Chromie##10667
|tip Upstairs inside the building.
turnin A Matter of Time##4971 |goto Western Plaguelands 39.45,66.76
accept Counting Out Time##4972 |goto Western Plaguelands 39.45,66.76
step
label "Collect_Andorhal_Watches"
click Small Lockbox+
|tip Small grey metal chests.
|tip Inside crumbled buildings.
collect 5 Andorhal Watch##12638 |q 4972/1 |goto Western Plaguelands/0 42.30,68.80
|mapmarker Western Plaguelands/0 38.30,69.60
|mapmarker Western Plaguelands/0 40.40,66.40
|mapmarker Western Plaguelands/0 42.80,73.90
|mapmarker Western Plaguelands/0 44.80,70.50
|mapmarker Western Plaguelands/0 46.50,73.00
|mapmarker Western Plaguelands/0 46.70,66.40
|mapmarker Western Plaguelands/0 48.70,69.70
step
talk High Executor Derrington##10837
turnin All Along the Watchtowers##5098 |goto Tirisfal Glades 83.13,68.93
accept Scholomance##838 |goto Tirisfal Glades 83.13,68.93
step
_Destroy This Item:_
|tip Not needed.
trash Beacon Torch##12815
step
talk Apothecary Dithers##11057
turnin Scholomance##838 |goto Tirisfal Glades 83.28,69.23
accept Skeletal Fragments##964 |goto Tirisfal Glades 83.28,69.23
step
talk Shadow Priestess Vandis##11055
turnin Return to the Bulwark##5232 |goto Tirisfal Glades 83.04,71.91
accept Target: Writhing Haunt##5233 |goto Tirisfal Glades 83.04,71.91
step
talk Mickey Levine##11615
accept A Plague Upon Thee##5901 |goto Tirisfal Glades 83.29,72.33
step
kill Skeletal Sorcerer##1784, Skeletal Flayer##1783
collect 15 Skeletal Fragments##14619 |q 964/1 |goto Western Plaguelands 36.20,58.60
|mapmarker Western Plaguelands/0 35.40,56.20
|mapmarker Western Plaguelands/0 36.40,54.20
|mapmarker Western Plaguelands/0 38.40,57.40
|mapmarker Western Plaguelands/0 38.60,53.40
step
kill Cauldron Lord Razarch##11076
collect Writhing Haunt Cauldron Key##13197 |q 5233/1 |goto Western Plaguelands 53.02,66.06
step
click Scourge Cauldron
turnin Target: Writhing Haunt##5233 |goto Western Plaguelands 53.02,65.72
accept Return to the Bulwark##5234 |goto Western Plaguelands 53.02,65.72
step
talk Mulgris Deepriver##10739
|tip Inside the building.
accept The Wildlife Suffers Too##4984 |goto Western Plaguelands 53.72,64.67
stickystart "Kill_Diseased_Wolves"
step
talk Kirsta Deepshadow##11610
accept Unfinished Business##6004 |goto Western Plaguelands 51.92,28.06
step
kill 2 Scarlet Mage##1826 |q 6004/3 |goto Western Plaguelands 50.47,41.12
kill 2 Scarlet Knight##1833 |q 6004/4 |goto Western Plaguelands 50.47,41.12
|mapmarker Western Plaguelands/0 50.40,41.20
|mapmarker Western Plaguelands/0 53.40,37.40
|mapmarker Western Plaguelands/0 57.40,35.60
step
kill 2 Scarlet Medic##10605 |q 6004/1 |goto Western Plaguelands 51.60,44.60
kill 2 Scarlet Hunter##1831 |q 6004/2 |goto Western Plaguelands 51.60,44.60
|mapmarker Western Plaguelands/0 40.80,52.00
|mapmarker Western Plaguelands/0 40.80,54.60
step
talk Kirsta Deepshadow##11610
turnin Unfinished Business##6004 |goto Western Plaguelands 51.92,28.06
accept Unfinished Business##6023 |goto Western Plaguelands 51.92,28.06
step
kill Huntsman Radley##11613 |q 6023/1 |goto Western Plaguelands 57.83,36.09
|tip Run around the mountain.
step
kill Cavalier Durgen##11611 |q 6023/2 |goto Western Plaguelands/0 54.71,23.65
|tip Walks around.
|tip Inside and outside the tower.
|tip Wait outside if elite enemy at top of tower. |notinsticky
step
talk Kirsta Deepshadow##11610
turnin Unfinished Business##6023 |goto Western Plaguelands 51.92,28.06
step
label "Kill_Diseased_Wolves"
kill 8 Diseased Wolf##1817 |q 4984/1 |goto Western Plaguelands 46.80,39.40
|tip Shared spawns with spiders. |notinsticky
|mapmarker Western Plaguelands/0 39.40,48.60
|mapmarker Western Plaguelands/0 42.40,47.00
|mapmarker Western Plaguelands/0 42.40,56.40
|mapmarker Western Plaguelands/0 43.40,39.80
|mapmarker Western Plaguelands/0 43.80,50.80
|mapmarker Western Plaguelands/0 44.20,59.60
|mapmarker Western Plaguelands/0 45.20,42.20
|mapmarker Western Plaguelands/0 45.40,47.80
|mapmarker Western Plaguelands/0 50.20,64.20
|mapmarker Western Plaguelands/0 47.60,45.40
|mapmarker Western Plaguelands/0 48.20,61.60
|mapmarker Western Plaguelands/0 49.80,38.80
|mapmarker Western Plaguelands/0 50.40,48.00
|mapmarker Western Plaguelands/0 50.40,52.20
|mapmarker Western Plaguelands/0 51.20,58.00
|mapmarker Western Plaguelands/0 51.60,69.40
step
talk Mulgris Deepriver##10739
|tip Inside the building.
turnin The Wildlife Suffers Too##4984 |goto Western Plaguelands 53.72,64.67
accept The Wildlife Suffers Too##4985 |goto Western Plaguelands 53.72,64.67
stickystart "Kill_Diseased_Grizzlies"
step
talk Tirion Fordring##1855
|tip Walks around.
accept Demon Dogs##5542 |goto Eastern Plaguelands 7.56,43.70
accept Blood Tinged Skies##5543 |goto Eastern Plaguelands 7.56,43.70
accept Carrion Grubbage##5544 |goto Eastern Plaguelands 7.56,43.70
stickystop "Kill_Diseased_Grizzlies"
stickystart "Collect_Slabs_Of_Carrion_Worm_Meat"
stickystart "Kill_Plaguehound_Runts_And_Plaguebats"
step
talk Nathanos Blightcaller##11878
accept To Kill With Purpose##6022 |goto Eastern Plaguelands 26.54,74.74
accept Un-Life's Little Annoyances##6042 |goto Eastern Plaguelands 26.54,74.74
step
talk Pamela Redpath##10926
|tip Walks around.
|tip Inside the crumbled house.
turnin Sister Pamela##5601 |goto Eastern Plaguelands 36.45,90.80
accept Pamela's Doll##5149 |goto Eastern Plaguelands 36.45,90.80
stickystop "Collect_Slabs_Of_Carrion_Worm_Meat"
stickystop "Kill_Plaguehound_Runts_And_Plaguebats"
stickystart "Collect_Pamelas_Dolls_Left_Side"
stickystart "Collect_Pamelas_Dolls_Right_Side"
step
click Pamela's Doll's Head##176116
|tip Inside the buildings.
|tip You will be attacked.
collect Pamela's Doll's Head##12886 |goto Eastern Plaguelands/0 38.10,92.30 |q 5149
|mapmarker Eastern Plaguelands/0 39.60,90.10
|mapmarker Eastern Plaguelands/0 39.60,92.50
step
label "Collect_Pamelas_Dolls_Left_Side"
click Pamela's Doll's Left Side##176142
|tip Inside the buildings. |notinsticky
|tip You will be attacked. |notinsticky
collect Pamela's Doll's Left Side##12887 |goto Eastern Plaguelands/0 38.10,92.30 |q 5149
|mapmarker Eastern Plaguelands/0 39.60,90.10
|mapmarker Eastern Plaguelands/0 39.60,92.50
step
label "Collect_Pamelas_Dolls_Right_Side"
click Pamela's Doll's Right Side##176143
|tip Inside the buildings. |notinsticky
|tip You will be attacked. |notinsticky
collect Pamela's Doll's Right Side##12888 |goto Eastern Plaguelands/0 38.10,92.30 |q 5149
|mapmarker Eastern Plaguelands/0 39.60,90.10
|mapmarker Eastern Plaguelands/0 39.60,92.50
step
use Pamela's Doll's Head##12886
collect Pamela's Doll##12885 |q 5149/1
step
talk Pamela Redpath##10926
|tip Walks around.
|tip Inside the crumbled house.
turnin Pamela's Doll##5149 |goto Eastern Plaguelands 36.45,90.80
accept Auntie Marlene##5152 |goto Eastern Plaguelands 36.45,90.80
accept Uncle Carlin##5241 |goto Eastern Plaguelands 36.45,90.80
stickystart "Kill_Plaguehound_Runts_And_Plaguebats"
step
label "Collect_Slabs_Of_Carrion_Worm_Meat"
kill Carrion Grub##8603+
|tip Large yellow worms.
collect 15 Slab of Carrion Worm Meat##13853 |q 5544/1 |goto Eastern Plaguelands/0 40.20,83.60
|mapmarker Eastern Plaguelands/0 16.40,64.40
|mapmarker Eastern Plaguelands/0 16.80,75.00
|mapmarker Eastern Plaguelands/0 17.40,78.80
|mapmarker Eastern Plaguelands/0 18.00,68.40
|mapmarker Eastern Plaguelands/0 20.40,65.40
|mapmarker Eastern Plaguelands/0 20.40,70.60
|mapmarker Eastern Plaguelands/0 21.40,73.60
|mapmarker Eastern Plaguelands/0 21.80,80.00
|mapmarker Eastern Plaguelands/0 23.40,64.60
|mapmarker Eastern Plaguelands/0 25.60,70.00
|mapmarker Eastern Plaguelands/0 26.00,63.00
|mapmarker Eastern Plaguelands/0 27.40,67.20
|mapmarker Eastern Plaguelands/0 28.80,64.40
|mapmarker Eastern Plaguelands/0 29.40,69.80
|mapmarker Eastern Plaguelands/0 31.20,77.80
|mapmarker Eastern Plaguelands/0 31.20,85.00
|mapmarker Eastern Plaguelands/0 31.80,64.40
|mapmarker Eastern Plaguelands/0 32.40,69.60
|mapmarker Eastern Plaguelands/0 33.80,74.40
|mapmarker Eastern Plaguelands/0 34.80,83.60
|mapmarker Eastern Plaguelands/0 36.60,68.80
|mapmarker Eastern Plaguelands/0 37.20,81.40
|mapmarker Eastern Plaguelands/0 40.80,65.80
|mapmarker Eastern Plaguelands/0 40.80,69.00
|mapmarker Eastern Plaguelands/0 41.60,79.00
|mapmarker Eastern Plaguelands/0 42.40,74.80
|mapmarker Eastern Plaguelands/0 44.60,72.20
|mapmarker Eastern Plaguelands/0 45.00,66.00
|mapmarker Eastern Plaguelands/0 46.00,80.00
|mapmarker Eastern Plaguelands/0 47.40,73.40
|mapmarker Eastern Plaguelands/0 49.40,77.60
step
label "Kill_Plaguehound_Runts_And_Plaguebats"
kill 20 Plaguehound Runt##8596 |q 5542/1 |goto Eastern Plaguelands/0 40.20,83.60
kill 30 Plaguebat##8600 |q 5543/1 |goto Eastern Plaguelands/0 40.20,83.60
|mapmarker Eastern Plaguelands/0 16.40,64.40
|mapmarker Eastern Plaguelands/0 16.80,75.00
|mapmarker Eastern Plaguelands/0 17.40,78.80
|mapmarker Eastern Plaguelands/0 18.00,68.40
|mapmarker Eastern Plaguelands/0 20.40,65.40
|mapmarker Eastern Plaguelands/0 20.40,70.60
|mapmarker Eastern Plaguelands/0 21.40,73.60
|mapmarker Eastern Plaguelands/0 21.80,80.00
|mapmarker Eastern Plaguelands/0 23.40,64.60
|mapmarker Eastern Plaguelands/0 25.60,70.00
|mapmarker Eastern Plaguelands/0 26.00,63.00
|mapmarker Eastern Plaguelands/0 27.40,67.20
|mapmarker Eastern Plaguelands/0 28.80,64.40
|mapmarker Eastern Plaguelands/0 29.40,69.80
|mapmarker Eastern Plaguelands/0 31.20,77.80
|mapmarker Eastern Plaguelands/0 31.20,85.00
|mapmarker Eastern Plaguelands/0 31.80,64.40
|mapmarker Eastern Plaguelands/0 32.40,69.60
|mapmarker Eastern Plaguelands/0 33.80,74.40
|mapmarker Eastern Plaguelands/0 34.80,83.60
|mapmarker Eastern Plaguelands/0 36.60,68.80
|mapmarker Eastern Plaguelands/0 37.20,81.40
|mapmarker Eastern Plaguelands/0 40.80,65.80
|mapmarker Eastern Plaguelands/0 40.80,69.00
|mapmarker Eastern Plaguelands/0 41.60,79.00
|mapmarker Eastern Plaguelands/0 42.40,74.80
|mapmarker Eastern Plaguelands/0 44.60,72.20
|mapmarker Eastern Plaguelands/0 45.00,66.00
|mapmarker Eastern Plaguelands/0 46.00,80.00
|mapmarker Eastern Plaguelands/0 47.40,73.40
|mapmarker Eastern Plaguelands/0 49.40,77.60
step
kill Hate Shrieker##8541, Scourge Warder##8525, Stitched Horror##8543, Gibbering Ghoul##8531, Unseen Servant##8538, Dark Caster##8526
|tip Undead.
|tip Careful, stealthed enemies.
|tip Avoid the {o}elite human enemies{} that patrol.
collect 7 Living Rot##15447 |n
|tip {o}Hurry{}, they disappear after {o}10 minutes{}.
|tip They don't stack, clear bag space.
use Mortar and Pestle##15454
collect Coagulated Rot##15448 |q 6022/1 |goto Eastern Plaguelands 57.60,70.80
|mapmarker Eastern Plaguelands/0 57.00,68.20
|mapmarker Eastern Plaguelands/0 58.20,65.40
|mapmarker Eastern Plaguelands/0 58.20,73.60
|mapmarker Eastern Plaguelands/0 60.00,68.20
|mapmarker Eastern Plaguelands/0 61.20,63.40
|mapmarker Eastern Plaguelands/0 61.20,71.40
|mapmarker Eastern Plaguelands/0 62.60,66.40
step
kill 5 Plaguehound##8597 |q 5542/2 |goto Eastern Plaguelands/0 68.00,75.60
kill 20 Noxious Plaguebat##8601 |q 6042/1 |goto Eastern Plaguelands 68.00,75.60
|mapmarker Eastern Plaguelands/0 64.20,56.60
|mapmarker Eastern Plaguelands/0 64.20,64.60
|mapmarker Eastern Plaguelands/0 64.40,60.40
|mapmarker Eastern Plaguelands/0 64.40,69.40
|mapmarker Eastern Plaguelands/0 66.80,67.20
|mapmarker Eastern Plaguelands/0 66.80,72.20
|mapmarker Eastern Plaguelands/0 67.40,63.20
|mapmarker Eastern Plaguelands/0 69.40,58.80
|mapmarker Eastern Plaguelands/0 69.40,69.40
|mapmarker Eastern Plaguelands/0 69.60,65.40
|mapmarker Eastern Plaguelands/0 70.40,72.40
|mapmarker Eastern Plaguelands/0 70.80,55.60
|mapmarker Eastern Plaguelands/0 71.20,62.00
|mapmarker Eastern Plaguelands/0 72.80,58.00
|mapmarker Eastern Plaguelands/0 73.20,71.20
|mapmarker Eastern Plaguelands/0 73.20,76.20
|mapmarker Eastern Plaguelands/0 73.60,54.20
|mapmarker Eastern Plaguelands/0 75.40,68.40
|mapmarker Eastern Plaguelands/0 76.00,73.60
|mapmarker Eastern Plaguelands/0 77.60,63.20
|mapmarker Eastern Plaguelands/0 78.40,66.20
|mapmarker Eastern Plaguelands/0 79.00,70.40
|mapmarker Eastern Plaguelands/0 82.00,70.40
step
talk Caretaker Alen##11038
|tip Walks around.
accept Zaeldarr the Outcast##6021 |goto Eastern Plaguelands 79.54,63.77
step
talk Caretaker Alen##11038
|tip Long questing session soon.
|tip Walks around.
Buy Extra Ammo |vendor Caretaker Alen##11038 |goto Eastern Plaguelands 79.54,63.77 |q 6030
|only if Hunter
step
talk Duke Nicholas Zverenhoff##11039
turnin Duke Nicholas Zverenhoff##6030 |goto Eastern Plaguelands 81.43,59.82
step
talk Carlin Redpath##11063
turnin Uncle Carlin##5241 |goto Eastern Plaguelands 81.52,59.77
step
talk Georgia##12636
fpath Light's Hope Chapel |goto Eastern Plaguelands 80.22,57.01
stickystart "Kill_Frenzied_Plaguehounds_And_Monstrous_Plaguebats"
step
click Large Termite Mound##177464+
|tip Large stones leaking green ooze.
|tip Work your way west.
collect 100 Plagueland Termites##15043 |q 5901/1 |goto Eastern Plaguelands/0 45.90,34.10
|mapmarker Eastern Plaguelands/0 42.19,38.20
|mapmarker Eastern Plaguelands/0 42.84,34.28
|mapmarker Eastern Plaguelands/0 40.61,31.38
|mapmarker Eastern Plaguelands/0 36.03,31.81
|mapmarker Eastern Plaguelands/0 32.08,35.71
|mapmarker Eastern Plaguelands/0 26.47,37.57
|mapmarker Eastern Plaguelands/0 28.46,32.49
|mapmarker Eastern Plaguelands/0 26.16,29.78
|mapmarker Eastern Plaguelands/0 23.87,25.24
|mapmarker Eastern Plaguelands/0 22.45,21.52
|mapmarker Eastern Plaguelands/0 20.40,27.00
|mapmarker Eastern Plaguelands/0 39.56,23.06
|mapmarker Eastern Plaguelands/0 29.00,24.00
|mapmarker Eastern Plaguelands/0 34.00,28.00
step
label "Kill_Frenzied_Plaguehounds_And_Monstrous_Plaguebats"
kill 5 Frenzied Plaguehound##8598 |q 5542/3 |goto Eastern Plaguelands 45.00,38.60
kill 10 Monstrous Plaguebat##8602 |q 6042/2 |goto Eastern Plaguelands 45.00,38.60
|mapmarker Eastern Plaguelands/0 55.40,29.40
|mapmarker Eastern Plaguelands/0 47.40,24.40
|mapmarker Eastern Plaguelands/0 49.40,39.00
|mapmarker Eastern Plaguelands/0 50.20,31.20
|mapmarker Eastern Plaguelands/0 50.80,27.00
|mapmarker Eastern Plaguelands/0 52.00,42.40
|mapmarker Eastern Plaguelands/0 54.20,22.60
|mapmarker Eastern Plaguelands/0 54.40,33.40
|mapmarker Eastern Plaguelands/0 56.40,46.00
|mapmarker Eastern Plaguelands/0 60.00,29.40
|mapmarker Eastern Plaguelands/0 61.40,48.00
|mapmarker Eastern Plaguelands/0 61.60,24.00
|mapmarker Eastern Plaguelands/0 62.40,40.40
|mapmarker Eastern Plaguelands/0 63.20,27.80
|mapmarker Eastern Plaguelands/0 63.40,36.20
|mapmarker Eastern Plaguelands/0 63.60,31.80
|mapmarker Eastern Plaguelands/0 64.00,43.80
step
Enter the crypt |goto Eastern Plaguelands 27.86,85.48 < 10 |walk |only if not (subzone("The Undercroft")  and indoors())
kill Zaeldarr the Outcast##12250
|tip Downstairs inside the crypt.
collect Zaeldarr's Head##15785 |q 6021/1 |goto Eastern Plaguelands 27.46,84.88
step
talk Nathanos Blightcaller##11878
turnin To Kill With Purpose##6022 |goto Eastern Plaguelands 26.54,74.74
turnin Un-Life's Little Annoyances##6042 |goto Eastern Plaguelands 26.54,74.74
step
talk Tirion Fordring##1855
|tip Walks around.
turnin Demon Dogs##5542 |goto Eastern Plaguelands 7.57,43.70
turnin Blood Tinged Skies##5543 |goto Eastern Plaguelands 7.57,43.70
turnin Carrion Grubbage##5544 |goto Eastern Plaguelands 7.57,43.70
accept Redemption##5742 |goto Eastern Plaguelands 7.57,43.70
step
talk Tirion Fordring##1855
|tip Walks around.
Select _"I am ready to hear your tale, Tirion."_ |gossip 95701
Select _"Thank you, Tirion. What of your identity?"_ |gossip 96441
Select _"That is terrible."_ |gossip 96440
Select _"I will, Tirion."_ |gossip 96439
|tip Must be sitting.
|tip Type {o}/sit{} in chat. |macro /sit
Listen to Tirion's Tale |q 5742/1 |goto Eastern Plaguelands 7.57,43.70
step
talk Tirion Fordring##1855
|tip Walks around.
turnin Redemption##5742 |goto Eastern Plaguelands 7.57,43.70
step
label "Kill_Diseased_Grizzlies"
kill 8 Diseased Grizzly##1816 |q 4985/1 |goto Western Plaguelands 66.40,51.00
|tip Shared spawns with spiders. |notinsticky
|mapmarker Western Plaguelands/0 52.20,51.20
|mapmarker Western Plaguelands/0 52.40,54.40
|mapmarker Western Plaguelands/0 52.40,58.40
|mapmarker Western Plaguelands/0 53.20,62.60
|mapmarker Western Plaguelands/0 53.40,48.20
|mapmarker Western Plaguelands/0 54.40,45.20
|mapmarker Western Plaguelands/0 55.20,52.60
|mapmarker Western Plaguelands/0 56.00,58.60
|mapmarker Western Plaguelands/0 56.80,61.60
|mapmarker Western Plaguelands/0 57.00,55.60
|mapmarker Western Plaguelands/0 58.00,50.20
|mapmarker Western Plaguelands/0 55.80,64.60
|mapmarker Western Plaguelands/0 60.20,54.40
|mapmarker Western Plaguelands/0 61.40,48.40
|mapmarker Western Plaguelands/0 61.60,51.40
|mapmarker Western Plaguelands/0 63.20,44.40
|mapmarker Western Plaguelands/0 64.40,53.80
|mapmarker Western Plaguelands/0 64.60,47.60
|mapmarker Western Plaguelands/0 65.80,42.20
|mapmarker Western Plaguelands/0 66.20,57.40
|mapmarker Western Plaguelands/0 59.80,60.20
|mapmarker Western Plaguelands/0 66.60,45.20
|mapmarker Western Plaguelands/0 67.80,48.00
step
talk Mulgris Deepriver##10739
|tip Inside the building.
turnin The Wildlife Suffers Too##4985 |goto Western Plaguelands 53.72,64.67
accept Glyphed Oaken Branch##4987 |goto Western Plaguelands 53.72,64.67
step
talk Marlene Redpath##10927
|tip Walks around.
|tip {o}Both floors{} inside the building.
turnin Auntie Marlene##5152 |goto Western Plaguelands 49.17,78.58
accept A Strange Historian##5153 |goto Western Plaguelands 49.17,78.58
step
click Joseph Redpath's Monument
collect Joseph's Wedding Ring##12894 |q 5153/1 |goto Western Plaguelands 49.68,76.77
step
talk Chromie##10667
|tip Upstairs inside the building.
turnin Counting Out Time##4972 |goto Western Plaguelands 39.45,66.76
turnin A Strange Historian##5153 |goto Western Plaguelands 39.45,66.76
accept The Annals of Darrowshire##5154 |goto Western Plaguelands 39.45,66.76
step
_NOTE:_
During the Next Step
|tip Enemies near the building entrance.
|tip Run on the ledge of the building.
|tip Hug the building outside wall to reach the entrance.
Click Here to Continue |confirm |q 5154
step
click Musty Tome+
|tip Find the real book by zooming in and looking.
|tip Fake books spawn enemies.
|tip Real book has {o}two appearances{}:
|tip {o}Sharper pages{} and {o}even shading on both halves{}.
|tip Or
|tip {o}Uneven shading{} with {o}large brown spot{} on the pages{}.
|tip If no real book, click fakes to get it to spawn.
|tip Inside the building.
collect Annals of Darrowshire##12900 |q 5154/1 |goto Western Plaguelands 43.52,69.55
step
talk Chromie##10667
|tip Upstairs inside the building.
turnin The Annals of Darrowshire##5154 |goto Western Plaguelands 39.45,66.76
accept Brother Carlin##5210 |goto Western Plaguelands 39.45,66.76
step
_Destroy These Items:_
|tip Not needed.
trash Ruined Tome##15696
step
talk Apothecary Dithers##11057
turnin Skeletal Fragments##964 |goto Tirisfal Glades 83.28,69.23
step
talk Shadow Priestess Vandis##11055
turnin Return to the Bulwark##5234 |goto Tirisfal Glades 83.04,71.91
accept Target: Gahrron's Withering##5235 |goto Tirisfal Glades 83.04,71.91
step
talk Mickey Levine##11615
turnin A Plague Upon Thee##5901 |goto Tirisfal Glades 83.29,72.33
accept A Plague Upon Thee##5902 |goto Tirisfal Glades 83.29,72.33
step
_Destroy These Items:_
|tip Not needed.
trash Plagueland Termites##15043
step
talk Velma Warnam##4773
Train Undead Horsemanship |learnspell Undead Horsemanship##10906 |goto Tirisfal Glades/0 60.08,52.57
Buy a mount from Zachariah Post nearby at [Tirisfal Glades/0 59.87,52.68]
|only if Undead and discountgold('Undercity',500000)
step
talk Royal Overseer Bauhaus##10781
turnin Better Late Than Never##5023 |goto Undercity 69.78,43.15
accept The Jeremiah Blues##5049 |goto Undercity 69.78,43.15
step
talk Jeremiah Payson##8403
|tip Under the stairs.
turnin The Jeremiah Blues##5049 |goto Undercity 67.60,44.16
accept Good Luck Charm##5050 |goto Undercity 67.60,44.16
step
talk Carlin Redpath##11063
turnin Brother Carlin##5210 |goto Eastern Plaguelands/0 81.52,59.76
step
talk Caretaker Alen##11038
|tip Walks around.
turnin Zaeldarr the Outcast##6021 |goto Eastern Plaguelands 79.54,63.77
step
kill Cauldron Lord Soulwrath##11078
|tip Walks around.
collect Gahrron's Withering Cauldron Key##13196 |q 5225/1 |goto Western Plaguelands 62.78,58.75
step
click Scourge Cauldron
turnin Target: Gahrron's Withering##5235 |goto Western Plaguelands 62.56,58.57
accept Return to the Bulwark##5236 |goto Western Plaguelands 62.56,58.57
step
click Northridge Lumber Mill Crate
|tip Inside the building.
Select _"Place Termite Barrel on the crate."_ |gossip 97332
click Termite Barrel
|tip Appears on the crate.
turnin A Plague Upon Thee##5902 |goto Western Plaguelands 48.35,32.00
accept A Plague Upon Thee##6390 |goto Western Plaguelands 48.35,32.00
step
talk Janice Felstone##10778
|tip Upstairs inside the building.
turnin Good Luck Charm##5050 |goto Western Plaguelands/0 38.40,54.05
accept Two Halves Become One##5051 |goto Western Plaguelands/0 38.40,54.05
step
kill Jabbering Ghoul##10801
|tip Ghoul with pitchfork.
|tip Walks around.
|tip May spawn here.
collect Good Luck Other-Half-Charm##12722 |goto Western Plaguelands/0 38.00,56.35 |q 5051
|mapmarker Western Plaguelands/0 36.20,57.40
|mapmarker Western Plaguelands/0 36.20,59.40
|mapmarker Western Plaguelands/0 37.20,55.40
step
use Good Luck Other-Half-Charm##12722
collect Good Luck Charm##12723 |q 5051/1
step
talk Janice Felstone##10778
|tip Upstairs inside the building.
turnin Two Halves Become One##5051 |goto Western Plaguelands/0 38.40,54.05
step
talk Shadow Priestess Vandis##11055
turnin Return to the Bulwark##5236 |goto Tirisfal Glades 83.03,71.91
step
talk Mickey Levine##11615
turnin A Plague Upon Thee##6390 |goto Tirisfal Glades 83.29,72.33
step
talk High Executor Derrington##10837
accept Mission Accomplished!##5238 |goto Tirisfal Glades 83.13,68.94 |instant
step
talk Velma Warnam##4773
Train Undead Horsemanship |learnspell Undead Horsemanship##10906 |goto Tirisfal Glades/0 60.08,52.57
Buy a mount from Zachariah Post nearby at [Tirisfal Glades/0 59.87,52.68]
|only if Undead and discountgold('Undercity',500000)
step
talk Nara Wildmane##5770
|tip Inside the building.
turnin Glyphed Oaken Branch##4987 |goto Thunder Bluff 75.65,31.61
]])
GoatQuest:RegisterGuide("Leveling Guides\\Druid Class Quests",{
description="This guide will walk you through completing various Druid Class Quests.",
},[[
step
ding 10
step
Enter the building |goto Mulgore 48.16,59.53 < 15 |walk
talk Gennia Runetotem##3064
|tip Inside the building.
accept Heeding the Call##5928 |goto Mulgore 48.48,59.64
|only if Tauren Druid
step
Ride the elevator up |goto Thunder Bluff 31.80,65.96 < 10 |only if walking
Enter the building |goto Thunder Bluff 58.66,46.92 < 15 |walk
Cross the bridge |goto Thunder Bluff 61.44,40.20 < 10 |walk
Enter the building |goto Thunder Bluff 74.09,29.91 < 15 |walk
talk Turak Runetotem##3033
|tip Inside the building.
turnin Heeding the Call##5928 |goto Thunder Bluff 76.46,27.23
accept Moonglade##5922 |goto Thunder Bluff 76.46,27.23
|only if Tauren Druid
step
Enter the building |goto Moonglade 56.13,30.98 < 15 |walk
talk Dendrite Starblaze##11802
|tip Upstairs inside the building.
turnin Moonglade##5922 |goto Moonglade 56.21,30.64
accept Great Bear Spirit##5930 |goto Moonglade 56.21,30.64
|only if Tauren Druid
step
Follow the path |goto Moonglade 42.47,34.44 < 20 |only if walking
talk Great Bear Spirit##11956
Select _"What do you represent, spirit?"_ |gossip 97167
Select _"I seek to understand the importance of strength of the body."_ |gossip 97129
Select _"I seek to understand the importance of strength of the heart."_ |gossip 97168
Select _"I have heard your words, Great Bear Spirit, and I understand. I now seek your blessings to fully learn the way of the Claw."_ |gossip 95967
Seek Out the Great Bear Spirit and Learn what it Has to Share with You About the Nature of the Bear |q 5930/1 |goto Moonglade 39.11,27.51
|only if Tauren Druid
step
talk Faustron##12740
fpath Moonglade |goto Moonglade 32.11,66.60
|only if Tauren Druid
step
Follow the road |goto Moonglade 40.77,35.81 < 20 |only if walking
Enter the building |goto Moonglade 56.13,30.98 < 15 |walk
talk Dendrite Starblaze##11802
|tip Upstairs inside the building.
turnin Great Bear Spirit##5930 |goto Moonglade 56.21,30.64
accept Back to Thunder Bluff##5932 |goto Moonglade 56.21,30.64
|only if Tauren Druid
step
Locate Bunthen Plainswind |goto Moonglade 44.28,45.86 < 10 |c |q 5932
|only if Tauren Druid
step
Enter the building |goto Thunder Bluff 58.66,46.92 < 15 |walk
Cross the bridge |goto Thunder Bluff 61.44,40.20 < 10 |walk
Enter the building |goto Thunder Bluff 74.09,29.91 < 15 |walk
talk Turak Runetotem##3033
|tip Inside the building.
turnin Back to Thunder Bluff##5932 |goto Thunder Bluff 76.46,27.23
accept Body and Heart##6002 |goto Thunder Bluff 76.46,27.23
|only if Tauren Druid
step
use the Cenarion Lunardust##15710
kill Lunaclaw##12138
|tip A spirit will appear after you kill her.
talk Lunaclaw Spirit##12144
Select _"You have fought well, spirit. I ask you to grant me the strength of your body and the strength of your heart."_ |gossip 97126
Face Lunaclaw and Earn the Strength of Body and Heart it Possesses |q 6002/1 |goto The Barrens 42.00,60.86
|only if Tauren Druid
step
Enter Mulgore |goto The Barrens 41.54,58.56 < 30 |only if walking
Cross the bridge |goto Mulgore 48.13,53.43 < 20 |only if walking
Ride the elevator up |goto Thunder Bluff 31.80,65.96 < 10 |only if walking
Enter the building |goto Thunder Bluff 58.66,46.92 < 15 |walk
Cross the bridge |goto Thunder Bluff 61.44,40.20 < 10 |walk
Enter the building |goto Thunder Bluff 74.09,29.91 < 15 |walk
talk Turak Runetotem##3033
|tip Inside the building.
turnin Body and Heart##6002 |goto Thunder Bluff 76.46,27.23
|only if Tauren Druid
step
ding 14
step
talk Auctioneer Stampi##8674
collect 5 Earthroot##2449 |goto Thunder Bluff 40.40,51.77 |q 6128 |future
|tip Buy them from the Auction House.
|only if Druid and not selfmade()
step
Enter the building |goto Thunder Bluff 74.17,29.89 < 15 |walk
talk Turak Runetotem##3033
|tip Inside the building.
accept Lessons Anew##6126 |goto Thunder Bluff 76.47,27.23
|only if Druid
step
Enter the building |goto Moonglade 56.13,30.98 < 15 |walk
talk Dendrite Starblaze##11802
|tip Upstairs inside the building.
turnin Lessons Anew##6126 |goto Moonglade 56.21,30.64
accept The Principal Source##6127 |goto Moonglade 56.21,30.64
|only if Druid
step
Follow the path up |goto The Barrens 51.08,22.66 < 15 |only if walking
Follow the path |goto The Barrens 49.16,20.33 < 15 |only if walking
Follow the path up |goto The Barrens 48.00,19.56 < 10 |only if walking
use the Empty Dreadmist Peak Sampler##15842
|tip Use it while standing in the bubbling water at the top of the mountain.
|tip {o}Be ready to flee!{} 3 acolytes will spawn and attack you right after.
|tip They stack warlock spells and curses on you, so taking them solo may be really hard, even if you clear all the other enemies at the peak of the mountain first.
collect Filled Dreadmist Peak Sampler##15843 |q 6127/1 |goto The Barrens 48.41,18.89
|only if Druid
step
Follow the path down |goto The Barrens 49.22,20.39 < 20 |only if walking
Follow the path |goto The Barrens 52.34,29.37 < 20 |only if walking
talk Tonga Runetotem##3448
turnin The Principal Source##6127 |goto The Barrens 52.26,31.93
accept Gathering the Cure##6128 |goto The Barrens 52.26,31.93
|only if Druid
step
Follow the path |goto The Barrens 50.09,40.90 < 30 |only if walking
kill Lost Barrens Kodo##3234+
collect 5 Kodo Horn##15852 |q 6128/2 |goto The Barrens 51.93,43.65
You can find more around: |notinsticky
[52.71,45.41]
[55.16,45.59]
[47.25,43.31]
[45.77,43.28]
[44.82,40.80]
|only if Druid
step
talk Tonga Runetotem##3448
turnin Gathering the Cure##6128 |goto The Barrens 52.26,31.93
accept Curing the Sick##6129 |goto The Barrens 52.26,31.93
|only if Druid
step
use the Curative Animal Salve##15826
'|talk Sickly Gazelle##12296+
|tip Use it on Sickly Gazelles around this area.
|tip They look like green gazelles all around the northern area of the Barrens.
Cure #10# Sickly Gazelles |q 6129/1 |goto The Barrens 50.17,31.12
You can find more around: |notinsticky
[48.77,29.54]
[48.33,26.15]
[48.84,23.88]
[49.99,23.09]
[51.79,20.51]
[53.44,20.86]
[54.29,21.65]
[54.98,21.95]
[53.52,26.92]
|only if Druid
step
Enter the building |goto Moonglade 56.13,30.98 < 15 |walk
talk Dendrite Starblaze##11802
|tip Upstairs inside the building.
turnin Curing the Sick##6129 |goto Moonglade 56.21,30.64
accept Power over Poison##6130 |goto Moonglade 56.21,30.64
|only if Druid
step
Enter the building |goto Thunder Bluff 74.17,29.89 < 15 |walk
talk Turak Runetotem##3033
|tip Inside the building.
turnin Power over Poison##6130 |goto Thunder Bluff 76.47,27.23
|only if Druid
step
ding 16
step
Follow the road |goto The Barrens 38.42,28.96 < 30 |only if walking
Continue following the road |goto The Barrens 43.46,30.63 < 30 |only if walking
Continue following the road |goto The Barrens 47.95,28.00 < 30 |only if walking
Follow the path |goto The Barrens 50.82,29.06 < 15 |only if walking
Enter the building |goto Thunder Bluff 74.15,29.89 < 7 |walk
talk Turak Runetotem##3033
|tip Inside the building.
accept A Lesson to Learn##27 |goto Thunder Bluff 76.47,27.22
|only if Druid
step
talk Dendrite Starblaze##11802
|tip Upstairs inside the building.
turnin A Lesson to Learn##27 |goto Moonglade 56.21,30.65
accept Trial of the Lake##28 |goto Moonglade 56.21,30.65
|only if Druid
step
click Bauble Container##177785
|tip It looks like a wicker vase on the ground underwater.
|tip They spawn randomly, so you may have to search around this area.
|tip Swim at the top of the water until you can see one. |only if hardcore
|tip Hover above the container before swimming directly down to it. |only if hardcore
|tip Don't linger underwater longer than is required and watch your breath meter. |only if hardcore
collect Shrine Bauble##15877 |goto Moonglade 54.33,55.65 |q 28 |future
|only if Druid
step
use the Shrine Bauble##15877
Complete the Trial of the Lake |q 28/1 |goto Moonglade 35.92,41.38
|only if Druid
step
talk Tajarri##11799
turnin Trial of the Lake##28 |goto Moonglade 36.51,40.11
accept Trial of the Sea Lion##30 |goto Moonglade 36.51,40.11
|only if Druid
step
Leave the building |goto The Barrens 52.03,30.18 < 7 |walk
Follow the path |goto Orgrimmar 52.54,85.14 < 15 |only if walking
Enter Undercity |goto Tirisfal Glades 61.86,65.03 < 15 |only if walking
talk Michael Garrett##4551
fpath Undercity |goto Undercity 63.28,48.58
|only if Druid
step
Leave Undercity |goto Undercity 66.19,0.63 < 10 |walk
Follow the road |goto Tirisfal Glades 56.17,65.88 < 30|only if walking
Continue following the road |goto Silverpine Forest 58.14,12.21 < 30 |only if walking
Follow the path |goto Silverpine Forest 51.56,22.48 < 30 |only if walking
Continue following the path |goto Silverpine Forest 44.15,28.90 < 30 |only if walking
click Strange Lockbox##177844
|tip Underwater.
|tip Hover above the container before swimming directly down to it. |only if hardcore
|tip Don't linger underwater longer than is required and watch your breath meter. |only if hardcore
collect Half Pendant of Aquatic Endurance##15882 |goto Silverpine Forest 29.54,29.53 |q 30
|only if Druid
step
Follow the path |goto The Barrens 52.92,12.63 < 40 |only if walking
click Strange Lockbox##177794
|tip Underwater.
|tip Hover above the container before swimming directly down to it. |only if hardcore
|tip Don't linger underwater longer than is required and watch your breath meter. |only if hardcore
collect Half Pendant of Aquatic Agility##15883 |goto The Barrens 56.68,8.32 |q 30
|only if Druid
step
use the Half Pendant of Aquatic Agility##15883
collect Pendant of the Sea Lion##15885 |q 30/1 |goto Moonglade 35.92,41.42
|only if Druid
step
Follow the road |goto Moonglade 41.76,35.10 < 20 |only if walking
talk Dendrite Starblaze##11802
|tip Upstairs inside the building.
turnin Trial of the Sea Lion##30 |goto Moonglade 56.21,30.64
accept Aquatic Form##31 |goto Moonglade 56.21,30.64
|only if Druid
step
Enter the building |goto Thunder Bluff 74.15,29.89 < 15 |walk
talk Turak Runetotem##3033
|tip Inside the building.
turnin Aquatic Form##31 |goto Thunder Bluff 76.47,27.22
|only if Druid
step
ding 52
step
talk Turak Runetotem##3033
|tip Insidie the building.
accept Torwa Pathfinder##9063 |goto Thunder Bluff 76.60,27.60
|only if Druid
step
talk Torwa Pathfinder##9619
turnin Torwa Pathfinder##9063 |goto Un'Goro Crater 71.63,75.96
accept Bloodpetal Poison##9052 |goto Un'Goro Crater 71.63,75.96
|only if Druid
step
Kill Gorishi enemies around this area
|tip Gorishi Workers may call for help when at low health.	|only if hardcore
|tip Watch for patrols and respawns while in the cave.		|only if hardcore
collect 8 Gorishi Sting##22435 |q 9052/1 |goto Un'Goro Crater 50.40,78.60
|only if Druid
step
click Bloodpetal Sprout##164958
|tip They look like vines entwined in a ball.
|tip They are all over Un'Goro Crater.
collect 8 Bloodcap##22434 |q 9052/2 |goto Un'Goro Crater 71.90,57.40
You Can Find More Around [53.50,14.90]
[34.60,30.60]
|only if Druid
step
talk Torwa Pathfinder##9619
turnin Bloodpetal Poison##9052 |goto Un'Goro Crater 71.63,75.96
accept Toxic Test##9051 |goto Un'Goro Crater 71.63,75.96
|only if Druid
step
use the Devilsaur Barb##22432
|tip Use it on roaming Devilsaur around Un'Goro Crater.
Stab a Devilsaur with the Barb |q 9051/1 |goto Un'Goro Crater 67.31,33.89
|only if Druid
step
talk Torwa Pathfinder##9619
turnin Toxic Test##9051 |goto Un'Goro Crater 71.63,75.96
accept A Better Ingredient##9053 |goto Un'Goro Crater 71.63,75.96
|only if Druid
step
Run up the stairs |goto Swamp of Sorrows 56.28,76.52 < 10 |only if walking
Enter the building |q 9053 |future |goto Swamp of Sorrows 56.33,76.26 < 10 |c
|only if Druid
step
Run up the stairs |goto Swamp of Sorrows/0 69.36,56.89 < 7 |walk
Enter the building and swim under the water |goto Swamp of Sorrows/0 70.54,49.78 < 7 |walk
Run down the stairs |goto Swamp of Sorrows/0 72.69,42.22 < 7 |walk
Follow the path |goto Swamp of Sorrows/0 75.69,45.78 < 7 |walk
Follow the path |goto Swamp of Sorrows/0 78.62,47.47 < 7 |walk
Follow the path |goto Swamp of Sorrows/0 80.22,49.62 < 7 |walk
Follow the path |goto Swamp of Sorrows/0 81.33,42.38 < 7 |walk
Run down the stairs |goto Swamp of Sorrows/0 78.86,40.74 < 7 |walk
Run down the ramp |goto Swamp of Sorrows/0 76.85,38.82 < 7 |walk
Enter The Temple of Atal'Hakkar Dungeon with Your Group |goto The Temple of Atal'Hakkar/0 0.00,0.00 < 500 |c |q 9053 |future
|only if Druid
step
Inside the Temple of Atal'Hakkar Dungeon:
kill Atal'alarion##8580
|tip Refer to the Temple of Atal'Hakkar Dungeon Guide to accomplish that.
collect Putrid Vine##22444 |q 9053/1
|only if Druid
step
talk Torwa Pathfinder##9619
turnin A Better Ingredient##9053 |goto Un'Goro Crater 71.63,75.96
|only if Druid
]])
GoatQuest:RegisterGuide("Leveling Guides\\Priest Class Quests",{
description="This guide will walk you through completing various Priest Class Quests.",
},[[
step
ding 10
step
Enter the building |goto Durotar 53.24,42.59 < 10 |walk
talk Tai'jin##3706
|tip Inside the building.
accept Hex of Weakness##5652 |goto Durotar 54.26,42.93
|only if Troll Priest
step
talk Ur'kyo##6018
|tip Inside the building.
turnin Hex of Weakness##5652 |goto Orgrimmar 35.59,87.83
|only if Troll Priest
step
talk Father Lankester##4607
accept Touch of Weakness##5658 |goto Undercity 49.14,14.61
|only if Scourge Priest
step
talk Aelthalyste##4606
turnin Touch of Weakness##5658 |goto Undercity 49.27,17.11
|only if Scourge Priest
step
ding 20
step
Enter the cave |goto Thunder Bluff 29.73,29.76
talk Miles Welsh##3044
|tip Inside the cave.
accept Shadowguard##5643 |goto Thunder Bluff 25.32,15.24
|only if Troll Priest
step
talk Ur'kyo##6018
|tip Inside the building.
turnin Shadowguard##5643 |goto Orgrimmar 35.59,87.83
|only if Troll Priest
step
talk Ur'kyo##6018
|tip Upstairs inside the building.
accept Devouring Plague##5644 |goto Orgrimmar 35.59,87.83
|only if Scourge Priest
step
talk Aelthalyste##4606
turnin Devouring Plague##5644 |goto Undercity 49.27,17.11
|only if Scourge Priest
step
ding 52
step
talk Ur'kyo##6018
|tip Inside the building.
accept Cenarion Aid##8254 |goto Orgrimmar 35.60,87.60
|only if Priest
step
talk Ogtinc##8405
turnin Cenarion Aid##8254 |goto Azshara 42.40,42.60
accept Of Coursers We know##8255 |goto Azshara 42.40,42.60
|only if Priest
step
kill Mosshoof Courser##8761
|tip they are scattered all over the area.
collect 4 Healthy Courser Gland##20027 |q 8255/1 |goto Azshara 49.47,17.62
|only if Priest
step
talk Ogtinc##8405
turnin Of Coursers We know##8255 |goto Azshara 42.40,42.60
accept The Ichor of Undeath##8256 |goto Azshara 42.40,42.60
|only if Priest
step
Kill Highborne enemies around this area
collect Ichor of Undeath##7972 |q 8256/1 |goto Winterspring 52.59,40.68
|tip These have a low drop rate.
You can find more around: |notinsticky
[53.62,42.09]
[56.02,44.24]
|only if Priest
step
talk Ogtinc##8405
turnin The Ichor of Undeath##8256 |goto Azshara 42.40,42.60
accept Blood of Morphaz##8257 |goto Azshara 42.40,42.60
|only if Priest
step
Run up the stairs |goto Swamp of Sorrows/0 69.36,56.89 < 7 |walk
Enter the building and swim under the water |goto Swamp of Sorrows/0 70.54,49.78 < 7 |walk
Run down the stairs |goto Swamp of Sorrows/0 72.69,42.22 < 7 |walk
Follow the path |goto Swamp of Sorrows/0 75.69,45.78 < 7 |walk
Follow the path |goto Swamp of Sorrows/0 78.62,47.47 < 7 |walk
Follow the path |goto Swamp of Sorrows/0 80.22,49.62 < 7 |walk
Follow the path |goto Swamp of Sorrows/0 81.33,42.38 < 7 |walk
Run down the stairs |goto Swamp of Sorrows/0 78.86,40.74 < 7 |walk
Run down the ramp |goto Swamp of Sorrows/0 76.85,38.82 < 7 |walk
Enter The Temple of Atal'Hakkar Dungeon with Your Group |goto The Temple of Atal'Hakkar/0 0.00,0.00 < 500 |c |q 9053 |future
|only if Priest
step
Inside the Temple of Atal'Hakkar Dungeon:
kill Morphaz##5719
collect Blood of Morphaz##20025 |q 8257/1
|only if Priest
step
talk Greta Mosshoof##10922
turnin Blood of Morphaz##8257 |goto Felwood 51.20,82.20
|only if Priest
step
ding 58
step
talk Movkar##16012
|tip Inside the building.
accept An Earnest Proposition##8916 |goto Orgrimmar 34.80,38.00
|only if Priest
step
Kill Frostsaber enemies around this area
collect 15 Winterspring Blood Sample##21928 |q 8916/1 |goto Winterspring/0 51.80,9.20
|only if Priest
step
collect Devout Bracers##16697 |q 8916/2
|tip These drop from enemies in Stratholme.
|tip Refer to either Stratholme dungeon guides to accomplish this.
|tip You can also buy them from the Auction House.|only if not selfmade()
|only if Priest
step
Collect 20 Gold |complete _G.GetMoney() >= 2000 |q 8916/3
|only if Priest
step
talk Movkar##16012
|tip Inside the building.
turnin An Earnest Proposition##8916 |goto Orgrimmar 34.80,38.00
|only if Priest
]])
GoatQuest:RegisterGuide("Leveling Guides\\Warrior Class Quests",{
description="This guide will walk you through completing various Warrior Class Quests.",
},[[
step
ding 10
step
talk Krang Stonehoof##3063
accept Veteran Uzzek##1505 |goto Mulgore 49.52,60.58
|only if Tauren Warrior
step
Enter the building |goto Durotar 53.25,42.59 < 7 |walk
talk Tarshaw Jaggedscar##3169
|tip Inside the building.
accept Veteran Uzzek##1505 |goto Durotar 54.19,42.46
|only if (Orc Warrior) or (Troll Warrior)
step
Leave the building |goto Durotar 53.27,42.59 < 7 |walk |only if (Orc Warrior) or (Troll Warrior)
Follow the road |goto Durotar 50.64,43.97 < 15 |only if walking and ((Orc Warrior) or (Troll Warrior))
Cross the bridge |goto Durotar 34.60,42.31 < 15 |only if walking and ((Orc Warrior) or (Troll Warrior))
talk Uzzek##5810
turnin Veteran Uzzek##1505 |goto The Barrens 61.38,21.11
accept Path of Defense##1498 |goto The Barrens 61.38,21.11
|only if (Orc Warrior) or (Troll Warrior) or (Tauren Warrior)
step
Cross the bridge |goto The Barrens 62.68,19.22 < 15 |only if walking
Follow the path |goto Durotar 39.18,32.15 < 15 |only if walking
kill Thunder Lizard##3130+
|tip Watch for respawns while in the area. |only if hardcore
collect 5 Singed Scale##6486 |q 1498/1 |goto Durotar 39.27,28.29
|only if (Orc Warrior) or (Troll Warrior) or (Tauren Warrior)
step
Follow the path |goto Durotar 39.16,32.31 < 15 |only if walking
Cross the bridge |goto Durotar 34.60,42.28 < 15 |only if walking
talk Uzzek##5810
turnin Path of Defense##1498 |goto The Barrens 61.38,21.11
accept Thun'grim Firegaze##1502 |goto The Barrens 61.38,21.11
|only if (Orc Warrior) or (Troll Warrior) or (Tauren Warrior)
step
Follow the path up |goto The Barrens 55.51,32.40
talk Thun'grim Firegaze##5878
turnin Thun'grim Firegaze##1502 |goto The Barrens 57.23,30.34
accept Forged Steel##1503 |goto The Barrens 57.23,30.34
|only if (Orc Warrior) or (Troll Warrior) or (Tauren Warrior)
step
Follow the path down |goto The Barrens 55.51,32.40
click Stolen Iron Chest##58369
collect Forged Steel Bars##6534 |q 1503/1 |goto The Barrens 55.05,26.66
|only if (Orc Warrior) or (Troll Warrior) or (Tauren Warrior)
step
Follow the path up |goto The Barrens 55.51,32.40
talk Thun'grim Firegaze##5878
turnin Forged Steel##1503 |goto The Barrens 57.23,30.34
|only if (Orc Warrior) or (Troll Warrior) or (Tauren Warrior)
step
talk Austil de Mon##2131
|tip Inside the building.
accept Speak with Dillinger##1818 |goto Tirisfal Glades 61.85,52.54
|only if Scourge Warrior
step
Leave the building |goto Tirisfal Glades 61.56,53.05 < 7 |walk
talk Deathguard Dillinger##1496
turnin Speak with Dillinger##1818 |goto Tirisfal Glades 58.20,51.45
accept Ulag the Cleaver##1819 |goto Tirisfal Glades 58.20,51.45
|only if Scourge Warrior
step
click Doors
kill Ulag the Cleaver##6390 |q 1819/1 |goto Tirisfal Glades 59.64,48.09
|only if Scourge Warrior
step
talk Deathguard Dillinger##1496
turnin Ulag the Cleaver##1819 |goto Tirisfal Glades 58.20,51.45
accept Speak with Coleman##1820 |goto Tirisfal Glades 58.20,51.45
|only if Scourge Warrior
step
Enter the building |goto Tirisfal Glades 61.56,53.04 < 7 |walk
talk Coleman Farthing##1500
|tip Inside the building.
turnin Speak with Coleman##1820 |goto Tirisfal Glades 61.72,52.29
accept Agamand Heirlooms##1821 |goto Tirisfal Glades 61.72,52.29
|only if Scourge Warrior
step
Follow the path up |goto Tirisfal Glades 47.86,47.45 < 20 |only if walking
Enter the crypt |q 1821 |goto Tirisfal Glades 52.25,26.86 < 10 |c |walk
|only if Scourge Warrior
step
click Agamand Weapon Rack##105172
|tip Inside the crypt.
|tip Watch for patrols and respawns while in the area. |only if hardcore
collect Agamand Family Mace##7569 |q 1821/3 |goto Tirisfal Glades 52.66,27.04
|only if Scourge Warrior
step
click Agamand Weapon Rack##105171
|tip Inside the crypt.
|tip Watch for patrols and respawns while in the area. |only if hardcore
collect Agamand Family Dagger##7568 |q 1821/2 |goto Tirisfal Glades 51.89,27.12
|only if Scourge Warrior
step
click Agamand Weapon Rack##105169
|tip Inside the crypt.
|tip Watch for patrols and respawns while in the area. |only if hardcore
collect Agamand Family Axe##7567 |q 1821/1 |goto Tirisfal Glades 51.70,25.69
|only if Scourge Warrior
step
click Agamand Weapon Rack##105170
|tip Inside the crypt.
|tip Watch for patrols and respawns while in the area. |only if hardcore
collect Agamand Family Sword##7566 |q 1821/1 |goto Tirisfal Glades 52.65,25.86
|only if Scourge Warrior
step
Leave the crypt |q 1821 |goto Tirisfal Glades 52.25,26.86 < 10 |walk
Enter the building |goto Tirisfal Glades 61.56,53.04 < 7 |walk
talk Coleman Farthing##1500
|tip Inside the building.
turnin Agamand Heirlooms##1821 |goto Tirisfal Glades 61.72,52.29
|only if Scourge Warrior
step
ding 30
step
Incoming Difficult Quest
|tip You're going to be tasked with surviving the Affray, which is a combat trial.
|tip You'll be tasked with killing waves of enemies with very little downtime afforded in between.
|tip If possible, you may want to get help for this.
Click Here to Continue |confirm |q 1718 |future
|only if Warrior and hardcore
step
Enter the building |goto Orgrimmar 76.52,32.92 < 7 |walk
talk Sorek##3354
|tip Inside the building.
accept The Islander##1718 |goto Orgrimmar 80.38,32.38
|only if Warrior
step
talk Klannoc Macleod##6236
turnin The Islander##1718 |goto The Barrens 68.62,49.17
accept The Affray##1719 |goto The Barrens 68.62,49.17
|only if Warrior
step
Step on the Grate to Begin the Affray |q 1719/1 |goto The Barrens 68.61,48.72
|only if Warrior
step
kill Affray Challenger##6240+
|tip You will have to kill six of them before Big Will will appear.
|tip They will fight them one at a time.
|tip Avoid using AoE abilities as they may aggro the other affray contestants. |only if hardcore
|tip When you defeat an enemy, don't stand near the grate or it will force the next opponent. |only if hardcore
|tip Eat or Bandage after each opponent. |only if hardcore
|tip Step back after each opponent spawns. |only if hardcore
kill Big Will##6238 |q 1719/2 |goto The Barrens 68.61,48.72
|tip It may take a while before he appears.
|only if Warrior
step
talk Klannoc Macleod##6236
turnin The Affray##1719 |goto The Barrens 68.62,49.17
|only if Warrior
step
ding 38
step
collect 8 Liferoot##3357 |q 1712 |future
|tip If you have the Herbalism profession, you can gather these.
|tip Search the guide menu for the item(s) to use the farming guides.
|tip You can also purchase them from the Auction House. |only if not selfmade()
|only if Warrior
step
talk Klannoc Macleod##6236
accept The Windwatcher##1791 |goto The Barrens 68.62,49.17
|only if Warrior
step
Follow the path |goto Hillsbrad Foothills 70.63,10.06
talk Bath'rah the Windwatcher##6176
turnin The Windwatcher##1791 |goto Alterac Mountains 80.50,66.92
accept Cyclonian##1712 |goto Alterac Mountains 80.50,66.92
|only if Warrior
step
kill Burning Exile##2760
collect 8 Burning Charm##4479 |q 1712 |future |goto Arathi Highlands 26.60,31.80
|only if Warrior
step
kill Thundering Exile##2762
collect 8 Thundering Charm##4480 |q 1712 |future |goto Arathi Highlands 52.60,52.20
|only if Warrior
step
kill Cresting Exile##2761
collect 8 Cresting Charm##4481 |q 1712 |future |goto Arathi Highlands 68.00,30.00
|only if Warrior
step
Kill Bloodscalp enemies around this area
collect 30 Bloodscalp Tusk##3901 |q 1712/2 |goto Stranglethorn Vale 25.85,11.25
|only if Warrior
step
click Bath'rah's Cauldron##89931
accept Essence of the Exile##1714 |goto Alterac Mountains 79.31,66.81
collect Essence of the Exile##6851 |q 1712/3 |goto Alterac Mountains 79.31,66.81
|only if Warrior
step
Incoming Difficult Quest
|tip "The Summoning" quest coming up after Cyclonian has you facing a level 40 elite enemy.
|tip You will likely need help with this.
Click Here to Continue |confirm |q 1713 |future
|only if Warrior and hardcore
step
talk Bath'rah the Windwatcher##6176
turnin Cyclonian##1712 |goto Alterac Mountains 80.50,66.92
accept The Summoning##1713 |goto Alterac Mountains 80.50,66.92
|only if Warrior
step
Follow Bath'rah the Windwatcher
Watch the Dialogue
kill Cyclonian##6239
|tip You may need help with this.
|tip This is a level 40 Elite enemy. |only if hardcore
collect Whirlwind Heart##6894 |q 1713/1 |goto Alterac Mountains 80.57,62.56
|only if Warrior
step
talk Bath'rah the Windwatcher##6176
turnin The Summoning##1713 |goto Alterac Mountains 80.50,66.92
accept Whirlwind Weapon##1792 |goto Alterac Mountains 80.50,66.92
|only if Warrior
step
ding 52
step
Enter the building |goto Orgrimmar 76.52,32.92 < 7 |walk
talk Sorek##3354
|tip Inside the building.
accept A Troubled Spirit##8417 |goto Orgrimmar 80.38,32.38
|only if Warrior
step
talk Fallen Hero of the Horde##7572
turnin A Troubled Spirit##8417 |goto Swamp of Sorrows 34.29,66.15
accept Warrior Kinship##8423 |goto Swamp of Sorrows 34.29,66.15
|only if Warrior
step
kill 7 Helboar##5993 |q 8423/1 |goto Blasted Lands 51.34,53.45
|only if Warrior
step
talk Fallen Hero of the Horde##7572
turnin Warrior Kinship##8423 |goto Swamp of Sorrows 34.29,66.15
accept War on the Shadowsworn##8424 |goto Swamp of Sorrows 34.29,66.15
|only if Warrior
stickystart "Kill_Shadowsworn_Cultitst"
stickystart "Kill_Shadowsworn_Thug"
step
kill 20	Shadowsworn Adept##6006 |q 8424/1 |goto Blasted Lands 65.17,32.83
|tip Watch for patrols and respawns around this area. |only if hardcore
|only if Warrior
step
label "Kill_Shadowsworn_Cultitst"
kill 10 Shadowsworn Cultist##6004 |q 8424/2 |goto Blasted Lands 65.17,32.83
|tip Watch for patrols and respawns around this area. |only if hardcore |notinsticky
|only if Warrior
step
label "Kill_Shadowsworn_Thug"
kill 20 Shadowsworn Thug##6005 |q 8424/3 |goto Blasted Lands 65.17,32.83
|tip Watch for patrols and respawns around this area. |only if hardcore |notinsticky
|only if Warrior
step
talk Fallen Hero of the Horde##7572
turnin War on the Shadowsworn##8424 |goto Swamp of Sorrows 34.29,66.15
accept Voodoo Feathers##8425 |goto Swamp of Sorrows 34.29,66.15
|only if Warrior
step
Incoming Dungeon Step
|tip The next couple of steps will be taking you to the Sunken Temple dungeon.
|tip You will need a group to complete the dungeon as well as the quest.
|tip If you don't have a group, wait until you do before continuing.
Click Here to Continue |confirm |q 8425
|only if Warrior and hardcore
step
Run up the stairs |goto Swamp of Sorrows/0 69.36,56.89 < 7 |walk
Enter the building and swim under the water |goto Swamp of Sorrows/0 70.54,49.78 < 7 |walk
Run down the stairs |goto Swamp of Sorrows/0 72.69,42.22 < 7 |walk
Follow the path |goto Swamp of Sorrows/0 75.69,45.78 < 7 |walk
Follow the path |goto Swamp of Sorrows/0 78.62,47.47 < 7 |walk
Follow the path |goto Swamp of Sorrows/0 80.22,49.62 < 7 |walk
Follow the path |goto Swamp of Sorrows/0 81.33,42.38 < 7 |walk
Run down the stairs |goto Swamp of Sorrows/0 78.86,40.74 < 7 |walk
Run down the ramp |goto Swamp of Sorrows/0 76.85,38.82 < 7 |walk
Enter The Temple of Atal'Hakkar Dungeon with Your Group |goto The Temple of Atal'Hakkar/0 0.00,0.00 < 500 |c |q 8425 |future
|only if Warrior
step
Inside the Temple of Atal'Hakkar:
collect 2 Amber Voodoo Feather##20606 |q 8425/1
|tip These come from Gasher and Zul'Lor.
|only if Warrior
step
Inside the Temple of Atal'Hakkar:
collect 2 Blue Voodoo Feather##20607 |q 8425/2
|tip These come from Mijan and Hukku.
|only if Warrior
step
Inside the Temple of Atal'Hakkar:
collect 2 Green Voodoo Feather##20608 |q 8425/3
|tip These come from Zolo and Loro.
|only if Warrior
step
talk Fallen Hero of the Horde##7572
turnin Voodoo Feathers##8425 |goto Swamp of Sorrows 34.29,66.15
|only if Warrior
]])
GoatQuest:RegisterGuide("Leveling Guides\\Hunter Class Quests",{
description="This guide will walk you through completing various Hunter Class Quests.",
},[[
step
ding 10
step
talk Thotar##3171
|tip Inside the building.
accept Taming the Beast##6062 |goto Durotar 51.85,43.49
|only if (Orc Hunter) or (Troll Hunter)
step
use the Taming Rod##15917
|tip Use it on a Dire Mottled Boar around this area.
Tame a Dire Mottled Boar |q 6062/1 |goto Durotar 51.84,47.23
|tip Dismiss it after you tame it.
|tip It may attack you after you dismiss it.
|only if (Orc Hunter) or (Troll Hunter)
step
talk Thotar##3171
|tip Inside the building.
turnin Taming the Beast##6062 |goto Durotar 51.85,43.49
accept Taming the Beast##6083 |goto Durotar 51.85,43.49
|only if (Orc Hunter) or (Troll Hunter)
step
Follow the path |goto Durotar 54.36,39.59 < 20 |only if walking
use the Taming Rod##15919
|tip Use it on a Surf Crawler around this area.
Tame a Surf Crawler |q 6083/1 |goto Durotar 59.01,27.64
|tip Dismiss it after you tame it.
|tip It may attack you after you dismiss it.
|only if (Orc Hunter) or (Troll Hunter)
step
talk Thotar##3171
|tip Inside the building.
turnin Taming the Beast##6083 |goto Durotar 51.85,43.49
accept Taming the Beast##6082 |goto Durotar 51.85,43.49
|only if (Orc Hunter) or (Troll Hunter)
step
use the Taming Rod##15920
|tip Use it on an Armored Scorpid around this area.
Tame an Armored Scorpid |q 6082/1 |goto Durotar 45.21,45.77
|only if (Orc Hunter) or (Troll Hunter)
step
talk Thotar##3171
|tip Inside the building.
turnin Taming the Beast##6082 |goto Durotar 51.85,43.49
accept Training the Beast##6081 |goto Durotar 51.85,43.49
|only if (Orc Hunter) or (Troll Hunter)
step
Enter Orgrimmar |goto Durotar 45.54,12.06 < 20 |only if walking
Follow the path up |goto Orgrimmar 71.64,25.95 < 15 |only if walking
Follow the path up |goto Orgrimmar 67.68,14.51 < 7 |only if walking
talk Ormak Grimshot##3352
turnin Training the Beast##6081 |goto Orgrimmar 66.05,18.54
|only if (Orc Hunter) or (Troll Hunter)
step
talk Yaw Sharpmane##3065
accept Taming the Beast##6061 |goto Mulgore 47.82,55.69
|only if Tauren Hunter
step
use the Taming Rod##15914
|tip Use it on an Adult Plainstrider around this area.
Tame an Adult Plainstrider |q 6061/1 |goto Mulgore 43.81,51.82
|tip Dismiss it after you tame it.
|tip It may attack you after you dismiss it.
You can find more around [40.11,57.35]
|only if Tauren Hunter
step
talk Yaw Sharpmane##3065
turnin Taming the Beast##6061 |goto Mulgore 47.82,55.69
accept Taming the Beast##6087 |goto Mulgore 47.82,55.69
|only if Tauren Hunter
step
use the Taming Rod##15915
|tip Use it on a Prairie Stalker around this area.
Tame a Prairie Stalker |q 6087/1 |goto Mulgore 46.48,49.06
|tip Dismiss it after you tame it.
|tip It may attack you after you dismiss it.
|only if Tauren Hunter
step
talk Yaw Sharpmane##3065
turnin Taming the Beast##6087 |goto Mulgore 47.82,55.69
accept Taming the Beast##6088 |goto Mulgore 47.82,55.69
|only if Tauren Hunter
step
use the Taming Rod##15916
|tip Use it on a Swoop around this area.
Tame a Swoop |q 6088/1 |goto Mulgore 46.48,49.06
|only if Tauren Hunter
step
talk Yaw Sharpmane##3065
turnin Taming the Beast#6088 |goto Mulgore 47.82,55.69
accept Training the Beast##6089 |goto Mulgore 47.82,55.69
|only if Tauren Hunter
step
Ride the elevator up |goto Thunder Bluff 31.80,65.96 < 10 |only if walking
Enter the building |goto Thunder Bluff 44.91,61.98 < 15 |only if walking
Cross the bridge |goto Thunder Bluff 47.69,68.75 < 10 |only if walking
Enter the building |goto Thunder Bluff 59.80,82.89 < 15 |walk
talk Holt Thunderhorn##3039
|tip Inside the building.
turnin Training the Beast##6089 |goto Thunder Bluff 57.31,89.76
|only if Tauren Hunter
step
ding 50
|only if not hardcore
step
ding 52
|only if hardcore
step
Follow the path up |goto Orgrimmar 66.46,22.63 < 10 |only if walking
talk Ormak Grimshot##3352
accept The Hunter's Charm##8151 |goto Orgrimmar 66.06,18.54
|only if Hunter
step
Follow the path up |goto Azshara 42.09,42.45
talk Ogtinc##8405
turnin The Hunter's Charm##8151 |goto Azshara 42.40,42.62
accept Courser Antlers##8153 |goto Azshara 42.40,42.62
|only if Hunter
step
kill Mosshoof Courser##8761
|tip they are scattered all over the area.
collect 2 Perfect Courser Antler##20017 |q 8153/1 |goto Azshara 49.47,17.62
|only if Hunter
step
Follow the path up |goto Azshara 42.09,42.45
talk Ogtinc##8405
turnin Courser Antlers##8153 |goto Azshara 42.40,42.62
accept Wavethrashing##8231 |goto Azshara 42.40,42.62
|only if Hunter
step
Jump down here carefully |goto Azshara 33.68,48.68 < 10 |only if walking
Follow the path down |goto Azshara 40.54,47.84 < 15 |only if walking
Kill Wavethrasher enemies around this area
|tip They are underwater around this area.
collect 6 Wavethrasher Scale##20087 |q 8231/1 |goto Azshara 52.61,41.87
You can find more around here [59.77,37.36]
|only if Hunter
step
Follow the path up |goto Azshara 42.09,42.45
talk Ogtinc##8405
turnin Wavethrashing##8231 |goto Azshara 42.40,42.62
accept The Green Drake##8232 |goto Azshara 42.40,42.62
|only if Hunter
step
Incoming Dungeon Step
|tip The next couple of steps will be taking you to the Sunken Temple dungeon.
|tip You will need a group to complete the dungeon as well as the quest.
|tip If you don't have a group, wait until you do before continuing.
Click Here to Continue |confirm |q 8425
|only if Hunter and hardcore
step
Run up the stairs |goto Swamp of Sorrows/0 69.36,56.89 < 7 |walk
Enter the building and swim under the water |goto Swamp of Sorrows/0 70.54,49.78 < 7 |walk
Run down the stairs |goto Swamp of Sorrows/0 72.69,42.22 < 7 |walk
Follow the path |goto Swamp of Sorrows/0 75.69,45.78 < 7 |walk
Follow the path |goto Swamp of Sorrows/0 78.62,47.47 < 7 |walk
Follow the path |goto Swamp of Sorrows/0 80.22,49.62 < 7 |walk
Follow the path |goto Swamp of Sorrows/0 81.33,42.38 < 7 |walk
Run down the stairs |goto Swamp of Sorrows/0 78.86,40.74 < 7 |walk
Run down the ramp |goto Swamp of Sorrows/0 76.85,38.82 < 7 |walk
Enter The Temple of Atal'Hakkar Dungeon with Your Group |goto The Temple of Atal'Hakkar/0 0.00,0.00 < 500 |c |q 8232 |future
|only if Hunter
step
Inside the Temple of Atal'Hakkar:
kill Morphaz##5719
collect Tooth of Morphaz##20019 |q 8232/1
|only if Hunter
step
Follow the path up |goto Azshara 42.09,42.45
talk Ogtinc##8405
turnin The Green Drake##8232 |goto Azshara 42.40,42.62
|only if Hunter
step
ding 60
step
Incoming Raid Steps
|tip The upcoming quest steps will send you into the Molten Core and Onyxia's Lair raids.
|tip You will need a group to complete them.
Click Here to Continue |confirm |q 7635 |future
|only if Hunter
step
Inside the Molten Core Raid:
kill Majordomo Executus##12018
collect Ancient Petrified Leaf##18703 |n
use the Ancient Petrified Leaf##18703
accept The Ancient Leaf##7632
|only if Hunter
step
talk Vartus the Ancient##14524
|tip Kill enemies around the area for him to appear.
turnin The Ancient Leaf##7632 |goto Felwood 48.99,24.44
accept An Introduction##7633 |goto Felwood 48.99,24.44
accept Stave of the Ancients##7636 |goto Felwood 48.99,24.44
|only if Hunter
step
talk Stoma the Ancient##14525
|tip Kill enemies around the area for him to appear.
accept A Proper String##7635 |goto Felwood 48.31,24.43
|only if Hunter
step
label "Simone_the_Inconspicuous_1"
map Un'Goro Crater
path loop off; dist 20
path	40.60,79.81	39.66,80.76	40.56,83.56	44.20,84.60	44.70,84.97
path	47.33,83.43	48.29,83.07	49.48,82.62	52.88,82.85	54.39,80.58
path	53.25,76.57	52.94,71.85	52.49,70.68	50.94,68.32	48.26,68.82
path	46.33,66.62	45.54,65.95	44.59,63.45	41.43,62.58	41.03,62.86
path	39.76,60.14	40.27,55.85	39.31,48.70	38.48,45.86	38.04,41.96
path	36.18,39.79	35.09,38.14	33.26,37.56	31.74,42.57	31.26,43.64
path	31.58,44.98
Follow the path
talk Simone the Inconspicuous##14527
|tip Use the "Track Demons" ability from the Survival Branch to accomplish this.
|tip She patrols all around Un'Goro Crater.
Select _"Show me your real face, demon."_
kill Simone the Inconspicuous##14527
|tip This must be done alone or it will despawn.
collect Simone's Head##18952 |q 7636/1 |next "Klinfran_the_Crazed_1" |or
'|goto Un'Goro Crater 31.58,44.98 < 20 |noway |or |c |next "Simone_the_Inconspicuous_2"
|only if Hunter
step
label "Simone_the_Inconspicuous_2"
map Un'Goro Crater
path loop off; dist 20
path	34.12,41.24	35.41,41.78	36.58,44.59	37.39,46.16	37.11,50.89
path	38.49,51.80	39.14,53.13	38.36,56.24	38.06,60.14	38.74,65.34
path	39.38,67.27	39.65,69.63	40.89,73.47	41.67,73.78	42.23,75.22
path	42.32,77.27	41.33,78.48	40.66,79.79
Follow the path
talk Simone the Inconspicuous##14527
|tip Use the "Track Demons" ability from the Survival Branch to accomplish this.
|tip She patrols all around Un'Goro Crater.
Select _"Show me your real face, demon."_
kill Simone the Inconspicuous##14527
|tip This must be done alone or it will despawn.
collect Simone's Head##18952 |q 7636/1 |next "Klinfran_the_Crazed_1" |or
'|goto Un'Goro Crater 40.66,79.79 < 20 |noway |or |c |next "Simone_the_Inconspicuous_1"
|only if Hunter
step
label "Klinfran_the_Crazed_1"
map Burning Steppes
path dist 25
path	30.95,53.11	28.61,51.69	26.37,50.79	24.46,49.56	22.35,49.13
path	19.24,49.41	17.32,53.62	17.55,57.76	19.13,59.29	21.32,59.59
path	24.15,62.26	25.60,62.31	25.54,64.65	27.14,62.05	28.46,59.49
path	28.81,56.98	30.04,55.63	29.20,51.92
Follow the path
talk Franklin the Friendly##14529
|tip Use the "Track Demons" ability from the Survival Branch to accomplish this.
|tip He patrols around Burning Steppes.
Select _"Show me your real face, demon."_
kill Klinfran the Crazed##14534
|tip This must be done alone or it will despawn.
collect Klinfran's Head##18953 |q 7636/2
|only if Hunter
step
map Silithus
path dist 20
path	27.18,84.28	25.70,86.85	25.51,88.41	22.00,86.39	21.41,83.81
path	21.45,81.74	23.00,79.45	24.79,76.13	26.93,75.99	28.43,76.18
path	28.98,80.30	29.15,81.69	26.81,84.80
Follow the path
talk Nelson the Nice##14536
|tip Use the "Track Demons" ability from the Survival Branch to accomplish this.
|tip He walks around the area.
Select _"Show me your real face, demon."_
kill Solenor the Slayer##14530
|tip This must be done alone or it will despawn.
collect Solenor's Head##18954 |q 7636/3 |goto Silithus 26.00,81.20
|only if Hunter
step
map Winterspring
path dist 17
path	57.82,21.11	58.43,21.89	58.74,22.81	59.05,23.60	59.71,24.17
path	60.19,23.60	60.38,22.81	60.15,21.85	60.63,21.54	60.84,21.21
path	60.33,20.38	59.94,19.05	59.71,17.37	60.14,16.22	60.62,15.32
path	60.87,14.53	60.51,13.36	59.83,12.09	59.33,12.32	58.73,12.74
path	58.15,13.34	57.93,14.47	58.11,15.96	58.50,17.78	58.22,19.31
path	57.98,20.53
Follow the path
talk Artorius the Amiable##14531
|tip Use the "Track Demons" ability from the Survival Branch to accomplish this.
|tip He walks around the area.
Select _"Show me your real face, demon."_
kill Artorius the Doombringer##14535
|tip This must be done alone or it will despawn and be on a 3 hour timer.
collect Artorius's Head##18955 |q 7636/4 |goto Winterspring 58.20,15.60
|only if Hunter
step
Inside the Onyxia's Lair Raid:
kill Onyxia##10184
collect Mature Black Dragon Sinew##18705 |q 7635/1
|tip This isn't a 100% drop rate.
|only if Hunter
step
talk Vartus the Ancient##14524
|tip Kill enemies around the area for him to appear.
turnin Stave of the Ancients##7636  |goto Felwood 48.99,24.44
|only if Hunter
step
talk Stoma the Ancient##14525
|tip Kill enemies around the area for him to appear.
turnin A Proper String##7635 |goto Felwood 48.31,24.43
|only if Hunter
step
use the Ancient Rune Etched Stave##18707
collect Rhok'delar Longbow of the Ancient Keepers##18713 |n
collect Lok'delar Stave of the Ancient Keepers##18715 |n
|only if Hunter
]])
GoatQuest:RegisterGuide("Leveling Guides\\Mage Class Quests",{
description="This guide will walk you through completing various Mage Class Quests.",
},[[
step
ding 15
step
talk Uthel'nay##7311
|tip Inside the building.
accept Speak with Un'thuwa##1883 |goto Orgrimmar 39.16,86.27
|only if Mage
step
talk Un'Thuwa##5880
|tip Inside the building.
turnin Speak with Un'thuwa##1883 |goto Durotar 56.31,75.11
accept Ju-Ju Heaps##1884 |goto Durotar 56.31,75.11
|only if Mage
step
click Ju-ju Heap##102986
|tip They look like a pile of skulls.
|tip They are in buildings all around this area.
|tip Watch for patrols and respawns while in the area. |only if hardcore
Destroy 4 Ju-ju Heaps |q 1884/1 |goto Durotar 67.76,83.50
|only if Mage
step
talk Un'Thuwa##5880
|tip Inside the building.
turnin Ju-Ju Heaps##1884 |goto Durotar 56.31,75.11
|only if Mage
step
ding 15
step
talk Uthel'nay##7311
|tip Inside the building.
accept Report to Anastasia##1959 |goto Orgrimmar 39.16,86.27
|only if Mage
step
talk Anastasia Hartwell##4568
turnin Report to Anastasia##1959 |goto Undercity 85.14,10.06
accept Investigate the Alchemist Shop##1960 |goto Undercity 85.14,10.06
|only if Mage
step
click Cantation of Manifestation##105175
|tip It looks like a scroll on the ledge of the wall.
collect Cantation of Manifestation##7308 |q 1960/3 |goto Undercity 85.65,10.00
|only if Mage
step
click Chest of Containment Coffers##105174
|tip It looks like a brown treasure box on the edge of the wall.
collect Chest of Containment Coffers##7247 |q 1960/2 |goto Undercity 85.65,10.00
|only if Mage
step
use the Cantation of Manifestation##7308
|tip Use the "Arcane Explosion" ability after using the Cantation to reveal the enemy.
kill Rift Spawn##6492
use the Chest of Containment Coffers##7247
|tip Use it on the Rift Spawn corpse.
click Filled Containment Coffer
collect 3 Filled Containment Coffer##7292 |q 1960/1 |goto Undercity 52.99,74.92
|only if Mage
step
talk Anastasia Hartwell##4568
turnin Investigate the Alchemist Shop##1960 |goto Undercity 85.14,10.06
accept Gathering Materials##1961 |goto Undercity 85.14,10.06
|only if Mage
stickystart "10_linen"
step
Kill enemies around this area
collect 6 Dalaran Mana Gem##7293 |q 1961/2 |goto Silverpine Forest 62.26,64.24
|tip Keep an eye out for patrols and casters while in the cave. |only if hardcore
|only if Mage
step
label "10_linen"
Kill enemies around this area
|tip Keep an eye out for patrols and casters while in the cave. |only if hardcore |notinsticky
collect 10 Linen Cloth##2589 |q 1961/1 |goto Silverpine Forest 62.26,64.24
|only if Mage
step
talk Josef Gregorian##4576
turnin Gathering Materials##1961 |goto Undercity 70.75,30.69
Watch the Dialogue
accept Spellfire Robes##1962 |goto Undercity 70.75,30.69
|only if Mage
step
ding 26
step
talk Anastasia Hartwell##4568
accept Speak with Deino##1943 |goto Undercity 85.13,9.98
|only if Mage
step
talk Deino##5885
turnin Speak with Deino##1943 |goto Orgrimmar 38.45,86.14
accept Waters of Xavian##1944 |goto Orgrimmar 38.45,86.14
|only if Mage
step
Follow the path up |goto Ashenvale 73.67,50.38 < 15
use Deino's Flask##7269
collect Xavian Water Sample##7268 |q 1944/1 |goto Ashenvale 76.33,41.43
|only if Mage
step
talk Deino##5885
turnin Waters of Xavian##1944 |goto Orgrimmar 38.45,86.14
accept Laughing Sisters##1945 |goto Orgrimmar 38.45,86.14
|only if Mage
step
kill Laughing Sister##4054
|tip Watch for patrols and respawns in the area. |only if hardcore
collect 12 Laughing Sister's Hair##7270 |q 1945/1 |goto Ashenvale 58.61,59.49
You can find more around here [58.25,55.98]
|only if Mage
step
talk Kil'hala##3484
turnin Laughing Sisters##1945 |goto The Barrens 52.20,31.70
accept Nether-lace Garment##1946 |goto The Barrens 52.20,31.70
|only if Mage
step
ding 30
step
talk Deino##5885
|tip Inside the building.
accept Journey to the Marsh##1947 |goto Orgrimmar 38.45,86.14
|only if Mage
step
collect 1 Jade##1529 |q 1948 |future
|tip These are gathered with the Mining profession.
|tip You can also buy them from the Auction House. |only if not selfmade()
|tip Make sure not to accidentally vendor it.
step
talk Tabetha##6546
|tip Inside the building.
turnin Journey to the Marsh##1947 |goto Dustwallow Marsh 46.06,57.09
Watch the Dialogue
accept Hidden Secrets##1949 |goto Dustwallow Marsh 46.06,57.09
|only if Mage
step
talk Magus Tirth##6548
turnin Hidden Secrets##1949 |goto Thousand Needles 78.29,75.70
accept Get the Scoop##1950 |goto Thousand Needles 78.29,75.70
|only if Mage
step
talk "Plucky" Johnson##6626
|tip Use the "/beckon" Emote to turn him back to a human.
Tell him to _"Please tell me the Phrase..."_
Learn the Secret Phrase |q 1950/1 |goto Thousand Needles 79.60,75.60
|only if Mage
step
talk Magus Tirth##6548
turnin Get the Scoop##1950 |goto Thousand Needles 78.29,75.70
accept Rituals of Power##1951 |goto Thousand Needles 78.29,75.70
|only if Mage
step
talk Tabetha##6546
|tip Inside the building.
accept Items of Power##1948 |goto Dustwallow Marsh 46.06,57.09
|only if Mage
step
Kill Witherbark enemies around this area
|tip They look like trolls.
collect 10 Witherbark Totem Stick##7273 |q 1948 |goto Arathi Highlands 66.66,64.37
|only if Mage
step
use the Witherbark Totem Stick##7273
|tip Clear the enemies around the stones before doing so.
click Bolt Charged Bramble##103662
|tip On top of the rock at the center of the Outer Binding Circle.
collect Bolt Charged Bramble##7272 |q 1948/2 |goto Arathi Highlands 52.06,50.69
|only if Mage
step
collect 1 Jade##1529 |q 1948
|tip You should have collected this earlier.
|only if Mage
step
talk Tabetha##6546
|tip Inside the building.
turnin Items of Power##1948 |goto Dustwallow Marsh 46.06,57.09
|only if Mage
step
Incoming Scarlet Monastery (Library) Dungeon:
|tip The upcoming quest steps will send you into the Scarlet Monastery dungeons.
|tip You will need a group to complete them.
Click Here to Continue |confirm |q 1951
|only if Mage and hardcore
step
Enter the building |goto Tirisfal Glades/0 82.65,32.88 < 7 |walk
Enter the Portal |goto Tirisfal Glades/0 85.33,32.27 < 7 |walk
Enter the Scarlet Monastery - Library Dungeon with Your Group |goto Scarlet Monastery/0 0.00,0.00 < 500 |c |noway |q 1951
|only if Mage
step
Inside the Scarlet Monastery Library Dungeon:
click Rituals of Power
|tip In the Athenaeum, to the left of the doorway.
collect Rituals of Power##7274 |q 1951/1
|only if Mage
step
talk Tabetha##6546
|tip Inside the building.
turnin Rituals of Power##1951  |goto Dustwallow Marsh 46.06,57.09
accept Mage's Wand##1952 |goto Dustwallow Marsh 46.06,57.09
|only if Mage
step
talk Tabetha##6546
|tip Inside the building.
turnin Mage's Wand##1952 |goto Dustwallow Marsh 46.06,57.09
|only if Mage
step
ding 40
step
talk Anastasia Hartwell##4568
accept Return to the Marsh##1953 |goto Undercity 85.13,9.98
|only if Mage
step
talk Tabetha##6546
|tip Inside the building.
turnin Return to the Marsh##1953 |goto Dustwallow Marsh 46.06,57.09
accept The Infernal Orb##1954 |goto Dustwallow Marsh 46.06,57.09
|only if Mage
step
kill Burning Blade Summoner##4668
|tip You may have to look around for them. |only if hardcore
|tip Watch out for patrols and respawns while in the area. |only if hardcore
collect Infernal Orb##7291 |q 1954/1 |goto Desolace 53.34,79.05
|only if Mage
step
Incoming Elite Quest
|tip During the quest "The Exorcism", you will be tasked with killing The Demon of the Orb, which is a level 40 elite enemy.
|tip It will deal a lot of a damage.
|tip If you are unable to get help, you should have your best healing potions ready.
Click Here to Continue |confirm |q 1955 |future
|only if Mage and hardcore
step
talk Tabetha##6546
|tip Inside the building.
turnin The Infernal Orb##1954 |goto Dustwallow Marsh 46.06,57.09
accept The Exorcism##1955 |goto Dustwallow Marsh 46.06,57.09
|only if Mage
step
kill Demon of the Orb##6549 |q 1955/1 |goto Dustwallow Marsh 46.04,57.10
|only if Mage
step
talk Tabetha##6546
|tip Inside the building.
turnin The Exorcism##1955 |goto Dustwallow Marsh 46.06,57.09
accept Power in Uldaman##1956 |goto Dustwallow Marsh 46.06,57.09
|only if Mage
step
Incoming Dungeon Step
|tip The next couple of steps will be taking you to the Uldaman dungeon.
|tip You will need a group to complete the dungeon as well as the quest.
|tip If you don't have a group, wait until you do before continuing.
Click Here to Continue |confirm |q 1956
|only if Mage and hardcore
step
Enter the Uldaman Dungeon with Your Group |goto Uldaman/0 0.00,0.00 < 500 |c |q 1956
|only if Mage
step
Inside the Uldaman Dungeon:
kill Obsidian Sentinel##7023
|tip Use the Uldaman Dungeon guide to accomplish this.
collect Obsidian Power Source##8053 |q 1956/1
|only if Mage
step
talk Tabetha##6546
|tip Inside the building.
turnin Power in Uldaman##1956 |goto Dustwallow Marsh 46.06,57.09
accept Mana Surges##1957 |goto Dustwallow Marsh 46.06,57.09
|only if Mage
step
kill Mana Surge##6550
|tip They will spawn continuously as you kill them.
Slay #12# Manage Surges |q 1957/1 |goto Dustwallow Marsh 45.85,56.76
|only if Mage
step
talk Tabetha##6546
|tip Inside the building.
turnin Mana Surges##1957 |goto Dustwallow Marsh 46.06,57.09
Watch the Dialogue
accept Celestial Power##1958 |goto Dustwallow Marsh 46.06,57.09
|only if Mage
step
ding 46
step
talk Anastasia Hartwell##4568
accept Tabetha's Task##2861 |goto Undercity 85.13,9.98
|only if Mage
step
talk Tabetha##6546
|tip Inside the building.
turnin Tabetha's Task##2861 |goto Dustwallow Marsh 46.06,57.09
accept Tiara of the Deep##2846 |goto Dustwallow Marsh 46.06,57.09
|only if Mage
step
Incoming Dungeon Step
|tip The next couple of steps will be taking you to the Zul'Farrak dungeon.
|tip You will need a group to complete the dungeon as well as the quest.
|tip If you don't have a group, wait until you do before continuing.
Click Here to Continue |confirm |q 2846
|only if Mage and hardcore
step
Enter the Zul'Farrak Dungeon with Your Group |goto Zul'Farrak/0 0.00,0.00 < 500 |c |q 2846
step
Inside the Zul'Farrak Dungeon:
kill Hydromancer Velratha##7795
collect Tiara of the Deep##9234 |q 2846/1
|only if Mage
step
talk Tabetha##6546
|tip Inside the building.
turnin Tiara of the Deep##2846 |goto Dustwallow Marsh 46.06,57.09
|only if Mage
step
ding 60
step
Incoming Dungeon Step
|tip The next couple of steps will be taking you to the Dire Maul (North) dungeon.
|tip You will need a group to complete the dungeon as well as the quest.
|tip If you don't have a group, wait until you do before continuing.
Click Here to Continue |confirm |q 7463 |future
|only if Mage and hardcore
step
Run up the ramp |goto Feralas/0 59.13,44.67 < 20 |only if walking
Follow the path |goto Feralas/0 59.52,39.51 < 15 |only if walking
Continue following the path |goto Feralas/0 61.72,38.78 < 15 |only if walking
Continue following the path |goto Feralas/0 61.15,34.87 < 7 |only if walking
click Door |goto Feralas/0 62.49,24.89 < 5 |walk
|tip You need a Crescent Key to unlock this door.
|tip This drops from Pusillin in the "Dire Maul - East" dungeon.
Enter the Dire Maul - North Dungeon with Your Group |goto Dire Maul/0 0.00,0.00 < 500 |c |q 7463 |future
step
Inside the Dire Maul North Dungeon:
talk Lorekeeper Lydros##14368
|tip Through the Conservatory Door in the courtyard.
accept Arcane Refreshment##7463
|only if Mage
step
Incoming Dungeon Step
|tip The next couple of steps will be taking you to the Dire Maul (East) dungeon.
|tip You will need a group to complete the dungeon as well as the quest.
|tip If you don't have a group, wait until you do before continuing.
Click Here to Continue |confirm |q 7463 |future
|only if Mage and hardcore
step
Run up the ramp |goto Feralas/0 59.13,44.67 < 20 |only if walking
Follow the path |goto Feralas/0 59.52,39.51 < 15 |only if walking
Continue following the path |goto Feralas/0 61.72,38.78 < 15 |only if walking
Continue following the path |goto Feralas/0 61.15,34.87 < 7 |only if walking
Continue following the path |goto Feralas/0 64.85,30.18 < 7 |only if walking
Enter the Dire Maul - East Dungeon with Your Group |goto Dire Maul/0 0.00,0.00 < 500 |c |q 18299 |future
step
Inside the Dire Maul East Dungeon:
kill Hydrospawn##13280
|tip Refer to the Dire Maul East Dungeon guide to accomplish this.
collect Hydrospawn Essence##18299
|only if Mage
step
Incoming Dungeon Step
|tip The next couple of steps will be taking you to the Dire Maul (North) dungeon.
|tip You will need a group to complete the dungeon as well as the quest.
|tip If you don't have a group, wait until you do before continuing.
Click Here to Continue |confirm |q 7463 |future
|only if Mage and hardcore
step
Run up the ramp |goto Feralas/0 59.13,44.67 < 20 |only if walking
Follow the path |goto Feralas/0 59.52,39.51 < 15 |only if walking
Continue following the path |goto Feralas/0 61.72,38.78 < 15 |only if walking
Continue following the path |goto Feralas/0 61.15,34.87 < 7 |only if walking
click Door |goto Feralas/0 62.49,24.89 < 5 |walk
|tip You need a Crescent Key to unlock this door.
|tip This drops from Pusillin in the "Dire Maul - East" dungeon.
Enter the Dire Maul - North Dungeon with Your Group |goto Dire Maul/0 0.00,0.00 < 500 |c |q 7463
step
Inside the Dire Maul North Dungeon:
talk Lorekeeper Lydros##14368
|tip Through the Conservatory Door in the courtyard.
turnin Arcane Refreshment##7463
|only if Mage
]])
GoatQuest:RegisterGuide("Leveling Guides\\Rogue Class Quests",{
description="This guide will walk you through completing various Rogue Class Quests.",
},[[
step
ding 20
|only if not hardcore
step
ding 24
|tip We are waiting until 24 because you will have to deal with an level 23 elite.
|tip You are able to proceed at level 21, but you will likely need help.
Click Here to Continue |confirm |q 2478 |future
|only if hardcore
step
talk Gest##3327
Train the "Pick Lock" Ability |complete knowspell(1804) |goto Orgrimmar 42.71,51.48
|only if Rogue
step
Follow the path |goto The Barrens 62.37,39.44 < 15 |only if walking
Follow the path onto the ship |goto The Barrens 64.18,45.49 < 7 |only if walking
click Buccaneer's Strongbox##123330+
|tip They look like grey metal chests.
|tip Inside the ship, on the middle level.
|tip Keep clicking them until you reach Lockpicking skill level 75.
|tip Watch for patrols and respawns around the area. |only if hardcore
Reach Level 75 in Lockpicking |skill Lockpicking,75 |goto The Barrens 65.07,45.44 |q 2480 |future
|only if Rogue
step
talk Shenthul##3401
|tip Inside the tent, inside the Cleft of Shadow.
accept The Shattered Salute##2460 |goto Orgrimmar 43.05,53.74
|only if Rogue
step
Watch the dialogue
|tip Inside the tent, inside the Cleft of Shadow.
|tip Wait for Shenthul to salute you (you will see him perform a hand movement).
Perform the Shattered Salute |q 2460/1 |goto Orgrimmar 43.05,53.74
|tip Target Shenthul and type "/salute" into your chat to perform the Salute emote.
|only if Rogue
step
talk Shenthul##3401
|tip Inside the tent, inside the Cleft of Shadow.
turnin The Shattered Salute##2460 |goto Orgrimmar 43.05,53.74
accept Deep Cover##2458 |goto Orgrimmar 43.05,53.74
|only if Rogue
step
Follow the road |goto The Barrens 52.37,27.62 < 30 |only if walking
Follow the path |goto The Barrens 54.47,10.25 < 50 |only if walking
use the Flare Gun##8051
|tip Use it while targeting Taskmaster Fizzule nearby to the north.
|tip You must use it TWICE in a row.
|tip After shooting 2 flares, perform the "/salute" emote while still targeting Taskmaster Fizzule.
Signal Taskmaster Fizzule |q 2458/1 |goto The Barrens 55.47,6.08
|only if Rogue
step
talk Taskmaster Fizzule##7233
turnin Deep Cover##2458 |goto The Barrens 55.44,5.56
accept Mission: Possible But Not Probable##2478 |goto The Barrens 55.44,5.56
|only if Rogue
step
collect Silixiz's Tower Key##8072 |q 2478/5 |goto The Barrens 54.80,5.97
|tip Use your "Pickpocket" ability on Foreman Silixiz.
|tip Watch for patrols and respawns while in the area. |only if hardcore
|only if Rogue
step
Enter the building |goto The Barrens 54.87,5.86 < 7 |walk
kill 2 Mutated Venture Co. Drone##7310 |q 2478/1 |goto The Barrens 54.71,5.73
|tip Inside the building, on the bottom floor.
|tip Watch for patrols and respawns while in the area. |only if hardcore
|only if Rogue
step
kill 2 Venture Co. Patroller##7308 |q 2478/3 |goto The Barrens 54.81,5.59
|tip Upstairs inside the building, on the lower middle floor.
|tip Watch for patrols and respawns while in the area. |only if hardcore
|only if Rogue
step
kill 2 Venture Co. Lookout##7307 |q 2478/2 |goto The Barrens 54.63,5.64
|tip Upstairs on the balcony of the building, on the upper middle floor.
|tip Watch for patrols and respawns while in the area. |only if hardcore
|only if Rogue
step
kill Grand Foreman Puzik Gallywix##7288
|tip Upstairs inside the building, on the top floor.
|tip He is elite, but you should be able to kill him. |only if not hardcore
|tip If you have trouble, try to find someone to help you. |only if not hardcore
|tip This enemy is elite. |only if hardcore
|tip You will likely need help with this if you aren't overleveled. |only if hardcore
|tip Only one head per kill will drop.
|tip He will allegedly spawn every 8 to 10 minutes.
collect Cache of Zanzil's Altered Mixture##8073 |q 2478/6 |goto The Barrens 54.75,5.59
collect Gallywix's Head##8074 |q 2478/4 |goto The Barrens 54.75,5.59
|only if Rogue
step
click Gallywix's Lockbox##129127
|tip Upstairs inside the building, on the top floor.
|tip You will get a debuff after opening it.
Receive the Touch of Zanzil |havebuff Touch of Zanzil##9991 |goto The Barrens 54.75,5.55 |q 2478
|only if Rogue
step
Follow the path |goto The Barrens 54.71,9.86 < 50 |only if walking
Follow the road |goto The Barrens 52.13,18.67 < 30 |only if walking
talk Shenthul##3401
|tip Inside the tent, inside the Cleft of Shadow.
turnin Mission: Possible But Not Probable##2478 |goto Orgrimmar 43.05,53.74
accept Hinott's Assistance##2479 |goto Orgrimmar 43.05,53.74
|only if Rogue
step
_Note for Rogues:_
|tip Now we need to travel to Tarren Mill in Hillsbrad Foothills.
|tip That's where you will complete your class quest.
|tip It's a long run, but it will improve your leveling by allowing you to learn to make Poisons.
Click Here to Continue |confirm |q 2480 |future
|only if Rogue
step
Enter Undercity |goto Tirisfal Glades 61.86,65.03 < 15 |only if walking
talk Michael Garrett##4551
fpath Undercity |goto Undercity 63.28,48.58
|only if Rogue
step
Leave Undercity |goto Undercity 66.19,0.63 < 10 |walk
Follow the road |goto Tirisfal Glades 56.17,65.88 < 30|only if walking
Continue following the road |goto Silverpine Forest 58.14,12.21 < 30 |only if walking
Cross the bridge |goto Silverpine Forest 49.75,28.82 < 15 |only if walking
Follow the road |goto Silverpine Forest 48.71,38.60 < 30 |only if walking
talk Karos Razok##2226
fpath The Sepulcher |goto Silverpine Forest 45.62,42.59
|only if Rogue
step
Follow the road |goto Silverpine Forest 46.48,41.31 < 20 |only if walking
Continue following the road |goto Silverpine Forest 52.85,43.92 < 30 |only if walking
Continue following the road |goto Silverpine Forest 53.88,73.53 < 30 |only if walking
Enter Hillsbrad Foothills |goto Silverpine Forest 66.87,80.22 < 30 |only if walking
Follow the road |goto Hillsbrad Foothills 57.51,36.04 < 30 |only if walking
talk Zarise##2389
fpath Tarren Mill |goto Hillsbrad Foothills 60.14,18.62
|only if Rogue
step
Enter the building |goto Hillsbrad Foothills 61.50,19.43 < 7 |walk
talk Serge Hinott##2391
|tip Inside the building.
turnin Hinott's Assistance##2479 |goto Hillsbrad Foothills 61.63,19.19
accept Hinott's Assistance##2480 |goto Hillsbrad Foothills 61.63,19.19
|only if Rogue
step
Watch the dialogue
|tip Inside the building.
Complete the Cure |q 2480/1 |goto Hillsbrad Foothills 61.49,18.95
|only if Rogue
step
talk Serge Hinott##2391
|tip Inside the building.
turnin Hinott's Assistance##2480 |goto Hillsbrad Foothills 61.58,18.97
|only if Rogue
step
use Hinott's Oil##8095
Remove the Touch of Zanzil |nobuff Touch of Zanzil##9991
|only if Rogue
step
ding 50
|only if not hardcore
step
ding 52
|only if hardcore
step
talk Ormok##3328
accept A Simple Request##8233 |goto Orgrimmar 43.91,54.62
|only if Rogue
step
Follow the road up |goto Hillsbrad Foothills 75.51,23.52 < 10 |only if walking
Enter the cave |goto Hillsbrad Foothills 77.82,19.27 < 10 |walk
Follow the path |goto Alterac Mountains 81.71,77.48 < 10 |only if walking
Enter the building |goto Alterac Mountains 85.46,79.39 < 10 |walk
talk Lord Jorach Ravenholdt##6768
turnin A Simple Request##8233 |goto Alterac Mountains 86.03,78.88
accept Sealed Azure Bag##8234 |goto Alterac Mountains 86.03,78.88
|only if Rogue
step
kill Timbermaw Shaman##6188
collect Sealed Azure Bag##19775 |q 8234/1 |goto Azshara 43.77,25.56
You can find more around:
[41.49,19.55]
|only if Rogue
step
talk Sanath Lim-yo##8395
accept Meeting with the Master##3503 |goto Azshara 28.11,50.09
|only if Rogue
step
Follow the path up |goto Azshara 26.48,44.23 < 15 |only if walking
talk Archmage Xylem##8379
|tip Inside the tower.
turnin Sealed Azure Bag##8234 |goto Azshara 29.71,40.52
accept Encoded Fragments##8235 |goto Azshara 29.71,40.52
|only if Rogue
step
Follow the path down |goto Azshara 27.04,43.31 < 15 |only if walking
talk Nyrill##8399
accept Return Trip##3421 |goto Azshara 36.13,67.82
|only if Rogue
step
kill Forest Ooze##8766
collect 10 Encoded Fragment##20023 |q 8235/1 |goto Azshara 73.40,25.20
You can find more around
[80.13,24.75]
[72.71,23.53]
[74.59,13.08]
[66.10,22.93]
|only if Rogue
step
talk Sanath Lim-yo##8395
accept Meeting with the Master##3503 |goto Azshara 28.11,50.09
|only if Rogue
step
Follow the path up |goto Azshara 26.48,44.23 < 15 |only if walking
talk Archmage Xylem##8379
|tip Inside the tower.
turnin Encoded Fragments##8235 |goto Azshara 29.71,40.52
accept The Azure Key##8236 |goto Azshara 29.71,40.52
|only if Rogue
step
Incoming Dungeon Step
|tip The next couple of steps will be taking you to the Sunken Temple dungeon.
|tip You will need a group to complete the dungeon as well as the quest.
|tip If you don't have a group, wait until you do before continuing.
Click Here to Continue |confirm |q 8425
|only if Rogue and hardcore
step
Run up the stairs |goto Swamp of Sorrows/0 69.36,56.89 < 7 |walk
Enter the building and swim under the water |goto Swamp of Sorrows/0 70.54,49.78 < 7 |walk
Run down the stairs |goto Swamp of Sorrows/0 72.69,42.22 < 7 |walk
Follow the path |goto Swamp of Sorrows/0 75.69,45.78 < 7 |walk
Follow the path |goto Swamp of Sorrows/0 78.62,47.47 < 7 |walk
Follow the path |goto Swamp of Sorrows/0 80.22,49.62 < 7 |walk
Follow the path |goto Swamp of Sorrows/0 81.33,42.38 < 7 |walk
Run down the stairs |goto Swamp of Sorrows/0 78.86,40.74 < 7 |walk
Run down the ramp |goto Swamp of Sorrows/0 76.85,38.82 < 7 |walk
Enter The Temple of Atal'Hakkar Dungeon with Your Group |goto The Temple of Atal'Hakkar/0 0.00,0.00 < 500 |c |q 8236 |future
|only if Rogue
step
Inside the Temple of Atal'Hakkar:
kill Morphaz##5719
|tip Refer to the Temple of Atal'Hakkar Dungeon guide to accomplish this.
collect Azure Key##20022 |q 8236/1
|only if Rogue
step
Follow the road up |goto Hillsbrad Foothills 75.51,23.52 < 10 |only if walking
Enter the cave |goto Hillsbrad Foothills 77.82,19.27 < 10 |walk
Follow the path |goto Alterac Mountains 81.71,77.48 < 10 |only if walking
Enter the building |goto Alterac Mountains 85.46,79.39 < 10 |walk
talk Lord Jorach Ravenholdt##6768
turnin The Azure Key##8236|goto Alterac Mountains 86.03,78.88
|only if Rogue
]])
GoatQuest:RegisterGuide("Leveling Guides\\Shaman Class Quests",{
description="This guide will walk you through completing various Shaman Class Quests.",
},[[
step
ding 4
step
talk Seer Ravenfeather##5888
accept Call of Earth##1519 |goto Mulgore 44.73,76.18
|only if Tauren Shaman
step
kill Bristleback Shaman##2953+
|tip They can be pretty spread out around this area.
collect 2 Ritual Salve##6634 |q 1519/1 |goto Mulgore 63.87,80.34
You can find more around [59.92,75.65]
|only if Tauren Shaman
step
talk Seer Ravenfeather##5888
turnin Call of Earth##1519 |goto Mulgore 44.73,76.19
accept Call of Earth##1520 |goto Mulgore 44.73,76.19
|only if Tauren Shaman
step
use the Earth Sapta##6635
talk the Minor Manifestation of Earth##5891
turnin Call of Earth##1520 |goto Mulgore 53.88,80.56
accept Call of Earth##1521 |goto Mulgore 53.88,80.56
|only if Tauren Shaman
step
talk Seer Ravenfeather##5888
turnin Call of Earth##1521 |goto Mulgore 44.73,76.19
|only if Tauren Shaman
step
talk Canaga Earthcaller##5887
accept Call of Earth##1516 |goto Durotar 42.41,69.17
|only if (Orc Shaman) or (Troll Shaman)
step
kill Felstalker##3102+
|tip Inside the cave.
collect 2 Felstalker Hoof##6640 |q 1516/1 |goto Durotar 44.82,54.59
|only if (Orc Shaman) or (Troll Shaman)
step
talk Canaga Earthcaller##5887
turnin Call of Earth##1516 |goto Durotar 42.41,69.17
accept Call of Earth##1517 |goto Durotar 42.41,69.17
|only if (Orc Shaman) or (Troll Shaman)
step
Follow the path |goto Durotar 43.57,69.85 < 20 |only if walking
Follow the path up |goto Durotar 41.56,73.28 < 15 |only if walking
Continue up the path |goto Durotar 40.74,74.35 < 10 |only if walking
Follow the path |goto Durotar 42.49,74.89 < 10 |only if walking
use the Earth Sapta##6635
talk Minor Manifestation of Earth##5891
turnin Call of Earth##1517 |goto Durotar 44.03,76.20
accept Call of Earth##1518 |goto Durotar 44.03,76.20
|only if (Orc Shaman) or (Troll Shaman)
step
Jump down here |goto Durotar 43.73,74.92 < 10 |only if walking
Follow the path |goto Durotar 43.49,69.67 < 30 |only if walking
talk Canaga Earthcaller##5887
turnin Call of Earth##1518 |goto Durotar 42.41,69.17
|only if (Orc Shaman) or (Troll Shaman)
step
ding 10
|only if not hardcore
step
ding 12
|only if hardcore
step
Enter the building |goto Durotar 53.25,42.59 < 7 |walk
talk Swart##3173
|tip Inside the building.
accept Call of Fire##2983 |goto Durotar 54.42,42.58
|only if (Orc Shaman) or (Troll Shaman)
step
talk Narm Skychaser##3066
|tip Inside the building.
accept Call of Fire##2984 |goto Mulgore 48.39,59.16
|only if Tauren Shaman
step
Leave the building |goto Durotar 53.27,42.59 < 7 |walk |only if Orc or Troll
Follow the road |goto Durotar 50.64,43.97 < 15 |only if walking |only if Orc or Troll
Cross the bridge |goto Durotar 34.60,42.31 < 15 |only if walking |only if Orc or Troll
talk Kranal Fiss##5907
turnin Call of Fire##2983 |goto The Barrens 56.03,19.89 |only if Orc or Troll
turnin Call of Fire##2984 |goto The Barrens 56.03,19.89 |only if Tauren
accept Call of Fire##1524 |goto The Barrens 56.03,19.89
|only if Shaman
step
Cross the bridge |goto The Barrens 62.67,19.22 < 15 |only if walking
Follow the path up |goto Durotar 36.59,57.07 < 10 |only if walking
Continue up the path |goto Durotar 36.61,58.19 < 5 |only if walking
Continue up the path |goto Durotar 37.74,58.24 < 5 |only if walking
Continue up the path |goto Durotar 38.94,57.56 < 5 |only if walking
Follow the path |goto Durotar 39.18,58.63 < 5 |only if walking
talk Telf Joolam##5900
|tip On top of the mountain.
turnin Call of Fire##1524 |goto Durotar 38.55,58.96
accept Call of Fire##1525 |goto Durotar 38.55,58.96
|only if Shaman
step
Follow the path down |goto Durotar 39.21,58.52 < 7 |only if walking
Follow the path |goto The Barrens 61.47,20.86 < 40 |only if walking
Kill Razormane enemies around this area
|tip Watch for patrols and respawns while in the area. |only if hardcore
collect Fire Tar##5026 |q 1525/1 |goto The Barrens 54.15,25.01
|only if Shaman
step
Cross the bridge |goto The Barrens 62.67,19.23 < 15 |only if walking
Follow the path |goto Durotar 50.78,43.81 < 15 |only if walking
Continue following the path |goto Durotar 54.15,40.72 < 15 |only if walking
Enter the cave |goto Durotar 52.82,28.82 < 10 |walk
Follow the path |goto Durotar 53.07,27.09 < 10 |walk
kill Burning Blade Cultist##3199+
|tip Inside the cave.
|tip They seem to mostly be towards the back of the cave.
|tip Watch for patrols and respawns while in the area. |only if hardcore
collect Reagent Pouch##6652 |q 1525/2 |goto Durotar 52.12,24.95
|only if Shaman
step
Follow the path |goto Durotar 53.13,27.27 < 10 |walk
Leave the cave |goto Durotar 52.83,28.93 < 10 |walk
Jump down onto the huge long rock |goto Durotar 51.97,31.29 < 15 |only if walking
Follow the path up |goto Durotar 36.59,57.07 < 10 |only if walking
Continue up the path |goto Durotar 36.61,58.19 < 5 |only if walking
Continue up the path |goto Durotar 37.74,58.24 < 5 |only if walking
Continue up the path |goto Durotar 38.94,57.56 < 5 |only if walking
Follow the path |goto Durotar 39.18,58.63 < 5 |only if walking
talk Telf Joolam##5900
|tip On top of the mountain.
turnin Call of Fire##1525 |goto Durotar 38.55,58.96
accept Call of Fire##1526 |goto Durotar 38.55,58.96
|only if Shaman
step
Follow the path up |goto Durotar 38.34,58.52 < 5 |only if walking
use the Fire Sapta##6636
kill Minor Manifestation of Fire##5893
|tip On top of the mountain.
|tip It will be immune to fire damage. |only if hardcore
collect Glowing Ember##6655 |q 1526/1 |goto Durotar 38.84,58.24
|only if Shaman
step
click Brazier of the Dormant Flame##61934
|tip On top of the mountain.
turnin Call of Fire##1526 |goto Durotar 38.95,58.22
accept Call of Fire##1527 |goto Durotar 38.95,58.22
|only if Shaman
step
Follow the path down |goto Durotar 39.19,57.81 < 5 |only if walking
talk Kranal Fiss##5907
turnin Call of Fire##1527 |goto The Barrens 56.04,19.89
|only if Shaman
step
ding 20
step
Enter the building |goto Orgrimmar 40.21,36.95 < 15 |walk
talk Searn Firewarder##5892
|tip Inside the building.
|tip We run back to Crossroads first, instead of hearthing.
|tip We are saving your hearthstone to use in Hillsbrad Foothills, to return to Crossroads quickly.
accept Call of Water##1528 |goto Orgrimmar 37.96,37.74
|only if Shaman
step
talk Islen Waterseer##5901
turnin Call of Water##1528 |goto The Barrens 65.83,43.78
accept Call of Water##1530 |goto The Barrens 65.83,43.78
|only if Shaman
step
Follow the road |goto The Barrens 46.12,67.29 < 30 |only if walking
Follow the path up |goto The Barrens 44.28,77.29 < 15 |only if walking
talk Brine##5899
turnin Call of Water##1530 |goto The Barrens 43.42,77.41
accept Call of Water##1535 |goto The Barrens 43.42,77.41
|only if Shaman
step
use the Empty Brown Waterskin##7766
collect Filled Brown Waterskin##7769 |q 1535/1 |goto The Barrens/0 44.19,76.90
|only if Shaman
step
Follow the path up |goto The Barrens/0 44.28,77.29 < 15 |only if walking
talk Brine##5899
turnin Call of Water##1535 |goto The Barrens/0 43.42,77.41
accept Call of Water##1536 |goto The Barrens/0 43.42,77.41
|only if Shaman
step
use the Empty Red Waterskin##7768
collect Filled Red Waterskin##7771 |q 1536/1 |goto Hillsbrad Foothills 62.15,20.75
|only if Shaman
step
Follow the road |goto The Barrens 46.12,67.29 < 30 |only if walking
Follow the path up |goto The Barrens 44.28,77.29 < 15 |only if walking
talk Brine##5899
turnin Call of Water##1536 |goto The Barrens 43.42,77.41
accept Call of Water##1534 |goto The Barrens 43.42,77.41
|only if Shaman
step
Follow the path |goto The Barrens 38.83,58.05 < 30 |only if walking
use the Empty Blue Waterskin##7767
collect Filled Blue Waterskin##7770 |q 1534/1 |goto Ashenvale 33.55,67.44
|only if Shaman
step
Follow the road |goto The Barrens 46.12,67.29 < 30 |only if walking
Follow the path up |goto The Barrens 44.28,77.29 < 15 |only if walking
talk Brine##5899
turnin Call of Water##1534 |goto The Barrens 43.42,77.41
accept Call of Water##220 |goto The Barrens 43.42,77.41
|only if Shaman
step
Follow the road |goto The Barrens 46.85,65.69 < 30 |only if walking
talk Islen Waterseer##5901
turnin Call of Water##220 |goto The Barrens 65.83,43.78
accept Call of Water##63 |goto The Barrens 65.83,43.78
|only if Shaman
step
Jump up onto the tree |goto Silverpine Forest/0 42.02,40.67 < 5
Jump down carefully |goto Silverpine Forest/0 39.70,40.98 < 10
Follow the path |goto Silverpine Forest/0 39.09,43.05 < 10
use the Water Sapta##6637
kill Corrupt Water Manifestation##5894
collect Corrupt Manifestation's Bracers##7812 |q 63/1 |goto Silverpine Forest/0 38.84,44.25
|only if Shaman
step
click Brazier of Everfount
turnin Call of Water##63 |goto Silverpine Forest 38.28,44.56
accept Call of Water##100 |goto Silverpine Forest 38.28,44.56
|only if Shaman
step
Watch the dialogue
talk Minor Manifestation of Water##5895
turnin Call of Water##100 |goto Silverpine Forest 38.75,44.62
accept Call of Water##96 |goto Silverpine Forest 38.75,44.62
|only if Shaman
step
talk Islen Waterseer##5901
turnin Call of Water##96 |goto The Barrens 65.83,43.78
|only if Shaman
step
ding 30
step
Enter the building |goto Orgrimmar 40.25,36.98 < 10 |walk
talk Searn Firewarder##5892
|tip Inside the building.
accept Call of Air##1531 |goto Orgrimmar 37.97,37.73
|only if Shaman
step
Follow the path up |goto Thousand Needles 54.68,44.78 < 15 |only if walking
talk Prate Cloudseer##5905
turnin Call of Air##1531 |goto Thousand Needles 53.54,42.65
|only if Shaman
step
ding 52
step
collect 1 Elemental Air##7069
|tip Refer to the "Elemental Air" farming guide to accomplish this.
|tip You can also purchase them from the Auction House. |only if not selfmade()
|only if Shaman
step
collect 1 Elemental Fire##7068
|tip Refer to the "Elemental Fire" farming guide to accomplish this.
|tip You can also purchase them from the Auction House. |only if not selfmade()
|only if Shaman
step
collect 1 Elemental Earth##7067
|tip Refer to the "Elemental Earth" farming guide to accomplish this.
|tip You can also purchase them from the Auction House. |only if not selfmade()
|only if Shaman
step
collect 1 Elemental Water##7070
|tip Refer to the "Elemental Water" farming guide to accomplish this.
|tip You can also purchase them from the Auction House. |only if not selfmade()
|only if Shaman
step
talk Beram Skychaser##3032
|tip Inside the building.
accept Elemental Mastery##8410 |goto Thunder Bluff 22.80,19.40
|only if Shaman
step
talk Bath'rah the Windwatcher##6176
turnin Elemental Mastery##8410 |goto Alterac Mountains 80.50,66.92
accept Spirit Totem##8412 |goto Alterac Mountains 80.50,66.92
|only if Shaman
stickystart "Thick_Black_Claw"
step
Kill enemies around this area
collect 8 Bloodshot Spider Eye##20610 |q 8412/1 |goto Western Plaguelands 33.60,60.40
You can find more around here [58.40,53.60]
|only if Shaman
step
label "Thick_Black_Claw"
Kill enemies around this area
collect 8 Thick Black Claw##20611 |q 8412/2 |goto Western Plaguelands 33.60,60.40
You can find more around here [58.40,53.60]
|only if Shaman
step
talk Bath'rah the Windwatcher##6176
turnin Spirit Totem##8412 |goto Alterac Mountains 80.50,66.92
accept Da Voodoo##8413 |goto Alterac Mountains 80.50,66.92
|only if Shaman
step
Incoming Dungeon Step
|tip The next couple of steps will be taking you to the Sunken Temple dungeon.
|tip You will need a group to complete the dungeon as well as the quest.
|tip If you don't have a group, wait until you do before continuing.
Click Here to Continue |confirm |q 8425
|only if Shaman and hardcore
step
Run up the stairs |goto Swamp of Sorrows/0 69.36,56.89 < 7 |walk
Enter the building and swim under the water |goto Swamp of Sorrows/0 70.54,49.78 < 7 |walk
Run down the stairs |goto Swamp of Sorrows/0 72.69,42.22 < 7 |walk
Follow the path |goto Swamp of Sorrows/0 75.69,45.78 < 7 |walk
Follow the path |goto Swamp of Sorrows/0 78.62,47.47 < 7 |walk
Follow the path |goto Swamp of Sorrows/0 80.22,49.62 < 7 |walk
Follow the path |goto Swamp of Sorrows/0 81.33,42.38 < 7 |walk
Run down the stairs |goto Swamp of Sorrows/0 78.86,40.74 < 7 |walk
Run down the ramp |goto Swamp of Sorrows/0 76.85,38.82 < 7 |walk
Enter The Temple of Atal'Hakkar Dungeon with Your Group |goto The Temple of Atal'Hakkar/0 0.00,0.00 < 500 |c |q 8413 |future
|only if Shaman
stickystart "Blue_Voodoo_Feathers"
stickystart "Green_Voodoo_Feathers"
step
Inside the Temple of Atal'Hakkar:
collect 2 Amber Voodoo Feather##20606 |q 8413/1
|tip These come from Gasher and Zul'Lor.
|only if Shaman
step
label "Blue_Voodoo_Feathers"
Inside the Temple of Atal'Hakkar:
collect 2 Blue Voodoo Feather##20607 |q 8413/2
|tip These come from Mijan and Hukku.
|only if Shaman
step
label "Green_Voodoo_Feathers"
Inside the Temple of Atal'Hakkar:
collect 2 Green Voodoo Feather##20608 |q 8413/3
|tip These come from Zolo and Loro.
|only if Shaman
step
talk Bath'rah the Windwatcher##6176
turnin Da Voodoo##8413 |goto Alterac Mountains 80.50,66.92
|only if Shaman
]])
GoatQuest:RegisterGuide("Leveling Guides\\Warlock Class Quests",{
description="This guide will walk you through completing various Warlock Class Quests.",
},[[
step
talk Ruzan##5765
accept Vile Familiars##1485 |goto Durotar 42.59,69.00
|only if Orc Warlock
step
kill Vile Familiar##3101+
|tip Inside and outside the cave.
collect 6 Vile Familiar Head##6487 |q 1485/1 |goto Durotar 45.34,56.36
|only if Orc Warlock
step
talk Ruzan##5765
turnin Vile Familiars##1485 |goto Durotar 42.59,69.00
accept Vile Familiars##1499 |goto Durotar 42.59,69.00
|only if Orc Warlock
step
talk Zureetha Fargaze##3145
turnin Vile Familiars##1499 |goto Durotar 42.85,69.15
|only if Orc Warlock
step
talk Venya Marthand##5667
|tip Inside the building.
accept Piercing the Veil##1470 |goto Tirisfal Glades 30.98,66.41
|only if Scourge Warlock
step
kill Rattlecage Skeleton##1890+
collect 3 Rattlecage Skull##6281 |q 1470/1 |goto Tirisfal Glades 32.73,60.10
|only if Scourge Warlock
step
talk Venya Marthand##5667
|tip Inside the building.
turnin Piercing the Veil##1470 |goto Tirisfal Glades 30.98,66.41
|only if Scourge Warlock
step
ding 10
step
Enter the building |goto Tirisfal Glades 61.56,53.04 < 7 |walk
talk Ageron Kargal##5724
|tip Upstairs inside the building.
accept Halgar's Summons##1478 |goto Tirisfal Glades 61.62,52.67
|only if Scourge Warlock
step
Leave the building |goto Tirisfal Glades 61.56,53.06 < 7 |walk
Enter Undercity |goto Tirisfal Glades 61.88,65.06 < 10 |only if walking
talk Carendin Halgar##5675
turnin Halgar's Summons##1478 |goto Undercity 85.04,26.01
accept Creature of the Void##1473 |goto Undercity 85.04,26.01
|only if Scourge Warlock
step
Leave Undercity |goto Undercity 66.23,0.23 < 10 |walk
Enter the building |goto Tirisfal Glades 51.44,67.70 < 7 |walk
click Perrine's Chest
|tip Inside the building.
collect Egalin's Grimoire##6285 |q 1473/1 |goto Tirisfal Glades 51.06,67.57
|only if Scourge Warlock
step
Leave the building |goto Tirisfal Glades 51.44,67.69 < 7 |walk
Enter Undercity |goto Tirisfal Glades 61.88,65.06 < 10 |only if walking
talk Carendin Halgar##5675
turnin Creature of the Void##1473 |goto Undercity 85.04,26.01
accept The Binding##1471 |goto Undercity 85.04,26.01
|only if Scourge Warlock
step
use the Runes of Summoning##6284
|tip Use them on the pink symbol on the ground.
kill Summoned Voidwalker##5676 |q 1471/1 |goto Undercity 86.62,27.10
|tip Don't forget to summon your imp. |only if hardcore
|only if Scourge Warlock
step
talk Carendin Halgar##5675
turnin The Binding##1471 |goto Undercity 85.04,26.01
|only if Scourge Warlock
step
talk Ophek##3294
|tip Outside, behind the building.
accept Gan'rul's Summons##1506 |goto Durotar 54.37,41.29
|only if Orc Warlock
step
Follow the road |goto Durotar 52.37,40.01 < 30 |only if walking
Enter Orgrimmar |goto Durotar 45.54,12.06 < 20 |only if walking
Follow the path |goto Orgrimmar 51.55,58.13 < 20 |only if walking
Follow the path down |goto Orgrimmar 55.96,41.03 < 15 |walk
talk Gan'rul Bloodeye##5875
|tip Inside the tent.
turnin Gan'rul's Summons##1506 |goto Orgrimmar 48.24,45.29
accept Creature of the Void##1501 |goto Orgrimmar 48.24,45.29
|only if Orc Warlock
step
Follow the path up |goto Orgrimmar 43.93,56.80 < 10 |walk
Follow the path |goto Orgrimmar 38.49,54.16 < 10 |walk
Follow the path |goto Orgrimmar 52.50,85.13 < 20 |only if walking
Leave Orgrimmar |goto Orgrimmar 49.10,94.75 < 20 |only if walking
Enter the cave |goto Durotar 55.02,9.79 < 10 |walk
Follow the path |goto Durotar 53.80,8.83 < 10 |walk
Continue following the path |goto Durotar 52.75,7.87 < 10 |walk
Continue following the path |goto Durotar 51.68,8.23 < 10 |walk
click Burning Blade Stash##58595
|tip Inside the cave.
collect Tablet of Verga##6535 |q 1501/1 |goto Durotar 51.62,9.74
|only if Orc Warlock
step
Follow the path |goto Durotar 51.73,8.10 < 10 |walk
Continue following the path |goto Durotar 52.49,8.31 < 10 |walk
Continue following the path |goto Durotar 54.20,8.92 < 10 |walk
Leave the cave |goto Durotar 55.03,9.87 < 10 |walk
Enter Orgrimmar |goto Durotar 45.54,12.06 < 20 |only if walking
Follow the path |goto Orgrimmar 51.55,58.13 < 20 |only if walking
Follow the path down |goto Orgrimmar 55.96,41.03 < 10 |walk
talk Gan'rul Bloodeye##5875
|tip Inside the tent.
turnin Creature of the Void##1501 |goto Orgrimmar 48.24,45.29
accept The Binding##1504 |goto Orgrimmar 48.24,45.29
|only if Orc Warlock
step
use Glyphs of Summoning##7464
|tip Use it while standing on the pink symbol on the ground.
|tip Inside the tent.
kill Summoned Voidwalker##5676 |q 1504/1 |goto Orgrimmar 49.44,50.02
|only if Orc Warlock
step
talk Gan'rul Bloodeye##5875
|tip Inside the tent.
turnin The Binding##1504 |goto Orgrimmar 48.24,45.29
|only if Orc Warlock
step
ding 20
step
talk Gan'rul Bloodeye##5875
|tip Inside the tent, inside the Cleft of Shadow.
accept Devourer of Souls##1507 |goto Orgrimmar 48.25,45.29
|only if Warlock
step
talk Cazul##5909
turnin Devourer of Souls##1507 |goto Orgrimmar 47.06,46.48
accept Blind Cazul##1508 |goto Orgrimmar 47.06,46.48
|only if Warlock
step
Follow the path up |goto Orgrimmar 43.93,56.92 < 15 |walk
Follow the path |goto Orgrimmar 38.40,54.26 < 20 |only if walking
Enter the building |goto Orgrimmar 38.07,60.65 < 15 |walk
talk Zankaja##5910
|tip Inside the building.
turnin Blind Cazul##1508 |goto Orgrimmar 37.03,59.45
accept News of Dogran##1509 |goto Orgrimmar 37.03,59.45
|only if Warlock
step
talk Gazrog##3464
turnin News of Dogran##1509 |goto The Barrens 51.93,30.32
accept News of Dogran##1510 |goto The Barrens 51.93,30.32
|only if Warlock
step
Follow the road |goto The Barrens 50.82,29.07 < 20 |only if walking
Follow the road |goto The Barrens 39.39,29.65 < 30 |only if walking
Follow the path up |goto Stonetalon Mountains 82.07,98.57 < 15 |only if walking
Follow the path |goto Stonetalon Mountains 77.19,98.73 < 15 |only if walking
Jump down here |goto Stonetalon Mountains 75.01,97.08 < 15 |only if walking
talk Ken'zigla##4197
turnin News of Dogran##1510 |goto Stonetalon Mountains 73.25,95.12
accept Ken'zigla's Draught##1511 |goto Stonetalon Mountains 73.25,95.12
|only if Warlock
step
Follow the path up |goto Stonetalon Mountains 72.89,93.73 < 15 |only if walking
Follow the path |goto Stonetalon Mountains 77.33,98.72 < 15 |only if walking
Follow the road |goto The Barrens 35.84,27.53 < 30 |only if walking
Continue following the road |goto The Barrens 39.43,29.70 < 30 |only if walking
Follow the path |goto The Barrens 50.83,29.09 < 20 |only if walking
talk Grunt Logmar##5911
turnin Ken'zigla's Draught##1511 |goto The Barrens 44.62,59.27
accept Dogran's Captivity##1515 |goto The Barrens 44.62,59.27
|only if Warlock
step
talk Grunt Dogran##5908
|tip Inside the hut.
turnin Dogran's Captivity##1515 |goto The Barrens 43.31,47.89
accept Love's Gift##1512 |goto The Barrens 43.31,47.89
|only if Warlock
step
Follow the path down |goto Orgrimmar 39.74,53.78 < 20 |walk
talk Gan'rul Bloodeye##5875
|tip Inside the tent.
turnin Love's Gift##1512 |goto Orgrimmar 48.25,45.29
accept The Binding##1513 |goto Orgrimmar 48.25,45.29
|only if Warlock
step
use Dogran's Pendant##6626
|tip Use it while standing on the pink symbol on the ground.
|tip Inside the tent.
kill Summoned Succubus##5677 |q 1513/1 |goto Orgrimmar 49.45,50.03
|only if Warlock
step
talk Gan'rul Bloodeye##5875
|tip Inside the tent.
turnin The Binding##1513 |goto Orgrimmar 48.24,45.29
|only if Warlock
step
ding 30
step
talk Gan'rul Bloodeye##5875
|tip Inside the building.
accept Seeking Strahad##2996 |goto Orgrimmar 48.24,45.30
|only if Warlock
step
Follow the path up |goto The Barrens 61.93,36.72 < 15
talk Strahad Farsan##6251
turnin Seeking Strahad##2996 |goto The Barrens 62.63,35.50
accept Tome of the Cabal##1801 |goto The Barrens 62.63,35.50
|only if Warlock
step
talk Jorah Annison##6293
turnin Tome of the Cabal##1758 |goto Undercity 75.91,37.87
accept Tome of the Cabal##1803 |goto Undercity 75.91,37.87
|only if Warlock
step
Follow the path down |goto Hillsbrad Foothills 36.94,65.37 < 30 |only if walking
click Tome of the Cabal##92013
|tip It looks like a blue book on the ground next to some crates.
collect Moldy Tome##6931 |q 1803/1 |goto Hillsbrad Foothills 27.78,72.78
|only if Warlock
step
Enter the cave |goto Thousand Needles 44.09,37.29 < 10 |walk
click Damaged Chest##92423
collect Tattered Manuscript##6997 |q 1803/2 |goto Thousand Needles 43.43,32.69
|only if Warlock
step
talk Jorah Annison##6293
turnin Tome of the Cabal##1803 |goto Undercity 75.91,37.87
accept Tome of the Cabal##1805 |goto Undercity 75.91,37.87
|only if Warlock
step
Follow the path up |goto Wetlands 42.83,41.04
Kill Dragonmaw enemies around this area
collect 3 Rod of Channeling##6930 |q 1805/1 |goto Wetlands 45.09,43.08
|tip They drop from Dragonmaw Bonewarders and Shadowwarders.
You can find more around here [49.48,48.47]
|only if Warlock
step
Follow the path up |goto The Barrens 61.93,36.72 < 15
talk Strahad Farsan##6251
turnin Tome of the Cabal##1805 |goto The Barrens 62.63,35.50
accept The Binding##1471 |goto The Barrens 62.63,35.50
|only if Warlock
step
use the Tome of the Cabal##6999
|tip Use it inside the building.
kill Summoned Felhunter##6268 |q 1471/1 |goto The Barrens 62.60,35.28
|only if Warlock
step
talk Strahad Farsan##6251
turnin The Binding##1471 |goto The Barrens 62.63,35.50
|only if Warlock
step
ding 40
step
talk Zevrost##3326
|tip Inside the building.
accept Summon Felsteed##3631 |goto Orgrimmar 48.48,45.44
|only if Warlock
step
Follow the path up |goto The Barrens 61.93,36.72 < 15
talk Strahad Farsan##6251
turnin Summon Felsteed##3631 |goto The Barrens 62.63,35.50
accept Summon Felsteed##4490 |goto The Barrens 62.63,35.50
|only if Warlock
step
talk Strahad Farsan##6251
turnin Summon Felsteed##4490 |goto The Barrens 62.63,35.50
|only if Warlock
step
ding 53
|only if not hardcore
step
ding 55
|only if hardcore
step
collect 1 Fel Cloth##14256 |q 8420 |future
|tip Search the guide menu for the item(s) to use the farming guides.
|tip You can also purchase them from the Auction House. |only if not selfmade()
|only if Warlock
step
talk Niby the Almighty##14469
accept What Niby Commands##7601 |goto Felwood 41.38,44.86
|only if Warlock
step
talk Impsy##14470
turnin What Niby Commands##7601 |goto Felwood 41.36,45.02
accept Flawless Fel Essence##7602 |goto Felwood 41.36,45.02
accept Hot and Itchy##8420 |goto Felwood 41.36,45.02
'|accept The Wrong Stuff##8421 |or
|only if Warlock
step
talk Impsy##14470
turnin Hot and Itchy##8420 |goto Felwood 41.36,45.02 |only if haveq(8420) or completedq(8420)
accept The Wrong Stuff##8421 |goto Felwood 41.36,45.02
|only if Warlock
step
kill Tainted Ooze##7092+
collect 4 Bloodvenom Essence##20614 |q 8421/2 |goto Felwood 40.92,46.83
You can find more around here [41.93,49.75]
|only if Warlock
step
Kill enemies around this area
collect 10 Rotting Wood##20613 |q 8421/1 |goto Felwood 46.89,24.16
You can find more around here [52.81,21.50]
|only if Warlock
step
talk Impsy##14470
turnin The Wrong Stuff##8421 |goto Felwood 41.36,45.02
accept Trolls of a Feather##8422 |goto Felwood 41.36,45.02
|only if Warlock
step
Enter the building |goto Felwood 35.39,58.54 < 8 |walk
kill Jaedenar Legionnaire##9862
|tip They are found throughout the Shadow Hold.
|tip Watch for patrols and respawns while in the area.	|only if hardcore
collect Flawless Fel Essence (Jaedenar)##18622 |q 7602/2 |goto Felwood 36.25,55.94
|only if Warlock
step
Kill Legashi enemies around this area
collect Flawless Fel Essence (Azshara)##18624 |q 7602/1 |goto Azshara 52.03,18.65
You can find more around here
[61.22,24.87]
[66.09,16.86]
|only if Warlock
step
kill Felguard Sentry##6011
collect Flawless Fel Essence (Dark Portal)##18623 |q 7602/3 |goto Blasted Lands 61.32,54.18
You can find more around here [54.03,54.60]
|only if Warlock
step
Incoming Dungeon Step
|tip The next couple of steps will be taking you to the Sunken Temple dungeon.
|tip You will need a group to complete the dungeon as well as the quest.
|tip If you don't have a group, wait until you do before continuing.
Click Here to Continue |confirm |q 8236
|only if Warlock and hardcore
step
Run up the stairs |goto Swamp of Sorrows/0 69.36,56.89 < 7 |walk
Enter the building and swim under the water |goto Swamp of Sorrows/0 70.54,49.78 < 7 |walk
Run down the stairs |goto Swamp of Sorrows/0 72.69,42.22 < 7 |walk
Follow the path |goto Swamp of Sorrows/0 75.69,45.78 < 7 |walk
Follow the path |goto Swamp of Sorrows/0 78.62,47.47 < 7 |walk
Follow the path |goto Swamp of Sorrows/0 80.22,49.62 < 7 |walk
Follow the path |goto Swamp of Sorrows/0 81.33,42.38 < 7 |walk
Run down the stairs |goto Swamp of Sorrows/0 78.86,40.74 < 7 |walk
Run down the ramp |goto Swamp of Sorrows/0 76.85,38.82 < 7 |walk
Enter The Temple of Atal'Hakkar Dungeon with Your Group |goto The Temple of Atal'Hakkar/0 0.00,0.00 < 500 |c |q 8232 |future
|only if Warlock
stickystart "Blue_Voodoo_Feathers"
stickystart "Green_Voodoo_Feathers"
step
Inside the Temple of Atal'Hakkar:
collect 2 Amber Voodoo Feather##20606 |q 8422/1
|tip These come from Gasher and Zul'Lor.
|only if Warlock
step
label "Blue_Voodoo_Feathers"
Inside the Temple of Atal'Hakkar:
collect 2 Blue Voodoo Feather##20607 |q 8422/2
|tip These come from Mijan and Hukku.
|only if Warlock
step
label "Green_Voodoo_Feathers"
Inside the Temple of Atal'Hakkar:
collect 2 Green Voodoo Feather##20608 |q 8422/3
|tip These come from Zolo and Loro.
|only if Warlock
step
talk Impsy##14470
turnin Flawless Fel Essence##7602 |goto Felwood 41.36,45.02
turnin Trolls of a Feather##8422 |goto Felwood 41.36,45.02
accept Kroshius' Infernal Core##7603 |goto Felwood 41.36,45.02
|only if Warlock
step
Follow the road |goto Felwood 38.76,41.70 < 25 |only if walking
Continue following the road |goto Felwood 39.01,37.86 < 25 |only if walking
Follow the path |goto Felwood 41.25,36.95 < 25 |only if walking
use the Fel Fire##18626
kill Kroshius##14467
|tip You may need help.
collect Kroshius' Infernal Core##18625 |q 7603/1 |goto Felwood 45.73,34.81
|only if Warlock
step
talk Niby the Almighty##14469
turnin Kroshius' Infernal Core##7603 |goto Felwood 41.38,44.86
|only if Warlock
step
ding 60
step
collect 35 Black Dragonscale##15416 |q 7628 |future
|tip These are gathered with the Skinning profession.
|tip Search the guide menu for the item(s) to use the farming guides.
|tip You can also purchase them from the Auction House. |only if not selfmade()
|only if Warlock
step
collect 10 Elixir of Shadow Power##9264 |q 7626 |future
|tip These are with the Alchemy profession.
|tip It takes 3 Ghost Mushrooms and a Crystal Vial to make one.
|tip You can also purchase them from the Auction House. |only if not selfmade()
|only if Warlock
step
collect 6 Large Brilliant Shard##14344 |q 7627 |future
|tip If you have the Enchanting profession, use your Disenchant ability on level 51-60 blue weapons and armor.
|tip You can also buy them from the Auction House. |only if not selfmade()
|only if Warlock
step
collect 25 Dark Iron Ore##11370 |q 7627 |future
|tip If you have the Mining profession, you can gather these.
|tip Search the guide menu for the item(s) to use the farming guides.
|tip You can also purchase them from the Auction House. |only if not selfmade()
|only if Warlock
step
collect 3 Arcanite Bar##12360 |q 7630 |future
|tip These are with the Alchemy profession.
|tip It takes 1 Thorium Bar and 1 Arcane Crystal to make one.
|tip Try to find a Alchemist to create one for you.
|tip You can also purchase them from the Auction House. |only if not selfmade()
|only if Warlock
step
Collect 250 Gold |complete _G.GetMoney() >= 2500000 |q 7637 |future
|only if Warlock
step
talk Kurgul##5815
accept Mor'zul Bloodbringer##7562 |goto Orgrimmar 47.52,46.73
|only if Warlock
step
Follow the path |goto Burning Steppes 15.46,40.26 < 15 |only if walking
talk Mor'zul Bloodbringer##14436
turnin Mor'zul Bloodbringer##7562 |goto Burning Steppes 12.69,31.64
accept Rage of Blood##7563 |goto Burning Steppes 12.69,31.64
|only if Warlock
step
Enter the cave |goto Winterspring 65.04,18.78 < 10 |walk
Kill Owlbeast enemies around this area
|tip Watch for respawns while in the area. |only if hardcore
collect 30 Raging Beast's Blood##18590 |goto Winterspring 63.65,16.33
|only if Warlock
step
Follow the path |goto Burning Steppes 15.46,40.26 < 15 |only if walking
talk Mor'zul Bloodbringer##14436
turnin Rage of Blood##7563 |goto Burning Steppes 12.69,31.64
accept Wildeyes##7564 |goto Burning Steppes 12.69,31.64
|only if Warlock
step
talk Gorzeeki Wildeyes##14437
turnin Wildeyes##7564 |goto Burning Steppes 12.43,31.63
accept Lord Banehollow##7623 |goto Burning Steppes 12.43,31.63
|only if Warlock
step
talk Mor'zul Bloodbringer##14436
accept Bell of Dethmoora##7626 |goto Burning Steppes 12.69,31.64
accept Wheel of the Black March##7627 |goto Burning Steppes 12.69,31.64
accept Doomsday Candle##7628 |goto Burning Steppes 12.69,31.64
|only if Warlock
step
talk Gorzeeki Wildeyes##14437
turnin Bell of Dethmoora##7626 |goto Burning Steppes 12.43,31.63
turnin Wheel of the Black March##7627 |goto Burning Steppes 12.43,31.63
turnin Doomsday Candle##7628 |goto Burning Steppes 12.43,31.63
accept Arcanite##7630 |goto Burning Steppes 12.43,31.63
|only if Warlock
step
talk Gorzeeki Wildeyes##14437
turnin Arcanite##7630 |goto Burning Steppes 12.43,31.63
|only if Warlock
step
talk Gorzeeki Wildeyes##14437
buy 6 Shadowy Potion##18802 |q 7623 |goto Burning Steppes 12.43,31.63
|only if Warlock
step
use the Shadowy Potion##18802
|tip use it before you enter Shadow Hold.
|tip It will make most enemies inside friendly for 20 minutes.
Enter the building |goto Felwood 35.42,58.61 < 10 |walk
Run down the ramp |goto Felwood 35.47,58.18 < 10 |walk
Run down the ramp |goto Felwood 36.04,56.42 < 10 |walk
Run up the ramp |goto Felwood 36.69,55.99 < 10 |walk
Follow the path down |goto Felwood 36.64,54.91 < 10 |walk
Run down the ramp |goto Felwood 38.19,54.10 < 5 |c |q 7623 |walk
|only if Warlock
step
Follow the path |goto Felwood 37.10,54.04 < 10 |walk
Cross the water |goto Felwood 37.61,52.21 < 10 |walk
Follow the path up |goto Felwood 36.26,52.52 < 10 |walk
Run down the ramp |goto Felwood 37.20,50.82 < 10 |walk
Continue down the ramp |goto Felwood 38.90,49.72 < 10 |c |q 7623 |walk
|only if Warlock
step
Follow the path	|goto Felwood 39.85,49.23 < 10 |walk
Follow the path |goto Felwood 40.04,47.80 < 10 |walk
Follow the path up |goto Felwood 38.56,46.06 < 10 |walk
Follow the path up |goto Felwood 37.43,46.24 < 10 |walk
Cross the bridge |goto Felwood 38.03,46.52 < 10 |walk
Cross the bridge |goto Felwood 37.33,47.22 < 10 |c |q 7623 |walk
|only if Warlock
step
use the Shadowy Potion##18802
|tip You need to have this buff for the next step.
Get the Taint of Shadow Buff |havebuff Taint of Shadow##23179
|only if Warlock
step
talk Lord Banehollow##9516
|tip Inside the cave.
turnin Lord Banehollow##7623 |goto Felwood 35.93,44.41
accept Ulathek the Traitor##7624 |goto Felwood 35.93,44.41
|only if Warlock
step
Cross the bridge |goto Felwood 36.20,46.09 < 10 |walk
Cross the bridge |goto Felwood 37.95,47.27 < 10 |walk
Run down the ramp |goto Felwood 37.94,45.39 < 10 |walk
Follow the path |goto Felwood 37.65,46.62 < 10 |walk
Continue following the path |goto Felwood 39.57,47.05 < 10 |walk
Cross the bridge |goto Felwood 40.06,48.94  < 10 |walk
talk Ulathek##14523
Remove the Taint of Shadow buff |nobuff Taint of Shadow##23179 |q 7624 |goto Felwood 39.89,49.17
|only if Warlock
step
Cross the bridge |goto Felwood 40.02,48.99 < 10
kill Ulathek##14523
collect The Traitor's Heart##18719 |q 7624/1 |goto Felwood 40.77,48.42
|only if Warlock
step
use the Shadowy Potion##18802
Get the Taint of Shadow Buff |havebuff Taint of Shadow##23179 |q 7624
|only if Warlock
step
Cross the bridge |goto Felwood 40.49,48.48 < 10 |walk
Run down the ramp |goto Felwood 40.04,47.71 < 10 |walk
Run up the ramp |goto Felwood 38.49,46.17 < 10 |walk
Follow the path |goto Felwood 38.22,46.82 < 10 |walk
run up the ramp |goto Felwood 37.35,45.87 < 10 |c |q 7624 |walk
|only if Warlock
step
Cross the bridge |goto Felwood 38.03,46.48 < 10 |walk
Cross the bridge |goto Felwood 37.46,47.35 < 10 |walk
talk Lord Banehollow##9516
|tip Inside the cave.
turnin Ulathek the Traitor##7624 |goto Felwood 35.93,44.41
accept Xorothian Stardust##7625 |goto Felwood 35.93,44.41
|only if Warlock
step
talk Ur'dan##14522
|tip Inside the cave.
buy Xorothian Stardust##18687 |q 7625/1 |goto Felwood 36.17,44.46
|only if Warlock
step
Follow the path |goto Burning Steppes 15.46,40.26 < 15 |only if walking
talk Gorzeeki Wildeyes##14437
turnin Xorothian Stardust##7625 |goto Burning Steppes 12.43,31.63
accept Imp Delivery##7629 |goto Burning Steppes 12.43,31.63
|only if Warlock
step
Incoming Dungeon Steps
|tip The next few steps will send you into 2 different dungeons: Scholomance and then Dire Maul - West.
|tip You will need a group for each instance.
Click Here to Continue |confirm |q 7629 |future
|only if Warlock
step
Enter the Scholomance Dungeon with Your Group |goto Scholomance/0 0.00,0.00 < 500 |c |q 7629
|tip This requires the Skeleton Key from the quest "The Key to Scholomance".
|only if Warlock
step
Inside the Scholomance Dungeon:
use Imp in a Jar##18688
|tip Use it near the Alchemy Station at the start of the room with Ras Frostwhisper.
Watch the dialogue
Create the Parchment |q 7629/1
|only if Warlock
step
Follow the path |goto Burning Steppes 15.46,40.26 < 15 |only if walking
talk Gorzeeki Wildeyes##14437
turnin Imp Delivery##7629 |goto Burning Steppes 12.43,31.63
|only if Warlock
step
talk Gorzeeki Wildeyes##14437
buy J'eevee's Jar##18663 |q 7631 |future |goto Burning Steppes 12.43,31.63
buy Black Lodestone##18629 |q 7631 |future |goto Burning Steppes 12.43,31.63
buy Xorothian glyphs##18670 |q 7631 |future |goto Burning Steppes 12.43,31.63
|only if Warlock
step
talk Mor'zul Bloodbringer##14436
accept Dreadsteed of Xoroth##7631 |goto Burning Steppes 12.69,31.64
|only if Warlock
step
Incoming Dungeon Steps
|tip The next few steps will send you into 2 different dungeons: Scholomance and then Dire Maul - West.
|tip You will need a group for each instance.
Click Here to Continue |confirm |q 7631 |future
|only if Warlock
step
Run up the ramp |goto Feralas/0 59.13,44.67 < 20 |only if walking
Follow the path |goto Feralas/0 59.52,39.51 < 15 |only if walking
Continue following the path |goto Feralas/0 61.72,38.78 < 15 |only if walking
Continue following the path |goto Feralas/0 61.15,34.87 < 7 |only if walking
click Door |goto Feralas/0 60.32,30.16 < 10 |walk
|tip You need a Crescent Key to unlock this door.
|tip This drops from Pusillin in the "Dire Maul - East" dungeon.
Enter the Dire Maul - West Dungeon with Your Group |goto Dire Maul/0 0.00,0.00 < 500 |c |q 7631
|only if Warlock
step
Inside the Dire Maul - West Dungeon:
use J'eevee's Jar##18663
|tip Use it in the area where Immol'thar is.
|tip Clear the room before starting.
Kill enemies around this area
|tip Focus on Dread Guards as they appear.
|tip They will spawn in waves after using J'eevee's Jar.
|tip Recharge the Bell, Wheel and Candle as they run out of charges.
|tip They will tilt when they need to be recharged.
|tip Use the "Black Lodestone" to fix them, which costs a soul shard.
use Xorothian glyphs##18670
kill Xorothian Dreadsteed##14502
|tip At 50% health, Lord Hel'nurath will appear and need to be killed.
talk Dreadsteed Spirit##14504
turnin Dreadsteed of Xoroth##7631
|only if Warlock
]])
GoatQuest:RegisterGuide("Leveling Guides\\Season of Discovery Items\\Cozy Sleeping Bag",{
description="This guide will walk you through obtaining the Cozy Sleeping Bag item.",
hideif=not GQ.IsClassicSoD,
},[[
step
click Burned-Out Remains##415106
accept ...and that note you found##79007 |goto The Barrens 46.36,73.90
step
click Nailed Plank##424010
turnin ...and that note you found##79007 |goto Westfall 37.43,50.81
accept Stepping Stones##79192 |goto Westfall 37.43,50.81
step
Follow the path up |goto Stonetalon Mountains 51.02,52.41 < 30 |only if walking
Follow the path through the mountains |goto Stonetalon Mountains 46.10,53.58 < 30 |only if walking
click Pocket Litter##424005
|tip On top of a wooden crate, next to a tent.
turnin Stepping Stones##79192 |goto Stonetalon Mountains 40.75,52.57
accept Scramble##79980 |goto Stonetalon Mountains 40.75,52.57
step
click Mound of Dirt##424012
|tip It looks like a brown pile of dirt on the ground.
|tip In the hills, on the cliffside.
turnin Scramble##79980 |goto Stonetalon Mountains 39.62,49.80
accept Wet Job##79974 |goto Stonetalon Mountains 39.62,49.80
step
Run onto the dam |goto Loch Modan 40.61,13.54 < 30 |only if walking
Jump down carefully here |goto Loch Modan 49.50,13.38 < 10 |only if walking
click Carved Figurine##424007
|tip It looks like a small eagle statue.
|tip On the ledge, overlooking the waterfall.
turnin Wet Job##79974 |goto Loch Modan 49.42,12.90
accept Eagle's Fist##79975 |goto Loch Modan 49.42,12.90
step
Jump up the cart to get onto the wall |goto Hillsbrad Foothills 87.58,47.88 < 10 |only if walking
click Messenger Bag##406918
|tip It looks like a hanging brown pouch.
|tip Next to the doorway on top of the wall.
turnin Eagle's Fist##79975 |goto Arathi Highlands 22.48,24.13
accept This Must Be The Place##79976 |goto Arathi Highlands 22.48,24.13
step
click Hastily Rolled-Up Satchel##424006
|tip It looks like a rolled up sleeping bag.
|tip On the ground, next to the doorway on top of the wall.
turnin This Must Be The Place##79976 |goto Arathi Highlands 22.48,24.13
]])
GoatQuest:RegisterGuide("Leveling Guides\\Season of Discovery Items\\Wild Offering (Currency)",{
description="This guide will walk you through obtaining Wild Offerings to use as currency.",
hideif=not GQ.IsClassicSoD,
},[[
step
label "Choose_Your_Adventure"
_NOTE:_
Choose Your Adventure
|tip You can go to 3 different dungeons to collect the items.
|tip You can complete the same dungeon repeatedly to keep collecting them.
|tip Zul'Farrak is the easiest of the 3 dungeons to complete.
|tip To do this, you need to have already collected the rune for your class that requires you to collect Wild Offerings.
|tip Click the line below for the dungeon you want to go to.
Zul'Farrak		|confirm	|next "ZulFarrak"
Maraudon		|confirm	|next "Maraudon"
Blackrock Depths	|confirm	|next "Blackrock_Depths"
step
label "ZulFarrak"
_Inside the Zul'Farrak Dungeon:_
|tip Use the Zul'Farrak dungeon guide.
use Agamaggan's Roar##221418
|tip Use it next to the Ghostly Spider.
|tip It looks like a translucent spider that walks around near where you kill Gahz'ranka.
|tip You may have to kill more enemies in the room where Gahz'ranka is to get it to appear.
kill Delirious Ancient##222573
collect Wild Offering##221262+ |n
Click Here to Continue |confirm	|next "Choose_Your_Adventure"
If needed, you can buy Agamaggan's Roar from Rix Xizzix at [Stranglethorn Vale 28.55,75.75] |only if itemcount(221418) == 0
step
label "Maraudon"
_Inside the Maraudon Dungeon:_
|tip Use the Maraudon dungeon guide.
use Agamaggan's Roar##221418
|tip Use it next to the Ghostly Raptor.
|tip It looks like a translucent raptor that walks around near where you kill Princes Theradras.
|tip You may have to kill more enemies in the room where Princes Theradras is to get it to appear.
kill Delirious Ancient##223264
collect Wild Offering##221262+ |n
Click Here to Continue |confirm	|next "Choose_Your_Adventure"
If needed, you can buy Agamaggan's Roar from Rix Xizzix at [Stranglethorn Vale 28.55,75.75] |only if itemcount(221418) == 0
step
label "Blackrock_Depths"
_Inside the Blackrock Depths Dungeon:_
|tip Use the Blackrock Depths dungeon guide.
use Agamaggan's Roar##221418
|tip Use it next to the Ghostly Basilisk.
|tip It looks like a translucent basilisk that walks around in the path that leads to Bael'gar.
|tip Kill all 3 of the bosses in the dungeon first, then run to the path that leads to Bael'gar and you should find the Ghostly Basilisk.
kill Delirious Ancient##223265
collect Wild Offering##221262+ |n
Click Here to Continue |confirm	|next "Choose_Your_Adventure"
If needed, you can buy Agamaggan's Roar from Rix Xizzix at [Stranglethorn Vale 28.55,75.75] |only if itemcount(221418) == 0
]])
GoatQuest:RegisterGuide("Leveling Guides\\Season of Discovery Events\\Nightmare Incursion\\Ashenvale Nightmare Incursion",{
description="This guide will walk you through completing quests for the Ashenvale Nightmare Incursion.",
hideif=not GQ.IsClassicSoD,
},[[
step
label "Accept_Ashenvale_Mission_Quests_Alone"
talk Field Captain Hannalah##221477 |goto Ashenvale 89.56,40.67
|tip She will offer you 20 daily quests, accept as many as you can.
|tip X through XII are gathering quests and can be skipped if you don't have Mining/Skinning/Herbalism.
|autoacceptany 81768-81785
Click Here When You're Ready To Begin |confirm
step
label "Accept_Ashenvale_Mission_Quests_With_Group"
Enter the Emerald Nightmare |havebuff Emerald Nightmare##444759 |goto Ashenvale 94.24,35.18
|tip Run up the ramp and enter the huge green portal.
|execute clearallquests()
stickystart "Get_Emerald_Nightmare_Buff"
step
kill Larsera##221265  |q 81780/1 |goto Ashenvale 86.20,44.76
|tip You share tags with your entire faction on this enemy.
|only if haveq(81780)
step
click Dream-Touched Dragon Egg##441124
collect Dream-Touched Dragon Egg##219447 |q 81776/1 |goto Ashenvale 86.09,45.98
|only if haveq(81776)
step
talk Dreamwarden Ellodar##221271
|tip He's stealthed.
Choose _"Take the field report."_
collect Intelligence Report: Forest Song##219924 |q 81771/1 |goto Ashenvale 83.64,45.41
|only if haveq(81771)
step
talk Dreamwarden Mandoran##221272
|tip He's stealthed.
Choose _"Take the field report."_
collect Intelligence Report: Satyrnaar##219925 |q 81772/1 |goto Ashenvale 81.54,48.58
|only if haveq(81772)
step
click Azsharan Prophecy##441129
|tip It looks like a paper inside the tent.
collect Azsharan Prophecy##219449 |q 81775/1 |goto Ashenvale 80.73,48.85
|only if haveq(81775)
step
kill Zalius##221266 |q 81781/1 |goto Ashenvale 80.84,49.77
|tip You share tags with your entire faction on this enemy.
|only if haveq(81781)
step
kill Shredder 9000##221267 |q 81782/1 |goto Ashenvale 86.79,62.10
|tip You share tags with your entire faction on this enemy.
|only if haveq(81782)
step
talk Dreamwarden Lanaria##221273
|tip He's stealthed inside the building.
Choose _"Take the field report."_
collect Intelligence Report: Warsong Lumber Camp##219926 |q 81773/1 |goto Ashenvale 91.21,58.05
|only if haveq(81773)
step
click Vibrating Crate##441128
|tip Inside the building.
collect Dreamengine##219448 |q 81774/1 |goto Ashenvale 90.97,58.14
Also check at the blacksmith at [88.50,55.14]
|only if haveq(81774)
step
label "Get_Emerald_Nightmare_Buff"
_NOTE:_
You Need the Emerald Nightmare Buff
|tip Enter to the huge green portal at the top of the ramp.
Enter the Emerald Nightmare |havebuff Emerald Nightmare##444759
|sticky only
step
Leave the Emerald Nightmare |nobuff Emerald Nightmare##444759 |goto Ashenvale 94.24,35.18
|tip Run up the ramp and enter the huge green portal.
step
talk Field Captain Hannalah##221477
|tip Turn in all of the Ashenvale Mission quests you have.
|autoturninany 81768-81785
|tip These quests will be available again after the daily reset.
Click Here To Reset The Guide	|confirm	|goto Ashenvale 89.56,40.67	|next "Accept_Ashenvale_Mission_Quests_Alone"
]])
GoatQuest:RegisterGuide("Leveling Guides\\Season of Discovery Events\\Nightmare Incursion\\Duskwood Nightmare Incursion",{
description="This guide will walk you through completing quests for the Duskwood Nightmare Incursion.",
hideif=not GQ.IsClassicSoD,
},[[
step
label "Accept_Duskwood_Mission_Quests_Alone"
talk Field Captain Palandar##221471
|autoacceptany 81730-81747 |goto Duskwood 45.67,51.26
|tip She will offer you 20 daily quests, accept as many as you can.
|tip X through XII are gathering quests and can be skipped if you don't have Mining/Skinning/Herbalism.
Click Here When You're Ready To Begin |confirm
step
label "Accept_Duskwood_Mission_Quests_With_Group"
Enter the Emerald Nightmare |havebuff Emerald Nightmare##444758 |goto Duskwood 46.44,35.71
|tip Run up the ramp and enter the huge green portal.
|execute clearallquests()
stickystart "Get_Emerald_Nightmare_Buff"
stickystart "Kill_Deranged_Ogres"
stickystart "Kill_Demented_Fire_Weavers"
step
talk Dreamwarden Thalinar##221222
|tip He's stealthed in the cave.
Choose _"Take the field report."_
collect Intelligence Report: Vul'gol Ogre Mound##219405 |q 81733/1 |goto Duskwood 36.56,83.89
|only if haveq(81733)
step
click Ogre Magi Text##441113
|tip Inside the cave.
collect Ogre Magi Text##219405 |q 81737/1 |goto Duskwood 35.72,80.18
|only if haveq(81737)
step
kill Vvarc' Zul##221206 |q 81743/1 |goto Duskwood 37.51,84.41
|tip You share tags with your entire faction on this enemy.
|tip He's at the very back of the cave.
|only if haveq(81743)
step
label "Kill_Deranged_Ogres"
kill 5 Deranged Ogre##221174 |q 81731/1 |goto Duskwood 35.72,80.18
|only if haveq(81731)
step
label "Kill_Demented_Fire_Weavers"
kill 5 Demented Fire Weaver##221175 |q 81731/2 |goto Duskwood 35.72,80.18
|only if haveq(81731)
step
kill Ylanthrius##221204  |q 81742/1 |goto Duskwood 49.22,72.97
|tip You share tags with your entire faction on this enemy.
|tip She may be flying above the farm.
|only if haveq(81742)
step
click Unhatched Green Dragon Egg##441119
collect Unhatched Green Dragon Egg##219447 |q 81738/1 |goto Duskwood 49.22,72.97
|only if haveq(81738)
step
talk Dreamwarden Amalia##221220
|tip She's stealthed inside the house.
Choose _"Take the field report."_
collect Intelligence Report: Yorgen Farmstead##219803 |q 81735/1 |goto Duskwood 50.68,77.19
|only if haveq(81735)
step
kill Amokarok##221207 |q 81744/1 |goto Duskwood 63.54,76.54
|tip You share tags with your entire faction on this enemy.
|only if haveq(81744)
step
talk Dreamwarden Dorilar##221221
|tip He's stealthed inside the barn.
Choose _"Take the field report."_
collect Intelligence Report: Rotting Orchard##219778 |q 81734/1 |goto Duskwood 66.36,75.93
|only if haveq(81734)
step
click Mysterious Box##441114
|tip Upstairs inside the house.
collect Shadowscythe##219404 |q 81736/1 |goto Duskwood 65.74,67.43
|only if haveq(81736)
step
label "Get_Emerald_Nightmare_Buff"
_NOTE:_
You Need the Emerald Nightmare Buff
|tip Enter to the huge green portal at the top of the ramp.
Enter the Emerald Nightmare |havebuff Emerald Nightmare##444758
|sticky only
step
Leave the Emerald Nightmare |nobuff Emerald Nightmare##444758 |goto Duskwood 46.44,35.71
|tip Run up the ramp and enter the huge green portal.
step
talk Field Captain Palandar##221471
|tip Turn in all of the Duskwood Mission quests you have.
|autoturninany 81730-81747
|tip These quests will be available again after the daily reset.
Click Here To Reset The Guide		|confirm	|goto Duskwood 46.43,38.77	|next "Accept_Duskwood_Mission_Quests_Alone"
]])
GoatQuest:RegisterGuide("Leveling Guides\\Season of Discovery Events\\Nightmare Incursion\\Hinterlands Nightmare Incursion",{
description="This guide will walk you through completing quests for the Hinterlands Nightmare Incursion.",
hideif=not GQ.IsClassicSoD,
},[[
step
label "Accept_Hinterlands_Mission_Quests_Alone"
talk Field Captain Korlian##221479
|autoacceptany 81786-81789,81817,81820,81830-81839,81850-81852 |goto The Hinterlands/0 61.40,34.49
|tip She will offer you 20 daily quests, accept as many as you can.
|tip X through XII are gathering quests and can be skipped if you don't have Mining/Skinning/Herbalism.
Click Here When You're Ready To Begin |confirm
step
label "Accept_Hinterlands_Mission_Quests_With_Group"
Enter the Emerald Nightmare |havebuff Emerald Nightmare##444760 |goto The Hinterlands/0 62.23,23.23
|tip Run up the ramp and enter the huge green portal.
|execute clearallquests()
stickystart "Get_Emerald_Nightmare_Buff"
stickystart "Fallen_Moonkin"
step
click Humming Box##441140
|tip Enter the cave
collect Elunar Relic##219490 |q 81830/1 |goto The Hinterlands/0 57.53,40.73
|only if haveq(81830)
step
kill Doomkin##221265  |q 81838/1 |goto The Hinterlands/0 56.62,43.35
|tip At the bottom of the cave.
|tip You share tags with your entire faction on this enemy.
|only if haveq(81838)
step
talk Dreamwarden Valori##221351
|tip She's stealthed beside the Doomkin.
Choose _"Take the field report."_
collect Intelligence Report: Skulk Rock##219938 |q 81820/1 |goto The Hinterlands/0 56.62,43.35
|only if haveq(81820)
step
label "Fallen_Moonkin"
kill 20 Fallen Moonkin##221330 |q 81786/1 |goto The Hinterlands/0 57.61,40.15
|only if haveq(81786)
stickystart "Wyrmkin"
step
talk Dreamwarden Laninar##221353
|tip He's stealthed.
Choose _"Take the field report."_
collect Intelligence Report: Agol'watha##219928 |q 81789/1 |goto The Hinterlands/0 46.79,41.22
|only if haveq(81789)
step
click Star-Touched Dragon Egg##441133
|tip It looks like an egg inside the tent.
collect Star-Touched Dragonegg##219488 |q 81826/1 |goto The Hinterlands/0 45.41,38.54
|only if haveq(81826)
step
kill Florius##221331 |q 81837/1 |goto The Hinterlands/0 45.41,38.54
|tip You share tags with your entire faction on this enemy.
|tip He may be flying in the sky
|only if haveq(81837)
step
label "Wyrmkin"
kill 10 Wyrmkin Starhunter##221325 |q 81788/1 |goto The Hinterlands/0 46.79,41.22
kill 3 Wrath Whelp##221326 |q 81788/2 |goto The Hinterlands/0 46.79,41.22
|only if haveq(81788)
step
Run to this location in the mountains |goto The Hinterlands/0 43.84,33.41 |c
|tip You will get a debuff saying you are leaving the Incursion, let it reach 0 and you'll teleported to the next quest area.
|only if haveq(81826) |or
|only if haveq(81789) |or
|only if haveq(81837) |or
|only if haveq(81788) |or
stickystart "Dreamwater_Vicejaw"
step
talk Dreamwarden Sanathel##221352
|tip She's stealthed inside the ruins
Choose _"Take the field report."_
collect Intelligence Report: Shaol'watha##219937 |q 81817/1 |goto The Hinterlands/0 91.21,58.05
|only if haveq(81817)
step
click Dreampearl##441141
|tip Inside the fountain on the wall of the ruins.
collect Dreampearl##219491 |q 81832/1 |goto The Hinterlands/0 72.33,54.08
|only if haveq(81832)
step
kill Ghamoo-Raja##221334 |q 81839/1 |goto The Hinterlands/0 72.33,54.08
|tip You share tags with your entire faction on this enemy.
|only if haveq(81839)
step
label "Dreamwater_Vicejaw"
kill 20 Dreamwater Vicejaw##221328 |q 81787/1 |goto The Hinterlands/0 65.53,45.80
|tip They spawn around the river and in the forests
|only if haveq(81787)
step
Run outside the forest until you start getting the Deserter Debuff |goto The Hinterlands/0 75.21,48.57 |c
|tip Once the debuff reaches 0 seconds you'll be teleported to the next area.
|only if haveq(81787) |or
|only if haveq(81839) |or
|only if haveq(81832) |or
step
label "Get_Emerald_Nightmare_Buff"
_NOTE:_
You Need the Emerald Nightmare Buff
|tip Enter to the huge green portal at the top of the ramp.
Enter the Emerald Nightmare |havebuff Emerald Nightmare##444760
|sticky only
step
Leave the Emerald Nightmare |nobuff Emerald Nightmare##444760 |goto The Hinterlands/0 62.23,23.23
|tip Run up the ramp and enter the huge green portal.
step
talk Field Captain Korlian##221479
|tip Turn in all of the Hinterlands Mission quests you have.
|autoturninany 81786-81852
Choose What to Do Next
|tip These quests will be available again after the daily reset.
Click Here To Reset The Guide		|confirm	|goto The Hinterlands/0 61.40,34.49	|next "Accept_Hinterlands_Mission_Quests_Alone"
]])
GoatQuest:RegisterGuide("Leveling Guides\\Season of Discovery Events\\Nightmare Incursion\\Feralas Nightmare Incursion",{
description="This guide will walk you through completing quests for the Feralas Nightmare Incursion.",
hideif=not GQ.IsClassicSoD,
},[[
step
label "Accept_Feralas_Mission_Quests_Alone"
talk Field Captain Arunnel##221480
|autoacceptany 81855-81874 |goto Feralas/0 61.40,34.49
|tip She will offer you 20 daily quests, accept as many as you can.
|tip X through XII are gathering quests and can be skipped if you don't have Mining/Skinning/Herbalism.
Click Here When You're Ready To Begin |confirm
step
label "Accept_Feralas_Mission_Quests_With_Group"
Enter the Emerald Nightmare |havebuff Emerald Nightmare##444762 |goto Feralas/0 51.24,10.73
|tip Run up the ramp and enter the huge green portal.
|execute clearallquests()
stickystart "Get_Emerald_Nightmare_Buff"
stickystart "Harpies"
step
click Harpy Screed##441314
|tip Under the Gazebo
collect Harpy Screed##219518 |q 81864/1 |goto Feralas/0 38.45,15.87
|only if haveq(81864)
step
kill Slirena##221391  |q 81871/1 |goto Feralas/0 38.41,13.01
|tip You share tags with your entire faction on this enemy.
|only if haveq(81871)
step
talk Dreamwarden Anadelle##221404
|tip She's stealthed inside the gazebo
Choose _"Take the field report."_
collect Intelligence Report: Ruins of Ravenwind##219959 |q 81860/1 |goto Feralas/0 37.61,12.07
|only if haveq(81860)
step
label "Harpies"
kill 10 Dreamspring Roguefeather##221370 |q 81856/1 |goto Feralas/0 40.76,8.06
kill 10 Dreamspring Stormcaller##221371 |q 81856/2 |goto Feralas/0 40.76,8.06
|only if haveq(81856)
stickystart "Children"
step
click Mad Keeper's Notes##441312
|tip It looks like a tiny scroll in the grass on the hill. It is hard to see.
collect Mad Keeper's Notes##219519 |q 81863/1 |goto Feralas/0 45.01,19.96
|only if haveq(81863)
step
kill Alondrius##221389 |q 81870/1 |goto Feralas/0 46.41,20.27
|tip You share tags with your entire faction on this enemy.
|tip He may be patrolling up and down the road.
|only if haveq(81870)
step
talk Dreamwarden Gorlas##221402
|tip He's stealthed.
Choose _"Take the field report."_
collect Intelligence Report: Twin Colossals##219958 |q 81859/1 |goto Feralas/0 47.13,21.66
|only if haveq(81859)
step
label "Children"
kill 10 Lost Daughter##221375 |q 81855/1 |goto Feralas/0 45.01,22.45
kill 10 Vengeful Son##221377 |q 81855/2 |goto Feralas/0 45.01,22.45
|only if haveq(81855)
stickystart "Dragonkin"
step
talk Dreamwarden Sheldryn##221401
|tip She's stealthed inside the ruins
Choose _"Take the field report."_
collect Intelligence Report: Oneiros##219957 |q 81858/1 |goto Feralas/0 50.74,19.67
|only if haveq(81858)
step
click Moonglow Dragonegg##441310
|tip Inside the gazebo.
collect Moonglow Dragonegg##219520 |q 81861/1 |goto Feralas/0 50.71,17.21
|only if haveq(81861)
step
kill Tyrannikus##221393 |q 81868/1 |goto Feralas/0 53.15,17.31
|tip You share tags with your entire faction on this enemy.
|only if haveq(81868)
step
label "Dragonkin"
kill 10 Frenzied Whelp##221369 |q 81857/1 |goto Feralas/0 49.78,15.51
kill 3 Wyrmkin Berserker##221367 |q 81857/2 |goto Feralas/0 49.78,15.51
|tip They spawn all over southeast of the lake.
|only if haveq(81857)
step
label "Get_Emerald_Nightmare_Buff"
_NOTE:_
You Need the Emerald Nightmare Buff
|tip Enter to the huge green portal at the top of the ramp.
Enter the Emerald Nightmare |havebuff Emerald Nightmare##444762
|sticky only
step
Leave the Emerald Nightmare |nobuff Emerald Nightmare##444762 |goto Feralas/0 62.23,23.23
|tip Run up the ramp and enter the huge green portal.
step
talk Field Captain Arunnel##221480
|tip Turn in all of the Hinterlands Mission quests you have.
|autoturninany 81855-81874
|tip These quests will be available again after the daily reset.
Click Here To Reset The Guide		|confirm	|goto Feralas/0 48.49,12.45	|next "Accept_Feralas_Mission_Quests_Alone"
]])
GoatQuest:RegisterGuide("Leveling Guides\\Season of Discovery Events\\Blackrock Eruption",{
description="This guide will walk you through the Blackrock Eruption world event.",
},[[
step
This event is active every 2 hours after midnight server time.
You will know the event is active by the ash raining from the sky and the presence of the "Eruption!" buff.
|tip Most of these quests are dailies that reset every day.
|havebuff Eruption!##461197
step
talk Lookout Captain Lolo Longstriker##14634
accept Priority Target Duke Searbrand##84349 |goto Searing Gorge/0 37.76,26.55
step
talk Taskmaster Scrange##14626
accept More Like Lame Bringers##84355 |goto Searing Gorge/0 38.96,27.51
accept Work Smarter Not Harder##84351 |goto Searing Gorge/0 38.96,27.51
step
talk Hansel Heavyhands##14627
accept Priority Target Duke Tectonis##84348 |goto Searing Gorge/0 38.62,27.82
accept Lava Diving##84372 |goto Searing Gorge/0 38.62,27.82
step
talk Master Smith Burninate##14624
accept Oh Shiny##84356 |goto Searing Gorge/0 38.80,28.50
step
talk Overseer Oilfist##14625
|tip Ontop of the tower
accept Firefighting##84360 |goto Searing Gorge/0 38.11,26.96
step
talk Evonice Sootsmoker##14628
accept Sleepless Nights##84359 |goto Searing Gorge/0 38.36,27.73
accept Grinding Them Down##84350 |goto Searing Gorge/0 38.36,27.73
step
use Dreamjuice##227768
|tip Drink the juice to see the enemies around Thorium Point.
kill 5 Flamebringer Stalker##228747 |q 84359/1 |goto Searing Gorge/0 38.36,27.73
step
kill 15 Firelands Invader##228718 |q 84360/1 |goto Searing Gorge/0 33.48,29.06
step
kill 5 Flamebringer Defender##228727 |q 84355/1 |goto Searing Gorge/0 28.41,39.10
kill 6 Flamebringer Elementalist##228726 |q 84355/2 |goto Searing Gorge/0 28.41,39.10
step
kill Dark Iron Slaver##5844+ |goto Searing Gorge/0 43.38,34.94
collect 8 Flamestone Cluster##227767 |q 84356/1
stickystart "Molten_Mineral"
step
Jump down onto the metal walkway here |goto Searing Gorge/0 49.32,43.74 < 15 |only if not (subzone("The Slag Pit") and _G.IsIndoors())
Enter the cave |goto Searing Gorge/0 49.58,45.49 < 10 |c |only if not (subzone("The Slag Pit") and _G.IsIndoors())
Jump down from the bridge inside the cave here |goto Searing Gorge/0 47.73,41.92 < 10 |walk
kill Duke Searbrand##228720 |q 84349/1 	|goto Searing Gorge/0 43.67,28.18
|tip He is located at the very back of the Incendosaur cave.
step
label "Molten_Mineral"
collect Shimmering Molten Mineral##228191 |goto Searing Gorge/0 43.67,28.18
|tip Click shimmering molten crag nodes in the lava pools in the Slag Pits
stickystart "Obsidian_Reaver"
step
kill Obsidian Surger##228724+
collect 6 Obsidian Power Core##227743 |q 84351/1 |goto Searing Gorge/0 32.66,75.99
step
label "Obsidian_Reaver"
kill 12 Obsidian Reaver##228723 |q 84350/1 |goto Searing Gorge/0 32.66,75.99
step
kill Duke Tectonis##228729 |q 84348/1 |goto Searing Gorge/0 21.79,76.57
|tip These were his coordinates on beta however he has not been seen on live servers and may be bugged. Please report his location if you spot him!
step
talk Lookout Captain Lolo Longstriker##14634
turnin Priority Target Duke Searbrand##84349 |goto Searing Gorge/0 37.76,26.55
step
talk Taskmaster Scrange##14626
turnin More Like Lame Bringers##84355 |goto Searing Gorge/0 38.96,27.51
turnin Work Smarter Not Harder##84351 |goto Searing Gorge/0 38.96,27.51
step
talk Hansel Heavyhands##14627
turnin Priority Target Duke Tectonis##84348 |goto Searing Gorge/0 38.62,27.82
turnin Lava Diving##84372 |goto Searing Gorge/0 38.62,27.82
step
talk Master Smith Burninate##14624
turnin Oh Shiny##84356 |goto Searing Gorge/0 38.80,28.50
step
talk Evonice Sootsmoker##14628
turnin Sleepless Nights##84359 |goto Searing Gorge/0 38.36,27.73
turnin Grinding Them Down##84350 |goto Searing Gorge/0 38.36,27.73
step
talk Overseer Oilfist##14625
|tip Ontop of the tower
turnin Firefighting##84360 |goto Searing Gorge/0 38.11,26.96
]])
GoatQuest:RegisterGuide("Leveling Guides\\Season of Discovery Events\\Demon Fall Canyon Dungeon Unlock",{
description="This guide will walk you through unlocking the Demon Fall Canyon dungeon in SoD Phase 4.",
hideif=not GQ.IsClassicSoD,
},[[
step
ding 55
|tip Use the leveling guides to accomplish this.
step
talk Shadowtooth Emissary##222408
accept Demonic Deceptions##84384 |goto Felwood 51.57,82.00
step
Kill Owlbeast enemies around this area
collect 6 Owlbeast Pineal Gland##84384 |q 84384/1 |goto Winterspring 65.85,21.07
step
talk Shadowtooth Emissary##222408
turnin Demonic Deceptions##84384 |goto Felwood 51.57,82.00
step
_NOTE:_
Equip the Shadowtooth Illusion Ward Trinket
|tip You received this from the previous step.
|tip This will allow you to see the dungeon entrance portal.
|tip The portal is at this location.
Click Here to Continue |confirm |goto Ashenvale 84.52,73.59
]])
GoatQuest:RegisterGuide("Leveling Guides\\Season of Discovery Events\\Karazhan Crypts Attunement",{
description="This guide will walk you through unlocking the Karazhan Crypts dungeon in SoD Phase 7.",
hideif=not GQ.IsClassicSoD,
},[[
step
ding 60
|tip Use the leveling guides to accomplish this.
step
|tip Click the Wanted Poster
accept For Gold and Glory!##86964 |goto Eastern Plaguelands/0 81.30,58.74
step
talk Deceased Adventurer##237820
turnin For Gold and Glory!##86964 |goto Deadwind Pass/0 40.02,74.27
accept No Ordinary Shadows##86965 |goto Deadwind Pass/0 40.02,74.27
step
talk Agent Keanna##218920
turnin No Ordinary Shadows##86965 |goto Deadwind Pass/0 52.09,34.16
accept Seeking Survivors##86966 |goto Deadwind Pass/0 52.09,34.16
step
Enter the cave |goto Deadwind Pass/0 59.64,73.98 < 20
talk Injured Adventurer##237819
turnin Seeking Survivors##86966 |goto Deadwind Pass/0 65.34,78.54
accept To the Rescue##86967 |goto Deadwind Pass/0 65.34,78.54
step
Kill Ogres in the area
collect Deadwind Cage "Key"##235785 |goto Deadwind Pass/0 56.31, 63.42 |q 86967/1
|tip Alternatively you can group with other players nearby, if one of them opens the cage you will also get credit.
step
Free the Captive |q 86967/1 |goto Deadwind Pass/0 65.33,78.52
|tip Click the cage. You may need to do this multiple times if other players are clicking it.
|tip It has been buggy.
step
talk Harrison Jones##237818
turnin To the Rescue##86967 |goto Deadwind Pass/0 52.29,34.12
accept Are You Afraid of the Dark?##86968 |goto Deadwind Pass/0 52.29,34.12
step
talk Agent Keanna##218920
turnin Are You Afraid of the Dark?##86968 |goto Deadwind Pass/0 52.07,34.10
accept The Hypothesis##86969 |goto Deadwind Pass/0 52.07,34.10
step
label "Kara_menu"
|tip This next quest will have you do three different group challenges.
|tip You will need to group with other players and they may want to do things in different orders than our guide.
|tip Choose the option your group decide to do first, then return to this menu when it is time to pick another step.
|tip You need to grind elite dragons in Wetlands, run Demon Fall Canyon, and traverse Darkwhisper Gorge in Winterspring.
Click Here to Farm Dragons in Wetlands |confirm |next "Flame_of_Life"
Click Here to Run Darkwhisper Gorge |confirm |next "Ancient_Ironwood_Branch"
Click Here to traverse Darkwhisper Gorge |confirm |next "Enthuastic_Wisp"
Click Here when you are ready to turn the quest in |confirm |next "Kara_end"
|only if haveq(86969)
step
label "Enthuastic_Wisp"
Cross the bridge |goto Winterspring 62.42,67.44 < 40 |only if walking
Enter the cave |goto Winterspring 61.10,80.02 < 20 |only if walking
Enter the cave |goto Winterspring/0 59.02,83.76 < 20 |only if walking
Enter the cave |goto Winterspring/0 55.17,84.10 < 20 |only if walking
Enter the cave |goto Winterspring/0 53.05,86.33 < 20 |only if walking
talk Enthusiastic Wisp##238431
|tip It's a blue ball that patrols around this area.
collect Enthusiastic Wisp##235788 |goto Winterspring/0 52.41,90.50 |q 86969/3
Click Here to Return to the Menu |confirm |next "Kara_menu"
step
label "Flame_of_Life"
Kill Dragons in the area
collect Flame of Life##235789 |goto Wetlands, 87.21,66.80 |q 86969/1
|tip This will require a group.
Click Here to Return to the Menu |confirm |next "Kara_menu"
step
label "Ancient_Ironwood_Branch"
Enter the Demon Fall Canyon dungeon with your group |goto Ashenvale 84.52,73.59 < 20 |only if walking
kill Grimroot##2266923
collect Ancient Ironwood Branch##235787 |q 86969/2
Click Here to Return to the Menu |confirm |next "Kara_menu"
step
label "Kara_end"
talk Agent Keanna##218920
turnin The Hypothesis##86969 |goto Deadwind Pass/0 52.07,34.10
accept Testing Our Hypothesis##86970 |goto Deadwind Pass/0 52.07,34.10
step
use Enchanted Firebrand##235790
|tip Enter the crypt in the graveyard.
Test the Magical Torch |q 86970/1 |goto Deadwind Pass/0 40.71,73.91
step
talk Agent Keanna##218920
turnin Testing Our Hypothesis##86970 |goto Deadwind Pass/0 52.07,34.10
|tip You can now run Karazhan Crypts
]])
GoatQuest:RegisterGuide("Leveling Guides\\Season of Discovery Events\\Scarlet Insignia / Scarlet Uniform",{
description="This guide will walk you through unlocking your Scarlet Uniform in SoD Phase 8.",
hideif=not GQ.IsClassicSoD,
},[[
step
_The Scarlet Uniform_
|tip The Scarlet Uniform is used to access New Avalon, the quest hub of Phase 8.
|tip This guide will walk you through how to unlock this Uniform.
|tip This phase is still new and this guide may receive regular updates over the following weeks as quests are discovered.
|confirm
step
talk Leonid Barthalomew the Revered##11036
accept Scarlet Activities##87459 |goto Eastern Plaguelands/0 81.73,57.84
step
kill Scarlet Infiltrator##238745
|tip She has a long respawn time.
|tip This drop is shared between group members, group up with others if you are waiting for her to respawn.
collect Orders from the Commander##237143 |q 87459/1 |goto Tirisfal Glades/0 81.90,58.10
step
talk Leonid Barthalomew the Revered##11036
turnin Scarlet Activities##87459 |goto Eastern Plaguelands/0 81.72,57.85
accept Unrest at Tyr's Hand##87493 |goto Eastern Plaguelands/0 81.72,57.85
step
talk Commander Beatrix##239032
turnin Unrest at Tyr's Hand##87493 |goto Eastern Plaguelands/0 67.78,83.35
accept The Schism##87497 |goto Eastern Plaguelands/0 67.78,83.35
step
talk Commander Beatrix##239032
Select _"What do you know so far?"_ |gossip 132451 |q 87497/1 |goto Eastern Plaguelands/0 67.78,83.35
Select _"Dathrohan? Commander, I'm not sure how to tell you this but that isn't the Grand Crusader..."_ |gossip 132450 |q 87497/1 |goto Eastern Plaguelands/0 67.78,83.35
Select _"Very well, I will report back to Light's Hope Chapel now, but when I return I will do my best to assist."_ |gossip 132449 |q 87497/1 |goto Eastern Plaguelands/0 67.78,83.35
step
talk Leonid Barthalomew the Revered##11036
turnin The Schism##87497 |goto Eastern Plaguelands/0 81.72,57.85
accept The Scarlet Reclamation##87498 |goto Eastern Plaguelands/0 81.73,57.82
accept My Old Enemy##89562 |goto Eastern Plaguelands/0 81.73,57.82
step
talk Leonid Barthalomew the Revered##11036
Select _"Is there anything else you can tell me about Baelin Caldoran?"_ |gossip 133492 |q 89562 |goto Eastern Plaguelands/0 81.73,57.82
Select _"It sounds like you two have a long history."_ |gossip 133491 |q 89562 |goto Eastern Plaguelands/0 81.73,57.82
Select _"I'm sorry, Leonid. I won't push you further."_ |gossip 133490 |q 89562 |goto Eastern Plaguelands/0 81.73,57.82
step
talk Leonid Barthalomew the Revered##11036
turnin My Old Enemy##89562 |goto Eastern Plaguelands/0 81.73,57.82
step
talk Commander Beatrix##239032
turnin The Scarlet Reclamation##87498 |goto Eastern Plaguelands/0 67.78,83.35
step
talk Scarlet Inquisitor Caldoran##239031
accept Gathering Intelligence##87502 |goto Eastern Plaguelands/0 68.26,82.70
step
talk Inquisitor Jociphine##243023
|tip Acquire your disguise.
Select _"Caldoran tells me you can help with a more "subtle" approach to get into Tyr's Hand and New Avalon"_ |gossip 133489 |q 87502 |goto Eastern Plaguelands/0 68.20,82.45 |complete hasbuff(1231929)
step
Scout the Cathedral in Tyr's Hand |q 87502/1 |goto Eastern Plaguelands/0 86.23,84.72 < 20
step
Enter New Avalon |goto Eastern Plaguelands/0 90.65,81.50 < 50 |c
|only if haveq(87502) and not subzone("New Avalon")
step
Scout the Keep in New Avalon |q 87502/3 |goto Eastern Plaguelands/0 97.23,83.12 < 20
step
Scout the Mage Tower in New Avalon |q 87502/2 |goto Eastern Plaguelands/0 98.60,88.47 < 20
step
talk Scarlet Inquisitor Caldoran##239031
turnin Gathering Intelligence##87502 |goto Eastern Plaguelands/0 68.26,82.70
accept Weakening The Defenses##87506 |goto Eastern Plaguelands/0 68.27,82.70
step
talk Inquisitor Jociphine##243023
accept New Avalon##90510 |goto Eastern Plaguelands/0 68.20,82.43
step
_The Scarlet Uniform_
|tip You now have access to your Scarlet Insignia and have completed this guide.
|tip This insignia is used to craft the Scarlet Disguise, which requires you wear 4 pieces of Scarlet Uniform gear.
|tip This Disguise will allow you to safely access New Avalon.
|tip These Scarlet Uniform pieces can be acquired from killing enemies in Tyr's Hand and New Avalon.
|tip They can also be crafted via recipes from the raid.
|tip Group up with other players to kill enemies in Tyr's Hand and New Avalon to complete your disguise.
|confirm
]])
GoatQuest:RegisterGuide("Leveling Guides\\Scourge Invasion",{
description="This guide will walk you through the Scourge Invasion quests.",
},[[
step
talk Argent Scout##16255
accept Light's Hope Chapel##9154 |goto Orgrimmar/0 52.6,73.8
step
talk Keeper of the Rolls##16281
turnin Light's Hope Chapel##9154 |goto Eastern Plaguelands/0 80.8,60.2
step
collect A Letter from the Keeper of the Rolls##22723
|tip It should be in your mailbox.
step
use A Letter from the Keeper of the Rolls##22723
accept The Keeper's Call##9247
step
talk Keeper of the Rolls##16281
turnin The Keeper's Call##9247 |goto Eastern Plaguelands/0 80.8,60.2
step
talk Commander Thomas Helleran##16361
accept Under the Shadow##9153 |goto Eastern Plaguelands/0 80.8,60.2
step
collect 10 Necrotic Rune##22484 |q 9153
|tip Go to an area under attack by the scourge and defeat the enemies surrounding the necropolis.
|tip You will see an icon on the screen indicationg the attack point.
step
talk Commander Thomas Helleran##16361
turnin Under the Shadow##9153 |goto Eastern Plaguelands/0 80.8,60.2
step
talk Lieutenant Dagel##16493
accept Investigate the Scourge of Orgrimmar##9263 |goto Orgrimmar/0 51.56,81.43
stickystart "Investigate_a_Circle_9260"
step
collect 3 Dim Necrotic Stone##22892 |q 9263/1 |goto Durotar/0 47.31,17.89
|tip Run into a circle and spawn the enemies.
|tip Kill the enemies that spawn to collect stones.
step
label "Investigate_a_Circle_9260"
Investigate a Circle |q 9263/2 |goto Durotar/0 47.31,17.89
|tip Step inside one of the circles to get credit.
step
talk Lieutenant Dagel##16493
turnin Investigate the Scourge of Orgrimmar##9263 |goto Orgrimmar/0 51.56,81.43
step
talk Lieutenant Rukag##16494
accept Investigate the Scourge of Undercity##9265 |goto Undercity/0 66.05,22.03
stickystart "Investigate_a_Circle_9261"
step
collect 3 Dim Necrotic Stone##22892 |q 9265/1 |goto Tirisfal Glades/0 60.38,60.98
|tip Run into a circle and spawn the enemies.
|tip Kill the enemies that spawn to collect stones.
step
label "Investigate_a_Circle_9261"
Investigate a Circle |q 9265/2 |goto Tirisfal Glades/0 60.38,60.98
|tip Step inside one of the circles to get credit.
step
talk Lieutenant Rukag##16494
turnin Investigate the Scourge of Undercity##9265 |goto Undercity/0 66.05,22.03
step
talk Lieutenant Lisande##16490
accept Investigate the Scourge of Thunder Bluff##9264 |goto Thunder Bluff/0 31.09,71.38
stickystart "Investigate_a_Circle_92623"
step
collect 3 Dim Necrotic Stone##22892 |q 9264/1 |goto Mulgore/0 39.03,37.05
|tip Run into a circle and spawn the enemies.
|tip Kill the enemies that spawn to collect stones.
step
label "Investigate_a_Circle_92623"
Investigate a Circle |q 9264/2 |goto Mulgore/0 39.03,37.05
|tip Step inside one of the circles to get credit.
step
talk Lieutenant Lisande##16490
turnin Investigate the Scourge of Thunder Bluff##9264 |goto Thunder Bluff/0 31.09,71.38
step
label "Farm_Invasion_Points"
Farm Invasion Points |complete false
|tip Check you map for active scourge invasion points.
|tip At any scourge invasion point, you can collect the following items to turn in for a quest:
|tip A Careworn Note |only if not completedq(9299)
|tip A Torn Letter |only if not completedq(9295)
|tip A Bloodstained Envelope |only if not completedq(9301)
|tip A Ragged Page |only if not completedq(9300)
|tip A Crumpled Missive |only if not completedq(9302)
|tip A Smudged Document |only if not completedq(9304)
'|complete itemcount(22972) >= 1 |next "Accept_Note_from_the_Front" |only if not completedq(9299) |or
'|complete itemcount(22977) >= 1 |next "Accept_Letter_from_the_Front" |only if not completedq(9295) |or
'|complete itemcount(22970) >= 1 |next "Accept_Envelope_from_the_Front" |only if not completedq(9301) |or
'|complete itemcount(22946) >= 1 |next "Accept_Page_from_the_Front" |only if not completedq(9300) |or
'|complete itemcount(22944) >= 1 |next "Accept_Missive_from_the_Front" |only if not completedq(9302) |or
'|complete itemcount(22975) >= 1 |next "Accept_Document_from_the_Front" |only if not completedq(9304) |or
|only if not completedallq(9299,9295,9301,9300,9302,9304)
step
label "Accept_Note_from_the_Front"
use A Careworn Note##22972
accept Note from the Front##9299
step
talk Keeper of the Rolls##16281
turnin Note from the Front##9299 |goto Eastern Plaguelands/0 80.8,60.2
|next "Farm_Invasion_Points" |only if not completedallq(9299,9295,9301,9300,9302,9304)
step
label "Accept_Letter_from_the_Front"
use A Torn Letter##22977
accept Letter from the Front##9295
step
talk Keeper of the Rolls##16281
turnin Letter from the Front##9295 |goto Eastern Plaguelands/0 80.8,60.2
|next "Farm_Invasion_Points" |only if not completedallq(9299,9295,9301,9300,9302,9304)
step
label "Accept_Envelope_from_the_Front"
use A Bloodstained Envelope##22970
accept Envelope from the Front##9301
step
talk Keeper of the Rolls##16281
turnin Envelope from the Front##9301 |goto Eastern Plaguelands/0 80.8,60.2
|next "Farm_Invasion_Points" |only if not completedallq(9299,9295,9301,9300,9302,9304)
step
label "Accept_Page_from_the_Front"
use A Ragged Page##22946
accept Page from the Front##9300
step
talk Keeper of the Rolls##16281
turnin Page from the Front##9300 |goto Eastern Plaguelands/0 80.8,60.2
|next "Farm_Invasion_Points" |only if not completedallq(9299,9295,9301,9300,9302,9304)
step
label "Accept_Missive_from_the_Front"
use A Crumpled Missive##22944
accept Missive from the Front##9302
step
talk Keeper of the Rolls##16281
turnin Missive from the Front##9302 |goto Eastern Plaguelands/0 80.8,60.2
|next "Farm_Invasion_Points" |only if not completedallq(9299,9295,9301,9300,9302,9304)
step
label "Accept_Document_from_the_Front"
use A Smudged Document##22975
accept Document from the Front##9304
step
talk Keeper of the Rolls##16281
turnin Document from the Front##9304 |goto Eastern Plaguelands/0 80.8,60.2
|next "Farm_Invasion_Points" |only if not completedallq(9299,9295,9301,9300,9302,9304)
]])
