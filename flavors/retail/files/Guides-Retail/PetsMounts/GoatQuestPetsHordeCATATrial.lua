local GoatQuest=GoatQuest
if not GoatQuest then return end
if UnitFactionGroup("player")~="Horde" then return end
if GQ:DoMutex("PetsHCATA") then return end
GQ.CommonPets=true
GoatQuest.GuideMenuTier = "TRI"
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Aquatic Pets\\Magical Crawdad")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Aquatic Pets\\Pengu")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Aquatic Pets\\Sea Pony")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Aquatic Pets\\Shore Crawler")
GoatQuest:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Aquatic Pets\\Small Frog",{
patch='50100',
source='PetBattle',
description="This battle pet can be tamed in the wild around the Overgrowth in Southern Barrens.",
keywords={"Aquatic","Southern","Barrens"},
pet=419,
},[[
step
clicknpc Small Frog##61071
|tip Reduce its health below 35% and use the "Trap" ability on your pet bar.
|tip You may need to attempt the trap several times.
Learn the "Small Frog" Battle Pet |learnpet Small Frog##419 |goto Southern Barrens/0 42.85,29.89
step
_Congratulations!_
You Collected the "Small Frog" Battle Pet.
]])
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Aquatic Pets\\Speedy")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Aquatic Pets\\Strand Crawler")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Black Kingsnake")
GoatQuest:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Bombay Cat",{
patch='111100',
source='Vendor',
description="This battle pet is sold by an Alliance vendor and can only be purchased from the Auction House if you are Horde.",
keywords={"Beast","Auction","House"},
pet=40,
},[[
step
collect Cat Carrier (Bombay)##8485 |n
|tip You can only purchase this pet from a vendor in Elwynn Forest with an Alliance character.
|tip If you do not have an Alliance character you can purchase it from the Auction House.
use the Cat Carrier (Bombay)##8485
|tip It is in your inventory.
Learn the "Bombay Cat" Battle Pet |learnpet Bombay Cat##40
step
_Congratulations!_
You Collected the "Bombay Cat" Battle Pet.
]])
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Brown Snake")
GoatQuest:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Cornish Rex Cat",{
patch='111100',
source='Vendor',
description="This battle pet is sold by an Alliance vendor and can only be purchased from the Auction House if you are Horde.",
keywords={"Beast","Auction","House"},
pet=41,
},[[
step
collect Cat Carrier (Cornish Rex)##8486 |n
|tip You can only purchase this pet from a vendor in Elwynn Forest with an Alliance character.
|tip If you do not have an Alliance character you can purchase it from the Auction House.
use the Cat Carrier (Cornish Rex)##8486
|tip It is in your inventory.
Learn the "Cornish Rex Cat" Battle Pet |learnpet Cornish Rex Cat##41
step
_Congratulations!_
You Collected the "Cornish Rex Cat" Battle Pet.
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
description="This battle pet is sold by an Alliance vendor and can only be purchased from the Auction House if you are Horde.",
keywords={"Beast","Auction","House"},
pet=43,
},[[
step
collect Cat Carrier (Orange Tabby)##8487 |n
|tip You can only purchase this pet from a vendor in Elwynn Forest with an Alliance character.
|tip If you do not have an Alliance character you can purchase it from the Auction House.
use the Cat Carrier (Orange Tabby)##8487
|tip It is in your inventory.
Learn the "Orange Tabby Cat" Battle Pet |learnpet Orange Tabby Cat##43
step
_Congratulations!_
You Collected the "Orange Tabby Cat" Battle Pet.
]])
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Panther Cub")
GoatQuest:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Silver Tabby Cat",{
patch='111100',
source='Vendor',
description="This battle pet is sold by an Alliance vendor and can only be purchased from the Auction House if you are Horde.",
keywords={"Beast","Auction","House"},
pet=45,
},[[
step
collect Cat Carrier (Silver Tabby)##8488 |n
|tip You can only purchase this pet from a vendor in Elwynn Forest with an Alliance character.
|tip If you do not have an Alliance character you can purchase it from the Auction House.
use the Cat Carrier (Silver Tabby)##8488
|tip It is in your inventory.
Learn the "Silver Tabby Cat" Battle Pet |learnpet Silver Tabby Cat##45
step
_Congratulations!_
You Collected the "Silver Tabby Cat" Battle Pet.
]])
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\White Kitten")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Armadillo Pup")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Brown Prairie Dog")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Dung Beetle")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Egbert")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Elwynn Lamb")
GoatQuest:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Hare",{
patch='50100',
source='PetBattle',
description="This battle pet can be tamed in the wild all around Durotar.",
keywords={"Critter","Durotar"},
pet=448,
},[[
step
clicknpc Hare##61751
|tip Reduce its health below 35% and use the "Trap" ability on your pet bar.
|tip You may need to attempt the trap several times.
Learn the "Hare" Battle Pet |learnpet Hare##448 |goto Durotar/0 45.26,21.67
step
_Congratulations!_
You Collected the "Hare" Battle Pet.
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
description="This battle pet is sold by an Alliance vendor and can only be purchased from the Auction House if you are Horde.",
keywords={"Critter","Auction","House"},
pet=72,
},[[
step
collect Rabbit Crate (Snowshoe)##8497 |n
|tip You can only purchase this pet from a vendor in Dun Morogh with an Alliance character.
|tip If you do not have an Alliance character you can purchase it from the Auction House.
use the Rabbit Crate (Snowshoe)##8497
|tip It is in your inventory.
Learn the "Snowshoe Rabbit" Battle Pet |learnpet Snowshoe Rabbit##72
step
_Congratulations!_
You Collected the "Snowshoe Rabbit" Battle Pet.
]])
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Undercity Cockroach")
GoatQuest:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Undercity Rat",{
patch='50100',
source='PetBattle',
description="This battle pet can be tamed in the wild around the Canals in the Undercity.",
keywords={"Critter","Undercity"},
pet=454,
},[[
step
clicknpc Undercity Rat##61889
|tip Reduce its health below 35% and use the "Trap" ability on your pet bar.
|tip You may need to attempt the trap several times.
Learn the "Undercity Rat" Battle Pet |learnpet Undercity Rat##454 |goto Undercity/0 59.92,38.00
step
_Congratulations!_
You Collected the "Undercity Rat" Battle Pet.
]])
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Whiskers the Rat")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Winter Reindeer")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Wolpertinger")
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
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Elemental Pets\\Withers")
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
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Westfall Chicken")
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
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Undead Pets\\Crawling Claw")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Undead Pets\\Creepy Crate")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Undead Pets\\Fossilized Hatchling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Undead Pets\\Macabre Marionette")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Undead Pets\\Sen'jin Fetish")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Undead Pets\\Voodoo Figurine")
