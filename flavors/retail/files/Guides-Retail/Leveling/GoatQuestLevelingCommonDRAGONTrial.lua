local GoatQuest=GoatQuest
if not GoatQuest then return end
if GQ:DoMutex("LevelingCDRAGON") then return end
GoatQuest.GuideMenuTier = "TRI"
GoatQuest:RegisterGuide("Leveling Guides\\Startup Guide Wizard",{
condition_visible=function() return false end,
noscoring = true,
orientation = true,
},[[
step
Welcome to the GoatQuest Startup Wizard!
In order for GoatQuest to perform at its best we need to collect some character data.
This wizard will walk you through a few simple steps to do this.
confirm begin
step
Use the original desktop client to install Trend Data. |complete (GQ.Gold.servertrends ~= nil)
|tip This is needed for the Gold Guide. You can configure your servers in the Settings under Trend Data.
reload
confirm skip
step
findcity Main City
|tip You need to be in a capital city for the upcoming steps.
step
talknpcs Auctioneer |autoscript GQ.ATWereEnabled=GQ.db.profile.auction_enable GQ.db.profile.auction_enable=true
Click the Scan button in the bottom right corner.
Record auction pricing data for the Gold Guide |complete GQ.Gold:LastScan(15)
step
talknpcs Banker
Record the items you have placed in your bank inventory. |complete GQ.Inventory:CharacterBankKnown()
step
talknpcs Flightmaster
Record what flight points you have for the Travel System. | complete LibTaxi:IsContinentKnown()
step
openskill Alchemy
|only if hasprofunscanned("Alchemy")
Record your profession data for the Gold Guide. |complete hasprof("Alchemy",1)
step
openskill Blacksmithing
|only if hasprofunscanned("Blacksmithing")
Record your profession data for the Gold Guide. |complete hasprof("Blacksmithing",1)
step
openskill Cooking
|only if hasprofunscanned("Cooking")
Record your profession data for the Gold Guide. |complete hasprof("Cooking",1)
step
openskill Enchanting
|only if hasprofunscanned("Enchanting")
Record your profession data for the Gold Guide. |complete hasprof("Enchanting",1)
step
openskill Engineering
|only if hasprofunscanned("Engineering")
Record your profession data for the Gold Guide. |complete hasprof("Engineering",1)
step
openskill First Aid
|only if hasprofunscanned("First Aid")
Record your profession data for the Gold Guide. |complete hasprof("First Aid",1)
step
openskill Fishing
|only if hasprofunscanned("Fishing")
Record your profession data for the Gold Guide. |complete hasprof("Fishing",1)
step
openskill Herbalism
|only if hasprofunscanned("Herbalism")
Record your profession data for the Gold Guide. |complete hasprof("Herbalism",1)
step
openskill Inscription
|only if hasprofunscanned("Inscription")
Record your profession data for the Gold Guide. |complete hasprof("Inscription",1)
step
openskill Jewelcrafting
|only if hasprofunscanned("Jewelcrafting")
Record your profession data for the Gold Guide. |complete hasprof("Jewelcrafting",1)
step
openskill Leatherworking
|only if hasprofunscanned("Leatherworking")
Record your profession data for the Gold Guide. |complete hasprof("Leatherworking",1)
step
openskill Mining
|only if hasprofunscanned("Mining")
Record your profession data for the Gold Guide. |complete hasprof("Mining",1)
step
openskill Skinning
|only if hasprofunscanned("Skinning")
Record your profession data for the Gold Guide. |complete hasprof("Skinning",1)
step
openskill Tailoring
|only if hasprofunscanned("Tailoring")
Record your profession data for the Gold Guide. |complete hasprof("Tailoring",1)
step
You''re all set!
]])
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Starter Guides\\Dracthyr Starter (10-15)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Dragonflight (10-70)\\Full Zones (Story + Side Quests)\\Intro & The Waking Shores (Full Zone)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Dragonflight (10-70)\\Full Zones (Story + Side Quests)\\Ohn'ahran Plains (Full Zone)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Dragonflight (10-70)\\Full Zones (Story + Side Quests)\\The Azure Span (Full Zone)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Dragonflight (10-70)\\Full Zones (Story + Side Quests)\\Thaldraszus (Full Zone)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Dragonflight (10-70)\\Story Campaigns\\Intro & The Waking Shores (Story Only)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Dragonflight (10-70)\\Story Campaigns\\Ohn'ahran Plains (Story Only)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Dragonflight (10-70)\\Story Campaigns\\The Azure Span (Story Only)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Dragonflight (10-70)\\Story Campaigns\\Thaldraszus (Story Only)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Dragonflight (10-70)\\Dragon Glyphs\\Dragon Glyphs (All Zones)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Dragonflight (10-70)\\Dragonriding World Tour")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Dragonflight (10-70)\\Dragonflight Campaign")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Dragonflight (10-70)\\The Forbidden Reach")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Dragonflight (10-70)\\Old Hatreds Questline")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Dragonflight (10-70)\\The Forbidden Reach Side Quests")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Dragonflight (10-70)\\Dragon Glyphs\\Dragon Glyphs (Zaralek Cavern)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Dragonflight (10-70)\\Zaralek Cavern")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Dragonflight (10-70)\\Snail Racing")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Dragonflight (10-70)\\The Blue Dragonflight's Legacy")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Dragonflight (10-70)\\Tyr's Fall")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Dragonflight (10-70)\\Rebel Resurgence")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Dragonflight (10-70)\\Some Wicked Things (Warlock)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Dragonflight (10-70)\\Augmentation Questline (Evoker)")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Dragonflight (10-70)\\The Coalition of Flames")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Dragonflight (10-70)\\Reforging the Tyr's Guard")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Dragonflight (10-70)\\Bronze Reconciliation")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Dragonflight (10-70)\\Emerald Dream Campaign")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Dragonflight (10-70)\\Emerald Dream Campaign + Side Quests")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Dragonflight (10-70)\\Wrathion's Questline")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Dragonflight (10-70)\\Tyr's Return")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Dragonflight (10-70)\\Seeing Red")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Dragonflight (10-70)\\The Reclaiming of Gilneas")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Dragonflight (10-70)\\Sins of the Sister")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Dragonflight (10-70)\\Champion of the Dragonflights")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\Dragonflight (10-70)\\Hunt for the Harbinger")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\The War Within (70-80)\\Warbands")
GoatQuest:RegisterGuidePlaceholder("Leveling Guides\\The War Within (70-80)\\Visions of Azeroth")
