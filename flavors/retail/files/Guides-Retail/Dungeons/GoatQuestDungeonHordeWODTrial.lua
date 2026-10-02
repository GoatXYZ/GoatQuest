local GoatQuest=GoatQuest
if not GoatQuest then return end
if UnitFactionGroup("player")~="Horde" then return end
if GQ:DoMutex("DungeonHWOD") then return end
GoatQuest.GuideMenuTier = "TRI"
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Draenor Dungeons\\Auchindoun")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Draenor Dungeons\\Bloodmaul Slag Mines")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Draenor Dungeons\\The Everbloom")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Draenor Dungeons\\Grimrail Depot")
GoatQuest:RegisterGuide("Dungeon Guides\\Draenor Dungeons\\Iron Docks",{
mapid=595,
achieveid={9047},
patch='60001',
condition_suggested=function() return level>=40 and level<=43 end,
keywords={"ID, Gorgrond, Draenor"},
description="This guide will walk you through the Iron Docks dungeon.",
},[[
step
Press _I_ and queue for Iron Docks or enter the dungeon with your group |goto Iron Docks/1 30.60,44.50 |c
stickystart "Compass"
step
map Iron Docks/1
path follow loose;loop off;ants straight
path	33.60,40.70	37.80,35.50	42.00,34.40
Follow the path |goto Iron Docks/1 42.00,34.40
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
kill Fleshrender Nok'gar##87451
_TANK:_ |grouprole TANK
|tip Move Nok'gar and Dreadfang out of Barbed Arrow Barrage and Burning Arrows. |grouprole TANK
_DAMAGE:_ |grouprole DAMAGE
|tip Move out of Barbed Arrow Barrage and Burning Arrows quickly. |grouprole DAMAGE
_HEALER:_ |grouprole HEALER
|tip Move out of Barbed Arrow Barrage and Burning Arrows quickly. |grouprole HEALER
_EVERYONE:_ |grouprole EVERYONE
|tip Stop attacking when Nok'gar has Reckless Provocation. This is a shield-looking effect. |grouprole EVERYONE
|tip Avoid Shredding Swipes when Dreadfang charges forward. |grouprole EVERYONE
Defeat Fleshrender Nok'gar |scenariogoal 25108 |goto Iron Docks/1 47.80,34.10
step
label "Compass"
click Strange Brass Compass##237463
collect the Strange Brass Compass##118618 |q 37231/1 |goto Iron Docks/1 47.00,26.40 |only if haveq(37231)
collect the Strange Brass Compass##118618 |q 37155/1 |goto Iron Docks/1 47.00,26.40 |only if haveq(37155)
|tip It's a small brass-colored compass next to the barrel and crate.
|only if haveq(37231) or haveq(37155)
stickystart "Expensive"
step
map Iron Docks/1
path follow loose;loop off;ants straight
path	46.40,34.20	49.20,47.60	39.60,48.60
path	37.90,55.50	49.50,67.60	64.30,76.30
path	76.40,76.60
Follow the path |goto Iron Docks/1 76.40,76.60
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
label "Expensive"
click Horribly Acidic Solution##237462
collect the Horribly Acidic Solution##118617 |q 37230/1 |goto Iron Docks/1 50.40,52.40 |only if haveq(37230)
collect the Horribly Acidic Solution##118617 |q 37157/1 |goto Iron Docks/1 50.40,52.40 |only if haveq(37157)
|tip It's a greenish glowing bottle on top of the barrel.
|only if haveq(37230) or haveq(37157)
step
kill Ahrj'ok Dugrv##87452, Neelsa Nox##80808, Makogg Emberblade##86231
_TANK:_ |grouprole TANK
|tip Avoid attacking any Enforcer protected with Sanguine Sphere. |grouprole TANK
|tip Face Makogg away from the group. |grouprole TANK
_DAMAGE:_ |grouprole DAMAGE
|tip Switch between killing Ahrj'ok Dugrv and Neelsa Nox depending on who doesn't have the Sanguine Sphere. |grouprole DAMAGE
|tip Avoid attacking any Enforcer protected with Sanguine Sphere. |grouprole DAMAGE
_EVERYONE:_ |grouprole EVERYONE
|tip Do not step on Ogre Traps. Doing so will make you vulnerable to Big Boom. |grouprole EVERYONE
|tip Spread out when Neesa fires Hyper-Jumper Cables 9000-XL. |grouprole EVERYONE
Defeat The Grimrail Enforcers |scenariogoal 25109 |goto Iron Docks/1 80.20,75.30
stickystart "Gambit"
step
map Iron Docks/1
path follow loose;loop off;ants straight
path	83.50,76.20	86.40,68.90	86.50,24.80
Follow the path |goto Iron Docks/1 86.50,24.80
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
label "Gambit"
click Very Shiny Thing##237478
collect the Very Shiny Thing##118647 |q 37145/1 |goto Iron Docks/1 85.90,48.70
|tip It's a small gold disk on top of the crate.
|only if haveq(37145)
step
kill Oshir##86232
_TANK:_ |grouprole TANK
|tip Focus damage on Oshir during Feeding Frenzy. |grouprole TANK
_DAMAGE:_ |grouprole DAMAGE
|tip Focus damage on Oshir during Feeding Frenzy. |grouprole DAMAGE
|tip When Oshir casts Breakout, kill the beasts quickly. |grouprole DAMAGE
_HEALER:_ |grouprole HEALER
|tip Focus healing on the target of Feeding Frenzy. |grouprole HEALER
_EVERYONE:_ |grouprole EVERYONE
|tip Stay out of Acid Splash on the floor. |grouprole EVERYONE
|tip When Oshir flips backward, avoid his Primal Assault. |grouprole EVERYONE
_Heroic Difficulty_: |only if heroic_dung()
|tip Ravenous Wolves gain a damage buff when near each other. Keep them separated. |only if heroic_dung()
Defeat Oshir |scenariogoal 25110 |goto Iron Docks/1 80.40,17.40
step
map Iron Docks/1
path follow loose;loop off;ants straight
path	79.30,19.60	71.90,28.00	69.40,34.20
Follow the path |goto Iron Docks/1 69.40,34.20
|tip Opening the world map will display an ant trail guiding you through the current floor.
confirm
step
kill Skulloc##86233
_TANK:_ |grouprole TANK
|tip Face Koramar away from the group. |grouprole TANK
_DAMAGE:_ |grouprole DAMAGE
|tip Kill both Zoggosh and Koramar to minimize damage to the group. |grouprole DAMAGE
_HEALER:_ |grouprole HEALER
|tip Be sure to look out for the tank, Skulloc has high hitting auto attack damage. |grouprole HEALER
_EVERYONE:_ |grouprole EVERYONE
|tip Take cover behind crates during Cannon Barrage, moving foreward between shots. |grouprole EVERYONE
|tip Avoid the rear of the ship during Cannon Barrage. Backdraft will kill you. |grouprole EVERYONE
|tip Avoid standing between Zoggosh and his Rapid Fire target. |grouprole EVERYONE
Defeat Skulloc |scenariogoal 1/34453 |goto Iron Docks/1 68.40,43.60
Slay Skulloc |q 37231/2 |goto Iron Docks/1 68.40,43.60 |only if haveq(37231)
Slay Skulloc |q 37230/2 |goto Iron Docks/1 68.40,43.60 |only if haveq(37230)
Slay Skulloc |q 37145/2 |goto Iron Docks/1 68.40,43.60 |only if haveq(37145)
step
Proceeding |next "Daily Guides\\Warlords of Draenor Dailies\\Garrison Building Dailies"
|only if haveq(37231) or haveq(37230) or haveq(37145)
step
Congratulations, you have completed the _Iron Docks_!
]])
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Draenor Dungeons\\Shadowmoon Burial Grounds")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Draenor Dungeons\\Skyreach")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Draenor Dungeons\\Upper Blackrock Spire")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Draenor Raids\\Blackrock Foundry - The Black Forge (LFR)")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Draenor Raids\\Blackrock Foundry - Blackhand's Crucible (LFR)")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Draenor Raids\\Blackrock Foundry - Iron Assembly (LFR)")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Draenor Raids\\Blackrock Foundry - Slagworks (LFR)")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Draenor Raids\\Hellfire Citadel - Bastion of Shadows (LFR)")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Draenor Raids\\Hellfire Citadel - The Black Gate (LFR)")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Draenor Raids\\Hellfire Citadel - Destructor's Rise (LFR)")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Draenor Raids\\Hellfire Citadel - Halls of Blood (LFR)")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Draenor Raids\\Hellfire Citadel - Hellbreach (LFR)")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Draenor Raids\\Highmaul - Arcane Sanctum (LFR)")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Draenor Raids\\Highmaul - Imperator's Rise (LFR)")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Draenor Raids\\Highmaul - Walled City (LFR)")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Draenor Raids\\Blackrock Foundry - Normal/Heroic")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Draenor Raids\\Blackrock Foundry - Mythic")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Draenor Raids\\Hellfire Citadel - Normal/Heroic")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Draenor Raids\\Hellfire Citadel - Mythic")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Draenor Raids\\Highmaul - Normal/Heroic")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Draenor Raids\\Highmaul - Mythic")
