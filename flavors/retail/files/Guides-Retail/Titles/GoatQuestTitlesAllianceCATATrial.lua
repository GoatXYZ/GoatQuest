local GoatQuest=GoatQuest
if not GoatQuest then return end
if UnitFactionGroup("player")~="Alliance" then return end
if GQ:DoMutex("TitlesA") then return end
GoatQuest.GuideMenuTier = "TRI"
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Burning Crusade Titles\\Player versus Player\\Brutal Gladiator")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Burning Crusade Titles\\Player versus Player\\Deadly Gladiator")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Burning Crusade Titles\\Player versus Player\\Justicar")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Burning Crusade Titles\\Player versus Player\\Merciless Gladiator")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Burning Crusade Titles\\Player versus Player\\Vengeful Gladiator")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Burning Crusade Titles\\Player versus Player\\Furious Gladiator")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Burning Crusade Titles\\Player versus Player\\Relentless Gladiator")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Burning Crusade Titles\\Player versus Player\\Wrathful Gladiator")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Burning Crusade Titles\\Dungeons & Raids\\Champion of the Naaru")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Burning Crusade Titles\\Dungeons & Raids\\Hand of A'dal")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Burning Crusade Titles\\Reputations\\Of the Shattered Sun")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Dungeons & Raids\\The Argent Defender")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Dungeons & Raids\\Grand Crusader")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Dungeons & Raids\\The Astral Walker")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Dungeons & Raids\\Bane of the Fallen King")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Dungeons & Raids\\The Celestial Defender")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Dungeons & Raids\\Champion of the Frozen Wastes")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Dungeons & Raids\\Champion of Ulduar")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Dungeons & Raids\\Conqueror of Naxxramas")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Dungeons & Raids\\Conqueror of Ulduar")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Dungeons & Raids\\Death's Demise")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Dungeons & Raids\\Herald of the Titans")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Dungeons & Raids\\The Immortal")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Dungeons & Raids\\The Kingslayer")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Dungeons & Raids\\The Light of Dawn")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Dungeons & Raids\\The Magic Seeker")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Dungeons & Raids\\Obsidian Slayer")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Dungeons & Raids\\Of the Nightfall")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Dungeons & Raids\\The Patient")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Dungeons & Raids\\Starcaller")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Dungeons & Raids\\The Undying")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Dungeons & Raids\\Twilight Vanquisher")
GoatQuest:RegisterGuide("Title Guides\\Wrath of the Lich King Titles\\General\\The Explorer",{
description="This guide section will walk you through completing the Explorer achievement.",
playertitle=47,
},[[
leechsteps "Achievement Guides\\Exploration\\Eastern Kingdoms\\Eastern Kingdoms and Cataclysm Explorer"
leechsteps "Achievement Guides\\Exploration\\Kalimdor\\Kalimdor and Cataclysm Explorer"
leechsteps "Achievement Guides\\Exploration\\Northrend\\Northrend Explorer"
leechsteps "Achievement Guides\\Exploration\\Outland\\Outland Explorer"
#include "Explorer_Pandaria"
leechsteps "Achievement Guides\\Exploration\\Draenor\\Draenor Explorer"
leechsteps "Achievement Guides\\Exploration\\Legion\\Broken Isles Explorer"
]])
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Player versus Player\\Of the Alliance")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Player versus Player\\Arena Master")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Player versus Player\\Battlemaster")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Player versus Player\\The Flawless Victor")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Player versus Player\\Vanquisher")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Professions\\Cooking\\Chef\\Achievements")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Professions\\Cooking\\Chef\\Dailies")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Professions\\Fishing\\Salty")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Quests\\Loremaster")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Quests\\The Seeker")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Reputations\\Argent Champion\\Argent Crusade Reputation")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Reputations\\Argent Champion\\Argent Dawn Reputation")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Reputations\\Crusader\\Argent Tournament Grounds Aspirant Rank Dailies")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Reputations\\Crusader\\Argent Tournament Grounds Valiant Rank Dailies")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Reputations\\Crusader\\Draenei Champion Rank")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Reputations\\Crusader\\Dwarf Champion Rank")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Reputations\\Crusader\\Gnome Champion Rank")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Reputations\\Crusader\\Human Champion Rank")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Reputations\\Crusader\\Night Elf Champion Rank")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Reputations\\The Diplomat\\Kurenai Faction")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Reputations\\The Diplomat\\Sporeggar Faction")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Reputations\\The Diplomat\\Timbermaw Hold Faction")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Reputations\\Guardian of Cenarius\\Cenarion Circle Faction")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Reputations\\Guardian of Cenarius\\Cenarion Expedition Faction")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Reputations\\The Insane\\Bloodsail Buccaneers Group")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Reputations\\The Insane\\Bloodsail Buccaneers Solo")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Reputations\\The Insane\\Darkmoon Faire")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Reputations\\The Insane\\Ravenholdt")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Reputations\\The Insane\\The Steamwheedle Cartel")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Reputations\\Ambassador")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Reputations\\Of the Ashen Verdict")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Reputations\\Bloodsail Admiral")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\Reputations\\The Exalted")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\World Events\\Brewmaster")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\World Events\\Elder\\Lunar Festival Achievements")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\World Events\\Elder\\Lunar Festival Main Questline")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\World Events\\Elder\\Lunar Festival Optimized Elders Path")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\World Events\\Flame Warden\\Midsummer Fire Festival Achievements")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\World Events\\Flame Warden\\Midsummer Fire Festival Quests")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\World Events\\The Hallowed")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\World Events\\The Love Fool")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\World Events\\Matron/Patron\\Children's Week Achievements")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\World Events\\Matron/Patron\\Children's Week Dalaran Oracles Quests")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\World Events\\Matron/Patron\\Children's Week Dalaran Wolvar Quests")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\World Events\\Matron/Patron\\Children's Week Shattrath Quests")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\World Events\\Matron/Patron\\Children's Week Stormwind Quests")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\World Events\\Merrymaker\\Feast of Winter Veil Achievements")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\World Events\\Merrymaker\\Feast of Winter Veil Quests")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Wrath of the Lich King Titles\\World Events\\The Noble")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Cataclysm Titles\\Dungeons & Raids\\Blackwing's Bane")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Cataclysm Titles\\Dungeons & Raids\\Defender of a Shattered World")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Cataclysm Titles\\Dungeons & Raids\\Destroyer's End")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Cataclysm Titles\\Dungeons & Raids\\Dragonslayer")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Cataclysm Titles\\Dungeons & Raids\\Firelord")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Cataclysm Titles\\Dungeons & Raids\\Of the Four Winds")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Cataclysm Titles\\Dungeons & Raids\\Savior of Azeroth")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Cataclysm Titles\\General\\The Camel-Hoarder")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Cataclysm Titles\\Player versus Player\\The Bloodthirsty")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Cataclysm Titles\\Player versus Player\\Cataclysmic Gladiator")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Cataclysm Titles\\Player versus Player\\Commander")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Cataclysm Titles\\Player versus Player\\Corporal")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Cataclysm Titles\\Player versus Player\\Field Marshal")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Cataclysm Titles\\Player versus Player\\Grand Marshal")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Cataclysm Titles\\Player versus Player\\Hero of the Alliance")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Cataclysm Titles\\Player versus Player\\Knight")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Cataclysm Titles\\Player versus Player\\Knight-Captain")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Cataclysm Titles\\Player versus Player\\Knight-Champion")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Cataclysm Titles\\Player versus Player\\Knight-Lieutenant")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Cataclysm Titles\\Player versus Player\\Lieutenant Commander")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Cataclysm Titles\\Player versus Player\\Marshal")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Cataclysm Titles\\Player versus Player\\Master Sergeant")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Cataclysm Titles\\Player versus Player\\Private")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Cataclysm Titles\\Player versus Player\\Ruthless Gladiator")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Cataclysm Titles\\Player versus Player\\Sergeant")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Cataclysm Titles\\Player versus Player\\Sergeant Major")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Cataclysm Titles\\Player versus Player\\Veteran of the Alliance")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Cataclysm Titles\\Player versus Player\\Vicious Gladiator")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Cataclysm Titles\\Player versus Player\\Warbound")
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Cataclysm Titles\\Professions\\Archaeology\\Assistant Professor, Associate Professor, and Professor")
GoatQuest:RegisterGuide("Title Guides\\Cataclysm Titles\\Quests\\The Flamebreaker",{
playertitle=189,
},[[
step
This title is earned by completing the _Veteran of the Molten Front_ achievement.
confirm
step
#include "A_Firelands_PreQuests"
step
Now that you have access to the Firelands Dailies, please use the GoatQuest Achievement Guides to help obtain this title.
achieve 5879
step
Congratulations! You have earned the title "The Flamebreaker"!
]])
GoatQuest:RegisterGuidePlaceholder("Title Guides\\Cataclysm Titles\\Reputations\\Avenger of Hyjal")
