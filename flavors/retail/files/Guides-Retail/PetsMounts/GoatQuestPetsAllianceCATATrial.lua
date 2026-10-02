local GoatQuest=GoatQuest
if not GoatQuest then return end
if UnitFactionGroup("player")~="Alliance" then return end
if GQ:DoMutex("PetsACATA") then return end
GQ.CommonPets=true
GoatQuest.GuideMenuTier = "TRI"
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Aquatic Pets\\Magical Crawdad")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Aquatic Pets\\Pengu")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Aquatic Pets\\Sea Pony")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Aquatic Pets\\Shore Crawler")
GoatQuest:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Aquatic Pets\\Small Frog",{
patch='50100',
source='PetBattle',
description="This battle pet can be tamed in the wild around Crystal Lake in Elwynn Forest.",
keywords={"Aquatic","Elwynn","Forest"},
pet=419,
},[[
step
clicknpc Small Frog##61071
|tip Reduce its health below 35% and use the "Trap" ability on your pet bar.
|tip You may need to attempt the trap several times.
Learn the "Small Frog" Battle Pet |learnpet Small Frog##419 |goto Elwynn Forest/0 49.97,63.22
step
_Congratulations!_
You Collected the "Small Frog" Battle Pet.
]])
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Aquatic Pets\\Strand Crawler")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Aquatic Pets\\Speedy")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Aquatic Pets\\Strand Crawler")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Black Kingsnake")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Bombay Cat")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Brown Snake")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Cornish Rex Cat")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Crimson Snake")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Dun Morogh Cub")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Durotar Scorpion")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Feline Familiar")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Hyjal Bear Cub")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Lashtail Hatchling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Orange Tabby Cat")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Silver Tabby Cat")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\White Kitten")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Black Kingsnake")
GoatQuest:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Bombay Cat",{
patch='111100',
source='Vendor',
description="This guide will walk you through obtaining the Beast pet: Bombay Cat.",
pet=40,
},[[
step
talk Donni Anthania##6367
buy 1 Cat Carrier (Bombay)##8485 |goto Elwynn Forest,44.20,53.20
step
learnpet Bombay Cat##40 |use Cat Carrier (Bombay)##8485
]])
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Brown Snake")
GoatQuest:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Cornish Rex Cat",{
patch='111100',
source='Vendor',
description="This guide will walk you through obtaining the Beast pet: Cornish Rex Cat.",
pet=41,
},[[
step
talk Donni Anthania##6367
buy 1 Cat Carrier (Cornish Rex)##8486 |goto Elwynn Forest,44.20,53.20
step
learnpet Cornish Rex Cat##41 |use Cat Carrier (Cornish Rex)##8486
]])
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Crimson Snake")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Dun Morogh Cub")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Durotar Scorpion")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Feline Familiar")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Hyjal Bear Cub")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Lashtail Hatchling")
GoatQuest:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Orange Tabby Cat",{
patch='111100',
source='Vendor',
description="This guide will walk you through obtaining the Beast pet: Orange Tabby Cat.",
pet=43,
},[[
step
talk Donni Anthania##6367
buy 1 Cat Carrier (Orange Tabby)##8487 |goto Elwynn Forest,44.20,53.20
step
learnpet Orange Tabby Cat##43 |use Cat Carrier (Orange Tabby)##8487
]])
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Panther Cub")
GoatQuest:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Silver Tabby Cat",{
patch='111100',
source='Vendor',
description="This guide will walk you through obtaining the Beast pet: Silver Tabby Cat.",
pet=45,
},[[
step
talk Donni Anthania##6367
buy 1 Cat Carrier (Silver Tabby)##8488 |goto Elwynn Forest,44.20,53.20
step
learnpet Silver Tabby Cat##45 |use Cat Carrier (Silver Tabby)##8488
]])
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Armadillo Pup")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Brown Prairie Dog")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Dung Beetle")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Egbert")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Elwynn Lamb")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Hare")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Mr. Wiggles")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Mulgore Hatchling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Peanut")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Pint-Sized Pink Pachyderm")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Porcupette")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Scooter the Snail")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Snowshoe Rabbit")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Undercity Cockroach")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Undercity Rat")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Whiskers the Rat")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Winter Reindeer")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Wolpertinger")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Armadillo Pup")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Brown Prairie Dog")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Dung Beetle")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Egbert")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Elwynn Lamb")
GoatQuest:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Hare",{
patch='50100',
source='PetBattle',
description="This guide will walk you through obtaining the Critter pet: Hare.",
pet=448,
},[[
step
Challenge one to a pet battle and capture it
|tip The Hares in this area are around level 11.
learnpet Hare##448 |goto The Hinterlands 66.90,34.70
]])
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Mr. Wiggles")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Mulgore Hatchling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Peanut")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Pint-Sized Pink Pachyderm")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Porcupette")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Scooter the Snail")
GoatQuest:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Snowshoe Rabbit",{
patch='111100',
source='Vendor',
description="This guide will walk you through obtaining the Critter pet: Snowshoe Rabbit.",
pet=72,
},[[
step
talk Yarlyn Amberstill##1263
buy 1 Rabbit Crate (Snowshoe)##8497 |goto Dun Morogh 70.60,49.00
step
learnpet Snowshoe Rabbit##72 |use Rabbit Crate (Snowshoe)##8497
]])
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Undercity Cockroach")
GoatQuest:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Undercity Rat",{
patch='50100',
source='PetBattle',
description="This guide will walk you through obtaining the Critter pet: Undercity Rat.",
pet=454,
},[[
step
This pet is only found inside The Undercity.
|tip You can attempt to capture it yourself, but it is suggested that you use a Horde character to capture it.
confirm
step
Challenge one to a pet battle and capture it
|tip The Undercity Rats are level 2.
learnpet Undercity Rat##454 |goto Undercity 70.90,35.40
]])
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Whiskers the Rat")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\White Kitten")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Winter Reindeer")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Wolpertinger")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Dragonkin Pets\\Golden Dragonhawk Hatchling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Dragonkin Pets\\Lil' Tarecgosa")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Dragonkin Pets\\Red Dragonhawk Hatchling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Dragonkin Pets\\Silver Dragonhawk Hatchling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Dragonkin Pets\\Thundering Serpent Hatchling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Dragonkin Pets\\Golden Dragonhawk Hatchling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Dragonkin Pets\\Lil' Tarecgosa")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Dragonkin Pets\\Red Dragonhawk Hatchling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Dragonkin Pets\\Silver Dragonhawk Hatchling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Dragonkin Pets\\Thundering Serpent Hatchling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Elemental Pets\\Ammen Vale Lashling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Elemental Pets\\Dark Phoenix Hatchling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Elemental Pets\\Elementium Geode")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Elemental Pets\\Lumpy")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Elemental Pets\\Pebble")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Elemental Pets\\Searing Scorchling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Elemental Pets\\Teldrassil Sproutling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Elemental Pets\\Tiny Snowman")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Elemental Pets\\Ammen Vale Lashling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Elemental Pets\\Dark Phoenix Hatchling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Elemental Pets\\Elementium Geode")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Elemental Pets\\Lumpy")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Elemental Pets\\Pebble")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Elemental Pets\\Searing Scorchling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Elemental Pets\\Teldrassil Sproutling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Elemental Pets\\Tiny Snowman")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Elemental Pets\\Withers")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Alliance Balloon")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Blue Mini Jouster")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Blue Moth")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Darkmoon Balloon")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Gilnean Raven")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Gold Mini Jouster")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Plump Turkey")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Pterrordax Hatchling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Rustberg Gull")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Tirisfal Batling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Westfall Chicken")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\White Moth")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Yellow Moth")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Alliance Balloon")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Blue Mini Jouster")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Blue Moth")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Darkmoon Balloon")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Gilnean Raven")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Gold Mini Jouster")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Great Horned Owl")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Hawk Owl")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Plump Turkey")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Pterrordax Hatchling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Rustberg Gull")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Tiny Flamefly")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Tirisfal Batling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\White Moth")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Yellow Moth")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Humanoid Pets\\Argent Squire")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Humanoid Pets\\Argent Gruntling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Humanoid Pets\\Curious Oracle Hatchling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Humanoid Pets\\Father Winter's Helper")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Humanoid Pets\\Guild Herald (Horde)")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Humanoid Pets\\Guild Herald (Alliance)")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Humanoid Pets\\Guild Page (Horde)")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Humanoid Pets\\Guild Page (Alliance)")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Humanoid Pets\\Moonkin Hatchling (Horde)")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Humanoid Pets\\Moonkin Hatchling (Alliance)")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Humanoid Pets\\Peddlefeet")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Humanoid Pets\\Rotten Little Helper")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Humanoid Pets\\Winter's Little Helper")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Humanoid Pets\\Argent Squire")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Humanoid Pets\\Argent Gruntling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Humanoid Pets\\Curious Oracle Hatchling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Humanoid Pets\\Curious Wolvar Pup")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Humanoid Pets\\Father Winter's Helper")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Humanoid Pets\\Guild Herald (Alliance)")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Humanoid Pets\\Guild Herald (Horde)")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Humanoid Pets\\Guild Page (Alliance)")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Humanoid Pets\\Guild Page (Horde)")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Humanoid Pets\\Moonkin Hatchling (Alliance)")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Humanoid Pets\\Moonkin Hatchling (Horde)")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Humanoid Pets\\Rotten Little Helper")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Humanoid Pets\\Winter's Little Helper")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Magic Pets\\Enchanted Broom")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Magic Pets\\Enchanted Lantern")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Magic Pets\\Festival Lantern")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Magic Pets\\Legs")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Magic Pets\\Lunar Lantern")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Magic Pets\\Magic Lamp")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Magic Pets\\Shimmering Wyrmling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Magic Pets\\Willy")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Magic Pets\\Enchanted Broom")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Magic Pets\\Enchanted Lantern")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Magic Pets\\Festival Lantern")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Magic Pets\\Legs")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Magic Pets\\Lunar Lantern")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Magic Pets\\Magic Lamp")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Magic Pets\\Shimmering Wyrmling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Magic Pets\\Willy")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Mechanical Pets\\Clockwork Gnome")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Mechanical Pets\\Clockwork Rocket Bot")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Mechanical Pets\\Mechanopeep")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Mechanical Pets\\Clockwork Gnome")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Mechanical Pets\\Clockwork Rocket Bot")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Mechanical Pets\\De-Weaponized Mechanical Companion")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Mechanical Pets\\Lifelike Toad")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Mechanical Pets\\Lil' Smoky")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Mechanical Pets\\Mechanical Pandaren Dragonling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Mechanical Pets\\Mechanical Squirrel")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Mechanical Pets\\Mechanopeep")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Mechanical Pets\\Personal World Destroyer")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Mechanical Pets\\Pet Bombling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Mechanical Pets\\Tranquil Mechanical Yeti")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Undead Pets\\Crawling Claw")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Undead Pets\\Creepy Crate")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Undead Pets\\Fossilized Hatchling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Undead Pets\\Sen'jin Fetish")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Undead Pets\\Voodoo Figurine")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Undead Pets\\Crawling Claw")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Undead Pets\\Creepy Crate")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Undead Pets\\Fossilized Hatchling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Undead Pets\\Macabre Marionette")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Undead Pets\\Sen'jin Fetish")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Undead Pets\\Voodoo Figurine")
