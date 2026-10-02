local name,GQ = ...

local ItemScore = {}
GQ.ItemScore = ItemScore
local L = GQ.L

-- Stat keywords:
-- Only stats defined in this table are valid. Use entry in blizz when filling rule sets

ItemScore.Keywords = {
	{blizz="AGILITY", gqdisplay="Agility",pawn="Agility", pattern="ITEM_MOD_AGILITY"},
	{blizz="ARMOR", gqdisplay="Armor",pawn="Armor", pattern="ARMOR_TEMPLATE"}, -- base armor on gear
	{blizz="AVOIDANCE", gqdisplay="Avoidance", pawn="Avoidance", regexname=STAT_AVOIDANCE},
	{blizz="CRIT", gqdisplay="Crit",pawn="CritRating", pattern="ITEM_MOD_CRIT_RATING"},
	{blizz="DAMAGE_PER_SECOND", gqdisplay="Damage Per Second",pawn="Dps", pattern="DPS_TEMPLATE"},
	{blizz="EMPTY_SOCKET_DOMINATION", gqdisplay="Domination Socket", pawn="DominationSocket", regexname=EMPTY_SOCKET_DOMINATION},
	{blizz="HASTE", gqdisplay="Haste", pawn="HasteRating", regexname=STAT_HASTE},
	{blizz="STURDINESS", gqdisplay="Indestructible", pawn="Indestructible", regexname=STAT_STURDINESS, boolean=true},
	{blizz="INTELLECT", gqdisplay="Intellect", pawn="Intellect",pattern="ITEM_MOD_INTELLECT"},
	{blizz="LIFESTEAL", gqdisplay="Leech", pawn="Leech", regexname=STAT_LIFESTEAL},
	{blizz="MASTERY", gqdisplay="Mastery", pawn="MasteryRating", pattern="ITEM_MOD_MASTERY_RATING"},
	{blizz="SPEED", gqdisplay="Movement Speed", pawn="MovementSpeed", regexname=STAT_SPEED, skipregex2=true},
	{blizz="RESILIENCE", gqdisplay="Resilience", pawn="ResilienceRating", pattern="ITEM_MOD_RESILIENCE_RATING"},
	{blizz="STAMINA", gqdisplay="Stamina", pawn="Stamina", pattern="ITEM_MOD_STAMINA"},
	{blizz="STRENGTH", gqdisplay="Strength", pawn="Strength",pattern="ITEM_MOD_STRENGTH"},
	{blizz="VERSATILITY", gqdisplay="Versatility", pawn="Versatility", regexname=STAT_VERSATILITY},
}

for i,v in pairs(ItemScore.Keywords) do -- convert blizzard templates to lua regex match
	local regex,regex2
	v.regexs = {}

	-- try to use defined patterns
	if v.pattern or v.regex then
		regex = v.regex or _G[v.pattern]
		regex = regex:gsub("1%$",""):gsub("2%$",""):gsub("3%$",""):gsub("4%$","")
		regex = regex:gsub("%(","%%("):gsub("%)","%%)"):gsub("%%d","([0-9]+)"):gsub("%%c","([+-]+)"):gsub("%%s","([0-9.,]+)"):gsub("%%([0-9]+)%$","%%").."$"
		regex = regex:lower()

		local short = v.pattern and _G[v.pattern.."_SHORT"]
		if short then 
			if locale=="koKR" or locale=="zhCN" or locale=="zhTW" then
				regex2 = "^"..short.." ([+-]+)([0-9.,]+)".."$"
			else
				regex2 = "^".."([+-]+)([0-9.,]+) "..short.."$"
			end
			regex2 = regex2:lower()
		end
		
		
		if regex==regex2 then regex2=nil end
		table.insert(v.regexs,regex)
		table.insert(v.regexs,regex2)
	end

	if v.regexname then
		local regex = ("^([+-]*)([0-9,.]+) " .. v.regexname .. "$"):lower()
		local regex2 = ("^" .. v.regexname .. " ([0-9.,]+)" .. "$"):lower()

		if v.boolean then
			regex = "^"..v.regexname:lower().."$"
			regex2 = v.regexname
		end
		if not v.skipregex1 then table.insert(v.regexs,regex) end
		if not v.skipregex2 then table.insert(v.regexs,regex2) end
	end

	-- try to pull from localisation files
	local pattern = L[v.blizz]
	if pattern ~= v.blizz then table.insert(v.regexs,pattern:lower()) end
	for i=2,10 do
		local pattern = L[v.blizz..i]
		if pattern ~= v.blizz..i then table.insert(v.regexs,pattern:lower()) end
	end
