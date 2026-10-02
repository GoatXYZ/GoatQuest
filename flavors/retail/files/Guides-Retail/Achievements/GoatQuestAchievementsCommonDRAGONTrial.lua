local GoatQuest=GoatQuest
if not GoatQuest then return end
if GQ:DoMutex("AchievementsCDRAGON") then return end
GoatQuest.GuideMenuTier = "TRI"
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Professions\\In Tyr's Footsteps")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Professions\\Discombobberlated")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Professions\\Sleeping on the Job")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Exploration\\Dragon Isles\\Dragonscale Expedition: The Highest Peaks")
GoatQuest:RegisterGuide("Achievement Guides\\Exploration\\Dragon Isles\\Symbols of Hope",{
description="Release 10 Hope Kites that were tethered by locals of the Waking Shores while waiting for the dragonflights' return.",
condition_suggested=function() return level == 60 and not achieved(16584) end,
achieveid={16584},
startlevel=60,
keywords={"Dragonflight","Exploration","Kite"},
patch='100002',
},[[
step
click Hope Kite
|tip On the edge of the platform.
Release the Apex Canopy Hope Kite |q 72101 |goto The Waking Shores/0 24.04,89.94 |future |notravel
step
click Hope Kite
|tip At the top of the tower.
Release the Obsidian Observatory Hope Kite |q 72100 |goto The Waking Shores/0 43.55,63.82 |future |notravel
step
click Hope Kite
|tip On the edge of the platform.
Release The Overflowing Spring Hope Kite |q 72102 |goto The Waking Shores/0 50.27,55.62 |future |notravel
step
click Hope Kite
|tip Inside the top of the tower.
Release the Crumbling Life Archway Hope Kite |q 72098 |goto The Waking Shores/0 56.73,57.99 |future |notravel
step
click Hope Kite
|tip Inside the top of the tower.
Release the Concord Observatory Hope Kite |q 72103 |goto The Waking Shores/0 57.12,46.39 |future |notravel
step
click Hope Kite
|tip On the edge of the platform.
Release the Overflowing Rapids Hope Kite |q 72104 |goto The Waking Shores/0 48.86,39.94 |future |notravel
step
click Hope Kite
|tip Inside the top of the tower.
Release the Life-Binder Conservatory Hope Kite |q 72105 |goto The Waking Shores/0 57.01,19.98 |future |notravel
step
click Hope Kite
|tip At the top of the tower.
Release the Wingrest Embassy Hope Kite |q 72096 |goto The Waking Shores/0 73.19,37.76 |future |notravel
step
click Hope Kite
|tip On top of the wall.
Release the Skytop Observatory Hope Kite |q 72097 |goto The Waking Shores/0 73.03,52.92 |future |notravel
step
click Hope Kite
|tip Inside the top of the tower.
Release the Hatchery Observatory Hope Kite |q 72099 |goto The Waking Shores/0 61.69,80.83 |future |notravel
]])
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Exploration\\Dragon Isles\\Honor Our Ancestors")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Exploration\\Dragon Isles\\That's Pretty Neat!")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Exploration\\Dragon Isles\\Knew You Nokhud Do It!")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Exploration\\Dragon Isles\\Treasures of The Waking Shores")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Exploration\\Dragon Isles\\Treasures of the Ohn'ahran Plains")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Exploration\\Dragon Isles\\Treasures of The Azure Span")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Exploration\\Dragon Isles\\Treasures of Thaldraszus")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Exploration\\Dragon Isles\\Let's Get Quacking")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Exploration\\Dragon Isles\\Who's a Good Bakar?")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Exploration\\Dragon Isles\\Do You Wanna Build a Snowman?")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Exploration\\Dragon Isles\\Framing a New Perspective")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Exploration\\Dragon Isles\\Fang Flap Fire Fighter")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Exploration\\Dragon Isles\\Ley Line in the Span")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Exploration\\Dragon Isles\\Siege on Dragonbane Keep: Chiseled Record")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Exploration\\Dragon Isles\\Fragments of History")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Exploration\\Dragon Isles\\To All the Squirrels Hidden Til Now")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Exploration\\Dragon Isles\\Curious Coin")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Exploration\\Dragon Isles\\Explore the Waking Shores")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Exploration\\Dragon Isles\\Explore the Ohn'ahran Plains")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Exploration\\Dragon Isles\\Explore Thaldraszus")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Exploration\\Dragon Isles\\Explore the Azure Span")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Exploration\\Dragon Isles\\Explore Zaralek Cavern")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Exploration\\Dragon Isles\\Explore the Emerald Dream")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Exploration\\Dragon Isles\\Dragon Isles Explorer")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Exploration\\Dragon Isles\\Dragon Isles Pathfinder")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Pet Battles\\Dragon Isles\\Dragon Isles Safari")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Quests\\Dragonflight\\Mastering the Waygates")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Quests\\Dragonflight\\Sojourner of Azure Span")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Quests\\Dragonflight\\Sojourner of Ohn'ahran Plains")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Quests\\Dragonflight\\Sojourner of Thaldraszus")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Quests\\Dragonflight\\Sojourner of the Waking Shores")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Quests\\Dragonflight\\River Rapids Wrangler")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Quests\\Dragonflight\\Drop It Like It's Hot")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Reputation\\Dragonflight\\Ready, Aim, Catalog!")
GoatQuest:RegisterGuide("Achievement Guides\\Reputation\\Dragonflight\\Which Knot Was It Again?",{
description="Unlock climbing World Quests with the Dragonscale Expedition.",
condition_suggested=function() return level >= 60 and factionrenown(2507) >= 6 and not achieved(16624) end,
achieveid={16624},
startlevel=60,
patch='100002',
},[[
step
talk Cataloger Jakes##189226 |goto The Waking Shores/0 47.11,82.58
|tip Inside the tent.
|tip Turn in Dragon Isles Artifacts from treasures and supply packs all over The Waking Shores.
'|turnin Multiple Dragon Isles Artifacts##72876
'|turnin Multiple Dragon Isles Artifacts##71035
'|turnin Dragon Isles Artifacts##71034
Reach Renown Level 6 with the Dragonscale Expedition |complete factionrenown(2507) >= 6
|tip Complete daily quests, weekly quests, and zone quests in The Waking Shores to gain renown.
|tip You can also gain renown by completing weekly quests using the "Dragonscale Basecamp Weekly Quests" guide.
step
talk Pathfinder Jeb##187700
turnin A Climber's Calling##69855 |goto The Waking Shores/0 47.33,83.40
accept Basic Climbing Gear##72524 |goto The Waking Shores/0 47.33,83.40
step
click Climbing Gear
|tip Click the "Climbing Gear" ability at the top of the middle row.
Research the Climbing Gear Ability |q 72524/1 |goto The Waking Shores/0 47.30,83.39
step
talk Pathfinder Jeb##187700
turnin Basic Climbing Gear##72524 |goto The Waking Shores/0 47.33,83.40
accept Smoke Over the Mountain##66351 |goto The Waking Shores/0 47.33,83.40
step
talk Rocky Dustbeard##181039
turnin Smoke Over the Mountain##66351 |goto The Waking Shores/0 62.35,50.45
accept Climb Every Mountain##65421 |goto The Waking Shores/0 62.35,50.45
step
click Climbing Gear
Put on the Climbing Gear |q 65421/1 |goto The Waking Shores/0 62.35,50.54
step
click Handhold
Find a Handhold on the Cliff |q 65421/2 |goto The Waking Shores/0 63.30,50.14
step
click Clinging Gustbloom Sample
|tip Click the handholds to reach the Gustbloom.
collect Clinging Gustbloom Sample##191138 |q 65421/3 |goto The Waking Shores/0 63.25,49.81
step
Climb to the right |goto The Waking Shores/0 63.46,50.02 < 5 |walk
clicknpc Pathfinder Yips##187349
Rescue Pathfinder Yips |q 65421/4 |goto The Waking Shores/0 63.09,49.82
step
talk Rocky Dustbeard##181039
turnin Climb Every Mountain##65421 |goto The Waking Shores/0 62.35,50.45
step
achieve Which Knot Was It Again?##16624
]])
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Reputation\\Dragonflight\\The Disgruntled Hunter")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Reputation\\Dragonflight\\Legendary Photograph")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Exploration\\Dragon Isles\\Explore the Forbidden Reach")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Exploration\\Dragon Isles\\Door Buster")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Exploration\\Dragon Isles\\Treasures of the Forbidden Reach")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Exploration\\Dragon Isles\\Scavenger of the Forbidden Reach")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Exploration\\Dragon Isles\\Hoarder of the Forbidden Reach")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Quests\\Dream On")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Exploration\\I Dream of Seeds")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Exploration\\Treasures of the Emerald Dream")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Quests\\Defenders of the Dream")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Exploration\\Adventurer of the Emerald Dream")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Exploration\\Super Duper Bloom")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Exploration\\Emerald Dream Safari")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Quests\\Friends In Feathers")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Quests\\Of the Tyr's Guard")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Dungeons & Raids\\Dragonflight Raid\\Vault of the Incarnates")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Dungeons & Raids\\Dragonflight Raid\\Aberrus, the Shadowed Crucible")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Dungeons & Raids\\Dragonflight Raid\\Amirdrassil, the Dream's Hope")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Dungeons & Raids\\Dragonflight Dungeon\\Myths of the Dragonflight Dungeons")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Quests\\Dragonflight\\A New Beginning")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Quests\\Dragonflight\\Fringe Benefits")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Quests\\Dragonflight\\Active Listening Skills")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Quests\\Dragonflight\\A Blue Dawn")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Reputation\\Dragonflight\\A True Explorer")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Reputation\\Dragonflight\\Joining the Khansguard")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Reputation\\Dragonflight\\Joining the Community")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Reputation\\Dragonflight\\Ally of the Flights")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Reputation\\Dragonflight\\There's No Place Like Loamm")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Reputation\\Dragonflight\\Warden of the Dream")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Reputation\\Dragonflight\\Loyalty to the Prince")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Reputation\\Dragonflight\\The Obsidian Bloodline")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Exploration\\Dragon Isles\\Legend of the Multiverse")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Reputation\\Dragonflight\\Winterpelt Conversationalist")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Expansion Features\\Dragonriding\\Emerald Dream Glyph Hunter")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Expansion Features\\Dragonriding\\Zaralek Cavern Glyph Hunter")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Expansion Features\\Dragonriding\\Waking Shores Glyph Hunter")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Expansion Features\\Dragonriding\\Ohn'ahran Plains Glyph Hunter")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Expansion Features\\Dragonriding\\Azure Span Glyph Hunter")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Expansion Features\\Dragonriding\\Thaldraszus Glyph Hunter")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Expansion Features\\Dragonriding\\Forbidden Reach Glyph Hunter")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Reputation\\Dragonflight\\Hunt Master")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Reputation\\Dragonflight\\Longhunter")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Reputation\\Dragonflight\\The Best at What I Do")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Reputation\\Dragonflight\\A Legendary Album")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Reputation\\Dragonflight\\Great Shots Galore!")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Reputation\\Dragonflight\\Lead Climber")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Reputation\\Dragonflight\\How Did These Get Here?")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Reputation\\Dragonflight\\Well Supplied")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Reputation\\Dragonflight\\Soupervisor")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Reputation\\Dragonflight\\Leftovers' Revenge")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Expansion Features\\Dragonriding\\Forbidden Reach Racing Completionist")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Expansion Features\\Dragonriding\\Zaralek Cavern Racing Completionist")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Expansion Features\\Dragonriding\\Emerald Dream Racing Completionist")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Exploration\\Dragon Isles\\Adventurer of The Waking Shores")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Exploration\\Dragon Isles\\Adventurer of the Ohn'ahran Plains")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Exploration\\Dragon Isles\\Adventurer of The Azure Span")
GoatQuest:RegisterGuidePlaceholder("Achievement Guides\\Exploration\\Dragon Isles\\Adventurer of Thaldraszus")
