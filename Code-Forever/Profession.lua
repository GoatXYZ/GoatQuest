-- GLOBAL debug,GoatQuest
if debug then
	GoatQuest={startups={}}
	GoatQuest_L=function() end
	GetLocale=function() return "enUS" end
	tinsert=table.insert
	ERR_LEARN_RECIPE_S = "Learn %s"
	hooksecurefunc=function() end
end

local name,GQ = ...


GQ.Professions = {}
local GQP = GQ.Professions

local faction=UnitFactionGroup("player")  --maybe?

GQP.tradeskills = {
	[129] = {name="First Aid",crafting=true, skill=129, icon=135966},
	[171] = {name="Alchemy",crafting=true, skill=171, icon=136240},
	[164] = {name="Blacksmithing",crafting=true, skill=164, icon=136241},
	[333] = {name="Enchanting",crafting=true, skill=333, icon=136244},
	[202] = {name="Engineering",crafting=true, skill=202, icon=136243},
	[165] = {name="Leatherworking",crafting=true, skill=165, icon=133611},
	[197] = {name="Tailoring",crafting=true, skill=197, icon=136249},
	[182] = {name="Herbalism", skill=182, icon=136065},
	[186] = {name="Mining",crafting=true, skill=186, icon=136248},
	[393] = {name="Skinning", skill=393, icon=134366},
	[185] = {name="Cooking",crafting=true, skill=185, icon=133971},
	[356] = {name="Fishing", skill=356, icon=136245},
	[762] = {name="Riding", skill=762, icon=136103},
	[633] = {name="Lockpicking", skill=633, icon=136058},
}


for id,data in pairs(GQP.tradeskills) do
	data.subs = { [id] = {name=data.name, skill=id} }
end

GQP.skillLocale = {
	[129]={deDE="Erste Hilfe",	esES="Primeros auxilios",frFR="Secourisme",	ptBR="Primeiros Socorros",ruRU="Первая помощь",	koKR="응급치료",	zhCN="急救",	zhTW="急救",	esMX="Primeros auxilios"},
	[164]={deDE="Schmiedekunst",	esES="Herrería",	frFR="Forge",		ptBR="Ferraria",	ruRU="Кузнечное дело",	koKR="대장기술",	zhCN="锻造",	zhTW="锻造",	esMX="Herrería"},
	[165]={deDE="Lederverarbeitung",esES="Peletería",	frFR="Travail du cuir",	ptBR="Couraria",	ruRU="Кожевничество",	koKR="가죽 세공",	zhCN="制皮",	zhTW="制皮",	esMX="Peletería"},
	[171]={deDE="Alchemie",		esES="Alquimia",	frFR="Alchimie",	ptBR="Alquimia",	ruRU="Алхимия",		koKR="연금술",	zhCN="炼金术",	zhTW="炼金术",	esMX="Alquimia"},
	[182]={deDE="Kräuterkunde",	esES="Herboristería",	frFR="Herboristerie",	ptBR="Herborismo",	ruRU="Травничество",	koKR="약초 채집",	zhCN="草药学",	zhTW="草药学",	esMX="Herboristería"},
	[185]={deDE="Kochkunst",	esES="Cocina",		frFR="Cuisine",		ptBR="Culinária",	ruRU="Кулинария",	koKR="요리",	zhCN="烹饪",	zhTW="烹饪",	esMX="Cocina"},
	[186]={deDE="Bergbau",		esES="Minería",		frFR="Minage",		ptBR="Mineração",	ruRU="Горное дело",	koKR="채광",	zhCN="采矿",	zhTW="采矿",	esMX="Minería"},
	[197]={deDE="Schneiderei",	esES="Sastrería",	frFR="Couture",		ptBR="Alfaiataria",	ruRU="Портняжное дело",	koKR="재봉술",	zhCN="裁缝",	zhTW="裁缝",	esMX="裁缝"},
	[202]={deDE="Ingenieurskunst",	esES="Ingeniería",	frFR="Ingénierie",	ptBR="Engenharia",	ruRU="Инженерное дело",	koKR="기계공학",	zhCN="工程学",	zhTW="工程学",	esMX="Ingeniería"},
	[333]={deDE="Verzauberkunst",	esES="Encantamiento",	frFR="Enchantement",	ptBR="Encantamento",	ruRU="Наложение чар",	koKR="마법부여",	zhCN="附魔",	zhTW="附魔",	esMX="Encantamiento"},
	[356]={deDE="Angeln",		esES="Pesca",		frFR="Pêche",		ptBR="Pesca",		ruRU="Рыбная ловля",	koKR="낚시",	zhCN="钓鱼",	zhTW="钓鱼",	esMX="Pesca"},
	[393]={deDE="Kürschnerei",	esES="Desuello",	frFR="Dépeçage",	ptBR="Esfolamento",	ruRU="Снятие шкур",	koKR="무두질",	zhCN="剥皮",	zhTW="剥皮",	esMX="Desuello"},
	[762]={deDE="Reiten",		esES="Equitación",	frFR="Monte",		ptBR="Montaria",	ruRU="Верховая езда",	koKR="타기",	zhCN="骑术",	zhTW="骑术",	esMX="Equitación"},
	[633]={deDE="Schlossknacken",	esES="Ganzúa",		frFR="Crochetage",	ptBR="Arrombamento",	ruRU="Вскрытие замков",	koKR="자물쇠 따기",zhCN="开锁",	zhTW="开锁",	esES="Ganzúa"},
} -- GETS TRIMMED.