end

ItemScore.KnownKeyWords = {}
for i,v in pairs(ItemScore.Keywords) do -- create lookup table for use in popups, since GetItemStats/Delta fails on suffix items, and we need to use our cached data instead
	ItemScore.KnownKeyWords[v.blizz] = v.gqdisplay
end

-- Gear keywords:
-- Only gear defined in this table are valid. Use second entry when filling item sets

ItemScore.Gear_PawnToGoatQuest = {
	IsCloth="CLOTH",
	IsLeather="LEATHER",
	IsMail="MAIL",
	IsPlate="PLATE",
	IsShield="SHIELD",
	IsAxe="AXE",
	Is2HAxe="TH_AXE",
	IsBow="BOW",
	IsCrossbow="CROSSBOW",
	IsDagger="DAGGER",
	IsFist="FIST",
	IsGun="GUN",
	IsMace="MACE",
	Is2HMace="TH_MACE",
	IsPolearm="TH_POLE",
	IsStaff="TH_STAFF",
	IsSword="SWORD",
	Is2HSword="TH_SWORD",
	IsWand="WAND",
	IsOffHand="OFFHAND",
	IsFrill="MISCARM",
	IsWarglaive="WARGLAIVE",
}

ItemScore.FixedLevelHeirloom = {
	-- Garrosh weapons
	[104399]=100, [104400]=100, [104403]=100, [104405]=100, [104406]=100, [104407]=100, [104408]=100, 
	[104409]=100, [105670]=100, [105673]=100, [105674]=100, [105676]=100, [105677]=100, [105679]=100, 
	[105680]=100, [105683]=100, [105684]=100, [105685]=100, [105686]=100, [105687]=100, [105688]=100,
	[105689]=100, [105690]=100, [105691]=100, [105692]=100, [105693]=100, 
	-- 6.2 trinkets
	[126948]=100, [126949]=100, [128318]=100,
	-- 6.2.3 mythic dungeon trinkets
	[133585]=110, [133595]=110, [133596]=110, [133597]=110, [133598]=110,
	}

ItemScore.HeirloomBonuses = { -- Max level depends on bonus
	[582] = 90,
	[583] = 100,
	[3592] = 110,
	[3615] = 110,
	[3616] = 110,
	[3617] = 110,
	[5805] = 120,
	[5806] = 120,
	[5807] = 120,
	[5808] = 120,
	}
setmetatable(ItemScore.HeirloomBonuses,{__index=function(t,index) return 60 end}) 

