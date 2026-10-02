local GoatQuest=GoatQuest
if not GoatQuest then return end
if UnitFactionGroup("player")~="Horde" then return end
if GQ:DoMutex("EventsH") then return end
GoatQuest.GuideMenuTier = "TRI"
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Brawler's Guild\\Battle for Azeroth Brawler's Guild")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Brewfest\\Brewfest Quests")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Brewfest\\Brewfest Dailies")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Brewfest\\A Round on the House on the Dragon Isles")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Brewfest\\A Round on the House in Khaz Algar")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Brewfest\\The Brewfest Diet")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Brewfest\\Have Keg, Will Travel")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Brewfest\\Brew of the Month")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Brewfest\\Does Your Wolpertinger Linger?")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Brewfest\\Direbrewfest")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Brewfest\\Brewmaster")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Brewfest\\Almost Blind Luck")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Brewfest\\Disturbing the Peace")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Brewfest\\Brew of the Year")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Brewfest\\Strange Brew")
GoatQuest:RegisterGuide("Events Guides\\Battle for Azeroth\\The Burning of Teldrassil",{
description="This guide will help you assault Teldrassil on behalf of the Horde.",
condition_suggested=function() return level >= 10 and level <= 50 and not completedq(52981) end,
},[[
step
accept The Warchief Awaits##50476
|tip You will automatically accept this quest.
step
Follow the path |goto Undercity/0 52.05,64.52 < 5 |walk
Continue following the path |goto Undercity/0 46.32,72.88 < 5 |walk
Continue following the path |goto Undercity/0 45.29,78.11 < 5 |walk
Continue following the path |goto Undercity/0 46.20,83.81 < 5 |walk
Continue following the path |goto Undercity/0 48.81,87.79 < 5 |walk
Continue following the path |goto Undercity/0 52.44,89.43 < 5 |walk
Run up the stairs |goto Undercity/0 53.97,90.40 |only if walking
Follow the path |goto Undercity/0 54.76,94.39 < 5 |only if walking
Run up the stairs |goto Undercity/0 56.19,95.51 < 5 |only if walking
Run up the stairs |goto Undercity/0 57.19,93.29 < 5 |only if walking
talk Lady Sylvanas Windrunner##134554
turnin The Warchief Awaits##50476 |goto Undercity/0 58.14,91.88
accept The Warchief Commands##50642 |goto Undercity/0 58.10,91.88
step
talk High Overlord Saurfang##134574
turnin The Warchief Commands##50642 |goto Northern Barrens/0 50.88,46.00
accept A Quick Diversion##50646 |goto Northern Barrens/0 50.88,46.00
step
talk Lorash##134573
turnin A Quick Diversion##50646 |goto Ashenvale/0 38.91,55.30
accept Everybody Has a Price##50647 |goto Ashenvale/0 38.91,55.30
step
Eliminate #10# Guards |q 50647/1 |goto Ashenvale/0 36.15,50.64
|tip Use the "Marked!" ability on guards around this area.
|tip It appears as a button on the screen.
|tip You will be stealthed, so enemies won't attack you.
|tip You must not be mounted to do this.
step
Watch the dialogue
Return to the Outskirts of Astranaar |goto Ashenvale/0 38.92,55.35 < 7 |noway |c |q 50647
step
talk Lorash##134573
turnin Everybody Has a Price##50647 |goto Ashenvale/0 38.91,55.29
accept A Timely Arrival##50738 |goto Ashenvale/0 38.91,55.29
step
talk Lady Sylvanas Windrunner##135003
|tip She walks to this location.
turnin A Timely Arrival##50738 |goto Ashenvale/0 37.83,56.30
accept Zoram'gar Outpost##50740 |goto Ashenvale/0 37.83,56.30
step
Enter the building |goto Ashenvale/0 11.67,35.00 < 5 |walk
talk Dagrun Ragehammer##34303
|tip He walks around this area inside the building.
Select _"Warchief Sylvanas Windrunner requires your aid repairing her soldiers' weapons."_
Speak with the Weaponsmith |q 50740/3 |goto Ashenvale/0 11.56,35.36
step
Leave the building |goto Ashenvale/0 11.67,35.00 < 5 |walk
talk Commander Grimfang##34122
Select _"Commander, the warchief asks that you prepare your outpost for an incoming army."_
Speak with Commander Grimfang |q 50740/1 |goto Ashenvale/0 12.11,33.86
step
Enter the building |goto Ashenvale/0 12.86,34.12 < 3 |walk
talk Innkeeper Duras##43606
|tip Inside the building.
Select _"The warchief needs rations and lodging for an incoming army."_
Speak with the Innkeeper |q 50740/2 |goto Ashenvale/0 12.99,34.16
step
talk High Overlord Saurfang##134574
turnin Zoram'gar Outpost##50740 |goto Ashenvale/0 35.17,49.44
accept On The Prowl##50772 |goto Ashenvale/0 35.17,49.44
step
Meet Sylvanas Near the Entrance to Darkshore |q 50772/1 |goto Darkshore/0 44.07,90.46
step
Watch the dialogue
talk Lady Sylvanas Windrunner##134554
turnin On The Prowl##50772 |goto Darkshore/0 44.08,90.50
accept Into the Woods##50800 |goto Darkshore/0 44.08,90.50
step
Kill the enemies that attack in waves
Defeat #6# Ashenvale Huntresses |q 50800/1 |goto Darkshore/0 44.08,90.50
step
talk Lady Sylvanas Windrunner##134554
turnin Into the Woods##50800 |goto Darkshore/0 44.07,90.49
accept Ripe for the Picking##50823 |goto Darkshore/0 44.07,90.49
step
talk High Overlord Saurfang##135443
turnin Ripe for the Picking##50823 |goto Ashenvale/0 12.13,33.75
step
talk Lady Sylvanas Windrunner##134554
accept A Quick Flyover##50837 |goto Ashenvale/0 12.02,33.77
step
talk Zarvik Blastwix##135501
Speak with Zarvik Blastwix |q 50837/1 |goto Ashenvale/0 11.82,33.26
step
talk Zarvik Blastwix##135501
Select _"Let's Fly."_
Board the Bombardier |invehicle |goto Ashenvale/0 11.82,33.26 |q 50837
stickystart "Destroy_Wisps"
step
kill Marked Tree##140924+
|tip Use the ability on your action bar.
|tip Aim near the bottom of them.
Fell #3# Marked Trees |q 50837/2 |goto Darkshore/0 41.60,90.63
step
label "Destroy_Wisps"
kill Wisp##141268+
|tip Use the ability on your action bar.
Destroy #30# Wisps |q 50837/3 |goto Darkshore/0 41.60,90.63
step
Return to Zoram'gar Outpost |goto Ashenvale/0  12.23,33.21 < 7 |c |q 50837 |notravel
step
talk Lady Sylvanas Windrunner##134554
turnin A Quick Flyover##50837 |goto Ashenvale/0 12.02,33.78
accept An Unstoppable Force##50880 |goto Ashenvale/0 12.02,33.78
step
Meet Sylvanas at the Wall |q 50880/1 |goto Darkshore/0 44.00,90.18
step
Pass Through the Wall |q 50880/2 |goto Darkshore/0 43.81,89.77
step
Watch the dialogue
talk Lady Sylvanas Windrunner##134554
turnin An Unstoppable Force##50880 |goto Darkshore/0 42.84,87.43
accept Clearing Them Out##53604 |goto Darkshore/0 42.84,87.43
accept A Glaive Misunderstanding##53605 |goto Darkshore/0 42.84,87.43
stickystart "Kill_Darnassian_Archers"
step
use the Everburning Torch##158937
|tip Use it on Glaive Throwers around this area.
|tip They look like wooden artillery machines with purple wings on the ground around this area.
Burn #4# Glaive Throwers |q 53605/1 |goto Darkshore/0 40.40,83.39
step
label "Kill_Darnassian_Archers"
Kill enemies around this area
Defeat #7# Night Elf Forces |q 53604/1 |goto Darkshore/0 40.40,83.39
step
talk Lady Sylvanas Windrunner##134554
turnin Clearing Them Out##53604 |goto Darkshore/0 42.43,82.06
turnin A Glaive Misunderstanding##53605 |goto Darkshore/0 42.43,82.06
accept Blurred Vision##50878 |goto Darkshore/0 42.43,82.06
stickystart "Kill_Frenzied_Blackwood_Furbolgs"
step
kill 8 Sentry Owl##141359 |q 50878/1 |goto Darkshore/0 42.36,78.18
step
label "Kill_Frenzied_Blackwood_Furbolgs"
kill 10 Frenzied Blackwood Furbolg##140686 |q 50878/2 |goto Darkshore/0 42.36,78.18
step
talk Lady Sylvanas Windrunner##135003
turnin Blurred Vision##50878 |goto Darkshore/0 43.30,75.67
accept The Trees Have Ears##50879 |goto Darkshore/0 43.30,75.67
step
kill Burning Ancient##141365 |q 50879/1 |goto Darkshore/0 44.40,75.11
|tip You may need help with this.
step
talk Lady Sylvanas Windrunner##135003
turnin The Trees Have Ears##50879 |goto Darkshore/0 43.30,75.67
step
Watch the dialogue
talk Lady Sylvanas Windrunner##135003
accept The Blackwood Den##52436 |goto Darkshore/0 43.30,75.67
accept Aggressive Inspiration##53606 |goto Darkshore/0 43.30,75.67
stickystart "Slay_Blackwood_Furbolgs"
step
click Horde Banner##289540
Plant the Northern Banner |q 53606/1 |goto Darkshore/0 45.10,83.68
step
click Horde Banner##289540
Plant the Center Banner |q 53606/2 |goto Darkshore/0 44.61,85.10
step
click Horde Banner##289540
Plant the Southern Banner |q 53606/3 |goto Darkshore/0 44.39,86.53
step
label "Slay_Blackwood_Furbolgs"
Kill enemies around this area
Slay #10# Blackwood Furbolgs |q 52436/1 |goto Darkshore/0 44.74,84.01
step
talk Lady Sylvanas Windrunner##134554
turnin The Blackwood Den##52436 |goto Darkshore/0 43.32,84.71
turnin Aggressive Inspiration##53606 |goto Darkshore/0 43.32,84.71
accept The Start of Something Good##52437 |goto Darkshore/0 43.32,84.71
step
Meet Sylvanas at Nazj'vel |q 52437/1 |goto Darkshore/0 35.78,84.79
step
talk Jux Burstkix##144346
turnin The Start of Something Good##52437 |goto Darkshore/0 35.82,84.84
accept Fueling the Horde War Machine##53608 |goto Darkshore/0 35.82,84.84
accept A Very Clear Message##53609 |goto Darkshore/0 35.82,84.84
stickystart "Slay_Night_Elves"
step
click Azerite Deposit##297790+
|tip They look like black and silver rock clusters on the ground around this area.
Collect #6# Azerite |q 53608/1 |goto Darkshore/0 32.63,84.08
step
label "Slay_Night_Elves"
Kill enemies around this area
Slay #10# Night Elves |q 53609/1 |goto Darkshore/0 32.63,84.08
step
talk Jux Burstkix##144346
turnin Fueling the Horde War Machine##53608 |goto Darkshore/0 35.82,84.84
turnin A Very Clear Message##53609 |goto Darkshore/0 35.82,84.84
accept A Gift of Azerite##53627 |goto Darkshore/0 35.82,84.84
step
talk Zarvik Blastwix##135501
|tip He walks around this area.
turnin A Gift of Azerite##53627 |goto Darkshore/0 44.60,86.54
accept A Wild Ride##52438 |goto Darkshore/0 44.60,86.54
step
clicknpc Goblin Hellion##141847
Use the Goblin Hellion |q 52438/1 |goto Darkshore/0 44.76,86.42
step
Ride the Goblin Hellion to Wildbend River |q 52438/2 |goto Darkshore/0 41.15,69.32 |notravel
stickystart "Slay_Kaldorei_Forces"
step
kill 5 Awakened Ancient##140741 |q 52438/3 |goto Darkshore/0 41.86,66.77
|tip Use the abilities on your action bar.
step
label "Slay_Kaldorei_Forces"
Kill enemies around this area
|tip Use the abilities on your action bar.
Slay #20# Kaldorei Forces |q 52438/4 |goto Darkshore/0 41.86,66.77
step
Return to Lady Sylvanas Windrunner |goto Darkshore/0 42.74,67.95 < 7 |c |q 52438 |notravel
step
talk Lady Sylvanas Windrunner##134554
turnin A Wild Ride##52438 |goto Darkshore/0 42.70,67.75
accept A Looming Threat##52806 |goto Darkshore/0 42.70,67.75
step
talk Lady Sylvanas Windrunner##134554
Select _"Where do we go from here, Warchief?"_
Speak with Sylvanas at the Blackwood Den |q 52806/1 |goto Darkshore/0 44.70,86.78
step
talk Lady Sylvanas Windrunner##134554
turnin A Looming Threat##52806 |goto Darkshore/0 44.70,86.78
step
talk Lady Sylvanas Windrunner##134554
accept Saurfang Returns##52967 |goto Darkshore/0 44.70,86.78
step
talk High Overlord Saurfang##142310
turnin Saurfang Returns##52967 |goto Darkshore/0 52.16,22.46
accept No Small Mercy##52970 |goto Darkshore/0 52.16,22.46
accept Driving Them Out##53610 |goto Darkshore/0 52.16,22.46
accept Seaside Rendezvous##52971 |goto Darkshore/0 52.16,22.46
stickystart "Secure_Civilians"
stickystart "Slay_Lordanel_Defenders"
step
kill Ariel Stagguard##144345 |q 52971/2 |goto Darkshore/0 51.73,17.76
|tip She walks around this area.
step
kill Caranne Briarbow##142749 |q 52971/1 |goto Darkshore/0 46.73,18.79
step
label "Secure_Civilians"
talk Lor'danel Citizen##142408+
|tip They look like neutral NPCs cowering in fear on the ground around this area.
Select _"Come with us to safety. We will not harm you."_
Secure #8# Civilians |q 52970/1 |goto Darkshore/0 50.80,19.30
step
label "Slay_Lordanel_Defenders"
Kill enemies around this area
Slay #15# Lor'danel Defenders |q 53610/1 |goto Darkshore/0 49.00,19.56
step
talk High Overlord Saurfang##142310
turnin No Small Mercy##52970 |goto Darkshore/0 52.16,22.45
turnin Driving Them Out##53610 |goto Darkshore/0 52.16,22.45
turnin Seaside Rendezvous##52971 |goto Darkshore/0 52.16,22.45
accept Killer Queen##52981 |goto Darkshore/0 52.16,22.45
step
Find Saurfang in Northern Darkshore |q 52981/1 |goto Darkshore/0 45.93,23.55
step
Watch the dialogue
Assist the Warchief |q 52981/2 |goto Darkshore/0 46.07,24.31
step
Watch the dialogue
Follow Saurfang |q 52981/3 |goto Darkshore/0 46.07,24.31
step
talk Lady Sylvanas Windrunner##144466
Select _"I am ready."_
Watch the dialogue
Speak with Sylvanas |q 52981/4 |goto Darkshore/0 45.52,18.25
step
talk Lady Sylvanas Windrunner##144466
turnin Killer Queen##52981 |goto Darkshore/0 45.51,18.24
]])
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Children's Week\\Children's Week Orgrimmar Quests")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Children's Week\\Children's Week Shattrath Quests")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Children's Week\\Children's Week Zandalar Quests")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Children's Week\\Children's Week Dalaran Oracles Quests")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Children's Week\\Children's Week Dalaran Wolvar Quests")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Children's Week\\Children's Week Dornogal Quests")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Children's Week\\Achievements\\Aw, Isn't It Cute?")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Children's Week\\Achievements\\Bad Example")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Children's Week\\Achievements\\Daily Chores")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Children's Week\\Achievements\\Hail To The King, Baby")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Children's Week\\Achievements\\Home Alone")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Children's Week\\Achievements\\School of Hard Knocks")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Children's Week\\Achievements\\Veteran Nanny")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Children's Week\\Achievements\\For the Children")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Darkmoon Faire\\Darkmoon Faire Quests")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Darkmoon Faire\\Darkmoon Faire Dailies")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Darkmoon Faire\\Achievements\\Ace Tonk Commander")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Darkmoon Faire\\Achievements\\Taking the Show on the Road")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Darkmoon Faire\\Achievements\\Fairegoer's Feast")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Darkmoon Faire\\Achievements\\Come One, Come All!")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Darkmoon Faire\\Achievements\\Blastenheimer Bullseye")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Darkmoon Faire\\Achievements\\Brood of Alysrazor")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Darkmoon Faire\\Achievements\\Don't Stop Dancing")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Darkmoon Faire\\Achievements\\Feeling It")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Darkmoon Faire\\Achievements\\Can't Stop the Feeling")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Darkmoon Faire\\Achievements\\Maniac on the Dance Floor")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Darkmoon Faire\\Achievements\\Dancing Machine")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Darkmoon Faire\\Achievements\\Darkmoon Defender")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Darkmoon Faire\\Achievements\\Darkmoon Dungeoneer")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Darkmoon Faire\\Achievements\\Darkmoon Despoiler")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Darkmoon Faire\\Achievements\\Darkmoon Dominator")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Darkmoon Faire\\Achievements\\Darkmoon Like the Wind")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Darkmoon Faire\\Achievements\\Faire Favors")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Darkmoon Faire\\Achievements\\Hey, You're a Rockstar!")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Darkmoon Faire\\Achievements\\Make You Sweat")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Darkmoon Faire\\Achievements\\Mosh Pit")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Darkmoon Faire\\Achievements\\Taking this Show on the Road")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Darkmoon Faire\\Achievements\\Perfect Performance")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Darkmoon Faire\\Achievements\\I Was Promised a Pony")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Darkmoon Faire\\Achievements\\Triumphant Turtle Tossing")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Darkmoon Faire\\Achievements\\That's Whack!")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Darkmoon Faire\\Achievements\\Quick Shot")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Darkmoon Faire\\Achievements\\Step Right Up")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Darkmoon Faire\\Achievements\\That Rabbit's Dynamite!")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Feast of Winter Veil\\Achievements\\Rock n' Roll")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Feast of Winter Veil\\Achievements\\'Tis the Season")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Feast of Winter Veil\\Achievements\\A Frosty Shake")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Feast of Winter Veil\\Achievements\\BB King")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Feast of Winter Veil\\Achievements\\Holiday Bromance")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Feast of Winter Veil\\Achievements\\A-Caroling We Will Go")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Feast of Winter Veil\\Achievements\\Crashin' & Thrashin'")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Feast of Winter Veil\\Achievements\\The Danger Zone")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Feast of Winter Veil\\Achievements\\Fa-la-la-la-Ogri'la")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Feast of Winter Veil\\Achievements\\He Knows If You've Been Naughty")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Feast of Winter Veil\\Achievements\\Iron Armada")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Feast of Winter Veil\\Achievements\\Let It Snow")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Feast of Winter Veil\\Achievements\\Merrymaker")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Feast of Winter Veil\\Achievements\\On Metzen!")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Feast of Winter Veil\\Achievements\\Scrooge")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Feast of Winter Veil\\Achievements\\Simply Abominable")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Feast of Winter Veil\\Achievements\\The Winter Veil Gourmet")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Feast of Winter Veil\\Achievements\\With a Little Helper from My Friends")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Feast of Winter Veil\\Feast of Winter Veil Quests")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Feast of Winter Veil\\Feast of Winter Veil Daily Quests")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Hallow's End\\Hallow's End Quests")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Hallow's End\\Hallow's End Dailies")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Hallow's End\\Achievements\\A Cleansing Fire")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Hallow's End\\Achievements\\Don't Lose Your Head, Man")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Hallow's End\\Achievements\\Kickin' With the Wick")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Hallow's End\\Achievements\\Check Your Head")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Hallow's End\\Achievements\\A Frightening Friend")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Hallow's End\\Achievements\\G.N.E.R.D. Rage")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Hallow's End\\Achievements\\Hallowed Be Thy Name")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Hallow's End\\Achievements\\A Mask for All Occasions")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Hallow's End\\Achievements\\The Mask Task")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Hallow's End\\Achievements\\The Masquerade")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Hallow's End\\Achievements\\Out With It")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Hallow's End\\Achievements\\Rotten Hallow")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Hallow's End\\Achievements\\The Savior of Hallow's End")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Hallow's End\\Achievements\\Sinister Calling")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Hallow's End\\Achievements\\That Sparkling Smile")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Hallow's End\\Achievements\\Trick or Treat!")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Hallow's End\\Achievements\\Tricks and Treats")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Harvest Festival\\Harvest Festival Quest")
GoatQuest:RegisterGuide("Events Guides\\Warlords of Draenor\\Iron Horde Invasion",{
description="Take part in the opening event of the Warlords of Draenor!",
condition_end=function() return completedq(36940) end,
},[[
step
talk Zidormi##88206
Select _"Take me back to the present."_
Travel to the Present |complete not GQ.InPhase('Old Blasted Lands') |goto Blasted Lands/0 48.16,7.28 |q 36940 |future
step
talk Ameri Windblade##85734
fpath Shattered Landing |goto Blasted Lands/0 72.96,48.64
step
talk Thrall##82851
accept Attack of the Iron Horde##35745 |goto Blasted Lands/0 71.81,47.72
accept Under Siege##35746 |goto Blasted Lands/0 71.81,47.72
step
talk Rokhan##85247
accept Peeking Into the Portal##36382 |goto Blasted Lands/0 71.88,48.99
stickystart "Kill_Ironmarch_Grunts"
step
clicknpc Iron Demolisher##86091
Destroy #3# Iron Demolishers |q 35746/1 |goto Blasted Lands/0 64.33,35.18
step
label "Kill_Ironmarch_Grunts"
kill 8 Ironmarch Grunt##76189 |q 35745/1 |goto Blasted Lands/0 64.33,35.18
step
click Telescope##237144
Use the Telescope |q 36382/1 |goto Blasted Lands/0 61.68,36.68
step
talk Rokhan##85247
turnin Peeking Into the Portal##36382 |goto Blasted Lands/0 71.88,48.99
step
talk Thrall##82851
turnin Attack of the Iron Horde##35745 |goto Blasted Lands/0 71.81,47.72
turnin Under Siege##35746
step
talk Thrall##82851
accept Subversive Scouts##35748 |goto Blasted Lands/0 71.81,47.72
step
talk Rokhan##85247
accept Ending Executions##35744 |goto Blasted Lands/0 71.88,48.99
step
kill Ironmarch Executioner##82774+
|tip They stand in front of kneeling Horde Prisoners around this area.
Stop #3# Executions |q 35744/1 |goto Blasted Lands/0 59.37,27.80
step
kill 5 Ironmarch Scout##76886 |q 35748/1 |goto Blasted Lands/0 71.78,48.53
|tip They are stealthed near hills and open areas around this area.
step
talk Rokhan##85247
turnin Ending Executions##35744 |goto Blasted Lands/0 71.88,48.99
step
talk Thrall##82851
turnin Subversive Scouts##35748 |goto Blasted Lands/0 71.81,47.72
accept Investigating the Invasion##36292 |goto Blasted Lands/0 71.81,47.72
step
talk Thrall##84928
turnin Investigating the Invasion##36292 |goto Blasted Lands/0 48.73,31.78
accept Attack on Nethergarde##35751 |goto Blasted Lands/0 48.73,31.78
accept Lunatic Lieutenants##35750 |goto Blasted Lands/0 48.73,31.78
step
talk Okrilla##76609
accept Ransacking Nethergarde##35761 |goto Blasted Lands/0 48.74,31.89
step
kill Rukah the Machinist##73458
|tip She walks around this area.
collect Rukah's Battleplan##113400 |q 35750/2 |goto Blasted Lands/0 57.00,17.96
step
click Neka's Poison Flask##233224
|tip On the corner of the table under the tent.
collect Neka's Poison Flask##113436 |q 35761/3 |goto Blasted Lands/0 59.35,17.97
step
click Horde Flag
Plant the Horde Flag outside of the Main Keep |q 35751/3 |goto Blasted Lands/0 59.86,15.81
step
kill Gar Steelcrush##73446
|tip Upstairs inside the keep.
collect Gar's Battleplan##113401 |q 35750/3 |goto Blasted Lands/0 60.19,13.81
step
click Aitokk's Axe##233228
|tip Stuck in the wall inside the building.
collect Aitokk's Axe##113439 |q 35761/1 |goto Blasted Lands/0 61.87,14.73
step
kill Mokrik Blackfingers##73459
collect Mokrik's Battleplan##113399 |q 35750/1 |goto Blasted Lands/0 62.86,13.12
step
click Horde Flag
Plant the Horde Flag at the Center of Nethergarde |q 35751/2 |goto Blasted Lands/0 61.60,18.49
step
click Overseer Struk's Shield##233227
collect Overseer Struk's Shield##113437 |q 35761/2 |goto Blasted Lands/0 60.60,20.01
step
click Horde Flag
Plant the Horde Flag at the Entrance to Nethergarde |q 35751/1 |goto Blasted Lands/0 62.97,22.51
step
talk Okrilla##76609
turnin Ransacking Nethergarde##35761 |goto Blasted Lands/0 48.74,31.89
step
talk Thrall##84928
turnin Attack on Nethergarde##35751 |goto Blasted Lands/0 48.73,31.78
turnin Lunatic Lieutenants##35750 |goto Blasted Lands/0 48.73,31.78
step
talk Thrall##84928
accept Toothsmash the Annihilator##35760 |goto Blasted Lands/0 48.73,31.78
accept Death to the Dreadmaul##35762 |goto Blasted Lands/0 48.73,31.78
step
talk Okrilla##76609
accept Okrilla's Revenge##35764 |goto Blasted Lands/0 48.74,31.89
stickystart "Slay_Dreadmaul_Ogres"
step
click Cooking Pot##232625
Poison the Cooking Pot |q 35764/1 |goto Blasted Lands/0 43.89,31.01 |count 1
step
click Cooking Pot##232625
Poison the Cooking Pot |q 35764/1 |goto Blasted Lands/0 44.32,35.60 |count 2
step
kill Toothsmash the Annihilator##82451 |q 35760/1 |goto Blasted Lands/0 43.61,36.32
|tip He walks around this area.
step
click Cooking Pot##232625
Poison the Cooking Pot |q 35764/1 |goto Blasted Lands/0 43.40,36.99 |count 3
step
label "Slay_Dreadmaul_Ogres"
Kill Dreadmaul enemies around this area
Slay #8# Dreadmaul Ogres |q 35762/1 |goto Blasted Lands/0 43.83,36.12
step
talk Okrilla##76609
turnin Okrilla's Revenge##35764 |goto Blasted Lands/0 48.74,31.89
step
talk Thrall##84928
turnin Toothsmash the Annihilator##35760 |goto Blasted Lands/0 48.73,31.78
turnin Death to the Dreadmaul##35762 |goto Blasted Lands/0 48.73,31.78
accept Gar'mak Bladetwist##35763 |goto Blasted Lands/0 48.73,31.78
step
kill Gar'mak Bladetwist##82918 |q 35763/1 |goto Blasted Lands/0 40.05,11.41
|tip Upstairs inside the tower.
step
talk Thrall##84928
turnin Gar'mak Bladetwist##35763 |goto Blasted Lands/0 48.73,31.78
accept Warning the Warchief##36940 |goto Blasted Lands/0 48.73,31.78
step
talk High Overlord Saurfang##14720
|tip Inside the building.
turnin Warning Orgrimmar##36940 |goto Orgrimmar/1 48.53,70.73
]])
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Love is in the Air\\Love is in the Air Main Questline")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Love is in the Air\\Love is in the Air Dailies")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Love is in the Air\\Achievements\\Be Mine!")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Love is in the Air\\Achievements\\Dangerous Love")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Love is in the Air\\Achievements\\Fistful of Love")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Love is in the Air\\Achievements\\I Pitied The Fool")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Love is in the Air\\Achievements\\Lonely?")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Love is in the Air\\Achievements\\Lovely Luck Is On Your Side")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Love is in the Air\\Achievements\\My Love is Like a Red, Red Rose")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Love is in the Air\\Achievements\\Perma-Peddle")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Love is in the Air\\Achievements\\Shafted!")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Love is in the Air\\Achievements\\Sweet Tooth")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Love is in the Air\\Achievements\\The Rocket's Pink Glare")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Love is in the Air\\Achievements\\Support Your Local Artisans")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Lunar Festival\\Lunar Festival Main Questline")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Lunar Festival\\Lunar Festival Crown Transmog Quests")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Lunar Festival\\Lunar Festival Optimized Elders Path")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Lunar Festival\\Achievements\\A Coin of Ancestry")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Lunar Festival\\Achievements\\5 Coins of Ancestry")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Lunar Festival\\Achievements\\10 Coins of Ancestry")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Lunar Festival\\Achievements\\25 Coins of Ancestry")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Lunar Festival\\Achievements\\50 Coins of Ancestry")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Lunar Festival\\Achievements\\Elders of Khaz Algar")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Lunar Festival\\Achievements\\Elders of Cataclysm")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Lunar Festival\\Achievements\\Elders of Eastern Kingdoms")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Lunar Festival\\Achievements\\Elders of Kalimdor")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Lunar Festival\\Achievements\\Elders of Northrend")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Lunar Festival\\Achievements\\Elders of the Dungeons")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Lunar Festival\\Achievements\\Elders of the Alliance")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Lunar Festival\\Achievements\\Elders of the Horde")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Lunar Festival\\Achievements\\Elune's Blessing")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Lunar Festival\\Achievements\\Frenzied Firecracker")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Lunar Festival\\Achievements\\The Rocket's Red Glare")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Lunar Festival\\Achievements\\Lunar Festival Finery")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Lunar Festival\\Achievements\\To Honor One's Elders")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Lunar Festival\\Achievements\\Elders of the Dragon Isles")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Midsummer Fire Festival\\Midsummer Fire Festival Quests")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Midsummer Fire Festival\\Ignite the Skies")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Midsummer Fire Festival\\Midsummer Fire Festival Dailies")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Midsummer Fire Festival\\Midsummer Fire Festival Bonfires")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Midsummer Fire Festival\\Midsummer Fire Festival Achievements\\Midsummer Achievement Guide")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Midsummer Fire Festival\\Midsummer Fire Festival Achievements\\The Fires of Azeroth\\Extinguishing Eastern Kingdoms")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Midsummer Fire Festival\\Midsummer Fire Festival Achievements\\The Fires of Azeroth\\Extinguishing Kalimdor")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Midsummer Fire Festival\\Midsummer Fire Festival Achievements\\The Fires of Azeroth\\Extinguishing Outland")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Midsummer Fire Festival\\Midsummer Fire Festival Achievements\\The Fires of Azeroth\\Extinguishing Northrend")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Midsummer Fire Festival\\Midsummer Fire Festival Achievements\\The Fires of Azeroth\\Extinguishing the Cataclysm")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Midsummer Fire Festival\\Midsummer Fire Festival Achievements\\The Fires of Azeroth\\Extinguishing Pandaria")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Midsummer Fire Festival\\Midsummer Fire Festival Achievements\\The Fires of Azeroth\\Extinguishing Draenor")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Midsummer Fire Festival\\Midsummer Fire Festival Achievements\\The Fires of Azeroth\\Extinguishing the Broken Isles")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Midsummer Fire Festival\\Midsummer Fire Festival Achievements\\The Fires of Azeroth\\Extinguishing Kul Tiras")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Midsummer Fire Festival\\Midsummer Fire Festival Achievements\\The Fires of Azeroth\\Flame Keeper of Eastern Kingdoms")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Midsummer Fire Festival\\Midsummer Fire Festival Achievements\\The Fires of Azeroth\\Flame Keeper of Kalimdor")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Midsummer Fire Festival\\Midsummer Fire Festival Achievements\\The Fires of Azeroth\\Flame Keeper of Outland")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Midsummer Fire Festival\\Midsummer Fire Festival Achievements\\The Fires of Azeroth\\Flame Keeper of Northrend")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Midsummer Fire Festival\\Midsummer Fire Festival Achievements\\The Fires of Azeroth\\Flame Keeper of Cataclysm")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Midsummer Fire Festival\\Midsummer Fire Festival Achievements\\The Fires of Azeroth\\Flame Keeper of Pandaria")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Midsummer Fire Festival\\Midsummer Fire Festival Achievements\\The Fires of Azeroth\\Flame Keeper of Draenor")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Midsummer Fire Festival\\Midsummer Fire Festival Achievements\\The Fires of Azeroth\\Flame Keeper of the Broken Isles")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Midsummer Fire Festival\\Midsummer Fire Festival Achievements\\The Fires of Azeroth\\Flame Keeper of Zandalar")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Midsummer Fire Festival\\Midsummer Fire Festival Achievements\\The Fires of Azeroth\\Flame Keeper of the Dragon Isles")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Midsummer Fire Festival\\Midsummer Fire Festival Achievements\\The Fires of Azeroth\\Flame Keeper of Khaz Algar")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Midsummer Fire Festival\\Midsummer Fire Festival Achievements\\The Fires of Azeroth\\Flame Keeper of Midnight")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Noblegarden\\Noblegarden Quests")
GoatQuest:RegisterGuide("Events Guides\\Noblegarden\\Noblegarden Dailies",{
condition_suggested=function() return isevent('Noblegarden') end,
description="This guide section will walk you through completing the dailies for the Noblegarden event.",
},[[
step
talk Holiday Enthusiast##199261
accept A Spring Awakening##79136 |goto Valdrakken/0 55.07,37.07
|tip This quest is optional and can be skipped.
step
talk Orc Commoner##19175
accept Spring Gatherers##13483 |goto Orgrimmar/1 51.55,75.14
step
talk Spring Gatherer##32798
turnin Spring Gatherers##13483 |goto Durotar/0 52.23,41.58
step
label "Begin_Daily_Quests"
talk Spring Gatherer##32798
accept The Great Egg Hunt##13479 |goto Durotar/0 52.23,41.58
step
click Brightly Colored Egg##113768+
|tip There is at least one available at all times.
|tip They look like multicolored eggs near objects and buildings around this area.
use the Brightly Colored Egg##45072+
collect 20 Brightly Colored Shell Fragment##44806 |q 13479/1 |goto Durotar/0 52.58,42.81
step
talk Spring Gatherer##32798
turnin The Great Egg Hunt##13479 |goto Durotar/0 52.23,41.58
step
talk Sylnaria Fareflame##217125
accept What the Duck?##79575 |goto Durotar/0 52.58,41.18
step
clicknpc Furious Duck##217725+
use the Horn of Honking##216487
|tip Use it on ducks found all over Razor Hill.
Scare #10# Ducks |q 79575/1 |goto Durotar/0 52.63,42.29
step
talk Sylnaria Fareflame##217125
turnin What the Duck?##79575 |goto Durotar/0 52.58,41.18
accept A Fowl Concoction##79576 |goto Durotar/0 52.58,41.19
step
talk Tethris Dewgazer##217147
|tip Inside the Pathfinder's Den.
Select _"Sylnaria sent me..."_ |gossip 120851
Speak with Tethris Dewgazer in Orgrimmar |q 79576/1 |goto Orgrimmar/1 56.87,91.16
step
talk Sylnaria Fareflame##217125
turnin A Fowl Concoction##79576 |goto Durotar/0 52.58,41.19
step
talk Tethris Dewgazer##217147
accept Duck Tales##79577 |goto Durotar/0 52.59,41.07
step
use the Duck Potion##216488
Use the Potion |q 79577/1 |goto Durotar/0 52.59,41.07
step
talk Furious Duck##217725+
Gather Information #5# Times |q 79577/2 |goto Durotar/0 52.64,41.63
step
talk Sylnaria Fareflame##217125
turnin Duck Tales##79577 |goto Durotar/0 52.58,41.18
accept Just a Waddle Away##79578 |goto Durotar/0 52.58,41.18
step
use the Duck Potion##216488
Use the Potion |q 79578/1 |goto Durotar/0 52.58,41.18
step
Find Daetan |q 79578/2 |goto Durotar/0 48.40,44.06
|tip Wait for him to fly down, land, and transform.
step
Remove your Duck Disguise |nobuff Duck Disguise##436280
|tip Right-click the Duck Disguise buff on your buff bar.
stickystart "Accept_Feathered_Fiend"
step
click Golden Egg Heirloom##424098
|tip If the Daetan Swiftplume is up, kill it with nearby players.
Find the Heirloom |q 79578/3 |goto Durotar/0 44.45,35.18
step
label "Accept_Feathered_Fiend"
kill Daetan Swiftplume##218738
|tip Search around nearby for a huge golden egg.
|tip One person needs to drag the big egg to the nest to spawn Daetan.
|tip This enemy will require a group.
collect Noblegarden Trinket##216932 |n
accept Feathered Fiend##79558 |goto Durotar/0 44.43,35.18
step
talk Sylnaria Fareflame##217125
turnin Just a Waddle Away##79578 |goto Durotar/0 52.58,41.18
step
talk Sylnaria Fareflame##217125
accept Quacking Down##79135 |goto Durotar/0 52.58,41.19
step
clicknpc Furious Duck##217725+
use the Horn of Honking##216487
|tip Use it on ducks found all over Razor Hill.
Scare Off #10# Ducks |q 79135/1 |goto Durotar/0 52.69,42.02
step
talk Sylnaria Fareflame##217125
turnin Quacking Down##79135 |goto Durotar/0 52.58,41.19
step
You have completed all Noblegarden daily quests
|tip This guide will reset when more become available.
'|complete not completedq(13479,79135) |next "Begin_Daily_Quests"
]])
GoatQuest:RegisterGuide("Events Guides\\Noblegarden\\Achievements\\Quacked Killer",{
description="Defeat Daetan Swiftplume.",
condition_suggested=function() return isevent('Noblegarden') end,
achieveid={20209},
patch='100206',
},[[
step
kill Daetan Swiftplume##218738
|tip Search around nearby for a huge golden egg.
|tip One person needs to drag the big egg to the nest to spawn Daetan.
|tip This enemy will require a group.
|achieve 20209 |goto Durotar/0 44.43,35.18
]])
GoatQuest:RegisterGuide("Events Guides\\Noblegarden\\Achievements\\Blushing Bride",{
description="Kiss someone wearing an Elegant Dress while wearing a White Tuxedo Shirt and Black Tuxedo Pants.",
condition_suggested=function() return isevent('Noblegarden') end,
achieveid={2576},
patch='30100',
keywords={"Noblegarden, Achievement, Noble, Garden"},
},[[
step
click Brightly Colored Egg##113768+
|tip There is at least one available at all times.
|tip They look like multicolored eggs near objects and buildings around this area.
use the Brightly Colored Egg##45072+
collect 50 Noblegarden Chocolate##44791 |goto Durotar/0 52.58,42.81 |or
'|complete achieved(2576) |or
step
talk Noblegarden Merchant##32837
buy 1 Black Tuxedo Pants##151804 |goto Durotar/0 51.90,41.86 |or
'|complete achieved(2576) |or
step
talk Noblegarden Merchant##32837
buy 1 White Tuxedo Shirt##6833 |goto Durotar/0 51.90,41.86 |or
'|complete achieved(2576) |or
step
Equip the Black Tuxedo Pants |equipped Black Tuxedo Pants##151804 |or
'|complete achieved(2576) |or
step
Equip the White Tuxedo Shirt |equipped White Tuxedo Shirt##6833 |or
'|complete achieved(2576) |or
step
|script DoEmote("KISS")
Earn the "Blushing Bride" Achievement |achieve 2576
|tip Use the kiss emote on a player wearing an Elegant Dress.
|tip The Elegant Dress looks like a long pink dress when worn.
step
_Congratulations!_
You Earned the "Blushing Bride" Achievement.
]])
GoatQuest:RegisterGuide("Events Guides\\Noblegarden\\Achievements\\Chocoholic",{
description="Eat 100 Noblegarden Chocolates during the Noblegarden celebration.",
condition_suggested=function() return isevent('Noblegarden') end,
achieveid={2418},
patch='30100',
keywords={"Noblegarden, Achievement, Noble, Garden"},
},[[
step
click Brightly Colored Egg##113768+
|tip There is at least one available at all times.
|tip They look like multicolored eggs near objects and buildings around this area.
use the Brightly Colored Egg##45072+
collect 100 Noblegarden Chocolate##44791 |goto Durotar/0 52.58,42.81 |or
'|complete achieved(2418) |or
step
use the Noblegarden Chocolate##44791+
Eat #100# Noblegarden Chocolates |achieve 2418
step
_Congratulations!_
You Earned the "Chocoholic" Achievement.
]])
GoatQuest:RegisterGuide("Events Guides\\Noblegarden\\Achievements\\Chocolate Lover",{
description="Eat 25 Noblegarden Chocolates during the Noblegarden celebration.",
condition_suggested=function() return isevent('Noblegarden') end,
achieveid={2417},
patch='30100',
keywords={"Noblegarden, Achievement, Noble, Garden"},
},[[
step
click Brightly Colored Egg##113768+
|tip There is at least one available at all times.
|tip They look like multicolored eggs near objects and buildings around this area.
use the Brightly Colored Egg##45072+
collect 25 Noblegarden Chocolate##44791 |goto Durotar/0 52.58,42.81 |or
'|complete achieved(2417) |or
step
use the Noblegarden Chocolate##44791+
Eat #25# Noblegarden Chocolates |achieve 2417
step
_Congratulations!_
You Earned the "Chocolate Lover" Achievement.
]])
GoatQuest:RegisterGuide("Events Guides\\Noblegarden\\Achievements\\Desert Rose",{
description="Use Spring Robes to plant a flower in each of the deserts listed below:\n\n"..
"The Badlands\nDesolace\nSilithus\nTanaris\nThousand Needles",
condition_suggested=function() return isevent('Noblegarden') end,
achieveid={2436},
patch='30100',
keywords={"Noblegarden, Achievement, Noble, Garden"},
},[[
step
click Brightly Colored Egg##113768+
|tip There is at least one available at all times.
|tip They look like multicolored eggs near objects and buildings around this area.
use the Brightly Colored Egg##45072+
collect 50 Noblegarden Chocolate##44791 |goto Durotar/0 52.58,42.81 |or
'|complete achieved(2436) |or
step
talk Noblegarden Merchant##32837
buy 1 Spring Florist's Pouch##188694 |goto Durotar/0 51.90,41.86 |or
'|complete achieved(2436) |or
step
use the Spring Florist's Pouch##188694
Learn the Spring Florist's Pouch Toy |toy Spring Florist's Pouch##188694 |or
'|complete achieved(2436) |or
step
use the Spring Florist's Pouch##188694
Plant a Flower in Desolace |achieve 2436/2 |goto Desolace/0 64.67,10.44
step
use the Spring Florist's Pouch##188694
Plant a Flower in Silithus |achieve 2436/3 |goto Silithus/0 78.93,21.97
step
use the Spring Florist's Pouch##188694
Plant a Flower in Tanaris |achieve 2436/4 |goto Tanaris/0 51.38,29.43
step
use the Spring Florist's Pouch##188694
Plant a Flower in Thousand Needles |achieve 2436/5 |goto Thousand Needles/0 79.09,71.89
step
use the Spring Florist's Pouch##188694
Plant a Flower in the Badlands |achieve 2436/1 |goto Badlands/0 21.71,57.73
step
Earn the "Desert Rose" Achievement |achieve 2436
step
_Congratulations!_
You Earned the "Desert Rose" Achievement.
]])
GoatQuest:RegisterGuide("Events Guides\\Noblegarden\\Achievements\\Dressed for the Occasion",{
description="Discover an Elegant Dress by opening Brightly Colored Eggs during the Noblegarden celebration.",
condition_suggested=function() return isevent('Noblegarden') end,
achieveid={249},
patch='30002',
keywords={"Noblegarden, Achievement, Noble, Garden"},
},[[
step
click Brightly Colored Egg##113768+
|tip There is at least one available at all times.
|tip They look like multicolored eggs near objects and buildings around this area.
|tip You may need to loot hundreds, if not thousands of these eggs.
use the Brightly Colored Egg##45072+
collect 1 Elegant Dress##151806 |achieve 249 |goto Durotar/0 52.58,42.81 |or
'|complete achieved(249) |or
step
Earn the "Dressed for the Occasion" Achievement |achieve 249
step
_Congratulations!_
You Earned the "Dressed for the Occasion" Achievement.
]])
GoatQuest:RegisterGuide("Events Guides\\Noblegarden\\Achievements\\Hard Boiled",{
description="Lay an egg in Un'Goro Crater's Golakka Hot Springs as a rabbit during the Noblegarden celebration.",
condition_suggested=function() return isevent('Noblegarden') end,
achieveid={2416},
patch='30100',
keywords={"Noblegarden, Achievement, Noble, Garden"},
},[[
step
talk Innkeeper Dreedle##38488
|tip Setting your hearthstone here will greatly reduce your travel time.
|tip Note that you can ONLY use your regular hearthstone, and not toy variants.
|tip You cannot take flight paths or use your mount after getting the buff.
home Marshal's Stand |goto Un'Goro Crater/0 55.38,62.26 |or
'|complete achieved(2416) |or
step
click Brightly Colored Egg##113768+
|tip There is at least one available at all times.
|tip They look like multicolored eggs near objects and buildings around this area.
use the Brightly Colored Egg##45072+
Gain the "Noblegarden Bunny" Buff |havebuff Noblegarden Bunny##61734 |goto Durotar/0 52.58,42.81 |or
'|complete achieved(2416) |or
step
use Hearthstone##6948
Earn the "Hard Boiled" Achievement |achieve 2416 |goto Un'Goro Crater/0 35.74,54.21
|tip Avoid enemies, as being hit will cause you to lose your disguise.
|tip Stand in this spot until you lay an egg.
step
_Congratulations!_
You Earned the "Hard Boiled" Achievement.
]])
GoatQuest:RegisterGuide("Events Guides\\Noblegarden\\Achievements\\I Found One!",{
description="Find a Brightly Colored Egg.",
condition_suggested=function() return isevent('Noblegarden') end,
achieveid={2676},
patch='30101',
keywords={"Noblegarden, Achievement, Noble, Garden"},
},[[
step
click Brightly Colored Egg##113768+
|tip There is at least one available at all times.
|tip They look like multicolored eggs near objects and buildings around this area.
collect 1 Brightly Colored Egg##45072 |achieve 2676 |goto Durotar/0 52.58,42.81 |or
'|complete achieved(2676) |or
step
Earn the "I Found One!" Achievement |achieve 2676
step
_Congratulations!_
You Earned the "I Found One!" Achievement.
]])
GoatQuest:RegisterGuide("Events Guides\\Noblegarden\\Achievements\\Noble Garden",{
description="Hide a Brightly Colored Egg in Silvermoon City.",
condition_suggested=function() return isevent('Noblegarden') end,
achieveid={2420},
patch='30100',
keywords={"Noblegarden, Achievement, Noble, Garden"},
},[[
step
talk Warchief's Herald##49750
accept Battle for Azeroth: Mission Statement##51443 |goto Orgrimmar/1 49.39,76.57
|tip This quest is required to unlock access to Zidormi in Tirisfal Glades.
step
Speak to Warchief Sylvanas Windrunner in Orgrimmar |q 51443/1 |goto Orgrimmar/1 48.61,71.98
|tip Inside the building.
step
Watch the dialogue
|tip Inside the building.
Meet Your Team |q 51443/2 |goto Orgrimmar/1 54.44,78.43
step
talk Nathanos Blightcaller##135205
|tip Inside the building.
turnin Battle for Azeroth: Mission Statement##51443 |goto Orgrimmar/1 54.44,78.43
step
talk Zidormi##141488
Select _"Can you show me what Tirisfal Glades was like before the Battle for Lordaeron?"_
Travel to the Past |complete GQ.InPhase('Old Undercity') |goto Tirisfal Glades/0 69.46,62.80 |or
'|complete achieved(2420) |or
step
click Brightly Colored Egg##113768+
|tip There is at least one available at all times.
|tip They look like multicolored eggs near objects and buildings around this area.
use the Brightly Colored Egg##45072+
collect 5 Noblegarden Chocolate##44791 |goto Tirisfal Glades/0 61.00,52.74 |or
'|complete achieved(2420) |or
step
talk Noblegarden Merchant##32837
buy 1 Noblegarden Egg##44818 |goto Tirisfal Glades/0 61.36,52.98 |or
'|complete achieved(2420) |or
step
use Noblegarden Egg##44818
Earn the "Noble Garden" Achievement |achieve 2420 |goto Silvermoon City/0 50.62,16.45
step
_Congratulations!_
You Earned the "Noble Garden" Achievement.
]])
GoatQuest:RegisterGuide("Events Guides\\Noblegarden\\Achievements\\Shake Your Bunny-Maker",{
description="Use Spring Flowers to place rabbit ears upon players of at least 20th level of the following races:\n\n"..
"Blood Elf\nDraenei\nDwarf\nGnome\nGoblin\nHuman\nNight Elf\nOrc\nTauren\nTroll\nUndead\nWorgen",
condition_suggested=function() return isevent('Noblegarden') end,
achieveid={2422},
patch='30100',
keywords={"Noblegarden, Achievement, Noble, Garden"},
},[[
step
click Brightly Colored Egg##113768+
|tip There is at least one available at all times.
|tip They look like multicolored eggs near objects and buildings around this area.
use the Brightly Colored Egg##45072+
collect 50 Noblegarden Chocolate##44791 |goto Durotar/0 52.58,42.81 |or
'|complete achieved(2422) |or
step
talk Noblegarden Merchant##32837
buy 1 Spring Flowers##45073 |goto Durotar/0 51.90,41.86 |or
'|complete achieved(2422) |or
step
Equip the Spring Flowers |equipped Spring Flowers##45073 |or
'|complete achieved(2422) |or
step
use the Spring Flowers##45073
|tip Use it on level 20+ characters.
|tip Check around capital cities.
Place Bunny Ears on a Blood Elf |achieve 2422/1
Place Bunny Ears on a Tauren |achieve 2422/9
Place Bunny Ears on a Draenei |achieve 2422/2
Place Bunny Ears on a Human |achieve 2422/6
Place Bunny Ears on a Troll |achieve 2422/10
Place Bunny Ears on a Dwarf |achieve 2422/3
Place Bunny Ears on a Night Elf |achieve 2422/7
Place Bunny Ears on a Gnome |achieve 2422/4
Place Bunny Ears on an Orc |achieve 2422/8
Place Bunny Ears on a Goblin |achieve 2422/5
Place Bunny Ears on an Undead |achieve 2422/11
Place Bunny Ears on a Worgen |achieve 2422/12
step
Earn the "Shake Your Bunny-Maker" Achievement |achieve 2422
step
_Congratulations!_
You Earned the "Shake Your Bunny-Maker" Achievement.
]])
GoatQuest:RegisterGuide("Events Guides\\Noblegarden\\Achievements\\Spring Fling",{
description="Find your pet Spring Rabbit another one to love in each of the towns listed below:\n\n"..
"Bloodhoof Village\nBrill\nFalconwing Square\nRazor Hill",
condition_suggested=function() return isevent('Noblegarden') end,
achieveid={2497},
patch='30100',
keywords={"Noblegarden, Achievement, Noble, Garden"},
},[[
step
talk Warchief's Herald##49750
accept Battle for Azeroth: Mission Statement##51443 |goto Orgrimmar/1 49.39,76.57
|tip This quest is required to unlock access to Zidormi in Tirisfal Glades.
step
Speak to Warchief Sylvanas Windrunner in Orgrimmar |q 51443/1 |goto Orgrimmar/1 48.61,71.98
|tip Inside the building.
step
Watch the dialogue
|tip Inside the building.
Meet Your Team |q 51443/2 |goto Orgrimmar/1 54.44,78.43
step
talk Nathanos Blightcaller##135205
|tip Inside the building.
turnin Battle for Azeroth: Mission Statement##51443 |goto Orgrimmar/1 54.44,78.43
step
click Brightly Colored Egg##113768+
|tip There is at least one available at all times.
|tip They look like multicolored eggs near objects and buildings around this area.
use the Brightly Colored Egg##45072+
collect 100 Noblegarden Chocolate##44791 |goto Durotar/0 52.58,42.81 |or
'|complete achieved(2497) |or
step
talk Noblegarden Merchant##32837
buy 1 Spring Rabbit's Foot##44794 |goto Durotar/0 51.90,41.86 |or
'|complete achieved(2497) |or
step
use the Spring Rabbit's Foot##44794
Learn the "Spring Rabbit" Battle Pet |learnpet Spring Rabbit##200 |or
'|complete achieved(2497) |or
step
Find Your Spring Rabbit Another to Love in Razor Hill |achieve 2497/4 |goto Durotar/0 52.61,42.44
|tip Summon your Spring Rabbit and find another player who has one summoned.
|tip Spring Rabbits are white with brown spots.
|tip Walk near the other player's rabbit to get credit.
step
Find Your Spring Rabbit Another to Love in Bloodhoof Village |achieve 2497/1 |goto Mulgore/0 47.44,59.15
|tip Summon your Spring Rabbit and find another player who has one summoned.
|tip Spring Rabbits are white with brown spots.
|tip Walk near the other player's rabbit to get credit.
step
talk Zidormi##141488
Select _"Can you show me what Tirisfal Glades was like before the Battle for Lordaeron?"_
Travel to the Past |complete GQ.InPhase('Old Undercity') |goto Tirisfal Glades/0 69.46,62.80 |or
'|complete achieved(2497) |or
step
Find Your Spring Rabbit Another to Love in Brill |achieve 2497/2 |goto Tirisfal Glades/0 61.00,52.74
|tip Summon your Spring Rabbit and find another player who has one summoned.
|tip Spring Rabbits are white with brown spots.
|tip Walk near the other player's rabbit to get credit.
step
Find Your Spring Rabbit Another to Love in Falconwing Square |achieve 2497/3 |goto Eversong Woods/0 46.82,46.25
|tip Summon your Spring Rabbit and find another player who has one summoned.
|tip Spring Rabbits are white with brown spots.
|tip Walk near the other player's rabbit to get credit.
step
Earn the "Spring Fling" Achievement |achieve 2497
step
_Congratulations!_
You Earned the "Spring Fling" Achievement.
]])
GoatQuest:RegisterGuide("Events Guides\\Noblegarden\\Achievements\\Sunday's Finest",{
description="Discover the White Tuxedo Shirt and Black Tuxedo Pants by opening Brightly Colored Eggs during the Noblegarden celebration.",
condition_suggested=function() return isevent('Noblegarden') end,
achieveid={248},
patch='30008',
keywords={"Noblegarden, Achievement, Noble, Garden"},
},[[
step
click Brightly Colored Egg##113768+
|tip There is at least one available at all times.
|tip They look like multicolored eggs near objects and buildings around this area.
|tip You may need to loot hundreds, if not thousands of these eggs.
use the Brightly Colored Egg##45072+
collect 1 White Tuxedo Shirt##6833 |achieve 248/1 |goto Durotar/0 52.58,42.81 |or
'|complete achieved(248) |or
step
click Brightly Colored Egg##113768+
|tip There is at least one available at all times.
|tip They look like multicolored eggs near objects and buildings around this area.
|tip You may need to loot hundreds, if not thousands of these eggs.
use the Brightly Colored Egg##45072+
collect 1 Black Tuxedo Pants##151804 |achieve 248/2 |goto Durotar/0 52.58,42.81 |or
'|complete achieved(248) |or
step
Earn the "Sunday's Finest" Achievement |achieve 248
step
_Congratulations!_
You Earned the "Sunday's Finest" Achievement.
]])
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Pilgrim's Bounty\\Quests\\Pilgrim's Bounty Quests")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Pilgrim's Bounty\\Quests\\Pilgrim's Bounty Daily Quests")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Pilgrim's Bounty\\Achievements\\FOOD FIGHT!")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Pilgrim's Bounty\\Achievements\\Now We're Cookin'")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Pilgrim's Bounty\\Achievements\\Pilgrim")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Pilgrim's Bounty\\Achievements\\Pilgrim's Paunch")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Pilgrim's Bounty\\Achievements\\Pilgrim's Peril")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Pilgrim's Bounty\\Achievements\\Pilgrim's Progress")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Pilgrim's Bounty\\Achievements\\Sharing is Caring")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Pilgrim's Bounty\\Achievements\\Terokkar Turkey Time")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Pilgrim's Bounty\\Achievements\\Turkey Lurkey")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Pilgrim's Bounty\\Achievements\\The Turkinator")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Battle for Azeroth\\Incursions")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Battle for Azeroth\\The Fate of Saurfang")
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Battle for Azeroth\\Trouble in Darkshore (Darkshore Warfront Unlock)")
