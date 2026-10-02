local GoatQuest=GoatQuest
if not GoatQuest then return end
if GQ:DoMutex("PetsCCATA") then return end
if not GQ.CommonPets then return end
GoatQuest.GuideMenuTier = "TRI"
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Aquatic Pets\\Biletoad")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Aquatic Pets\\Chuck")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Aquatic Pets\\Darkmoon Turtle")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Aquatic Pets\\Frog")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Aquatic Pets\\Horny Toad")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Aquatic Pets\\Huge Toad")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Aquatic Pets\\Jubling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Aquatic Pets\\Mac Frog")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Aquatic Pets\\Mojo")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Aquatic Pets\\Mr. Chilly")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Aquatic Pets\\Muckbreath")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Aquatic Pets\\Purple Puffer")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Aquatic Pets\\Shore Crab")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Aquatic Pets\\Snarly")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Aquatic Pets\\Spotted Bell Frog")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Aquatic Pets\\Strand Crab")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Aquatic Pets\\Toad")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Aquatic Pets\\Toothy")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Aquatic Pets\\Tree Frog")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Aquatic Pets\\Tundra Penguin")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Aquatic Pets\\Turquoise Turtle")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Aquatic Pets\\Wood Frog")
GoatQuest:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Adder",{
patch='50100',
source='PetBattle',
description="This battle pet can be tamed in the wild around Durotar.",
keywords={"Beast","Durotar"},
pet=635,
},[[
step
clicknpc Adder##61325
|tip Reduce its health below 35% and use the "Trap" ability on your pet bar.
|tip You may need to attempt the trap several times.
Learn the "Adder" Battle Pet |learnpet Adder##635 |goto Durotar/0 39.36,21.77
step
_Congratulations!_
You Collected the "Adder" Battle Pet.
]])
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Albino Snake")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Alterac Brew-Pup")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Arctic Fox Kit")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Ash Lizard")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Ash Spiderling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Ash Viper")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Baby Ape")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Baby Blizzard Bear")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Bananas")
GoatQuest:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Black Tabby Cat",{
patch='111100',
source='Drop',
description="This battle pet can be obtained from a random zone drop around Gavin's Naze in Hillsbrad Foothills.",
keywords={"Beast","Hillsbrad","Foothills"},
pet=42,
},[[
step
Kill enemies around this area
collect Cat Carrier (Black Tabby)##8491 |n
|tip This is a random drop from killing mobs in the Hillsbrad Foothills, it may take some time to get this.
use the Cat Carrier (Black Tabby)##8491
Learn the "Black Tabby Cat" Battle Pet |learnpet Black Tabby Cat##42 |goto Hillsbrad Foothills/0 40.96,48.49
step
_Congratulations!_
You Collected the "Black Tabby Cat" Battle Pet.
]])
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Calico Cat")
GoatQuest:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Cat",{
patch='50100',
source='PetBattle',
description="This battle pet can be tamed in the wild around Elwynn Forest.",
keywords={"Beast","Elwynn","Forest"},
pet=459,
},[[
step
clicknpc Cat##62019
|tip Reduce its health below 35% and use the "Trap" ability on your pet bar.
|tip You may need to attempt the trap several times.
Learn the "Cat" Battle Pet |learnpet Cat##459 |goto Elwynn Forest/0 44.46,52.50
step
_Congratulations!_
You Collected the "Cat" Battle Pet.
]])
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Cheetah Cub")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Clefthoof Runt")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Cobra Hatchling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Coral Snake")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Crystal Spider")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Darkmoon Cub")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Darkmoon Monkey")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Darkshore Cub")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Darting Hatchling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Desert Spider")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Deviate Hatchling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Devouring Maggot")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Diemetradon Hatchling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Dusk Spiderling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Emerald Boa")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Festering Maggot")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Fjord Worg Pup")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Forest Spiderling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Fox Kit")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Giraffe Calf")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Gundrak Hatchling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Horned Lizard")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\King Snake")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Larva")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Leaping Hatchling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Leopard Scorpid")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Little Black Ram")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Lizard Hatchling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Maggot")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Moccasin")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Molten Hatchling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Mr. Grubbs")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Nightsaber Cub")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Obsidian Hatchling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Panda Cub")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Poley")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Rat Snake")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Rattlesnake")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Ravager Hatchling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Ravasaur Hatchling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Razormaw Hatchling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Razzashi Hatchling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Rock Viper")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Sand Kitten")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Scalded Basilisk Hatchling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Scorpid")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Scorpling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Siamese Cat")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Sidewinder")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Silithid Hatchling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Skittering Cavern Crawler")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Smolderweb Hatchling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Snake")
GoatQuest:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Snow Cub",{
patch='50100',
source='PetBattle',
description="This battle pet can be tamed in the wild all around Central and Eastern Dun Morogh.",
keywords={"Beast","Dun","Morogh"},
pet=440,
},[[
step
clicknpc Snow Cub##61689
|tip Reduce its health below 35% and use the "Trap" ability on your pet bar.
|tip You may need to attempt the trap several times.
Learn the "Snow Cub" Battle Pet |learnpet Snow Cub##440 |goto Dun Morogh/0 70.32,54.24
step
_Congratulations!_
You Collected the "Snow Cub" Battle Pet.
]])
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Spider")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Spiky Lizard")
GoatQuest:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Spiny Lizard",{
patch='50100',
source='PetBattle',
description="This battle pet can be tamed in the wild around Deadeye Shore in Durotar.",
keywords={"Beast","Durotar"},
pet=466,
},[[
step
clicknpc Spiny Lizard##62114
|tip Reduce its health below 35% and use the "Trap" ability on your pet bar.
|tip You may need to attempt the trap several times.
Learn the "Spiny Lizard" Battle Pet |learnpet Spiny Lizard##466 |goto Durotar/0 58.38,27.90
step
_Congratulations!_
You Collected the "Spiny Lizard" Battle Pet.
]])
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Striped-Tailed Scorpid")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Stunted Shardhorn")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Tree Python")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Twilight Iguana")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Twilight Spider")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Venomspitter Hatchling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Warpstalker Hatchling")
GoatQuest:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Water Snake",{
patch='50100',
source='PetBattle',
description="This battle pet can be tamed in the wild around Southfury Watershed in Durotar.",
keywords={"Beast","Durotar"},
pet=418,
},[[
step
clicknpc Water Snake##61367
|tip Reduce its health below 35% and use the "Trap" ability on your pet bar.
|tip You may need to attempt the trap several times.
Learn the "Water Snake" Battle Pet |learnpet Water Snake##418 |goto Durotar/0 36.40,40.88
step
_Congratulations!_
You Collected the "Water Snake" Battle Pet.
]])
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Widow Spiderling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Wind Rider Cub")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Winterspring Cub")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Beast Pets\\Worg Pup")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Alpine Chipmunk")
GoatQuest:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Alpine Hare",{
patch='50100',
source='PetBattle',
description="This battle pet can be tamed in the wild all around Winterspring.",
keywords={"Critter","Winterspring"},
pet=441,
},[[
step
clicknpc Alpine Hare##61690
|tip Reduce its health below 35% and use the "Trap" ability on your pet bar.
|tip You may need to attempt the trap several times.
Learn the "Alpine Hare" Battle Pet |learnpet Alpine Hare##441 |goto Winterspring/0 63.96,37.84
step
_Congratulations!_
You Collected the "Alpine Hare" Battle Pet.
]])
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Arctic Hare")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Baneling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Beetle")
GoatQuest:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Black Lamb",{
patch='50100',
source='PetBattle',
description="This battle pet can be tamed in the wild all around Elwynn Forest.",
keywords={"Critter","Elwynn","Forest"},
pet=374,
},[[
step
clicknpc Black Lamb##60649
|tip Reduce its health below 35% and use the "Trap" ability on your pet bar.
|tip You may need to attempt the trap several times.
Learn the "Black Lamb" Battle Pet |learnpet Black Lamb##374 |goto Elwynn Forest/0 46.46,73.87
step
_Congratulations!_
You Collected the "Black Lamb" Battle Pet.
]])
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Black Rat")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Borean Marmot")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Brown Marmot")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Brown Rabbit")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Carrion Rat")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Cockroach")
GoatQuest:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Creepy Crawly",{
patch='50100',
source='PetBattle',
description="This battle pet can be tamed in the wild all around Durotar.",
keywords={"Critter","Durotar"},
pet=468,
},[[
step
clicknpc Creepy Crawly##62116
|tip Reduce its health below 35% and use the "Trap" ability on your pet bar.
|tip You may need to attempt the trap several times.
Learn the "Creepy Crawly" Battle Pet |learnpet Creepy Crawly##468 |goto Durotar/0 50.72,36.72
step
_Congratulations!_
You Collected the "Creepy Crawly" Battle Pet.
]])
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Crystal Beetle")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Darkmoon Hatchling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Darkmoon Rabbit")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Death's Head Cockroach")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Deepholm Cockroach")
GoatQuest:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Elfin Rabbit",{
patch='50100',
source='PetBattle',
description="This battle pet can be tamed in the wild around Northeast Mount Hyjal.",
keywords={"Critter","Mount","Hyjal"},
pet=479,
},[[
step
clicknpc Elfin Rabbit##62178
|tip Reduce its health below 35% and use the "Trap" ability on your pet bar.
|tip You may need to attempt the trap several times.
Learn the "Elfin Rabbit" Battle Pet |learnpet Elfin Rabbit##479 |goto Mount Hyjal/0 57.66,16.47
step
_Congratulations!_
You Collected the "Elfin Rabbit" Battle Pet.
]])
GoatQuest:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Fawn",{
patch='50100',
source='PetBattle',
description="This battle pet can be tamed in the wild around the Northwest areas of Elwynn Forest.",
keywords={"Critter","Mount","Hyjal"},
pet=447,
},[[
step
clicknpc Fawn##61165
|tip Reduce its health below 35% and use the "Trap" ability on your pet bar.
|tip You may need to attempt the trap several times.
Learn the "Fawn" Battle Pet |learnpet Fawn##447 |goto Elwynn Forest/0 36.76,56.37
step
_Congratulations!_
You Collected the "Fawn" Battle Pet.
]])
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Fire Beetle")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Fire-Proof Roach")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Fjord Rat")
GoatQuest:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Gazelle Fawn",{
patch='50100',
source='PetBattle',
description="This battle pet can be tamed in the wild all around Mulgore.",
keywords={"Critter","Mulgore"},
pet=477,
},[[
step
clicknpc Gazelle Fawn##62176
|tip Reduce its health below 35% and use the "Trap" ability on your pet bar.
|tip You may need to attempt the trap several times.
Learn the "Gazelle Fawn" Battle Pet |learnpet Gazelle Fawn##477 |goto Mulgore/0 47.99,34.84
step
_Congratulations!_
You Collected the "Gazelle Fawn" Battle Pet.
]])
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Giant Sewer Rat")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Gold Beetle")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Golden Pig")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Grasslands Cottontail")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Grizzly Squirrel")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Grotto Vole")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Highlands Mouse")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Highlands Skunk")
GoatQuest:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Irradiated Roach",{
patch='50100',
source='PetBattle',
description="This battle pet can be tamed in the wild around The Toxic Airfield in New Tinkertown.",
keywords={"Critter","New","Tinkertown"},
pet=442,
},[[
step
clicknpc Irradiated Roach##61691
|tip Reduce its health below 35% and use the "Trap" ability on your pet bar.
|tip You may need to attempt the trap several times.
Learn the "Irradiated Roach" Battle Pet |learnpet Irradiated Roach##442 |goto New Tinkertown/0 37.95,51.96
step
_Congratulations!_
You Collected the "Irradiated Roach" Battle Pet.
]])
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Lava Beetle")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Little Fawn")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Locust")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Long-tailed Mole")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Lucky")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Lucky Quilen Cub")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Mountain Cottontail")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Mountain Skunk")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Mouse")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Nether Roach")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Nuts")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Perky Pug")
GoatQuest:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Prairie Dog",{
patch='50100',
source='PetBattle',
description="This battle pet can be tamed in the wild all around the Southern Barrens.",
keywords={"Critter","Southern","Barrens"},
pet=386,
},[[
step
clicknpc Prairie Dog##61141
|tip Reduce its health below 35% and use the "Trap" ability on your pet bar.
|tip You may need to attempt the trap several times.
Learn the "Prairie Dog" Battle Pet |learnpet Prairie Dog##386 |goto Southern Barrens/0 43.84,57.17
step
_Congratulations!_
You Collected the "Prairie Dog" Battle Pet.
]])
GoatQuest:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Rabbit",{
patch='50100',
source='PetBattle',
description="This battle pet can be tamed in the wild around the Northwest parts of Elwynn Forest.",
keywords={"Critter","Elwynn","Forest"},
pet=378,
},[[
step
clicknpc Rabbit##61080
|tip Reduce its health below 35% and use the "Trap" ability on your pet bar.
|tip You may need to attempt the trap several times.
Learn the "Rabbit" Battle Pet |learnpet Rabbit##378 |goto Elwynn Forest/0 41.97,56.77
step
_Congratulations!_
You Collected the "Rabbit" Battle Pet.
]])
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Rat")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Red-Tailed Chipmunk")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Redridge Rat")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Roach")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Rusty Snail")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Sand Scarab")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Scarab Hatchling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Shimmershell Snail")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Silver Pig")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Singing Cricket")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Skunk")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Snowshoe Hare")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Spring Rabbit")
GoatQuest:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Squirrel",{
patch='50100',
source='PetBattle',
description="This battle pet can be tamed in the wild around the Northwest parts of Elwynn Forest.",
keywords={"Critter","Elwynn","Forest"},
pet=379,
},[[
step
clicknpc Squirrel##61081
|tip Reduce its health below 35% and use the "Trap" ability on your pet bar.
|tip You may need to attempt the trap several times.
Learn the "Squirrel" Battle Pet |learnpet Squirrel##379 |goto Elwynn Forest/0 43.66,55.77
step
_Congratulations!_
You Collected the "Squirrel" Battle Pet.
]])
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Stinkbug")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Stinker")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Stone Armadillo")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Stormwind Rat")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Stowaway Rat")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Tainted Cockroach")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Tainted Rat")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Tol'vir Scarab")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Twilight Beetle")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Wharf Rat")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Yellow-Bellied Marmot")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Critter Pets\\Zergling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Dragonkin Pets\\Azure Whelpling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Dragonkin Pets\\Blue Dragonhawk Hatchling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Dragonkin Pets\\Celestial Dragon")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Dragonkin Pets\\Chrominius")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Dragonkin Pets\\Crimson Whelpling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Dragonkin Pets\\Dark Whelpling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Dragonkin Pets\\Death Talon Whelpguard")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Dragonkin Pets\\Emerald Proto-Whelp")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Dragonkin Pets\\Emerald Whelpling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Dragonkin Pets\\Essence of Competition")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Dragonkin Pets\\Infinite Whelpling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Dragonkin Pets\\Lil' Deathwing")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Dragonkin Pets\\Netherwhelp")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Dragonkin Pets\\Nexus Whelpling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Dragonkin Pets\\Onyxian Whelpling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Dragonkin Pets\\Proto-Drake Whelp")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Dragonkin Pets\\Soul of the Aspects")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Dragonkin Pets\\Spawn of Onyxia")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Dragonkin Pets\\Spirit of Competition")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Dragonkin Pets\\Sprite Darter Hatchling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Dragonkin Pets\\Tiny Green Dragon")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Dragonkin Pets\\Tiny Red Dragon")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Dragonkin Pets\\Untamed Hatchling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Elemental Pets\\Amethyst Shale Hatchling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Elemental Pets\\Ashstone Core")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Elemental Pets\\Blossoming Ancient")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Elemental Pets\\Core Hound Pup")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Elemental Pets\\Crimson Geode")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Elemental Pets\\Crimson Lasher")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Elemental Pets\\Crimson Shale Hatchling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Elemental Pets\\Emerald Shale Hatchling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Elemental Pets\\Fel Flame")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Elemental Pets\\Frigid Frostling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Elemental Pets\\Jade Tentacle")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Elemental Pets\\Kirin Tor Familiar")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Elemental Pets\\Lava Crab")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Elemental Pets\\Lil' Ragnaros")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Elemental Pets\\Phoenix Hatchling")
GoatQuest:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Elemental Pets\\Ruby Sapling",{
patch='unknown',
source='unknown',
description="This battle pet can be tamed in the wild all around the Eversong Woods.",
keywords={"Elemental","Eversong","Woods"},
pet=460,
},[[
step
clicknpc Ruby Sapling##62020
|tip They can be found all around Eversong Woods.
|tip Reduce its health below 35% and use the "Trap" ability on your pet bar.
|tip You may need to attempt the trap several times.
Learn the "Ruby Sapling" Battle Pet |learnpet Ruby Sapling##460 |goto Eversong Woods/0 64.81,60.42
step
_Congratulations!_
You Collected the "Ruby Sapling" Battle Pet.
]])
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Elemental Pets\\Singing Sunflower")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Elemental Pets\\Sinister Squashling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Elemental Pets\\Spirit of Summer")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Elemental Pets\\Tiny Bog Beast")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Elemental Pets\\Tiny Shale Spider")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Elemental Pets\\Tiny Twister")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Elemental Pets\\Topaz Shale Hatchling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Elemental Pets\\Venus")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Elemental Pets\\Water Waveling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Ancona Chicken")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Bat")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Brilliant Kaliri")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Cenarion Hatchling")
GoatQuest:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Chicken",{
patch='unknown',
source='unknown',
description="This battle pet can be tamed in the wild around Eastvale Logging Camp in Elwynn Forest.",
keywords={"Flying","Elwynn","Forest"},
pet=646,
},[[
step
clicknpc Chicken##62664
|tip Reduce its health below 35% and use the "Trap" ability on your pet bar.
|tip You may need to attempt the trap several times.
Learn the "Chicken" Battle Pet |learnpet Chicken##646 |goto Elwynn Forest/0 78.21,66.55
step
_Congratulations!_
You Collected the "Chicken" Battle Pet.
]])
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Cockatiel")
GoatQuest:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Crested Owl",{
patch='unknown',
source='unknown',
description="This battle pet can be tamed in the wild all around Teldrassil.",
keywords={"Flying","Teldrassil"},
pet=507,
},[[
step
talk Zidormi##141489
Select _"Can you show me what Darkshore was like before the battle?"_
Travel to the past |complete GQ.InPhase("Old Darnassus") |goto Darkshore/0 48.86,24.46
step
clicknpc Crested Owl##62242
|tip Reduce its health below 35% and use the "Trap" ability on your pet bar.
|tip You may need to attempt the trap several times.
Learn the "Crested Owl" Battle Pet |learnpet Crested Owl##507 |goto Teldrassil/0 52.69,58.06
step
_Congratulations!_
You Collected the "Crested Owl" Battle Pet.
]])
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Crimson Moth")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Crow")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Darkmoon Glowfly")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Dragon Kite")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Dragonbone Hatchling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Firefly")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Fledgling Buzzard")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Fledgling Nether Ray")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Forest Moth")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Fungal Moth")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Green Wing Macaw")
GoatQuest:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Grey Moth",{
patch='unknown',
source='unknown',
description="This battle pet can be tamed in the wild all around Azuremyst Isle.",
keywords={"Flying","Azuremyst","Isle"},
pet=464,
},[[
step
clicknpc Grey Moth##62050
|tip Reduce its health below 35% and use the "Trap" ability on your pet bar.
|tip You may need to attempt the trap several times.
Learn the "Grey Moth" Battle Pet |learnpet Grey Moth##464 |goto Azuremyst Isle/0 44.34,31.29
step
_Congratulations!_
You Collected the "Grey Moth" Battle Pet.
]])
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Gryphon Hatchling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Guardian Cub")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Highlands Turkey")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Hippogryph Hatchling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Horde Balloon")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Hyacinth Macaw")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Imperial Eagle Chick")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Miniwing")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Nether Faerie Dragon")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Nether Ray Fry")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Oasis Moth")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Parrot")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Polly")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Red Moth")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Sea Gull")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Senegal")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Silky Moth")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Snowy Owl")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Swamp Moth")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Tainted Moth")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Tickbird Hatchling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Tiny Sporebat")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Turkey")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Tuskarr Kite")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\White Tickbird Hatchling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Flying Pets\\Wildhammer Gryphon Hatchling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Humanoid Pets\\Anubisath Idol")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Humanoid Pets\\Corefire Imp")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Humanoid Pets\\Curious Wolvar Pup")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Humanoid Pets\\Deathy")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Humanoid Pets\\Feral Vermling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Humanoid Pets\\Flayer Youngling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Humanoid Pets\\Gregarious Grell")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Humanoid Pets\\Grunty")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Humanoid Pets\\Gurky")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Humanoid Pets\\Harbinger of Flame")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Humanoid Pets\\Harpy Youngling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Humanoid Pets\\Hopling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Humanoid Pets\\Kun-Lai Runt")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Humanoid Pets\\Lurky")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Humanoid Pets\\Mini Tyrael")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Humanoid Pets\\Murkablo")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Humanoid Pets\\Murkalot")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Humanoid Pets\\Murkimus the Gladiator")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Humanoid Pets\\Murki")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Humanoid Pets\\Murky")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Humanoid Pets\\Pandaren Monk")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Humanoid Pets\\Qiraji Guardling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Humanoid Pets\\Sporeling Sprout")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Humanoid Pets\\Stunted Yeti")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Magic Pets\\Arcane Eye")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Magic Pets\\Darkmoon Eye")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Magic Pets\\Disgusting Oozeling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Magic Pets\\Ethereal Soul-Trader")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Magic Pets\\Jade Oozeling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Magic Pets\\Jade Tiger")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Magic Pets\\Lofty Libram")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Magic Pets\\Mana Wyrmling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Magic Pets\\Minfernal")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Magic Pets\\Mini Diablo")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Magic Pets\\Mini Mindslayer")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Magic Pets\\Nordrassil Wisp")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Magic Pets\\Oily Slimeling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Magic Pets\\Onyx Panther")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Magic Pets\\Spectral Tiger Cub")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Magic Pets\\Toxic Wasteling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Magic Pets\\Twilight Fiendling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Magic Pets\\Viscidus Globule")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Magic Pets\\Zipao Tiger")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Mechanical Pets\\Anodized Robo Cub")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Mechanical Pets\\Blue Clockwork Rocket Bot")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Mechanical Pets\\Cogblade Raptor")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Mechanical Pets\\Darkmoon Tonk")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Mechanical Pets\\Darkmoon Zeppelin")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Mechanical Pets\\De-Weaponized Mechanical Companion")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Mechanical Pets\\Fluxfire Feline")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Mechanical Pets\\Landro's Lil' XT")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Mechanical Pets\\Lil' XT")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Mechanical Pets\\Lifelike Toad")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Mechanical Pets\\Lil' Smoky")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Mechanical Pets\\Mechanical Chicken")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Mechanical Pets\\Mechanical Pandaren Dragonling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Mechanical Pets\\Mechanical Squirrel")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Mechanical Pets\\Mini Thor")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Mechanical Pets\\Personal World Destroyer")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Mechanical Pets\\Pet Bombling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Mechanical Pets\\Rabid Nut Varmint 5000")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Mechanical Pets\\Robo-Chick")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Mechanical Pets\\Rocket Chicken")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Mechanical Pets\\Tiny Harvester")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Mechanical Pets\\Tranquil Mechanical Yeti")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Mechanical Pets\\Warbot")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Undead Pets\\Blighted Squirrel")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Undead Pets\\Blighthawk")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Undead Pets\\Eye of the Legion")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Undead Pets\\Fetish Shaman")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Undead Pets\\Frosty")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Undead Pets\\Fungal Abomination")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Undead Pets\\Ghostly Skull")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Undead Pets\\Giant Bone Spider")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Undead Pets\\Infected Fawn")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Undead Pets\\Infected Squirrel")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Undead Pets\\Infested Bear Cub")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Undead Pets\\Landro's Lichling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Undead Pets\\Lil' K.T.")
GoatQuest:RegisterGuide("Pets & Mounts Guides\\Battle Pets\\Undead Pets\\Lost of Lordaeron",{
patch='unknown',
source='unknown',
description="This battle pet can be tamed in the wild around the Ruins of Lordaeron in Tirisfal Glades.",
keywords={"Undead","Tirisfal","Glades"},
pet=458,
},[[
step
talk Hero's Herald##49748
accept Battle for Azeroth: Tides of War##46727 |goto Stormwind City/0 62.17,30.14
|tip This quest is required to unlock access to Zidormi in Tirisfal Glades.
|only if Alliance
step
Watch the dialogue
|tip Inside the building.
Attend the War Council |q 46727/1 |goto Stormwind City/0 80.27,33.13
|only if Alliance
step
click Vision of Sailor's Memory
|tip Inside the building.
Witness the Vision of the Sailor's Memory |q 46727/2 |goto Stormwind City/0 80.48,33.50
|only if Alliance
step
talk Anduin Wrynn##120756
|tip Inside the building.
turnin Battle for Azeroth: Tides of War##46727 |goto Stormwind City/0 80.26,33.13
|only if Alliance
step
talk Warchief's Herald##49750
accept Battle for Azeroth: Mission Statement##51443 |goto Orgrimmar/1 49.39,76.57
|only if Horde
step
Speak to Warchief Sylvanas Windrunner in Orgrimmar |q 51443/1 |goto Orgrimmar/1 48.61,71.98
|tip Inside the building.
|only if Horde
step
Watch the dialogue
|tip Inside the building.
Meet Your Team |q 51443/2 |goto Orgrimmar/1 54.44,78.43
|only if Horde
step
talk Nathanos Blightcaller##135205
|tip Inside the building.
turnin Battle for Azeroth: Mission Statement##51443 |goto Orgrimmar/1 54.44,78.43
|only if Horde
step
talk Zidormi##141488
Select _"Can you show me what Tirisfal Glades was like before the Battle for Lordaeron?"_
Travel to the past |complete GQ.InPhase("Old Tirisfal Glades") |goto Tirisfal Glades/0 69.45,62.81
step
clicknpc Lost of Lordaeron##61905
|tip Reduce its health below 35% and use the "Trap" ability on your pet bar.
|tip You may need to attempt the trap several times.
Learn the "Lost of Lordaeron" Battle Pet |learnpet Lost of Lordaeron##458 |goto Tirisfal Glades/0 58.97,63.95
step
_Congratulations!_
You Collected the "Lost of Lordaeron" Battle Pet.
]])
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Undead Pets\\Mr. Bigglesworth")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Undead Pets\\Restless Shadeling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Undead Pets\\Scourged Whelpling")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Undead Pets\\Spirit Crab")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Undead Pets\\Stitched Pup")
GoatQuest:RegisterGuidePlaceholder("Pets & Mounts Guides\\Battle Pets\\Undead Pets\\Vampiric Batling")