ItemScore.ProtectedGear = {
	-- yes, this GQ.IsLegionRemix is a function call
	[128831] = GQ.IsLegionRemix, -- Aldrachi Warblades
	[128832] = GQ.IsLegionRemix, -- Aldrachi Warblades
	[127857] = GQ.IsLegionRemix, -- Aluneth
	[128403] = GQ.IsLegionRemix, -- Apocalypse
	[120978] = GQ.IsLegionRemix, -- Ashbringer
	[128292] = GQ.IsLegionRemix, -- Blades of the Fallen Prince
	[128293] = GQ.IsLegionRemix, -- Blades of the Fallen Prince
	[128821] = GQ.IsLegionRemix, -- Claws of Ursoc
	[128822] = GQ.IsLegionRemix, -- Claws of Ursoc
	[136858] = GQ.IsLegionRemix, -- Darkened T'uure
	[128819] = GQ.IsLegionRemix, -- Doomhammer
	[128862] = GQ.IsLegionRemix, -- Ebonchill
	[128860] = GQ.IsLegionRemix, -- Fangs of Ashamane
	[128859] = GQ.IsLegionRemix, -- Fangs of Ashamane
	[128476] = GQ.IsLegionRemix, -- Fangs of the Devourer
	[128479] = GQ.IsLegionRemix, -- Fangs of the Devourer
	[128820] = GQ.IsLegionRemix, -- Felo'melorn
	[128940] = GQ.IsLegionRemix, -- Fists of the Heavens
	[133948] = GQ.IsLegionRemix, -- Fists of the Heavens
	[128938] = GQ.IsLegionRemix, -- Fu Zan, the Wanderer's Companion
	[128873] = GQ.IsLegionRemix, -- Fury of the Stonemother
	[128306] = GQ.IsLegionRemix, -- G'Hanir, the Mother Tree
	[128868] = GQ.IsLegionRemix, -- Light's Wrath
	[128402] = GQ.IsLegionRemix, -- Maw of the Damned
	[128867] = GQ.IsLegionRemix, -- Oathseeker
	[128288] = GQ.IsLegionRemix, -- Scaleshard
	[128941] = GQ.IsLegionRemix, -- Scepter of Sargeras
	[128858] = GQ.IsLegionRemix, -- Scythe of Elune
	[128911] = GQ.IsLegionRemix, -- Sharas'dal, Scepter of Tides
	[128937] = GQ.IsLegionRemix, -- Sheilun, Staff of the Mists
	[137246] = GQ.IsLegionRemix, -- Spine of Thal'kiel
	[128910] = GQ.IsLegionRemix, -- Strom'kar, the Warbreaker
	[128825] = GQ.IsLegionRemix, -- T'uure, Beacon of the Naaru
	[128808] = GQ.IsLegionRemix, -- Talonclaw
	[128826] = GQ.IsLegionRemix, -- Thas'dorah, Legacy of the Windrunners
	[128872] = GQ.IsLegionRemix, -- The Dreadblades
	[134552] = GQ.IsLegionRemix, -- The Dreadblades
	[129899] = GQ.IsLegionRemix, -- The Eagle Spear
	[128935] = GQ.IsLegionRemix, -- The Fist of Ra-den
	[128870] = GQ.IsLegionRemix, -- The Kingslayers
	[128869] = GQ.IsLegionRemix, -- The Kingslayers
	[128823] = GQ.IsLegionRemix, -- The Silver Hand
	[139621] = GQ.IsLegionRemix, -- The Watcher's Hammer
	[128861] = GQ.IsLegionRemix, -- Titanstrike
	[127829] = GQ.IsLegionRemix, -- Twinblades of the Deceiver
	[127830] = GQ.IsLegionRemix, -- Twinblades of the Deceiver
	[128942] = GQ.IsLegionRemix, -- Ulthalesh, the Deadwind Harvester
	[128908] = GQ.IsLegionRemix, -- Warswords of the Valarjar
	[134553] = GQ.IsLegionRemix, -- Warswords of the Valarjar
	[128827] = GQ.IsLegionRemix, -- Xal'atath, Blade of the Black Empire

	[158075] = function() return ItemScore.playerlevel<=50 end, -- heart of azeroth during bfa leveling
}

ItemScore.Unique_Equipped_Families = { -- those items are unique equipped, but do not return GetItemUniqueness values
	 -- wod rings
	[10001] = {[124636]=1,[124635]=1,[124638]=1,[124634]=1,[124637]=1},

	-- Legion legendary non-weapons gear
	[357] = {[132369]=2,[132378]=2,[132410]=2,[132449]=2,[132452]=2,[132460]=2,[133973]=2,[133974]=2,[137037]=2,[137038]=2,[137039]=2,[137040]=2,[137041]=2,[137042]=2,[137043]=2,[137044]=2,[137045]=2,[137046]=2,[137047]=2,[137048]=2,[137049]=2,[137050]=2,[137051]=2,[137052]=2,[137054]=2,[137055]=2,[137220]=2,[137223]=2,[137276]=2,[137382]=2,[138854]=2,[144249]=2, [144258]=2, [144259]=2, [150936]=2,[151636]=2,[151639]=2,[151640]=2,[151641]=2,[151642]=2,[151643]=2,[151644]=2,[151646]=2,[151647]=2,[151649]=2,[151650]=2,[152626]=2}, 

	-- ghost pirate ring heirlooms
	[10002] = {[128169]=1,[128172]=1,[128173]=1},
	}

