local GoatQuest=GoatQuest
if not GoatQuest then return end
if UnitFactionGroup("player")~="Alliance" then return end
if GQ:DoMutex("AchievementsAWOD") then return end
GoatQuest.GuideMenuTier = "TRI"
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Collections\\Alt-ernative Lifestyle")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Collections\\Heirloom Hoarder")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Collections\\I Found Pepe!")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Collections\\Ready for Powerleveling")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Collections\\What A Strange, Interdimensional Trip It's Been")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Collections\\Where's the Mailbox?")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Collections\\Mounts\\Awake the Drakes")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Collections\\Mounts\\Mountacular")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Collections\\Mounts\\Lord of Reins")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Collections\\Mounts\\Lord of the Reins")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Azeroth's Top Twenty Tunes")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Even More Plots")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Garrison Buddies")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\In Pursuit of Gul'dan")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Staying Regular")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Buildings\\Builder")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Buildings\\Choppin' Even More Logs")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Buildings\\Choppin' Some Logs")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Buildings\\Choppin' Some More Logs")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Buildings\\Draftsman")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Buildings\\Fight, Kill, Salute!")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Buildings\\Finding Your Waystones")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Buildings\\Garrison Architect")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Buildings\\Grand Master Draftsman")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Buildings\\Intro to Husbandry")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Buildings\\Keepin' Busy")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Buildings\\Master Builder")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Buildings\\Master Draftsman")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Buildings\\Master of Mounts")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Buildings\\Master Trapper")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Buildings\\More Plots")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Buildings\\Movin' On Up")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Buildings\\Nemesis: Death Stalker")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Buildings\\Nemesis: Huojin's Fall")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Buildings\\Nemesis: Killer of Kezan")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Buildings\\Nemesis: Orcslayer")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Buildings\\Nemesis: Slayer of Sin'dorei")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Buildings\\Nemesis: The Butcher")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Buildings\\Nemesis: Troll Hunter")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Buildings\\Salvaging Pays Off")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Buildings\\Set Sail!")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Buildings\\Stay Awhile and Listen")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Buildings\\Terrific Technology")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Buildings\\The Bone Collector")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Buildings\\The Stable Master")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Buildings\\The Trap Game")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Buildings\\Time for an Upgrade")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Buildings\\Trap Superstar")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Buildings\\Trapper's Delight")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Buildings\\Upgrading the Mill")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Buildings\\Warlord of Draenor")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Buildings\\Wingman")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Buildings\\Wingmen")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Buildings\\Working Many Orders")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Buildings\\Working More Orders")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Buildings\\Working Some Orders")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Followers\\A Rare Friend")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Followers\\An Epic Buddy")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Followers\\Commander")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Followers\\Fearless Leader")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Followers\\Filling the Ranks")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Followers\\Follow the Leader")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Followers\\Following Up")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Followers\\Item Level Army")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Followers\\Item Level Force")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Followers\\My Item Level Is Higher than Yours")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Followers\\My Item Level Is Way Higher than Yours")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Followers\\Raising the Bar")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Followers\\Where You Go, They Will Follow")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Invasions\\Impervious Defender")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Missions\\A Rare Mission")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Missions\\Exploration Mission Master")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Missions\\Exploration Mission Specialist")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Missions\\Keeping It Rare")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Missions\\Mission Specialist")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Missions\\On a Few Missions")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Missions\\On a Lot of Missions")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Missions\\On a Massive Number of Missions")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Missions\\On a Metric Ton of Missions")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Missions\\On a Mission")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Missions\\Patrol Mission Specialist")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Missions\\Patrolling Draenor")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Missions\\The Rarer the Better")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Missions\\Treasure Master")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Missions\\Treasure Mission Specialist")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Monuments\\Defender of Draenor")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Monuments\\Draenor Pet Brawler")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Monuments\\Master Draenor Crafter")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Monuments\\Master of Apexis")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Shipyard\\Naval Fleet")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Shipyard\\Naval Armada")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Shipyard\\Seaman")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Shipyard\\Petty Officer")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Shipyard\\Fleet Commander")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Shipyard\\Admiral")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Shipyard\\Naval Training Specialist/Expert")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Shipyard\\Naval Combat Specialist/Expert")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Shipyard\\Naval Treasure Specialist/Expert")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Shipyard\\Naval Siege Specialist/Expert")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Shipyard\\Naval Bonus Specialist/Expert")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Shipyard\\Master of the Seas")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Shipyard\\Ironsides")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Shipyard\\Naval Mechanics")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Shipyard\\Charting a Course")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Shipyard\\Exploring the High Seas")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Invasions\\Botani Invasion")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Invasions\\Bronze Defender")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Invasions\\Golden Defender")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Invasions\\Goren Invasion")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Invasions\\Invasion Specialist")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Invasions\\Invasion? What Invasion?")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Invasions\\Invasions Are Better with Friends")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Invasions\\Iron Horde Invasion")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Invasions\\It's an Invasion!")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Invasions\\Master and Commander")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Invasions\\Master Defender")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Invasions\\Ogre Invasion")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Invasions\\Platinum Defender")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Invasions\\Save Those Buildings!")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Invasions\\Shadow Council Invasion")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Invasions\\Shadowmoon Clan Invasion")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Draenor Garrison\\Invasions\\Silver Defender")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Dungeons & Raids\\Draenor Dungeons\\...They All Fall Down")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Dungeons & Raids\\Draenor Dungeons\\A Gift of Earth and Fire")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Dungeons & Raids\\Draenor Dungeons\\Auchindoun")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Dungeons & Raids\\Draenor Dungeons\\Bloodmaul Slag Mines")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Dungeons & Raids\\Draenor Dungeons\\Bridge Over Troubled Fire")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Dungeons & Raids\\Draenor Dungeons\\Come With Me If You Want to Live")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Dungeons & Raids\\Draenor Dungeons\\Demon's Souls")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Dungeons & Raids\\Draenor Dungeons\\Dragonmaw? More Like Dragonfall")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Dungeons & Raids\\Draenor Dungeons\\Draenor Dungeon Hero")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Dungeons & Raids\\Draenor Dungeons\\Expert Timing")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Dungeons & Raids\\Draenor Dungeons\\Grimrail Depot")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Dungeons & Raids\\Draenor Dungeons\\Heroic: Auchindoun")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Dungeons & Raids\\Draenor Dungeons\\Heroic: Bloodmaul Slag Mines")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Dungeons & Raids\\Draenor Dungeons\\Heroic: Grimrail Depot")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Dungeons & Raids\\Draenor Dungeons\\Heroic: Iron Docks")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Dungeons & Raids\\Draenor Dungeons\\Heroic: Shadowmoon Burial Grounds")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Dungeons & Raids\\Draenor Dungeons\\Heroic: Skyreach")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Dungeons & Raids\\Draenor Dungeons\\Heroic: The Everbloom")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Dungeons & Raids\\Draenor Dungeons\\Heroic: Upper Blackrock Spire")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Dungeons & Raids\\Draenor Dungeons\\I Saw Soils")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Dungeons & Raids\\Draenor Dungeons\\Icky Ichors")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Dungeons & Raids\\Draenor Dungeons\\Iron Docks")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Dungeons & Raids\\Draenor Dungeons\\Is Draenor on Fire?")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Dungeons & Raids\\Draenor Dungeons\\Magnets, How Do They Work?")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Dungeons & Raids\\Draenor Dungeons\\Magnify... Enhance")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Dungeons & Raids\\Draenor Dungeons\\Militaristic, Expansionist")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Dungeons & Raids\\Draenor Dungeons\\Monomania")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Dungeons & Raids\\Draenor Dungeons\\No Tag-backs!")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Dungeons & Raids\\Draenor Dungeons\\No Ticket")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Dungeons & Raids\\Draenor Dungeons\\Ready for Raiding IV")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Dungeons & Raids\\Draenor Dungeons\\Savage Hero")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Dungeons & Raids\\Draenor Dungeons\\Shadowmoon Burial Grounds")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Dungeons & Raids\\Draenor Dungeons\\Skyreach")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Dungeons & Raids\\Draenor Dungeons\\Souls of the Lost")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Dungeons & Raids\\Draenor Dungeons\\Take Cover!")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Dungeons & Raids\\Draenor Dungeons\\The Everbloom")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Dungeons & Raids\\Draenor Dungeons\\They Burn, Burn, Burn")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Dungeons & Raids\\Draenor Dungeons\\This is Why We Can't Have Nice Things")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Dungeons & Raids\\Draenor Dungeons\\Upper Blackrock Spire")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Dungeons & Raids\\Draenor Dungeons\\Water Management")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Dungeons & Raids\\Draenor Dungeons\\Weed Whacker")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Dungeons & Raids\\Draenor Dungeons\\What's Your Sign?")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Exploration\\Draenor\\Draenor Pathfinder")
GoatQuest:RegisterGuide("Achievement Guides\\Exploration\\Draenor\\Draenor Explorer",{
condition_end=function() return achieved(8935) end,
achieveid={8935},
patch='60001',
description="Earn the following Draenor exploration achievements:\n\nExplore Frostfire Ridge\nExplore Gorgrond\n"..
"Explore Spires of Arak\nExplore Shadowmoon Valley\nExplore Talador\nExplore Nagrand",
},[[
leechsteps "Achievement Guides\\Exploration\\Draenor\\Explore Shadowmoon Valley" 1-11
leechsteps "Achievement Guides\\Exploration\\Draenor\\Explore Talador" 1-15
leechsteps "Achievement Guides\\Exploration\\Draenor\\Explore Gorgrond" 1-14
leechsteps "Achievement Guides\\Exploration\\Draenor\\Explore Frostfire Ridge" 1-15
leechsteps "Achievement Guides\\Exploration\\Draenor\\Explore Spires of Arak" 1-17
leechsteps "Achievement Guides\\Exploration\\Draenor\\Explore Nagrand" 1-15
step
_Congratulations!_
You Earned the "Draenor Explorer" Achievement.
]])
GoatQuest:RegisterGuide("Achievement Guides\\Exploration\\Draenor\\Explore Shadowmoon Valley",{
condition_end=function() return achieved(8938) end,
achieveid={8938},
patch='60001',
description="Explore Shadowmoon Valley, revealing the following covered areas of the world map:\n\n Anguish Fortress\n"..
"Elodor\nGloomshade Grove\nKarabor\nThe Shimmer Moor\nIsle of Shadows\nDarktide Roost\nEmbaari Village\n"..
"Gul'var\nShaz'gul\nSocrethar's Rise",
},[[
step
Explore Socrethar's Rise |achieve 8938/10 |goto Shadowmoon Valley D 42.90,69.90
step
Explore Shaz'gul |achieve 8938/8 |goto Shadowmoon Valley D 40.00,66.00
step
Explore Isle of Shadows |achieve 8938/11 |goto Shadowmoon Valley D 40.10,79.20
step
Explore Darktide Roost |achieve 8938/2 |goto Shadowmoon Valley D 61.10,78.10
step
Explore The Shimmer Moor |achieve 8938/9 |goto Shadowmoon Valley D 58.70,58.30
step
Explore Karabor |achieve 8938/7 |goto Shadowmoon Valley D 61.20,45.30
step
Explore Elodor |achieve 8938/3 |goto Shadowmoon Valley D 52.30,26.70
step
Explore Gloomshade Grove |achieve 8938/5 |goto Shadowmoon Valley D 40.30,26.50
step
Explore Embaari Village |achieve 8938/4 |goto Shadowmoon Valley D 38.60,33.40
step
Explore Anguish Fortress |achieve 8938/1 |goto Shadowmoon Valley D 32.20,23.60
step
Explore Gul'var |achieve 8938/6 |goto Shadowmoon Valley D 20.50,13.60
step
|achieve 8938
step
_Congratulations!_
You Earned the "Explore Shadowmoon Valley" Achievement
]])
GoatQuest:RegisterGuide("Achievement Guides\\Exploration\\Draenor\\Explore Talador",{
condition_end=function() return achieved(8940) end,
achieveid={8940},
patch='60001',
description="Explore Talador, revealing the following covered areas of the world map:\n\n Duskfall Island\n"..
"Aruuna\nFort Wrynn\nGul'rok\nOrunai Coast\nShattrath City\nTomb of Lights\nAnchorite's Sojourn\n"..
"Zangarra\nAuchindoun\nCourt of Souls\nGordal Fortress\nThe Path of Glory\nTelmor\nTuurem",
},[[
step
Explore Anchorite's Sojourn |achieve 8940/10 |goto Talador 76.70,56.60
step
Explore Duskfall Island |achieve 8940/3 |goto Talador 71.60,57.70
step
Explore Tomb of Lights |achieve 8940/13 |goto Talador 58.90,64.80
step
Explore Auchindoun |achieve 8940/2 |goto Talador 54.60,69.60
step
Explore Gordal Fortress |achieve 8940/6 |goto Talador 67.70,68.80
step
Explore Telmor |achieve 8940/12 |goto Talador 50.60,86.70
step
Explore Gul'rok |achieve 8940/7 |goto Talador 38.50,79.30
step
Explore Court of Souls |achieve 8940/4 |goto Talador 40.00,60.10
step
Explore Shattrath City |achieve 8940/11 |goto Talador 41.40,43.00
step
Explore Orunai Coast |achieve 8940/9 |goto Talador 51.80,26.80
step
Explore Tuurem |achieve 8940/14 |goto Talador 59.60,32.60
step
Explore Aruuna |achieve 8940/1 |goto Talador 75.40,40.60
step
Explore Zangarra |achieve 8940/15 |goto Talador 78.60,27.90
step
Explore Fort Wrynn |achieve 8940/5 |goto Talador 68.00,20.30
step
Explore The Path of Glory |achieve 8940/8 |goto Talador 66,10
step
|achieve 8940
step
_Congratulations!_
You Earned the "Explore Talador" Achievement
]])
GoatQuest:RegisterGuide("Achievement Guides\\Exploration\\Draenor\\Explore Gorgrond",{
condition_end=function() return achieved(8939) end,
achieveid={8939},
patch='60001',
description="Explore Gorgrond, revealing the following covered areas of the world map:\n\n Evermorn Springs\n"..
"Bastion Rise\nGrimrail Depot\nDeadgrin\nHighpass\nStonemaul Arena\nThe Iron Approach\nThe Pit\n"..
"Beastwatch\nCrimson Fen\nEverbloom Wilds\nGronn Canyon\nIyun Weald\nTangleheart",
},[[
step
Explore Bastion Rise |achieve 8939/1 |goto Gorgrond 48.60,79.30
step
Explore Tangleheart |achieve 8939/12 |goto Gorgrond 50.30,70.70
step
Explore Crimson Fen |achieve 8939/4 |goto Gorgrond 53.90,65.00
step
Explore Highpass |achieve 8939/9 |goto Gorgrond 52.90,60.70
step
Explore Iyun Weald |achieve 8939/10 |goto Gorgrond 61.00,51.70
step
Explore Everbloom Wilds |achieve 8939/6 |goto Gorgrond 54.40,44.50
step
Explore Grimrail Depot |achieve 8939/3 |goto Gorgrond 54.40,33.30
step
Explore The Pit |achieve 8939/14 |goto Gorgrond 47.60,38.70
step
Explore The Iron Approach |achieve 8939/13 |goto Gorgrond 43.30,20.90
step
Explore Gronn Canyon |achieve 8939/8 |goto Gorgrond 46.40,45.20
step
Explore Stonemaul Arena |achieve 8939/11 |goto Gorgrond 42.50,64.50
step
Explore Beastwatch |achieve 8939/2 |goto Gorgrond 45.40,71.10
step
Explore Evermorn Springs |achieve 8939/7 |goto Gorgrond 42.20,77.50
step
Explore Deadgrin |achieve 8939/5 |goto Gorgrond 41.40,74.10
step
|achieve 8939
step
_Congratulations!_
You Earned the "Explore Gorgrond" Achievement
]])
GoatQuest:RegisterGuide("Achievement Guides\\Exploration\\Draenor\\Explore Frostfire Ridge",{
condition_end=function() return achieved(8937) end,
achieveid={8937},
patch='60001',
description="Explore Frostfire Ridge, revealing the following covered areas of the world map:\n\n Bladespire Citadel\n"..
"Bones of Agurak\nDaggermaw Ravine\nGrimfrost Hill\nIron Siegeworks\nMagnarok\nThe Boneslag\nWor'gol\n"..
"Bloodmaul Stronghold\nColossal's Fall\nFrostwind Crag\nGrom'gar\nIron Waystation\nStonefang Outpost\n"..
"The Cracking Plains",
},[[
step
Explore Bones of Agurak |achieve 8937/3 |goto Frostfire Ridge 86.20,71.20
step
Explore Iron Siegeworks |achieve 8937/9 |goto Frostfire Ridge 83.70,59.40
step
Explore Iron Waystation |achieve 8937/10 |goto Frostfire Ridge 74.70,62.70
step
Explore Grom'gar |achieve 8937/8 |goto Frostfire Ridge 65.70,58.00
step
Explore Grimfrost Hill |achieve 8937/7 |goto Frostfire Ridge 68.30,50.30
step
Explore The Cracking Plains |achieve 8937/14 |goto Frostfire Ridge 54.60,44.10
step
Explore Magnarok |achieve 8937/11 |goto Frostfire Ridge 68.10,32.00
step
Explore Colossal's Fall |achieve 8937/4 |goto Frostfire Ridge 62.40,29.80
step
Explore Stonefang Outpost |achieve 8937/12 |goto Frostfire Ridge 46.90,52.30
step
Explore The Boneslag |achieve 8937/13 |goto Frostfire Ridge 46.50,47.40
step
Explore Wor'gol |achieve 8937/15 |goto Frostfire Ridge 23.80,54.90
step
Explore Bladespire Citadel |achieve 8937/1 |goto Frostfire Ridge 27.40,32.10
step
Explore Frostwind Crag |achieve 8937/6 |goto Frostfire Ridge 36.10,19.30
step
Explore Bloodmaul Stronghold |achieve 8937/2 |goto Frostfire Ridge 36.90,13.00
step
Explore Daggermaw Ravine |achieve 8937/5 |goto Frostfire Ridge 44.80,31.20
step
|achieve 8937
step
_Congratulations!_
You Earned the "Explore Frostfire Ridge" Achievement
]])
GoatQuest:RegisterGuide("Achievement Guides\\Exploration\\Draenor\\Explore Spires of Arak",{
condition_end=function() return achieved(8941) end,
achieveid={8941},
patch='60001',
description="Explore Spires of Arak, revealing the following covered areas of the world map:\n\n The Writhing Mire\n"..
"Skettis\nVeil Zekk\nSouthport\nTerrace of Dawn\nBladefist Hold\nLost Veil Anzu\nRavenskar\nAxefall\n"..
"The Howling Crag\nPinchwhistle Point\nVeil Akraz\nWindswept Terrace\nSethekk Hollow\nAdmiral Taylor's\n"..
" Garrison\nPinchwhistle Gearworks\nBloodmane Valley",
},[[
step
Explore Skettis |achieve 8941/1 |goto Spires of Arak 45.30,18.90
step
Explore The Howling Crag |achieve 8941/2 |goto Spires of Arak 61.10,25.40
step
Explore Lost Veil Anzu |achieve 8941/13 |goto Spires of Arak 73.40,37.90
step
Explore Sethekk Hollow |achieve 8941/10 |goto Spires of Arak 61.90,37.30
step
Explore Terrace of Dawn |achieve 8941/9 |goto Spires of Arak 53.80,46.70
step
Explore Windswept Terrace |achieve 8941/8 |goto Spires of Arak 47.48,52.29
step
Explore Ravenskar |achieve 8941/15 |goto Spires of Arak 55,55
step
Explore Veil Zekk |achieve 8941/5 |goto Spires of Arak 61.20,55.20
step
Explore Pinchwhistle Gearworks |achieve 8941/14 |goto Spires of Arak 61.30,70.00
step
Explore Pinchwhistle Point |achieve 8941/4 |goto Spires of Arak 57.80,85.60
step
Explore Bloodmane Valley |achieve 8941/16 |goto Spires of Arak 51.00,67.20
step
Explore Southport |achieve 8941/7 |goto Spires of Arak 41.70,59.90
step
Explore Admiral Taylor's Garrison |achieve 8941/12 |goto Spires of Arak 39.80,49.40
step
Explore Axefall |achieve 8941/17 |goto Spires of Arak 41.20,46.80
step
Explore The Writhing Mire |achieve 8941/3 |goto Spires of Arak 36.80,44.00
step
Explore Bladefist Hold |achieve 8941/11 |goto Spires of Arak 31.30,28.90
step
Explore Veil Akraz |achieve 8941/6 |goto Spires of Arak 41.50,23.70
step
|achieve 8941
step
_Congratulations!_
You Earned the "Explore Spires of Arak" Achievement
]])
GoatQuest:RegisterGuide("Achievement Guides\\Exploration\\Draenor\\Explore Nagrand",{
condition_end=function() return achieved(8942) end,
achieveid={8942},
patch='60001',
description="Explore Nagrand, revealing the following covered areas of the world map:\n\n Ancestral Grounds\n"..
"Gates of Grommashar\nHighmaul Harbor\nLok-rath\nMok'gol Watchpost\nTelaar\nThe Ring of Trials\n"..
"Zangar Shore\nBroken Precipice\nHallvalor\nIronfist Harbor\nMar'gok's Overwatch\nOshu'gun\n"..
"The Ring of Blood\nThrone of the Elements",
},[[
step
Explore The Ring of Trials |achieve 8942/13 |goto Nagrand D 79.70,49.80
step
Explore Telaar |achieve 8942/11 |goto Nagrand D 69.00,64.20
step
Explore Gates of Grommashar |achieve 8942/3 |goto Nagrand D 75.00,68.10
step
Explore Mar'gok's Overwatch |achieve 8942/8 |goto Nagrand D 80.50,67.10
step
Explore Hallvalor |achieve 8942/4 |goto Nagrand D 84.40,56.40
step
Explore Zangar Shore |achieve 8942/15 |goto Nagrand D 86.30,27.60
step
Explore Throne of the Elements |achieve 8942/14 |goto Nagrand D 73.20,20.80
step
Explore The Ring of Blood |achieve 8942/12 |goto Nagrand D 57.00,19.00
step
Explore Broken Precipice |achieve 8942/2 |goto Nagrand D 50.40,19.30
step
Explore Highmaul Harbor |achieve 8942/5 |goto Nagrand D 37.40,32.40
step
Explore Mok'gol Watchpost |achieve 8942/9 |goto Nagrand D 42.70,33.20
step
Explore Lok-rath |achieve 8942/7 |goto Nagrand D 53.40,43.30
step
Explore Ancestral Grounds |achieve 8942/1 |goto Nagrand D 41.20,56.40
step
Explore Oshu'gun |achieve 8942/10 |goto Nagrand D 47.20,61.00
step
Explore Ironfist Harbor |achieve 8942/6 |goto Nagrand D 43.90,76.30
step
|achieve 8942
step
_Congratulations!_
You Earned the "Explore Nagrand" Achievement
]])
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Exploration\\Draenor\\Gorgrond Monster Hunter")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Exploration\\Draenor\\Grand Treasure Hunter")
GoatQuest:RegisterGuide("Achievement Guides\\Exploration\\Draenor\\Jungle Treasure Hunter/Master",{
condition_end=function() return achieved(10262) end,
achieveid={10261, 10262,10262},
patch='60200',
description="This guide will walk you through discovering all of the treasures in Tanaan Jungle.",
},[[
step
label "tanaan_treasure_start"
_Follow_ the path |goto Tanaan Jungle/0 55.00,64.30 < 20 |only if walking
_Run up_ the path |goto Tanaan Jungle/0 56.60,66.50 < 20 |only if walking
click Forgotten Sack##241433 |q 38591 |goto Tanaan Jungle 57.00,65.10 |future
|tip It looks like a tan sack sitting on the ground in the middle of a bunch of bones.
step
_Follow_ the path |goto Tanaan Jungle/0 54.80,64.60 < 20 |only if walking
_Run up_ the path behind the big rock |goto Tanaan Jungle/0 54.40,70.30 < 20 |only if walking
Run on the _green log_ |goto Tanaan Jungle/0 55.30,70.00 < 20 |only if walking
_Carefully jump down_ to the green vine _from this spot_ |goto Tanaan Jungle/0 55.10,69.60 < 10 |only if walking
click Lodged Hunting Spear##241434 |q 38593 |goto Tanaan Jungle/0 54.80,69.30 |future
|tip It looks like a brown wooden pole sticking out of this huge green thorny vine.
step
_Follow_ the path |goto Tanaan Jungle/0 54.00,70.80 < 30 |only if walking
_Run down_ the path |goto Tanaan Jungle/0 54.90,77.80 < 30 |only if walking
_Follow_ the path up |goto Tanaan Jungle/0 52.40,78.90 < 20 |only if walking
_Enter_ the cave |goto Tanaan Jungle/0 51.20,79.60 < 20 |walk
click Discarded Helm##241600 |q 38702 |goto Tanaan Jungle/0 49.90,81.20 |future
|tip It looks like a small horned helmet on a skeleton sitting on the ground in the back of the cave.
|tip You will likely need to get a group to help you get to this treasure.
step
_Leave_ the cave |goto Tanaan Jungle/0 51.20,79.60 < 20 |walk
_Run up_ the path |goto Tanaan Jungle/0 51.50,80.50 < 20 |only if walking
_Follow_ the path on the ledge |goto Tanaan Jungle/0 51.50,81.70 < 20 |only if walking
_Run up_ the path |goto Tanaan Jungle/0 50.30,80.80 < 20 |only if walking
click Scout's Belongings##241601 |q 38703 |goto Tanaan Jungle/0 50.00,79.60 |future
|tip It looks like a small brown backpack sitting on a wooden crate.
|tip You will likely need to get a group to help you get to this treasure.
step
_Run on_ the dirt path |goto Tanaan Jungle/0 55.50,78.60 < 30 |only if walking
click Blackfang Island Cache##241449 |q 38601 |goto Tanaan Jungle/0 61.20,75.80 |future
|tip It looks like a big leather covered object sitting on the ground on this small island, between a bunch of trees.
|tip You will likely need to get a group to help you get to this treasure.
step
_Jump onto_ the flat stone |goto Tanaan Jungle/0 62.10,71.80 < 20 |only if walking
_Jump on_ the stones to this spot |goto Tanaan Jungle/0 62.00,70.80 < 20 |only if walking
click Crystallized Fel Spike##241450 |q 38602 |goto Tanaan Jungle/0 62.00,70.80 |future
|tip It's a big spikey green crystal sticking out of the side of the wall. Carefully walk to the edge of the stone in order to reach it.
|tip You will likely need to get a group to help you get to this treasure.
step
_Swim out_ to the small island |goto Tanaan Jungle/0 61.20,75.80 < 40 |only if walking
_Follow_ the path |goto Tanaan Jungle/0 55.30,79.00 < 30 |only if walking
_Run down_ the path |goto Tanaan Jungle/0 54.30,85.00 < 30 |only if walking
click Dead Man's Chest##243693 |q 39470 |goto Tanaan Jungle/0 54.90,90.70 |future
|tip It looks like a brown treasure chest sitting on the ground next to some trees, halfway hidden in a leafy bush.
|tip You will likely need to get a group to help you get to this treasure.
step
_Follow_ the path |goto Tanaan Jungle/0 59.20,90.80 < 40 |only if walking
_Run up_ the rock here |goto Tanaan Jungle/0 65.90,84.80 < 10 |only if walking
click Bejeweled Egg##243690 |q 39469 |goto Tanaan Jungle/0 65.90,85.00 |future
|tip It looks like a diamond encrusted egg sitting in a yellow straw bird nest up on this rocky cliffside.
|tip You will likely need to get a group to help you get to this treasure.
step
_Enter_ the cave |goto Tanaan Jungle/0 47.30,70.70 < 20 |walk
|tip If the fire is blocking your way into the cave, you must wait and complete the Garrison Campaign quest "The Warlock", which only has a chance to be available each week. Use "The Warlock" Garrison Campaign guide to accomplish this.
click Mysterious Corrupted Obelisk##241666 |q 38739 |goto Tanaan Jungle 46.20,72.80 |future
|tip It looks like a stone pillar, overgrown with vines, with a glowing orb of light at the top of it, near the wall in the back of the cave.
step
_Leave_ the cave |goto Tanaan Jungle/0 47.30,70.70 < 20 |walk
_Run up_ the path |goto Tanaan Jungle/0 47.70,70.60 < 20 |only if walking
_Walk onto_ the flat rock |goto Tanaan Jungle/0 48.50,70.50 < 30 |only if walking
click Crystalized Essence of the Elements##241605 |q 38705 |goto Tanaan Jungle/0 47.90,70.40 |future
|tip It looks like a small cluster of big blue crystals on the ground on top of this huge rock.
step
click Overgrown Relic##241656 |q 38731 |goto Tanaan Jungle/0 50.80,65.00 |future
|tip It looks like a stone pillar, overgrown with vines, with a glowing orb of light at the top of it, in the middle of a bunch of trees on this small island.
step
_Follow_ the path |goto Tanaan Jungle/0 48.20,66.50 < 30 |only if walking
_Continue_ following the path |goto Tanaan Jungle/0 46.40,66.20 < 30 |only if walking
click Forgotten Champion's Blade##241533 |q 38657 |goto Tanaan Jungle/0 41.60,73.30 |future
|tip It looks like a sword stuck in the ground in the swamp water next to a big tree branch.
step
click The Perfect Blossom##241522 |q 38639 |goto Tanaan Jungle/0 40.80,75.60 |future
|tip It looks like a plant with two white petals, in the hollow beneath a huge tree, surrounded by purple fog on the ground. Try to stand on the perimeter of the fog, or else you won't be able to loot it.
step
_Follow_ the path |goto Tanaan Jungle/0 41.50,75.60 < 30 |only if walking
click Snake Charmer's Flute##241521 |q 38638 |goto Tanaan Jungle/0 40.60,79.80 |future
|tip It looks like a small wooden stick laying on the ground next to a skeleton, on a rock hill next to a waterfall.
step
_Follow_ the path |goto Tanaan Jungle/0 42.40,77.80 < 30 |only if walking
_Enter_ the cave |goto Tanaan Jungle/0 44.60,77.50 < 30 |walk
_Go through_ the tunnel opening |goto Tanaan Jungle/0 46.70,76.30 < 20 |walk
_Run up_ the path |goto Tanaan Jungle/0 48.00,77.30 < 20 |only if walking
_Follow_ the path around |goto Tanaan Jungle/0 49.40,79.00 < 20 |only if walking
_Run up_ here |goto Tanaan Jungle/0 51.10,75.90 < 20 |only if walking
_Carefully_ walk onto the vine here |goto Tanaan Jungle/0 50.70,76.30 < 10 |only if walking
_Carefully_ drop down onto the vine here |goto Tanaan Jungle/0 50.10,75.70 < 10 |only if walking
_Jump down_ to the lower level carefully here |goto Tanaan Jungle/0 49.30,74.90 < 10 |only if walking
_Jump up_ here |goto Tanaan Jungle/0 48.90,75.30 < 20 |only if walking
click Looted Mystical Staff##241841 |q 38814 |goto Tanaan Jungle/0 48.60,75.20 |future
|tip It looks like a huge purple electrified shaman staff leaning up against the wall.
step
_Jump on_ the rocks here |goto Tanaan Jungle/0 49.30,76.70 < 20 |only if walking
_Run up_ the green vine |goto Tanaan Jungle/0 49.40,77.10 < 10 |only if walking
_Jump up_ the rocks |goto Tanaan Jungle/0 49.80,77.50 < 10 |only if walking
_Carefully_ jump down to the _lower platform_ |goto Tanaan Jungle/0 50.00,77.20 < 10 |only if walking
click Bleeding Hollow Mushroom Stash##241835 |q 38809 |goto Tanaan Jungle/0 50.00,76.80 |future
|tip It looks like a wooden barrel filled with bright green mushrooms, up on the stone pillar formation.
step
_Go through_ the tunnel opening |goto Tanaan Jungle/0 46.70,76.30 < 20 |walk
_Leave_ the cave |goto Tanaan Jungle/0 44.60,77.50 < 30 |walk
_Follow_ the path down |goto Tanaan Jungle/0 38.50,79.80 < 30 |only if walking
click Brazier of Awakening##241775 |q 38788 |goto Tanaan Jungle/0 37.70,80.80 |future
|tip It's a small bowl with purple fire in it, inside this smaller hut building on the beach.
step
_Follow_ the path up |goto Tanaan Jungle/0 38.50,80.10 < 30 |only if walking
_Enter_ the cave |goto Tanaan Jungle/0 37.40,75.90 < 30 |walk
_Follow_ the path |goto Tanaan Jungle/0 35.30,76.30 < 30 |walk
_Jump over_ to the rock here |goto Tanaan Jungle/0 35.00,77.00 < 10 |walk
click Stashed Iron Sea Booty##241715 |q 38761 |goto Tanaan Jungle/0 35.00,77.30 |future
|tip It looks like a wooden chest sitting up on a rock platform in the water inside the cave.
step
_Jump over_ to the big log here |goto Tanaan Jungle/0 34.90,77.40 < 10 |only if walking
click Stashed Iron Sea Booty##241716 |q 38762 |goto Tanaan Jungle/0 34.40,78.30 |future
|tip It looks like a small wooden chest sitting up on a rock platform in the water inside the cave, behind a rock.
step
_Jump over_ to the rock platform here |goto Tanaan Jungle/0 34.30,77.80 < 10 |only if walking
_Jump up and over_ to the rock path here |goto Tanaan Jungle/0 33.90,77.70 < 10 |only if walking
click Stashed Iron Sea Booty##241714 |q 38760 |goto Tanaan Jungle/0 33.90,78.10 |future
|tip It looks like a small wooden chest, sitting up on a rock platform on the wall inside the cave.
step
_Jump down_ and _swim underwater_ through here |goto Tanaan Jungle/0 35.10,78.30 < 20 |only if walking
_Jump onto_ the rock here |goto Tanaan Jungle/0 35.40,78.30 < 10 |only if walking
_Jump over_ to the rock platform |goto Tanaan Jungle/0 35.70,78.50 < 10 |only if walking
_Jump up onto_ the splintered board |goto Tanaan Jungle/0 35.70,78.80 < 10 |only if walking
click Ironbeard's Treasure##241712 |q 38758 |goto Tanaan Jungle/0 35.90,78.60 |future
|tip It looks like a big metal chest sitting up on this rock platform inside the cave.
step
_Follow_ the path up |goto Tanaan Jungle/0 31.00,63.30 < 30 |only if walking
_Run up_ the stairs |goto Tanaan Jungle/0 28.80,66.80 < 30 |only if walking
_Continue_ up the stairs |goto Tanaan Jungle/0 29.20,68.40 < 30 |only if walking
_Follow_ the stairs up |goto Tanaan Jungle/0 30.30,70.30 < 30 |only if walking
click Polished Crystal##225774 |q 38629 |goto Tanaan Jungle/0 30.40,72.00 |future
|tip It looks like a small dark blue crystal sitting in an opened chest on a wooden table.
step
_Enter_ the building |goto Tanaan Jungle/0 32.00,70.80 < 20 |only if walking
click Tome of Secrets##240855 |q 38426 |goto Tanaan Jungle/0 32.40,70.40 |future
|tip It looks like a big open book laying on a pedastal inside this small building.
step
_Run down_ the stairs |goto Tanaan Jungle/0 30.70,71.20 < 30 |only if walking
_Continue_ down the stairs |goto Tanaan Jungle/0 29.50,68.70 < 30 |only if walking
_Follow_ the stairs down |goto Tanaan Jungle/0 28.70,67.30 < 30 |only if walking
_Follow_ the road |goto Tanaan Jungle/0 29.60,61.60 < 30 |only if walking
_Run on_ the dirt path |goto Tanaan Jungle/0 28.30,60.80 < 30 |only if walking
_Follow_ the path up |goto Tanaan Jungle/0 25.90,61.40 < 20 |only if walking
click Grappling Hook and Rope##230950 |goto Tanaan Jungle/0 26.40,62.00 < 10
|tip It looks like a coiled up rope on the ground.
click Looted Bleeding Hollow Treasure##241565 |q 38741 |goto Tanaan Jungle/0 26.50,62.90 |future
|tip It looks like a metal and wooden treasure chest, sitting on the ground at the top of this tower.
step
_Follow_ the road |goto Tanaan Jungle/0 24.20,59.80 < 30 |only if walking
_Enter_ the tower |goto Tanaan Jungle/0 16.40,58.60 < 20 |walk
click The Eye of Grannok##241713 |q 38757 |goto Tanaan Jungle/0 16.00,59.40 |future
|tip It looks like a white orb sitting in a spiked pedastal on the middle level of this tower.
step
_Leave_ the tower |goto Tanaan Jungle/0 16.40,58.50 < 20 |walk
click Spoils of War##241699 |q 38755 |goto Tanaan Jungle/0 17.40,56.90 |future
|tip It looks like a big wooden chest sitting on the ground inside this small hut.
step
_Enter_ the tower |goto Tanaan Jungle/0 15.30,54.70 < 20 |walk
click Axe of the Weeping Wolf##241692 |q 38754 |goto Tanaan Jungle/0 15.00,54.40 |future
|tip It looks like a big axe, hanging in the hand of a dead orc hanging from a chain, under the stairs on the bottom level of this tower.
step
_Leave_ the tower |goto Tanaan Jungle/0 15.40,55.00 < 20 |walk
click Stolen Captain's Chest##240543 |q 38283 |goto Tanaan Jungle/0 17.00,52.90 |future
|tip It looks like a small wooden chest sitting on the ground next to a dead orc at the base of this big tree.
step
_Enter_ the cave |goto Tanaan Jungle/0 17.00,50.30 < 20 |walk
_Follow_ the path left | goto Tanaan Jungle/0 16.40,48.70 < 20 |only if walking
_Run up_ the path |goto Tanaan Jungle/0 15.90,49.20 < 20 |only if walking
click Weathered Axe##240289 |q 38208 |goto Tanaan Jungle/0 15.90,49.70 |future
|tip It looks like an axe lodged into the head of a tombstone, behind a dirt grave in this cave.
step
_Leave_ the cave |goto Tanaan Jungle/0 17.00,50.30 < 30 |walk
_Run up_ the path |goto Tanaan Jungle/0 19.40,52.40 < 30 |only if walking
_Continue_ following the path up |goto Tanaan Jungle/0 21.30,49.50 < 30 |only if walking
_Enter_ the building |goto Tanaan Jungle/0 22.00,48.10 < 20 |walk
click Bleeding Hollow Warchest##241560 |q 38678 |goto Tanaan Jungle/0 22.00,47.80 |future
|tip It looks like a large wooden chest inside this small building.
step
_Follow_ the path |goto Tanaan Jungle/0 23.50,49.70 < 30 |only if walking
click Grappling Hook and Rope##241659 |goto Tanaan Jungle/0 24.70,49.80 < 10 |only if walking
|tip It looks like a coiled up rope on the ground. |only if walking
click Borrowed Enchanted Spyglass##241664 |q 38735 |goto Tanaan Jungle/0 25.30,50.20 |future
|tip It looks like a big metal telescope mounted on a wooden tripod at the top of this tower.
step
_Follow_ the path |goto Tanaan Jungle/0 24.40,48.50 < 30 |only if walking
_Run up_ the dirt path |goto Tanaan Jungle/0 27.60,47.20 < 30 |only if walking
_Continue_ up the path |goto Tanaan Jungle/0 27.80,44.20 < 30 |only if walking
_Follow_ the dirt road |goto Tanaan Jungle/0 30.40,43.00 < 30 |only if walking
_Run down_ the path |goto Tanaan Jungle/0 30.70,39.70 < 30 |only if walking
_Go down_ the spiral path into the cave |goto Tanaan Jungle/0 32.60,37.20 < 20 |only if walking
_Follow_ the path |goto Tanaan Jungle/0 32.30,37.00 < 20 |only if walking
_Continue_ through the tunnel |goto Tanaan Jungle/0 32.10,38.60 < 30 |only if walking
_Jump down_ here |goto Tanaan Jungle/0 32.60,37.40 < 20 |only if walking
_Follow_ the path |goto Tanaan Jungle/0 33.00,36.80 < 20 |only if walking
click Skull of the Mad Chief##241674 |q 38742 |goto Tanaan Jungle 34.70,34.60 |future
|tip It looks like a big skull with a glowing eye stuck in the wall in the very bottom room of this cave.
step
_Follow_ the path up and out of the cave |goto Tanaan Jungle/0 32.30,37.90 < 20 |only if walking
_Run up_ the green log |goto Tanaan Jungle/0 31.70,39.40 < 20 |only if walking
_Follow_ the dirt path up |goto Tanaan Jungle/0 29.10,40.20 < 30 |only if walking
_Continue_ following the path |goto Tanaan Jungle/0 27.40,40.80 < 30 |only if walking
_Keep following_ the path |goto Tanaan Jungle/0 24.20,39.70 < 30 |only if walking
_Run down_ the path |goto Tanaan Jungle/0 21.90,40.60 < 30 |only if walking
click The Blade of Kra'nak##240577 |q 38320 |goto Tanaan Jungle/0 19.30,40.90 |future
|tip it looks like a large dagger in the hand of a stone statue underwater.
step
_Follow_ the path up |goto Tanaan Jungle/0 20.10,40.90 < 30 |only if walking
_Continue_ following the path |goto Tanaan Jungle/0 22.00,40.50 < 30 |only if walking
_Follow_ the path |goto Tanaan Jungle/0 23.80,36.90 < 30 |only if walking
_Run up_ the dirt path |goto Tanaan Jungle/0 25.00,33.80 < 30 |only if walking
_Jump across_ to the ledge while mounted |goto Tanaan Jungle/0 30.20,32.10 < 20 |only if walking
_Jump across_ again while mounted |goto Tanaan Jungle/0 30.60,31.80 < 20 |only if walking
_Run up_ the path |goto Tanaan Jungle/0 30.90,31.30 < 30 |only if walking
click Jeweled Arakkoa Effigy##241657 |q 38732 |goto Tanaan Jungle/0 31.40,31.10 |future
|tip It looks like a stone bird statue sittion on a small round table up on this cliff ledge.
step
_Enter_ the cave |goto Tanaan Jungle/0 29.20,31.30 < 20 |walk
_Jump up_ on the rocks |goto Tanaan Jungle/0 28.90,34.40 < 20 |only if walking
click Partially Mined Apexis Crystal##242249 |q 38863 |goto Tanaan Jungle/0 28.90,34.60 |future
|tip It looks like a big dark yellow crystal sticking out of the wall in the back of this cave.
step
_Leave_ the cave |goto Tanaan Jungle/0 29.20,31.30 < 30 |walk
_Carefully_ jump down the cliff |goto Tanaan Jungle/0 28.60,27.10 < 30 |only if walking
click Jewel of Hellfire##240580 |q 38334 |goto Tanaan Jungle/0 28.70,23.30 |future
|tip It looks like a red crystal lodged into the skull of this skeleton laying on the ground in the middle of a bunch of trees on the beach.
step
_Follow_ the path |goto Tanaan Jungle/0 41.30,43.30 < 30 |only if walking
_Enter_ the building |goto Tanaan Jungle/0 38.00,44.70 < 30 |walk
_Follow_ the path |goto Tanaan Jungle/0 37.40,44.40 < 20 |only if walking
click Pale Removal Equipment##241524 |q 38640 |goto Tanaan Jungle/0 37.10,46.20 |future
|tip It looks like a wooden chest sitting on the ground next to the wall and some dead orcs.
step
_Follow_ the road |goto Tanaan Jungle/0 41.70,42.60 < 30 |only if walking
_Run up_ the path |goto Tanaan Jungle/0 38.60,39.40 < 30 |only if walking
_Follow_ the path up |goto Tanaan Jungle/0 38.80,42.10 < 30 |only if walking
_Run up_ the ladder |goto Tanaan Jungle/0 37.80,43.50 < 20 |only if walking
click Strange Sapphire##240003 |q 37956 |goto Tanaan Jungle/0 36.40,43.40 |future
|tip It looks like a big floating blue heart shaped gem inside a cage up on a hill.
step
_Follow_ the path |goto Tanaan Jungle/0 38.50,39.40 < 30 |only if walking
_Run up_ the path |goto Tanaan Jungle/0 40.90,37.70 < 30 |only if walking
_Enter_ the building |goto Tanaan Jungle/0 42.50,37.80 < 20 |walk
click The Commander's Shield##241847 |q 38821 |goto Tanaan Jungle/0 43.20,38.30 |future
|tip It looks like a round metal shield leaning on the wall inside this building.
step
_Leave_ the building |goto Tanaan Jungle/0 42.50,37.80 < 20 |walk
_Enter_ the tower |goto Tanaan Jungle/0 43.00,35.80 < 20 |walk
click Dazzling Rod##241848 |q 38822 |goto Tanaan Jungle/0 42.90,35.40 |future
|tip It looks like a staff with a purple glowing crystal at the top of it, leaning on a pillar at the top of this tower.
step
_Follow_ the path |goto Tanaan Jungle/0 43.60,37.70 < 30 |only if walking
_Continue_ following the path |goto Tanaan Jungle/0 44.10,41.90 < 30 |only if walking
click Fel-Drenched Satchel##241745 |q 38773 |goto Tanaan Jungle/0 46.90,44.40 |future
|tip It looks like a tan leather box sitting in the huge half-submerged wooden wagon in a stream of green liquid.
step
_Follow_ the path |goto Tanaan Jungle/0 47.90,43.90 < 30 |only if walking
click Sacrificial Blade##241760 |q 38776 |goto Tanaan Jungle/0 46.80,42.20 |future
|tip It looks like a dagger stabbed into a stone next to a pool of green liquid.
step
_Follow_ the path up |goto Tanaan Jungle/0 47.30,42.80 < 30 |only if walking
_Follow_ the path left |goto Tanaan Jungle/0 47.50,37.20 < 30 |only if walking
click Book of Zyzzix##241742 |q 38771 |goto Tanaan Jungle/0 46.90,36.70 |future
|tip It looks like a big open book, floating above a small table.
step
_Follow_ the path up |goto Tanaan Jungle/0 58.80,35.30 < 30 |only if walking
_Continue_ up the path |goto Tanaan Jungle/0 58.00,30.90 < 30 |only if walking
_Turn_ and _keep running_ up the path |goto Tanaan Jungle/0 53.80,31.70 < 30 |only if walking
_Turn again_ and _run up_ the path |goto Tanaan Jungle/0 55.70,29.50 < 30 |only if walking
_Keep running_ up the path |goto Tanaan Jungle/0 54.50,29.10 < 30 |only if walking
_Turn left_ and _follow_ the green liquid river |goto Tanaan Jungle/0 55.00,26.50 < 20 |only if walking
_Jump across_ onto the rocks here |goto Tanaan Jungle/0 53.50,27.20 < 20 |only if walking
_Jump across_ the green river from here |goto Tanaan Jungle/0 52.50,28.90 < 10 |only if walking
_Jump_ to the other big rock here |goto Tanaan Jungle/0 52.40,30.00 < 20 |only if walking
_Jump down_ carefully to the flat ledge below here |goto Tanaan Jungle/0 51.70,31.10 < 20 |only if walking
click Fel-Tainted Apexis Formation##242649 |q 39075 |goto Tanaan Jungle/0 51.60,32.60 |future
|tip It looks like a dark colored crystal growing out of the side of the edge of this ledge.
|tip You may need a group to help you get to this spot.
step
_Run up_ the path |goto Tanaan Jungle/0 53.80,31.70 < 30 |only if walking
_Turn_ and _run up_ the path |goto Tanaan Jungle/0 55.70,29.50 < 30 |only if walking
_Keep running_ up the path |goto Tanaan Jungle/0 54.50,29.10 < 30 |only if walking
_Follow_ the path |goto Tanaan Jungle/0 55.00,26.50 < 20 |only if walking
click Rune Etched Femur##241566 |q 38686 |goto Tanaan Jungle/0 51.70,24.30 |future
|tip It looks like a bone sticking out of a small pool of green liquid.
|tip You may need a group to help you get to this spot.
step
_Follow_ the path |goto Tanaan Jungle/0 56.20,25.50 < 30 |only if walking
click Jewel of the Fallen Star##241561 |q 38679 |goto Tanaan Jungle/0 58.50,25.30 |future
|tip It looks like a huge blue and green crystal sitting on the ground.
|tip You may need a group to help you get to this spot.
step
_Follow_ the path |goto Tanaan Jungle/0 59.10,25.10 < 30 |only if walking
_Run up_ the path |goto Tanaan Jungle/0 60.30,23.30 < 30 |only if walking
_Run up_ here |goto Tanaan Jungle/0 63.20,20.90 < 20 |only if walking
click Censer of Torment##241563 |q 38682 |goto Tanaan Jungle/0 62.60,20.50 |future
|tip It's a large skull sitting on a stone blod-stained table.
|tip You may need a group to help you get to this spot.
step
_Follow_ the path down |goto Tanaan Jungle/0 62.20,22.70 < 30 |only if walking
_Run up_ the path |goto Tanaan Jungle/0 59.30,24.10 < 30 |only if walking
_Follow_ the path |goto Tanaan Jungle/0 55.50,25.50 < 30 |only if walking
_Run down_ the path |goto Tanaan Jungle/0 55.50,27.20 < 30 |only if walking
_Jump down_ here |goto Tanaan Jungle/0 55.50,28.40 < 20 |only if walking
_Carefully_ jump down here |goto Tanaan Jungle/0 55.50,31.00 < 20 |only if walking
_Run down_ the path |goto Tanaan Jungle/0 58.50,31.30 < 30 |only if walking
_Follow_ the path |goto Tanaan Jungle/0 59.20,35.60 < 30 |only if walking
_Run up_ the path |goto Tanaan Jungle/0 62.40,32.90 < 30 |only if walking
_Follow_ the path up |goto Tanaan Jungle/0 62.20,30.30 < 30 |only if walking
|tip If the green fire is blocking your way into the cave, you must wait and complete the Garrison Campaign quest "The Warlock", which only has a chance to be available each week. Use "The Warlock" Garrison Campaign guide to accomplish this.
click Forgotten Shard of the Cipher##241671 |q 38740 |goto Tanaan Jungle 63.30,28.10 |future
|tip It looks like a small white object on the ground next to a huge vertical bone.
step
_Follow_ the path |goto Tanaan Jungle/0 62.20,30.30 < 30 |only if walking
_Continue_ following the path |goto Tanaan Jungle/0 62.90,38.10 < 30 |only if walking
click Loose Soil##241606
|tip It looks like a pile of dirt on the ground. You will get thrown up into a nearby tree.
click Strange Fruit##241599 |q 38701 |goto Tanaan Jungle/0 64.60,42.10 |future
|tip It looks like a huge roundish yellow fruit sitting at the end of a branch. Walk carefully on the branch to get to it.
step
_Follow_ the path |goto Tanaan Jungle/0 59.40,42.00 < 30 |only if walking
_Run on_ the road |goto Tanaan Jungle/0 58.50,52.60 < 30 |only if walking
_Follow_ the path |goto Tanaan Jungle/0 69.50,53.40 < 30 |only if walking
click Forgotten Iron Horde Supplies##241602 |q 38704 |goto Tanaan Jungle/0 69.80,56.00 |future
|tip It looks like a wooden crate sitting on a table inside this small hut.
step
_Follow_ the path |goto Tanaan Jungle/0 71.50,49.30 < 30 |only if walking
_Run up_ the rocks here |goto Tanaan Jungle/0 73.00,44.10 < 20 |only if walking
click Stashed Bleeding Hollow Loot##241764 |goto Tanaan Jungle/0 73.60,43.20 |q 38779 |future
|tip It looks like a wooden chest sitting on the ground next to the building at the top of these rocks.
step
You still need more treasures: |only if not achieved(10262)
Click to restart this guide |confirm |next "tanaan_treasure_start" |only if not achieved(10262)
|tip This will help you go back and get any treasures you missed. |only if not achieved(10262)
Congratulations! You earned the: |only if achieved(10262)
_Jungle Treasure Hunter_ Achievement |only if achieved(10262)
_Jungle Treasure Master_ Achievement |only if achieved(10262)
]])
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Exploration\\Draenor\\Prove Your Strength")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Exploration\\Draenor\\Shredder Maniac")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Exploration\\Field Photographer")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Exploration\\Draenor\\Jungle Hunter/Stalker")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Exploration\\Draenor\\Explore Tanaan Jungle")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Exploration\\Draenor\\I Came, I Clawed, I Conquered")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Exploration\\Draenor\\Hellbane")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\General\\Draenor Cuisine")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\General\\Everything Is Awesome")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\General\\Got My Mind On My Draenor Money")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Legacy\\Professions\\Draenor Medic")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Pet Battles\\Collect\\Draenor Safari")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Pet Battles\\Collect\\So. Many. Pets.")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Pet Battles\\Battle\\An Awfully Big Adventure")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Pet Battles\\Battle\\Draenic Pet Battler")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Pet Battles\\Battle\\Tiny Terrors in Tanaan")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Pet Battles\\Level\\Overstuffed")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Pet Battles\\Pet Charmer")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Pet Battles\\Taming Draenor")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Professions\\Cooking\\Draenor Cook")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Professions\\Cooking\\The Draenor Gourmet")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Professions\\Fishing\\Draenor Angler")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Professions\\Fishing\\Draenor Fisherman")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Professions\\Archaeology\\Arakkoa Archivist")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Professions\\Archaeology\\Draenor Archaeologist")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Professions\\Archaeology\\Draenor Curator")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Professions\\Archaeology\\Highmaul Historian")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Professions\\Archaeology\\Ogre Observer")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Professions\\Archaeology\\Secrets of Skettis")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Professions\\Archaeology\\Strength and Honor")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Professions\\Archaeology\\The Search For Fact, Not Truth")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Professions\\Archaeology\\Unite the Clans")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Professions\\Draenic Seed Collector")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Professions\\Draenic Stone Collector")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Professions\\Professional Draenor Master")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Professions\\Grand Master of All")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Professions\\Inspector Gadgetzan")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Professions\\Working in Draenor")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Quests\\Draenor\\A Demidos of Reality")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Quests\\Draenor\\A-VOID-ance")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Quests\\Draenor\\Ancient No More")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Quests\\Draenor\\Arak Star")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Quests\\Draenor\\As I Walk Through the Valley of the Shadow of Moon")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Quests\\Draenor\\Between Arak and a Hard Place")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Quests\\Draenor\\Bobbing for Orcs")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Quests\\Draenor\\Breaker of Chains")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Quests\\Draenor\\Broke Back Precipice")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Quests\\Draenor\\Buried Treasures")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Quests\\Draenor\\Burn it to the Ground")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Quests\\Draenor\\By Fire Be... Merged?")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Quests\\Draenor\\Chapter I: Call of the Archmage")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Quests\\Draenor\\Chapter II: Gul'dan Strikes Back")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Quests\\Draenor\\Chapter III: The Foundry Falls")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Quests\\Draenor\\Chapter IV: Darkness Incarnate")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Quests\\Draenor\\Charged Up")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Quests\\Draenor\\Cut off the Head")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Quests\\Draenor\\Delectable Ogre Delicacies")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Quests\\Draenor\\Don't Let the Tala-door Hit You on the Way Out")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Quests\\Draenor\\Draenor's Last Stand")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Quests\\Draenor\\Eggs in One Basket")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Quests\\Draenor\\Fight the Power")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Quests\\Draenor\\King of the Monsters")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Quests\\Draenor\\Monster Mash")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Quests\\Draenor\\Rumble in the Jungle")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Quests\\Draenor\\Writing in the Snow")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Quests\\Draenor\\Fish Gotta Swim, Birds Gotta Eat")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Quests\\Draenor\\Goodness Gracious")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Quests\\Draenor\\Heralds of the Legion")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Quests\\Draenor\\History of Violence")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Quests\\Draenor\\I Want More Talador")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Quests\\Draenor\\I Was Framed!")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Quests\\Draenor\\In Plain Sight")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Quests\\Draenor\\Iron Wings")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Quests\\Draenor\\It's the Stones!")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Quests\\Draenor\\Loremaster of Draenor")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Quests\\Draenor\\Make It a Bonus")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Quests\\Draenor\\Making the Cut")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Quests\\Draenor\\Master Relic Hunter")
GoatQuest:RegisterGuide("Achievement Guides\\Quests\\Draenor\\Mean and Green",{
achieveid={9654},
patch='60001',
description="Reach 10 stacks of Mutagen in the Everbloom Wilds.",
},[[
step
_Fly_ to Everbloom Outlook |goto Gorgrond/0 68.80,28.80 < 5 |only if walking
_Head South_ through the forest |goto Gorgrond/0 70.60,33.50 < 20 |only if walking
_Continue South_ through the marsh |goto Gorgrond/0 71.70,38.20 < 20 |only if walking
_Gain_ the Mutagen debuff from killing mobs in the Everbloom Wilds
_Stand_ in the green pool that will appear under their corpse to gain 1 stack of Mutagen
|tip Leaving Everbloom Wilds will remove all stacks.
kill Twisted Guardian##88279+, Enthralled Mutant##88394+
_Gain_ 10 stacks of Mutagen
|achieve 9654 |goto Gorgrond/0 71.60,41.80
step
Congratulations, you have _earned_ the Mean and Green Achievement!
]])
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Quests\\Draenor\\Nagrandeur")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Quests\\Draenor\\On the Shadow's Trail")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Quests\\Draenor\\One of Us! One of Us!")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Quests\\Draenor\\Picky Palate")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Quests\\Draenor\\Pillars of Draenor")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Quests\\Draenor\\Planned to Fail")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Quests\\Draenor\\Poisoning the Well")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Quests\\Draenor\\Poor Communication")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Quests\\Draenor\\Putting the Gore in Gorgrond")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Quests\\Draenor\\Securing Draenor")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Quests\\Draenor\\Slagnarok")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Quests\\Draenor\\Take From Them Everything")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Quests\\Draenor\\That Was Entirely Unnecessary")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Quests\\Draenor\\The Garrison Campaign")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Quests\\Draenor\\The Power Is Yours")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Quests\\Draenor\\The Song of Silence")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Quests\\Draenor\\United We Stand")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Quests\\Draenor\\Welcome to Draenor")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Quests\\Draenor\\With a Nagrand Cherry On Top")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Quests\\Draenor\\Would You Like a Pamphlet?")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Quests\\Draenor\\You Can't Make a Giant Omelette")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Quests\\Draenor\\You Have Been Rylakinated!")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Reputation\\Draenor\\Arakkoa Outcasts")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Reputation\\Draenor\\Council of Exarchs")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Reputation\\Draenor\\Mantle of the Talon King")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Reputation\\Draenor\\Savage Friends")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Reputation\\Draenor\\Sha'tari Defense")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Reputation\\Draenor\\Steamwheedle Perservation Society")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Reputation\\Draenor\\Wrynn's Vanguard")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Scenarios\\Proving Grounds\\Proving Yourself: Bronze Damage")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Scenarios\\Proving Grounds\\Proving Yourself: Bronze Tank")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Scenarios\\Proving Grounds\\Proving Yourself: Gold Damage")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Scenarios\\Proving Grounds\\Proving Yourself: Gold Tank")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Scenarios\\Proving Grounds\\Proving Yourself: Silver Damage")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Scenarios\\Proving Grounds\\Proving Yourself: Silver Tank")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Collections\\Toy Box\\The Toymaster")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Collections\\Toy Box\\All Toys")