GQ.Professions.LocaleSkills={}
setmetatable(GQ.Professions.LocaleSkills,{__index=function(t,skill) return GQ.Professions.skillLocale[GQP.tradeskillsIdByName[skill] or 0] or skill end})
GQ.Professions.LocaleSkillsR={}
setmetatable(GQ.Professions.LocaleSkillsR,{__index=function(t,q) return q end})

-- add parent info to subskills
for id,data in pairs(GQP.tradeskills) do 
	for sid,sdata in pairs(data.subs) do
		sdata.parent=id
	end
end


-- Map ids by english names
GQP.tradeskillsIdByName = {}
for id,data in pairs(GQP.tradeskills) do 
	GQP.tradeskillsIdByName[data.name] = id 
	for sid,sdata in pairs(data.subs) do
		if faction=="Alliance" then sdata.name = sdata.name:gsub("Zandalari ","Kul Tiran ") end
		GQP.tradeskillsIdByName[sdata.name] = sid 
	end
end

function GQ:CacheSkills()
	if GQP.CS_Timer then GQ:CancelTimer(GQP.CS_Timer) end
	GQP.CS_Timer = GQ:ScheduleTimer(function() 
		GQ:CacheSkills_Queued()
	end, 1)
end

local cacheskill_profs = {}
local cacheskill_lines = {}
local cacheskill_core = {}
function GQ:CacheSkills_Queued()
	GQP.SkillsKnown = GQ.db.char.SkillsKnown or {}
	GQ.db.char.SkillsKnown = GQP.SkillsKnown
	for _,skill in pairs(GQP.SkillsKnown) do skill.active=false end
	local gold = GQ.Goldguide
	if gold then gold.knows_crafting=false end
	for index=1,GoatQuestCompat.GetNumSkillLines() do
		local info = C_SkillInfo.GetSkillLineInfo(index)
		local data = info and GQP.tradeskills[info.skillID]
		if data and not info.isHeader then
			GQP.SkillsKnown[data.name] = {
				name=data.name, level=info.rank, max=info.maxRank, active=true,
				skillID=info.skillID, parentskillID=info.skillID,
			}
			if gold and data.crafting then gold.knows_crafting=true end
		end
	end
	self:CacheRecipes()
end

function GQ:CacheRecipes(profs)
	local data = ProfessionsFrame and ProfessionsFrame:GetProfessionInfo()
	local skill = data and (data.parentProfessionID or data.professionID)
	if not skill then return end

	if GQP.CR_Timer then return end -- we already have scheduled refresh, wait for it
	if GQP.LastRecipeCheckLine~=skill then GQ:CacheRecipes_Queued(profs) return end -- we changed skill line, grab recipes now
	if GQP.LastRecipeCheckTime and (debugprofilestop()-GQP.LastRecipeCheckTime)>1000 then GQ:CacheRecipes_Queued(profs) return end -- over 1 second since last refresh, grab now as we are not spamming
	GQP.CR_Timer = GQ:ScheduleTimer(function() GQ:CacheRecipes_Queued(profs) end, 1)
end