-- what stats are available on gems depending on source expansion
ItemScore.GemStatsByExp = {
	[1] = {"STRENGTH", "INTELLECT", "AGILITY", "STAMINA", "HASTE", "VERSATILITY", "MASTERY", "CRIT", "PARRY", "DODGE"}, -- tbc
	[2] = {"STRENGTH", "INTELLECT", "AGILITY", "STAMINA", "HASTE", "VERSATILITY", "MASTERY", "CRIT", "PARRY", "DODGE"}, -- wotlk
	[3] = {"STRENGTH", "INTELLECT", "AGILITY", "STAMINA", "HASTE", "VERSATILITY", "MASTERY", "CRIT", "PARRY", "DODGE"}, -- cata
	[4] = {"STRENGTH", "INTELLECT", "AGILITY", "STAMINA", "HASTE", "VERSATILITY", "MASTERY", "CRIT", "PARRY", "DODGE"}, -- mop
	[5] = {"MASTERY", "VERSATILITY", "HASTE", "CRIT"}, -- wod
	[6] = {"MASTERY", "VERSATILITY", "HASTE", "CRIT"}, -- legion
	[7] = {"MASTERY", "VERSATILITY", "HASTE", "CRIT"}, -- bfa
}

-- details about gems based on expansions and rarity. ilvl of socketed item required for gem to fit it, and how point budget changes with player level
ItemScore.GemData = { -- from level [a] gem gives b points
	[2] = { -- uncommon
		[1] = { ilvl=1,   points={[1]=3, [59]=4}}, -- tbc
		[2] = { ilvl=70,  points={[1]=3, [59]=4}}, -- wotlk
		[3] = { ilvl=102, points={[1]=3, [59]=4, [81]=5}}, -- cata
		[4] = { ilvl=114, points={[1]=3, [59]=4, [81]=5}}, -- mop
		[5] = { ilvl=80,  points={[1]=3, [59]=4, [81]=5, [91]=6}}, -- wod
		[6] = { ilvl=81,  points={[1]=3, [59]=4, [81]=5, [91]=6, [101]=7}}, -- legion
		[7] = { ilvl=100, points={[1]=3, [59]=4, [81]=5, [91]=6, [101]=7, [111]=30}}, -- bfa
	},
	[3] = { -- rare
		[1] = { ilvl=1,   points={[1]=4, [59]=5}}, -- tbc
		[2] = { ilvl=80,  points={[1]=4, [59]=5}}, -- wotlk
		[3] = { ilvl=102, points={[1]=4, [59]=5, [81]=6}}, -- cata
		[4] = { ilvl=114, points={[1]=4, [59]=5, [81]=6}}, -- mop
		[5] = { ilvl=80,  points={[1]=4, [59]=5, [81]=6, [91]=7}}, -- wod
		[6] = { ilvl=81,  points={[1]=4, [59]=5, [81]=6, [91]=7, [101]=9}}, -- legion
		[7] = { ilvl=100, points={[1]=4, [59]=5, [81]=6, [91]=7, [101]=9, [111]=40}}, -- bfa
	},
	[4] = { -- epic
		[1] = { ilvl=1,   points={[1]=5, [59]=6}}, -- tbc
		[2] = { ilvl=80,  points={[1]=5, [59]=6}}, -- wotlk
		[3] = { ilvl=102, points={[1]=5, [59]=6, [81]=7}}, -- cata
		-- no boe epics for pandas
		[5] = { ilvl=80,  points={[1]=5, [59]=6, [81]=7, [91]=8}}, -- wod
		[6] = { ilvl=81,  points={[1]=5, [59]=6, [81]=7, [91]=8, [101]=11}}, -- legion
		-- no boe epics for bfa
	}
}

