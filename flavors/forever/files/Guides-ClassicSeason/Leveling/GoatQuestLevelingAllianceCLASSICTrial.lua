local GoatQuest=GoatQuest
if not GoatQuest then return end
if not GQ.IsClassicSoD then return end
if UnitFactionGroup("player")~="Alliance" then return end
if GQ:DoMutex("LevelingACLASSIC") then return end
GoatQuest.GuideMenuTier = "TRI"
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Startup Guide Wizard")
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
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Darkshore (13-22)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Wetlands (22-26)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Redridge Mountains (26-27)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Duskwood (27-32)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Wetlands (32-33)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Hillsbrad Foothills (33-34)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Dustwallow Marsh & Thousand Needles (34-37)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Stranglethorn Vale (37-40)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Arathi Highlands & Alterac Mountains (40-42)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Stranglethorn Vale (42-44)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Tanaris & Feralas (44-48)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Un'Goro Crater & The Hinterlands (48-50)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Western Plaguelands & Stranglethorn Vale (50-51)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Felwood (51-53)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Un'Goro Crater (53-55)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Winterspring & Felwood (55-57)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Western & Eastern Plaguelands (57-60)")
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
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Rogue Class Quests")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Mage Class Quests")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Paladin Class Quests")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Warlock Class Quests")
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
