local name,GQ = ...

-- #GLOBALS GoatQuest

local GuideMenu = GQ.GuideMenu

GuideMenu.Featured={}


table.insert(GuideMenu.Featured,{
	title="Patch 12.1.0 - The Curse of Ula’tek", group="patch_120100",
{"section", text=[[LEVELING]]},
        {"banner", image=GQ.IMAGESDIR.."Patch120100Leveling",showcaseonly=true},

	{"content", text=[[Explore The Coiled Isle and the Vaults of Atal'Utek]]},
	{"columns",
	{"item", text=[[**The Curse of Ula'tek Campaign**]], guide="Leveling Guides\\Midnight (80-90)\\Extra Storylines\\The Curse of Ula'tek Campaign"},
	{"item", text=[[**The Coiled Isle/Ula'tek Campaign**]], guide="Leveling Guides\\Midnight (80-90)\\Full Zones (Story + Side Quests)\\The Coiled Isle/Ula'tek Campaign"},
	}, --columnsend
	{"text", text=[[**Note:** The campaign continues from the chapter released in the previous patch. Load The Coiled Isle/Ula'tek Campaign if you want to complete all of the side quests too.]]},

	{"content", text=[[Complete the second season of the Prey system]]},
	{"columns",
	{"item", text=[[**Prey: Season 2**]], guide="Leveling Guides\\Midnight (80-90)\\Extra Storylines\\Prey: Season 2"},
	}, --columnsend

	{"content", text=[[Complete the introduction to the second season of delves]]},
	{"columns",
	{"item", text=[[**Delves: Season 2**]], guide="Leveling Guides\\Midnight (80-90)\\Extra Storylines\\Delves: Season 2"},
	}, --columnsend
	{"text", text=[[**Note:** Season 2 of Prey and Delves begins on August 18.]]},

	{"content", text=[[Learn about the new season item upgrade system]]},
	{"columns",
	{"item", text=[[**Item Upgrade Tutorial 12.1**]], guide="Leveling Guides\\Midnight (80-90)\\Extra Storylines\\Item Upgrade Tutorial 12.1"},
	}, --columnsend
	
{"section", text=[[DAILIES]]},
	{"banner", image=GQ.IMAGESDIR.."Patch120100Dailies",showcaseonly=true},

	{"content", text=[[Complete world quests in The Coiled Isle]]},
	{"columns",
	{"item", text=[[**The Coiled Isle World Quests**]], guide="Daily Guides\\Midnight\\World Quests\\The Coiled Isle World Quests"},
	}, --columnsend

	{"content", text=[[Complete daily quests in The Vaults of Atal'Utek]]},
	{"columns",
	{"item", text=[[**The Vaults of Atal'Utek Dailies**]], guide="Daily Guides\\Midnight\\The Vaults of Atal'Utek Dailies"},
	}, --columnsend

	{"content", text=[[Complete Fishing dailies for Captain Tokka reputation]]},
	{"columns",
	{"item", text=[[**Captain Tokka Dailies**]], guide="Daily Guides\\Midnight\\Captain Tokka Dailies"},
	}, --columnsend
	
{"section", text=[[DUNGEONS]]},
	{"banner", image=GQ.IMAGESDIR.."Patch120100Dungeons",showcaseonly=true},

	{"content", text=[[Defeat the three bosses of the Altar of Fangs dungeon]]},
	{"columns",
	{"item", text=[[**Altar of Fangs**]], guide="Dungeon Guides\\Midnight Dungeons\\Altar of Fangs"},
	}, --columnsend

	{"content", text=[[Face the eight bosses of the Amani troll themed Venomous Abyss raid]]},
	{"columns",
	{"item", text=[[**The Venomous Abyss**]], guide="Dungeon Guides\\Midnight Raids\\Venomous Abyss"},
	}, --columnsend
	
{"section", text=[[EVENTS]]},
	{"banner", image=GQ.IMAGESDIR.."Patch120005Events",showcaseonly=true},
	{"content", text=[[Enter The Vaults of Atal'Utek and complete patrols, strikes, and incursions]]},
	{"columns",
	{"item", text=[[**The Vaults of Atal'Utek**]], guide="Events Guides\\Midnight (80-90)\\The Vaults of Atal'Utek"},
	}, --columnsend

	{"content", text=[[Battle powerful enemies in Curse Surge events]]},
	{"columns",
	{"item", text=[[**The Broodmother's Nest**]], guide="Events Guides\\Midnight (80-90)\\Curse Surges\\The Broodmother's Nest"},
	{"item", text=[[**The Malformed Leviathan**]], guide="Events Guides\\Midnight (80-90)\\Curse Surges\\The Malformed Leviathan"},
	{"item", text=[[**Mlurkkr Massacre**]], guide="Events Guides\\Midnight (80-90)\\Curse Surges\\Mlurkkr Massacre"},
	{"item", text=[[**Siege at the Whispering Marsh**]], guide="Events Guides\\Midnight (80-90)\\Curse Surges\\Siege at the Whispering Marsh"},
	{"item", text=[[**The Looming Mutagenitor**]], guide="Events Guides\\Midnight (80-90)\\Curse Surges\\The Looming Mutagenitor"},
	}, --columnsend
})


table.insert(GuideMenu.Featured,{
	title="Patch 12.0.7 - Revelations", group="patch_120007",
{"section", text=[[LEVELING]]},
        {"banner", image=GQ.IMAGESDIR.."Patch120007Leveling",showcaseonly=true},
	{"content", text=[[Travel to Val and Naigtal to deal with the leaders of the Void]]},
	{"columns",
	{"item", text=[[**Assault and Strike Back (Val)**]], guide="Leveling Guides\\Midnight (80-90)\\Extra Storylines\\Assault and Strike Back (Val)"},
	{"item", text=[[**Assault and Strike Back (Naigtal)**]], guide="Leveling Guides\\Midnight (80-90)\\Extra Storylines\\Assault and Strike Back (Naigtal)"},
	}, --columnsend
	{"text", text=[[**Note:** Val and Naigtal maps alternate each weekly reset. Only one is available per week.]]},

	{"content", text=[[Gain new power with the Sunstrider Omnium]]},
	{"columns",
	{"item", text=[[**The Sunstrider Omnium**]], guide="Leveling Guides\\Midnight (80-90)\\Extra Storylines\\The Sunstrider Omnium"},
	}, --columnsend

	{"content", text=[[Attend the gathering of the Haranir and uncover the truth of the Amani trolls]]},
	{"columns",
	{"item", text=[[**The Curse of Ula'tek Campaign**]], guide="Leveling Guides\\Midnight (80-90)\\Extra Storylines\\The Curse of Ula'tek Campaign"},
	}, --columnsend
	{"text", text=[[**Note:** The campaign will be released in weekly chapters on July 7 and content will be added as it becomes available.]]},

	{"content", text=[[Go Lorewalking with the Loa]]},
	{"columns",
	{"item", text=[[**Lorewalking**]], guide="Leveling Guides\\Midnight (80-90)\\Extra Storylines\\Lorewalking"},
	}, --columnsend
	
{"section", text=[[DAILIES]]},
	{"banner", image=GQ.IMAGESDIR.."Patch120007Dailies",showcaseonly=true},
	{"content", text=[[Complete world quests in Val and Naigtal]]},
	{"columns",
	{"item", text=[[**Val World Quests**]], guide="Daily Guides\\Midnight\\World Quests\\Val World Quests"},
	{"item", text=[[**Naigtal World Quests**]], guide="Daily Guides\\Midnight\\World Quests\\Naigtal World Quests"},
	}, --columnsend
	
{"section", text=[[DUNGEONS]]},
	{"banner", image=GQ.IMAGESDIR.."Patch120007Dungeons",showcaseonly=true},
	{"content", text=[[Face Rotmire in the Sporefall raid]]},
	{"columns",
	{"item", text=[[**Sporefall**]], guide="Dungeon Guides\\Midnight Raids\\Sporefall"},
	}, --columnsend
})




table.insert(GuideMenu.Featured,{
	title="Patch 12.0.5 - Lingering Shadows", group="patch_120005",
{"section", text=[[LEVELING]]},
        {"banner", image=GQ.IMAGESDIR.."Patch120005Leveling",showcaseonly=true},
	{"content", text=[[Complete the intro quests to unlock Ritual Sites and Void Incursions]]},
	{"columns",
	{"item", text=[[**Ritual Site and Void Incursion Quest Guide**]], guide="Leveling Guides\\Midnight (80-90)\\Extra Storylines\\Ritual Site and Void Incursion Quest Guide"},
	}, --columnsend
	
{"section", text=[[EVENTS]]},
	{"banner", image=GQ.IMAGESDIR.."Patch120005Events",showcaseonly=true},
	{"content", text=[[Complete Void Assaults and Ritual Sites or try you skill against the Abyss Anglers event]]},
	{"columns",
	{"item", text=[[**Eversong Woods Void Assaults**]], guide="Events Guides\\Midnight (80-90)\\Eversong Woods Void Assaults"},
	{"item", text=[[**Zul'Aman Void Assaults**]], guide="Events Guides\\Midnight (80-90)\\Zul'Aman Void Assaults"},
	{"item", text=[[**Eversong Woods Ritual Site**]], guide="Events Guides\\Midnight (80-90)\\Eversong Woods Ritual Site"},
	{"item", text=[[**Zul'Aman Ritual Site**]], guide="Events Guides\\Midnight (80-90)\\Zul'Aman Ritual Site"},
	{"item", text=[[**Abyss Anglers**]], guide="Events Guides\\Midnight (80-90)\\Abyss Anglers"},
	}, --columnsend
})


table.insert(GuideMenu.Featured,{
	title="Patch 12.0.1 - Midnight", group="patch_120000",
{"section", text=[[LEVELING]]},
	{"banner", image=GQ.IMAGESDIR.."Patch120001Leveling",showcaseonly=true},
	{"content", text=[[Earn Sojourner for each Midnight leveling zone as you level]]},
	{"columns",
	{"item", text=[[**Midnight Intro & Campaign (Full Zone)**]], guide="Leveling Guides\\Midnight (80-90)\\Full Zones (Story + Side Quests)\\Midnight Intro & Campaign (Full Zone)"},
	{"item", text=[[**Eversong Woods (Full Zone)**]], guide="Leveling Guides\\Midnight (80-90)\\Full Zones (Story + Side Quests)\\Eversong Woods (Full Zone)"},
	{"item", text=[[**Zul'Aman (Full Zone)**]], guide="Leveling Guides\\Midnight (80-90)\\Full Zones (Story + Side Quests)\\Zul'Aman (Full Zone)"},
	{"item", text=[[**Harandar (Full Zone)**]], guide="Leveling Guides\\Midnight (80-90)\\Full Zones (Story + Side Quests)\\Harandar (Full Zone)"},
	{"item", text=[[**Arator's Journey (Full Zone)**]], guide="Leveling Guides\\Midnight (80-90)\\Full Zones (Story + Side Quests)\\Arator's Journey (Full Zone)"},
	{"item", text=[[**Voidstorm (Full Zone)**]], guide="Leveling Guides\\Midnight (80-90)\\Full Zones (Story + Side Quests)\\Voidstorm (Full Zone)"},
	}, --columnsend
	{"text", text=[[**Note:** Follow this order on your first character until you earn the Midnight achievement on your account:]]},
	--{"text", text=[[]]},
	{"text", text=[[**First:** Load the Midnight Intro & Campaign (Full Zone) and work through it until it sends you to Eversong Woods (Full Zone).]]},
	{"text", text=[[**Second:** When you finish Eversong and reach the mission table step, complete the  Zul'Aman (Full Zone) and Arator's Journey (Full Zone) guides.]]},
	{"text", text=[[**Third:** At the mission table again, complete the Harandar (Story Only) guide.]]},
	{"text", text=[[**Finally:** Proceed to complete the Voidstorm (Story Only) guide and reach 90.]]},
	{"text", text=[[**Note:** Some quests require level 90 and you will need to reload each guide after reaching 90 to complete them.]]},
	{"text", text=[[**Note:** For your first playthrough, some Sojourjner chapters may require you to complete the zone for the achievement before reloading the guide.]]},

	{"content", text=[[Level through each Midnight zone and the Arator's Journey story]]},
	{"columns",
	{"item", text=[[**Midnight Intro & Campaign (Story Only)**]], guide="Leveling Guides\\Midnight (80-90)\\Story Campaigns\\Midnight Intro & Campaign (Story Only)"},
	{"item", text=[[**Eversong Woods (Story Only)**]], guide="Leveling Guides\\Midnight (80-90)\\Story Campaigns\\Eversong Woods (Story Only)"},
	{"item", text=[[**Zul'Aman (Story Only)**]], guide="Leveling Guides\\Midnight (80-90)\\Story Campaigns\\Zul'Aman (Story Only)"},
	{"item", text=[[**Harandar (Story Only)**]], guide="Leveling Guides\\Midnight (80-90)\\Story Campaigns\\Harandar (Story Only)"},
	{"item", text=[[**Arator's Journey (Story Only)**]], guide="Leveling Guides\\Midnight (80-90)\\Story Campaigns\\Arator's Journey (Story Only)"},
	{"item", text=[[**Voidstorm (Story Only)**]], guide="Leveling Guides\\Midnight (80-90)\\Story Campaigns\\Voidstorm (Story Only)"},
	}, --columnsend

	{"content", text=[[Make a new Haranir character]]},
	{"columns",
	{"item", text=[[**Haranir Starter**]], guide="Leveling Guides\\Starter Guides\\Haranir Starter", faction="A"},
	{"item", text=[[**Haranir Starter**]], guide="Leveling Guides\\Starter Guides\\Haranir Starter", faction="H"},
	}, --columnsend
	{"text", text=[[**Note:** Complete the Harandar guide on a character to earn the Allied Race: Haranir achievement to make a Haranir character.]]},

	{"content", text=[[Complete extra storylines to unlock various Midnight features]]},
	{"columns",
	{"item", text=[[**Abundance**]], guide="Leveling Guides\\Midnight (80-90)\\Extra Storylines\\Abundance"},
	{"item", text=[[**Catalyst**]], guide="Leveling Guides\\Midnight (80-90)\\Extra Storylines\\Catalyst"},
	{"item", text=[[**Item Upgrade Tutorial**]], guide="Leveling Guides\\Midnight (80-90)\\Extra Storylines\\Item Upgrade Tutorial"},
	{"item", text=[[**Nulling Nullaeus**]], guide="Leveling Guides\\Midnight (80-90)\\Extra Storylines\\Nulling Nullaeus"},
	{"item", text=[[**Pet Wranglin'**]], guide="Leveling Guides\\Midnight (80-90)\\Extra Storylines\\Pet Wranglin'"},
	{"item", text=[[**The Crimson Rogue**]], guide="Leveling Guides\\Midnight (80-90)\\Extra Storylines\\The Crimson Rogue"},
	{"item", text=[[**The Great Vault**]], guide="Leveling Guides\\Midnight (80-90)\\Extra Storylines\\The Great Vault"},
	}, --columnsend
	{"text", text=[[**Note:** Most of these do not start until March 17.]]},
	
{"section", text=[[DAILIES]]},
	{"banner", image=GQ.IMAGESDIR.."Patch120001Dailies",showcaseonly=true},
	{"content", text=[[Complete world quests across each Midnight zone]]},
	{"columns",
	{"item", text=[[**Eversong Woods World Quests**]], guide="Daily Guides\\Midnight\\World Quests\\Eversong Woods World Quests"},
	{"item", text=[[**Harandar World Quests**]], guide="Daily Guides\\Midnight\\World Quests\\Harandar World Quests"},
	{"item", text=[[**Voidstorm World Quests**]], guide="Daily Guides\\Midnight\\World Quests\\Voidstorm World Quests"},
	{"item", text=[[**Zul'Aman World Quests**]], guide="Daily Guides\\Midnight\\World Quests\\Zul'Aman World Quests"},
	}, --columnsend
	{"text", text=[[**Note:** To unlock world quests account-wide, you need to complete the primary leveling campaign and reach level 90 on one character to earn the Midnight achievement.]]},
	
{"section", text=[[DUNGEONS]]},
	{"banner", image=GQ.IMAGESDIR.."Patch120001Dungeons",showcaseonly=true},
	{"content", text=[[Midnight Dungeons]]},
	{"columns",
	{"item", text=[[**Den of Nalorakk**]], guide="Dungeon Guides\\Midnight Dungeons\\Den of Nalorakk"},
	{"item", text=[[**Magister's Terrace**]], guide="Dungeon Guides\\Midnight Dungeons\\Magister's Terrace"},
	{"item", text=[[**Murder Row**]], guide="Dungeon Guides\\Midnight Dungeons\\Murder Row"},
	{"item", text=[[**Windrunner Spire**]], guide="Dungeon Guides\\Midnight Dungeons\\Windrunner Spire"},
	{"item", text=[[**Maisara Caverns**]], guide="Dungeon Guides\\Midnight Dungeons\\Maisara Caverns"},
	{"item", text=[[**Nexus Point Xenas**]], guide="Dungeon Guides\\Midnight Dungeons\\Nexus Point Xenas"},
	{"item", text=[[**The Blinding Vale**]], guide="Dungeon Guides\\Midnight Dungeons\\The Blinding Vale"},
	{"item", text=[[**Voidscar Arena**]], guide="Dungeon Guides\\Midnight Dungeons\\Voidscar Arena"},
	}, --columnsend

	{"content", text=[[Midnight Raids]]},
	{"columns",
	{"item", text=[[**The Voidspire**]], guide="Dungeon Guides\\Midnight Raids\\The Voidspire"},
	{"item", text=[[**The Dreamrift**]], guide="Dungeon Guides\\Midnight Raids\\The Dreamrift"},
	--{"item", text=[[**March on Quel'Danas**]], guide="Dungeon Guides\\Midnight Raids\\March on Quel'Danas"},
	}, --columnsend


{"section", text=[[PROFESSIONS]]},
	{"banner", image=GQ.IMAGESDIR.."Patch120001Professions",showcaseonly=true},

	{"content", text=[[Gathering Professions]]},

	{"columns",
	{"item", text=[[**Midnight Herbalism 1-100**]], guide="Profession Guides\\Herbalism\\Leveling Guides\\Midnight Herbalism 1-100"},
	{"item", text=[[**Midnight Mining 1-100**]], guide="Profession Guides\\Mining\\Leveling Guides\\Midnight Mining 1-100"},
	{"item", text=[[**Midnight Skinning 1-100**]], guide="Profession Guides\\Skinning\\Leveling Guides\\Midnight Skinning 1-100"},
	{"item", text=[[**Midnight Fishing 1-100**]], guide="Profession Guides\\Fishing\\Leveling Guides\\Midnight Fishing 1-100"},
	}, --columnsend

	{"content", text=[[Crafting Professions]]},

	{"columns",
	{"item", text=[[**Midnight Alchemy (1-100)**]], guide="Profession Guides\\Alchemy\\Leveling Guides\\Midnight Alchemy (1-100)"},
	{"item", text=[[**Midnight Blacksmithing 1-100**]], guide="Profession Guides\\Blacksmithing\\Leveling Guides\\Midnight Blacksmithing 1-100"},
	{"item", text=[[**Midnight Cooking 1-100**]], guide="Profession Guides\\Cooking\\Leveling Guides\\Midnight Cooking 1-100"},
	{"item", text=[[**Midnight Enchanting 1-100**]], guide="Profession Guides\\Enchanting\\Leveling Guides\\Midnight Enchanting 1-100"},
	{"item", text=[[**Midnight Engineering 1-100**]], guide="Profession Guides\\Engineering\\Leveling Guides\\Midnight Engineering 1-100"},
	{"item", text=[[**Midnight Inscription 1-100**]], guide="Profession Guides\\Inscription\\Leveling Guides\\Midnight Inscription 1-100"},
	{"item", text=[[**Midnight Jewelcrafting 1-100**]], guide="Profession Guides\\Jewelcrafting\\Leveling Guides\\Midnight Jewelcrafting 1-100"},
	{"item", text=[[**Midnight Leatherworking 1-100**]], guide="Profession Guides\\Leatherworking\\Leveling Guides\\Midnight Leatherworking 1-100"},
	{"item", text=[[**Midnight Tailoring 1-100**]], guide="Profession Guides\\Tailoring\\Leveling Guides\\Midnight Tailoring 1-100"},
	}, --columnsend

	{"content", text=[[Fishing Farming Guides]]},

	--{"columns",
	{"item", text=[[**Arcane Wyrmfish**]], guide="Profession Guides\\Fishing\\Farming Guides\\Arcane Wyrmfish"},
	{"item", text=[[**Gore Guppy**]], guide="Profession Guides\\Fishing\\Farming Guides\\Gore Guppy"},
	{"item", text=[[**Lynxfish**]], guide="Profession Guides\\Fishing\\Farming Guides\\Lynxfish"},
	{"item", text=[[**Root Crab**]], guide="Profession Guides\\Fishing\\Farming Guides\\Root Crab"},
	{"item", text=[[**Sin'dorei Swarmer**]], guide="Profession Guides\\Fishing\\Farming Guides\\Sin'dorei Swarmer"},
	{"item", text=[[**Blood Hunter**]], guide="Profession Guides\\Fishing\\Farming Guides\\Blood Hunter"},
	{"item", text=[[**Bloomtail Minnow**]], guide="Profession Guides\\Fishing\\Farming Guides\\Bloomtail Minnow"},
	{"item", text=[[**Fungalskin Pike**]], guide="Profession Guides\\Fishing\\Farming Guides\\Fungalskin Pike"},
	{"item", text=[[**Restored Songfish**]], guide="Profession Guides\\Fishing\\Farming Guides\\Restored Songfish"},
	{"item", text=[[**Shimmer Spinefish**]], guide="Profession Guides\\Fishing\\Farming Guides\\Shimmer Spinefish"},
	{"item", text=[[**Shimmersiren**]], guide="Profession Guides\\Fishing\\Farming Guides\\Shimmersiren"},
	{"item", text=[[**Sunwell Fish**]], guide="Profession Guides\\Fishing\\Farming Guides\\Sunwell Fish"},
	{"item", text=[[**Tender Lumifin**]], guide="Profession Guides\\Fishing\\Farming Guides\\Tender Lumifin"},
	{"item", text=[[**Eversong Trout**]], guide="Profession Guides\\Fishing\\Farming Guides\\Eversong Trout"},
	{"item", text=[[**Hollow Grouper**]], guide="Profession Guides\\Fishing\\Farming Guides\\Hollow Grouper"},
	{"item", text=[[**Lucky Loa**]], guide="Profession Guides\\Fishing\\Farming Guides\\Lucky Loa"},
	{"item", text=[[**Null Voidfish**]], guide="Profession Guides\\Fishing\\Farming Guides\\Null Voidfish"},
	{"item", text=[[**Ominous Octopus**]], guide="Profession Guides\\Fishing\\Farming Guides\\Ominous Octopus"},
	{"item", text=[[**Twisted Tetra**]], guide="Profession Guides\\Fishing\\Farming Guides\\Twisted Tetra"},
	{"item", text=[[**Warping Wise**]], guide="Profession Guides\\Fishing\\Farming Guides\\Warping Wise"},
	--}, --columnsend

	{"content", text=[[Herbalism Farming Guides]]},

	{"columns",
	{"item", text=[[**Sanguithorn (Eversong Woods)**]], guide="Profession Guides\\Herbalism\\Farming Guides\\Sanguithorn (Eversong Woods)"},
	{"item", text=[[**Sanguithorn (Zul Aman)**]], guide="Profession Guides\\Herbalism\\Farming Guides\\Sanguithorn (Zul Aman)"},
	{"item", text=[[**Sanguithorn (Harandar)**]], guide="Profession Guides\\Herbalism\\Farming Guides\\Sanguithorn (Harandar)"},
	{"item", text=[[**Sanguithorn (Voidstorm)**]], guide="Profession Guides\\Herbalism\\Farming Guides\\Sanguithorn (Voidstorm)"},
	{"item", text=[[**Azeroot (Eversong Woods)**]], guide="Profession Guides\\Herbalism\\Farming Guides\\Azeroot (Eversong Woods)"},
	{"item", text=[[**Azeroot (Zul Aman)**]], guide="Profession Guides\\Herbalism\\Farming Guides\\Azeroot (Zul Aman)"},
	{"item", text=[[**Azeroot (Harandar)**]], guide="Profession Guides\\Herbalism\\Farming Guides\\Azeroot (Harandar)"},
	{"item", text=[[**Azeroot (Voidstorm)**]], guide="Profession Guides\\Herbalism\\Farming Guides\\Azeroot (Voidstorm)"},
	{"item", text=[[**Mana Lily (Eversong Woods)**]], guide="Profession Guides\\Herbalism\\Farming Guides\\Mana Lily (Eversong Woods)"},
	{"item", text=[[**Mana Lily (Zul Aman)**]], guide="Profession Guides\\Herbalism\\Farming Guides\\Mana Lily (Zul Aman)"},
	{"item", text=[[**Mana Lily (Harandar)**]], guide="Profession Guides\\Herbalism\\Farming Guides\\Mana Lily (Harandar)"},
	{"item", text=[[**Mana Lily (Voidstorm)**]], guide="Profession Guides\\Herbalism\\Farming Guides\\Mana Lily (Voidstorm)"},
	{"item", text=[[**Tranquility Bloom (Eversong Woods)**]], guide="Profession Guides\\Herbalism\\Farming Guides\\Tranquility Bloom (Eversong Woods)"},
	{"item", text=[[**Tranquility Bloom (Zul Aman)**]], guide="Profession Guides\\Herbalism\\Farming Guides\\Tranquility Bloom (Zul Aman)"},
	{"item", text=[[**Tranquility Bloom (Harandar)**]], guide="Profession Guides\\Herbalism\\Farming Guides\\Tranquility Bloom (Harandar)"},
	{"item", text=[[**Tranquility Bloom (Voidstorm)**]], guide="Profession Guides\\Herbalism\\Farming Guides\\Tranquility Bloom (Voidstorm)"},
	{"item", text=[[**Argentleaf (Eversong Woods)**]], guide="Profession Guides\\Herbalism\\Farming Guides\\Argentleaf (Eversong Woods)"},
	{"item", text=[[**Argentleaf (Zul Aman)**]], guide="Profession Guides\\Herbalism\\Farming Guides\\Argentleaf (Zul Aman)"},
	{"item", text=[[**Argentleaf (Harandar)**]], guide="Profession Guides\\Herbalism\\Farming Guides\\Argentleaf (Harandar)"},
	{"item", text=[[**Argentleaf (Voidstorm)**]], guide="Profession Guides\\Herbalism\\Farming Guides\\Argentleaf (Voidstorm)"},
	}, --columnsend

	{"content", text=[[Mining Farming Guides]]},

	{"columns",
	{"item", text=[[**Refulgent Copper Ore (Eversong Woods)**]], guide="Profession Guides\\Mining\\Farming Guides\\Refulgent Copper Ore (Eversong Woods)"},
	{"item", text=[[**Refulgent Copper Ore (Zul Aman)**]], guide="Profession Guides\\Mining\\Farming Guides\\Refulgent Copper Ore (Zul Aman)"},
	{"item", text=[[**Refulgent Copper Ore (Harandar)**]], guide="Profession Guides\\Mining\\Farming Guides\\Refulgent Copper Ore (Harandar)"},
	{"item", text=[[**Refulgent Copper Ore (Voidstorm)**]], guide="Profession Guides\\Mining\\Farming Guides\\Refulgent Copper Ore (Voidstorm)"},
	{"item", text=[[**Umbral Tin Ore (Eversong Woods)**]], guide="Profession Guides\\Mining\\Farming Guides\\Umbral Tin Ore (Eversong Woods)"},
	{"item", text=[[**Umbral Tin Ore (Zul Aman)**]], guide="Profession Guides\\Mining\\Farming Guides\\Umbral Tin Ore (Zul Aman)"},
	{"item", text=[[**Umbral Tin Ore (Harandar)**]], guide="Profession Guides\\Mining\\Farming Guides\\Umbral Tin Ore (Harandar)"},
	{"item", text=[[**Umbral Tin Ore (Voidstorm)**]], guide="Profession Guides\\Mining\\Farming Guides\\Umbral Tin Ore (Voidstorm)"},
	{"item", text=[[**Brilliant Silver Ore (Eversong Woods)**]], guide="Profession Guides\\Mining\\Farming Guides\\Brilliant Silver Ore (Eversong Woods)"},
	{"item", text=[[**Brilliant Silver Ore (Zul Aman)**]], guide="Profession Guides\\Mining\\Farming Guides\\Brilliant Silver Ore (Zul Aman)"},
	{"item", text=[[**Brilliant Silver Ore (Harandar)**]], guide="Profession Guides\\Mining\\Farming Guides\\Brilliant Silver Ore (Harandar)"},
	{"item", text=[[**Brilliant Silver Ore (Voidstorm)**]], guide="Profession Guides\\Mining\\Farming Guides\\Brilliant Silver Ore (Voidstorm)"},
	}, --columnsend

	{"content", text=[[Skinning Farming Guides]]},

	{"columns",
	{"item", text=[[**Void-Tempered Leather (Eversong Woods)**]], guide="Profession Guides\\Skinning\\Farming Guides\\Void-Tempered Leather (Eversong Woods)"},
	{"item", text=[[**Void-Tempered Scales (Zul'Aman)**]], guide="Profession Guides\\Skinning\\Farming Guides\\Void-Tempered Scales (Zul'Aman)"},
	--{"item", text=[[**Gloom Chitin (Azj-Kahet)**]], guide="Profession Guides\\Skinning\\Farming Guides\\Gloom Chitin (Azj-Kahet)"},
	--{"item", text=[[**Sunless Carapace (Azj-Kahet)**]], guide="Profession Guides\\Skinning\\Farming Guides\\Sunless Carapace (Azj-Kahet)"},
	}, --columnsend
})


table.insert(GuideMenu.Featured,{
	title="Patch 12.0.0 - Twilight Ascension", group="patch_120000",
{"section", text=[[LEVELING]]},
        {"banner", image=GQ.IMAGESDIR.."Patch120000Leveling",showcaseonly=true},
	{"content", text=[[Complete the Twilight Ascension pre-patch questline]]},
	{"columns",
	{"item", text=[[**The Cult Within**]], guide="Leveling Guides\\Midnight (80-90)\\The Cult Within"},
	}, --columnsend
	{"content", text=[[Unlock the new Void Elf Demon Hunter race/class combination]]},
	{"columns",
	{"item", text=[[**Void Elf Demon Hunter Unlock**]], guide="Leveling Guides\\Allied Races\\Void Elf Demon Hunter Unlock"},
	}, --columnsend
	{"text", text=[[**Note:** You will need to complete part of K'aresh to do this.]]},
	
{"section", text=[[DAILIES]]},
	{"banner", image=GQ.IMAGESDIR.."Patch120000Dailies",showcaseonly=true},
	{"content", text=[[Complete world quests and weekly quests in Twilight Highlands]]},
	{"columns",
	{"item", text=[[**Twilight Highlands World Quests**]], guide="Daily Guides\\Midnight (80-90)\\Twilight Highlands World Quests"},
	{"item", text=[[**Pre-Patch Weeklies**]], guide="Daily Guides\\Midnight (80-90)\\Pre-Patch Weeklies"},
	}, --columnsend
})


table.insert(GuideMenu.Featured,{
	title="Patch 11.2.7 - The Warning", group="patch_110207",
{"section", text=[[LEVELING]]},
        {"banner", image=GQ.IMAGESDIR.."Patch110207Leveling",showcaseonly=true},
	{"content", text=[[Meet with Arator and Vereesa on the Isle of Dorn to discuss Vereesa's disturbing dreams]]},
	{"columns",
	{"item", text=[[**Visions of a Shadowed Sun**]], guide="Leveling Guides\\The War Within (70-80)\\Visions of a Shadowed Sun"},
	}, --columnsend
	{"content", text=[[Learn about the housing system and purchase a plot in a neighborhood]]},
	{"columns",
	{"item", text=[[**Housing Tutorial**]], guide="Leveling Guides\\The War Within (70-80)\\Housing Tutorial", faction="A"},
	{"item", text=[[**Housing Tutorial**]], guide="Leveling Guides\\The War Within (70-80)\\Housing Tutorial", faction="H"},
	}, --columnsend
	{"content", text=[[Complete the Quel'thalas chapter in a new condensed story]]},
	{"columns",
	{"item", text=[[**Lorewalking Recap**]], guide="Leveling Guides\\The War Within (70-80)\\Lorewalking"},
	}, --columnsend
	{"content", text=[[Revisit a chronoligical retelling of The War Within story]]},
	{"columns",
	{"item", text=[[**Lorewalking Recap**]], guide="Leveling Guides\\The War Within (70-80)\\Lorewalking Recap"},
	}, --columnsend
	{"content", text=[[Unlock the heritage armor of the Pandaren race]]},
	{"columns",
	{"item", text=[[**Pandaren Heritage Armor**]], guide="Leveling Guides\\Heritage Armor\\Pandaren Heritage Armor", faction="H"},
	{"item", text=[[**Pandaren Heritage Armor**]], guide="Leveling Guides\\Heritage Armor\\Pandaren Heritage Armor", faction="A"},
	}, --columnsend
	{"content", text=[[Complete the catch up zone in Arathi Highlands]]},
	{"columns",
	{"item", text=[[**Catch Up**]], guide="Leveling Guides\\The War Within (70-80)\\Catch Up"},
	}, --columnsend
}) 



table.insert(GuideMenu.Featured,{
	title="Patch 11.2.5 - Legion Remix", group="patch_110205",
{"section", text=[[LEVELING]]},
	{"banner", image=GQ.IMAGESDIR.."Patch110205Leveling",showcaseonly=true},
	{"content", text=[[Revisit the era of the Legion with Legion Remix]]},
	{"columns",
	{"item", text=[[**Legion Remix Campaign**]], guide="Leveling Guides\\Legion Remix\\Legion Remix Campaign"},
	{"item", text=[[**Legion Intro**]], guide="Leveling Guides\\Legion (10-70)\\Legion Intro"},
	{"item", text=[[**Azsuna**]], guide="Leveling Guides\\Legion (10-70)\\Azsuna"},
	{"item", text=[[**Highmountain**]], guide="Leveling Guides\\Legion (10-70)\\Highmountain"},
	{"item", text=[[**Stormheim**]], guide="Leveling Guides\\Legion (10-70)\\Stormheim"},
	{"item", text=[[**Val'sharah**]], guide="Leveling Guides\\Legion (10-70)\\Val'sharah"},
	{"item", text=[[**Suramar**]], guide="Leveling Guides\\Legion (10-70)\\Suramar"},
	--{"item", text=[[**Broken Shore Campaign**]], guide="Leveling Guides\\Legion (10-70)\\Broken Shore Campaign"},
	--{"item", text=[[**Argus Campaign**]], guide="Leveling Guides\\Legion (10-70)\\Argus Campaign"},
	}, --columnsend
	{"content", text=[[Revisit your class Order Hall]]},
	{"columns",
	{"item", text=[[**Death Knight Intro & Artifacts**]], guide="Leveling Guides\\Legion (10-70)\\Death Knight\\Death Knight Intro & Artifacts",class="Death Knight"},
	{"item", text=[[**Death Knight Order Hall Quests**]], guide="Leveling Guides\\Legion (10-70)\\Death Knight\\Death Knight Order Hall Quests",class="Death Knight"},

	{"item", text=[[**Demon Hunter Intro & Artifacts**]], guide="Leveling Guides\\Legion (10-70)\\Demon Hunter\\Demon Hunter Intro & Artifacts",class="Demon Hunter"},
	{"item", text=[[**Demon Hunter Order Hall Quests**]], guide="Leveling Guides\\Legion (10-70)\\Demon Hunter\\Demon Hunter Order Hall Quests",class="Demon Hunter"},

	{"item", text=[[**Druid Intro & Artifacts**]], guide="Leveling Guides\\Legion (10-70)\\Druid\\Druid Intro & Artifacts",class="Druid"},
	{"item", text=[[**Druid Order Hall Quests**]], guide="Leveling Guides\\Legion (10-70)\\Druid\\Druid Order Hall Quests",class="Druid"},

	{"item", text=[[**Hunter Intro & Artifacts**]], guide="Leveling Guides\\Legion (10-70)\\Hunter\\Hunter Intro & Artifacts",class="Hunter"},
	{"item", text=[[**Hunter Order Hall Quests**]], guide="Leveling Guides\\Legion (10-70)\\Hunter\\Hunter Order Hall Quests",class="Hunter"},

	{"item", text=[[**Mage Intro & Artifacts**]], guide="Leveling Guides\\Legion (10-70)\\Mage\\Mage Intro & Artifacts",class="Mage"},
	{"item", text=[[**Mage Order Hall Quests**]], guide="Leveling Guides\\Legion (10-70)\\Mage\\Mage Order Hall Quests",class="Mage"},

	{"item", text=[[**Monk Intro & Artifacts**]], guide="Leveling Guides\\Legion (10-70)\\Monk\\Monk Intro & Artifacts",class="Monk"},
	{"item", text=[[**Monk Order Hall Quests**]], guide="Leveling Guides\\Legion (10-70)\\Monk\\Monk Order Hall Quests",class="Monk"},

	{"item", text=[[**Paladin Intro & Artifacts**]], guide="Leveling Guides\\Legion (10-70)\\Paladin\\Paladin Intro & Artifacts",class="Paladin"},
	{"item", text=[[**Paladin Order Hall Quests**]], guide="Leveling Guides\\Legion (10-70)\\Paladin\\Paladin Order Hall Quests",class="Paladin"},

	{"item", text=[[**Priest Intro & Artifacts**]], guide="Leveling Guides\\Legion (10-70)\\Priest\\Priest Intro & Artifacts",class="Priest"},
	{"item", text=[[**Priest Order Hall Quests**]], guide="Leveling Guides\\Legion (10-70)\\Priest\\Priest Order Hall Quests",class="Priest"},

	{"item", text=[[**Rogue Intro & Artifacts**]], guide="Leveling Guides\\Legion (10-70)\\Rogue\\Rogue Intro & Artifacts",class="Rogue"},
	{"item", text=[[**Rogue Order Hall Quests**]], guide="Leveling Guides\\Legion (10-70)\\Rogue\\Rogue Order Hall Quests",class="Rogue"},

	{"item", text=[[**Shaman Intro & Artifacts**]], guide="Leveling Guides\\Legion (10-70)\\Shaman\\Shaman Intro & Artifacts",class="Shaman"},
	{"item", text=[[**Shaman Order Hall Quests**]], guide="Leveling Guides\\Legion (10-70)\\Shaman\\Shaman Order Hall Quests",class="Shaman"},

	{"item", text=[[**Warlock Intro & Artifacts**]], guide="Leveling Guides\\Legion (10-70)\\Warlock\\Warlock Intro & Artifacts",class="Warlock"},
	{"item", text=[[**Warlock Order Hall Quests**]], guide="Leveling Guides\\Legion (10-70)\\Warlock\\Warlock Order Hall Quests",class="Warlock"},

	{"item", text=[[**Warrior Intro & Artifacts**]], guide="Leveling Guides\\Legion (10-70)\\Warrior\\Warrior Intro & Artifacts",class="Warrior"},
	{"item", text=[[**Warrior Order Hall Quests**]], guide="Leveling Guides\\Legion (10-70)\\Warrior\\Warrior Order Hall Quests",class="Warrior"},
	}, --columnsend
	
{"section", text=[[DUNGEONS]]},
	{"banner", image=GQ.IMAGESDIR.."Patch110205Dungeons",showcaseonly=true},
	{"content", text=[[Legion Dungeons]]},
	{"columns",
	{"item", text=[[**Assault on Violet Hold**]], guide="Dungeon Guides\\Legion Dungeons\\Assault on Violet Hold"},
	{"item", text=[[**Black Rook Hold**]], guide="Dungeon Guides\\Legion Dungeons\\Black Rook Hold"},
	{"item", text=[[**Darkheart Thicket**]], guide="Dungeon Guides\\Legion Dungeons\\Darkheart Thicket"},
	{"item", text=[[**Eye of Azshara**]], guide="Dungeon Guides\\Legion Dungeons\\Eye of Azshara"},
	{"item", text=[[**Halls of Valor**]], guide="Dungeon Guides\\Legion Dungeons\\Halls of Valor"},
	{"item", text=[[**Maw of Souls**]], guide="Dungeon Guides\\Legion Dungeons\\Maw of Souls"},
	{"item", text=[[**Neltharion's Lair**]], guide="Dungeon Guides\\Legion Dungeons\\Neltharion's Lair"},
	{"item", text=[[**Vault of the Wardens**]], guide="Dungeon Guides\\Legion Dungeons\\Vault of the Wardens"},
	{"item", text=[[**Karazhan Attunement**]], guide="Dungeon Guides\\Legion Dungeons\\Karazhan\\Karazhan Attunement"},
	{"item", text=[[**Return to Karazhan**]], guide="Dungeon Guides\\Legion Dungeons\\Karazhan\\Return to Karazhan"},
	{"item", text=[[**Return to Karazhan - Lower**]], guide="Dungeon Guides\\Legion Dungeons\\Karazhan\\Return to Karazhan - Lower"},
	{"item", text=[[**Return to Karazhan - Upper**]], guide="Dungeon Guides\\Legion Dungeons\\Karazhan\\Return to Karazhan - Upper"},
	--{"item", text=[[**The Arcway**]], guide="Dungeon Guides\\Legion Dungeons\\The Arcway"},
	--{"item", text=[[**Court of Stars**]], guide="Dungeon Guides\\Legion Dungeons\\Court of Stars"},
	--{"item", text=[[**Cathedral of Eternal Night**]], guide="Dungeon Guides\\Legion Dungeons\\Cathedral of Eternal Night"},
	--{"item", text=[[**Seat of the Triumvirate**]], guide="Dungeon Guides\\Legion Dungeons\\Seat of the Triumvirate"},
	}, --columnsend
	{"content", text=[[Legion Raids]]},
	{"columns",
	{"item", text=[[**Emerald Nightmare - Darkbough (LFR)**]], guide="Dungeon Guides\\Legion Raids\\Emerald Nightmare - Darkbough (LFR)"},
	{"item", text=[[**Emerald Nightmare - Rift of Ain (LFR)**]], guide="Dungeon Guides\\Legion Raids\\Emerald Nightmare - Rift of Ain (LFR)"},
	{"item", text=[[**Emerald Nightmare - Tormented Guardians (LFR)**]], guide="Dungeon Guides\\Legion Raids\\Emerald Nightmare - Tormented Guardians (LFR)"},
	{"item", text=[[**Emerald Nightmare - Normal/Heroic**]], guide="Dungeon Guides\\Legion Raids\\Emerald Nightmare - Normal/Heroic"},
	{"item", text=[[**Emerald Nightmare - Mythic**]], guide="Dungeon Guides\\Legion Raids\\Emerald Nightmare - Mythic"},
	{"item", text=[[**Trial of Valor - (LFR)**]], guide="Dungeon Guides\\Legion Raids\\Trial of Valor - (LFR)"},
	{"item", text=[[**Trial of Valor - Normal/Heroic**]], guide="Dungeon Guides\\Legion Raids\\Trial of Valor - Normal/Heroic"},
	{"item", text=[[**Trial of Valor - Mythic**]], guide="Dungeon Guides\\Legion Raids\\Trial of Valor - Mythic"},
	{"item", text=[[**Nighthold - Arcing Aquaducts (LFR)**]], guide="Dungeon Guides\\Legion Raids\\Nighthold - Arcing Aquaducts (LFR)"},
	{"item", text=[[**Nighthold - Betrayer's Rise (LFR)**]], guide="Dungeon Guides\\Legion Raids\\Nighthold - Betrayer's Rise (LFR)"},
	{"item", text=[[**Nighthold - Nightspire (LFR)**]], guide="Dungeon Guides\\Legion Raids\\Nighthold - Nightspire (LFR)"},
	{"item", text=[[**Nighthold - Royal Athenaeum (LFR)**]], guide="Dungeon Guides\\Legion Raids\\Nighthold - Royal Athenaeum (LFR)"},
	{"item", text=[[**Nighthold - Normal/Heroic**]], guide="Dungeon Guides\\Legion Raids\\Nighthold - Normal/Heroic"},
	{"item", text=[[**Nighthold - Mythic**]], guide="Dungeon Guides\\Legion Raids\\Nighthold - Mythic"},
	--{"item", text=[[**Tomb of Sargeras - Gates of Hell**]], guide="Dungeon Guides\\Legion Raids\\Tomb of Sargeras - Gates of Hell"},
	--{"item", text=[[**Tomb of Sargeras - Wailing Halls**]], guide="Dungeon Guides\\Legion Raids\\Tomb of Sargeras - Wailing Halls"},
	--{"item", text=[[**Tomb of Sargeras - Chamber of the Avatar**]], guide="Dungeon Guides\\Legion Raids\\Tomb of Sargeras - Chamber of the Avatar"},
	--{"item", text=[[**Tomb of Sargeras - Deceiver's Fall**]], guide="Dungeon Guides\\Legion Raids\\Tomb of Sargeras - Deceiver's Fall"},
	--{"item", text=[[**Tomb of Sargeras - Normal/Heroic**]], guide="Dungeon Guides\\Legion Raids\\Tomb of Sargeras - Normal/Heroic"},
	--{"item", text=[[**Tomb of Sargeras - Mythic**]], guide="Dungeon Guides\\Legion Raids\\Tomb of Sargeras - Mythic"},
	--{"item", text=[[**Antorus, the Burning Throne**]], guide="Dungeon Guides\\Legion Raids\\Antorus, the Burning Throne"},
	--{"item", text=[[**Antorus, the Burning Throne - Light's Breach (LFR)**]], guide="Dungeon Guides\\Legion Raids\\Antorus, the Burning Throne - Light's Breach (LFR)"},
	--{"item", text=[[**Antorus, the Burning Throne - Forbidden Descent (LFR)**]], guide="Dungeon Guides\\Legion Raids\\Antorus, the Burning Throne - Forbidden Descent (LFR)"},
	--{"item", text=[[**Antorus, the Burning Throne - Hope's End (LFR)**]], guide="Dungeon Guides\\Legion Raids\\Antorus, the Burning Throne - Hope's End (LFR)"},
	--{"item", text=[[**Antorus, the Burning Throne - Seat of the Pantheon (LFR)**]], guide="Dungeon Guides\\Legion Raids\\Antorus, the Burning Throne - Seat of the Pantheon (LFR)"},
	}, --columnsend
	
{"section", text=[[DAILIES]]},
	{"banner", image=GQ.IMAGESDIR.."Patch110205Dailies",showcaseonly=true},
	--{"content", text=[[Complete a daily quest each day or save them up and complete up to 7 at once in a single week]]},
	--{"columns",
	--{"item", text=[[**Infinite Research Dailies**]], guide="Daily Guides\\Legion Remix Dailies\\Infinite Research Dailies"},
	--}, --columnsend
	{"content", text=[[Complete world quests in Legion zones]]},
	{"columns",
	{"item", text=[[**Legion World Quest Unlock**]], guide="Daily Guides\\Legion\\Legion World Quest Unlock"},
	{"item", text=[[**Azsuna World Quests**]], guide="Daily Guides\\Legion\\Azsuna World Quests"},
	{"item", text=[[**Dalaran World Quests**]], guide="Daily Guides\\Legion\\Dalaran World Quests"},
	{"item", text=[[**Highmountain World Quests**]], guide="Daily Guides\\Legion\\Highmountain World Quests"},
	{"item", text=[[**Stormheim World Quests**]], guide="Daily Guides\\Legion\\Stormheim World Quests"},
	{"item", text=[[**Val'sharah World Quests**]], guide="Daily Guides\\Legion\\Val'sharah World Quests"},
	--{"item", text=[[**Suramar World Quests**]], guide="Daily Guides\\Legion\\Suramar World Quests"},
	--{"item", text=[[**Broken Shore Rares**]], guide="Daily Guides\\Legion\\Broken Shore Rares"},
	--{"item", text=[[**Broken Shore World Quests**]], guide="Daily Guides\\Legion\\Broken Shore World Quests"},
	--{"item", text=[[**Antoran Wastes World Quests**]], guide="Daily Guides\\Legion\\Antoran Wastes World Quests"},
	--{"item", text=[[**Krokuun World Quests**]], guide="Daily Guides\\Legion\\Krokuun World Quests"},
	--{"item", text=[[**Eredath World Quests**]], guide="Daily Guides\\Legion\\Eredath World Quests"},
	}, --columnsend
}) 


table.insert(GuideMenu.Featured,{
	title="Patch 11.2.0 - Ghosts of K’aresh", group="patch_110200",
{"section", text=[[LEVELING]]},
        {"banner", image=GQ.IMAGESDIR.."Patch110200Leveling",showcaseonly=true},
	{"content", text=[[The specter of an old enemy looms, attempting to summon Dimensius, the All-Devouring to finish the ethereals for good]]},
	{"columns",
	{"item", text=[[**K'aresh (Story Only)**]], guide="Leveling Guides\\The War Within (70-80)\\Story Campaigns\\K'aresh (Story Only)"},
	{"item", text=[[**K'aresh (Full Zone)**]], guide="Leveling Guides\\The War Within (70-80)\\Full Zones (Story + Side Quests)\\K'aresh (Full Zone)"},
	}, --columnsend
	{"content", text=[[Assist Ve'nari to restore life back to K'aresh and its eco-domes]]},
	{"columns",
	{"item", text=[[**Ecological Succession**]], guide="Leveling Guides\\The War Within (70-80)\\Ecological Succession"},
	}, --columnsend
	
{"section", text=[[DUNGEONS]]},
        {"banner", image=GQ.IMAGESDIR.."Patch110200Dungeons",showcaseonly=true},
	{"content", text=[[Return to Tazavesh, the Veiled Market and fight to protect Eco-Dome Al'dani]]},
	{"columns",
	{"item", text=[[**Eco-Dome Al'dani**]], guide="Dungeon Guides\\The War Within Dungeons\\Eco-Dome Al'dani"},
	{"item", text=[[**Tazavesh, the Veiled Market**]], guide="Dungeon Guides\\The War Within Dungeons\\Tazavesh, the Veiled Market"},
	}, --columnsend
	{"content", text=[[Disrupt Manaforge Omega to prevent the rebirth of Dimensius]]},
	{"columns",
	{"item", text=[[**Manaforge Omega**]], guide="Dungeon Guides\\The War Within Raids\\Manaforge Omega"},
	}, --columnsend
	--{"text", text=[[**Note:** New delves overcharge each week and alternate.]]},
	
{"section", text=[[DAILIES]]},
        {"banner", image=GQ.IMAGESDIR.."Patch110200Dailies",showcaseonly=true},
	{"content", text=[[Complete weekly quests for renown and rewards with the K'aresh Trust faction]]},
	{"columns",
	{"item", text=[[**Ecological Succession Weeklies**]], guide="Daily Guides\\The War Within (70-80)\\Ecological Succession Weeklies"},
	{"item", text=[[**Warrants**]], guide="Daily Guides\\The War Within (70-80)\\Warrants"},
	}, --columnsend
	
{"section", text=[[REPUTATIONS]]},
        {"banner", image=GQ.IMAGESDIR.."Patch110200Reputations",showcaseonly=true},
	{"content", text=[[Earn renown for rewards with The K'aresh Trust]]},
	{"columns",
	{"item", text=[[**The K'aresh Trust**]], guide="Reputation Guides\\The War Within Reputations\\The K'aresh Trust"},
	}, --columnsend

{"section", text=[[PETSMOUNTS]]},
	{"banner", image=GQ.IMAGESDIR.."Patch110200PetsMounts",showcaseonly=true},

	{"guideslist", content=[[Ground Mounts]],filters={patch="110200", mounttype="Ground"},columns=4,path="PETSMOUNTS\\Mounts"},
	{"guideslist", content=[[Flying Mounts]],filters={patch="110200", mounttype="Flying"},columns=4,path="PETSMOUNTS\\Mounts"},
	{"guideslist", content=[[Aquatic Mounts]],filters={patch="110200", mounttype="Aquatic"},columns=4,path="PETSMOUNTS\\Mounts"},

	{"guideslist", content=[[Battle Pets - Source: Achievement]],filters={patch="110200", source="Achievement"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Black Market]],filters={patch="110200", source="BlackMarket"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Drop]],filters={patch="110200", source="Drop"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: In-Game Shop]],filters={patch="110200", source="In-GameShop"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Pet Battles]],filters={patch="110200", source="PetBattle"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Professions]],filters={patch="110200", source="Profession"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Promotions]],filters={patch="110200", source="Promotion"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Quest]],filters={patch="110200", source="Quest"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Trading Card Game]],filters={patch="110200", source="TradingCardGame"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Unknown]],filters={patch="110200", source="unknown"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Vendor]],filters={patch="110200", source="Vendor"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: World Events]],filters={patch="110200", source="WorldEvent"},columns=4,path="PETSMOUNTS\\Battle Pets"},
}) 

table.insert(GuideMenu.Featured,{
	title="Patch 11.1.7 - Legacy of Arathor", group="patch_110107",
{"section", text=[[LEVELING]]},
        {"banner", image=GQ.IMAGESDIR.."Patch110107Leveling",showcaseonly=true},
	{"content", text=[[Attempt to soothe tensions between new faction in Arathi Highlands]]},
	{"columns",
	{"item", text=[[**Rise of the Red Dawn**]], guide="Leveling Guides\\The War Within (70-80)\\Story Campaigns\\Rise of the Red Dawn"},
	}, --columnsend
	{"content", text=[[Revisit questlines from the path involving Xalath, The Ethereals, and The Lich King]]},
	{"columns",
	{"item", text=[[**Lorewalking**]], guide="Leveling Guides\\The War Within (70-80)\\Lorewalking"},
	}, --columnsend
	
{"section", text=[[DUNGEONS]]},
        {"banner", image=GQ.IMAGESDIR.."Patch110107Dungeons",showcaseonly=true},
	{"content", text=[[Complete the introductory questline for overcharged delves and unlock the D.I.S.C belt]]},
	{"columns",
	{"item", text=[[**Overcharged Delves**]], guide="Dungeon Guides\\The War Within Dungeons\\Overcharged Delves"},
	}, --columnsend
	{"text", text=[[**Note:** New delves overcharge each week and alternate.]]},
}) 


table.insert(GuideMenu.Featured,{
	title="Patch 11.1.5 - Nightfall", group="patch_110105",
{"section", text=[[EVENTS]]},
        {"banner", image=GQ.IMAGESDIR.."Patch110105Events",showcaseonly=true},
	{"content", text=[[Revisit horrific visions and aid the Flame's Radiance in the Nightfall scenario]]},
	{"columns",
	{"item", text=[[**Revisited Horrific Vision of Orgrimmar**]], guide="Events Guides\\The War Within (70-80)\\Revisited Horrific Vision of Orgrimmar"},
	{"item", text=[[**Revisited Horrific Vision of Stormwind**]], guide="Events Guides\\The War Within (70-80)\\Revisited Horrific Vision of Stormwind"},
	}, --columnsend
	{"text", text=[[**Note:** Stormwind and Orgrimmar visions alternate every weekly reset.]]},
	{"columns",
	{"item", text=[[**Nightfall**]], guide="Events Guides\\The War Within (70-80)\\Nightfall"},
	}, --columnsend
	{"text", text=[[**Note:** This scenario occurs every hour on the hour.]]},
	
{"section", text=[[DAILIES]]},
        {"banner", image=GQ.IMAGESDIR.."Patch110105Dailies",showcaseonly=true},
	{"content", text=[[Complete daily quests and a weekly quest for renown and rewards with the Flame's Radiance]]},
	{"columns",
	{"item", text=[[**Nightfall Dailies**]], guide="Daily Guides\\The War Within (70-80)\\Nightfall Dailies"},
	}, --columnsend
	
{"section", text=[[REPUTATIONS]]},
        {"banner", image=GQ.IMAGESDIR.."Patch110105Reputations",showcaseonly=true},
	{"content", text=[[Earn renown for rewards with the Flame's Radiance]]},
	{"columns",
	{"item", text=[[**Flame's Radiance**]], guide="Reputation Guides\\The War Within Reputations\\Flame's Radiance"},
	}, --columnsend

{"section", text=[[PETSMOUNTS]]},
	{"banner", image=GQ.IMAGESDIR.."Patch110105PetsMounts",showcaseonly=true},

	{"guideslist", content=[[Ground Mounts]],filters={patch="110105", mounttype="Ground"},columns=4,path="PETSMOUNTS\\Mounts"},
	{"guideslist", content=[[Flying Mounts]],filters={patch="110105", mounttype="Flying"},columns=4,path="PETSMOUNTS\\Mounts"},
	{"guideslist", content=[[Aquatic Mounts]],filters={patch="110105", mounttype="Aquatic"},columns=4,path="PETSMOUNTS\\Mounts"},

	{"guideslist", content=[[Battle Pets - Source: Achievement]],filters={patch="110105", source="Achievement"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Black Market]],filters={patch="110105", source="BlackMarket"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Drop]],filters={patch="110105", source="Drop"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: In-Game Shop]],filters={patch="110105", source="In-GameShop"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Pet Battles]],filters={patch="110105", source="PetBattle"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Professions]],filters={patch="110105", source="Profession"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Promotions]],filters={patch="110105", source="Promotion"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Quest]],filters={patch="110105", source="Quest"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Trading Card Game]],filters={patch="110105", source="TradingCardGame"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Unknown]],filters={patch="110105", source="unknown"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Vendor]],filters={patch="110105", source="Vendor"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: World Events]],filters={patch="110105", source="WorldEvent"},columns=4,path="PETSMOUNTS\\Battle Pets"},

{"section", text=[[ACHIEVEMENTS]]},
	{"banner", image=GQ.IMAGESDIR.."Patch110105Achievements",showcaseonly=true},

	{"guideslist", filters={patch="110105", source="*"},columns=4,path="ACHIEVEMENTS"},
}) 


table.insert(GuideMenu.Featured,{
	title="Patch 11.1.0 - Undermine(d)", group="patch_110100",
{"section", text=[[LEVELING]]},
        {"banner", image=GQ.IMAGESDIR.."Patch110100Leveling",showcaseonly=true},
	{"content", text=[[Explore Undermine and discover the Cartels of Undermine]]},
	{"columns",
	{"item", text=[[**Undermine (Story Only)**]], guide="Leveling Guides\\The War Within (70-80)\\Story Campaigns\\Undermine (Story Only)"},
	{"item", text=[[**Undermine (Full Zone)**]], guide="Leveling Guides\\The War Within (70-80)\\Full Zones (Story + Side Quests)\\Undermine (Full Zone)"},
	{"text", text=[[**Note:** Some content will be available after launch and will come in a future update.]]},
	}, --columnsend
	
{"section", text=[[DAILIES]]},
        {"banner", image=GQ.IMAGESDIR.."Patch110100Dailies",showcaseonly=true},
	{"content", text=[[Complete Undermine world quests and weekly quests for renown and rewards]]},
	{"columns",
	{"item", text=[[**Undermine World Quests**]], guide="Daily Guides\\The War Within (70-80)\\Undermine World Quests"},
	}, --columnsend
	{"columns",
	{"item", text=[[**Intercontinental Hotel Weeklies**]], guide="Daily Guides\\The War Within (70-80)\\Intercontinental Hotel Weeklies"},
	}, --columnsend
	{"columns",
	{"item", text=[[**Slam Central Station Weeklies**]], guide="Daily Guides\\The War Within (70-80)\\Slam Central Station Weeklies"},
	}, --columnsend
	
{"section", text=[[REPUTATIONS]]},
        {"banner", image=GQ.IMAGESDIR.."Patch110100Reputations",showcaseonly=true},
	{"content", text=[[Earn reputation for rewards with the Cartels of Undermine]]},
	{"columns",
	{"item", text=[[**The Cartels of Undermine**]], guide="Reputation Guides\\The War Within Reputations\\The Cartels of Undermine"},
	}, --columnsend
	
{"section", text=[[DUNGEONS]]},
        {"banner", image=GQ.IMAGESDIR.."Patch110100Dungeons",showcaseonly=true},
	{"content", text=[[Infiltrate and disrupt a crooked Darkfuse project in The Ringing Deeps]]},
	{"columns",
	{"item", text=[[**Operation: Floodgate**]], guide="Dungeon Guides\\The War Within Dungeons\\Operation: Floodgate"},
	}, --columnsend

{"section", text=[[PETSMOUNTS]]},
	{"banner", image=GQ.IMAGESDIR.."TWWPetsMounts",showcaseonly=true},

	{"guideslist", content=[[Ground Mounts]],filters={patch="110100", mounttype="Ground"},columns=4,path="PETSMOUNTS\\Mounts"},
	{"guideslist", content=[[Flying Mounts]],filters={patch="110100", mounttype="Flying"},columns=4,path="PETSMOUNTS\\Mounts"},
	{"guideslist", content=[[Aquatic Mounts]],filters={patch="110100", mounttype="Aquatic"},columns=4,path="PETSMOUNTS\\Mounts"},

	{"guideslist", content=[[Battle Pets - Source: Achievement]],filters={patch="110100", source="Achievement"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Black Market]],filters={patch="110100", source="BlackMarket"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Drop]],filters={patch="110100", source="Drop"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: In-Game Shop]],filters={patch="110100", source="In-GameShop"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Pet Battles]],filters={patch="110100", source="PetBattle"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Professions]],filters={patch="110100", source="Profession"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Promotions]],filters={patch="110100", source="Promotion"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Quest]],filters={patch="110100", source="Quest"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Trading Card Game]],filters={patch="110100", source="TradingCardGame"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Unknown]],filters={patch="110100", source="unknown"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Vendor]],filters={patch="110100", source="Vendor"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: World Events]],filters={patch="110100", source="WorldEvent"},columns=4,path="PETSMOUNTS\\Battle Pets"},

{"section", text=[[ACHIEVEMENTS]]},
	{"banner", image=GQ.IMAGESDIR.."TWWAchievements",showcaseonly=true},

	{"guideslist", filters={patch="110100", source="*"},columns=4,path="ACHIEVEMENTS"},
}) 


table.insert(GuideMenu.Featured,{
	title="Patch 11.0.7 - Siren Isle", group="patch_1107",
{"section", text=[[LEVELING]]},
        {"banner", image=GQ.IMAGESDIR.."Patch1107Leveling",showcaseonly=true},
	{"content", text=[[Explore Siren Isle and discover the fate of the Kirin Tor]]},
	{"columns",
	{"item", text=[[**Siren Isle**]], guide="Leveling Guides\\The War Within (70-80)\\Full Zones (Story + Side Quests)\\Siren Isle"},
	{"item", text=[[**Lingering Shadows**]], guide="Leveling Guides\\The War Within (70-80)\\Story Campaigns\\Lingering Shadows"},
	{"item", text=[[**The Fate of the Kirin Tor**]], guide="Leveling Guides\\The War Within (70-80)\\Story Campaigns\\The Fate of the Kirin Tor"},
	{"text", text=[[**Note:** This questline does not begin until January 7th.]]},
	}, --columnsend
	
{"section", text=[[DAILIES]]},
        {"banner", image=GQ.IMAGESDIR.."Patch1107Dailies",showcaseonly=true},
	{"content", text=[[Complete Siren Isle world quests and weekly quests]]},
	{"columns",
	{"item", text=[[**Siren Isle World Quests**]], guide="Daily Guides\\The War Within (70-80)\\Siren Isle World Quests"},
	}, --columnsend
	{"columns",
	{"item", text=[[**Siren Isle Weekly Quests**]], guide="Daily Guides\\The War Within (70-80)\\Siren Isle Weekly Quests"},
	}, --columnsend
	
{"section", text=[[EVENTS]]},
        {"banner", image=GQ.IMAGESDIR.."Patch1107Events",showcaseonly=true},
	{"content", text=[[Complete repeatable excavations on Siren Isle]]},
	{"columns",
	{"item", text=[[**The Drain**]], guide="Events Guides\\The War Within (70-80)\\Siren Isle\\The Drain"},
	}, --columnsend
	{"columns",
	{"item", text=[[**The Drowned Lair**]], guide="Events Guides\\The War Within (70-80)\\Siren Isle\\The Drowned Lair"},
	}, --columnsend
	{"columns",
	{"item", text=[[**Shuddering Hollow**]], guide="Events Guides\\The War Within (70-80)\\Siren Isle\\Shuddering Hollow"},
	}, --columnsend

{"section", text=[[PETSMOUNTS]]},
	{"banner", image=GQ.IMAGESDIR.."TWWPetsMounts",showcaseonly=true},

	{"guideslist", content=[[Ground Mounts]],filters={patch="110007", mounttype="Ground"},columns=4,path="PETSMOUNTS\\Mounts"},
	{"guideslist", content=[[Flying Mounts]],filters={patch="110007", mounttype="Flying"},columns=4,path="PETSMOUNTS\\Mounts"},
	{"guideslist", content=[[Aquatic Mounts]],filters={patch="110007", mounttype="Aquatic"},columns=4,path="PETSMOUNTS\\Mounts"},

	{"guideslist", content=[[Battle Pets - Source: Achievement]],filters={patch="110007", source="Achievement"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Black Market]],filters={patch="110007", source="BlackMarket"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Drop]],filters={patch="110007", source="Drop"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: In-Game Shop]],filters={patch="110007", source="In-GameShop"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Pet Battles]],filters={patch="110007", source="PetBattle"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Professions]],filters={patch="110007", source="Profession"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Promotions]],filters={patch="110007", source="Promotion"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Quest]],filters={patch="110007", source="Quest"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Trading Card Game]],filters={patch="110007", source="TradingCardGame"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Unknown]],filters={patch="110007", source="unknown"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Vendor]],filters={patch="110007", source="Vendor"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: World Events]],filters={patch="110007", source="WorldEvent"},columns=4,path="PETSMOUNTS\\Battle Pets"},

{"section", text=[[ACHIEVEMENTS]]},
	{"banner", image=GQ.IMAGESDIR.."TWWAchievements",showcaseonly=true},

	{"guideslist", filters={patch="110007", source="*"},columns=4,path="ACHIEVEMENTS"},
}) 

table.insert(GuideMenu.Featured,{
	title="The War Within", group="tww",
{"section", text=[[LEVELING]]},
        {"banner", image=GQ.IMAGESDIR.."TwwLeveling",showcaseonly=true},

	{"content", text=[[Reach Level 80 in Khaz Algar]]},
	{"text", text=[[On your first character, we recommend using the Story Only guides, which will get you to level 76-77. Upon finishing the story, load up the Hallowfall Full Zone guide, and then the Azj-Kahet Full Zone guide if needed to reach level 80. Then you can complete the Surface Bound quest in The War Within Campiagn guide to unlock world quests and adventure mode.|n|nFor alts, you will already have world quests unlocked, due to unlocking them on your main, so the leveling strategy would be to use the Story Only guides, and complete world quests that are nearby as you move through the story quests, then finish up with side quests in the Full Zone guides, if needed.]]},
	{"columns",
	{"item", text=[[**Intro & Isle of Dorn (Story Only)**]], guide="Leveling Guides\\The War Within (70-80)\\Story Campaigns\\Intro & Isle of Dorn (Story Only)"},
	{"item", text=[[**The Ringing Deeps (Story Only)**]], guide="Leveling Guides\\The War Within (70-80)\\Story Campaigns\\The Ringing Deeps (Story Only)"},
	{"item", text=[[**Hallowfall (Story Only)**]], guide="Leveling Guides\\The War Within (70-80)\\Story Campaigns\\Hallowfall (Story Only)"},
	{"item", text=[[**Azj-Kahet (Story Only)**]], guide="Leveling Guides\\The War Within (70-80)\\Story Campaigns\\Azj-Kahet (Story Only)"},
	{"item", text=[[**Intro & Isle of Dorn (Full Zone)**]], guide="Leveling Guides\\The War Within (70-80)\\Full Zones (Story + Side Quests)\\Intro & Isle of Dorn (Full Zone)"},
	{"item", text=[[**The Ringing Deeps (Full Zone)**]], guide="Leveling Guides\\The War Within (70-80)\\Full Zones (Story + Side Quests)\\The Ringing Deeps (Full Zone)"},
	{"item", text=[[**Hallowfall (Full Zone)**]], guide="Leveling Guides\\The War Within (70-80)\\Full Zones (Story + Side Quests)\\Hallowfall (Full Zone)"},
	{"item", text=[[**Azj-Kahet (Full Zone)**]], guide="Leveling Guides\\The War Within (70-80)\\Full Zones (Story + Side Quests)\\Azj-Kahet (Full Zone)"},
	{"item", text=[[**Earthen Starter (10-11)**]], guide="Leveling Guides\\Starter Guides\\Earthen Starter (10-11)"},
	}, --columnsend

	{"content", text=[[Optional: Create an Earthen]]},
	{"text", text=[[If leveling an Earthen, use the Earthen starter guide to level your character to 11.]]},
	{"text", text=[[**Note:** Earthen require completion of the **"Allied Races: Earthen"** achievement to unlock them.]]},
	{"columns",
	{"item", text=[[**Earthen Starter (10-11)**]], guide="Leveling Guides\\Starter Guides\\Earthen Starter (10-11)"},
	}, --columnsend

	{"content", text=[[Complete The War Within Campaign]]},
	{"text", text=[[Once you've played through the main War Within storyline content you'll want to start on the The War Within Campaign. There are 5 chapters to The War Within Campaign campaign.]]},
	{"columns",
	{"item", text=[[**The War Within Campaign**]], guide="Leveling Guides\\The War Within (70-80)\\Story Campaigns\\The War Within Campaign"},
	}, --columnsend	

	{"content", text=[[Collect Dragon Glyphs to Upgrade your Skyriding Ability]]},
	{"columns",
	{"item", text=[[**The War Within Dragon Glyphs (All Zones)**]], guide="Leveling Guides\\The War Within (70-80)\\Dragon Glyphs\\The War Within Dragon Glyphs (All Zones)"},
	}, --columnsend	

{"section", text=[[DUNGEONS]]},
        {"banner", image=GQ.IMAGESDIR.."TWWDungeons",showcaseonly=true},
	{"content", text=[[Optional: Complete the following War Within dungeons.]]},
	{"columns",
	{"item", text=[[**Ara-kara, City of Echoes**]], guide="Dungeon Guides\\The War Within Dungeons\\Ara-kara, City of Echoes"},
	{"item", text=[[**City of Threads**]], guide="Dungeon Guides\\The War Within Dungeons\\City of Threads"},
	{"item", text=[[**The Dawnbreaker**]], guide="Dungeon Guides\\The War Within Dungeons\\The Dawnbreaker"},
	{"item", text=[[**Cinderbrew Meadery**]], guide="Dungeon Guides\\The War Within Dungeons\\Cinderbrew Meadery"},
	{"item", text=[[**Darkflame Cleft**]], guide="Dungeon Guides\\The War Within Dungeons\\Darkflame Cleft"},
	{"item", text=[[**Priory of the Sacred Flame**]], guide="Dungeon Guides\\The War Within Dungeons\\Priory of the Sacred Flame"},
	{"item", text=[[**The Rookery**]], guide="Dungeon Guides\\The War Within Dungeons\\The Rookery"},
	{"item", text=[[**The Stonevault**]], guide="Dungeon Guides\\The War Within Dungeons\\The Stonevault"},
	--{"item", text=[[**Nerub-ar Palace**]], guide="Dungeons\\Dragonflight Raids\\Nerub-ar Palace"},
	}, --columnsend

{"section", text=[[DAILIES]]},
        {"banner", image=GQ.IMAGESDIR.."TWWDailies",showcaseonly=true},

	{"content", text=[[Khaz Algar World Quests]]},
	{"columns",
	{"item", text=[[**Azj'Kahet World Quests**]], guide="Daily Guides\\The War Within (70-80)\\Azj'Kahet World Quests"},
	{"item", text=[[**Hallowfall World Quests**]], guide="Daily Guides\\The War Within (70-80)\\Hallowfall World Quests"},
	{"item", text=[[**Isle of Dorn World Quests**]], guide="Daily Guides\\The War Within (70-80)\\Isle of Dorn World Quests"},
	{"item", text=[[**The Ringing Deeps World Quests**]], guide="Daily Guides\\The War Within (70-80)\\The Ringing Deeps World Quests"},
	}, --columnsend

	--{"content", text=[[Khaz Algar Weekly Meta Quests]]},
	--{"columns",
	--{"item", text=[[**Weekly Meta Quest**]], guide="Daily Guides\\The War Within (70-80)\\Weekly Meta Quest"},
	--}, --columnsend

	{"content", text=[[Isle of Dorn Theater Troupe]]},
	{"columns",
	{"item", text=[[**Theater Troupe**]], guide="Daily Guides\\The War Within (70-80)\\Theater Troupe"},
	}, --columnsend

	{"content", text=[[Awakening the Machine]]},
	{"columns",
	{"item", text=[[**Awakening the Machine**]], guide="Daily Guides\\The War Within (70-80)\\Awakening the Machine"},
	}, --columnsend


{"section", text=[[PROFESSIONS]]},
	{"banner", image=GQ.IMAGESDIR.."TWWProfessions",showcaseonly=true},

	{"text", text=[[NOTE: These guides are currently in a BETA state, meaning, while they can be used now, they are still being worked on by the GoatQuest team to ensure they are working correctly and optimally.]]},

	{"content", text=[[Gathering Professions]]},

	{"columns",
	{"item", text=[[**Khaz Algar Herbalism 1-100**]], guide="Profession Guides\\Herbalism\\Leveling Guides\\Khaz Algar Herbalism 1-100"},
	{"item", text=[[**Khaz Algar Mining 1-100**]], guide="Profession Guides\\Mining\\Leveling Guides\\Khaz Algar Mining 1-100"},
	{"item", text=[[**Khaz Algar Skinning 1-100**]], guide="Profession Guides\\Skinning\\Leveling Guides\\Khaz Algar Skinning 1-100"},
	{"item", text=[[**Khaz Algar Fishing 1-100**]], guide="Profession Guides\\Fishing\\Leveling Guides\\Khaz Algar Fishing 1-100"},
	}, --columnsend

	{"content", text=[[Crafting Professions]]},

	{"columns",
	{"item", text=[[**Khaz Algar Alchemy 1-100**]], guide="Profession Guides\\Alchemy\\Leveling Guides\\Khaz Algar Alchemy 1-100"},
	{"item", text=[[**Khaz Algar Blacksmithing 1-100**]], guide="Profession Guides\\Blacksmithing\\Leveling Guides\\Khaz Algar Blacksmithing 1-100"},
	{"item", text=[[**Khaz Algar Enchanting 1-100**]], guide="Profession Guides\\Enchanting\\Leveling Guides\\Khaz Algar Enchanting 1-100"},
	--{"item", text=[[**Khaz Algar Engineering 1-100**]], guide="Profession Guides\\Engineering\\Leveling Guides\\Khaz Algar Engineering 1-100"},
	--{"item", text=[[**Khaz Algar Engineering 1-100**]], guide="Profession Guides\\Inscription\\Leveling Guides\\Khaz Algar Inscription 1-100"},
	{"item", text=[[**Khaz Algar Jewelcrafting 1-100**]], guide="Profession Guides\\Jewelcrafting\\Leveling Guides\\Khaz Algar Jewelcrafting 1-100"},
	{"item", text=[[**Khaz Algar Leatherworking 1-100**]], guide="Profession Guides\\Leatherworking\\Leveling Guides\\Khaz Algar Leatherworking 1-100"},
	{"item", text=[[**Khaz Algar Tailoring 1-100**]], guide="Profession Guides\\Tailoring\\Leveling Guides\\Khaz Algar Tailoring 1-100"},
	--{"item", text=[[**Khaz Algar Cooking 1-100**]], guide="Profession Guides\\Cooking\\Leveling Guides\\Khaz Algar Cooking 1-100"},
	}, --columnsend

	{"content", text=[[Fishing Farming Guides]]},

	{"columns",
	{"item", text=[[**Cursed Ghoulfish**]], guide="Profession Guides\\Fishing\\Farming Guides\\Cursed Ghoulfish"},
	{"item", text=[[**Bismuth Bitterling**]], guide="Profession Guides\\Fishing\\Farming Guides\\Bismuth Bitterling"},
	{"item", text=[[**Crystalline Sturgeon**]], guide="Profession Guides\\Fishing\\Farming Guides\\Crystalline Sturgeon"},
	{"item", text=[[**Dornish Pike**]], guide="Profession Guides\\Fishing\\Farming Guides\\Dornish Pike"},
	{"item", text=[[**Specular Rainbowfish**]], guide="Profession Guides\\Fishing\\Farming Guides\\Specular Rainbowfish"},
	{"item", text=[[**Whispering Stargazer**]], guide="Profession Guides\\Fishing\\Farming Guides\\Whispering Stargazer"},
	{"item", text=[[**Spiked Sea Raven**]], guide="Profession Guides\\Fishing\\Farming Guides\\Spiked Sea Raven"},
	{"item", text=[[**Goldengill Trout**]], guide="Profession Guides\\Fishing\\Farming Guides\\Goldengill Trout"},
	{"item", text=[[**Nibbling Minnow**]], guide="Profession Guides\\Fishing\\Farming Guides\\Nibbling Minnow"},
	{"item", text=[[**Quiet River Bass**]], guide="Profession Guides\\Fishing\\Farming Guides\\Quiet River Bass"},
	{"item", text=[[**Roaring Anglerseeker**]], guide="Profession Guides\\Fishing\\Farming Guides\\Roaring Anglerseeker"},
	{"item", text=[[**Queen's Lurefish**]], guide="Profession Guides\\Fishing\\Farming Guides\\Queen's Lurefish"},
	{"item", text=[[**Regal Dottyback**]], guide="Profession Guides\\Fishing\\Farming Guides\\Regal Dottyback"},
	{"item", text=[[**Awoken Coelacanth**]], guide="Profession Guides\\Fishing\\Farming Guides\\Awoken Coelacanth"},
	{"item", text=[[**Arathor Hammerfish**]], guide="Profession Guides\\Fishing\\Farming Guides\\Arathor Hammerfish"},
	{"item", text=[[**Bloody Perch**]], guide="Profession Guides\\Fishing\\Farming Guides\\Bloody Perch"},
	{"item", text=[[**Dilly-Dally Dace**]], guide="Profession Guides\\Fishing\\Farming Guides\\Dilly-Dally Dace"},
	{"item", text=[[**Kaheti Slum Shark**]], guide="Profession Guides\\Fishing\\Farming Guides\\Kaheti Slum Shark"},
	{"item", text=[[**Pale Huskfish**]], guide="Profession Guides\\Fishing\\Farming Guides\\Pale Huskfish"},
	{"item", text=[[**Sanguine Dogfish**]], guide="Profession Guides\\Fishing\\Farming Guides\\Sanguine Dogfish"},
	}, --columnsend

	{"content", text=[[Herbalism Farming Guides]]},

	{"columns",
	{"item", text=[[**Mycobloom (Azj-Kahet)**]], guide="Profession Guides\\Herbalism\\Farming Guides\\Mycobloom (Azj-Kahet)"},
	{"item", text=[[**Mycobloom (Hallowfall)**]], guide="Profession Guides\\Herbalism\\Farming Guides\\Mycobloom (Hallowfall)"},
	{"item", text=[[**Mycobloom (Isle of Dorn)**]], guide="Profession Guides\\Herbalism\\Farming Guides\\Mycobloom (Isle of Dorn)"},
	{"item", text=[[**Mycobloom (The Ringing Deeps)**]], guide="Profession Guides\\Herbalism\\Farming Guides\\Mycobloom (The Ringing Deeps)"},
	{"item", text=[[**Arathor's Spear (Hallowfall)**]], guide="Profession Guides\\Herbalism\\Farming Guides\\Arathor's Spear (Hallowfall)"},
	{"item", text=[[**Arathor's Spear (The Ringing Deeps)**]], guide="Profession Guides\\Herbalism\\Farming Guides\\Arathor's Spear (The Ringing Deeps)"},
	{"item", text=[[**Blessing Blossom (Hallowfall)**]], guide="Profession Guides\\Herbalism\\Farming Guides\\Blessing Blossom (Hallowfall)"},
	{"item", text=[[**Blessing Blossom (The Ringing Deeps)**]], guide="Profession Guides\\Herbalism\\Farming Guides\\Blessing Blossom (The Ringing Deeps)"},
	{"item", text=[[**Blessing Blossom (Isle of Dorn)**]], guide="Profession Guides\\Herbalism\\Farming Guides\\Blessing Blossom (Isle of Dorn)"},
	{"item", text=[[**Orbinid (Azj-Kahet)**]], guide="Profession Guides\\Herbalism\\Farming Guides\\Orbinid (Azj-Kahet)"},
	{"item", text=[[**Orbinid (The Ringing Deeps)**]], guide="Profession Guides\\Herbalism\\Farming Guides\\Orbinid (The Ringing Deeps)"},
	{"item", text=[[**Luredrop (Azj-Kahet)**]], guide="Profession Guides\\Herbalism\\Farming Guides\\Luredrop (Azj-Kahet)"},
	{"item", text=[[**Luredrop (The Ringing Deeps)**]], guide="Profession Guides\\Herbalism\\Farming Guides\\Luredrop (The Ringing Deeps)"},
	}, --columnsend

	{"content", text=[[Mining Farming Guides]]},

	{"columns",
	{"item", text=[[**Bismuth (Azj-Kahet)**]], guide="Profession Guides\\Mining\\Farming Guides\\Bismuth (Azj-Kahet)"},
	{"item", text=[[**Bismuth (Hallowfall)**]], guide="Profession Guides\\Mining\\Farming Guides\\Bismuth (Hallowfall)"},
	{"item", text=[[**Bismuth (Isle of Dorn)**]], guide="Profession Guides\\Mining\\Farming Guides\\Bismuth (Isle of Dorn)"},
	{"item", text=[[**Bismuth (The Ringing Deeps)**]], guide="Profession Guides\\Mining\\Farming Guides\\Bismuth (The Ringing Deeps)"},
	{"item", text=[[**Ironclaw (Isle of Dorn)**]], guide="Profession Guides\\Mining\\Farming Guides\\Ironclaw (Isle of Dorn)"},
	{"item", text=[[**Ironclaw (The Ringing Deeps)**]], guide="Profession Guides\\Mining\\Farming Guides\\Ironclaw (The Ringing Deeps)"},
	{"item", text=[[**Aqirite (Azj-Kahet)**]], guide="Profession Guides\\Mining\\Farming Guides\\Aqirite (Azj-Kahet)"},
	{"item", text=[[**Aqirite (Hallowfall)**]], guide="Profession Guides\\Mining\\Farming Guides\\Aqirite (Hallowfall)"},
	}, --columnsend

	{"content", text=[[Skinning Farming Guides]]},

	{"columns",
	{"item", text=[[**Stormcharged Leather (Isle of Dorn)**]], guide="Profession Guides\\Skinning\\Farming Guides\\Stormcharged Leather (Isle of Dorn)"},
	{"item", text=[[**Thunderous Hide (Isle of Dorn)**]], guide="Profession Guides\\Skinning\\Farming Guides\\Thunderous Hide (Isle of Dorn)"},
	{"item", text=[[**Gloom Chitin (Azj-Kahet)**]], guide="Profession Guides\\Skinning\\Farming Guides\\Gloom Chitin (Azj-Kahet)"},
	{"item", text=[[**Sunless Carapace (Azj-Kahet)**]], guide="Profession Guides\\Skinning\\Farming Guides\\Sunless Carapace (Azj-Kahet)"},
	}, --columnsend

{"section", text=[[PETSMOUNTS]]},
	{"banner", image=GQ.IMAGESDIR.."TWWPetsMounts",showcaseonly=true},

	{"guideslist", content=[[Ground Mounts]],filters={patch="110002", mounttype="Ground"},columns=4,path="PETSMOUNTS\\Mounts"},
	{"guideslist", content=[[Flying Mounts]],filters={patch="110002", mounttype="Flying"},columns=4,path="PETSMOUNTS\\Mounts"},
	{"guideslist", content=[[Aquatic Mounts]],filters={patch="110002", mounttype="Aquatic"},columns=4,path="PETSMOUNTS\\Mounts"},

	{"guideslist", content=[[Battle Pets - Source: Achievement]],filters={patch="110002", source="Achievement"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Black Market]],filters={patch="110002", source="BlackMarket"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Drop]],filters={patch="110002", source="Drop"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: In-Game Shop]],filters={patch="110002", source="In-GameShop"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Pet Battles]],filters={patch="110002", source="PetBattle"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Professions]],filters={patch="110002", source="Profession"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Promotions]],filters={patch="110002", source="Promotion"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Quest]],filters={patch="110002", source="Quest"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Trading Card Game]],filters={patch="110002", source="TradingCardGame"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Unknown]],filters={patch="110002", source="unknown"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Vendor]],filters={patch="110002", source="Vendor"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: World Events]],filters={patch="110002", source="WorldEvent"},columns=4,path="PETSMOUNTS\\Battle Pets"},

{"section", text=[[ACHIEVEMENTS]]},
	{"banner", image=GQ.IMAGESDIR.."TWWAchievements",showcaseonly=true},

	{"guideslist", filters={patch="110002", source="*"},columns=4,path="ACHIEVEMENTS"},
}) 
















table.insert(GuideMenu.Featured,{
	title="Patch 10.2.7 - Dark Heart", group="patch_100207",
{"section", text=[[LEVELING]]},
        {"banner", image=GQ.IMAGESDIR.."Patch100207Leveling",showcaseonly=true},
	{"content", text=[[Investigate the mysterious Harbinger and her heart of darkness.]]},
	{"columns",
	{"item", text=[[**Hunt for the Harbinger**]], guide="Leveling Guides\\Dragonflight (10-70)\\Hunt for the Harbinger"},
	{"item", text=[[**Sins of the Sister**]], guide="Leveling Guides\\Dragonflight (10-70)\\Sins of the Sister"},
	{"item", text=[[**Troll Heritage Armor**]], guide="Leveling Guides\\Heritage Armor\\Troll Heritage Armor", faction="H"},
	{"item", text=[[**Draenei Heritage Armor**]], guide="Leveling Guides\\Heritage Armor\\Draenei Heritage Armor", faction="A"},
	}, --columnsend

{"section", text=[[PETSMOUNTS]]},
	{"banner", image=GQ.IMAGESDIR.."DragonflightPetsMounts",showcaseonly=true},

	{"guideslist", content=[[Ground Mounts]],filters={patch="100207", mounttype="Ground"},columns=4,path="PETSMOUNTS\\Mounts"},
	{"guideslist", content=[[Flying Mounts]],filters={patch="100207", mounttype="Flying"},columns=4,path="PETSMOUNTS\\Mounts"},
	{"guideslist", content=[[Aquatic Mounts]],filters={patch="100207", mounttype="Aquatic"},columns=4,path="PETSMOUNTS\\Mounts"},

	{"guideslist", content=[[Battle Pets - Source: Achievement]],filters={patch="100207", source="Achievement"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Black Market]],filters={patch="100207", source="BlackMarket"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Drop]],filters={patch="100207", source="Drop"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: In-Game Shop]],filters={patch="100207", source="In-GameShop"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Pet Battles]],filters={patch="100207", source="PetBattle"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Professions]],filters={patch="100207", source="Profession"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Promotions]],filters={patch="100207", source="Promotion"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Quest]],filters={patch="100207", source="Quest"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Trading Card Game]],filters={patch="100207", source="TradingCardGame"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Unknown]],filters={patch="100207", source="unknown"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Vendor]],filters={patch="100207", source="Vendor"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: World Events]],filters={patch="100207", source="WorldEvent"},columns=4,path="PETSMOUNTS\\Battle Pets"},

{"section", text=[[ACHIEVEMENTS]]},
	{"banner", image=GQ.IMAGESDIR.."DragonflightAchievements",showcaseonly=true},

	{"guideslist", filters={patch="100207", source="*"},columns=4,path="ACHIEVEMENTS"},
}) 

table.insert(GuideMenu.Featured,{
	title="Patch 10.2.5 - Seeds of Renewal", group="patch_1025",
{"section", text=[[LEVELING]]},
        {"banner", image=GQ.IMAGESDIR.."Patch1025Leveling",showcaseonly=true},
	{"content", text=[[Reclaim the fallen city of Gilneas in Eastern Kingdoms]]},
	{"columns",
	{"item", text=[[**The Reclaiming of Gilneas**]], guide="Leveling Guides\\Dragonflight (10-70)\\The Reclaiming of Gilneas"},
	{"item", text=[[**Champion of the Dragonflights**]], guide="Leveling Guides\\Dragonflight (10-70)\\Champion of the Dragonflights"},
	}, --columnsend
	
{"section", text=[[EVENTS]]},
        {"banner", image=GQ.IMAGESDIR.."Patch1025Events",showcaseonly=true},
	{"content", text=[[Azerothian Archives Big Dig]]},
	{"columns",
	{"item", text=[[**The Big Dig: Traitor's Rest**]], guide="Events Guides\\Dragonflight (10-70)\\The Big Dig: Traitor's Rest"},
	}, --columnsend
	{"columns",
	{"item", text=[[**Azerothian Archives!**]], guide="Events Guides\\Dragonflight (10-70)\\Azerothian Archives!"},
	}, --columnsend

{"section", text=[[PETSMOUNTS]]},
	{"banner", image=GQ.IMAGESDIR.."DragonflightPetsMounts",showcaseonly=true},

	{"guideslist", content=[[Ground Mounts]],filters={patch="100205", mounttype="Ground"},columns=4,path="PETSMOUNTS\\Mounts"},
	{"guideslist", content=[[Flying Mounts]],filters={patch="100205", mounttype="Flying"},columns=4,path="PETSMOUNTS\\Mounts"},
	{"guideslist", content=[[Aquatic Mounts]],filters={patch="100205", mounttype="Aquatic"},columns=4,path="PETSMOUNTS\\Mounts"},

	{"guideslist", content=[[Battle Pets - Source: Achievement]],filters={patch="100205", source="Achievement"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Black Market]],filters={patch="100205", source="BlackMarket"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Drop]],filters={patch="100205", source="Drop"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: In-Game Shop]],filters={patch="100205", source="In-GameShop"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Pet Battles]],filters={patch="100205", source="PetBattle"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Professions]],filters={patch="100205", source="Profession"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Promotions]],filters={patch="100205", source="Promotion"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Quest]],filters={patch="100205", source="Quest"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Trading Card Game]],filters={patch="100205", source="TradingCardGame"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Unknown]],filters={patch="100205", source="unknown"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Vendor]],filters={patch="100205", source="Vendor"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: World Events]],filters={patch="100205", source="WorldEvent"},columns=4,path="PETSMOUNTS\\Battle Pets"},

{"section", text=[[ACHIEVEMENTS]]},
	{"banner", image=GQ.IMAGESDIR.."DragonflightAchievements",showcaseonly=true},

	{"guideslist", filters={patch="100205", source="*"},columns=4,path="ACHIEVEMENTS"},
}) 


table.insert(GuideMenu.Featured,{
	title="Patch 10.2.0 - Guardians of the Dream Overview", group="patch_102",
{"section", text=[[LEVELING]]},
        {"banner", image=GQ.IMAGESDIR.."Patch102Leveling",showcaseonly=true},
	{"columns",
	{"item", text=[[**Emerald Dream Campaign**]], guide="Leveling Guides\\Dragonflight (10-70)\\Emerald Dream Campaign"},
	{"item", text=[[**Emerald Dream Campaign + Side Quests**]], guide="Leveling Guides\\Dragonflight (10-70)\\Emerald Dream Campaign + Side Quests"},
	{"item", text=[[**Wrathion's Questline**]], guide="Leveling Guides\\Dragonflight (10-70)\\Wrathion's Questline"},
	}, --columnsend
	{"text", text=[[NOTE: To start The Emerald Dream Campaign, you need to complete "The Coalition of Flame" on at least one character.]]},
	
{"section", text=[[DAILIES]]},
        {"banner", image=GQ.IMAGESDIR.."Patch102Dailies",showcaseonly=true},
	{"content", text=[[World Quests]]},
	{"columns",
	{"item", text=[[**The Emerald Dream World Quests**]], guide="Daily Guides\\Dragonflight (10-70)\\The Emerald Dream World Quests"},
	}, --columnsend
	{"text", text=[[NOTE: The world boss will be added in the first week.]]},

{"section", text=[[REPUTATIONS]]},
        {"banner", image=GQ.IMAGESDIR.."Patch102Reputations",showcaseonly=true},
	{"content", text=[[Earn renown with the Dream Wardens faction]]},
	{"columns",
	{"item", text=[[**Dream Wardens Reputation**]], guide="REPUTATIONS\\Dragonflight Reputations\\Dream Wardens"},
	}, --columnsend

{"section", text=[[EVENTS]]},
        {"banner", image=GQ.IMAGESDIR.."Patch102Events",showcaseonly=true},
	{"columns",
	{"item", text=[[**The Emerald Dream Superbloom**]], guide="Events Guides\\Dragonflight (10-70)\\The Emerald Dream Superbloom"},
	}, --columnsend

{"section", text=[[PETSMOUNTS]]},
	{"banner", image=GQ.IMAGESDIR.."DragonflightPetsMounts",showcaseonly=true},

	{"guideslist", content=[[Ground Mounts]],filters={patch="100200", mounttype="Ground"},columns=4,path="PETSMOUNTS\\Mounts"},
	{"guideslist", content=[[Flying Mounts]],filters={patch="100200", mounttype="Flying"},columns=4,path="PETSMOUNTS\\Mounts"},
	{"guideslist", content=[[Aquatic Mounts]],filters={patch="100200", mounttype="Aquatic"},columns=4,path="PETSMOUNTS\\Mounts"},

	{"guideslist", content=[[Battle Pets - Source: Achievement]],filters={patch="100200", source="Achievement"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Black Market]],filters={patch="100200", source="BlackMarket"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Drop]],filters={patch="100200", source="Drop"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: In-Game Shop]],filters={patch="100200", source="In-GameShop"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Pet Battles]],filters={patch="100200", source="PetBattle"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Professions]],filters={patch="100200", source="Profession"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Promotions]],filters={patch="100200", source="Promotion"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Quest]],filters={patch="100200", source="Quest"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Trading Card Game]],filters={patch="100200", source="TradingCardGame"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Unknown]],filters={patch="100200", source="unknown"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Vendor]],filters={patch="100200", source="Vendor"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: World Events]],filters={patch="100200", source="WorldEvent"},columns=4,path="PETSMOUNTS\\Battle Pets"},

{"section", text=[[ACHIEVEMENTS]]},
	{"banner", image=GQ.IMAGESDIR.."DragonflightAchievements",showcaseonly=true},

	{"guideslist", filters={patch="100200", source="*"},columns=4,path="ACHIEVEMENTS"},
}) 

table.insert(GuideMenu.Featured,{
	title="Patch 10.1.7 - Fury Incarnate", group="patch_1017",
{"section", text=[[LEVELING]]},
        {"banner", image=GQ.IMAGESDIR.."Patch1017Leveling",showcaseonly=true},
	{"columns",
	{"item", text=[[**Forsaken Heritage Armor**]], guide="Leveling Guides\\Heritage Armor\\Forsaken Heritage Armor",faction="H"},
	{"item", text=[[**Night Elf Heritage Armor**]], guide="Leveling Guides\\Heritage Armor\\Night Elf Heritage Armor",faction="A"},
	}, --columnsend

{"section", text=[[EVENTS]]},
        {"banner", image=GQ.IMAGESDIR.."Patch1017Events",showcaseonly=true},
	{"columns",
	{"item", text=[[**Emerald Dreamsurge (The Azure Span)**]], guide="Events Guides\\Dragonflight (10-70)\\Emerald Dreamsurge (The Azure Span)"},
	{"item", text=[[**Emerald Dreamsurge (Ohn'ahran Plains)**]], guide="Events Guides\\Dragonflight (10-70)\\Emerald Dreamsurge (Ohn'ahran Plains)"},
	{"item", text=[[**Emerald Dreamsurge (Thaldraszus)**]], guide="Events Guides\\Dragonflight (10-70)\\Emerald Dreamsurge (Thaldraszus)"},
	{"item", text=[[**Emerald Dreamsurge (The Waking Shores)**]], guide="Events Guides\\Dragonflight (10-70)\\Emerald Dreamsurge (The Waking Shores)"},
	}, --columnsend

{"section", text=[[PETSMOUNTS]]},
	{"banner", image=GQ.IMAGESDIR.."DragonflightPetsMounts",showcaseonly=true},

	{"guideslist", content=[[Ground Mounts]],filters={patch="100107", mounttype="Ground"},columns=4,path="PETSMOUNTS\\Mounts"},
	{"guideslist", content=[[Flying Mounts]],filters={patch="100107", mounttype="Flying"},columns=4,path="PETSMOUNTS\\Mounts"},
	{"guideslist", content=[[Aquatic Mounts]],filters={patch="100107", mounttype="Aquatic"},columns=4,path="PETSMOUNTS\\Mounts"},

	{"guideslist", content=[[Battle Pets - Source: Achievement]],filters={patch="100107", source="Achievement"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Black Market]],filters={patch="100107", source="BlackMarket"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Drop]],filters={patch="100107", source="Drop"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: In-Game Shop]],filters={patch="100107", source="In-GameShop"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Pet Battles]],filters={patch="100107", source="PetBattle"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Professions]],filters={patch="100107", source="Profession"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Promotions]],filters={patch="100107", source="Promotion"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Quest]],filters={patch="100107", source="Quest"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Trading Card Game]],filters={patch="100107", source="TradingCardGame"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Unknown]],filters={patch="100107", source="unknown"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Vendor]],filters={patch="100107", source="Vendor"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: World Events]],filters={patch="100107", source="WorldEvent"},columns=4,path="PETSMOUNTS\\Battle Pets"},

{"section", text=[[ACHIEVEMENTS]]},
	{"banner", image=GQ.IMAGESDIR.."DragonflightAchievements",showcaseonly=true},

	{"guideslist", filters={patch="100107", source="*"},columns=4,path="ACHIEVEMENTS"},
}) 

table.insert(GuideMenu.Featured,{
	title="Patch 10.1.5 - Fractures in Time", group="patch_1015",
{"section", text=[[LEVELING]]},
        {"banner", image=GQ.IMAGESDIR.."Patch1015Leveling",showcaseonly=true},
	{"columns",
	{"item", text=[[**Some Wicked Things (Warlock)**]], guide="Leveling Guides\\Dragonflight (10-70)\\Some Wicked Things (Warlock)"},
	{"item", text=[[**Augmentation Questline (Evoker)**]], guide="Leveling Guides\\Dragonflight (10-70)\\Augmentation Questline (Evoker)"},
	}, --columnsend

{"section", text=[[DUNGEONS]]},
	{"banner", image=GQ.IMAGESDIR.."Patch1015Dungeons",showcaseonly=true},
	{"columns",
	{"item", text=[[**Dawn of the Infinite Intro Questline**]], guide="Dungeon Guides\\Dragonflight Dungeons\\Dawn of the Infinite Intro Questline"},
	}, --columnsend
	{"text", text=[[NOTE: The intro questline is required to unlock access to the Dawn of the Infinite dungeon.]]},
	{"columns",
	{"item", text=[[**Dawn of the Infinite**]], guide="Dungeon Guides\\Dragonflight Dungeons\\Dawn of the Infinite"},
	}, --columnsend
	
{"section", text=[[DAILIES]]},
        {"banner", image=GQ.IMAGESDIR.."Patch1015Dailies",showcaseonly=true},
	{"content", text=[[Complete time rifts]]},
	{"columns",
	{"item", text=[[**Time Rifts**]], guide="Daily Guides\\Dragonflight (10-70)\\Time Rifts"},
	}, --columnsend
	{"text", text=[[NOTE: This event spawns in Thaldraszus at the beginning of every hour and lasts for 15 minutes. New scenario stages are still being added.]]},

	{"content", text=[[Correct timeline anomalies in Eon's Fringe]]},
	{"columns",
	{"item", text=[[**Eon's Fringe Dailies**]], guide="Daily Guides\\Dragonflight (10-70)\\Eon's Fringe Dailies"},
	}, --columnsend
	{"text", text=[[Complete the daily quest to earn an Encapsulated Destiny, guaranteeing a reward when completing your next time rift event.]]},

	{"content", text=[[Assist the whelptenders in raising the next lineage of dragons]]},
	{"columns",
	{"item", text=[[**Little Scales Daycare**]], guide="Daily Guides\\Dragonflight (10-70)\\Little Scales Daycare"},
	}, --columnsend
	{"text", text=[[NOTE: This guide must be completed over the course of several days. Access to various daily quests will unlock as you complete it.]]},
	{"columns",
	}, --columnsend
	{"columns",
	{"item", text=[[**Little Scales Daycare Dailies**]], guide="Daily Guides\\Dragonflight (10-70)\\Little Scales Daycare Dailies"},
	}, --columnsend

{"section", text=[[PETSMOUNTS]]},
	{"banner", image=GQ.IMAGESDIR.."DragonflightPetsMounts",showcaseonly=true},

	{"guideslist", content=[[Ground Mounts]],filters={patch="100105", mounttype="Ground"},columns=4,path="PETSMOUNTS\\Mounts"},
	{"guideslist", content=[[Flying Mounts]],filters={patch="100105", mounttype="Flying"},columns=4,path="PETSMOUNTS\\Mounts"},
	{"guideslist", content=[[Aquatic Mounts]],filters={patch="100105", mounttype="Aquatic"},columns=4,path="PETSMOUNTS\\Mounts"},

	{"guideslist", content=[[Battle Pets - Source: Achievement]],filters={patch="100105", source="Achievement"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Black Market]],filters={patch="100105", source="BlackMarket"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Drop]],filters={patch="100105", source="Drop"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: In-Game Shop]],filters={patch="100105", source="In-GameShop"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Pet Battles]],filters={patch="100105", source="PetBattle"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Professions]],filters={patch="100105", source="Profession"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Promotions]],filters={patch="100105", source="Promotion"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Quest]],filters={patch="100105", source="Quest"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Trading Card Game]],filters={patch="100105", source="TradingCardGame"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Unknown]],filters={patch="100105", source="unknown"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Vendor]],filters={patch="100105", source="Vendor"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: World Events]],filters={patch="100105", source="WorldEvent"},columns=4,path="PETSMOUNTS\\Battle Pets"},

{"section", text=[[ACHIEVEMENTS]]},
	{"banner", image=GQ.IMAGESDIR.."DragonflightAchievements",showcaseonly=true},

	{"guideslist", filters={patch="100105", source="*"},columns=4,path="ACHIEVEMENTS"},
}) 


table.insert(GuideMenu.Featured,{
	title="Patch 10.1 - Embers of Neltharion", group="patch_101",
{"section", text=[[LEVELING]]},
        {"banner", image=GQ.IMAGESDIR.."Patch101Leveling",showcaseonly=true},
	{"columns",
	{"item", text=[[**Zaralek Cavern**]], guide="LEVELING\\Dragonflight (10-70)\\Zaralek Cavern"},
	{"item", text=[[**Dragon Glyphs (Zaralek Cavern)**]], guide="LEVELING\\Dragonflight (10-70)\\Dragon Glyphs\\Dragon Glyphs (Zaralek Cavern)"},
	{"item", text=[[**Snail Racing**]], guide="LEVELING\\Dragonflight (10-70)\\Snail Racing"},
	}, --columnsend

{"section", text=[[DUNGEONS]]},
	{"banner", image=GQ.IMAGESDIR.."Patch101Dungeons",showcaseonly=true},
	--{"text", text=[[NOTE: ]]},
	{"columns",
	{"item", text=[[**Aberrus, The Shadowed Cruible**]], guide="DUNGEONS\\Dragonflight Raids\\Aberrus, The Shadowed Crucible"},
	}, --columnsend
	
{"section", text=[[DAILIES]]},
        {"banner", image=GQ.IMAGESDIR.."Patch101Dailies",showcaseonly=true},
	{"text", text=[[NOTE: You can now load rare guides from rare icons. The new world quest type appears only when you are near it on the map and will not function in the world quest planner.]]},
	{"columns",
	{"item", text=[[**Zaralek Cavern World Quests**]], guide="DAILIES\\Dragonflight (10-70)\\Zaralek Cavern World Quests"},
	{"item", text=[[**Sniffenseeking!**]], guide="DAILIES\\Dragonflight (10-70)\\Sniffenseeking!"},
	}, --columnsend

{"section", text=[[REPUTATIONS]]},
        {"banner", image=GQ.IMAGESDIR.."Patch101Reputations",showcaseonly=true},
	{"content", text=[[Earn reputation with the Loamm Niffen faction.]]},
	{"columns",
	{"item", text=[[**Loamm Niffen Reputation**]], guide="REPUTATIONS\\Dragonflight Reputations\\Loamm Niffen"},
	}, --columnsend

{"section", text=[[PETSMOUNTS]]},
	{"banner", image=GQ.IMAGESDIR.."DragonflightPetsMounts",showcaseonly=true},

	{"guideslist", content=[[Ground Mounts]],filters={patch="100100", mounttype="Ground"},columns=4,path="PETSMOUNTS\\Mounts"},
	{"guideslist", content=[[Flying Mounts]],filters={patch="100100", mounttype="Flying"},columns=4,path="PETSMOUNTS\\Mounts"},
	{"guideslist", content=[[Aquatic Mounts]],filters={patch="100100", mounttype="Aquatic"},columns=4,path="PETSMOUNTS\\Mounts"},

	{"guideslist", content=[[Battle Pets - Source: Achievement]],filters={patch="100100", source="Achievement"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Black Market]],filters={patch="100100", source="BlackMarket"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Drop]],filters={patch="100100", source="Drop"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: In-Game Shop]],filters={patch="100100", source="In-GameShop"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Pet Battles]],filters={patch="100100", source="PetBattle"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Professions]],filters={patch="100100", source="Profession"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Promotions]],filters={patch="100100", source="Promotion"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Quest]],filters={patch="100100", source="Quest"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Trading Card Game]],filters={patch="100100", source="TradingCardGame"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Unknown]],filters={patch="100100", source="unknown"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Vendor]],filters={patch="100100", source="Vendor"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: World Events]],filters={patch="100100", source="WorldEvent"},columns=4,path="PETSMOUNTS\\Battle Pets"},

{"section", text=[[ACHIEVEMENTS]]},
	{"banner", image=GQ.IMAGESDIR.."DragonflightAchievements",showcaseonly=true},

	{"guideslist", filters={patch="100100", source="*"},columns=4,path="ACHIEVEMENTS"},
}) 


table.insert(GuideMenu.Featured,{
	title="Dragonflight", group="dragonflight",
{"section", text=[[LEVELING]]},
        {"banner", image=GQ.IMAGESDIR.."DragonflightLeveling",showcaseonly=true},

		{"content", text=[[NEW: Patch 10.0.7 Leveling Content:]]},
		{"columns",
		{"item", text=[[NEW: **The Forbidden Reach**]], guide="LEVELING\\Dragonflight (10-70)\\The Forbidden Reach"},
		{"item", text=[[NEW: **Old Hatreds Questline**]], guide="LEVELING\\Dragonflight (10-70)\\Old Hatreds Questline"},
		{"item", text=[[NEW: **Human Heritage Armor**]], guide="LEVELING\\Heritage Armor\\Human Heritage Armor", faction="A"},
		{"item", text=[[NEW: **Orc Heritage Armor**]], guide="LEVELING\\Heritage Armor\\Orc Heritage Armor", faction="H"},
	}, --columnsend

	{"content", text=[[Optional: Complete the Dracthyr starter zone]]},
	{"text", text=[[If leveling a Dracythr, use the Dracthyr starter guide to level your character to 60.]]},
	{"columns",
	{"item", text=[[**Dracthyr Starter (58-60)**]], guide="LEVELING\\Starter Guides\\Dracthyr Starter (58-60)"},
	}, --columnsend

	{"content", text=[[Reach Level 70 in the Dragon Isles]]},
	{"text", text=[[On your first character, we recommend using the Story Only guides, which will get you to level 67. Upon finishing the story you will unlock world quests. Once you finish the story and unlock world quests, load up the Thaldraszus Full Zone guide (since that's where you'll be when finishing the story) and start doing side quests, mixing in world quests, if you like. You will get the last 3 levels very quickly.|n|nFor alts, you will already have world quests unlocked, due to unlocking them on your main, so the leveling strategy would be to use the Story Only guides, and complete world quests that are nearby as you move through the story quests, then finish up with side quests in the Full Zone guides, if needed.]]},
	{"columns",
	{"item", text=[[**Intro & The Waking Shores (Full Zone)**]], guide="LEVELING\\Dragonflight (10-70)\\Full Zones (Story + Side Quests)\\Intro & The Waking Shores (Full Zone)"},
	{"item", text=[[**Intro & The Waking Shores (Story Only)**]], guide="LEVELING\\Dragonflight (10-70)\\Story Campaigns\\Intro & The Waking Shores (Story Only)"},
	{"item", text=[[**Ohn'ahran Plains (Full Zone)**]], guide="LEVELING\\Dragonflight (10-70)\\Full Zones (Story + Side Quests)\\Ohn'ahran Plains (Full Zone)"},
	{"item", text=[[**Ohn'ahran Plains (Story Only)***]], guide="LEVELING\\Dragonflight (10-70)\\Story Campaigns\\Ohn'ahran Plains (Story Only)"},
	{"item", text=[[**The Azure Span (Full Zone)**]], guide="LEVELING\\Dragonflight (10-70)\\Full Zones (Story + Side Quests)\\The Azure Span (Full Zone)"},
	{"item", text=[[**The Azure Span (Story Only)***]], guide="LEVELING\\Dragonflight (10-70)\\Story Campaigns\\The Azure Span (Story Only)"},
	{"item", text=[[**Thaldraszus (Full Zone)**]], guide="LEVELING\\Dragonflight (10-70)\\Full Zones (Story + Side Quests)\\Thaldraszus (Full Zone)"},
	{"item", text=[[**Thaldraszus (Story Only)**]], guide="LEVELING\\Dragonflight (10-70)\\Story Campaigns\\Thaldraszus (Story Only)"},
	}, --columnsend

	{"content", text=[[Complete the Dragonflight Campaign]]},
	{"text", text=[[Once you've played through the main Dragonflight storyline content you'll want to start on the Dragonflight Campaign. There are 9 chapters to the Dragonflight campaign, 8 of which are locked behind renown levels, and a 9th bonus chapter called Spark of Ingenuity which is timegated and being released in one to two parts weekly. We will be adding in the various chapters in the order our team is able to unlock them, but your experience may be different than ours. Please see our official blog for the latest info on what chapters guides have been released for.]]},

	{"columns",
	{"item", text=[[**Dragonflight Campaign**]], guide="LEVELING\\Dragonflight (10-70)\\Dragonflight Campaign"},
	}, --columnsend	

	{"content", text=[[Collect Dragon Glyphs to Upgrade your Dragonflight Ability]]},
	{"columns",
	{"item", text=[[**Dragon Glyphs (All Zones)**]], guide="LEVELING\\Dragonflight (10-70)\\Dragon Glyphs\\Dragon Glyphs (All Zones)"},
	}, --columnsend	

{"section", text=[[DUNGEONS]]},
        {"banner", image=GQ.IMAGESDIR.."DragonflightDungeons",showcaseonly=true},
	{"content", text=[[Optional: Complete the following Dragonflight dungeons.]]},
	{"columns",
	{"item", text=[[**Ruby Life Pools**]], guide="Dungeons\\Dragonflight Dungeons\\Ruby Life Pools"},
	{"item", text=[[**The Nokhud Offensive**]], guide="Dungeons\\Dragonflight Dungeons\\The Nokhud Offensive"},
	{"item", text=[[**Brackenhide Hollow**]], guide="Dungeons\\Dragonflight Dungeons\\Brackenhide Hollow"},
	{"item", text=[[**Halls of Infusion**]], guide="Dungeons\\Dragonflight Dungeons\\Halls of Infusion"},
	{"item", text=[[**Algeth'ar Academy**]], guide="Dungeons\\Dragonflight Dungeons\\Algeth'ar Academy"},
	{"item", text=[[**Neltharus**]], guide="Dungeons\\Dragonflight Dungeons\\Neltharus"},
	{"item", text=[[**The Azure Vault**]], guide="Dungeons\\Dragonflight Dungeons\\The Azure Vault"},
	}, --columnsend

{"section", text=[[DAILIES]]},
        {"banner", image=GQ.IMAGESDIR.."DragonflightDailies",showcaseonly=true},

		{"content", text=[[NEW: Forbidden Reach Dailies]]},
		{"columns",
		{"item", text=[[NEW: **Forbidden Reach Envoy Dailies**]], guide="Dailies\\Dragonflight (10-70)\\Forbidden Reach Envoy Dailies"},
		{"item", text=[[NEW: **The Forbidden Reach World Quests**]], guide="Dailies\\Dragonflight (10-70)\\The Forbidden Reach World Quests"},
		}, --columnsend

	{"content", text=[[Dragon Isles World Quests]]},
	{"columns",
	{"item", text=[[**The Azure Span World Quests**]], guide="Dailies\\Dragonflight (10-70)\\The Azure Span World Quests"},
	{"item", text=[[**Ohn'ahran Plains World Quests**]], guide="Dailies\\Dragonflight (10-70)\\Ohn'ahran Plains World Quests"},
	{"item", text=[[**Thaldraszus World Quests**]], guide="Dailies\\Dragonflight (10-70)\\Thaldraszus World Quests"},
	{"item", text=[[**The Waking Shores World Quests**]], guide="Dailies\\Dragonflight (10-70)\\The Waking Shores World Quests"},
	}, --columnsend

	{"content", text=[[Dragon Isles Weekly Quests]]},
	{"columns",
	{"item", text=[[**The Obsidian Citadel Weekly Quests**]], guide="Dailies\\Dragonflight (10-70)\\The Obsidian Citadel Weekly Quests"},
	}, --columnsend

	{"content", text=[[Dragon Isles Daily Quests]]},
	{"columns",
	{"item", text=[[**Aylaag Outpost Daily Quests (Rusza'thar Reach)**]], guide="Dailies\\Dragonflight (10-70)\\Maruuk Centaur\\Aylaag Outpost Daily Quests (Rusza'thar Reach)"},
	{"item", text=[[**Aylaag Outpost Daily Quests (Pinewood Post)**]], guide="Dailies\\Dragonflight (10-70)\\Maruuk Centaur\\Aylaag Outpost Daily Quests (Pinewood Post)"},
	{"item", text=[[**Aylaag Outpost Daily Quests (Eaglewatch Outpost)**]], guide="Dailies\\Dragonflight (10-70)\\Maruuk Centaur\\Aylaag Outpost Daily Quests (Eaglewatch Outpost)"},
	}, --columnsend


	{"content", text=[[Dragon Isles Misc. Endgame]]},
	{"columns",
	{"item", text=[[*Siege on Dragonbane Keep**]], guide="Dailies\\Dragonflight (10-70)\\Siege on Dragonbane Keep"},

	{"item", text=[[*A Climber's Calling**]], guide="Dailies\\Dragonflight (10-70)\\A Climber's Calling"},
	{"item", text=[[*A Cataloger's Paradise**]], guide="Dailies\\Dragonflight (10-70)\\A Cataloger's Paradise"},
	{"item", text=[[**Dragon Isles Emissary**]], guide="Dailies\\Dragonflight (10-70)\\Dragon Isles Emissary"},
	}, --columnsend

{"section", text=[[REPUTATIONS]]},
        {"banner", image=GQ.IMAGESDIR.."DragonflightReputations",showcaseonly=true},

		{"content", text=[[NEW: Winterpelt Furbolg]]},
		{"columns",
		{"item", text=[[NEW: **Winterpelt Furbolg**]], guide="Reputations\\Dragonflight Reputations\\Winterpelt Furbolg"},

		}, --columnsend

	{"content", text=[[Dragon Isles World Quests]]},
	{"columns",
	{"item", text=[[**Dragonscale Expedition**]], guide="Reputations\\Dragonflight Reputations\\Dragonscale Expedition\\Dragonscale Expedition"},
	{"item", text=[[**Dragonscale Expedition Flags**]], guide="Reputations\\Dragonflight Reputations\\Dragonscale Expedition\\Dragonscale Expedition Flags"},
	{"item", text=[[**Iskaara Tuskarr**]], guide="Reputations\\Dragonflight Reputations\\Iskaara Tuskarr\\Iskaara Tuskarr"},
	{"item", text=[[**Iskaara Tuskarr Community Feast**]], guide="Reputations\\Dragonflight Reputations\\Iskaara Tuskarr\\Community Feast"},
	{"item", text=[[**Iskaara Tuskarr Fishing Gear Crafting**]], guide="Reputations\\Dragonflight Reputations\\Iskaara Tuskarr\\Fishing Gear Crafting"},
	{"item", text=[[**Maruuk Centaur*]], guide="Reputations\\Dragonflight Reputations\\Maruuk Centaur\\Maruuk Centaur"},
	{"item", text=[[**Valdrakken Accord*]], guide="Reputations\\Dragonflight Reputations\\Valdrakken Accord\\Valdrakken Accord"},
	}, --columnsend

	{"content", text=[[Maruuk Centaur Grand Hunts:]]},
	{"columns",
	{"item", text=[[**Eastern Azure Span Hunt**]], guide="Reputations\\Dragonflight Reputations\\Maruuk Centaur\\Grand Hunts\\Eastern Azure Span Hunt"},
	{"item", text=[[**Southern Azure Span Hunt**]], guide="Reputations\\Dragonflight Reputations\\Maruuk Centaur\\Grand Hunts\\Southern Azure Span Hunt"},
	{"item", text=[[**Western Azure Span Hunt**]], guide="Reputations\\Dragonflight Reputations\\Maruuk Centaur\\Grand Hunts\\Western Azure Span Hunt"},
	{"item", text=[[**Eastern Ohn'ahran Plains Hunt**]], guide="Reputations\\Dragonflight Reputations\\Maruuk Centaur\\Grand Hunts\\Eastern Ohn'ahran Plains Hunt"},
	{"item", text=[[**Northern Ohn'ahran Plains Hunt**]], guide="Reputations\\Dragonflight Reputations\\Maruuk Centaur\\Grand Hunts\\Northern Ohn'ahran Plains Hunt"},
	{"item", text=[[**Western Ohn'ahran Plains Hunt**]], guide="Reputations\\Dragonflight Reputations\\Maruuk Centaur\\Grand Hunts\\Western Ohn'ahran Plains Hunt"},
	{"item", text=[[**Northern Thaldraszus Hunt**]], guide="Reputations\\Dragonflight Reputations\\Maruuk Centaur\\Grand Hunts\\Northern Thaldraszus Hunt"},
	{"item", text=[[**Southern Thaldraszus Hunt**]], guide="Reputations\\Dragonflight Reputations\\Maruuk Centaur\\Grand Hunts\\Southern Thaldraszus Hunt"},
	{"item", text=[[**Eastern Waking Shores Hunt**]], guide="Reputations\\Dragonflight Reputations\\Maruuk Centaur\\Grand Hunts\\Eastern Waking Shores Hunt"},
	{"item", text=[[**Northern Waking Shores Hunt**]], guide="Reputations\\Dragonflight Reputations\\Maruuk Centaur\\Grand Hunts\\Northern Waking Shores Hunt"},
	{"item", text=[[**Southern Waking Shores Hunt**]], guide="Reputations\\Dragonflight Reputations\\Maruuk Centaur\\Grand Hunts\\Southern Waking Shores Hunt"},
	}, --columnsend


{"section", text=[[PROFESSIONS]]},
	{"banner", image=GQ.IMAGESDIR.."DragonflightProfessions",showcaseonly=true},

	{"text", text=[[NOTE: These guides are currently in a BETA state, meaning, while they can be used now, they are still being worked on by the GoatQuest team to ensure they are working correctly and optimally.]]},

	{"content", text=[[Gathering Professions]]},

	{"columns",
		--[=[ 
		{"item", text=[[**Dragon Isles Jewelcrafting 1-100**]], guide="PROFESSIONS\\Jewelcrafting\\Leveling Guides\\Dragon Isles Jewelcrafting 1-100"},
		{"item", text=[[**Dragon Isles Cooking 1-75**]], guide="PROFESSIONS\\Cooking\\Leveling Guides\\Dragon Isles Cooking 1-100"},
		{"item", text=[[**Dragon Isles Inscription 1-100**]], guide="PROFESSIONS\\Inscription\\Leveling Guides\\Dragon Isles Inscription 1-100"},
		{"item", text=[[**SDragon Isles Fishing 1-100**]], guide="PROFESSIONS\\Fishing\\Leveling Guides\\Dragon Isles Fishing 1-100"},

		--]=]

		{"item", text=[[**Dragon Isles Herbalism 1-100**]], guide="PROFESSIONS\\Herbalism\\Leveling Guides\\Dragon Isles Herbalism 1-100"},
		{"item", text=[[**Dragon Isles Mining 1-100**]], guide="PROFESSIONS\\Mining\\Leveling Guides\\Dragon Isles Mining 1-100"},
		{"item", text=[[**Dragon Isles Skinning 1-100**]], guide="PROFESSIONS\\Skinning\\Leveling Guides\\Dragon Isles Skinning 1-100"},

	}, --columnsend

	{"content", text=[[Crafting Professions]]},

	{"columns",
		--[=[ 
		{"item", text=[[**Dragon Isles Cooking 1-75**]], guide="PROFESSIONS\\Cooking\\Leveling Guides\\Dragon Isles Cooking 1-100"},
		{"item", text=[[**Dragon Isles Inscription 1-100**]], guide="PROFESSIONS\\Inscription\\Leveling Guides\\Dragon Isles Inscription 1-100"},
		{"item", text=[[**SDragon Isles Fishing 1-100**]], guide="PROFESSIONS\\Fishing\\Leveling Guides\\Dragon Isles Fishing 1-100"},

		--]=]
		{"item", text=[[**Dragon Isles Alchemy 1-100**]], guide="PROFESSIONS\\Alchemy\\Leveling Guides\\Dragon Isles Alchemy 1-100"},
		{"item", text=[[**Dragon Isles Blacksmithing 1-100**]], guide="PROFESSIONS\\Blacksmithing\\Leveling Guides\\Dragon Isles Blacksmithing 1-100"},
		{"item", text=[[**Dragon Isles Enchanting 1-100**]], guide="PROFESSIONS\\Enchanting\\Leveling Guides\\Dragon Isles Enchanting 1-100"},
		{"item", text=[[**Dragon Isles Engineering 1-100**]], guide="PROFESSIONS\\Engineering\\Leveling Guides\\Dragon Isles Engineering 1-100"},
		{"item", text=[[**Dragon Isles Jewelcrafting 1-100**]], guide="PROFESSIONS\\Jewelcrafting\\Leveling Guides\\Dragon Isles Jewelcrafting 1-100"},
		{"item", text=[[**Dragon Isles Leatherworking 1-100**]], guide="PROFESSIONS\\Leatherworking\\Leveling Guides\\Dragon Isles Leatherworking 1-100"},
		{"item", text=[[**Dragon Isles Tailoring 1-100**]], guide="PROFESSIONS\\Tailoring\\Leveling Guides\\Dragon Isles Tailoring 1-100"},
	}, --columnsend

{"section", text=[[PETSMOUNTS]]},
	{"banner", image=GQ.IMAGESDIR.."DragonflightPetsMounts",showcaseonly=true},

	{"guideslist", content=[[Ground Mounts]],filters={patch="100002", mounttype="Ground"},columns=4,path="PETSMOUNTS\\Mounts"},
	{"guideslist", content=[[Flying Mounts]],filters={patch="100002", mounttype="Flying"},columns=4,path="PETSMOUNTS\\Mounts"},
	{"guideslist", content=[[Aquatic Mounts]],filters={patch="100002", mounttype="Aquatic"},columns=4,path="PETSMOUNTS\\Mounts"},

	{"guideslist", content=[[Battle Pets - Source: Achievement]],filters={patch="100002", source="Achievement"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Black Market]],filters={patch="100002", source="BlackMarket"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Drop]],filters={patch="100002", source="Drop"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: In-Game Shop]],filters={patch="100002", source="In-GameShop"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Pet Battles]],filters={patch="100002", source="PetBattle"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Professions]],filters={patch="100002", source="Profession"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Promotions]],filters={patch="100002", source="Promotion"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Quest]],filters={patch="100002", source="Quest"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Trading Card Game]],filters={patch="100002", source="TradingCardGame"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Unknown]],filters={patch="100002", source="unknown"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Vendor]],filters={patch="100002", source="Vendor"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: World Events]],filters={patch="100002", source="WorldEvent"},columns=4,path="PETSMOUNTS\\Battle Pets"},

{"section", text=[[ACHIEVEMENTS]]},
	{"banner", image=GQ.IMAGESDIR.."DragonflightAchievements",showcaseonly=true},

	{"guideslist", filters={patch="100002", source="*"},columns=4,path="ACHIEVEMENTS"},
}) 


table.insert(GuideMenu.Featured,{
	title="Patch 9.2 - Eternity's End", group="patch_92",
{"section", text=[[LEVELING]]},
        {"banner", image=GQ.IMAGESDIR.."Patch92Leveling",showcaseonly=true},
	{"content", text=[[Complete the Zereth Mortis questing guide and Unlock Flying in Zereth Mortis]]},
	{"text", text=[[Patch 9.2 introduces a new questing zone called Zereth Mortis with a new storyline campaign.|n|nComplete the first three chapters to unlock daily quests in Zereth Mortis. You can use the Flying Unlock guide to begin working towards unlocking flying in Zereth Mortis.|n|nNote that flying won't be fully attainable until the release of chapter 6 of the campaign which is estimated to be on or after March 15th.
]]},
	{"columns",
	{"item", text=[[**Zereth Mortis**]], guide="LEVELING\\Shadowlands (50-60)\\Eternity's End\\Zereth Mortis"},
	{"item", text=[[**Zereth Mortis Flying Unlock**]], guide="LEVELING\\Shadowlands (50-60)\\Eternity's End\\Zereth Mortis Flying Unlock"},
	}, --columnsend
	
{"section", text=[[DAILIES]]},
        {"banner", image=GQ.IMAGESDIR.."Patch92Dailies",showcaseonly=true},
	{"content", text=[[Complete Zereth Mortis Daily and World Quests]]},
	{"text", text=[[Make sure you have completed the first three chapters of the Zereth Mortis campaign guide to unlock daily quests.|n|nComplete Daily and World Quests to gain currency, gear, and materials to upgrade the cypher console and unlock new abilities for you and your Pocopoc companion.]]},
	{"columns",
	{"item", text=[[**Zereth Mortis Daily Quests**]], guide="DAILIES\\Shadowlands (50-60)\\Eternity's End\\Zereth Mortis Daily Quests"},
	{"item", text=[[**Zereth Mortis World Quests**]], guide="DAILIES\\Shadowlands (50-60)\\Zereth Mortis World Quests"},
	}, --columnsend

{"section", text=[[DUNGEONS]]},
        {"banner", image=GQ.IMAGESDIR.."Patch92Dungeons",showcaseonly=true},
	{"content", text=[[Complete the Sepulcher of the First Ones Raid]]},

	{"columns",
	{"item", text=[[**Sepulcher of the First Ones Raid**]], guide="DUNGEONS\\Shadowlands Raids\\Sepulcher of the First Ones"},
	}, --columnsend


{"section", text=[[PROFESSIONS]]},
        {"banner", image=GQ.IMAGESDIR.."Patch92Professions",showcaseonly=true},
		{"content", text=[[Unlock the Protoform Synthesis crafting system and Collect Schematics]]},
		{"text", text=[[Zereth Mortis introduces a new crafting system called Protoform Synthesis that allows you to craft Battle Pets and Mounts.|n|nAfter you complete Chapter 3 of the Zereth Mortis campaign you will gain access to the Cypher Research Console. To unlock Protoform Synthesis, you will need to use the Dealic section of the Cypher Research Console to research the talents Dealic Understanding (for crafting Battle Pets) and Sopranian Understanding (for crafting Mounts).|n|nYou can then use the following guides to obtain schematics which teach you how to craft different creatures.|n|nNote: Some aspects of this content is time-gated until week 4 of the Patch 9.2 release.]]},

		{"columns",
		{"item", text=[[**Schematic: Adorned Vombata**]], guide="PROFESSIONS\\Protoform Synthesis\\Schematic: Adorned Vombata"},
		{"item", text=[[**Schematic: Bronze Helicid**]], guide="PROFESSIONS\\Protoform Synthesis\\Schematic: Bronze Helicid"},
		{"item", text=[[**Schematic: Bronzewing Vespoid**]], guide="PROFESSIONS\\Protoform Synthesis\\Schematic: Bronzewing Vespoid"},
		{"item", text=[[**Schematic: Buzz**]], guide="PROFESSIONS\\Protoform Synthesis\\Schematic: Buzz"},
		{"item", text=[[**Schematic: Deathrunner**]], guide="PROFESSIONS\\Protoform Synthesis\\Schematic: Deathrunner"},
		{"item", text=[[**Schematic: Forged Spiteflyer**]], guide="PROFESSIONS\\Protoform Synthesis\\Schematic: Forged Spiteflyer"},
		{"item", text=[[**Schematic: Genesis Crawler**]], guide="PROFESSIONS\\Protoform Synthesis\\Schematic: Genesis Crawler"},
		{"item", text=[[**Schematic: Heartbond Lupine**]], guide="PROFESSIONS\\Protoform Synthesis\\Schematic: Heartbond Lupine"},
		{"item", text=[[**Schematic: Pale Regal Cervid**]], guide="PROFESSIONS\\Protoform Synthesis\\Schematic: Pale Regal Cervid"},
		{"item", text=[[**Schematic: Raptora Swooper**]], guide="PROFESSIONS\\Protoform Synthesis\\Schematic: Raptora Swooper"},
		{"item", text=[[**Schematic: Raptora Swooper**]], guide="PROFESSIONS\\Protoform Synthesis\\Schematic: Russet Bufonid"},
		{"item", text=[[**Schematic: Raptora Swooper**]], guide="PROFESSIONS\\Protoform Synthesis\\Schematic: Sundered Zerethsteed"},
		{"item", text=[[**Schematic: Raptora Swooper**]], guide="PROFESSIONS\\Protoform Synthesis\\Schematic: Tarachnid Creeper"},
		}, --columnsend

{"section", text=[[PETSMOUNTS]]},
        {"banner", image=GQ.IMAGESDIR.."Patch92PetsMounts",showcaseonly=true},
		{"text", text=[[You can obtain the following collectibles in Patch 9.2.|n|nNote: Some aspects of this content is time-gated until week 4 of the Patch 9.2 release.]]},

	{"guideslist", content=[[Battle Pets - Source: Vendor]],filters={patch="90200", source="Vendor"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Drop]],filters={patch="90200", source="Drop"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Quest]],filters={patch="90200", source="Quest"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Achievement]],filters={patch="90200", source="Achievement"},columns=4,path="PETSMOUNTS\\Battle Pets"},

	{"guideslist", content=[[Battle Pets - Source: Discovery]],filters={patch="90200", source="Discovery"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	
	{"guideslist", content=[[Source: Profession]],filters={patch="90200", source="Profession"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Source: Promotion]],filters={patch="90200", source="Promotion"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Source: Trading Card Game]],filters={patch="90200", source="TradingCardGame"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Source: World Event]],filters={patch="90200", source="WorldEvent"},columns=4,path="PETSMOUNTS\\Battle Pets"}, 

	{"guideslist", content=[[Ground Mounts]],filters={patch="90200", mounttype="Ground"},columns=4,path="PETSMOUNTS\\Mounts"},
	{"guideslist", content=[[Flying Mounts]],filters={patch="90200", mounttype="Flying"},columns=4,path="PETSMOUNTS\\Mounts"},

{"section", text=[[ACHIEVEMENTS]]},
	{"banner", image=GQ.IMAGESDIR.."Patch92Achievements",showcaseonly=true},

	{"guideslist", content=[[Exploration Achievements]],filters={patch="90200"},columns=4,path="ACHIEVEMENTS\\Exploration"},
	{"guideslist", content=[[Quest Achievements]],filters={patch="90200"},columns=4,path="ACHIEVEMENTS\\Quests"},


}) 


table.insert(GuideMenu.Featured,{
	title="Patch 9.1 - Chains of Domination", group="patch_91",
{"section", text=[[LEVELING]]},
        {"banner", image=GQ.IMAGESDIR.."Patch91Leveling",showcaseonly=true},
	{"content", text=[[Complete the New Covenant Campaign Chapters and Unlock Flying in Shadowlands]]},
	{"text", text=[[The covenant campaign has been expanded with nine new chapters. Three of these chapters are available at launch. New chapters will unlock in game weekly. After completing the fourth chapter in week two you'll receive the item Memories of Sunless Skies which will unlock flying and let you get your covenant flying mount (at Renown 45).]]},
	{"columns",
	{"item", text=[[**Chains of Domination Questline**]], guide="LEVELING\\Shadowlands (50-60)\\Chains of Domination\\Chains of Domination Questline"},
	}, --columnsend

	{"content", text=[[Unlock and Complete Korthia Questlines]]},
	{"text", text=[[Patch 9.1 introduces a new zone called Korthia. As you progress through the Chains of Domination guide you will unlock 2 questlines in Korthia:]]},
	{"list", text=[["They Could Be Anyone Questline" is the main Korthia questline. This questline is unlocked via the quest "A United Effort" in the Chains of Domination guide.]]},
	{"list", text=[["Archivists of Korthia Questline" unlocks the Archivists of Korthia faction. This questline is unlocked via the quest "In Need of Assistance" in the Chains of Domination guide.]]},
	{"text", text=[[You can do these individually or use our combined guide to do them together in one loop around Korthia.]]},


	{"columns",
	{"item", text=[[**They Could Be Anyone Questline**]], guide="LEVELING\\Shadowlands (50-60)\\Chains of Domination\\They Could Be Anyone Questline"},
	{"item", text=[[**Archivists of Korthia Questline**]], guide="LEVELING\\Shadowlands (50-60)\\Chains of Domination\\Archivists of Korthia Questline"},
	{"item", text=[[**Archivists of Korthia and They Could Be Anyone Questlines**]], guide="LEVELING\\Shadowlands (50-60)\\Chains of Domination\\Archivists of Korthia and They Could Be Anyone Questlines"},
	
	}, --columnsend

	{"content", text=[[Complete Covenant Assaults]]},
	{"text", text=[[These are the new covenant assault quests in The Maw that rotate every 3 days. They will unlock via the "A Unified Effort" quest in the Chains of Domination Questline.]]},
	{"columns",
	{"item", text=[[**Covenant Assaults**]], guide="LEVELING\\Shadowlands (50-60)\\Chains of Domination\\Covenant Assaults"},	}, --columnsend


{"section", text=[[DUNGEONS]]},
        {"banner", image=GQ.IMAGESDIR.."Patch91Dungeons",showcaseonly=true},
	{"content", text=[[Unlock the Tazavesh Dungeon]]},
	{"text", text=[[Complete this short quest chain to unlock the Gilded Landing flight path and Tazavesh, the Veiled Market dungeon.]]},
	{"columns",
	{"item", text=[[**Tazavesh, the Veiled Market Attunement**]], guide="DUNGEONS\\Shadowlands Dungeons\\Tazavesh, the Veiled Market Attunement"},
	}, --columnsend

	{"content", text=[[Complete the Tazavesh Dungeon]]},
	{"text", text=[[Tazavesh is a new 8 boss mythic megadungeon. It is unlocked by completing "The Veiled Market" quest in the Tazavesh, the Veiled Market Attunement guide.]]},
	{"columns",
	{"item", text=[[**Tazavesh, the Veiled Market**]], guide="DUNGEONS\\Shadowlands Dungeons\\Tazavesh, the Veiled Market"},
	}, --columnsend

	{"content", text=[[Complete the Sanctum of Domination Raid Questline]]},
	{"text", text=[[The Sanctum of Domination is a new 10 boss raid located inside Torghast. The normal and heroic version of the new raid will be available when the patch launches. The mythic and LFR will come later.]]},
	{"columns",
	{"item", text=[[**Sanctum of Domination**]], guide="DUNGEONS\\Shadowlands Raids\\Sanctum of Domination"},
	}, --columnsend


	
{"section", text=[[DAILIES]]},
        {"banner", image=GQ.IMAGESDIR.."Patch91Dailies",showcaseonly=true},
	{"content", text=[[Complete Korthia Daily Quests]]},
	{"text", text=[[These are the new Korthia daily quests which unlock via the "In Need of Assistance" quest in the Chains of Domination Questline guide.]]},
	{"columns",
	{"item", text=[[**Korthia Daily Quests**]], guide="DAILIES\\Shadowlands (50-60)\\Chains of Domination\\Korthia Daily Quests"},
	}, --columnsend

	{"content", text=[[Complete Daily Quests in The Maw]]},
	{"text", text=[[New world quests in the Maw. So far we've only seen one quest here, but this guide will be updated if more are added.]]},
	{"columns",
	{"item", text=[[**The Maw World Quests**]], guide="DAILIES\\Shadowlands (50-60)\\The Maw World Quests"},
	}, --columnsend


{"section", text=[[PETSMOUNTS]]},
        {"banner", image=GQ.IMAGESDIR.."Patch91PetsMounts",showcaseonly=true},

	{"guideslist", content=[[Battle Pets - Source: Vendor]],filters={patch="90100", source="Vendor"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Drop]],filters={patch="90100", source="Drop"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Quest]],filters={patch="90100", source="Quest"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Achievement]],filters={patch="90001", source="Achievement"},columns=4,path="PETSMOUNTS\\Battle Pets"},

	{"guideslist", content=[[Battle Pets - Source: Discovery]],filters={patch="90100", source="Discovery"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	
	{"guideslist", content=[[Source: Profession]],filters={patch="90100", source="Profession"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Source: Promotion]],filters={patch="90100", source="Promotion"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Source: Trading Card Game]],filters={patch="90100", source="TradingCardGame"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Source: World Event]],filters={patch="90100", source="WorldEvent"},columns=4,path="PETSMOUNTS\\Battle Pets"}, 
	

	{"guideslist", content=[[Ground Mounts]],filters={patch="90100", mounttype="Ground"},columns=4,path="PETSMOUNTS\\Mounts"},
	{"guideslist", content=[[Flying Mounts]],filters={patch="90100", mounttype="Flying"},columns=4,path="PETSMOUNTS\\Mounts"},


}) 


table.insert(GuideMenu.Featured,{
	title="Shadowlands", group="shadowlands",

{"section", text=[[LEVELING]]},
        {"banner", image=GQ.IMAGESDIR.."ShadowlandsLeveling",showcaseonly=true},

	{"content", text=[[Reach Level 10]]},
	{"text", text=[[Shadowlands introduces a new shared starter zone called Exile's Reach to level from 1-10. If starting a new character, use the Exiles Reach guide to reach level 10.]]},
	{"columns",
		{"item", text=[[**Exile's Reach (1-10)**]], guide="LEVELING\\Starter Guides\\Exile's Reach (1-10)"},
	}, --columnsend

	{"content", text=[[Reach Level 50]]},
	{"text", text=[[At level 10 you can choose one expansion which will scale to level you from 10 to 50. If it's your first time Use the Chromie Time guide to pick or change your expansion.]]},
	{"columns",
		{"item", text=[[**Chromie Time**]], guide="LEVELING\\Starter Guides\\Chromie Time",roadmaponly=true},
		{"item", text=[[**Classic (1-60)**]], folder="LEVELING\\Classic (1-60)",roadmaponly=true},
		{"item", text=[[**The Burning Crusade (10-60)**]], folder="LEVELING\\The Burning Crusade (10-60)",roadmaponly=true},
		{"item", text=[[**Wrath of the Lich King (10-60)**]], folder="LEVELING\\Wrath of the Lich King (10-60)",roadmaponly=true},
		{"item", text=[[**Cataclysm (10-60)**]], folder="LEVELING\\Cataclysm (10-60)",roadmaponly=true},
		{"item", text=[[**Pandaria (10-60)**]], folder="LEVELING\\Pandaria (10-60)",roadmaponly=true},
		{"item", text=[[**Draenor (10-60)**]], folder="LEVELING\\Draenor (10-60)",roadmaponly=true},
		{"item", text=[[**Legion (10-60)**]], folder="LEVELING\\Legion (10-60)",roadmaponly=true},
		{"item", text=[[**Battle for Azeroth (10-60)**]], folder="LEVELING\\Battle for Azeroth (10-60)",roadmaponly=true},
	}, --columnsend
	
	{"content", text=[[Complete The Shadowlands Intro]]},
	{"text", text=[[Once you've reached level 50 you're ready to begin your journey into the Shadowlands by completing the intro scenario.]]},
	{"list", text=[[If it's your first time through Shadowlands you have to complete the storyline and will need to select the Main Character choice when prompted in this guide. If you've already played through Shadowlands you can choose the Alt Character option to skip the storyline and level with side quests, dungeons, and world quests.]]},
	{"columns",
		{"item", text=[[**Shadowlands Intro & Main Story Questline**]], guide="LEVELING\\Shadowlands (50-60)\\Shadowlands Intro & Main Story Questline"},
	}, --columnsend

	{"content", text=[[Reach Level 60]]},
	{"text", text=[[After you've completed the intro you will be able to choose one of the following four new zones to level up to 60. If you prefer to level only with story line quests and skip the side quests choose the story only versions]]},
	{"list", text=[[Alternatively, you can level up with our Shadowlands Dungeon guides.]]},
	{"columns",
		{"item", text=[[**Bastion**]], guide="LEVELING\\Shadowlands (50-60)\\Bastion"},
		{"item", text=[[**Bastion (Story Only)**]], guide="LEVELING\\Shadowlands (50-60)\\Bastion (Story Only)"},
		{"item", text=[[**Maldraxxus**]], guide="LEVELING\\Shadowlands (50-60)\\Maldraxxus"},
		{"item", text=[[**Maldraxxus (Story Only)**]], guide="LEVELING\\Shadowlands (50-60)\\Maldraxxus (Story Only)"},
		{"item", text=[[**Ardenweald**]], guide="LEVELING\\Shadowlands (50-60)\\Ardenweald"},
		{"item", text=[[**Ardenweald (Story Only)**]], guide="LEVELING\\Shadowlands (50-60)\\Ardenweald (Story Only)"},
		{"item", text=[[**Revendreth**]], guide="LEVELING\\Shadowlands (50-60)\\Revendreth"},
		{"item", text=[[**Revendreth (Story Only)**]], guide="LEVELING\\Shadowlands (50-60)\\Revendreth (Story Only)"},
		{"item", text=[[**The Maw**]], guide="LEVELING\\Shadowlands (50-60)\\The Maw"},
	}, --columnsend

	{"content", text=[[Complete Your Covenant Questline]]},
	{"text", text=[[Once you've reached level 60 you can start your covenant questline.]]},
	{"columns",
		{"item", text=[[**Kyrian Questline**]], guide="LEVELING\\Shadowlands (50-60)\\Kyrian Covenant\\Kyrian Questline"},
		{"item", text=[[**Night Fae Questline**]], guide="LEVELING\\Shadowlands (50-60)\\Night Fae Covenant\\Night Fae Questline"},
		{"item", text=[[**Necrolord Questline**]], guide="LEVELING\\Shadowlands (50-60)\\Necrolords Covenant\\Necrolords Questline"},
		{"item", text=[[**Venthyr Questline**]], guide="LEVELING\\Shadowlands (50-60)\\Venthyr Covenant\\Venthyr Questline"},
	}, --columnsend

	{"content", text=[[Unlock Covenant Sanctum Upgrades]]},
	{"text", text=[[You can use the following guides to unlock various upgrades for your covenant's sanctum.]]},
	{"columns",
		{"item", text=[[**Kyrian Anima Conductor**]], guide="LEVELING\\Shadowlands (50-60)\\Kyrian Covenant\\Kyrian Anima Conductor"},
		{"item", text=[[**Kyrian Transport Network**]], guide="LEVELING\\Shadowlands (50-60)\\Kyrian Covenant\\Kyrian Transport Network"},
		{"item", text=[[**Kyrian Path of Ascension**]], guide="LEVELING\\Shadowlands (50-60)\\Kyrian Covenant\\Path of Ascension\\Kyrian Path of Ascension"},

		{"item", text=[[**Night Fae Anima Conductor**]], guide="LEVELING\\Shadowlands (50-60)\\Night Fae Covenant\\Night Fae Anima Conductor"},
		{"item", text=[[**Night Fae Transport Network**]], guide="LEVELING\\Shadowlands (50-60)\\Night Fae Covenant\\Night Fae Transport Network"},
		{"item", text=[[**Night Fae Queen's Conservatory**]], guide="LEVELING\\Shadowlands (50-60)\\Night Fae Covenant\\Night Fae Queen's Conservatory"},

		{"item", text=[[**Necrolords Anima Conductor**]], guide="LEVELING\\Shadowlands (50-60)\\Necrolords Covenant\\Necrolords Anima Conductor"},
		{"item", text=[[**Necrolords Transport Network**]], guide="LEVELING\\Shadowlands (50-60)\\Necrolords Covenant\\Necrolords Transport Network"},
		{"item", text=[[**Necrolords Command Table**]], guide="LEVELING\\Shadowlands (50-60)\\Necrolords Covenant\\Necrolords Command Table"},
		{"item", text=[[**Necrolords Abomination Factory**]], guide="LEVELING\\Shadowlands (50-60)\\Necrolords Covenant\\Abomination Factory\\Necrolords Abomination Factory"},

		{"item", text=[[**Venthyr Anima Conductor**]], guide="LEVELING\\Shadowlands (50-60)\\Venthyr Covenant\\Venthyr Anima Conductor"},
		{"item", text=[[**Venthyr Transport Network**]], guide="LEVELING\\Shadowlands (50-60)\\Venthyr Covenant\\Venthyr Transport Network"},
		{"item", text=[[**Venthyr Command Table**]], guide="LEVELING\\Shadowlands (50-60)\\Venthyr Covenant\\Venthyr Command Table"},
		{"item", text=[[**Venthyr The Ember Court**]], guide="LEVELING\\Shadowlands (50-60)\\Venthyr Covenant\\Venthyr The Ember Court"},
	}, --columnsend


{"section", text=[[DUNGEONS]]},
	{"banner", image=GQ.IMAGESDIR.."ShadowlandsDungeons",showcaseonly=true},

	{"content", text=[[Leveling Dungeons]]},
	{"text", text=[[You can level up to 60 using the following dungeons.]]},
	{"columns",
		{"item", text=[[**The Necrotic Wake**]], guide="DUNGEONS\\Shadowlands Dungeons\\The Necrotic Wake"},
		{"item", text=[[**Plaguefall**]], guide="DUNGEONS\\Shadowlands Dungeons\\Plaguefall"},
		{"item", text=[[**Mists of Tirna Scithe**]], guide="DUNGEONS\\Shadowlands Dungeons\\Mists of Tirna Scithe"},
		{"item", text=[[**Halls of Atonement**]], guide="DUNGEONS\\Shadowlands Dungeons\\Halls of Atonement"},
	}, --columnsend

	{"content", text=[[Max Level Dungeons]]},
	{"text", text=[[You can complete the following dungeons once you've reached level 60.]]},
	{"columns",
		{"item", text=[[**Theater of Pain**]], guide="DUNGEONS\\Shadowlands Dungeons\\Theater of Pain"},
		{"item", text=[[**De Other Side**]], guide="DUNGEONS\\Shadowlands Dungeons\\De Other Side"},
		{"item", text=[[**Spires of Ascension**]], guide="DUNGEONS\\Shadowlands Dungeons\\Spires of Ascension"},
		{"item", text=[[**Sanguine Depths**]], guide="DUNGEONS\\Shadowlands Dungeons\\Sanguine Depths"},
	}, --columnsend

	{"content", text=[[Unlock Torghast]]},
	{"text", text=[[Torghast is a new endlessly replayable dungeon. Use the guides below to unlock and play through the Torghast dungeon.]]},
	{"columns",
		{"item", text=[[**Torghast Questline**]], guide="LEVELING\\Shadowlands (50-60)\\Torghast\\Torghast Questline"},
	}, --columnsend

	{"content", text=[[Shadowlands Raids]]},
	{"columns",
		{"item", text=[[**Castle Nathria**]], guide="DUNGEONS\\Shadowlands Raids\\Castle Nathria"},
	}, --columnsend

{"section", text=[[DAILIES]]},
	{"banner", image=GQ.IMAGESDIR.."ShadowlandsDailies",showcaseonly=true},

	{"content", text=[[Unlock World Quests and Covenant Dailies]]},
	{"text", text=[[Play through the Covenant Questline guides in the Leveling section until you unlock World Quests and Covenant Dailies.]]},

	{"content", text=[[Zone World Quests]]},
	{"text", text=[[Once you've reached level 60 you can enjoy the end game by completing world quests in the following zones.]]},
	{"list", text=[[It is recommended that you use the World Quest Planner feature for this.]]},
	{"columns",
		{"item", text=[[**Bastion World Quests**]], guide="DAILIES\\Shadowlands (50-60)\\Bastion World Quests"},
		{"item", text=[[**Ardenweald World Quests**]], guide="DAILIES\\Shadowlands (50-60)\\Ardenweald World Quests"},
		{"item", text=[[**Maldraxxus World Quests**]], guide="DAILIES\\Shadowlands (50-60)\\Maldraxxus World Quests"},
		{"item", text=[[**Revendreth World Quests**]], guide="DAILIES\\Shadowlands (50-60)\\Revendreth World Quests"},
		{"item", text=[[**Ve'nari Daily Quests (The Maw)**]], guide="DAILIES\\Shadowlands (50-60)\\Ve'nari Daily Quests (The Maw)", faction="A"},
		{"item", text=[[**Ve'nari World Quests (The Maw)**]], guide="DAILIES\\Shadowlands (50-60)\\Ve'nari Daily Quests (The Maw)", faction="H"},
	}, --columnsend

	{"content", text=[[Covenant Daily Quests]]},
	{"text", text=[[Once you've reached level 60 you can enjoy the end game by completing daily quests for the following covenants.]]},
	{"columns",
		{"item", text=[[**Kyrian Daily Quests**]], guide="DAILIES\\Shadowlands (50-60)\\Kyrian Covenant\\Kyrian Daily Quests"},
		{"item", text=[[**Kyrian Anima Conductor Daily Quests**]], guide="DAILIES\\Shadowlands (50-60)\\Kyrian Covenant\\Kyrian Anima Conductor Daily Quests"},
		{"item", text=[[**Necrolord Dailies**]], guide="DAILIES\\Shadowlands (50-60)\\Necrolords Covenant\\Necrolord Daily Quests"},
		{"item", text=[[**Necrolords Anima Conductor Daily Quests**]], guide="DAILIES\\Shadowlands (50-60)\\Necrolords Covenant\\Necrolords Anima Conductor Daily Quests"},
		{"item", text=[[**Necrolords Abomination Factory Weekly Quests**]], guide="DAILIES\\Shadowlands (50-60)\\Necrolords Covenant\\Necrolords Abomination Factory Weekly Quests"},


		{"item", text=[[**Night Fae Dailies**]], guide="DAILIES\\Shadowlands (50-60)\\Night Fae Covenant\\Night Fae Daily Quests"},
		{"item", text=[[**Fungal Terminus Daily Quests**]], guide="DAILIES\\Shadowlands (50-60)\\Night Fae Covenant\\Fungal Terminus Daily Quests"},
		{"item", text=[[**Night Fae Anima Conductor Daily Quests**]], guide="DAILIES\\Shadowlands (50-60)\\Night Fae Covenant\\Night Fae Anima Conductor Daily Quests"},
		{"item", text=[[**Night Fae Anima Conductor Daily Quests**]], guide="DAILIES\\Shadowlands (50-60)\\Night Fae Covenant\\Night Fae Queen's Conservatory Daily Quests"},

		{"item", text=[[**Venthyr Dailies**]], guide="DAILIES\\Shadowlands (50-60)\\Venthyr Covenant\\Venthyr Daily Quests"},
		{"item", text=[[**Venthyr Anima Conductor Daily Quests**]], guide="DAILIES\\Shadowlands (50-60)\\Venthyr Covenant\\Venthyr Anima Conductor Daily Quests"},
	}, --columnsend

--[=[

{"section", text=[[REPUTATIONS]]},
	{"banner", image=GQ.IMAGESDIR.."ShadowlandsReputations",showcaseonly=true},

	{"content", text=[[Reach Exalted Status With Your Covenant]]},
	{"columns",
		{"item", text=[[**Kyrian Covenant of Bastion**]], guide="REPUTATIONS\\Shadowlands\\Kyrian Covenant of Bastion"},
		{"item", text=[[**Night Fae of Ardenweald**]], guide="REPUTATIONS\\Shadowlands\\Night Fae of Ardenweald"},
		{"item", text=[[**Necrolords of Maldraxxus**]], guide="REPUTATIONS\\Shadowlands\\Necrolords of Maldraxxus"},
		{"item", text=[[**Venthyr of Revendreth**]], guide="REPUTATIONS\\Shadowlands\\Venthyr of Revendreth"},
	}, --columnsend

--]=]

{"section", text=[[PROFESSIONS]]},
	{"banner", image=GQ.IMAGESDIR.."ShadowlandsProfessions",showcaseonly=true},

	{"content", text=[[Reach Max Profession Skill in Shadowlands]]},
	{"columns",
		{"item", text=[[**Shadowlands Jewelcrafting 1-100**]], guide="PROFESSIONS\\Jewelcrafting\\Leveling Guides\\Shadowlands Jewelcrafting 1-100"},
		{"item", text=[[**Shadowlands Cooking 1-75**]], guide="PROFESSIONS\\Cooking\\Leveling Guides\\Shadowlands Cooking 1-75"},
		{"item", text=[[**Shadowlands Herbalism 1-175**]], guide="PROFESSIONS\\Herbalism\\Leveling Guides\\Shadowlands Herbalism 1-150"},
		{"item", text=[[**Shadowlands Mining 1-175**]], guide="PROFESSIONS\\Mining\\Leveling Guides\\Shadowlands Mining 1-150"},
		{"item", text=[[**Shadowlands Tailoring 1-100**]], guide="PROFESSIONS\\Tailoring\\Leveling Guides\\Shadowlands Tailoring 1-100"},
		{"item", text=[[**Shadowlands Alchemy 1-175**]], guide="PROFESSIONS\\Alchemy\\Leveling Guides\\Shadowlands Alchemy 1-175"},
		{"item", text=[[**Shadowlands Enchanting 1-100**]], guide="PROFESSIONS\\Enchanting\\Leveling Guides\\Shadowlands Enchanting 1-115"},
		{"item", text=[[**Shadowlands Engineering 1-100**]], guide="PROFESSIONS\\Engineering\\Leveling Guides\\Shadowlands Engineering 1-100"},
		{"item", text=[[**Shadowlands Inscription 1-100**]], guide="PROFESSIONS\\Inscription\\Leveling Guides\\Shadowlands Inscription 1-100"},
		{"item", text=[[**Shadowlands Leatherworking 1-100**]], guide="PROFESSIONS\\Leatherworking\\Leveling Guides\\Shadowlands Leatherworking 1-100"},
		{"item", text=[[**Shadowlands Blacksmithing 1-100**]], guide="PROFESSIONS\\Blacksmithing\\Leveling Guides\\Shadowlands Blacksmithing 1-100"},
		{"item", text=[[**Shadowlands Fishing 1-175**]], guide="PROFESSIONS\\Fishing\\Leveling Guides\\Shadowlands Fishing 1-200"},
	}, --columnsend


{"section", text=[[PETSMOUNTS]]},
	{"banner", image=GQ.IMAGESDIR.."ShadowlandsPets",showcaseonly=true},

	{"guideslist", content=[[Battle Pets - Source: Vendor]],filters={patch="90001", source="Vendor"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Drop]],filters={patch="90001", source="Drop"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Battle Pets - Source: Quest]],filters={patch="90001", source="Quest"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	--{"guideslist", content=[[Battle Pets - Source: Achievement]],filters={patch="90001", source="Achievement"},columns=4,path="PETSMOUNTS\\Battle Pets"},

	{"guideslist", content=[[Battle Pets - Source: Discovery]],filters={patch="90001", source="Discovery"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	--[=[
	{"guideslist", content=[[Source: Profession]],filters={patch="90001", source="Profession"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Source: Promotion]],filters={patch="90001", source="Promotion"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Source: Trading Card Game]],filters={patch="90001", source="TradingCardGame"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Source: World Event]],filters={patch="90001", source="WorldEvent"},columns=4,path="PETSMOUNTS\\Battle Pets"}, 
	--]=]

	{"guideslist", content=[[Ground Mounts]],filters={patch="90001", mounttype="Ground"},columns=4,path="PETSMOUNTS\\Mounts"},
	{"guideslist", content=[[Flying Mounts]],filters={patch="90001", mounttype="Flying"},columns=4,path="PETSMOUNTS\\Mounts"},

{"section", text=[[ACHIEVEMENTS]]},
	{"banner", image=GQ.IMAGESDIR.."ShadowlandsAchievements",showcaseonly=true},

	{"guideslist", content=[[Exploration Achievements]],filters={patch="90001"},columns=4,path="ACHIEVEMENTS\\Exploration"},
	{"guideslist", content=[[Quest Achievements]],filters={patch="90001"},columns=4,path="ACHIEVEMENTS\\Quests"},
	{"guideslist", content=[[Dungeon & Raids Achievements]],filters={patch="90001"},columns=4,path="ACHIEVEMENTS\\Dungeons & Raids"},
	{"guideslist", content=[[Expansion Feature Achievements]],filters={patch="90001"},columns=4,path="ACHIEVEMENTS\\Expansion Features"},
	{"guideslist", content=[[Feats of Strength Achievements]],filters={patch="90001"},columns=4,path="ACHIEVEMENTS\\Feats of Strength"},
	{"guideslist", content=[[Pet Battle Achievements]],filters={patch="90001"},columns=4,path="ACHIEVEMENTS\\Pet Battles"},

})



table.insert(GuideMenu.Featured,{
	title="Patch 8.3 - Visions of N'Zoth", group="patch_83",

{"section", text=[[LEVELING]]},
	{"banner", image=GQ.IMAGESDIR.."Patch83Leveling",showcaseonly=true},

	{"content", text=[[Optional: Unlock Allied Races]]},
	{"text", text=[[Mechangnomes for Alliance and Vulperans for Horde are now available to unlock.]]},
	{"columns",
		{"item", text=[[**Mechagnome Race Unlock**]], guide="LEVELING\\Battle for Azeroth (10-60)\\Allied Races\\Mechagnome Race Unlock",faction="A"},
		{"item", text=[[**Vulpera Race Unlock**]], guide="LEVELING\\Battle for Azeroth (10-60)\\Allied Races\\Vulpera Race Unlock", faction="H"},
	}, --columnsend

	{"content", text=[[Optional: Obtain Worgen or Goblin Heritage Armor ]]},
	{"text", text=[[You can now obtain Heritage Armor for Worgen (Alliance only) and Goblins (Horde only).]]},
	{"columns",
		{"item", text=[[**Worgen Heritage Armor**]], guide="LEVELING\\Battle for Azeroth (10-60)\\Heritage Armor\\Worgen Heritage Armor", faction="A"},
		{"item", text=[[**Goblin Heritage Armor**]], guide="LEVELING\\Battle for Azeroth (10-60)\\Heritage Armor\\Goblin Heritage Armor", faction="H"},
	}, --columnsend

	{"content", text=[[Magni's Plan Questline]]},
	{"text", text=[[This is the new main questline for Patch 8.3. Play through the Magni's Plan leveling guide until you unlock the legendary cloak. This will open both assault zones and factions.]]},
	{"list", text=[[Once you complete this you can proceed to the new Dailies content.]]},
	{"columns",
		{"item", text=[[**Magni's Plan**]], guide="LEVELING\\Battle for Azeroth (10-60)\\Heart of Azeroth\\Magni's Plan"},
	}, --columnsend

	{"content", text=[[Horrific Visions]]},
	{"text", text=[[These are 1-5 player Mage Tower inspired challenges. You can enter these solo or with a group when each group member has a Vessel of Horrific Visions. ]]},
	{"list", text=[[You get a Vessel of Horrific Vision each week from the N'Zoth assault and can purchase additional ones for 10,000 Coalescing Visions from Wrathion in the Chamber of Heart.]]},
	{"columns",
		{"item", text=[[**Horrific Vision of Stormwind**]], guide="LEVELING\\Battle for Azeroth (10-60)\\Horrific Vision of Stormwind"},
	}, --columnsend
	
{"section", text=[[DUNGEONS]]},
	{"banner", image=GQ.IMAGESDIR.."Patch83Dungeons",showcaseonly=true},

	{"content", text=[[Raids]]},
	{"text", text=[[These guides will walk you through all 4 wings of the new 12 boss raid.]], guide="Magni's Plan"},
	{"columns",
		{"item", text=[[**Ny'alotha, the Waking City - Vision of Destiny**]], guide="DUNGEONS\\Battle for Azeroth Raids\\Ny'alotha, the Waking City - Vision of Destiny"},
		{"item", text=[[**Ny'alotha, the Waking City - Halls of Devotion**]], guide="DUNGEONS\\Battle for Azeroth Raids\\Ny'alotha, the Waking City - Halls of Devotion"},
		{"item", text=[[**Ny'alotha, the Waking City - Gift of Flesh**]], guide="DUNGEONS\\Battle for Azeroth Raids\\Ny'alotha, the Waking City - Gift of Flesh"},{"item", text=[[**Ny'alotha, the Waking City - The Waking Dream**]], guide="DUNGEONS\\Battle for Azeroth Raids\\Ny'alotha, the Waking City - The Waking Dream"},
	}, --columnsend

{"section", text=[[DAILIES]]},
	{"banner", image=GQ.IMAGESDIR.."Patch83Dailies",showcaseonly=true},

	{"content", text=[[Assaults]]},
	{"text", text=[[One zone will have the Ny'alotha raid entrance in it each week. This zone is the N�Zoth assault zone and it will remain active each week. Do the assault in this zone every Tuesday.]]},
	{"list", text=[[The zone without the raid entrance will alternate every few days with a new assault available. ]]},
	{"columns",
		{"item", text=[[**Uldum Assaults**]], guide="DAILIES\\Battle for Azeroth\\Uldum\\Uldum Assaults"},
		{"item", text=[[**Vale of Eternal Blossoms Assaults**]], guide="DAILIES\\Battle for Azeroth\\Vale of Eternal Blossoms\\Vale of Eternal Blossoms Assaults"},
	}, --columnsend

	{"content", text=[[World Quests]]},
	{"columns",
		{"item", text=[[**Uldum World Quests**]], guide="DAILIES\\Battle for Azeroth\\Uldum World Quests"},
		{"item", text=[[**Vale of Eternal Blossoms World Quests**]], guide="DAILIES\\Battle for Azeroth\\Vale of Eternal Blossoms World Quests"},
	}, --columnsend

	{"content", text=[[Reputations ]]},
	{"columns",
		{"item", text=[[**Rajani**]], guide="REPUTATIONS\\Battle for Azeroth\\Rajani"},
		{"item", text=[[**Uldum Accord**]], guide="REPUTATIONS\\Battle for Azeroth\\Uldum Accord"},
	}, --columnsend
	
{"section", text=[[PETSMOUNTS]]},
	{"guideslist", content=[[Source: Vendor]],filters={patch="83000", source="Vendor"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Source: Drop]],filters={patch="83000", source="Drop"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Source: Quest]],filters={patch="83000", source="Quest"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Source: Achievement]],filters={patch="83000", source="Achievement"},columns=4,path="PETSMOUNTS\\Battle Pets"},

	--[=[
	{"guideslist", content=[[Source: Discovery]],filters={patch="83000", source="Discovery"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Source: Profession]],filters={patch="83000", source="Profession"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Source: Promotion]],filters={patch="83000", source="Promotion"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Source: Trading Card Game]],filters={patch="83000", source="TradingCardGame"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Source: World Event]],filters={patch="83000", source="WorldEvent"},columns=4,path="PETSMOUNTS\\Battle Pets"}, 
	--]=]


	
{"section", text=[[TITLES]]},
	{"content", text=[[Titles]]},
	{"columns",
		{"item", text=[[**The Awakened**]], guide="TITLES\\Battle for Azeroth Titles\\General\\The Awakened"},
		{"item", text=[[**Veteran of the Fourth War**]], guide="TITLES\\Battle for Azeroth Titles\\General\\Veteran of the Fourth War"},
	}, --columnsend

	{"content", text=[[Dungeon / Raid Achievements]]},
	{"columns",
		{"item", text=[[**Mythic: N'Zoth, the Corruptor**]], guide="ACHIEVEMENTS\\Dungeons & Raids\\Battle for Azeroth Raids\\Mythic: N'Zoth, the Corruptor"},
		{"item", text=[[**Battle for Azeroth Keystone Master: Season Four**]], guide="ACHIEVEMENTS\\Feats of Strength\\Dungeons\\Battle for Azeroth Keystone Master: Season Four"},
		{"item", text=[[**Battle for Azeroth Keystone Conqueror: Season Four**]], guide="ACHIEVEMENTS\\Feats of Strength\\Dungeons\\Battle for Azeroth Keystone Conqueror: Season Four"},
	}, --columnsend

	{"content", text=[[Reputation Achievements]]},
	{"columns",
		{"item", text=[[**Allied Races: Mechagnome**]], guide="ACHIEVEMENTS\\Reputations\\Battle for Azeroth\\Allied Races: Mechagnome", faction="A"},
		{"item", text=[[**Heritage of the Mechagnome**]], guide="ACHIEVEMENTS\\Reputations\\Battle for Azeroth\\Heritage of the Mechagnome", faction="A"},
		{"item", text=[[**Allied Races: Vulpera**]], guide="ACHIEVEMENTS\\Reputations\\Battle for Azeroth\\Allied Races: Vulpera", faction="H"},
		{"item", text=[[**Heritage of the Vulpera**]], guide="ACHIEVEMENTS\\Reputations\\Battle for Azeroth\\Heritage of the Vulpera", faction="H"},
	}, --columnsend

	{"content", text=[[Expansion Achievements]]},
	{"columns",
		{"item", text=[[**The Most Horrific Vision of Stormwind**]], guide="ACHIEVEMENTS\\Expansion Features\\Visions of N'Zoth\\The Most Horrific Vision of Stormwind"},
		{"item", text=[[**The Even More Horrific Vision of Stormwind**]], guide="ACHIEVEMENTS\\Expansion Features\\Visions of N'Zoth\\The Even More Horrific Vision of Stormwind"},
		{"item", text=[[**Reeking of Visions**]], guide="ACHIEVEMENTS\\Expansion Features\\Visions of N'Zoth\\Reeking of Visions"},
		{"item", text=[[**Through the Depths of Visions**]], guide="ACHIEVEMENTS\\Expansion Features\\Visions of N'Zoth\\Through the Depths of Visions"},
		{"item", text=[[**We Have the Technology**]], guide="ACHIEVEMENTS\\Expansion Features\\Visions of N'Zoth\\We Have the Technology"},
	}, --columnsend

	{"content", text=[[Pets Battle Achievements]]},
	{"columns",
		{"item", text=[[**Pet Battle Challenge: Blackrock Depths**]], guide="ACHIEVEMENTS\\Pet Battles\\Battle for Azeroth\\Pet Battle Challenge: Blackrock Depths"},
	}, --columnsend

	{"content", text=[[Quest Achievements]]},
	{"columns",
		{"item", text=[[**The Fourth War**]], guide="ACHIEVEMENTS\\Quests\\Battle for Azeroth\\The Fourth War"},
	}, --columnsend
})



table.insert(GuideMenu.Featured,{
	title="Battle for Azeroth", group="patch_80",

{"section", text=[[LEVELING]]},
	{"banner", image=GQ.IMAGESDIR.."BFALeveling",showcaseonly=true},

	{"content", text=[[Unlock Allied Races]]},
	{"text", text=[[If you wish to play as one of the new Allied races, you will need to unlock them first, if you haven't already.]]},
	{"columns",
		{"item", text=[[**Void Elf Race Unlock**]], guide="LEVELING\\Battle for Azeroth (10-60)\\Allied Races\\Void Elf Race Unlock", faction="A"},
		{"item", text=[[**Lightforged Draenei Race Unlock**]], guide="LEVELING\\Battle for Azeroth (10-60)\\Allied Races\\Lightforged Draenei Race Unlock", faction="A"},
		{"item", text=[[**Kul Tiran Race Unlock**]], guide="LEVELING\\Battle for Azeroth (10-60)\\Allied Races\\Kul Tiran Race Unlock", faction="A"},
	}, --columnsend
	{"columns",
		{"item", text=[[**Nightborne Race Unlock**]], guide="LEVELING\\Battle for Azeroth (10-60)\\Allied Races\\Nightborne Race Unlock", faction="H"},
		{"item", text=[[**Highmountain Tauren Race Unlock**]], guide="LEVELING\\Battle for Azeroth (10-60)\\Allied Races\\Highmountain Tauren Race Unlock", faction="H"},
		{"item", text=[[**Mag'har Orc Race Unlock**]], guide="LEVELING\\Battle for Azeroth (10-60)\\Allied Races\\Mag'har Orc Race Unlock", faction="H"},

	}, --columnsend

	{"content", text=[[10-60 Leveling    ]]},
	{"text", text=[[Use the Chromie Time guide and choose the Battle for Azeroth expansion. Before you can begin exploring the continents of Kul Tiras and Zandalar, you'll need to obtain the Heart of Azeroth, a necklace that replaces your artifact weapons. You'll also want to to begin the War Campaign guide in a separate tab. New war campaign quests will unlock as you level your character, so you will be using this guide along with the Leveling guides during the entire leveling process. ]]},
	{"list", text=[[Alternatively, you can level up with our Dungeon Guides. However, you'll miss out on reputation needed to unlock World Quests later.]], folder="DUNGEONS\\Battle for Azeroth Dungeons\\"},
	{"list", text=[[Once you reach level 120 you can start using our End Game guides.]], folder="DAILIES\\Battle for Azeroth\\"},
	{"columns",
		{"item", text=[[**Chromie Time**]], guide="LEVELING\\Starter Guides\\Chromie Time"},

		{"item", text=[[**Tiragarde Sound**]], guide="LEVELING\\Battle for Azeroth (10-60)\\Kul Tiras\\Tiragarde Sound (10-60)", faction="A"},
		{"item", text=[[**Stormsong Valley**]], guide="LEVELING\\Battle for Azeroth (10-60)\\Kul Tiras\\Stormsong Valley (30-60)", faction="A"},
		{"item", text=[[**Drustvar**]], guide="LEVELING\\Battle for Azeroth (10-60)\\Kul Tiras\\Drustvar (20-60)", faction="A"},

		{"item", text=[[**Zuldazar**]], guide="LEVELING\\Battle for Azeroth (10-60)\\Zandalar\\Zuldazar (10-60)", faction="H"},
		{"item", text=[[**Nazmir**]], guide="LEVELING\\Battle for Azeroth (10-60)\\Zandalar\\Nazmir (10-60)", faction="H"},
		{"item", text=[[**Vol'dun**]], guide="LEVELING\\Battle for Azeroth (10-60)\\Zandalar\\Vol'dun (10-60)", faction="H"},

		{"item", text=[[**War Campaign**]], guide="LEVELING\\Battle for Azeroth (10-60)\\War Campaign"},
	}, --columnsend

	
{"section", text=[[DUNGEONS]]},
	{"banner", image=GQ.IMAGESDIR.."BFADungeons",showcaseonly=true},

	{"text", text=[[You can run Dungeons to level up to 120 and get gear. ]]},
	{"list", text=[[Alternatively, you can level up with our Leveling guides.]], folder="LEVELING\\Battle for Azeroth (10-60)"},
	{"list", text=[[You can use the Gear Finder to find the best gear for your character.]]},
	{"list", text=[[Once you reach level 120 you can start using our End Game guides.]]},

	{"content", text=[[Dungeons]]},
	{"columns",
		{"item", text=[[**Freehold**]], guide="DUNGEONS\\Battle for Azeroth Dungeons\\Freehold"},
		{"item", text=[[**Atal'Dazar**]], guide="DUNGEONS\\Battle for Azeroth Dungeons\\Atal'Dazar"},
		{"item", text=[[**Waycrest Manor**]], guide="DUNGEONS\\Battle for Azeroth Dungeons\\Waycrest Manor"},
		{"item", text=[[**Shrine of the Storm**]], guide="DUNGEONS\\Battle for Azeroth Dungeons\\Shrine of the Storm"},
		{"item", text=[[**Siege of Boralus**]], guide="DUNGEONS\\Battle for Azeroth Dungeons\\Siege of Boralus"},
		{"item", text=[[**Temple of Sethraliss**]], guide="DUNGEONS\\Battle for Azeroth Dungeons\\Temple of Sethraliss"},
		{"item", text=[[**The Underrot**]], guide="DUNGEONS\\Battle for Azeroth Dungeons\\The Underrot"},
		{"item", text=[[**Kings' Rest**]], guide="DUNGEONS\\Battle for Azeroth Dungeons\\Kings' Rest"},
		{"item", text=[[**The MOTHERLODE!!**]], guide="DUNGEONS\\Battle for Azeroth Dungeons\\The MOTHERLODE!!"},
	}, --columnsend

	{"content", text=[[Raids]]},
	{"columns",
		{"item", text=[[**Uldir - Crimson Descent**]], guide="DUNGEONS\\Battle for Azeroth Raids\\Uldir - Crimson Descent"},
		{"item", text=[[**Uldir - Halls of Containment**]], guide="DUNGEONS\\Battle for Azeroth Raids\\Uldir - Halls of Containment"},
		{"item", text=[[**Uldir - Heart of Corruption**]], guide="DUNGEONS\\Battle for Azeroth Raids\\Uldir - Heart of Corruption"},
	}, --columnsend

{"section", text=[[DAILIES]]},
	{"banner", image=GQ.IMAGESDIR.."BFADailies",showcaseonly=true},

	{"content", text=[[Unlock World Quests]]},
	{"text", text=[[Once you've reached 120 and unlocked all 3 of the footholds in the War Campaign you'll receive a quest to unlock World Quests. In order to complete this quest you will need to reach "Friendly" status with the 3 new factions in Battle for Azeroth. After reaching Friendly status, you can turn in the quest, which will give you the Flight Master's Whistle and unlock world quests.]]},
	{"list", text=[[This will already be done if you used our Leveling guides.]]},
	{"columns",
		{"item", text=[[**Proudmoore Admiralty**]], guide="REPUTATIONS\\Battle for Azeroth\\Proudmoore Admiralty", faction="A"},
		{"item", text=[[**Order of Embers**]], guide="REPUTATIONS\\Battle for Azeroth\\Order of Embers", faction="A"},
		{"item", text=[[**Storm's Wake**]], guide="REPUTATIONS\\Battle for Azeroth\\Storm's Wake", faction="A"},

		{"item", text=[[**Zandalari Empire**]], guide="REPUTATIONS\\Battle for Azeroth\\Zandalari Empire", faction="H"},
		{"item", text=[[**Talanji's Expedition**]], guide="REPUTATIONS\\Battle for Azeroth\\Talanji's Expedition", faction="H"},
		{"item", text=[[**Voldunai**]], guide="REPUTATIONS\\Battle for Azeroth\\Voldunai", faction="H"},
	}, --columnsend

	{"content", text=[[Complete World Quests]]},
	{"text", text=[[Complete world quests in Kul Tiras and Zandalar to earn gear, gain War Resources, and Artifact Power to improve your Heart of Azeroth necklace.]]},
	{"list", text=[[You can use the World Quest Planner feature to complete World Quests.]]},
	{"columns",
		{"item", text=[[**Arathi Highlands World Quests**]], guide="DAILIES\\Battle for Azeroth\\Arathi Highlands World Quests"},
		{"item", text=[[**Drustvar World Quests**]], guide="DAILIES\\Battle for Azeroth\\Drustvar World Quests"},
		{"item", text=[[**Mechagon Island World Quests**]], guide="DAILIES\\Battle for Azeroth\\Mechagon Island World Quests"},
		{"item", text=[[**Nazmir World Quests**]], guide="DAILIES\\Battle for Azeroth\\Nazmir World Quests"},
		{"item", text=[[**Vale of Eternal Blossoms World Quests**]], guide="DAILIES\\Battle for Azeroth\\Vale of Eternal Blossoms World Quests"},
	}, --columnsend

{"section", text=[[PROFESSIONS]]},
	{"content", text=[[Gathering Professions]]},
	{"columns",
		{"item", text=[[**Kul Tiran Herbalism 1-175**]], guide="PROFESSIONS\\Herbalism\\Leveling Guides\\Kul Tiran Herbalism 1-175", faction="A"},
		{"item", text=[[**Kul Tiran Skinning 1-175**]], guide="PROFESSIONS\\Skinning\\Leveling Guides\\Kul Tiran Skinning 1-175", faction="A"},

		{"item", text=[[**Zandalari Herbalism 1-175**]], guide="PROFESSIONS\\Herbalism\\Leveling Guides\\Zandalari Herbalism 1-175", faction="H"},
		{"item", text=[[**Zandalari Skinning 1-175**]], guide="PROFESSIONS\\Skinning\\Leveling Guides\\Zandalari Skinning 1-175", faction="H"},
	}, --columnsend

	{"content", text=[[Crafting Professions]]},
	{"columns",
		{"item", text=[[**Kul Tiran Alchemy 1-175**]], guide="PROFESSIONS\\Alchemy\\Leveling Guides\\Kul Tiran Alchemy 1-175", faction="A"},
		{"item", text=[[**Kul Tiran Blacksmithing 1-175**]], guide="PROFESSIONS\\Blacksmithing\\Leveling Guides\\Kul Tiran Blacksmithing 1-175", faction="A"},
		{"item", text=[[**Kul Tiran Enchanting 1-175**]], guide="PROFESSIONS\\Enchanting\\Leveling Guides\\Kul Tiran Enchanting 1-175", faction="A"},
		{"item", text=[[**Kul Tiran Engineering 1-175**]], guide="PROFESSIONS\\Engineering\\Leveling Guides\\Kul Tiran Engineering 1-175", faction="A"},
		{"item", text=[[**Kul Tiran Inscription 1-175**]], guide="PROFESSIONS\\Inscription\\Leveling Guides\\Kul Tiran Inscription 1-175", faction="A"},
		{"item", text=[[**Kul Tiran Jewelcrafting 1-175**]], guide="PROFESSIONS\\Jewelcrafting\\Leveling Guides\\Kul Tiran Jewelcrafting 1-175", faction="A"},
		{"item", text=[[**Kul Tiran Leatherworking 1-175**]], guide="PROFESSIONS\\Leatherworking\\Leveling Guides\\Kul Tiran Leatherworking 1-175", faction="A"},
		{"item", text=[[**Kul Tiran Tailoring 1-175**]], guide="PROFESSIONS\\Tailoring\\Leveling Guides\\Kul Tiran Tailoring 1-175", faction="A"},

		{"item", text=[[**Zandalari Alchemy 1-175**]], guide="PROFESSIONS\\Alchemy\\Leveling Guides\\Zandalari Alchemy 1-175", faction="H"},
		{"item", text=[[**Zandalari Blacksmithing 1-175**]], guide="PROFESSIONS\\Blacksmithing\\Leveling Guides\\Zandalari Blacksmithing 1-175", faction="H"},
		{"item", text=[[**Zandalari Enchanting 1-175**]], guide="PROFESSIONS\\Enchanting\\Leveling Guides\\Zandalari Enchanting 1-175", faction="H"},
		{"item", text=[[**Zandalari Engineering 1-175**]], guide="PROFESSIONS\\Engineering\\Leveling Guides\\Zandalari Engineering 1-175", faction="H"},
		{"item", text=[[**Zandalari Inscription 1-175**]], guide="PROFESSIONS\\Inscription\\Leveling Guides\\Zandalari Inscription 1-175", faction="H"},
		{"item", text=[[**Zandalari Jewelcrafting 1-175**]], guide="PROFESSIONS\\Jewelcrafting\\Leveling Guides\\Zandalari Jewelcrafting 1-175", faction="H"},
		{"item", text=[[**Zandalari Leatherworking 1-175**]], guide="PROFESSIONS\\Leatherworking\\Leveling Guides\\Zandalari Leatherworking 1-175", faction="H"},
		{"item", text=[[**Zandalari Tailoring 1-175**]], guide="PROFESSIONS\\Tailoring\\Leveling Guides\\Zandalari Tailoring 1-175", faction="H"},
	}, --columnsend

	{"content", text=[[Secondary Professions]]},
	{"columns",
		{"item", text=[[**Kul Tiran Cooking 1-175**]], guide="PROFESSIONS\\Cooking\\Leveling Guides\\Kul Tiran Cooking 1-175", faction="A"},
		{"item", text=[[**Kul Tiran Fishing 1-175**]], guide="PROFESSIONS\\Fishing\\Leveling Guides\\Kul Tiran Fishing 1-175", faction="A"},

		{"item", text=[[**Zandalari Cooking 1-175**]], guide="PROFESSIONS\\Cooking\\Leveling Guides\\Zandalari Cooking 1-175", faction="H"},
		{"item", text=[[**Zandalari Fishing 1-175**]], guide="PROFESSIONS\\Fishing\\Leveling Guides\\Zandalari Fishing 1-175", faction="H"},
	}, --columnsend
	
	{"content", text=[[Profession Questlines]]},
	{"columns",
		{"item", text=[[**Kul Tiran Herbalism Quest Line**]], guide="PROFESSIONS\\Herbalism\\Quest Guides\\Kul Tiran Herbalism Quest Line", faction="A"},
		{"item", text=[[**Kul Tiran Skinning Quest Guide**]], guide="PROFESSIONS\\Skinning\\Quest Guides\\Kul Tiran Skinning Quest Guide", faction="A"},

		{"item", text=[[**Zandalari Herbalism Quest Line**]], guide="PROFESSIONS\\Herbalism\\Quest Guides\\Zandalari Herbalism Quest Line", faction="H"},
		{"item", text=[[**Zandalari Skinning Quest Guide**]], guide="PROFESSIONS\\Skinning\\Quest Guides\\Zandalari Skinning Quest Guide", faction="H"},
	}, --columnsend


{"section", text=[[PETSMOUNTS]]},
	{"guideslist", content=[[Source: Pet Battle]],filters={patch="80100", source="PetBattle"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Source: Vendor]],filters={patch="80100", source="Vendor"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Source: Drop]],filters={patch="80100", source="Drop"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Source: Quest]],filters={patch="80100", source="Quest"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Source: Achievement]],filters={patch="80100", source="Achievement"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Source: Profession]],filters={patch="80100", source="Profession"},columns=4,path="PETSMOUNTS\\Battle Pets"},
	{"guideslist", content=[[Source: Promotion]],filters={patch="80100", source="Promotion"},columns=4,path="PETSMOUNTS\\Battle Pets"},
})