ItemScore.Item_Weapon_Types = {
	[0] = "AXE",
	[1] = "TH_AXE",
	[2] = "BOW",
	[3] = "GUN",
	[4] = "MACE",
	[5] = "TH_MACE",
	[6] = "TH_POLE",
	[7] = "SWORD",
	[8] = "TH_SWORD",
	[9] = "WARGLAIVE",
	[10] = "TH_STAFF",
	[11] = "DRUID_BEAR",
	[12] = "DRUID_CAT",
	[13] = "FIST",
	[14] = "MISCWEAP",
	[15] = "DAGGER",
	[16] = "THROWN",
	[17] = "SPEAR",
	[18] = "CROSSBOW",
	[19] = "WAND",
	[20] = "FISHPOLE",
	}

ItemScore.Item_Armor_Types = {
	[0] = "JEWELERY", -- necklace, rings and trinkets, also some cosmetic armor
	[1] = "CLOTH",
	[2] = "LEATHER",
	[3] = "MAIL",
	[4] = "PLATE",
	[5] = "COSMETIC",
	[6] = "SHIELD",
	[7] = "LIBRAM",
	[8] = "IDOL",
	[9] = "TOTEM",
	[10] = "SIGIL",
	[11] = "RELIC",
	[12] = "MISCARM",
	}

ItemScore.MythicPlusMods = {
	-- level, prefix, item level
	 [2]=12834, -- 295 champ 2
	 [3]=12834, -- 295 champ 2
	 [4]=12835, -- 298 champ 3
	 [5]=12836, -- 302 champ 4
	 [6]=12841, -- 305 hero 1
	 [7]=12841, -- 305 hero 1
	 [8]=12842, -- 308 hero 2
	 [9]=12842, -- 308 hero 2
	[10]=12843, -- 311 hero 3
	[11]=12843, -- 311 hero 3
	[12]=12843, -- 311 hero 3
}

ItemScore.TypeToSlot = {
	INVTYPE_WEAPON = INVSLOT_MAINHAND, -- dual wield handled in GetValidSlots
	INVTYPE_WEAPONMAINHAND = INVSLOT_MAINHAND,
	INVTYPE_2HWEAPON = INVSLOT_MAINHAND, -- titan fury hanndled in GetValidSlots
	INVTYPE_WEAPONOFFHAND = INVSLOT_OFFHAND,
	INVTYPE_SHIELD = INVSLOT_OFFHAND,
	INVTYPE_RANGED = INVSLOT_MAINHAND,
	INVTYPE_RANGEDRIGHT = INVSLOT_MAINHAND,
	INVTYPE_HOLDABLE = INVSLOT_OFFHAND,
	INVTYPE_HEAD = INVSLOT_HEAD,
	INVTYPE_NECK = INVSLOT_NECK,
	INVTYPE_SHOULDER = INVSLOT_SHOULDER,
	INVTYPE_CLOAK = INVSLOT_BACK,
	INVTYPE_CHEST = INVSLOT_CHEST,
	INVTYPE_ROBE = INVSLOT_CHEST,
	INVTYPE_WRIST = INVSLOT_WRIST,
	INVTYPE_HAND = INVSLOT_HAND,
	INVTYPE_WAIST = INVSLOT_WAIST,
	INVTYPE_LEGS = INVSLOT_LEGS,
	INVTYPE_FEET = INVSLOT_FEET,
	INVTYPE_FINGER = INVSLOT_FINGER1, -- second slot handled in GetValidSlots
	INVTYPE_TRINKET = INVSLOT_TRINKET1, -- second slot handled in GetValidSlots
}

ItemScore.KeywordsPawnToRules = {} for i,v in pairs(ItemScore.Keywords) do ItemScore.KeywordsPawnToRules[v.pawn]=v.blizz end
ItemScore.KeywordsGoatQuestToPawn = {} for i,v in pairs(ItemScore.Keywords) do ItemScore.KeywordsGoatQuestToPawn[v.blizz]=v.pawn end
ItemScore.Gear_GoatQuestToPawn = {} for i,v in pairs(ItemScore.Gear_PawnToGoatQuest) do ItemScore.Gear_GoatQuestToPawn[v]=i end