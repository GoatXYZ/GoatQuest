local GoatQuest=GoatQuest
if not GoatQuest then return end
if UnitFactionGroup("player")~="Horde" then return end
if GQ:DoMutex("DailiesHMOP") then return end
GoatQuest.GuideMenuTier = "TRI"
GoatQuest:RegisterGuide("Daily Guides\\Mists of Pandaria Dailies\\The Anglers Dailies",{
startlevel=15,
description="This guide will take you through The Anglers dailies Becoming Exalted with The Anglers allows you to purchase a companion pet, fishing poles, and water mounts.",
},[[
step
You must have fishing in order to accept dailies from this faction
confirm
step
label "dailies"
There will only be three dailies available from the following questgivers
|tip It is possible for one questgiver to give you two quests in the same day, but it is unlikely.
confirm
step
talk Fisherman Haito##59584
accept Shocking!##30584 |goto Krasarang Wilds 67.90,45.20 |or
accept Jagged Abalone##30586 |goto Krasarang Wilds 67.90,45.20  |or
If these quests are unavailable today, click here |confirm
step
talk Angler Shen##59586
accept Snapclaw##30700 |goto Krasarang Wilds 67.50,43.50 |or
accept Fishing for a Bruising##30588 |goto Krasarang Wilds 67.50,43.50 |or
If these quests are unavailable today, click here |confirm
step
talk John "Big Hook" Marsock##60674
accept Bright Bait##30754 |goto Krasarang Wilds 68.30,43.50 |or
accept Jumping the Shark##30753 |goto Krasarang Wilds 68.30,43.50 |or
If these quests are unavailable today, click here |confirm
step
talk Trawler Yotimo##60135
accept Armored Carp##30613 |goto Krasarang Wilds 67.60,42.50 |or
accept Huff & Puff##30658 |goto Krasarang Wilds 67.60,42.50 |or
If these quests are unavailable today, click here |confirm
step
talk Elder Fisherman Rassan##60673
accept What Lurks Below##30585 |goto Krasarang Wilds 68.40,42.10 |or
accept Who Knew Fish Liked Eggs?##30598 |goto Krasarang Wilds 68.40,42.10 |or
If these quests are unavailable today, click here |confirm
step
talk Fo Fook##60675
accept Piranha!##30763 |goto Krasarang Wilds 67.20,41.20 |or
accept Viseclaw Soup##30701 |goto Krasarang Wilds 67.20,41.20 |or
If these quests are unavailable today, click here |confirm
step
talk Fiznix##60136
accept Like Bombing Fish In A Barrel##30678 |goto Krasarang Wilds 67.50,44.60 |or
accept Scavenger Hunt##30698 |goto Krasarang Wilds 67.50,44.60 |or
If this quest is unavailable today, click here |confirm
step
click Goblin Fishing Raft##211596
Ride a Goblin Fishing Raft |havebuff Rafting##116032 |goto Krasarang Wilds 67.50,44.80
|only if haveq(30698)
step
Use your fishing skill in the Shipwreck Debris pools to fish up 15 Rusty Shipwreck Debris
collect 15 Rusty Shipwreck Debris##80830 |q 30698/1 |goto Krasarang Wilds 64.30,50.70
You can find more Debris at [64.30,50.60]
|only if haveq(30698)
step
clicknpc Frenzied Reef Shark##60408
Ride the shark |goto Krasarang Wilds 68.40,43.10 |invehicle |c
|only if haveq(30753)
step
Use the abilities on your hotbar to kill the shark, make sure not to let your grip bar reach zero
kill Frenzied Reef Shark##60408 |q 30753/1
|only if haveq(30753)
step
click Jagged Abalone##211118
collect 9 Jagged Abalone Meat##80277 |q 30586/1 |goto Krasarang Wilds 69.10,37.90
|only if haveq(30586)
step
Enter the underwater cave here |goto Krasarang Wilds 71.30,38.50 < 5
kill Snapclaw##60401
collect Snapclaw's Claw##80831 |q 30700/1 |goto Krasarang Wilds 73.90,38.40
|only if haveq(30700)
step
Use your fishing skill to fish up 7 Dojani Eel |cast Fishing##131474
collect 7 Dojani Eel##80260 |q 30584/1 |goto Krasarang Wilds 65.60,30.50
|only if haveq(30584)
step
kill 8 Riverblade Raider##59714+ |q 30588/1 |goto Krasarang Wilds 62.40,40.90
|only if haveq(30588)
step
kill Viseclaw Fry##61090+, Viseclaw Fisher##58880+
collect 16 Viseclaw Fisher Eye##80832+ |q 30701/1 |goto Krasarang Wilds 55.10,45.70
|only if haveq(30701)
step
click Suncrawler##211474
collect 7 Suncrawler##81116 |q 30754/1 |goto Krasarang Wilds 59.80,38.80
|only if haveq(30754)
step
Use your Goblin Fishing Bomb to kill Sting Rays |use Goblin Fishing Bomb##80599
|tip You can kill the Sting Rays by other means, using the bombs is much quicker though.
kill Sting Ray##60278+
collect 3 Stinger##80600+ |q 30678/1 |goto Krasarang Wilds 59.30,46.30
|only if haveq(30678)
step
Use your fishing skill to fish up 5 Wolf Piranha. |cast Fishing##7620
collect 5 Wolf Piranha##81122 |q 30763/1 |goto Krasarang Wilds 36.80,43.30
|only if haveq(30763)
step
Use your fishing skill in the Mysterious Whirlpool until Narjon the Gulper appears.
|tip When Narjon spawns, make sure to equip your weapon quickly. |cast Fishing##131474
|tip It's a small swirling pool of water at this location
kill Narjon the Gulper##59689 |q 30585/1 |goto Krasarang Wilds 34.40,31.40
collect Beloved Ring##80262 |q 30585/2 |goto Krasarang Wilds 34.40,31.40
|only if haveq(30585)
step
Use your Anglers Fishing Spear near a Prickly Puffer |use Anglers Fishing Spear##80403
|tip The closer you are the easier it is to hit the fish.
kill Prickly Puffer##60037
collect 5 Prickly Puffer Spine##80529 |q 30658/1 |goto Krasarang Wilds 51.40,62.20
|only if haveq(30658)
step
click Pristine Crane Egg##211160
collect Pristine Crane Egg##80303 |q 30598/1 |goto Krasarang Wilds 65.20,47.50
|only if haveq(30598)
step
Use your Anglers Fishing Spear near an Armored Carp |use Anglers Fishing Spear##80403
|tip The closer you are the easier it is to hit the fish.
kill Armored Carp##59936+
collect 5 Armored Carp##80437 |q 30613/1 |goto Krasarang Wilds 70.10,51.20
|only if haveq(30613)
step
Use the Pristine Crane Egg in your bags |use Pristine Crane Egg##80303
Use your fishing skill in the Crane Yolk Pool and fish up a Silver Goby.
collect Silver Goby##80310 |q 30598/2 |goto Krasarang Wilds 68.20,42.70
|only if haveq(30598)
step
talk Elder Fisherman Rassan##60673
turnin What Lurks Below##30585 |goto Krasarang Wilds 68.40,42.10
turnin Who Knew Fish Liked Eggs?##30598 |goto Krasarang Wilds 68.40,42.10
step
talk Fiznix##60136
turnin Like Bombing Fish In A Barrel##30678 |goto Krasarang Wilds 67.50,44.60
turnin Scavenger Hunt##30698 |goto Krasarang Wilds 67.50,44.60
step
talk Angler Shen##59586
turnin Snapclaw##30700 |goto Krasarang Wilds 67.50,43.50
turnin Fishing for a Bruising##30588 |goto Krasarang Wilds 67.50,43.50
step
talk Trawler Yotimo##60135
turnin Armored Carp##30613 |goto Krasarang Wilds 67.60,42.50
turnin Huff & Puff##30658 |goto Krasarang Wilds 67.60,42.50
step
talk Fisherman Haito##59584
turnin Shocking!##30584 |goto Krasarang Wilds 67.90,45.20
turnin Jagged Abalone##30586 |goto Krasarang Wilds 67.90,45.20
step
talk John "Big Hook" Marsock##60674
turnin Bright Bait##30754 |goto Krasarang Wilds 68.30,43.50
turnin Jumping the Shark##30753 |goto Krasarang Wilds 68.30,43.50
step
talk Fo Fook##60675
turnin Piranha!##30763 |goto Krasarang Wilds 67.20,41.20
turnin Viseclaw Soup##30701 |goto Krasarang Wilds 67.20,41.20
step
talk Nat Pagle##63721
buy 1 Grand Commendation of the Anglers##93225 |n
Use the Commendation of the Anglers you just purchased |goto Krasarang Wilds 68.40,43.40 |complete GQ:GetReputation("The Anglers").hasBonus |use Grand Commendation of the Anglers##93225
|only if rep("The Anglers")>=Revered
step
You have reached the end of this guide
Click here to go back to the dailies |confirm |next "dailies"
]])
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Mists of Pandaria Dailies\\The August Celestials Dailies")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Mists of Pandaria Dailies\\The Order of the Cloud Serpent Dailies")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Mists of Pandaria Dailies\\The Shado-Pan Dailies")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Mists of Pandaria Dailies\\The Tillers Dailies")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Mists of Pandaria Dailies\\The Golden Lotus Dailies")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Mists of Pandaria Dailies\\The Klaxxi Dailies")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Mists of Pandaria Dailies\\Pandaria Cooking Dailies")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Mists of Pandaria Dailies\\Dominance Offensive Dailies")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Mists of Pandaria Dailies\\Beast Master Dailies (Dominance Offensive)")
GQ.BETASTART()
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Mists of Pandaria Dailies\\Sunreaver Onslaught Dailies")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Mists of Pandaria Dailies\\Sunreaver Onslaught Quests")
GQ.BETAEND()
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Mists of Pandaria Dailies\\Timeless Isle Dailies")
