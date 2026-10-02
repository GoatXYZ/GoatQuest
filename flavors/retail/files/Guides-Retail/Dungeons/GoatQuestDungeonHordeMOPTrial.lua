local GoatQuest=GoatQuest
if not GoatQuest then return end
if UnitFactionGroup("player")~="Horde" then return end
if GQ:DoMutex("DungeonHMOP") then return end
GoatQuest.GuideMenuTier = "TRI"
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Classic Dungeons\\Blackfathom Deeps")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Classic Dungeons\\Blackrock Depths: Detention Block")
GoatQuest:RegisterGuide("Dungeon Guides\\Classic Dungeons\\Deadmines",{
description="This guide will walk you through completing the Deadmines dungeon. This dungeon is located in Westfall on the continent of Eastern Kingdoms and is home to the Defias Brotherhood, led by Edwin VanCleef. This dungeon ranges from level 10 to 30.",
mapid=291,
achieveid={628},
patch='30002',
condition_suggested=function() return level>=10 and level<=30 end,
keywords={"Westfall, Defias, DM"},
},[[
step
label "start"
Press _I_ and queue for Deadmines or enter the dungeon with your group |goto The Deadmines/1 26.50,13.40 |c
step
talk Kagtha##46889
accept Only the Beginning##27842 |goto The Deadmines/1 29.30,27.20
|only if not completedq(27842)
step
talk Slinky Sharpshiv##46906
accept Traitors!!!##27844 |goto The Deadmines/1 28.84,27.33
|only if not completedq(27844)
step
talk Miss Mayhem##46902
accept Not Quite There##27847 |goto The Deadmines/1 29.63,24.72
|only if not completedq(27847)
step
map The Deadmines/1
path follow loose; loop off; ants curved
path	27.80,24.60	24.80,35.00	29.60,43.30
path	28.70,53.30	34.00,59.80
Follow the path |goto The Deadmines/1 34.00,59.80
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
kill 1 Glubtok##47162 |n |goto The Deadmines/1 37.70,61.20
kill 1 Glubtok##47162 |q 27842/1 |goto The Deadmines/1 37.70,61.20 |only if haveq(27842)
_Phase 1:_
|tip Glubtok will occasionally use Fists of Flame and Fists of Frost during this phase, avoid standing near the tank
|tip Tank: Glubtok will periodically Blink to a random location
|tip Blink will reset threat, pick up Glubtok quickly. |only if heroic_dung()
_Phase 2:_
|tip At 50% health, Glubtok will cast beams of fire and frost to his sides. Stand in front or behind him
|tip Glubtok will throw Fire Blossoms and Frost Blossoms at random locations, avoid standing in the impact area
|tip Blossoms summon weak elementals. Kill these quickly |only if heroic_dung()
|tip Glubtok will cast a wall of fire that rotates around the room, avoid contact |only if heroic_dung()
Defeat Glubtok |scenariogoal 24941 |goto The Deadmines/1 37.70,61.20
step
Click the Quest Completion Box that pops up.
turnin Only the Beginning##27842
accept Good Intentions...Poor Execution##27848
|only if not completedq(27848)
step
map The Deadmines/1
path follow loose; loop off; ants curved
path	41.70,60.00	47.40,61.30	46.50,67.70
path	43.90,72.70	43.80,79.70
Follow the path |goto The Deadmines/1 43.80,79.70 < 5
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
click Heavy Door##400
Open the door and walk inside |goto The Deadmines/1 43.70,81.60 < 5
confirm
step
kill 1 Helix Gearbreaker##47296 |n |goto The Deadmines/1 49.00,87.40
kill 1 Helix Gearbreaker##47296 |q 27844/1 |goto The Deadmines/1 49.00,87.40 |only if haveq(27844)
_Phase 1:_
|tip Sticky Bombs will explode if players are within 1 yard of them
|tip The Lumbering Oaf will use Oaf Smash, picking up a random player and running into the wall. |only if not heroic_dung()
|tip The Lumbering Oaf will use Oaf Smash, picking up a random player and running into the wall dealing 100% of their maximum health as physical damage |only if heroic_dung()
|tip Helix will jump on a random player. This player will take normal melee damage for 10 seconds
|tip When Helix jumps to a new target, he leaves a Chest Bomb behind. Position yourself below the log in the room so you don't fly up in the air and die from fall damage |only if heroic_dung()
_Phase 2:_
|tip Helix will _Leap_ onto a player and melee attack them
|tip Helix will continue to attach _Chest Bomb_ to targets |only if heroic_dung()
Defeat Helix Gearbreaker |scenariogoal 24942 |goto The Deadmines/1 49.00,87.40
step
map The Deadmines/1
path follow loose; loop off; ants curved
path	53.70,87.30	59.10,87.90	63.50,91.50
path	64.80,85.90	61.00,80.60
Follow the path |goto The Deadmines/1 61.00,80.60 < 5
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
click Heavy Door##400
Open the door and walk inside |goto The Deadmines/1 61.00,73.60 < 5
confirm
step
map The Deadmines/1
path follow loose; loop off; ants curved
path	59.60,71.40	56.50,65.10	58.50,59.10
path	63.50,58.60	66.20,64.70	The Deadmines/2 14.60,89.80
Follow the winding ramp down |goto The Deadmines/2 14.60,89.80
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
kill 1 Foe Reaper 5000##43778 |n |goto The Deadmines/2 10.40,82.80
kill 1 Foe Reaper 5000##43778 |q 27847/1 |goto The Deadmines/2 10.40,82.80 |only if haveq(27847)
If you're the _Prototype Reaper_ pilot, click here. |confirm |next "Proto_Reap" |only if heroic_dung()
|tip Foe Reaper 5000 will use Reaper Strike, cleaving anyone in front of it
|tip When Overdrive is cast, run away and keep moving until it ends
|tip Occasionally a party member will be targeted with Harvest. Avoid being in front of the Foe Reaper as he moves to the target
_TANK:_ |only if heroic_dung() |grouprole TANK
|tip Pull the Foe Reaper to the top of the ramp |only if heroic_dung() |grouprole TANK
_HEALER:_ |grouprole HEALER
|tip Be prepared for party members to take damage during Overdrive |grouprole HEALER
Defeat the Foe Reaper 5000 |scenariogoal 24944 |goto The Deadmines/2 10.40,82.80
|next "canon_blast"
step
label "Proto_Reap"
You will spend your time at the bottom of the ramp, waiting for _Molten Slag_ to spawn
You will have 2 abilities to use to control the adds
Use _Reaper Strike_ twice in a row, then use _Reaper Charge_ to stun them
Repeat this until the Molten Slag dies
Defeat the Foe Reaper 5000 |scenariogoal 24944 |goto The Deadmines/2 10.40,82.80
step
label "canon_blast"
click Defias Cannon##16398
map The Deadmines/2
path follow loose; loop off; ants curved
path	12.60,70.30	13.10,60.40	22.90,58.00
path	28.00,52.50	33.40,48.90
Use the cannon to blow open the door and walk inside |goto The Deadmines/2 33.40,48.90 < 8
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
map The Deadmines/2
path follow loose; loop off; ants curved
path	34.30,48.80	41.10,47.80	41.70,30.30
path	50.50,18.10	56.60,27.50	53.10,40.10
path	54.90,55.50
Proceed along the docks avoiding the cannonballs that are being shot at the ground. |goto The Deadmines/2 54.90,55.50 < 8
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
map The Deadmines/2
path follow loose; loop off; ants curved
path	54.20,54.70	51.90,45.70	53.60,46.40
path	55.60,50.90	57.30,49.20	54.80,39.80
path	56.30,32.20
Follow the ramp up to the top of the ship. |goto The Deadmines/2 56.30,32.20 < 5
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
kill 1 Admiral Ripsnarl##47626 |n |goto The Deadmines/2 63.90,39.50
kill 1 Admiral Ripsnarl##47626 |q 27848/1 |goto The Deadmines/2 63.90,39.50 |only if haveq(27848)
|tip Ripsnarl will use Swipe, cleaving in a frontal cone. Avoid standing in front of him
|tip Ripsnarl will gain Thirst for Blood, moving faster and gaining attack speed each time he hits (stacking up to 20 times)
|tip At 75%, 50% and 25% He will summon a fog
|tip During the fog, he will Summon Vapors which need to be killed as soon as possible. They will grow larger before they explode, potentially killing anyone nearby
|tip He will use Go For the Throat through the entire fight. It damages then stuns targets for 2 seconds. |only if heroic_dung()
|tip When the fog ends, Ripsnarl will randomly target someone with Go for the Throat, stunning them and dealing damage
_HEALER:_ |only if heroic_dung() |grouprole HEALER
|tip Ripsnarl will use Go for the Throat through the entire encounter. Prepare to heal accordingly |only if heroic_dung() |grouprole HEALER
Defeat Admiral Ripsnarl |scenariogoal 24943 |goto The Deadmines/2 63.90,39.50
step
Click the Quest Completion Box that pops up.
turnin Good Intentions...Poor Execution##27848 |only if haveq(27848)
accept The Defias Kingpin##27850
|only if not completedq(27850)
step
kill 1 "Captain" Cookie##47739 |goto The Deadmines/2 63.90,39.50 |only if completedq(27850)
kill 1 "Captain" Cookie##47739 |q 27850/1 |goto The Deadmines/2 63.90,39.50 |only if not completedq(27850)
|tip Cookie will throw regular food and rotten food on the ground. Rotten food will deal damage to anyone standing nearby
|tip Eating good food will remove a stack of bad food and grant a stacking haste buff
|tip Your group must balance eating bad food and good food to keep the deck clear
Defeat "Captain" Cookie |scenariogoal 34437 |goto The Deadmines/2 60.60,44.50
step
A note will appear on the ground
|tip Don't click it until your group is ready, it will start the Vanessa VanCleef event.
|tip Once you click it, Vanessa will come out and poison you.
Click the note and select _"Continue reading..."_ |goto The Deadmines/2 59.90,40.90 <8 |c
|only if heroic_dung()
step
Click the 4 _Steam Valves_ to avoid being lowered into the Lava. There will be green arrows indicating where the levers are
Escape the lava |goto The Deadmines/1 57.90,70.30 |c |noway
|only if heroic_dung()
step
map The Deadmines/1
path follow loose; loop off; ants curved
path	57.90,70.30	55.70,65.60	57.60,61.80
path	58.20,57.70	61.70,56.80	65.20,60.10
path	64.80,64.00
Jump down at the end of the ramp, avoiding the fire and blizzard areas |goto The Deadmines/2 15.20,81.70
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
|only if heroic_dung()
step
map The Deadmines/2
path follow loose; loop off; ants curved
path	14.00,89.90	10.90,89.90	6.90,81.10
path	9.90,77.60
Follow the path, avoiding the fire and blizzard areas |goto The Deadmines/2 9.90,77.60
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
|only if heroic_dung()
step
kill 1 Glubtok##47162
|tip After you defeat Glubtok, Helix Gearbreaker  will appear at the door
|tip The group needs to collapse at the door, as spiders will spawn and fill the room
|tip Avoid aggroing the spiders if possible
kill 1 Helix Gearbreaker##47296
Defeat Glubtok and Helix |goto The Deadmines/2 12.60,68.40 < 5 |c
|only if heroic_dung()
step
map The Deadmines/2
path follow loose; loop off; ants curved
path	12.00,60.70	23.30,57.50	26.50,51.30
Follow the path |goto The Deadmines/2 26.50,51.30 < 8
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
|only if heroic_dung()
step
kill Foe Reaper 5000##43778
Defeat the Foe Reaper |goto The Deadmines/2 30.80,49.70 < 5 |c
|only if heroic_dung()
step
map The Deadmines/2
path follow loose; loop off; ants curved
path	34.30,48.80	41.10,47.80	41.70,30.30
path	50.50,18.10	56.60,27.50	53.10,40.10
path	54.90,55.50
Follow the deck onto the ship
|tip You will need to save Emma Harrington, Erik Harrington and Calissa Harrington from the worgen
|tip Kill any packs of Worgen that you see
Proceed along the docks, avoiding the sparks |goto The Deadmines/2 54.90,55.50 <8
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
|only if heroic_dung()
step
map The Deadmines/2
path follow loose; loop off; ants curved
path	54.20,54.70	51.90,45.70	53.60,46.40
path	55.60,50.90	57.30,49.20	54.80,39.80
path	56.30,32.20
You will need to save _Emma Harrington_, _Erik Harrington_ and _Calissa Harrington_ from the worgen.
|tip Kill any packs of Worgen that you see.
|tip Once you're at Calissa Harrington, burn down Admiral Ripsnarl fast.
Follow the ramp up to the top of the ship. |goto The Deadmines/2 56.30,32.20 < 5
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
|only if heroic_dung()
step
kill 1 Vanessa VanCleef##49541
|tip VanCleef will use Deflection, which deflects all ranged, melee and spell attacks for 10 seconds. She will use the ability when her health is higher than 25%
|tip She will use Deadly Blades, randomly attack party members
|tip She will use Backslash dealing 9k to 10k damage
|tip At 50%, she will use Fiery Blaze which deals 46k to 53k fire damage every second. When this happens, ropes will appear at the end of the deck. Click them to avoid the damage
_TANK:_ |grouprole TANK
|tip VanCleef will summon Defias Shadowguard and Defias Blood Wizards. These need to be picked up quickly |grouprole TANK
|tip When Vanessa is at 1% of her total health, she will use Powder Explosion, Move as far away from her as possible to avoid death |grouprole TANK
Defeat Vanessa VanCleef |scenariogoal 24945
|only if heroic_dung()
step
talk Slinky Sharpshiv##46906
turnin Traitors!!!##27844 |goto The Deadmines/2 57.58,39.71
|only if not completedq(27844)
step
talk Miss Mayhem##46902
turnin Not Quite There##27847 |goto The Deadmines/2 61.77,37.72
|only if not completedq(27847)
step
talk Kagtha##46889
turnin The Defias Kingpin##27850 |goto The Deadmines/2 64.32,39.99
|only if not completedq(27850)
step
Congratulations, you have completed The Deadmines! |only if not heroic_dung()
Congratulations, you have completed The Deadmines (Heroic)! |only if heroic_dung()
]])
GoatQuest:RegisterGuide("Dungeon Guides\\Classic Dungeons\\Dire Maul: Capital Gardens",{
description="This guide will walk you through completing the Dire Maul: Capital Gardens dungeon. This dungeon is located in Feralas on the continent of Kalimdor and is home to undead and arcane creatures imprisoned by Prince Tortheldrin. This dungeon ranges from level 15 to 30.",
mapid=236,
achieveid={644},
patch='30002',
condition_suggested=function() return level>=15 and level<=30 end,
keywords={"DM, West, Feralas"},
},[[
step
label "start"
Press _I_ and queue for Dire Maul: Capital Gardens or enter the dungeon with your group |goto Dire Maul/2 93.50,47.70 |c
step
talk Estulan##44991
accept The Cursed Remains##27112 |goto Dire Maul/2 90.60,44.90
accept The Shen'dralar Ancient##27113 |goto Dire Maul/2 90.60,44.90
step
talk Shen'dralar Watcher##44999
accept The Warped Defender##27109 |goto Dire Maul/2 87.30,52.60
step
kill Mana Remnant##11483+, Arcane Aberration##11480+ |goto Dire Maul/2 73.20,53.80
|tip Kill all the Remnants around the crystal to deactivate it.
Kill all the Remnants around the crystal to deactivate it
confirm
step
map Dire Maul/2
path follow loose; loop off; ants curved; dist 10
path	68.60,56.30	61.60,55.40	50.60,43.60
path	45.20,36.60	40.50,35.10	Dire Maul/3 51.70,21.60
path	Dire Maul/3 38.50,23.40	Dire Maul/3 34.80,34.70
Follow the path |goto Dire Maul/3 34.80,34.70 < 15
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
kill Magister Kalendris##11487 |goto Dire Maul/3 30.60,45.80
|tip Kalendris will randomly cast Shadow Word: Pain or party members. Dispel this or heal through it
|tip Mind Flay will deal shadow damage to the target and reduce movement speed by 50%
|tip Mind Blast deals shadow damage to his current target
|tip Occasionally he will use Dominate Mind on a party member. CC or dispel the afflicted player
kill Magister Kalendris##11487 |q 27112/1 |goto Dire Maul/3 30.60,45.80 |only if haveq(27112)
Defeat Magister Kalendris |scenariogoal 25061 |goto Dire Maul/3 30.60,45.80
step
map Dire Maul/3
path follow loose; loop off; ants curved; dist 10
path	34.60,35.50	38.60,25.50	49.80,16.50
path	46.40,13.50	Dire Maul/2 20.30,21.60
path	Dire Maul/2 23.00,25.80	Dire Maul/2 34.10,23.70
Follow the path |goto Dire Maul/2 34.10,23.70 < 15
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
kill Mana Remnant##11483+, Arcane Aberration##11480+ |goto Dire Maul/2 42.00,22.40
|tip Kill all the Remnants around the crystal to deactivate it.
confirm
step
map Dire Maul/2
path follow loose; loop off; ants curved; dist 10
path	48.50,27.50	48.40,49.40
Follow the path |goto Dire Maul/2 48.40,49.40 < 8
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
talk Shen'dralar Ancient##14358
turnin The Shen'dralar Ancient##27113 |goto Dire Maul/2 48.40,53.80
accept The Madness Within##27110 |goto Dire Maul/2 48.40,53.80
|only if not completedq(27111)
step
map Dire Maul/2
path follow loose; loop off; ants curved; dist 10
path	48.50,59.10	48.30,78.90
Follow the path |goto Dire Maul/2 48.30,78.90 < 8
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
kill Mana Remnant##11483+, Arcane Aberration##11480+ |goto Dire Maul/2 39.50,83.40
|tip Kill all the Remnants around the crystal to deactivate it.
confirm
step
kill Illyanna Ravenoak##11488 |goto Dire Maul/2 21.70,75.80
|tip Ferra will use Charge on random players, dealing damage and stunning them. This will be followed by Maul, dealing physical damage
|tip Multi-Shot will hit players standing close to each other. Spread out
|tip Areas targeted with Volley will deal arcane damage to anyone standing within. Move out of it
|tip Ravenoak will drop Immolation Trap at her feet. Don't walk over these traps
|tip Concussive Shot will slow or stun random party members for 3 seconds
kill Illyanna Ravenoak##11488 |q 27112/2 |goto Dire Maul/2 21.70,75.80 |only if haveq(27112)
Defeat Illyanna Ravenoak |scenariogoal 25062 |goto Dire Maul/2 21.70,75.80
step
map Dire Maul/2
path follow loose; loop off; ants curved; dist 10
path	39.40,79.50	47.40,79.80	47.00,71.40
path	45.90,60.10	44.30,58.00	41.50,53.20
Follow the path, jumping onto the ledge first and then jump down to the ramp |goto Dire Maul/2 41.50,53.20 < 10
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
kill 1 Tendris Warpwood##11489 |goto Dire Maul/2 34.60,53.30
|tip Intruder Alert! will summon any Ironbark Protectors left alive in the instance to Warpwood's side
|tip Tendris will Trample anyone within 10 yards, dealing physical damage
|tip Grasping Vines will deal damage to the party, knocking them down and preventing movement for 10 seconds. Dispel this if possible
|tip If no player is within melee range, he will teleport a random person to him and Entangle them for 10 seconds
kill 1 Tendris Warpwood##11489 |q 27109/1 |goto Dire Maul/2 34.60,53.30 |only if haveq(27109)
Defeat Tendris Warpwood |scenariogoal 25063 |goto Dire Maul/2 34.60,53.30
step
map Dire Maul/4
path follow loose; loop off; ants curved; dist 10
path	76.50,39.90	71.40,40.30	69.40,44.40
path	69.10,52.70	66.70,57.40	60.90,57.70
Follow the path |goto Dire Maul/4 60.90,57.70 < 8
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
map Dire Maul/4
path follow loose; loop off; ants curved; dist 10
path	58.70,60.30	57.40,70.20	50.40,81.70
Follow the path |goto Dire Maul/4 50.40,81.70 < 10
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
kill Mana Remnant##11483+, Arcane Aberration##11480+ |goto Dire Maul/4 46.50,81.60
|tip Kill all the Remnants around the crystal to deactivate it.
confirm
step
map Dire Maul/4
path follow loose; loop off; ants curved; dist 10
path	53.50,76.10	58.00,66.20	58.50,52.90
path	54.70,39.60	50.50,34.40
Follow the path |goto Dire Maul/4 50.50,34.40 < 10
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
kill Mana Remnant##11483+, Arcane Aberration##11480+ |goto Dire Maul/4 44.70,34.10
|tip Kill all the Remnants around the crystal to deactivate it.
confirm
step
map Dire Maul/4
path follow loose; loop off; ants curved; dist 10
path	46.80,35.80	41.00,41.90
Follow the path, avoiding the elementals |goto Dire Maul/4 41.00,41.90 < 10
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
kill Immol'thar##11496 |goto Dire Maul/4 35.50,57.00
|tip Eyes of Immol'thar cannot be tanked. Kill them quickly
|tip Portal of Immol'thar will teleport a random player and wipe their threat
|tip Immol'thar will use Infected Bite on the tank, increasing damage taken by a small amount and dealing nature damage. Dispel this disease
|tip Frenzy will cause Immol'thar to enrage, increasing his attack speed by 60% for 3 minutes
|tip He will occasionally Trample, dealing physical damage to anyone standing within 10 yards
kill Immol'thar##11496 |q 27110/1 |goto Dire Maul/4 35.50,57.00 |only if haveq(27110)
Defeat Immol'thar |scenariogoal 27855 |goto Dire Maul/4 35.50,57.00
step
map Dire Maul/4
path follow loose; loop off; ants curved; dist 10
path	43.60,46.80	51.70,42.60	56.90,37.40
path	59.30,33.40	60.20,27.30	67.20,24.20
path	74.10,23.10	69.80,21.40
Follow the path |goto Dire Maul/4 69.80,21.40 < 8
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
kill Prince Tortheldrin##11486 |goto Dire Maul/4 60.40,23.50
_HEALER:_ |grouprole HEALER
|tip Price Tortheldrin attacks very quickly and is capable of dealing large amounts of burst damage |grouprole HEALER
_TANK:_ |grouprole TANK
|tip Save defensive cooldowns in case the healer gets hit with Counterspell |grouprole TANK
|tip Periodically he will _hrash, gaining 2 extra attacks |grouprole TANK
|tip Arcane Blast will deal damage to a random player and knock them back |grouprole TANK
|tip Anyone within 8 yards of Tortheldrin will take damage from Whirlwind. Move away during this |grouprole TANK
|tip He will also randomly Counterspell players. This spell can be very dangerous for healers, as it will prevent spellcasting for 15 seconds |grouprole TANK
kill Prince Tortheldrin##11486 |q 27110/2 |goto Dire Maul/4 60.40,23.50 |only if haveq(27110)
Defeat Prince Tortheldrin |scenariogoal 25065 |goto Dire Maul/4 60.40,23.50
step
map Dire Maul/4
path follow loose; loop off; ants curved; dist 10
path	66.20,21.80	74.20,22.40	72.70,24.10
path	67.10,24.00	60.30,27.20	59.30,33.00
path	56.40,37.90	59.30,57.60	66.30,57.80
path	68.90,54.50	69.60,43.00	71.90,40.10
path	76.90,39.90	Dire Maul/2 36.90,53.30
path	Dire Maul/2 44.40,53.20	Dire Maul/2 57.50,54.20
path	Dire Maul/2 64.80,56.30	Dire Maul/2 78.80,50.50
You can either run to the beginning of the dungeon to turn in your quests
Or
You can Right Click the dungeon finder icon on your mini map, teleport out of the dungeon, then teleport back in to the entrance
Return to the beginning of the instance |goto Dire Maul/2 78.80,50.50 < 10
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
|only if not completedq(27109) and not completedq(27112) and not completedq(27110)
step
talk Shen'dralar Watcher##44999
turnin The Warped Defender##27109 |goto Dire Maul/2 87.30,52.40
|only if not completedq(27109)
step
talk Estulan##44991
turnin The Cursed Remains##27112 |goto Dire Maul/2 90.50,44.80
|only if not completedq(27112)
step
map Dire Maul/2
path follow loose; loop off; ants curved; dist 10
path	84.40,47.70	71.30,56.00	61.90,55.50
path	54.80,47.20	45.10,36.60	40.80,34.80
path	Dire Maul/3 50.00,12.70	Dire Maul/2 20.30,20.90
path	22.70,26.20	35.60,25.70	48.40,26.10
path	48.40,43.10
Follow the path |goto Dire Maul/2 48.40,43.10 < 5
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
|only if not completedq(27111)
step
talk Shen'dralar Ancient##14358
turnin The Madness Within##27110 |goto Dire Maul/2 48.40,53.80
accept The Treasure of the Shen'dralar##27111 |goto Dire Maul/2 48.40,53.80
|only if not completedq(27111)
step
map Dire Maul/2
path follow loose; loop off; ants curved; dist 10
path	47.00,59.80	44.30,59.40	41.20,53.40
path	30.00,42.60	Dire Maul/4 71.30,40.30
path	Dire Maul/4 69.30,45.50	Dire Maul/4 68.80,54.50
path	Dire Maul/4 65.70,57.40	Dire Maul/4 59.30,57.20
path	Dire Maul/4 56.30,38.40	Dire Maul/4 59.60,32.80
path	Dire Maul/4 60.60,26.40	Dire Maul/4 67.20,24.10
path	Dire Maul/4 74.10,23.80	Dire Maul/4 72.60,21.70
Jump down and follow the path |goto Dire Maul/4 72.60,21.70 < 5
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
|only if not completedq(27111)
step
click Treasure of the Shen'dralar##179517
turnin The Treasure of the Shen'dralar##27111 |goto Dire Maul/4 70.60,24.10
|only if not completedq(27111)
step
Congratulations, you have completed Dire Maul: Capital Gardens!
]])
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Classic Dungeons\\Dire Maul: Gordock Commons")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Classic Dungeons\\Dire Maul: Warpwood Quarter")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Classic Dungeons\\Gnomeregan")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Classic Dungeons\\Lower Blackrock Spire")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Classic Dungeons\\Maraudon: Earth Song Falls")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Classic Dungeons\\Maraudon: Foulspore Cavern")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Classic Dungeons\\Maraudon: The Wicked Grotto")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Classic Dungeons\\Ragefire Chasm")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Classic Dungeons\\Razorfen Downs")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Classic Dungeons\\Razorfen Kraul")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Classic Dungeons\\Scarlet Halls")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Classic Dungeons\\Scarlet Monastery")
GoatQuest:RegisterGuide("Dungeon Guides\\Classic Dungeons\\Scholomance",{
description="This guide will walk you through completing the Scholomance dungeon. This dungeon is located in the Western Plaguelands on the continent of Eastern Kingdoms and is the academy for Scourge necromancers. This dungeon ranges from level 15 to 30.",
mapid=476,
achieveid={645},
patch='30002',
condition_suggested=function() return level>=15 and level<=30 end,
keywords={"Western, Plaguelands, Scourge"},
},[[
step
Press _I_ and queue for Scholomance or enter the dungeon with your group |goto Scholomance/1 18.10,60.90 < 100 |c
step
talk Talking Skull##64562
accept The Four Tomes##31440 |goto Scholomance/1 27.00,58.80
accept An End to the Suffering##31447 |goto Scholomance/1 27.00,58.80
|only if not completedq(31440) and not completedq(31447) and not heroic_dung()
step
If you immediately pull Instructor Chillheart, all trash aside from the 2 Risen Guards will despawn
Go through the gate and jump down |goto Scholomance/1 53.20,60.30 < 5
confirm
step
kill 1 Instructor Chillheart##58633 |goto Scholomance/1 65.50,60.60
_Phase 1:_
|tip Wrack Soul will deal damage to a party member and jump to a nearby party member when it expires. Spread out |only if heroic_dung()
|tip Touch of the Grave causes Chillheart's next 10 basic attacks to deal additional damage
|tip Frigid Grasp will summon ice at a player's feet, step out of this before it explodes
|tip Ice Wall will start at the back of the room and slowly creep toward the boss. If this touches any player, they will die instantly. This will act as the enrage timer of the fight
|tip Kill Chillheart's physical body and Phase 2 will start
_Phase 2:_
|tip The Anarchist Arcanist will float around creating Arcane Bombs. These explode on impact so avoid them
|tip Antonidas' Self Help Guide to Standing in Fire will cast Burn. This does a small AoE of fire damage around the book
|tip Wander's Colossal Book of Shadow Puppets will cast Shadow Bolt at the party
Defeat Instructor Chillheart |scenariogoal 19259 |goto Scholomance/1 65.50,60.60
step
click In the Shadow of the Light##214279
|tip You can find the tome near this area. It is usually sitting on one of the tables.
Destroy the tome "In the Shadow of the Light" |q 31440/1 |goto Scholomance/1 72.15,64.41 |only if not heroic_dung()
Destroy the tome "In the Shadow of the Light" |q 31442/1 |goto Scholomance/1 72.15,64.41 |only if heroic_dung()
|only if haveq(31440) or haveq(31442)
step
map Scholomance/1
path follow loose; loop off; ants curved
path	74.60,52.00	85.70,51.60	85.40,24.10
Follow the path |goto Scholomance/1 85.40,24.10 < 5
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
click Kel'Thuzad's Deep Knowledge##214278
|tip You can find the tome near this area. It is usually sitting in one of the stone alcoves.
Destroy Kel'Thuzad's Deep Knowledge |q 31440/2 |goto Scholomance/2 73.90,8.60 |only if not heroic_dung()
Destroy Kel'Thuzad's Deep Knowledge |q 31442/2 |goto Scholomance/2 73.90,8.60 |only if heroic_dung()
|only if haveq(31440) or haveq(31442)
step
kill 1 Jandice Barov##59184 |goto Scholomance/2 58.80,18.30
|tip Wondrous Rapidity is a large cone attack in front of Jandice, make sure nobody is in front of her.
|tip Gravity Flux will create a gravity distortion field on the ground. If you step into this ability you will be knocked back as well as damaged heavily |only if heroic_dung()
|tip At 66% and 33% Jandice will cast Phantasmal Images. She will clone herself throughout the room, destroy the clones until she returns to battle
|tip Destroying the wrong clone will deal arcane damage to all party members |only if heroic_dung()
|tip While the clones are alive they will cast Whirl of Illusion, this does AoE damage to everybody in the group every second.
Defeat Jandice Barov |scenariogoal 19260 |goto Scholomance/2 58.80,18.30
step
kill Boneweaver##59193+, Rattlegore##59153 |goto Scholomance/2 48.60,26.70
|tip Clearing all of the Boneweavers in the room will begin the Rattlegore encounter.
|tip With each successful attack Rattlegore will gain a stack of Rusting. This increases his attack damage but lowers his attack and movement speeds. If the tank is getting hit too hard, kite Rattlegore around the room
|tip Bone Spike will target a random party member and do massive damage to them. This can be prevented if every party member keeps Bone Armor active
|tip Bone Armor is granted by clicking on the Bone Piles around the room
|tip Periodically a section of the room will be engulfed in Soulflame. Avoid the fire and be wary because it grows over time
Defeat Rattlegore |scenariogoal 19261 |goto Scholomance/2 48.60,26.70
step
map Scholomance/2
path follow loose; loop off; ants curved
path	43.20,26.50	36.40,26.80	36.70,37.40
Follow the path |goto Scholomance/2 36.70,37.40 < 10
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
click Forbidden Rites and other Rituals Necromantic##214280
|tip You can find the tome near this area. It is usually found on one of the tables or in a stone alcove.
Destroy Forbidden Rites and other Rituals Necromantic |q 31440/3 |goto Scholomance/2 36.00,47.10 |only if not heroic_dung()
Destroy Forbidden Rites and other Rituals Necromantic |q 31442/3 |goto Scholomance/2 36.00,47.10 |only if heroic_dung()
|only if haveq(31440) or haveq(31442)
step
map Scholomance/2
path follow loose; loop off; ants curved
path	39.60,47.50	46.40,47.20
Follow the path |goto Scholomance/2 46.40,47.20 < 10
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
kill 1 Lilian Voss##58722 |goto Scholomance/2 51.40,47.10
_Phase 1:_
|tip Lilian will Shadow Shiv a random player after jumping onto them. Run away from allies
|tip Death's Grasp will pull every party member to Lilian and will be followed by Dark Blaze. Dark Blaze causes every player to start leaving a trail of fire behind them. Kite fire away from allies
_Phase 2 (begins at 60%):_
|tip She will periodically cast Blazing Soul which does fire damage to all players.
|tip For every melee attack Lilian lands she will unleash another Blazing Soul. Kite her around
|tip If you are targetedy by Fixate Anger, run away
_Phase 3:_
|tip Be watchful of who Lilian's Soul is Fixating on, this is the highest source of damage during the fight
|tip You will continue to be pulled in by Death's Grasp, keep an area clear of Dark Blaze
Defeat Lilian Voss |scenariogoal 19262 |goto Scholomance/2 51.40,47.10
step
map Scholomance/2
path follow loose; loop off; ants curved
path	54.30,55.60	54.20,67.10
Follow the path |goto Scholomance/2 54.20,67.10 < 12
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
click The Dark Grimoire##214277
|tip You can find the tome near this area. It is usually found on one of the tables.
Destroy The Dark Grimoire |q 31440/4 |goto Scholomance/2 47.10,73.10 |only if not heroic_dung()
Destroy The Dark Grimoire |q 31442/4 |goto Scholomance/2 47.10,73.10 |only if heroic_dung()
|only if haveq(31440) or haveq(31442)
step
map Scholomance/2
path follow loose; loop off; ants curved
path	47.90,83.40	48.00,88.90	57.50,89.10
path	Scholomance/3 49.90,20.80
Follow the path |goto Scholomance/3 49.90,20.80 < 5
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
kill 1 Darkmaster Gandling##59080 |goto Scholomance/4 49.90,38.50
|tip Immolate will be used on a random party member
|tip Darkmaster Gandling will cast Rise!. This summons many Failed Students that need to be killed. During this cast Darkmaster Gandling takes reduced damage
|tip Periodically a random party member will be teleported to one of Gandling's study rooms for a Harsh Lesson
|tip This party member must kill the Expired Test Subjects and make their way back to the bosses room. If the healer gets trapped in one of these rooms, the Fresh Test Subjects around the room will serve as useful bombs. Dispel the _Explosive Pain_ off of them to deal AoE damage
kill 1 Darkmaster Gandling##59080 |q 31447/1 |goto Scholomance/4 49.90,38.50 |only if haveq(31447)
kill 1 Darkmaster Gandling##59080 |q 31448/1 |goto Scholomance/4 49.90,38.50 |only if haveq(31448)
Defeat Darkmaster Gandling |scenariostage 1 |goto Scholomance/4 49.90,38.50
step
talk Talking Skull##64562
turnin The Four Tomes##31440 |goto Scholomance/3 49.20,21.20
|only if not completedq(31440) and not heroic_dung()
step
talk Talking Skull##64562
turnin An End to the Suffering##31447 |goto Scholomance/3 49.20,21.20
|only if not completedq(31447) and not heroic_dung()
step
talk Spirit of Lord Alexei Barov##64563
turnin The Four Times##31442 |goto Scholomance/3 49.20,21.20
|only if not completedq(31442) and heroic_dung()
step
talk Spirit of Lord Alexei Barov##64563
turnin An End to the Suffering##31448 |goto Scholomance/3 49.20,21.20
|only if not completedq(31448) and heroic_dung()
step
Congratulations, you have completed Scholomance |only if default
Congratulations, you have completed Scholomance (Heroic) |only if heroic_dung()
]])
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Classic Dungeons\\Shadowfang Keep")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Classic Dungeons\\The Stormwind Stockade")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Classic Dungeons\\Stratholme: Main Gate")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Classic Dungeons\\Stratholme: Service Entrance")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Classic Dungeons\\Sunken Temple")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Classic Dungeons\\Uldaman")
GoatQuest:RegisterGuide("Dungeon Guides\\Classic Dungeons\\Wailing Caverns",{
description="This guide will walk you through completing the Wailing Caverns dungeon. This dungeon is located in the Northern Barrens on the continent of Kalimdor and is home to the Druids of the Fang. This dungeon ranges from level 10 to 30.",
mapid=279,
achieveid={630},
patch='30002',
condition_suggested=function() return level>=10 and level<=30 end,
keywords={"WC, Barrens, Deviate"},
},[[
step
label "start"
Press _I_ and queue for Wailing Caverns or enter the dungeon with your group |goto Wailing Caverns/1 45.90,59.70 |c
step
talk Ebru##5768
accept Cleansing the Caverns##26870 |goto Wailing Caverns/1 46.60,59.20
|only if not completedq(26870)
step
talk Nalpak##5767
accept Deviate Hides##26872 |goto Wailing Caverns/1 46.60,58.40
accept Preemptive Methods##26873 |goto Wailing Caverns/1 46.60,58.40
|only if not completedq(26872)
stickystart "Quests"
step
map Wailing Caverns/1
path follow loose; loop off; ants curved
path	45.60,53.00	41.40,51.60	35.00,51.50
path	35.50,49.10	37.80,44.20	36.90,39.80
path	32.90,40.30
Follow the path |goto Wailing Caverns/1 32.90,40.30 < 8
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
kill 1 Lady Anacondra##3671 |only if default
kill 1 Lady Anacondra##3671 |q 26870/2 |only if haveq(26870)
|tip Lady Anacondra will cast Lightning Bolt on her current target
|tip She will also put random players to sleep using Druid's Slumber
|tip Anacondra will periodically attempt to heal herself or an ally with Healing Touch
_TANK/DAMAGE:_ |grouprole TANK or DAMAGE
|tip Be sure to save an interrupt for Healing Touch. Interrupt Druid's Slumber whenever possible |grouprole TANK or DAMAGE
_HEALER:_ |grouprole HEALER
|tip Keep the tank topped off in case you get put to sleep |grouprole HEALER
Defeat Lady Anacondra |scenariogoal 24764 |goto Wailing Caverns/1 30.50,43.20
step
Jump down here |goto Wailing Caverns/1 30.30,40.10 < 5
confirm
step
map Wailing Caverns/1
path follow loose; loop off; ants curved
path	28.20,40.10	25.10,46.30	20.50,45.30
path	14.40,43.60	8.90,33.60	11.40,29.30
path	12.10,32.40	12.90,33.50	14.70,34.30
path	15.80,39.00
Jump in the water and follow this path |goto Wailing Caverns/1 15.80,39.00 < 8
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
kill 1 Lord Pythas##3670 |only if default
kill 1 Lord Pythas##3670 |q 26870/3 |only if haveq(26870)
|tip Lord Pythas will cast Lightning Bolt on his current target
|tip He will also put random players to sleep using Druid's Slumber
|tip Pythas will periodically attempt to heal himself or an ally with Healing Touch
|tip Players within 10 yards will occasionally take nature damage and suffer reduced attack speed from Thunder Clap
_TANK/DAMAGE:_ |grouprole TANK or DAMAGE
|tip Be sure to save an interrupt for Healing Touch. Interrupt Druid's Slumber whenever possible |grouprole TANK or DAMAGE
_HEALER:_ |grouprole HEALER
|tip Keep the tank topped off in case you get put to sleep |grouprole HEALER
Defeat Lord Pythas |scenariogoal 24769 |goto Wailing Caverns/1 20.10,41.60
step
map Wailing Caverns
path follow loose; loop off; ants curved
path	18.60,35.60	17.30,27.20	16.10,24.40
path	11.90,24.90	5.60,30.20	7.60,38.20
path	8.30,44.30	12.70,52.40	15.70,53.70
Follow the path |goto Wailing Caverns 15.70,53.70 < 8
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
kill 1 Lord Cobrahn##3669 |only if default
kill 1 Lord Cobrahn##3669 |q 26870/1 |only if haveq(26870)
|tip Lord Cobrahn will cast Lightning Bolt on his current target
|tip He will also put random players to sleep using Druid's Slumber
|tip Cobrahn will periodically attempt to heal himself or an ally with Healing Touch
|tip At 45% health, Cobrahn will gain Serpent Form. He will begin using Poison on players. Dispel this when possible
_TANK/DAMAGE:_ |grouprole TANK or DAMAGE
|tip Be sure to save an interrupt for Healing Touch. Interrupt Druid's Slumber whenever possible |grouprole TANK or DAMAGE
_HEALER:_ |grouprole HEALER
|tip Keep the tank topped off in case you get put to sleep |grouprole HEALER
Defeat Lord Cobrahn |scenariogoal 24770 |goto Wailing Caverns/1 15.60,58.50
step
Jump down here |goto Wailing Caverns/1 15.80,51.80 |n
|tip You will take some fall damage |goto Wailing Caverns/1 16.10,49.20 <5
confirm
step
map Wailing Caverns/1
path follow loose; loop off; ants curved
path	17.90,46.20	22.00,45.60	24.70,46.60
path	27.30,40.80	31.80,36.80	37.70,35.30
path	44.90,37.50	50.30,43.10	52.80,49.00
path	51.80,54.90	52.50,58.00	55.20,64.00
path	58.50,67.00
kill Kresh##3653
If you haven't already killed Kresh, then you will find him walking in this little river.
Defeat Kresh |scenariogoal 24772
Follow the path |goto Wailing Caverns/1 58.50,67.00 < 15
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
kill Skum##3674 |goto Wailing Caverns/1 60.70,72.10
confirm
step
map Wailing Caverns/1
path follow loose; loop off; ants curved
path	60.50,78.80	57.20,88.60	54.30,87.50
path	54.00,84.50	54.90,81.80	56.60,79.00
path	55.50,75.00	54.90,70.30	52.90,67.00
path	52.40,66.90	50.40,62.40	52.00,60.00
path	55.90,56.80	64.40,59.70	68.60,62.20
path	71.60,64.70	73.20,69.20	72.40,76.50
path	68.20,84.20	62.50,82.80
Follow this path |goto Wailing Caverns/1 62.50,82.80 < 5
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
Go to the ledge |goto Wailing Caverns/1 60.40,81.20
Jump across the gap |goto Wailing Caverns/1 59.20,79.80 < 5
confirm
step
map Wailing Caverns/1
path follow loose; loop off; ants curved
path	56.70,78.00	54.40,76.50	53.60,69.90
path	53.00,63.80	54.40,60.60	58.40,56.70
Follow the path |goto Wailing Caverns/1 58.40,56.70
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
kill Lord Serpentis##3673 |only if default
kill Lord Serpentis##3673 |q 26870/4 |only if haveq(26870)
|tip Lord Serpentis will cast Lightning Bolt on his current target
|tip He will also put random players to sleep using Druid's Slumber
|tip Serpentis will periodically attempt to heal himself or an ally with Healing Touch
_TANK/DAMAGE:_ |grouprole TANK or DAMAGE
|tip Be sure to save an interrupt for Healing Touch. Interrupt Druid's Slumber whenever possible |grouprole TANK or DAMAGE
_HEALER:_ |grouprole HEALER
|tip Keep the tank topped off in case you get put to sleep |grouprole HEALER
Defeat Lord Serpentis |scenariogoal 1/24771 |goto Wailing Caverns/1 62.60,53.30
step
kill 1 Verdan the Everliving##5775 |goto Wailing Caverns/1 56.40,47.50
|tip Verdan the Everliving has one ability, Grasping Vines
_Grasping Vines_
|tip This will periodically knock down players within 10 yards and immobilize them for 5 seconds
_TANK:_ |grouprole TANK
|tip Make use of defenisive cooldowns, especially during Grasping Vines |grouprole TANK
_HEALER:_ |grouprole HEALER
|tip Be prepared, Verdan the Everliving may deal significant damage to undergeared tanks |grouprole HEALER
confirm
step
Walk to the edge of the pit |goto Wailing Caverns/1 55.30,42.80 |n
Jump down this hole |goto Wailing Caverns/1 54.50,39.50 < 5
confirm
step
map Wailing Caverns/1
path follow loose; loop off; ants curved
path	54.10,43.40	50.50,43.10	44.60,38.70
path	41.00,37.80	38.10,38.30	37.60,44.90
path	35.50,48.50	35.40,50.90	37.80,51.70
path	44.20,52.50
Follow the path |goto Wailing Caverns/1 44.20,52.50 < 8
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
label "Quests"
clicknpc Serpentbloom##13891
Kill Deviate mobs for Deviate Hides
Collect Deviate Hides |q 26872/1
Collect Serpent Bloom |q 26873/1
step
talk Ebru##5768
turnin Cleansing the Caverns##26870 |goto Wailing Caverns/1 46.60,59.20
|only if not completedq(26870)
step
talk Nalpak##5767
turnin Deviate Hides##26872 |goto Wailing Caverns/1 46.60,58.40
turnin Preemptive Methods##26873 |goto Wailing Caverns/1 46.60,58.40
|only if not completedq(26872) or not completedq(26873)
step
talk Muyoh##3678 |goto Wailing Caverns/1 46.50,56.00
Select _"Let the event begin!"_ and start following |goto Wailing Caverns/1 45.30,53.30 < 8
confirm
step
map Wailing Caverns/1
path follow loose; loop off; ants curved
path	44.20,52.40	38.90,51.60	35.00,51.10
path	35.00,51.10	36.20,47.20	37.80,44.20
path	37.60,39.90	34.50,39.50	30.40,43.00
path	28.10,41.80	26.60,39.40	27.90,34.00
path	32.60,29.40	37.70,24.80	37.60,21.60
path	34.50,15.90
There will be 2 waves of mobs that attack him, then the boss will appear.
Escort and Protect Muyoh until you get to the boss |scenariogoal 2/24776 |goto Wailing Caverns/1 34.50,15.90 <5 |noway
|tip Opening the world map will display an ant trail guiding you through the current floor.
step
kill 1 Mutanus the Devourer##3654
_TANK/DAMAGE:_ |grouprole TANK or DAMAGE
|tip Interrupt Naralex's Nightmare. This will put players to sleep for 8 seconds |grouprole TANK or DAMAGE
|tip Mutanus will Terrify random players. Dispel this if possible |grouprole TANK or DAMAGE
|tip Occasionally, Mutanus will use Thundercrack, dealing damage to all players within 10 yards and stunning them |grouprole TANK or DAMAGE
Defeat Mutanus the Devourer |scenariogoal 2/18524 |goto Wailing Caverns/1 34.00,15.60
step
Congratulations, you have completed Wailing Caverns!
]])
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Classic Dungeons\\Zul'Farrak")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Classic Raids\\Blackwing Lair")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Classic Raids\\Molten Core")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Classic Raids\\Ruins of Ahn'Qiraj")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Classic Raids\\Temple of Ahn'Qiraj")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Outland Dungeons\\Auchindoun: Auchenai Crypts")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Outland Dungeons\\Auchindoun: Mana-Tombs")
GoatQuest:RegisterGuide("Dungeon Guides\\Outland Dungeons\\Auchindoun: Sethekk Halls",{
mapid=258,
achieveid={653},
patch='40100',
condition_suggested=function() return level>=15 and level<=30 end,
keywords={"Terokkar, Forest"},
description="This guide will walk you through the Auchindoun: Sethekk Halls dungeon.",
},[[
step
label "start"
Press _I_ and queue for the Escape from Sethekk Halls or enter the dungeon with your group |goto Sethekk Halls/1 73.40,36.50 |c
step
talk Isfar##54840
accept Brother Against Brother##29605 |goto Sethekk Halls 72.20,35.50
accept Terokk's Legacy##29606 |goto Sethekk Halls 72.20,35.50
|only if not completedq(29605) or not completedq(29606)
step
map Sethekk Halls/1
path follow smart; loop off; ants curved; dist 12
path	73.30,34.80	73.10,28.00	63.40,27.80
path	59.00,38.00	59.00,45.80	54.10,52.10
path	48.70,53.80
Follow the path |goto Sethekk Halls/1 48.70,53.80 < 10
|tip Kill Time-Lost Controllers first. They drop totems that mind control.
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
kill Darkweaver Syth##18472
|tip At 90%, 55%, and 15% health, Syth will summon four elementals. AoE these quickly.
|tip Chain Lightning deals AoE damage so try and spread out.
Loot Terokk's Mask |q 29606/1 |goto Sethekk Halls/1 48.60,67.50 |only if haveq(29606)
Defeat Darkweaver Syth |scenariogoal 24889 |goto Sethekk Halls/1 48.60,67.50
step
talk Dealer Vijaad##54847
accept Eyes of Desire##29607 |goto Sethekk Halls 48.30,67.70
|only if not completedq(29607)
step
talk Lakka##18956
Tell him: "_I'll have you out of there in just a moment._"
Free Lakka |q 29605/1 |goto Sethekk Halls 50.80,70.80
|only if haveq(29605)
stickystart "Serpent"
step
map Sethekk Halls/1
path follow smart; loop off; ants curved; dist 12
path	48.60,71.20	48.60,83.30	48.90,95.00
path	Sethekk Halls/2 53.20,94.90	Sethekk Halls/2 53.10,82.50
path	Sethekk Halls/2 44.00,82.40	Sethekk Halls/2 43.10,88.60
path	Sethekk Halls/2 30.10,88.40	Sethekk Halls/2 27.20,80.90
path	Sethekk Halls/2 32.60,71.20	Sethekk Halls/2 32.60,41.60
Follow the path |goto Sethekk Halls/2 32.60,41.60 < 10
|tip Kill Time-Lost Controllers first. They drop totems that mind control.
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
|only if not heroic_dung()
step
map Sethekk Halls/1
path follow smart; loop off; ants curved; dist 12
path	48.60,71.20	48.60,83.30	48.90,95.00
path	Sethekk Halls/2 53.20,94.90	Sethekk Halls/2 53.10,82.50
path	Sethekk Halls/2 44.00,82.40	Sethekk Halls/2 43.10,88.60
path	Sethekk Halls/2 30.10,88.40	Sethekk Halls/2 27.20,80.90
path	Sethekk Halls/2 32.60,71.20
Follow the path |goto Sethekk Halls/2 32.60,71.20 < 10
|tip Kill Time-Lost Controllers first. They drop totems that mind control.
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
|only if heroic_dung()
step
kill Anzu##23035
|tip At 75% and 35% health, Anzu will become immune and summon his brood. AoE the birds and continue with Anzu.
|tip Paralyzing Screech will stun everyone for 6 seconds.
|tip Dive Causes Anzu to charge a player and knock them back.
|tip Spell Bomb should be dispelled whenever possible.
Defeat Anzu |scenariogoal 24890 |goto Sethekk Halls/2 32.40,56.00
|only if heroic_dung()
step
kill Talon King Ikiss##18473
|tip At 80%, 50%, and 25% health, Ikiss will used Arcane Explosion. Hide behind a pillar.
|tip Just before Arcane Explosion is cast, Ikiss will Slow the whole party. Stay close to a pillar. |only if heroic_dung()
Loot Terokk's Quill |q 29606/2 |goto Sethekk Halls/2 32.20,29.50 |only if haveq(29606)
Defeat Talon King Ikiss |scenariogoal 1/34428 |goto Sethekk Halls/2 32.20,29.50
step
label "Serpent"
kill Cobalt Serpent##19428+
|tip Do this as you run through the next part of the dungeon.
collect 3 Cobalt Eye##72480 |q 29607/1
|only if haveq(29607)
step
map Sethekk Halls/2
path follow smart; loop off; ants curved; dist 12
path	32.50,27.50	40.70,27.50
path	Sethekk Halls/1 54.30,27.50	Sethekk Halls/1 64.30,27.80	Sethekk Halls/1 72.50,27.90
Follow the path back to the quest giver |goto Sethekk Halls/1 72.50,27.90 < 10 |noway |c
talk Isfar##54840
turnin Brother Against Brother##29605 |goto Sethekk Halls/1 72.20,35.50 |noway
turnin Terokk's Legacy##29606 |goto Sethekk Halls/1 72.20,35.50 |noway
|tip Opening the world map will display an ant trail guiding you through the current floor.
|only if haveq(29605) or haveq(29606)
step
map Sethekk Halls/1
path follow smart; loop off; ants curved; dist 12
path	73.30,34.80	73.10,28.00	63.40,27.80
path	59.00,38.00	59.00,45.80	54.10,52.10
path	48.70,53.80
Follow the path back to the quest giver |goto Sethekk Halls/1 48.70,53.80 < 10 |noway |c
talk Dealer Vijaad##54847
turnin Eyes of Desire##29607 |goto Sethekk Halls 48.10,67.70 |noway
|tip Opening the world map will display an ant trail guiding you through the current floor.
|only if haveq(29607)
step
Congratulations! You have completed Sethekk Halls
]])
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Outland Dungeons\\Auchindoun: Shadow Labyrinth")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Outland Dungeons\\Caverns of Time: The Black Morass")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Outland Dungeons\\Caverns of Time: Escape from Durnholde Keep")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Outland Dungeons\\Coilfang Reservoir: Slave Pens")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Outland Dungeons\\Coilfang Reservoir: The Steamvault")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Outland Dungeons\\Coilfang Reservoir: Underbog")
GoatQuest:RegisterGuide("Dungeon Guides\\Outland Dungeons\\Hellfire Citadel: The Blood Furnace",{
mapid=261,
achieveid={648},
patch='30003',
condition_suggested=function() return level>=10 and level<=30 end,
keywords={"HC, BF, HFC, HFP, Peninsula"},
description="This guide will walk you through the Hellfire Citadel: The Blood Furnace dungeon.",
},[[
step
label "start"
Press _I_ and queue for The Blood Furnace or enter the dungeon with your group |goto The Blood Furnace/1 47.80,90.60 |c
step
talk Caza'rez##54636
accept Make Them Bleed##29535 |goto The Blood Furnace 51.40,90.00
accept Heart of Rage##29536 |goto The Blood Furnace 51.40,90.00
accept Mind the Gap##29537 |goto The Blood Furnace 51.40,90.00
|only if not completedq(29535) or not completedq(29536) or not completedq(29537)
stickystart "felorcblood"
step
map The Blood Furnace/1
path follow smart; loop off; ants curved; dist 15
path	52.00,90.00	58.20,89.50	58.10,76.60
path	58.10,66.40	58.10,56.10	53.10,53.00
path	49.70,46.80	47.30,41.20	45.00,41.20
Follow the path |goto The Blood Furnace/1 45.00,41.20 < 6
|tip Be wary of stealthed Laughing Skull Rogues
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
kill The Maker##17381
|tip Domination mind controls a party member for 10 seconds, crowd control this party member.
|tip Exploding Breaker deals nature damage to the player targeted and anyone within 8 yards. Stay spread out to minimize party damage.
Loot the Fel Infusion Rod |q 29535/2 |goto The Blood Furnace 36.60,40.70 |only if haveq(29535)
Defeat the Maker |scenariogoal 24911 |goto The Blood Furnace 36.60,40.70
step
map The Blood Furnace/1
path follow smart; loop off; ants curved; dist 15
path	35.80,41.30	31.70,42.10	30.80,30.60
path	31.90,21.10	35.50,22.00
Follow the path |goto The Blood Furnace/1 35.50,22.00 < 5
|tip Be wary of stealthed Laughing Skull Rogues
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
click Cell Door Lever##181982
|tip This will start the boss fight. You will have 4 cell doors open and have to fight Orcs until all 4 waves are complete.
kill Broggok##17380
|tip DPS should stay behind Broggok to avoid damage from Slime Spray.
Defeat Broggok |scenariogoal 24913 |goto The Blood Furnace/1 43.40,21.90
step
map The Blood Furnace/1
path follow smart; loop off; ants curved; dist 15
path	44.70,22.00	58.10,21.40	58.60,27.50
path	62.60,29.00	65.80,33.20	67.80,41.00
path	65.40,41.20
Follow the path |goto The Blood Furnace/1 65.40,41.20 < 5
|tip Be wary of stealthed Laughing Skull Rogues
|tip Opening the world map will display an ant trail guiding you through the current floor.
Investigate The Blood Furnace |q 29536/1 |only if haveq(29536)
confirm
step
kill Shadowmoon Channeler##17653
|tip After the Channelers die, Keli'dan will activate.
kill Keli'dan the Breaker##17377
|tip Dispel Corruption whenever possible. When Keli'dan becomes immune, he will kneel down and cast Burning Nova. Run at least 20 yards away.
Defeat the Shadowmoon Channeler |scenariogoal 3239 |goto The Blood Furnace/1 59.20,42.50
step
label "felorcblood"
kill Laughing Skull Enforcer##17370+, Laughing Skull Rogue##17491+
kill Shadowmoon Warlock##17371+, Shadowmoon Adept##17397+, Shadowmoon Summoner##17395+
Loot 10 Fel Orc Blood Vials |q 29535/1
|only if haveq(29535)
step
map The Blood Furnace/1
path follow smart; loop off; ants curved; dist 15
path	62.30,47.20	63.40,63.40	63.50,78.40
path	62.80,90.60	55.50,89.70
Follow the path |goto The Blood Furnace/1 55.50,89.70 < 8
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
|only if not completedq(29535) or not completedq(29536) or not completedq(29537)
step
talk Caza'rez##54636
turnin Make Them Bleed##29535 |goto The Blood Furnace/1 51.40,90.10
turnin Heart of Rage##29536 |goto The Blood Furnace/1 51.40,90.10
turnin Mind the Gap##29537 |goto The Blood Furnace/1 51.40,90.10
|only if not completedq(29535) or not completedq(29536) or not completedq(29537)
step
Congratulations! You have completed The Blood Furnace
]])
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Outland Dungeons\\Hellfire Citadel: Hellfire Ramparts")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Outland Dungeons\\Hellfire Citadel: Shattered Halls")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Outland Dungeons\\Magister's Terrace")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Outland Dungeons\\Tempest Keep: The Arcatraz")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Outland Dungeons\\Tempest Keep: Botanica")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Outland Dungeons\\Tempest Keep: The Mechanar")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Outland Raids\\Black Temple")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Outland Raids\\The Eye")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Outland Raids\\Gruul's Lair")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Outland Raids\\Hyjal Summit (Battle for Mount Hyjal)")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Outland Raids\\Karazhan")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Outland Raids\\Magtheridon's Lair")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Outland Raids\\Serpentshrine Cavern")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Outland Raids\\Sunwell Plateau")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Northrend Dungeons\\Ahn'kahet: The Old Kingdom")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Northrend Dungeons\\Azjol-Nerub")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Northrend Dungeons\\Caverns of Time: The Culling of Stratholme")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Northrend Dungeons\\Drak'Tharon Keep")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Northrend Dungeons\\Forge of Souls")
GoatQuest:RegisterGuide("Dungeon Guides\\Northrend Dungeons\\Gundrak",{
mapid=153,
achieveid={484},
patch='50004',
condition_suggested=function() return level>=20 and level<=30 end,
keywords={"Zul'Drak"},
description="This guide will walk you through the Gundrak dungeon.",
},[[
step
label "lfg"
Press _I_ and queue for Gundrak or enter the dungeon with your group |goto Gundrak/1 59.00,30.90 |c
step
talk Tol'mar##55738
accept Gal'darah Must Pay##29834 |goto Gundrak,57.30,34.60
accept One of a Kind##29839 |goto Gundrak,57.30,34.60
accept For Posterity##29844 |goto Gundrak,57.30,34.60
|only if not completedq(29834) or not completedq(29839) or not completedq(29844)
stickystart "drakhistory"
step
Go down the ramp |goto Gundrak/1 58.70,40.00 |c
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
kill Slad'ran##29304
|tip Powerful Bite deals damage and reduces armor by 20% for 5 seconds.
|tip Poison Nova deals nature damage to everyone within 15 yards and poisons them for 16 seconds.
|tip Slad'ran Viper bites and leaves a poison DoT.
|tip Slad'ran Constrictor encases a player in snakes. If Grip stacks up to 5, the player is stunned. Kill the snakes.
Defeat Slad'ran |scenariogoal 27911 |goto Gundrak/1 54.10,48.70
step
click Altar of Slad'ran##8278 |goto Gundrak/1 53.80,48.70
confirm
step
map Gundrak/1
path follow smart; loop off; ants curved; dist 15
path	57.00,48.70	58.80,54.80	58.90,66.40
path	49.60,73.50
Follow the path |goto Gundrak/1 49.60,73.50 < 6
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
kill Drakkari Colossus##29307
kill Drakkari Elemental##29573
_Colossus Phase_:
|tip Mortal Strikes reduces healing received by 50% for 3 seconds.
|tip He Emerges at 50% health, the Drakkari Elemental emerges.
_The Elemental_:
|tip Mojo Volley deals nature damage to 2 random players.
|tip The Elemental charges forward. Players in the path take nature damage over 45 seconds.
|tip At 50% health, the Elemental merges and becomes the Colossus again.
Loot the Drakkari Colossus Fragment |q 29839/1 |only if haveq(29839)
Defeat Drakkari Colossus |scenariogoal 27912 |goto Gundrak/1 46.90,66.30
step
click Altar of the Drakkari Colossus##8278 |goto Gundrak/1 46.50,62.50
confirm
step
map Gundrak/1
path follow smart; loop off; ants curved; dist 15
path	46.60,65.20	46.20,73.30	41.00,72.50
path	37.70,60.40	34.60,59.40	33.50,54.00
Follow the path |goto Gundrak/1 33.50,54.00 < 6
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
kill Moorabi##29305
_Prophet_:
|tip Ground Tremor deals damage and stuns all players within 60 yards for 2 seconds.
|tip Numbing Shout reduces casting speed by 25% for 5 seconds.
|tip Mojo Frenzy increases casting speed and damage based upon remaining health.
|tip Transforms into the Avatar, increasing damage by 25%. Interrupt as much as possible.
_Avatar_:
|tip Quake deals damage and stuns all players within 60 yards for 2 seconds.
|tip Numbing Roar reduces casting speed by 50% for 5 seconds.
Defeat Moorabi |scenariogoal 27913 |goto Gundrak/1 37.40,49.10
step
click Altar of Moorabi##8278 |goto Gundrak/1 39.60,49.20
confirm
step
map Gundrak/1
path follow smart; loop off; ants curved; dist 15
path	38.10,49.10	31.70,49.10	27.70,48.00
path	23.30,53.00	25.00,64.50
Follow the path |goto Gundrak/1 25.00,64.50 < 6
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
|only if heroic_dung()
step
kill Eck the Ferocious##29932 |goto Gundrak/1 25.30,70.20
|tip Eck Spit deals nature damage and drains mana in a frontal cone. Stay behind Eck.
|tip Eck Spring leaps on a distant player.
|tip After 90 seconds, Eck gains 150% attack speed and 500% increased damage. Hard enrage timer.
confirm
|only if heroic_dung()
step
map Gundrak/1
path follow smart; loop off; ants curved; dist 15
path	25.00,64.50	23.30,53.00	27.70,48.00
path	31.70,49.10	38.10,49.10
Follow the path |goto Gundrak/1 38.10,49.10 < 8
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
|only if heroic_dung()
step
map Gundrak/1
path follow smart; loop off; ants curved; dist 15
path	40.00,49.10	46.60,54.00	46.60,47.80
path	46.50,37.40
Follow the path |goto Gundrak/1 46.50,37.40 < 8
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
kill Gal'darah##29306
_Prophet_:
|tip Stampede charges a player, dealing damage and knocking them in the air.
|tip Gal'darah does Whirling Slash, dealing damage and leaving a bleed. Run away.
|tip Puncture bleeds a player for 2 minutes.
_Avatar_:
|tip Impaling Charge, charges a player, dealing damage and knocking them back.
|tip Enrage increases attack speed by 100% for 8 seconds. Use a cooldown if tanking.
|tip Stomp deals damage and knocks back all players within 10 yards.
Defeat Gal'darah |scenariogoal 1/27914 |goto Gundrak/1 46.60,25.70
step
label "drakhistory"
There will be Drakkari History Tablets throughout the dungeon. You will need to collect 6 to complete the quest
click Drakkari History Tablet##192826
collect 6 Drakkari History Tablet##43140 |q 29844/1
|only if haveq(29844)
step
talk Tol'mar##55738
turnin Gal'darah Must Pay##29834 |goto Gundrak 51.70,20.90
turnin One of a Kind##29839 |goto Gundrak 51.70,20.90
turnin For Posterity##29844 |goto Gundrak 51.70,20.90
|only if haveq(29834) or haveq(29839) or haveq(29844)
step
Congratulations! You have completed Gundrak
]])
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Northrend Dungeons\\Halls of Lightning")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Northrend Dungeons\\Halls of Reflection")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Northrend Dungeons\\Halls of Stone")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Northrend Dungeons\\The Nexus")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Northrend Dungeons\\The Oculus")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Northrend Dungeons\\Pit of Saron")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Northrend Dungeons\\Trial of the Champion")
GoatQuest:RegisterGuide("Dungeon Guides\\Northrend Dungeons\\Utgarde Keep",{
mapid=133,
achieveid={477},
patch='40100',
condition_suggested=function() return level>=10 and level<=30 end,
keywords={"Howling, Fjord, UK"},
description="This guide will walk you through the Utgarde Keep: Utgarde Keep dungeon.",
},[[
step
label "lfg"
Press _I_ and queue for Utgarde Keep or enter the dungeon with your group |goto Utgarde Keep/1 69.30,73.00 |c
step
talk Dark Ranger Marrah##24137
accept A Score to Settle##30112
accept Disarmament##13206
accept Ingvar Must Die!##11262 |goto Utgarde Keep,68.20,67.70
stickystart "vrykulweapons"
step
map Utgarde Keep/1
path follow smart; loop off; ants curved; dist 15
path	68.30,68.60	65.70,56.30	62.80,38.90
path	65.10,31.00	56.20,25.20	50.40,28.50
path	43.90,28.40	38.50,34.10	31.60,37.60
path	23.60,38.60	25.90,50.30
Follow the path |goto Utgarde Keep/1 25.90,50.30 < 8
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
kill Prince Keleseth##23953
|tip Frost Tomb ice blocks a player, inflicting frost damage and stunning them for 20 seconds. Kill it to break them free.
|tip Skeletons attack when engaging Keleseth. After their death, they will resurrect in 20 seconds. Kill them quickly.
Defeat Prince Keleseth |scenariogoal 27889 |goto Utgarde Keep/1 29.50,67.00
step
map Utgarde Keep/1
path follow smart; loop off; ants curved; dist 15
path	25.40,68.20	21.70,74.70	25.50,86.20
path	35.30,88.50	50.10,82.20	Utgarde Keep/2 28.10,67.90
path	Utgarde Keep/2 26.60,60.10	Utgarde Keep/2 37.10,54.80
path	Utgarde Keep/2 44.50,82.50	Utgarde Keep/2 55.30,79.70
Follow the path |goto Utgarde Keep/2 55.30,79.70 < 8
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
kill Dalronn##24201
kill Skarvald the Constructor##24200
|tip When one dies, it becomes an untargetable ghost. Dalronn is much easier to deal with as a ghost.
_Dalronn_:
|tip Kill him first.
|tip Interrupt Shadow Bolt.
|tip Debilitate inflicts shadow damage and reduces all speed by 50% for 8 seconds.
|tip Summon Skeletons interrupt this to avoid the adds.
_Skarvald:_
|tip Kill him last.
|tip Enrage increases his attack speed and damage for 10 seconds. .
Defeat Dalronn and Skarvald the Constructor |scenariogoal 27890 |goto Utgarde Keep/2 58.30,60.70
step
map Utgarde Keep/2
path follow smart; loop off; ants curved; dist 15
path	58.60,60.50	55.30,45.80	53.80,25.80
Follow the path |goto Utgarde Keep/2 53.80,25.80 < 8
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
map Utgarde Keep/3
path follow smart; loop off; ants curved; dist 15
path	Utgarde Keep/3 33.00,49.90	Utgarde Keep/3 28.90,37.80
path	Utgarde Keep/3 39.80,32.30	Utgarde Keep/3 50.70,29.30
path	Utgarde Keep/3 51.80,38.50	Utgarde Keep/3 54.80,52.80
path	Utgarde Keep/3 67.70,41.90
Follow the path |goto Utgarde Keep/3 67.70,41.90 < 8
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
kill Ingvar the Plunderer##23954
_Phase 1_:
|tip Frontal cone damage. Avoid standing in front.
|tip Staggering Roar deals damage and locks out spells cast for 6 seconds.
|tip Enrage stacks up to 50 times.
_Phase 2_:
|tip Hide behind a pillar until Dreadful Roar is over.
|tip Frontal cleave.
|tip Shadow Axe leaves a spinning axe that deals damage. Move out.
|tip Dreadful Roar deals shadow damage and locks out spells for 8 seconds.
Loot Ingvar's Head |q 29763/1 |only if haveq(29763)
Defeat Ingvar the Plunderer |scenariogoal 1/27891 |goto Utgarde Keep/3 72.70,38.80
step
label "vrykulweapons"
While going through the instance, look for Vrykul Weapons along the walls
click Vrykul Weapons##193059
Loot 5 Vrykul Weapons |q 29764/1
|only if haveq(29764)
step
map Utgarde Keep/3
path follow smart; loop off; ants curved; dist 15
path	72.50,38.00	58.00,50.20	46.60,56.50
path	Utgarde Keep/1 79.90,73.40	Utgarde Keep/1 73.60,66.40
Follow the path |goto Utgarde Keep/1 73.60,66.40 < 10
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
|only if haveq(29763) or haveq(29764) or haveq(29803)
step
talk Dark Ranger Marrah##24137
turnin A Score to Settle##30112
turnin Disarmament##13206
turnin Ingvar Must Die!##11262 |goto Utgarde Keep/1 68.20,67.70
step
Congratulations! You have completed Utgarde Keep
]])
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Northrend Dungeons\\Utgarde Keep: Utgarde Pinnacle")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Northrend Dungeons\\The Violet Hold")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Northrend Raids\\The Eye of Eternity")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Northrend Raids\\Icecrown Citadel")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Northrend Raids\\Naxxramas")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Northrend Raids\\The Obsidian Sanctum")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Northrend Raids\\Onyxia's Lair")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Northrend Raids\\The Ruby Sanctum")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Northrend Raids\\Trial of the Crusader")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Northrend Raids\\Trial of the Grand Crusader")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Northrend Raids\\Ulduar")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Northrend Raids\\Vault of Archavon")
GoatQuest:RegisterGuide("Dungeon Guides\\Cataclysm Dungeons\\Blackrock Caverns",{
mapid=283,
achieveid={4833},
patch='40003',
condition_suggested=function() return level>=30 and level<=35 end,
keywords={"Searing, Gorge, Burning, Steppes, BRM, BRC"},
description="This guide will walk you through the Blackrock Caverns dungeon.",
},[[
step
label "lfg"
Press _I_ and queue for Blackrock Caverns or enter the dungeon with your group |goto Blackrock Caverns/1 32.40,69.90 < 100 |c
step
talk Finkle Einhorn##49476
accept To the Chamber of Incineration!##28735 |goto Blackrock Caverns,33.10,66.00
step
Clear the trash around this area without pulling the boss|goto Blackrock Caverns 49.30,74.10
_Rom'ogg Bonecrusher_ patrols nearby, if you aggro him, he will do a shout attracting the nearby groups.
Click here when you've cleared the groups. |confirm
step
kill Rom'ogg Bonecrusher##39665 |only if not haveq(28735)
kill Rom'ogg Bonecrusher##39665 |q 28735/1 |only if haveq(28735)
Pull _Rom'ogg Bonecrusher_ when he's at |goto Blackrock Caverns 50.00,67.30
|tip For this fight, he will use Call for Help when you engage him. Any mob nearby that you didnt kill will come to his aid.
|tip He will often use Quake, which can be avoided by moving to the side when you see him casting it. This will also summon Angered Earths. |only if heroic_dung()
|tip He will also summon Angered Earths each time he uses Quake, which need to be picked up by your tank. There will be one per ground crack. |only if heroic_dung()
|tip At 66% and 33% he will use Chains of Woe followed by The Skullcracker, which needs to be avoided or it will kill you.
|tip Players will need to kill the Chains of Woe, then move away from the boss in order to avoid massive, and possibly fatal damage.
|tip He will also use Wounding Strike on the tank, reducing healing received by 25%.
Defeat Rom'ogg Bonecrusher |scenariogoal 1/24792
step
Click the Quest Completion Box that pops up.
turnin To the Chamber of Incineration!##28735
step
map Blackrock Caverns/1
path follow strict;loop off;ants straight
path	50.10,55.20	50.10,39.20	53.90,21.50
Follow the path
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
accept What Is This Place?##28737 |goto Blackrock Caverns/1 53.90,21.50
step
There will be an Evolved Twilight Zealot patrolling here. |goto Blackrock Caverns/1 54.00,20.40
|tip Interrupt Shadow Stike whenever he uses it.
kill Evolved Twilight Zealot##39987
|confirm
step
Jump down the ledge here. |goto Blackrock Caverns/1 51.90,20.00 < 5
confirm
step
kill Evolved Twilight Zealot##39987
There will be a group of 5 patrolling the hallway here. |goto Blackrock Caverns/2 30.30,16.60
Once they are defeated, there will be another Evolved Twilight Zealot on the ramp at |goto Blackrock Caverns/2 29.60,14
|tip Interrupt Shadow Stike whenever he uses it.
|confirm
step
kill Corla Herald of Twilight##39679 |only if not haveq(28737)
kill Corla Herald of Twilight##39679 |q 28737/1 |only if haveq(28737)
|tip You will see two beams on each side of Corla. You should have Ranged DPS or Healers step into the beams during the encounter.
|tip This will give whoever interrupts the beams stacks of Evolution, when you reach 80, step out of the beams. You will need to move back in when your stack falls back off.
|tip Failing to interrupt the beams, or to move out when you reach 80 will result in Twilight Evolution, which will enrage either a player or the minions into attacking your party members, and likely wipe you.
|tip Corla, Herald of Twilight will cast Dark Command on a random party member. It will be important to interrupt this, as it can ruin the Evolution rotations.
Defeat Corla, Herald of Twilight |scenariogoal 1/24793 |goto Blackrock Caverns/2 27.40,16.60
step
Click the Quest Completion Box that pops up.
turnin What Is This Place?##28737
step
map Blackrock Caverns/2
path follow strict;loop off;ants straight
path	34.20,13.30	37.50,13.20	39.20,16.00
Hug the wall, following the way points.
|tip There will be trash at the last waypoint.
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
map Blackrock Caverns/2
path follow strict;loop off;ants straight
path	38.70,25.10	38.60,30.10	43.60,30.50
path	43.70,37.80	43.40,50.10	43.50,57.00
Follow the path
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
accept The Twilight Forge##28738 |goto Blackrock Caverns/2 43.50,57.70
step
There will be 2 fire elementals patrolling around the room with _Karsh Steelbender_.
kill Conflagration##39994+
Pull one at a time back to the ramp.
|confirm
step
kill Karsh Steelbender##39698 |only if not haveq(28738)
kill Karsh Steelbender##39698 |q 28738/1 |only if haveq(28738)
|tip For this fight, there will be a large pillar of flame at the center of the room.
|tip The tank will need to run through the center, giving the boss a Superheated Quicksilver Armor debuff, increasing the damage the boss takes.
|tip When the debuff has 5 seconds left, the tank will have to Run through the pillar of flame again, renewing and adding another debuff to the boss.
|tip If you let Superheated Quicksilver Armor fall off the boss he will gain his Quicksilver Armor buff.
Defeat Karsh Steelbender |scenariogoal 1/24794 |goto Blackrock Caverns/2 45.60,65.60
step
Click the Quest Completion Box that pops up:
turnin The Twilight Forge##28738
step
map Blackrock Caverns/2
path follow strict;loop off;ants straight
path	53.50,67.20	55.70,68.30	58.50,64.90
path	61.60,71.80
Kill trash at the waypoints.
|tip The second group should be 2 Defiled Earth Ragers. Everyone in the group needs to stand close, as they do an AoE that does more damage the further away you are.
|tip Be sure you hug the wall on the left up until the last waypoint.
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
Click the Quest Completion Box that pops up:
accept Do My Eyes Deceive Me?##28740 |goto Blackrock Caverns/2 66.10,71.60
step
There will be 3 Corehound Pups. You can pull them without pulling the boss behind them.
kill Lucky##40008 |n |goto Blackrock Caverns/2 66.30,77.50
kill Buster##40013 |n |goto Blackrock Caverns/2 66.30,77.50
kill Spot##40011 |n |goto Blackrock Caverns/2 66.30,77.50
|confirm
|only if not heroic_dung()
step
kill Beauty##39700 |only if not haveq(28740)
kill Beauty##39700 |q 28740/1 |only if haveq(28740)
|tip She will randomly cast Terrifying Roar, fearing the entire party. Tremor Totem and Fear Ward can be used to avoid this.
|tip She will Berserker Charge an enemy, knocking them back.
|tip She will also use Flamebreak on melee knocking them back.
|tip She casts Magma Spit on party members, causing AoE damage when it is dispelled.
|confirm |only if not haveq(28740)
|only if not heroic_dung()
step
kill Beauty##39700 |only if not haveq(28740)
kill Beauty##39700 |q 28740/1 |only if haveq(28740)
|tip You will need to use crowd control on Lucky, Buster and Spot or kill them before engaging the boss.
|tip DO NOT kill Runty, or the boss will enrage and deal incredible damage.
|tip She will randomly cast Terrifying Roar, fearing the entire party. Tremor Totem and Fear Ward can be used to avoid this.
|tip She will Berserker Charge an enemy, knocking them back.
|tip She will also use Flamebreak on melee knocking them back.
|tip She casts Magma Spit on party members, causing AoE damage when it is dispelled.
|confirm |only if not haveq(28740)
|only if heroic_dung()
step
Click the Quest Completion Box that pops up:
turnin Do My Eyes Deceive Me?##28740
step
Wait here for the elemental patrol. |goto Blackrock Caverns/2 69.60,72.20
|confirm
step
Click the Quest Completion Box that pops up.
accept Ascendant Lord Obsidius##28741 |goto Blackrock Caverns/2 70.00,63.40
step
kill Ascendant Lord Obsidius##39705 |only if not haveq(28741)
kill Ascendant Lord Obsidius##39705 |q 28741/1 |only if haveq(28741)
|tip When you get within aggro radius, he will be attacked. When Raz dies then it will be time to face the boss.
|tip Ascendant Lord Obsidius will split.
|tip There will be 3 Shadows of Obsidius that need to be kited by a ranged DPS. |only if heroic_dung()
|tip He will use Thunderclap, which will decrease allies movement speed by 50% if they are within 25 yards of it. |only if heroic_dung()
|tip During the fight, he will switch bodies with one of the other two clones and you will have to switch dps.
Defeat Ascendant Lord Obsidius |scenariogoal 1/34413 |goto Blackrock Caverns/2 68.80,56.00
step
talk Finkle Einhorn##49476
turnin Ascendant Lord Obsidius##28741 |goto Blackrock Caverns/2 68.80,56.00
|only if haveq(28741)
step
Congratulations! You have completed Blackrock Caverns
]])
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Cataclysm Dungeons\\End Time")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Cataclysm Dungeons\\Grim Batol")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Cataclysm Dungeons\\Halls of Origination")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Cataclysm Dungeons\\Hour of Twilight")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Cataclysm Dungeons\\Lost City of the Tol'vir")
GoatQuest:RegisterGuide("Dungeon Guides\\Cataclysm Dungeons\\The Stonecore",{
mapid=324,
achieveid={4846},
patch='40003',
condition_suggested=function() return level>=30 and level<=35 end,
keywords={"Deepholm"},
description="This guide will walk you through the Stonecore dungeon.",
},[[
step
label "start"
Press _I_ and queue for The Stonecore or enter the dungeon with your group |goto The Stonecore/1 54.50,94.50 < 100 |c
step
talk Earthwarden Yrsa##50048
accept Twilight Documents##28815 |goto The Stonecore 53.70,94.90
step
map The Stonecore/1
path follow strict;loop off;ants straight
path	54.60,88.40	61.40,79.20	63.30,70.90
kill Stonecore Earthshaper##43537+
|tip Make sure to kill him first, if not killed fast enough, he will transform and do big group damage.
|tip You will have to fight him in each group as you continue forward.
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
click Twilight Documents##207415
collect Twilight Documents##65734 |q 28815/1 |goto The Stonecore/1 63.50,65.20
|only if haveq(28815)
step
Click the Quest Completion Box that pops up:
turnin Twilight Documents##28815
accept Followers and Leaders##28814
step
kill Corborus##43438
_Phase 1_
|tip Corborus will attack the Tank and use Crystal Barrage. These crystals will do damage to anyone standing in them.
|tip These will also spawn Crystal Shards to attack. Make sure to AoE these down quickly. |only if heroic_dung()
|tip Additionally, he will randomly use Dampening Wave, which will reduce the healing the party takes, as well as dealing damage. Remove this from the tank as soon as possible. (Magic Effect)
_Phase 2_
|tip Corborus will burrow. During this time avoid the areas with rubble when he is underground, he will jump out of these areas and hurt anyone standing in it.
|tip Kill the adds he summons during this phase.
Defeat Corborus |scenariogoal 1/25089 |goto The Stonecore 62.40,61.20
step
map The Stonecore/1
path follow strict;loop off;ants straight
path	59.60,59.80	54.90,58.40	50.00,59.70
path	46.10,55.70	43.40,52.20	38.80,49.60
Follow the path
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
kill Slabhide##43214
|tip He will use Sand Blast which deals damage in a cone in front of him. Only the tank should be in front of him.
|tip He will cast Lava Fissure under a ranndom players feet. It will erupt after 3 seconds and create a lava pool that lasts for 30 seconds.
|tip He will cast Stalactite often. When he does he'll move to the center of the room and cause spikes to rain from the ceiling. Avoid them, as they do massive damage. There will be a shadow where they drop.
|tip After the Stalactite's, he will cast Crystal Storm, move behind the rocks out of his line of site to avoid damage. |only if heroic_dung()
Defeat Slabhide |scenariogoal 1/25090 |goto The Stonecore/1 37.70,44.90
step
map The Stonecore/1
path follow strict;loop off;ants straight
path	37.70,39.50	39.80,32.20	38.60,20.80
path	42.70,16.70	45.40,19.00
As you run through this room, you will want to kill the Stonecore Sentries, they will aggro big groups if they are close enough. |goto The Stonecore/1 38.70,20.60
|tip Stonecore Bruisers patrol this area. When you can, kill them away from groups.
|tip If you stay to the right side, you will not have to kill groups on the left side.
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
kill Ozruk##42188
|tip Face Ozruk away from the group. He will use Ground Slam that everyone, including the tank need to avoid. This causes massive damage
|tip Ozruk will cast Shatter shortly after Ground Slam. Run 15 yards away from him or you will take damage up to 200k.
|tip He will cast Paralyze, which needs to be dispelled. You can also cast a DoT when Ozruk has Elementium Bulwark up, or simply melee him keeping the Elementium Spike Shield debuff on you at all times to break the effect. |only if heroic_dung()
Defeat Ozruk |scenariogoal 1/25091 |goto The Stonecore/1 47.70,20.00
step
map The Stonecore/1
path follow strict;loop off;ants straight
path	48.50,27.20	48.00,35.60	48.40,45.20
path	53.50,40.50
Follow the path
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
kill High Priestess Azil##42333 |only if not haveq(28814)
kill High Priestess Azil##42333  |q 28814/1 |only if haveq(28814)
kill 101 Devout Follower##42428 |q 28814/2 |only if haveq(28814)
_Phase One_
|tip She will need to be tanked and moved when she creates a _Gravity Well_ (purple circle with that deals shadow damage).
|tip During this phase, boss will need to be tanked on the left of the Gravity Well, so the mobs will run in and die.
|tip She will also use an ability called Force Grip which deals massive damage to the tank and should be interrupted each time it is used. |only if heroic_dung()
_Phase Two_
|tip She will float up to her altar and Tank will need to get aggro on all the Devout Followers that run in.
|tip She will use Seismic Shard, which throws a huge rock at a random party member. More often than not it will kill that party member, so be on the look out for a shadow on the ground. |only if heroic_dung()
Defeat High Priestess Azil |scenariogoal 1/34450 |goto The Stonecore/1 57.64,38.24
step
You can either run to the beginning of the dungeon to turn in your quests.
Or
You can Right Click the dungeon finder icon on your mini map, teleport out of the dungeon, then teleport back in to the entrance.
|confirm
step
talk Earthwarden Yrsa##50048
turnin Followers and Leaders##28814 |goto The Stonecore/1 53.60,95.00
step
Congratulations! You have completed The Stonecore
]])
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Cataclysm Dungeons\\Throne of the Tides")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Cataclysm Dungeons\\Vortex Pinnacle")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Cataclysm Dungeons\\Well of Eternity")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Cataclysm Dungeons\\Zul'Aman")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Cataclysm Dungeons\\Zul Gurub")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Cataclysm Raids\\Baradin Hold")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Cataclysm Raids\\The Bastion of Twilight")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Cataclysm Raids\\Blackwing Descent")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Cataclysm Raids\\Dragon Soul")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Cataclysm Raids\\Firelands")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Cataclysm Raids\\Throne of the Four Winds")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Pandaria Dungeons\\Gate of the Setting Sun")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Pandaria Dungeons\\Mogu'shan Palace")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Pandaria Dungeons\\Scarlet Halls")
GoatQuest:RegisterGuide("Dungeon Guides\\Pandaria Dungeons\\Scarlet Monastery",{
mapid=302,
achieveid={6761},
patch='50004',
condition_suggested=function() return level>=35 and level<=35 end,
description="This guide will walk you through the Scarlet Monastery dungeon.",
},[[
step
Press _I_ and queue for Scarlet Monastery or enter the dungeon with your group |goto Scarlet Monastery/1 74.20,46.20 |c
step
talk Hooded Crusader##64838
accept Blades of the Anointed##31515 |goto Scarlet Monastery/1 72.70,47.00
step
Clear the trash up to this point. |goto Scarlet Monastery/1 30.80,46.20
|tip The Piles of Corpses should be killed first or you will be fighting zombies much longer than is necessary.
|confirm
step
kill Thalnos the Soulrender##59789
|tip Thalnos will Raise Fallen Crusaders. This ability summons zombies that the tank needs to pick up. When the Fallen Crusaders hit you, they leave behind Mind Rot which is a DoT that can stack.
|tip He also summons Spirit Gales often. These are puddles on the ground that should not be stepped in. This ability is interruptable.
|tip Evict Soul is a debuff that Thalnos throws on a random party member. This DoT needs to be dispelled as quickly as possible.
|tip He will also use Summon Empowering Spirit. This ability will summon an add that DPS should kill as quickly as they can. If this add reaches a Fallen Crusader's corpse, it will spawn an Empowered Zombie.
|tip Empowered Zombies are large zombies which need to be tanked. They cannot be killed without great focus.
Defeat Thalnos the Soulrender |scenariogoal 1/19270 |goto Scarlet Monastery/1 26.10,45.40
step
click Blade of the Anointed##214296
collect Blade of the Anointed##87282 |q 31515/1 |goto Scarlet Monastery/1 20.60,45.90
step
map Scarlet Monastery/1
path follow strict;loop off;ants straight
path	34.50,52.50	34.80,78.20	39.40,81.70
path	48.50,90.30
Follow the path. |goto Scarlet Monastery/2
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
talk Blade of the Anointed##64855
turnin Blades of the Anointed##31515 |goto Scarlet Monastery/2 49.10,24.50
accept Unto Dust Thou Shalt Return##31516 |goto Scarlet Monastery/2 49.10,24.50
step
map Scarlet Monastery/2
path follow strict;loop off;ants straight
path	45.70,31.90	43.90,36.30	49.20,43.30
Follow the path. |goto Scarlet Monastery/2
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
kill Brother Korloff##59223
Brother Korloff loves to play with fire.
|tip Flying Kick will hit a random party member knocking them back, make sure they aren't knocked into any uncleared trash.
|tip Blazing Fists is a series of punches Korloff makes in front of him, have the tank take a step back and make sure all party members are behind Korloff.
|tip Firestorm Kick is whirlwind of flame, do not stand in it.
|tip Scorched Earth is a fire trail that Korloff leaves behind him, do not stand in it.
|tip Every 10%, Korloff wil gain a stack of Rising Flame. These increase his fire damage done by 10% per stack.
|tip The boss will patrol between two groups. Pull each group carefully, keeping in mind the boss' patrol.
|tip Opening the world map will display an ant trail guiding you through the current floor.
Defeat Brother Korloff |scenariogoal 1/19271 |goto Scarlet Monastery/2 49.40,52.30
step
Enter the cathedral here |goto Scarlet Monastery/2 49.10,57.10 < 5
confirm
step
Before encountering the boss, make sure you kill the trash within the cathedral.
|tip This includes the main room and both wings.
|confirm
step
kill Commander Durand##60040
kill High Inquisitor Whitemane##3977
_Phase 1_
|tip Commander Durand will fight you alone.
|tip He uses Flash of Steel and Dashing Strike. Both of these abilities cause him to jump to party members quickly, but neither do much damage as long as the group is spread out.
|tip When Durand dies, phase 2 begins.
_Phase 2_
|tip High Inquisitor Whitemane will come and and begin to fight.
|tip She will cast Power Word: Shield, Smite and Heal. Make sure to interrupt Smite and Heal.
|tip Whitemane will also try casting Mass Resurrection. DO NOT LET THIS CAST FINISH!! If this cast finishes, all corpses within 100 yards will resurrect and aggro.
|tip After you weaken her she will cast Deep Sleep. This puts the entire party to sleep for 10 seconds, during this time she will resurrect Durand.
_Phase 3_
|tip Now you will have to fight the two together.
|tip Kill Whitemane first, make sure to interrupt Smite and Heal
|tip Stay spread out for Durand.
Use the Blades of the Anointed on High Inquisitor Whitemane's corpse. |use Blades of the Anointed##87390 |only if haveq(31516)
Blades of the Anointed thrust into Whitemane's corpse. |q 31516/1 |only if haveq(31516)
Defeat Commander Durand and High Inquisitor Whitemane |scenariogoal 1/34443 |goto Scarlet Monastery/2 48.90,78.90
step
talk Hooded Crusader##64842
turnin Unto Dust Thou Shalt Return##31516 |goto Scarlet Monastery/2 49.20,80.70
step
Congratulations! You have completed Scarlet Monastery
]])
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Pandaria Dungeons\\Scholomance")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Pandaria Dungeons\\Shado-Pan Monastery")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Pandaria Dungeons\\Siege of Niuzao Temple")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Pandaria Dungeons\\Stormstout Brewery")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Pandaria Dungeons\\Temple of the Jade Serpent")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Pandaria Raids\\Heart of Fear")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Pandaria Raids\\Mogu'shan Vaults")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Pandaria Raids\\Siege of Orgrimmar")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Pandaria Raids\\Terrace of Endless Spring")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Pandaria Raids\\Throne of Thunder")
