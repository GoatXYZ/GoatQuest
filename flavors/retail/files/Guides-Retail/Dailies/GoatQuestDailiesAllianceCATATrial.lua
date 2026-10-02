local GoatQuest=GoatQuest
if not GoatQuest then return end
if UnitFactionGroup("player")~="Alliance" then return end
if GQ:DoMutex("DailiesACATA") then return end
GoatQuest.GuideMenuTier = "TRI"
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Classic Dailies\\Darnassus\\Darnassus Fishing Dailies")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Classic Dailies\\Ironforge\\Ironforge Fishing Dailies")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Classic Dailies\\Stormwind City\\Main City Cooking Dailies")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Classic Dailies\\Stormwind City\\Stormwind City Fishing Dailies")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Classic Dailies\\Stormwind City\\Stormwind City Jewelcrafting Dailies")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Burning Crusade Dailies\\Netherwing\\Netherwing Daily Quests")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Burning Crusade Dailies\\Netherwing\\Netherwing Eggs")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Burning Crusade Dailies\\Shattrath Cooking Dailies")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Burning Crusade Dailies\\Shattered Sun Offensive\\Dailies")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Wrath of the Lich King Dailies\\Borean Tundra\\Coldarra Dailies")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Wrath of the Lich King Dailies\\Borean Tundra\\Kaskala Dailies")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Wrath of the Lich King Dailies\\Dalaran\\Dalaran Cooking Dailies")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Wrath of the Lich King Dailies\\Dalaran\\Dalaran Fishing Dailies")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Wrath of the Lich King Dailies\\Dalaran\\Jewelcrafting Dailies")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Wrath of the Lich King Dailies\\Dragonblight\\Wyrmrest Accord Dailies with Pre-Quests")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Wrath of the Lich King Dailies\\Dragonblight\\Moa'ki Harbor Dailies")
GoatQuest:RegisterGuide("Daily Guides\\Wrath of the Lich King Dailies\\Grizzly Hills\\Blackriver Logging Camp Dailies",{
description="This guide section will walk you through completing the daily quest in the Blackriver Logging Camp region of Grizzly Hills. There are no pre-quests needed to unlock the daily quest offered in this guide section.",
},[[
step
Routing to the proper section |next |only if default
Routing to the porper section |next "dailies" |only if completedq(12029)
step
talk Samir##26424
accept Filling the Cages##11984 |goto Grizzly Hills,16.20,47.60
step
talk Budd##26429
Tell him it's time to play with the ice trolls |havebuff Budd's Attention Span##47014 |q 11984 |goto Grizzly Hills 16.40,48.30
step
Use Budd's pet bar skill Tag Troll to have him stun a troll|petaction Tag Troll
Use your Bounty Hunter's Cage on the stunned troll |use Bounty Hunter's Cage##35736
Capture a Live Ice Troll |q 11984/1 |goto Grizzly Hills 13.20,60.50
step
talk Samir##26424
turnin Filling the Cages##11984 |goto Grizzly Hills 16.20,47.60
step
talk Drakuru##26423
accept Truce?##11989 |goto Grizzly Hills 16.40,47.80
step
Click the Dull Carving Knife
|tip It's a knife stuck in the side of this tree trunk.
collect 1 Dull Carving Knife##38083 |q 11989 |goto Grizzly Hills 16.50,47.80
step
Use your Dull Carving Knife next to the yellow cage|use Dull Carving Knife##38083
talk Drakuru##26423
_Shake his hand_
Make a Blood Pact With Drakuru |q 11989/1 |goto Grizzly Hills 16.40,47.80
step
talk Drakuru##26423
turnin Truce?##11989 |goto Grizzly Hills 16.40,47.80
accept Vial of Visions##11990 |goto Grizzly Hills 16.40,47.80
step
talk Ameenah##26474
buy 1 Crystal Vial##3371 |q 11990/1 |goto Grizzly Hills 16,47.80
step
Click the Hazewood Bushes
|tip They look like small flower bushes on the ground around this area.
collect 3 Haze Leaf##37085 |q 11990/2 |goto Grizzly Hills 14.60,45.30
step
Click a Waterweed
|tip They look like big green bushes underwater around this area.
collect Waterweed Frond##35795 |q 11990/3 |goto Grizzly Hills 15.20,40.30
step
talk Drakuru##26423
turnin Vial of Visions##11990 |goto Grizzly Hills 16.40,47.80
step
talk Prigmon##26519
accept Scourgekabob##12484 |goto Grizzly Hills 15.70,46.70
step
Click a Scourged Troll Mummy on the ground next to you
collect 1 Scourged Troll Mummy##38149 |q 12484 |goto Grizzly Hills 15.70,46.90
step
Use your Scourged Troll Mummy next to the burning pile of mummies|use Scourged Troll Mummy##38149
Burn a Mummified Carcass |q 12484/1 |goto Grizzly Hills 16.90,48.30
step
talk Mack Fearsen##26604
turnin Scourgekabob##12484 |goto Grizzly Hills 16.70,48.30
accept Seared Scourge##12029 |goto Grizzly Hills 16.70,48.30
step
Jump on the big rock and stand on it
Use Mack's Dark Grog and throw it at the trolls running around to the north|use Mack's Dark Grog##35908
Burn 20 Scourge Trolls |q 12029/1 |goto Grizzly Hills 16,29.90
step
talk Mack Fearsen##26604
turnin Seared Scourge##12029 |goto Grizzly Hills 16.70,48.30
step
label "dailies"
talk Scout Captain Carter##27783
accept Blackriver Skirmish##12444 |goto Grizzly Hills,30.00,59.80
step
Kill Horde Players or Conquest Hold Raiders in the Blackriver Logging Camp
Kill 10 Horde in Blackriver |q 12444/1 |goto Grizzly Hills 28.30,63.40
step
talk Scout Captain Carter##27783
turnin Blackriver Skirmish##12444 |goto Grizzly Hills 30.00,59.80
step
You have finished this Dailies Guide. Click here to return to the beginning of the Dailies |confirm
|next "dailies"
]])
GoatQuest:RegisterGuide("Daily Guides\\Wrath of the Lich King Dailies\\Grizzly Hills\\Blue Sky Logging Grounds Dailies",{
description="This guide section will walk you through completing the daily quests in the Blue Sky Logging Grounds region of Grizzly Hills. There are no pre-quests needed to unlock the daily quests offered in this guide section.",
},[[
step
Routing to the proper section |next |only if default
Routing to the porper section |next "dailies" |only if completedq(12029)
step
talk Samir##26424
accept Filling the Cages##11984 |goto Grizzly Hills,16.20,47.60
step
talk Budd##26429
Tell him it's time to play with the ice trolls |havebuff Budd's Attention Span##47014 |q 11984 |goto Grizzly Hills 16.40,48.30
step
Use Budd's pet bar skill Tag Troll to have him stun a troll |petaction Tag Troll
Use your Bounty Hunter's Cage on the stunned troll |use Bounty Hunter's Cage##35736
Capture a Live Ice Troll |q 11984/1 |goto Grizzly Hills 13.20,60.50
step
talk Samir##26424
turnin Filling the Cages##11984 |goto Grizzly Hills 16.20,47.60
step
talk Drakuru##26423
accept Truce?##11989 |goto Grizzly Hills 16.40,47.80
step
Click the Dull Carving Knife
|tip It's a knife stuck in the side of this tree trunk.
collect 1 Dull Carving Knife##38083 |q 11989 |goto Grizzly Hills 16.50,47.80
step
Use your Dull Carving Knife next to the yellow cage |use Dull Carving Knife##38083
talk Drakuru##26423
_Shake his hand_
Make a Blood Pact With Drakuru |q 11989/1 |goto Grizzly Hills 16.40,47.80
step
talk Drakuru##26423
turnin Truce?##11989
accept Vial of Visions##11990 |goto Grizzly Hills 16.40,47.80
step
talk Ameenah##26474
buy 1 Imbued Vial |q 11990/1 |goto Grizzly Hills 16,47.80
step
Click the Hazewood Bushes
|tip They look like small flower bushes on the ground around this area.
collect 3 Haze Leaf##37085 |q 11990/2 |goto Grizzly Hills 14.60,45.30
step
Click a Waterweed
|tip They look like big green bushes underwater around this area.
collect Waterweed Frond##35795 |q 11990/3 |goto Grizzly Hills 15.20,40.30
step
talk Drakuru##26423
turnin Vial of Visions##11990 |goto Grizzly Hills 16.40,47.80
step
talk Prigmon##26519
accept Scourgekabob##12484 |goto Grizzly Hills 15.70,46.70
step
Click a Scourged Troll Mummy on the ground next to you
collect 1 Scourged Troll Mummy##38149 |q 12484 |goto Grizzly Hills 15.70,46.90
step
Use your Scourged Troll Mummy next to the burning pile of mummies |use Scourged Troll Mummy##38149
Burn a Mummified Carcass |q 12484/1 |goto Grizzly Hills 16.90,48.30
step
talk Mack Fearsen##26604
turnin Scourgekabob##12484 |goto Grizzly Hills 16.70,48.30
accept Seared Scourge##12029 |goto Grizzly Hills 16.70,48.30
step
Jump on the big rock and stand on it
Use Mack's Dark Grog and throw it at the trolls running around to the north |use Mack's Dark Grog##35908
Burn 20 Scourge Trolls |q 12029/1 |goto Grizzly Hills 16,29.90
step
talk Mack Fearsen##26604
turnin Seared Scourge##12029 |goto Grizzly Hills 16.70,48.30
step
label "dailies"
talk Sergeant Hartsman##27468
accept Kick 'Em While They're Down##12289 |goto Grizzly Hills,39.30,43.90
step
talk Synipus##27371
accept Shredder Repair##12244 |goto Grizzly Hills 39.50,43.60
step
talk Pipthwack##27416
accept Pieces Parts##12268 |goto Grizzly Hills 39.60,43.40
step
talk Rheanna##27484
accept Life or Death##12296 |goto Grizzly Hills 40.50,42.70
step
Use Renewing Bandages on Wounded Wesfall Infantry |use Renewing Bandage##37576
Heal 10 Westfall Infantry |q 12296/1 |goto Grizzly Hills 34.90,39.80
Click Grooved Cogs, Notched Sprockets, and High Tension Springs on the ground of the Blue Sky Logging Grounds
collect 4 Grooved Cogs##37412 |q 12268/1 |goto Grizzly Hills 34.90,39.80
collect 3 Notched Sprockets##37413 |q 12268/2 |goto Grizzly Hills 34.90,39.80
collect 2 High Tension Springs##37416 |q 12268/3 |goto Grizzly Hills 34.90,39.80
step
Kill Horde Players or Wounded Skirmishers in the area
Eliminate 15 Horde units |q 12289/1 |goto Grizzly Hills 33.40,35.70
step
Find the Broken-down Shredder that spawns. Blizzards quest helper will mark it on your map for you.
Click the Broken-down Shredder to get inside it
Use your abilities on your hot bar to return the shredder to Synipus |goto Grizzly Hills,39.50,43.60
Deliver 3 Shredders |q 12244/1 |goto Grizzly Hills 34.90,39.80
step
talk Sergeant Hartsman##27468
turnin Kick 'Em While They're Down##12289 |goto Grizzly Hills 39.30,43.90
step
talk Synipus##27371
turnin Shredder Repair##12244 |goto Grizzly Hills 39.50,43.60
step
talk Pipthwack##27416
turnin Pieces Parts##12268 |goto Grizzly Hills 39.60,43.40
step
talk Rheanna##27484
turnin Life or Death##12296 |goto Grizzly Hills 40.50,42.70
step
You have finished this Dailies Guide. Click here to return to the beginning of the Dailies |confirm
|next "dailies"
]])
GoatQuest:RegisterGuide("Daily Guides\\Wrath of the Lich King Dailies\\Grizzly Hills\\Granite Springs Dailies",{
description="This guide section will walk you through completing the daily quest in the Granite Springs region of Grizzly Hills.",
},[[
step
Routing to the proper section |next |only if default
Routing to the porper section |next "dailies" |only if completedq(12029)
step
talk Samir##26424
accept Filling the Cages##11984 |goto Grizzly Hills,16.20,47.60
step
talk Budd##26429
Tell him it's time to play with the ice trolls |havebuff Budd's Attention Span##47014 |q 11984 |goto Grizzly Hills 16.40,48.30
step
Use Budd's pet bar skill Tag Troll to have him stun a troll |petaction Tag Troll
Use your Bounty Hunter's Cage on the stunned troll |use Bounty Hunter's Cage##35736
Capture a Live Ice Troll |q 11984/1 |goto Grizzly Hills 13.20,60.50
step
talk Samir##26424
turnin Filling the Cages##11984 |goto Grizzly Hills 16.20,47.60
step
talk Drakuru##26423
accept Truce?##11989 |goto Grizzly Hills 16.40,47.80
step
Click the Dull Carving Knife
|tip It's a knife stuck in the side of this tree trunk.
collect 1 Dull Carving Knife##38083 |q 11989 |goto Grizzly Hills 16.50,47.80
step
Use your Dull Carving Knife next to the yellow cage |use Dull Carving Knife##38083
talk Drakuru##26423
_Shake his hand_
Make a Blood Pact With Drakuru |q 11989/1 |goto Grizzly Hills 16.40,47.80
step
talk Drakuru##26423
turnin Truce?##11989
accept Vial of Visions##11990 |goto Grizzly Hills 16.40,47.80
step
talk Ameenah##26474
buy 1 Imbued Vial |q 11990/1 |goto Grizzly Hills 16,47.80
step
Click the Hazewood Bushes
|tip They look like small flower bushes on the ground around this area.
collect 3 Haze Leaf##37085|q 11990/2 |goto Grizzly Hills 14.60,45.30
step
Click a Waterweed
|tip They look like big green bushes underwater around this area.
collect Waterweed Frond##35795 |q 11990/3 |goto Grizzly Hills 15.20,40.30
step
talk Drakuru##26423
turnin Vial of Visions##11990 |goto Grizzly Hills 16.40,47.80
step
talk Prigmon##26519
accept Scourgekabob##12484 |goto Grizzly Hills 15.70,46.70
step
Click a Scourged Troll Mummy on the ground next to you
collect 1 Scourged Troll Mummy##38149 |q 12484 |goto Grizzly Hills 15.70,46.90
step
Use your Scourged Troll Mummy next to the burning pile of mummies |use Scourged Troll Mummy##38149
Burn a Mummified Carcass |q 12484/1 |goto Grizzly Hills 16.90,48.30
step
talk Mack Fearsen##26604
turnin Scourgekabob##12484 |goto Grizzly Hills 16.70,48.30
accept Seared Scourge##12029 |goto Grizzly Hills 16.70,48.30
step
Jump on the big rock and stand on it
Use Mack's Dark Grog and throw it at the trolls running around to the north |use Mack's Dark Grog##35908
Burn 20 Scourge Trolls |q 12029/1 |goto Grizzly Hills 16,29.90
step
talk Mack Fearsen##26604
turnin Seared Scourge##12029 |goto Grizzly Hills 16.70,48.30
step
label "dailies"
talk Mack Fearsen##26604
accept Seared Scourge##12038 |goto Grizzly Hills,16.70,48.30
step
Jump on the big rock and stand on it
Use Mack's Dark Grog and throw it at the trolls running around to the north |use Mack's Dark Grog##35908
Burn 30 Scourge Trolls |q 12038/1 |goto Grizzly Hills 16,29.90
step
talk Mack Fearsen##26604
turnin Seared Scourge##12038 |goto Grizzly Hills,16.70,48.30
step
You have finished this Dailies Guide. Click here to return to the beginning of the Dailies |confirm
|next "dailies"
]])
GoatQuest:RegisterGuide("Daily Guides\\Wrath of the Lich King Dailies\\Grizzly Hills\\Venture Bay Dailies",{
description="This guide section will walk you through completing the daily quests in the Venture Bay region of Grizzly Hills. There are no pre-quests needed to unlock the daily quests offered in this guide section.",
},[[
step
Routing to the proper section |next |only if default
Routing to the porper section |next "dailies" |only if completedq(12029)
step
talk Samir##26424
accept Filling the Cages##11984 |goto Grizzly Hills,16.20,47.60
step
talk Budd##26429
Tell him it's time to play with the ice trolls |havebuff Budd's Attention Span##47014 |q 11984 |goto Grizzly Hills 16.40,48.30
step
Use Budd's pet bar skill Tag Troll to have him stun a troll |petaction Tag Troll
Use your Bounty Hunter's Cage on the stunned troll |use Bounty Hunter's Cage##35736
Capture a Live Ice Troll |q 11984/1 |goto Grizzly Hills 13.20,60.50
step
talk Samir##26424
turnin Filling the Cages##11984 |goto Grizzly Hills 16.20,47.60
step
talk Drakuru##26423
accept Truce?##11989 |goto Grizzly Hills 16.40,47.80
step
Click the Dull Carving Knife
|tip It's a knife stuck in the side of this tree trunk.
collect 1 Dull Carving Knife##38083 |q 11989 |goto Grizzly Hills 16.50,47.80
step
Use your Dull Carving Knife next to the yellow cage |use Dull Carving Knife##38083
talk Drakuru##26423
Shake his hand
Make a Blood Pact With Drakuru |q 11989/1 |goto Grizzly Hills 16.40,47.80
step
talk Drakuru##26423
turnin Truce?##11989 |goto Grizzly Hills 16.40,47.80
accept Vial of Visions##11990 |goto Grizzly Hills 16.40,47.80
step
talk Ameenah##26474
buy 1 Imbued Vial |q 11990/1 |goto Grizzly Hills 16,47.80
step
Click the Hazewood Bushes
|tip They look like small flower bushes on the ground around this area.
collect 3 Haze Leaf##37085 |q 11990/2 |goto Grizzly Hills 14.60,45.30
step
Click a Waterweed
|tip They look like big green bushes underwater around this area.
collect Waterweed Frond##35795 |q 11990/3 |goto Grizzly Hills 15.20,40.30
step
talk Drakuru##26423
turnin Vial of Visions##11990 |goto Grizzly Hills 16.40,47.80
step
talk Prigmon##26519
accept Scourgekabob##12484 |goto Grizzly Hills 15.70,46.70
step
Click a Scourged Troll Mummy on the ground next to you
collect 1 Scourged Troll Mummy##38149 |q 12484 |goto Grizzly Hills 15.70,46.90
step
Use your Scourged Troll Mummy next to the burning pile of mummies |use Scourged Troll Mummy##38149
Burn a Mummified Carcass |q 12484/1 |goto Grizzly Hills 16.90,48.30
step
talk Mack Fearsen##26604
turnin Scourgekabob##12484 |goto Grizzly Hills 16.70,48.30
accept Seared Scourge##12029 |goto Grizzly Hills 16.70,48.30
step
Jump on the big rock and stand on it
Use Mack's Dark Grog and throw it at the trolls running around to the north |use Mack's Dark Grog##35908
Burn 20 Scourge Trolls |q 12029/1 |goto Grizzly Hills 16,29.90
step
talk Mack Fearsen##26604
turnin Seared Scourge##12029 |goto Grizzly Hills 16.70,48.30
step
label "dailies"
talk Commander Howser##27759
accept Riding the Red Rocket##12437 |goto Grizzly Hills,14.80,86.60
If he's not there, then you have to take control of Venture Bay for the Alliance
To take control of Venture Bay for the Alliance, go to 15.10,88.00 |tip Hide behind the lighthouse in between the 2 big brown rocks. Flag yourself for PvP and a bar will appear under your minimap. Sit here until the bar marker is all the way to the left, this will make Commander Howser spawn.
step
talk Sergeant Downey##27602
accept Smoke 'Em Out##12323 |goto Grizzly Hills 22.10,81.20
step
talk Lieutenant Stuart##27562
accept Keep Them at Bay!##12316 |goto Grizzly Hills 22.10,81.20
step
talk Baron Freeman##27520
accept Down With Captain Zorna##12314 |goto Grizzly Hills 22.20,81.20
step
Toss the Smoke Bomb into the buildings to smoke out Venture Co. Stragglers |use Smoke Bomb##37621
Building one can be found at [18.00,79.60]
Building two can be found at [16.40,76.60]
Building three can be found at [14.60,76.70]
Smoke out 20 Venture Company Stragglers |q 12323/1 |goto Grizzly Hills 18.00,79.60
step
Kill Horde Players or Conquest Hold Berserker in Venture Bay
Kill 10 Horde in Venture Bay |q 12316/1 |goto Grizzly Hills 19.90,76.40
step
kill Captain Zorna##27511|q 12314/1 |goto Grizzly Hills 13.30,80.20
step
Click the Element 115 in the back room of the ship
|tip It looks like a red canister with a handle on the top
collect Element 115##37664 |q 12437 |goto Grizzly Hills 16.40,80.30
step
On the next step you will guide a rocket into this Horde Lumberboat
Your target will be the wooden X on the back
Go to 13.60,88.90 |goto Grizzly Hills 13.60,88.90,0.50
You will want to use your keys, not your mouse, to guide the rocket
Avoid icebergs or the rocket will explode and you will have to start over
Click a red rocket to take control of one |invehicle |c |q 12437 |goto Grizzly Hills 9.60,79.20
step
Hit the wooden X on the back of the Horde Lumberboat
Destroy the Horde Lumberboat |q 12437/1 |goto Grizzly Hills 9.60,79.10
step
talk Commander Howser##27759
turnin Riding the Red Rocket##12437 |goto Grizzly Hills 14.80,86.60
step
talk Lieutenant Stuart##27562
turnin Keep Them at Bay!##12316 |goto Grizzly Hills 22.10,81.20
step
talk Baron Freeman##27520
turnin Down With Captain Zorna##12314 |goto Grizzly Hills 22.10,81.20
step
talk Sergeant Downey##27602
turnin Smoke 'Em Out##12323 |goto Grizzly Hills 22.10,81.20
step
You have finished this Dailies Guide. Click here to return to the beginning of the Dailies |confirm
|next "dailies"
]])
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Wrath of the Lich King Dailies\\Howling Fjord\\Steel Gate Dailies")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Wrath of the Lich King Dailies\\Howling Fjord\\Kamagua Dailies")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Wrath of the Lich King Dailies\\Howling Fjord\\Westguard Keep Dailies")
GQ.BETASTART()
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Wrath of the Lich King Dailies\\Argent Tournament Grounds\\Aspirant Rank Dailies")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Wrath of the Lich King Dailies\\Argent Tournament Grounds\\Valiant Rank Dailies")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Wrath of the Lich King Dailies\\Argent Tournament Grounds\\Valiant Rank Dailies")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Wrath of the Lich King Dailies\\Argent Tournament Grounds\\Valiant Rank Dailies")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Wrath of the Lich King Dailies\\Argent Tournament Grounds\\Valiant Rank Dailies")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Wrath of the Lich King Dailies\\Argent Tournament Grounds\\Valiant Rank Dailies")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Wrath of the Lich King Dailies\\Argent Tournament Grounds\\Champion of Stormwind")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Wrath of the Lich King Dailies\\Argent Tournament Grounds\\Champion of Darnassus")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Wrath of the Lich King Dailies\\Argent Tournament Grounds\\Champion of Ironforge")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Wrath of the Lich King Dailies\\Argent Tournament Grounds\\Champion of Gnomeregan")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Wrath of the Lich King Dailies\\Argent Tournament Grounds\\Champion of The Exodar")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Wrath of the Lich King Dailies\\Argent Tournament Grounds\\Black Knight Questline")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Wrath of the Lich King Dailies\\Argent Tournament Grounds\\Crusader Dailies")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Wrath of the Lich King Dailies\\Argent Tournament Grounds\\Champion Rank Dailies")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Wrath of the Lich King Dailies\\Argent Tournament Grounds\\Champion Rank Dailies")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Wrath of the Lich King Dailies\\The Oracles/Frenzyheart Dailies\\The Oracles Dailies")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Wrath of the Lich King Dailies\\The Oracles/Frenzyheart Dailies\\Frenzyheart Tribe Dailies")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Wrath of the Lich King Dailies\\The Sons of Hodir\\The Sons of Hodir Dailies")
GQ.BETAEND()
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Wrath of the Lich King Dailies\\Icecrown\\Ymirheim and The Valley of Lost Hope")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Wrath of the Lich King Dailies\\Icecrown\\Shadowvault Dailies")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Wrath of the Lich King Dailies\\Icecrown\\Death's Rise Dailies")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Wrath of the Lich King Dailies\\The Storm Peaks\\Dun Niffelem (The Sons of Hodir) Pre-quest and Dailies")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Wrath of the Lich King Dailies\\The Storm Peaks\\Brunnhildar, K-3 and Frosthold Dailies")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Wrath of the Lich King Dailies\\Zul'Drak\\The Argent Stand Dailies and Pre-Quests")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Cataclysm Dailies\\Deepholm\\Therazane's Throne Dailies, plus Pre-Quests")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Cataclysm Dailies\\Uldum Dailies with Pre-Quests")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Cataclysm Dailies\\Twilight Highlands\\Twilight Highlands Dailies with Pre-Quests")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Cataclysm Dailies\\Tol Barad Peninsula\\Tol Barad Dailies")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Cataclysm Dailies\\Reputation\\Guardians of Hyjal")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Cataclysm Dailies\\Reputation\\The Earthen Ring")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Cataclysm Dailies\\Reputation\\Therazane")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Cataclysm Dailies\\Reputation\\Ramkahen")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Cataclysm Dailies\\Reputation\\Wildhammer Clan")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Cataclysm Dailies\\Reputation\\Baradin's Wardens")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Cataclysm Dailies\\Zandalari Menace Quest Line")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Cataclysm Dailies\\Mount Hyjal\\How To Use Firelands Guide Sections - READ FIRST")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Cataclysm Dailies\\Mount Hyjal\\Firelands Dailies with Pre-Quests")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Cataclysm Dailies\\Mount Hyjal\\The Call of the World-Shaman Quest Line")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Cooking\\Dalaran Cooking Daily Guide")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Cooking\\Shattrath Cooking Daily Guide")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Cooking\\Stormwind Cooking Daily Guide")
GoatQuest:RegisterGuidePlaceholder("Profession Guides\\Jewelcrafting\\Daily Guides\\Jewelcrafting Daily Guide")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Midsummer Fire Festival\\Midsummer Fire Festival Achievements\\Fires of Azeroth\\Extinguishing Draenor")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Midsummer Fire Festival\\Midsummer Fire Festival Achievements\\Fires of Azeroth\\Extinguishing the Broken Isles")