function GQ:CacheRecipes_Queued(profs)
	if GQP.CR_Timer then GQ:CancelTimer(GQP.CR_Timer) GQP.CR_Timer=nil end

	if not C_TradeSkillUI.IsTradeSkillReady() then return end -- prevents missing reagents in recipes
	if C_TradeSkillUI.IsTradeSkillGuild() or C_TradeSkillUI.IsTradeSkillLinked() then return end

	local data = ProfessionsFrame and ProfessionsFrame:GetProfessionInfo()
	local skill = data and (data.parentProfessionID or data.professionID)
	if not skill then return end

	self.db.char.RecipesKnown=self.db.char.RecipesKnown or {}
	self.db.char.RecipesKnown[skill]=self.db.char.RecipesKnown[skill] or {}

	local recipes = self.db.char.RecipesKnown[skill]

	local all_recipes = C_TradeSkillUI.GetAllRecipeIDs()

	table.wipe(recipes)

	local difficulties = {
		[0] = "optimal",
		[1] = "medium",
		[2] = "easy",
		[3] = "trivial",
	}

	for _,recipeid in pairs(all_recipes) do
		local api_recipe = C_TradeSkillUI.GetRecipeInfo(recipeid)
		local api_schematic = C_TradeSkillUI.GetRecipeSchematic(recipeid,false)
		local recipe = {
			nummade = {api_schematic.quantityMin,api_schematic.quantityMax},
			spell = recipeid,
			learned = api_recipe.learned,
			skill = skill,
			numSkillUps = api_recipe.numSkillUps,
			difficulty = difficulties[api_recipe.relativeDifficulty],
			numAvailable = C_TradeSkillUI.GetCraftableCount(recipeid),
			source = C_TradeSkillUI.GetRecipeSourceText(recipeid),
			name = api_recipe.name
			}
		local productlink = C_TradeSkillUI.GetRecipeItemLink(recipeid)
		recipe.producttype,recipe.productid = productlink:match("|H(%w+):(%d+)")
		recipe.productid = tonumber(recipe.productid)
		recipe.variants = C_TradeSkillUI.GetRecipeQualityItemIDs(recipeid)

		
		local reagents,currencies={},{}
		for _,reagentInfo in ipairs(api_schematic.reagentSlotSchematics) do
			local count = reagentInfo.quantityRequired
			local itemid = reagentInfo.reagents[1].itemID
			local currencyID = reagentInfo.reagents[1].currencyID
			
			if itemid then reagents[itemid]=count end
			if currencyID then currencies[currencyID]=count end
		end
		recipe.reagents = reagents
		recipe.currencies = currencies

		recipes[recipeid]=recipe
	end

	GQP.LastRecipeCheckLine = skill
	GQP.LastRecipeCheckTime = debugprofilestop()
end

function GQP:GetSkill(name)
	if not name then 
		GQ.db.char.SkillsKnown[""].parentname="Unknown skill"
		return GQ.db.char.SkillsKnown[""] 
	end

	-- handle aliases : legion_alchemy => Legion Alchemy
	name = name:gsub("_"," "):gsub("(%a)([%w]*)", function(first,rest) return first:upper()..rest:lower() end)


	if GQ.db.profile.fakeskills[name] then
		return GQ.db.profile.fakeskills[name] -- faked value
	elseif GQ.db.char.SkillsKnown[name] then
		return GQ.db.char.SkillsKnown[name]
	else
		local parent = name
		if name:find(" ") then parent = name:gsub("([%w]*) ([%w]*)","%2") end
		GQ.db.char.SkillsKnown[""].parentname=parent
		return GQ.db.char.SkillsKnown[""] -- proper value or empty placeholer
	end
end

function GQP:GetSkillDataByName(name)
	for id,data in pairs(GQP.tradeskills) do 
		for sid,sdata in pairs(data.subs) do
			if sdata.name==name then return sdata end
		end
	end
end



function GQ:Profession_NEW_RECIPE_LEARNED(event,spell)
	for skill,skilltable in pairs(GQ.db.char.RecipesKnown) do
		if skilltable[spell] then
			skilltable[spell].learned=true
		end
	end
end

local ERR_LEARN_RECIPE_S_fmt = ERR_LEARN_RECIPE_S:gsub("%.","%%."):gsub("%%s","(.+)")
--local TRADESKILL_LOG_FIRSTPERSON_fmt = TRADESKILL_LOG_FIRSTPERSON:gsub("%%s","(.-)")

