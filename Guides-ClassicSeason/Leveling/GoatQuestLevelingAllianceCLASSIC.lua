local GoatQuest=GoatQuest
if not GoatQuest then return end
if not GQ.IsClassicSoD then return end
if UnitFactionGroup("player")~="Alliance" then return end
if GQ:DoMutex("LevelingACLASSIC") then return end
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
GoatQuest:RegisterGuide("Leveling Guides\\Human Starter (1-13)",{
image=GQ.IMAGESDIR.."Elwynn Forest",
condition_suggested=function() return raceclass('Human') and level <= 13 end,
condition_suggested_exclusive=true,
condition_visible=function() return Human end,
linked = {"Leveling Guides\\Hidden Guides"},
linkedhidden = true,
next="Leveling Guides\\Darkshore (13-22)",
},[[
defaultfor Human
step
_NOTE:_
Wrong Character Race
|tip Guide written for {o}Human{} characters.
|tip Other races may encounter issues.
Click Here to Continue |confirm
|only if not Human
step
_Destroy This Item:_
|tip Saves bag space.
|tip You'll get one later.
trash Hearthstone##6948	|q 783 |future
|only if not Warlock
step
talk Rune Broker##233335
|tip Kill enemies nearby.
|tip Sell items for money.
|tip Buy all runes and books.
Click Here to Continue |confirm |goto Elwynn Forest/0 48.22,41.47 |q 783 |future
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
Click Here to Continue |confirm |q 783 |future
|only if GQ.IsClassicSoD
step
kill Young Wolf##299+
|tip Loot items worth at least {o}10 copper{} to sell.
|tip Allows training a spell early.
|tip Increases leveling speed.
Click Here to Continue |confirm |goto Elwynn Forest/0 45.20,42.40 |q 783 |future
|mapmarker Elwynn Forest/0 46.00,36.40
|mapmarker Elwynn Forest/0 46.80,39.60
|mapmarker Elwynn Forest/0 47.40,46.80
|mapmarker Elwynn Forest/0 49.40,37.40
|mapmarker Elwynn Forest/0 50.40,44.20
|mapmarker Elwynn Forest/0 51.80,41.20
|only if Warrior or Warlock
step
talk Brother Danil##152
Sell Items |vendor Brother Danil##152 |goto Elwynn Forest/0 47.49,41.56 |q 783 |future
|only if Warrior or Warlock
step
talk Drusilla La Salle##459
|tip Outside next to the building.
Train Abilities |trainer Drusilla La Salle##459 |goto Elwynn Forest 49.87,42.65 |q 1598 |future
|only if Human Warlock
step
talk Drusilla La Salle##459
|tip Outside next to the building.
accept The Stolen Tome##1598 |goto Elwynn Forest 49.87,42.65
|only if Human Warlock
step
click Stolen Books
|tip Ignore enemies and {o}run inside the tent{}.
|tip Enemies can't hit you.
|tip Zoom camera out.
|tip From inside, click the {o}book pile (right side){} outside.
Click Here to Watch a Video |popuptext youtu.be/SEATloEvXAM
|tip Copy the link into your internet browser.
collect Powers of the Void##6785 |q 1598/1 |goto Elwynn Forest 56.74,43.77
|only if Human Warlock
step
use Hearthstone##6948
Hearth to Northshire Valley |goto Elwynn Forest/0 48.06,43.65 < 20 |noway |c |q 1598
|only if Human Warlock
step
_Destroy This Item:_
|tip Saves bag space.
|tip You'll get one later.
trash Hearthstone##6948	|q 1598
|only if Warlock
step
talk Drusilla La Salle##459
|tip Outside next to the building.
turnin The Stolen Tome##1598 |goto Elwynn Forest 49.87,42.65
|only if Human Warlock
step
Summon Your Imp |complete warlockpet("Imp") |q 783 |future
|tip Use the {o}Summon Imp{} ability.
|only if Human Warlock
step
talk Deputy Willem##823
accept A Threat Within##783 |goto Elwynn Forest 48.17,42.95
step
talk Marshal McBride##197
|tip Inside the building.
turnin A Threat Within##783 |goto Elwynn Forest 48.92,41.61
accept Kobold Camp Cleanup##7 |goto Elwynn Forest 48.92,41.61
step
talk Llane Beshere##911
|tip {o}Ground floor{} inside the building.
Train Abilities |trainer Llane Beshere##911 |goto Elwynn Forest/0 50.24,42.29 |q 7
|only if Warrior
step
talk Deputy Willem##823
accept Eagan Peltskinner##5261 |goto Elwynn Forest 48.17,42.95
step
talk Eagan Peltskinner##196
|tip Outside the building.
turnin Eagan Peltskinner##5261 |goto Elwynn Forest 48.94,40.16
accept Wolves Across the Border##33 |goto Elwynn Forest 48.94,40.16
step
kill Timber Wolf##69, Young Wolf##299
collect 8 Tough Wolf Meat##750 |q 33/1 |goto Elwynn Forest 46.80,39.60
|mapmarker Elwynn Forest/0 45.20,42.40
|mapmarker Elwynn Forest/0 46.00,36.40
|mapmarker Elwynn Forest/0 47.40,46.80
|mapmarker Elwynn Forest/0 49.40,37.40
|mapmarker Elwynn Forest/0 50.40,44.20
|mapmarker Elwynn Forest/0 51.80,41.20
step
kill 10 Kobold Vermin##6 |q 7/1 |goto Elwynn Forest 48.00,37.60
|mapmarker Elwynn Forest/0 47.40,35.00
|mapmarker Elwynn Forest/0 49.40,35.40
|mapmarker Elwynn Forest/0 50.20,37.40
step
talk Eagan Peltskinner##196
turnin Wolves Across the Border##33 |goto Elwynn Forest 48.94,40.16
step
talk Marshal McBride##197
|tip Inside the building.
turnin Kobold Camp Cleanup##7		|goto Elwynn Forest 48.92,41.61
accept Investigate Echo Ridge##15	|goto Elwynn Forest 48.92,41.61
accept Glyphic Letter##3104		|goto Elwynn Forest 48.92,41.61		|only if Mage
accept Simple Letter##3100		|goto Elwynn Forest 48.92,41.61		|only if Warrior
accept Tainted Letter##3105		|goto Elwynn Forest 48.92,41.61		|only if Warlock
accept Encrypted Letter##3102		|goto Elwynn Forest 48.92,41.61		|only if Rogue
accept Hallowed Letter##3103		|goto Elwynn Forest 48.92,41.61		|only if Priest
accept Consecrated Letter##3101		|goto Elwynn Forest 48.92,41.61		|only if Paladin
step
talk Llane Beshere##911
|tip {o}Ground floor{} inside the building.
turnin Simple Letter##3100 |goto Elwynn Forest 50.24,42.28
|only if Human Warrior
step
talk Llane Beshere##911
|tip {o}Ground floor{} inside the building.
Train Abilities |trainer Llane Beshere##911 |goto Elwynn Forest 50.24,42.28 |q 15
|only if Human Warrior
step
talk Brother Sammuel##925
|tip {o}Ground floor{} inside the building.
turnin Consecrated Letter##3101 |goto Elwynn Forest 50.43,42.12
|only if Human Paladin
step
talk Brother Sammuel##925
|tip {o}Ground floor{} inside the building.
Train Abilities |trainer Brother Sammuel##925 |goto Elwynn Forest 50.43,42.12 |q 15
|only if Human Paladin
step
talk Priestess Anetta##375
|tip {o}Ground floor{} inside the building.
turnin Hallowed Letter##3103 |goto Elwynn Forest 49.81,39.49
|only if Human Priest
step
talk Priestess Anetta##375
|tip {o}Ground floor{} inside the building.
Train Abilities |trainer Priestess Anetta##375 |goto Elwynn Forest 49.81,39.49 |q 15
|only if Human Priest
step
talk Khelden Bremen##198
|tip {o}Middle floor{} inside the building.
turnin Glyphic Letter##3104 |goto Elwynn Forest 49.66,39.41
|only if Human Mage
step
talk Khelden Bremen##198
|tip {o}Middle floor{} inside the building.
Train Abilities |trainer Khelden Bremen##198 |goto Elwynn Forest 49.66,39.41 |q 15
|only if Human Mage
step
talk Drusilla La Salle##459
|tip Outside next to the building.
turnin Tainted Letter##3105 |goto Elwynn Forest 49.87,42.65
|only if Human Warlock
step
talk Drusilla La Salle##459
|tip Outside next to the building.
Train Abilities |trainer Drusilla La Salle##459 |goto Elwynn Forest 49.87,42.65 |q 15
|only if Human Warlock
step
kill 10 Kobold Worker##257 |q 15/1 |goto Elwynn Forest 47.40,37.00
|mapmarker Elwynn Forest/0 46.40,32.40
|mapmarker Elwynn Forest/0 47.20,35.00
|mapmarker Elwynn Forest/0 48.80,33.00
|mapmarker Elwynn Forest/0 49.20,35.20
|mapmarker Elwynn Forest/0 50.40,37.20
step
talk Marshal McBride##197
|tip Inside the building.
turnin Investigate Echo Ridge##15 |goto Elwynn Forest 48.92,41.61
accept Skirmish at Echo Ridge##21 |goto Elwynn Forest 48.92,41.61
step
talk Deputy Willem##823
accept Brotherhood of Thieves##18 |goto Elwynn Forest 48.17,42.93
step
kill Defias Thug##38+
collect 12 Red Burlap Bandana##752 |q 18/1 |goto Elwynn Forest 51.40,47.00
|mapmarker Elwynn Forest/0 51.40,50.40
|mapmarker Elwynn Forest/0 53.80,44.40
|mapmarker Elwynn Forest/0 54.00,52.00
|mapmarker Elwynn Forest/0 54.20,40.40
|mapmarker Elwynn Forest/0 54.20,48.60
|mapmarker Elwynn Forest/0 57.00,42.40
|mapmarker Elwynn Forest/0 57.40,48.20
step
talk Deputy Willem##823
|tip Outside the building.
turnin Brotherhood of Thieves##18 |goto Elwynn Forest 48.17,42.94
accept Milly Osworth##3903 |goto Elwynn Forest 48.17,42.94
accept Bounty on Garrick Padfoot##6 |goto Elwynn Forest 48.17,42.94
step
talk Priestess Anetta##375
|tip {o}Ground floor{} inside the building.
accept In Favor of the Light##5623 |goto Elwynn Forest 49.81,39.49
|only if Priest
step
kill 12 Kobold Laborer##80 |q 21/1 |goto Elwynn Forest 47.67,31.86
|tip Inside the mine.
|mapmarker Elwynn Forest/0 47.40,30.20
|mapmarker Elwynn Forest/0 48.40,26.60
|mapmarker Elwynn Forest/0 49.00,29.00
step
Leave the mine |goto Elwynn Forest 47.66,31.89 < 15 |walk |only if subzone("Echo Ridge Mine") and indoors()
talk Milly Osworth##9296
|tip Outside, behind the building.
turnin Milly Osworth##3903 |goto Elwynn Forest 50.69,39.35
step
talk Jorik Kerridan##915
|tip Outside behind the building.
|tip In the stables.
turnin Encrypted Letter##3102 |goto Elwynn Forest 50.31,39.92
|only if Rogue
step
talk Jorik Kerridan##915
|tip Outside behind the building.
|tip In the stables.
Train Abilities |trainer Jorik Kerridan##915 |goto Elwynn Forest 50.31,39.92 |q 6
|only if Rogue
step
kill Garrick Padfoot##103
collect Garrick's Head##182 |q 6/1 |goto Elwynn Forest 57.51,48.25
step
talk Deputy Willem##823
turnin Bounty on Garrick Padfoot##6 |goto Elwynn Forest 48.17,42.94
step
talk Marshal McBride##197
|tip Inside the building.
turnin Skirmish at Echo Ridge##21 |goto Elwynn Forest 48.92,41.61
accept Report to Goldshire##54 |goto Elwynn Forest 48.92,41.61
step
talk Falkhaan Isenstrider##6774
accept Rest and Relaxation##2158 |goto Elwynn Forest 45.56,47.74
step
talk Marshal Dughan##240
turnin Report to Goldshire##54 |goto Elwynn Forest 42.11,65.93
accept The Fargodeep Mine##62 |goto Elwynn Forest 42.11,65.93
step
talk William Pestle##253
|tip Inside the building.
accept Kobold Candles##60 |goto Elwynn Forest 43.32,65.70
step
talk Innkeeper Farley##295
|tip Inside the building.
turnin Rest and Relaxation##2158 |goto Elwynn Forest 43.77,65.81
step
talk Maximillian Crowe##906
|tip Downstairs inside the building.
Train Abilities |trainer Maximillian Crowe##906 |goto Elwynn Forest 44.39,66.24 |q 47 |future
|only if Warlock
step
talk Cylina Darkheart##6374
|tip Buy available Grimoires.
|tip Downstairs inside the building.
Train Demon Abilities |vendor Cylina Darkheart##6374 |goto Elwynn Forest 44.40,65.99 |q 47 |future
|only if Warlock
step
talk Zaldimar Wefhellt##328
|tip Upstairs inside the building.
Train Abilities |trainer Zaldimar Wefhellt##328 |goto Elwynn Forest 43.25,66.19 |q 47 |future
|only if Mage
step
talk Priestess Josetta##377
|tip Upstairs inside the building.
turnin In Favor of the Light##5623 |goto Elwynn Forest 43.28,65.72
accept Garments of the Light##5624 |goto Elwynn Forest 43.28,65.72
|only if Human Priest
step
talk Priestess Josetta##377
|tip Upstairs inside the building.
Train Abilities |trainer Priestess Josetta##377 |goto Elwynn Forest 43.28,65.72 |q 47 |future
|only if Priest
step
Heal and Fortify Guard Roberts |q 5624/1 |goto Elwynn Forest 47.01,66.76
|tip Cast {o}Lesser Heal (Rank 2){} on Guard Roberts.
|tip Cast {o}Power Word: Fortitude{} on Guard Roberts.
|only if Human Priest
step
talk Priestess Josetta##377
|tip Upstairs inside the building.
turnin Garments of the Light##5624 |goto Elwynn Forest 43.28,65.72
|only if Human Priest
step
talk Keryn Sylvius##917
|tip Upstairs inside the building.
Train Abilities |trainer Keryn Sylvius##917 |goto Elwynn Forest 43.87,65.94 |q 47 |future
|only if Rogue
step
talk Michelle Belle##2329
|tip Upstairs inside the building.
Train First Aid |skillmax First Aid,75 |goto Elwynn Forest 43.39,65.55
|tip If possible.
|only if Warrior or Rogue
step
_NOTE:_
Create Bandages in Downtime
|tip While waiting for things like boats.
|tip Increases skill in First Aid.
|tip Need higher skill to make better bandages.
|tip Keep bandages to heal yourself.
Click Here to Continue |confirm |q 60
|only if Warrior or Rogue
step
talk Brother Wilhelm##927
Train Abilities |trainer Brother Wilhelm##927 |goto Elwynn Forest 41.10,66.04 |q 47 |future
|only if Paladin
step
talk Lyria Du Lac##913
Train Abilities |trainer Lyria Du Lac##913 |goto Elwynn Forest 41.08,65.77 |q 47 |future
|only if Warrior
step
talk Remy "Two Times"##241
accept Gold Dust Exchange##47 |goto Elwynn Forest 42.14,67.26
stickystart "Collect_Chunks_Of_Boar_Meat"
step
talk "Auntie" Bernice Stonefield##246
accept Lost Necklace##85 |goto Elwynn Forest 34.48,84.26
step
talk Billy Maclure##247
turnin Lost Necklace##85 |goto Elwynn Forest 43.13,85.72
accept Pie for Billy##86 |goto Elwynn Forest 43.13,85.72
step
talk Maybell Maclure##251
|tip Inside the building.
accept Young Lovers##106 |goto Elwynn Forest 43.15,89.62
step
label "Collect_Chunks_Of_Boar_Meat"
kill Stonetusk Boar##113+
collect 4 Chunk of Boar Meat##769 |q 86/1 |goto Elwynn Forest 41.86,87.12 |future
|tip Don't vendor them.
step
talk Tommy Joe Stonefield##252
turnin Young Lovers##106 |goto Elwynn Forest 29.84,85.99
accept Speak with Gramma##111 |goto Elwynn Forest 29.84,85.99
step
talk "Auntie" Bernice Stonefield##246
turnin Pie for Billy##86 |goto Elwynn Forest 34.48,84.26
accept Back to Billy##84 |goto Elwynn Forest 34.48,84.26
step
talk Gramma Stonefield##248
|tip Inside the building.
turnin Speak with Gramma##111 |goto Elwynn Forest 34.94,83.86
accept Note to William##107 |goto Elwynn Forest 34.94,83.86
step
talk Billy Maclure##247
turnin Back to Billy##84 |goto Elwynn Forest 43.13,85.72
accept Goldtooth##87 |goto Elwynn Forest 43.13,85.72
stickystart "Collect_Large_Candles_And_Gold_Dust"
step
Enter the mine |goto Elwynn Forest 38.97,82.33 < 15 |walk |only if not (subzone("Fargodeep Mine") and indoors())
Scout Through the Fargodeep Mine |q 62/1 |goto Elwynn Forest 39.61,80.21
|tip Inside the mine.
step
Follow the path inside the mine |goto Elwynn Forest 39.76,79.21 < 10 |walk
kill Goldtooth##327
|tip Walks around.
|tip Inside the mine.
collect Bernice's Necklace##981 |q 87/1 |goto Elwynn Forest 41.71,78.04
step
label "Collect_Large_Candles_And_Gold_Dust"
kill Kobold Tunneler##475, Kobold Miner##40
|tip Inside and outside the mine. |notinsticky
collect 8 Large Candle##772 |q 60/1 |goto Elwynn Forest 39.61,80.21
collect 10 Gold Dust##773 |q 47/1 |goto Elwynn Forest 39.61,80.21
|mapmarker Elwynn Forest/0 36.00,82.40
|mapmarker Elwynn Forest/0 36.20,79.00
|mapmarker Elwynn Forest/0 36.40,84.60
|mapmarker Elwynn Forest/0 37.40,86.80
|mapmarker Elwynn Forest/0 38.00,81.60
|mapmarker Elwynn Forest/0 38.40,77.80
|mapmarker Elwynn Forest/0 38.80,83.60
|mapmarker Elwynn Forest/0 39.00,85.60
|mapmarker Elwynn Forest/0 40.40,82.20
|mapmarker Elwynn Forest/0 40.80,77.40
|mapmarker Elwynn Forest/0 41.60,80.00
step
Leave the mine |complete not (subzone("Fargodeep Mine") and indoors())
|tip Multiple exits.
|tip Whichever you find first.
|only if haveq(62) or haveq(87) or haveq(47) or haveq(60)
step
talk "Auntie" Bernice Stonefield##246
turnin Goldtooth##87 |goto Elwynn Forest 34.49,84.25
step
Allow Enemies to Kill You
|tip No death penalty at this level.
|tip Fast travel.
|tip Inside and outside the mine.
Die on Purpose |complete isdead |goto Elwynn Forest/0 Elwynn Forest 39.61,80.21 |q 47
|mapmarker Elwynn Forest/0 36.00,82.40
|mapmarker Elwynn Forest/0 36.20,79.00
|mapmarker Elwynn Forest/0 36.40,84.60
|mapmarker Elwynn Forest/0 37.40,86.80
|mapmarker Elwynn Forest/0 38.00,81.60
|mapmarker Elwynn Forest/0 38.40,77.80
|mapmarker Elwynn Forest/0 38.80,83.60
|mapmarker Elwynn Forest/0 39.00,85.60
|mapmarker Elwynn Forest/0 40.40,82.20
|mapmarker Elwynn Forest/0 40.80,77.40
|mapmarker Elwynn Forest/0 41.60,80.00
|only if not hardcore()
step
talk Spirit Healer##6491
Select _"Return me to life."_ |gossip 96031
Resurrect at the Spirit Healer |complete not isdead |goto Elwynn Forest/0 39.48,60.53 |q 47 |zombiewalk
|only if not hardcore()
step
talk Remy "Two Times"##241
turnin Gold Dust Exchange##47 |goto Elwynn Forest/0 42.14,67.26
accept A Fishy Peril##40 |goto Elwynn Forest/0 42.14,67.26
step
talk Marshal Dughan##240
turnin A Fishy Peril##40 |goto Elwynn Forest/0 42.11,65.93
accept Further Concerns##35 |goto Elwynn Forest/0 42.11,65.93
turnin The Fargodeep Mine##62 |goto Elwynn Forest/0 42.11,65.93
accept The Jasperlode Mine##76 |goto Elwynn Forest/0 42.11,65.93
step
talk William Pestle##253
|tip Inside the building.
turnin Kobold Candles##60 |goto Elwynn Forest/0 43.32,65.70
accept Shipment to Stormwind##61 |goto Elwynn Forest/0 43.32,65.70
turnin Note to William##107 |goto Elwynn Forest/0 43.32,65.70
accept Collecting Kelp##112 |goto Elwynn Forest/0 43.32,65.70
step
talk Innkeeper Farley##295
|tip Inside the building.
home Goldshire |goto Elwynn Forest/0 43.77,65.81 |q 61 |q 4761 |future
step
talk Maximillian Crowe##906
|tip Downstairs inside the building.
Train Abilities |trainer Maximillian Crowe##906 |goto Elwynn Forest 44.39,66.24 |q 112
|only if Warlock
step
talk Cylina Darkheart##6374
|tip Buy available Grimoires.
|tip Downstairs inside the building.
Train Demon Abilities |vendor Cylina Darkheart##6374 |goto Elwynn Forest 44.40,65.99 |q 112
|only if Warlock
step
talk Zaldimar Wefhellt##328
|tip Upstairs inside the building.
Train Abilities |trainer Zaldimar Wefhellt##328 |goto Elwynn Forest 43.25,66.19 |q 112
|only if Mage
step
talk Priestess Josetta##377
|tip Upstairs inside the building.
Train Abilities |trainer Priestess Josetta##377 |goto Elwynn Forest 43.28,65.72 |q 112
|only if Priest
step
talk Keryn Sylvius##917
|tip Upstairs inside the building.
Train Abilities |trainer Keryn Sylvius##917 |goto Elwynn Forest 43.87,65.94 |q 112
|only if Rogue
step
talk Brother Wilhelm##927
Train Abilities |trainer Brother Wilhelm##927 |goto Elwynn Forest 41.10,66.04 |q 112
|only if Paladin
step
talk Lyria Du Lac##913
Train Abilities |trainer Lyria Du Lac##913 |goto Elwynn Forest 41.08,65.77 |q 112
|only if Warrior
step
kill Murloc##285, Murloc Streamrunner##735
collect 4 Crystal Kelp Frond##1256 |q 112/1 |goto Elwynn Forest 49.40,66.20
|mapmarker Elwynn Forest/0 49.80,68.40
|mapmarker Elwynn Forest/0 51.60,66.20
|mapmarker Elwynn Forest/0 52.40,68.60
|mapmarker Elwynn Forest/0 53.20,63.60
|mapmarker Elwynn Forest/0 53.80,65.80
|mapmarker Elwynn Forest/0 54.40,68.60
|mapmarker Elwynn Forest/0 55.60,66.80
|mapmarker Elwynn Forest/0 56.60,69.00
|mapmarker Elwynn Forest/0 57.60,67.00
step
Kill enemies
|tip Voidwalker class quest soon.
ding 10 |goto Elwynn Forest 49.40,66.20
|mapmarker Elwynn Forest/0 49.80,68.40
|mapmarker Elwynn Forest/0 51.60,66.20
|mapmarker Elwynn Forest/0 52.40,68.60
|mapmarker Elwynn Forest/0 53.20,63.60
|mapmarker Elwynn Forest/0 53.80,65.80
|mapmarker Elwynn Forest/0 54.40,68.60
|mapmarker Elwynn Forest/0 55.60,66.80
|mapmarker Elwynn Forest/0 56.60,69.00
|mapmarker Elwynn Forest/0 57.60,67.00
|only if Warlock
step
talk Maximillian Crowe##906
|tip Downstairs inside the building.
Train Abilities |trainer Maximillian Crowe##906 |goto Elwynn Forest 44.39,66.24 |q 76
|only if Warlock
step
talk Remen Marcot##6121
|tip Downstairs inside the building.
accept Gakin's Summons##1685 |goto Elwynn Forest 44.49,66.27
|only if Warlock
step
talk Cylina Darkheart##6374
|tip Buy available Grimoires.
|tip Downstairs inside the building.
Train Demon Abilities |vendor Cylina Darkheart##6374 |goto Elwynn Forest 44.40,65.99 |q 76
|only if Warlock
step
Enter the building |goto Stormwind City/0 29.16,74.15 < 10 |walk |only if not (subzone("The Slaughtered Lamb") and indoors())
talk Gakin the Darkbinder##6122
|tip Downstairs inside the building.
turnin Gakin's Summons##1685 |goto Stormwind City 25.26,78.56
accept Surena Caledon##1688 |goto Stormwind City 25.26,78.56
|only if Warlock
step
Stand in the Fire
|tip Use {o}Life Tap{} to die faster.
|tip Fast travel.
Die on Purpose |complete isdead |goto Stormwind City/0 25.83,78.19 |q 1688
|only if Warlock
step
Enter the mine |goto Elwynn Forest 61.71,53.87 < 10 |walk |only if not (subzone("Jasperlode Mine") and indoors())
Scout Through the Jasperlode Mine |q 76/1 |goto Elwynn Forest 60.38,49.68
|tip Inside the mine.
step
Leave the mine |goto Elwynn Forest 61.74,53.88 < 10 |walk |only if subzone("Jasperlode Mine") and indoors()
talk Guard Thomas##261
turnin Further Concerns##35 |goto Elwynn Forest 73.97,72.18
accept Find the Lost Guards##37 |goto Elwynn Forest 73.97,72.18
step
click A Half-Eaten Body
turnin Find the Lost Guards##37 |goto Elwynn Forest 72.65,60.33
accept Discover Rolf's Fate##45 |goto Elwynn Forest 72.65,60.33
step
talk Supervisor Raelen##10616
accept A Bundle of Trouble##5545 |goto Elwynn Forest 81.38,66.11
step
click Bundle of Wood+
|tip Small piles of brown logs.
|tip Near the base of trees.
collect 8 Bundle of Wood##13872 |q 5545/1 |goto Elwynn Forest 79.10,59.40
|mapmarker Elwynn Forest/0 76.00,62.30
|mapmarker Elwynn Forest/0 77.20,60.60
|mapmarker Elwynn Forest/0 78.40,62.40
|mapmarker Elwynn Forest/0 81.40,62.70
|mapmarker Elwynn Forest/0 81.80,59.10
|mapmarker Elwynn Forest/0 83.30,61.00
step
click Rolf's Corpse
turnin Discover Rolf's Fate##45 |goto Elwynn Forest 79.80,55.52
accept Report to Thomas##71 |goto Elwynn Forest 79.80,55.52
step
talk Supervisor Raelen##10616
turnin A Bundle of Trouble##5545 |goto Elwynn Forest 81.38,66.12
step
talk Sara Timberlain##278
accept Red Linen Goods##83 |goto Elwynn Forest 79.46,68.78
step
talk Guard Thomas##261
turnin Report to Thomas##71 |goto Elwynn Forest 73.97,72.18
accept Deliver Thomas' Report##39 |goto Elwynn Forest 73.97,72.18
accept Report to Gryan Stoutmantle##109 |goto Elwynn Forest 73.97,72.18
stickystart "Collect_Red_Linen_Bandanas"
step
kill Surena Caledon##881
|tip Inside the building.
collect Surena's Choker##6810 |q 1688/1 |goto Elwynn Forest 71.02,80.78
|only if Warlock
step
label "Collect_Red_Linen_Bandanas"
kill Defias Bandit##116+
collect 6 Red Linen Bandana##1019 |q 83/1 |goto Elwynn Forest 70.20,76.40
|mapmarker Elwynn Forest/0 67.00,80.20
|mapmarker Elwynn Forest/0 68.20,77.80
|mapmarker Elwynn Forest/0 68.40,75.40
|mapmarker Elwynn Forest/0 68.40,82.60
|mapmarker Elwynn Forest/0 70.60,80.60
|mapmarker Elwynn Forest/0 72.00,77.40
step
talk Sara Timberlain##278
|tip In front of the building.
turnin Red Linen Goods##83 |goto Elwynn Forest 79.46,68.79
step
talk Guard Parker##464
|tip Walks around.
accept Encroaching Gnolls##244 |goto Redridge Mountains/0 15.27,71.45
|mapmarker Redridge Mountains/0 17.20,69.60
step
talk Deputy Feldon##1070
|tip Follow the road carefully.
|tip Higher level enemies.
|tip Walks around.
turnin Encroaching Gnolls##244 |goto Redridge Mountains/0 30.74,60.00
step
talk Ariena Stormfeather##931
|tip Follow the road carefully.
|tip Higher level enemies.
fpath Lakeshire |goto Redridge Mountains 30.59,59.41
step
talk William Pestle##253
|tip Inside the building.
turnin Collecting Kelp##112 |goto Elwynn Forest/0 43.32,65.71
step
talk Maximillian Crowe##906
|tip Downstairs inside the building.
Train Abilities |trainer Maximillian Crowe##906 |goto Elwynn Forest 44.39,66.24 |q 114
|only if Warlock
step
talk Cylina Darkheart##6374
|tip Buy available Grimoires.
|tip Downstairs inside the building.
Train Demon Abilities |vendor Cylina Darkheart##6374 |goto Elwynn Forest 44.40,65.99 |q 114
|only if Warlock
step
talk Zaldimar Wefhellt##328
|tip Upstairs inside the building.
Train Abilities |trainer Zaldimar Wefhellt##328 |goto Elwynn Forest 43.25,66.19 |q 114
|only if Mage
step
talk Priestess Josetta##377
|tip Upstairs inside the building.
Train Abilities |trainer Priestess Josetta##377 |goto Elwynn Forest 43.28,65.72 |q 114
|only if Priest
step
talk Priestess Josetta##377
|tip Upstairs inside the building.
accept Desperate Prayer##5635 |goto Elwynn Forest 43.28,65.72
|only if Human Priest
step
talk Keryn Sylvius##917
|tip Upstairs inside the building.
Train Abilities |trainer Keryn Sylvius##917 |goto Elwynn Forest 43.87,65.94 |q 114
|only if Rogue
step
talk Keryn Sylvius##917
|tip Upstairs inside the building.
accept Seek out SI: 7##2205 |goto Elwynn Forest 43.87,65.94
|only if Rogue
step
talk Marshal Dughan##240
turnin Deliver Thomas' Report##39 |goto Elwynn Forest/0 42.11,65.93
turnin The Jasperlode Mine##76 |goto Elwynn Forest/0 42.11,65.93
accept Westbrook Garrison Needs Help!##239 |goto Elwynn Forest/0 42.11,65.93
step
talk Smith Argus##514
|tip Inside the building.
accept Elmore's Task##1097 |goto Elwynn Forest/0 41.71,65.55
step
talk Brother Wilhelm##927
Train Abilities |trainer Brother Wilhelm##927 |goto Elwynn Forest 41.10,66.04 |q 114
|only if Paladin
step
talk Lyria Du Lac##913
Train Abilities |trainer Lyria Du Lac##913 |goto Elwynn Forest 41.08,65.77 |q 114
|only if Warrior
step
talk Lyria Du Lac##913
accept A Warrior's Training##1638 |goto Elwynn Forest 41.09,65.77
|only if Human Warrior
step
talk Deputy Rainer##963
turnin Westbrook Garrison Needs Help!##239 |goto Elwynn Forest 24.23,74.45
step
talk Verna Furlbrow##238
accept Westfall Stew##36 |goto Westfall 59.92,19.42
step
talk Salma Saldean##235
|tip Inside the building.
turnin Westfall Stew##36 |goto Westfall 56.42,30.52
step
talk Gryan Stoutmantle##234
turnin Report to Gryan Stoutmantle##109 |goto Westfall/0 56.33,47.52
step
talk Quartermaster Lewis##491
|tip Inside the building.
accept A Swift Message##6181 |goto Westfall 57.00,47.17
step
talk Thor##523
fpath Sentinel Hill |goto Westfall 56.55,52.64
step
talk Thor##523
turnin A Swift Message##6181 |goto Westfall 56.56,52.64
accept Continue to Stormwind##6281 |goto Westfall 56.56,52.64
step
talk Thor##523
|tip Open the flight map.
|tip Allows guide to learn your flight paths.
fpath Stormwind City |goto Westfall 56.55,52.64
step
talk Morgan Pestle##279
|tip Inside the building.
turnin Shipment to Stormwind##61 |goto Stormwind City 56.21,64.59
step
talk Woo Ping##11867
|tip Inside the building.
Train Two-Handed Swords |complete weaponskill("TH_SWORD") > 0	|goto Stormwind City 57.13,57.71	|only if Warrior or Paladin
Train One-Handed Swords |complete weaponskill("SWORD") > 0	|goto Stormwind City 57.13,57.71	|only if Rogue or Warlock or Mage
Train Staves		|complete weaponskill("TH_STAFF") > 0	|goto Stormwind City 57.13,57.71	|only if Priest or Warlock
Train Daggers		|complete weaponskill("DAGGER") > 0	|goto Stormwind City 57.13,57.71	|only if Mage
|only if Warrior or Paladin or Rogue or Warlock or Mage or Priest
step
Enter the building |goto Stormwind City/0 29.16,74.15 < 10 |walk |only if not (subzone("The Slaughtered Lamb") and indoors())
talk Gakin the Darkbinder##6122
|tip Downstairs inside the building.
turnin Surena Caledon##1688 |goto Stormwind City 25.26,78.56
accept The Binding##1689 |goto Stormwind City 25.26,78.56
|only if Warlock
step
use Bloodstone Choker##6928
|tip Stand on the pink symbol.
|tip Inside the crypt.
|tip Downstairs inside the building.
kill Summoned Voidwalker##5676 |q 1689/1 |goto Stormwind City 25.11,77.46
|only if Warlock
step
talk Gakin the Darkbinder##6122
|tip Above the crypt.
|tip Downstairs inside the building.
turnin The Binding##1689 |goto Stormwind City 25.25,78.53
|only if Warlock
step
talk Master Mathias Shaw##332
|tip Upstairs inside the building.
turnin Seek out SI: 7##2205 |goto Stormwind City/0 75.78,59.84
|only if Rogue
step
talk Osric Strang##1323
|tip Inside the building.
turnin Continue to Stormwind##6281 |goto Stormwind City 74.32,47.24
accept Dungar Longdrink##6261 |goto Stormwind City/0 74.32,47.24
step
Run up the ramp |goto Stormwind City 62.42,62.28 < 10 |only if walking
talk Dungar Longdrink##352
|tip Inside the building.
turnin Dungar Longdrink##6261 |goto Stormwind City 66.27,62.13
accept Return to Lewis##6285 |goto Stormwind City 66.27,62.13
step
talk Harry Burlguard##6089
|tip Inside the building.
turnin A Warrior's Training##1638 |goto Stormwind City 74.25,37.26
accept Bartleby the Drunk##1639 |goto Stormwind City 74.25,37.26
|only if Warrior
step
talk Bartleby##6090
|tip Walks around.
|tip Inside the building.
turnin Bartleby the Drunk##1639 |goto Stormwind City 73.83,37.17
accept Beat Bartleby##1640 |goto Stormwind City 73.83,37.17
|tip You will be attacked.
|only if Warrior
step
kill Bartleby##6090
|tip Walks around.
|tip Inside the building.
Beat Bartleby |q 1640/1 |goto Stormwind City 73.83,37.17
|only if Warrior
step
talk Bartleby##6090
|tip Walks around.
|tip Inside the building.
turnin Beat Bartleby##1640 |goto Stormwind City 73.83,37.17
accept Bartleby's Mug##1665 |goto Stormwind City 73.83,37.17
|only if Warrior
step
talk Harry Burlguard##6089
|tip Inside the building.
turnin Bartleby's Mug##1665 |goto Stormwind City 74.25,37.26
|only if Warrior
step
Enter the building |goto Stormwind City/0 42.86,34.08 < 15 |walk |only if not (subzone("Cathedral of Light") and indoors())
talk High Priestess Laurena##376
|tip Inside the building.
turnin Desperate Prayer##5635 |goto Stormwind City/0 38.58,26.05
|only if Priest
step
talk Quartermaster Lewis##491
|tip Inside the building.
turnin Return to Lewis##6285 |goto Westfall 57.00,47.17
step
_NOTE:_
Use Weapon Stones
|tip We will train Mining and Blacksmithing.
|tip Allows you to make and use {o}Sharpening Stones{}.		|only if Warrior or Rogue
|tip Allows you to make and use {o}Weightstones{}.		|only if Paladin
|tip Increases damage.
|tip Mine {o}Copper Ore{} as you see it.
|tip Use the {g}Rough Stones{} to make sharpening stones.	|only if Warrior or Rogue
|tip Use the {g}Rough Stones{} to make weightstones.		|only if Paladin
Click Here to Continue |confirm |q 1097
|only if Warrior or Rogue or Paladin
step
talk Therum Deepforge##5511
Train Apprentice Blacksmithing |skillmax Blacksmithing,75 |goto Stormwind City/0 56.84,16.25
|only if Warrior or Rogue or Paladin
step
talk Brooke Stonebraid##5514
|tip Inside the building.
buy Mining Pick##2901 |goto Stormwind City/0 51.02,16.88
|only if Warrior or Rogue or Paladin
step
talk Gelman Stonehand##5513
|tip Upstiars inside the building.
Train Apprentice Mining |skillmax Mining,75 |goto Stormwind City/0 51.15,17.31
|only if Warrior or Rogue or Paladin
step
talk Grimand Elmore##1416
|tip Inside the building.
turnin Elmore's Task##1097 |goto Stormwind City 51.76,12.07
step
Enter the Deeprun Tram |complete subzone("Deeprun Tram") |goto Stormwind City 63.92,8.20 |q 983 |future
|tip Walk into the portal.
step
_Inside Deeprun Tram:_
Ride the Tram
|tip Ride the tram to Ironforge.
Enter Ironforge |complete zone("Ironforge") |q 983 |future
|tip Walk into the portal.
step
talk Bixi Wobblebonk##13084
|tip Inside the building.
Train Thrown |complete weaponskill("THROWN") > 0 |goto Ironforge 62.23,89.62
|only if Warrior
step
talk Buliwyf Stonehand##11865
|tip Inside the building.
Train Two-Handed Maces |complete weaponskill("TH_MACE") > 0 |goto Ironforge 61.17,89.52
|only if Warrior
step
talk Gryth Thurden##1573
fpath Ironforge |goto Ironforge 55.50,47.75
step
Follow the path up |goto Dun Morogh 31.06,32.56 < 7 |only if walking and not zone("Wetlands")
Continue up the path |goto Dun Morogh 31.43,32.34 < 7 |only if walking and not zone("Wetlands")
Continue up the path |goto Dun Morogh 31.14,30.50 < 7 |only if walking and not zone("Wetlands")
Follow the path down |goto Dun Morogh 32.33,28.63 < 15 |only if walking and not zone("Wetlands")
Follow the path |goto Dun Morogh 32.74,27.11 < 20 |only if walking and not zone("Wetlands")
Jump to Your Death |complete isdead |goto Eastern Kingdoms 44.92,51.98 |q 983 |future |notravel
|tip While in {o}Wetlands{}, run {o}north{}.
|tip Jump off the cliff.
|tip Easier to reach Menethil Harbor.
|only if not hardcore()
step
talk Spirit Healer##6491
Select _"Return me to life."_ |gossip 96031
Resurrect at the Spirit Healer |complete not isdead |goto Wetlands 11.72,43.30 |q 983 |future |zombiewalk
|only if not hardcore()
step
talk Shellei Brondir##1571
fpath Menethil Harbor |goto Wetlands 9.49,59.69
|only if not hardcore()
step
talk Vesprystus##3838
fpath Rut'theran Village |goto Teldrassil 58.40,94.02
]])
GoatQuest:RegisterGuide("Leveling Guides\\Dwarf & Gnome Starter (1-13)",{
image=GQ.IMAGESDIR.."Dun Morogh",
condition_suggested=function() return (raceclass('Dwarf') or raceclass('Gnome')) and level <= 13 end,
condition_suggested_exclusive=true,
condition_visible=function() return Dwarf or Gnome end,
linked = {"Leveling Guides\\Hidden Guides"},
linkedhidden = true,
next="Leveling Guides\\Darkshore (13-22)",
},[[
defaultfor Dwarf,Gnome
step
_NOTE:_
Wrong Character Race
|tip Guide written for {o}Dwarf & Gnome{} characters.
|tip Other races may encounter issues.
Click Here to Continue |confirm
|only if not (Dwarf or Gnome)
step
_Destroy This Item:_
|tip Saves bag space.
|tip You'll get one later.
trash Hearthstone##6948	|q 179 |future
|only if not hardcore()
step
_NOTE:_
Manage Your Ammo
|tip Make sure you always have ammo.
|tip You need it to attack enemies.
|tip {o}General Goods{} vendors sell it (also Bow & Gun vendors).
|tip Try to keep your ammo bag full.
Click Here to Continue |confirm |q 179 |future
|only if Hunter
step
talk Rune Broker##233335
|tip Kill enemies nearby.
|tip Sell items for money.
|tip Buy all runes and books.
Click Here to Continue |confirm |goto Dun Morogh/0 29.47,72.06 |q 179 |future
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
Click Here to Continue |confirm |q 179 |future
|only if GQ.IsClassicSoD
step
kill Ragged Young Wolf##705, Ragged Timber Wolf##704
|tip Loot items worth at least {o}10 copper{} to sell.
|tip Allows training a spell early.
Click Here to Continue |confirm |goto Dun Morogh 30.60,74.40 |q 179 |future
|mapmarker Dun Morogh/0 26.00,69.40
|mapmarker Dun Morogh/0 26.40,74.20
|mapmarker Dun Morogh/0 27.40,71.20
|mapmarker Dun Morogh/0 28.20,75.60
|mapmarker Dun Morogh/0 28.40,73.40
|mapmarker Dun Morogh/0 29.40,77.20
|mapmarker Dun Morogh/0 30.80,69.40
|mapmarker Dun Morogh/0 30.80,72.40
|only if Warrior or Warlock
step
talk Adlin Pridedrift##829
Sell Items |vendor Adlin Pridedrift##829 |goto Dun Morogh/0 30.08,71.52 |q 179 |future
|only if Warrior or Warlock
step
Enter the building |goto Dun Morogh/0 28.79,69.05 < 10 |walk |only if not (subzone("Anvilmar") and indoors())
talk Thran Khorman##912
|tip Inside the building.
Train Abilities |trainer Thran Khorman##912 |goto Dun Morogh 28.83,67.24 |q 179 |future
|only if Warrior
step
Enter the building |goto Dun Morogh/0 28.79,69.05 < 10 |walk |only if not (subzone("Anvilmar") and indoors())
talk Alamar Grimm##460
|tip Upstairs inside the building.
Train Abilities |trainer Alamar Grimm##460 |goto Dun Morogh 28.65,66.14 |q 179 |future
|only if Warlock
step
Leave the building |goto Dun Morogh 28.79,69.07 < 10 |walk |only if subzone("Anvilmar") and indoors()
talk Sten Stoutarm##658
accept Dwarven Outfitters##179 |goto Dun Morogh 29.93,71.20
step
kill Ragged Young Wolf##705, Ragged Timber Wolf##704
|tip Wolves.
collect 8 Tough Wolf Meat##750 |q 179/1 |goto Dun Morogh 30.60,74.40
|mapmarker Dun Morogh/0 26.00,69.40
|mapmarker Dun Morogh/0 26.40,74.20
|mapmarker Dun Morogh/0 27.40,71.20
|mapmarker Dun Morogh/0 28.20,75.60
|mapmarker Dun Morogh/0 28.40,73.40
|mapmarker Dun Morogh/0 29.40,77.20
|mapmarker Dun Morogh/0 30.80,69.40
|mapmarker Dun Morogh/0 30.80,72.40
step
talk Sten Stoutarm##658
turnin Dwarven Outfitters##179		|goto Dun Morogh 29.93,71.20
accept Simple Rune##3106		|goto Dun Morogh 29.93,71.20	|only Dwarf Warrior
accept Encrypted Rune##3109		|goto Dun Morogh 29.93,71.20	|only Dwarf Rogue
accept Hallowed Rune##3110		|goto Dun Morogh 29.93,71.20	|only Dwarf Priest
accept Consecrated Rune##3107		|goto Dun Morogh 29.93,71.20	|only Dwarf Paladin
accept Etched Rune##3108		|goto Dun Morogh 29.93,71.20	|only Dwarf Hunter
accept Glyphic Memorandum##3114		|goto Dun Morogh 29.93,71.20	|only Gnome Mage
accept Simple Memorandum##3112		|goto Dun Morogh 29.93,71.20	|only Gnome Warrior
accept Tainted Memorandum##3115		|goto Dun Morogh 29.93,71.20	|only Gnome Warlock
accept Encrypted Memorandum##3113	|goto Dun Morogh 29.93,71.20	|only Gnome Rogue
accept Coldridge Valley Mail Delivery##233 |goto Dun Morogh 29.93,71.20
step
talk Balir Frosthammer##713
accept A New Threat##170 |goto Dun Morogh 29.71,71.25
step
kill 6 Rockjaw Trogg##707 |q 170/1 |goto Dun Morogh/0 25.80,72.80
kill 6 Burly Rockjaw Trogg##724 |q 170/2 |goto Dun Morogh/0 25.80,72.80
|mapmarker Dun Morogh/0 20.20,71.80
|mapmarker Dun Morogh/0 21.40,77.20
|mapmarker Dun Morogh/0 23.00,73.40
|mapmarker Dun Morogh/0 24.20,71.20
step
talk Talin Keeneye##714
turnin Coldridge Valley Mail Delivery##233 |goto Dun Morogh/0 22.60,71.43
accept Coldridge Valley Mail Delivery##234 |goto Dun Morogh/0 22.60,71.43
accept The Boar Hunter##183 |goto Dun Morogh/0 22.60,71.43
step
kill 12 Small Crag Boar##708 |q 183/1 |goto Dun Morogh/0 22.20,71.20
|mapmarker Dun Morogh/0 20.00,71.40
|mapmarker Dun Morogh/0 21.20,69.40
|mapmarker Dun Morogh/0 23.40,68.40
|mapmarker Dun Morogh/0 24.20,71.20
|mapmarker Dun Morogh/0 25.40,68.40
|mapmarker Dun Morogh/0 26.20,71.20
step
talk Talin Keeneye##714
turnin The Boar Hunter##183 |goto Dun Morogh/0 22.60,71.43
step
talk Grelin Whitebeard##786
turnin Coldridge Valley Mail Delivery##234 |goto Dun Morogh/0 25.08,75.71
step
talk Nori Pridedrift##12738
accept Scalding Mornbrew Delivery##3364 |goto Dun Morogh/0 24.98,75.96
step
_NOTE:_
During the Next Steps
|tip {o}Hurry{}, timed quest.
Click Here to Continue |confirm |q 3364
step
Enter the building |goto Dun Morogh/0 28.79,69.05 < 10 |walk |only if not (subzone("Anvilmar") and indoors())
talk Durnan Furcutter##836
|tip Inside the building.
turnin Scalding Mornbrew Delivery##3364 |goto Dun Morogh/0 28.77,66.37
accept Bring Back the Mug##3365 |goto Dun Morogh/0 28.77,66.37
step
talk Thran Khorman##912
|tip Inside the building.
turnin Simple Rune##3106	|goto Dun Morogh 28.83,67.24	|only if Dwarf
turnin Simple Memorandum##3112	|goto Dun Morogh 28.83,67.24	|only if Gnome
|only if Warrior
step
talk Thran Khorman##912
|tip Inside the building.
Train Abilities |trainer Thran Khorman##912 |goto Dun Morogh 28.83,67.24 |q 170
|only if Warrior
step
talk Solm Hargrin##916
|tip Inside the building.
turnin Encrypted Rune##3109		|goto Dun Morogh 28.37,67.51	|only if Dwarf
turnin Encrypted Memorandum##3113	|goto Dun Morogh 28.37,67.51	|only if Gnome
|only if Rogue
step
talk Solm Hargrin##916
|tip Inside the building.
Train Abilities |trainer Solm Hargrin##916 |goto Dun Morogh 28.37,67.51 |q 3365
|only if Rogue
step
talk Branstock Khalder##837
|tip Inside the building.
turnin Hallowed Rune##3110 |goto Dun Morogh 28.60,66.39
|only if Priest
step
talk Branstock Khalder##837
|tip Inside the building.
Train Abilities |trainer Branstock Khalder##837 |goto Dun Morogh 28.60,66.39 |q 170
|only if Priest
step
talk Bromos Grummner##926
|tip Inside the building.
turnin Consecrated Rune##3107 |goto Dun Morogh 28.83,68.33
|only if Paladin
step
talk Bromos Grummner##926
|tip Inside the building.
Train Abilities |trainer Bromos Grummner##926 |goto Dun Morogh 28.83,68.33 |q 170
|only if Paladin
step
talk Thorgas Grimson##895
|tip Inside the building.
turnin Etched Rune##3108 |goto Dun Morogh 29.18,67.46
|only if Hunter
step
talk Thorgas Grimson##895
|tip Inside the building.
Train Abilities |trainer Thorgas Grimson##895 |goto Dun Morogh 29.18,67.46 |q 170
|only if Hunter
step
talk Marryk Nurribit##944
|tip Inside the building.
turnin Glyphic Memorandum##3114 |goto Dun Morogh 28.71,66.36
|only if Mage
step
talk Marryk Nurribit##944
|tip Inside the building.
Train Abilities |trainer Marryk Nurribit##944 |goto Dun Morogh 28.71,66.36 |q 170
|only if Mage
step
talk Alamar Grimm##460
|tip Upstairs inside the building.
turnin Tainted Memorandum##3115 |goto Dun Morogh 28.65,66.14
accept Beginnings##1599 |goto Dun Morogh 28.65,66.14
|only if Warlock
step
talk Alamar Grimm##460
|tip Upstairs inside the building.
Train Abilities |trainer Alamar Grimm##460 |goto Dun Morogh 28.65,66.14 |q 170
|only if Warlock
step
Leave the building |goto Dun Morogh 28.79,69.07 < 10 |walk |only if subzone("Anvilmar") and indoors()
talk Balir Frosthammer##713
turnin A New Threat##170 |goto Dun Morogh 29.71,71.25
step
talk Grelin Whitebeard##786
accept The Troll Cave##182 |goto Dun Morogh 25.08,75.71
step
talk Nori Pridedrift##12738
turnin Bring Back the Mug##3365 |goto Dun Morogh 24.98,75.96
stickystart "Kill_Frostmane_Troll_Whelps"
step
kill Frostmane Novice##946+
|tip Uncommon and spread out.
|tip Inside the cave.
collect 3 Feather Charm##6753 |q 1599/1 |goto Dun Morogh 26.78,79.83
|mapmarker Dun Morogh/0 28.60,83.00
|mapmarker Dun Morogh/0 30.40,79.40
|only if Warlock
step
Allow Enemies to Kill You
|tip No death penalty at this level.
|tip Fast travel.
|tip Anywhere inside the cave.
Die on Purpose |complete isdead |goto Dun Morogh 26.78,79.83 |q 1599
|only if Warlock and not hardcore()
stickystop "Kill_Frostmane_Troll_Whelps"
step
talk Spirit Healer##6491
Select _"Return me to life."_ |gossip 96031
Resurrect at the Spirit Healer |complete not isdead |goto Dun Morogh 29.55,69.83 |q 1599 |zombiewalk
|only if Warlock and not hardcore()
step
Leave the cave |goto Dun Morogh 26.78,79.83 < 15 |walk |only if (subzone("Coldridge Valley") and indoors()) and hardcore()
Enter the building |goto Dun Morogh 28.79,69.05 < 10 |walk |only if not (subzone("Anvilmar") and indoors())
talk Alamar Grimm##460
|tip Upstairs inside the building.
turnin Beginnings##1599 |goto Dun Morogh 28.65,66.14
|only if Warlock
step
talk Wren Darkspring##6376
|tip Buy available Grimoires.
|tip Upstairs inside the building.
Train Demon Abilities |vendor Wren Darkspring##6376 |goto Dun Morogh 28.80,66.16 |q 3361
|only if Warlock
step
label "Kill_Frostmane_Troll_Whelps"
Leave the building |goto Dun Morogh 28.79,69.07 < 10 |walk |only if subzone("Anvilmar") and indoors()
kill 14 Frostmane Troll Whelp##706 |q 182/1 |goto Dun Morogh 26.78,79.83
|tip Inside and outside the cave. |notinsticky
|mapmarker Dun Morogh/0 20.20,75.80
|mapmarker Dun Morogh/0 22.80,79.40
|mapmarker Dun Morogh/0 25.20,79.20
|mapmarker Dun Morogh/0 28.40,82.60
|mapmarker Dun Morogh/0 29.40,79.00
|mapmarker Dun Morogh/0 30.40,82.00
step
Leave the cave |goto Dun Morogh 26.78,79.83 < 15 |walk |only if subzone("Coldridge Valley") and indoors()
talk Grelin Whitebeard##786
turnin The Troll Cave##182 |goto Dun Morogh 25.08,75.71
accept The Stolen Journal##218 |goto Dun Morogh 25.08,75.71
step
Enter the cave |goto Dun Morogh 26.80,79.86 < 15 |walk |only if not (subzone("Coldridge Valley") and indoors())
kill Grik'nir the Cold##808
|tip Inside the cave.
collect Grelin Whitebeard's Journal##2004 |q 218/1 |goto Dun Morogh 30.49,80.16
step
Leave the cave |goto Dun Morogh 26.78,79.83 < 15 |walk |only if subzone("Coldridge Valley") and indoors()
talk Grelin Whitebeard##786
turnin The Stolen Journal##218 |goto Dun Morogh 25.08,75.71
accept Senir's Observations##282 |goto Dun Morogh 25.08,75.71
step
Allow Enemies to Kill You
|tip No death penalty at this level.
|tip Fast travel.
Die on Purpose |complete isdead |goto Dun Morogh 26.78,79.83 |q 282
|only if not hardcore()
step
talk Spirit Healer##6491
Select _"Return me to life."_ |gossip 96031
Resurrect at the Spirit Healer |complete not isdead |goto Dun Morogh 29.55,69.83 |q 282 |zombiewalk
|only if not hardcore()
step
Enter the building |goto Dun Morogh 28.79,69.05 < 10 |walk |only if not (subzone("Anvilmar") and indoors())
talk Thran Khorman##912
|tip Inside the building.
Train Abilities |trainer Thran Khorman##912 |goto Dun Morogh 28.83,67.24 |q 282
|only if Warrior
step
Enter the building |goto Dun Morogh 28.79,69.05 < 10 |walk |only if not (subzone("Anvilmar") and indoors())
talk Solm Hargrin##916
|tip Inside the building.
Train Abilities |trainer Solm Hargrin##916 |goto Dun Morogh 28.37,67.51 |q 282
|only if Rogue
step
Enter the building |goto Dun Morogh 28.79,69.05 < 10 |walk |only if not (subzone("Anvilmar") and indoors())
talk Branstock Khalder##837
|tip Inside the building.
Train Abilities |trainer Branstock Khalder##837 |goto Dun Morogh 28.60,66.39 |q 282
|only if Priest
step
Enter the building |goto Dun Morogh 28.79,69.05 < 10 |walk |only if not (subzone("Anvilmar") and indoors())
talk Bromos Grummner##926
|tip Inside the building.
Train Abilities |trainer Bromos Grummner##926 |goto Dun Morogh 28.83,68.33 |q 282
|only if Paladin
step
Enter the building |goto Dun Morogh 28.79,69.05 < 10 |walk |only if not (subzone("Anvilmar") and indoors())
talk Thorgas Grimson##895
|tip Inside the building.
Train Abilities |trainer Thorgas Grimson##895 |goto Dun Morogh 29.18,67.46 |q 282
|only if Hunter
step
Enter the building |goto Dun Morogh 28.79,69.05 < 10 |walk |only if not (subzone("Anvilmar") and indoors())
talk Marryk Nurribit##944
|tip Inside the building.
Train Abilities |trainer Marryk Nurribit##944 |goto Dun Morogh 28.71,66.36 |q 282
|only if Mage
step
Enter the building |goto Dun Morogh 28.79,69.05 < 10 |walk |only if not (subzone("Anvilmar") and indoors())
talk Alamar Grimm##460
|tip Upstairs inside the building.
Train Abilities |trainer Alamar Grimm##460 |goto Dun Morogh 28.65,66.14 |q 282
|only if Warlock
step
Leave the building |goto Dun Morogh 28.79,69.05 < 10 |walk |only if subzone("Anvilmar") and indoors()
talk Mountaineer Thalos##1965
turnin Senir's Observations##282 |goto Dun Morogh 33.48,71.84
accept Senir's Observations##420 |goto Dun Morogh 33.48,71.84
step
talk Hands Springsprocket##6782
accept Supplies to Tannok##2160 |goto Dun Morogh 33.85,72.24
stickystart "Collect_Chunks_Of_Boar_Meat_And_Crag_Boar_Ribs"
step
Run through the tunnel and follow the road |goto Dun Morogh 34.12,71.51 < 10 |only if walking and subzone("Coldridge Pass")
talk Senir Whitebeard##1252
turnin Senir's Observations##420 |goto Dun Morogh 46.73,53.83
accept Frostmane Hold##287 |goto Dun Morogh 46.73,53.83
stickystop "Collect_Chunks_Of_Boar_Meat_And_Crag_Boar_Ribs"
step
talk Ragnar Thunderbrew##1267
accept Beer Basted Boar Ribs##384 |goto Dun Morogh 46.83,52.36
step
talk Tannok Frosthammer##6806
|tip Inside the building.
turnin Supplies to Tannok##2160 |goto Dun Morogh 47.22,52.19
step
talk Maxan Anvol##1226
|tip Inside the building.
accept Accept Garments of the Light##5625 |goto Dun Morogh/0 47.34,52.19
|only if Priest
step
talk Maxan Anvol##1226
|tip Inside the building.
Train Abilities |trainer Maxan Anvol##1226 |goto Dun Morogh/0 47.34,52.19 |q 5625
|only if Priest
step
Heal and Fortify Mountaineer Dolf |q 5625/1 |goto Dun Morogh/0 45.81,54.57
|tip Cast {o}Lesser Heal (Rank 2){} on Mountaineer Dolf.
|tip Cast {o}Power Word: Fortitude{} on Mountaineer Dolf.
|only if Priest
step
talk Maxan Anvol##1226
|tip Inside the building.
turnin Accept Garments of the Light##5625 |goto Dun Morogh/0 47.34,52.19
|only if Priest
step
talk Gimrizz Shadowcog##5612
Train Abilities |trainer Gimrizz Shadowcog##5612 |goto Dun Morogh/0 47.33,53.69 |q 400 |future
|only if Warlock
step
talk Dannie Fizzwizzle##6328
|tip Buy available Grimoires.
Train Demon Abilities |vendor Dannie Fizzwizzle##6328 |goto Dun Morogh 47.28,53.67 |q 400 |future
|only if Warlock
step
talk Magis Sparkmantle##1228
|tip Upstairs inside the building.
Train Abilities |trainer Magis Sparkmantle##1228 |goto Dun Morogh/0 47.50,52.08 |q 400 |future
|only if Mage
step
talk Azar Stronghammer##1232
|tip Upstairs inside the building.
Train Abilities |trainer Azar Stronghammer##1232 |goto Dun Morogh/0 47.60,52.07 |q 400 |future
|only if Paladin
step
talk Hogral Bakkan##1234
|tip Inside the building.
Train Abilities |trainer Hogral Bakkan##1234 |goto Dun Morogh/0 47.56,52.61 |q 400 |future
|only if Rogue
step
talk Granis Swiftaxe##1229
|tip Inside the building.
Train Abilities |trainer Granis Swiftaxe##1229 |goto Dun Morogh/0 47.36,52.65 |q 400 |future
|only if Warrior
step
talk Grif Wildheart##1231
Train Abilities |trainer Grif Wildheart##1231 |goto Dun Morogh/0 45.81,53.04 |q 400 |future
|only if Hunter
step
talk Tharek Blackstone##1872
accept Tools for Steelgrill##400 |goto Dun Morogh 46.02,51.68
step
_NOTE:_
Use Weapon Stones
|tip We will train Mining and Blacksmithing.
|tip Allows you to make and use {o}Sharpening Stones{}.		|only if Warrior or Rogue
|tip Allows you to make and use {o}Weightstones{}.		|only if Paladin
|tip Increases damage.
|tip Mine {o}Copper Ore{} as you see it.
|tip Use the {g}Rough Stones{} to make sharpening stones.	|only if Warrior or Rogue
|tip Use the {g}Rough Stones{} to make weightstones.		|only if Paladin
Click Here to Continue |confirm |q 400
|only if Warrior or Rogue or Paladin
step
talk Tognus Flintfire##1241
|tip Walks around.
|tip Inside the building.
Train Apprentice Blacksmithing |skillmax Blacksmithing,75 |goto Dun Morogh/0 45.32,51.92
|only if Warrior or Rogue or Paladin
step
talk Thrawn Boltar##1690
|tip Inside the building.
buy Mining Pick##2901 |goto Dun Morogh/0 45.30,51.53
|only if Warrior or Rogue or Paladin
stickystart "Collect_Chunks_Of_Boar_Meat_And_Crag_Boar_Ribs"
step
talk Pilot Bellowfiz##1378
accept Stocking Jetsteam##317 |goto Dun Morogh 49.43,48.41
step
talk Pilot Stonegear##1377
accept The Grizzled Den##313 |goto Dun Morogh 49.62,48.61
step
talk Beldin Steelgrill##1376
turnin Tools for Steelgrill##400 |goto Dun Morogh 50.44,49.09
step
talk Loslor Rudge##1694
accept Ammo for Rumbleshot##5541 |goto Dun Morogh 50.08,49.42
step
talk Yarr Hammerstone##5392
|tip Downstairs inside the building.
Train Apprentice Mining |skillmax Mining,75 |goto Dun Morogh/0 50.01,50.31
|only if Warrior or Rogue or Paladin
stickystart "Collect_Thick_Bear_Fur"
step
click Ammo Crate
collect Rumbleshot's Ammo##13850 |q 5541/1 |goto Dun Morogh 44.14,56.94
step
kill Young Wendigo##1134, Wendigo##1135
|tip Yetis.
|tip Inside and outside the cave.
collect 8 Wendigo Mane##2671 |q 313/1 |goto Dun Morogh 42.33,54.03
|mapmarker Dun Morogh/0 39.40,46.20
|mapmarker Dun Morogh/0 39.60,48.80
|mapmarker Dun Morogh/0 41.40,51.20
|mapmarker Dun Morogh/0 41.60,45.40
|mapmarker Dun Morogh/0 41.60,49.00
step
Leave the cave |goto Dun Morogh/0 42.20,54.13 < 40 |walk |only if subzone("The Grizzled Den") and indoors()
talk Hegnar Rumbleshot##1243
turnin Ammo for Rumbleshot##5541 |goto Dun Morogh 40.68,65.13
step
label "Collect_Thick_Bear_Fur"
kill Young Black Bear##1128+
collect 2 Thick Bear Fur##6952 |q 317/2 |goto Dun Morogh 41.40,59.20
|mapmarker Dun Morogh/0 36.20,60.20
|mapmarker Dun Morogh/0 38.80,61.80
|mapmarker Dun Morogh/0 42.00,66.80
|mapmarker Dun Morogh/0 43.20,45.40
|mapmarker Dun Morogh/0 43.80,52.00
|mapmarker Dun Morogh/0 44.20,48.60
|mapmarker Dun Morogh/0 44.40,55.20
|mapmarker Dun Morogh/0 45.40,58.60
|mapmarker Dun Morogh/0 47.40,50.40
|mapmarker Dun Morogh/0 50.20,52.60
step
label "Collect_Chunks_Of_Boar_Meat_And_Crag_Boar_Ribs"
kill Crag Boar##1125, Large Crag Boar##1126
collect 4 Chunk of Boar Meat##769 |q 317/1 |goto Dun Morogh 42.60,60.20 |future
collect 6 Crag Boar Rib##2886 |q 384/1 |goto Dun Morogh 42.60,60.20 |future
|tip Don't vendor them.
|mapmarker Dun Morogh/0 36.00,62.20
|mapmarker Dun Morogh/0 39.20,63.60
|mapmarker Dun Morogh/0 39.40,60.00
|mapmarker Dun Morogh/0 41.40,57.40
|mapmarker Dun Morogh/0 42.20,66.40
|mapmarker Dun Morogh/0 44.00,52.40
|mapmarker Dun Morogh/0 44.00,55.40
|mapmarker Dun Morogh/0 44.20,63.20
|mapmarker Dun Morogh/0 45.80,59.60
|mapmarker Dun Morogh/0 47.20,63.40
|mapmarker Dun Morogh/0 47.40,48.60
|mapmarker Dun Morogh/0 48.40,55.00
|mapmarker Dun Morogh/0 49.80,51.20
step
talk Innkeeper Belm##1247
|tip Inside the building.
buy Rhapsody Malt##2894 |q 384/2 |goto Dun Morogh 47.38,52.52
step
talk Ragnar Thunderbrew##1267
turnin Beer Basted Boar Ribs##384 |goto Dun Morogh 46.83,52.36
step
talk Pilot Bellowfiz##1378
turnin Stocking Jetsteam##317 |goto Dun Morogh 49.43,48.41
accept Evershine##318 |goto Dun Morogh 49.43,48.41
step
talk Pilot Stonegear##1377
turnin The Grizzled Den##313 |goto Dun Morogh 49.62,48.61
step
Kill enemies
ding 10 |goto Dun Morogh 42.60,60.20
|tip Don't vendor them.
|mapmarker Dun Morogh/0 36.00,62.20
|mapmarker Dun Morogh/0 39.20,63.60
|mapmarker Dun Morogh/0 39.40,60.00
|mapmarker Dun Morogh/0 41.40,57.40
|mapmarker Dun Morogh/0 42.20,66.40
|mapmarker Dun Morogh/0 44.00,52.40
|mapmarker Dun Morogh/0 44.00,55.40
|mapmarker Dun Morogh/0 44.20,63.20
|mapmarker Dun Morogh/0 45.80,59.60
|mapmarker Dun Morogh/0 47.20,63.40
|mapmarker Dun Morogh/0 47.40,48.60
|mapmarker Dun Morogh/0 48.40,55.00
|mapmarker Dun Morogh/0 49.80,51.20
step
talk Gimrizz Shadowcog##5612
Train Abilities |trainer Gimrizz Shadowcog##5612 |goto Dun Morogh/0 47.33,53.69 |q 312 |future
|only if Warlock
step
talk Dannie Fizzwizzle##6328
|tip Buy available Grimoires.
Train Demon Abilities |vendor Dannie Fizzwizzle##6328 |goto Dun Morogh 47.28,53.67 |q 312 |future
|only if Warlock
step
talk Magis Sparkmantle##1228
|tip Upstairs inside the building.
Train Abilities |trainer Magis Sparkmantle##1228 |goto Dun Morogh/0 47.50,52.08 |q 312 |future
|only if Mage
step
talk Azar Stronghammer##1232
|tip Upstairs inside the building.
Train Abilities |trainer Azar Stronghammer##1232 |goto Dun Morogh/0 47.60,52.07 |q 312 |future
|only if Paladin
step
talk Maxan Anvol##1226
|tip Inside the building.
Train Abilities |trainer Maxan Anvol##1226 |goto Dun Morogh/0 47.34,52.19 |q 312 |future
|only if Priest
step
talk Maxan Anvol##1226
|tip Inside the building.
accept Desperate Prayer##5637 |goto Dun Morogh/0 47.34,52.19
|only if Dwarf Priest
step
talk Hogral Bakkan##1234
|tip Inside the building.
Train Abilities |trainer Hogral Bakkan##1234 |goto Dun Morogh/0 47.56,52.61 |q 312 |future
|only if Rogue
step
talk Granis Swiftaxe##1229
|tip Inside the building.
Train Abilities |trainer Granis Swiftaxe##1229 |goto Dun Morogh/0 47.36,52.65 |q 312 |future
|only if Warrior
step
_NOTE:_
Stronger Ammo Available
|tip Buy level 10 ammo when restocking.
Click Here to Continue |confirm |q 6064 |future
|only if Hunter
step
talk Grif Wildheart##1231
Train Abilities |trainer Grif Wildheart##1231 |goto Dun Morogh/0 45.81,53.04 |q 6064 |future
|only if Hunter
step
talk Grif Wildheart##1231
accept Taming the Beast##6064 |goto Dun Morogh 45.81,53.03
|only if Hunter
step
use Taming Rod##15911
|tip On a Large Crag Boar.
Tame a Large Crag Boar |q 6064/1 |goto Dun Morogh 49.80,53.40
|mapmarker Dun Morogh/0 46.60,63.40
|mapmarker Dun Morogh/0 48.40,47.80
|mapmarker Dun Morogh/0 49.00,58.80
|mapmarker Dun Morogh/0 49.00,61.40
|mapmarker Dun Morogh/0 50.60,47.00
|mapmarker Dun Morogh/0 51.80,50.00
|mapmarker Dun Morogh/0 53.20,47.20
|only if Hunter
step
talk Grif Wildheart##1231
turnin Taming the Beast##6064 |goto Dun Morogh 45.81,53.04
accept Taming the Beast##6084 |goto Dun Morogh 45.81,53.04
|only if Hunter
step
use Taming Rod##15913
|tip On a Snow Leopard.
Tame a Snow Leopard |q 6084/1 |goto Dun Morogh 48.20,57.40
|mapmarker Dun Morogh/0 46.80,63.60
|mapmarker Dun Morogh/0 48.20,61.00
|mapmarker Dun Morogh/0 50.40,59.40
|only if Hunter
step
talk Grif Wildheart##1231
turnin Taming the Beast##6084 |goto Dun Morogh 45.81,53.04
accept Taming the Beast##6085 |goto Dun Morogh 45.81,53.04
|only if Hunter
step
use Taming Rod##15908
|tip On an Ice Claw Bear.
Tame an Ice Claw Bear |q 6085/1 |goto Dun Morogh 50.20,53.00
|mapmarker Dun Morogh/0 46.00,63.60
|mapmarker Dun Morogh/0 49.80,58.80
|mapmarker Dun Morogh/0 48.80,62.40
|only if Hunter
step
talk Grif Wildheart##1231
turnin Taming the Beast##6085 |goto Dun Morogh 45.81,53.04
accept Training the Beast##6086 |goto Dun Morogh 45.81,53.04
|only if Hunter
step
talk Belia Thundergranite##10090
|tip Inside the building.
turnin Training the Beast##6086 |goto Ironforge 70.87,85.80
|only if Hunter
step
_NOTE:_
Train Your Pet
|tip Learn pet abilities from Pet Trainers.
|tip Cast {o}Beast Training{} to teach your pet.
Click Here to Continue |confirm |q 312 |future
|only if Hunter
step
talk Belia Thundergranite##10090
|tip Inside the building.
Train Pet Abilities |trainer Belia Thundergranite##10090 |goto Ironforge/0 70.86,85.85 |q 312 |future
|only if Hunter
step
map Ironforge/0
path	follow strict;		loop on;	ants straight;		dist 30;	markers none
path    64.25,79.01    60.42,83.77    57.40,83.98    56.75,82.18    57.71,78.38
path    61.31,73.32    64.41,69.73    66.60,69.40    67.95,71.00    67.38,74.17
path    65.72,76.92
talk Sognar Cliffbeard##5124
|tip Walks around.
buy Tough Jerky##117 |n
|tip Buy {o}20{}, if possible.
|tip Used to feed your pet soon.
Visit the Vendor |vendor Sognar Cliffbeard##5124 |q 312 |future
|only if Hunter
step
_NOTE:_
Tame an Ice Claw Bear
|tip Cast {o}Tame Beast{} on an Ice Claw Bear.
Click Here to Continue |confirm |goto Dun Morogh 51.80,44.40 |q 312 |future
|mapmarker Dun Morogh/0 45.80,53.00
|mapmarker Dun Morogh/0 50.20,53.00
|mapmarker Dun Morogh/0 55.60,43.20
|only if Hunter
step
talk Thamner Pol##2326
|tip Inside the building.
Train First Aid |skillmax First Aid,75 |goto Dun Morogh 47.18,52.61
|tip If possible.
|only if Warrior or Rogue
step
_NOTE:_
Create Bandages in Downtime
|tip While waiting for things like boats.
|tip Increases skill in First Aid.
|tip Need higher skill to make better bandages.
|tip Keep bandages to heal yourself.
Click Here to Continue |confirm |q 412 |future
|only if Warrior or Rogue
step
talk Razzle Sprysprocket##1269
|tip Inside the building.
accept Operation Recombobulation##412 |goto Dun Morogh 45.85,49.37
step
Follow the path |goto Dun Morogh 39.61,48.01 < 40 |only if walking
talk Tundra MacGrann##1266
|tip Avoid the {o}elite yeti{} that walks nearby.
|tip Top of the mountain.
accept Tundra MacGrann's Stolen Stash##312 |goto Dun Morogh 34.57,51.65
step
click MacGrann's Meat Locker
|tip Wait for the {o}elite yeti{} walk away.
|tip Inside the small cave.
collect MacGrann's Dried Meats##2667 |q 312/1 |goto Dun Morogh 38.51,53.93
|tip {o}HURRY{}.
|tip Yeti runs back quickly.
step
talk Tundra MacGrann##1266
|tip Avoid the {o}elite yeti{} that walks nearby.
|tip Top of the mountain.
turnin Tundra MacGrann's Stolen Stash##312 |goto Dun Morogh 34.57,51.65
step
talk Rejold Barleybrew##1374
turnin Evershine##318 |goto Dun Morogh 30.19,45.73
accept A Favor for Evershine##319 |goto Dun Morogh 30.19,45.73
accept The Perfect Stout##315 |goto Dun Morogh 30.19,45.73
step
talk Marleth Barleybrew##1375
accept Bitter Rivals##310 |goto Dun Morogh 30.19,45.53
step
kill Frostmane Seer##1397+
click Shimmerweed Basket+
|tip Wooden baskets.
collect 6 Shimmerweed##2676 |q 315/1 |goto Dun Morogh 40.00,42.40
|mapmarker Dun Morogh/0 41.60,43.80
|mapmarker Dun Morogh/0 42.40,35.80
|mapmarker Dun Morogh/0 42.60,33.80
step
kill 6 Ice Claw Bear##1196 |q 319/1 |goto Dun Morogh 30.40,42.20
kill 8 Elder Crag Boar##1127 |q 319/2 |goto Dun Morogh 30.40,42.20
kill 8 Snow Leopard##1201 |q 319/3 |goto Dun Morogh 30.40,42.20
|mapmarker Dun Morogh/0 25.80,46.40
|mapmarker Dun Morogh/0 26.40,55.40
|mapmarker Dun Morogh/0 28.00,42.20
|mapmarker Dun Morogh/0 28.40,52.60
|mapmarker Dun Morogh/0 28.60,47.40
|mapmarker Dun Morogh/0 30.80,35.40
|mapmarker Dun Morogh/0 31.60,38.00
|mapmarker Dun Morogh/0 32.60,47.80
|mapmarker Dun Morogh/0 34.60,31.60
|mapmarker Dun Morogh/0 34.60,35.40
|mapmarker Dun Morogh/0 35.40,46.40
|mapmarker Dun Morogh/0 37.80,34.40
|mapmarker Dun Morogh/0 37.80,42.40
step
Allow Enemies to Kill You
|tip Anywhere near {o}Brewnall Village{}.
|tip No death penalty at this level.
|tip Fast travel.
Die on Purpose |complete isdead |goto Dun Morogh 30.40,42.20 |q 319
|mapmarker Dun Morogh/0 25.80,46.40
|mapmarker Dun Morogh/0 26.40,55.40
|mapmarker Dun Morogh/0 28.00,42.20
|mapmarker Dun Morogh/0 28.40,52.60
|mapmarker Dun Morogh/0 28.60,47.40
|mapmarker Dun Morogh/0 30.80,35.40
|mapmarker Dun Morogh/0 31.60,38.00
|mapmarker Dun Morogh/0 32.60,47.80
|mapmarker Dun Morogh/0 34.60,31.60
|mapmarker Dun Morogh/0 34.60,35.40
|mapmarker Dun Morogh/0 35.40,46.40
|mapmarker Dun Morogh/0 37.80,34.40
|mapmarker Dun Morogh/0 37.80,42.40
|only if not hardcore()
step
talk Spirit Healer##6491
Select _"Return me to life."_ |gossip 96031
Resurrect at the Spirit Healer |complete not isdead |goto Dun Morogh 47.05,55.10 |q 319 |zombiewalk
|only if not hardcore()
step
talk Innkeeper Belm##1247
|tip Inside the building.
home Thunderbrew Distillery |goto Dun Morogh 47.38,52.52 |q 4761 |future
step
talk Innkeeper Belm##1247
|tip Inside the building.
buy Thunder Ale##2686 |goto Dun Morogh 47.38,52.52 |q 310
step
talk Jarven Thunderbrew##1373
|tip Downstairs inside the building.
accept Distracting Jarven##308 |goto Dun Morogh 47.64,52.66
|only if haveq(310)
step
click Unguarded Thunder Ale Barrel
|tip Takes a moment.
|tip Downstairs inside the building.
turnin Bitter Rivals##310 |goto Dun Morogh 47.70,52.69
accept Return to Marleth##311 |goto Dun Morogh 47.70,52.69
step
Follow the path |goto Dun Morogh 41.90,47.23 < 40 |only if walking
talk Marleth Barleybrew##1375
turnin Return to Marleth##311 |goto Dun Morogh 30.19,45.53
step
talk Rejold Barleybrew##1374
turnin A Favor for Evershine##319 |goto Dun Morogh 30.19,45.73
accept Return to Bellowfiz##320 |goto Dun Morogh 30.19,45.73
turnin The Perfect Stout##315 |goto Dun Morogh 30.19,45.73
stickystart "Kill_Frostmane_Headhunters"
step
Enter the cave |goto Dun Morogh 24.84,50.89 < 20 |walk |only if not (subzone("Frostmane Hold") and indoors())
Fully Explore Frostmane Hold |q 287/2 |goto Dun Morogh 22.79,52.10
|tip Downstairs inside the cave.
step
label "Kill_Frostmane_Headhunters"
kill 5 Frostmane Headhunter##1123 |q 287/1 |goto Dun Morogh 24.87,50.90
|tip Inside and outside the cave. |notinsticky
|mapmarker Dun Morogh/0 21.40,54.60
|mapmarker Dun Morogh/0 22.40,51.60
|mapmarker Dun Morogh/0 24.00,53.00
|mapmarker Dun Morogh/0 26.00,51.40
step
Leave the cave |goto Dun Morogh 25.07,50.99 < 20 |walk |only if subzone("Frostmane Hold") and indoors()
kill Leper Gnome##1211+
collect 8 Restabilization Cog##3083 |q 412/1 |goto Dun Morogh 24.40,43.00
collect 8 Gyromechanic Gear##3084 |q 412/2 |goto Dun Morogh 24.40,43.00
|mapmarker Dun Morogh/0 24.40,39.80
|mapmarker Dun Morogh/0 25.40,45.60
|mapmarker Dun Morogh/0 26.00,41.80
|mapmarker Dun Morogh/0 27.00,36.40
step
Follow the path up |goto Dun Morogh 31.06,32.56 < 7 |only if walking and not zone("Wetlands")
Continue up the path |goto Dun Morogh 31.43,32.34 < 7 |only if walking and not zone("Wetlands")
Continue up the path |goto Dun Morogh 31.14,30.50 < 7 |only if walking and not zone("Wetlands")
Follow the path down |goto Dun Morogh 32.33,28.63 < 15 |only if walking and not zone("Wetlands")
Follow the path |goto Dun Morogh 32.74,27.11 < 20 |only if walking and not zone("Wetlands")
Jump to Your Death |complete isdead |goto Wetlands 11.72,43.30 |q 412 |notravel
|tip While in {o}Wetlands{}, run {o}north{}.
|tip Jump off the cliff.
|tip Easier to reach Menethil Harbor.
|only if not hardcore()
step
talk Spirit Healer##6491
Select _"Return me to life."_ |gossip 96031
Resurrect at the Spirit Healer |complete not isdead |goto Wetlands 11.72,43.30 |q 412 |zombiewalk
|only if not hardcore()
step
Leave the building |goto Wetlands 10.25,56.45 < 10 |walk |only if subzone("Menethil Keep")
talk Shellei Brondir##1571
fpath Menethil Harbor |goto Wetlands 9.49,59.69
|only if not hardcore()
step
talk Gimrizz Shadowcog##5612
Train Abilities |trainer Gimrizz Shadowcog##5612 |goto Dun Morogh/0 47.33,53.69 |q 287
|only if Warlock
step
talk Dannie Fizzwizzle##6328
|tip Buy available Grimoires.
Train Demon Abilities |vendor Dannie Fizzwizzle##6328 |goto Dun Morogh 47.28,53.67 |q 287
|only if Warlock
step
talk Magis Sparkmantle##1228
|tip Upstairs inside the building.
Train Abilities |trainer Magis Sparkmantle##1228 |goto Dun Morogh/0 47.50,52.08 |q 287
|only if Mage
step
talk Azar Stronghammer##1232
|tip Upstairs inside the building.
Train Abilities |trainer Azar Stronghammer##1232 |goto Dun Morogh/0 47.60,52.07 |q 287
|only if Paladin
step
talk Maxan Anvol##1226
|tip Inside the building.
Train Abilities |trainer Maxan Anvol##1226 |goto Dun Morogh/0 47.34,52.19 |q 287
|only if Priest
step
talk Hogral Bakkan##1234
|tip Inside the building.
Train Abilities |trainer Hogral Bakkan##1234 |goto Dun Morogh/0 47.56,52.61 |q 287
|only if Rogue
step
talk Granis Swiftaxe##1229
|tip Inside the building.
Train Abilities |trainer Granis Swiftaxe##1229 |goto Dun Morogh/0 47.36,52.65 |q 287
|only if Warrior
step
talk Senir Whitebeard##1252
turnin Frostmane Hold##287 |goto Dun Morogh 46.73,53.82
accept The Reports##291 |goto Dun Morogh 46.73,53.82
step
talk Peria Lamenur##2878
Train Pet Abilities |trainer Peria Lamenur##2878 |goto Dun Morogh/0 46.69,54.00 |q 412
|only if Hunter
step
talk Grif Wildheart##1231
Train Abilities |trainer Grif Wildheart##1231 |goto Dun Morogh/0 45.81,53.04 |q 412
|only if Hunter
step
talk Razzle Sprysprocket##1269
|tip Inside the building.
turnin Operation Recombobulation##412 |goto Dun Morogh 45.85,49.37
step
talk Pilot Bellowfiz##1378
turnin Return to Bellowfiz##320 |goto Dun Morogh 49.43,48.41
step
talk Thorgrum Borrelson##1572
fpath Thelsamar |goto Loch Modan/0 33.94,50.95
step
talk Thorgrum Borrelson##1572
|tip Open the flight map.
|tip Allows guide to learn your flight paths.
fpath Ironforge |goto Loch Modan/0 33.94,50.95
step
talk Brock Stoneseeker##1681
|tip Walks around.
|tip Inside and outside the building.
accept Honor Students##6387 |goto Loch Modan 37.02,47.81
step
talk Thorgrum Borrelson##1572
turnin Honor Students##6387 |goto Loch Modan 33.94,50.95
accept Ride to Ironforge##6391 |goto Loch Modan 33.94,50.95
step
talk Buliwyf Stonehand##11865
|tip Inside the building.
Train Two-Handed Axes |complete weaponskill("TH_AXE") > 0 |goto Ironforge 61.17,89.52				|only if Gnome
Train Two-Handed Maces |complete weaponskill("TH_MACE") > 0 |goto Ironforge 61.17,89.52
|only if Warrior
step
talk Bixi Wobblebonk##13084
|tip Inside the building.
Train Thrown |complete weaponskill("THROWN") > 0 |goto Ironforge 62.23,89.62
|only if Warrior
step
Follow the path |goto Ironforge 44.56,49.58 < 15 |walk |only if not subzone("The High Seat")
talk Senator Barin Redstone##1274
turnin The Reports##291 |goto Ironforge 39.55,57.49
step
talk Golnir Bouldertoe##4256
|tip Downstairs inside the building.
turnin Ride to Ironforge##6391 |goto Ironforge 51.52,26.30
accept Gryth Thurden##6388 |goto Ironforge 51.52,26.30
step
talk Lago Blackwrench##6120
accept The Slaughtered Lamb##1715 |goto Ironforge 47.63,9.26
|only if Warlock
step
talk Gryth Thurden##1573
turnin Gryth Thurden##6388 |goto Ironforge 55.51,47.74
step
Enter the Deeprun Tram |complete subzone("Deeprun Tram") |goto Ironforge 76.58,51.14 |q 6661 |future
|tip Walk into the portal.
step
_Inside Deeprun Tram:_
talk Monty##12997
|tip Middle platform, near the wall.
|tip Ironforge section of the Deeprun Tram.
accept Deeprun Rat Roundup##6661
step
_Inside Deeprun Tram:_
use Rat Catcher's Flute##17117
|tip On Deeprun Rats.
|tip Small grey rats.
|tip Ironforge section of the Deeprun Tram.
Capture #5# Rats |q 6661/1
step
_Inside Deeprun Tram:_
talk Monty##12997
|tip Middle platform, near the wall.
|tip Ironforge section of the Deeprun Tram.
turnin Deeprun Rat Roundup##6661
accept Me Brother, Nipsy##6662
step
_Inside Deeprun Tram:_
Ride the Tram
|tip Ride the tram to Stormwind City.
talk Nipsy##13018
|tip Middle platform, near the wall.
|tip Stormwind City section of the Deeprun Tram.
turnin Me Brother, Nipsy##6662
step
_Inside Deeprun Tram:_
Enter Stormwind City |complete zone("Stormwind City") |q 983 |future
|tip Walk into the portal.
step
talk Ilsa Corbin##5480
|tip Upstairs inside the building.
accept A Warrior's Training##1638 |goto Stormwind City 78.50,45.71
|only if Warrior
step
talk Harry Burlguard##6089
|tip Inside the building.
turnin A Warrior's Training##1638 |goto Stormwind City 74.25,37.26
accept Bartleby the Drunk##1639 |goto Stormwind City 74.25,37.26
|only if Warrior
step
talk Bartleby##6090
|tip Walks around.
|tip Inside the building.
turnin Bartleby the Drunk##1639 |goto Stormwind City 73.83,37.17
accept Beat Bartleby##1640 |goto Stormwind City 73.83,37.17
|tip You will be attacked.
|only if Warrior
step
kill Bartleby##6090
|tip Walks around.
|tip Inside the building.
Beat Bartleby |q 1640/1 |goto Stormwind City 73.83,37.17
|only if Warrior
step
talk Bartleby##6090
|tip Walks around.
|tip Inside the building.
turnin Beat Bartleby##1640 |goto Stormwind City 73.83,37.17
accept Bartleby's Mug##1665 |goto Stormwind City 73.83,37.17
|only if Warrior
step
talk Harry Burlguard##6089
|tip Inside the building.
turnin Bartleby's Mug##1665 |goto Stormwind City 74.25,37.26
|only if Warrior
step
Enter the building |goto Stormwind City 43.05,34.48 < 15 |walk |only if not subzone("Cathedral of Light")
talk High Priestess Laurena##376
|tip Inside the building.
turnin Desperate Prayer##5637 |goto Stormwind City/0 38.58,26.06
|only if Priest
step
Enter the building |goto Stormwind City/0 29.16,74.15 < 10 |walk |only if not (subzone("The Slaughtered Lamb") and indoors())
talk Gakin the Darkbinder##6122
|tip Downstairs inside the building.
turnin The Slaughtered Lamb##1715 |goto Stormwind City 25.26,78.56
accept Surena Caledon##1688 |goto Stormwind City 25.26,78.56
|only Warlock
step
talk Woo Ping##11867
|tip Inside the building.
Train Two-Handed Swords		|complete weaponskill("TH_SWORD") > 0	|goto Stormwind City 57.13,57.71	|only if Warrior or Paladin
Train Staves			|complete weaponskill("TH_STAFF") > 0	|goto Stormwind City 57.13,57.71	|only if Warrior or Warlock or Priest
Train One-Handed Swords		|complete weaponskill("SWORD") > 0	|goto Stormwind City 57.13,57.71	|only if Warlock or Rogue or Mage
Train Daggers			|complete weaponskill("DAGGER") > 0	|goto Stormwind City 57.13,57.71	|only if Mage
|only if Warrior or Paladin or Warlock or Priest or Rogue or Mage
step
Run up the ramp |goto Stormwind City 62.39,62.31 < 10 |only if walking
talk Dungar Longdrink##352
|tip Inside the building.
fpath Stormwind |goto Stormwind City 66.27,62.14
step
talk Surena Caledon##881
|tip Inside the building.
collect Surena's Choker##6810 |q 1688/1 |goto Elwynn Forest 71.02,80.78
|only if Warlock
step
Enter the building |goto Stormwind City/0 29.16,74.15 < 10 |walk |only if not (subzone("The Slaughtered Lamb") and indoors())
talk Gakin the Darkbinder##6122
|tip Downstairs inside the building.
turnin Surena Caledon##1688 |goto Stormwind City 25.26,78.56
accept The Binding##1689 |goto Stormwind City 25.26,78.56
|only Warlock
step
use Bloodstone Choker##6928
|tip Stand on the pink symbol.
|tip Inside the crypt.
|tip Downstairs inside the building.
kill Summoned Voidwalker##5676 |q 1689/1 |goto Stormwind City 25.11,77.46
|only if Warlock
step
talk Gakin the Darkbinder##6122
|tip Above the crypt.
|tip Downstairs inside the building.
turnin The Binding##1689 |goto Stormwind City 25.25,78.53
|only if Warlock
step
talk Vesprystus##3838
fpath Rut'theran Village |goto Teldrassil 58.40,94.02
step
talk Ilyenia Moonfire##11866
Train Bows |complete weaponskill("BOW") > 0 |goto Darnassus 57.56,46.73
Train Staves |complete weaponskill("TH_STAFF") > 0 |goto Darnassus 57.56,46.73
|only if Hunter
]])
GoatQuest:RegisterGuide("Leveling Guides\\Night Elf Starter (1-13)",{
image=GQ.IMAGESDIR.."Teldrassil",
condition_suggested=function() return raceclass('NightElf') and level <= 13 end,
condition_suggested_exclusive=true,
condition_visible=function() return NightElf end,
linked = {"Leveling Guides\\Hidden Guides"},
linkedhidden = true,
next="Leveling Guides\\Darkshore (13-22)",
},[[
defaultfor NightElf
step
_NOTE:_
Wrong Character Race
|tip Guide written for {o}Night Elf{} characters.
|tip Other races may encounter issues.
Click Here to Continue |confirm
|only if not NightElf
step
_Destroy This Item:_
|tip Saves bag space.
|tip You'll get one later.
trash Hearthstone##6948 |q 456 |future
|only if not hardcore()
step
_NOTE:_
Manage Your Ammo
|tip Make sure you always have ammo.
|tip You need it to attack enemies.
|tip {o}General Goods{} vendors sell it (also Bow & Gun vendors).
|tip Try to keep your ammo bag full.
Click Here to Continue |confirm |q 456 |future
|only if Hunter
step
talk Rune Broker##233335
|tip Kill enemies nearby.
|tip Sell items for money.
|tip Buy all runes and books.
Click Here to Continue |confirm |goto Teldrassil/0 58.89,43.75 |q 456 |future
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
Click Here to Continue |confirm |q 456 |future
|only if GQ.IsClassicSoD
step
kill Young Nightsaber##2031, Young Thistle Boar##1984
|tip Loot items worth at least {o}10 copper{} to sell.
|tip Allows training a spell early.
Click Here to Continue |confirm |goto Teldrassil/0 58.20,45.40 |q 456 |future
|mapmarker Teldrassil/0 56.40,44.40
|mapmarker Teldrassil/0 60.40,44.20
|mapmarker Teldrassil/0 61.20,41.40
|mapmarker Teldrassil/0 63.00,42.60
|mapmarker Teldrassil/0 64.20,40.80
|only if Warrior
step
talk Dellylah##6091
|tip {o}Ground floor{} inside the building.
Sell Items |vendor Dellylah##6091 |goto Teldrassil/0 59.60,40.69 |q 456 |future
|only if Warrior
step
talk Alyissia##3593
|tip {o}Ground floor{} inside the building.
Train Abilities |trainer Alyissia##3593 |goto Teldrassil/0 59.64,38.44 |q 456 |future
|only if Warrior
step
talk Conservator Ilthalaine##2079
accept The Balance of Nature##456 |goto Teldrassil 58.69,44.27
step
kill 7 Young Nightsaber##2031 |q 456/1 |goto Teldrassil/0 58.20,45.40
kill 4 Young Thistle Boar##1984 |q 456/2 |goto Teldrassil/0 58.20,45.40
|mapmarker Teldrassil/0 56.40,44.40
|mapmarker Teldrassil/0 60.40,44.20
|mapmarker Teldrassil/0 61.20,41.40
|mapmarker Teldrassil/0 63.00,42.60
|mapmarker Teldrassil/0 64.20,40.80
step
talk Dirania Silvershine##8583
accept A Good Friend##4495 |goto Teldrassil 60.90,41.96
step
talk Melithar Staghelm##2077
accept The Woodland Protector##458 |goto Teldrassil 59.93,42.48
step
talk Conservator Ilthalaine##2079
turnin The Balance of Nature##456 |goto Teldrassil 58.70,44.27
accept The Balance of Nature##457 |goto Teldrassil 58.70,44.27
accept Simple Sigil##3116 |goto Teldrassil 58.70,44.27		|only if NightElf Warrior
accept Encrypted Sigil##3118 |goto Teldrassil 58.70,44.27	|only if NightElf Rogue
accept Hallowed Sigil##3119 |goto Teldrassil 58.70,44.27	|only if NightElf Priest
accept Etched Sigil##3117 |goto Teldrassil 58.70,44.27		|only if NightElf Hunter
accept Verdant Sigil##3120 |goto Teldrassil 58.70,44.27		|only if NightElf Druid
step
talk Alyissia##3593
|tip Inside the building.
turnin Simple Sigil##3116 |goto Teldrassil 59.64,38.44
|only if NightElf Warrior
step
talk Alyissia##3593
|tip {o}Ground floor{} inside the building.
Train Abilities |trainer Alyissia##3593 |goto Teldrassil/0 59.64,38.44 |q 458
|only if Warrior
step
talk Frahun Shadewhisper##3594
|tip {o}Ground floor{} inside the building.
turnin Encrypted Sigil##3118 |goto Teldrassil 59.64,38.66
accept Second-Story Work##77573 |goto Teldrassil 59.64,38.66
|only if NightElf Rogue
step
talk Frahun Shadewhisper##3594
|tip {o}Ground floor{} inside the building.
Train Abilities |trainer Frahun Shadewhisper##3594 |goto Teldrassil 59.64,38.66 |q 458
|only if Rogue
step
talk Shanda##3595
|tip Upstairs inside the building.
turnin Hallowed Sigil##3119 |goto Teldrassil 59.17,40.44
|only if NightElf Priest
step
talk Shanda##3595
|tip Upstairs inside the building.
Train Abilities |trainer Shanda##3595 |goto Teldrassil 59.17,40.44 |q 458
|only if Priest
step
Run up the large ramp |goto Teldrassil 57.53,41.63 < 15 |only if walking
talk Ayanna Everstride##3596
|tip Up in the tall tree.
|tip In a side room.
turnin Etched Sigil##3117 |goto Teldrassil 58.65,40.45
|only if NightElf Hunter
step
talk Ayanna Everstride##3596
|tip Up in the tall tree.
|tip In a side room.
Train Abilities |trainer Ayanna Everstride##3596 |goto Teldrassil 58.65,40.45 |q 458
|only if Hunter
step
Run up the large ramp |goto Teldrassil 57.53,41.63 < 15 |only if walking
talk Mardant Strongoak##3597
|tip Up in the tall tree.
|tip In a side room.
turnin Verdant Sigil##3120 |goto Teldrassil 58.63,40.29
|only if NightElf Druid
step
talk Mardant Strongoak##3597
|tip Up in the tall tree.
|tip In a side room.
Train Abilities |trainer Mardant Strongoak##3597 |goto Teldrassil 58.63,40.29 |q 458
|only if Druid
step
talk Tarindrella##1992
|tip Walks around.
turnin The Woodland Protector##458 |goto Teldrassil 57.83,45.20
accept The Woodland Protector##459 |goto Teldrassil 57.83,45.20
step
kill Grell##1988, Grellkin##1989
|tip Imps.
collect 8 Fel Moss##3297 |q 459/1 |goto Teldrassil 56.08,45.83
|mapmarker Teldrassil/0 56.40,41.40
|mapmarker Teldrassil/0 54.75,44.01
step
talk Gilshalan Windwalker##2082
accept Webwood Venom##916 |goto Teldrassil 57.81,41.65
step
kill 7 Mangy Nightsaber##2032 |q 457/1 |goto Teldrassil 59.40,37.60
kill 7 Thistle Boar##1985 |q 457/2 |goto Teldrassil 59.40,37.60
|mapmarker Teldrassil/0 58.40,35.20
|mapmarker Teldrassil/0 60.40,33.40
|mapmarker Teldrassil/0 60.60,35.60
|mapmarker Teldrassil/0 61.20,39.20
|mapmarker Teldrassil/0 62.20,34.40
|mapmarker Teldrassil/0 62.40,37.40
|mapmarker Teldrassil/0 63.60,39.40
stickystart "Collect_Webwood_Venom_Sacs"
step
talk Iverron##8584
turnin A Good Friend##4495 |goto Teldrassil 54.60,32.99
accept A Friend in Need##3519 |goto Teldrassil 54.60,32.99
step
label "Collect_Webwood_Venom_Sacs"
kill Webwood Spider##1986+
|tip Inside and outside the cave. |notinsticky
collect 10 Webwood Venom Sac##5166 |q 916/1 |goto Teldrassil 56.80,31.59
|mapmarker Teldrassil/0 55.40,28.00
|mapmarker Teldrassil/0 55.40,32.80
|mapmarker Teldrassil/0 56.20,24.80
|mapmarker Teldrassil/0 56.40,34.60
|mapmarker Teldrassil/0 57.60,27.80
|mapmarker Teldrassil/0 58.00,34.60
step
Allow Enemies to Kill You
|tip No death penalty at this level.
|tip Fast travel.
|tip Inside and outside the cave.
Die on Purpose |complete isdead |goto Teldrassil 56.80,31.59 |q 916
|mapmarker Teldrassil/0 55.40,28.00
|mapmarker Teldrassil/0 55.40,32.80
|mapmarker Teldrassil/0 56.20,24.80
|mapmarker Teldrassil/0 56.40,34.60
|mapmarker Teldrassil/0 57.60,27.80
|mapmarker Teldrassil/0 58.00,34.60
|only if not hardcore()
step
talk Spirit Healer##6491
Select _"Return me to life."_ |gossip 96031
Resurrect at the Spirit Healer |complete not isdead |goto Teldrassil/0 58.70,42.42 |q 916 |zombiewalk
|only if not hardcore()
|only if not hardcore()
step
Leave the cave |goto Teldrassil/0 56.78,31.44 < 20 |walk |only if (subzone("Shadowthread Cave") and indoors()) and hardcore()
talk Gilshalan Windwalker##2082
turnin Webwood Venom##916 |goto Teldrassil 57.81,41.65
accept Webwood Egg##917 |goto Teldrassil 57.81,41.65
step
talk Conservator Ilthalaine##2079
turnin The Balance of Nature##457 |goto Teldrassil 58.70,44.26
step
talk Tarindrella##1992
|tip Walks around.
turnin The Woodland Protector##459 |goto Teldrassil 57.83,45.20
step
talk Alyissia##3593
|tip {o}Ground floor{} inside the building.
Train Abilities |trainer Alyissia##3593 |goto Teldrassil/0 59.64,38.44 |q 3519
|only if Warrior
step
talk Frahun Shadewhisper##3594
|tip {o}Ground floor{} inside the building.
Train Abilities |trainer Frahun Shadewhisper##3594 |goto Teldrassil 59.64,38.66 |q 3519
|only if Rogue
step
talk Shanda##3595
|tip Upstairs inside the building.
Train Abilities |trainer Shanda##3595 |goto Teldrassil 59.17,40.44 |q 3519
|only if Priest
step
Run up the large ramp |goto Teldrassil 57.53,41.63 < 15 |only if walking
talk Ayanna Everstride##3596
|tip Up in the tall tree.
|tip In a side room.
Train Abilities |trainer Ayanna Everstride##3596 |goto Teldrassil 58.65,40.45 |q 3519
|only if Hunter
step
Run up the large ramp |goto Teldrassil 57.53,41.63 < 15 |only if walking
talk Mardant Strongoak##3597
|tip Up in the tall tree.
|tip In a side room.
Train Abilities |trainer Mardant Strongoak##3597 |goto Teldrassil 58.63,40.29 |q 3519
|only if Druid
step
talk Dirania Silvershine##8583
turnin A Friend in Need##3519 |goto Teldrassil 60.90,41.96
accept Iverron's Antidote##3521 |goto Teldrassil 60.90,41.96
step
click Hyacinth Mushroom+
|tip Clusters of pink mushrooms.
|tip Usually near trees.
collect 7 Hyacinth Mushroom##10639 |q 3521/1 |goto Teldrassil 62.40,44.10
|mapmarker Teldrassil/0 53.30,38.60
|mapmarker Teldrassil/0 54.50,43.20
|mapmarker Teldrassil/0 55.40,46.60
|mapmarker Teldrassil/0 56.30,39.20
|mapmarker Teldrassil/0 56.40,42.20
|mapmarker Teldrassil/0 57.30,36.90
|mapmarker Teldrassil/0 58.30,46.00
|mapmarker Teldrassil/0 58.60,41.40
|mapmarker Teldrassil/0 59.90,39.80
|mapmarker Teldrassil/0 60.40,36.30
|mapmarker Teldrassil/0 60.50,46.60
|mapmarker Teldrassil/0 60.90,30.30
|mapmarker Teldrassil/0 61.40,33.50
|mapmarker Teldrassil/0 62.90,36.00
|mapmarker Teldrassil/0 63.00,40.70
|mapmarker Teldrassil/0 63.20,38.00
|mapmarker Teldrassil/0 65.10,42.70
step
click Moonpetal Lily+
|tip Large orange flowers.
collect 4 Moonpetal Lily##10641 |q 3521/2 |goto Teldrassil 58.70,38.10
|mapmarker Teldrassil/0 56.40,38.90
|mapmarker Teldrassil/0 57.40,36.00
stickystart "Collect_Webwood_Ichor"
step
Enter the cave |goto Teldrassil 56.79,31.41 < 20 |walk |only if not (subzone("Shadowthread Cave") and indoors())
Follow the path down |goto Teldrassil 56.83,28.94 < 10 |walk
Follow the path up |goto Teldrassil 55.75,25.49 < 10 |walk
click Webwood Eggs
|tip Upstairs inside the cave.
collect Webwood Egg##5167 |q 917/1 |goto Teldrassil 56.80,26.43
step
label "Collect_Webwood_Ichor"
kill Webwood Spider##1986+
|tip Inside and outside the cave. |notinsticky
collect Webwood Ichor##10640 |q 3521/3 |goto Teldrassil 56.80,31.59
|mapmarker Teldrassil/0 55.40,28.00
|mapmarker Teldrassil/0 55.40,32.80
|mapmarker Teldrassil/0 56.20,24.80
|mapmarker Teldrassil/0 56.40,34.60
|mapmarker Teldrassil/0 57.60,27.80
|mapmarker Teldrassil/0 58.00,34.60
step
Allow Enemies to Kill You
|tip No death penalty at this level.
|tip Fast travel.
|tip Inside and outside the cave.
Die on Purpose |complete isdead |goto Teldrassil 56.80,31.59 |q 3521
|mapmarker Teldrassil/0 55.40,28.00
|mapmarker Teldrassil/0 55.40,32.80
|mapmarker Teldrassil/0 56.20,24.80
|mapmarker Teldrassil/0 56.40,34.60
|mapmarker Teldrassil/0 57.60,27.80
|mapmarker Teldrassil/0 58.00,34.60
|only if not hardcore()
step
talk Spirit Healer##6491
Select _"Return me to life."_ |gossip 96031
Resurrect at the Spirit Healer |complete not isdead |goto Teldrassil/0 58.69,42.42 |q 3521 |zombiewalk
|only if not hardcore()
step
Leave the cave |goto Teldrassil/0 56.78,31.44 < 20 |walk |only if (subzone("Shadowthread Cave") and indoors()) and hardcore()
talk Gilshalan Windwalker##2082
turnin Webwood Egg##917 |goto Teldrassil 57.81,41.65
accept Tenaron's Summons##920 |goto Teldrassil 57.81,41.65
step
Run up the large ramp |goto Teldrassil 57.54,41.62 < 15 |only if walking
talk Tenaron Stormgrip##3514
|tip Top of the tall tree.
|tip In a side room.
turnin Tenaron's Summons##920 |goto Teldrassil 59.07,39.45
accept Crown of the Earth##921 |goto Teldrassil 59.07,39.45
step
talk Dirania Silvershine##8583
turnin Iverron's Antidote##3521 |goto Teldrassil 60.90,41.96
accept Iverron's Antidote##3522 |goto Teldrassil 60.90,41.96
step
_NOTE:_
HURRY
|tip Timed quest.
Click Here to Continue |confirm |q 3522
step
use Crystal Phial##5185
collect Filled Crystal Phial##5184 |q 921/1 |goto Teldrassil 59.94,33.04
step
talk Iverron##8584
turnin Iverron's Antidote##3522 |goto Teldrassil 54.59,32.99
step
Allow Enemies to Kill You
|tip No death penalty at this level.
|tip Fast travel.
|tip Inside and outside the cave.
Die on Purpose |complete isdead |goto Teldrassil 56.80,31.59 |q 921
|mapmarker Teldrassil/0 55.40,28.00
|mapmarker Teldrassil/0 55.40,32.80
|mapmarker Teldrassil/0 56.20,24.80
|mapmarker Teldrassil/0 56.40,34.60
|mapmarker Teldrassil/0 57.60,27.80
|mapmarker Teldrassil/0 58.00,34.60
|only if not hardcore()
step
talk Spirit Healer##6491
Select _"Return me to life."_ |gossip 96031
Resurrect at the Spirit Healer |complete not isdead |goto Teldrassil/0 58.69,42.42 |q 921 |zombiewalk
|only if not hardcore()
|only if not hardcore()
step
Leave the cave |goto Teldrassil/0 56.78,31.44 < 20 |walk |only if (subzone("Shadowthread Cave") and indoors()) and hardcore()
talk Shanda##3595
|tip Upstairs inside the building.
accept In Favor of Elune##5622 |goto Teldrassil 59.17,40.44
|only if Priest
step
Leave the cave |goto Teldrassil/0 56.78,31.44 < 20 |walk |only if (subzone("Shadowthread Cave") and indoors()) and hardcore()
Run up the large ramp |goto Teldrassil 57.54,41.62 < 15 |only if walking
talk Tenaron Stormgrip##3514
|tip Top of the tall tree.
|tip In a side room.
turnin Crown of the Earth##921 |goto Teldrassil 59.07,39.45
accept Crown of the Earth##928 |goto Teldrassil 59.07,39.45
step
talk Porthannius##6780
accept Dolanaar Delivery##2159 |goto Teldrassil 61.16,47.64
step
talk Zenn Foulhoof##2150
|tip Walks around.
accept Zenn's Bidding##488 |goto Teldrassil 60.45,56.15
stickystart "Collect_Strigid_Owl_Feathers"
stickystart "Collect_Nightsaber_Fangs"
stickystart "Collect_Webwood_Spider_Silk_And_Small_Spider_Legs"
step
talk Syral Bladeleaf##2083
accept Denalan's Earth##997 |goto Teldrassil 56.08,57.73
stickystop "Collect_Strigid_Owl_Feathers"
stickystop "Collect_Nightsaber_Fangs"
stickystop "Collect_Webwood_Spider_Silk_And_Small_Spider_Legs"
step
talk Athridas Bearmantle##2078
accept A Troubling Breeze##475 |goto Teldrassil 55.95,57.28
step
talk Laurna Morninglight##3600
|tip {o}Ground floor{} inside the building.
turnin In Favor of Elune##5622 |goto Teldrassil 55.56,56.75
accept Garments of the Moon##5621 |goto Teldrassil 55.56,56.75
|only if Priest
step
talk Laurna Morninglight##3600
|tip {o}Ground floor{} inside the building.
Train Abilities |trainer Laurna Morninglight##3600 |goto Teldrassil 55.56,56.75 |q 475
|only if Priest
step
talk Byancie##6094
|tip {o}Ground floor{} inside the building.
Train First Aid |skillmax First Aid,75 |goto Teldrassil/0 55.29,56.82
|tip If possible.
|only if Warrior or Rogue
step
_NOTE:_
Create Bandages in Downtime
|tip While waiting for things like boats.
|tip Increases skill in First Aid.
|tip Need higher skill to make better bandages.
|tip Keep bandages to heal yourself.
Click Here to Continue |confirm |q 475
|only if Warrior or Rogue
step
talk Tallonkai Swiftroot##3567
|tip Top of the tower.
accept The Emerald Dreamcatcher##2438 |goto Teldrassil 55.57,56.95
step
talk Innkeeper Keldamyr##6736
|tip Upstairs inside the building.
turnin Dolanaar Delivery##2159 |goto Teldrassil 55.62,59.79
step
talk Corithras Moonrage##3515
turnin Crown of the Earth##928 |goto Teldrassil 56.14,61.71
accept Crown of the Earth##929 |goto Teldrassil 56.14,61.71
step
Heal and Fortify Sentinel Shaya |q 5621/1 |goto Teldrassil 57.24,63.51
|tip Cast {o}Lesser Heal (Rank 2){} on Sentinel Shaya.
|tip Cast {o}Power Word: Fortitude{} on Sentinel Shaya.
|only if Priest
step
talk Malorne Bladeleaf##3604
|tip Inside the building.
Learn Herbalism |skillmax Herbalism,75 |goto Teldrassil 57.72,60.64
|tip Gather {o}5 Earthroot{} as you do quests.
|tip Needed for later class quest.
|tip Once you have them, you can abandon Herbalism.
|only if Druid
stickystart "Collect_Earthroot_Druid"
step
talk Denalan##2080
|tip Walks around.
turnin Denalan's Earth##997 |goto Teldrassil 60.90,68.49
step
Watch the dialogue
talk Denalan##2080
|tip Walks around.
accept Timberling Seeds##918 |goto Teldrassil 60.80,68.54
accept Timberling Sprouts##919 |goto Teldrassil 60.80,68.54
stickystart "Collect_Timberling_Seeds"
step
click Timberling Sprout+
|tip Brown root balls.
collect 12 Timberling Sprout##5169 |q 919/1 |goto Teldrassil 62.10,68.40
|mapmarker Teldrassil/0 51.40,73.30
|mapmarker Teldrassil/0 53.00,68.90
|mapmarker Teldrassil/0 55.60,70.50
|mapmarker Teldrassil/0 57.40,64.40
|mapmarker Teldrassil/0 58.70,72.00
|mapmarker Teldrassil/0 60.10,66.00
step
label "Collect_Timberling_Seeds"
kill Timberling##2022+
collect 8 Timberling Seed##5168 |q 918/1 |goto Teldrassil 60.40,66.60
|mapmarker Teldrassil/0 54.20,66.00
|mapmarker Teldrassil/0 57.20,65.40
|mapmarker Teldrassil/0 57.40,69.20
|mapmarker Teldrassil/0 58.40,72.80
|mapmarker Teldrassil/0 59.60,63.40
|mapmarker Teldrassil/0 61.00,70.00
step
talk Denalan##2080
|tip Walks around.
turnin Timberling Seeds##918 |goto Teldrassil 60.80,68.54
accept Rellian Greenspyre##922 |goto Teldrassil 60.80,68.54
turnin Timberling Sprouts##919 |goto Teldrassil 60.80,68.54
stickystart "Collect_Strigid_Owl_Feathers"
stickystart "Collect_Nightsaber_Fangs"
stickystart "Collect_Webwood_Spider_Silk_And_Small_Spider_Legs"
step
use Jade Phial##5619
collect Filled Jade Phial##5639 |q 929/1 |goto Teldrassil 63.38,58.08
step
talk Gaerolas Talvethren##2107
|tip Upstairs inside the building.
turnin A Troubling Breeze##475 |goto Teldrassil 66.26,58.52
accept Gnarlpine Corruption##476 |goto Teldrassil 66.26,58.52
step
click Tallonkai's Dresser
|tip Inside the building.
collect Emerald Dreamcatcher##8048 |q 2438/1 |goto Teldrassil 68.01,59.63
step
label "Collect_Strigid_Owl_Feathers"
kill Strigid Owl##1995
collect 3 Strigid Owl Feather##3411 |q 488/2 |goto Teldrassil 64.60,54.60
|mapmarker Teldrassil/0 57.60,56.20
|mapmarker Teldrassil/0 58.40,60.20
|mapmarker Teldrassil/0 61.00,50.60
|mapmarker Teldrassil/0 63.00,64.00
|mapmarker Teldrassil/0 64.40,61.20
|mapmarker Teldrassil/0 67.40,52.60
|mapmarker Teldrassil/0 68.00,62.00
step
label "Collect_Nightsaber_Fangs"
kill Nightsaber##2042+
|tip Black tigers.
collect 3 Nightsaber Fang##3409 |q 488/1 |goto Teldrassil 62.00,61.00
|mapmarker Teldrassil/0 57.20,54.80
|mapmarker Teldrassil/0 58.40,57.80
|mapmarker Teldrassil/0 58.40,61.40
|mapmarker Teldrassil/0 61.20,55.40
|mapmarker Teldrassil/0 64.20,56.20
|mapmarker Teldrassil/0 66.60,51.20
|mapmarker Teldrassil/0 68.00,54.20
step
label "Collect_Webwood_Spider_Silk_And_Small_Spider_Legs"
kill Webwood Lurker##1998+
|tip Green spiders.
collect 3 Webwood Spider Silk##3412 |q 488/3 |goto Teldrassil 59.40,59.20
collect 7 Small Spider Leg##5465 |goto Teldrassil 59.40,59.20 |q 4161 |future
|tip Don't vendor them.
|mapmarker Teldrassil/0 57.40,56.40
|mapmarker Teldrassil/0 60.40,54.00
|mapmarker Teldrassil/0 62.80,63.60
|mapmarker Teldrassil/0 63.00,56.60
|mapmarker Teldrassil/0 63.20,60.60
|mapmarker Teldrassil/0 66.80,65.20
|mapmarker Teldrassil/0 67.00,61.60
step
talk Zenn Foulhoof##2150
|tip Walks around.
turnin Zenn's Bidding##488 |goto Teldrassil 60.45,56.15
step
talk Syral Bladeleaf##2083
accept Seek Redemption!##489 |goto Teldrassil 56.08,57.73
step
talk Athridas Bearmantle##2078
turnin Gnarlpine Corruption##476 |goto Teldrassil 55.95,57.28
step
talk Laurna Morninglight##3600
|tip {o}Ground floor{} inside the building.
turnin Garments of the Moon##5621 |goto Teldrassil 55.56,56.75
accept Returning Home##5629 |goto Teldrassil 55.56,56.75
|only if Priest
step
talk Laurna Morninglight##3600
|tip {o}Ground floor{} inside the building.
Train Abilities |trainer Laurna Morninglight##3600 |goto Teldrassil 55.56,56.75 |q 2438
|only if Priest
step
talk Tallonkai Swiftroot##3567
|tip Top of the tower.
turnin The Emerald Dreamcatcher##2438 |goto Teldrassil 55.57,56.95
step
talk Kyra Windblade##3598
|tip Inside the building.
accept Elanaria##1684 |goto Teldrassil 56.22,59.20
|only if Warrior
step
talk Kyra Windblade##3598
|tip Inside the building.
Train Abilities |trainer Kyra Windblade##3598 |goto Teldrassil/0 56.22,59.20 |q 929
|only if Warrior
step
talk Jannok Breezesong##3599
|tip Inside the building.
accept The Apple Falls##2241 |goto Teldrassil 56.38,60.14
|only if Rogue
step
talk Jannok Breezesong##3599
|tip Inside the building.
Train Abilities |trainer Jannok Breezesong##3599 |goto Teldrassil/0 56.38,60.14 |q 929
|tip Make sure to learn {o}Pick Pocket{}.
|tip Needed for a quest soon.
|only if Rogue
step
_NOTE:_
Stronger Ammo Available
|tip Buy level 10 ammo when restocking.
Click Here to Continue |confirm |q 929
|only if Hunter
step
talk Dazalar##3601
accept Taming the Beast##6063 |goto Teldrassil 56.68,59.49
|only if Hunter
step
talk Dazalar##3601
Train Abilities |trainer Dazalar##3601 |goto Teldrassil/0 56.68,59.49 |q 929
|only if Hunter
step
talk Keldas##3306
Train Pet Abilities |trainer Keldas##3306 |goto Teldrassil/0 56.79,59.78 |q 929
|only if Hunter
step
use Taming Rod##15921
|tip On a Webwood Lurker.
|tip Green spiders.
Tame a Webwood Lurker |q 6063/1 |goto Teldrassil 59.40,59.20
|mapmarker Teldrassil/0 57.40,56.40
|mapmarker Teldrassil/0 60.40,54.00
|mapmarker Teldrassil/0 62.80,63.60
|mapmarker Teldrassil/0 63.00,56.60
|mapmarker Teldrassil/0 63.20,60.60
|only if Hunter
step
talk Dazalar##3601
turnin Taming the Beast##6063 |goto Teldrassil 56.68,59.49
accept Taming the Beast##6101 |goto Teldrassil 56.68,59.49
|only if Hunter
step
talk Kal##3602
accept Heeding the Call##5925 |goto Teldrassil/0 55.95,61.56
|only if Druid
step
talk Kal##3602
Train Abilities |trainer Kal##3602 |goto Teldrassil/0 55.95,61.56 |q 929
|only if Druid
step
talk Corithras Moonrage##3515
turnin Crown of the Earth##929 |goto Teldrassil 56.14,61.71
step
talk Zarrin##6286
Learn Cooking |skillmax Cooking,75 |goto Teldrassil 57.12,61.30 |q 4161 |future
|tip Needed to accept a quest.
step
talk Zarrin##6286
accept Recipe of the Kaldorei##4161 |goto Teldrassil 57.12,61.30
step
talk Zarrin##6286
turnin Recipe of the Kaldorei##4161 |goto Teldrassil 57.12,61.30
step
use Taming Rod##15922
|tip On a Nightsaber Stalker.
|tip Blue leopards.
Tame a Nightsaber Stalker |q 6101/1 |goto Teldrassil/0 61.80,73.00
|mapmarker Teldrassil/0 53.40,71.60
|mapmarker Teldrassil/0 55.60,72.40
|mapmarker Teldrassil/0 63.80,70.60
|only if Hunter
step
Allow Enemies to Kill You
|tip No death penalty at this level.
|tip Fast travel.
Die on Purpose |complete isdead |goto Teldrassil/0 61.80,73.00|q 6101
|mapmarker Teldrassil/0 53.40,71.60
|mapmarker Teldrassil/0 55.60,72.40
|mapmarker Teldrassil/0 63.80,70.60
|only if Hunter and not hardcore()
step
talk Spirit Healer##6491
Select _"Return me to life."_ |gossip 96031
Resurrect at the Spirit Healer |complete not isdead |goto Teldrassil/0 56.20,63.26 |q 6101 |zombiewalk
|only if Hunter and not hardcore()
step
talk Dazalar##3601
turnin Taming the Beast##6101 |goto Teldrassil/0 56.68,59.49
accept Taming the Beast##6102 |goto Teldrassil/0 56.68,59.49
|only if Hunter
stickystart "Collect_Fel_Cones"
step
use Taming Rod##15923
|tip On a Strigid Screecher.
|tip Owls.
Tame a Strigid Screecher |q 6102/1 |goto Teldrassil/0 64.00,66.20
|mapmarker Teldrassil/0 63.80,68.60
|only if Hunter
step
label "Collect_Fel_Cones"
click Fel Cone+
|tip Small brown pine cones with green smoke.
|tip Usually near trees.
collect 3 Fel Cone##3418 |q 489/1 |goto Teldrassil/0 59.10,62.20
|mapmarker Teldrassil/0 58.10,55.40
|mapmarker Teldrassil/0 66.70,53.40
|mapmarker Teldrassil/0 61.60,53.40
|mapmarker Teldrassil/0 62.00,63.90
|mapmarker Teldrassil/0 63.60,62.30
|mapmarker Teldrassil/0 64.30,53.90
|mapmarker Teldrassil/0 64.80,50.90
|mapmarker Teldrassil/0 65.10,65.10
|mapmarker Teldrassil/0 66.20,60.90
|mapmarker Teldrassil/0 68.60,57.90
|mapmarker Teldrassil/0 68.80,55.70
|mapmarker Teldrassil/0 69.00,59.70
step
talk Zenn Foulhoof##2150
|tip Walks around.
turnin Seek Redemption!##489 |goto Teldrassil/0 60.45,56.15
step
talk Dazalar##3601
turnin Taming the Beast##6102 |goto Teldrassil/0 56.68,59.49
accept Training the Beast##6103 |goto Teldrassil/0 56.68,59.49
|only if Hunter
step
Allow Enemies to Kill You
|tip Must be near here.
|tip Fast travel.
Die on Purpose |complete isdead |goto Teldrassil/0 42.77,52.55 |q 922
|only if not hardcore()
step
talk Spirit Healer##6491
Select _"Return me to life."_ |gossip 96031
Resurrect at the Spirit Healer |complete not isdead |goto Darnassus/0 76.97,27.20 |q 922 |zombiewalk
|only if not hardcore()
step
talk Rellian Greenspyre##3517
turnin Rellian Greenspyre##922 |goto Darnassus 38.19,21.63
accept Tumors##923 |goto Darnassus 38.19,21.63
step
talk Jocaste##4146
|tip Inside the building.
turnin Training the Beast##6103 |goto Darnassus 40.38,8.55
|only if Hunter
step
_NOTE:_
Train Your Pet
|tip Learn pet abilities from Pet Trainers.
|tip Cast {o}Beast Training{} to teach your pet.
Click Here to Continue |confirm |q 923
|only if Hunter
step
Enter the cave in the tree trunk |goto Darnassus 32.12,16.46 < 7 |walk
talk Syurna##4163
|tip Inside the cave.
turnin The Apple Falls##2241 |goto Darnassus 36.99,21.91
accept Destiny Calls##2242 |goto Darnassus 36.99,21.91
|only if Rogue
step
talk Mathrengyl Bearwalker##4217
|tip {o}Middle floor{} inside the building.
accept Moonglade##5921 |goto Darnassus 35.37,8.40
|only if Druid
step
talk Priestess A'moora##7313
|tip Upstairs inside the building.
accept Tears of the Moon##2518 |goto Darnassus 36.64,85.93
step
talk Priestess Alathea##11401
|tip Upstairs inside the building.
turnin Returning Home##5629 |goto Darnassus 39.53,81.18
accept Stars of Elune##5627 |goto Darnassus 39.53,81.18 |instant
|only if Priest
step
talk Dendrite Starblaze##11802
|tip Upstairs inside the building.
turnin Moonglade##5921 |goto Moonglade 56.21,30.64
accept Great Bear Spirit##5929 |goto Moonglade 56.21,30.64
|only if Druid
step
talk Great Bear Spirit##11956
Select _"What do you represent, spirit?"_
Seek Out the Great Bear Spirit and Learn what it Has to Share with You About the Nature of the Bear |q 5929/1 |goto Moonglade 39.11,27.51
|only if Druid
step
talk Dendrite Starblaze##11802
|tip Upstairs inside the building.
turnin Great Bear Spirit##5929 |goto Moonglade 56.21,30.64
accept Back to Darnassus##5931 |goto Moonglade 56.21,30.64
|only if Druid
step
talk Sindrayl##10897
fpath Moonglade |goto Moonglade 48.10,67.34
|only if Druid
step
talk Mathrengyl Bearwalker##4217
|tip {o}Middle floor{} inside the building.
turnin Back to Darnassus##5931 |goto Darnassus 35.38,8.41
accept Body and Heart##6001 |goto Darnassus 35.38,8.41
|only if Druid
step
talk Elanaria##4088
turnin Elanaria##1684 |goto Darnassus 57.30,34.61
accept Vorlus Vilehoof##1683 |goto Darnassus 57.30,34.61
|only if Warrior
step
talk Ilyenia Moonfire##11866
Train Thrown	|complete weaponskill("THROWN") > 0	|goto Darnassus 57.56,46.73	|only if Warrior
Train Staves	|complete weaponskill("TH_STAFF") > 0	|goto Darnassus 57.56,46.73	|only if Warrior or Hunter or Priest
Train Bows	|complete weaponskill("BOW") > 0	|goto Darnassus 57.56,46.73	|only if Rogue
|only if Warrior or Hunter or Priest or Rogue
step
Run around the mountain and follow the path up |goto Teldrassil 48.68,62.73 < 15 |only if walking
kill Vorlus Vilehoof##6128
collect Horn of Vorlus##6805 |q 1683/1 |goto Teldrassil 47.25,63.60
|only if Warrior
step
_NOTE:_
Tame a Strigid Hunter
|tip Cast {o}Tame Beast{} on a {o}Strigid Hunter{}.
|tip Owls.
Click Here to Continue |confirm |goto Teldrassil/0 40.80,44.80 |q 2518
|mapmarker Teldrassil/0 37.20,29.20
|mapmarker Teldrassil/0 37.40,37.40
|mapmarker Teldrassil/0 38.20,32.60
|mapmarker Teldrassil/0 40.80,30.20
|mapmarker Teldrassil/0 41.80,37.60
|mapmarker Teldrassil/0 44.20,40.00
|mapmarker Teldrassil/0 45.80,30.40
|only if Hunter
stickystart "Collect_Mossy_Tumors"
step
kill Lady Sathrah##7319
|tip Large grey spider.
|tip Walks around.
|tip Multiple locations.
collect Silvery Spinnerets##8344 |q 2518/1 |goto Teldrassil 48.00,25.20
|mapmarker Teldrassil/0 39.20,25.40
|mapmarker Teldrassil/0 41.00,25.60
|mapmarker Teldrassil/0 46.20,24.40
step
collect Sethir's Journal##7737 |q 2242/1 |goto Teldrassil 37.52,24.29
|tip Cast {o}Pickpocket{} on {o}Sethir the Ancient{}.
|tip Purple satyr.
|tip Stands here and walks onto the {o}huge tree branch{} nearby.
|tip {o}Don't attack{}, he summons a group of enemies.
|mapmarker Teldrassil/0 37.20,23.00
|mapmarker Teldrassil/0 37.40,21.20
|only if Rogue
step
label "Collect_Mossy_Tumors"
kill Timberling Trampler##2027, Timberling Mire Beast##2029, Elder Timberling##2030
|tip Swamp elementals.
collect 5 Mossy Tumor##5170 |q 923/1 |goto Teldrassil 42.00,43.60
|mapmarker Teldrassil/0 41.40,41.40
|mapmarker Teldrassil/0 42.00,37.40
|mapmarker Teldrassil/0 43.40,40.20
|mapmarker Teldrassil/0 44.00,43.60
|mapmarker Teldrassil/0 52.40,73.80
|mapmarker Teldrassil/0 41.40,33.40
|mapmarker Teldrassil/0 42.80,29.20
|mapmarker Teldrassil/0 43.20,31.80
|mapmarker Teldrassil/0 43.20,35.80
|mapmarker Teldrassil/0 42.20,25.40
|mapmarker Teldrassil/0 44.20,26.60
step
talk Sentinel Arynia Cloudsbreak##3519
accept The Enchanted Glade##937 |goto Teldrassil 38.31,34.36
stickystart "Collect_Bloodfeather_Belts"
step
talk Mist##3568
|tip Escort quest.
|tip Wait until she respawns, if missing.
accept Mist##938 |goto Teldrassil 31.54,31.61 |noautoaccept inparty
step
Lead Mist Safely to Sentinel Arynia Cloudsbreak |q 938/1 |goto Teldrassil 38.31,34.36
|tip {o}Hurry{}, timed quest.
step
Watch the dialogue
talk Sentinel Arynia Cloudsbreak##3519
turnin Mist##938 |goto Teldrassil 38.31,34.36
step
label "Collect_Bloodfeather_Belts"
kill Bloodfeather Rogue##2017, Bloodfeather Sorceress##2018, Bloodfeather Harpy##2015, Bloodfeather Fury##2019, Bloodfeather Matriarch##2021, Bloodfeather Wind Witch##2020
|tip Harpies.
collect 6 Bloodfeather Belt##5204 |q 937/1 |goto Teldrassil 35.40,36.40
|mapmarker Teldrassil/0 33.40,35.60
|mapmarker Teldrassil/0 34.20,33.40
|mapmarker Teldrassil/0 35.20,38.80
|mapmarker Teldrassil/0 36.40,41.60
|mapmarker Teldrassil/0 37.20,43.60
|mapmarker Teldrassil/0 37.60,37.80
|mapmarker Teldrassil/0 38.20,40.40
step
talk Sentinel Arynia Cloudsbreak##3519
turnin The Enchanted Glade##937 |goto Teldrassil 38.31,34.36
accept Teldrassil##940 |goto Teldrassil 38.31,34.36
step
label "Collect_Earthroot_Druid"
collect 5 Earthroot##2449 |goto Teldrassil/0 44.70,39.30 |q 6123 |future
|tip {o}Track Herbs{} with Herbalism.
|tip Gather as you quest in Teldrassil.
|tip Reach {o}level 15{} Herbalism.
|tip Needed to gather Earthroot.
|tip You can abandon Herbalism once finished.
|tip Don't vendor them.
|mapmarker Teldrassil/0 34.80,35.80
|mapmarker Teldrassil/0 35.10,39.80
|mapmarker Teldrassil/0 36.30,42.40
|mapmarker Teldrassil/0 37.60,27.30
|mapmarker Teldrassil/0 38.60,39.40
|mapmarker Teldrassil/0 39.60,29.60
|mapmarker Teldrassil/0 40.10,26.40
|mapmarker Teldrassil/0 40.10,48.00
|mapmarker Teldrassil/0 40.50,41.80
|mapmarker Teldrassil/0 41.30,35.40
|mapmarker Teldrassil/0 41.40,30.60
|mapmarker Teldrassil/0 44.30,36.00
|mapmarker Teldrassil/0 44.30,48.70
|mapmarker Teldrassil/0 44.40,31.40
|mapmarker Teldrassil/0 44.90,46.70
|mapmarker Teldrassil/0 45.20,25.90
|mapmarker Teldrassil/0 46.30,37.30
|mapmarker Teldrassil/0 46.60,31.20
|mapmarker Teldrassil/0 47.00,41.50
|mapmarker Teldrassil/0 47.70,33.40
|mapmarker Teldrassil/0 48.00,45.10
|mapmarker Teldrassil/0 48.50,27.90
|only if Druid
step
Allow Enemies to Kill You
|tip Must be near here.
|tip No death penalty at this level.
|tip Fast travel.
Die on Purpose |complete isdead |goto Teldrassil 35.40,36.40 |q 2518
|mapmarker Teldrassil/0 33.40,35.60
|mapmarker Teldrassil/0 34.20,33.40
|mapmarker Teldrassil/0 35.20,38.80
|mapmarker Teldrassil/0 36.40,41.60
|mapmarker Teldrassil/0 37.20,43.60
|mapmarker Teldrassil/0 37.60,37.80
|mapmarker Teldrassil/0 38.20,40.40
|only if not hardcore()
step
talk Spirit Healer##6491
Select _"Return me to life."_ |gossip 96031
Resurrect at the Spirit Healer |complete not isdead |goto Darnassus/0 77.02,27.08 |q 2518 |zombiewalk
|only if not hardcore()
step
talk Mydrannul##4241
accept Nessa Shadowsong##6344 |goto Darnassus 70.68,45.38
step
talk Elanaria##4088
turnin Vorlus Vilehoof##1683 |goto Darnassus 57.30,34.61
|only if Warrior
step
talk Arias'ta Bladesinger##4087
Train Abilities |trainer Arias'ta Bladesinger##4087 |goto Darnassus/0 58.70,34.92 |q 923
|only if Warrior
step
talk Rellian Greenspyre##3517
turnin Tumors##923 |goto Darnassus 38.19,21.64
step
Enter the cave in the tree trunk |goto Darnassus 32.12,16.46 < 7 |walk
talk Syurna##4163
|tip Inside the cave.
turnin Destiny Calls##2242 |goto Darnassus 36.99,21.91
|only if Rogue
step
talk Syurna##4163
|tip Inside the cave.
Train Abilities |trainer Syurna##4163 |goto Darnassus 36.99,21.91 |q 940
|only if Rogue
step
talk Jocaste##4146
|tip Upstairs inside the building.
Train Abilities |trainer Jocaste##4146 |goto Darnassus/0 40.38,8.54 |q 940
|only if Hunter
step
talk Silvaria##10089
|tip Top of the building.
Train Pet Abilities |trainer Silvaria##10089 |goto Darnassus/0 42.47,9.17 |q 940
|only if Hunter
step
talk Denatharion##4218
|tip {o}Ground floor{} inside the building.
Train Abilities |trainer Denatharion##4218 |goto Darnassus/0 34.77,7.37 |q 940
|only if Druid
step
talk Arch Druid Fandral Staghelm##3516
|tip Walks around.
|tip Top of the tower.
turnin Teldrassil##940 |goto Darnassus 34.80,9.24
accept Grove of the Ancients##952 |goto Darnassus 34.80,9.24
step
talk Jandria##4091
|tip Inside the building.
Train Abilities |trainer Jandria##4091 |goto Darnassus/0 37.90,82.73 |q 2518
|only if Priest
step
talk Priestess A'moora##7313
|tip Upstairs inside the building.
turnin Tears of the Moon##2518 |goto Darnassus 36.64,85.93
accept Sathrah's Sacrifice##2520 |goto Darnassus 36.64,85.93
step
use Sathrah's Sacrifice##8155
|tip Inside the building.
Offer the Sacrifice at the Fountain |q 2520/1 |goto Darnassus 39.21,84.57
step
talk Priestess A'moora##7313
|tip Upstairs inside the building.
turnin Sathrah's Sacrifice##2520 |goto Darnassus 36.64,85.93
step
talk Nessa Shadowsong##10118
turnin Nessa Shadowsong##6344 |goto Teldrassil 56.25,92.43
accept The Bounty of Teldrassil##6341 |goto Teldrassil 56.25,92.43
step
talk Vesprystus##3838
turnin The Bounty of Teldrassil##6341 |goto Teldrassil 58.40,94.01
accept Flight to Auberdine##6342 |goto Teldrassil 58.40,94.01
step
talk Vesprystus##3838
|tip Open the flight map.
fpath Auberdine |goto Teldrassil 58.40,94.01
step
talk Laird##4200
|tip Inside the building.
turnin Flight to Auberdine##6342 |goto Darkshore 36.77,44.29
accept Return to Nessa##6343 |goto Darkshore/0 36.77,44.28
step
talk Nessa Shadowsong##10118
turnin Return to Nessa##6343 |goto Teldrassil/0 56.25,92.44
step
_NOTE:_
Use Weapon Stones
|tip We will train Mining and Blacksmithing.
|tip Allows you to make and use {o}Sharpening Stones{}.		|only if Warrior or Rogue
|tip Increases damage.
|tip Mine {o}Copper Ore{} as you see it.
|tip Use the {g}Rough Stones{} to make sharpening stones.	|only if Warrior or Rogue
Click Here to Continue |confirm |q 3524 |future
|only if Warrior or Rogue
step
talk Delfrum Flintbeard##6299
Train Apprentice Blacksmithing |skillmax Blacksmithing,75 |goto Darkshore/0 38.19,40.94
|only if Warrior or Rogue
step
talk Kurdram Stonehammer##6297
Train Apprentice Mining |skillmax Mining,75 |goto Darkshore/0 38.25,41.01
|only if Warrior or Rogue
step
talk Thelgrum Stonehammer##6298
buy Mining Pick##2901 |goto Darkshore/0 38.22,41.19
|only if Warrior or Rogue
]])
GoatQuest:RegisterGuide("Leveling Guides\\Darkshore (13-22)",{
image=GQ.IMAGESDIR.."Darkshore",
next="Leveling Guides\\Wetlands (22-26)",
},[[
step
talk Wizbang Cranktoggle##3666
|tip Upstairs inside the building.
accept Buzzbox 827##983 |goto Darkshore/0 36.98,44.14
step
talk Laird##4200
buy Longjaw Mud Snapper##4592+ |n
|tip Buy {o}20{}, if possible.
|tip Needed to feed your pet soon.
Visit the Vendor |vendor Laird##4200 |goto Darkshore 36.77,44.29 |q 983
|only if Hunter
step
talk Tharnariun Treetender##3701
accept Plagued Lands##2118 |goto Darkshore/0 38.84,43.42
step
talk Terenthis##3693
|tip Inside the building.
accept How Big a Threat?##984 |goto Darkshore/0 39.37,43.48
step
talk Gwennyth Bly'Leggonde##10219
accept Washed Ashore##3524 |goto Darkshore/0 36.62,45.59
step
talk Caylais Moonfeather##3841
fpath Auberdine |goto Darkshore/0 36.34,45.58
step
_NOTE:_
Attack a Thistle Bear
|tip Find one that's {o}level 12{}.
|tip Make your pet attack a Thistle Bear.
|tip Thistle Bear does a {o}stun attack{}.
|tip Wait for your pet to get {o}stunned{}, then {o}abandon it{}.
Tame the Thistle Bear
|tip Cast {o}Tame Beast{} on the Thistle Bear.
|tip It shouldn't stun you.
|tip New permanent pet.
Click Here to Continue |confirm |goto Darkshore/0 38.40,46.20 |q 983
|mapmarker Darkshore/0 37.20,49.60
|mapmarker Darkshore/0 39.80,51.60
|mapmarker Darkshore/0 40.40,42.60
|mapmarker Darkshore/0 41.20,48.80
|mapmarker Darkshore/0 41.80,45.40
|mapmarker Darkshore/0 43.80,42.40
|only if Hunter
stickystart "Collect_Crawler_Legs"
step
click Beached Sea Creature
collect Sea Creature Bones##12242 |q 3524/1 |goto Darkshore 36.39,50.88
step
label "Collect_Crawler_Legs"
kill Pygmy Tide Crawler##2231, Young Reef Crawler##2234
|tip Crabs.
|tip More in the water. |notinsticky
collect 6 Crawler Leg##5385 |q 983/1 |goto Darkshore 37.60,53.40
|mapmarker Darkshore/0 34.80,47.00
|mapmarker Darkshore/0 35.20,53.40
|mapmarker Darkshore/0 35.40,55.40
|mapmarker Darkshore/0 35.80,58.60
|mapmarker Darkshore/0 36.40,51.40
|mapmarker Darkshore/0 36.80,60.60
|mapmarker Darkshore/0 36.60,48.20
step
Find a Corrupt Furbolg Camp |q 984/1 |goto Darkshore 38.95,53.57
step
label "Collect_Tharnariuns_Hope"
talk Tharnariun Treetender##3701
Select _"Tharnariun, I have lost the trap. Could you please give me another?"_ |gossip 115100
collect Tharnariun's Hope##7586 |goto Darkshore/0 38.84,43.42 |q 2118
step
use Tharnariun's Hope##7586
|tip On a Rabid Thistle Bear.
|tip Grey bears.
|tip {o}Don't attack it{}.
Capture a Rabid Thistle Bear |q 2118/1 |goto Darkshore 38.00,52.40
|mapmarker Darkshore/0 37.40,56.00
|mapmarker Darkshore/0 41.00,52.80
|mapmarker Darkshore/0 38.20,60.40
|mapmarker Darkshore/0 40.00,48.40
|mapmarker Darkshore/0 40.60,58.00
step
'|complete not readyq(2118)	|or	|next "Collect_Tharnariuns_Hope"
'|complete readyq(2118)		|or	|next "Finished_Plagued_Lands"
|only if not completedq(2118)
step
label "Finished_Plagued_Lands"
click Buzzbox 827
turnin Buzzbox 827##983 |goto Darkshore/0 36.66,46.26
step
talk Gwennyth Bly'Leggonde##10219
turnin Washed Ashore##3524 |goto Darkshore/0 36.62,45.59
accept Washed Ashore##4681 |goto Darkshore/0 36.62,45.59
step
talk Cerellean Whiteclaw##3644
|tip On the dock.
accept For Love Eternal##963 |goto Darkshore 35.74,43.71
step
click Skeletal Sea Turtle
|tip Underwater.
collect Sea Turtle Remains##12289 |q 4681/1 |goto Darkshore/0 31.87,46.32
step
talk Gwennyth Bly'Leggonde##10219
turnin Washed Ashore##4681 |goto Darkshore/0 36.62,45.59
step
talk Tharnariun Treetender##3701
turnin Plagued Lands##2118 |goto Darkshore/0 38.84,43.42
accept Cleansing of the Infected##2138 |goto Darkshore/0 38.84,43.42
step
talk Terenthis##3693
|tip Inside the building.
turnin How Big a Threat?##984 |goto Darkshore/0 39.37,43.48
accept How Big a Threat?##985 |goto Darkshore/0 39.37,43.48
accept Thundris Windweaver##4761 |goto Darkshore/0 39.37,43.48
step
talk Thundris Windweaver##3649
|tip Inside the building.
turnin Thundris Windweaver##4761 |goto Darkshore/0 37.40,40.13
accept The Cliffspring River##4762 |goto Darkshore/0 37.40,40.13
accept Bashal'Aran##954 |goto Darkshore/0 37.40,40.13
step
talk Sentinel Glynda Nal'Shea##2930
|tip Walks around.
accept The Red Crystal##4811 |goto Darkshore/0 37.70,43.39
step
talk Innkeeper Shaussiy##6737
|tip Inside the building.
home Auberdine |goto Darkshore/0 37.04,44.12 |q 942 |future
step
use Cenarion Moondust##15208
|tip Inside the small cave.
kill Lunaclaw##12138
Face Lunaclaw and Earn the Strength of Body and Heart it Possesses |q 6001/1 |goto Darkshore 43.48,45.96
|only if Druid
step
Locate the Large, Red Crystal on Darkshore's Eastern Mountain Range |q 4811/1 |goto Darkshore/0 47.32,48.66
|tip Up on the hill.
step
talk Asterion##3650
turnin Bashal'Aran##954 |goto Darkshore/0 44.17,36.29
accept Bashal'Aran##955 |goto Darkshore/0 44.17,36.29
step
kill Wild Grell##2190, Vile Sprite##2189
|tip Imps.
|tip Try not to kill {o}satyrs{}.
|tip Needed for next quest.
collect 8 Grell Earring##5336 |q 955/1 |goto Darkshore/0 45.80,36.80
|mapmarker Darkshore/0 46.80,39.20
|mapmarker Darkshore/0 47.20,37.60
|mapmarker Darkshore/0 44.40,35.40
|mapmarker Darkshore/0 44.40,38.00
|mapmarker Darkshore/0 44.80,39.60
|mapmarker Darkshore/0 47.20,37.60
step
talk Asterion##3650
turnin Bashal'Aran##955 |goto Darkshore/0 44.17,36.29
accept Bashal'Aran##956 |goto Darkshore/0 44.17,36.29
step
kill Deth'ryll Satyr##2212+
|tip Satyrs.
collect Ancient Moonstone Seal##5338 |q 956/1 |goto Darkshore/0 45.80,37.80
|mapmarker Darkshore/0 45.40,39.40
|mapmarker Darkshore/0 45.20,36.40
|mapmarker Darkshore/0 47.40,36.40
step
talk Asterion##3650
turnin Bashal'Aran##956 |goto Darkshore/0 44.17,36.30
accept Bashal'Aran##957 |goto Darkshore/0 44.17,36.30
step
click Beached Sea Creature##175233
accept Beached Sea Creature##4723 |goto Darkshore 41.88,31.55
stickystart "Kill_Rabid_Thistle_Bears"
step
click Beached Sea Turtle##176197
accept Beached Sea Turtle##4725 |goto Darkshore 44.21,20.64
step
label "Kill_Rabid_Thistle_Bears"
kill 20 Rabid Thistle Bear##2164 |q 2138/1 |goto Darkshore/0 50.60,30.40
|mapmarker Darkshore/0 43.00,23.00
|mapmarker Darkshore/0 43.00,32.60
|mapmarker Darkshore/0 43.80,26.00
|mapmarker Darkshore/0 44.40,29.00
|mapmarker Darkshore/0 46.00,23.40
|mapmarker Darkshore/0 46.20,33.40
|mapmarker Darkshore/0 47.20,26.40
|mapmarker Darkshore/0 49.40,33.20
|mapmarker Darkshore/0 50.40,27.40
|mapmarker Darkshore/0 47.40,29.80
|mapmarker Darkshore/0 53.00,25.80
|mapmarker Darkshore/0 53.40,28.80
|mapmarker Darkshore/0 54.40,31.80
|mapmarker Darkshore/0 54.80,22.80
step
use Empty Sampling Tube##12350
|tip In the water.
|tip Bottom of the waterfall.
collect Cliffspring River Sample##12349 |q 4762/1 |goto Darkshore/0 50.84,25.50
step
click Beached Sea Turtle##176196
accept Beached Sea Turtle##4727 |goto Darkshore 53.09,18.15
step
talk Loganaar##12042
Train Abilities |trainer Loganaar##12042 |goto Moonglade/0 52.53,40.57 |q 26 |future
|only if Druid
step
talk Mathrengyl Bearwalker##4217
|tip {o}Middle floor{} inside the building.
turnin Body and Heart##6001 |goto Darnassus 35.38,8.41
accept A Lesson to Learn##26 |goto Darnassus 35.38,8.41
accept Lessons Anew##6121 |goto Darnassus 35.38,8.41
|only if Druid
step
talk Dendrite Starblaze##11802
|tip Upstairs inside the building.
turnin A Lesson to Learn##26 |goto Moonglade 56.21,30.64
accept Trial of the Lake##29 |goto Moonglade 56.21,30.64
turnin Lessons Anew##6121 |goto Moonglade 56.21,30.64
accept The Principal Source##6122 |goto Moonglade 56.21,30.64
|only if Druid
step
click Bauble Container
|tip Wicker basket vase.
|tip Underwater.
|tip Multiple locations.
collect Shrine Bauble##15877 |goto Moonglade/0 54.70,46.50 |q 29
|mapmarker Moonglade/0 48.00,47.10
|mapmarker Moonglade/0 50.10,50.60
|mapmarker Moonglade/0 52.10,53.40
|mapmarker Moonglade/0 52.90,48.50
|mapmarker Moonglade/0 54.10,50.00
|mapmarker Moonglade/0 54.20,55.60
|mapmarker Moonglade/0 54.20,55.60
|mapmarker Moonglade/0 56.20,53.60
|mapmarker Moonglade/0 58.40,50.90
|mapmarker Moonglade/0 60.50,58.30
|only if Druid
step
use Shrine Bauble##15877
Complete the Trial of the Lake |q 29/1 |goto Moonglade 35.92,41.38
|only if Druid
step
talk Tajarri##11799
turnin Trial of the Lake##29 |goto Moonglade 36.51,40.11
accept Trial of the Sea Lion##272 |goto Moonglade 36.51,40.11
|only if Druid
step
talk Gwennyth Bly'Leggonde##10219
turnin Beached Sea Creature##4723 |goto Darkshore/0 36.62,45.60
turnin Beached Sea Turtle##4725 |goto Darkshore/0 36.62,45.60
turnin Beached Sea Turtle##4727 |goto Darkshore/0 36.62,45.60
step
talk Sildanair##4089
Train Abilities |trainer Sildanair##4089 |goto Darnassus/0 61.78,42.21 |q 4811
|only if Warrior
step
Enter the tree cave |goto Darnassus/0 32.14,16.46 < 7 |walk
talk Syurna##4163
|tip Downstairs inside the tree cave.
Train Abilities |trainer Syurna##4163 |goto Darnassus/0 37.00,21.92 |q 4811
|only if Rogue
step
talk Jocaste##4146
|tip Upstairs inside the building.
Train Abilities |trainer Jocaste##4146 |goto Darnassus/0 40.38,8.54 |q 4811
|only if Hunter
step
talk Jandria##4091
|tip Inside the building.
Train Abilities |trainer Jandria##4091 |goto Darnassus/0 37.90,82.73 |q 4811
|only if Priest
step
talk Sentinel Glynda Nal'Shea##2930
|tip Walks around.
turnin The Red Crystal##4811 |goto Darkshore/0 37.71,43.39
accept As Water Cascades##4812 |goto Darkshore/0 37.71,43.39
step
use Empty Water Tube##14338
collect Moonwell Water Tube##14339 |q 4812/1 |goto Darkshore/0 37.79,44.05
step
talk Thundris Windweaver##3649
|tip Inside the building.
turnin The Cliffspring River##4762 |goto Darkshore/0 37.40,40.13
accept The Blackwood Corrupted##4763 |goto Darkshore/0 37.40,40.13
step
talk Tharnariun Treetender##3701
turnin Cleansing of the Infected##2138 |goto Darkshore/0 38.84,43.41
step
click Mysterious Red Crystal##175524
|tip Up on the hill.
turnin As Water Cascades##4812 |goto Darkshore/0 47.32,48.66
accept The Fragments Within##4813 |goto Darkshore/0 47.32,48.66
step
talk Sentinel Tysha Moonblade##3639
accept The Fall of Ameth'Aran##953 |goto Darkshore/0 40.30,59.73
stickystart "Collect_Anyas_Pendant"
step
click Lay of Ameth'Aran
Read the Lay of Ameth'Aran |q 953/1 |goto Darkshore/0 43.31,58.70
step
click Ancient Flame
Destroy the Seal at the Ancient Flame |q 957/1 |goto Darkshore/0 42.37,61.79
step
click Fall of Ameth'Aran
Read the Fall of Ameth'Aran |q 953/2 |goto Darkshore/0 42.67,63.10
step
label "Collect_Anyas_Pendant"
kill Anaya Dawnrunner##3667
|tip Neutral female night elf ghost.
|tip Wearing a green and yellow robe.
|tip Walks around.
|tip Multiple locations.
collect Anaya's Pendant##5382 |q 963/1 |goto Darkshore/0 42.40,60.40
|mapmarker Darkshore/0 41.40,60.20
|mapmarker Darkshore/0 41.80,59.20
|mapmarker Darkshore/0 42.40,58.40
|mapmarker Darkshore/0 42.40,62.20
|mapmarker Darkshore/0 43.20,59.40
|mapmarker Darkshore/0 43.60,61.60
step
talk Sentinel Tysha Moonblade##3639
turnin The Fall of Ameth'Aran##953 |goto Darkshore 40.30,59.73
step
click Beached Sea Creature##175226
accept Beached Sea Creature##4728 |goto Darkshore 36.06,70.86
step
click Beached Sea Turtle
accept Beached Sea Turtle##4722 |goto Darkshore/0 37.14,62.16
step
kill 5 Blackwood Windtalker##2324 |q 985/2 |goto Darkshore/0 39.60,53.00
kill 8 Blackwood Pathfinder##2167 |q 985/1 |goto Darkshore/0 39.60,53.00
|mapmarker Darkshore/0 38.40,53.60
|mapmarker Darkshore/0 39.80,56.20
step
talk Gwennyth Bly'Leggonde##10219
turnin Beached Sea Creature##4728 |goto Darkshore/0 36.62,45.60
turnin Beached Sea Turtle##4722 |goto Darkshore/0 36.62,45.60
step
talk Gubber Blump##10216
accept Fruit of the Sea##1138 |goto Darkshore 36.09,44.93
step
talk Cerellean Whiteclaw##3644
|tip On the dock.
turnin For Love Eternal##963 |goto Darkshore/0 35.74,43.71
step
talk Barithras Moonshade##3583
accept Cave Mushrooms##947 |goto Darkshore 37.32,43.64
step
use Empty Cleansing Bowl##12346
collect Filled Cleansing Bowl##12347 |goto Darkshore 37.78,44.02 |q 4763
step
talk Sentinel Glynda Nal'Shea##2930
|tip Walks around.
turnin The Fragments Within##4813 |goto Darkshore/0 37.71,43.39
step
talk Tharnariun Treetender##3701
accept Tharnariun's Hope##2139 |goto Darkshore 38.84,43.42
step
talk Terenthis##3693
|tip Inside the building.
turnin How Big a Threat?##985 |goto Darkshore/0 39.37,43.48
accept A Lost Master##986 |goto Darkshore/0 39.37,43.48
step
talk Sentinel Elissa Starbreeze##3657
|tip Upstairs inside the building.
accept The Tower of Althalaxx##965 |goto Darkshore 39.05,43.55
step
talk Dink##7312
|tip Inside the building.
Train Abilities |trainer Dink##7312 |goto Ironforge/0 27.16,8.56 |q 957
|only if Mage
step
talk Beldruk Doombrow##5148
|tip Inside the building.
Train Abilities |trainer Beldruk Doombrow##5148 |goto Ironforge/0 24.55,4.48 |q 957
|only if Paladin
step
talk Briarthorn##5172
|tip Inside the building.
Train Abilities |trainer Briarthorn##5172 |goto Ironforge/0 50.35,5.66 |q 957
|only if Warlock
step
talk Jubahl Corpseseeker##6382
|tip Buy available Grimoires.
|tip Inside the building.
Train Demon Abilities |vendor Jubahl Corpseseeker##6382 |goto Ironforge/0 50.35,5.66 |q 957
|only if Warlock
step
talk Gorbold Steelhand##6301
accept Deep Ocean, Vast Sea##982 |goto Darkshore 38.11,41.17
step
talk Asterion##3650
turnin Bashal'Aran##957 |goto Darkshore/0 44.17,36.30
step
click Silver Dawning's Lockbox
|tip {o}Very bottom{} inside the sunken ship.
|tip Swim through a window.
collect Silver Dawning's Lockbox##12191 |q 982/1 |goto Darkshore 38.24,28.80
step
click Mist Veil's Lockbox
|tip {o}Very bottom{} inside the sunken ship.
|tip Swim through a window.
collect Mist Veil's Lockbox##12192 |q 982/2 |goto Darkshore 39.63,27.46
stickystart "Collect_Fine_Crab_Chunks"
step
click Strange Lockbox
|tip Underwater.
collect Half Pendant of Aquatic Agility##15883 |goto Darkshore 48.87,11.32 |q 272
|only if Druid
step
label "Collect_Fine_Crab_Chunks"
kill Reef Crawler##2235+
|tip Crabs.
collect 6 Fine Crab Chunks##12237 |q 1138/1 |goto Darkshore/0 45.40,20.40
|mapmarker Darkshore/0 47.60,20.80
|mapmarker Darkshore/0 50.60,22.20
step
talk Gelkak Gyromast##6667
accept Gyromast's Retrieval##2098 |goto Darkshore 56.65,13.48
stickystart "Collect_Bottom_Of_Gelkaks_Key"
step
kill Greymist Tidehunter##2208, Greymist Oracle##2207
|tip Murlocs.
|tip Underwater.
collect Middle of Gelkak's Key##7499 |q 2098/2 |goto Darkshore 54.95,12.16
step
label "Collect_Bottom_Of_Gelkaks_Key"
kill Raging Reef Crawler##2236, Encrusted Tide Crawler##2233
|tip Crabs.
collect Bottom of Gelkak's Key##7500 |q 2098/3 |goto Darkshore 55.40,17.00
|mapmarker Darkshore/0 56.40,12.40
|mapmarker Darkshore/0 57.60,14.40
|mapmarker Darkshore/0 50.80,22.00
|mapmarker Darkshore/0 52.40,23.40
|mapmarker Darkshore/0 52.60,20.40
stickystart "Collect_Fine_Moonstalker_Pelts"
step
kill Giant Foreststrider##2323+
|tip Large walking birds.
collect Top of Gelkak's Key##7498 |q 2098/1 |goto Darkshore 58.40,14.60
|mapmarker Darkshore/0 59.60,13.00
|mapmarker Darkshore/0 60.40,10.40
|mapmarker Darkshore/0 61.00,15.00
|mapmarker Darkshore/0 61.60,8.40
|mapmarker Darkshore/0 61.60,12.60
step
label "Collect_Fine_Moonstalker_Pelts"
kill Moonstalker Matriarch##2071, Moonstalker Sire##2237
|tip Black tigers.
collect 5 Fine Moonstalker Pelt##5386 |q 986/1 |goto Darkshore 59.40,12.40
|mapmarker Darkshore/0 59.40,10.40
|mapmarker Darkshore/0 60.40,8.20
|mapmarker Darkshore/0 60.40,14.80
|mapmarker Darkshore/0 61.20,6.20
|mapmarker Darkshore/0 61.60,11.60
|mapmarker Darkshore/0 62.60,8.60
step
talk Gelkak Gyromast##6667
turnin Gyromast's Retrieval##2098 |goto Darkshore 56.65,13.48
step
talk Balthule Shadowstrike##3661
turnin The Tower of Althalaxx##965 |goto Darkshore 54.97,24.89
accept The Tower of Althalaxx##966 |goto Darkshore 54.97,24.89
step
kill Dark Strand Fanatic##2336+
collect 4 Worn Parchment##5348 |q 966/1 |goto Darkshore 55.00,27.60
|mapmarker Darkshore/0 56.00,27.00
|mapmarker Darkshore/0 56.20,25.40
|mapmarker Darkshore/0 57.00,26.40
step
talk Balthule Shadowstrike##3661
turnin The Tower of Althalaxx##966 |goto Darkshore 54.97,24.89
stickystart "Collect_Scaber_Stalks"
step
use Empty Cliffspring Falls Sampler##15844
|tip Entrance of the cave.
collect Filled Cliffspring Falls Sampler##15845 |q 6122/1 |goto Darkshore 54.93,33.32
|only if Druid
step
Enter the cave |goto Darkshore 54.97,33.37 < 20 |walk |only if not (subzone("Cliffspring Falls") and indoors())
click Death Cap
|tip Brown mushrooms.
|tip Upstairs inside the cave.
|tip More downstairs in side rooms.
collect Death Cap##5270 |q 947/2 |goto Darkshore 55.75,36.19
step
label "Collect_Scaber_Stalks"
click Scaber Stalk##11714+
|tip Blue mushrooms.
|tip Inside the cave. |notinsticky
collect 5 Scaber Stalk##5271 |q 947/1 |goto Darkshore 54.97,33.37
|mapmarker Darkshore/0 55.00,36.80
|mapmarker Darkshore/0 55.10,34.60
|mapmarker Darkshore/0 55.30,35.60
|mapmarker Darkshore/0 56.60,34.50
step
Leave the cave |goto Darkshore 54.97,33.37 < 20 |walk |only if subzone("Cliffspring Falls") and indoors()
click Blackwood Fruit Stores
|tip May be attacked.
collect Blackwood Fruit Sample##12341 |goto Darkshore/0 52.87,33.38 |q 4763
step
Follow the path up |goto Darkshore 52.40,35.94 < 20 |only if walking
kill Den Mother##6788 |q 2139/1 |goto Darkshore 51.48,38.26
|tip Inside the small cave.
step
click Blackwood Grain Stores
|tip May be attacked.
collect Blackwood Grain Sample##12342 |goto Darkshore/0 50.67,34.99 |q 4763
step
click Blackwood Nut Stores
|tip May be attacked.
collect Blackwood Nut Sample##12343 |goto Darkshore 51.83,33.56 |q 4763
step
use Filled Cleansing Bowl##12347
kill Xabraxxis##10373
|tip Appears nearby.
click Xabraxxis' Demon Bag
|tip Appears on the ground.
collect Talisman of Corruption##12355 |q 4763/1 |goto Darkshore 52.41,33.44
step
talk Loganaar##12042
Train Abilities |trainer Loganaar##12042 |goto Moonglade/0 52.53,40.57 |q 6122
|only if Druid
step
talk Alanndarian Nightsong##3702
|tip Inside the building.
turnin The Principal Source##6122 |goto Darkshore 37.69,40.66
|only if Druid
step
talk Gubber Blump##10216
turnin Fruit of the Sea##1138 |goto Darkshore 36.10,44.93
step
click WANTED: Murkdeep!
accept WANTED: Murkdeep!##4740 |goto Darkshore 37.23,44.23
step
talk Barithras Moonshade##3583
turnin Cave Mushrooms##947 |goto Darkshore 37.32,43.64
accept Onu##948 |goto Darkshore 37.32,43.64
step
talk Archaeologist Hollee##2913
accept The Absent Minded Prospector##729 |goto Darkshore 37.44,41.84
step
talk Thundris Windweaver##3649
|tip Inside the building.
turnin The Blackwood Corrupted##4763 |goto Darkshore 37.40,40.13
step
_Destroy These Items:_
|tip Not needed.
trash Blackwood Fruit Sample##12341
trash Blackwood Grain Sample##12342
trash Blackwood Nut Sample##12343
trash Filled Cleansing Bowl##12347
step
talk Gorbold Steelhand##6301
turnin Deep Ocean, Vast Sea##982 |goto Darkshore 38.11,41.17
step
talk Tharnariun Treetender##3701
turnin Tharnariun's Hope##2139 |goto Darkshore 38.84,43.41
step
talk Terenthis##3693
|tip Inside the building.
turnin A Lost Master##986 |goto Darkshore 39.37,43.48
accept A Lost Master##993 |goto Darkshore 39.37,43.48
step
talk Sildanair##4089
Train Abilities |trainer Sildanair##4089 |goto Darnassus/0 61.78,42.21 |q 948
|only if Warrior
step
Enter the tree cave |goto Darnassus/0 32.14,16.46 < 7 |walk
talk Syurna##4163
|tip Downstairs inside the tree cave.
Train Abilities |trainer Syurna##4163 |goto Darnassus/0 37.00,21.92 |q 948
|only if Rogue
step
talk Jocaste##4146
|tip Upstairs inside the building.
Train Abilities |trainer Jocaste##4146 |goto Darnassus/0 40.38,8.54 |q 948
|only if Hunter
step
talk Silvaria##10089
|tip Top of the building.
Train Pet Abilities |trainer Silvaria##10089 |goto Darnassus/0 42.47,9.18 |q 948
|only if Hunter
step
talk Jandria##4091
|tip Inside the building.
Train Abilities |trainer Jandria##4091 |goto Darnassus/0 37.90,82.73 |q 948
|only if Priest
step
talk Dink##7312
|tip Inside the building.
Train Abilities |trainer Dink##7312 |goto Ironforge/0 27.16,8.56 |q 948
|only if Mage
step
talk Milstaff Stormeye##2489
|tip Inside the building.
learnspell Teleport: Ironforge##3562 |goto Ironforge 25.50,7.07
|only if Mage
step
talk Beldruk Doombrow##5148
|tip Inside the building.
Train Abilities |trainer Beldruk Doombrow##5148 |goto Ironforge/0 24.55,4.48 |q 948
|only if Paladin
step
talk Briarthorn##5172
|tip Inside the building.
Train Abilities |trainer Briarthorn##5172 |goto Ironforge/0 50.35,5.66 |q 948
|only if Warlock
step
talk Jubahl Corpseseeker##6382
|tip Buy available Grimoires.
|tip Inside the building.
Train Demon Abilities |vendor Jubahl Corpseseeker##6382 |goto Ironforge/0 50.35,5.66 |q 948
|only if Warlock
step
talk Onu##3616
turnin Grove of the Ancients##952 |goto Darkshore 43.55,76.29 |only if haveq(952) or completedq(952)
turnin Onu##948 |goto Darkshore 43.55,76.29
accept The Master's Glaive##944 |goto Darkshore 43.55,76.29
step
kill Greymist Warrior##2205, Greymist Hunter##2206
|tip Murlocs.
|tip Groups of murlocs run appear near the water.
|tip They run into the camp.
|tip Stand away from the camp for safety.
kill Murkdeep##10323 |q 4740/1 |goto Darkshore 36.51,76.59
|tip Eventually appears.
step
click Beached Sea Creature
accept Beached Sea Creature##4730 |goto Darkshore/0 32.73,80.82
step
click Beached Sea Turtle
|tip Careful to not pull multiple enemies.
accept Beached Sea Turtle##4731 |goto Darkshore/0 31.70,83.70
step
click Beached Sea Turtle
|tip Careful to not pull multiple enemies.
accept Beached Sea Turtle##4732 |goto Darkshore/0 31.27,85.54
step
click Beached Sea Creature
|tip Careful, enemies hidden by terrain.
|tip Try not pull multiple enemies.
accept Beached Sea Creature##4733 |goto Darkshore/0 31.29,87.54
step
talk Prospector Remtravel##2917
|tip Escort quest.
|tip Wait until he respawns, if missing.
turnin The Absent Minded Prospector##729 |goto Darkshore 35.73,83.70
accept The Absent Minded Prospector##731 |goto Darkshore 35.73,83.70 |noautoaccept inparty
step
Watch the dialogue
|tip Follow and protect {o}Prospector Remtravel{}.
|tip He's weak and can die easily.
|tip Get enemies off him quckly.
|tip Troggs ambush {o}3 times{}.
Escort Prospector Remtravel |q 731/1 |goto Darkshore 35.73,83.70
step
Enter the Master's Glaive |q 944/1 |goto Darkshore 38.57,86.30
step
use Phial of Scrying##5251
|tip On the table.
click Scrying Bowl
turnin The Master's Glaive##944 |goto Darkshore 38.53,86.17
accept The Twilight Camp##949 |goto Darkshore 38.53,86.17
step
_Destroy This Items:_
|tip Not needed.
trash Phial of Scrying##5251
step
click Twilight Tome
turnin The Twilight Camp##949 |goto Darkshore 38.54,86.05
accept Return to Onu##950 |goto Darkshore 38.54,86.05
step
talk Volcor##3692
|tip Escort quest.
|tip Wait until he respawns, if missing.
|tip Inside the small cave.
turnin A Lost Master##993 |goto Darkshore 45.01,85.30
accept Escape Through Force##994 |goto Darkshore 45.01,85.30 |noautoaccept inparty
step
use Book: The Powers Below##5352
accept The Powers Below##968
|only if itemcount(5352) > 0
step
Watch the dialogue
|tip Follow and protect Volcor.
|tip Let him get attacked first.
|tip Otherwise he won't stop to help you fight.
Help Volcor to the Road |q 994/1 |goto Darkshore 41.95,81.80
step
talk Onu##3616
turnin Return to Onu##950 |goto Darkshore 43.56,76.29
step
talk Terenthis##3693
|tip Inside the building.
turnin Escape Through Force##994 |goto Darkshore 39.37,43.48
step
talk Archaeologist Hollee##2913
turnin The Absent Minded Prospector##731 |goto Darkshore 37.44,41.84
accept The Absent Minded Prospector##741 |goto Darkshore 37.44,41.84
step
talk Sentinel Glynda Nal'Shea##2930
|tip Walks around.
turnin WANTED: Murkdeep!##4740 |goto Darkshore 37.71,43.39
step
talk Gwennyth Bly'Leggonde##10219
turnin Beached Sea Creature##4730 |goto Darkshore/0 36.62,45.59
turnin Beached Sea Turtle##4731 |goto Darkshore/0 36.62,45.59
turnin Beached Sea Turtle##4732 |goto Darkshore/0 36.62,45.59
turnin Beached Sea Creature##4733 |goto Darkshore/0 36.62,45.59
step
talk Chief Archaeologist Greywhisker##2912
|tip Outside the building.
turnin The Absent Minded Prospector##741 |goto Darnassus 31.25,84.50
accept The Absent Minded Prospector##942 |goto Darnassus 31.25,84.50
step
talk Denatharion##4218
|tip {o}Ground floor{} inside the building.
Train Abilities |trainer Denatharion##4218 |goto Darnassus/0 34.77,7.37 |q 942
|only if Druid
step
talk Sildanair##4089
Train Abilities |trainer Sildanair##4089 |goto Darnassus/0 61.78,42.21 |q 942
|only if Warrior
step
Enter the tree cave |goto Darnassus/0 32.14,16.46 < 7 |walk
talk Syurna##4163
|tip Downstairs inside the tree cave.
Train Abilities |trainer Syurna##4163 |goto Darnassus/0 37.00,21.92 |q 942
|only if Rogue
step
talk Jocaste##4146
|tip Upstairs inside the building.
Train Abilities |trainer Jocaste##4146 |goto Darnassus/0 40.38,8.54 |q 942
|only if Hunter
step
talk Jandria##4091
|tip Inside the building.
Train Abilities |trainer Jandria##4091 |goto Darnassus/0 37.90,82.73 |q 942
|only if Priest
]])
GoatQuest:RegisterGuide("Leveling Guides\\Wetlands (22-26)",{
image=GQ.IMAGESDIR.."Wetlands",
next="Leveling Guides\\Redridge Mountains (26-27)",
},[[
step
talk James Halloran##2094
|tip Walks around.
accept Young Crocolisk Skins##484 |goto Wetlands 8.51,55.71
step
talk Karl Boran##1242
|tip Walks around.
accept Claws from the Deep##279 |goto Wetlands 8.31,58.53
step
talk Shellei Brondir##1571
fpath Menethil Harbor |goto Wetlands 9.49,59.69
step
talk Dink##7312
|tip Inside the building.
Train Abilities |trainer Dink##7312 |goto Ironforge/0 27.16,8.56 |q 942
|only if Mage
step
talk Beldruk Doombrow##5148
|tip Inside the building.
Train Abilities |trainer Beldruk Doombrow##5148 |goto Ironforge/0 24.55,4.48 |q 942
|only if Paladin
step
talk Briarthorn##5172
|tip Inside the building.
Train Abilities |trainer Briarthorn##5172 |goto Ironforge/0 50.35,5.66 |q 942
|only if Warlock
step
talk Jubahl Corpseseeker##6382
|tip Buy available Grimoires.
|tip Inside the building.
Train Demon Abilities |vendor Jubahl Corpseseeker##6382 |goto Ironforge/0 50.35,5.66 |q 942
|only if Warlock
step
talk Gerrig Bonegrip##2786
|tip Downstairs inside the building.
turnin The Powers Below##968 |goto Ironforge/0 50.83,5.62
|only if haveq(968) or completedq(968)
step
talk First Mate Fitzsimmons##1239
|tip Walks around.
accept The Greenwarden##463 |goto Wetlands 10.89,59.67
step
talk Innkeeper Helbrek##1464
|tip Walks around.
|tip Inside the building.
home Deepwater Tavern |goto Wetlands 10.70,60.95 |q 66 |future
step
talk Archaeologist Flagongut##2911
|tip Upstairs inside the building.
turnin The Absent Minded Prospector##942 |goto Wetlands 10.84,60.43
accept The Absent Minded Prospector##943 |goto Wetlands/0 10.84,60.43
step
talk Sida##2111
accept Digging Through the Ooze##470 |goto Wetlands 11.80,57.99
step
talk Neal Allen##1448
|tip Walks around.
|tip Inside the building.
buy Bronze Tube##4371 |n
|tip If possible.
|tip Limited supply item.
|tip Needed later for Duskwood quest.
Visit the Vendor |vendor Neal Allen##1448 |goto Wetlands 10.75,56.75 |q 174 |future
|only if itemcount(4371) == 0
step
talk Tarrel Rockweaver##2096
|tip Walks around.
accept In Search of The Excavation Team##305 |goto Wetlands/0 11.50,52.14
stickystart "Slay_Bluegill_Murlocs"
stickystart "Collect_Young_Crocolisk_Skins"
step
kill Gobbler##1259
|tip Grey murloc.
|tip Walks around.
|tip Spawns here.
collect Gobbler's Head##3618 |q 279/2 |goto Wetlands 17.99,40.38
|mapmarker Wetlands/0 15.20,41.20
step
label "Slay_Bluegill_Murlocs"
kill Bluegill Murloc##1024+
Slay #12# Bluegill Murlocs |q 279/1 |goto Wetlands/0 17.00,39.40
|mapmarker Wetlands/0 13.40,37.40
|mapmarker Wetlands/0 13.40,39.40
|mapmarker Wetlands/0 13.60,41.60
|mapmarker Wetlands/0 15.20,36.40
|mapmarker Wetlands/0 15.20,38.40
|mapmarker Wetlands/0 15.80,41.00
|mapmarker Wetlands/0 18.80,38.20
|mapmarker Wetlands/0 20.60,41.00
step
talk Karl Boran##1242
|tip Walks around.
turnin Claws from the Deep##279 |goto Wetlands/0 8.31,58.53
accept Reclaiming Goods##281 |goto Wetlands/0 8.31,58.53
step
click Damaged Crate
turnin Reclaiming Goods##281 |goto Wetlands/0 13.51,41.38
accept The Search Continues##284 |goto Wetlands/0 13.51,41.38
step
click Sealed Barrel
turnin The Search Continues##284 |goto Wetlands/0 13.61,38.21
accept Search More Hovels##285 |goto Wetlands/0 13.61,38.21
step
click Half-buried Barrel
turnin Search More Hovels##285 |goto Wetlands/0 13.95,34.81
accept Return the Statuette##286 |goto Wetlands/0 13.95,34.81
step
Enter Whelgar's Excavation Site |goto Wetlands/0 34.19,41.09 < 40 |only if walking and not subzone("Whelgar's Excavation Site")
Follow the path up |goto Wetlands/0 37.11,42.98 < 20 |only if walking
talk Ormer Ironbraid##1078
|tip Walks around.
accept Ormer's Revenge##294 |goto Wetlands/0 38.18,50.89
stickystop "Collect_Young_Crocolisk_Skins"
step
talk Merrin Rockweaver##1076
|tip Inside the small cave.
turnin In Search of The Excavation Team##305 |goto Wetlands/0 38.91,52.34
accept In Search of The Excavation Team##306 |goto Wetlands/0 38.91,52.34
step
click Flagongut's Fossil
|tip Inside the small cave.
collect Flagongut's Fossil##5234 |q 943/2 |goto Wetlands/0 38.86,52.21
stickystart "Collect_Stone_Of_Relu"
step
Leave Whelgar's Excavation Site |goto Wetlands/0 34.02,40.85 < 40 |only if walking and subzone("Whelgar's Excavation Site")
kill 10 Mottled Raptor##1020 |q 294/1 |goto Wetlands/0 29.20,43.40
kill 10 Mottled Screecher##1021 |q 294/2 |goto Wetlands/0 29.20,43.40
|mapmarker Wetlands/0 20.40,52.80
|mapmarker Wetlands/0 20.80,48.40
|mapmarker Wetlands/0 20.80,50.80
|mapmarker Wetlands/0 23.40,49.20
|mapmarker Wetlands/0 23.60,46.60
|mapmarker Wetlands/0 23.60,52.80
|mapmarker Wetlands/0 26.20,43.80
|mapmarker Wetlands/0 26.60,46.60
|mapmarker Wetlands/0 29.60,46.40
step
label "Collect_Stone_Of_Relu"
kill Mottled Raptor##1020, Mottled Screecher##1021
|tip Raptors.
collect Stone of Relu##5233 |q 943/1 |goto Wetlands/0 29.20,43.40
|mapmarker Wetlands/0 20.40,52.80
|mapmarker Wetlands/0 20.80,48.40
|mapmarker Wetlands/0 20.80,50.80
|mapmarker Wetlands/0 23.40,49.20
|mapmarker Wetlands/0 23.60,46.60
|mapmarker Wetlands/0 23.60,52.80
|mapmarker Wetlands/0 26.20,43.80
|mapmarker Wetlands/0 26.60,46.60
|mapmarker Wetlands/0 29.60,46.40
stickystart "Collect_Young_Crocolisk_Skins"
step
Leave Whelgar's Excavation Site |goto Wetlands/0 34.02,40.85 < 40 |only if walking and subzone("Whelgar's Excavation Site")
talk Einar Stonegrip##2093
accept Daily Delivery##469 |goto Wetlands 49.91,39.37
step
talk Rethiel the Greenwarden##1244
|tip Walks around.
turnin The Greenwarden##463 |goto Wetlands/0 56.34,40.43
accept Tramping Paws##276 |goto Wetlands/0 56.34,40.43
stickystop "Collect_Young_Crocolisk_Skins"
stickystart "Kill_Mosshide_Gnolls"
stickystart "Collect_Young_Crocolisk_Skins"
step
kill 10 Mosshide Mongrel##1008 |q 276/2 |goto Wetlands 60.40,58.20
|mapmarker Wetlands/0 55.40,74.60
|mapmarker Wetlands/0 59.40,55.40
|mapmarker Wetlands/0 60.00,70.40
|mapmarker Wetlands/0 60.80,72.60
|mapmarker Wetlands/0 61.80,61.60
|mapmarker Wetlands/0 62.00,66.40
|mapmarker Wetlands/0 62.00,70.60
|mapmarker Wetlands/0 63.20,55.60
|mapmarker Wetlands/0 63.40,63.00
|mapmarker Wetlands/0 63.60,58.40
|mapmarker Wetlands/0 63.60,60.60
|mapmarker Wetlands/0 63.80,68.20
|mapmarker Wetlands/0 65.00,65.60
step
label "Kill_Mosshide_Gnolls"
kill 15 Mosshide Gnoll##1007 |q 276/1 |goto Wetlands 63.60,62.20
|mapmarker Wetlands/0 56.00,74.60
|mapmarker Wetlands/0 61.00,71.60
|mapmarker Wetlands/0 62.40,68.20
|mapmarker Wetlands/0 62.80,65.20
|mapmarker Wetlands/0 65.00,65.80
step
label "Collect_Young_Crocolisk_Skins"
kill Young Wetlands Crocolisk##1417+
collect 4 Young Crocolisk Skin##3397 |q 484/1 |goto Wetlands/0 61.80,56.40
|mapmarker Wetlands/0 50.00,32.20
|mapmarker Wetlands/0 50.60,34.40
|mapmarker Wetlands/0 51.20,38.60
|mapmarker Wetlands/0 52.20,36.20
|mapmarker Wetlands/0 52.80,41.00
|mapmarker Wetlands/0 53.40,38.60
|mapmarker Wetlands/0 53.60,32.40
|mapmarker Wetlands/0 54.00,42.60
|mapmarker Wetlands/0 54.40,45.60
|mapmarker Wetlands/0 56.40,47.60
|mapmarker Wetlands/0 58.20,50.00
|mapmarker Wetlands/0 58.80,52.00
|mapmarker Wetlands/0 59.40,63.40
|mapmarker Wetlands/0 60.20,54.20
|mapmarker Wetlands/0 62.00,62.40
|mapmarker Wetlands/0 62.20,59.40
|mapmarker Wetlands/0 63.40,65.40
|mapmarker Wetlands/0 63.40,73.00
|mapmarker Wetlands/0 63.80,69.00
|mapmarker Wetlands/0 63.80,75.80
|mapmarker Wetlands/0 65.80,73.60
step
talk Rethiel the Greenwarden##1244
|tip Walks around.
turnin Tramping Paws##276 |goto Wetlands/0 56.34,40.43
step
kill Black Ooze##1032, Crimson Ooze##1031, Monstrous Ooze##1033
|tip Inside and outside the crypt.
collect Sida's Bag##3349 |q 470/1 |goto Wetlands 48.00,28.60
|mapmarker Wetlands/0 42.40,26.00
|mapmarker Wetlands/0 44.00,27.60
|mapmarker Wetlands/0 46.40,24.40
|mapmarker Wetlands/0 46.40,26.40
|mapmarker Wetlands/0 44.28,25.51
|mapmarker Wetlands/0 48.60,24.40
step
Enter Whelgar's Excavation Site |goto Wetlands/0 34.19,41.09 < 40 |only if walking and not subzone("Whelgar's Excavation Site")
Follow the path up |goto Wetlands/0 37.11,42.98 < 20 |only if walking
talk Ormer Ironbraid##1078
|tip Walks around.
turnin Ormer's Revenge##294 |goto Wetlands/0 38.18,50.89
accept Ormer's Revenge##295 |goto Wetlands/0 38.18,50.89
step
_NOTE:_
Stronger Ammo Available
|tip Buy level 25 ammo when restocking.
Click Here to Continue |confirm |q 295
|only if Hunter
step
kill 10 Mottled Scytheclaw##1022 |q 295/1 |goto Wetlands/0 35.20,48.60
kill 10 Mottled Razormaw##1023 |q 295/2 |goto Wetlands/0 35.20,48.60
|mapmarker Wetlands/0 31.40,48.60
|mapmarker Wetlands/0 33.20,46.40
|mapmarker Wetlands/0 33.40,49.80
|mapmarker Wetlands/0 34.40,44.00
|mapmarker Wetlands/0 35.60,46.40
step
Follow the path up |goto Wetlands/0 37.11,42.98 < 20 |only if walking
talk Ormer Ironbraid##1078
|tip Walks around.
turnin Ormer's Revenge##295 |goto Wetlands/0 38.18,50.89
accept Ormer's Revenge##296 |goto Wetlands/0 38.18,50.89
step
Follow the path up |goto Wetlands/0 31.89,48.63 < 15 |only if walking
kill Sarltooth##1353
|tip {o}Level 29{} blue raptor.
|tip Up on the cliff.
|tip Walks around.
|tip Sometimes walks in the valley.
|tip Skip if too difficult.
collect Sarltooth's Talon##3638 |q 296/1 |goto Wetlands/0 33.26,51.52
|mapmarker Wetlands/0 35.40,47.60
step
Follow the path up |goto Wetlands/0 37.11,42.98 < 20 |only if walking
talk Ormer Ironbraid##1078
|tip Walks around.
turnin Ormer's Revenge##296 |goto Wetlands/0 38.18,50.89
|only if haveq(296) or completedq(296)
step
talk Loganaar##12042
Train Abilities |trainer Loganaar##12042 |goto Moonglade/0 52.53,40.57 |q 943
|only if Druid
step
talk Archaeologist Flagongut##2911
|tip Upstairs inside the building.
turnin The Absent Minded Prospector##943 |goto Wetlands/0 10.84,60.43
step
talk Sida##2111
turnin Digging Through the Ooze##470 |goto Wetlands 11.80,57.99
step
talk Tarrel Rockweaver##2096
|tip Walks around.
turnin In Search of The Excavation Team##306 |goto Wetlands 11.50,52.14
step
talk Neal Allen##1448
|tip Walks around.
|tip Inside the building.
buy Bronze Tube##4371 |n
|tip If possible.
|tip Limited supply item.
|tip Needed later for Duskwood quest.
Visit the Vendor |vendor Neal Allen##1448 |goto Wetlands 10.75,56.75 |q 174 |future
|only if itemcount(4371) == 0
step
talk James Halloran##2094
|tip Walks around.
turnin Young Crocolisk Skins##484 |goto Wetlands 8.51,55.71
turnin Daily Delivery##469 |goto Wetlands 8.51,55.71
step
talk Karl Boran##1242
|tip Walks around.
turnin Return the Statuette##286 |goto Wetlands 8.31,58.54
step
_NOTE:_
During the Next Step
|tip Swim to the {o}EXACT{} location.
|tip We'll use the {o}unstuck feature{} to teleport to Ironforge.
|tip Skip if you have a Warlock or Mage to help you.
Click Here to Continue |confirm |q 34 |future
|only if NightElf
step
_NOTE:_
Use the Stuck Character Service
|tip Swim to this {o}EXACT{} location.
|tip Push {o}ESC{} and select {o}Support{}.
|tip Choose {o}Stuck Character service{}.
|tip Select your character from the list.
|tip Click {o}Move Character{}.
Wait a Few Minutes
|tip You will be logged out.
|tip Wait about {o}5 minutes{} to login again.
Reach the Gates of Ironforge |complete subzone("Gates of Ironforge") |goto Wetlands 3.31,75.90 |notravel |q 34 |future
|only if NightElf
step
talk Dink##7312
|tip Inside the building.
Train Abilities |trainer Dink##7312 |goto Ironforge/0 27.16,8.56 |q 34 |future
|only if Mage
step
talk Bilban Tosslespanner##5114
|tip Inside the building.
Train Abilities |trainer Bilban Tosslespanner##5114 |goto Ironforge/0 65.90,88.41 |q 34 |future
|only if Warrior
step
talk Regnus Thundergranite##5117
|tip Inside the building.
Train Abilities |trainer Regnus Thundergranite##5117 |goto Ironforge/0 69.87,82.90 |q 34 |future
|only if Hunter
step
talk Belia Thundergranite##10090
|tip Inside the building.
Train Pet Abilities |trainer Belia Thundergranite##10090 |goto Ironforge/0 70.86,85.84 |q 34 |future
|only if Hunter
step
talk Buliwyf Stonehand##11865
|tip Inside the building.
Train Guns |complete weaponskill("GUN") > 0 |goto Ironforge 61.17,89.52
|only if Hunter
step
talk Toldren Deepiron##5143
|tip Inside the building.
Train Abilities |trainer Toldren Deepiron##5143 |goto Ironforge/0 25.21,10.74 |q 34 |future
|only if Priest
step
talk Beldruk Doombrow##5148
|tip Inside the building.
Train Abilities |trainer Beldruk Doombrow##5148 |goto Ironforge/0 24.55,4.48 |q 34 |future
|only if Paladin
step
talk Briarthorn##5172
|tip Inside the building.
Train Abilities |trainer Briarthorn##5172 |goto Ironforge/0 50.35,5.66 |q 34 |future
|only if Warlock
step
talk Jubahl Corpseseeker##6382
|tip Buy available Grimoires.
|tip Inside the building.
Train Demon Abilities |vendor Jubahl Corpseseeker##6382 |goto Ironforge/0 50.35,5.66 |q 34 |future
|only if Warlock
step
talk Fenthwick##5167
|tip Inside the building.
Train Abilities |trainer Fenthwick##5167 |goto Ironforge/0 65.90,88.41 |q 34 |future
|only if Rogue
step
talk Bixi Wobblebonk##13084
|tip Inside the building.
Train Thrown |complete weaponskill("THROWN") > 0 |goto Ironforge 62.23,89.62
|only if Warrior
step
talk Buliwyf Stonehand##11865
|tip Inside the building.
Train Guns		|complete weaponskill("GUN") > 0	|goto Ironforge 61.17,89.52	|only if Hunter or Warrior or Rogue
Train Two-Handed Axes	|complete weaponskill("TH_AXE") > 0	|goto Ironforge 61.17,89.52	|only if Hunter or Warrior or Paladin
Train Two-Handed Maces	|complete weaponskill("TH_MACE") > 0	|goto Ironforge 61.17,89.52	|only if Warrior
Train One-Handed Maces	|complete weaponskill("MACE") > 0	|goto Ironforge 61.17,89.52	|only if Rogue
|only if Hunter or Warrior or Rogue or Paladin
step
talk Gryth Thurden##1573
fpath Ironforge |goto Ironforge 55.50,47.75
|only if NightElf
step
Enter the Deeprun Tram |complete subzone("Deeprun Tram") |goto Ironforge 76.58,51.14 |q 34 |future
|tip Walk into the portal.
|only if NightElf
step
_Inside Deeprun Tram:_
Ride the Tram
|tip Ride the tram to Stormwind City.
Enter Stormwind City |complete zone("Stormwind City") |q 34 |future
|tip Walk into the portal.
|only if NightElf
step
talk Larimaine Purdue##2485
|tip Upstairs inside the tower.
learnspell Teleport: Stormwind##3561 |goto Stormwind City 39.84,79.45
|only if Mage
step
Enter the building |goto Stormwind City 43.05,34.48 < 15 |walk |only if not subzone("Cathedral of Light")
talk Duthorian Rall##6171
|tip Inside the building.
accept The Tome of Valor##1650 |goto Stormwind City 39.81,29.80
|only if Paladin
step
talk Master Mathias Shaw##332
|tip Upstairs inside the building.
accept Mathias and the Defias##2360 |goto Stormwind City 75.78,59.85
|only if Rogue
step
talk Woo Ping##11867
|tip Inside the building.
Train Two-Handed Swords		|complete weaponskill("TH_SWORD") > 0	|goto Stormwind City 57.13,57.71	|only if Warrior or Paladin or Hunter
Train Staves			|complete weaponskill("TH_STAFF") > 0	|goto Stormwind City 57.13,57.71	|only if Warrior or Warlock or Priest
Train One-Handed Swords		|complete weaponskill("SWORD") > 0	|goto Stormwind City 57.13,57.71	|only if Warlock or Rogue or Mage
Train Daggers			|complete weaponskill("DAGGER") > 0	|goto Stormwind City 57.13,57.71	|only if Mage
|only if Warrior or Paladin or Hunter or Warlock or Priest or Rogue or Mage
step
talk Auctioneer Jaxon##15659
|tip Buy from the Auction House, if possible.
|tip Inside the building.
buy Bronze Tube##4371 |goto Stormwind City/0 53.61,59.76 |q 174 |future
|tip Needed for quest in Duskwood soon.
step
Run up the ramp |goto Stormwind City 62.39,62.31 < 10 |only if walking
talk Dungar Longdrink##352
|tip Inside the building.
fpath Stormwind |goto Stormwind City 66.27,62.14
]])
GoatQuest:RegisterGuide("Leveling Guides\\Redridge Mountains (26-27)",{
image=GQ.IMAGESDIR.."Redridge Mountains",
next="Leveling Guides\\Duskwood (27-32)",
},[[
step
talk Ariena Stormfeather##931
fpath Lakeshire |goto Redridge Mountains 30.59,59.41
step
talk Bailiff Conacher##900
|tip Inside the building.
accept Solomon's Law##91 |goto Redridge Mountains 29.72,44.26
step
click Wanted: Lieutenant Fangore
accept Wanted: Lieutenant Fangore##180 |goto Redridge Mountains 26.75,46.47
step
talk Martie Jainrose##342
accept An Unwelcome Guest##34 |goto Redridge Mountains 21.86,46.33
step
kill Bellygrub##345
|tip Darker brown boar.
|tip Walks around.
collect Bellygrub's Tusk##3631 |q 34/1 |goto Redridge Mountains 15.68,49.32
step
talk Martie Jainrose##342
turnin An Unwelcome Guest##34 |goto Redridge Mountains 21.86,46.33
stickystart "Collect_Shadowhide_Pendants"
step
kill Lieutenant Fangore##703
|tip Gnoll with red robe and long sword.
|tip Walks around.
|tip Careful, enemies pull with him.
collect Fangore's Paw##3632 |q 180/1 |goto Redridge Mountains 79.80,37.40
|mapmarker Redridge Mountains/0 77.40,39.20
|mapmarker Redridge Mountains/0 78.00,36.20
|mapmarker Redridge Mountains/0 78.60,34.20
|mapmarker Redridge Mountains/0 79.40,40.00
|mapmarker Redridge Mountains/0 80.60,35.20
|mapmarker Redridge Mountains/0 81.00,42.20
|mapmarker Redridge Mountains/0 81.60,38.60
step
label "Collect_Shadowhide_Pendants"
kill Rabid Shadowhide Gnoll##434, Shadowhide Gnoll##433, Shadowhide Brute##432, Shadowhide Assassin##579, Shadowhide Warrior##568, Shadowhide Darkweaver##429, Shadowhide Slayer##431
|tip Gnolls.
collect 10 Shadowhide Pendant##1075 |q 91/1 |goto Redridge Mountains 75.40,42.60
|mapmarker Redridge Mountains/0 68.00,46.60
|mapmarker Redridge Mountains/0 69.20,42.20
|mapmarker Redridge Mountains/0 70.40,48.80
|mapmarker Redridge Mountains/0 71.20,44.80
|mapmarker Redridge Mountains/0 71.40,52.20
|mapmarker Redridge Mountains/0 71.40,58.40
|mapmarker Redridge Mountains/0 72.20,40.40
|mapmarker Redridge Mountains/0 72.60,55.20
|mapmarker Redridge Mountains/0 73.20,47.20
|mapmarker Redridge Mountains/0 74.40,51.20
|mapmarker Redridge Mountains/0 76.60,45.80
|mapmarker Redridge Mountains/0 77.20,54.20
|mapmarker Redridge Mountains/0 77.60,50.80
|mapmarker Redridge Mountains/0 73.80,39.60
|mapmarker Redridge Mountains/0 76.40,37.20
|mapmarker Redridge Mountains/0 77.60,34.20
|mapmarker Redridge Mountains/0 78.40,40.80
|mapmarker Redridge Mountains/0 80.20,37.40
|mapmarker Redridge Mountains/0 80.80,43.40
|mapmarker Redridge Mountains/0 81.60,40.20
step
talk Bailiff Conacher##900
|tip Inside the building.
turnin Solomon's Law##91 |goto Redridge Mountains 29.71,44.27
step
talk Magistrate Solomon##344
|tip Inside the building.
turnin Wanted: Lieutenant Fangore##180 |goto Redridge Mountains 29.99,44.46
]])
GoatQuest:RegisterGuide("Leveling Guides\\Duskwood (27-32)",{
image=GQ.IMAGESDIR.."Duskwood",
next="Leveling Guides\\Wetlands (32-33)",
},[[
step
talk Madame Eva##265
|tip Walks around.
|tip Inside the building.
accept The Legend of Stalvan##66 |goto Duskwood 75.82,45.29
accept The Totem of Infliction##101 |goto Duskwood 75.82,45.29
step
talk Innkeeper Trelayne##6790
|tip Inside the building.
home Darkshire |goto Duskwood 73.87,44.41 |q 1247 |future
step
talk Commander Althea Ebonlocke##264
|tip Walks around.
accept The Night Watch##56 |goto Duskwood 73.60,46.90
step
talk Clerk Daltry##267
|tip Walks around.
|tip Inside the building.
turnin The Legend of Stalvan##66 |goto Duskwood 72.52,46.85
accept The Legend of Stalvan##67 |goto Duskwood 72.52,46.85
step
talk Elaine Carevin##633
|tip Inside the building.
accept Raven Hill##163 |goto Duskwood 75.33,48.69
accept The Hermit##165 |goto Duskwood 75.33,48.69
accept Deliveries to Sven##164 |goto Duskwood 75.33,48.69
step
talk Felicia Maline##2409
fpath Darkshire |goto Duskwood 77.49,44.29
step
talk Viktori Prism'Antras##276
|tip Walks around.
|tip Inside the building.
accept Look To The Stars##174 |goto Duskwood 79.80,48.02
step
talk Viktori Prism'Antras##276
|tip Walks around.
|tip Inside the building.
turnin Look To The Stars##174 |goto Duskwood 79.80,48.02
accept Look To The Stars##175 |goto Duskwood 79.80,48.02
step
talk Blind Mary##302
|tip Walks around.
|tip Inside the building.
turnin Look To The Stars##175 |goto Duskwood 81.99,59.09
accept Look To The Stars##177 |goto Duskwood 81.99,59.09
stickystart "Collect_Skeleton_Fingers"
stickystart "Kill_Skeletal_Mages_And_Warriors"
step
kill Insane Ghoul##511
|tip Red ghoul.
|tip Walks around.
|tip Inside and outside the building.
collect Mary's Looking Glass##1946 |q 177/1 |goto Duskwood 80.94,71.40
step
label "Collect_Skeleton_Fingers"
kill Skeletal Mage##203, Skeletal Warrior##48
collect 10 Skeleton Finger##2378 |q 101/3 |goto Duskwood 80.40,70.20
|mapmarker Duskwood/0 77.20,70.20
|mapmarker Duskwood/0 77.20,73.60
|mapmarker Duskwood/0 77.40,68.00
|mapmarker Duskwood/0 79.40,68.20
|mapmarker Duskwood/0 80.40,66.40
|mapmarker Duskwood/0 80.60,72.20
|mapmarker Duskwood/0 81.80,68.40
step
label "Kill_Skeletal_Mages_And_Warriors"
kill 6 Skeletal Mage##203 |q 56/2 |goto Duskwood 80.40,70.20
kill 8 Skeletal Warrior##48 |q 56/1 |goto Duskwood 80.40,70.20
|mapmarker Duskwood/0 77.20,70.20
|mapmarker Duskwood/0 77.20,73.60
|mapmarker Duskwood/0 77.40,68.00
|mapmarker Duskwood/0 79.40,68.20
|mapmarker Duskwood/0 80.40,66.40
|mapmarker Duskwood/0 80.60,72.20
|mapmarker Duskwood/0 81.80,68.40
step
_NOTE:_
Avoid Stitches in Duskwood
|tip Stitches is a {o}level 35 elite abomination{}.
|tip Walks along the main road between Darkshire and Raven Hill.
Click Here to Continue |confirm |q 163
|only if hardcore()
stickystart "Collect_Vials_Of_Spider_Venom_And_Gooey_Spider_Legs"
step
talk Jitters##288
|tip Walks around.
turnin Raven Hill##163 |goto Duskwood 18.16,56.51
step
talk Agent Kearnen##7024
turnin Mathias and the Defias##2360 |goto Westfall 68.49,70.08
accept Klaven's Tower##2359 |goto Westfall 68.49,70.08
|only if Rogue
step
collect Defias Tower Key##7923 |q 2359/2 |goto Westfall 71.63,73.91
|tip Cast {o}Pickpocket{} on a Malformed Defias Drone.
|tip Walks around.
|only if Rogue
step
click Duskwood Chest
|tip {o}Sap{} Klaven Mortwake {o}before clicking the chest{}.
|tip You get a debuff after opening it.
|tip {o}Top floor{} inside the building.
collect Klaven Mortwake's Journal##7908 |q 2359/1 |goto Westfall 70.41,73.93
|only if Rogue
step
talk Sven Yorgen##311
|tip Walks around.
turnin Deliveries to Sven##164 |goto Duskwood/0 7.79,34.00
accept Sven's Revenge##95 |goto Duskwood/0 7.79,34.00
step
talk Abercrombie##289
|tip Inside the building.
turnin The Hermit##165 |goto Duskwood 28.11,31.47
accept Supplies from Darkshire##148 |goto Duskwood 28.11,31.47
step
label "Collect_Vials_Of_Spider_Venom_And_Gooey_Spider_Legs"
kill Black Widow Hatchling##930, Carrion Recluse##949, Green Recluse##569, Venom Web Spider##217, Pygmy Venom Web Spider##539
|tip Spiders.
collect 5 Vial of Spider Venom##1130 |q 101/2 |goto Duskwood 32.80,35.20
|mapmarker Duskwood/0 25.40,52.00
|mapmarker Duskwood/0 26.80,46.00
|mapmarker Duskwood/0 27.20,40.00
|mapmarker Duskwood/0 28.20,49.20
|mapmarker Duskwood/0 29.00,52.40
|mapmarker Duskwood/0 29.20,34.40
|mapmarker Duskwood/0 29.40,56.20
|mapmarker Duskwood/0 29.80,44.80
|mapmarker Duskwood/0 31.20,50.00
|mapmarker Duskwood/0 31.40,39.40
|mapmarker Duskwood/0 31.40,59.40
|mapmarker Duskwood/0 32.00,42.40
|mapmarker Duskwood/0 32.20,32.20
|mapmarker Duskwood/0 33.20,45.60
|mapmarker Duskwood/0 34.40,54.40
|mapmarker Duskwood/0 34.60,59.40
|mapmarker Duskwood/0 36.80,56.40
step
kill Flesh Eater##3, Rotted One##948, Bone Chewer##210, Plague Spreader##604, Brain Eater##570
|tip Ghouls.
|tip Inside and outside the crypt.
collect 10 Ghoul Fang##1129 |q 101/1 |goto Duskwood 23.59,34.89
|mapmarker Duskwood/0 21.40,33.40
|mapmarker Duskwood/0 21.40,36.40
|mapmarker Duskwood/0 23.20,39.60
|mapmarker Duskwood/0 24.40,33.00
|mapmarker Duskwood/0 25.20,36.00
step
Leave the crypt |goto Duskwood 23.59,34.89 < 15 |walk |only if subzone("Dawning Wood Catacombs") and indoors()
talk Thor##523
fpath Sentinel Hill |goto Westfall 56.55,52.64
step
click Old Footlocker
|tip You will be attacked.
|tip Inside the building.
turnin The Legend of Stalvan##67 |goto Westfall 41.51,66.73
accept The Legend of Stalvan##68 |goto Westfall 41.51,66.73
step
Follow the path up through the mountains |goto Westfall 52.64,72.27 < 60 |only if walking
Follow the path around the mountain |goto Westfall/0 38.75,83.72 < 30 |only if walking
talk Daphne Stilwell##6182
|tip Walks around.
turnin The Tome of Valor##1650 |goto Westfall 42.33,88.64
accept The Tome of Valor##1651 |goto Westfall 42.33,88.64
|only if Paladin
step
Watch the dialogue
Kill the enemies that attack in waves
Protect Daphne Stilwell |q 1651/1 |goto Westfall 42.33,88.64
|only if Paladin
step
talk Daphne Stilwell##6182
|tip Walks around.
turnin The Tome of Valor##1651 |goto Westfall 41.68,89.09
accept The Tome of Valor##1652 |goto Westfall 41.68,89.09
|only if Paladin
step
click Strange Lockbox
|tip Underwater.
collect Half Pendant of Aquatic Endurance##15882 |goto Westfall 17.87,33.11 |q 272
|only if Druid
step
use Half Pendant of Aquatic Agility##15883
collect Pendant of the Sea Lion##15885 |q 272/1 |goto Moonglade 35.92,41.42
|only if Druid
step
talk Dendrite Starblaze##11802
|tip Upstairs inside the building.
turnin Trial of the Sea Lion##272 |goto Moonglade 56.21,30.64
accept Aquatic Form##5061 |goto Moonglade 56.21,30.64
|only if Druid
step
talk Loganaar##12042
Train Abilities |trainer Loganaar##12042 |goto Moonglade/0 52.53,40.57 |q 5061
|only if Druid
step
talk Mathrengyl Bearwalker##4217
|tip {o}Top floor{} inside the building.
turnin Aquatic Form##5061 |goto Darnassus 35.38,8.41
|only if Druid
step
talk Commander Althea Ebonlocke##264
|tip Walks around.
turnin The Night Watch##56 |goto Duskwood 73.59,46.90
accept The Night Watch##57 |goto Duskwood 73.59,46.90
step
talk Clerk Daltry##267
|tip Walks around.
|tip Inside the building.
turnin The Legend of Stalvan##68 |goto Duskwood 72.52,46.85
accept The Legend of Stalvan##69 |goto Duskwood 72.52,46.85
step
talk Madame Eva##265
|tip Walks around.
|tip Inside the building.
turnin The Totem of Infliction##101 |goto Duskwood 75.81,45.29
turnin Supplies from Darkshire##148 |goto Duskwood 75.81,45.29
accept Ghost Hair Thread##149 |goto Duskwood 75.81,45.29
step
talk Viktori Prism'Antras##276
|tip Walks around.
|tip Inside the building.
turnin Look To The Stars##177 |goto Duskwood 79.80,48.02
accept Look To The Stars##181 |goto Duskwood 79.80,48.02
step
talk Blind Mary##302
|tip Walks around.
|tip Inside the building.
turnin Ghost Hair Thread##149 |goto Duskwood 81.98,59.09
accept Return the Comb##154 |goto Duskwood 81.98,59.09
step
talk Madame Eva##265
|tip Walks around.
|tip Inside the building.
turnin Return the Comb##154 |goto Duskwood 75.81,45.29
accept Deliver the Thread##157 |goto Duskwood 75.81,45.29
step
talk Calor##663
|tip Walks around.
accept Worgen in the Woods##173 |goto Duskwood 75.30,48.05
step
kill 6 Nightbane Shadow Weaver##533 |q 173/1 |goto Duskwood 62.40,42.40
|mapmarker Duskwood/0 57.60,27.40
|mapmarker Duskwood/0 58.20,30.40
|mapmarker Duskwood/0 58.80,49.60
|mapmarker Duskwood/0 59.80,44.40
|mapmarker Duskwood/0 60.80,37.60
|mapmarker Duskwood/0 61.20,33.40
|mapmarker Duskwood/0 61.80,51.40
|mapmarker Duskwood/0 63.80,37.60
|mapmarker Duskwood/0 64.40,46.40
|mapmarker Duskwood/0 66.00,40.80
|mapmarker Duskwood/0 67.40,46.40
step
talk Calor##663
|tip Walks around.
turnin Worgen in the Woods##173 |goto Duskwood 75.30,48.05
accept Worgen in the Woods##221 |goto Duskwood 75.30,48.05
stickystart "Kill_Nightbane_Dark_Runners"
step
kill Nightbane Dark Runner##205, Nightbane Shadow Weaver##533, Nightbane Worgen##898
|tip Worgen.
collect An Old History Book##2794 |n
use An Old History Book##2794
accept An Old History Book##337 |goto Duskwood 67.00,43.20
|mapmarker Duskwood/0 59.00,40.00
|mapmarker Duskwood/0 59.80,45.00
|mapmarker Duskwood/0 61.20,37.40
|mapmarker Duskwood/0 62.40,47.60
|mapmarker Duskwood/0 62.40,53.80
|mapmarker Duskwood/0 63.60,44.80
|mapmarker Duskwood/0 64.20,51.40
|mapmarker Duskwood/0 66.20,47.20
|mapmarker Duskwood/0 61.40,42.00
step
label "Kill_Nightbane_Dark_Runners"
kill 12 Nightbane Dark Runner##205 |q 221/1 |goto Duskwood 67.00,43.20
|mapmarker Duskwood/0 59.00,40.00
|mapmarker Duskwood/0 59.80,45.00
|mapmarker Duskwood/0 61.20,37.40
|mapmarker Duskwood/0 62.40,47.60
|mapmarker Duskwood/0 62.40,53.80
|mapmarker Duskwood/0 63.60,44.80
|mapmarker Duskwood/0 64.20,51.40
|mapmarker Duskwood/0 66.20,47.20
|mapmarker Duskwood/0 61.40,42.00
step
talk Calor##663
|tip Walks around.
turnin Worgen in the Woods##221 |goto Duskwood 75.30,48.05
step
click Mound of loose dirt
|tip Careful, stealthed enemies.
turnin Sven's Revenge##95 |goto Duskwood 49.86,77.70
accept Sven's Camp##230 |goto Duskwood 49.86,77.70
step
talk Abercrombie##289
|tip Inside the building.
turnin Deliver the Thread##157 |goto Duskwood 28.11,31.47
accept Zombie Juice##158 |goto Duskwood 28.11,31.47
step
talk Sven Yorgen##311
|tip Walks around.
turnin Sven's Camp##230 |goto Duskwood/0 7.79,34.00
accept The Shadowy Figure##262 |goto Duskwood/0 7.79,34.00
step
talk Innkeeper Farley##295
|tip Inside the building.
turnin The Legend of Stalvan##69 |goto Elwynn Forest 43.77,65.80
accept The Legend of Stalvan##70 |goto Elwynn Forest 43.77,65.80
step
click Storage Chest
|tip Upstairs inside the building.
collect An Undelivered Letter##910 |q 70/1 |goto Elwynn Forest 44.29,65.82
step
talk Elsharin##5498
|tip Top of the tower.
Train Abilities |trainer Elsharin##5498 |goto Stormwind City/0 36.87,81.13 |q 262
|only if Mage
step
Enter the building |goto Stormwind City 43.05,34.48 < 15 |walk |only if not subzone("Cathedral of Light")
talk Duthorian Rall##6171
|tip Inside the building.
turnin The Tome of Valor##1652 |goto Stormwind City 39.81,29.80
|only if Paladin
step
talk Katherine the Pure##5492
|tip Inside the building.
Train Abilities |trainer Katherine the Pure##5492 |goto Stormwind City/0 37.22,31.85 |q 70
|only if Paladin
step
talk Osborne the Night Man##918
Train Abilities |trainer Osborne the Night Man##918 |goto Stormwind City/0 74.64,52.82 |q 70
|only if Rogue
step
talk Master Mathias Shaw##332
|tip Upstairs inside the building.
turnin Klaven's Tower##2359 |goto Stormwind City 75.78,59.85
accept The Touch of Zanzil##2607 |goto Stormwind City 75.78,59.85
|only if Rogue
step
talk Doc Mixilpixil##7207
|tip Downstairs inside the building.
turnin The Touch of Zanzil##2607 |goto Stormwind City 78.04,58.77
accept The Touch of Zanzil##2608 |goto Stormwind City 78.04,58.77
|only if Rogue
step
Watch the dialogue
|tip Type {o}/sit{} in chat while targeting Doc Mixilpixil.
Complete the Diagnosis |q 2608/1 |goto Stormwind City 78.04,58.77
|only if Rogue
step
talk Doc Mixilpixil##7207
|tip Downstairs inside the building.
turnin The Touch of Zanzil##2608 |goto Stormwind City 78.04,58.77
|only if Rogue
step
Remove the Touch of Zanzil |nobuff Touch of Zanzil##9991
|tip Multiple options.
|tip Create {o}Anti-Venom{} with First Aid.
|tip Buy {o}Jungle Remedy{} from Auction House.
|tip Ask a {o}Druid{} to cast {o}Cure Poison{} on you.
|tip Cast {o}Stoneform{} to remove the buff.	|only if Dwarf
|only if Rogue
step
talk Einris Brightspear##5515
|tip Inside the building.
Train Abilities |trainer Einris Brightspear##5515 |goto Stormwind City/0 61.61,15.27 |q 70
|only if Hunter
step
Enter the building |goto Stormwind City 43.05,34.48 < 15 |walk |only if not subzone("Cathedral of Light")
talk Brother Benjamin##5484
|tip Walks around.
|tip Inside the building.
Train Abilities |trainer Brother Benjamin##5484 |goto Stormwind City/0 41.32,28.44 |q 70
|only if Priest
step
talk Wu Shen##5479
|tip Upstairs inside the building.
Train Abilities |trainer Wu Shen##5479 |goto Stormwind City/0 78.68,45.80 |q 70
|only if Warrior
step
talk Caretaker Folsom##297
turnin The Legend of Stalvan##70 |goto Stormwind City 29.58,61.93
accept The Legend of Stalvan##72 |goto Stormwind City 29.58,61.93
step
click Sealed Crate
|tip You will be attacked.
turnin The Legend of Stalvan##72 |goto Stormwind City 29.46,61.58
accept The Legend of Stalvan##74 |goto Stormwind City 29.46,61.58
step
Enter the building |goto Stormwind City 29.19,74.12 < 10 |walk |only if not (subzone("The Slaughtered Lamb") and indoors())
talk Demisette Cloyce##461
|tip Downstairs inside the building.
Train Abilities |trainer Demisette Cloyce##461 |goto Stormwind City/0 25.28,78.22 |q 262
|only if Warlock
step
talk Spackle Thornberry##5520
|tip Buy available Grimoires.
|tip Downstairs inside the building.
Train Demon Abilities |vendor Spackle Thornberry##5520 |goto Stormwind City/0 25.66,77.65 |q 262
|only if Warlock
step
talk Madame Eva##265
|tip Walks around.
|tip Inside the building.
turnin The Shadowy Figure##262 |goto Duskwood 75.81,45.29
accept The Shadowy Search Continues##265 |goto Duskwood 75.81,45.29
step
talk Clerk Daltry##267
|tip Walks around.
|tip Inside the building.
turnin The Shadowy Search Continues##265 |goto Duskwood 72.53,46.85
accept Inquire at the Inn##266 |goto Duskwood 72.53,46.85
step
talk Tavernkeep Smitts##273
|tip Walks around.
|tip Inside the building.
turnin Zombie Juice##158 |goto Duskwood 73.78,44.48
accept Gather Rot Blossoms##156 |goto Duskwood 73.78,44.48
turnin Inquire at the Inn##266 |goto Duskwood 73.78,44.48
accept Finding the Shadowy Figure##453 |goto Duskwood 73.78,44.48
step
talk Jitters##288
|tip Walks around.
turnin Finding the Shadowy Figure##453 |goto Duskwood 18.14,56.52
accept Return to Sven##268 |goto Duskwood 18.14,56.52
stickystart "Kill_Skeletal_Fiends_And_Horrors"
step
kill Skeletal Fiend##531, Skeletal Horror##202
|tip Fiends and Horrors.
collect 8 Rot Blossom##1598 |q 156/1 |goto Duskwood 17.60,46.40
|mapmarker Duskwood/0 14.40,42.20
|mapmarker Duskwood/0 14.40,46.40
|mapmarker Duskwood/0 20.60,46.40
|mapmarker Duskwood/0 21.40,43.20
|mapmarker Duskwood/0 22.80,40.40
|mapmarker Duskwood/0 24.20,45.60
step
label "Kill_Skeletal_Fiends_And_Horrors"
kill 15 Skeletal Fiend##531 |q 57/1 |goto Duskwood 17.60,46.40
kill 15 Skeletal Horror##202 |q 57/2 |goto Duskwood 17.60,46.40
|mapmarker Duskwood/0 14.40,42.20
|mapmarker Duskwood/0 14.40,46.40
|mapmarker Duskwood/0 20.60,46.40
|mapmarker Duskwood/0 21.40,43.20
|mapmarker Duskwood/0 22.80,40.40
|mapmarker Duskwood/0 24.20,45.60
step
talk Sven Yorgen##311
|tip Walks around.
turnin Return to Sven##268 |goto Duskwood/0 7.79,34.00
accept Proving Your Worth##323 |goto Duskwood/0 7.79,34.00
step
kill 3 Skeletal Warder##785 |q 323/3 |goto Duskwood/0 15.88,38.72
kill 3 Skeletal Healer##787 |q 323/2 |goto Duskwood/0 15.88,38.72
kill 15 Skeletal Raider##1110 |q 323/1 |goto Duskwood/0 15.88,38.72
|tip Inside and outside the crypt.
|tip Avoid Mor'Ladim, {o}level 35 elite skeleton{}.
|tip Walks around outside the crypt.
|mapmarker Duskwood/0 14.00,36.40
|mapmarker Duskwood/0 15.40,33.40
|mapmarker Duskwood/0 16.60,37.40
|mapmarker Duskwood/0 16.80,30.20
|mapmarker Duskwood/0 17.00,35.20
|mapmarker Duskwood/0 17.40,32.40
|mapmarker Duskwood/0 18.40,39.60
step
Run up the stairs and leave the crypt |goto Duskwood/0 15.88,38.72 < 10 |walk |only if subzone("Dawning Wood Catacombs") and indoors()
talk Sven Yorgen##311
|tip Walks around.
turnin Proving Your Worth##323 |goto Duskwood/0 7.79,34.00
accept Seeking Wisdom##269 |goto Duskwood/0 7.79,34.00
step
talk Loganaar##12042
Train Abilities |trainer Loganaar##12042 |goto Moonglade/0 52.53,40.57 |q 156
|only if Druid
step
talk Tavernkeep Smitts##273
|tip Walks around.
|tip Inside the building.
turnin Gather Rot Blossoms##156 |goto Duskwood 73.78,44.48
accept Juice Delivery##159 |goto Duskwood 73.78,44.48
step
talk Commander Althea Ebonlocke##264
|tip Walks around.
turnin The Night Watch##57 |goto Duskwood 73.60,46.90
step
talk Marshal Haggard##294
turnin The Legend of Stalvan##74 |goto Elwynn Forest 84.61,69.38
accept The Legend of Stalvan##75 |goto Elwynn Forest 84.61,69.38
step
click Marshal Haggard's Chest
|tip You will be attacked.
|tip Upstairs inside the building.
collect A Faded Journal Page##921 |q 75/1 |goto Elwynn Forest 85.69,69.55
step
talk Marshal Haggard##294
turnin The Legend of Stalvan##75 |goto Elwynn Forest 84.61,69.38
accept The Legend of Stalvan##78 |goto Elwynn Forest 84.61,69.38
step
talk Tavernkeep Smitts##273
|tip Walks around.
|tip Inside the building.
turnin The Legend of Stalvan##78 |goto Duskwood 73.78,44.48
accept The Legend of Stalvan##79 |goto Duskwood 73.78,44.48
step
talk Commander Althea Ebonlocke##264
|tip Walks around.
turnin The Legend of Stalvan##79 |goto Duskwood 73.59,46.89
accept The Legend of Stalvan##80 |goto Duskwood 73.59,46.89
step
talk Clerk Daltry##267
|tip Walks around.
|tip Inside the building.
turnin The Legend of Stalvan##80 |goto Duskwood 72.52,46.85
accept The Legend of Stalvan##97 |goto Duskwood 72.52,46.85
step
talk Commander Althea Ebonlocke##264
|tip Walks around.
turnin The Legend of Stalvan##97 |goto Duskwood 73.59,46.89
accept The Legend of Stalvan##98 |goto Duskwood 73.59,46.89
accept The Night Watch##58 |goto Duskwood 73.60,46.90
step
talk Elsharin##5498
|tip Top of the tower.
Train Abilities |trainer Elsharin##5498 |goto Stormwind City/0 36.87,81.13 |q 1274 |future
|only if Mage
step
Enter the building |goto Stormwind City 29.19,74.12 < 10 |walk |only if not (subzone("The Slaughtered Lamb") and indoors())
talk Demisette Cloyce##461
|tip Downstairs inside the building.
Train Abilities |trainer Demisette Cloyce##461 |goto Stormwind City/0 25.28,78.22 |q 1274 |future
|only if Warlock
step
talk Spackle Thornberry##5520
|tip Buy available Grimoires.
|tip Downstairs inside the building.
Train Demon Abilities |vendor Spackle Thornberry##5520 |goto Stormwind City/0 25.66,77.65 |q 1274 |future
|only if Warlock
step
Enter the building |goto Stormwind City 43.05,34.48 < 15 |walk |only if not subzone("Cathedral of Light")
talk Thomas##4982
|tip Walks around.
|tip Inside the building. |notinsticky
accept The Missing Diplomat##1274 |goto Stormwind City 40.37,29.40
step
talk Bishop Farthing##1212
|tip Inside the building.
turnin Seeking Wisdom##269 |goto Stormwind City 39.13,27.90
accept The Doomed Fleet##270 |goto Stormwind City 39.13,27.90
step
talk Katherine the Pure##5492
|tip Inside the building.
Train Abilities |trainer Katherine the Pure##5492 |goto Stormwind City/0 37.22,31.85 |q 1274
|only if Paladin
step
talk Brother Benjamin##5484
|tip Walks around.
|tip Inside the building.
Train Abilities |trainer Brother Benjamin##5484 |goto Stormwind City/0 41.32,28.44 |q 1274
|only if Priest
step
talk Einris Brightspear##5515
|tip Inside the building.
Train Abilities |trainer Einris Brightspear##5515 |goto Stormwind City/0 61.61,15.27 |q 1274
|only if Hunter
step
talk Karrina Mekenda##2879
|tip Inside the building.
Train Pet Abilities |trainer Karrina Mekenda##2879 |goto Stormwind City/0 61.58,16.00 |q 1274
|only if Hunter
step
Enter Stormwind Keep |goto Stormwind City 69.07,28.77 < 15 |walk
talk Bishop DeLavey##4960
|tip Walks around.
|tip Inside the building.
turnin The Missing Diplomat##1274 |goto Stormwind City 78.30,25.44
accept The Missing Diplomat##1241 |goto Stormwind City 78.30,25.44
step
talk Milton Sheaf##1440
|tip Inside the building.
turnin An Old History Book##337 |goto Stormwind City 74.17,7.49
accept Southshore##538 |goto Stormwind City 74.17,7.49
step
talk Wu Shen##5479
|tip Upstairs inside the building.
Train Abilities |trainer Wu Shen##5479 |goto Stormwind City/0 78.68,45.80 |q 1241
|only if Warrior
step
talk Wu Shen##5479
|tip Upstairs inside the building.
accept The Islander##1718 |goto Stormwind City 78.68,45.80
|only if Warrior
step
talk Osborne the Night Man##918
Train Abilities |trainer Osborne the Night Man##918 |goto Stormwind City/0 74.64,52.82 |q 1241
|only if Rogue
step
talk Jorgen##4959
|tip Next to the water.
turnin The Missing Diplomat##1241 |goto Stormwind City 73.17,78.42
accept The Missing Diplomat##1242 |goto Stormwind City 73.17,78.42
step
talk Elling Trias##482
|tip Upstairs inside the building.
turnin The Missing Diplomat##1242 |goto Stormwind City 59.91,64.17
accept The Missing Diplomat##1243 |goto Stormwind City 59.91,64.17
step
map Duskwood
path follow strictbounce;	loop off;	ants straight;		dist 30;	markers none;		arrow hide
path	74.82,44.16	74.53,41.22	73.87,39.60	72.74,38.35	72.28,37.28
path	72.24,35.19	72.58,33.53	73.31,32.54
talk Watcher Backus##840
|tip Walks along the road.
turnin The Missing Diplomat##1243
accept The Missing Diplomat##1244
step
kill Stalvan Mistmantle##315
|tip Inside or outside the building. |notinsticky
collect Mistmantle Family Ring##3629 |q 98/1 |goto Duskwood 77.35,36.19
step
talk Madame Eva##265
|tip Walks around.
|tip Inside the building.
turnin The Legend of Stalvan##98 |goto Duskwood 75.82,45.29
step
talk Calor##663
|tip Walks around.
accept Worgen in the Woods##222 |goto Duskwood 75.30,48.05
step
kill 8 Nightbane Tainted One##920 |q 222/2 |goto Duskwood 73.03,75.08
|tip Inside the mine.
kill 8 Nightbane Vile Fang##206 |q 222/1 |goto Duskwood 73.03,75.08
|tip Outside the mine.
|mapmarker Duskwood/0 74.00,79.60
|mapmarker Duskwood/0 74.20,77.40
|mapmarker Duskwood/0 69.40,71.20
|mapmarker Duskwood/0 71.20,72.60
|mapmarker Duskwood/0 71.40,68.40
|mapmarker Duskwood/0 72.20,70.60
|mapmarker Duskwood/0 72.40,66.40
|mapmarker Duskwood/0 73.40,68.40
|mapmarker Duskwood/0 73.60,72.60
step
talk Abercrombie##289
|tip Inside the building.
turnin Juice Delivery##159 |goto Duskwood 28.11,31.47
accept Ghoulish Effigy##133 |goto Duskwood 28.11,31.47
stickystart "Kill_Plague_Spreaders"
step
kill Flesh Eater##3, Bone Chewer##210, Plague Spreader##604, Rotted One##948, Brain Eater##570
|tip Ghouls.
|tip Inside and outside the crypt.
collect 7 Ghoul Rib##884 |q 133/1 |goto Duskwood 23.59,34.89
|mapmarker Duskwood/0 21.40,33.40
|mapmarker Duskwood/0 21.40,36.40
|mapmarker Duskwood/0 23.20,39.60
|mapmarker Duskwood/0 24.40,33.00
|mapmarker Duskwood/0 25.20,36.00
step
label "Kill_Plague_Spreaders"
kill 20 Plague Spreader##604 |q 58/1 |goto Duskwood 23.59,34.89
|tip Shared spawns with other ghouls.
|tip Inside and outside the crypt. |notinsticky
|mapmarker Duskwood/0 21.40,33.40
|mapmarker Duskwood/0 21.40,36.40
|mapmarker Duskwood/0 23.20,39.60
|mapmarker Duskwood/0 24.40,33.00
|mapmarker Duskwood/0 25.20,36.00
step
Leave the crypt |goto Duskwood 23.63,34.92 < 15 |walk |only if subzone("Dawning Wood Catacombs") and indoors()
talk Abercrombie##289
|tip Inside the building.
turnin Ghoulish Effigy##133 |goto Duskwood 28.11,31.47
accept Ogre Thieves##134 |goto Duskwood 28.11,31.47
step
click Defias Strongbox
|tip Inside the building.
collect Defias Docket##5947 |q 1244/1 |goto Duskwood 23.93,72.07
step
click Abercrombie's Crate
collect Abercrombie's Crate##1349 |q 134/1 |goto Duskwood 33.42,76.34
step
Enter the cave |goto Duskwood 34.08,77.02 < 15 |walk |only if not (subzone("Vul'Gol Ogre Mound") and indoors())
kill Zzarc' Vul##300
|tip Inside the cave.
|tip Multiple locations.
collect Ogre's Monocle##1968 |q 181/1 |goto Duskwood/0 36.06,80.58
|mapmarker Duskwood/0 35.00,81.40
|mapmarker Duskwood/0 36.80,83.20
|mapmarker Duskwood/0 37.60,79.40
step
Leave the cave |goto Duskwood 34.08,77.02 < 15 |walk |only if subzone("Vul'Gol Ogre Mound") and indoors()
talk Abercrombie##289
|tip Inside the building.
turnin Ogre Thieves##134 |goto Duskwood 28.11,31.47
accept Note to the Mayor##160 |goto Duskwood 28.11,31.47
step
click A Weathered Grave
accept The Weathered Grave##225 |goto Duskwood 17.72,29.08
step
talk Commander Althea Ebonlocke##264
|tip Walks around.
turnin The Night Watch##58 |goto Duskwood 73.59,46.89
step
talk Sirra Von'Indi##268
|tip Inside the building.
turnin The Weathered Grave##225 |goto Duskwood 72.64,47.62
accept Morgan Ladimore##227 |goto Duskwood 72.64,47.62
step
talk Lord Ello Ebonlocke##263
|tip Inside the building.
turnin Note to the Mayor##160 |goto Duskwood 71.93,46.42
accept Translate Abercrombie's Note##251 |goto Duskwood 71.93,46.42
step
talk Sirra Von'Indi##268
|tip Walks around.
|tip Inside the building.
turnin Translate Abercrombie's Note##251 |goto Duskwood 72.64,47.62
accept Wait for Sirra to Finish##401 |goto Duskwood 72.64,47.62
step
talk Sirra Von'Indi##268
|tip Walks around.
|tip Inside the building.
turnin Wait for Sirra to Finish##401 |goto Duskwood 72.64,47.62
accept Translation to Ello##252 |goto Duskwood 72.64,47.62
step
talk Lord Ello Ebonlocke##263
|tip Inside the building.
turnin Translation to Ello##252 |goto Duskwood 71.93,46.42
step
_Destroy This Item:_
|tip Not needed.
trash Translated Letter from The Embalmer##3248
step
talk Commander Althea Ebonlocke##264
|tip Walks around.
turnin Morgan Ladimore##227 |goto Duskwood 73.59,46.89
step
map Duskwood
path follow strictbounce;	loop off;	ants straight;		dist 30;	markers none;		arrow hide
path	74.82,44.16	74.53,41.22	73.87,39.60	72.74,38.35	72.28,37.28
path	72.24,35.19	72.58,33.53	73.31,32.54
talk Watcher Backus##840
|tip Walks along the road.
turnin The Missing Diplomat##1244
accept The Missing Diplomat##1245
step
_Destroy This Item:_
|tip Not needed.
trash The Story of Morgan Ladimore##2154
step
talk Calor##663
|tip Walks around.
turnin Worgen in the Woods##222 |goto Duskwood 75.30,48.05
accept Worgen in the Woods##223 |goto Duskwood 75.30,48.05
step
talk Jonathan Carevin##661
|tip Walks around.
|tip Inside the building.
turnin Worgen in the Woods##223 |goto Duskwood 75.32,49.02
step
talk Viktori Prism'Antras##276
|tip Inside the building.
turnin Look To The Stars##181 |goto Duskwood 79.80,48.02
step
talk Elsharin##5498
|tip Top of the tower.
Train Abilities |trainer Elsharin##5498 |goto Stormwind City/0 36.87,81.13 |q 1245
|only if Mage
step
talk Archmage Malin##2708
accept Malin's Request##690 |goto Stormwind City/0 39.84,81.46
|only if Mage
step
Enter the building |goto Stormwind City/0 39.85,85.25 < 10 |walk
talk Connor Rivers##5081
|tip Inside the building.
accept James Hyal##1301 |goto Stormwind City 40.62,91.83
|only if Mage
step
talk Elling Trias##482
|tip Upstairs inside the building.
turnin The Missing Diplomat##1245 |goto Stormwind City 59.91,64.17
accept The Missing Diplomat##1246 |goto Stormwind City 59.91,64.17
step
talk Archmage Malin##2708
accept Malin's Request##690 |goto Stormwind City/0 39.84,81.46
|only if not Mage
step
Enter the building |goto Stormwind City/0 39.85,85.25 < 10 |walk
talk Connor Rivers##5081
|tip Inside the building.
accept James Hyal##1301 |goto Stormwind City 40.62,91.83
|only if not Mage
step
Enter the building |goto Stormwind City 29.19,74.12 < 10 |walk |only if not (subzone("The Slaughtered Lamb") and indoors())
talk Demisette Cloyce##461
|tip Downstairs inside the building.
Train Abilities |trainer Demisette Cloyce##461 |goto Stormwind City/0 25.28,78.22 |q 1246
|only if Warlock
step
talk Spackle Thornberry##5520
|tip Buy available Grimoires.
|tip Downstairs inside the building.
Train Demon Abilities |vendor Spackle Thornberry##5520 |goto Stormwind City/0 25.66,77.65 |q 1246
|only if Warlock
step
Enter the building |goto Stormwind City 43.05,34.48 < 15 |walk |only if not subzone("Cathedral of Light")
talk Katherine the Pure##5492
|tip Inside the building.
Train Abilities |trainer Katherine the Pure##5492 |goto Stormwind City/0 37.22,31.85 |q 1246
|only if Paladin
step
Enter the building |goto Stormwind City 43.05,34.48 < 15 |walk |only if not subzone("Cathedral of Light")
talk Brother Benjamin##5484
|tip Walks around.
|tip Inside the building.
Train Abilities |trainer Brother Benjamin##5484 |goto Stormwind City/0 41.32,28.44 |q 1246
|only if Priest
step
talk Einris Brightspear##5515
|tip Inside the building.
Train Abilities |trainer Einris Brightspear##5515 |goto Stormwind City/0 61.61,15.27 |q 1246
|only if Hunter
step
talk Wu Shen##5479
|tip Upstairs inside the building.
Train Abilities |trainer Wu Shen##5479 |goto Stormwind City/0 78.68,45.80 |q 1246
|only if Warrior
step
talk Osborne the Night Man##918
Train Abilities |trainer Osborne the Night Man##918 |goto Stormwind City/0 74.64,52.82 |q 1246
|only if Rogue
step
_NOTE:_
During Next Steps
|tip {o}Dashel Stonefist{} attacks after you accept the quest.
|tip Two enemy helpers appear.
|tip Dashel surrenders around {o}25% health{}.
Click Here to Continue |confirm |q 1447 |future
step
talk Dashel Stonefist##4961
|tip You will be attacked.
|tip In the alley between buildings.
turnin The Missing Diplomat##1246 |goto Stormwind City 70.53,44.88
accept The Missing Diplomat##1447 |goto Stormwind City 70.53,44.88
step
kill Dashel Stonefist##4961
Watch the dialogue
Defeat Dashel Stonefist |q 1447/1 |goto Stormwind City 70.53,44.88
step
talk Dashel Stonefist##4961
turnin The Missing Diplomat##1447 |goto Stormwind City 70.53,44.88
accept The Missing Diplomat##1247 |goto Stormwind City 70.53,44.88
step
talk Elling Trias##482
|tip Upstairs inside the building.
turnin The Missing Diplomat##1247 |goto Stormwind City 59.91,64.17
accept The Missing Diplomat##1248 |goto Stormwind City 59.91,64.17
step
talk Innkeeper Firebrew##5111
|tip Inside the building.
home Ironforge |goto Ironforge 18.15,51.46 |q 1302 |future
step
talk Elissa Dumas##4165
|tip Inside the building.
learnspell Teleport: Darnassus##3565 |goto Darnassus 40.60,82.13
|only if Mage
]])
GoatQuest:RegisterGuide("Leveling Guides\\Wetlands (32-33)",{
image=GQ.IMAGESDIR.."Wetlands",
next="Leveling Guides\\Hillsbrad Foothills (33-34)",
},[[
step
talk Vincent Hyal##5082
|tip Inside the building.
turnin James Hyal##1301 |goto Wetlands/0 10.83,60.40
accept James Hyal##1302 |goto Wetlands/0 10.83,60.40
step
talk Glorin Steelbrow##1217
|tip Inside the building.
turnin The Doomed Fleet##270 |goto Wetlands/0 10.59,60.59
accept Lightforge Iron##321 |goto Wetlands/0 10.59,60.59
step
_NOTE:_
During the Next Steps
|tip Locate {o}Tapoke "Slim" Jahn{} near the building entrance.
|tip He stealths and flees the building after you accept the quest.
|tip Follow and attack him quickly.
|tip He summons a helper.
|tip {o}Sheep Tapoke immediately{} to prevent summoning helper.			|only if Mage
|tip Ignore the helper and focus on killing {o}Tapoke{}.			|only if not Mage
|tip Surrenders around {o}15% health{}.
|tip Helper disappears.
Click Here to Continue |confirm |q 1249 |future
step
talk Mikhail##4963
|tip Inside the building.
turnin The Missing Diplomat##1248 |goto Wetlands 10.60,60.77
accept The Missing Diplomat##1249 |goto Wetlands 10.60,60.77
step
kill Tapoke "Slim" Jahn##4962
Watch the dialogue
Defeat Tapoke Jahn |q 1249/1 |goto Wetlands 10.79,59.60
step
talk Mikhail##4963
|tip Inside the building.
turnin The Missing Diplomat##1249 |goto Wetlands 10.60,60.77
step
talk Tapoke "Slim" Jahn##4962
|tip Inside the building.
accept The Missing Diplomat##1250 |goto Wetlands 10.54,60.26
step
talk Mikhail##4963
|tip Inside the building.
turnin The Missing Diplomat##1250 |goto Wetlands 10.60,60.77
accept The Missing Diplomat##1264 |goto Wetlands 10.60,60.77
step
click Waterlogged Chest
turnin Lightforge Iron##321 |goto Wetlands 12.10,64.17
accept The Lost Ingots##324 |goto Wetlands 12.10,64.17
step
kill Bluegill Raider##1418+
|tip Underwater and on the land.
collect 5 Lightforge Ingot##2702 |q 324/1 |goto Wetlands 11.80,63.20
|mapmarker Wetlands/0 6.20,73.60
|mapmarker Wetlands/0 7.20,71.20
|mapmarker Wetlands/0 8.80,67.80
|mapmarker Wetlands/0 9.40,70.00
|mapmarker Wetlands/0 9.40,72.60
|mapmarker Wetlands/0 10.60,66.60
|mapmarker Wetlands/0 12.40,65.40
step
talk Glorin Steelbrow##1217
|tip Inside the building.
turnin The Lost Ingots##324 |goto Wetlands 10.59,60.59
step
talk Harlo Barnaby##2097
accept Fall of Dun Modr##472 |goto Wetlands/0 10.85,55.90
step
talk Rhag Garmason##1075
accept The Thandol Span##631 |goto Wetlands 49.92,18.21
step
talk Longbraid the Grim##1071
turnin Fall of Dun Modr##472 |goto Wetlands 49.80,18.26
step
_NOTE:_
During the Next Step
|tip There are {o}2 elite enemies{} inside the bridge.
|tip Run in and {o}crowd control{} them, or use abilities to {o}escape{}.
|tip Click the corpse and run out quickly.
Click Here to Continue |confirm |q 631
step
Enter the doorway on the bridge and run down the stairs |goto Wetlands 51.36,8.11 < 7 |walk
click Ebenezer Rustlocke's Corpse
|tip You will be attacked.
|tip Downstairs inside the bridge.
turnin The Thandol Span##631 |goto Wetlands 51.28,7.95
accept The Thandol Span##632 |goto Wetlands 51.28,7.95
step
talk Rhag Garmason##1075
turnin The Thandol Span##632 |goto Wetlands 49.92,18.22
accept The Thandol Span##633 |goto Wetlands 49.92,18.22
step
Jump off the bridge into the water |goto Wetlands 50.65,8.53 < 15 |only if walking
click Waterlogged Letter
|tip Rolled up white scroll.
|tip In the hand of a dead dwarf.
|tip Underwater.
collect Waterlogged Envelope##4433 |n
use Waterlogged Envelope##4433
accept Sully Balloo's Letter##637 |goto Arathi Highlands 44.29,92.88 |q 637 |future |notravel
step
Leave the water and follow the path up |goto Arathi Highlands/0 52.83,90.38 < 30 |q 637 |notravel
|only if walking and (zone("Wetlands") or zone("Arathi Highlands"))
step
click Cache of Explosives
Destroy the Cache of Explosives |q 633/1 |goto Arathi Highlands 48.73,88.05
step
talk Rhag Garmason##1075
turnin The Thandol Span##633 |goto Wetlands 49.92,18.22
accept Plea To The Alliance##634 |goto Wetlands 49.92,18.22
step
talk Captain Nials##2700
|tip Walks around.
turnin Plea To The Alliance##634 |goto Arathi Highlands 45.83,47.55
step
talk Skuerto##2789
turnin Malin's Request##690 |goto Arathi Highlands 46.65,47.01
step
talk Cedrik Prose##2835
fpath Refuge Pointe |goto Arathi Highlands 45.76,46.12
]])
GoatQuest:RegisterGuide("Leveling Guides\\Hillsbrad Foothills (33-34)",{
image=GQ.IMAGESDIR.."Hillsbrad Foothills",
next="Leveling Guides\\Dustwallow Marsh & Thousand Needles (34-37)",
},[[
step
talk Darla Harris##2432
fpath Southshore |goto Hillsbrad Foothills 49.34,52.27
step
talk Loremaster Dibbs##2277
turnin Southshore##538 |goto Hillsbrad Foothills 50.57,57.09
step
talk Wesley##9978
Stable Your Pet |stablemaster Wesley##9978 |goto Hillsbrad Foothills/0 50.42,58.80 |q 536 |future
|tip Taming a temporary pet soon.
|tip Learning {o}Claw (Rank 3){}.
|only if Hunter
step
Learn the {y}Claw (Rank 3){} Pet Ability |learnspell Claw##2982 |goto Hillsbrad Foothills/0 58.40,32.40 |q 536 |future
|tip Cast {o}Tame Beast{} on a {o}Gray Bear{}.
|tip Kill enemies nearby.
|mapmarker Hillsbrad Foothills/0 59.60,29.20
|mapmarker Hillsbrad Foothills/0 62.00,36.80
|mapmarker Hillsbrad Foothills/0 62.20,31.40
|mapmarker Hillsbrad Foothills/0 64.20,34.60
|mapmarker Hillsbrad Foothills/0 67.20,30.00
|only if Hunter
step
talk Wesley##9978
Retrieve Your Pet |stablemaster Wesley##9978 |goto Hillsbrad Foothills/0 50.42,58.80 |q 536 |future
|tip Abandon your temporary pet.
|only if Hunter
step
Teach {y}Claw (Rank 3){} to Your Pet |learnpetspell Claw##16829 |q 536 |future
|tip Use {o}Beast Training{} ability.
|only if Hunter
step
talk Lieutenant Farren Orinelle##2228
|tip Inside the building.
accept Down the Coast##536 |goto Hillsbrad Foothills 51.46,58.38
step
kill 10 Torn Fin Tidehunter##2377 |q 536/1 |goto Hillsbrad Foothills 47.60,64.60
kill 10 Torn Fin Oracle##2376 |q 536/2 |goto Hillsbrad Foothills 47.60,64.60
|tip More in the water.
|mapmarker Hillsbrad Foothills/0 34.40,68.00
|mapmarker Hillsbrad Foothills/0 36.40,69.60
|mapmarker Hillsbrad Foothills/0 39.20,69.20
|mapmarker Hillsbrad Foothills/0 41.00,67.40
|mapmarker Hillsbrad Foothills/0 41.00,70.20
|mapmarker Hillsbrad Foothills/0 43.00,70.20
|mapmarker Hillsbrad Foothills/0 43.20,67.00
|mapmarker Hillsbrad Foothills/0 44.80,65.20
|mapmarker Hillsbrad Foothills/0 45.20,68.60
|mapmarker Hillsbrad Foothills/0 46.20,63.00
|mapmarker Hillsbrad Foothills/0 46.40,66.60
|mapmarker Hillsbrad Foothills/0 49.00,62.40
step
talk Lieutenant Farren Orinelle##2228
|tip Inside the building.
turnin Down the Coast##536 |goto Hillsbrad Foothills 51.46,58.38
accept Farren's Proof##559 |goto Hillsbrad Foothills 51.46,58.38
step
kill Torn Fin Tidehunter##2377, Torn Fin Oracle##2376, Torn Fin Coastrunner##2375, Torn Fin Muckdweller##2374
|tip More in the water.
collect 10 Murloc Head##3716 |q 559/1 |goto Hillsbrad Foothills 47.60,64.60
|mapmarker Hillsbrad Foothills/0 34.40,68.00
|mapmarker Hillsbrad Foothills/0 36.40,69.60
|mapmarker Hillsbrad Foothills/0 39.20,69.20
|mapmarker Hillsbrad Foothills/0 41.00,67.40
|mapmarker Hillsbrad Foothills/0 41.00,70.20
|mapmarker Hillsbrad Foothills/0 43.00,70.20
|mapmarker Hillsbrad Foothills/0 43.20,67.00
|mapmarker Hillsbrad Foothills/0 44.80,65.20
|mapmarker Hillsbrad Foothills/0 45.20,68.60
|mapmarker Hillsbrad Foothills/0 46.20,63.00
|mapmarker Hillsbrad Foothills/0 46.40,66.60
|mapmarker Hillsbrad Foothills/0 49.00,62.40
step
talk Lieutenant Farren Orinelle##2228
|tip Inside the building.
turnin Farren's Proof##559 |goto Hillsbrad Foothills 51.46,58.38
accept Farren's Proof##560 |goto Hillsbrad Foothills 51.46,58.38
step
talk Marshal Redpath##2263
turnin Farren's Proof##560 |goto Hillsbrad Foothills 49.48,58.73
accept Farren's Proof##561 |goto Hillsbrad Foothills 49.48,58.73
step
talk Lieutenant Farren Orinelle##2228
|tip Inside the building.
turnin Farren's Proof##561 |goto Hillsbrad Foothills 51.46,58.38
accept Stormwind Ho!##562 |goto Hillsbrad Foothills 51.46,58.38
step
kill 10 Daggerspine Shorehunter##2369 |q 562/1 |goto Hillsbrad Foothills 55.00,64.40
kill 10 Daggerspine Siren##2371 |q 562/2 |goto Hillsbrad Foothills 55.00,64.40
|tip More in the water.
|mapmarker Hillsbrad Foothills/0 51.40,66.40
|mapmarker Hillsbrad Foothills/0 53.40,66.60
|mapmarker Hillsbrad Foothills/0 55.80,72.20
|mapmarker Hillsbrad Foothills/0 57.40,66.60
|mapmarker Hillsbrad Foothills/0 57.80,75.80
|mapmarker Hillsbrad Foothills/0 58.60,72.40
|mapmarker Hillsbrad Foothills/0 59.00,77.60
|mapmarker Hillsbrad Foothills/0 60.40,74.40
step
talk Lieutenant Farren Orinelle##2228
|tip Inside the building.
turnin Stormwind Ho!##562 |goto Hillsbrad Foothills 51.46,58.38
accept Reassignment##563 |goto Hillsbrad Foothills 51.46,58.38
step
talk Phin Odelic##2711
accept Hints of a New Plague?##659 |goto Hillsbrad Foothills 50.34,59.05
step
talk Magistrate Henry Maleb##2276
|tip Inside the building.
accept Syndicate Assassins##505 |goto Hillsbrad Foothills 48.14,59.11
step
kill Snapjaw##2408+
|tip Turtles.
|tip Follow the river north.
collect 10 Turtle Meat##3712 |goto Hillsbrad Foothills 55.20,57.00 |q 555 |future
|tip Don't vendor them.
|mapmarker Hillsbrad Foothills/0 55.20,54.00
|mapmarker Hillsbrad Foothills/0 57.40,48.00
|mapmarker Hillsbrad Foothills/0 59.60,45.20
|mapmarker Hillsbrad Foothills/0 63.80,40.60
|mapmarker Hillsbrad Foothills/0 67.20,31.40
|mapmarker Hillsbrad Foothills/0 67.60,35.40
|mapmarker Hillsbrad Foothills/0 67.80,17.80
|mapmarker Hillsbrad Foothills/0 67.80,21.20
|mapmarker Hillsbrad Foothills/0 68.40,14.80
|mapmarker Hillsbrad Foothills/0 68.60,28.20
|mapmarker Hillsbrad Foothills/0 70.00,12.00
|mapmarker Hillsbrad Foothills/0 71.40,8.60
|mapmarker Alterac Mountains/0 74.40,65.00
|mapmarker Alterac Mountains/0 77.00,62.40
|mapmarker Alterac Mountains/0 79.20,58.60
|mapmarker Alterac Mountains/0 81.00,54.80
|mapmarker Alterac Mountains/0 84.40,50.80
|mapmarker Alterac Mountains/0 88.00,47.40
stickystart "Kill_Syndicate_Thieves_And_Footpads"
step
click Syndicate Documents
|tip Multiple locations.
accept Foreboding Plans##510 |goto Alterac Mountains/0 58.32,67.92
accept Encrypted Letter##511 |goto Alterac Mountains/0 58.32,67.92
|mapmarker Alterac Mountains/0 47.91,82.13
step
label "Kill_Syndicate_Thieves_And_Footpads"
kill 8 Syndicate Thief##2241 |q 505/2 |goto Alterac Mountains/0 57.80,66.40
kill 12 Syndicate Footpad##2240 |q 505/1 |goto Alterac Mountains/0 57.80,66.40
|mapmarker Alterac Mountains/0 46.00,80.40
|mapmarker Alterac Mountains/0 47.60,82.80
|mapmarker Alterac Mountains/0 48.20,80.20
|mapmarker Alterac Mountains/0 49.60,82.00
|mapmarker Alterac Mountains/0 55.80,66.60
|mapmarker Alterac Mountains/0 56.40,69.00
|mapmarker Alterac Mountains/0 58.00,64.40
|mapmarker Alterac Mountains/0 58.40,69.80
|mapmarker Alterac Mountains/0 60.00,67.00
step
talk Bibilfaz Featherwhistle##12596
|tip Follow the road.
fpath Chillwind Camp |goto Western Plaguelands 42.93,85.06
step
talk Micha Yance##2381
|tip Inside the building.
buy Soothing Spices##3713 |goto Hillsbrad Foothills/0 48.94,55.03 |q 555 |future
step
talk Loremaster Dibbs##2277
turnin Encrypted Letter##511 |goto Hillsbrad Foothills 50.57,57.09
accept Letter to Stormpike##514 |goto Hillsbrad Foothills 50.57,57.09
step
talk Chef Jessen##2430
|tip Inside the building.
accept Soothing Turtle Bisque##555 |goto Hillsbrad Foothills 51.89,58.68
step
talk Chef Jessen##2430
|tip Inside the building.
turnin Soothing Turtle Bisque##555 |goto Hillsbrad Foothills 51.89,58.68
step
talk Magistrate Henry Maleb##2276
|tip Inside the building.
turnin Foreboding Plans##510 |goto Hillsbrad Foothills 48.14,59.11
turnin Syndicate Assassins##505 |goto Hillsbrad Foothills 48.14,59.11
step
talk Quae##2712
turnin Hints of a New Plague?##659 |goto Arathi Highlands 60.19,53.85
accept Hints of a New Plague?##658 |goto Arathi Highlands 60.19,53.85
step
talk Loganaar##12042
Train Abilities |trainer Loganaar##12042 |goto Moonglade/0 52.53,40.57 |q 637
|only if Druid
step
talk Dink##7312
|tip Inside the building.
Train Abilities |trainer Dink##7312 |goto Ironforge/0 27.16,8.56 |q 637
|only if Mage
step
talk Bailey Stonemantle##2461
|tip Deposit into the bank.
|tip Inside the building.
bank Farren's Report##3721 |goto Ironforge/0 35.93,60.13 |q 563
bank Cleverly Encrypted Letter##3521 |goto Ironforge/0 35.93,60.13 |q 514
step
talk Fenthwick##5167
|tip Inside the building.
Train Abilities |trainer Fenthwick##5167 |goto Ironforge/0 65.90,88.41 |q 637
|only if Rogue
step
talk Briarthorn##5172
|tip Inside the building.
Train Abilities |trainer Briarthorn##5172 |goto Ironforge/0 50.35,5.66 |q 637
|only if Warlock
step
talk Jubahl Corpseseeker##6382
|tip Buy available Grimoires.
|tip Inside the building.
Train Demon Abilities |vendor Jubahl Corpseseeker##6382 |goto Ironforge/0 50.35,5.66 |q 637
|only if Warlock
step
talk Toldren Deepiron##5143
|tip Inside the building.
Train Abilities |trainer Toldren Deepiron##5143 |goto Ironforge/0 25.21,10.74 |q 637
|only if Priest
step
talk Beldruk Doombrow##5148
|tip Inside the building.
Train Abilities |trainer Beldruk Doombrow##5148 |goto Ironforge/0 24.55,4.48 |q 637
|only if Paladin
step
talk Sara Balloo##2695
turnin Sully Balloo's Letter##637 |goto Ironforge 63.48,67.29
step
Watch the dialogue
talk Sara Balloo##2695
accept Sara Balloo's Plea##683 |goto Ironforge 63.48,67.29
step
Follow the path |goto Ironforge 44.56,49.58 < 15 |walk |only if not subzone("The High Seat")
talk King Magni Bronzebeard##2784
turnin Sara Balloo's Plea##683 |goto Ironforge 39.11,56.17
accept A King's Tribute##686 |goto Ironforge 39.11,56.17
step
talk Grand Mason Marblesten##2790
|tip Walks around.
|tip Inside the building.
turnin A King's Tribute##686 |goto Ironforge 39.03,88.02
step
talk Bilban Tosslespanner##5114
|tip Inside the building.
Train Abilities |trainer Bilban Tosslespanner##5114 |goto Ironforge/0 65.90,88.41 |q 1302
|only if Warrior
step
talk Regnus Thundergranite##5117
|tip Inside the building.
Train Abilities |trainer Regnus Thundergranite##5117 |goto Ironforge/0 69.87,82.90 |q 1302
|only if Hunter
]])
GoatQuest:RegisterGuide("Leveling Guides\\Dustwallow Marsh & Thousand Needles (34-37)",{
image=GQ.IMAGESDIR.."Dustwallow Marsh",
next="Leveling Guides\\Stranglethorn Vale (37-40)",
},[[
step
talk Pilot Longbeard##2092
|tip Inside the building.
accept The Brassbolts Brothers##1179 |goto Ironforge 72.73,94.01
step
talk Baldruc##4321
fpath Theramore |goto Dustwallow Marsh 67.48,51.30
step
talk Helenia Olden##4897
|tip Inside the building.
buy 3 Soothing Spices##3713 |goto Dustwallow Marsh 66.44,51.46 |q 1218 |future
|tip Don't vendor them.
step
talk Fiora Longears##4456
|tip Inside the building.
accept Highperch Venom##1135 |goto Dustwallow Marsh/0 66.46,45.15
step
talk Innkeeper Janene##6272
|tip Inside the building.
home Theramore Isle |goto Dustwallow Marsh/0 66.59,45.22 |q 1180 |future
step
talk Guard Byron##4921
accept They Call Him Smiling Jim##1282 |goto Dustwallow Marsh/0 66.16,46.07
step
talk Clerk Lendry##5083
|tip Upstairs inside the building.
turnin James Hyal##1302 |goto Dustwallow Marsh/0 67.88,48.24
step
talk Commander Samaul##4964
|tip Walks around.
|tip Upstairs inside the building.
turnin The Missing Diplomat##1264 |goto Dustwallow Marsh/0 68.02,48.71
accept The Missing Diplomat##1265 |goto Dustwallow Marsh/0 68.02,48.71
step
talk Captain Garran Vimes##4944
|tip Upstairs inside the building.
turnin They Call Him Smiling Jim##1282 |goto Dustwallow Marsh/0 68.22,48.62
step
Explore Sentry Point |q 1265/1 |goto Dustwallow Marsh 59.66,41.25
|tip Inside the building.
step
talk Archmage Tervosh##4967
|tip Inside the building.
|tip Quest bugged, sometimes missing.
|tip Skip if missing.
turnin The Missing Diplomat##1265 |goto Dustwallow Marsh 59.66,41.25
accept The Missing Diplomat##1266 |goto Dustwallow Marsh 59.66,41.25
step
talk Archmage Tervosh##4967
|tip Top of the tower.
turnin The Missing Diplomat##1265 |goto Dustwallow Marsh/0 66.42,49.26
accept The Missing Diplomat##1266 |goto Dustwallow Marsh/0 66.42,49.26
step
talk "Swamp Eye" Jarl##4792
accept Soothing Spices##1218 |goto Dustwallow Marsh/0 55.44,26.27
step
talk "Swamp Eye" Jarl##4792
turnin Soothing Spices##1218 |goto Dustwallow Marsh/0 55.44,26.27
step
click Loose Dirt
accept The Orc Report##1219 |goto Dustwallow Marsh/0 55.44,25.93
step
talk Private Hendel##4966
|tip Walks around.
turnin The Missing Diplomat##1266 |goto Dustwallow Marsh 45.22,24.64
step
talk Private Hendel##4966
|tip Walks around.
accept The Missing Diplomat##1324 |goto Dustwallow Marsh 45.22,24.64 |noautoaccept inparty
|tip Multiple enemies attack.
|tip Focus on killing {o}Private Hendel{}.
|tip Helpers run away once he surrenders.
|only if not hardcore()
step
kill Private Hendel##4966
Watch the dialogue
Subdue Private Hendel |q 1324/1 |goto Dustwallow Marsh 45.22,24.64
|only if not hardcore()
step
talk Archmage Tervosh##4967
turnin The Missing Diplomat##1324 |goto Dustwallow Marsh 45.19,24.30
|only if not hardcore()
step
talk Lady Jaina Proudmoore##4968
accept The Missing Diplomat##1267 |goto Dustwallow Marsh/0 45.22,24.24 |instant
|only if not hardcore()
step
click Suspicious Hoofprint
accept Suspicious Hoofprints##1284 |goto Dustwallow Marsh/0 29.70,47.63
step
click Theramore Guard Badge
|tip Tiny metal object.
accept Lieutenant Paval Reethe##1252 |goto Dustwallow Marsh/0 29.83,48.24
step
click Black Shield
accept The Black Shield##1253 |goto Dustwallow Marsh/0 29.63,48.59
step
Ride an elevator down |goto Thousand Needles/0 32.23,22.32 < 40 |only if walking
click Henrig Lonebrow's Journal
|tip Small brown book.
|tip In dead dwarf's hand.
collect Henrig Lonebrow's Journal##5791 |goto Thousand Needles 30.73,24.35 |q 1100 |future
step
use Henrig Lonebrow's Journal##5791
accept Lonebrow's Journal##1100
step
talk Thyssiana##4319
fpath Thalanaar |goto Feralas 89.50,45.85
step
talk Falfindel Waywarder##4048
turnin Lonebrow's Journal##1100 |goto Feralas/0 89.64,46.56
step
Follow the path up |goto Thousand Needles 14.75,32.83 < 20 |only if walking and not subzone("Highperch")
kill Highperch Consort##4109, Highperch Wyvern##4107, Highperch Patriarch##4110
|tip Wyverns.
collect 10 Highperch Venom Sac##5809 |q 1135/1 |goto Thousand Needles/0 12.20,36.20
|mapmarker Thousand Needles/0 9.40,34.20
|mapmarker Thousand Needles/0 10.00,39.40
|mapmarker Thousand Needles/0 10.80,31.40
|mapmarker Thousand Needles/0 13.20,39.60
|mapmarker Thousand Needles/0 16.00,41.40
step
talk Kravel Koalbeard##4452
|tip Avoid Freewind Post.
accept Rocket Car Parts##1110 |goto Thousand Needles 77.79,77.27
step
talk Fizzle Brassbolts##4454
accept Salt Flat Venom##1104 |goto Thousand Needles 78.06,77.13
step
talk Wizzle Brassbolts##4453
turnin The Brassbolts Brothers##1179 |goto Thousand Needles 78.14,77.12
accept Hardened Shells##1105 |goto Thousand Needles 78.14,77.12
step
talk Pozzik##4630
accept Load Lightening##1176 |goto Thousand Needles 80.18,75.89
step
talk Trackmaster Zherin##4629
accept A Bump in the Road##1175 |goto Thousand Needles 81.64,77.95
stickystart "Collect_Rocket_Car_Parts"
stickystart "Kill_Saltstone_Crystalhides"
step
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
stickystart "Collect_Hardened_Tortoise_Shells"
stickystart "Collect_Salty_Scorpid_Venom"
stickystart "Kill_Saltstone_Basilisks"
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
talk Kravel Koalbeard##4452
turnin Rocket Car Parts##1110 |goto Thousand Needles 77.79,77.27
accept Wharfmaster Dizzywig##1111 |goto Thousand Needles 77.79,77.27
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
talk Bera Stonehammer##7823
fpath Gadgetzan |goto Tanaris 51.01,29.34
step
talk Loganaar##12042
Train Abilities |trainer Loganaar##12042 |goto Moonglade/0 52.53,40.57 |q 1135
|only if Druid
step
talk Fiora Longears##4456
|tip Inside the building.
turnin Highperch Venom##1135 |goto Dustwallow Marsh/0 66.46,45.15
step
talk Theramore Lieutenant##4947
turnin The Orc Report##1219 |goto Dustwallow Marsh 65.07,47.13
accept Captain Vimes##1220 |goto Dustwallow Marsh 65.07,47.13
step
talk Captain Garran Vimes##4944
|tip Upstairs inside the building.
turnin Captain Vimes##1220 |goto Dustwallow Marsh 68.21,48.62
turnin Lieutenant Paval Reethe##1252 |goto Dustwallow Marsh 68.21,48.62
accept Lieutenant Paval Reethe##1259 |goto Dustwallow Marsh 68.21,48.62
turnin The Black Shield##1253 |goto Dustwallow Marsh 68.21,48.62
accept The Black Shield##1319 |goto Dustwallow Marsh 68.21,48.62
turnin Suspicious Hoofprints##1284 |goto Dustwallow Marsh 68.21,48.62
step
talk Adjutant Tesoran##4948
|tip Upstairs inside the building.
turnin Lieutenant Paval Reethe##1259 |goto Dustwallow Marsh 68.05,48.11
accept Daelin's Men##1285 |goto Dustwallow Marsh 68.05,48.11
step
talk Captain Garran Vimes##4944
|tip Upstairs inside the building.
turnin Daelin's Men##1285 |goto Dustwallow Marsh 68.21,48.62
step
talk Caz Twosprocket##4941
|tip Inside the building.
turnin The Black Shield##1319 |goto Dustwallow Marsh 64.75,50.43
accept The Black Shield##1320 |goto Dustwallow Marsh 64.75,50.43
step
talk Captain Garran Vimes##4944
|tip Upstairs inside the building.
turnin The Black Shield##1320 |goto Dustwallow Marsh 68.21,48.62
step
talk Bragok##16227
|tip {o}Follow the coast north{} to The Barrens.		|only if zone("Dustwallow Marsh")
fpath Ratchet |goto The Barrens 63.09,37.16			|only if not zone("Dustwallow Marsh")
fpath Ratchet |goto The Barrens 63.09,37.16	|notravel	|only if zone("Dustwallow Marsh")
step
talk Gazlowe##3391
|tip Upstairs inside the building.
turnin Goblin Sponsorship##1178 |goto The Barrens 62.68,36.23
accept Goblin Sponsorship##1180 |goto The Barrens 62.68,36.23
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
accept The Windwatcher##1791 |goto The Barrens 68.62,49.17
|only if Warrior
step
talk Bath'rah the Windwatcher##6176
|tip Inside the building.
turnin The Windwatcher##1791 |goto Alterac Mountains 80.50,66.92
accept Cyclonian##1712 |goto Alterac Mountains 80.50,66.92
|only if Warrior
step
talk Wharfmaster Dizzywig##3453
turnin Wharfmaster Dizzywig##1111 |goto The Barrens/0 63.35,38.45
step
talk Zandalarian Emissary##15076
Select _"Emissary, may you grant me protection from the blood moon?"_ |gossip 120797
Gain the Zandalari Ward Buff |havebuff  Zandalari Ward##436351 |goto The Barrens/0 63.64,38.70
|tip Protects you from the {o}PVP event{} in Stranglethorn Vale.
|only if GQ.IsClassicSoD
]])
GoatQuest:RegisterGuide("Leveling Guides\\Stranglethorn Vale (37-40)",{
image=GQ.IMAGESDIR.."Stranglethorn Vale",
next="Leveling Guides\\Arathi Highlands & Alterac Mountains (40-42)",
},[[
step
talk Wharfmaster Lozgil##4631
turnin Goblin Sponsorship##1180 |goto Stranglethorn Vale 26.35,73.56
accept Goblin Sponsorship##1181 |goto Stranglethorn Vale 26.35,73.56
step
talk Innkeeper Skindle##6807
|tip {o}Ground floor{} inside the building.
home Booty Bay |goto Stranglethorn Vale 27.04,77.31 |q 512 |future
step
talk Crank Fizzlebub##2498
|tip {o}Ground floor{} inside the building.
accept Singing Blue Shards##605 |goto Stranglethorn Vale 27.12,77.21
step
talk Krazek##773
|tip {o}Top floor{} inside the building.
accept Investigate the Camp##201 |goto Stranglethorn Vale 26.94,77.21
accept Supplies to Private Thorsen##198 |goto Stranglethorn Vale 26.94,77.21
accept The Haunted Isle##616 |goto Stranglethorn Vale 26.94,77.21
step
talk Kebok##737
|tip {o}Top floor{} inside the building.
accept Hostile Takeover##213 |goto Stranglethorn Vale 27.00,77.12
step
talk Baron Revilgaz##2496
|tip Up on the balcony of the building.
turnin Goblin Sponsorship##1181 |goto Stranglethorn Vale 27.23,76.87
accept Goblin Sponsorship##1182 |goto Stranglethorn Vale 27.23,76.87
turnin The Haunted Isle##616 |goto Stranglethorn Vale 27.23,76.87
accept The Stone of the Tides##578 |goto Stranglethorn Vale 27.23,76.87
step
talk Viznik Goldgrubber##2625
|tip Collect from the bank.
collect Farren's Report##3721 |goto Stranglethorn Vale 26.54,76.57 |q 563
step
_Destroy This Item:_
|tip Not needed.
trash Library Scrip##3898
step
talk Drizzlik##2495
|tip Upper level of the docks.
|tip Inside the building.
accept Supply and Demand##575 |goto Stranglethorn Vale 28.29,77.59
step
talk Gyll##2859
|tip Upper level of the docks.
|tip Up on the balcony of the building.
fpath Booty Bay |goto Stranglethorn Vale 27.53,77.79
step
talk Elsharin##5498
|tip Top of the tower.
Train Abilities |trainer Elsharin##5498 |goto Stormwind City/0 36.87,81.13 |q 563
|only if Mage
step
Enter the building |goto Stormwind City 29.19,74.12 < 10 |walk |only if not (subzone("The Slaughtered Lamb") and indoors())
talk Demisette Cloyce##461
|tip Downstairs inside the building.
Train Abilities |trainer Demisette Cloyce##461 |goto Stormwind City/0 25.28,78.22 |q 563
|only if Warlock
step
talk Spackle Thornberry##5520
|tip Buy available Grimoires.
|tip Downstairs inside the building.
Train Demon Abilities |vendor Spackle Thornberry##5520 |goto Stormwind City/0 25.66,77.65 |q 563
|only if Warlock
step
Enter the building |goto Stormwind City 43.05,34.48 < 15 |walk |only if not subzone("Cathedral of Light")
talk Katherine the Pure##5492
|tip Inside the building.
Train Abilities |trainer Katherine the Pure##5492 |goto Stormwind City/0 37.22,31.85 |q 563
|only if Paladin
step
Enter the building |goto Stormwind City 43.05,34.48 < 15 |walk |only if not subzone("Cathedral of Light")
talk Brother Benjamin##5484
|tip Walks around.
|tip Inside the building.
Train Abilities |trainer Brother Benjamin##5484 |goto Stormwind City/0 41.32,28.44 |q 563
|only if Priest
step
talk Wu Shen##5479
|tip Upstairs inside the building.
Train Abilities |trainer Wu Shen##5479 |goto Stormwind City/0 78.68,45.80 |q 563
|only if Warrior
step
talk Osborne the Night Man##918
Train Abilities |trainer Osborne the Night Man##918 |goto Stormwind City/0 74.64,52.82 |q 563
|only if Rogue
step
talk Einris Brightspear##5515
|tip Inside the building.
Train Abilities |trainer Einris Brightspear##5515 |goto Stormwind City/0 61.61,15.27 |q 563
|only if Hunter
step
talk Karrina Mekenda##2879
|tip Inside the building.
Train Pet Abilities |trainer Karrina Mekenda##2879 |goto Stormwind City/0 61.58,16.00 |q 563
|only if Hunter
step
Enter Stormwind Keep |goto Stormwind City 69.09,28.70 < 15 |walk |only if not subzone("Stormwind Keep")
talk Major Samuelson##2439
|tip Inside the building.
turnin Reassignment##563 |goto Stormwind City 72.60,15.87
step
talk Private Thorsen##738
|tip Walks the path to the south every {o}20-30 minutes{}.
|tip Two enemies attack him.
|tip Save him to get a quest.
|tip Unlocks a quest chain.
|tip Wait now to save time later.
turnin Supplies to Private Thorsen##198 |goto Stranglethorn Vale 37.98,3.41
accept Jungle Secrets##215 |goto Stranglethorn Vale 37.98,3.41
|mapmarker Stranglethorn Vale 40.34,8.44
step
talk Sergeant Yohwa##733
accept The Second Rebellion##203 |goto Stranglethorn Vale 38.02,3.33
accept Bad Medicine##204 |goto Stranglethorn Vale 38.02,3.33
step
talk Lieutenant Doren##469
turnin Jungle Secrets##215 |goto Stranglethorn Vale 38.04,3.01
accept Bookie Herod##200 |goto Stranglethorn Vale 38.04,3.01
step
_NOTE:_
Save Green Hills of Stranglethorn Pages
|tip Save any you find.
|tip Store them in your bank for later.
|tip Sell duplicates on the Auction House.
|tip We'll buy missing ones later to complete quests.
Click Here to Continue |confirm |q 338 |future
stickystart "Collect_Large_River_Crocolisk_Skins"
step
Locate the Hunters' Camp |q 201/1 |goto Stranglethorn Vale 35.66,10.53
step
talk Barnil Stonepot##716
accept Welcome to the Jungle##583 |goto Stranglethorn Vale 35.66,10.53
step
talk Hemet Nesingwary##715
turnin Welcome to the Jungle##583 |goto Stranglethorn Vale 35.66,10.81
turnin Hemet Nesingwary##5762 |goto Stranglethorn Vale 35.66,10.81
step
talk Ajeck Rouack##717
accept Tiger Mastery##185 |goto Stranglethorn Vale 35.61,10.62
step
talk Sir S. J. Erlgadin##718
accept Panther Mastery##190 |goto Stranglethorn Vale 35.55,10.55
stickystart "Kill_Young_Panthers"
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
kill 10 Young Panther##683 |q 190/1 |goto Stranglethorn Vale 41.40,13.00
|mapmarker Stranglethorn Vale/0 40.00,10.00
|mapmarker Stranglethorn Vale/0 41.20,8.20
|mapmarker Stranglethorn Vale/0 42.00,10.80
stickystop "Collect_Large_River_Crocolisk_Skins"
stickystart "Collect_Jungle_Remedies"
stickystart "Collect_Liferoot_Warrior"
stickystart "Kill_Kurzen_Jungle_Fighters"
step
click Kurzen Supplies
collect Venom Fern Extract##2634 |q 204/2 |goto Stranglethorn Vale 44.10,9.56
step
click Bookie Herod's Records
|tip Upstairs inside the building.
turnin Bookie Herod##200 |goto Stranglethorn Vale 43.67,9.37
accept The Hidden Key##328 |goto Stranglethorn Vale 43.67,9.37
step
label "Collect_Jungle_Remedies"
kill Kurzen Medicine Man##940+
|tip Shared spawns with other Kurzen enemies.
|tip They heal themselves and others.
collect 7 Jungle Remedy##2633 |q 204/1 |goto Stranglethorn Vale 44.00,11.80
|tip Don't vendor them.
|mapmarker Stranglethorn Vale/0 43.40,9.00
|mapmarker Stranglethorn Vale/0 46.00,11.40
|mapmarker Stranglethorn Vale/0 46.40,9.40
step
label "Collect_Liferoot_Warrior"
kill Kurzen Medicine Man##940+
|tip Shared spawns with other Kurzen enemies. |notinsticky
|tip They heal themselves and others. |notinsticky
collect 8 Liferoot##3357 |q 1712/1 |goto Stranglethorn Vale 44.00,11.80
|tip Needed for important class quest soon.
|tip Don't vendor them.
|mapmarker Stranglethorn Vale/0 43.40,9.00
|mapmarker Stranglethorn Vale/0 46.00,11.40
|mapmarker Stranglethorn Vale/0 46.40,9.40
|only if Warrior
step
label "Kill_Kurzen_Jungle_Fighters"
kill 15 Kurzen Jungle Fighter##937 |q 203/1 |goto Stranglethorn Vale 44.00,11.80
|mapmarker Stranglethorn Vale/0 43.40,9.00
|mapmarker Stranglethorn Vale/0 46.00,11.40
|mapmarker Stranglethorn Vale/0 46.40,9.40
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
talk Sergeant Yohwa##733
turnin The Second Rebellion##203 |goto Stranglethorn Vale 38.02,3.33
turnin Bad Medicine##204 |goto Stranglethorn Vale 38.02,3.33
accept Special Forces##574 |goto Stranglethorn Vale 38.02,3.33
step
talk Corporal Kaleb##770
accept Krazek's Cookery##210 |goto Stranglethorn Vale 37.74,3.30
step
talk Brother Nimetz##739
accept Kurzen's Mystery##207 |goto Stranglethorn Vale 37.83,3.56
|only if Warrior
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
talk Sir S. J. Erlgadin##718
turnin Panther Mastery##190 |goto Stranglethorn Vale 35.55,10.55
accept Panther Mastery##191 |goto Stranglethorn Vale 35.55,10.55
step
talk Ajeck Rouack##717
turnin Tiger Mastery##186 |goto Stranglethorn Vale 35.61,10.62
accept Tiger Mastery##187 |goto Stranglethorn Vale 35.61,10.62
step
talk Hemet Nesingwary##715
accept Raptor Mastery##194 |goto Stranglethorn Vale 35.66,10.81
step
kill 10 Elder Stranglethorn Tiger##1085 |q 187/1 |goto Stranglethorn Vale 31.40,14.20
|mapmarker Stranglethorn Vale/0 30.40,17.40
|mapmarker Stranglethorn Vale/0 31.40,19.80
|mapmarker Stranglethorn Vale/0 33.00,17.40
|mapmarker Stranglethorn Vale/0 35.00,19.00
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
Locate the Haunted Island |q 578/1 |goto Stranglethorn Vale 21.33,21.93
step
Allow Enemies to Kill You
|tip No death penalty at this level.
|tip Fast travel.
|tip Inside and outside the mine.
Die on Purpose |complete isdead |goto Stranglethorn Vale 21.33,21.93 |q 578
|only if not hardcore()
step
talk Spirit Healer##6491
Select _"Return me to life."_ |gossip 96031
Resurrect at the Spirit Healer |complete not isdead |goto Stranglethorn Vale/0 38.38,8.96 |q 578 |zombiewalk
|only if not hardcore()
step
talk Hemet Nesingwary##715
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
talk Loganaar##12042
Train Abilities |trainer Loganaar##12042 |goto Moonglade/0 52.53,40.57 |q 605
|only if Druid
step
talk Crank Fizzlebub##2498
|tip {o}Ground floor{} inside the building.
turnin Singing Blue Shards##605 |goto Stranglethorn Vale 27.12,77.21
step
talk Krazek##773
|tip {o}Top floor{} inside the building.
turnin Investigate the Camp##201 |goto Stranglethorn Vale 26.94,77.21
turnin Krazek's Cookery##210 |goto Stranglethorn Vale 26.94,77.21
step
talk Kebok##737
|tip {o}Top floor{} inside the building.
turnin Hostile Takeover##213 |goto Stranglethorn Vale 27.00,77.12
accept Bloodscalp Ears##189 |goto Stranglethorn Vale 27.00,77.12	|only if Warrior
step
talk Baron Revilgaz##2496
|tip Up on the balcony of the building.
turnin The Stone of the Tides##578 |goto Stranglethorn Vale 27.23,76.87
accept Water Elementals##601 |goto Stranglethorn Vale 27.23,76.87
turnin Goblin Sponsorship##1182 |goto Stranglethorn Vale 27.23,76.87
step
talk Viznik Goldgrubber##2625
|tip Deposit into the bank.
bank Green Hills of Stranglethorn - Page 1##2725 |goto Stranglethorn Vale 26.54,76.57 |q 339 |future |only if itemcount(2725) > 0
bank Green Hills of Stranglethorn - Page 4##2728 |goto Stranglethorn Vale 26.54,76.57 |q 339 |future |only if itemcount(2728) > 0
bank Green Hills of Stranglethorn - Page 6##2730 |goto Stranglethorn Vale 26.54,76.57 |q 339 |future |only if itemcount(2730) > 0
bank Green Hills of Stranglethorn - Page 8##2732 |goto Stranglethorn Vale 26.54,76.57 |q 339 |future |only if itemcount(2732) > 0
bank Green Hills of Stranglethorn - Page 10##2734 |goto Stranglethorn Vale 26.54,76.57 |q 340 |future |only if itemcount(2734) > 0
bank Green Hills of Stranglethorn - Page 11##2735 |goto Stranglethorn Vale 26.54,76.57 |q 340 |future |only if itemcount(2735) > 0
bank Green Hills of Stranglethorn - Page 14##2738 |goto Stranglethorn Vale 26.54,76.57 |q 340 |future |only if itemcount(2738) > 0
bank Green Hills of Stranglethorn - Page 16##2740 |goto Stranglethorn Vale 26.54,76.57 |q 340 |future |only if itemcount(2740) > 0
bank Green Hills of Stranglethorn - Page 18##2742 |goto Stranglethorn Vale 26.54,76.57 |q 341 |future |only if itemcount(2742) > 0
bank Green Hills of Stranglethorn - Page 20##2744 |goto Stranglethorn Vale 26.54,76.57 |q 341 |future |only if itemcount(2744) > 0
bank Green Hills of Stranglethorn - Page 21##2745 |goto Stranglethorn Vale 26.54,76.57 |q 341 |future |only if itemcount(2745) > 0
bank Green Hills of Stranglethorn - Page 24##2748 |goto Stranglethorn Vale 26.54,76.57 |q 341 |future |only if itemcount(2748) > 0
bank Green Hills of Stranglethorn - Page 25##2749 |goto Stranglethorn Vale 26.54,76.57 |q 342 |future |only if itemcount(2749) > 0
bank Green Hills of Stranglethorn - Page 26##2750 |goto Stranglethorn Vale 26.54,76.57 |q 342 |future |only if itemcount(2750) > 0
bank Green Hills of Stranglethorn - Page 27##2751 |goto Stranglethorn Vale 26.54,76.57 |q 342 |future |only if itemcount(2751) > 0
step
talk Drizzlik##2495
|tip Upper level of the docks.
|tip Inside the building.
turnin Supply and Demand##575 |goto Stranglethorn Vale 28.29,77.59
accept Some Assembly Required##577 |goto Stranglethorn Vale 28.29,77.59
step
talk Elsharin##5498
|tip Top of the tower.
Train Abilities |trainer Elsharin##5498 |goto Stormwind City/0 36.87,81.13 |q 328
|only if Mage
step
Enter the building |goto Stormwind City 29.19,74.12 < 10 |walk |only if not (subzone("The Slaughtered Lamb") and indoors())
talk Demisette Cloyce##461
|tip Downstairs inside the building.
Train Abilities |trainer Demisette Cloyce##461 |goto Stormwind City/0 25.28,78.22 |q 328
|only if Warlock
step
talk Spackle Thornberry##5520
|tip Buy available Grimoires.
|tip Downstairs inside the building.
Train Demon Abilities |vendor Spackle Thornberry##5520 |goto Stormwind City/0 25.66,77.65 |q 328
|only if Warlock
step
Enter the building |goto Stormwind City 43.05,34.48 < 15 |walk |only if not subzone("Cathedral of Light")
talk Katherine the Pure##5492
|tip Inside the building.
Train Abilities |trainer Katherine the Pure##5492 |goto Stormwind City/0 37.22,31.85 |q 328
|only if Paladin
step
Enter the building |goto Stormwind City 43.05,34.48 < 15 |walk |only if not subzone("Cathedral of Light")
talk Brother Benjamin##5484
|tip Walks around.
|tip Inside the building.
Train Abilities |trainer Brother Benjamin##5484 |goto Stormwind City/0 41.32,28.44 |q 328
|only if Priest
step
talk Wu Shen##5479
|tip Upstairs inside the building.
Train Abilities |trainer Wu Shen##5479 |goto Stormwind City/0 78.68,45.80 |q 328
|only if Warrior
step
talk Osborne the Night Man##918
Train Abilities |trainer Osborne the Night Man##918 |goto Stormwind City/0 74.64,52.82 |q 328
|only if Rogue
step
talk Einris Brightspear##5515
|tip Inside the building.
Train Abilities |trainer Einris Brightspear##5515 |goto Stormwind City/0 61.61,15.27 |q 328
|only if Hunter
stickystart "Kill_Kurzen_Headshrinkers"
stickystart "Kill_Kurzen_Commandos"
step
Enter the cave |goto Stranglethorn Vale 45.82,8.18 < 40 |walk |only if not (subzone("The Stockpile") and indoors())
click Bookie Herod's Strongbox
|tip Downstairs inside the cave.
turnin The Hidden Key##328 |goto Stranglethorn Vale 49.61,7.57
accept The Spy Revealed!##329 |goto Stranglethorn Vale 49.61,7.57
step
label "Kill_Kurzen_Headshrinkers"
kill 6 Kurzen Headshrinker##941 |q 574/2 |goto Stranglethorn Vale 46.48,7.08
|tip {o}Ground level{} inside the cave. |notinsticky
|mapmarker Stranglethorn Vale/0 48.20,8.60
step
label "Kill_Kurzen_Commandos"
kill 10 Kurzen Commando##938 |q 574/1 |goto Stranglethorn Vale 46.48,7.08
|tip Stealthed.
|tip {o}Ground level{} inside the cave. |notinsticky
|mapmarker Stranglethorn Vale/0 45.80,8.60
|mapmarker Stranglethorn Vale/0 48.20,8.60
step
Leave the cave |goto Stranglethorn Vale 45.82,8.18 < 40 |walk |only if subzone("The Stockpile") and indoors()
kill 10 Shadowmaw Panther##684 |q 192/1 |goto Stranglethorn Vale/0 48.60,22.20
|tip Stealthed.
|tip Avoid Bhag'thera.
|tip {o}Level 40 elite{} non-stealthed black panther.
|mapmarker Stranglethorn Vale/0 35.00,37.00
|mapmarker Stranglethorn Vale/0 35.40,34.40
|mapmarker Stranglethorn Vale/0 36.40,39.60
|mapmarker Stranglethorn Vale/0 37.20,35.40
|mapmarker Stranglethorn Vale/0 37.40,33.00
|mapmarker Stranglethorn Vale/0 37.80,41.40
|mapmarker Stranglethorn Vale/0 38.40,38.40
|mapmarker Stranglethorn Vale/0 39.20,34.80
|mapmarker Stranglethorn Vale/0 39.40,43.00
|mapmarker Stranglethorn Vale/0 39.80,32.40
|mapmarker Stranglethorn Vale/0 39.80,40.40
|mapmarker Stranglethorn Vale/0 41.00,36.20
|mapmarker Stranglethorn Vale/0 42.00,38.60
|mapmarker Stranglethorn Vale/0 45.00,26.20
|mapmarker Stranglethorn Vale/0 46.40,22.40
|mapmarker Stranglethorn Vale/0 47.00,27.80
|mapmarker Stranglethorn Vale/0 47.60,24.00
|mapmarker Stranglethorn Vale/0 48.00,20.00
|mapmarker Stranglethorn Vale/0 49.40,25.60
|mapmarker Stranglethorn Vale/0 50.40,20.40
stickystart "Kill_Lashtail_Raptors"
step
kill Snapjaw Crocolisk##1152+
|tip In and around the water.
collect 5 Snapjaw Crocolisk Skin##4104 |q 577/1 |goto Stranglethorn Vale 40.40,25.00
|mapmarker Stranglethorn Vale/0 38.40,30.60
|mapmarker Stranglethorn Vale/0 39.40,17.80
|mapmarker Stranglethorn Vale/0 39.40,21.40
|mapmarker Stranglethorn Vale/0 40.00,27.20
|mapmarker Stranglethorn Vale/0 41.80,15.80
|mapmarker Stranglethorn Vale/0 42.60,21.00
step
label "Kill_Lashtail_Raptors"
kill 10 Lashtail Raptor##686 |q 195/1 |goto Stranglethorn Vale 37.20,23.60
|mapmarker Stranglethorn Vale/0 30.20,24.60
|mapmarker Stranglethorn Vale/0 30.40,21.40
|mapmarker Stranglethorn Vale/0 32.20,20.40
|mapmarker Stranglethorn Vale/0 32.40,23.00
|mapmarker Stranglethorn Vale/0 33.80,25.40
|mapmarker Stranglethorn Vale/0 35.00,27.60
|mapmarker Stranglethorn Vale/0 36.00,25.40
|mapmarker Stranglethorn Vale/0 37.40,19.80
|mapmarker Stranglethorn Vale/0 37.40,27.40
|mapmarker Stranglethorn Vale/0 38.80,21.40
|mapmarker Stranglethorn Vale/0 39.60,19.00
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
stickystart "Collect_Bloodscalp_Tusks_And_Ears_Warrior"
step
click Moon Over the Vale
collect The First Troll Legend##2005 |q 207/1 |goto Stranglethorn Vale 29.48,19.15
|only if Warrior
step
click Gri'lek the Wanderer
|tip Avoid the {o}elite murlocs{}.
|tip Underwater.
collect The Second Troll Legend##2006 |q 207/2 |goto Stranglethorn Vale 24.75,22.84
|only if Warrior
stickystop "Collect_Bloodscalp_Tusks_And_Ears_Warrior"
step
kill Lesser Water Elemental##691+
collect 6 Water Elemental Bracers##3923 |q 601/1 |goto Stranglethorn Vale 21.40,22.20
|mapmarker Stranglethorn Vale/0 19.40,22.20
|mapmarker Stranglethorn Vale/0 20.00,24.60
step
Allow Enemies to Kill You
|tip No death penalty at this level.
|tip Fast travel.
|tip Inside and outside the mine.
Die on Purpose |complete isdead |goto Stranglethorn Vale 21.33,21.93 |q 192
|only if not hardcore() and not Warrior
step
talk Spirit Healer##6491
Select _"Return me to life."_ |gossip 96031
Resurrect at the Spirit Healer |complete not isdead |goto Stranglethorn Vale/0 38.38,8.96 |q 192 |zombiewalk
|only if not hardcore() and not Warrior
stickystart "Collect_Bloodscalp_Tusks_And_Ears_Warrior"
step
Follow the path up |goto Stranglethorn Vale 23.84,10.65 < 20 |only if walking
click The Emperor's Tomb
collect The Fourth Troll Legend##2008 |q 207/4 |goto Stranglethorn Vale 24.70,8.93
|only if Warrior
step
Follow the path |goto Stranglethorn Vale 24.51,11.72 < 15 |only if walking
click Fall of Gurubashi
collect The Third Troll Legend##2007 |q 207/3 |goto Stranglethorn Vale 22.95,12.02
|only if Warrior
step
label "Collect_Bloodscalp_Tusks_And_Ears_Warrior"
kill Bloodscalp Axe Thrower##694, Bloodscalp Beastmaster##699, Bloodscalp Berserker##597, Bloodscalp Headhunter##671, Bloodscalp Hunter##595, Bloodscalp Mystic##701, Bloodscalp Scavenger##702, Bloodscalp Scout##588, Bloodscalp Shaman##697, Bloodscalp Warrior##587, Bloodscalp Witch Doctor##660
|tip Trolls.
collect 15 Bloodscalp Ear##1519 |q 189/1 |goto Stranglethorn Vale 24.60,11.40
collect 30 Bloodscalp Tusk##3901 |q 1712/2 |goto Stranglethorn Vale 24.60,11.40
|mapmarker Stranglethorn Vale/0 22.40,13.20
|mapmarker Stranglethorn Vale/0 22.80,10.40
|mapmarker Stranglethorn Vale/0 25.40,9.20
|mapmarker Stranglethorn Vale/0 25.40,13.60
|mapmarker Stranglethorn Vale/0 27.20,11.20
|mapmarker Stranglethorn Vale/0 29.40,12.20
|only if Warrior
step
talk Sir S. J. Erlgadin##718
turnin Panther Mastery##192 |goto Stranglethorn Vale 35.55,10.55
accept Panther Mastery##193 |goto Stranglethorn Vale 35.55,10.55
step
talk Ajeck Rouack##717
turnin Tiger Mastery##188 |goto Stranglethorn Vale 35.62,10.62
step
talk Hemet Nesingwary##715
turnin Raptor Mastery##195 |goto Stranglethorn Vale 35.66,10.81
accept Raptor Mastery##196 |goto Stranglethorn Vale 35.66,10.81
step
talk Brother Nimetz##739
turnin Kurzen's Mystery##207 |goto Stranglethorn Vale 37.83,3.56
|only if Warrior
step
talk Lieutenant Doren##469
turnin Special Forces##574 |goto Stranglethorn Vale 38.04,3.01
turnin The Spy Revealed!##329 |goto Stranglethorn Vale 38.04,3.01
accept Patrol Schedules##330 |goto Stranglethorn Vale 38.04,3.01
step
talk Corporal Sethman##1422
turnin Patrol Schedules##330 |goto Stranglethorn Vale 37.66,3.39
accept Report to Doren##331 |goto Stranglethorn Vale 37.66,3.39
step
talk Lieutenant Doren##469
turnin Report to Doren##331 |goto Stranglethorn Vale 38.04,3.01
step
talk Loganaar##12042
Train Abilities |trainer Loganaar##12042 |goto Moonglade/0 52.53,40.57 |q 601
|only if Druid
step
talk Kebok##737
|tip {o}Top floor{} inside the building.
turnin Bloodscalp Ears##189 |goto Stranglethorn Vale 27.00,77.12
|only if Warrior
step
talk Baron Revilgaz##2496
|tip Up on the balcony of the building.
turnin Water Elementals##601 |goto Stranglethorn Vale 27.23,76.87
accept Magical Analysis##602 |goto Stranglethorn Vale 27.23,76.87
step
talk Viznik Goldgrubber##2625
|tip Deposit into the bank.
bank Green Hills of Stranglethorn - Page 1##2725 |goto Stormwind City 57.66,72.78 |q 339 |future |only if itemcount(2725) > 0
bank Green Hills of Stranglethorn - Page 4##2728 |goto Stormwind City 57.66,72.78 |q 339 |future |only if itemcount(2728) > 0
bank Green Hills of Stranglethorn - Page 6##2730 |goto Stormwind City 57.66,72.78 |q 339 |future |only if itemcount(2730) > 0
bank Green Hills of Stranglethorn - Page 8##2732 |goto Stormwind City 57.66,72.78 |q 339 |future |only if itemcount(2732) > 0
bank Green Hills of Stranglethorn - Page 10##2734 |goto Stormwind City 57.66,72.78 |q 340 |future |only if itemcount(2734) > 0
bank Green Hills of Stranglethorn - Page 11##2735 |goto Stormwind City 57.66,72.78 |q 340 |future |only if itemcount(2735) > 0
bank Green Hills of Stranglethorn - Page 14##2738 |goto Stormwind City 57.66,72.78 |q 340 |future |only if itemcount(2738) > 0
bank Green Hills of Stranglethorn - Page 16##2740 |goto Stormwind City 57.66,72.78 |q 340 |future |only if itemcount(2740) > 0
bank Green Hills of Stranglethorn - Page 18##2742 |goto Stormwind City 57.66,72.78 |q 341 |future |only if itemcount(2742) > 0
bank Green Hills of Stranglethorn - Page 20##2744 |goto Stormwind City 57.66,72.78 |q 341 |future |only if itemcount(2744) > 0
bank Green Hills of Stranglethorn - Page 21##2745 |goto Stormwind City 57.66,72.78 |q 341 |future |only if itemcount(2745) > 0
bank Green Hills of Stranglethorn - Page 24##2748 |goto Stormwind City 57.66,72.78 |q 341 |future |only if itemcount(2748) > 0
bank Green Hills of Stranglethorn - Page 25##2749 |goto Stormwind City 57.66,72.78 |q 342 |future |only if itemcount(2749) > 0
bank Green Hills of Stranglethorn - Page 26##2750 |goto Stormwind City 57.66,72.78 |q 342 |future |only if itemcount(2750) > 0
bank Green Hills of Stranglethorn - Page 27##2751 |goto Stormwind City 57.66,72.78 |q 342 |future |only if itemcount(2751) > 0
step
talk Drizzlik##2495
|tip Upper level of the docks.
|tip Inside the building.
turnin Some Assembly Required##577 |goto Stranglethorn Vale 28.29,77.59
step
_NOTE:_
Stronger Ammo Available
|tip Buy level 40 ammo when restocking.
Click Here to Continue |confirm |q 514
|only if Hunter
step
talk Randal Hunter##4732
Train Horse Riding |learnspell Horse Riding##824 |goto Elwynn Forest/0 84.32,64.87
Buy a mount from Katie Hunter nearby at [Elwynn Forest/0 84.15,65.49]
|only if Human and discountgold('Stormwind',500000)
]])
GoatQuest:RegisterGuide("Leveling Guides\\Arathi Highlands & Alterac Mountains (40-42)",{
image=GQ.IMAGESDIR.."Alterac Mountains",
next="Leveling Guides\\Stranglethorn Vale (42-44)",
},[[
step
talk Elsharin##5498
|tip Top of the tower.
Train Abilities |trainer Elsharin##5498 |goto Stormwind City/0 36.87,81.13 |q 514
|only if Mage
step
talk Auctioneer Jaxon##15659
|tip Buy from the Auction House, if possible.
|tip Inside the building.
collect 2 Elixir of Water Breathing##5996 |goto Stormwind City 53.62,59.76 |q 666 |future
|only if not (Druid or Warlock)
step
talk Olivia Burnside##2455
|tip Collect from the bank.
|tip Inside the building.
collect Cleverly Encrypted Letter##3521 |goto Stormwind City 57.66,72.78 |q 514
step
Enter the building |goto Stormwind City 29.19,74.12 < 10 |walk |only if not (subzone("The Slaughtered Lamb") and indoors())
talk Demisette Cloyce##461
|tip Downstairs inside the building.
accept Summon Felsteed##4488 |goto Stormwind City/0 25.28,78.22
|only if Warlock
step
talk Demisette Cloyce##461
|tip Downstairs inside the building.
Train Abilities |trainer Demisette Cloyce##461 |goto Stormwind City/0 25.28,78.22 |q 514
|only if Warlock
step
talk Spackle Thornberry##5520
|tip Buy available Grimoires.
|tip Downstairs inside the building.
Train Demon Abilities |vendor Spackle Thornberry##5520 |goto Stormwind City/0 25.66,77.65 |q 514
|only if Warlock
step
Enter the building |goto Stormwind City 43.05,34.48 < 15 |walk |only if not subzone("Cathedral of Light")
talk Duthorian Rall##6171
|tip Inside the building.
accept The Tome of Nobility##1661 |goto Stormwind City 39.81,29.80
|only if Paladin
step
talk Duthorian Rall##6171
|tip Inside the building.
turnin The Tome of Nobility##1661 |goto Stormwind City 39.81,29.80
|only if Paladin
step
talk Katherine the Pure##5492
|tip Inside the building.
Train Abilities |trainer Katherine the Pure##5492 |goto Stormwind City/0 37.22,31.85 |q 514
|only if Paladin
step
Enter the building |goto Stormwind City 43.05,34.48 < 15 |walk |only if not subzone("Cathedral of Light")
talk Brother Benjamin##5484
|tip Walks around.
|tip Inside the building.
Train Abilities |trainer Brother Benjamin##5484 |goto Stormwind City/0 41.32,28.44 |q 514
|only if Priest
step
talk Wu Shen##5479
|tip Upstairs inside the building.
Train Abilities |trainer Wu Shen##5479 |goto Stormwind City/0 78.68,45.80 |q 514
|only if Warrior
step
talk Osborne the Night Man##918
Train Abilities |trainer Osborne the Night Man##918 |goto Stormwind City/0 74.64,52.82 |q 514
|only if Rogue
step
talk Einris Brightspear##5515
|tip Inside the building.
Train Abilities |trainer Einris Brightspear##5515 |goto Stormwind City/0 61.61,15.27 |q 514
|only if Hunter
step
talk Karrina Mekenda##2879
|tip Inside the building.
Train Pet Abilities |trainer Karrina Mekenda##2879 |goto Stormwind City/0 61.57,15.99 |q 514
|only if Hunter
step
talk Prospector Stormpike##1356
|tip Inside the building.
turnin Letter to Stormpike##514 |goto Ironforge 74.64,11.74
accept Further Mysteries##525 |goto Ironforge 74.64,11.74
step
talk Ultham Ironhorn##4772
Train Ram Riding |learnspell Ram Riding##826 |goto Dun Morogh/0 63.94,50.10
Buy a mount from Veron Amberstill nearby at [Dun Morogh/0 63.47,50.56]
|only if Dwarf and discountgold('Ironforge',500000)
step
talk Binjy Featherwhistle##7954
Train Mechanostrider Piloting |learnspell Mechanostrider Piloting##553 |goto Dun Morogh/0 49.15,48.13
Buy a mount from Milli Featherwhistle nearby at [Dun Morogh/0 49.13,47.95]
|only if Gnome and discountgold('Gnomeregan Exiles',500000)
step
talk Jartsam##4753
Train Tiger Riding |learnspell Tiger Riding##828 |goto Darnassus/0 38.69,15.84
Buy a mount from Lelanai nearby at [Darnassus/0 38.28,15.36]
|only if NightElf and discountgold('Darnassus',500000)
step
talk Strahad Farsan##6251
turninany Summon Felsteed##4487,4488 |goto The Barrens/0 62.63,35.50
accept Summon Felsteed##4490 |goto The Barrens/0 62.63,35.50
|only if Warlock
step
talk Strahad Farsan##6251
turnin Summon Felsteed##4490 |goto The Barrens/0 62.63,35.50
|only if Warlock
step
map Hillsbrad Foothills
path	follow strictbounce;	loop off;	ants straight;		dist 50;	markers none;		arrow hide
path	55.64,19.67	55.67,24.84	55.96,29.02	57.76,36.69	62.45,41.43
path	65.74,42.56	68.19,45.57	72.49,48.23	77.21,53.20	80.37,55.32
path	81.99,56.91
map Arathi Highlands
path	20.22,29.62	21.63,31.75	22.57,34.04	22.76,38.68	23.72,43.33
path	25.44,46.63	26.54,49.19	31.09,51.86	34.82,52.25	38.27,53.51
path	39.53,54.77	43.02,55.12	45.37,58.95	46.82,59.78	48.79,59.23
path	50.81,59.99	52.10,61.37	55.34,62.36	56.58,62.96	57.64,62.70
path	59.19,62.94	60.56,61.21	61.12,59.49	60.24,59.11
kill Forsaken Courier##2714
|tip Walks one-way on the road with 4 guards.
|tip Respawns if she reaches Tarren Mill.
|tip Begins walking again in Arathi Highlands.
|tip Can wait for her to respawn at the small house in Arathi.
collect Sealed Folder##4482 |q 658/1
Spawns around [Arathi Highlands/0 60.42,58.99] |noway
step
talk Apprentice Kryten##2788
accept Worth Its Weight in Gold##691 |goto Arathi Highlands 46.20,47.75
step
click Shards of Myzrael##138492
accept The Princess Trapped##642 |goto Arathi Highlands 62.50,33.80
step
kill Drywhisker Kobold##2572, Drywhisker Digger##2574, Drywhisker Surveyor##2573
|tip Kobolds.
|tip More inside the cave up the path.
|tip Avoid Hammerfall.
|tip Next step is inside the cave.
collect 12 Mote of Myzrael##4435 |q 642/1 |goto Arathi Highlands 76.00,44.20
|mapmarker Arathi Highlands/0 77.20,42.40
|mapmarker Arathi Highlands/0 77.40,35.40
|mapmarker Arathi Highlands/0 78.00,39.60
|mapmarker Arathi Highlands/0 78.60,37.40
|mapmarker Arathi Highlands/0 79.20,41.20
|mapmarker Arathi Highlands/0 79.40,33.20
|mapmarker Arathi Highlands/0 81.80,39.60
|mapmarker Arathi Highlands/0 82.20,36.80
|mapmarker Arathi Highlands/0 83.20,33.20
|mapmarker Arathi Highlands/0 83.60,35.20
|mapmarker Arathi Highlands/0 84.20,28.40
|mapmarker Arathi Highlands/0 84.40,31.40
|mapmarker Arathi Highlands/0 85.40,33.40
|mapmarker Arathi Highlands/0 86.20,30.20
step
Follow the path up to the cave |goto Arathi Highlands 80.90,39.96 < 15 |only if walking and not (subzone("Drywhisker Gorge") and indoors())
Enter the cave |goto Arathi Highlands 82.66,36.16 < 20 |walk |walk |only if not (subzone("Drywhisker Gorge") and indoors())
click Iridescent Shards
|tip Upstairs inside the cave.
turnin The Princess Trapped##642 |goto Arathi Highlands 84.31,30.92
accept Stones of Binding##651 |goto Arathi Highlands 84.31,30.92
stickystart "Collect_Cresting_Charms_Warrior"
step
Leave the cave |goto Arathi Highlands 82.69,36.21 < 20 |walk |only if subzone("Drywhisker Gorge") and indoors()
click Stone of East Binding
|tip Avoid Hammerfall.
collect Cresting Key##4484 |q 651/2 |goto Arathi Highlands 66.75,29.75
step
label "Collect_Cresting_Charms_Warrior"
kill Cresting Exile##2761+
collect 8 Cresting Charm##4481 |goto Arathi Highlands 66.20,31.60 |q 1714 |future
|mapmarker Arathi Highlands/0 65.00,27.40
|mapmarker Arathi Highlands/0 65.20,29.80
|mapmarker Arathi Highlands/0 67.20,28.40
|mapmarker Arathi Highlands/0 68.60,30.60
|only if Warrior
stickystart "Collect_Witherbark_Medicine_Pouches"
stickystart "Collect_Witherbark_Tusks"
step
kill Witherbark Shadow Hunter##2557+
|tip Inside the cave.
collect Shadow Hunter Knife##5040 |q 691/3 |goto Arathi Highlands 68.32,75.18
|mapmarker Arathi Highlands/0 66.20,80.60
|mapmarker Arathi Highlands/0 67.40,77.40
|mapmarker Arathi Highlands/0 68.00,79.40
|mapmarker Arathi Highlands/0 68.60,82.00
|mapmarker Arathi Highlands/0 70.00,77.40
|tip Don't vendor them.
step
label "Collect_Witherbark_Medicine_Pouches"
Leave the cave |goto Arathi Highlands 68.32,75.18 < 20 |walk |only if subzone("Witherbark Village") and indoors()
kill Witherbark Witch Doctor##2555+
collect 4 Witherbark Medicine Pouch##4522 |q 691/2 |goto Arathi Highlands 65.80,68.00
|mapmarker Arathi Highlands/0 32.40,44.00
|mapmarker Arathi Highlands/0 60.80,72.20
|mapmarker Arathi Highlands/0 62.80,67.60
|mapmarker Arathi Highlands/0 65.00,73.60
|mapmarker Arathi Highlands/0 65.40,71.40
|mapmarker Arathi Highlands/0 66.40,63.40
|mapmarker Arathi Highlands/0 67.00,73.60
|mapmarker Arathi Highlands/0 68.60,71.80
|mapmarker Arathi Highlands/0 69.00,61.40
|mapmarker Arathi Highlands/0 69.20,68.40
|mapmarker Arathi Highlands/0 69.80,66.40
|mapmarker Arathi Highlands/0 70.40,70.40
|mapmarker Arathi Highlands/0 71.40,63.00
|mapmarker Arathi Highlands/0 72.40,65.80
step
label "Collect_Witherbark_Tusks"
Leave the cave |goto Arathi Highlands 68.32,75.18 < 20 |walk |only if subzone("Witherbark Village") and indoors()
kill Witherbark Shadow Hunter##2557, Witherbark Headhunter##2556, Witherbark Axe Thrower##2554, Witherbark Witch Doctor##2555
collect 10 Witherbark Tusk##4503 |q 691/1 |goto Arathi Highlands 65.80,68.00
|mapmarker Arathi Highlands/0 32.40,44.00
|mapmarker Arathi Highlands/0 60.80,72.20
|mapmarker Arathi Highlands/0 62.80,67.60
|mapmarker Arathi Highlands/0 65.00,73.60
|mapmarker Arathi Highlands/0 65.40,71.40
|mapmarker Arathi Highlands/0 66.40,63.40
|mapmarker Arathi Highlands/0 67.00,73.60
|mapmarker Arathi Highlands/0 68.60,71.80
|mapmarker Arathi Highlands/0 69.00,61.40
|mapmarker Arathi Highlands/0 69.20,68.40
|mapmarker Arathi Highlands/0 69.80,66.40
|mapmarker Arathi Highlands/0 70.40,70.40
|mapmarker Arathi Highlands/0 71.40,63.00
|mapmarker Arathi Highlands/0 72.40,65.80
step
talk Quae##2712
|tip Up on the ridge.
turnin Hints of a New Plague?##658 |goto Arathi Highlands 60.19,53.85
accept Hints of a New Plague?##657 |goto Arathi Highlands 60.19,53.85
step
talk Kinelory##2713
|tip Escort quest.
|tip Wait until she respawns, if missing.
turnin Hints of a New Plague?##657 |goto Arathi Highlands 60.24,53.92
accept Hints of a New Plague?##660 |goto Arathi Highlands 60.24,53.92 |noautoaccept inparty
step
Watch the dialogue
|tip Follow and protect Kinelory.
Protect Kinelory |q 660/1 |goto Arathi Highlands 60.24,53.92
step
talk Quae##2712
turnin Hints of a New Plague?##660 |goto Arathi Highlands 60.19,53.85
accept Hints of a New Plague?##661 |goto Arathi Highlands 60.19,53.85
stickystart "Collect_Thundering_Charms_Warrior"
step
click Stone of Outer Binding
collect Thundering Key##4485 |q 651/3 |goto Arathi Highlands 52.04,50.77
step
label "Collect_Thundering_Charms_Warrior"
kill Thundering Exile##2762+
collect 8 Thundering Charm##4480 |goto Arathi Highlands 52.20,52.60 |q 1714 |future
|mapmarker Arathi Highlands/0 50.40,50.40
|mapmarker Arathi Highlands/0 52.40,47.40
|mapmarker Arathi Highlands/0 53.60,49.20
|only if Warrior
step
talk Apprentice Kryten##2788
turnin Worth Its Weight in Gold##691 |goto Arathi Highlands 46.20,47.75
step
talk Phin Odelic##2711
turnin Hints of a New Plague?##661 |goto Hillsbrad Foothills 50.34,59.04
step
talk Marshal Redpath##2263
accept Crushridge Bounty##500 |goto Hillsbrad Foothills 49.48,58.73
step
talk Magistrate Henry Maleb##2276
|tip Inside the building.
turnin Further Mysteries##525 |goto Hillsbrad Foothills 48.14,59.11
accept Dark Council##537 |goto Hillsbrad Foothills 48.14,59.11
accept Noble Deaths##512 |goto Hillsbrad Foothills 48.14,59.11
step
talk Archmage Ansirem Runeweaver##2543
turnin Magical Analysis##602 |goto Alterac Mountains 18.84,78.49
step
Watch the dialogue
talk Archmage Ansirem Runeweaver##2543
accept Ansirem's Key##603 |goto Alterac Mountains 18.84,78.49
stickystart "Collect_Alterac_Signet_Rings"
step
kill Nagaz##2320
|tip Careful, stealthed enemies.
|tip Inside the building.
collect Head of Nagaz##3672 |q 537/2 |goto Alterac Mountains 39.22,14.31
step
click Worn Wooden Chest
|tip Inside the building.
collect Ensorcelled Parchment##3706 |n
use Ensorcelled Parchment##3706
accept The Ensorcelled Parchment##551 |goto Alterac Mountains 39.18,14.66
step
kill 4 Argus Shadow Mage##2318 |q 537/1 |goto Alterac Mountains/0 63.40,43.80
|tip Humans in brown robes.
|tip Careful, stealthed enemies.
|tip Inside buildings. |only if subzone("Strahnbrad")
|mapmarker Alterac Mountains/0 53.20,20.80
|mapmarker Alterac Mountains/0 56.00,27.20
|mapmarker Alterac Mountains/0 57.40,46.00
|mapmarker Alterac Mountains/0 58.40,30.40
|mapmarker Alterac Mountains/0 60.00,43.80
|mapmarker Alterac Mountains/0 61.40,45.40
|mapmarker Alterac Mountains/0 61.80,41.00
|mapmarker Alterac Mountains/0 47.40,17.20
step
label "Collect_Alterac_Signet_Rings"
kill Syndicate Spy##2242, Syndicate Wizard##2319, Syndicate Sentry##2243, Syndicate Saboteur##2245, Syndicate Enforcer##2247, Syndicate Assassin##2246
|tip Careful, stealthed enemies. |notinsticky
collect 7 Alterac Signet Ring##3505 |q 512/1 |goto Alterac Mountains 62.20,45.60
|mapmarker Alterac Mountains/0 47.20,17.20
|mapmarker Alterac Mountains/0 47.80,20.80
|mapmarker Alterac Mountains/0 53.20,21.00
|mapmarker Alterac Mountains/0 53.40,24.40
|mapmarker Alterac Mountains/0 54.00,18.00
|mapmarker Alterac Mountains/0 54.40,28.00
|mapmarker Alterac Mountains/0 56.40,30.60
|mapmarker Alterac Mountains/0 57.00,25.40
|mapmarker Alterac Mountains/0 58.60,28.40
|mapmarker Alterac Mountains/0 59.60,31.40
|mapmarker Alterac Mountains/0 56.40,45.20
|mapmarker Alterac Mountains/0 57.40,41.60
|mapmarker Alterac Mountains/0 59.40,46.80
|mapmarker Alterac Mountains/0 59.80,43.80
|mapmarker Alterac Mountains/0 61.40,40.40
step
kill Crushridge Ogre##2252, Crushridge Brute##2253
|tip Ogres.
collect 9 Dirty Knucklebones##2843 |q 500/1 |goto Alterac Mountains 54.40,52.40
|mapmarker Alterac Mountains/0 44.40,61.40
|mapmarker Alterac Mountains/0 45.20,59.40
|mapmarker Alterac Mountains/0 46.00,63.80
|mapmarker Alterac Mountains/0 47.40,60.00
|mapmarker Alterac Mountains/0 48.00,55.60
|mapmarker Alterac Mountains/0 48.60,63.40
|mapmarker Alterac Mountains/0 49.20,52.40
|mapmarker Alterac Mountains/0 49.40,60.40
|mapmarker Alterac Mountains/0 50.00,55.40
|mapmarker Alterac Mountains/0 50.20,58.40
|mapmarker Alterac Mountains/0 51.40,53.20
|mapmarker Alterac Mountains/0 52.40,51.40
|mapmarker Alterac Mountains/0 53.20,54.60
|mapmarker Alterac Mountains/0 55.60,54.40
step
talk Guthrum Thunderfist##8018
|tip Top of the path.
fpath Aerie Peak |goto The Hinterlands 11.07,46.15
|tip Saves time later.
step
talk Marshal Redpath##2263
turnin Crushridge Bounty##500 |goto Hillsbrad Foothills 49.48,58.73
step
talk Magistrate Henry Maleb##2276
|tip Inside the building.
turnin Dark Council##537 |goto Hillsbrad Foothills 48.14,59.11
turnin Noble Deaths##512 |goto Hillsbrad Foothills 48.14,59.11
step
talk Innkeeper Anderson##2352
|tip Inside the building.
home Southshore |goto Hillsbrad Foothills 51.17,58.93 |q 603 |future
step
talk Loremaster Dibbs##2277
turnin The Ensorcelled Parchment##551 |goto Hillsbrad Foothills 50.57,57.09
step
talk Skuerto##2789
accept Wand over Fist##693 |goto Arathi Highlands 46.65,47.01
step
Enter the cave |goto Arathi Highlands 53.75,77.37 < 15 |walk |only if not (subzone("Boulderfist Hall") and indoors())
kill Kor'gresh Coldrage##2793
|tip Inside the cave.
collect Trelane's Wand of Invocation##4525 |q 693/1 |goto Arathi Highlands 54.75,81.87
step
Leave the cave |goto Arathi Highlands 53.68,77.23 < 15 |walk |only if subzone("Boulderfist Hall") and indoors()
talk Skuerto##2789
turnin Wand over Fist##693 |goto Arathi Highlands 46.65,47.01
stickystart "Collect_Burning_Charms_Warrior"
step
click Stone of West Binding
collect Burning Key##4483 |q 651/1 |goto Arathi Highlands 25.45,30.16
step
label "Collect_Burning_Charms_Warrior"
kill Burning Exile##2760+
|tip Avoid Refuge Point.
collect 8 Burning Charm##4479 |goto Arathi Highlands 24.40,30.40 |q 1714 |future
|mapmarker Arathi Highlands/0 24.40,28.40
|mapmarker Arathi Highlands/0 24.40,32.40
|mapmarker Arathi Highlands/0 26.40,28.60
|mapmarker Arathi Highlands/0 26.40,30.80
|only if Warrior
step
use Nature Protection Potion##6052
|tip Level 40 elite enemy soon.
|tip Need to use another {o}Nature Protection Potion{} during the fight.
|tip Use one now so cooldown is ready during the fight.
|tip Potion lasts 1 hour, plenty of time.
Click Here to Continue |confirm |q 1713 |future
|only if Warrior and itemcount(6052) > 0
step
click Bah'rah's Cauldron
|tip Follow the river north.
|tip Complete the {o}Essence of the Exile{} quest.
collect Essence of the Exile##6851 |q 1712/3 |goto Alterac Mountains 79.32,66.81
|only if Warrior
step
talk Bath'rah the Windwatcher##6176
|tip Inside the building.
turnin Cyclonian##1712 |goto Alterac Mountains 80.50,66.92
accept The Summoning##1713 |goto Alterac Mountains 80.50,66.92 |noautoaccept
|tip Make sure your {o}Nature Protection Potion{} cooldown is finished.
|only if Warrior
step
Watch the dialogue
|tip Follow Bath'rah the Windwatcher.
|tip Summons Cyclonian.
kill Cyclonian##6239
|tip Level 40 elite.
|tip Use another {o}Nature Protection Potion{} when first one wears off. |only if itemcount(6052) > 0
|tip May need help.
collect Whirlwind Heart##6894 |q 1713/1 |goto Alterac Mountains 80.60,62.52
|only if Warrior
step
talk Bath'rah the Windwatcher##6176
|tip Inside the building.
turnin The Summoning##1713 |goto Alterac Mountains 80.50,66.92
accept Whirlwind Weapon##1792 |goto Alterac Mountains 80.50,66.92 |instant
|only if Warrior
step
_Destroy This Item:_
|tip Not needed.
trash Bath'rah's Parchment##6929
|only if Warrior
step
click Stone of Inner Binding
turnin Stones of Binding##651 |goto Arathi Highlands 36.19,57.37
step
Follow the path through the mountains |goto Arathi Highlands 31.22,65.35 < 40 |only if walking and not subzone("Faldir's Cove")
Run through the tunnel to Faldir's Cove |goto Arathi Highlands 21.58,75.61 < 20 |only if walking and not subzone("Faldir's Cove")
talk Lolo the Lookout##2766
|tip Walks around.
accept Land Ho!##663 |goto Arathi Highlands 31.78,82.70
step
talk Shakes O'Breen##2610
turnin Land Ho!##663 |goto Arathi Highlands 32.28,81.38
step
talk First Mate Nilzlix##2767
|tip Walks around.
accept Deep Sea Salvage##662 |goto Arathi Highlands 32.77,81.47
step
talk Captain Steelgut##2769
accept Drowned Sorrows##664 |goto Arathi Highlands 34.00,80.79
step
talk Professor Phizzlethorpe##2768
|tip Escort quest.
|tip Wait until he respawns, if missing.
accept Sunken Treasure##665 |goto Arathi Highlands 33.87,80.55 |noautoaccept inparty
step
Watch the dialogue
|tip Follow and protect Professor Phizzlethorpe.
Defend Professor Phizzlethorpe |q 665/1 |goto Arathi Highlands 33.87,80.55
step
talk Doctor Draxlegauge##2774
turnin Sunken Treasure##665 |goto Arathi Highlands 33.86,80.45
accept Sunken Treasure##666 |goto Arathi Highlands 33.86,80.45
stickystart "Collect_Elven_Gems"
stickystart "Kill_Daggerspine_Sorceresses_And_Raiders"
step
use Elixir of Water Breathing##5996 |only if itemcount(5996) > 0 and not hasbuff(7178) and not (Druid or Warlock or Shaman)
click Maiden's Folly Log
|tip Brown book in a metal cauldron.
|tip {o}Middle floor{} inside the sunken ship.
collect Maiden's Folly Log##4489 |q 662/2 |goto Arathi Highlands 23.41,85.10
step
use Elixir of Water Breathing##5996 |only if itemcount(5996) > 0 and not hasbuff(7178) and not (Druid or Warlock or Shaman)
click Maiden's Folly Charts
|tip Tan flat scroll.
|tip {o}Middle floor{} inside the sunken ship.
collect Maiden's Folly Charts##4487 |q 662/1 |goto Arathi Highlands 23.04,84.51
step
use Elixir of Water Breathing##5996 |only if itemcount(5996) > 0 and not hasbuff(7178) and not (Druid or Warlock or Shaman)
click Spirit of Silverpine Charts
|tip Tan flat scroll.
|tip {o}Middle floor{} inside the sunken ship.
collect Spirit of Silverpine Charts##4488 |q 662/3 |goto Arathi Highlands 20.45,85.60
step
use Elixir of Water Breathing##5996 |only if itemcount(5996) > 0 and not hasbuff(7178) and not (Druid or Warlock or Shaman)
click Spirit of Silverpine Log
|tip Open book.
|tip Very bottom inside the ship.
collect Spirit of Silverpine Log##4490 |q 662/4 |goto Arathi Highlands 20.65,85.10
step
label "Collect_Elven_Gems"
equip Goggles of Gem Hunting##4491 |n |only if not equipped(4491)
use Elixir of Water Breathing##5996 |only if itemcount(5996) > 0 and not hasbuff(7178) and not (Druid or Warlock or Shaman) |notinsticky
click Calcified Elven Gem+
|tip Large grey stones.
|tip On your minimap.
collect 10 Elven Gem##4492 |q 666/1 |goto Arathi Highlands 23.60,87.40
|mapmarker Arathi Highlands/0 17.70,88.80
|mapmarker Arathi Highlands/0 19.40,90.20
|mapmarker Arathi Highlands/0 19.60,84.70
|mapmarker Arathi Highlands/0 20.40,87.10
|mapmarker Arathi Highlands/0 21.00,92.10
|mapmarker Arathi Highlands/0 21.10,90.20
|mapmarker Arathi Highlands/0 22.40,83.70
|mapmarker Arathi Highlands/0 23.00,92.20
|mapmarker Arathi Highlands/0 24.30,84.80
|mapmarker Arathi Highlands/0 24.40,86.40
|mapmarker Arathi Highlands/0 25.20,90.60
step
Equip Your Regular Head Armor |unequip Goggles of Gem Hunting##4491 |q 666
step
label "Kill_Daggerspine_Sorceresses_And_Raiders"
use Elixir of Water Breathing##5996 |only if itemcount(5996) > 0 and not hasbuff(7178) and not (Druid or Warlock or Shaman) |notinsticky
kill 3 Daggerspine Sorceress##2596 |q 664/2 |goto Arathi Highlands 19.20,84.00
kill 10 Daggerspine Raider##2595 |q 664/1 |goto Arathi Highlands 19.20,84.00
|tip Underwater. |notinsticky
|mapmarker Arathi Highlands/0 17.20,87.20
|mapmarker Arathi Highlands/0 18.40,90.00
|mapmarker Arathi Highlands/0 20.40,87.00
|mapmarker Arathi Highlands/0 21.00,92.20
|mapmarker Arathi Highlands/0 23.20,84.40
|mapmarker Arathi Highlands/0 23.20,88.20
|mapmarker Arathi Highlands/0 25.20,90.60
step
talk First Mate Nilzlix##2767
|tip Walks around.
turnin Deep Sea Salvage##662 |goto Arathi Highlands 32.80,81.48
step
talk Captain Steelgut##2769
turnin Drowned Sorrows##664 |goto Arathi Highlands 34.00,80.79
step
talk Doctor Draxlegauge##2774
turnin Sunken Treasure##666 |goto Arathi Highlands 33.85,80.45
accept Sunken Treasure##668 |goto Arathi Highlands 33.85,80.45
step
talk Shakes O'Breen##2610
turnin Sunken Treasure##668 |goto Arathi Highlands 32.29,81.38
accept Sunken Treasure##669 |goto Arathi Highlands 32.29,81.38
step
talk Loganaar##12042
Train Abilities |trainer Loganaar##12042 |goto Moonglade/0 52.53,40.57 |q 554 |future
|only if Druid
step
talk Jartsam##4753
Train Tiger Riding |learnspell Tiger Riding##828 |goto Darnassus/0 38.69,15.84
Buy a mount from Lelanai nearby at [Darnassus/0 38.28,15.36]
|only if NightElf and discountgold('Darnassus',500000) and Druid
step
talk Loremaster Dibbs##2277
accept Stormpike's Deciphering##554 |goto Hillsbrad Foothills 50.57,57.09
step
talk Jartsam##4753
Train Tiger Riding |learnspell Tiger Riding##828 |goto Darnassus/0 38.69,15.84
Buy a mount from Lelanai nearby at [Darnassus/0 38.28,15.36]
|only if NightElf and discountgold('Darnassus',500000)
step
talk Dink##7312
|tip Inside the building.
Train Abilities |trainer Dink##7312 |goto Ironforge/0 27.16,8.56 |q 554 |future
|only if Mage
step
talk Prospector Stormpike##1356
|tip Inside the building.
turnin Stormpike's Deciphering##554 |goto Ironforge 74.64,11.74
step
talk Bilban Tosslespanner##5114
|tip Inside the building.
Train Abilities |trainer Bilban Tosslespanner##5114 |goto Ironforge/0 65.90,88.41 |q 603
|only if Warrior
step
talk Regnus Thundergranite##5117
|tip Inside the building.
Train Abilities |trainer Regnus Thundergranite##5117 |goto Ironforge/0 69.87,82.90 |q 603
|only if Hunter
step
talk Belia Thundergranite##10090
|tip Inside the building.
Train Pet Abilities |trainer Belia Thundergranite##10090 |goto Ironforge/0 70.86,85.84 |q 603
|only if Hunter
step
talk Fenthwick##5167
|tip Inside the building.
Train Abilities |trainer Fenthwick##5167 |goto Ironforge/0 65.90,88.41 |q 603
|only if Rogue
step
talk Briarthorn##5172
|tip Inside the building.
Train Abilities |trainer Briarthorn##5172 |goto Ironforge/0 50.35,5.66 |q 603
|only if Warlock
step
talk Jubahl Corpseseeker##6382
|tip Buy available Grimoires.
|tip Inside the building.
Train Demon Abilities |vendor Jubahl Corpseseeker##6382 |goto Ironforge/0 50.35,5.66 |q 603
|only if Warlock
step
talk Toldren Deepiron##5143
|tip Inside the building.
Train Abilities |trainer Toldren Deepiron##5143 |goto Ironforge/0 25.21,10.74 |q 603
|only if Priest
step
talk Beldruk Doombrow##5148
|tip Inside the building.
Train Abilities |trainer Beldruk Doombrow##5148 |goto Ironforge/0 24.55,4.48 |q 603
|only if Paladin
step
talk Bailey Stonemantle##2461
|tip Collect from the bank.
|tip Skip any missing pages.
|tip We'll buy them from the Auction House.
|tip Inside the building.
collect Green Hills of Stranglethorn - Page 1##2725 |goto Ironforge 35.92,60.14 |q 339 |future
collect Green Hills of Stranglethorn - Page 4##2728 |goto Ironforge 35.92,60.14 |q 339 |future
collect Green Hills of Stranglethorn - Page 6##2730 |goto Ironforge 35.92,60.14 |q 339 |future
collect Green Hills of Stranglethorn - Page 8##2732 |goto Ironforge 35.92,60.14 |q 339 |future
collect Green Hills of Stranglethorn - Page 10##2734 |goto Ironforge 35.92,60.14 |q 340 |future
collect Green Hills of Stranglethorn - Page 11##2735 |goto Ironforge 35.92,60.14 |q 340 |future
collect Green Hills of Stranglethorn - Page 14##2738 |goto Ironforge 35.92,60.14 |q 340 |future
collect Green Hills of Stranglethorn - Page 16##2740 |goto Ironforge 35.92,60.14 |q 340 |future
collect Green Hills of Stranglethorn - Page 18##2742 |goto Ironforge 35.92,60.14 |q 341 |future
collect Green Hills of Stranglethorn - Page 20##2744 |goto Ironforge 35.92,60.14 |q 341 |future
collect Green Hills of Stranglethorn - Page 21##2745 |goto Ironforge 35.92,60.14 |q 341 |future
collect Green Hills of Stranglethorn - Page 24##2748 |goto Ironforge 35.92,60.14 |q 341 |future
collect Green Hills of Stranglethorn - Page 25##2749 |goto Ironforge 35.92,60.14 |q 342 |future
collect Green Hills of Stranglethorn - Page 26##2750 |goto Ironforge 35.92,60.14 |q 342 |future
collect Green Hills of Stranglethorn - Page 27##2751 |goto Ironforge 35.92,60.14 |q 342 |future
step
talk Auctioneer Redmuse##8720
|tip Buy from the Auction House, if possible.
|tip Sell your pages if you can't make a full chapter.
|tip Inside the building.
_Chapter I_
collect Green Hills of Stranglethorn - Page 1##2725 |goto Ironforge 24.16,74.67 |q 339 |future
collect Green Hills of Stranglethorn - Page 4##2728 |goto Ironforge 24.16,74.67 |q 339 |future
collect Green Hills of Stranglethorn - Page 6##2730 |goto Ironforge 24.16,74.67 |q 339 |future
collect Green Hills of Stranglethorn - Page 8##2732 |goto Ironforge 24.16,74.67 |q 339 |future
_Chapter II_
collect Green Hills of Stranglethorn - Page 10##2734 |goto Ironforge 24.16,74.67 |q 340 |future
collect Green Hills of Stranglethorn - Page 11##2735 |goto Ironforge 24.16,74.67 |q 340 |future
collect Green Hills of Stranglethorn - Page 14##2738 |goto Ironforge 24.16,74.67 |q 340 |future
collect Green Hills of Stranglethorn - Page 16##2740 |goto Ironforge 24.16,74.67 |q 340 |future
_Chapter III_
collect Green Hills of Stranglethorn - Page 18##2742 |goto Ironforge 24.16,74.67 |q 341 |future
collect Green Hills of Stranglethorn - Page 20##2744 |goto Ironforge 24.16,74.67 |q 341 |future
collect Green Hills of Stranglethorn - Page 21##2745 |goto Ironforge 24.16,74.67 |q 341 |future
collect Green Hills of Stranglethorn - Page 24##2748 |goto Ironforge 24.16,74.67 |q 341 |future
_Chapter IV_
collect Green Hills of Stranglethorn - Page 25##2749 |goto Ironforge 24.16,74.67 |q 342 |future
collect Green Hills of Stranglethorn - Page 26##2750 |goto Ironforge 24.16,74.67 |q 342 |future
collect Green Hills of Stranglethorn - Page 27##2751 |goto Ironforge 24.16,74.67 |q 342 |future
step
talk Ultham Ironhorn##4772
Train Ram Riding |learnspell Ram Riding##826 |goto Dun Morogh/0 63.94,50.10
Buy a mount from Veron Amberstill nearby at [Dun Morogh/0 63.47,50.56]
|only if Dwarf and discountgold('Ironforge',500000)
step
talk Binjy Featherwhistle##7954
Train Mechanostrider Piloting |learnspell Mechanostrider Piloting##553 |goto Dun Morogh/0 49.15,48.13
Buy a mount from Milli Featherwhistle nearby at [Dun Morogh/0 49.13,47.95]
|only if Gnome and discountgold('Gnomeregan Exiles',500000)
step
talk Randal Hunter##4732
Train Horse Riding |learnspell Horse Riding##824 |goto Elwynn Forest/0 84.32,64.87
Buy a mount from Katie Hunter nearby at [Elwynn Forest/0 84.15,65.49]
|only if Human and discountgold('Stormwind',500000)
]])
GoatQuest:RegisterGuide("Leveling Guides\\Stranglethorn Vale (42-44)",{
image=GQ.IMAGESDIR.."Stranglethorn Vale",
next="Leveling Guides\\Tanaris & Feralas (44-48)",
},[[
step
talk Fleet Master Seahorn##2487
|tip Up on the balcony of the building.
turnin Sunken Treasure##669 |goto Stranglethorn Vale 27.17,77.01
step
talk Catelyn the Blade##2542
|tip {o}Middle floor{} inside the building.
turnin Ansirem's Key##603 |goto Stranglethorn Vale 27.28,77.53
accept "Pretty Boy" Duncan##610 |goto Stranglethorn Vale 27.28,77.53
step
talk Innkeeper Skindle##6807
|tip {o}Ground floor{} inside the building.
|tip Inside the building.
home Booty Bay |goto Stranglethorn Vale 27.04,77.31 |q 1707 |future
step
Watch the dialogue
|tip {o}Ground floor{} inside the building.
talk Crank Fizzlebub##2498
accept Venture Company Mining##600 |goto Stranglethorn Vale 27.12,77.21
accept Zanzil's Secret##621 |goto Stranglethorn Vale 27.12,77.21
step
talk "Sea Wolf" MacKinley##2501
|tip Inside the building.
accept Scaring Shaky##606 |goto Stranglethorn Vale 27.78,77.07
step
talk First Mate Crazz##2490
accept The Bloodsail Buccaneers##595 |goto Stranglethorn Vale 28.10,76.22
step
talk Drizzlik##2495
|tip Upper level of the docks.
|tip Inside the building.
accept Excelsior##628 |goto Stranglethorn Vale 28.29,77.59
step
_NOTE:_
Tame an Ironfur Bear
|tip Cast {o}Tame Beast{} on an {o}Ironfur Bear{}.
|tip Find one that's {o}level 42{}.
|tip Abandon your pet first.
|tip New permanent pet.
Click Here to Continue |confirm |goto Feralas/0 87.60,38.00 |q 606
|mapmarker Feralas/0 79.60,37.40
|mapmarker Feralas/0 81.00,45.20
|mapmarker Feralas/0 83.00,40.40
|mapmarker Feralas/0 84.40,45.80
|mapmarker Feralas/0 84.60,37.60
|mapmarker Feralas/0 85.80,42.40
|only if Hunter
step
Run through the tunnel to leave Booty Bay |goto Stranglethorn Vale 28.00,73.46 < 15 |only if walking and (subzone("Booty Bay") or subzone("The Old Port Authority") or subzone("The Salty Sailor Tavern"))
kill Elder Mistvale Gorilla##1557+
collect 5 Mistvale Giblets##3919 |q 606/1 |goto Stranglethorn Vale 31.20,68.20
|mapmarker Stranglethorn Vale/0 31.00,60.00
|mapmarker Stranglethorn Vale/0 31.20,65.20
|mapmarker Stranglethorn Vale/0 32.80,61.40
|mapmarker Stranglethorn Vale/0 33.20,64.60
|mapmarker Stranglethorn Vale/0 33.60,67.00
|mapmarker Stranglethorn Vale/0 34.60,62.60
stickystart "Collect_Catelyns_Blade"
step
click Bloodsail Correspondence
turnin The Bloodsail Buccaneers##595 |goto Stranglethorn Vale 27.28,69.52
accept The Bloodsail Buccaneers##597 |goto Stranglethorn Vale 27.28,69.52
step
label "Collect_Catelyns_Blade"
kill "Pretty Boy" Duncan##2545
collect Catelyn's Blade##4027 |q 610/1 |goto Stranglethorn Vale 27.38,69.41
step
Run through the tunnel to enter Booty Bay |goto Stranglethorn Vale 29.56,72.51 < 15 |only if walking and not (subzone("Booty Bay") or subzone("The Old Port Authority") or subzone("The Salty Sailor Tavern"))
talk "Shaky" Phillipe##2502
turnin Scaring Shaky##606 |goto Stranglethorn Vale 26.90,73.59
accept Return to MacKinley##607 |goto Stranglethorn Vale 26.90,73.59
step
talk First Mate Crazz##2490
turnin The Bloodsail Buccaneers##597 |goto Stranglethorn Vale 28.10,76.21
accept The Bloodsail Buccaneers##599 |goto Stranglethorn Vale 28.10,76.21
step
talk "Sea Wolf" MacKinley##2501
|tip Inside the building.
turnin Return to MacKinley##607 |goto Stranglethorn Vale 27.78,77.07
accept Voodoo Dues##609 |goto Stranglethorn Vale 27.78,77.07
step
talk Catelyn the Blade##2542
|tip {o}Middle floor{} inside the building.
turnin "Pretty Boy" Duncan##610 |goto Stranglethorn Vale 27.28,77.53
accept The Curse of the Tides##611 |goto Stranglethorn Vale 27.28,77.53
step
talk Fleet Master Seahorn##2487
|tip Up on the balcony of the building.
turnin The Bloodsail Buccaneers##599 |goto Stranglethorn Vale 27.17,77.01
step
talk Privateer Bloads##2494
|tip Walks around.
accept Akiris by the Bundle##617 |goto Stranglethorn Vale 26.76,76.38
|mapmarker Stranglethorn Vale 27.43,76.78
step
Run through the tunnel to leave Booty Bay |goto Stranglethorn Vale 28.00,73.46 < 15 |only if walking and (subzone("Booty Bay") or subzone("The Old Port Authority") or subzone("The Salty Sailor Tavern"))
kill Naga Explorer##1907+
collect 10 Akiris Reed##4029 |q 617/1 |goto Stranglethorn Vale 24.40,64.60
|mapmarker Stranglethorn Vale/0 24.00,62.40
|mapmarker Stranglethorn Vale/0 24.40,59.80
|mapmarker Stranglethorn Vale/0 26.00,62.40
|mapmarker Stranglethorn Vale/0 26.80,59.20
|mapmarker Stranglethorn Vale/0 27.80,61.40
|mapmarker Stranglethorn Vale/0 28.00,64.60
stickystart "Collect_Zanzils_Mixture"
step
kill Jon-Jon the Crow##2536
collect Jon-Jon's Golden Spyglass##3925 |q 609/2 |goto Stranglethorn Vale 34.93,51.85
step
kill Maury "Club Foot" Wilkins##2535
collect Maury's Clubbed Foot##3924 |q 609/1 |goto Stranglethorn Vale 35.25,51.26
step
Follow the path to the Ruins of Aboraz |goto Stranglethorn Vale 33.73,53.77 < 30 |only if walking and not (subzone("Ruins of Aboraz") or subzone("The Crystal Shore"))
kill Chucky "Ten Thumbs"##2537
collect Chucky's Huge Ring##3926 |q 609/3 |goto Stranglethorn Vale 40.00,58.24
step
label "Collect_Zanzils_Mixture"
kill Zanzil Zombie##1488, Zanzil Hunter##1489, Zanzil Witch Doctor##1490, Zanzil Naga##1491
|tip Avoid Zanzil the Outcast. 			|only if (subzone("Ruins of Aboraz") or subzone("The Crystal Shore"))
|tip Summons many enemies. 			|only if (subzone("Ruins of Aboraz") or subzone("The Crystal Shore"))
collect 12 Zanzil's Mixture##4016 |q 621/1 |goto Stranglethorn Vale 39.80,57.20
|mapmarker Stranglethorn Vale/0 38.40,56.60
|mapmarker Stranglethorn Vale/0 38.60,58.60
|mapmarker Stranglethorn Vale/0 41.60,56.40
|mapmarker Stranglethorn Vale/0 40.46,59.45
step
kill 10 Jungle Stalker##687 |q 196/1 |goto Stranglethorn Vale 27.20,48.20
|tip Work your way {o}northeast{}.
|mapmarker Stranglethorn Vale/0 23.00,49.80
|mapmarker Stranglethorn Vale/0 26.00,51.20
|mapmarker Stranglethorn Vale/0 27.40,43.20
|mapmarker Stranglethorn Vale/0 30.40,41.80
|mapmarker Stranglethorn Vale/0 31.80,37.80
|mapmarker Stranglethorn Vale/0 33.40,40.40
step
kill Venture Co. Strip Miner##674, Venture Co. Tinkerer##677, Venture Co. Surveyor##676, Venture Co. Foreman##675
|tip Goblins.
collect 10 Singing Blue Crystal##3917 |q 600/1 |goto Stranglethorn Vale 41.40,44.60
|mapmarker Stranglethorn Vale/0 40.20,42.40
|mapmarker Stranglethorn Vale/0 40.40,43.80
|mapmarker Stranglethorn Vale/0 41.40,41.40
|mapmarker Stranglethorn Vale/0 42.00,46.00
step
kill Bhag'thera##728
|tip Unstealthed {o}level 40 elite{} black panther.
|tip Walks around.
|tip Multiple locations.
collect Fang of Bhag'thera##3876 |q 193/1 |goto Stranglethorn Vale 46.37,29.05
|mapmarker Stranglethorn Vale 49.60,24.03
|mapmarker Stranglethorn Vale 48.99,20.20
step
talk Hemet Nesingwary##715
turnin Raptor Mastery##196 |goto Stranglethorn Vale 35.66,10.81
accept Raptor Mastery##197 |goto Stranglethorn Vale 35.66,10.81
step
talk Sir S. J. Erlgadin##718
turnin Panther Mastery##193 |goto Stranglethorn Vale 35.55,10.55
step
talk Barnil Stonepot##716
accept The Green Hills of Stranglethorn##338 |goto Stranglethorn Vale/0 35.66,10.53
step
talk Barnil Stonepot##716
accept Chapter I##339 |goto Stranglethorn Vale/0 35.66,10.53
|only if itemcount(2725) > 0 and itemcount(2728) > 0 and itemcount(2730) > 0 and itemcount(2732) > 0
step
talk Barnil Stonepot##716
turnin Chapter I##339 |goto Stranglethorn Vale/0 35.66,10.53
|only if haveq(339) or completedq(339)
step
talk Barnil Stonepot##716
accept Chapter II##340 |goto Stranglethorn Vale/0 35.66,10.53
|only if itemcount(2734) > 0 and itemcount(2735) > 0 and itemcount(2738) > 0 and itemcount(2740) > 0
step
talk Barnil Stonepot##716
turnin Chapter II##340 |goto Stranglethorn Vale/0 35.66,10.53
|only if haveq(339) or completedq(339)
step
talk Barnil Stonepot##716
accept Chapter III##341 |goto Stranglethorn Vale/0 35.66,10.53
|only if itemcount(2742) > 0 and itemcount(2744) > 0 and itemcount(2745) > 0 and itemcount(2748) > 0
step
talk Barnil Stonepot##716
turnin Chapter III##341 |goto Stranglethorn Vale/0 35.66,10.53
|only if haveq(339) or completedq(339)
step
talk Barnil Stonepot##716
accept Chapter IV##342 |goto Stranglethorn Vale/0 35.66,10.53
|only if itemcount(2749) > 0 and itemcount(2750) > 0 and itemcount(2751) > 0
step
talk Barnil Stonepot##716
turnin Chapter IV##342 |goto Stranglethorn Vale/0 35.66,10.53
|only if haveq(339) or completedq(339)
|delay 0.2
step
talk Barnil Stonepot##716
turnin The Green Hills of Stranglethorn##338 |goto Stranglethorn Vale/0 35.66,10.53
|only if readyq(338) or completedq(338)
step
Abandon the {y}The Green Hills of Stranglethorn{} Quest |complete not haveq(338)
|tip Not needed.
step
kill Elder Saltwater Crocolisk##2635
|tip {o}Level 38 elite{} enemies.
|tip Shared spawns with Saltwater Crocolisks.
collect Elder Crocolisk Skin##4105 |q 628/1 |goto Stranglethorn Vale 29.20,22.40
|mapmarker Stranglethorn Vale/0 21.40,15.80
|mapmarker Stranglethorn Vale/0 22.40,19.00
|mapmarker Stranglethorn Vale/0 25.20,19.20
|mapmarker Stranglethorn Vale/0 29.40,25.20
step
click Altar of the Tides
|tip Stone table.
|tip Underwater.
kill Gazban##2624
|tip Pull him up to the water surface.
collect Stone of the Tides##4034 |q 611/1 |goto Stranglethorn Vale 24.96,23.58
step
talk Crank Fizzlebub##2498
|tip {o}Ground floor{} inside the building.
turnin Venture Company Mining##600 |goto Stranglethorn Vale 27.12,77.21
turnin Zanzil's Secret##621 |goto Stranglethorn Vale/0 27.12,77.21
step
talk Deeg##2488
|tip {o}Top floor{} inside the building.
accept Up to Snuff##587 |goto Stranglethorn Vale 26.92,77.35
step
talk Fleet Master Seahorn##2487
|tip Up on the balcony of the building.
accept The Bloodsail Buccaneers##604 |goto Stranglethorn Vale 27.17,77.01
step
talk Baron Revilgaz##2496
|tip Up on the balcony of the building.
turnin The Curse of the Tides##611 |goto Stranglethorn Vale 27.23,76.87
step
talk Privateer Bloads##2494
|tip Walks around.
turnin Akiris by the Bundle##617 |goto Stranglethorn Vale 26.76,76.38
accept Akiris by the Bundle##623 |goto Stranglethorn Vale 26.76,76.38
|mapmarker Stranglethorn Vale 27.43,76.78
step
talk "Sea Wolf" MacKinley##2501
|tip Inside the building.
turnin Voodoo Dues##609 |goto Stranglethorn Vale 27.78,77.07
step
talk Drizzlik##2495
|tip Upper level of the docks.
|tip Inside the building.
turnin Excelsior##628 |goto Stranglethorn Vale 28.29,77.59
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
step
label "Kill_Bloodsail_Swashbucklers"
kill 10 Bloodsail Swashbuckler##1563 |q 604/1 |goto Stranglethorn Vale 27.00,82.80
|mapmarker Stranglethorn Vale/0 29.40,80.40
|mapmarker Stranglethorn Vale/0 32.00,79.60
|mapmarker Stranglethorn Vale/0 33.00,77.00
step
Run through the tunnel to enter Booty Bay |goto Stranglethorn Vale 29.56,72.51 < 15 |only if walking and not (subzone("Booty Bay") or subzone("The Old Port Authority") or subzone("The Salty Sailor Tavern"))
talk Dizzy One-Eye##2493
|tip Upper level of the docks.
turnin Keep An Eye Out##576 |goto Stranglethorn Vale 28.59,75.90
step
talk Whiskey Slim##2491
|tip {o}Ground floor{} inside the building.
accept Whiskey Slim's Lost Grog##580 |goto Stranglethorn Vale 27.13,77.45
step
talk Deeg##2488
|tip {o}Top floor{} inside the building.
turnin Up to Snuff##587 |goto Stranglethorn Vale 26.92,77.35
step
talk Krazek##773
|tip {o}Top floor{} inside the building.
accept Tran'rek##2864 |goto Stranglethorn Vale 26.94,77.21
step
talk Fleet Master Seahorn##2487
|tip Up on the balcony of the building.
turnin The Bloodsail Buccaneers##604 |goto Stranglethorn Vale 27.17,77.01
step
talk "Sea Wolf" MacKinley##2501
|tip Inside the building.
accept Stoley's Debt##2872 |goto Stranglethorn Vale 27.78,77.07
step
talk Loganaar##12042
Train Abilities |trainer Loganaar##12042 |goto Moonglade/0 52.53,40.57 |q 623
|only if Druid
step
talk Privateer Groy##2616
|tip Walks around.
turnin Akiris by the Bundle##623 |goto Dustwallow Marsh 68.84,53.22
|mapmarker Dustwallow Marsh 68.02,51.44
]])
GoatQuest:RegisterGuide("Leveling Guides\\Tanaris & Feralas (44-48)",{
image=GQ.IMAGESDIR.."Tanaris",
next="Leveling Guides\\Un'Goro Crater & The Hinterlands (48-50)",
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
stickystart "Collect_Wastewander_Water_Pouches"
stickystart "Kill_Wastewander_Bandits_And_Thieves"
step
talk Haughty Modiste##15165
accept Pirate Hats Ahoy!##8365 |goto Tanaris/0 66.56,22.27
stickystop "Collect_Wastewander_Water_Pouches"
stickystop "Kill_Wastewander_Bandits_And_Thieves"
step
talk Yeh'kinya##8579
accept Screecher Spirits##3520 |goto Tanaris 66.99,22.36
step
talk Security Chief Bilgewhizzle##7882
|tip Inside the building.
accept Southsea Shakedown##8366 |goto Tanaris/0 67.06,23.89
step
talk Stoley##7881
|tip Inside the building.
turnin Stoley's Debt##2872 |goto Tanaris 67.11,23.98
accept Stoley's Shipment##2873 |goto Tanaris/0 67.11,23.98
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
talk Curgle Cranklehop##7763
accept Handle With Care##3022 |goto Tanaris 52.35,26.91
step
Avoid Camp Mojache and ride the boat or swim across the water |goto Feralas 43.39,42.75 < 40 |only if walking and not (subzone("Sardor Isle") or subzone("Feathermoon Stronghold") or subzone("Ruins of Solarsal") or subzone("Isle of Dread"))
talk Pratt McGrubben##7852
accept The Mark of Quality##2821 |goto Feralas 30.63,42.71
step
talk Fyldren Moonfeather##8019
fpath Feathermoon |goto Feralas 30.24,43.25
step
talk Innkeeper Shyria##7736
|tip Inside the building.
home Feathermoon Stronghold |goto Feralas 30.97,43.49 |q 82 |future
step
talk Latronicus Moonspear##7877
|tip Inside the building.
accept The Missing Courier##4124 |goto Feralas 30.38,46.17
step
talk Shandris Feathermoon##3936
|tip Inside the building.
accept The Ruins of Solarsal##2866 |goto Feralas 30.28,46.17
step
talk Troyas Moonbreeze##7764
|tip Inside the building.
accept In Search of Knowledge##2939 |goto Feralas 31.78,45.50
step
talk Angelas Moonbreeze##7900
|tip Inside the building.
accept The High Wilderness##2982 |goto Feralas 31.83,45.61
step
talk Ginro Hearthkindle##7880
|tip Upstairs inside the building.
turnin The Missing Courier##4124 |goto Feralas 31.86,45.13
accept The Missing Courier##4125 |goto Feralas 31.86,45.13
step
click Solarsal Gazebo##142179
|tip Stand inside it.
turnin The Ruins of Solarsal##2866 |goto Feralas 26.32,52.34
accept Return to Feathermoon Stronghold##2867 |goto Feralas 26.32,52.34
step
talk Shandris Feathermoon##3936
|tip Inside the building.
turnin Return to Feathermoon Stronghold##2867 |goto Feralas 30.28,46.17
accept Against the Hatecrest##3130 |goto Feralas 30.28,46.17
step
talk Latronicus Moonspear##7877
|tip Inside the building.
turnin Against the Hatecrest##3130 |goto Feralas 30.38,46.17
accept Against the Hatecrest##2869 |goto Feralas 30.38,46.17
step
kill Hatecrest Screamer##5335, Hatecrest Wave Rider##5332, Hatecrest Warrior##5331, Hatecrest Siren##5337, Hatecrest Myrmidon##5334, Hatecrest Sorceress##5336, Hatecrest Serpent Guard##5333
|tip Nagas.
collect 10 Hatecrest Naga Scale##9247 |q 2869/1 |goto Feralas/0 29.00,53.60
|mapmarker Feralas/0 25.40,49.40
|mapmarker Feralas/0 25.40,53.40
|mapmarker Feralas/0 26.40,56.80
|mapmarker Feralas/0 28.40,50.40
|mapmarker Feralas/0 29.60,57.00
|mapmarker Feralas/0 32.20,55.40
step
talk Latronicus Moonspear##7877
|tip Inside the building.
turnin Against the Hatecrest##2869 |goto Feralas 30.38,46.17
accept Against Lord Shalzaru##2870 |goto Feralas 30.38,46.17
step
_NOTE:_
Dangerous Cave
|tip Cave in next step can be dangerous.
|tip Skip quest, if you prefer.
Click Here to Continue |confirm |q 2870
|only if hardcore()
step
Enter the cave |goto Feralas/0 26.09,67.26 < 20 |walk |only if not subzone("Shalzaru's Lair")
kill Lord Shalzaru##8136
|tip May need help.
|tip Inside the cave.
collect Mysterious Relic##9248 |q 2870/1 |goto Feralas/0 28.49,70.45
step
Leave the cave |goto Feralas 26.09,67.26 < 20 |walk |only if subzone("Shalzaru's Lair")
Swim to this location to avoid fatigue |goto Feralas/0 38.94,74.91 < 30 |only if walking and zone("Feralas") and not subzone("The Forgotten Coast") |notravel
Swim to this location to avoid fatigue |goto Feralas/0 41.29,74.30 < 30 |only if walking and zone("Feralas") and not subzone("The Forgotten Coast") |notravel
click Wrecked Row Boat##164909
|tip Underwater.
turnin The Missing Courier##4125 |goto Feralas 45.45,64.97
accept Boat Wreckage##4127 |goto Feralas 45.45,64.97
step
talk Dink##7312
|tip Inside the building.
Train Abilities |trainer Dink##7312 |goto Ironforge/0 27.16,8.56 |q 4127
|only if Mage
step
talk Ginro Hearthkindle##7880
|tip Upstairs inside the building.
turnin Boat Wreckage##4127 |goto Feralas 31.86,45.13
accept The Knife Revealed##4129 |goto Feralas 31.86,45.13
step
talk Quintis Jonespyre##7879
|tip Top of the tower.
turnin The Knife Revealed##4129 |goto Feralas 32.45,43.79
step
Watch the dialogue
|tip Top of the tower.
talk Quintis Jonespyre##7879
accept Psychometric Reading##4130 |goto Feralas 32.45,43.79
step
talk Ginro Hearthkindle##7880
|tip Upstairs inside the building.
turnin Psychometric Reading##4130 |goto Feralas 31.86,45.13
accept The Woodpaw Gnolls##4131 |goto Feralas 31.86,45.13
step
talk Latronicus Moonspear##7877
|tip Inside the building.
turnin Against Lord Shalzaru##2870 |goto Feralas 30.38,46.17
accept Delivering the Relic##2871 |goto Feralas 30.38,46.17
step
talk Vestia Moonspear##7878
|tip Inside the building.
turnin Delivering the Relic##2871 |goto Feralas 30.08,45.06
step
kill Vale Screecher##5307, Rogue Vale Screecher##5308
|tip Red flying snakes.
use Yeh'kinya's Bramble##10699
|tip On their corpses.
talk Screecher Spirit##8612+
Collect #3# Screecher Spirits |q 3520/1 |goto Feralas/0 43.20,37.00
|mapmarker Feralas/0 46.20,39.80
|mapmarker Feralas/0 46.00,37.40
|mapmarker Feralas/0 46.40,47.80
|mapmarker Feralas/0 50.20,47.80
|mapmarker Feralas/0 52.60,49.80
|mapmarker Feralas/0 54.20,47.40
|mapmarker Feralas/0 56.20,50.00
|mapmarker Feralas/0 56.80,47.80
|mapmarker Feralas/0 58.40,52.00
|mapmarker Feralas/0 60.40,50.80
step
use OOX-22/FE Distress Beacon##8705
accept Find OOX-22/FE!##2766
|only if itemcount(8705) > 0
stickystart "Collect_Thick_Yeti_Hides"
step
Follow the road and run through the tunnel |goto Feralas 55.22,56.39 < 20 |only if walking and not (subzone("Feral Scar Vale") and indoors())
talk Homing Robot OOX-22/FE##7807
|tip In the clearing between the tunnel and cave.
turnin Find OOX-22/FE!##2766 |goto Feralas 53.35,55.70
|only if haveq(2766) or completedq(2766)
step
label "Collect_Thick_Yeti_Hides"
kill Feral Scar Yeti##5292, Enraged Feral Scar##5295, Hulking Feral Scar##5293
|tip Yetis.
|tip More through the tunnel.
collect 10 Thick Yeti Hide##8973 |q 2821/1 |goto Feralas 55.40,57.40
|mapmarker Feralas/0 52.40,57.40
|mapmarker Feralas/0 53.40,55.40
|mapmarker Feralas/0 55.20,54.40
|mapmarker Feralas/0 50.40,58.40
|mapmarker Feralas/0 51.80,60.60
step
Leave the cave and run  through the tunnel |goto Feralas 55.22,56.39 < 20 |only if walking and subzone("Feral Scar Vale") and indoors()
Follow the path up |goto Feralas 54.10,68.24 < 40 |only if walking and not subzone("Frayfeather Highlands")
click Hippogryph Egg
|tip Large white egg.
|tip Multiple locations.
collect Hippogryph Egg##8564 |goto Feralas 56.60,75.90 |q 2741 |future
|tip Don't vendor it.
|tip Needed for future quest.
|mapmarker Feralas/0 55.90,76.00
|mapmarker Feralas/0 56.40,77.40
|mapmarker Feralas/0 56.70,76.70
|mapmarker Feralas/0 57.00,78.20
|mapmarker Feralas/0 58.00,76.30
|mapmarker Feralas/0 58.30,76.80
|mapmarker Feralas/0 58.60,75.60
stickystart "Kill_Gordunni_Warlocks"
step
kill 8 Gordunni Shaman##5236 |q 2982/2 |goto Feralas 60.40,68.00
|mapmarker Feralas/0 57.80,70.20
|mapmarker Feralas/0 58.40,67.40
|mapmarker Feralas/0 59.40,65.40
|mapmarker Feralas/0 59.80,63.20
|mapmarker Feralas/0 60.20,70.40
|mapmarker Feralas/0 62.80,68.40
step
kill 8 Gordunni Brute##5232 |q 2982/3 |goto Feralas/0 60.40,58.80
|mapmarker Feralas/0 61.80,54.60
|mapmarker Feralas/0 59.65,56.44
step
label "Kill_Gordunni_Warlocks"
kill 8 Gordunni Warlock##5240 |q 2982/1 |goto Feralas/0 60.40,57.00
|mapmarker Feralas/0 59.40,64.60
|mapmarker Feralas/0 58.20,66.40
|mapmarker Feralas/0 60.40,71.00
|mapmarker Feralas/0 61.80,54.40
step
Kill enemies
|tip Clear enemies around the large cage.
|tip Makes next step easier.
Click Here to Continue |confirm |goto Feralas 66.69,46.57 |q 2969 |future
step
Follow the path up |goto Feralas 65.66,46.77 < 10 |only if walking
talk Kindal Moonweaver##7956
accept Freedom for All Creatures##2969 |goto Feralas 65.94,45.65
step
click Cage Door
|tip Releases the Captured Sprite Darters.
|tip Protect as many as you can.
|tip At least {o}6 of them must survive{}.
|tip {o}HURRY{}, timed quest.
Save at Least 6 Sprite Darters from Capture |q 2969/1 |goto Feralas 66.67,46.75
step
Follow the path up |goto Feralas 65.66,46.77 < 10 |only if walking
talk Kindal Moonweaver##7956
|tip {o}HURRY{}, timed quest.
|tip Wait for her to respawn, if missing.
turnin Freedom for All Creatures##2969 |goto Feralas 65.94,45.65
step
talk Jer'kai Moonweaver##7957
accept Doling Justice##2970 |goto Feralas 65.95,45.61
step
kill 6 Grimtotem Shaman##7727 |q 2970/3 |goto Feralas 67.40,46.40
kill 10 Grimtotem Raider##7725 |q 2970/2 |goto Feralas 67.40,46.40
kill 12 Grimtotem Naturalist##7726 |q 2970/1 |goto Feralas 67.40,46.40
|mapmarker Feralas/0 65.40,47.40
|mapmarker Feralas/0 66.60,38.40
|mapmarker Feralas/0 68.80,39.40
step
Follow the path up |goto Feralas 65.66,46.77 < 10 |only if walking
talk Jer'kai Moonweaver##7957
turnin Doling Justice##2970 |goto Feralas 65.95,45.61
accept Doling Justice##2972 |goto Feralas 65.95,45.61
step
click Large Leather Backpacks##164953
turnin The Woodpaw Gnolls##4131 |goto Feralas 73.31,56.31
accept The Writhing Deep##4135 |goto Feralas 73.31,56.31
step
use Undelivered Parcel##11463
accept Thalanaar Delivery##4281
step
_NOTE:_
Dangerous Cave
|tip Cave in next steps can be dangerous.
|tip Skip quests, if you prefer.
|tip You'll have to skip multiple quests if you do.
|tip More grinding later.
Click Here to Continue |confirm |multiq 3764,4496
|only if hardcore()
step
Enter the cave at the bottom of the path |goto Feralas 73.17,63.88 < 15 |walk
Follow the path down |goto Feralas 72.69,64.56 < 10 |walk
click Zukk'ash Pod##164954
|tip Inside the cave.
turnin The Writhing Deep##4135 |goto Feralas 72.08,63.75
accept Freed from the Hive##4265 |goto Feralas 72.08,63.75
step
Watch the dialogue
|tip Inside the cave.
Free Raschal |q 4265/1 |goto Feralas 72.08,63.81
step
talk Loganaar##12042
Train Abilities |trainer Loganaar##12042 |goto Moonglade/0 52.53,40.57 |q 2821
|only if Druid
step
talk Pratt McGrubben##7852
turnin The Mark of Quality##2821 |goto Feralas 30.63,42.71
step
talk Angelas Moonbreeze##7900
|tip Inside the building.
turnin The High Wilderness##2982 |goto Feralas 31.83,45.61
accept The Sunken Temple##3445 |goto Feralas 31.83,45.61
step
talk Ginro Hearthkindle##7880
|tip Upstairs inside the building.
turnin Freed from the Hive##4265 |goto Feralas 31.86,45.13
accept A Hero's Welcome##4266 |goto Feralas 31.86,45.13
step
talk Shandris Feathermoon##3936
|tip Inside the building.
turnin A Hero's Welcome##4266 |goto Feralas 30.28,46.17
accept Rise of the Silithid##4267 |goto Feralas 30.28,46.17
step
talk Erelas Ambersky##7916
|tip Inside the building.
turnin Handle With Care##3022 |goto Teldrassil 55.50,92.05
accept Favored of Elune?##3661 |goto Teldrassil 55.50,92.05
step
talk Daryn Lightwind##7907
|tip Upstairs inside the building.
turnin In Search of Knowledge##2939 |goto Teldrassil 55.41,92.23
step
click Feralas: A History
|tip Upstairs inside the building.
accept Feralas: A History##2940 |goto Teldrassil 55.22,91.46
step
talk Daryn Lightwind##7907
|tip Upstairs inside the building.
turnin Feralas: A History##2940 |goto Teldrassil 55.41,92.23
accept The Borrower##2941 |goto Teldrassil 55.41,92.23
step
talk Auctioneer Golothas##8723
|tip Buy from the Auction House, if possible.
|tip Saves time in Un'Goro Crater.
|tip Inside the building.
collect 7 Red Power Crystal##11186	|goto Darnassus/0 56.24,54.05 |q 4284 |future |usebank
collect 7 Yellow Power Crystal##11188	|goto Darnassus/0 56.24,54.05 |q 4284 |future |usebank
collect 7 Green Power Crystal##11185	|goto Darnassus/0 56.24,54.05 |q 4284 |future |usebank
collect 7 Blue Power Crystal##11184	|goto Darnassus/0 56.24,54.05 |q 4284 |future |usebank
step
talk Garryeth##4209
|tip Deposit into the bank.
bank Red Power Crystal##11186		|goto Darnassus 39.60,41.98 |q 4284 |future
bank Yellow Power Crystal##11188	|goto Darnassus 39.60,41.98 |q 4284 |future
bank Green Power Crystal##11185		|goto Darnassus 39.60,41.98 |q 4284 |future
bank Blue Power Crystal##11184		|goto Darnassus 39.60,41.98 |q 4284 |future
step
Enter the tree cave |goto Darnassus/0 32.14,16.46 < 7 |walk
talk Syurna##4163
|tip Downstairs inside the tree cave.
Train Abilities |trainer Syurna##4163 |goto Darnassus/0 37.00,21.92 |q 4267
|only if Rogue
step
talk Jocaste##4146
|tip Upstairs inside the building.
Train Abilities |trainer Jocaste##4146 |goto Darnassus/0 40.38,8.54 |q 4267
|only if Hunter
step
talk Sildanair##4089
Train Abilities |trainer Sildanair##4089 |goto Darnassus/0 61.78,42.21 |q 4267
|only if Warrior
step
talk Jandria##4091
|tip Inside the building.
Train Abilities |trainer Jandria##4091 |goto Darnassus/0 37.90,82.73 |q 4267
|only if Priest
step
talk Gracina Spiritmight##7740
|tip Upstairs inside the building.
turnin Rise of the Silithid##4267 |goto Darnassus 41.85,85.62
step
talk Tyrande Whisperwind##7999
|tip Upstairs inside the building.
turnin Doling Justice##2972 |goto Darnassus 39.10,81.59
step
talk Jartsam##4753
Train Tiger Riding |learnspell Tiger Riding##828 |goto Darnassus/0 38.69,15.84
Buy a mount from Lelanai nearby at [Darnassus/0 38.28,15.36]
|only if NightElf and discountgold('Darnassus',500000)
step
talk Beldruk Doombrow##5148
|tip Inside the building.
Train Abilities |trainer Beldruk Doombrow##5148 |goto Ironforge/0 24.55,4.48 |q 4281
|only if Paladin
step
talk Briarthorn##5172
|tip Inside the building.
Train Abilities |trainer Briarthorn##5172 |goto Ironforge/0 50.35,5.66 |q 4281
|only if Warlock
step
talk Jubahl Corpseseeker##6382
|tip Buy available Grimoires.
|tip Inside the building.
Train Demon Abilities |vendor Jubahl Corpseseeker##6382 |goto Ironforge/0 50.35,5.66 |q 4281
|only if Warlock
step
talk Ultham Ironhorn##4772
Train Ram Riding |learnspell Ram Riding##826 |goto Dun Morogh/0 63.94,50.10
Buy a mount from Veron Amberstill nearby at [Dun Morogh/0 63.47,50.56]
|only if Dwarf and discountgold('Ironforge',500000)
step
talk Binjy Featherwhistle##7954
Train Mechanostrider Piloting |learnspell Mechanostrider Piloting##553 |goto Dun Morogh/0 49.15,48.13
Buy a mount from Milli Featherwhistle nearby at [Dun Morogh/0 49.13,47.95]
|only if Gnome and discountgold('Gnomeregan Exiles',500000)
step
talk Randal Hunter##4732
Train Horse Riding |learnspell Horse Riding##824 |goto Elwynn Forest/0 84.32,64.87
Buy a mount from Katie Hunter nearby at [Elwynn Forest/0 84.15,65.49]
|only if Human and discountgold('Stormwind',500000)
step
talk Falfindel Waywarder##4048
turnin Thalanaar Delivery##4281 |goto Feralas 89.64,46.57
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
turnin The Borrower##2941 |goto Tanaris/0 52.36,26.90
accept The Super Snapper FX##2944 |goto Tanaris/0 52.36,26.90
accept A Bad Egg##2750			|goto Tanaris/0 52.36,26.91	|instant	|only if itemcount(8646) > 0
accept An Ordinary Egg##2749		|goto Tanaris/0 52.36,26.91	|instant	|only if itemcount(8645) > 0
accept A Fine Egg##2748			|goto Tanaris/0 52.36,26.91	|instant	|only if itemcount(8644) > 0
accept An Extraordinary Egg##2747	|goto Tanaris/0 52.36,26.91	|instant	|only if itemcount(8643) > 0
step
talk Senior Surveyor Fizzledowser##7724
accept Gadgetzan Water Survey##992 |goto Tanaris 50.21,27.48
step
use Untapped Dowsing Widget##8584
|tip Avoid {o}elite enemies{}.
|tip You will be attacked.
collect Tapped Dowsing Widget##8585 |q 992/1 |goto Tanaris 39.09,29.17
step
talk Senior Surveyor Fizzledowser##7724
turnin Gadgetzan Water Survey##992 |goto Tanaris 50.21,27.48
accept Noxious Lair Investigation##82 |goto Tanaris 50.21,27.48
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
step
talk Alchemist Pestlezugg##5594
|tip Inside the building.
turnin Noxious Lair Investigation##82 |goto Tanaris 50.89,26.96
step
talk Senior Surveyor Fizzledowser##7724
accept The Scrimshank Redemption##10 |goto Tanaris 50.21,27.48
step
click Wanted Poster
accept WANTED: Caliph Scorpidsting##2781 |goto Tanaris 51.84,27.02
accept WANTED: Andre Firebeard##2875 |goto Tanaris 51.84,27.02
step
talk Innkeeper Fizzgrimble##7733
|tip Inside the building.
home Gadgetzan |goto Tanaris/0 52.50,27.91 |q 2880 |future
step
talk Chief Engineer Bilgewhizzle##7407
accept More Wastewander Justice##1691 |goto Tanaris 52.46,28.51
step
talk Marvon Rivetseeker##7771
turnin The Sunken Temple##3445 |goto Tanaris 52.71,45.93
accept Gahz'ridian##3161 |goto Tanaris 52.71,45.93
stickystart "Kill_Wastewander_Assassins_Rogues_Shadow_Mages"
step
map Tanaris/0
path	follow strict;		loop;	ants curved;	dist 40;	markers none;		arrow hide
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
step
talk Jabbey##8139
|tip Long questing session soon.
|tip Inside the building.
Buy Extra Ammo |vendor Jabbey##8139 |goto Tanaris/0 67.01,21.99 |q 2875
|only if Hunter
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
|only if level < 48
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
|only if level < 48
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
accept Deliver to MacKinley##2874 |goto Tanaris 67.11,23.97
step
talk Haughty Modiste##15165
turnin Pirate Hats Ahoy!##8365 |goto Tanaris 66.56,22.27
step
talk Yeh'kinya##8579
turnin Screecher Spirits##3520 |goto Tanaris 66.99,22.36
step
talk Homing Robot OOX-17/TN##7784
|tip Escort quest.
|tip Wait until it respawns, if missing.
turnin Find OOX-17/TN!##351 |goto Tanaris 60.23,64.72
|only if haveq(351) or completedq(351)
step
Enter the cave |goto Tanaris 55.78,68.91 < 15 |walk |only if not (subzone("The Gaping Chasm") and indoors())
Follow the path down |goto Tanaris 57.61,70.67 < 10 |walk
click Scrimshank's Surveying Gear
|tip Inside the cave.
collect Scrimshank's Surveying Gear##8593 |q 10/1 |goto Tanaris 55.97,71.18
step
talk Chief Engineer Bilgewhizzle##7407
turnin WANTED: Caliph Scorpidsting##2781 |goto Tanaris 52.46,28.51
turnin More Wastewander Justice##1691 |goto Tanaris 52.46,28.51
step
talk Gimblethorn##7799
|tip Collect from the bank.
|tip Inside the building.
collect 7 Red Power Crystal##11186	|goto Tanaris/0 52.30,28.91 |q 4284 |future
collect 7 Yellow Power Crystal##11188	|goto Tanaris/0 52.30,28.91 |q 4284 |future
collect 7 Green Power Crystal##11185	|goto Tanaris/0 52.30,28.91 |q 4284 |future
collect 7 Blue Power Crystal##11184	|goto Tanaris/0 52.30,28.91 |q 4284 |future
step
talk Gimblethorn##7799
|tip Deposit into the bank.
|tip Inside the building.
bank Stoley's Bottle##9245 |goto Tanaris/0 52.30,28.91 |q 2874
step
talk Marin Noggenfogger##7564
accept The Thirsty Goblin##2605 |goto Tanaris 51.81,28.66
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
talk Tran'rek##7876
accept Thistleshrub Valley##3362 |goto Tanaris 51.57,26.76
step
talk Andi Lynn##11758
accept The Dunemaul Compound##5863 |goto Tanaris 52.82,27.40
step
talk Senior Surveyor Fizzledowser##7724
turnin Insect Part Analysis##113 |goto Tanaris 50.21,27.48
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
collect 30 Gahz'ridian Ornament##8443 |q 3161/1 |goto Tanaris/0 45.60,64.60
|mapmarker Tanaris/0 38.90,73.00
|mapmarker Tanaris/0 39.10,70.70
|mapmarker Tanaris/0 40.30,68.90
|mapmarker Tanaris/0 41.10,71.10
|mapmarker Tanaris/0 41.50,73.70
|mapmarker Tanaris/0 48.20,64.70
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
]])
GoatQuest:RegisterGuide("Leveling Guides\\Un'Goro Crater & The Hinterlands (48-50)",{
image=GQ.IMAGESDIR.."Un'Goro Crater",
next="Leveling Guides\\Western Plaguelands & Stranglethorn Vale (50-51)",
},[[
step
talk Torwa Pathfinder##9619
accept The Apes of Un'Goro##4289 |goto Un'Goro Crater 71.64,75.96
accept The Fare of Lar'korwi##4290 |goto Un'Goro Crater 71.64,75.96
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
talk Torwa Pathfinder##9619
turnin The Scent of Lar'korwi##4291 |goto Un'Goro Crater 71.63,75.97
accept The Bait for Lar'korwi##4292 |goto Un'Goro Crater 71.63,75.97
step
label "Accept_Willidens_Journal"
Kill enemies
|tip Any in Un'Goro Crater.
collect A Mangled Journal##11116 |n
use A Mangled Journal##11116
accept Williden's Journal##3884 |goto Un'Goro Crater 67.20,73.00
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
talk Muigin##9119
accept Muigin and Larion##4141 |goto Un'Goro Crater/0 42.94,9.64
stickystart "Collect_UnGoro_Soil"
step
kill Bloodpetal Flayer##6510, Bloodpetal Thresher##6511, Bloodpetal Lasher##6509
|tip Walking plants.
collect 15 Bloodpetal##11316 |q 4141/1 |goto Un'Goro Crater 69.20,35.20
|mapmarker Un'Goro Crater/0 63.00,32.60
|mapmarker Un'Goro Crater/0 64.00,29.40
|mapmarker Un'Goro Crater/0 64.40,37.20
|mapmarker Un'Goro Crater/0 66.40,26.00
|mapmarker Un'Goro Crater/0 66.40,33.20
|mapmarker Un'Goro Crater/0 66.40,39.60
|mapmarker Un'Goro Crater/0 67.40,29.60
|mapmarker Un'Goro Crater/0 68.40,20.40
|mapmarker Un'Goro Crater/0 69.40,24.40
|mapmarker Un'Goro Crater/0 69.40,39.00
|mapmarker Un'Goro Crater/0 70.20,31.40
|mapmarker Un'Goro Crater/0 70.40,27.40
|mapmarker Un'Goro Crater/0 71.40,21.40
|mapmarker Un'Goro Crater/0 72.00,36.40
|mapmarker Un'Goro Crater/0 72.20,41.60
|mapmarker Un'Goro Crater/0 73.40,32.40
|mapmarker Un'Goro Crater/0 74.40,43.80
|mapmarker Un'Goro Crater/0 74.60,38.20
|mapmarker Un'Goro Crater/0 75.40,47.60
step
label "Collect_UnGoro_Soil"
click Un'Goro Dirt Pile+
Kill enemies
collect 20 Un'Goro Soil##11018 |goto Un'Goro Crater 69.20,35.20 |multiq 3764,4496 |future |usebank
|tip Don't vendor them.
|mapmarker Un'Goro Crater/0 63.00,32.60
|mapmarker Un'Goro Crater/0 64.00,29.40
|mapmarker Un'Goro Crater/0 64.40,37.20
|mapmarker Un'Goro Crater/0 66.40,26.00
|mapmarker Un'Goro Crater/0 66.40,33.20
|mapmarker Un'Goro Crater/0 66.40,39.60
|mapmarker Un'Goro Crater/0 67.40,29.60
|mapmarker Un'Goro Crater/0 68.40,20.40
|mapmarker Un'Goro Crater/0 69.40,24.40
|mapmarker Un'Goro Crater/0 69.40,39.00
|mapmarker Un'Goro Crater/0 70.20,31.40
|mapmarker Un'Goro Crater/0 70.40,27.40
|mapmarker Un'Goro Crater/0 71.40,21.40
|mapmarker Un'Goro Crater/0 72.00,36.40
|mapmarker Un'Goro Crater/0 72.20,41.60
|mapmarker Un'Goro Crater/0 73.40,32.40
|mapmarker Un'Goro Crater/0 74.40,43.80
|mapmarker Un'Goro Crater/0 74.60,38.20
|mapmarker Un'Goro Crater/0 75.40,47.60
step
talk Muigin##9119
turnin Muigin and Larion##4141 |goto Un'Goro Crater/0 42.94,9.64
step
talk Gryfe##10583
fpath Marshal's Refuge |goto Un'Goro Crater 45.23,5.84
step
talk Marin Noggenfogger##7564
turnin The Thirsty Goblin##2605 |goto Tanaris 51.81,28.66
accept In Good Taste##2606 |goto Tanaris 51.81,28.66
step
talk Gimblethorn##7799
|tip Deposit into the bank.
|tip Inside the building.
bank Torwa's Pouch##11568		|goto Tanaris 52.30,28.91 |q 4292
bank Un'Goro Soil##11018		|goto Tanaris 52.30,28.91 |multiq 3764,4496 |future
bank Linken's Training Sword##11133	|goto Tanaris 52.30,28.91 |q 3908
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
talk Senior Surveyor Fizzledowser##7724
accept Rise of the Silithid##162 |goto Tanaris 50.21,27.48
step
talk Marvon Rivetseeker##7771
turnin Gahz'ridian##3161 |goto Tanaris 52.71,45.93
accept The Stone Circle##3444 |goto Tanaris 52.71,45.93
step
talk Loganaar##12042
Train Abilities |trainer Loganaar##12042 |goto Moonglade/0 52.53,40.57 |q 2880 |future
|only if Druid
step
talk Gimblethorn##7799
|tip Deposit into the bank.
|tip Inside the building.
bank Insect Analysis Report##8594 |goto Tanaris 52.30,28.91 |q 162
step
talk Dink##7312
|tip Inside the building.
Train Abilities |trainer Dink##7312 |goto Ironforge/0 27.16,8.56 |q 2880 |future
|only if Mage
stickystart "Accept_A_Call_To_Arms_The_Plaguelands"
step
talk Laris Geardawdle##9616
|tip Inside the building.
accept A Little Slime Goes a Long Way##4512 |goto Ironforge 75.77,23.37
step
talk Bilban Tosslespanner##5114
|tip Inside the building.
Train Abilities |trainer Bilban Tosslespanner##5114 |goto Ironforge/0 65.90,88.41 |q 2880 |future
|only if Warrior
step
talk Regnus Thundergranite##5117
|tip Inside the building.
Train Abilities |trainer Regnus Thundergranite##5117 |goto Ironforge/0 69.87,82.90 |q 2880 |future
|only if Hunter
step
talk Belia Thundergranite##10090
|tip Inside the building.
Train Pet Abilities |trainer Belia Thundergranite##10090 |goto Ironforge/0 70.86,85.84 |q 2880 |future
|only if Hunter
step
talk Fenthwick##5167
|tip Inside the building.
Train Abilities |trainer Fenthwick##5167 |goto Ironforge/0 65.90,88.41 |q 2880 |future
|only if Rogue
step
talk Briarthorn##5172
|tip Inside the building.
Train Abilities |trainer Briarthorn##5172 |goto Ironforge/0 50.35,5.66 |q 2880 |future
|only if Warlock
step
talk Jubahl Corpseseeker##6382
|tip Buy available Grimoires.
|tip Inside the building.
Train Demon Abilities |vendor Jubahl Corpseseeker##6382 |goto Ironforge/0 50.35,5.66 |q 2880 |future
|only if Warlock
step
talk Beldruk Doombrow##5148
|tip Inside the building.
Train Abilities |trainer Beldruk Doombrow##5148 |goto Ironforge/0 24.54,4.50 |q 2880 |future
|only if Paladin
step
talk Toldren Deepiron##5143
|tip Inside the building.
Train Abilities |trainer Toldren Deepiron##5143 |goto Ironforge/0 25.21,10.74 |q 2880 |future
|only if Priest
step
talk Innkeeper Firebrew##5111
|tip Inside the building.
accept Assisting Arch Druid Staghelm##3790 |goto Ironforge 18.15,51.46
step
label "Accept_A_Call_To_Arms_The_Plaguelands"
map Ironforge
path	follow smart;	loop on;	ants curved;	dist 30;	markers none;		arrow hide
path	57.32,78.92		50.14,81.06		39.59,79.17		34.35,74.44
path	24.69,55.32		24.38,38.36		27.70,25.23		32.24,22.90
path	34.74,33.94		40.38,37.68		48.22,31.09		55.91,35.09
path	57.34,48.56		48.22,57.86		46.33,47.76		39.94,44.41
path	38.43,38.33		34.49,32.86		33.42,21.18		39.45,12.40
path	44.31,10.79		53.02,10.57		58.98,13.76		70.47,33.88
path	71.16,44.77		70.12,55.01		67.38,65.14
talk Courier Hammerfall##10877
|tip Walks a large path.
accept A Call to Arms: The Plaguelands!##5090
step
talk Ultham Ironhorn##4772
Train Ram Riding |learnspell Ram Riding##826 |goto Dun Morogh/0 63.94,50.10
Buy a mount from Veron Amberstill nearby at [Dun Morogh/0 63.47,50.56]
|only if Dwarf and discountgold('Ironforge',500000)
step
talk Binjy Featherwhistle##7954
Train Mechanostrider Piloting |learnspell Mechanostrider Piloting##553 |goto Dun Morogh/0 49.15,48.13
Buy a mount from Milli Featherwhistle nearby at [Dun Morogh/0 49.13,47.95]
|only if Gnome and discountgold('Gnomeregan Exiles',500000)
step
talk Randal Hunter##4732
Train Horse Riding |learnspell Horse Riding##824 |goto Elwynn Forest/0 84.32,64.87
Buy a mount from Katie Hunter nearby at [Elwynn Forest/0 84.15,65.49]
|only if Human and discountgold('Stormwind',500000)
step
talk Gryphon Master Talonaxe##5636
|tip Inside the building.
|tip Top of the path.
accept Witherbark Cages##2988 |goto The Hinterlands/0 9.76,44.48
stickystart "Collect_Troll_Tribal_Necklaces"
stickystart "Collect_Wildkin_Feathers"
step
click Third Witherbark Cage
Check the Third Cage |q 2988/3 |goto The Hinterlands 31.99,57.38
step
click First Witherbark Cage
Check the First Cage |q 2988/1 |goto The Hinterlands 23.28,58.75
step
click Second Witherbark Cage
Check the Second Cage |q 2988/2 |goto The Hinterlands 23.13,58.76
step
label "Collect_Troll_Tribal_Necklaces"
kill Witherbark Hideskinner##2651, Witherbark Scalper##2649, Witherbark Venomblood##2652, Witherbark Zealot##2650
|tip Trolls.
collect 5 Troll Tribal Necklace##9259 |goto The Hinterlands 25.20,57.80 |q 2880 |future
|tip Don't vendor them.
|mapmarker The Hinterlands/0 21.40,55.20
|mapmarker The Hinterlands/0 21.40,57.40
|mapmarker The Hinterlands/0 23.20,58.40
|mapmarker The Hinterlands/0 23.40,56.40
|mapmarker The Hinterlands/0 32.60,57.00
|mapmarker The Hinterlands/0 25.20,60.00
|mapmarker The Hinterlands/0 27.40,57.00
|mapmarker The Hinterlands/0 29.40,57.60
|mapmarker The Hinterlands/0 29.40,60.20
|mapmarker The Hinterlands/0 31.20,58.60
|mapmarker The Hinterlands/0 31.40,55.40
|mapmarker The Hinterlands/0 31.60,60.60
step
talk Fraggar Thundermantle##7884
|tip Inside the building.
accept Troll Necklace Bounty##2880 |goto The Hinterlands 14.83,44.56
stickystop "Collect_Wildkin_Feathers"
step
talk Fraggar Thundermantle##7884
|tip Inside the building.
turnin Troll Necklace Bounty##2880 |goto The Hinterlands 14.83,44.56
accept Skulk Rock Clean-up##2877 |goto The Hinterlands 14.83,44.56
step
talk Innkeeper Thulfram##7744
|tip Walks around.
|tip Upstairs inside the building.
home Wildhammer Keep |goto The Hinterlands/0 13.14,41.91 |q 5092 |future
|mapmarker The Hinterlands/0 14.18,41.56
step
talk Gryphon Master Talonaxe##5636
|tip Inside the building.
|tip Top of the path.
turnin Witherbark Cages##2988 |goto The Hinterlands 9.76,44.48
accept The Altar of Zul##2989 |goto The Hinterlands 9.76,44.48
step
label "Collect_Wildkin_Feathers"
click Wildkin Feather##153239+
|tip Large brown and white feathers.
|tip Reduce the {o}Ground Clutter{} setting to {o}1{}.
|tip In {o}System > Graphics{} game settings.
|tip Makes them easier to see.
collect 15 Wildkin Feather##10819 |q 3661/1 |goto The Hinterlands/0 22.90,54.90
|mapmarker The Hinterlands/0 15.50,49.10
|mapmarker The Hinterlands/0 15.70,52.40
|mapmarker The Hinterlands/0 15.80,54.70
|mapmarker The Hinterlands/0 18.30,49.70
|mapmarker The Hinterlands/0 19.50,47.20
|mapmarker The Hinterlands/0 20.60,57.40
|mapmarker The Hinterlands/0 21.30,53.30
|mapmarker The Hinterlands/0 22.20,51.00
|mapmarker The Hinterlands/0 40.60,51.00
|mapmarker The Hinterlands/0 23.70,49.60
|mapmarker The Hinterlands/0 24.70,54.00
|mapmarker The Hinterlands/0 24.70,58.60
|mapmarker The Hinterlands/0 25.20,62.00
|mapmarker The Hinterlands/0 25.80,56.90
|mapmarker The Hinterlands/0 26.40,64.70
|mapmarker The Hinterlands/0 27.70,54.20
|mapmarker The Hinterlands/0 28.10,58.10
|mapmarker The Hinterlands/0 28.20,68.40
|mapmarker The Hinterlands/0 28.40,60.40
|mapmarker The Hinterlands/0 28.40,64.40
|mapmarker The Hinterlands/0 29.60,62.00
|mapmarker The Hinterlands/0 31.00,54.40
|mapmarker The Hinterlands/0 31.70,63.90
|mapmarker The Hinterlands/0 33.00,60.40
|mapmarker The Hinterlands/0 33.20,47.50
|mapmarker The Hinterlands/0 33.30,43.00
|mapmarker The Hinterlands/0 33.40,51.70
|mapmarker The Hinterlands/0 33.60,54.40
|mapmarker The Hinterlands/0 34.10,58.00
|mapmarker The Hinterlands/0 35.40,43.00
|mapmarker The Hinterlands/0 36.20,52.70
|mapmarker The Hinterlands/0 37.30,50.40
|mapmarker The Hinterlands/0 37.40,46.00
|mapmarker The Hinterlands/0 38.20,54.00
|mapmarker The Hinterlands/0 38.40,44.20
|mapmarker The Hinterlands/0 42.10,44.00
|mapmarker The Hinterlands/0 42.40,54.40
|mapmarker The Hinterlands/0 42.50,58.40
|mapmarker The Hinterlands/0 44.20,44.40
|mapmarker The Hinterlands/0 45.80,59.90
|mapmarker The Hinterlands/0 46.80,50.00
|mapmarker The Hinterlands/0 47.10,44.30
|mapmarker The Hinterlands/0 48.60,63.40
|mapmarker The Hinterlands/0 48.70,41.30
|mapmarker The Hinterlands/0 50.40,59.40
|mapmarker The Hinterlands/0 51.20,62.70
|mapmarker The Hinterlands/0 51.40,39.40
|mapmarker The Hinterlands/0 52.00,58.00
|mapmarker The Hinterlands/0 55.60,42.30
step
click Violet Tragan+
|tip Brown mushrooms.
|tip Underwater.
collect Violet Tragan##8526 |q 2641/1 |goto The Hinterlands 41.01,59.77 |usebank
step
_NOTE:_
During Next Step
|tip {o}Elite enemies{} at top of temple.
|tip Run in to complete the goal, then {o}run away{}.
|tip Jump down on the {o}lower ledges of the temple{}.
|tip Enemies can't hit you there.
|tip {o}Wait on the ledge{} until out of combat.
|tip Make sure you have a potion to use.
|tip Skip quest if you're not comfortable. |only if hardcore()
Click Here to Continue |confirm |q 2989
step
Search the Altar of Zul |q 2989/1 |goto The Hinterlands 48.85,68.45
|tip Top of the temple.
|tip Careful, {o}elite enemies{}.
|tip {o}Jump down on a ledge{} after.
|tip Skip quest if you're not comfortable. |only if hardcore()
step
_NOTE:_
Jump On This Ledge
|tip Enemies can't hit you here.
|tip Wait until out of combat.
Click Here to Continue |confirm |goto The Hinterlands/0 49.12,66.54 |q 2989
step
kill 10 Green Sludge##2655 |q 2877/1 |goto The Hinterlands 48.60,42.60
kill 10 Jade Ooze##2656 |q 2877/2 |goto The Hinterlands 48.60,42.60
|tip Shared spawns.
|mapmarker The Hinterlands/0 43.40,43.80
|mapmarker The Hinterlands/0 44.80,42.00
|mapmarker The Hinterlands/0 45.40,44.20
|mapmarker The Hinterlands/0 45.80,39.40
|mapmarker The Hinterlands/0 47.00,41.40
|mapmarker The Hinterlands/0 55.40,44.40
|mapmarker The Hinterlands/0 56.20,39.00
|mapmarker The Hinterlands/0 56.40,42.40
|mapmarker The Hinterlands/0 58.00,44.00
|mapmarker The Hinterlands/0 58.20,41.00
|mapmarker The Hinterlands/0 60.00,42.60
step
use OOX-09/HL Distress Beacon##8704
accept Find OOX-09/HL!##485
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
|only if itemcount(8704) > 0
step
talk Homing Robot OOX-09/HL##7806
turnin Find OOX-09/HL!##485 |goto The Hinterlands 49.35,37.66
|only if haveq(485) or completedq(485)
stickystart "Collect_Pupellyverbos_Ports"
step
Follow the road and follow the path down |goto The Hinterlands 71.50,65.09 < 30 |only if walking and not subzone("The Overlook Cliffs")
use the Super Snapper FX##9328
|tip On Gammerita.
|tip {o}Elite{} blue turtle.
|tip Walks around.
|tip Use item {o}at max distance{}.
|tip {o}Run away{} when attacked.
collect Snapshot of Gammerita##9330 |q 2944/1 |goto The Hinterlands/0 81.40,47.20 |usebank
|mapmarker The Hinterlands/0 74.20,67.40
|mapmarker The Hinterlands/0 75.20,71.00
|mapmarker The Hinterlands/0 75.40,62.20
|mapmarker The Hinterlands/0 75.40,74.20
|mapmarker The Hinterlands/0 76.80,65.00
|mapmarker The Hinterlands/0 77.20,59.40
|mapmarker The Hinterlands/0 77.40,68.40
|mapmarker The Hinterlands/0 78.60,62.40
|mapmarker The Hinterlands/0 79.40,56.20
|mapmarker The Hinterlands/0 80.20,59.80
|mapmarker The Hinterlands/0 81.40,51.20
|mapmarker The Hinterlands/0 81.60,55.80
step
label "Collect_Pupellyverbos_Ports"
click Pupellyverbos Port+
|tip Small blue bottles.
|tip Avoid Revantusk Village.
|tip Avoid Gammerita. |notinsticky
|tip {o}Elite{} blue turtle. |notinsticky
|tip Walks around. |notinsticky
|tip Reduce the {o}Ground Clutter{} setting to {o}1{}.
|tip In {o}System > Graphics{} game settings.
|tip Makes them easier to see.
collect 12 Pupellyverbos Port##3900 |q 580/1 |goto The Hinterlands 77.80,65.40
|mapmarker The Hinterlands/0 75.40,70.20
|mapmarker The Hinterlands/0 75.70,64.40
|mapmarker The Hinterlands/0 76.20,73.10
|mapmarker The Hinterlands/0 77.40,70.30
|mapmarker The Hinterlands/0 77.70,62.40
|mapmarker The Hinterlands/0 78.00,58.30
|mapmarker The Hinterlands/0 79.30,60.50
|mapmarker The Hinterlands/0 80.00,57.30
|mapmarker The Hinterlands/0 81.00,55.30
|mapmarker The Hinterlands/0 81.40,50.40
step
Kill enemies
|tip Avoid Gammerita.
|tip {o}Elite{} blue turtle.
|tip Walks around.
Grind Until Hearthstone Ready |complete C_Container.GetItemCooldown(6948) == 0 |goto The Hinterlands/0 78.20,68.20 |q 580
|tip Need to hearth back to Aerie Peak.
|tip Skip and run back to Aerie Peak, if you prefer.
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
talk Fraggar Thundermantle##7884
|tip Inside the building.
turnin Skulk Rock Clean-up##2877 |goto The Hinterlands 14.83,44.56
step
talk Gryphon Master Talonaxe##5636
|tip Inside the building.
|tip Top of the path.
turnin The Altar of Zul##2989 |goto The Hinterlands 9.76,44.48
|only if haveq(2989) or completedq(2989)
]])
GoatQuest:RegisterGuide("Leveling Guides\\Western Plaguelands & Stranglethorn Vale (50-51)",{
image=GQ.IMAGESDIR.."Stranglethorn Vale",
next="Leveling Guides\\Felwood (51-53)",
},[[
step
talk Commander Ashlam Valorfist##10838
turninany A Call to Arms: The Plaguelands!##5066,5090,5091 |goto Western Plaguelands 42.70,84.03
accept Clear the Way##5092 |goto Western Plaguelands 42.70,84.03
step
talk Argent Officer Pureheart##10840
accept Argent Dawn Commission##5401 |goto Western Plaguelands 42.97,83.55 |instant
step
equip Argent Dawn Commission##12846 |n
|tip Allows {o}Minion's Scourgestones{} to drop.
|tip From undead enemies in Western and Eastern Plaguelands.
Gain the Argent Dawn Commission Buff |havebuff Argent Dawn Commission##17670 |q 5408 |future
step
kill 10 Skeletal Flayer##1783 |q 5092/1 |goto Western Plaguelands 50.80,79.40
kill 10 Slavering Ghoul##1791 |q 5092/2 |goto Western Plaguelands 50.80,79.40
|mapmarker Western Plaguelands/0 49.40,76.20
|mapmarker Western Plaguelands/0 49.40,82.80
|mapmarker Western Plaguelands/0 46.40,80.40
|mapmarker Western Plaguelands/0 54.20,80.40
step
talk Commander Ashlam Valorfist##10838
turnin Clear the Way##5092 |goto Western Plaguelands 42.70,84.03
step
talk Jartsam##4753
Train Tiger Riding |learnspell Tiger Riding##828 |goto Darnassus/0 38.69,15.84
Buy a mount from Lelanai nearby at [Darnassus/0 38.28,15.36]
|only if NightElf and discountgold('Darnassus',500000)
step
talk Innkeeper Firebrew##5111
|tip Inside the building.
home Ironforge |goto Ironforge 18.15,51.46 |q 5215 |future
step
talk Ultham Ironhorn##4772
Train Ram Riding |learnspell Ram Riding##826 |goto Dun Morogh/0 63.94,50.10
Buy a mount from Veron Amberstill nearby at [Dun Morogh/0 63.47,50.56]
|only if Dwarf and discountgold('Ironforge',500000)
step
talk Binjy Featherwhistle##7954
Train Mechanostrider Piloting |learnspell Mechanostrider Piloting##553 |goto Dun Morogh/0 49.15,48.13
Buy a mount from Milli Featherwhistle nearby at [Dun Morogh/0 49.13,47.95]
|only if Gnome and discountgold('Gnomeregan Exiles',500000)
step
talk Olivia Burnside##2455
|tip Collect from the bank.
|tip Inside the building.
collect Stoley's Bottle##9245 |goto Stormwind City 57.55,72.43 |q 2874
step
talk Olivia Burnside##2455
|tip Deposit into the bank.
|tip Inside the building.
bank Super Snapper FX##9328		|goto Stormwind City 57.55,72.43 |q 2944
bank Snapshot of Gammerita##9330	|goto Stormwind City 57.55,72.43 |q 2944
bank Violet Tragan##8526		|goto Stormwind City 57.55,72.43 |q 2641
step
talk Randal Hunter##4732
Train Horse Riding |learnspell Horse Riding##824 |goto Elwynn Forest/0 84.32,64.87
Buy a mount from Katie Hunter nearby at [Elwynn Forest/0 84.15,65.49]
|only if Human and discountgold('Stormwind',500000)
step
talk Whiskey Slim##2491
|tip {o}Ground floor{} inside the building.
turnin Whiskey Slim's Lost Grog##580 |goto Stranglethorn Vale 27.13,77.45
step
talk Fleet Master Seahorn##2487
|tip Up on the balcony of the building.
accept The Bloodsail Buccaneers##608 |goto Stranglethorn Vale 27.17,77.01
step
talk "Sea Wolf" MacKinley##2501
|tip Inside the building.
turnin Deliver to MacKinley##2874 |goto Stranglethorn Vale 27.78,77.07
step
Run through the tunnel to leave Booty Bay |goto Stranglethorn Vale 28.00,73.46 < 15 |only if walking and (subzone("Booty Bay") or subzone("The Old Port Authority") or subzone("The Salty Sailor Tavern"))
click Half-Buried Bottle+
|tip Tiny green bottles.
|tip Next to the water along the beach.
collect Carefully Folded Note##4098 |n
use Carefully Folded Note##4098
accept Message in a Bottle##594 |goto Stranglethorn Vale 35.07,72.90
|mapmarker Stranglethorn Vale/0 33.90,75.98
step
_NOTE:_
During the Next Steps
|tip The ships in the next steps can be {o}very dangerous{}.
|tip Be {o}extremely careful{} in them.
|tip Skip the quests if you don't feel safe.
Click Here to Continue |confirm |multiq 608,624 |future
|only if hardcore()
step
kill Captain Keelhaul##2548 |q 608/2 |goto Stranglethorn Vale 29.20,88.34
|tip {o}Middle floor{} inside the ship.
step
kill Fleet Master Firallon##2546 |q 608/3 |goto Stranglethorn Vale 30.58,90.64
|tip {o}Middle floor{} inside the ship.
step
kill Captain Stillwater##2550 |q 608/1 |goto Stranglethorn Vale 32.87,88.20
|tip {o}Middle floor{} inside the ship.
step
talk Princess Poobah##2634
|tip Wait if she's missing.
|tip Careful, stealthed enemies.
turnin Message in a Bottle##594 |goto Stranglethorn Vale 38.53,80.58
step
kill Tethis##730
|tip {o}Level 43 elite{} blue raptor.
|tip Walks around.
|tip Multiple locations.
collect Talon of Tethis##3877 |q 197/1 |goto Stranglethorn Vale 28.80,45.80
|mapmarker Stranglethorn Vale/0 27.00,44.00
|mapmarker Stranglethorn Vale/0 28.20,42.40
|mapmarker Stranglethorn Vale/0 30.40,40.60
|mapmarker Stranglethorn Vale/0 31.40,43.40
step
talk Hemet Nesingwary##715
turnin Raptor Mastery##197 |goto Stranglethorn Vale 35.66,10.81
accept Big Game Hunter##208 |goto Stranglethorn Vale 35.66,10.81
step
kill King Bangalash##731
|tip {o}Level 43 elite{} white tiger.
|tip Summons 2 non-elite {o}lower level{} helpers.
|tip Around {o}50% health{}.
|tip Walks around.
|tip Top of the hill.
|tip May need help.
collect Head of Bangalash##3880 |q 208/1 |goto Stranglethorn Vale/0 38.35,35.55
|mapmarker Stranglethorn Vale/0 38.20,34.40
|mapmarker Stranglethorn Vale/0 38.20,36.60
step
talk Hemet Nesingwary##715
turnin Big Game Hunter##208 |goto Stranglethorn Vale 35.66,10.81
step
talk Fleet Master Seahorn##2487
|tip Up on the balcony of the building.
turnin The Bloodsail Buccaneers##608 |goto Stranglethorn Vale 27.17,77.01
step
talk Viznik Goldgrubber##2625
|tip Collect from the bank.
collect Super Snapper FX##9328		|goto Stranglethorn Vale 26.54,76.57 |q 2944
collect Snapshot of Gammerita##9330	|goto Stranglethorn Vale 26.54,76.57 |q 2944
]])
GoatQuest:RegisterGuide("Leveling Guides\\Felwood (51-53)",{
image=GQ.IMAGESDIR.."Felwood",
next="Leveling Guides\\Un'Goro Crater (53-55)",
},[[
step
talk Bryllia Ironbrand##5101
|tip Downstairs inside the building.
Buy Extra Ammo |vendor Bryllia Ironbrand##5101 |goto Ironforge/0 39.23,74.47 |q 3661
|tip Long questing session soon.
|tip No ammo vendor.
|only if Hunter
step
talk Erelas Ambersky##7916
|tip Inside the building.
turnin Favored of Elune?##3661 |goto Teldrassil 55.50,92.05
step
talk Daryn Lightwind##7907
|tip Upstairs inside the building.
turnin The Super Snapper FX##2944 |goto Teldrassil 55.41,92.23
step
talk Garryeth##4209
|tip Collect from the bank.
|tip Inside the building.
collect Insect Analysis Report##8594	|goto Darnassus 39.60,41.98 |q 162
collect 20 Un'Goro Soil##11018		|goto Darnassus 39.60,41.98 |q 3764 |future
step
talk Arch Druid Fandral Staghelm##3516
|tip Walks around.
|tip {o}Top floor{} inside the building.
turninany Assisting Arch Druid Staghelm##3763,3789,3790 |goto Darnassus/0 34.82,9.25
accept Un'Goro Soil##3764 |goto Darnassus/0 34.82,9.25
step
talk Jenal##9047
|tip Outside the building.
turnin Un'Goro Soil##3764 |goto Darnassus 31.49,8.23
step
talk Jartsam##4753
Train Tiger Riding |learnspell Tiger Riding##828 |goto Darnassus/0 38.69,15.84
Buy a mount from Lelanai nearby at [Darnassus/0 38.28,15.36]
|only if NightElf and discountgold('Darnassus',500000)
step
talk Gracina Spiritmight##7740
|tip Upstairs inside the building.
turnin Rise of the Silithid##162 |goto Darnassus 41.84,85.62
accept March of the Silithid##4493 |goto Darnassus 41.84,85.62
step
talk Daelyshia##4267
|tip Follow the road.
fpath Astranaar |goto Ashenvale 34.41,47.99
step
talk Arathandris Silversky##9528
|tip Walks around.
accept Cleansing Felwood##4101 |goto Felwood 54.15,86.83
step
talk Greta Mosshoof##10922
|tip Walks around.
accept Forces of Jaedenar##5155 |goto Felwood 51.21,82.11
step
talk Eridan Bluewind##9116
|tip Inside the building.
accept The Corruption of the Jadefire##4421 |goto Felwood 51.35,81.51
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
use Package of Empty Ooze Containers##11912
collect 6 Empty Cursed Ooze Jar##11914 |q 4512
collect 6 Empty Tainted Ooze Jar##11948 |q 4512
|only if itemcount(11912) > 0
step
Learn the {y}Claw (Rank 7){} Pet Ability |learnspell Claw##2977 |goto Felwood/0 39.20,30.80 |q 4101
|tip Cast {o}Tame Beast{} on an {o}Angerclaw Mauler{}.
|tip Diseased brown bears.
|tip Kill enemies nearby.
|tip Abandon your pet first.
|tip New temporary permanent pet.
|mapmarker Felwood/0 47.40,15.40
|mapmarker Felwood/0 41.40,24.40
|mapmarker Felwood/0 44.80,23.80
|mapmarker Felwood/0 45.40,18.40
|only if Hunter
step
_NOTE:_
Attack an Angermaw Grizzly
|tip Find one that's {o}level 51{}. |only if level < 52
|tip Find one that's {o}level 52{}. |only if level >= 52
|tip Make your pet attack an Angermaw Grizzly.
|tip Angermaw Grizzly does a {o}stun attack{}.
|tip Wait for your pet to get {o}stunned{}, then {o}abandon it{}.
Tame the Angermaw Grizzly
|tip Cast {o}Tame Beast{} on the Angermaw Grizzly.
|tip It shouldn't stun you.
|tip New permanent pet.
Click Here to Continue |confirm |goto Felwood/0 52.00,16.00 |q 5155
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
kill Cursed Ooze##7086+
use Empty Cursed Ooze Jar##11914+
|tip On their corpses.
collect 6 Filled Cursed Ooze Jar##11947 |q 4512/1 |goto Felwood 41.60,71.60
|mapmarker Felwood/0 39.80,72.60
|mapmarker Felwood/0 40.80,66.00
|mapmarker Felwood/0 42.60,67.80
stickystart "Kill_Jadefire_Enemies"
step
Follow the path |goto Felwood 36.85,66.92 < 30 |only if walking
kill Xavathras##9454 |q 4421/4 |goto Felwood 32.24,67.10
step
label "Kill_Jadefire_Enemies"
kill 9 Jadefire Shadowstalker##7110 |q 4421/2 |goto Felwood 34.40,66.40
|tip Stealthed.
kill 9 Jadefire Rogue##7106 |q 4421/3 |goto Felwood 34.40,66.40
kill 11 Jadefire Felsworn##7109 |q 4421/1 |goto Felwood 34.40,66.40
|mapmarker Felwood/0 32.20,67.00
|mapmarker Felwood/0 36.40,66.80
|mapmarker Felwood/0 37.20,69.60
step
kill Tainted Ooze##7092+
use Empty Tainted Ooze Jar##11948+
|tip On their corpses.
collect 6 Filled Tainted Ooze Jar##11949 |q 4512/2 |goto Felwood 40.80,59.00
|mapmarker Felwood/0 38.60,49.40
|mapmarker Felwood/0 39.60,54.00
|mapmarker Felwood/0 40.00,56.40
|mapmarker Felwood/0 41.40,50.00
|mapmarker Felwood/0 41.60,45.00
|mapmarker Felwood/0 43.80,48.60
|mapmarker Felwood/0 44.00,46.40
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
talk Greta Mosshoof##10922
|tip Walks around.
turnin Forces of Jaedenar##5155 |goto Felwood 51.21,82.11
accept Collection of the Corrupt Water##5157 |goto Felwood 51.21,82.11
step
talk Eridan Bluewind##9116
|tip Inside the building.
turnin The Corruption of the Jadefire##4421 |goto Felwood 51.35,81.51
accept Further Corruption##4906 |goto Felwood 51.35,81.51
step
talk Taronn Redfeather##10921
|tip Inside the building.
accept Verifying the Corruption##5156 |goto Felwood 50.89,81.62
step
Follow the path into Jaedenar |goto Felwood 38.37,59.85 < 40 |walk
use Empty Canteen##12922
collect Corrupt Moonwell Water##12907 |q 5157/1 |goto Felwood 35.20,59.87
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
stickystart "Kill_Jadefire_Enemies_4906"
step
Follow the path up into Jadefire Run |goto Felwood 43.07,21.32 < 30 |only if walking and not subzone("Jadefire Run")
kill Xavaric##10648 |q 4906/4 |goto Felwood 39.07,22.35
|tip Walks around.
collect Flute of Xavaric##11668 |goto Felwood 39.07,22.35 |q 939 |future
step
use Flute of Xavaric##11668
accept Flute of Xavaric##939
step
kill Jadefire Hellcaller##7111, Jadefire Betrayer##7108, Jadefire Trickster##7107
collect 5 Jadefire Felbind##11674 |q 939/1 |goto Felwood 40.40,20.00
|mapmarker Felwood/0 42.20,18.60
|mapmarker Felwood/0 42.40,14.40
|mapmarker Felwood/0 44.40,13.40
|mapmarker Felwood/0 46.20,14.60
step
label "Kill_Jadefire_Enemies_4906"
kill 8 Jadefire Hellcaller##7111 |q 4906/1 |goto Felwood 40.40,20.00
kill 8 Jadefire Betrayer##7108 |q 4906/2 |goto Felwood 40.40,20.00
kill 8 Jadefire Trickster##7107 |q 4906/3 |goto Felwood 40.40,20.00
|mapmarker Felwood/0 42.20,18.60
|mapmarker Felwood/0 42.40,14.40
|mapmarker Felwood/0 44.40,13.40
|mapmarker Felwood/0 46.20,14.60
step
kill Warpwood Moss Flayer##7100, Warpwood Shredder##7101
|tip Swamp elementals.
|tip Inside and outside the cave.
collect 15 Blood Amber##11503 |q 4101/1 |goto Felwood 55.78,16.85
|mapmarker Felwood/0 54.40,16.20
|mapmarker Felwood/0 58.00,17.60
|mapmarker Felwood/0 57.00,21.00
|mapmarker Felwood/0 59.20,20.40
|mapmarker Felwood/0 54.91,19.04
step
Leave the cave |goto Felwood 55.88,17.15 < 40 |walk |only if subzone("Irontree Cavern")
talk Mishellena##12578
|tip Follow the road.
fpath Talonbranch Glade |goto Felwood 62.49,24.24
step
talk Kaerbrus##5501
Train Abilities |trainer Kaerbrus##5501 |goto Felwood/0 61.89,23.58 |q 8462
|only if Hunter
step
talk Golhine the Hooded##9465
Train Abilities |trainer Golhine the Hooded##9465 |goto Felwood/0 61.93,24.54 |q 8462
|only if Druid
step
talk Erelas Ambersky##7916
|tip Inside the building.
accept Moontouched Wildkin##978 |goto Teldrassil 55.50,92.05
step
Enter the tree cave |goto Darnassus/0 32.14,16.46 < 7 |walk
talk Syurna##4163
|tip Downstairs inside the tree cave.
Train Abilities |trainer Syurna##4163 |goto Darnassus/0 37.00,21.92 |q 8462
|only if Rogue
step
talk Sildanair##4089
Train Abilities |trainer Sildanair##4089 |goto Darnassus/0 61.78,42.21 |q 8462
|only if Warrior
step
talk Jartsam##4753
Train Tiger Riding |learnspell Tiger Riding##828 |goto Darnassus/0 38.69,15.84
Buy a mount from Lelanai nearby at [Darnassus/0 38.28,15.36]
|only if NightElf and discountgold('Darnassus',500000)
step
talk Jandria##4091
|tip Inside the building.
Train Abilities |trainer Jandria##4091 |goto Darnassus/0 37.90,82.73 |q 8462
|only if Priest
step
talk Garryeth##4209
|tip Collect from the bank.
|tip Inside the building.
collect Linken's Training Sword##11133	|goto Darnassus 39.60,41.98 |q 3908
step
talk Nafien##15395
|tip Follow the road.
turnin Speak to Nafien##8462 |goto Felwood 64.77,8.13
step
talk Donova Snowden##9298
turnin It's a Secret to Everybody##3908 |goto Winterspring 31.27,45.16
step
click Moontouched Feather+
|tip Large blue feathers.
|tip Make your way {o}east{}.
collect 10 Moontouched Feather##12383 |q 978/1 |goto Winterspring/0 29.40,46.70 |usebank
|mapmarker Winterspring/0 30.20,45.20
|mapmarker Winterspring/0 30.30,44.00
|mapmarker Winterspring/0 30.90,47.00
|mapmarker Winterspring/0 31.30,45.50
|mapmarker Winterspring/0 31.50,43.30
|mapmarker Winterspring/0 32.00,44.20
|mapmarker Winterspring/0 32.80,44.30
|mapmarker Winterspring/0 34.80,45.90
|mapmarker Winterspring/0 34.90,43.20
|mapmarker Winterspring/0 35.60,43.80
|mapmarker Winterspring/0 36.40,45.70
|mapmarker Winterspring/0 37.20,45.70
|mapmarker Winterspring/0 37.40,44.20
|mapmarker Winterspring/0 37.50,42.80
|mapmarker Winterspring/0 37.80,45.70
|mapmarker Winterspring/0 38.30,43.80
|mapmarker Winterspring/0 38.60,45.10
|mapmarker Winterspring/0 39.50,39.00
|mapmarker Winterspring/0 40.40,37.50
|mapmarker Winterspring/0 40.50,37.50
|mapmarker Winterspring/0 43.10,42.00
|mapmarker Winterspring/0 43.10,44.10
|mapmarker Winterspring/0 43.60,42.60
|mapmarker Winterspring/0 43.70,44.90
|mapmarker Winterspring/0 44.30,42.20
|mapmarker Winterspring/0 44.90,44.70
|mapmarker Winterspring/0 45.20,44.20
|mapmarker Winterspring/0 45.60,44.00
|mapmarker Winterspring/0 45.70,42.60
|mapmarker Winterspring/0 45.90,41.60
|mapmarker Winterspring/0 46.60,44.20
|mapmarker Winterspring/0 47.90,45.10
|mapmarker Winterspring/0 49.50,40.80
|mapmarker Winterspring/0 50.50,38.00
step
talk Maethrya##11138
|tip Outside the walls.
fpath Everlook |goto Winterspring 62.33,36.61
step
talk Taronn Redfeather##10921
|tip Inside the building.
turnin Verifying the Corruption##5156 |goto Felwood 50.89,81.62
step
talk Eridan Bluewind##9116
|tip Inside the building.
turnin Flute of Xavaric##939 |goto Felwood 51.35,81.51
accept Felbound Ancients##4441 |goto Felwood 51.35,81.51
turnin Further Corruption##4906 |goto Felwood 51.35,81.51
step
talk Greta Mosshoof##10922
|tip Walks around.
turnin Collection of the Corrupt Water##5157 |goto Felwood 51.21,82.11
accept Seeking Spiritual Aid##5158 |goto Felwood 51.21,82.11
step
talk Arathandris Silversky##9528
|tip Walks around.
turnin Cleansing Felwood##4101 |goto Felwood 54.15,86.83
step
talk Arathandris Silversky##9528
|tip Walks around.
Select _"I need a Cenarion beacon."_ |gossip 96158
collect Cenarion Beacon##11511 |goto Felwood 54.15,86.83 |q 5882 |future |usebank
step
talk Dink##7312
|tip Inside the building.
Train Abilities |trainer Dink##7312 |goto Ironforge/0 27.16,8.56 |q 4512
|only if Mage
step
talk Briarthorn##5172
|tip Inside the building.
Train Abilities |trainer Briarthorn##5172 |goto Ironforge/0 50.35,5.66 |q 4512
|only if Warlock
step
talk Jubahl Corpseseeker##6382
|tip Buy available Grimoires.
|tip Inside the building.
Train Demon Abilities |vendor Jubahl Corpseseeker##6382 |goto Ironforge/0 50.35,5.66 |q 4512
|only if Warlock
step
talk Laris Geardawdle##9616
|tip Inside the building.
turnin A Little Slime Goes a Long Way##4512 |goto Ironforge 75.77,23.37
]])
GoatQuest:RegisterGuide("Leveling Guides\\Un'Goro Crater (53-55)",{
image=GQ.IMAGESDIR.."Un'Goro Crater",
next="Leveling Guides\\Winterspring & Felwood (55-57)",
},[[
step
talk Auctioneer Redmuse##8720
|tip Buy from the Auction House, if possible.
|tip Inside the building.
collect Mithril Casing##10561 |goto Ironforge 24.16,74.67 |q 4244 |future
|tip Needed for quest in Un'Goro Crater.
step
talk Bailey Stonemantle##2461
|tip Collect from the bank.
|tip Inside the building.
collect Violet Tragan##8526		|goto Ironforge 35.92,60.14 |q 2641
collect Torwa's Pouch##11568		|goto Ironforge 35.92,60.14 |q 4292
step
talk Bailey Stonemantle##2461
|tip Deposit into the bank.
|tip Inside the building.
bank Eridan's Vial##11682		|goto Ironforge 35.92,60.14 |q 4441
bank Cenarion Beacon##11511		|goto Ironforge 35.92,60.14 |q 5882 |future
bank Moontouched Feather##12383		|goto Ironforge 35.92,60.14 |q 978
step
click Marvon's Chest##149036
collect Stone Circle##10556 |q 3444/1 |goto The Barrens 62.50,38.54
step
talk Liv Rizzlefix##8496
|tip Inside the building.
accept Volcanic Activity##4502 |goto The Barrens 62.45,38.74
step
talk Islen Waterseer##5901
turnin Seeking Spiritual Aid##5158 |goto The Barrens 65.83,43.78
step
talk Tran'rek##7876
accept Super Sticky##4504 |goto Tanaris 51.57,26.76
step
talk Sprinkle##7583
turnin Sprinkle's Secret Ingredient##2641 |goto Tanaris/0 51.06,26.87
step
Watch the dialogue
talk Sprinkle##7583
accept Delivery for Marin##2661 |goto Tanaris/0 51.06,26.87
step
talk Alchemist Pestlezugg##5594
|tip Inside the building.
turnin March of the Silithid##4493 |goto Tanaris 50.89,26.96
accept Bungle in the Jungle##4496 |goto Tanaris 50.89,26.96
step
talk Marin Noggenfogger##7564
turnin Delivery for Marin##2661 |goto Tanaris/0 51.81,28.66
accept Noggenfogger Elixir##2662 |goto Tanaris/0 51.81,28.66
step
Watch the dialogue
talk Marin Noggenfogger##7564
turnin Noggenfogger Elixir##2662 |goto Tanaris/0 51.81,28.66
step
talk Marvon Rivetseeker##7771
turnin The Stone Circle##3444 |goto Tanaris 52.71,45.92
step
talk Williden Marshal##9270
accept Expedition Salvation##3881 |goto Un'Goro Crater 43.95,7.14
step
talk Hol'anyee Marshal##9271
accept Alien Ecology##3883 |goto Un'Goro Crater 43.89,7.24
step
talk Spark Nilminer##9272
accept Roll the Bones##3882 |goto Un'Goro Crater 43.50,7.42
step
Enter the cave |goto Un'Goro Crater 43.47,6.79 < 15 |walk |only if not (subzone("Marshal's Refuge") and indoors())
talk J.D. Collie##9117
|tip Inside the cave.
accept The Northern Pylon##4285 |goto Un'Goro Crater 41.92,2.70
accept The Eastern Pylon##4287 |goto Un'Goro Crater 41.92,2.70
accept The Western Pylon##4288 |goto Un'Goro Crater 41.92,2.70
step
Leave the cave |goto Un'Goro Crater 43.47,6.79 < 15 |walk |only if subzone("Marshal's Refuge") and indoors()
click Beware of Pterrordax
accept Beware of Pterrordax##4501 |goto Un'Goro Crater 43.55,8.42
step
talk Spraggle Frock##9997
accept Lost!##4492 |goto Un'Goro Crater/0 43.61,8.50
step
talk Shizzle##9998
accept Shizzle's Flyer##4503 |goto Un'Goro Crater 44.24,11.59
stickystart "Collect_Webbed_Pterrordax_Scales"
stickystart "Collect_Dinosaur_Bones_And_Webbed_Diemetradon_Scales"
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
stickystart "Collect_Webbed_Pterrordax_Scales"
stickystart "Collect_Dinosaur_Bones_And_Webbed_Diemetradon_Scales"
step
Leave the cave |goto Un'Goro Crater/0 64.23,16.36 < 15 |walk |only if subzone("Fungal Rock") and indoors()
click Crate of Foodstuffs
collect Crate of Foodstuffs##11113 |q 3881/1 |goto Un'Goro Crater/0 68.51,36.54
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
accept The New Springs##980 |goto Un'Goro Crater/0 30.93,50.44
stickystop "Collect_UnGoro_Ash"
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
click Un'Goro Dirt Pile+
Kill enemies
collect 5 Un'Goro Soil##11018 |q 4496/2 |goto Un'Goro Crater/0 34.80,40.00
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
Enter the cave |goto Un'Goro Crater/0 43.47,6.79 < 15 |walk |only if not (subzone("Marshal's Refuge") and indoors())
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
talk Shizzle##9998
turnin Shizzle's Flyer##4503 |goto Un'Goro Crater/0 44.23,11.59
step
talk Karna Remtravel##9618
accept Chasing A-Me 01##4243 |goto Un'Goro Crater/0 46.38,13.44
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
accept Chasing A-Me 01##4244 |goto Un'Goro Crater/0 67.65,16.76 |only if (itemcount(10561) > 0) or (haveq(4244) or completedq(4244))
step
talk A-Me 01##9623
|tip Escort quest.
|tip Wait until she respawns, if missing.
|tip Inside the cave.
turnin Chasing A-Me 01##4244 |goto Un'Goro Crater/0 67.65,16.76
accept Chasing A-Me 01##4245 |goto Un'Goro Crater/0 67.65,16.76 |noautoaccept inparty
|only if haveq(4244) or completedq(4244)
step
Watch the dialogue
|tip Follow and protect A-Me 01.
Protect A-Me 01 Until You Reach Karna Remtravel |q 4245/1 |goto Un'Goro Crater/0 46.32,13.68
|only if haveq(4245) or completedq(4245)
step
talk Karna Remtravel##9618
turnin Chasing A-Me 01##4245 |goto Un'Goro Crater/0 46.38,13.45
|only if haveq(4245) or completedq(4245)
stickystart "Collect_Super_Sticky_Tar"
step
Leave the cave |goto Un'Goro Crater/0 64.23,16.36 < 15 |walk |only if subzone("Fungal Rock") and indoors()
talk Torwa Pathfinder##9619
turnin The Mighty U'cha##4301 |goto Un'Goro Crater 71.63,75.96
step
label "Collect_Super_Sticky_Tar"
kill Tar Beast##6517, Tar Creeper##6527, Tar Lord##6519, Tar Lurker##6518
|tip Swamp elementals.
collect 12 Super Sticky Tar##11834 |q 4504/1 |goto Un'Goro Crater 60.00,33.20
|mapmarker Un'Goro Crater/0 46.40,32.40
|mapmarker Un'Goro Crater/0 46.40,35.40
|mapmarker Un'Goro Crater/0 49.20,34.20
|mapmarker Un'Goro Crater/0 58.20,30.20
|mapmarker Un'Goro Crater/0 60.00,22.40
|mapmarker Un'Goro Crater/0 61.40,30.40
|mapmarker Un'Goro Crater/0 65.00,24.00
|mapmarker Un'Goro Crater/0 41.80,20.60
|mapmarker Un'Goro Crater/0 42.40,16.20
|mapmarker Un'Goro Crater/0 44.60,19.40
|mapmarker Un'Goro Crater/0 45.40,15.40
|mapmarker Un'Goro Crater/0 47.40,22.20
|mapmarker Un'Goro Crater/0 48.40,18.20
|mapmarker Un'Goro Crater/0 49.40,25.20
|mapmarker Un'Goro Crater/0 49.40,28.80
|mapmarker Un'Goro Crater/0 50.60,22.40
|mapmarker Un'Goro Crater/0 52.40,26.20
|mapmarker Un'Goro Crater/0 54.20,23.40
step
talk Alchemist Pestlezugg##5594
|tip Inside the building.
turnin Bungle in the Jungle##4496 |goto Tanaris/0 50.89,26.96
step
_Destroy or Sell These Items:_
|tip Not needed.
trash Un'Goro Soil##11018
step
talk Tran'rek##7876
turnin Super Sticky##4504 |goto Tanaris 51.57,26.76
step
talk Gimblethorn##7799
|tip Collect from the bank.
|tip Inside the building.
collect Cenarion Beacon##11511		|goto Tanaris 52.30,28.91 |q 5882 |future
collect Eridan's Vial##11682		|goto Tanaris 52.30,28.91 |q 4441
collect 10 Moontouched Feather##12383	|goto Tanaris 52.30,28.91 |q 978
step
talk Liv Rizzlefix##8496
|tip Inside the building.
turnin Volcanic Activity##4502 |goto The Barrens 62.45,38.74
step
talk Islen Waterseer##5901
accept Cleansed Water Returns to Felwood##5159 |goto The Barrens 65.83,43.78
step
talk Randal Hunter##4732
Train Horse Riding |learnspell Horse Riding##824 |goto Elwynn Forest/0 84.32,64.87
Buy a mount from Katie Hunter nearby at [Elwynn Forest/0 84.15,65.49]
|only if Human and discountgold('Stormwind',500000)
step
talk Loganaar##12042
Train Abilities |trainer Loganaar##12042 |goto Moonglade/0 52.53,40.57 |q 978
|only if Druid
step
talk Dink##7312
|tip Inside the building.
Train Abilities |trainer Dink##7312 |goto Ironforge/0 27.16,8.56 |q 978
|only if Mage
step
talk Bilban Tosslespanner##5114
|tip Inside the building.
Train Abilities |trainer Bilban Tosslespanner##5114 |goto Ironforge/0 65.90,88.41 |q 978
|only if Warrior
step
talk Regnus Thundergranite##5117
|tip Inside the building.
Train Abilities |trainer Regnus Thundergranite##5117 |goto Ironforge/0 69.87,82.90 |q 978
|only if Hunter
step
talk Belia Thundergranite##10090
|tip Inside the building.
Train Pet Abilities |trainer Belia Thundergranite##10090 |goto Ironforge/0 70.86,85.84 |q 978
|only if Hunter
step
talk Fenthwick##5167
|tip Inside the building.
Train Abilities |trainer Fenthwick##5167 |goto Ironforge/0 65.90,88.41 |q 978
|only if Rogue
step
talk Briarthorn##5172
|tip Inside the building.
Train Abilities |trainer Briarthorn##5172 |goto Ironforge/0 50.35,5.66 |q 978
|only if Warlock
step
talk Jubahl Corpseseeker##6382
|tip Buy available Grimoires.
|tip Inside the building.
Train Demon Abilities |vendor Jubahl Corpseseeker##6382 |goto Ironforge/0 50.35,5.66 |q 978
|only if Warlock
step
talk Beldruk Doombrow##5148
|tip Inside the building.
Train Abilities |trainer Beldruk Doombrow##5148 |goto Ironforge/0 24.54,4.50 |q 978
|only if Paladin
step
talk Toldren Deepiron##5143
|tip Inside the building.
Train Abilities |trainer Toldren Deepiron##5143 |goto Ironforge/0 25.21,10.74 |q 978
|only if Priest
step
talk Ultham Ironhorn##4772
Train Ram Riding |learnspell Ram Riding##826 |goto Dun Morogh/0 63.94,50.10
Buy a mount from Veron Amberstill nearby at [Dun Morogh/0 63.47,50.56]
|only if Dwarf and discountgold('Ironforge',500000)
step
talk Binjy Featherwhistle##7954
Train Mechanostrider Piloting |learnspell Mechanostrider Piloting##553 |goto Dun Morogh/0 49.15,48.13
Buy a mount from Milli Featherwhistle nearby at [Dun Morogh/0 49.13,47.95]
|only if Gnome and discountgold('Gnomeregan Exiles',500000)
]])
GoatQuest:RegisterGuide("Leveling Guides\\Winterspring & Felwood (55-57)",{
image=GQ.IMAGESDIR.."Winterspring",
next="Leveling Guides\\Western & Eastern Plaguelands (57-60)",
},[[
step
talk Erelas Ambersky##7916
|tip Inside the building.
turnin Moontouched Wildkin##978 |goto Teldrassil 55.50,92.04
accept Find Ranshalla##979 |goto Teldrassil 55.50,92.04
step
talk Daryn Lightwind##7907
|tip Upstairs inside the building.
accept Starfall##5250 |goto Teldrassil 55.41,92.23
step
use Eridan's Vial##11682
|tip Inside the building.
collect Vial of Blessed Water##5646 |q 4441/1 |goto Darnassus 39.51,83.92
step
talk Jartsam##4753
Train Tiger Riding |learnspell Tiger Riding##828 |goto Darnassus/0 38.69,15.84
Buy a mount from Lelanai nearby at [Darnassus/0 38.28,15.36]
|only if NightElf and discountgold('Darnassus',500000)
step
talk Greta Mosshoof##10922
|tip Walks around.
turnin Cleansed Water Returns to Felwood##5159 |goto Felwood 51.21,82.11
step
talk Eridan Bluewind##9116
|tip Inside the building.
turnin Felbound Ancients##4441 |goto Felwood 51.35,81.51
step
Watch the dialogue
talk Eridan Bluewind##9116
|tip Inside the building.
accept Purified!##4442 |goto Felwood 51.35,81.51
step
talk Eridan Bluewind##9116
|tip Inside the building.
turnin Purified!##4442 |goto Felwood 51.35,81.51
step
kill Deadwood Warrior##7153, Deadwood Pathfinder##7155, Deadwood Gardener##7154
collect 6 Corrupted Soul Shard##11515 |goto Felwood 48.40,89.20 |q 5882 |future
|mapmarker Felwood/0 46.20,89.20
|mapmarker Felwood/0 46.80,91.80
|mapmarker Felwood/0 48.00,93.40
|mapmarker Felwood/0 49.40,91.60
step
talk Arathandris Silversky##9528
|tip Walks around.
accept Salve via Hunting##5882 |goto Felwood 54.15,86.83 |instant
step
_Destroy These Items:_
|tip Not needed.
trash Flute of the Ancients##11445
trash Cenarion Beacon##11511
trash Cenarion Plant Salve##11516
trash Corrupted Soul Shard##11515
step
talk Nafien##15395
|tip Follow the road.
accept Deadwood of the North##8461 |goto Felwood 64.77,8.13
step
label "Kill_Deadwood_Enemies"
kill 6 Deadwood Den Watcher##7156 |q 8461/1 |goto Felwood 63.60,9.60
kill 6 Deadwood Avenger##7157 |q 8461/2 |goto Felwood 63.60,9.60
kill 6 Deadwood Shaman##7158 |q 8461/3 |goto Felwood 63.60,9.60
|mapmarker Felwood/0 60.00,6.60
|mapmarker Felwood/0 60.40,8.60
|mapmarker Felwood/0 61.40,10.80
|mapmarker Felwood/0 62.40,7.60
|mapmarker Felwood/0 62.40,12.60
|mapmarker Felwood/0 63.60,6.00
step
talk Nafien##15395
|tip Follow the road.
turnin Deadwood of the North##8461 |goto Felwood 64.77,8.13
accept Speak to Salfa##8465 |goto Felwood 64.77,8.13
step
label "ClearQuest_Feathers_For_Nafien"
|execute clearquest(8467)
|only if itemcount(21377) >= 5
step
talk Nafien##15395
accept Feathers for Nafien##8467 |goto Felwood 64.77,8.13 |instant
|only if itemcount(21377) >= 5
step
|next "ClearQuest_Feathers_For_Nafien"
|only if itemcount(21377) >= 5
step
talk Salfa##11556
turnin Speak to Salfa##8465 |goto Winterspring 27.74,34.50
step
talk Donova Snowden##9298
turnin The New Springs##980 |goto Winterspring/0 31.27,45.16
accept Threat of the Winterfall##5082 |goto Winterspring 31.27,45.16
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
accept Falling to Corruption##5084 |goto Winterspring 31.27,45.16
step
click Deadwood Cauldron##176091
|tip Run away, if needed.
turnin Falling to Corruption##5084 |goto Felwood 60.20,5.87
accept Mystery Goo##5085 |goto Felwood 60.20,5.87
step
talk Donova Snowden##9298
turnin Mystery Goo##5085 |goto Winterspring 31.27,45.16
accept Strange Sources##4842 |goto Winterspring 31.27,45.16
step
talk Wynd Nightchaser##11079
|tip Inside the building.
turnin Starfall##5250 |goto Winterspring 51.97,30.39
accept The Ruins of Kel'Theril##5244 |goto Winterspring 51.97,30.39
step
talk Jaron Stoneshaper##10301
|tip Inside the building.
turnin The Ruins of Kel'Theril##5244 |goto Winterspring 52.14,30.43
accept Troubled Spirits of Kel'Theril##5245 |goto Winterspring 52.14,30.43
accept Enraged Wildkin##4861 |goto Winterspring 52.14,30.43
step
click Highborne Relic Fragment
|tip You will be attacked.
collect Second Relic Fragment##12897 |q 5245/2 |goto Winterspring 50.88,41.71 |usebank
step
click Highborne Relic Fragment
|tip You will be attacked.
collect Fourth Relic Fragment##12899 |q 5245/4 |goto Winterspring 52.42,41.50 |usebank
step
click Highborne Relic Fragment
|tip You will be attacked.
collect Third Relic Fragment##12898 |q 5245/3 |goto Winterspring 53.31,43.43 |usebank
step
click Highborne Relic Fragment
|tip You will be attacked.
collect First Relic Fragment##12896 |q 5245/1 |goto Winterspring 55.14,42.98 |usebank
step
talk Umi Rumplesnicker##10305
accept Are We There, Yeti?##3783 |goto Winterspring/0 60.88,37.62
step
talk Gregor Greystone##10431
|tip Inside the building.
accept The Everlook Report##6028 |goto Winterspring 61.35,38.97
accept Duke Nicholas Zverenhoff##6030 |goto Winterspring 61.35,38.97
step
talk Izzy Coppergrab##13917
|tip Deposit into the bank.
|tip Inside the building.
bank Everlook Report##15788		|goto Winterspring/0 61.46,36.97 |q 6028
bank Studies in Spirit Speaking##15790	|goto Winterspring/0 61.46,36.97 |q 6030
bank Jaron's Pick##12891		|goto Winterspring/0 61.46,36.97 |q 5245
bank First Relic Fragment##12896	|goto Winterspring/0 61.46,36.97 |q 5245
bank Second Relic Fragment##12897	|goto Winterspring/0 61.46,36.97 |q 5245
bank Third Relic Fragment##12898	|goto Winterspring/0 61.46,36.97 |q 5245
bank Fourth Relic Fragment##12899	|goto Winterspring/0 61.46,36.97 |q 5245
step
kill Ice Thistle Yeti##7458, Ice Thistle Matriarch##7459, Ice Thistle Patriarch##7460
|tip Yetis.
|tip Inside and outside the cave.
collect 10 Thick Yeti Fur##12366 |q 3783/1 |goto Winterspring 67.65,41.75
|mapmarker Winterspring/0 64.20,39.80
|mapmarker Winterspring/0 64.40,41.80
|mapmarker Winterspring/0 65.80,44.80
|mapmarker Winterspring/0 69.20,40.00
|mapmarker Winterspring/0 71.40,40.40
step
Leave the cave |goto Winterspring 67.65,41.75 < 30 |walk |only if subzone("Ice Thistle Hills") and indoors()
click Damaged Crate
turnin Enraged Wildkin##4861 |goto Winterspring 59.00,59.78
accept Enraged Wildkin##4863 |goto Winterspring 59.00,59.78
step
click Jaron's Wagon
turnin Enraged Wildkin##4863 |goto Winterspring 61.41,60.68
accept Enraged Wildkin##4864 |goto Winterspring 61.41,60.68
step
click Jaron's Supplies
collect Jaron's Supplies##12525 |q 4864/1 |goto Winterspring 61.39,60.73
step
talk Ranshalla##10300
|tip Escort quest.
|tip Wait until she respawns, if missing.
turnin Find Ranshalla##979 |goto Winterspring 63.07,59.47
step
kill Crazed Owlbeast##7452, Moontouched Owlbeast##7453, Berserk Owlbeast##7454
collect Blue-feathered Amulet##12524 |q 4864/2 |goto Winterspring/0 63.40,59.20
|mapmarker Winterspring/0 64.40,62.40
|mapmarker Winterspring/0 64.80,65.00
|mapmarker Winterspring/0 65.80,60.80
step
Discover Darkwhisper Gorge |q 4842/1 |goto Winterspring 59.84,74.12
|tip Follow the road.
step
talk Umi Rumplesnicker##10305
turnin Are We There, Yeti?##3783 |goto Winterspring 60.88,37.62
step
talk Jaron Stoneshaper##10301
|tip Inside the building.
turnin Enraged Wildkin##4864 |goto Winterspring 52.14,30.43
step
_NOTE:_
Tame an Elder Shardtooth
|tip Cast {o}Tame Beast{} on an Elder Shardtooth.
|tip White bears.
|tip Find one that's {o}level 57{}.
|tip Abandon your pet first.
|tip New permanent pet.
Click Here to Continue |confirm |goto Winterspring/0 56.40,27.00 |q 8464
|mapmarker Winterspring/0 54.20,20.60
|mapmarker Winterspring/0 55.40,23.60
|mapmarker Winterspring/0 57.40,14.80
|mapmarker Winterspring/0 57.40,19.40
|mapmarker Winterspring/0 58.40,23.80
|mapmarker Winterspring/0 59.40,12.00
|mapmarker Winterspring/0 60.40,15.20
|mapmarker Winterspring/0 60.60,18.20
|mapmarker Winterspring/0 61.40,21.60
|mapmarker Winterspring/0 61.40,27.20
|only if Hunter
step
talk Donova Snowden##9298
turnin Strange Sources##4842 |goto Winterspring 31.27,45.16
]])
GoatQuest:RegisterGuide("Leveling Guides\\Western & Eastern Plaguelands (57-60)",{
image=GQ.IMAGESDIR.."Western Plaguelands",
},[[
step
talk Loganaar##12042
Train Abilities |trainer Loganaar##12042 |goto Moonglade/0 52.53,40.57 |q 6028
|only if Druid
step
talk Jartsam##4753
Train Tiger Riding |learnspell Tiger Riding##828 |goto Darnassus/0 38.69,15.84
Buy a mount from Lelanai nearby at [Darnassus/0 38.28,15.36]
|only if NightElf and discountgold('Darnassus',500000)
step
talk Dink##7312
|tip Inside the building.
Train Abilities |trainer Dink##7312 |goto Ironforge/0 27.16,8.56 |q 6028
|only if Mage
step
talk Bailey Stonemantle##2461
|tip Collect from the bank.
|tip Inside the building.
collect Everlook Report##15788			|goto Ironforge 35.92,60.14 |q 6028
collect Studies in Spirit Speaking##15790	|goto Ironforge 35.92,60.14 |q 6030
collect Jaron's Pick##12891			|goto Ironforge 35.92,60.14 |q 5245
collect First Relic Fragment##12896		|goto Ironforge 35.92,60.14 |q 5245
collect Second Relic Fragment##12897		|goto Ironforge 35.92,60.14 |q 5245
collect Third Relic Fragment##12898		|goto Ironforge 35.92,60.14 |q 5245
collect Fourth Relic Fragment##12899		|goto Ironforge 35.92,60.14 |q 5245
step
talk Bilban Tosslespanner##5114
|tip Inside the building.
Train Abilities |trainer Bilban Tosslespanner##5114 |goto Ironforge/0 65.90,88.41 |q 6028
|only if Warrior
step
talk Regnus Thundergranite##5117
|tip Inside the building.
Train Abilities |trainer Regnus Thundergranite##5117 |goto Ironforge/0 69.87,82.90 |q 6028
|only if Hunter
step
talk Fenthwick##5167
|tip Inside the building.
Train Abilities |trainer Fenthwick##5167 |goto Ironforge/0 65.90,88.41 |q 6028
|only if Rogue
step
talk Briarthorn##5172
|tip Inside the building.
Train Abilities |trainer Briarthorn##5172 |goto Ironforge/0 50.35,5.66 |q 6028
|only if Warlock
step
talk Jubahl Corpseseeker##6382
|tip Buy available Grimoires.
|tip Inside the building.
Train Demon Abilities |vendor Jubahl Corpseseeker##6382 |goto Ironforge/0 50.35,5.66 |q 6028
|only if Warlock
step
talk Beldruk Doombrow##5148
|tip Inside the building.
Train Abilities |trainer Beldruk Doombrow##5148 |goto Ironforge/0 24.54,4.50 |q 6028
|only if Paladin
step
talk Toldren Deepiron##5143
|tip Inside the building.
Train Abilities |trainer Toldren Deepiron##5143 |goto Ironforge/0 25.21,10.74 |q 6028
|only if Priest
step
talk Ultham Ironhorn##4772
Train Ram Riding |learnspell Ram Riding##826 |goto Dun Morogh/0 63.94,50.10
Buy a mount from Veron Amberstill nearby at [Dun Morogh/0 63.47,50.56]
|only if Dwarf and discountgold('Ironforge',500000)
step
talk Binjy Featherwhistle##7954
Train Mechanostrider Piloting |learnspell Mechanostrider Piloting##553 |goto Dun Morogh/0 49.15,48.13
Buy a mount from Milli Featherwhistle nearby at [Dun Morogh/0 49.13,47.95]
|only if Gnome and discountgold('Gnomeregan Exiles',500000)
step
talk Randal Hunter##4732
Train Horse Riding |learnspell Horse Riding##824 |goto Elwynn Forest/0 84.32,64.87
Buy a mount from Katie Hunter nearby at [Elwynn Forest/0 84.15,65.49]
|only if Human and discountgold('Stormwind',500000)
step
talk Innkeeper Anderson##2352
|tip Inside the building.
home Southshore |goto Hillsbrad Foothills 51.17,58.93 |q 5211 |future
step
talk Commander Ashlam Valorfist##10838
accept All Along the Watchtowers##5097 |goto Western Plaguelands 42.70,84.03
accept The Scourge Cauldrons##5215 |goto Western Plaguelands 42.70,84.03
step
talk High Priestess MacDonnell##11053
turnin The Scourge Cauldrons##5215 |goto Western Plaguelands 42.97,84.50
accept Target: Felstone Field##5216 |goto Western Plaguelands/0 42.97,84.50
step
talk Argent Officer Pureheart##10840
turnin The Everlook Report##6028 |goto Western Plaguelands 42.97,83.55
step
kill Cauldron Lord Bilemaw##11075
collect Felstone Field Cauldron Key##13194 |q 5216/1 |goto Western Plaguelands 37.03,57.11
step
click Scourge Cauldron
turnin Target: Felstone Field##5216 |goto Western Plaguelands 37.19,56.87
accept Return to Chillwind Camp##5217 |goto Western Plaguelands 37.19,56.87
step
talk Janice Felstone##10778
|tip Upstairs inside the building.
accept Better Late Than Never##5021 |goto Western Plaguelands 38.40,54.05
step
click Janice's Parcel
|tip Inside the building.
turnin Better Late Than Never##5021 |goto Western Plaguelands 38.73,55.24
accept Better Late Than Never##5022 |goto Western Plaguelands 38.73,55.24
step
talk High Priestess MacDonnell##11053
turnin Return to Chillwind Camp##5217 |goto Western Plaguelands 42.97,84.50
accept Target: Dalson's Tears##5219 |goto Western Plaguelands 42.97,84.50
step
talk Marlene Redpath##10927
|tip Walks around.
|tip {o}Both floors{} inside the building.
accept Little Pamela##5142 |goto Western Plaguelands/0 49.13,78.52
step
use Beacon Torch##12815
|tip Tower entrance.
|tip Avoid the {o}elite enemy{} inside.
Mark Tower Four |q 5097/4 |goto Western Plaguelands 46.70,71.10
step
talk Mulgris Deepriver##10739
|tip Inside the building.
accept The Wildlife Suffers Too##4984 |goto Western Plaguelands 53.72,64.67
stickystart "Kill_Diseased_Wolves"
step
use Beacon Torch##12815
|tip Tower entrance.
|tip Avoid the {o}elite enemy{} inside.
Mark Tower Three |q 5097/3 |goto Western Plaguelands 44.22,63.37
step
label "Kill_Diseased_Wolves"
kill 8 Diseased Wolf##1817 |q 4984/1 |goto Western Plaguelands 44.20,59.60
|tip Shared spawns with spiders.
|mapmarker Western Plaguelands/0 39.40,48.60
|mapmarker Western Plaguelands/0 42.40,47.00
|mapmarker Western Plaguelands/0 42.40,56.40
|mapmarker Western Plaguelands/0 43.40,39.80
|mapmarker Western Plaguelands/0 43.80,50.80
|mapmarker Western Plaguelands/0 50.20,64.20
|mapmarker Western Plaguelands/0 45.20,42.20
|mapmarker Western Plaguelands/0 45.40,47.80
|mapmarker Western Plaguelands/0 46.80,39.40
|mapmarker Western Plaguelands/0 47.60,45.40
|mapmarker Western Plaguelands/0 48.20,61.60
|mapmarker Western Plaguelands/0 49.80,38.80
|mapmarker Western Plaguelands/0 50.40,48.00
|mapmarker Western Plaguelands/0 50.40,52.20
|mapmarker Western Plaguelands/0 51.20,58.00
|mapmarker Western Plaguelands/0 51.60,69.40
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
accept Locked Away##5060 |goto Western Plaguelands 47.37,49.65 |instant
step
kill Cauldron Lord Malvinious##11077
collect Dalson's Tears Cauldron Key##13195 |q 5219/1 |goto Western Plaguelands 46.18,52.38
step
click Scourge Cauldron
turnin Target: Dalson's Tears##5219 |goto Western Plaguelands 46.18,52.02
accept Return to Chillwind Camp##5220 |goto Western Plaguelands 46.18,52.02
step
use Beacon Torch##12815
|tip Tower entrance.
|tip Avoid the {o}elite enemy{} inside.
Mark Tower Two |q 5097/2 |goto Western Plaguelands 42.44,66.27
step
use Beacon Torch##12815
|tip Tower entrance.
|tip Avoid the {o}elite enemy{} inside.
Mark Tower One |q 5097/1 |goto Western Plaguelands 40.13,71.52
step
talk Commander Ashlam Valorfist##10838
turnin All Along the Watchtowers##5097 |goto Western Plaguelands 42.70,84.03
accept Scholomance##5533 |goto Western Plaguelands 42.70,84.03
step
_Destroy This Item:_
|tip Not needed.
trash Beacon Torch##12815
step
talk Alchemist Arbington##11056
turnin Scholomance##5533 |goto Western Plaguelands/0 42.66,83.77
step
talk High Priestess MacDonnell##11053
turnin Return to Chillwind Camp##5220 |goto Western Plaguelands 42.97,84.50
accept Target: Writhing Haunt##5222 |goto Western Plaguelands 42.97,84.50
step
talk Nathaniel Dumah##11616
accept A Plague Upon Thee##5903 |goto Western Plaguelands 43.42,84.84
step
kill Cauldron Lord Razarch##11076
collect Writhing Haunt Cauldron Key##13197 |q 5222/1 |goto Western Plaguelands 53.02,66.06
step
click Scourge Cauldron
turnin Target: Writhing Haunt##5222 |goto Western Plaguelands 53.02,65.72
accept Return to Chillwind Camp##5223 |goto Western Plaguelands 53.02,65.72
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
talk Pamela Redpath##10926
|tip Walks around.
|tip Inside the crumbled house.
turnin Little Pamela##5142 |goto Eastern Plaguelands 36.45,90.80
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
kill 5 Plaguehound##8597 |q 5542/2 |goto Eastern Plaguelands/0 68.00,75.60
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
accept The Restless Souls##5281 |goto Eastern Plaguelands 79.54,63.77
step
talk Duke Nicholas Zverenhoff##11039
turnin Duke Nicholas Zverenhoff##6030 |goto Eastern Plaguelands 81.43,59.82
step
talk Carlin Redpath##11063
turnin Uncle Carlin##5241 |goto Eastern Plaguelands 81.52,59.77
accept Defenders of Darrowshire##5211 |goto Eastern Plaguelands 81.52,59.77
step
talk Khaelyn Steelwing##12617
fpath Light's Hope Chapel |goto Eastern Plaguelands 81.63,59.28
stickystart "Kill_Frenzied_Plaguehounds"
stickystart "Free_Darrowshire_Spirits"
step
talk Aurora Skycaller##10304
turnin Troubled Spirits of Kel'Theril##5245 |goto Eastern Plaguelands 53.51,22.00
step
_Destroy This Item:_
|tip Not needed.
trash Jaron's Pick##12891
step
click Large Termite Mound##177464+
|tip Large stones leaking green ooze.
|tip Work your way west.
collect 100 Plagueland Termites##15043 |q 5903/1 |goto Eastern Plaguelands/0 45.90,34.10
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
talk Egan##11140
|tip Inside the building.
turnin The Restless Souls##5281 |goto Eastern Plaguelands 14.45,33.74
stickystop "Kill_Frenzied_Plaguehounds"
step
talk Augustus the Touched##12384
|tip Inside the building.
accept Augustus' Receipt Book##6164 |goto Eastern Plaguelands 14.45,33.48
step
click Augustus' Receipt Book
|tip Upstairs inside the building.
collect Augustus' Receipt Book##15884 |q 6164/1 |goto Eastern Plaguelands 17.43,31.09
step
talk Augustus the Touched##12384
|tip Inside the building.
turnin Augustus' Receipt Book##6164 |goto Eastern Plaguelands 14.45,33.48
step
label "Kill_Frenzied_Plaguehounds"
kill 5 Frenzied Plaguehound##8598 |q 5542/3 |goto Eastern Plaguelands 45.00,38.60
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
label "Free_Darrowshire_Spirits"
kill Cannibal Ghoul##8530, Diseased Flayer##8532, Gibbering Ghoul##8531
|tip Ghouls.
|tip Shared spawns with other undead.
talk Darrowshire Spirit##11064+
|tip Appear at their corpses.
Free #15# Darrowshire Spirits |q 5211/1 |goto Eastern Plaguelands 67.00,40.80
|mapmarker Eastern Plaguelands/0 64.20,39.20
|mapmarker Eastern Plaguelands/0 64.80,37.00
|mapmarker Eastern Plaguelands/0 65.20,42.00
|mapmarker Eastern Plaguelands/0 66.60,38.60
|mapmarker Eastern Plaguelands/0 67.00,35.40
|mapmarker Eastern Plaguelands/0 68.60,38.60
|mapmarker Eastern Plaguelands/0 69.00,41.00
step
Enter the crypt |goto Eastern Plaguelands 27.86,85.48 < 10 |walk |only if not (subzone("The Undercroft")  and indoors())
kill Zaeldarr the Outcast##12250
|tip Downstairs inside the crypt.
collect Zaeldarr's Head##15785 |q 6021/1 |goto Eastern Plaguelands 27.46,84.88
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
talk Loganaar##12042
Train Abilities |trainer Loganaar##12042 |goto Moonglade/0 52.53,40.57 |q 5223
|only if Druid
step
talk Dink##7312
|tip Inside the building.
Train Abilities |trainer Dink##7312 |goto Ironforge/0 27.16,8.56 |q 5223
|only if Mage
step
talk Bilban Tosslespanner##5114
|tip Inside the building.
Train Abilities |trainer Bilban Tosslespanner##5114 |goto Ironforge/0 65.90,88.41 |q 5223
|only if Warrior
step
talk Regnus Thundergranite##5117
|tip Inside the building.
Train Abilities |trainer Regnus Thundergranite##5117 |goto Ironforge/0 69.87,82.90 |q 5223
|only if Hunter
step
talk Fenthwick##5167
|tip Inside the building.
Train Abilities |trainer Fenthwick##5167 |goto Ironforge/0 65.90,88.41 |q 5223
|only if Rogue
step
talk Briarthorn##5172
|tip Inside the building.
Train Abilities |trainer Briarthorn##5172 |goto Ironforge/0 50.35,5.66 |q 5223
|only if Warlock
step
talk Jubahl Corpseseeker##6382
|tip Buy available Grimoires.
|tip Inside the building.
Train Demon Abilities |vendor Jubahl Corpseseeker##6382 |goto Ironforge/0 50.35,5.66 |q 5223
|only if Warlock
step
talk Beldruk Doombrow##5148
|tip Inside the building.
Train Abilities |trainer Beldruk Doombrow##5148 |goto Ironforge/0 24.54,4.50 |q 5223
|only if Paladin
step
talk Toldren Deepiron##5143
|tip Inside the building.
Train Abilities |trainer Toldren Deepiron##5143 |goto Ironforge/0 25.21,10.74 |q 5223
|only if Priest
step
talk High Priestess MacDonnell##11053
turnin Return to Chillwind Camp##5223 |goto Western Plaguelands 42.97,84.50
accept Target: Gahrron's Withering##5225 |goto Western Plaguelands 42.97,84.50
step
talk Alchemist Arbington##11056
accept Skeletal Fragments##5537 |goto Western Plaguelands 42.66,83.77
step
talk Nathaniel Dumah##11616
turnin A Plague Upon Thee##5903 |goto Western Plaguelands 43.42,84.84
accept A Plague Upon Thee##5904 |goto Western Plaguelands 43.42,84.84
step
_Destroy These Items:_
|tip Not needed.
trash Plagueland Termites##15043
stickystart "Collect_Skeletal_Fragments"
step
talk Marlene Redpath##10927
|tip Walks around.
|tip {o}Both floors{} inside the building.
turnin Auntie Marlene##5152 |goto Western Plaguelands 49.13,78.52
accept A Strange Historian##5153 |goto Western Plaguelands 49.13,78.52
step
click Joseph Redpath's Monument
collect Joseph's Wedding Ring##12894 |q 5153/1 |goto Western Plaguelands 49.68,76.77
step
label "Collect_Skeletal_Fragments"
kill Skeletal Flayer##1783, Skeletal Sorcerer##1784
collect 15 Skeletal Fragments##14619 |q 5537/1 |goto Western Plaguelands 50.80,79.40
|mapmarker Western Plaguelands/0 49.40,76.20
|mapmarker Western Plaguelands/0 49.40,82.80
|mapmarker Western Plaguelands/0 46.40,80.40
|mapmarker Western Plaguelands/0 54.20,80.40
step
talk Chromie##10667
|tip Upstairs inside the building.
turnin A Strange Historian##5153 |goto Western Plaguelands 39.45,66.76
accept The Annals of Darrowshire##5154 |goto Western Plaguelands 39.45,66.76
accept A Matter of Time##4971 |goto Western Plaguelands 39.45,66.76
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
use Temporal Displacer##12627
|tip Near large structures with blue lights.
kill 15 Temporal Parasite##10717 |q 4971/1 |goto Western Plaguelands 45.00,63.00
|tip Another can spawn when they die.
|mapmarker Western Plaguelands/0 47.40,66.40
|mapmarker Western Plaguelands/0 48.00,62.80
|mapmarker Western Plaguelands/0 49.20,68.40
|mapmarker Western Plaguelands/0 49.80,66.40
step
talk Chromie##10667
|tip Upstairs inside the building.
turnin The Annals of Darrowshire##5154 |goto Western Plaguelands 39.45,66.76
accept Brother Carlin##5210 |goto Western Plaguelands 39.45,66.76
turnin A Matter of Time##4971 |goto Western Plaguelands 39.45,66.76
accept Counting Out Time##4972 |goto Western Plaguelands 39.45,66.76
step
_Destroy These Items:_
|tip Not needed.
trash Ruined Tome##15696
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
talk Chromie##10667
|tip Upstairs inside the building.
turnin Counting Out Time##4972 |goto Western Plaguelands 39.45,66.76
step
talk Alchemist Arbington##11056
turnin Skeletal Fragments##5537 |goto Western Plaguelands/0 42.66,83.77
step
talk Carlin Redpath##11063
turnin Brother Carlin##5210 |goto Eastern Plaguelands/0 81.52,59.76
accept Villains of Darrowshire##5181 |goto Eastern Plaguelands/0 81.52,59.76
turnin Defenders of Darrowshire##5211 |goto Eastern Plaguelands/0 81.52,59.76
step
talk Jessica Chambers##16256
|tip Inside the building.
home Light's Hope Chapel |goto Eastern Plaguelands/0 81.63,58.08 |q 5048 |future
step
talk Caretaker Alen##11038
|tip Walks around.
turnin Zaeldarr the Outcast##6021 |goto Eastern Plaguelands 79.54,63.77
step
click Horgus' Skull##176208
|tip Underwater.
collect Skull of Horgus##12956 |q 5181/1 |goto Eastern Plaguelands/0 51.11,49.93
step
click Shattered Sword of Marduk##176209
collect Shattered Sword of Marduk##12957 |q 5181/2 |goto Eastern Plaguelands/0 53.91,65.76
stickystart "Kill_Diseased_Grizzlies"
step
kill Cauldron Lord Soulwrath##11078
|tip Walks around.
collect Gahrron's Withering Cauldron Key##13196 |q 5225/1 |goto Western Plaguelands 62.78,58.75
step
click Scourge Cauldron
turnin Target: Gahrron's Withering##5225 |goto Western Plaguelands 62.56,58.57
accept Return to Chillwind Point##5226 |goto Western Plaguelands 62.56,58.57
step
label "Kill_Diseased_Grizzlies"
kill 8 Diseased Grizzly##1816 |q 4985/1 |goto Western Plaguelands 59.80,60.20
|tip Shared spawns with spiders.
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
|mapmarker Western Plaguelands/0 66.40,51.00
|mapmarker Western Plaguelands/0 66.60,45.20
|mapmarker Western Plaguelands/0 67.80,48.00
step
talk Mulgris Deepriver##10739
|tip Inside the building.
turnin The Wildlife Suffers Too##4985 |goto Western Plaguelands 53.72,64.67
accept Glyphed Oaken Branch##4986 |goto Western Plaguelands 53.72,64.67
step
click Northridge Lumber Mill Crate
|tip Inside the building.
Select _"Place Termite Barrel on the crate."_ |gossip 97332
click Termite Barrel
|tip Appears on the crate.
turnin A Plague Upon Thee##5904 |goto Western Plaguelands 48.35,32.00
accept A Plague Upon Thee##6389 |goto Western Plaguelands 48.35,32.00
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
talk Carlin Redpath##11063
turnin Villains of Darrowshire##5181 |goto Eastern Plaguelands/0 81.52,59.76
step
talk Nathaniel Dumah##11616
turnin A Plague Upon Thee##6389 |goto Western Plaguelands 43.42,84.83
step
talk High Priestess MacDonnell##11053
turnin Return to Chillwind Camp##5226 |goto Western Plaguelands 42.97,84.50
step
talk Commander Ashlam Valorfist##10838
accept Mission Accomplished!##5237 |goto Western Plaguelands 42.70,84.03 |instant
step
talk Mathrengyl Bearwalker##4217
|tip {o}Middle floor{} inside the building.
turnin Glyphed Oaken Branch##4986 |goto Darnassus/0 35.38,8.43
step
talk Jartsam##4753
Train Tiger Riding |learnspell Tiger Riding##828 |goto Darnassus/0 38.69,15.84
Buy a mount from Lelanai nearby at [Darnassus/0 38.28,15.36]
|only if NightElf and discountgold('Darnassus',500000)
step
talk Ultham Ironhorn##4772
Train Ram Riding |learnspell Ram Riding##826 |goto Dun Morogh/0 63.94,50.10
Buy a mount from Veron Amberstill nearby at [Dun Morogh/0 63.47,50.56]
|only if Dwarf and discountgold('Ironforge',500000)
step
talk Binjy Featherwhistle##7954
Train Mechanostrider Piloting |learnspell Mechanostrider Piloting##553 |goto Dun Morogh/0 49.15,48.13
Buy a mount from Milli Featherwhistle nearby at [Dun Morogh/0 49.13,47.95]
|only if Gnome and discountgold('Gnomeregan Exiles',500000)
step
talk Royal Factor Bathrilor##10782
|tip Upstairs inside the building.
turnin Better Late Than Never##5022 |goto Stormwind City 48.47,30.55
accept Good Natured Emma##5048 |goto Stormwind City 48.47,30.55
step
map Stormwind City
path	follow strict;	loop on;	ants curved;	dist 20;	markers none;		arrow hide
path	52.46,41.98		48.29,49.03		50.15,51.53		55.04,47.69
path	57.64,47.70		59.73,51.45		57.66,55.16		60.62,60.33
path	57.16,54.48		57.05,54.37		55.65,53.48		52.74,55.15
path	50.88,51.60		49.66,51.59		48.32,48.32
talk Ol' Emma##3520
|tip Old human woman.
|tip Walks a large path.
turnin Good Natured Emma##5048
Also check upstairs in the house at [Stormwind City/0 52.37,42.13] |noway
step
talk Randal Hunter##4732
Train Horse Riding |learnspell Horse Riding##824 |goto Elwynn Forest/0 84.32,64.87
Buy a mount from Katie Hunter nearby at [Elwynn Forest/0 84.15,65.49]
|only if Human and discountgold('Stormwind',500000)
]])
GoatQuest:RegisterGuide("Leveling Guides\\Ahn'Qiraj Gear\\Ruins of Ahn'Qiraj Cloak Quest",{
description="This guide will walk you through obtaining the Ruins of Ahn'Qiraj class-specific cloak.",
condition_end=function() return completedq(8692,8696,8691,8695,8689,8693,8690,8694,8557) end,
},[[
step
Reach Level 60 |ding 60
|tip Use the leveling guides to accomplish this.
step
talk Keyl Swiftclaw##15500
accept Cloak of Unending Life##8692 |goto Silithus 51.76,39.53 |only Druid
accept Cloak of the Unseen Path##8696 |goto Silithus 51.76,39.53 |only Hunter
accept Drape of Vaulted Secrets##8691 |goto Silithus 51.76,39.53 |only Mage
accept Cape of Eternal Justice##8695 |goto Silithus 51.76,39.53 |only Paladin
accept Shroud of Infinite Wisdom##8689 |goto Silithus 51.76,39.53 |only Priest
accept Cloak of Veiled Shadows##8693 |goto Silithus 51.76,39.53 |only Rogue
accept Cloak of the Gathering Storm##8690 |goto Silithus 51.76,39.53 |only Shaman
accept Shroud of Unspoken Names##8694 |goto Silithus 51.76,39.53 |only Warlock
accept Drape of Unyielding Strength##8557 |goto Silithus 51.76,39.53 |only Warrior
stickystart "Collect_Idols"
stickystart "Collect_First_Scarab_Set"
stickystart "Collect_Second_Scarab_Set"
stickystart "Reach_Revered_Reputation"
step
collect 1 Qiraji Regal Drape##20889 |q 8692/1 |only Druid
collect 1 Qiraji Regal Drape##20889 |q 8696/1 |only Hunter
collect 1 Qiraji Martial Drape##20885 |q 8691/1 |only Mage
collect 1 Qiraji Regal Drape##20889 |q 8695/1 |only Paladin
collect 1 Qiraji Martial Drape##20885 |q 8689/1 |only Priest
collect 1 Qiraji Martial Drape##20885 |q 8693/1 |only Rogue
collect 1 Qiraji Regal Drape##20889 |q 8690/1 |only Shaman
collect 1 Qiraji Regal Drape##20889 |q 8694/1 |only Warlock
collect 1 Qiraji Martial Drape##20885 |q 8557/1 |only Warrior
|tip This has a chance to drop from General Rajaxx, Kurinnaxx, Ayamiss the Hunter, and Buru the Gorger in the Ruins of Ahn'Qiraj raid.
step
label "Collect_Idols"
collect 2 Vermillion Idol##20872 |q 8692/2 |only Druid
collect 2 Lambent Idol##20868 |q 8696/2 |only Hunter
collect 2 Alabaster Idol##20873 |q 8691/2 |only Mage
collect 2 Obsidian Idol##20871 |q 8695/2 |only Paladin
collect 2 Jasper Idol##20870 |q 8689/2 |only Priest
collect 2 Azure Idol##20866 |q 8693/2 |only Rogue
collect 2 Obsidian Idol##20871 |q 8690/2 |only Shaman
collect 2 Amber Idol##20869 |q 8694/2 |only Warlock
collect 2 Onyx Idol##20867 |q 8557/2 |only Warrior
|tip These have a chance to drop from trash mobs and Scarab Coffers in the Ruins of Ahn'Qiraj raid.
step
label "Collect_First_Scarab_Set"
collect 5 Bone Scarab##20864 |q 8692/3 |only Druid
collect 5 Stone Scarab##20858 |q 8696/3 |only Hunter
collect 5 Stone Scarab##20858 |q 8691/3 |only Mage
collect 5 Gold Scarab##20859 |q 8695/3 |only Paladin
collect 5 Gold Scarab##20859 |q 8689/3 |only Priest
collect 5 Bronze Scarab##20861 |q 8693/3 |only Rogue
collect 5 Clay Scarab##20863 |q 8690/3 |only Shaman
collect 5 Bronze Scarab##20861 |q 8694/3 |only Warlock
collect 5 Bone Scarab##20864 |q 8557/3 |only Warrior
|tip These have a chance to drop from trash mobs in the Ruins of Ahn'Qiraj and Temple of Ahn'Qiraj raids.
step
label "Collect_Second_Scarab_Set"
collect 5 Silver Scarab##20860 |q 8692/4 |only Druid
collect 5 Crystal Scarab##20862 |q 8696/4 |only Hunter
collect 5 Crystal Scarab##20862 |q 8691/4 |only Mage
collect 5 Clay Scarab##20863 |q 8695/4 |only Paladin
collect 5 Clay Scarab##20863 |q 8689/4 |only Priest
collect 5 Ivory Scarab##20865 |q 8693/4 |only Rogue
collect 5 Gold Scarab##20859 |q 8690/4 |only Shaman
collect 5 Ivory Scarab##20865 |q 8694/4 |only Warlock
collect 5 Silver Scarab##20860 |q 8557/4 |only Warrior
|tip These have a chance to drop from trash mobs in the Ruins of Ahn'Qiraj and Temple of Ahn'Qiraj raids.
step
label "Reach_Revered_Reputation"
Reach Revered Reputation with the Cenarion Circle |complete rep("Cenarion Circle") >= Revered |or
'|complete completedq(8692,8696,8691,8695,8689,8693,8690,8694,8557) |or
step
talk Keyl Swiftclaw##15500
turnin Cloak of Unending Life##8692 |goto Silithus 51.76,39.53 |only Druid
turnin Cloak of the Unseen Path##8696 |goto Silithus 51.76,39.53 |only Hunter
turnin Drape of Vaulted Secrets##8691 |goto Silithus 51.76,39.53 |only Mage
turnin Cape of Eternal Justice##8695 |goto Silithus 51.76,39.53 |only Paladin
turnin Shroud of Infinite Wisdom##8689 |goto Silithus 51.76,39.53 |only Priest
turnin Cloak of Veiled Shadows##8693 |goto Silithus 51.76,39.53 |only Rogue
turnin Cloak of the Gathering Storm##8690 |goto Silithus 51.76,39.53 |only Shaman
turnin Shroud of Unspoken Names##8694 |goto Silithus 51.76,39.53 |only Warlock
turnin Drape of Unyielding Strength##8557 |goto Silithus 51.76,39.53 |only Warrior
]])
GoatQuest:RegisterGuide("Leveling Guides\\Ahn'Qiraj Gear\\Ruins of Ahn'Qiraj Ring Quest",{
description="This guide will walk you through obtaining the Ruins of Ahn'Qiraj class-specific ring.",
condition_end=function() return completedq(8700,8704,8699,8703,8697,8701,8698,8702,8556) end,
},[[
step
Reach Level 60 |ding 60
|tip Use the leveling guides to accomplish this.
step
talk Windcaller Yessendra##15498
accept Band of Unending Life##8700 |goto Silithus 52.04,38.15 |only Druid
accept Signet of the Unseen Path##8704 |goto Silithus 52.04,38.15 |only Hunter
accept Band of Vaulted Secrets##8699 |goto Silithus 52.04,38.15 |only Mage
accept Ring of Eternal Justice##8703 |goto Silithus 52.04,38.15 |only Paladin
accept Ring of Infinite Wisdom##8697 |goto Silithus 52.04,38.15 |only Priest
accept Band of Veiled Shadows##8701 |goto Silithus 52.04,38.15 |only Rogue
accept Ring of the Gathering Storm##8698 |goto Silithus 52.04,38.15 |only Shaman
accept Ring of Unspoken Names##8702 |goto Silithus 52.04,38.15 |only Warlock
accept Signet of Unyielding Strength##8556 |goto Silithus 52.04,38.15 |only Warrior
stickystart "Collect_Idols"
stickystart "Collect_First_Scarab_Set"
stickystart "Collect_Second_Scarab_Set"
stickystart "Reach_Honored_Reputation"
step
collect 1 Qiraji Magisterial Ring##20884 |q 8700/1 |only Druid
collect 1 Qiraji Ceremonial Ring##20888 |q 8704/1 |only Hunter
collect 1 Qiraji Magisterial Ring##20884 |q 8699/1 |only Mage
collect 1 Qiraji Magisterial Ring##20884 |q 8703/1 |only Paladin
collect 1 Qiraji Ceremonial Ring##20888 |q 8697/1 |only Priest
collect 1 Qiraji Ceremonial Ring##20888 |q 8701/1 |only Rogue
collect 1 Qiraji Magisterial Ring##20884 |q 8698/1 |only Shaman
collect 1 Qiraji Ceremonial Ring##20888 |q 8702/1 |only Warlock
collect 1 Qiraji Magisterial Ring##20884 |q 8556/1 |only Warrior
|tip This has a chance to drop from Ayamiss the Hunter, Buru the Gorger, Moam, General Rajax, Kurinnaxx, and Ossirian the Unscarred in the Ruins of Ahn'Qiraj raid.
step
label "Collect_Idols"
collect 2 Alabaster Idol##20873 |q 8700/2 |only Druid
collect 2 Amber Idol##20869 |q 8704/2 |only Hunter
collect 2 Azure Idol##20866 |q 8699/2 |only Mage
collect 2 Vermillion Idol##20872 |q 8703/2 |only Paladin
collect 2 Obsidian Idol##20871 |q 8697/2 |only Priest
collect 2 Onyx Idol##20867 |q 8701/2 |only Rogue
collect 2 Vermillion Idol##20872 |q 8698/2 |only Shaman
collect 2 Jasper Idol##20870 |q 8702/2 |only Warlock
collect 2 Lambent Idol##20868 |q 8556/2 |only Warrior
|tip These have a chance to drop from trash mobs and Scarab Coffers in the Ruins of Ahn'Qiraj raid.
step
label "Collect_First_Scarab_Set"
collect 5 Bronze Scarab##20861 |q 8700/3 |only Druid
collect 5 Gold Scarab##20859 |q 8704/3 |only Hunter
collect 5 Gold Scarab##20859 |q 8699/3 |only Mage
collect 5 Silver Scarab##20860 |q 8703/3 |only Paladin
collect 5 Silver Scarab##20860 |q 8697/3 |only Priest
collect 5 Stone Scarab##20858 |q 8701/3 |only Rogue
collect 5 Silver Scarab##20860 |q 8698/3 |only Shaman
collect 5 Stone Scarab##20858 |q 8702/3 |only Warlock
collect 5 Bronze Scarab##20861 |q 8556/3 |only Warrior
|tip These have a chance to drop from trash mobs in the Ruins of Ahn'Qiraj and Temple of Ahn'Qiraj raids.
step
label "Collect_Second_Scarab_Set"
collect 5 Ivory Scarab##20865 |q 8700/4 |only Druid
collect 5 Clay Scarab##20863 |q 8704/4 |only Hunter
collect 5 Clay Scarab##20863 |q 8699/4 |only Mage
collect 5 Bone Scarab##20864 |q 8703/4 |only Paladin
collect 5 Bone Scarab##20864 |q 8697/4 |only Priest
collect 5 Crystal Scarab##20862 |q 8701/4 |only Rogue
collect 5 Bronze Scarab##20861 |q 8698/4 |only Shaman
collect 5 Crystal Scarab##20862 |q 8702/4 |only Warlock
collect 5 Ivory Scarab##20865 |q 8556/4 |only Warrior
|tip These have a chance to drop from trash mobs in the Ruins of Ahn'Qiraj and Temple of Ahn'Qiraj raids.
step
label "Reach_Honored_Reputation"
Reach Honored Reputation with the Cenarion Circle |complete rep("Cenarion Circle") >= Honored |or
'|complete completedq(8700,8704,8699,8703,8697,8701,8698,8702,8556) |or
step
talk Windcaller Yessendra##15498
turnin Band of Unending Life##8700 |goto Silithus 52.04,38.15 |only Druid
turnin Signet of the Unseen Path##8704 |goto Silithus 52.04,38.15 |only Hunter
turnin Band of Vaulted Secrets##8699 |goto Silithus 52.04,38.15 |only Mage
turnin Ring of Eternal Justice##8703 |goto Silithus 52.04,38.15 |only Paladin
turnin Ring of Infinite Wisdom##8697 |goto Silithus 52.04,38.15 |only Priest
turnin Band of Veiled Shadows##8701 |goto Silithus 52.04,38.15 |only Rogue
turnin Ring of the Gathering Storm##8698 |goto Silithus 52.04,38.15 |only Shaman
turnin Ring of Unspoken Names##8702 |goto Silithus 52.04,38.15 |only Warlock
turnin Signet of Unyielding Strength##8556 |goto Silithus 52.04,38.15 |only Warrior
]])
GoatQuest:RegisterGuide("Leveling Guides\\Ahn'Qiraj Gear\\Ruins of Ahn'Qiraj Weapon Quest",{
description="This guide will walk you through obtaining the Ruins of Ahn'Qiraj class-specific cloak.",
condition_end=function() return completedq(8708,8712,8707,8711,8705,8709,8706,8710,8558) end,
},[[
step
Reach Level 60 |ding 60
|tip Use the leveling guides to accomplish this.
step
talk Warden Haro##15499
accept Mace of Unending Life##8708 |goto Silithus 51.14,38.95 |only Druid
accept Scythe of the Unseen Path##8712 |goto Silithus 51.14,38.95 |only Hunter
accept Blade of Vaulted Secrets##8707 |goto Silithus 51.14,38.95 |only Mage
accept Blade of Eternal Justice##8711 |goto Silithus 51.14,38.95 |only Paladin
accept Gavel of Infinite Wisdom##8705 |goto Silithus 51.14,38.95 |only Priest
accept Dagger of Veiled Shadows##8709 |goto Silithus 51.14,38.95 |only Rogue
accept Hammer of the Gathering Storm##8706 |goto Silithus 51.14,38.95 |only Shaman
accept Kris of Unspoken Names##8710 |goto Silithus 51.14,38.95 |only Warlock
accept Sickle of Unyielding Strength##8558 |goto Silithus 51.14,38.95 |only Warrior
stickystart "Collect_Idols"
stickystart "Collect_First_Scarab_Set"
stickystart "Collect_Second_Scarab_Set"
stickystart "Reach_Exalted_Reputation"
step
collect 1 Qiraji Ornate Hilt##20890 |q 8708/1 |only Druid
collect 1 Qiraji Spiked Hilt##20886 |q 8712/1 |only Hunter
collect 1 Qiraji Ornate Hilt##20890 |q 8707/1 |only Mage
collect 1 Qiraji Spiked Hilt##20886 |q 8711/1 |only Paladin
collect 1 Qiraji Ornate Hilt##20890 |q 8705/1 |only Priest
collect 1 Qiraji Spiked Hilt##20886 |q 8709/1 |only Rogue
collect 1 Qiraji Spiked Hilt##20886 |q 8706/1 |only Shaman
collect 1 Qiraji Ornate Hilt##20890 |q 8710/1 |only Warlock
collect 1 Qiraji Spiked Hilt##20886 |q 8558/1 |only Warrior
|tip This has a chance to drop from Ayamiss the Hunter, Buru the Gorger, Moam, General Rajax, Kurinnaxx, and Ossirian the Unscarred in the Ruins of Ahn'Qiraj raid.
step
label "Collect_Idols"
collect 2 Jasper Idol##20870 |q 8708/2 |only Druid
collect 2 Azure Idol##20866 |q 8712/2 |only Hunter
collect 2 Obsidian Idol##20871 |q 8707/2 |only Mage
collect 2 Amber Idol##20869 |q 8711/2 |only Paladin
collect 2 Lambent Idol##20868 |q 8705/2 |only Priest
collect 2 Vermillion Idol##20872 |q 8709/2 |only Rogue
collect 2 Amber Idol##20869 |q 8706/2 |only Shaman
collect 2 Onyx Idol##20867 |q 8710/2 |only Warlock
collect 2 Alabaster Idol##20873 |q 8558/2 |only Warrior
|tip These have a chance to drop from trash mobs and Scarab Coffers in the Ruins of Ahn'Qiraj raid.
step
label "Collect_First_Scarab_Set"
collect 5 Crystal Scarab##20862 |q 8708/3 |only Druid
collect 5 Silver Scarab##20860 |q 8712/3 |only Hunter
collect 5 Silver Scarab##20860 |q 8707/3 |only Mage
collect 5 Bronze Scarab##20861 |q 8711/3 |only Paladin
collect 5 Bronze Scarab##20861 |q 8705/3 |only Priest
collect 5 Gold Scarab##20859 |q 8709/3 |only Rogue
collect 5 Bronze Scarab##20861 |q 8706/3 |only Shaman
collect 5 Gold Scarab##20859 |q 8710/3 |only Warlock
collect 5 Crystal Scarab##20862 |q 8558/3 |only Warrior
|tip These have a chance to drop from trash mobs in the Ruins of Ahn'Qiraj and Temple of Ahn'Qiraj raids.
step
label "Collect_Second_Scarab_Set"
collect 5 Stone Scarab##20858 |q 8708/4 |only Druid
collect 5 Bone Scarab##20864 |q 8712/4 |only Hunter
collect 5 Bone Scarab##20864 |q 8707/4 |only Mage
collect 5 Ivory Scarab##20865 |q 8711/4 |only Paladin
collect 5 Ivory Scarab##20865 |q 8705/4 |only Priest
collect 5 Clay Scarab##20863 |q 8709/4 |only Rogue
collect 5 Ivory Scarab##20865 |q 8706/4 |only Shaman
collect 5 Clay Scarab##20863 |q 8710/4 |only Warlock
collect 5 Stone Scarab##20858 |q 8558/4 |only Warrior
|tip These have a chance to drop from trash mobs in the Ruins of Ahn'Qiraj and Temple of Ahn'Qiraj raids.
step
label "Reach_Exalted_Reputation"
Reach Exalted Reputation with the Cenarion Circle |complete rep("Cenarion Circle") >= Exalted |or
'|complete completedq(8708,8712,8707,8711,8705,8709,8706,8710,8558) |or
step
talk Warden Haro##15499
turnin Mace of Unending Life##8708 |goto Silithus 51.14,38.95 |only Druid
turnin Scythe of the Unseen Path##8712 |goto Silithus 51.14,38.95 |only Hunter
turnin Blade of Vaulted Secrets##8707 |goto Silithus 51.14,38.95 |only Mage
turnin Blade of Eternal Justice##8711 |goto Silithus 51.14,38.95 |only Paladin
turnin Gavel of Infinite Wisdom##8705 |goto Silithus 51.14,38.95 |only Priest
turnin Dagger of Veiled Shadows##8709 |goto Silithus 51.14,38.95 |only Rogue
turnin Hammer of the Gathering Storm##8706 |goto Silithus 51.14,38.95 |only Shaman
turnin Kris of Unspoken Names##8710 |goto Silithus 51.14,38.95 |only Warlock
turnin Sickle of Unyielding Strength##8558 |goto Silithus 51.14,38.95 |only Warrior
]])
GoatQuest:RegisterGuide("Leveling Guides\\Ahn'Qiraj Gear\\Temple of Ahn'Qiraj Shoulder Quest",{
description="This guide will walk you through obtaining the Temple of Ahn'Qiraj class-specific shoulders.",
condition_end=function() return completedq(8669,8659,8625,8630,8594,8641,8602,8664,8544) end,
},[[
step
Reach Level 60 |ding 60
|tip Use the leveling guides to accomplish this.
step
talk Andorgos##15502
|tip She is located inside the Temple of Ahn'Qiraj raid.
|tip After killing The Prophet Skeram, run up the stairs and into the left-side alcove inside the temple entrance.
accept Genesis Shoulderpads##8669 |only Druid
accept Striker's Pauldrons##8659 |only Hunter
accept Enigma Shoulderpads##8625 |only Mage
accept Avenger's Pauldrons##8630 |only Paladin
accept Mantle of the Oracle##8594 |only Priest
accept Deathdealer's Spaulders##8641 |only Rogue
accept Stormcaller's Pauldrons##8602 |only Shaman
accept Doomcaller's Mantle##8664 |only Warlock
accept Conqueror's Spaulders##8544 |only Warrior
stickystart "Collect_Idols"
stickystart "Collect_First_Scarab_Set"
stickystart "Collect_Second_Scarab_Set"
stickystart "Reach_Neutral_Reputation"
step
collect 1 Qiraji Bindings of Dominance##20932 |q 8669/1 |only Druid
collect 1 Qiraji Bindings of Command##20928 |q 8659/1 |only Hunter
collect 1 Qiraji Bindings of Dominance##20932 |q 8625/1 |only Mage
collect 1 Qiraji Bindings of Dominance##20932 |q 8630/1 |only Paladin
collect 1 Qiraji Bindings of Command##20928 |q 8594/1 |only Priest
collect 1 Qiraji Bindings of Command##20928 |q 8641/1 |only Rogue
collect 1 Qiraji Bindings of Dominance##20932 |q 8602/1 |only Shaman
collect 1 Qiraji Bindings of Dominance##20932 |q 8664/1 |only Warlock
collect 1 Qiraji Bindings of Command##20928 |q 8544/1 |only Warrior
|tip This has a chance to drop from Princess Huhuran and Viscidus in the Ruins of Ahn'Qiraj raid.
step
label "Collect_Idols"
collect 2 Idol of Strife##20881 |q 8669/2 |only Druid
collect 2 Idol of War##20882 |q 8659/2 |only Hunter
collect 2 Idol of Death##20876 |q 8625/2 |only Mage
collect 2 Idol of Life##20879 |q 8630/2 |only Paladin
collect 2 Idol of Rebirth##20878 |q 8594/2 |only Priest
collect 2 Idol of the Sun##20874 |q 8641/2 |only Rogue
collect 2 Idol of Life##20879 |q 8602/2 |only Shaman
collect 2 Idol of the Sage##20877 |q 8664/2 |only Warlock
collect 2 Idol of Night##20875 |q 8544/2 |only Warrior
|tip These have a chance to drop from trash mobs and Scarab Coffers in the Ruins of Ahn'Qiraj raid.
step
label "Collect_First_Scarab_Set"
collect 5 Gold Scarab##20859 |q 8669/3 |only Druid
collect 5 Crystal Scarab##20862 |q 8659/3 |only Hunter
collect 5 Stone Scarab##20858 |q 8625/3 |only Mage
collect 5 Gold Scarab##20859 |q 8630/3 |only Paladin
collect 5 Silver Scarab##20860 |q 8594/3 |only Priest
collect 5 Silver Scarab##20860 |q 8641/3 |only Rogue
collect 5 Gold Scarab##20859 |q 8602/3 |only Shaman
collect 5 Bronze Scarab##20861 |q 8664/3 |only Warlock
collect 5 Clay Scarab##20863 |q 8544/3 |only Warrior
|tip These have a chance to drop from trash mobs in the Ruins of Ahn'Qiraj and Temple of Ahn'Qiraj raids.
step
label "Collect_Second_Scarab_Set"
collect 5 Bone Scarab##20864 |q 8669/4 |only Druid
collect 5 Ivory Scarab##20865 |q 8659/4 |only Hunter
collect 5 Bronze Scarab##20861 |q 8625/4 |only Mage
collect 5 Crystal Scarab##20862 |q 8630/4 |only Paladin
collect 5 Ivory Scarab##20865 |q 8594/4 |only Priest
collect 5 Clay Scarab##20863 |q 8641/4 |only Rogue
collect 5 Crystal Scarab##20862 |q 8602/4 |only Shaman
collect 5 Bone Scarab##20864 |q 8664/4 |only Warlock
collect 5 Stone Scarab##20858 |q 8544/4 |only Warrior
|tip These have a chance to drop from trash mobs in the Ruins of Ahn'Qiraj and Temple of Ahn'Qiraj raids.
step
label "Reach_Neutral_Reputation"
Reach Neutral Reputation with the Brood of Nozdormu |complete rep("Brood of Nozdormu") >= Neutral |or
'|complete completedq(8669,8659,8625,8630,8594,8641,8602,8664,8544) |or
step
talk Andorgos##15502
|tip She is located inside the Temple of Ahn'Qiraj raid.
|tip After killing The Prophet Skeram, run up the stairs and into the left-side alcove inside the temple entrance.
turnin Genesis Shoulderpads##8669 |only Druid
turnin Striker's Pauldrons##8659 |only Hunter
turnin Enigma Shoulderpads##8625 |only Mage
turnin Avenger's Pauldrons##8630 |only Paladin
turnin Mantle of the Oracle##8594 |only Priest
turnin Deathdealer's Spaulders##8641 |only Rogue
turnin Stormcaller's Pauldrons##8602 |only Shaman
turnin Doomcaller's Mantle##8664 |only Warlock
turnin Conqueror's Spaulders##8544 |only Warrior
]])
GoatQuest:RegisterGuide("Leveling Guides\\Ahn'Qiraj Gear\\Temple of Ahn'Qiraj Boots Quest",{
description="This guide will walk you through obtaining the Temple of Ahn'Qiraj class-specific boots.",
condition_end=function() return completedq(8665,8626,8634,8655,8596,8637,8621,8660,8559) end,
},[[
step
Reach Level 60 |ding 60
|tip Use the leveling guides to accomplish this.
step
talk Kandrostrasz##15503
|tip He is located inside the Temple of Ahn'Qiraj raid.
|tip After killing The Prophet Skeram, run up the stairs and into the left-side alcove inside the temple entrance.
accept Genesis Boots##8665 |only Druid
accept Striker's Footguards##8626 |only Hunter
accept Enigma Boots##8634 |only Mage
accept Avenger's Greaves##8655 |only Paladin
accept Footwraps of the Oracle##8596 |only Priest
accept Deathdealer's Boots##8637 |only Rogue
accept Stormcaller's Footguards##8621 |only Shaman
accept Doomcaller's Footwraps##8660 |only Warlock
accept Conqueror's Greaves##8559 |only Warrior
stickystart "Collect_Idols"
stickystart "Collect_First_Scarab_Set"
stickystart "Collect_Second_Scarab_Set"
stickystart "Reach_Neutral_Reputation"
step
collect 1 Qiraji Bindings of Dominance##20932 |q 8665/1 |only Druid
collect 1 Qiraji Bindings of Command##20928 |q 8626/1 |only Hunter
collect 1 Qiraji Bindings of Dominance##20932 |q 8634/1 |only Mage
collect 1 Qiraji Bindings of Dominance##20932 |q 8655/1 |only Paladin
collect 1 Qiraji Bindings of Command##20928 |q 8596/1 |only Priest
collect 1 Qiraji Bindings of Command##20928 |q 8637/1 |only Rogue
collect 1 Qiraji Bindings of Dominance##20932 |q 8621/1 |only Shaman
collect 1 Qiraji Bindings of Dominance##20932 |q 8660/1 |only Warlock
collect 1 Qiraji Bindings of Command##20928 |q 8559/1 |only Warrior
|tip This has a chance to drop from Princess Huhuran and Viscidus in the Ruins of Ahn'Qiraj raid.
step
label "Collect_Idols"
collect 2 Idol of Rebirth##20878 |q 8665/2 |only Druid
collect 2 Idol of Life##20879 |q 8626/2 |only Hunter
collect 2 Idol of the Sun##20874 |q 8634/2 |only Mage
collect 2 Idol of the Sage##20877 |q 8655/2 |only Paladin
collect 2 Idol of Death##20876 |q 8596/2 |only Priest
collect 2 Idol of Strife##20881 |q 8637/2 |only Rogue
collect 2 Idol of the Sage##20877 |q 8621/2 |only Shaman
collect 2 Idol of Night##20875 |q 8660/2 |only Warlock
collect 2 Idol of War##20882 |q 8559/2 |only Warrior
|tip These have a chance to drop from trash mobs and Scarab Coffers in the Ruins of Ahn'Qiraj raid.
step
label "Collect_First_Scarab_Set"
collect 5 Stone Scarab##20858 |q 8665/3 |only Druid
collect 5 Stone Scarab##20858 |q 8626/3 |only Hunter
collect 5 Silver Scarab##20860 |q 8634/3 |only Mage
collect 5 Bronze Scarab##20861 |q 8655/3 |only Paladin
collect 5 Bronze Scarab##20861 |q 8596/3 |only Priest
collect 5 Crystal Scarab##20862 |q 8637/3 |only Rogue
collect 5 Bronze Scarab##20861 |q 8621/3 |only Shaman
collect 5 Clay Scarab##20863 |q 8660/3 |only Warlock
collect 5 Ivory Scarab##20865 |q 8559/3 |only Warrior
|tip These have a chance to drop from trash mobs in the Ruins of Ahn'Qiraj and Temple of Ahn'Qiraj raids.
step
label "Collect_Second_Scarab_Set"
collect 5 Silver Scarab##20860 |q 8665/4 |only Druid
collect 5 Bone Scarab##20864 |q 8626/4 |only Hunter
collect 5 Crystal Scarab##20862 |q 8634/4 |only Mage
collect 5 Clay Scarab##20863 |q 8655/4 |only Paladin
collect 5 Gold Scarab##20859 |q 8596/4 |only Priest
collect 5 Bone Scarab##20864 |q 8637/4 |only Rogue
collect 5 Clay Scarab##20863 |q 8621/4 |only Shaman
collect 5 Ivory Scarab##20865 |q 8660/4 |only Warlock
collect 5 Gold Scarab##20859 |q 8559/4 |only Warrior
|tip These have a chance to drop from trash mobs in the Ruins of Ahn'Qiraj and Temple of Ahn'Qiraj raids.
step
label "Reach_Neutral_Reputation"
Reach Neutral Reputation with the Brood of Nozdormu |complete rep("Brood of Nozdormu") >= Neutral |or
'|complete completedq(8665,8626,8634,8655,8596,8637,8621,8660,8559) |or
step
talk Kandrostrasz##15503
|tip He is located inside the Temple of Ahn'Qiraj raid.
|tip After killing The Prophet Skeram, run up the stairs and into the left-side alcove inside the temple entrance.
turnin Genesis Boots##8665 |only Druid
turnin Striker's Footguards##8626 |only Hunter
turnin Enigma Boots##8634 |only Mage
turnin Avenger's Greaves##8655 |only Paladin
turnin Footwraps of the Oracle##8596 |only Priest
turnin Deathdealer's Boots##8637 |only Rogue
turnin Stormcaller's Footguards##8621 |only Shaman
turnin Doomcaller's Footwraps##8660 |only Warlock
turnin Conqueror's Greaves##8559 |only Warrior
]])
GoatQuest:RegisterGuide("Leveling Guides\\Ahn'Qiraj Gear\\Temple of Ahn'Qiraj Helm Quest",{
description="This guide will walk you through obtaining the Temple of Ahn'Qiraj class-specific helm.",
condition_end=function() return completedq(8667,8657,8632,8628,8592,8639,8623,8662,8561) end,
},[[
step
Reach Level 60 |ding 60
|tip Use the leveling guides to accomplish this.
step
talk Andorgos##15502
|tip She is located inside the Temple of Ahn'Qiraj raid.
|tip After killing The Prophet Skeram, run up the stairs and into the left-side alcove inside the temple entrance.
accept Genesis Helm##8667 |only Druid
accept Striker's Diadem##8657 |only Hunter
accept Enigma Circlet##8632 |only Mage
accept Avenger's Crown##8628 |only Paladin
accept Tiara of the Oracle##8592 |only Priest
accept Deathdealer's Helm##8639 |only Rogue
accept Stormcaller's Diadem##8623 |only Shaman
accept Doomcaller's Circlet##8662 |only Warlock
accept Conqueror's Crown##8561 |only Warrior
stickystart "Collect_Idols"
stickystart "Collect_First_Scarab_Set"
stickystart "Collect_Second_Scarab_Set"
stickystart "Reach_Friendly_Reputation"
step
collect 1 Vek'lor's Diadem##20930 |q 8667/1 |only Druid
collect 1 Vek'lor's Diadem##20930 |q 8657/1 |only Hunter
collect 1 Vek'nilash's Circlet##20926 |q 8632/1 |only Mage
collect 1 Vek'lor's Diadem##20930 |q 8628/1 |only Paladin
collect 1 Vek'nilash's Circlet##20926 |q 8592/1 |only Priest
collect 1 Vek'lor's Diadem##20930 |q 8639/1 |only Rogue
collect 1 Vek'lor's Diadem##20930 |q 8623/1 |only Shaman
collect 1 Vek'nilash's Circlet##20926 |q 8662/1 |only Warlock
collect 1 Vek'nilash's Circlet##20926 |q 8561/1 |only Warrior
|tip This has a chance to drop from Emperor Vek'lor and Emperor Vek'nilash in the Ruins of Ahn'Qiraj raid.
step
label "Collect_Idols"
collect 2 Idol of Life##20879 |q 8667/2 |only Druid
collect 2 Idol of Strife##20881 |q 8657/2 |only Hunter
collect 2 Idol of Night##20875 |q 8632/2 |only Mage
collect 2 Idol of Rebirth##20878 |q 8628/2 |only Paladin
collect 2 Idol of the Sage##20877 |q 8592/2 |only Priest
collect 2 Idol of War##20882 |q 8639/2 |only Rogue
collect 2 Idol of Rebirth##20878 |q 8623/2 |only Shaman
collect 2 Idol of Death##20876 |q 8662/2 |only Warlock
collect 2 Idol of the Sun##20874 |q 8561/2 |only Warrior
|tip These have a chance to drop from trash mobs and Scarab Coffers in the Ruins of Ahn'Qiraj raid.
step
label "Collect_First_Scarab_Set"
collect 5 Gold Scarab##20859 |q 8667/3 |only Druid
collect 5 Bronze Scarab##20861 |q 8657/3 |only Hunter
collect 5 Bronze Scarab##20861 |q 8632/3 |only Mage
collect 5 Stone Scarab##20858 |q 8628/3 |only Paladin
collect 5 Silver Scarab##20860 |q 8592/3 |only Priest
collect 5 Clay Scarab##20863 |q 8639/3 |only Rogue
collect 5 Stone Scarab##20858 |q 8623/3 |only Shaman
collect 5 Silver Scarab##20860 |q 8662/3 |only Warlock
collect 5 Crystal Scarab##20862 |q 8561/3 |only Warrior
|tip These have a chance to drop from trash mobs in the Ruins of Ahn'Qiraj and Temple of Ahn'Qiraj raids.
step
label "Collect_Second_Scarab_Set"
collect 5 Clay Scarab##20863 |q 8667/4 |only Druid
collect 5 Ivory Scarab##20865 |q 8657/4 |only Hunter
collect 5 Ivory Scarab##20865 |q 8632/4 |only Mage
collect 5 Crystal Scarab##20862 |q 8628/4 |only Paladin
collect 5 Bone Scarab##20864 |q 8592/4 |only Priest
collect 5 Gold Scarab##20859 |q 8639/4 |only Rogue
collect 5 Crystal Scarab##20862 |q 8623/4 |only Shaman
collect 5 Bone Scarab##20864 |q 8662/4 |only Warlock
collect 5 Stone Scarab##20858 |q 8561/4 |only Warrior
|tip These have a chance to drop from trash mobs in the Ruins of Ahn'Qiraj and Temple of Ahn'Qiraj raids.
step
label "Reach_Friendly_Reputation"
Reach Friendly Reputation with the Brood of Nozdormu |complete rep("Brood of Nozdormu") >= Friendly |or
'|complete completedq(8667,8657,8632,8628,8592,8639,8623,8662,8561) |or
step
talk Andorgos##15502
|tip She is located inside the Temple of Ahn'Qiraj raid.
|tip After killing The Prophet Skeram, run up the stairs and into the left-side alcove inside the temple entrance.
turnin Genesis Helm##8667 |only Druid
turnin Striker's Diadem##8657 |only Hunter
turnin Enigma Circlet##8632 |only Mage
turnin Avenger's Crown##8628 |only Paladin
turnin Tiara of the Oracle##8592 |only Priest
turnin Deathdealer's Helm##8639 |only Rogue
turnin Stormcaller's Diadem##8623 |only Shaman
turnin Doomcaller's Circlet##8662 |only Warlock
turnin Conqueror's Crown##8561 |only Warrior
]])
GoatQuest:RegisterGuide("Leveling Guides\\Ahn'Qiraj Gear\\Temple of Ahn'Qiraj Legs Quest",{
description="This guide will walk you through obtaining the Temple of Ahn'Qiraj class-specific legs.",
condition_end=function() return completedq(8668,8658,8631,8629,8593,8640,8624,8663,8560) end,
},[[
step
Reach Level 60 |ding 60
|tip Use the leveling guides to accomplish this.
step
talk Kandrostrasz##15503
|tip He is located inside the Temple of Ahn'Qiraj raid.
|tip After killing The Prophet Skeram, run up the stairs and into the left-side alcove inside the temple entrance.
accept Genesis Trousers##8668 |only Druid
accept Striker's Leggings##8658 |only Hunter
accept Enigma Leggings##8631 |only Mage
accept Avenger's Legguards##8629 |only Paladin
accept Trousers of the Oracle##8593 |only Priest
accept Deathdealer's Leggings##8640 |only Rogue
accept Stormcaller's Leggings##8624 |only Shaman
accept Doomcaller's Trousers##8663 |only Warlock
accept Conqueror's Legguards##8560 |only Warrior
stickystart "Collect_Idols"
stickystart "Collect_First_Scarab_Set"
stickystart "Collect_Second_Scarab_Set"
stickystart "Reach_Friendly_Reputation"
step
collect 1 Skin of the Great Sandworm##20931 |q 8668/1 |only Druid
collect 1 Skin of the Great Sandworm##20931 |q 8658/1 |only Hunter
collect 1 Ouro's Intact Hide##20927 |q 8631/1 |only Mage
collect 1 Skin of the Great Sandworm##20931 |q 8629/1 |only Paladin
collect 1 Ouro's Intact Hide##20927 |q 8593/1 |only Priest
collect 1 Ouro's Intact Hide##20927 |q 8640/1 |only Rogue
collect 1 Skin of the Great Sandworm##20931 |q 8624/1 |only Shaman
collect 1 Skin of the Great Sandworm##20931 |q 8663/1 |only Warlock
collect 1 Ouro's Intact Hide##20927 |q 8560/1 |only Warrior
|tip This has a chance to drop from Ouro in the Ruins of Ahn'Qiraj raid.
step
label "Collect_Idols"
collect 2 Idol of War##20882 |q 8668/2 |only Druid
collect 2 Idol of the Sun##20874 |q 8658/2 |only Hunter
collect 2 Idol of the Sage##20877 |q 8631/2 |only Mage
collect 2 Idol of Strife##20881 |q 8629/2 |only Paladin
collect 2 Idol of Life##20879 |q 8593/2 |only Priest
collect 2 Idol of Night##20875 |q 8640/2 |only Rogue
collect 2 Idol of Strife##20881 |q 8624/2 |only Shaman
collect 2 Idol of Rebirth##20878 |q 8663/2 |only Warlock
collect 2 Idol of Death##20876 |q 8560/2 |only Warrior
|tip These have a chance to drop from trash mobs and Scarab Coffers in the Ruins of Ahn'Qiraj raid.
step
label "Collect_First_Scarab_Set"
collect 5 Stone Scarab##20858 |q 8668/3 |only Druid
collect 5 Silver Scarab##20860 |q 8658/3 |only Hunter
collect 5 Silver Scarab##20860 |q 8631/3 |only Mage
collect 5 Ivory Scarab##20865 |q 8629/3 |only Paladin
collect 5 Gold Scarab##20859 |q 8593/3 |only Priest
collect 5 Stone Scarab##20858 |q 8640/3 |only Rogue
collect 5 Ivory Scarab##20865 |q 8624/3 |only Shaman
collect 5 Gold Scarab##20859 |q 8663/3 |only Warlock
collect 5 Bronze Scarab##20861 |q 8560/3 |only Warrior
|tip These have a chance to drop from trash mobs in the Ruins of Ahn'Qiraj and Temple of Ahn'Qiraj raids.
step
label "Collect_Second_Scarab_Set"
collect 5 Crystal Scarab##20862 |q 8668/4 |only Druid
collect 5 Bone Scarab##20864 |q 8658/4 |only Hunter
collect 5 Bone Scarab##20864 |q 8631/4 |only Mage
collect 5 Bronze Scarab##20861 |q 8629/4 |only Paladin
collect 5 Clay Scarab##20863 |q 8593/4 |only Priest
collect 5 Crystal Scarab##20862 |q 8640/4 |only Rogue
collect 5 Bronze Scarab##20861 |q 8624/4 |only Shaman
collect 5 Clay Scarab##20863 |q 8663/4 |only Warlock
collect 5 Ivory Scarab##20865 |q 8560/4 |only Warrior
|tip These have a chance to drop from trash mobs in the Ruins of Ahn'Qiraj and Temple of Ahn'Qiraj raids.
step
label "Reach_Friendly_Reputation"
Reach Friendly Reputation with the Brood of Nozdormu |complete rep("Brood of Nozdormu") >= Friendly |or
'|complete completedq(8668,8658,8631,8629,8593,8640,8624,8663,8560) |or
step
talk Kandrostrasz##15503
|tip He is located inside the Temple of Ahn'Qiraj raid.
|tip After killing The Prophet Skeram, run up the stairs and into the left-side alcove inside the temple entrance.
turnin Genesis Trousers##8668 |only Druid
turnin Striker's Leggings##8658 |only Hunter
turnin Enigma Leggings##8631 |only Mage
turnin Avenger's Legguards##8629 |only Paladin
turnin Trousers of the Oracle##8593 |only Priest
turnin Deathdealer's Leggings##8640 |only Rogue
turnin Stormcaller's Leggings##8624 |only Shaman
turnin Doomcaller's Trousers##8663 |only Warlock
turnin Conqueror's Legguards##8560 |only Warrior
]])
GoatQuest:RegisterGuide("Leveling Guides\\Ahn'Qiraj Gear\\Temple of Ahn'Qiraj Chest Quest",{
description="This guide will walk you through obtaining the Temple of Ahn'Qiraj class-specific chest.",
condition_end=function() return completedq(8666,8656,8633,8627,8603,8638,8622,8661,8562) end,
},[[
step
Reach Level 60 |ding 60
|tip Use the leveling guides to accomplish this.
step
talk Vethsera##15504
|tip She is located inside the Temple of Ahn'Qiraj raid.
|tip After killing The Prophet Skeram, run up the stairs and into the left-side alcove inside the temple entrance.
accept Genesis Vest##8666 |only Druid
accept Striker's Hauberk##8656 |only Hunter
accept Enigma Robes##8633 |only Mage
accept Avenger's Breastplate##8627 |only Paladin
accept Vestments of the Oracle##8603 |only Priest
accept Deathdealer's Vest##8638 |only Rogue
accept Stormcaller's Hauberk##8622 |only Shaman
accept Doomcaller's Robes##8661 |only Warlock
accept Conqueror's Breastplate##8562 |only Warrior
stickystart "Collect_Idols"
stickystart "Collect_First_Scarab_Set"
stickystart "Collect_Second_Scarab_Set"
stickystart "Reach_Honored_Reputation"
step
collect 1 Husk of the Old God##20933 |q 8666/1 |only Druid
collect 1 Carapace of the Old God##20929 |q 8656/1 |only Hunter
collect 1 Husk of the Old God##20933 |q 8633/1 |only Mage
collect 1 Carapace of the Old God##20929 |q 8627/1 |only Paladin
collect 1 Husk of the Old God##20933 |q 8603/1 |only Priest
collect 1 Carapace of the Old God##20929 |q 8638/1 |only Rogue
collect 1 Carapace of the Old God##20929 |q 8622/1 |only Shaman
collect 1 Husk of the Old God##20933 |q 8661/1 |only Warlock
collect 1 Carapace of the Old God##20929 |q 8562/1 |only Warrior
|tip This has a chance to drop from C'Thun in the Ruins of Ahn'Qiraj raid.
step
label "Collect_Idols"
collect 2 Idol of Rebirth##20878 |q 8666/2 |only Druid
collect 2 Idol of Life##20879 |q 8656/2 |only Hunter
collect 2 Idol of the Sun##20874 |q 8633/2 |only Mage
collect 2 Idol of the Sage##20877 |q 8627/2 |only Paladin
collect 2 Idol of Death##20876 |q 8603/2 |only Priest
collect 2 Idol of Strife##20881 |q 8638/2 |only Rogue
collect 2 Idol of the Sage##20877 |q 8622/2 |only Shaman
collect 2 Idol of Night##20875 |q 8661/2 |only Warlock
collect 2 Idol of War##20882 |q 8562/2 |only Warrior
|tip These have a chance to drop from trash mobs and Scarab Coffers in the Ruins of Ahn'Qiraj raid.
step
label "Collect_First_Scarab_Set"
collect 5 Bronze Scarab##20861 |q 8666/3 |only Druid
collect 5 Gold Scarab##20859 |q 8656/3 |only Hunter
collect 5 Gold Scarab##20859 |q 8633/3 |only Mage
collect 5 Silver Scarab##20860 |q 8627/3 |only Paladin
collect 5 Stone Scarab##20858 |q 8603/3 |only Priest
collect 5 Bronze Scarab##20861 |q 8638/3 |only Rogue
collect 5 Silver Scarab##20860 |q 8622/3 |only Shaman
collect 5 Crystal Scarab##20862 |q 8661/3 |only Warlock
collect 5 Silver Scarab##20860 |q 8562/3 |only Warrior
|tip These have a chance to drop from trash mobs in the Ruins of Ahn'Qiraj and Temple of Ahn'Qiraj raids.
step
label "Collect_Second_Scarab_Set"
collect 5 Ivory Scarab##20865 |q 8666/4 |only Druid
collect 5 Clay Scarab##20863 |q 8656/4 |only Hunter
collect 5 Clay Scarab##20863 |q 8633/4 |only Mage
collect 5 Bone Scarab##20864 |q 8627/4 |only Paladin
collect 5 Crystal Scarab##20862 |q 8603/4 |only Priest
collect 5 Ivory Scarab##20865 |q 8638/4 |only Rogue
collect 5 Bone Scarab##20864 |q 8622/4 |only Shaman
collect 5 Stone Scarab##20858 |q 8661/4 |only Warlock
collect 5 Bone Scarab##20864 |q 8562/4 |only Warrior
|tip These have a chance to drop from trash mobs in the Ruins of Ahn'Qiraj and Temple of Ahn'Qiraj raids.
step
label "Reach_Honored_Reputation"
Reach Honored Reputation with the Brood of Nozdormu |complete rep("Brood of Nozdormu") >= Honored |or
'|complete completedq(8666,8656,8633,8627,8603,8638,8622,8661,8562) |or
step
talk Vethsera##15504
|tip She is located inside the Temple of Ahn'Qiraj raid.
|tip After killing The Prophet Skeram, run up the stairs and into the left-side alcove inside the temple entrance.
accept Genesis Vest##8666 |only Druid
accept Striker's Hauberk##8656 |only Hunter
accept Enigma Robes##8633 |only Mage
accept Avenger's Breastplate##8627 |only Paladin
accept Vestments of the Oracle##8603 |only Priest
accept Deathdealer's Vest##8638 |only Rogue
accept Stormcaller's Hauberk##8622 |only Shaman
accept Doomcaller's Robes##8661 |only Warlock
accept Conqueror's Breastplate##8562 |only Warrior
]])
GoatQuest:RegisterGuide("Leveling Guides\\Scepter of the Shifting Sands",{
description="This guide will walk you through completing the Scepter of the Shifting Sands questline.",
condition_end=function() return completedq(8745) end,
},[[
step
talk Baristolth of the Shifting Sands##15180
accept What Tomorrow Brings##8286 |goto Silithus 49.45,36.45
step
Follow the path |goto Tanaris 61.19,50.58 < 75 |only if walking
Discover the Brood of Nozdormu |q 8286/1 |goto Tanaris 64.24,50.26
step
talk Baristolth of the Shifting Sands##15180
turnin What Tomorrow Brings##8286 |goto Silithus 49.45,36.45
accept Only One May Rise##8288 |goto Silithus 49.45,36.45
step
kill Broodlord Lashlayer##12017
|tip It's the third boss in the Blackwing Lair raid.
|tip You will need a raid group for this.
collect 1 Head of the Broodlord Lashlayer##20383 |q 8288/1
step
talk Baristolth of the Shifting Sands##15180
turnin Only One May Rise##8288 |goto Silithus 49.45,36.45
accept The Path of the Righteous##8301 |goto Silithus 49.45,36.45
stickystart "Reach_Neutral_With_Brood_Of_Nozdormu"
step
Kill Silithid enemies around this area
|tip They look like large bugs.
|tip These enemies are elite and may require a group to kill.
collect 200 Silithid Carapace Fragment##20384 |q 8301/1 |goto Silithus 45.22,26.25
You can find more around:
[25.15,59.22]
[57.64,81.91]
step
talk Baristolth of the Shifting Sands##15180
turnin The Path of the Righteous##8301 |goto Silithus 49.45,36.45
step
label "Accept_The_Hand_of_the_Righteous"
talk Baristolth of the Shifting Sands##15180
accept The Hand of the Righteous##8302 |goto Silithus 49.45,36.45 |or
'|complete rep("Brood of Nozdormu") >= Neutral |or
step
Kill Silithid enemies around this area
|tip They look like large bugs.
|tip These enemies are elite and may require a group to kill.
|tip You will repeat this quest until neutral with the Brood of Nozdormu faction.
|tip This requires around 41,400 carapace fragments, so it's best to find a group.
collect 200 Silithid Carapace Fragment##20384 |q 8302/1 |goto Silithus 45.22,26.25 |or
You can find more around:
[25.15,59.22]
[57.64,81.91]
'|complete rep("Brood of Nozdormu") >= Neutral |or
step
talk Baristolth of the Shifting Sands##15180
turnin The Hand of the Righteous##8302 |goto Silithus 49.45,36.45 |next "Accept_The_Hand_of_the_Righteous" |or
|tip Each time you turn in this quest you will receive a "Proxy of Nozdormu" item.
|tip Target a friend and use the item to deputize them so they can collect carapace fragments as well.
|tip You must use or destroy your previous "Proxy of Nozdormu" before you can complete this quest.
'|complete rep("Brood of Nozdormu") >= Neutral |or
step
label "Reach_Neutral_With_Brood_Of_Nozdormu"
Reach Neutral Reputation with the Brood of Nozdormu |complete rep("Brood of Nozdormu") >= Neutral
step
talk Baristolth of the Shifting Sands##15180
accept Anachronos##8303 |goto Silithus 49.45,36.45
step
talk Anachronos##15192
turnin Anachronos##8303 |goto Tanaris 65.27,50.03
accept Long Forgotten Memories##8305 |goto Tanaris 65.27,50.03
step
click Crystalline Tear
|tip It's a small red crystal on the ground.
turnin Long Forgotten Memories##8305 |goto Silithus 28.67,89.14
accept A Pawn on the Eternal Board##8519 |goto Silithus 28.67,89.14
step
talk Anachronos##15192
turnin A Pawn on the Eternal Board##8519 |goto Tanaris 65.27,50.03
accept The Charge of the Dragonflights##8555 |goto Tanaris 65.27,50.03
step
talk Anachronos##15192
turnin The Charge of the Dragonflights##8555 |goto Tanaris 65.27,50.03
stickystart "Collect_Deeprock_Salt"
stickystart "Collect_Arcanite_Bar"
stickystart "Collect_Elementium_Ore"
stickystart "Collect_Azerothian_Diamond"
stickystart "Collect_Blue_Sapphire"
step
_Collect the Following Items:_
collect 20 Goblin Rocket Fuel##9061 |q 8586 |future
|tip These are required to complete the quest "Dirge's Kickin' Chimaerok Chops." |notinsticky
|tip You can create them with Alchemy or purchase them from the Auction House. |only if not selfmade()
|tip You can create them with Alchemy. |only if selfmade()
|tip Each one requires one Firebloom, one Volatile Rum, and one Leaded Vial to craft.
step
label "Collect_Deeprock_Salt"
_Collect the Following Items:_ |notinsticky
Kill Rock Elemental enemies around this area
collect 20 Deeprock Salt##8150 |goto Badlands 14.16,39.38 |q 8586 |future
|tip You can also purchase these from the Auction House. |only if not selfmade()
|tip These are required to complete the quest "Dirge's Kickin' Chimaerok Chops." |notinsticky
step
label "Collect_Arcanite_Bar"
_Collect the Following Items:_ |notinsticky
collect 20 Arcanite Bar##12360 |q 8728 |future
|tip These are required to complete the quest "The Good News and The Bad News." |notinsticky
|tip You can create them with Alchemy or purchase them from the Auction House. |only if not selfmade()
|tip You can create them with Alchemy. |only if selfmade()
|tip Each one requires one Arcane Crystal and one Thorium Bar to craft.
step
label "Collect_Elementium_Ore"
_Collect the Following Items:_ |notinsticky
kill Blackwing Technician##13996+
|tip These spawn and flee from Vaelastrasz the Corrupt's room in Blackwing Lair.
|tip You must kill them quickly before they flee to safety.
collect 10 Elementium Ore##18562 |q 8728 |future
|tip These are required to complete the quest "The Good News and The Bad News." |notinsticky
|tip You can also purchase these from the Auction House. |only if not selfmade()
step
label "Collect_Azerothian_Diamond"
_Collect the Following Items:_ |notinsticky
collect 10 Azerothian Diamond##12800 |q 8728 |future
|tip These are required to complete the quest "The Good News and The Bad News." |notinsticky
|tip These can be mined from any type of Thorium Vein.
|tip They can also be contained inside Gray Sacks of Gems dropped by Onyxia, Nefarian, and the various World Bosses.
step
label "Collect_Blue_Sapphire"
_Collect the Following Items:_ |notinsticky
collect 10 Blue Sapphire##12361 |q 8728 |future
|tip These are required to complete the quest "The Good News and The Bad News." |notinsticky
|tip These can be mined from any type of Thorium Vein.
|tip They can also be contained inside Gray Sacks of Gems dropped by Onyxia, Nefarian, and the various World Bosses.
step
talk Spirit of Azuregos##15481
|tip He walks all over the area.
|tip You will need to search around.
|tip Make sure you talk to the spirit version.
Select _"How did you know? I mean, yes... Yes I am looking for that shard. Do you have it?"_
collect 1 Magical Ledger##20949 |goto Azshara 55.58,79.77
step
use the Magical Ledger##20949
accept Azuregos's Magical Ledger##8575
step
talk Narain Soothfancy##11811
|tip Inside the building.
turnin Azuregos's Magical Ledger##8575 |goto Tanaris 65.24,18.58
step
talk Narain Soothfancy##11811
|tip Inside the building.
accept Translating the Ledger##8576 |goto Tanaris 65.24,18.58
step
talk Narain Soothfancy##11811
|tip Inside the building.
turnin Translating the Ledger##8576 |goto Tanaris 65.24,18.58
step
talk Narain Soothfancy##11811
|tip Inside the building.
accept Stewvul, Ex-B.F.F.##8577 |goto Tanaris 65.24,18.58
accept Never Ask Me About My Business##8584 |goto Tanaris 65.24,18.58
accept Draconic for Dummies##8597 |goto Tanaris 65.24,18.58
step
talk Meridith the Mermaiden##15526
|tip Underwater.
accept Love Song for Narain##8599 |goto Tanaris 59.43,96.04
step
talk Narain Soothfancy##11811
|tip Inside the building.
turnin Love Song for Narain##8599 |goto Tanaris 65.24,18.58
step
talk Meridith the Mermaiden##15526
|tip Underwater.
Select _"That would be wonderful! Thank you, Merideth."_
Gain the "Siren's Song" Buff |havebuff Siren's Song##25678 |goto Tanaris 59.43,96.04 |q 8597
step
click Freshly Dug Dirt
|tip Quickly swim southeast to the pair of secret islands.
|tip The buff will expire in three minutes.
|tip On the island south of the metal rig.
turnin Draconic for Dummies##8597
accept rAnS0m##8598
step
talk Narain Soothfancy##11811
|tip Inside the building.
turnin rAnS0m##8598 |goto Tanaris 65.24,18.58
accept Decoy!##8606 |goto Tanaris 65.24,18.58
step
talk Dirge Quikcleave##8125
|tip Inside the building.
turnin Never Ask Me About My Business##8584 |goto Tanaris 52.63,28.12
accept The Isle of Dread!##8585 |goto Tanaris 52.63,28.12
stickystart "Kill_Number_Two"
step
Cross the bridge |goto Winterspring 61.24,74.20 < 50 |only if walking
Follow the path |goto Winterspring 63.43,72.69 < 40 |only if walking
Follow the path up |goto Winterspring 66.02,72.69 < 40 |only if walking
use Narain's Special Kit##21042
Open Narain's Special Kit |complete itemcount(21042) == 0 |goto Winterspring 67.55,72.84 |q 8606
step
use Narain's Turban##21039
Transform into Narain Soothfancy |havebuff Narain!##25688 |goto Winterspring 67.55,72.84 |q 8606
step
use the Bag of Gold##21041
Place the Bag of Loot |complete itemcount(21041) == 0 |goto Winterspring 67.55,72.84 |q 8606
|tip Placing the Bag of Loot will summon Number Two.
step
label "Kill_Number_Two"
Watch the dialogue |notinsticky
kill Number Two##15554 |q 8606/1 |goto Winterspring 67.23,72.60
|tip You will need a group of at least three people to kill it.
stickystart "Collect_Chimaerok_Tenderloin"
step
Follow the path up |goto Feralas 34.14,77.78 < 50 |only if walking
kill Lord Lakmaeran##12803
|tip You will need a group for this, preferrably at least ten people.
collect 1 Lakmaeran's Carcass##21027 |q 8585/1 |goto Feralas 29.34,72.63
step
label "Collect_Chimaerok_Tenderloin"
Kill Chimaerok enemies around this area
|tip You will need a group for this, preferrably at least ten people. |notinsticky
collect 20 Chimaerok Tenderloin##21024 |q 8585/2 |goto Feralas 28.51,74.88
step
talk Dirge Quikcleave##8125
|tip Inside the building.
turnin The Isle of Dread!##8585 |goto Tanaris 52.63,28.12
accept Dirge's Kickin' Chimaerok Chops##8586 |goto Tanaris 52.63,28.12
step
talk Narain Soothfancy##11811
|tip Inside the building.
turnin Decoy!##8606 |goto Tanaris 65.24,18.58
accept The Only Prescription##8620 |goto Tanaris 65.24,18.58
step
Enter the building |goto Dustwallow Marsh 77.25,17.41
kill Doctor Weavil##15552
|tip Upstairs inside the building.
|tip You will need a sizeable group to kill him.
collect 1 Draconic for Dummies##21103 |goto Dustwallow Marsh 77.85,17.12 |q 8620
step
kill Onyxia##10184
|tip Inside Onxyia's Lair.
collect 2 Draconic for Dummies##21103 |goto Kalimdor 56.58,71.55 |q 8620
step
Cross the bridge |goto Winterspring 62.43,67.46 < 50 |only if walking
Kill enemies around this area
collect 3 Draconic for Dummies##21103 |goto Winterspring 60.59,78.67 |q 8620
|tip Any elite demon in Darkwhisper Gorge can drop this.
step
click Draconic for Dummies
|tip You will need a group or stealth to survive the opposing faction's city. |only Alliance
collect 8 Draconic for Dummies##21103 |goto Undercity 77.05,38.93 |q 8620
step
click Inconspicuous Crate
turnin Stewvul, Ex-B.F.F.##8577 |goto Silverpine Forest 46.19,86.67
accept Scrying Goggles? No Problem!##8578 |goto Silverpine Forest 46.19,86.67
step
Kill Rock Elemental enemies around this area
collect 20 Deeprock Salt##8150 |q 8586/2 |goto Badlands 14.16,39.38
|tip You can also purchase these from the Auction House. |only if not selfmade()
step
kill Ebonroc##14601
|tip It is the fifth boss of the Blackwing Lair raid.
collect 6 Draconic for Dummies##21103 |q 8620
stickystart "Collect_Draconic_Scrying_Goggles"
step
kill Ragnaros##11502
|tip He is the final boss of the Molten Core raid.
collect 5 Draconic for Dummies##21103 |q 8620
step
label "Collect_Draconic_Scrying_Goggles"
Kill enemies inside Molten Core
collect 1 Narain's Scrying Goggles##20951 |q 8578/1
|tip These goggles have a chance to drop from trash mobs inside the Molten Core raid.
step
Enter Stormwind Keep |goto Stormwind City 69.37,28.39 < 20 |only if walking
click Draconic for Dummies
|tip You will need a group or stealth to survive the opposing faction's city. |only Horde
|tip It's the open book on the corner of the statue.
Choose _<Take this book for the good of Azeroth!>_
collect 7 Draconic for Dummies##21103 |goto Stormwind City 71.97,6.88 |q 8620
step
Watch the dialogue
talk Malfurion Stormrage##15362
|tip Inside the Sunken Temple dungeon.
|tip He will appear in front of Shade of Eranikus when you walk near.
accept Eranikus, Tyrant of the Dream##8733
step
Kill enemies around this area
collect 4 Draconic for Dummies##21103 |goto Blasted Lands 44.40,56.63 |q 8620
|tip Any elite demon in The Tainted Scar can drop this.
step
talk Forest Wisp##15624
turnin Eranikus, Tyrant of the Dream##8733 |goto Teldrassil 37.56,47.93
accept Tyrande and Remulos##8734 |goto Teldrassil 37.56,47.93
step
talk Keeper Remulos##11832
turnin Tyrande and Remulos##8734 |goto Moonglade 36.19,41.81
accept The Nightmare's Corruption##8735 |goto Moonglade 36.19,41.81
step
Follow the path |goto Ashenvale 89.00,41.02 < 50 |only if walking
Kill Emeraldon enemies around this area
|tip You will need a group for this.
collect 1 Fragment of the Nightmare's Corruption##21147 |goto Ashenvale 93.61,39.65 |q 8735/1
step
Kill Jademir enemies around this area
|tip You will need a group for this.
collect 1 Fragment of the Nightmare's Corruption##21148 |goto Feralas 50.70,12.50 |q 8735/3
step
Follow the path up |goto Duskwood 47.36,61.77 < 40 |only if walking
Enter the Twilight Grove |goto Duskwood 46.49,55.22 < 30 |only if walking
kill Twilight Corrupter##15625
|tip You will need a group for this.
collect 1 Fragment of the Nightmare's Corruption##21149 |goto Duskwood 48.98,34.39 |q 8735/2
step
Cross the bridge |goto The Hinterlands 60.64,38.41 < 20 |only if walking
Kill Verdantine enemies around this area
|tip You will need a group for this.
collect 1 Fragment of the Nightmare's Corruption##21146 |goto The Hinterlands 62.91,30.32 |q 8735/4
step
talk Keeper Remulos##11832
turnin The Nightmare's Corruption##8735 |goto Moonglade 36.19,41.81
accept The Nightmare Manifests##8736 |goto Moonglade 36.19,41.81
step
Defend Nighthaven from Eranikus |q 8736/1 |goto Moonglade 48.04,34.31
|tip You will need a raid to accomplish this.
|tip You cannot let Keeper Remulos die or kill Eranikus.
step
talk Keeper Remulos##11832
turnin The Nightmare Manifests##8736 |goto Moonglade 36.19,41.81
accept The Champion Returns##8741 |goto Moonglade 36.19,41.81
step
collect 20 Goblin Rocket Fuel##9061 |q 8586/1
|tip You can create them with Alchemy or purchase them from the Auction House. |only if not selfmade()
|tip You can create them with Alchemy. |only if selfmade()
|tip Each one requires one Firebloom, one Volatile Rum, and one Leaded Vial to craft.
step
talk Dirge Quikcleave##8125
|tip Inside the building.
turnin Dirge's Kickin' Chimaerok Chops##8586 |goto Tanaris 52.63,28.12
accept Return to Narain##8587 |goto Tanaris 52.63,28.12
step
use the Magical Book Binding##21112
collect 1 Draconic For Dummies: Volume II##21111 |q 8620/1
step
talk Narain Soothfancy##11811
|tip Inside the building.
turnin Scrying Goggles? No Problem!##8578 |goto Tanaris 65.24,18.58
turnin Return to Narain##8587 |goto Tanaris 65.24,18.58
turnin The Only Prescription##8620 |goto Tanaris 65.24,18.58
step
talk Anachronos##15192
turnin The Champion Returns##8741 |goto Tanaris 65.27,50.03
step
talk Vaelastrasz the Corrupt##13020
|tip The second boss inside the Blackwing Lair raid.
accept Nefarius's Corruption##8730
|tip You will only have five hours to kill Nefarian, collect the Red Scepter Shard, and turn in this quest.
step
kill Nefarian##11583
|tip He is the final boss inside the Blackwing Lair raid.
|tip You must kill him and turn in this quest within the five hour time limit.
collect 1 Red Scepter Shard##21138
|tip Only one person in the raid can loot this item per reset.
step
talk Anachronos##15192
turnin Nefarius's Corruption##8730 |goto Tanaris 65.27,50.03
|tip You must turn in this quest within the five hour time limit.
step
talk Narain Soothfancy##11811
|tip Inside the building.
accept The Good News and The Bad News##8728 |goto Tanaris 65.24,18.58
stickystart "Collect_Elementium_Ores"
stickystart "Collect_Azerothian_Diamonds"
stickystart "Collect_Blue_Sapphires"
step
_Collect the Following Items:_ |notinsticky
collect 20 Arcanite Bar##12360 |q 8728/1
|tip These are required to complete the quest "The Good News and The Bad News." |notinsticky
|tip You can create them with Alchemy or purchase them from the Auction House. |only if not selfmade()
|tip You can create them with Alchemy. |only if selfmade()
|tip Each one requires one Arcane Crystal and one Thorium Bar to craft.
step
label "Collect_Elementium_Ores"
_Collect the Following Items:_ |notinsticky
kill Blackwing Technician##13996+
|tip These spawn and flee from Vaelastrasz the Corrupt's room in Blackwing Lair.
|tip You must kill them quickly before they flee to safety.
collect 10 Elementium Ore##18562 |q 8728/2
|tip These are required to complete the quest "The Good News and The Bad News." |notinsticky
|tip You can also purchase these from the Auction House. |only if not selfmade()
step
label "Collect_Azerothian_Diamonds"
_Collect the Following Items:_ |notinsticky
collect 10 Azerothian Diamond##12800 |q 8728/3
|tip These are required to complete the quest "The Good News and The Bad News." |notinsticky
|tip These can be mined from any type of Thorium Vein.
|tip They can also be contained inside Gray Sacks of Gems dropped by Onyxia, Nefarian, and the various World Bosses.
step
label "Collect_Blue_Sapphires"
_Collect the Following Items:_ |notinsticky
collect 10 Blue Sapphire##12361 |q 8728/4
|tip These are required to complete the quest "The Good News and The Bad News." |notinsticky
|tip These can be mined from any type of Thorium Vein.
|tip They can also be contained inside Gray Sacks of Gems dropped by Onyxia, Nefarian, and the various World Bosses.
step
talk Narain Soothfancy##11811
|tip Inside the building.
turnin The Good News and The Bad News##8728 |goto Tanaris 65.24,18.58
accept The Wrath of Neptulon##8729 |goto Tanaris 65.24,18.58
step
use the Arcanite Buoy##21136
kill Maws##15571
|tip Using the buoy will summon it.
|tip You will need a raid to defeat it.
collect 1 Blue Scepter Shard##21137 |goto Azshara 65.88,54.05
step
talk Anachronos##15192
turnin The Wrath of Neptulon##8729 |goto Tanaris 65.27,50.03
step
talk Anachronos##15192
accept The Might of Kalimdor##8742 |goto Tanaris 65.27,50.03
step
click The Scarab Gong##180717
accept Bang a Gong!##8743 |goto Silithus 25.71,90.86
step
click The Scarab Gong##180717
turnin Bang a Gong!##8743 |goto Silithus 25.71,90.86
step
talk Jonathan the Revelator##15693
accept Treasure of the Timeless One##8745 |goto Silithus 25.94,90.96
]])
GoatQuest:RegisterGuide("Leveling Guides\\Ahn'Qiraj Gear\\Signet Ring of the Bronze Dragonflight",{
description="This guide will walk you through acquiring and upgrading a Signet Ring of the Bronze Dragonflight.",
condition_end=function() return completedq(8761,8751,8756,8765,8764,8766) end,
},[[
step
Reach Neutral Reputation with the Brood of Nozdormu |complete rep("Brood of Nozdormu") >= Neutral |or
|tip Killing trash and bosses inside the "Temple of Ahn'Qiraj" and "Ruins of Ahn'Qiraj" raids grants reputation.
|tip Completing the repeatable quest "The Hand of the Righteous" in Cenarion Hold also grants reputation.
|tip You can gain reputation by completing Ahn'Qiraj raid quests and the Scepter of the Shifting Sands questline too.
'|complete completedq(8757,8747,8752) |or
step
_Choose a path:_
|tip Accepting one of these quests will lock you into that questline until you complete it.
|tip You can switch to a different ring after you complete your first questline.
talk Anachronos##15192
accept The Path of the Invoker##8757 |goto Tanaris 65.27,50.03 |noautoaccept |or
|tip This quest grants an intellect-based caster ring.
accept The Path of the Protector##8747 |goto Tanaris 65.27,50.03 |noautoaccept |or
|tip This quest grants a strength-based defensive ring.
accept The Path of the Conqueror##8752 |goto Tanaris 65.27,50.03 |noautoaccept |or
|tip This quest grants an agility-based offensive ring.
step
Reach Friendly Reputation with the Brood of Nozdormu |complete rep("Brood of Nozdormu") >= Friendly |or
|tip Killing trash and bosses inside the "Temple of Ahn'Qiraj" and "Ruins of Ahn'Qiraj" raids grants reputation.
|tip Completing the repeatable quest "The Hand of the Righteous" in Cenarion Hold also grants reputation.
|tip You can gain reputation by completing Ahn'Qiraj raid quests and the Scepter of the Shifting Sands questline too.
'|complete completedq(8758,8748,8753) |or
step
talk Anachronos##15192
accept The Path of the Invoker##8758 |goto Tanaris 65.27,50.03 |only if completedq(8757)
accept The Path of the Protector##8748 |goto Tanaris 65.27,50.03 |only if completedq(8747)
accept The Path of the Conqueror##8753 |goto Tanaris 65.27,50.03 |only if completedq(8752)
step
Reach Honored Reputation with the Brood of Nozdormu |complete rep("Brood of Nozdormu") >= Honored |or
|tip Killing trash and bosses inside the "Temple of Ahn'Qiraj" and "Ruins of Ahn'Qiraj" raids grants reputation.
|tip Completing the repeatable quest "The Hand of the Righteous" in Cenarion Hold also grants reputation.
|tip You can gain reputation by completing Ahn'Qiraj raid quests and the Scepter of the Shifting Sands questline too.
'|complete completedq(8759,8749,8754) |or
step
talk Anachronos##15192
accept The Path of the Invoker##8759 |goto Tanaris 65.27,50.03 |only if completedq(8757)
accept The Path of the Protector##8749 |goto Tanaris 65.27,50.03 |only if completedq(8747)
accept The Path of the Conqueror##8754 |goto Tanaris 65.27,50.03 |only if completedq(8752)
step
Reach Revered Reputation with the Brood of Nozdormu |complete rep("Brood of Nozdormu") >= Revered |or
|tip Killing trash and bosses inside the "Temple of Ahn'Qiraj" and "Ruins of Ahn'Qiraj" raids grants reputation.
|tip Completing the repeatable quest "The Hand of the Righteous" in Cenarion Hold also grants reputation.
|tip You can gain reputation by completing Ahn'Qiraj raid quests and the Scepter of the Shifting Sands questline too.
'|complete completedq(8760,8750,8755) |or
step
talk Anachronos##15192
accept The Path of the Invoker##8760 |goto Tanaris 65.27,50.03 |only if completedq(8757)
accept The Path of the Protector##8750 |goto Tanaris 65.27,50.03 |only if completedq(8747)
accept The Path of the Conqueror##8755 |goto Tanaris 65.27,50.03 |only if completedq(8752)
step
Reach Exalted Reputation with the Brood of Nozdormu |complete rep("Brood of Nozdormu") >= Exalted |or
|tip Killing trash and bosses inside the "Temple of Ahn'Qiraj" and "Ruins of Ahn'Qiraj" raids grants reputation.
|tip Completing the repeatable quest "The Hand of the Righteous" in Cenarion Hold also grants reputation.
|tip You can gain reputation by completing Ahn'Qiraj raid quests and the Scepter of the Shifting Sands questline too.
'|complete completedq(8761,8751,8756) |or
step
talk Anachronos##15192
accept The Grand Invoker##8761 |goto Tanaris 65.27,50.03 |only if completedq(8757)
accept The Protector of Kalimdor##8751 |goto Tanaris 65.27,50.03 |only if completedq(8747)
accept The Qiraji Conqueror##8756 |goto Tanaris 65.27,50.03 |only if completedq(8752)
step
Click Here to Change Paths |confirm
|tip You will need to provide 15 Bronze Scarabs, 15 Crystal Scarabs, and 15 Clay Scarabs in addition to your ring. |only if completedq(8761)
|tip You will need to provide 15 Stone Scarabs, 15 Gold Scarabs, and 15 Silver Scarabs in addition to your ring. |only if completedq(8751)
|tip You will need to provide 15 Bone Scarabs, 15 Ivory Scarabs, and 15 Stone Scarabs in addition to your ring. |only if completedq(8756)
stickystart "Collect_Crystal_Scarabs"
stickystart "Collect_Clay_Scarabs"
stickystart "Collect_Stone_Scarabs_8764"
stickystart "Collect_Gold_Scarabs"
stickystart "Collect_Silver_Scarabs"
stickystart "Collect_Bone_Scarabs"
stickystart "Collect_Ivory_Scarabs"
stickystart "Collect_Stone_Scarabs_8766"
step
collect 15 Bronze Scarab##20861 |q 8765 |future
step
label "Collect_Crystal_Scarabs"
collect 15 Crystal Scarab##20862 |q 8765 |future
step
label "Collect_Clay_Scarabs"
collect 15 Clay Scarab##20863 |q 8765 |future
step
label "Collect_Stone_Scarabs_8764"
collect 15 Stone Scarab##20858 |q 8764 |future
step
label "Collect_Gold_Scarabs"
collect 15 Gold Scarab##20859 |q 8764 |future
step
label "Collect_Silver_Scarabs"
collect 15 Silver Scarab##20860 |q 8764 |future
step
label "Collect_Bone_Scarabs"
collect 15 Bone Scarab##20864 |q 8766 |future
step
label "Collect_Ivory_Scarabs"
collect 15 Ivory Scarab##20865 |q 8766 |future
step
label "Collect_Stone_Scarabs_8766"
collect 15 Stone Scarab##20858 |q 8766 |future
step
talk Anachronos##15192
accept The Changing of Paths - Invoker No More##8765 |only if completedq(8761)
accept The Changing of Paths - Protector No More##8764 |only if completedq(8751)
accept The Changing of Paths - Conqueror No More##8766 |only if completedq(8756)
]])
GoatQuest:RegisterGuide("Leveling Guides\\Ahn'Qiraj Gear\\Cenarion Battlegear",{
description="This guide will walk you through acquiring and the four pieces of Cenarion Battlegear.",
condition_end=function() return completedq(8548,8572,8573,8574) end,
},[[
step
talk Windcaller Kaldon##15540
accept Cenarion Battlegear##8800 |goto Silithus 49.98,36.36
step
talk Vargus##15176
turnin Cenarion Battlegear##8800 |goto Silithus 51.22,38.85
step
talk Vargus##15176
accept Volunteer's Battlegear##8548 |goto Silithus 51.22,38.85
stickystart "Collect_Cenarion_Logistics_Badge_8548"
stickystart "Collect_Cenarion_Tactical_Badge_8548"
stickystart "Reach_Friendly_Reputation"
step
collect 5 Cenarion Combat Badge##20802 |q 8548/1
|tip Use the "Cenarion Field Duty Combat Assignments" leveling guide to collect these.
step
label "Collect_Cenarion_Logistics_Badge_8548"
collect 3 Cenarion Logistics Badge##20800 |q 8548/2
|tip Use the "Cenarion Field Duty Logistics Assignments" leveling guide to collect these.
step
label "Collect_Cenarion_Tactical_Badge_8548"
collect 7 Cenarion Tactical Badge##20801 |q 8548/3
|tip Use the "Cenarion Field Duty Tactical Assignments" leveling guide to collect these.
step
label "Reach_Friendly_Reputation"
Reach Friendly Reputation with the Cenarion Circle |complete rep("Cenarion Circle") >= Friendly
|tip Killing Twilight enemies in Silithus grants 1 reputation each until Honored.
|tip Killing Twilight Flamereavers in Silithus grants 1 reputation each until Revered.
|tip Killing mobs and bosses in the "Ruins of Ahn'Qiraj" and "Temple of Ahn'Qiraj" raids grants various levels of reputation until Exalted.
|tip Completing the repeatable quests "Field Duty" and "Encrypted Twilight Texts" in Cenarion Hold also grants reputation.
step
talk Vargus##15176
turnin Volunteer's Battlegear##8548 |goto Silithus 51.22,38.85
step
talk Vargus##15176
accept Veteran's Battlegear##8572 |goto Silithus 51.22,38.85
stickystart "Collect_Cenarion_Logistics_Badge_8572"
stickystart "Collect_Cenarion_Tactical_Badge_8572"
stickystart "Reach_Honored_Reputation"
step
collect 7 Cenarion Combat Badge##20802 |q 8572/1
|tip Use the "Cenarion Field Duty Combat Assignments" leveling guide to collect these.
step
label "Collect_Cenarion_Logistics_Badge_8572"
collect 4 Cenarion Logistics Badge##20800 |q 8572/2
|tip Use the "Cenarion Field Duty Logistics Assignments" leveling guide to collect these.
step
label "Collect_Cenarion_Tactical_Badge_8572"
collect 4 Cenarion Tactical Badge##20801 |q 8572/3
|tip Use the "Cenarion Field Duty Tactical Assignments" leveling guide to collect these.
step
label "Reach_Honored_Reputation"
Reach Honored Reputation with the Cenarion Circle |complete rep("Cenarion Circle") >= Honored
|tip Killing Twilight enemies in Silithus grants 1 reputation each until Honored.
|tip Killing Twilight Flamereavers in Silithus grants 1 reputation each until Revered.
|tip Killing mobs and bosses in the "Ruins of Ahn'Qiraj" and "Temple of Ahn'Qiraj" raids grants various levels of reputation until Exalted.
|tip Completing the repeatable quests "Field Duty" and "Encrypted Twilight Texts" in Cenarion Hold also grants reputation.
step
talk Vargus##15176
turnin Veteran's Battlegear##8572 |goto Silithus 51.22,38.85
step
talk Vargus##15176
accept Champion's Battlegear##8573 |goto Silithus 51.22,38.85
stickystart "Collect_Cenarion_Logistics_Badge_8573"
stickystart "Collect_Cenarion_Tactical_Badge_8573"
stickystart "Collect_Mark_of_Cenarius_8573"
stickystart "Reach_Honored_Reputation"
step
collect 15 Cenarion Combat Badge##20802 |q 8573/1
|tip Use the "Cenarion Field Duty Combat Assignments" leveling guide to collect these.
step
label "Collect_Cenarion_Logistics_Badge_8573"
collect 20 Cenarion Logistics Badge##20800 |q 8573/2
|tip Use the "Cenarion Field Duty Logistics Assignments" leveling guide to collect these.
step
label "Collect_Cenarion_Tactical_Badge_8573"
collect 20 Cenarion Tactical Badge##20801 |q 8573/3
|tip Use the "Cenarion Field Duty Tactical Assignments" leveling guide to collect these.
step
label "Collect_Mark_of_Cenarius_8573"
collect 1 Mark of Cenarius##21508 |q 8573/4
|tip Use the "Cenarion Field Duty Tactical Assignments" leveling guide to collect these.
|tip This item is a reward exclusive to the followup tactical assignment quest "The Four Dukes."
step
label "Reach_Revered_Reputation"
Reach Revered Reputation with the Cenarion Circle |complete rep("Cenarion Circle") >= Revered
|tip Killing Twilight enemies in Silithus grants 1 reputation each until Honored.
|tip Killing Twilight Flamereavers in Silithus grants 1 reputation each until Revered.
|tip Killing mobs and bosses in the "Ruins of Ahn'Qiraj" and "Temple of Ahn'Qiraj" raids grants various levels of reputation until Exalted.
|tip Completing the repeatable quests "Field Duty" and "Encrypted Twilight Texts" in Cenarion Hold also grants reputation.
step
talk Vargus##15176
turnin Champion's Battlegear##8573 |goto Silithus 51.22,38.85
step
talk Vargus##15176
accept Stalwart's Battlegear##8574 |goto Silithus 51.22,38.85
stickystart "Collect_Cenarion_Logistics_Badge_8574"
stickystart "Collect_Cenarion_Tactical_Badge_8574"
stickystart "Collect_Mark_of_Remulos_8574"
stickystart "Reach_Honored_Reputation"
step
collect 15 Cenarion Combat Badge##20802 |q 8574/1
|tip Use the "Cenarion Field Duty Combat Assignments" leveling guide to collect these.
step
label "Collect_Cenarion_Logistics_Badge_8574"
collect 20 Cenarion Logistics Badge##20800 |q 8574/2
|tip Use the "Cenarion Field Duty Logistics Assignments" leveling guide to collect these.
step
label "Collect_Cenarion_Tactical_Badge_8574"
collect 17 Cenarion Tactical Badge##20801 |q 8574/3
|tip Use the "Cenarion Field Duty Tactical Assignments" leveling guide to collect these.
step
label "Collect_Mark_of_Remulos_8574"
collect 1 Mark of Remulos##21515 |q 8574/4
|tip Use the "Cenarion Field Duty Logistics Assignments" leveling guide to collect these.
|tip This item is a reward exclusive to the followup logistics assignment quest "The Ultimate Deception."
step
label "Reach_Exalted_Reputation"
Reach Exalted Reputation with the Cenarion Circle |complete rep("Cenarion Circle") >= Exalted
|tip Killing Twilight enemies in Silithus grants 1 reputation each until Honored.
|tip Killing Twilight Flamereavers in Silithus grants 1 reputation each until Revered.
|tip Killing mobs and bosses in the "Ruins of Ahn'Qiraj" and "Temple of Ahn'Qiraj" raids grants various levels of reputation until Exalted.
|tip Completing the repeatable quests "Field Duty" and "Encrypted Twilight Texts" in Cenarion Hold also grants reputation.
step
talk Vargus##15176
turnin Stalwart's Battlegear##8574 |goto Silithus 51.22,38.85
]])
GoatQuest:RegisterGuide("Leveling Guides\\Cenarion Field Duty Combat Assignments",{
description="This guide will walk you through completing various combat assignments for the Cenarion Circle.",
},[[
step
label "Accept_Field_Duty"
talk Windcaller Kaldon##15540
accept Field Duty##8507 |goto Silithus 49.98,36.34
step
use the Unsigned Field Duty Papers##21143
collect 1 Prepared Field Duty Papers##23024 |q 8507
step
talk Captain Blackanvil##15440
accept Field Duty Papers##8508 |goto Silithus 32.96,52.08
step
collect 1 Signed Field Duty Papers##20810 |q 8507/1
step
talk Windcaller Kaldon##15540
|tip Choose a combat assignment.
|tip Combat Assignments require you to kill various elite silithid in Silithus hives.
turnin Field Duty##8507 |goto Silithus 49.98,36.34
step
label "Begin_Combat_Assignment"
use the Combat Assignment##20808
Open the Combat Assignment |complete itemcount(20808) == 0
step
use the Hive'Zora Dossier##22650 |only if itemcount(22650) >= 0
use the Hive'Ashi Dossier##22648 |only if itemcount(22648) >= 0
use the Hive'Regal Dossier##22649 |only if itemcount(22649) >= 0
Open the Dossier |complete itemcount(22650) == 0 and itemcount(22648) == 0 and itemcount(22649) == 0
step
use the Combat Task Briefing I##21749
accept Target: Hive'Ashi Defenders##8770
|only if itemcount(21749) >= 1 or haveq(8770)
step
use the Combat Task Briefing II##21750
accept Target: Hive'Ashi Sandstalkers##8771
|only if itemcount(21750) >= 1 or haveq(8771)
step
use the Combat Task Briefing III##20942
accept Target: Hive'Ashi Workers##8502
|only if itemcount(20942) >= 1 or haveq(8502)
step
use the Combat Task Briefing IV##21248
accept Target: Hive'Zora Reavers##8773
|only if itemcount(21248) >= 1 or haveq(8773)
step
use the Combat Task Briefing V##21249
accept Target: Hive'Zora Hive Sisters##8539
|only if itemcount(21249) >= 1 or haveq(8539)
step
use the Combat Task Briefing VI##21250
accept Target: Hive'Zora Waywatchers##8772
|only if itemcount(21250) >= 1 or haveq(8772)
step
use the Combat Task Briefing VII##21251
accept Target: Hive'Zora Tunnelers##8687
|only if itemcount(21251) >= 1 or haveq(8687)
step
use the Combat Task Briefing VIII##21252
accept Target: Hive'Regal Ambushers##8774
|only if itemcount(21252) >= 1 or haveq(8774)
step
use the Combat Task Briefing IX##21253
accept Target: Hive'Regal Spitfires##8775
|only if itemcount(21253) >= 1 or haveq(8775)
step
use the Combat Task Briefing X##21255
accept Target: Hive'Regal Slavemakers##8776
|only if itemcount(21255) >= 1 or haveq(8776)
step
use the Combat Task Briefing XI##21256
accept Target: Hive'Regal Burrowers##8777
|only if itemcount(21256) >= 1 or haveq(8777)
step
use the Combat Task Briefing XII##20941
accept Target: Hive'Ashi Stingers##8501
|only if itemcount(20941) >= 1 or haveq(8501)
stickystart "Kill_30_Hive'Ashi_Sandstalkers"
stickystart "Kill_30_Hive'Ashi_Workers"
stickystart "Kill_30_Hive'Zora_Reavers"
stickystart "Kill_30_Hive'Zora_Hive_Sisters"
stickystart "Kill_30_Hive'Zora_Waywatchers"
stickystart "Kill_30_Hive'Zora_Tunnelers"
stickystart "Kill_30_Hive'Regal_Ambushers"
stickystart "Kill_30_Hive'Regal_Spitfires"
stickystart "Kill_30_Hive'Regal_Slavemakers"
stickystart "Kill_30_Hive'Regal_Burrowers"
stickystart "Kill_30_Hive'Ashi_Stingers"
step
kill 30 Hive'Ashi Defender##11722 |q 8770/1 |goto Silithus 45.06,25.78
|tip These enemies are elite and may require a group to kill.
|only if haveq(8770)
step
label "Kill_30_Hive'Ashi_Sandstalkers"
kill 30 Hive'Ashi Sandstalker##11723 |q 8771/1  |goto Silithus 45.06,25.78
|tip These enemies are elite and may require a group to kill. |notinsticky
|tip They are stealthed all over the hive.
|only if haveq(8771)
step
label "Kill_30_Hive'Ashi_Workers"
kill 30 Hive'Ashi Worker##11721 |q 8502/1 |goto Silithus 45.06,25.78
|tip These enemies are elite and may require a group to kill. |notinsticky
|only if haveq(8502)
step
label "Kill_30_Hive'Zora_Reavers"
kill 30 Hive'Zora Reaver##11728 |q 8773/1 |goto Silithus 25.15,59.72
|tip These enemies are elite and may require a group to kill. |notinsticky
|only if haveq(8773)
step
label "Kill_30_Hive'Zora_Hive_Sisters"
kill 30 Hive'Zora Hive Sister##11729 |q 8539/1 |goto Silithus 25.15,59.72
|tip These enemies are elite and may require a group to kill. |notinsticky
|only if haveq(8539)
step
label "Kill_30_Hive'Zora_Waywatchers"
kill 30 Hive'Zora Waywatcher##11725 |q 8772/1 |goto Silithus 25.15,59.72
|tip These enemies are elite and may require a group to kill. |notinsticky
|only if haveq(8772)
step
label "Kill_30_Hive'Zora_Tunnelers"
kill 30 Hive'Zora Tunneler##11726 |q 8687/1 |goto Silithus 25.20,55.37
|tip These enemies are elite and may require a group to kill. |notinsticky
|tip They only spawn inside the hive.
|only if haveq(8687)
step
label "Kill_30_Hive'Regal_Ambushers"
kill 30 Hive'Regal Ambusher##11730 |q 8774/1 |goto Silithus 57.57,80.69
|tip These enemies are elite and may require a group to kill. |notinsticky
|tip They are stealthed all over the hive.
|only if haveq(8774)
step
label "Kill_30_Hive'Regal_Spitfires"
kill 30 Hive'Regal Spitfire##11732 |q 8775/1 |goto Silithus 57.57,80.69
|tip These enemies are elite and may require a group to kill. |notinsticky
|only if haveq(8775)
step
label "Kill_30_Hive'Regal_Slavemakers"
kill 30 Hive'Regal Slavemaker##11733 |q 8776/1 |goto Silithus 57.57,80.69
|tip These enemies are elite and may require a group to kill. |notinsticky
|only if haveq(8776)
step
label "Kill_30_Hive'Regal_Burrowers"
kill 30 Hive'Regal Burrower##11731 |q 8777/1 |goto Silithus 62.05,80.40
|tip These enemies are elite and may require a group to kill. |notinsticky
|tip They only spawn inside the hive.
|only if haveq(8777)
step
label "Kill_30_Hive'Ashi_Stingers"
kill 30 Hive'Ashi Stinger##11698 |q 8501/1 |goto Silithus 47.91,26.31
|tip These enemies are elite and may require a group to kill. |notinsticky
|tip They only spawn inside the hive.
|only if haveq(8501)
step
talk Commander Mar'alith##15181
turnin Target: Hive'Ashi Defenders##8770 |goto Silithus 49.20,34.19 |only if haveq(8770)
turnin Target: Hive'Ashi Sandstalkers##8771 |goto Silithus 49.20,34.19 |only if haveq(8771)
turnin Target: Hive'Ashi Workers##8502 |goto Silithus 49.20,34.19 |only if haveq(8502)
turnin Target: Hive'Zora Reavers##8773 |goto Silithus 49.20,34.19 |only if haveq(8773)
turnin Target: Hive'Zora Hive Sisters##8539 |goto Silithus 49.20,34.19 |only if haveq(8539)
turnin Target: Hive'Zora Waywatchers##8772 |goto Silithus 49.20,34.19 |only if haveq(8772)
turnin Target: Hive'Zora Tunnelers##8687 |goto Silithus 49.20,34.19 |only if haveq(8687)
turnin Target: Hive'Regal Ambushers##8774 |goto Silithus 49.20,34.19 |only if haveq(8774)
turnin Target: Hive'Regal Spitfires##8775 |goto Silithus 49.20,34.19 |only if haveq(8775)
turnin Target: Hive'Regal Slavemakers##8776 |goto Silithus 49.20,34.19 |only if haveq(8776)
turnin Target: Hive'Regal Burrowers##8777 |goto Silithus 49.20,34.19 |only if haveq(8777)
turnin Target: Hive'Ashi Stingers##8501 |goto Silithus 49.20,34.19 |only if haveq(8501)
'|complete not haveq(8770,8771,8502,8773,8539,8772,8687,8774,8775,8776,8777,8501) |next "Accept_Field_Duty"
]])
GoatQuest:RegisterGuide("Leveling Guides\\Cenarion Field Duty Tactical Assignments",{
description="This guide will walk you through completing various tactical assignments for the Cenarion Circle.",
},[[
step
label "Accept_Field_Duty"
talk Windcaller Kaldon##15540
accept Field Duty##8507 |goto Silithus 49.98,36.34
step
use the Unsigned Field Duty Papers##21143
collect 1 Prepared Field Duty Papers##23024 |q 8507
step
talk Captain Blackanvil##15440
accept Field Duty Papers##8508 |goto Silithus 32.96,52.08
step
collect 1 Signed Field Duty Papers##20810 |q 8507/1
step
talk Windcaller Kaldon##15540
|tip Choose a tactical assignment.
|tip Tactical Assignments require you to fight Twilight Hammer elementals or collect reports from Silithus hives.
turnin Field Duty##8507 |goto Silithus 49.98,36.34
step
label "Begin_Tactical_Assignment"
use the Tactical Assignment##20809
Open the Tactical Assignment |complete itemcount(20809) == 0
step
use the Tactical Task Briefing I##21245
accept Azure Templar##8737
|only if itemcount(21245) >= 1 or haveq(8737)
step
use the Tactical Task Briefing III##21751
accept Earthen Templar##8536
|only if itemcount(21751) >= 1 or haveq(8536)
step
use the Tactical Task Briefing VI##21165
accept Hive'Zora Scout Report##8534
|only if itemcount(21165) >= 1 or haveq(8534)
step
use the Tactical Task Briefing VII##21166
accept Hive'Regal Scout Report##8738
|only if itemcount(21166) >= 1 or haveq(8738)
step
use the Tactical Task Briefing IX##20944
accept Twilight Marauders##8740
|only if itemcount(20944) >= 1 or haveq(8740)
step
kill Azure Templar##15211 |q 8737/1 |goto Silithus 38.29,46.46
|tip Kill Twilight enemies around the area until you collect a Twilight Cultist robe, cowl, and mantle.
|tip Equip all three pieces and interact with the Lesser Wind Stone to summon a Templar.
|tip The Templar is random, so you may need to do this more than one time.
|only if haveq(8737)
step
kill Earthen Templar##15307 |q 8536/1 |goto Silithus 38.29,46.46
|tip Kill Twilight enemies around the area until you collect a Twilight Cultist robe, cowl, and mantle.
|tip Equip all three pieces and interact with the Lesser Wind Stone to summon a Templar.
|tip The Templar is random, so you may need to do this more than one time.
|only if haveq(8536)
step
Enter the cave |goto Silithus 25.37,55.22 < 20 |walk
Follow the path |goto Silithus 26.51,56.73 < 10 |walk
Follow the path down |goto Silithus 25.56,61.87 < 10 |walk
|tip There are elite enemies around this area. |only if hardcore()
|tip It's adviced to venture into these areas with a group when possible. |only if hardcore()
talk Cenarion Scout Azenel##15610
Select _"I'm here to retrieve your report."_
collect Hive'Zora Scout Report##21158 |q 8534/1 |goto Silithus 23.63,62.43
|only if haveq(8534)
step
Enter the cave |goto Silithus 54.88,88.05 < 20 |walk
Follow the path down |goto Silithus 53.57,88.96 < 10 |walk
Follow the path down |goto Silithus 53.12,93.24 < 10 |walk
|tip There are elite enemies around this area. |only if hardcore()
|tip It's adviced to venture into these areas with a group when possible. |only if hardcore()
talk Cenarion Scout Landion##15609
Select _"I'm here to retrieve your report."_
collect Hive'Regal Scout Report##21160 |q 8738/1 |goto Silithus 53.71,97.48
|only if haveq(8738)
stickystart "Kill_Twilight_Marauders"
step
kill Twilight Marauder Morna##15541 |q 8740/1
She can also spawn at:
[38.81,78.19]
[23.63,45.32]
|only if haveq(8740)
step
label "Kill_Twilight_Marauders"
kill 5 Twilight Marauder##15542 |q 8740/2 |goto Silithus 68.76,35.99
|tip They spawn with Twilight Marauder Morna.
They can also spawn at: |notinsticky
[38.81,78.19] |notinsticky
[23.63,45.32] |notinsticky
|only if haveq(8740)
step
talk Bor Wildmane##15306
turnin Azure Templar##8737 |goto Silithus 48.57,37.78 |only if haveq(8737) |next "Open_Followup_Tactical_Assignment"
turnin Earthen Templar##8536 |goto Silithus 48.57,37.78 |only if haveq(8536) |next "Open_Followup_Tactical_Assignment"
|only if haveq(8737,8536)
step
talk Windcaller Proudhorn##15191
turnin Hive'Zora Scout Report##8534 |goto Silithus 51.15,38.29 |only if haveq(8534) |next "Open_Followup_Tactical_Assignment"
turnin Hive'Regal Scout Report##8738 |goto Silithus 51.15,38.29 |only if haveq(8738) |next "Open_Followup_Tactical_Assignment"
turnin Twilight Marauders##8740 |goto Silithus 51.15,38.29 |only if haveq(8740) |next "Open_Followup_Tactical_Assignment"
|only if haveq(8534,8738,8740)
step
label "Open_Followup_Tactical_Assignment"
use the Followup Tactical Assignment##21133
Open the Followup Tactical Assignment |complete itemcount(21133) == 0
step
use the Tactical Task Briefing II##20945
accept Crimson Templar##8537
|only if itemcount(20945) >= 1 or haveq(8537)
step
use the Tactical Task Briefing IV##20947
accept Hoary Templar##8535
|only if itemcount(20947) >= 1 or haveq(8535)
step
use the Tactical Task Briefing V##20948
accept The Four Dukes##8538
|only if itemcount(20948) >= 1 or haveq(8538)
step
use the Tactical Task Briefing VIII##21167
accept Hive'Ashi Scout Report##8739
|only if itemcount(21167) >= 1 or haveq(8739)
step
use the Tactical Task Briefing X##20943
accept Twilight Battle Orders##8498
|only if itemcount(20943) >= 1 or haveq(8498)
step
kill Crimson Templar##15209 |q 8537/1 |goto Silithus 38.29,46.46
|tip Kill Twilight enemies around the area until you collect a Twilight Cultist robe, cowl, and mantle.
|tip Equip all three pieces and interact with the Lesser Wind Stone to summon a Templar.
|tip The Templar is random, so you may need to do this more than one time.
|only if haveq(8537)
step
kill Hoary Templar##15212 |q 8535/1 |goto Silithus 38.29,46.46
|tip Kill Twilight enemies around the area until you collect a Twilight Cultist robe, cowl, and mantle.
|tip Equip all three pieces and interact with the Lesser Wind Stone to summon a Templar.
|tip The Templar is random, so you may need to do this more than one time.
|only if haveq(8535)
stickystart "Kill_The_Duke_of_Fathoms"
stickystart "Kill_The_Duke_of_Zephyrs"
stickystart "Kill_The_Duke_of_Shards"
step
kill The Duke of Cynders##15206 |q 8538/1 |goto Silithus 37.63,44.80
|tip Dukes are level 62 elites and will require a group.
|tip Kill Twilight enemies around the area until you collect a Twilight Cultist robe, cowl, and mantle.
|tip Equip all three pieces along with a Medallion of Station and interact with the Wind Stone to summon a Duke.
|tip You can acquire a Medalion of Station by bringing 3 Abyssal Crests and 1 Large Brilliant Shard to Aurel Goldleaf next to the mailbox in Cenarion Hold.
|tip Abyssal Crests are dropped by templars summoned with a Twilight Cultist set at a Lesser Windstone.
|tip The duke is random, so you may need to do this more than one time.
|only if haveq(8538)
step
label "Kill_The_Duke_of_Fathoms"
kill The Duke of Fathoms##15207 |q 8538/2 |goto Silithus 37.63,44.80
|tip Dukes are level 62 elites and will require a group. |notinsticky
|tip Kill Twilight enemies around the area until you collect a Twilight Cultist robe, cowl, and mantle. |notinsticky
|tip Equip all three pieces along with a Medallion of Station and interact with the Wind Stone to summon a Duke. |notinsticky
|tip You can acquire a Medalion of Station by bringing 3 Abyssal Crests and 1 Large Brilliant Shard to Aurel Goldleaf next to the mailbox in Cenarion Hold. |notinsticky
|tip Abyssal Crests are dropped by templars summoned with a Twilight Cultist set at a Lesser Windstone. |notinsticky
|tip The duke is random, so you may need to do this more than one time. |notinsticky
|only if haveq(8538)
step
label "Kill_The_Duke_of_Zephyrs"
kill The Duke of Zephyrs##15220 |q 8538/3 |goto Silithus 37.63,44.80
|tip Dukes are level 62 elites and will require a group. |notinsticky
|tip Kill Twilight enemies around the area until you collect a Twilight Cultist robe, cowl, and mantle. |notinsticky
|tip Equip all three pieces along with a Medallion of Station and interact with the Wind Stone to summon a Duke. |notinsticky
|tip You can acquire a Medalion of Station by bringing 3 Abyssal Crests and 1 Large Brilliant Shard to Aurel Goldleaf next to the mailbox in Cenarion Hold. |notinsticky
|tip Abyssal Crests are dropped by templars summoned with a Twilight Cultist set at a Lesser Windstone. |notinsticky
|tip The duke is random, so you may need to do this more than one time. |notinsticky
|only if haveq(8538)
step
label "Kill_The_Duke_of_Shards"
kill The Duke of Shards##15208 |q 8538/4 |goto Silithus 37.63,44.80
|tip Dukes are level 62 elites and will require a group. |notinsticky
|tip Kill Twilight enemies around the area until you collect a Twilight Cultist robe, cowl, and mantle. |notinsticky
|tip Equip all three pieces along with a Medallion of Station and interact with the Wind Stone to summon a Duke. |notinsticky
|tip You can acquire a Medalion of Station by bringing 3 Abyssal Crests and 1 Large Brilliant Shard to Aurel Goldleaf next to the mailbox in Cenarion Hold. |notinsticky
|tip Abyssal Crests are dropped by templars summoned with a Twilight Cultist set at a Lesser Windstone. |notinsticky
|tip The duke is random, so you may need to do this more than one time. |notinsticky
|only if haveq(8538)
step
Enter the cave |goto Silithus 43.95,16.03 < 20 |walk
talk Cenarion Scout Jalia##15611
|tip She is stealthed.
Select _"I'm here to retrieve your report."_
collect Hive'Ashi Scout Report##21161 |q 8739/1 |goto Silithus 43.94,13.81
|only if haveq(8739)
step
kill Twilight Prophet##15308
|tip She patrols in and between the points indicated with a group of bodyguards.
|tip You may need to search around for her, especially during peak hours.
|tip She is elite, so you may need a group.
collect Twilight Battle Orders##20803 |q 8498/1 |goto Silithus 39.29,42.97
You can also find her here:
[25.95,34.98]
[19.15,83.78]
|only if haveq(8498)
step
talk Bor Wildmane##15306
turnin Crimson Templar##8537 |goto Silithus 48.57,37.78 |only if haveq(8537)
turnin Hoary Templar##8535 |goto Silithus 48.57,37.78 |only if haveq(8535)
|only if haveq(8537,8535)
step
talk Commander Mar'alith##15181
turnin The Four Dukes##8538 |goto Silithus 49.20,34.19 |only if haveq(8538)
turnin Twilight Battle Orders##8498 |goto Silithus 49.20,34.19 |only if haveq(8498)
|only if haveq(8538,8498)
step
talk Windcaller Proudhorn##15191
turnin Hive'Ashi Scout Report##8739 |goto Silithus 51.15,38.29
|only if haveq(8739)
step
collect 1 Tactical Assignment##20809 |next "Begin_Tactical_Assignment"
]])
GoatQuest:RegisterGuide("Leveling Guides\\Cenarion Field Duty Logistics Assignments",{
description="This guide will walk you through completing various logistics assignments for the Cenarion Circle.",
},[[
step
label "Accept_Field_Duty"
talk Windcaller Kaldon##15540
accept Field Duty##8507 |goto Silithus 49.98,36.34
step
use the Unsigned Field Duty Papers##21143
collect 1 Prepared Field Duty Papers##23024 |q 8507
step
talk Captain Blackanvil##15440
accept Field Duty Papers##8508 |goto Silithus 32.96,52.08
step
collect 1 Signed Field Duty Papers##20810 |q 8507/1
step
talk Windcaller Kaldon##15540
|tip Choose a logistics assignment.
|tip Logistics Assignments require you to donate various materials to the Cenarion effort.
turnin Field Duty##8507 |goto Silithus 49.98,36.34
step
label "Begin_Logistics_Assignment"
use the Logistics Assignment##21132
Open the Logistics Assignment |complete itemcount(21132) == 0
step
use the Logistics Task Briefing IV##21257
accept The Ironforge Brigade Needs Explosives!##8778
|only if itemcount(21257) >= 1 or haveq(8778)
step
use the Logistics Task Briefing V##21259
accept Scrying Materials##8779
|only if itemcount(21259) >= 1 or haveq(8779)
step
use the Logistics Task Briefing VI##21260
accept Arms for the Field##8781
|only if itemcount(21260) >= 1 or haveq(8781)
step
use the Logistics Task Briefing VII##21263
accept Armor Kits for the Field##8780
|only if itemcount(21263) >= 1 or haveq(8780)
step
use the Logistics Task Briefing X##20806
accept Bandages for the Field##8496
|only if itemcount(20806) >= 1 or haveq(8496)
stickystart "Collect_5_Goblin_Rocket_Fuel"
stickystart "Collect_10_Dense_Blasting_Powder"
step
collect 6 Oil of Immolation##8956 |q 8778/1
|tip Craft them with Alchemy or purchase them from the Auction House. |only if not selfmade()
|tip You can create them with Alchemy. |only if selfmade()
|tip Each one requires 1 Firebloom, 1 Goldthorn, and 1 Crystal Vial to create.
|only if haveq(8778)
step
label "Collect_5_Goblin_Rocket_Fuel"
collect 5 Goblin Rocket Fuel##9061 |q 8778/2
|tip Craft them with Alchemy or purchase them from the Auction House. |only if not selfmade()
|tip You can create them with Alchemy. |only if selfmade()
|tip Each one requires 1 Firebloom, 1 Volatile Rum, and 1 Leaded Vial to create.
|only if haveq(8778)
step
label "Collect_10_Dense_Blasting_Powder"
collect 10 Dense Blasting Powder##15992 |q 8778/3
|tip Craft them with Engineering or purchase them from the Auction House.
|tip Each one requires 2 Dense Stone to create.
|only if haveq(8778)
stickystart "Collect_1_Large_Radiant_Shard"
stickystart "Collect_1_Huge_Emerald"
step
collect 1 Large Brilliant Shard##14344 |q 8779/1
|tip Disenchant item level 56-65 rare items or purchase it from the Auction House. |only if not selfmade()
|tip Disenchant item level 56-65 rare items. |only if selfmade()
|tip Blackrock Depths and Dire Maul are good sources for these items.
|only if haveq(8779)
step
label "Collect_1_Large_Radiant_Shard"
collect 1 Large Radiant Shard##11178 |q 8779/2
|tip Disenchant item level 46-50 rare items or purchase it from the Auction House. |only if not selfmade()
|tip Disenchant item level 46-50 rare items. |only if selfmade()
|tip Zul'Farrak, Dire Maul, and Stratholme are good sources for these items.
|only if haveq(8779)
step
label "Collect_1_Huge_Emerald"
collect 1 Huge Emerald##12364 |q 8779/3
|tip Gather it with Mining or purchase it from the Auction House. |only if not selfmade()
|tip Gather it with Mining. |only if selfmade()
|tip It can be mined from any type of Thorium vein.
|only if haveq(8779)
step
collect 2 Moonsteel Broadsword##3853 |q 8781/1
|tip Craft them with Blacksmithing or purchase them from the Auction House. |only if not selfmade()
|tip Craft them with Blacksmithing. |only if selfmade()
|tip Each one requires 8 Steel Bars, 2 Strong Flux, 2 Heavy Grinding Stones, 3 Moonstone, and 3 Heavy Leather to create.
|only if haveq(8781)
stickystart "Collect_8_Heavy_Armor_Kits"
step
collect 8 Rugged Armor Kit##15564 |q 8780/1
|tip Craft them with Leatherworking or purchase them from the Auction House. |only if not selfmade()
|tip Craft them with Leatherworking. |only if selfmade()
|tip Each one requires 5 Rugged Leather to create.
|only if haveq(8780)
step
label "Collect_8_Heavy_Armor_Kits"
collect 8 Heavy Armor Kit##4265 |q 8780/2
|tip Craft them with Leatherworking or purchase them from the Auction House. |only if not selfmade()
|tip Craft them with Leatherworking. |only if selfmade()
|tip Each one requires 5 Heavy Leather and 1 Fine Thread to create.
|only if haveq(8780)
stickystart "Collect_30_Heavy_Mageweave_Bandage"
stickystart "Collect_30_Heavy_Silk_Bandage"
step
collect 30 Heavy Runecloth Bandage##14530 |q 8496/1
|tip Craft them with First Aid or purchase them from the Auction House. |only if not selfmade()
|tip Craft them with First Aid. |only if selfmade()
|tip Each one requires 2 Runecloth to create.
|only if haveq(8496)
step
label "Collect_30_Heavy_Mageweave_Bandage"
collect 30 Heavy Mageweave Bandage##8545 |q 8496/2
|tip Craft them with First Aid or purchase them from the Auction House. |only if not selfmade()
|tip Craft them with First Aid. |only if selfmade()
|tip Each one requires 2 Mageweave Cloth to create.
|only if haveq(8496)
step
label "Collect_30_Heavy_Silk_Bandage"
collect 30 Heavy Silk Bandage##6451 |q 8496/3
|tip Craft them with First Aid or purchase them from the Auction House. |only if not selfmade()
|tip Craft them with First Aid. |only if selfmade()
|tip Each one requires 2 Silk Cloth to create.
|only if haveq(8496)
step
talk Geologist Larksbane##15183
turnin Scrying Materials##8779 |goto Silithus 49.67,37.35 |next "Open_Followup_Logistics_Assignment"
|only if haveq(8779)
step
talk Windcaller Proudhorn##15191
turnin Bandages for the Field##8496 |goto Silithus 51.15,38.29 |next "Open_Followup_Logistics_Assignment"
|only if haveq(8496)
step
talk Arcanist Nozzlespring##15444
turnin The Ironforge Brigade Needs Explosives!##8778 |goto Silithus 32.54,52.03 |next "Open_Followup_Logistics_Assignment"
|only if haveq(8778)
step
talk Janela Stouthammer##15443
turnin Arms for the Field##8781 |goto Silithus 32.88,52.53 |next "Open_Followup_Logistics_Assignment" |only if haveq(8781)
turnin Armor Kits for the Field##8780 |goto Silithus 32.88,52.53 |next "Open_Followup_Logistics_Assignment" |only if haveq(8780)
|only if haveq(8781,8780)
step
label "Open_Followup_Logistics_Assignment"
use the Followup Logistics Assignment##20805
Open the Followup Logistics Assignment |complete itemcount(20805) == 0
step
use the Logistics Task Briefing I##20807
accept Desert Survival Kits##8497
|only if itemcount(20807) >= 1 or haveq(8497)
step
use the Logistics Task Briefing II##20939
accept Boots for the Guard##8805
|only if itemcount(20939) >= 1 or haveq(8805)
step
use the Logistics Task Briefing III##20940
accept Grinding Stones for the Guard##8541
|only if itemcount(20940) >= 1 or haveq(8541)
step
use the Logistics Task Briefing VIII##21262
accept Uniform Supplies##8782
|only if itemcount(21262) >= 1 or haveq(8782)
step
use the Logistics Task Briefing IX##21265
accept Extraordinary Materials##8783
|only if itemcount(21265) >= 1 or haveq(8783)
step
use the Logistics Task Briefing XI##21514
accept The Ultimate Deception##8829
|only if itemcount(21514) >= 1 or haveq(8829)
stickystart "Collect_Powerful_Anti-Venom"
stickystart "Collect_Smoked_Desert_Dumplings"
step
kill Toxic Horror##7132+
collect 4 Globe of Water##7079 |q 8497/1 |goto Felwood 48.75,24.16
|tip You can also purchase these from the Auction House. |only if not selfmade()
|only if haveq(8497)
step
label "Collect_Powerful_Anti-Venom"
collect 4 Powerful Anti-Venom##19440 |q 8497/2
|tip Craft them with First Aid or purchase them from the Auction House. |only if not selfmade()
|tip Craft them with First Aid. |only if selfmade()
|tip Each one requires 1 Huge Venom Sac to create.
|only if haveq(8497)
step
label "Collect_Smoked_Desert_Dumplings"
collect 4 Smoked Desert Dumplings##20452 |q 8497/3
|tip Craft them with Cooking or purchase them from the Auction House. |only if not selfmade()
|tip Craft them with Cooking. |only if selfmade()
|tip Each one requires 1 Sandworm Meat and 1 Soothing Spices to create.
|only if haveq(8497)
step
collect 3 Ornate Mithril Boots##7936 |q 8805/1
|tip Craft them with Blacksmithing or purchase them from the Auction House. |only if not selfmade()
|tip Craft them with Blacksmithing. |only if selfmade()
|tip Each one requires 14 Mithril Bars, 2 Truesilver Bars, 4 Thick Leather, 1 Solid Grinding Stone, and 1 Aquamarine to create.
|only if haveq(8805)
stickystart "Collect_Solid_Grinding_Stone"
stickystart "Collect_Heavy_Grinding_Stone"
step
collect 10 Dense Grinding Stone##12644 |q 8541/1
|tip Craft them with Blacksmithing or purchase them from the Auction House. |only if not selfmade()
|tip Craft them with Blacksmithing. |only if selfmade()
|tip Each one requires 4 Dense Stone to create.
|only if haveq(8541)
step
label "Collect_Solid_Grinding_Stone"
collect 10 Solid Grinding Stone##7966 |q 8541/2
|tip Craft them with Blacksmithing or purchase them from the Auction House. |only if not selfmade()
|tip Craft them with Blacksmithing. |only if selfmade()
|tip Each one requires 4 Solid Stone to create.
|only if haveq(8541)
step
label "Collect_Heavy_Grinding_Stone"
collect 10 Heavy Grinding Stone##3486 |q 8541/3
|tip Craft them with Blacksmithing or purchase them from the Auction House. |only if not selfmade()
|tip Craft them with Blacksmithing. |only if selfmade()
|tip Each one requires 3 Heavy Stone to create.
|only if haveq(8541)
stickystart "Collect_Bolt_of_Runecloth"
stickystart "Collect_Ironweb_Spider_Silk"
step
collect 1 Mooncloth##14342 |q 8782/1
|tip Craft it with Tailoring or purchase it from the Auction House. |only if not selfmade()
|tip Craft them with Tailoring. |only if selfmade()
|tip It requires 2 Felcloth and a daily Tailoring cooldown to create.
|only if haveq(8782)
step
label "Collect_Bolt_of_Runecloth"
collect 2 Bolt of Runecloth##14048 |q 8782/2
|tip Craft them with Tailoring or purchase them from the Auction House. |only if not selfmade()
|tip Craft them with Tailoring. |only if selfmade()
|tip Each one requires 5 Runecloth to create.
|only if haveq(8782)
step
label "Collect_Ironweb_Spider_Silk"
kill Plague Lurker##1824+
collect 1 Ironweb Spider Silk##14227 |q 8782/3 |goto Western Plaguelands 62.20,49.48
|tip You can also purchase it from the Auction House. |only if not selfmade()
|only if haveq(8782)
stickystart "Collect_Enchanted_Leather"
step
collect 10 Enchanted Thorium Bar##12655 |q 8783/1
|tip Craft them with Enchanting or purchase them from the Auction House. |only if not selfmade()
|tip Craft them with Enchanting. |only if selfmade()
|tip Each one requires 1 Thorium Bar and 3 Dream Dust to create.
|only if haveq(8783)
step
label "Collect_Enchanted_Leather"
collect 10 Solid Grinding Stone##12810 |q 8783/2
|tip Craft them with Enchanting or purchase them from the Auction House. |only if not selfmade()
|tip Craft them with Enchanting. |only if selfmade()
|tip Each one requires 1 Rugged Leather and 1 Lesser Eternal Essence to create.
|only if haveq(8783)
stickystart "Collect_Frayed_Abomination_Stitching"
stickystart "Collect_Twilight_Cultist_Robe"
step
collect 1 Skin of Shadow##12753 |q 8829/1
|tip This has a chance to drop from Risen Bonewarders and Risen Constructs in the Scholomance dungeon.
|only if haveq(8829)
step
label "Collect_Frayed_Abomination_Stitching"
collect 3 Frayed Abomination Stitching##12735 |q 8829/2
|tip These drop from Abomination enemies as well as Ramstein the Gorger in the Undead Stratholme dungeon.
|only if haveq(8829)
step
label "Collect_Twilight_Cultist_Robe"
Kill Twilight enemies around this area
collect 1 Twilight Cultist Robe##20407 |q 8829/3 |goto Silithus 38.64,44.97
|tip You can also purchase it from the Auction House. |only if not selfmade()
|only if haveq(8829)
step
talk Calandrath##15174
|tip Inside the building.
turnin Desert Survival Kits##8497 |goto Silithus 51.87,39.14
|only if haveq(8497)
step
talk Vish Kozus##15182
|tip At the top of the tower.
turnin Grinding Stones for the Guard##8541 |goto Silithus 50.75,33.65 |only if haveq(8541)
turnin Boots for the Guard##8805 |goto Silithus 50.75,33.65 |only if haveq(8805)
|only if haveq(8541,8805)
step
talk Windcaller Proudhorn##15191
turnin Uniform Supplies##8782 |goto Silithus 51.15,38.29
|only if haveq(8782)
step
talk Vargus##15176
turnin Extraordinary Materials##8783 |goto Silithus 51.23,38.86
|only if haveq(8783)
step
talk Aurel Goldleaf##15282
turnin The Ultimate Deception##8829 |goto Silithus 51.96,38.15
|only if haveq(8829)
step
collect 1 Logistics Assignment##21132 |next "Begin_Logistics_Assignment"
]])
GoatQuest:RegisterGuide("Leveling Guides\\Druid Class Quests",{
description="This guide will walk you through completing various Druid Class Quests.",
},[[
step
ding 10
step
talk Denatharion##4218
accept Heeding the Call##5923 |goto Darnassus/0 34.77,7.36
|only if NightElf Druid and (not completedq(5921)) and (not haveq(5921))
step
Follow the road |goto Darnassus/0 54.81,58.48 < 30 |only if walking
Enter Darnassus |goto Darnassus/0 36.06,54.39 < 20 |only if walking
Enter the building |goto Darnassus 35.52,10.72 < 15 |walk
talk Mathrengyl Bearwalker##4217
|tip Upstairs inside the building.
turnin Heeding the Call##5923 |goto Darnassus 35.38,8.41
accept Moonglade##5921 |goto Darnassus 35.38,8.41
|only if NightElf Druid
step
talk Dendrite Starblaze##11802
|tip Upstairs inside the building.
turnin Moonglade##5921 |goto Moonglade 56.21,30.64
accept Great Bear Spirit##5929 |goto Moonglade 56.21,30.64
|only if NightElf Druid
step
Follow the path |goto Moonglade 42.47,34.44 < 20 |only if walking
talk Great Bear Spirit##11956
Select _"What do you represent, spirit?"_ |gossip 97167
Select _"I seek to understand the importance of strength of the body."_ |gossip 97129
Select _"I seek to understand the importance of strength of the heart."_ |gossip 97168
Select _"I have heard your words, Great Bear Spirit, and I understand.  I now seek your blessings to fully learn the way of the Claw."_ |gossip 95968
Seek Out the Great Bear Spirit and Learn what it Has to Share with You About the Nature of the Bear |q 5929/1 |goto Moonglade 39.11,27.51
|only if NightElf Druid
step
Enter the building |goto Moonglade 56.13,30.98 < 15 |walk
talk Dendrite Starblaze##11802
|tip Upstairs inside the building.
turnin Great Bear Spirit##5929 |goto Moonglade 56.21,30.64
accept Back to Darnassus##5931 |goto Moonglade 56.21,30.64
|only if NightElf Druid
step
talk Sindrayl##10897
fpath Moonglade |goto Moonglade 48.10,67.34
|only if NightElf Druid
step
Enter the building |goto Darnassus 35.52,10.72 < 15 |walk
talk Mathrengyl Bearwalker##4217
|tip Upstairs inside the building.
turnin Back to Darnassus##5931 |goto Darnassus 35.38,8.41
accept Body and Heart##6001 |goto Darnassus 35.38,8.41
|only if NightElf Druid
step
Enter the cave |goto Darkshore 43.06,45.55 < 15 |walk
use the Cenarion Moondust##15208
|tip Inside the cave.
kill Lunaclaw##12138
|tip This enemy is level 12. |only if hardcore()
|tip The area is surrounded by level 13 enemies. |only if hardcore()
|tip The Owlbear enemies around here aggro from quite a bit away, so it may be safe to level up to 11 or even 12 before attempting the quest. |only if hardcore()
talk Lunaclaw Spirit##12144
Select _"You have fought well, spirit.  I ask you to grant me the strength of your body and the stength of your heart."_ |gossip 97127
Face Lunaclaw and Earn the Strength of Body and Heart it Possesses |q 6001/1 |goto Darkshore 43.48,45.96
|only if NightElf Druid
step
Leave the cave |goto Darkshore 42.97,45.44 < 15 |walk
Enter the building |goto Darnassus 35.52,10.72 < 15 |walk
talk Mathrengyl Bearwalker##4217
|tip Upstairs inside the building.
turnin Body and Heart##6001 |goto Darnassus 35.38,8.41
|only if NightElf Druid
step
ding 14
step
collect 5 Earthroot##2449 |q 6123 |future
|tip You can gather these with the Herbalism Profession.
|tip Refer to the Earthroot Gathering Guide to accomplish this.
|tip You can also purchase them from the Auction House. |only if not selfmade()
step
Enter the building |goto Darnassus 35.52,10.72 < 7 |walk
talk Mathrengyl Bearwalker##4217
|tip Upstairs inside the building.
accept Lessons Anew##6121 |goto Darnassus 35.38,8.41
|only if NightElf Druid
step
cast Teleport: Moonglade##18960
talk Dendrite Starblaze##11802
|tip Upstairs inside the building.
turnin Lessons Anew##6121 |goto Moonglade 56.21,30.64
accept The Principal Source##6122 |goto Moonglade 56.21,30.64
|only if NightElf Druid
step
Follow the road |goto Darkshore 40.33,46.35 < 30 |only if walking
Follow the path |goto Darkshore 46.41,32.14 < 30 |only if walking
Follow the path up |goto Darkshore 54.64,31.76 < 20 |only if walking
use the Empty Cliffspring Falls Sampler##15844
|tip At the entrance of the cave.
|tip There may be around 4 naga around the cave entrance. |only if hardcore()
|tip Pull them carefully before attempting to fill the sampler. |only if hardcore()
|tip Stormscale Sirens are ranged attackers that may heal. |only if hardcore()
|tip Enemies around here may run away in fear when at low health. |only if hardcore()
collect Filled Cliffspring Falls Sampler##15845 |q 6122/1 |goto Darkshore 54.93,33.32
|only if NightElf Druid
step
Follow the road |goto Darkshore 47.10,26.84 < 30 |only if walking
Follow the path |goto Darkshore 42.21,42.33 < 30 |only if walking
Enter the building |goto Darkshore 37.77,41.36 < 10 |walk
talk Alanndarian Nightsong##3702
|tip Inside the building.
turnin The Principal Source##6122 |goto Darkshore 37.69,40.66
accept Gathering the Cure##6123 |goto Darkshore 37.69,40.66
|only if NightElf Druid
step
Leave the building |goto Darkshore 37.77,41.36 < 10 |walk
Follow the road |goto Darkshore 40.04,46.77 < 30 |only if walking
click Lunar Fungal Bloom##177750+
|tip They look like clusters of small white-spotted mushrooms on the ground inside the small caves around this area.
|tip Watch for respawns while in the area. |only if hardcore()
|tip Owlbear enemies around here have an abnormal aggro radius. |only if hardcore()
collect 12 Lunar Fungus##15851 |q 6123/2 |goto Darkshore 43.07,45.55
You can find more small caves at: |notinsticky
[43.07,49.24]
[43.38,50.50]
[42.71,52.28]
[45.22,53.45]
[46.30,45.56]
[45.52,50.24]
|only if NightElf Druid
step
Follow the road |goto Darkshore 39.93,46.07 < 30 |only if walking
Enter the building |goto Darkshore 37.77,41.36 < 10 |walk
talk Alanndarian Nightsong##3702
|tip Inside the building.
turnin Gathering the Cure##6123 |goto Darkshore 37.69,40.66
accept Curing the Sick##6124 |goto Darkshore 37.69,40.66
|only if NightElf Druid
step
_Destroy This Item:_
|tip It is no longer needed.
trash Lunar Fungus##15851
|only if itemcount(15851) > 0
step
Leave the building |goto Darkshore 37.77,41.34 < 10 |walk
Follow the road |goto Darkshore 39.55,45.39 < 30 |only if walking
use the Curative Animal Salve##15826
|tip Use it on Sickly Deer around this area.
|tip They look like green diseased deer in areas with trees.
|tip They are spread out all throughout Darkshore.
Cure #10# Sickly Deer |q 6124/1 |goto Darkshore 41.51,46.08
|only if NightElf Druid
step
cast Teleport: Moonglade##18960
talk Dendrite Starblaze##11802
|tip Upstairs inside the building.
turnin Curing the Sick##6124 |goto Moonglade 56.21,30.64
accept Power over Poison##6125 |goto Moonglade 56.21,30.64
|only if NightElf Druid
step
Enter the building |goto Darnassus 35.52,10.72 < 7 |walk
talk Mathrengyl Bearwalker##4217
|tip Upstairs inside the building.
turnin Power over Poison##6125 |goto Darnassus 35.38,8.41
|only if NightElf Druid
step
ding 16
step
Enter the building |goto Darnassus 35.49,10.63 < 7 |walk
talk Mathrengyl Bearwalker##4217
|tip Upstairs inside the building.
accept A Lesson to Learn##26 |goto Darnassus 35.38,8.41
|only if NightElf Druid
step
talk Dendrite Starblaze##11802
|tip Upstairs inside the building.
turnin A Lesson to Learn##26 |goto Moonglade 56.21,30.64
accept Trial of the Lake##29 |goto Moonglade 56.21,30.64
|only if NightElf Druid
step
click Bauble Container
|tip It looks like a wicker basket vase on the ground underwater.
|tip They spawn randomly, so you may have to search around this area.
|tip Don't linger in the water for any reason. |only if hardcore()
collect Shrine Bauble##15877 |goto Moonglade 54.33,55.65 |q 29 |future
|only if NightElf Druid
step
use the Shrine Bauble##15877
Complete the Trial of the Lake |q 29/1 |goto Moonglade 35.92,41.38
|only if NightElf Druid
step
talk Tajarri##11799
turnin Trial of the Lake##29 |goto Moonglade 36.51,40.11
accept Trial of the Sea Lion##272 |goto Moonglade 36.51,40.11
|only if NightElf Druid
step
Follow the road |goto Darkshore 40.23,46.41 < 30 |only if walking
Follow the path |goto Darkshore 48.43,24.86 < 30 |only if walking
click Strange Lockbox
|tip Underwater.
|tip If you fight enemies around here, make sure you do so above water. |only if hardcore()
collect Half Pendant of Aquatic Agility##15883 |goto Darkshore 48.87,11.32 |q 272
|only if NightElf Druid
step
click Strange Lockbox
|tip Underwater.
|tip If you fight enemies around here, make sure you do so above water. |only if hardcore()
|tip You should wait until you quest into Loch Modan to do this portion of the quest. |only if hardcore()
collect Half Pendant of Aquatic Endurance##15882 |goto Westfall 17.87,33.11 |q 272
|only if NightElf Druid
step
use the Half Pendant of Aquatic Agility##15883
collect Pendant of the Sea Lion##15885 |q 272/1 |goto Moonglade 35.92,41.42
|only if NightElf Druid
step
talk Dendrite Starblaze##11802
|tip Upstairs inside the building.
turnin Trial of the Sea Lion##272 |goto Moonglade 56.21,30.64
accept Aquatic Form##5061 |goto Moonglade 56.21,30.64
|only if NightElf Druid
step
Enter the building |goto Darnassus 35.49,10.63 < 7 |walk
talk Mathrengyl Bearwalker##4217
|tip Upstairs inside the building.
turnin Aquatic Form##5061 |goto Darnassus 35.38,8.41
|only if NightElf Druid
step
ding 52
step
Enter the building |goto Darnassus 35.52,10.72 < 15 |walk
talk Mathrengyl Bearwalker##4217
|tip Upstairs inside the building.
accept Torwa Pathfinder##9063|goto Darnassus 35.38,8.41
|only if NightElf Druid
step
talk Torwa Pathfinder##9619
turnin Torwa Pathfinder##9063 |goto Un'Goro Crater 71.63,75.96
accept Bloodpetal Poison##9052 |goto Un'Goro Crater 71.63,75.96
|only if NightElf Druid
step
Kill Gorishi enemies around this area
|tip Gorishi Workers may call for help when at low health. |only if hardcore() |notinsticky
|tip Watch for patrols and respawns while in the cave. 	|only if hardcore() |notinsticky
collect 8 Gorishi Sting##22435 |q 9052/1 |goto Un'Goro Crater 50.40,78.60
|only if NightElf Druid
step
click Bloodcap
|tip They look like vines entwined in a ball.
|tip They are all over Un'Goro Crater.
collect 8 Bloodcap##22434 |q 9052/2 |goto Un'Goro Crater 71.90,57.40
You Can Find More Around [53.50,14.90]
[34.60,30.60]
|only if NightElf Druid
step
talk Torwa Pathfinder##9619
turnin Bloodpetal Poison##9052 |goto Un'Goro Crater 71.63,75.96
accept Toxic Test##9051 |goto Un'Goro Crater 71.63,75.96
|only if NightElf Druid
step
use the Devilsaur Barb##22432
|tip Use it on roaming Devilsaur around Un'Goro Crater.
|tip Root the Devisaur before trying to use the Barb and run away after you accomplish this. |only if hardcore()
Stab a Devilsaur with the Barb |q 9051/1 |goto Un'Goro Crater 67.31,33.89
|only if NightElf Druid
step
talk Torwa Pathfinder##9619
turnin Toxic Test##9051 |goto Un'Goro Crater 71.63,75.96
accept A Better Ingredient##9053 |goto Un'Goro Crater 71.63,75.96
|only if NightElf Druid
step
_NOTE:_
Incoming Dungeon Step
|tip The next couple of steps will be taking you to the Sunken Temple dungeon.
|tip You will need a group to complete the dungeon as well as the quest.
|tip If you don't have a group, wait until you do before continuing.
Click Here to Continue |confirm |q 9053
|only if NightElf Druid and hardcore()
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
|only if NightElf Druid
step
Inside the Temple of Atal'Hakkar Dungeon:
kill Atal'alarion##8580
|tip Refer to the Temple of Atal'Hakkar Dungeon Guide to accomplish that.
collect Putrid Vine##22444 |q 9053/1
|only if NightElf Druid
step
Leave the Temple of Atal'Hakkar Dungeon
Click Here to Continue |confirm |q 9053 |future
|only if NightElf Druid
step
talk Torwa Pathfinder##9619
turnin A Better Ingredient##9053 |goto Un'Goro Crater 71.63,75.96
|only if NightElf Druid
]])
GoatQuest:RegisterGuide("Leveling Guides\\Priest Class Quests",{
description="This guide will walk you through completing various Priest Class Quests.",
},[[
step
ding 10
step
Enter the building |goto Dun Morogh 46.95,52.05 < 7 |walk
talk Maxan Anvol##1226
|tip Inside the building.
accept Desperate Prayer##5637 |goto Dun Morogh 47.34,52.18
|only if Dwarf Priest
step
Enter the building |goto Stormwind City 43.04,34.51 < 7 |walk
talk High Priestess Laurena##376
|tip Inside the building.
turnin Desperate Prayer##5637 |goto Stormwind City 38.58,26.02
|only if Dwarf Priest
step
Enter the building |goto Elwynn Forest 42.95,65.64 < 7 |walk
talk Priestess Josetta##377
|tip Upstairs inside the building.
accept Desperate Prayer##5637 |goto Elwynn Forest 43.29,65.72
|only if Human Priest
step
Enter the building |goto Stormwind City 43.04,34.51 < 7 |walk
talk High Priestess Laurena##376
|tip Inside the building.
turnin Desperate Prayer##5637 |goto Stormwind City 38.58,26.02
|only if Human Priest
step
Enter the building |goto Teldrassil 55.76,57.24 < 7 |walk
talk Laurna Morninglight##3600
|tip Inside the building.
accept Returning Home##5629 |goto Teldrassil 55.57,56.75
|only if NightElf Priest
step
talk Priestess Alathea##11401
|tip Upstairs inside the building.
turnin Returning Home##5629 |goto Darnassus 39.53,81.18
|only if NightElf Priest
step
ding 20
step
talk High Priest Rohan##11406
|tip Inside the building.
accept A Lack of Fear##5641 |goto Ironforge 24.72,8.14
turnin A Lack of Fear##5641 |goto Ironforge 24.72,8.14
|only if Dwarf Priest
step
Enter the building |goto Stormwind City 43.04,34.51 < 7 |walk
talk High Priestess Laurena##376
|tip Inside the building.
accept Arcane Feedback##5676 |goto Stormwind City 38.58,26.02
turnin Arcane Feedback##5676 |goto Stormwind City 38.58,26.02
|only if Human Priest
step
talk Priestess Alathea##11401
|tip Upstairs inside the building.
accept Elune's Grace##5672 |goto Darnassus 39.53,81.18
turnin Elune's Grace##5672 |goto Darnassus 39.53,81.18
|only if NightElf Priest
]])
GoatQuest:RegisterGuide("Leveling Guides\\Warrior Class Quests",{
description="This guide will walk you through completing various Warrior Class Quests.",
},[[
step
ding 10
step
talk Lyria Du Lac##913
accept A Warrior's Training##1638 |goto Elwynn Forest 41.09,65.77 |or
'|complete completedq(1679) |or
|only if Human Warrior
step
Enter the building |goto Stormwind City 71.60,39.93 < 7 |walk
talk Harry Burlguard##6089
|tip Inside the building.
turnin A Warrior's Training##1638 |goto Stormwind City 74.25,37.26
accept Bartleby the Drunk##1639 |goto Stormwind City 74.25,37.26 |or
'|complete completedq(1678) |or
|only if Human Warrior
step
talk Bartleby##6090
|tip He walks around this area inside the building.
turnin Bartleby the Drunk##1639 |goto Stormwind City 73.83,37.17
accept Beat Bartleby##1640 |goto Stormwind City 73.83,37.17 |or
'|complete completedq(1678) |or
|tip He will attack you immediately after you accept this quest.
|only if Human Warrior
step
talk Bartleby##6090
|tip He walks around this area inside the building.
turnin Beat Bartleby##1640 |goto Stormwind City 73.83,37.17
accept Bartleby's Mug##1665 |goto Stormwind City 73.83,37.17
|only if Human Warrior
step
talk Harry Burlguard##6089
|tip Inside the building.
turnin Bartleby's Mug##1665 |goto Stormwind City 74.25,37.26
|only if Human Warrior
step
talk Granis Swiftaxe##1229
|tip Inside the building.
accept Muren Stormpike##1679 |goto Dun Morogh 47.36,52.65 |or
'|complete completedq(1638) |or
|only if (Dwarf Warrior) or (Gnome Warrior)
step
talk Muren Stormpike##6114
|tip Upstairs inside the building.
turnin Muren Stormpike##1679 |goto Ironforge 70.78,90.27
accept Vejrek##1678 |goto Ironforge 70.78,90.27 |or
'|complete completedq(1665) |or
|only if (Dwarf Warrior) or (Gnome Warrior)
step
Follow the path up |goto Dun Morogh 27.97,56.18 < 20 |only if walking
kill Vejrek##6113
|tip Inside the hut.
collect Vejrek's Head##6799 |q 1678/1 |goto Dun Morogh 27.83,57.95 |or
'|complete completedq(1665)
|only if (Dwarf Warrior) or (Gnome Warrior)
step
talk Muren Stormpike##6114
|tip Upstairs inside the building.
turnin Vejrek##1678 |goto Ironforge/0 70.78,90.29 |or
'|complete completedq(1665)
|only if (Dwarf Warrior) or (Gnome Warrior)
step
talk Kyra Windblade##3598
accept Elanaria##1684 |goto Teldrassil 56.22,59.19
|only if NightElf Warrior
step
talk Elanaria##4088
turnin Elanaria##1684 |goto Darnassus 57.29,34.61
accept Vorlus Vilehoof##1683 |goto Darnassus 57.29,34.61
|only if NightElf Warrior
step
Follow the path |goto Teldrassil 48.78,61.64
Follow the path up |goto Teldrassil 49.02,63.24
Continue up the path |goto Teldrassil 47.98,64.47
kill Vorlus Vilehoof##6128
collect Horn of Vorlus##6805 |q 1683/1 |goto Teldrassil 47.26,63.52
|only if NightElf Warrior
step
talk Elanaria##4088
turnin Vorlus Vilehoof##1683 |goto Darnassus 57.29,34.61
|only if NightElf Warrior
step
ding 30
step
_NOTE:_
Incoming Difficult Quest
|tip You're going to be tasked with surviving the Affray, which is a combat trial.
|tip You'll be tasked with killing waves of enemies with very little downtime afforded in between.
|tip If possible, you may want to get help for this.
Click Here to Continue |confirm |q 1718 |future
|only if Warrior and hardcore()
step
Enter the building |goto Stormwind City 77.97,48.19 < 7 |walk
talk Wu Shen##5479
|tip Upstairs inside the building.
accept The Islander##1718 |goto Stormwind City 78.68,45.80
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
|tip Avoid using AoE abilities as they may aggro the other affray contestants. |only if hardcore()
|tip When you defeat an enemy, don't stand near the grate or it will force the next opponent. |only if hardcore()
|tip Eat or Bandage after each opponent. |only if hardcore()
|tip Step back after each opponent spawns. |only if hardcore()
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
_NOTE:_
Incoming Difficult Quest
|tip "The Summoning" quest coming up after Cyclonian has you facing a level 40 elite enemy.
|tip You will likely need help with this.
Click Here to Continue |confirm |q 1713 |future
|only if Warrior and hardcore()
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
|tip This is a level 40 Elite enemy. |only if hardcore()
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
Enter the building |goto Stormwind City 77.97,48.19 < 7 |walk
talk Wu Shen##5479
|tip Upstairs inside the building.
accept A Troubled Spirit##8417 |goto Stormwind City 78.68,45.80
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
|tip Watch for patrols and respawns around this area. |only if hardcore()
|only if Warrior
step
label "Kill_Shadowsworn_Cultitst"
kill 10 Shadowsworn Cultist##6004 |q 8424/2 |goto Blasted Lands 65.17,32.83
|tip Watch for patrols and respawns around this area. |only if hardcore() |notinsticky
|only if Warrior
step
label "Kill_Shadowsworn_Thug"
kill 20 Shadowsworn Thug##6005 |q 8424/3 |goto Blasted Lands 65.17,32.83
|tip Watch for patrols and respawns around this area. |only if hardcore() |notinsticky
|only if Warrior
step
talk Fallen Hero of the Horde##7572
turnin War on the Shadowsworn##8424 |goto Swamp of Sorrows 34.29,66.15
accept Voodoo Feathers##8425 |goto Swamp of Sorrows 34.29,66.15
|only if Warrior
step
_NOTE:_
Incoming Dungeon Step
|tip The next couple of steps will be taking you to the Sunken Temple dungeon.
|tip You will need a group to complete the dungeon as well as the quest.
|tip If you don't have a group, wait until you do before continuing.
Click Here to Continue |confirm |q 9053
|only if Warrior and hardcore()
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
talk Dazalar##3601
accept Taming the Beast##6063 |goto Teldrassil 56.68,59.49
|only if NightElf Hunter
step
use the Taming Rod##15921
|tip Use it on a Webwood Lurker around this area.
Tame a Webwood Lurker |q 6063/1 |goto Teldrassil 59.81,59.06
|tip Dismiss it after you tame it.
|tip It may attack you after you dismiss it.
|only if NightElf Hunter
step
talk Dazalar##3601
turnin Taming the Beast##6063 |goto Teldrassil 56.68,59.49
accept Taming the Beast##6101 |goto Teldrassil 56.68,59.49
|only if NightElf Hunter
step
use the Taming Rod##15922
|tip Use it on a Nightsaber Stalker around this area.
Tame a Nightsaber Stalker |q 6101/1 |goto Teldrassil 55.95,71.98
|tip Dismiss it after you tame it.
|tip It may attack you after you dismiss it.
|only if NightElf Hunter
step
talk Dazalar##3601
turnin Taming the Beast##6101 |goto Teldrassil 56.68,59.49
accept Taming the Beast##6102 |goto Teldrassil 56.68,59.49
|only if NightElf Hunter
step
Follow the road |goto Teldrassil 54.81,58.48 < 30 |only if walking
use the Taming Rod##15923
|tip Use it on a Strigid Screecher around this area.
Tame a Strigid Screecher |q 6102/1 |goto Teldrassil 43.99,51.16
|only if NightElf Hunter
step
Follow the road |goto Teldrassil 45.10,49.62 < 30 |only if walking
talk Dazalar##3601
turnin Taming the Beast##6102 |goto Teldrassil 56.68,59.49
accept Training the Beast##6103 |goto Teldrassil 56.68,59.49
|only if NightElf Hunter
step
Follow the road |goto Teldrassil 54.81,58.48 < 30 |only if walking
Enter Darnassus |goto Teldrassil 36.06,54.39 < 20 |only if walking
Run up the ramp |goto Darnassus 45.70,17.69 < 15 |only if walking
talk Jocaste##4146
|tip Inside the building.
turnin Training the Beast##6103 |goto Darnassus 40.38,8.56
|only if NightElf Hunter
step
talk Grif Wildheart##1231
accept Taming the Beast##6064 |goto Dun Morogh 45.81,53.03
|only if Dwarf Hunter
step
use the Taming Rod##15911
|tip Use it on a Large Crag Boar around this area.
Tame a Large Crag Boar |q 6064/1 |goto Dun Morogh 48.26,56.81
|tip Dismiss it after you tame it.
|tip It may attack you after you dismiss it.
|only if Dwarf Hunter
step
talk Grif Wildheart##1231
turnin Taming the Beast##6064 |goto Dun Morogh 45.81,53.04
accept Taming the Beast##6084 |goto Dun Morogh 45.81,53.04
|only if Dwarf Hunter
step
use the Taming Rod##15913
|tip Use it on a Snow Leopard around this area.
Tame a Snow Leopard |q 6084/1 |goto Dun Morogh 48.68,58.93
|tip Dismiss it after you tame it.
|tip It may attack you after you dismiss it.
|only if Dwarf Hunter
step
talk Grif Wildheart##1231
turnin Taming the Beast##6084 |goto Dun Morogh 45.81,53.04
accept Taming the Beast##6085 |goto Dun Morogh 45.81,53.04
|only if Dwarf Hunter
step
use the Taming Rod##15908
|tip Use it on an Ice Claw Bear around this area.
Tame an Ice Claw Bear |q 6085/1 |goto Dun Morogh 49.06,62.12
You can usually find another one around [50.11,53.57]
|only if Dwarf Hunter
step
talk Grif Wildheart##1231
turnin Taming the Beast##6085 |goto Dun Morogh 45.81,53.04
accept Training the Beast##6086 |goto Dun Morogh 45.81,53.04
|only if Dwarf Hunter
step
Enter the building |goto Ironforge 66.34,82.50 < 7 |walk
talk Belia Thundergranite##10090
|tip Inside the building.
turnin Training the Beast##6086 |goto Ironforge 70.87,85.80
|only if Dwarf Hunter
step
ding 50
|only if not hardcore()
step
ding 52
|only if hardcore()
step
talk Dorion##4205
|tip Upstairs inside the building.
accept The Hunter's Charm##8151 |goto Darnassus 42.21,7.26
|only if Hunter
step
Follow the path up |goto Azshara 42.09,42.45
talk Ogtinc##8405
turnin The Hunter's Charm##8151 |goto Azshara 42.40,42.62
accept Courser Antlers##8153 |goto Azshara 42.40,42.62
|only if Hunter
step
kill Mosshoof Courser##8761
|tip They are scattered all over the area.
|tip These have a low drop rate. |only if hardcore()
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
|tip They look like 3 headed beasts. |only if hardcore()
|tip They are underwater around this area.
|tip Watch for patroling elites while here. |only if hardcore()
|tip When you fight them, be sure that you arne't underwater. |only if hardcore()
|tip These enemies cannot be tracked. |only if hardcore()
|tip They also have a very low spawn rate. |only if hardcore()
collect 6 Wavethrasher Scale##20087 |q 8231/1 |goto Azshara 52.61,41.87
|tip These may have a low drop rate.
You can find more around here [59.77,37.36]
[67.20,33.08]
|tip The coordinates below are a bit further out, but there are more.
[72.19,35.39]
[84.34,33.76]
[86.73,25.65]
|only if Hunter
step
Follow the path up |goto Azshara 42.09,42.45
talk Ogtinc##8405
turnin Wavethrashing##8231 |goto Azshara 42.40,42.62
accept The Green Drake##8232 |goto Azshara 42.40,42.62
|only if Hunter
step
_NOTE:_
Incoming Dungeon Step
|tip The next couple of steps will be taking you to the Sunken Temple dungeon.
|tip You will need a group to complete the dungeon as well as the quest.
|tip If you don't have a group, wait until you do before continuing.
Click Here to Continue |confirm |q 8232
|only if Hunter and hardcore()
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
_NOTE:_
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
GoatQuest:RegisterGuide("Leveling Guides\\Rogue Class Quests",{
description="This guide will walk you through completing various Rogue Class Quests.",
},[[
step
ding 10
step
talk Hogral Bakkan##1234
accept Road to Salvation##2218 |goto Dun Morogh/0 47.56,52.61
|only if Rogue
step
talk Hulfdan Blackbeard##5165
|tip Downstairs inside the building.
turnin Road to Salvation##2218 |goto Ironforge/0 51.94,14.82
accept Simple Subterfugin'##2238 |goto Ironforge/0 51.94,14.82
|only if Rogue
step
talk Onin##6886
|tip On top of the platform.
turnin Simple Subterfugin'##2238 |goto Dun Morogh/0 25.16,44.45
accept Onin's Report##2239 |goto Dun Morogh/0 25.16,44.45
|only if Rogue
step
talk Hulfdan Blackbeard##5165
|tip Downstairs inside the building.
turnin Onin's Report##2239 |goto Ironforge/0 51.94,14.82
|only if Rogue
step
ding 16
|only if not hardcore()
step
ding 21
|tip We are waiting until 21 because the quest sends you to an area with level 23s.
|only if hardcore()
step
talk Lord Tony Romano##13283
|tip Inside the building.
Train the "Pick Lock" Ability |complete knowspell(1804) |goto Stormwind City 78.31,57.04
|only if Rogue
step
talk Gerald Crawley##3090
|tip Inside the building.
buy 1 Thieves' Tools##5060 |goto Redridge Mountains 25.09,41.15
|only if Rogue
step
Follow the road |goto Redridge Mountains 35.02,44.11 < 30 |only if walking
Follow the path |goto Redridge Mountains 43.30,37.54 < 30 |only if walking
click Practice Lockbox+
|tip They look like grey metal chests.
|tip Inside the building.
|tip Keep clicking them until you reach Lockpicking skill level 75.
Reach Level 75 in Lockpicking |skill Lockpicking,75 |goto Redridge Mountains 51.97,45.15 |q 2607 |future
|only if Rogue
step
ding 20
|only if not hardcore()
step
Follow the path |goto Stormwind City 74.74,53.70 < 7 |only if walking
Enter the building |goto Stormwind City 77.14,58.02 < 7 |walk
talk Master Mathias Shaw##332
|tip Upstairs inside the building.
accept Mathias and the Defias##2360 |goto Stormwind City 75.78,59.85
|only if Rogue
step
Leave the building |goto Stormwind City 77.11,58.00 < 7 |walk
Follow the path |goto Stormwind City 74.67,53.63 < 7 |only if walking
Leave Stormwind |goto Stormwind City 71.10,88.88 < 30 |only if walking
Follow the road |goto Elwynn Forest 27.55,77.78 < 30 |only if walking
Enter Westfall |goto Elwynn Forest 20.73,79.79 < 20 |only if walking
talk Thor##523
fpath Sentinel Hill |goto Westfall 56.56,52.64
|only if Rogue
step
talk Agent Kearnen##7024
turnin Mathias and the Defias##2360 |goto Westfall 68.49,70.08
accept Klaven's Tower##2359 |goto Westfall 68.49,70.08
|only if Rogue
step
collect Defias Tower Key##7923 |q 2359/2 |goto Westfall 71.63,73.91
|tip Use your "Pickpocket" ability on Malformed Defias Drone.
|tip He walks around this area.
|tip Look out for the pair of Defias Drones patrolling as well. |only if hardcore()
|only if Rogue
step
Enter the building |goto Westfall 69.97,74.07 < 7 |walk
click Duskwood Chest##123214
|tip Upstairs inside the building.
|tip You will get a debuff after opening it.
|tip Use your "Sap" ability on Klaven Mortwake nearby before clicking the chest.
|tip He is elite, but you should be fine.
|tip If you have trouble, try to find someone to help you.
collect Klaven Mortwake's Journal##7908 |q 2359/1 |goto Westfall 70.41,73.93
|only if Rogue
step
Leave the building |goto Westfall 69.95,74.04 < 7 |walk
Follow the path |goto Stormwind City 74.74,53.70 < 7 |only if walking
Enter the building |goto Stormwind City 77.14,58.02 < 7 |walk
talk Master Mathias Shaw##332
|tip Upstairs inside the building.
turnin Klaven's Tower##2359 |goto Stormwind City 75.78,59.85
accept The Touch of Zanzil##2607 |goto Stormwind City 75.78,59.85
|only if Rogue
step
talk Doc Mixilpixil##7207
|tip Downstairs inside the building.
turnin The Touch of Zanzil##2607 |goto Stormwind City 78.04,58.77
accept The Touch of Zanzil##2608 |goto Stormwind City 78.04,58.77
|only if Rogue
step
Watch the dialogue
|tip Use the "/lay" emote while targeting Doc Mixilpixil.
Complete the Diagnosis |q 2608/1 |goto Stormwind City 78.04,58.77
|only if Rogue
step
talk Doc Mixilpixil##7207
|tip Downstairs inside the building.
turnin The Touch of Zanzil##2608 |goto Stormwind City 78.04,58.77
|only if Rogue
step
Remove the Touch of Zanzil |nobuff Touch of Zanzil##9991
|tip You will still have the "Touch of Zanzil" debuff.
|tip There is a quest to remove the buff.
|tip The quest makes you gather items in Stormwind City, but gathering the items can cost a lot of silver.
|tip To remove the buff without doing the quest and wasting money, you have 2 options:
|tip If you have First Aid leveled, create an "Anti-Venom" and use it on yourself.
|tip You can also try to buy one from the Auction House, they're usually cheap. |only if not selfmade()
|tip Alternatively, try to ask a Druid player to use their "Cure Poison" ability on you.
|only if Rogue
step
ding 50
|only if not hardcore()
step
ding 52
|tip We are waiting until 52 because there are higher level enemies around the are which you'll be questing.
|only if hardcore()
step
talk Lord Tony Romano##13283
|tip Inside the building.
accept A Simple Request##8233 |goto Stormwind City 78.32,57.04
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
|tip You can also Pickpocket them.
|tip Watch for patrols and respawns while in the area. |only if hardcore()
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
|tip Pickpocket them before killing them.
|tip Kill Mistwing Ravagers if you run out of oozes to kill. |only if hardcore()
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
_NOTE:_
Incoming Dungeon Step
|tip The next couple of steps will be taking you to the Sunken Temple dungeon.
|tip You will need a group to complete the dungeon as well as the quest.
|tip If you don't have a group, wait until you do before continuing.
Click Here to Continue |confirm |q 8236
|only if Rogue and hardcore()
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
GoatQuest:RegisterGuide("Leveling Guides\\Mage Class Quests",{
description="This guide will walk you through completing various Mage Class Quests.",
},[[
step
ding 10
step
talk Zaldimar Wefhellt##328
|tip Upstairs inside the building.
accept Speak with Jennea##1860 |goto Elwynn Forest 43.25,66.19
|only if Mage
step
talk Jennea Cannon##5497
|tip Upstairs inside the tower.
turnin Speak with Jennea##1860 |goto Stormwind City 38.54,79.35
accept Mirror Lake##1861 |goto Stormwind City 38.54,79.35
|only if Mage
step
use Jennea's Flask##7207
|tip Use it while in the water.
collect Mirror Lake Water Sample##7206 |q 1861/1 |goto Elwynn Forest 28.78,61.47
step
talk Jennea Cannon##5497
|tip Upstairs inside the tower.
turnin Mirror Lake##1861 |goto Stormwind City 38.54,79.35
|only if Mage
step
ding 15
step
talk Dink##7312
|tip Inside the building
accept Report to Jennea##1919 |goto Ironforge 27.18,8.58
|only if Gnome Mage
step
talk Zaldimar Wefhellt##328
|tip Upstairs inside the building.
accept Report to Jennea##1919 |goto Elwynn Forest 43.25,66.19
|only if Human Mage
step
talk Jennea Cannon##5497
|tip Upstairs inside the tower.
turnin Report to Jennea##1919 |goto Stormwind City 38.54,79.35
accept Investigate the Blue Recluse##1920 |goto Stormwind City 38.54,79.35
|only if Mage
step
click Chest of Containment Coffers##105174
|tip Upstairs inside the tower.
collect Chest of Containment Coffers##7247 |q 1920/2 |goto Stormwind City 38.59,79.06
|only if Mage
step
click Cantation of Manifestation##105175
|tip Upstairs inside the tower.
collect Cantation of Manifestation##7308 |q 1920/3 |goto Stormwind City 38.70,78.78
|only if Mage
step
Enter the building |goto Stormwind City 39.90,85.36 < 5 |walk
use Cantation of Manifestation##7308
|tip Inside the building.
|tip This will cause Rift Spawns to appear.
kill Rift Spawn##6492
use Chest of Containment Coffers##7247
click Filled Containment Coffer##103574
collect 1 Filled Containment Coffer##7292 |complete itemcount(7292) >= 1 |q 1920/1 |goto Stormwind City 40.64,91.92
|only if Mage
step
use Cantation of Manifestation##7308
|tip Inside the building.
|tip This will cause Rift Spawns to appear.
kill Rift Spawn##6492
use Chest of Containment Coffers##7247
click Filled Containment Coffer##103574
collect 2 Filled Containment Coffer##7292 |complete itemcount(7292) >= 2 |q 1920/1|goto Stormwind City 40.46,92.81
|only if Mage
step
use Cantation of Manifestation##7308
|tip Downstairs inside the building.
|tip This will cause Rift Spawns to appear.
kill Rift Spawn##6492
use Chest of Containment Coffers##7247
click Filled Containment Coffer##103574
collect 3 Filled Containment Coffer##7292 |complete itemcount(7292) >= 3 |q 1920/1 |goto Stormwind City 40.46,90.90
|only if Mage
step
talk Jennea Cannon##5497
|tip Upstairs inside the tower.
turnin Investigate the Blue Recluse##1920 |goto Stormwind City 38.54,79.35
accept Gathering Materials##1921 |goto Stormwind City 38.54,79.35
|only if Mage
stickystart "Collect_10_Linen"
step
Enter the mine |goto Loch Modan 35.47,19.08 < 8 |walk
click Miners' League Crates##271
|tip Inside the mine.
|tip Keep an eye out for patrols and casters. |only if hardcore()
collect 6 Charged Rift Gem##7249 |q 1921/2 |goto Loch Modan 35.85,22.58
|only if Mage
step
label "Collect_10_Linen"
collect 10 Linen Cloth##2589 |q 1921/1
|tip These drop from Tunnel Rat enemies inside the cave.
|tip Keep an eye out for patrols and casters while in the cave. |only if hardcore() |notinsticky
|tip You can also purchase them from the Auction House. |only if not selfmade()
|only if Mage
step
talk Wynne Larson##1309
|tip Inside the building
turnin Gathering Materials##1921 |goto Stormwind City 41.57,76.35
accept Manaweave Robe##1941 |goto Stormwind City 41.57,76.35
|only if Mage
step
ding 26
step
talk Jennea Cannon##5497
|tip Upstairs inside the tower.
accept High Sorcerer Andromath##1939 |goto Stormwind City 38.54,79.35
|only if Mage
step
talk High Sorcerer Andromath##5694
|tip Upstairs inside the tower.
turnin High Sorcerer Andromath##1939 |goto Stormwind City 37.52,81.64
accept Ur's Treatise on Shadow Magic##1938 |goto Stormwind City 37.52,81.64
|only if Mage
step
click Ur's Treatise on Shadow Magic##103628
|tip Upstairs inside the tower.
collect Ur's Treatise on Shadow Magic##7266 |q 1938/1 |goto Redridge Mountains 78.87,47.64
|only if Mage
step
talk High Sorcerer Andromath##5694
|tip Upstairs inside the tower.
turnin Ur's Treatise on Shadow Magic##1938 |goto Stormwind City 37.52,81.64
accept Pristine Spider Silk##1940 |goto Stormwind City 37.52,81.64
|only if Mage
step
Kill enemies around this area
collect 8 Pristine Spider Silk##7267 |q 1940/1 |goto Duskwood 31.38,26.95
You can find more around here [34.42,56.77]
|only if Mage
step
talk Wynne Larson##1309
|tip Inside the building
turnin Pristine Spider Silk##1940 |goto Stormwind City 41.57,76.35
Watch the dialogue
accept Astral Knot Garment##1942 |goto Stormwind City 41.57,76.35
|only if Mage
step
ding 30
|only if not hardcore()
step
ding 34
|tip We are waiting until this level because you will be traveling through higher level areas.
|only if not hardcore()
step
talk Jennea Cannon##5497
|tip Upstairs inside the tower.
accept Journey to the Marsh##1947 |goto Stormwind City 38.54,79.35
|only if Mage
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
_NOTE:_
Incoming Dungeon Step
|tip The next couple of steps will be taking you to the Scarlet Monastery (Library) dungeon.
|tip You will need a group to complete the dungeon as well as the quest.
|tip If you don't have a group, wait until you do before continuing.
Click Here to Continue |confirm |q 1951
|only if Mage and hardcore()
step
Enter the building |goto Tirisfal Glades/0 82.65,32.88 < 7 |walk
Enter the Portal |goto Tirisfal Glades/0 85.33,32.27 < 7 |walk
Enter the Scarlet Monastery - Library Dungeon with Your Group |goto Scarlet Monastery/0 0.00,0.00 < 500 |c |noway |q 1951
step
Inside the Scarlet Monastery Library Dungeon:
click Rituals of Power##103664
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
turnin Mage's Wand##1952 |goto Dustwallow Marsh 46.06,57.09 |noautoaccept
|only if Mage
step
ding 40
|only if Mage and not hardcore()
step
ding 45
|tip We are waiting until level 45 because there is an elite enemy that will need to be killed.
|tip It will be level 40, but you may need help as it still hits hard.
|only if Mage and hardcore()
step
talk Jennea Cannon##5497
|tip Upstairs inside the tower.
accept Return to the Marsh##1953 |goto Stormwind City 38.54,79.35
|only if Mage
step
talk Tabetha##6546
|tip Inside the building.
turnin Return to the Marsh##1953 |goto Dustwallow Marsh 46.06,57.09
accept The Infernal Orb##1954 |goto Dustwallow Marsh 46.06,57.09
|only if Mage
step
kill Burning Blade Summoner##4668
|tip You may have to look around for them. |only if hardcore()
|tip Watch out for patrols and respawns while in the area. |only if hardcore()
collect Infernal Orb##7291 |q 1954/1 |goto Desolace 53.34,79.05
|only if Mage
step
_NOTE:_
Incoming Elite Quest
|tip During the quest "The Exorcism", you will be tasked with killing The Demon of the Orb, which is a level 40 elite enemy.
|tip It will deal a lot of a damage.
|tip If you are unable to get help, you should have your best healing potions ready.
Click Here to Continue |confirm |q 1955 |future
|only if Mage and hardcore()
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
_NOTE:_
Incoming Dungeon Step
|tip The next couple of steps will be taking you to the Uldaman dungeon.
|tip You will need a group to complete the dungeon as well as the quest.
|tip If you don't have a group, wait until you do before continuing.
Click Here to Continue |confirm |q 1956
|only if Mage and hardcore()
step
Enter the Uldaman Dungeon with Your Group |goto Uldaman/0 0.00,0.00 < 500 |c |q 1956
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
talk Jennea Cannon##5497
|tip Upstairs inside the tower.
accept Tabetha's Task##2861 |goto Stormwind City 38.54,79.35
|only if Mage
step
talk Tabetha##6546
|tip Inside the building.
turnin Tabetha's Task##2861 |goto Dustwallow Marsh 46.06,57.09
accept Tiara of the Deep##2846 |goto Dustwallow Marsh 46.06,57.09
|only if Mage
step
_NOTE:_
Incoming Dungeon Step
|tip The next couple of steps will be taking you to the Zul'Farrak dungeon.
|tip You will need a group to complete the dungeon as well as the quest.
|tip If you don't have a group, wait until you do before continuing.
Click Here to Continue |confirm |q 2846
|only if Mage and hardcore()
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
_NOTE:_
Incoming Dungeon Step
|tip The next couple of steps will be taking you to the Dire Maul (North) dungeon.
|tip You will need a group to complete the dungeon as well as the quest.
|tip If you don't have a group, wait until you do before continuing.
Click Here to Continue |confirm |q 7463 |future
|only if Mage and hardcore()
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
_NOTE:_
Incoming Dungeon Step
|tip The next couple of steps will be taking you to the Dire Maul (East) dungeon.
|tip You will need a group to complete the dungeon as well as the quest.
|tip If you don't have a group, wait until you do before continuing.
Click Here to Continue |confirm |q 7463 |future
|only if Mage and hardcore()
step
Run up the ramp |goto Feralas/0 59.13,44.67 < 20 |only if walking
Follow the path |goto Feralas/0 59.52,39.51 < 15 |only if walking
Continue following the path |goto Feralas/0 61.72,38.78 < 15 |only if walking
Continue following the path |goto Feralas/0 61.15,34.87 < 7 |only if walking
Continue following the path |goto Feralas/0 64.85,30.18 < 7 |only if walking
Enter the Dire Maul - East Dungeon with Your Group |goto Dire Maul/0 0.00,0.00 < 500 |c |q 7463 |future
step
Inside the Dire Maul East Dungeon:
kill Hydrospawn##13280
|tip Refer to the Dire Maul East Dungeon guide to accomplish this.
collect Hydrospawn Essence##18299
|only if Mage
step
_NOTE:_
Incoming Dungeon Step
|tip The next couple of steps will be taking you to the Dire Maul (North) dungeon.
|tip You will need a group to complete the dungeon as well as the quest.
|tip If you don't have a group, wait until you do before continuing.
Click Here to Continue |confirm |q 7463 |future
|only if Mage and hardcore()
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
turnin Arcane Refreshment##7463
|only if Mage
]])
GoatQuest:RegisterGuide("Leveling Guides\\Paladin Class Quests",{
description="This guide will walk you through completing various Paladin Class Quests.",
},[[
step
ding 12
step
Enter the building |goto Stormwind City 43.44,35.14 < 7 |walk
talk Duthorian Rall##6171
|tip Inside the building.
accept The Tome of Divinity##1641 |goto Stormwind City 39.81,29.80
|only if Human Paladin
step
talk Duthorian Rall##6171
|tip Inside the building.
turnin The Tome of Divinity##1641 |goto Stormwind City 39.81,29.80
|only if Human Paladin
step
use the Tome of Divinity##6775
accept The Tome of Divinity##1642
|only if Human Paladin
step
talk Duthorian Rall##6171
|tip Inside the building.
turnin The Tome of Divinity##1642 |goto Stormwind City 39.81,29.80
accept The Tome of Divinity##1643 |goto Stormwind City 39.81,29.80
|only if Human Paladin
step
Leave the building |goto Stormwind City 43.06,34.49 < 7 |walk
talk Stephanie Turner##6174
turnin The Tome of Divinity##1643 |goto Stormwind City 57.08,61.74
accept The Tome of Divinity##1644 |goto Stormwind City 57.08,61.74
|only if Human Paladin
step
Enter the building |goto Stormwind City 53.99,58.98 < 7 |walk
talk Auctioneer Jaxon##15659
|tip Inside the building.
|tip Buy these items from the Auction House.
|tip Or, refer to the Linen Cloth farming guide to accomplish this.
collect 10 Linen Cloth##2589 |q 1644/1 |goto Stormwind City 53.61,59.76
|only if Human Paladin and selfmade()
step
Leave the building |goto Stormwind City 53.86,58.92 < 7 |walk
talk Stephanie Turner##6174
turnin The Tome of Divinity##1644 |goto Stormwind City 57.08,61.74
accept The Tome of Divinity##1780 |goto Stormwind City 57.08,61.74
|only if Human Paladin
step
Enter the building |goto Stormwind City 43.44,35.14 < 7 |walk
talk Duthorian Rall##6171
|tip Inside the building.
turnin The Tome of Divinity##1780 |goto Stormwind City 39.81,29.80
accept The Tome of Divinity##1781 |goto Stormwind City 39.81,29.80
|only if Human Paladin
step
talk Gazin Tenorm##6173
|tip Inside the building.
turnin The Tome of Divinity##1781 |goto Stormwind City 38.55,26.45
accept The Tome of Divinity##1786 |goto Stormwind City 38.55,26.45
|only if Human Paladin
step
Leave the building |goto Stormwind City 43.06,34.49 < 7 |walk
Leave Stormwind City |goto Stormwind City 71.05,88.81 < 30 |only if walking
Follow the road |goto Elwynn Forest 42.70,67.19 < 30 |only if walking
Follow the path |goto Elwynn Forest 69.14,70.95 < 30 |only if walking
use the Symbol of Life##6866
|tip Watch for Defias Rogue Wizards around here. |only if hardcore()
|tip They are ranged attackers with an abnormal sized aggro radius. |only if hardcore()
|tip Use it on Henze Faulk's corpse.
Ressurect Henze Faulk |q 1786/1 |goto Elwynn Forest 72.60,51.41
|only if Human Paladin
step
talk Henze Faulk##6172
turnin The Tome of Divinity##1786 |goto Elwynn Forest 72.60,51.41
accept The Tome of Divinity##1787 |goto Elwynn Forest 72.60,51.41
|only if Human Paladin
step
kill Defias Rogue Wizard##474+
|tip They are ranged attackers with an abnormal sized aggro radius. |only if hardcore()
collect Defias Script##6846 |q 1787/1 |goto Elwynn Forest 74.07,51.57
|only if Human Paladin
step
Follow the road |goto Elwynn Forest 70.14,70.84 < 30 |only if walking
Continue following the road |goto Elwynn Forest 42.19,64.92 < 30 |only if walking
Enter Stormwind City |goto Elwynn Forest 32.07,49.32 < 30 |only if walking
Enter the building |goto Stormwind City 43.44,35.14 < 7 |walk
talk Gazin Tenorm##6173
|tip Inside the building.
turnin The Tome of Divinity##1787 |goto Stormwind City 38.56,26.47
accept The Tome of Divinity##1788 |goto Stormwind City 38.56,26.47
|only if Human Paladin
step
talk Duthorian Rall##6171
|tip Inside the building.
turnin The Tome of Divinity##1788 |goto Stormwind City 39.81,29.80
|only if Human Paladin
step
Enter the building |goto Ironforge 27.28,12.31 < 10 |walk
talk Brandur Ironhammer##5149
|tip Inside the building.
accept Tome of Divinity##2997 |goto Ironforge 23.12,6.14
|only if Dwarf Paladin
step
talk Tiza Battleforge##6179
|tip Upstairs inside the building.
turnin Tome of Divinity##2997 |goto Ironforge 27.64,12.19
accept The Tome of Divinity##1645 |goto Ironforge 27.64,12.19
|only if Dwarf Paladin
step
talk Tiza Battleforge##6179
|tip Upstairs inside the building.
accept The Tome of Divinity##1646 |goto Ironforge 27.64,12.19
|only if Dwarf Paladin
step
use the Tome of Divinity##6916
accept The Tome of Divinity##1646
|only if Dwarf Paladin
step
talk Tiza Battleforge##6179
|tip Upstairs inside the building.
turnin The Tome of Divinity##1646 |goto Ironforge 27.64,12.19
accept The Tome of Divinity##1647 |goto Ironforge 27.64,12.19
|only if Dwarf Paladin
step
talk John Turner##6175
|tip He walks around this area
turnin The Tome of Divinity##1647 |goto Ironforge 21.55,50.80
accept The Tome of Divinity##1648 |goto Ironforge 21.55,50.80
You can also find him around: |notinsticky
[22.93,61.36]
[32.40,78.58]
[43.09,84.17]
|only if Dwarf Paladin
step
Enter the building |goto Ironforge 26.14,72.21 < 10 |walk
talk Auctioneer Redmuse##8720
|tip Inside the building.
collect 10 Linen Cloth##2589 |q 1648/1 |goto Ironforge 24.25,74.57
|tip Buy them from the Auction House.
|only if Dwarf Paladin and selfmade()
step
talk John Turner##6175
|tip He walks around this area
turnin The Tome of Divinity##1648 |goto Ironforge 21.55,50.80
accept The Tome of Divinity##1778 |goto Ironforge 21.55,50.80
You can also find him around: |notinsticky
[22.93,61.36]
[32.40,78.58]
[43.09,84.17]
|only if Dwarf Paladin
step
Enter the building |goto Ironforge 27.28,12.31 < 10 |only if walking
talk Tiza Battleforge##6179
|tip Upstairs inside the building.
turnin The Tome of Divinity##1778 |goto Ironforge 27.64,12.19
accept The Tome of Divinity##1779 |goto Ironforge 27.64,12.19
|only if Dwarf Paladin
step
talk Muiredon Battleforge##6178
|tip Upstairs inside the building.
turnin The Tome of Divinity##1779 |goto Ironforge 23.53,8.29
accept The Tome of Divinity##1783 |goto Ironforge 23.53,8.29
|only if Dwarf Paladin
step
Follow the road |goto Dun Morogh 49.69,46.36 < 30 |only if walking
Follow the path |goto Dun Morogh 73.14,49.95 < 30 |only if walking
use the Symbol of Life##6866
|tip Use it on Narm Faulk's corpse.
Resseurect Narm Faulk |q 1783/1 |goto Dun Morogh 78.32,58.09
|only if Dwarf Paladin
step
talk Narm Faulk##6177
turnin The Tome of Divinity##1783 |goto Dun Morogh 78.32,58.09
accept The Tome of Divinity##1784 |goto Dun Morogh 78.32,58.09
|only if Dwarf Paladin
step
kill Dark Iron Spy##6123+
collect Dark Iron Script##6847 |q 1784/1 |goto Dun Morogh 77.39,61.27
|only if Dwarf Paladin
step
Follow the road |goto Dun Morogh 72.88,49.82 < 30 |only if walking
Follow the path up |goto Dun Morogh 47.25,41.65 < 20 |only if walking
Enter Ironforge |goto Dun Morogh 53.47,34.90 < 20 |walk
Enter the building |goto Ironforge 27.28,12.31 < 15 |only if walking
talk Muiredon Battleforge##6178
|tip Upstairs inside the building.
turnin The Tome of Divinity##1784 |goto Ironforge 23.53,8.29
accept The Tome of Divinity##1785 |goto Ironforge 23.53,8.29
|only if Dwarf Paladin
step
talk Tiza Battleforge##6179
|tip Upstairs inside the building.
turnin The Tome of Divinity##1785 |goto Ironforge 27.64,12.19
|only if Dwarf Paladin
step
ding 20
|only if not hardcore()
step
ding 24
|tip We are waiting until 24 becuase there will be a difficult quest coming up.
|tip You will need to defeat 3 waves of enemies.
|tip The first wave has 3 enemies, the second has 4 and the final has 5.
|tip Even at this level, you may still need help with this.
|only if hardcore()
step
talk Duthorian Rall##6171
|tip Inside the building.
accept The Tome of Valor##1794 |goto Stormwind City 39.81,29.80 |or
accept The Tome of Valor##1793 |goto Stormwind City 39.81,29.80 |or
|only if Paladin
step
use the Tome of Valor##6776
accept The Tome of Valor##1649
|only if Paladin
step
talk Duthorian Rall##6171
turnin The Tome of Valor##1649 |goto Stormwind City 39.81,29.80
accept The Tome of Valor##1650 |goto Stormwind City 39.81,29.80
|only if Paladin
step
Follow the path up |goto Westfall 38.34,81.95 < 15 |only if walking
Follow the path down |goto Westfall 40.13,86.97 < 15 |only if walking
talk Daphne Stilwell##6182
|tip She walks around the area.
turnin The Tome of Valor##1650 |goto Westfall 42.71,88.40
accept The Tome of Valor##1651 |goto Westfall 42.71,88.40
|only if Paladin
step
kill Defias Raider##6180
|tip You may need help with this.
|tip They spawn in waves, the first has 3, the second has 4 and the third has 5.
Protect Daphne Stillwell from the Defias |q 1651/1 |goto Westfall 42.29,88.57
|only if Paladin
step
talk Daphne Stilwell##6182
|tip She walks around the area.
turnin The Tome of Valor##1651 |goto Westfall 42.71,88.40
accept The Tome of Valor##1652 |goto Westfall 42.71,88.40
|only if Paladin
step
talk Duthorian Rall##6171
turnin The Tome of Valor##1652 |goto Stormwind City 39.81,29.80
accept The Test of Righteousness##1653 |goto Stormwind City 39.81,29.80
|only if Paladin
step
talk Jordan Stilwell##6181
turnin The Test of Righteousness##1653 |goto Dun Morogh 52.48,36.92
accept The Test of Righteousness##1654 |goto Dun Morogh 52.48,36.92
|only if Paladin
step
_NOTE:_
Incoming Dungeon Steps
|tip The next couple of steps will be taking you to the Deadmines and Shadowfang Keep dungeons.
|tip You will need a group to complete the dungeon as well as the quest.
|tip If you don't have a group, wait until you do before continuing.
Click Here to Continue |confirm |q 1654 |future
|only if Paladin and hardcore()
step
Enter the building |goto Westfall/0 42.57,71.83 < 5 |walk
Jump down here |goto Westfall/0 43.42,72.89 < 5 |walk
Follow the path |goto Westfall/0 42.40,75.87 < 10 |walk
Follow the path |goto Westfall/0 41.79,78.54 < 10 |walk
Jump down here |goto Westfall/0 39.64,78.12 < 10 |walk
Enter the Deadmines Dungeon with Your Group |goto The Deadmines/0 0.00,0.00 < 500 |c |q 1654
step
Inside the Deadmines Dungeon:
|tip You can skip this step for now and do it later if you're unable to get a group. |only if hardcore()
kill Goblin Woodcarver##641
collect Whitestone Oak Lumber##6994 |q 1654/1
|only if Paladin
step
Enter the Shadowfang Keep Dungeon with Your Group |goto Shadowfang Keep/0 0.00,0.00 < 500 |c |q 1654
step
Inside the Shadowfang Keep Dungeon:
|tip You can skip this step for now and do it later if you're unable to get a group. |only if hardcore()
click Jordan's Smithing Hammer##91138
|tip Inside the stable area of the dungeon.
collect Jordan's Smithing Hammer##6895 |q 1654/3
|only if Paladin
step
_NOTE:_
Incoming Elite Area
|tip The area you're about to venture into is surrounded by level 20 elite enemies.
|tip If you're able, you may want to get help before continuing.
Click Here to Continue |confirm |q 1655 |future
|only if Paladin and hardcore()
step
talk Bailor Stonehand##6241
|tip Inside the building.
accept Bailor's Ore Shipment##1655 |goto Loch Modan 35.96,44.92
|only if Paladin
step
click Bailor's Ore##92420
|tip It looks like a crate next to a tree stump.
collect Jordan's Ore Shipment##6992 |q 1655/1 |goto Loch Modan 71.62,21.55
|only if Paladin
step
talk Bailor Stonehand##6241
|tip Inside the building.
|tip You may need help with this.
turnin Bailor's Ore Shipment##1655 |goto Loch Modan 35.96,44.92
collect Jordan's Ore Shipment##6992 |q 1654/2
|only if Paladin
step
talk Thundris Windweaver##3649
|tip Inside the building.
accept Seeking the Kor Gem##1442 |goto Darkshore 37.40,40.13
|only if Paladin
step
_NOTE:_
Incoming Elite Area
|tip The area you're about to venture into is surrounded by level 22 elite enemies.
|tip If you're able, you may want to get help before continuing.
Click Here to Continue |confirm |q 1442 |future
|only if Paladin and hardcore()
step
Follow the path |goto Ashenvale 14.11,14.87 < 15 |only if walking
Jump down into the water |goto Kalimdor 43.97,35.37 < 20 |walk
Enter the underwater cave |goto Kalimdor 43.94,35.27 < 7 |walk
Kill Blackfathom enemies around this area
|tip They are elite enemies.
|tip You may need help with this. |only if not hardcore()
|tip You will likely need help with this task unless you are overleveled. |only if hardcore()
collect Corrupted Kor Gem##6995 |q 1442/1 |goto Kalimdor 43.82,35.14
|only if Paladin
step
talk Thundris Windweaver##3649
|tip Inside the building.
accept Seeking the Kor Gem##1442 |goto Darkshore 37.40,40.13
collect Purified Kor Gem##7083 |q 1654/4
|only if Paladin
step
talk Jordan Stilwell##6181
turnin The Test of Righteousness##1654 |goto Dun Morogh 52.48,36.92
accept The Test of Righteousness##1806 |goto Dun Morogh 52.48,36.92
|only if Paladin
step
Watch the dialogue
talk Jordan Stilwell##6181
turnin The Test of Righteousness##1806 |goto Dun Morogh 52.48,36.92
|only if Paladin
step
ding 40
step
talk Duthorian Rall##6171
|tip Inside the building.
accept The Tome of Nobility##1661 |goto Stormwind City 39.82,29.81
turnin The Tome of Nobility##1661 |goto Stormwind City 39.82,29.81
|only if Paladin
step
ding 52
step
talk Lord Grayson Shadowbreaker##928
|tip Inside the building.
accept Chillwind Point##8415 |goto Stormwind City 37.14,33.25
|only if Paladin
step
talk Commander Ashlam Valorfist##10838
turnin Chillwind Point##8415 |goto Western Plaguelands 42.70,84.03
accept Dispelling Evil##8414 |goto Western Plaguelands 42.70,84.03
|only if Paladin
step
Kill enemies around this area
|tip Avoid Flesh Golems that patrol around the area.
collect 20 Minion's Scourgestone##12840 |q 8414/1 |goto Western Plaguelands 40.65,70.27
You can find more around here [44.38,69.97]
|only if Paladin
step
talk High Priest Thel'danis##1854
|tip He patrols around the area.
turnin Dispelling Evil##8414 |goto Western Plaguelands 52.09,83.35
accept Inert Scourgestones##8416 |goto Western Plaguelands 52.09,83.35
|only if Paladin
step
talk Commander Ashlam Valorfist##10838
turnin Inert Scourgestones##8416 |goto Western Plaguelands 42.70,84.03
accept Forging the Mightstone##8418 |goto Western Plaguelands 42.70,84.03
|only if Paladin
step
_NOTE:_
Incoming Dungeon Step
|tip The next couple of steps will be taking you to the Sunken Temple dungeon.
|tip You will need a group to complete the dungeon as well as the quest.
|tip If you don't have a group, wait until you do before continuing.
Click Here to Continue |confirm |q 8236
|only if Paladin and hardcore()
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
|only if Paladin
stickystart "Blue_Voodoo_Feathers"
stickystart "Green_Voodoo_Feathers"
step
Inside the Temple of Atal'Hakkar:
collect 2 Amber Voodoo Feather##20606 |q 8418/1
|tip These come from Gasher and Zul'Lor.
|only if Paladin
step
label "Blue_Voodoo_Feathers"
Inside the Temple of Atal'Hakkar:
collect 2 Blue Voodoo Feather##20607 |q 8418/2
|tip These come from Mijan and Hukku.
|only if Paladin
step
label "Green_Voodoo_Feathers"
Inside the Temple of Atal'Hakkar:
collect 2 Green Voodoo Feather##20608 |q 8418/3
|tip These come from Zolo and Loro.
|only if Paladin
step
talk Commander Ashlam Valorfist##10838
turnin Forging the Mightstone##8418 |goto Western Plaguelands 42.70,84.03
|only if Paladin
step
ding 60
step
talk Duthorian Rall##6171
|tip Inside the building.
accept Lord Grayson Shadowbreaker##7638 |goto Stormwind City 39.82,29.80
|only if Paladin
step
talk Lord Grayson Shadowbreaker##928
|tip Inside the building.
turnin Lord Grayson Shadowbreaker##7638 |goto Stormwind City 37.14,33.27
accept Emphasis on Sacrifice##7637 |goto Stormwind City 37.14,33.27
|only if Paladin
step
Collect 150 Gold |complete _G.GetMoney() >= 1500000 |q 7637 |future
|only if Paladin
step
talk High Priest Rohan##11406
|tip He walks around inside the building.
turnin Emphasis on Sacrifice##7637 |goto Ironforge 26.98,7.30
accept To Show Due Judgment##7639 |goto Ironforge 26.98,7.30
|only if Paladin
step
talk Lord Grayson Shadowbreaker##928
|tip Inside the building.
turnin To Show Due Judgment##7639|goto Stormwind City 37.14,33.27
accept Exorcising Terrordale##7640 |goto Stormwind City 37.14,33.27
|only if Paladin
step
use the Exorcism Censer##18752
|tip Use it on the green circles on the ground around this area.
|tip The green circles can also appear inside buildings.
kill 25 Terrordale Spirit##14564 |q 7640/1 |goto Eastern Plaguelands 19.58,32.25
|tip 3 will spawn at a time.
|tip You may need help with this.
You can find more around here [17.92,31.06]
|only if Paladin
step
talk Lord Grayson Shadowbreaker##928
|tip Inside the building.
turnin xorcising Terrordale##7640|goto Stormwind City 37.14,33.27
accept The Work of Grimand Elmore##7641 |goto Stormwind City 37.14,33.27
|only if Paladin
step
talk Grimand Elmore##1416
|tip Inside the building.
turnin The Work of Grimand Elmore##7641 |goto Stormwind City 51.74,12.07
accept Collection of Goods##7642 |goto Stormwind City 51.74,12.07
|only if Paladin
step
Collect 150 Gold |complete _G.GetMoney() >= 1500000 |q 7642/5 |future
|only if Paladin
step
collect 10 Arthas##8836 |q 7642/2
|tip If you have the Herbalism profession, you can gather these.
|tip Search the guide menu for the item(s) to use the farming guides.
|tip You can also purchase them from the Auction House. |only if not selfmade()
|only if Paladin
step
collect 40 Runecloth##14047 |q 7642/3
|tip Search the guide menu for the item(s) to use the farming guides.
|tip You can also purchase them from the Auction House. |only if not selfmade()
|only if Paladin
step
collect 6 Arcanite Bar##12360 |q 7642/4
|tip These are made by Alchemists.
|tip It takes 1 Thorium Bar and 1 Arcane Crystal to make one.
|tip Try to find a Alchemist to create one for you.
|only if Paladin
step
_NOTE:_
Incoming Dungeon Step
|tip The next couple of steps will be taking you to the Stratholme (Undead) dungeon.
|tip You will need a group to complete the dungeon as well as the quest.
|tip If you don't have a group, wait until you do before continuing.
Click Here to Continue |confirm |q 7642
|only if Paladin and hardcore()
step
click Elders' Square Service Gate |goto Eastern Plaguelands/0 47.88,23.87 < 10 |walk
|tip This requires the Key to the City, which drops from Magistrate barthilas in Stratholme - Live.
Enter the Stratholme - Undead Dungeon with Your Group |goto Stratholme/0 0.00,0.00 < 500 |c |q 7642
step
Inside the Stratholme - Undead Dungeon:
click Stratholme Supply Crate
|tip They look like brown boxes along the walls of the dungeon.
collect 5 Stratholme Holy Water##13180 |q 7642/1
|only if Paladin
step
talk Grimand Elmore##1416
|tip Inside the building.
turnin Collection of Goods##7642 |goto Stormwind City 51.74,12.07
|only if Paladin
step
Follow Grimand Elmore
Watch the dialogue
accept Grimand's Finest Work##7648 |goto Stormwind City 51.74,12.07
|only if Paladin
step
talk Lord Grayson Shadowbreaker##928
|tip Inside the building.
turnin Grimand's Finest Work##7648 |goto Stormwind City 37.14,33.27
accept Ancient Equine Spirit##7643 |goto Stormwind City 37.14,33.27
|only if Paladin
step
talk Argent Quartermaster Lightspark##10857
buy 20 Enriched Manna Biscuit##13724 |q 7643 |future |goto Western Plaguelands 42.84,83.72
|tip You must be Friendy with The Argent Dawn to purchase these.
|tip Quest at Light's Hope Chapel in Eastern Plaguelands to accomplish this.
|only if Paladin
step
Collect 50 Gold |complete _G.GetMoney() >= 500000 |q 7637 |future
|only if Paladin
step
talk Merideth Carlson##2357
|tip Standing inside the stable.
accept Manna-Enriched Horse Feed##7645 |goto Hillsbrad Foothills 52.18,55.50
|only if Paladin
step
talk Merideth Carlson##2357
|tip Standing inside the stable.
turnin Manna-Enriched Horse Feed##7645 |goto Hillsbrad Foothills 52.18,55.50
|only if Paladin
step
collect Manna-Enriched Horse Feed##18775 |q 7643/1
|only if Paladin
step
_NOTE:_
Incoming Dungeon Step
|tip The next couple of steps will be taking you to the Diremaul (West) dungeon.
|tip You will need a group to complete the dungeon as well as the quest.
|tip If you don't have a group, wait until you do before continuing.
Click Here to Continue |confirm |q 7643
|only if Paladin and hardcore()
step
Run up the ramp |goto Feralas/0 59.13,44.67 < 20 |only if walking
Follow the path |goto Feralas/0 59.52,39.51 < 15 |only if walking
Continue following the path |goto Feralas/0 61.72,38.78 < 15 |only if walking
Continue following the path |goto Feralas/0 61.15,34.87 < 7 |only if walking
click Door |goto Feralas/0 60.32,30.16 < 10 |walk
|tip You need a Crescent Key to unlock this door.
|tip This drops from Pusillin in the "Dire Maul - East" dungeon.
Enter the Dire Maul - West Dungeon with Your Group |goto Dire Maul/0 0.00,0.00 < 500 |c |q 7643
step
Inside the Diremaul - West Dungeon:
kill Tendris Warpwood##11489
talk Ancient Equine Spirit##14566
|tip It appears after you kill Tendris Warpwood.
turnin Ancient Equine Spirit##7643
accept Blessed Arcanite Barding##7644
|only if Paladin
step
talk Lord Grayson Shadowbreaker##928
|tip Inside the building.
turnin Blessed Arcanite Barding##7644 |goto Stormwind City 37.14,33.27
accept The Divination Scryer##7646 |goto Stormwind City 37.14,33.27
|only if Paladin
step
collect 1 Azerothian Diamond##12800 |q 7646/1
|tip These are gathered with the mining profession.
|tip Refer to the Thorium farming guide to gather them.
|tip You can also purchase it from the auction house. |only if not selfmade()
|only if Paladin
step
collect 1 Pristine Black Diamond##18335 |q 7646/2
|tip These are a random world drop.
|tip High level instance enemies have a chance to drop them.
|tip You can also purchase them from the auction house. |only if not selfmade()
|only if Paladin
step
talk Lord Grayson Shadowbreaker##928
|tip Inside the building.
turnin The Divination Scryer##7646 |goto Stormwind City 37.14,33.27
accept Judgment and Redemption##7647 |goto Stormwind City 37.14,33.27
|only if Paladin
step
use Lord Grayson's Satchel##18804
collect Divination Scryer##18746
collect Blessed Arcanite Barding##18792 |q 7647/2
|only if Paladin
step
_NOTE:_
Incoming Dungeon Step
|tip The next couple of steps will be taking you to the Scholomance dungeon.
|tip You will need a group to complete the dungeon as well as the quest.
|tip If you don't have a group, wait until you do before continuing.
Click Here to Continue |confirm |q 7647
|only if Paladin and hardcore()
step
Enter the Scholomance Dungeon with Your Group |goto Scholomance/0 0.00,0.00 < 500 |c
|tip This requires the Skeleton Key from the quest "The Key to Scholomance".
|only if Paladin
step
Inside the Scholomance Dungeon:
use the Divination Scryer##18746
|tip Use it in the room with the boss Rattlegore after you have cleared it.
Kill enemies around this area
|tip They will spawn in waves.
|tip Make sure your group is prepared before using the Divination Scryer.
|tip If you wipe you will need to abandon and restart the quest.
kill Death Knight Darkreaver##14516
collect Charger's Lost Soul##18749 |q 7647/1
|only if Paladin
step
Inside the Scholomance Dungeon:
use the Charger's Lost Soul##18749
talk Darkreaver's Fallen Charger##14568
turnin Judgment and Redemption##7647
|only if Paladin
]])
GoatQuest:RegisterGuide("Leveling Guides\\Warlock Class Quests",{
description="This guide will walk you through completing various Warlock Class Quests.",
},[[
step
talk Drusilla La Salle##459
accept The Stolen Tome##1598 |goto Elwynn Forest 49.87,42.65
|only if Human Warlock
step
click Stolen Books##83763
collect Powers of the Void##6785 |q 1598/1 |goto Elwynn Forest 56.71,43.95
|only if Human Warlock
step
talk Drusilla La Salle##459
turnin The Stolen Tome##1598 |goto Elwynn Forest 49.87,42.65
|only if Human Warlock
step
talk Alamar Grimm##460
|tip Upstairs inside the building.
accept Beginnings##1599 |goto Dun Morogh 28.65,66.14
|only if Gnome Warlock
step
Enter the cave |goto Dun Morogh 26.80,79.86 < 15 |walk
Follow the path |goto Dun Morogh 28.00,81.05 < 10 |walk
kill Frostmane Novice##946+
|tip Inside the cave.
|tip There's only a few of them.
collect 3 Feather Charm##6753 |q 1599/1 |goto Dun Morogh 28.73,82.58
You can find more around: |notinsticky
[29.34,81.50]
[30.15,82.34]
[30.49,81.05]
|only if Gnome Warlock
step
Leave the cave |goto Dun Morogh 26.80,79.86 < 15 |c |q 1599
|only if Gnome Warlock
step
talk Alamar Grimm##460
|tip Upstairs inside the building.
turnin Beginnings##1599 |goto Dun Morogh 28.65,66.14
|only if Gnome Warlock
step
ding 10
step
Follow the path up |goto Dun Morogh 47.20,41.70 < 20 |only if walking
Enter Ironforge |goto Dun Morogh 53.47,34.90 < 20 |walk
talk Lago Blackwrench##6120
accept The Slaughtered Lamb##1715 |goto Ironforge 47.63,9.26
|only if Gnome Warlock
step
Follow the path |goto Ironforge 72.81,50.26 < 15 |walk
Enter the Deeprun Tram |goto Ironforge 77.02,51.26
Click Here After Entering Deeprun Tramp |confirm |q 1715
|only if Gnome Warlock
step
_Inside Deeprun Tram:_
Ride the Tram
|tip Ride the Deeprun Tram from Ironforge to Stormwind City.
Click Here After Riding the Tram |confirm |q 1715
|only if Gnome Warlock
step
_Inside Deeprun Tram:_
Enter Stormwind City |goto Stormwind City 62.94,9.36 < 2000 |noway |c |q 1715
|only if Gnome Warlock
step
Enter the building |goto Stormwind City 29.16,74.16 < 10 |walk
Follow the path down |goto Stormwind City 27.42,76.42 < 7 |walk
talk Gakin the Darkbinder##6122
|tip Downstairs inside the building.
turnin The Slaughtered Lamb##1715 |goto Stormwind City 25.26,78.56
accept Surena Caledon##1688 |goto Stormwind City 25.26,78.56
|only if Gnome Warlock
step
_NOTE:_
Incoming Difficult Quest
|tip The area where the next quest NPC is has a lot of potenial adds.
|tip Additionally, inside the building along side here are 2 other enemies.
Click Here to Continue |confirm |q 1688 |future
|only if (Gnome Warlock) and hardcore()
step
Leave the building |goto Stormwind City 29.15,74.18 < 10 |walk
Leave Stormwind City |goto Stormwind City 71.02,89.03 < 30 |only if walking
Follow the road |goto Elwynn Forest 42.68,67.14 < 30 |only if walking
Follow the path |goto Elwynn Forest 64.57,74.00 < 30 |only if walking
Enter the building |goto Elwynn Forest 70.93,80.43 < 10 |walk
kill Surena Caledon##881
|tip Inside the building.
|tip There are other enemies inside the building that will pull with her. |only if hardcore()
|tip If you clear the outer area, you might be able to utilize fear. |only if hardcore()
|tip You may need help with this. |only if hardcore()
collect Surena's Choker##6810 |q 1688/1 |goto Elwynn Forest 71.02,80.78
|only if Gnome Warlock
step
Follow the road |goto Elwynn Forest 65.65,74.10 < 30 |only if walking
Continue following the road |goto Elwynn Forest 42.11,64.65 < 30 |only if walking
Enter Stormwind City |goto Elwynn Forest 32.09,49.38 < 30 |only if walking
Enter the building |goto Stormwind City 29.15,74.18 < 10 |walk
talk Gakin the Darkbinder##6122
|tip Downstairs inside the building.
turnin Surena Caledon##1688 |goto Stormwind City 25.26,78.56
accept The Binding##1689 |goto Stormwind City 25.26,78.56
|only if Gnome Warlock
step
Follow the path down |goto Stormwind City 25.05,79.31 < 5 |walk
Run down the stairs |goto Stormwind City 24.28,78.62 < 7 |c |q 1689
|only if Gnome Warlock
step
Run down the stairs |goto Stormwind City 26.15,79.33 < 7 |walk
use the Bloodstone Choker##6928
|tip Use it while standing on the pink symbol on the ground.
|tip Downstairs inside the building, inside the crypt.
kill Summoned Voidwalker##5676 |q 1689/1 |goto Stormwind City 25.11,77.46
|tip Don't forget to summon your imp. |only if hardcore()
|only if Gnome Warlock
step
Follow the path up |goto Stormwind City 26.03,79.83 < 7 |walk
Run up the stairs |goto Stormwind City 23.31,79.68 < 7 |c |q 1689
|only if Gnome Warlock
step
talk Gakin the Darkbinder##6122
|tip Upstairs inside the building, in the basement above the crypt.
turnin The Binding##1689 |goto Stormwind City 25.25,78.53
|only if Gnome Warlock
step
Enter the building |goto Elwynn Forest 42.95,65.65 < 10 |walk
talk Remen Marcot##6121
|tip Downstairs inside the building.
accept Gakin's Summons##1685 |goto Elwynn Forest 44.49,66.27
|only if (Human Warlock) and not haveq(1688) and not completedq(1688)
step
Enter the building |goto Stormwind City 29.15,74.18 < 10 |walk
talk Gakin the Darkbinder##6122
|tip Downstairs inside the building.
turnin Gakin's Summons##1685 |goto Stormwind City 25.26,78.56
accept Surena Caledon##1688 |goto Stormwind City 25.26,78.56
|only Human Warlock
step
_NOTE:_
Incoming Difficult Quest
|tip The area where the next quest NPC is has a lot of potenial adds.
|tip Additionally, inside the building along side here are 2 other enemies.
Click Here to Continue |confirm |q 1688 |future
|only if (Human Warlock) and hardcore()
step
Leave the building |goto Stormwind City 29.15,74.18 < 10 |walk
Leave Stormwind City |goto Stormwind City 71.02,89.03 < 30 |only if walking
Follow the road |goto Elwynn Forest 42.68,67.14 < 30 |only if walking
Follow the path |goto Elwynn Forest 64.57,74.00 < 30 |only if walking
Enter the building |goto Elwynn Forest 70.93,80.43 < 10 |walk
kill Surena Caledon##881
|tip Inside the building.
|tip There are other enemies inside the building that will pull with her. |only if hardcore()
|tip If you clear the outer area, you might be able to utilize fear.|only if hardcore()
|tip You may need help with this. |only if hardcore()
collect Surena's Choker##6810 |q 1688/1 |goto Elwynn Forest 71.02,80.78
|only if Human Warlock
step
Follow the road |goto Elwynn Forest 65.65,74.10 < 30 |only if walking
Continue following the road |goto Elwynn Forest 42.11,64.65 < 30 |only if walking
Enter Stormwind City |goto Elwynn Forest 32.09,49.38 < 30 |only if walking
Enter the building |goto Stormwind City 29.15,74.18 < 10 |walk
talk Gakin the Darkbinder##6122
|tip Downstairs inside the building.
turnin Surena Caledon##1688 |goto Stormwind City 25.26,78.56
accept The Binding##1689 |goto Stormwind City 25.26,78.56
|only Human Warlock
step
Follow the path down |goto Stormwind City 25.05,79.31 < 7 |walk
Run down the stairs |goto Stormwind City 24.28,78.62 < 7 |walk
Run down the stairs |goto Stormwind City 26.15,79.33 < 7 |walk
use the Bloodstone Choker##6928
|tip Use it while standing on the pink symbol on the ground.
|tip Downstairs inside the building, inside the crypt.
kill Summoned Voidwalker##5676 |q 1689 |goto Stormwind City 25.11,77.46
|tip Don't forget to summon your imp. |only if hardcore()
|only if Human Warlock
step
Follow the path up |goto Stormwind City 26.03,79.83 < 7 |walk
Run up the stairs |goto Stormwind City 23.31,79.68 < 7 |walk
talk Gakin the Darkbinder##6122
|tip Upstairs inside the building, in the basement above the crypt.
turnin The Binding##1689 |goto Stormwind City 25.25,78.53
|only if Human Warlock
step
ding 20
step
talk Lago Blackwrench##6120
accept Gakin's Summons##1717 |goto Ironforge 47.62,9.26
|only if Warlock and not haveq(1716) and not completedq(1716)
step
Enter the building |goto Stormwind City 29.14,74.17 < 7 |walk
talk Gakin the Darkbinder##6122
|tip Downstairs inside the building.
turnin Gakin's Summons##1717 |goto Stormwind City 25.26,78.56
accept Devourer of Souls##1716 |goto Stormwind City 25.26,78.56
|only if Warlock
step
Leave the building |goto Stormwind City 29.14,74.17 < 7 |walk
Follow the road |goto Darkshore 39.98,47.69 < 30 |only if walking
Enter Ashenvale |goto Darkshore 43.05,93.50 < 30 |only if walking
Follow the road |goto Ashenvale 29.63,17.12 < 30 |only if walking
talk Daelyshia##4267
fpath Astranaar |goto Ashenvale 34.41,47.99
|only if Warlock
step
Follow the road |goto Ashenvale 38.91,57.93 < 30 |only if walking
Follow the road |goto Ashenvale 67.13,71.87 < 30 |only if walking
Enter the Barrens |goto The Barrens 48.99,5.39 < 20 |only if walking
Follow the road |goto The Barrens 48.55,13.02 < 30 |only if walking
Avoid the Crossroads |goto The Barrens 53.91,30.00 < 30 |only if walking
Follow the road |goto The Barrens 50.43,37.77 < 30 |only if walking
talk Takar the Seer##6244
turnin Devourer of Souls##1716 |goto The Barrens 49.31,57.10
accept Heartswood##1738 |goto The Barrens 49.31,57.10
|only if Warlock
step
Follow the road |goto The Barrens 51.03,50.04 < 30 |only if walking
Avoid the Crossroads |goto The Barrens 53.68,29.52 < 30 |only if walking
Follow the road |goto The Barrens 51.18,15.34 < 30 |only if walking
Enter Ashenvale |goto The Barrens 48.98,5.37 < 20 |only if walking
Follow the road |goto Ashenvale 68.53,84.01 < 30 |only if walking
Continue following the road |goto Ashenvale 66.87,71.29 < 30 |only if walking
Follow the path |goto Ashenvale 26.14,35.41 < 30 |only if walking
click Heartswood##93192
collect Heartswood##6912 |q 1738/1 |goto Ashenvale 31.49,31.45
|only if Warlock
step
Follow the road |goto Ashenvale 25.58,36.45 < 30 |only if walking
Enter the building |goto Stormwind City 29.14,74.17 < 7 |walk
talk Gakin the Darkbinder##6122
|tip Downstairs inside the building.
turnin Heartswood##1738 |goto Stormwind City 25.26,78.56
accept The Binding##1739 |goto Stormwind City 25.26,78.56
|only if Warlock
step
Follow the path down |goto Stormwind City 24.96,79.42 < 7 |walk
Run down the stairs |goto Stormwind City 24.30,78.63 < 7 |walk
Run down the stairs |goto Stormwind City 26.16,79.32 < 7 |walk
use the Heartswood Core##6913
|tip Use it while standing on the pink symbol on the ground.
|tip Downstairs inside the building, inside the crypt.
kill Summoned Succubus##5677 |q 1739/1 |goto Stormwind City 25.11,77.46
|only if Warlock
step
Follow the path up |goto Stormwind City 26.03,79.83 < 7 |walk
Run up the stairs |goto Stormwind City 23.31,79.68 < 7 |walk
talk Gakin the Darkbinder##6122
|tip Upstairs inside the building, in the basement above the crypt.
turnin The Binding##1739 |goto Stormwind City 25.25,78.56
|only if Warlock
step
ding 30
step
Enter the building |goto Stormwind City 29.10,74.17 < 8 |walk
talk Gakin the Darkbinder##6122
|tip Inside the building.
accept Seeking Strahad##1798 |goto Stormwind City 25.25,78.54
|only if Warlock
step
Follow the path up |goto The Barrens 61.93,36.72 < 15
talk Strahad Farsan##6251
turnin Seeking Strahad##1798 |goto The Barrens 62.63,35.50
accept Tome of the Cabal##1758 |goto The Barrens 62.63,35.50
|only if Warlock
step
talk Krom Stoutarm##6294
|tip Inside the building.
turnin Tome of the Cabal##1758 |goto Ironforge 74.21,9.42
accept Tome of the Cabal##1802 |goto Ironforge 74.21,9.42
|only if Warlock
step
Follow the path down |goto Hillsbrad Foothills 36.94,65.37 < 30 |only if walking
click Tome of the Cabal##92013
|tip It looks like a blue book on the ground next to some crates.
|tip Try to pull the murlocs away one at a time when possible. |only if hardcore()
collect Moldy Tome##6931 |q 1802/1 |goto Hillsbrad Foothills 27.78,72.78
|only if Warlock
step
Enter the cave |goto Thousand Needles 44.09,37.29 < 10 |walk
click Damaged Chest##92423
collect Tattered Manuscript##6997 |q 1802/2 |goto Thousand Needles 43.43,32.69
|only if Warlock
step
talk Krom Stoutarm##6294
|tip Inside the building.
turnin Tome of the Cabal##1802 |goto Ironforge 74.21,9.42
accept Tome of the Cabal##1804 |goto Ironforge 74.21,9.42
|only if Warlock
step
Follow the path up |goto Wetlands 42.83,41.04
Kill Dragonmaw enemies around this area
collect 3 Rod of Channeling##6930 |q 1804/1 |goto Wetlands 45.09,43.08
|tip They drop from Dragonmaw Bonewarders and Shadowwarders.
You can find more around here [49.48,48.47]
|only if Warlock
step
Follow the path up |goto The Barrens 61.93,36.72 < 15
talk Strahad Farsan##6251
turnin Tome of the Cabal##1804 |goto The Barrens 62.63,35.50
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
Enter the building |goto Stormwind City 29.07,74.24 < 8 |walk
talk Demisette Cloyce##461
|tip Inside the building.
accept Summon Felsteed##4487 |goto Stormwind City 25.30,78.23 |or
accept Summon Felsteed##4488 |goto Stormwind City 25.30,78.23 |or
|only if Warlock
step
Follow the path up |goto The Barrens 61.93,36.72 < 15
talk Strahad Farsan##6251
turnin Summon Felsteed##4487 |goto The Barrens 62.63,35.50 |or
turnin Summon Felsteed##4488 |goto The Barrens 62.63,35.50 |or
accept Summon Felsteed##4490 |goto The Barrens 62.63,35.50
|only if Warlock
step
talk Strahad Farsan##6251
turnin Summon Felsteed##4490 |goto The Barrens 62.63,35.50
|only if Warlock
step
ding 53
|only if not hardcore()
step
ding 55
|only if hardcore()
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
|tip Watch for patrols and respawns while in the area.	|only if hardcore()
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
_NOTE:_
Incoming Dungeon Step
|tip The next couple of steps will be taking you to the Sunken Temple dungeon.
|tip You will need a group to complete the dungeon as well as the quest.
|tip If you don't have a group, wait until you do before continuing.
Click Here to Continue |confirm |q 8236
|only if Warlock and hardcore()
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
Inside the Temple of Atal'Hakkar Dungeon:
collect 2 Amber Voodoo Feather##20606 |q 8422/1
|tip These come from Gasher and Zul'Lor.
|only if Warlock
step
label "Blue_Voodoo_Feathers"
Inside the Temple of Atal'Hakkar Dungeon:
collect 2 Blue Voodoo Feather##20607 |q 8422/2
|tip These come from Mijan and Hukku.
|only if Warlock
step
label "Green_Voodoo_Feathers"
Inside the Temple of Atal'Hakkar Dungeon:
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
talk Spackle Thornberry##5520
|tip Downstairs inside the building.
accept Mor'zul Bloodbringer##7562 |goto Stormwind City 25.66,77.66
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
|tip Watch for respawns while in the area. |only if hardcore()
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
Cross the bridge |goto Felwood 40.06,48.94 < 10 |c |q 7624 |walk
talk Ulathek##14523
Remove the Taint of Shadow buff |nobuff Taint of Shadow##23179 |q 7624 |goto Felwood 39.89,49.17
|only if Warlock
step
Cross the bridge |goto Felwood 40.02,48.99 < 10 |walk
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
run up the ramp |goto Felwood 37.35,45.87 < 10 |c |q 7625 |walk
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
_NOTE:_
Incoming Dungeon Steps
|tip The next few steps will send you into 2 different dungeons: Scholomance and then Dire Maul - West.
|tip You will need a group for each instance.
Click Here to Continue |confirm |q 7629 |future
|only if Warlock
step
Enter the Scholomance Dungeon with Your Group |goto Scholomance/0 0.00,0.00 < 500 |c
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
click Burned-Out Remains##415107
|tip It looks like a skeleton with clothes on, in the pile of wooden boards.
accept ...and that note you found##79008 |goto Westfall 37.41,50.70
step
click Burned-Out Remains##415106
turnin ...and that note you found##79008 |goto The Barrens 46.36,73.90
accept Stepping Stones##79192 |goto The Barrens 46.36,73.90
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
Scout the Cathedral in Tyr's Hand |q 87502/1 |goto Eastern Plaguelands/0 86.23,84.72 < 50
step
Enter New Avalon |goto Eastern Plaguelands/0 90.65,81.50 < 50 |c
|only if haveq(87502) and not subzone("New Avalon")
step
Scout the Keep in New Avalon |q 87502/3 |goto Eastern Plaguelands/0 97.23,83.12 < 50
step
Scout the Mage Tower in New Avalon |q 87502/2 |goto Eastern Plaguelands/0 98.60,88.47 < 50
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
talk Argent Recruiter##16241
accept Light's Hope Chapel##9154 |goto Stormwind City/0 54.93,61.82
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
talk Lieutenant Orrin##16478
accept Investigate the Scourge of Stormwind##9260 |goto Stormwind City/0 63.80,75.48
stickystart "Investigate_a_Circle_9260"
step
collect 3 Dim Necrotic Stone##22892 |q 9260/1 |goto Elwynn Forest/0 34.06,52.52
|tip Run into a circle and spawn the enemies.
|tip Kill the enemies that spawn to collect stones.
step
label "Investigate_a_Circle_9260"
Investigate a Circle |q 9260/2 |goto Elwynn Forest/0 34.06,52.52
|tip Step inside one of the circles to get credit.
step
talk Lieutenant Orrin##16478
turnin Investigate the Scourge of Stormwind##9260 |goto Stormwind City/0 63.80,75.48
step
talk Lieutenant Nevell##16484
accept Investigate the Scourge of Ironforge##9261 |goto Dun Morogh/0 52.98,35.03
stickystart "Investigate_a_Circle_9261"
step
collect 3 Dim Necrotic Stone##22892 |q 9261/1 |goto Dun Morogh/0 48.93,39.75
|tip Run into a circle and spawn the enemies.
|tip Kill the enemies that spawn to collect stones.
step
label "Investigate_a_Circle_9261"
Investigate a Circle |q 9261/2 |goto Dun Morogh/0 48.93,39.75
|tip Step inside one of the circles to get credit.
step
talk Lieutenant Nevell##16484
turnin Investigate the Scourge of Ironforge##9261 |goto Dun Morogh/0 52.98,35.03
step
talk Lieutenant Beitha##16495
accept Investigate the Scourge of Darnassus##9262 |goto Darnassus/0 77.86,42.35
stickystart "Investigate_a_Circle_92623"
step
collect 3 Dim Necrotic Stone##22892 |q 9262/1 |goto Teldrassil/0 37.58,55.32
|tip Run into a circle and spawn the enemies.
|tip Kill the enemies that spawn to collect stones.
step
label "Investigate_a_Circle_92623"
Investigate a Circle |q 9262/2 |goto Teldrassil/0 37.58,55.32
|tip Step inside one of the circles to get credit.
step
talk Lieutenant Beitha##16495
turnin Investigate the Scourge of Darnassus##9262 |goto Darnassus/0 77.86,42.35
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