function GQ:Profession_CHAT_MSG_SYSTEM(event,text)
	if GQ.IsSecret(text) then return end
	local _,_,item = text:find(ERR_LEARN_RECIPE_S_fmt)
	if item then
		self.recentlyLearnedRecipes[item]=true
	end
end





function GQ:PerformTradeSkillGoal(goal)
	if not goal then return end
	if not goal.spellid then return end

	if goal.count then
		-- total based
		self:PerformTradeSkill(goal.spellid,goal.count-C_Item.GetItemCount(goal.targetid))
	elseif goal.skillnum and goal.skillnum>0 then
		-- skillup-based
		self:PerformTradeSkill(goal.spellid,goal.skillnum)
	else
		-- no count, completable by quest, do single craft
		self:PerformTradeSkill(goal.spellid,1)
	end
end

function GQ:PerformTradeSkill(id,count)
	if not count then count=1 end
	if count<=0 then return end
	local rec = GQP:GetRecipe(id)
	if not rec then return end
	if not (ProfessionsFrame and ProfessionsFrame:IsVisible()) then
		C_TradeSkillUI.OpenTradeSkill(rec.skill) 
		return
	end

	C_TradeSkillUI.OpenTradeSkill(rec.skill)
	if ProfessionsFrame then 
		local api_recipe = C_TradeSkillUI.GetRecipeInfo(id)
		if not api_recipe then return end
		ProfessionsFrame.CraftingPage:SelectRecipe(api_recipe) 
	end

	local transaction = (ProfessionsFrame and ProfessionsFrame.CraftingPage and ProfessionsFrame.CraftingPage.SchematicForm) and ProfessionsFrame.CraftingPage.SchematicForm:GetTransaction()
	local craftingReagentTbl = transaction and transaction:CreateCraftingReagentInfoTbl()

	-- dragonflight crafting with quality reagents and more than one item at once
	-- we need to craft one by one, and update craftingReagentTbl as it changes
	if craftingReagentTbl then count = 1 end
	
	C_TradeSkillUI.CraftRecipe(id, count, craftingReagentTbl)
end

function GQP:GetRecipe(spellid)
	local RK = GQ.db.char.RecipesKnown
	if not RK or not next(RK) then return false,"no data" end
	for skillid,recipes in pairs(RK) do
		if recipes[spellid] then return recipes[spellid] end
	end
	return false,"not found"
end

function GQP:KnowsRecipe(spellid)
	local ret,error = GQP:GetRecipe(spellid)
	if ret then
		return ret.learned,true
	else
		return false,false
	end
end


local pattern = "Skill (%d+) increased from (%d+) to (%d+)"
local function UpdateSkillConsole(_,_,msg)
	local id,from,to = msg:match(pattern)

	if id == 794 then -- archeology special handling
		local _, _, arch = GetProfessions()
		local name, _, rank, maxRank = GetProfessionInfo(arch)
		GQP.SkillsKnown[name] = GQP.SkillsKnown[name] or {}
		local pro = GQP.SkillsKnown[name]
		pro.level = rank
		pro.max = maxRank
		pro.active = true
		pro.skillID = id
		pro.name = name

	elseif id and to then
		id=tonumber(id)
		to=tonumber(to)

		for name,skill in pairs(GQ.db.char.SkillsKnown) do
			if skill.skillID==id then
				skill.level = to
				return
			end
		end

		if to>0 then
			for sid,linedata in pairs(GQP.tradeskills) do
				for subid,skilldata in pairs(linedata.subs) do
					if skilldata.skill==id then
						GQP.SkillsKnown[skilldata.name] = GQP.SkillsKnown[skilldata.name] or {}
						local pro =  GQP.SkillsKnown[skilldata.name]
						local subname = skilldata.name
						--if faction=="Alliance" then
						--	subname = subname:gsub("Zandalari ","Kul Tiran ")
						--end

						pro.level = to
						pro.max = skilldata.name==linedata.name and 300 or 200 -- 200 may be high, but it is only one tier, and will get adjusted to proper value when they open tradeskill window
						pro.active = true
						pro.skillID = skilldata.skill
						pro.name = subname
						pro.parentname = linedata.name
						pro.parentskillID = sid
						cacheskill_lines[subid] = true
					end
				end
			end
		else
			for name,linedata in pairs(GQP.SkillsKnown) do
				if linedata.parentskillID==id or linedata.skillID==id then
					GQP.SkillsKnown[name] = nil
				end
			end
		end
	end
end

function GQP:HasProfessionSlot()
	local p1, p2, arch, fish, cook, first = GetProfessions()
	return not (p1 and p2)
end

function GQP:HasProfessionUnscanned(name)
	cacheskill_profs.prof1, cacheskill_profs.prof2, cacheskill_profs.arch, cacheskill_profs.fish, cacheskill_profs.cook, cacheskill_profs.firstAid = GetProfessions()

	for i,prof in pairs(cacheskill_profs) do
		local _, _, _, _, _, _, skillline = GetProfessionInfo(prof)
		if GQP.tradeskills[skillline] and GQP.tradeskills[skillline].name==name then 
			if GQP.SkillsKnown[name] and GQ.db.char.RecipesKnown[skillline] then
				-- we know everything, skill is NOT unscanned
				return false
			else
				-- player has it, but we do not have both data sets
				return true
	end
		end
	end
	return false
end


function GQP:KnowsProfessionRecipes(name)
	cacheskill_profs.prof1, cacheskill_profs.prof2, cacheskill_profs.arch, cacheskill_profs.fish, cacheskill_profs.cook, cacheskill_profs.firstAid = GetProfessions()

	for i,prof in pairs(cacheskill_profs) do
		local _, _, _, _, _, _, skillline = GetProfessionInfo(prof)
		if GQP.tradeskills[skillline] and GQP.tradeskills[skillline].name==name then 
			if GQ.db.char.RecipesKnown[skillline] then return true end
		end
	end
	return false
end

function GQP:GoalRecipe(skill,spellid,loud)
	if not (ProfessionsFrame and ProfessionsFrame:IsVisible()) then return nil,"closed" end
	if not skill or not spellid then return nil,"no_data" end
	local skilldata = GQ.Professions:GetSkill(skill)
	if not skilldata then return nil,"no_prof" end

	local professionInfo = ProfessionsFrame:GetProfessionInfo()
	if skilldata.parentskillID~=(professionInfo.parentProfessionID or professionInfo.professionID) then return nil,"closed" end -- open, but on wrong skill

	local skillid = skilldata.parentskillID or skilldata.skillID
	if not GQ.db.char.RecipesKnown[skillid] then return nil,"no_prof" end
	local recipe = GQ.db.char.RecipesKnown[skillid][spellid]
	if not recipe then return nil,"unknown" end
	if not recipe.learned then return nil,"unknown" end
	if not recipe.difficulty or not recipe.numAvailable then return nil,"unknown" end
	return recipe
end


tinsert(GQ.startups,{"Professions setup",function(self)
	--self:AddEventHandler("PLAYER_ENTERING_WORLD","CacheSkills") don't cache at start, load saved instead
	self:AddEventHandler("SKILL_LINES_CHANGED","CacheSkills")
	--self:AddEventHandler("CHAT_MSG_SKILL","CacheSkills")
	self:AddEventHandler("CONSOLE_MESSAGE",UpdateSkillConsole) -- replaces CHAT_MSG_SKILL for our needs
	self:AddEventHandler("TRADE_SKILL_SHOW","CacheSkills")
	self:AddEventHandler("TRADE_SKILL_DATA_SOURCE_CHANGED","CacheSkills")

	--[[ bfa alpha change
	self:AddEventHandler("TRADE_SKILL_UPDATE","CacheSkills")
	--]]
	self:AddEventHandler("CHAT_MSG_SYSTEM","Profession_CHAT_MSG_SYSTEM")
	self:AddEventHandler("NEW_RECIPE_LEARNED","Profession_NEW_RECIPE_LEARNED")

	self:AddEventHandler("TRADE_SKILL_LIST_UPDATE","CacheRecipes")

	--self:AddEventHandler("CHAT_MSG_COMBAT_FACTION_CHANGE","CHAT_MSG_COMBAT_FACTION_CHANGE_Faction")

	if not GQ.db.char.SkillsKnown then
		GQ.db.char.SkillsKnown = {}
		GQ:CacheSkills()
	end

	GQ.db.char.SkillsKnown[""] = {active=false,level=0,max=0,placeholder=true}

	GQP.SkillsKnown = GQ.db.char.SkillsKnown
end})
