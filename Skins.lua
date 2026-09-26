local name,GQ = ...

GQ.Skins = {}
local Skins = GQ.Skins

local CHAIN=GQ.ChainCall
local SkinData = GQ.UI.SkinData

-- Keep wordmarks crisp at every UI scale instead of stretching an icon into a banner.
function GQ:CreateBrandTitle(parent,size)
	local title=parent:CreateFontString(nil,"OVERLAY")
	title:SetFont(self.FontBold or self.Font,size or 16)
	title:SetTextColor(0.96,0.75,0.16,1)
	title:SetText("GoatQuest")
	return title
end

-- Skeleton classes for the skins to use

local SkinProto={}
local StyleProto={}

function SkinProto:New(id,name)
	local skin = {id=id,name=name,styles={}}
	return setmetatable(skin,{ __index=SkinProto })
end

function SkinProto:AddStyle(id,name,inherit)
	local style=StyleProto:New(id,name)
	style.skin = self
	if inherit then style.inheritedStyle=self.styles[inherit] end
	self.styles[id]=style
	if not self.defaultStyle then self.defaultStyle=id end  -- first added becomes default
	return style
end

function SkinProto:GetStyle(id)
	return self.styles[id or self.defaultStyle]
end

function SkinProto:GetDir()
	return GQ.SKINSDIR .. self.id .. "\\"
end



function StyleProto:New(id,name)
	local style = {id=id,name=name}
	return setmetatable(style,{ __index=function(t,k)
		local proto = rawget(StyleProto,k)   if proto then return proto end
		local inheritedStyle = rawget(t,"inheritedStyle")  if not inheritedStyle then return end
		local inherited = inheritedStyle[k]  if inherited then return inherited end
	end})
end
function StyleProto:GetDir()
	return self.skin:GetDir() .. self.id .. "\\"
end



Skins.skins = {}

function GQ.Skins:AddSkin(id,name,inherit)
	local skin = SkinProto:New(id,name)
	if inherit then skin.inherit=inherit end
	self.skins[id] = skin
	if not self.defaultSkin then self.defaultSkin=id end  -- first added becomes default
	return skin
end

function GQ.Skins:GetSkin(id)
	return self.skins[id or self.defaultSkin]
end

function GQ.Skins:AddStyleToBlizzardScrollBar(scrollbar)
	--[[
	scrollbar.thumb_mid = CHAIN(scrollbar:CreateTexture())
		:SetDrawLayer("ARTWORK",1)
		:SetPoint("TOPLEFT",scrollbar.ThumbTexture)
		:SetPoint("BOTTOMRIGHT",scrollbar.ThumbTexture)
		:SetTexture(SkinData("ScrollBarTexture"))
		:SetTexCoord(0,1,1/4,2/4)
		:SetVertexColor(unpack(SkinData("ScrollBarColor")))
		:SetWidth(scrollbar.ThumbTexture:GetWidth())
	.__END
	--]]
	scrollbar.thumb_top = CHAIN(scrollbar:CreateTexture())
		:SetDrawLayer("ARTWORK",1)
		:SetPoint("TOP",scrollbar.ThumbTexture)
		:SetSize(11,SkinData("ScrollBarDecorHeight"))
		:SetTexture(SkinData("ScrollBarTexture"))
		:SetTexCoord(0,1,0,1/4)
		:SetVertexColor(unpack(SkinData("ScrollBarColor")))
		:SetWidth(scrollbar.ThumbTexture:GetWidth())
	.__END
	scrollbar.thumb_bottom = CHAIN(scrollbar:CreateTexture())
		:SetDrawLayer("ARTWORK",1)
		:SetPoint("BOTTOM",scrollbar.ThumbTexture)
		:SetSize(11,SkinData("ScrollBarDecorHeight"))
		:SetTexture(SkinData("ScrollBarTexture"))
		:SetTexCoord(0,1,2/4,3/4)
		:SetVertexColor(unpack(SkinData("ScrollBarColor")))
		:SetWidth(scrollbar.ThumbTexture:GetWidth())
	.__END
	scrollbar.ThumbTexture:SetAlpha(0)
	for i,v in ipairs({scrollbar:GetRegions()}) do
		if v.GetName and v:GetName()=="BACKGROUND" then v:SetAlpha(0) end
	end
	GQ.F.AssignButtonTexture(scrollbar.ScrollUpButton,(SkinData("ScrollBarArrowsTexture")),1,2)
	GQ.F.AssignButtonTexture(scrollbar.ScrollDownButton,(SkinData("ScrollBarArrowsTexture")),2,2)
end



function GQ:SetSkin(skin,style)
	-- One skin with one style: GoatQuest. Ids saved by older versions ("starlight", "stealth",
	-- "starlight-glass", "glass", ...) are unknown now and resolve to the default.
	local skindata = self.Skins:GetSkin(skin) or self.Skins:GetSkin()
	local styledata = skindata:GetStyle(style) or skindata:GetStyle()

	self.db.profile.skin = skindata.id
	self.db.profile.skinstyle = styledata.id

	GQ.CurrentSkin = skindata
	GQ.CurrentSkinStyle = styledata
	GQ.SkinDir = skindata:GetDir()
	GQ.StyleDir = styledata:GetDir()

	self.IconSets:Create()
	self.ButtonSets:Create()

	GQ:SendMessage("SKIN_UPDATED")

	skindata:CreateFrame()
end

local setmetatable,unpack,CHAIN=setmetatable,unpack,GQ.ChainCall

-- Simple shortcut function, tries to find a getter func for the given property and return the default value if it's not found
-- see below for usage
local quiet=false
function StyleProto:GetProp(propertyname,...)
	if type(propertyname)=="table" then
		for i,prop in ipairs(propertyname) do
			quiet=true
			local v = self:GetProp(prop,...)
			quiet=false
			if (v) then return v end
		end
		--error("missing skin prop "..table.concat(propertyname,","))
		return
	end
	local r=self[propertyname]
	if r then
		if type(r)=="function" then -- if it's a function, call it.
			return r(...)
		else -- a property then
			return r
		end
	else
		--if not quiet then error("missing skin prop "..propertyname) end
	end
end

GQ.IconSets = {}

function GQ.IconSets:Create()
	local L = GQ.L

	self.TabsIcons = {
		-- name = {col,row,"display name"}
		LEVELING =		{1,1,label="Leveling"},
		EVENTS =		{2,1,label="Events"},
		DAILIES =		{3,1,label="Dailies"},
		LOREMASTER =	{4,1,label="Loremaster"},
		GOLD =			{1,2,label="Gold"},
		PROFESSIONS =	{2,2,label="Professions"},
		PETSMOUNTS =	{3,2,label="Pets & Mounts"},
		ACHIEVEMENTS =	{4,2,label="Achievements"},
		TITLES =		{1,3,label="Titles"},
		REPUTATIONS =	{2,3,label="Reputations"},
		MACROS =		{3,3,label="Macros"},
		DUNGEONS =		{4,3,label="Dungeons"},
		GEAR =			{1,4,label="Gear"},
		SHARED =		{2,4,label="Shared"},
		QUESTS =		{3,4,label="Quests"},
		FAVOURITES =	{4,4,label="Favorites"},
		STARTUPWIZ =	{5,1,label="Startup Guide Wizard"},
		TEST =		{0,0,label="Test"},

		file = GQ.UI.SkinData("TabsIcons"),
		cols = 8,
		rows = 4,
		width = 512,
		height = 512,
		padding = 0,
		default = "LEVELING"
	}

	self.OptionsIcons = {
		general =	{2,1,label=L["opt_group_general"]},
		stepdisplay =	{2,2,label=L["opt_group_stepdisplay"]},
		display =	{2,3,label=L["opt_group_display"]},
		travelsystem =	{2,4,label=L["opt_group_travelsystem"]},
		poi =		{2,5,label=L["opt_group_poi"]},
		notification =	{2,6,label=L["opt_group_notification"]},
		gear =		{2,7,label=L["opt_group_gear"]},
		itemscore =	{2,8,label=L["opt_group_itemscore"]},
		gold =		{2,9,label=L["opt_group_gold"]},
		extras =	{2,10,label=L["opt_group_extras"]},
		profile =	{2,11,label=L["opt_group_profile"]},
		about =		{2,12,label=L["opt_group_about"]},
		share =		{2,13,label=L["opt_group_share"]},
		zta =		{2,15,label=L["opt_group_talentsystem"]},
		
		_exclamation =	{2,14,label=""},
		_target =	{2,15,label=""},
		automation =	{2,16,label=L["opt_group_automation"]},
		actionbuttons =	{2,17,label=L["opt_group_actionbuttons"]},
		maps =		{2,18,label=L["opt_group_maps"]},

		debugset =		{0,0,label="Debug: settings"},
		debugfake =		{0,0,label="Debug: faking stuff"},
		debugdig =		{0,0,label="Debug: data digging"},
		debugremoved =		{0,0,label="Debug: removed options"},
		debugshare =		{0,0,label="Debug: share"},
		debugvariants =		{0,0,label="Debug: variants"},

		file = GQ.SKINSDIR.."goatquest-options-icons",
		cols = 2,
		rows = 32,
		width = 128,
		height = 2048,
		padding = 0,
		default = "general"
	}

	self.GuideIconsSmall = {
		-- name = {col,row,"display name"}
		FOLDER =		{1,1},
		GUIDE =			{2,1},
		EXCLAMATION =	{3,1},
		STAR =			{1,2},
		QUEST =			{2,2},

		file = GQ.UI.SkinData("GuideMenuSmallIcons"),
		cols = 4,
		rows = 2,
		width = 128,
		height = 64,
		padding = 0,
		default = "GUIDE"
	}

	self.StepLineIcons = {
		DOT =         {1,1},
		BIGDOT =      {2,1},
		CHECK =       {3,1},
		INACTIVEDOT = {4,1},
		EXCLAMATION = {5,1},
		QUEST =       {6,1},
		MOB =         {7,1},
		LOOT =        {8,1},
		STAR =        {9,1},
		INN =         {10,1},
		DAILY =       {11,1},
		WING =        {12,1},
		TALK =        {13,1},
		NAVIGATION =  {14,1},
		TREASURE =    {15,1},
		RAREMOB =     {16,1},
		IMAGE =       {17,1},
		ARROW =       {18,1},

		file = GQ.UI.SkinData("StepLineIcons"),
		cols = 32,
		rows = 1,
		width = 1024,
		height = 32,
		padding = 0,
		default = "DOT"
	}

	self.GoldGuideIcons = {
		GOLD    = {1,1},
		FARM    = {2,1},
		GATHER  = {3,1},
		CRAFT   = {4,1},
		AUCTION = {5,1},
		QUEST   = {6,1},
		BASKET  = {7,1},
		SHOVEL  = {8,1},

		file = GQ.SKINSDIR.."goldguideicons",
		cols = 8,
		rows = 2,
		width = 512,
		height = 128,
		padding = 0,
		default = "GOLD"
	}

	self.AuctionToolsPriceIcons = {
		UP1      = { 1,1},
		UP2      = { 2,1},
		UP3      = { 3,1},
		DOWN1    = { 4,1},
		DOWN2    = { 5,1},
		DOWN3    = { 6,1},
		BULLET   = { 7,1},
		CROSSH   = { 8,1},
		NOPE     = { 9,1},
		QUESTION = {10,1},
		DELETE   = {11,1},
		ADD      = {12,1},

		file = GQ.UI.SkinData("AuctionToolsPriceIcons"),
		cols = 16,
		rows = 1,
		width = 512,
		height = 32,
		padding = 0,
		default = "BULLET"
	}

	self.WorldQuest = {
		QUEST          = { 1,1},
		PET            = { 2,1},
		DUNGEON        = { 3,1},
		RAID           = { 4,1},
		INVASION       = { 5,1},
		PVP            = { 6,1},
		ALCHEMY        = { 7,1},
		ARCHAEOLOGY    = { 8,1},
		BLACKSMITHING  = { 9,1},
		HERBALISM      = {10,1},
		INSCRIPTION    = {11,1},
		JEWELCRAFTING  = {12,1},
		LEATHERWORKING = {13,1},
		TAILORING      = {14,1},
		SKINNING       = {15,1},
		COOKING        = {16,1},
		ENCHANTING     = {17,1},
		ENGINEERING    = {18,1},
		FISHING        = {19,1},
		MINING         = {20,1},
		HORDE          = {21,1},
		ALLIANCE       = {22,1},
		DAILY          = {23,1},
		FIRSTAID       = {24,1},
		BARBER         = {25,1},
		VOID           = {26,1},

		file = GQ.SKINSDIR.."icons-worldquest",
		cols = 32,
		rows = 1,
		width = 1024,
		height = 32,
		padding = 0,
		default = "QUEST"
	}

	self.TalentPoints = {
		EMPTY	= { 1,1},
		[1]	= { 2,1},
		[2]	= { 3,1},
		[3]	= { 4,1},
		[4]	= { 5,1},
		[5]	= { 6,1},
		GOOD	= { 7,1},
		BAD	= { 8,1},
		ANIM1	= { 1,2},
		ANIM2	= { 2,2},
		ANIM3	= { 3,2},
		ANIM4	= { 4,2},
		ANIM5	= { 5,2},
		ANIM6	= { 6,2},
		ANIM7	= { 7,2},
		ANIM8	= { 8,2},

		file = GQ.SKINSDIR.."zta_hints",
		cols = 8,
		rows = 2,
		width = 512,
		height = 128,
		padding = 0,
		default = "EMPTY"
	}

	self.ActionBarIcons = {
		TALK     = { 1,1},
		KILL     = { 2,1},
		EMOTE    = { 3,1},
		SCRIPT   = { 4,1},
		TRASH    = { 5,1},

		file = GQ.SKINSDIR.."actionbar",
		cols = 8,
		rows = 1,
		width = 512,
		height = 64,
		padding = 0,
		default = "TALK"
	}

	self.ExpansionIcons = {
		VANILLA      = { 1,1},
		TBC      = { 2,1},
		WOTLK      = { 3,1},
		CATA    = { 4,1},
		MOP    = { 5,1},
		WOD    = { 6,1},
		LEGION   = { 7,1},
		BFA   = { 8,1},
		SHADOW     = { 9,1},
		DRAGON     = {10,1},
		TWW     = {11,1},
		MID     = {12,1},

		file = GQ.SKINSDIR.."expansion-icons",
		cols = 16,
		rows = 1,
		width = 1024,
		height = 64,
		padding = 0,
		default = "DRAGON"
	}

	self.NotificationIcons = {
		RELOAD =	{1,1},
		MONK =		{2,1},
		DUNGEON	=	{3,1},
		MOUNT =		{4,1},
		GEAR =		{5,1},
		PET =		{6,1},
		GOLD =		{7,1},
		GOATQUEST =		{8,1},
		ORIENTATION =	{9,1},
		SHARE =		{10,1},
		EVENTS =	{11,1},
		SKILL =		{12,1},
		NOSKILL =	{13,1},
		DAILY =		{14,1},
		WEEKLY =	{15,1},
		CUTSCENE =	{16,1},
		FOLDER =	{17,1},

		file = GQ.SKINSDIR.."goatquest-notification-icons",
		cols = 32,
		rows = 1,
		width = 1024,
		height = 32,
		padding = 0,
		default = "GOATQUEST"
	}

	self.ItemUpgrades = {
		GLOW      = { 1,1},
		ARROW      = { 1,2},
		BORDER      = { 1,3},

		file = GQ.SKINSDIR.."item-upgrade",
		cols = 1,
		rows = 4,
		width = 64,
		height = 256,
		padding = 0,
		default = "GLOW"
	}

	local getTexCoord = function(set,name)
		local c,r=unpack(set[name])
		return
			(c-1)/set.cols + (set.padding/set.cols),
			(c  )/set.cols - (set.padding/set.cols),
			(r-1)/set.rows + (set.padding/set.rows),
			(r  )/set.rows - (set.padding/set.rows)
	end

	for _,set in pairs(self) do  if type(set)=="table" then
		for k,icon in pairs(set) do
			if type(icon)=="table" then
				icon.texcoord={getTexCoord(set,k)}
				icon.AssignToTexture = function(self,texture)
					texture:SetTexture(set.file)
					texture:SetTexCoord(unpack(self.texcoord))
				end

				icon.AssignToButton = function(self,button)
					if not button:GetNormalTexture() then button:SetNormalTexture("dummy") end
					if not button:GetPushedTexture() then button:SetPushedTexture("dummy") end
					if not button:GetHighlightTexture() then button:SetHighlightTexture("dummy") end
					if not button:GetDisabledTexture() then button:SetDisabledTexture("dummy") end

					GQ.ChainCall(button:GetNormalTexture())    :SetTexture(set.file) :SetTexCoord(unpack(self.texcoord))
					GQ.ChainCall(button:GetPushedTexture())    :SetTexture(set.file) :SetTexCoord(unpack(self.texcoord))
					GQ.ChainCall(button:GetHighlightTexture()) :SetTexture(set.file) :SetTexCoord(unpack(self.texcoord)) :SetBlendMode("ADD")
					if button:GetDisabledTexture() then GQ.ChainCall(button:GetDisabledTexture())  :SetTexture(set.file) :SetTexCoord(unpack(self.texcoord)) end
				end
			
				icon.GetFontString = function(self,width,height,offsetx,offsety,cr,cg,cb)
					local left,right,top,bottom = unpack(self.texcoord)
					local rgb = (cr and cg and cb) and (":%d:%d:%d"):format(cr,cg,cb) or ""
					return 	("%s:%d:%d:%d:%d:%d:%d:%d:%d:%d:%d%s"):format(set.file, width, height, offsetx or 0, offsety or 0, set.width, set.height, left*set.width,right*set.width,top*set.height,bottom*set.height,rgb)
				end	
			end
		end
		setmetatable(set,{__index=function(self,name) local def=self[self.default]  return {def[1],def[2],label=def.label,texcoord=def.texcoord,default=true,AssignToTexture=def.AssignToTexture,AssignToButton=def.AssignToButton} end})
	end end

end

GQ.ButtonSets = {}

function GQ.ButtonSets:Create()	
	self.TitleButtons = {
		-- name = {row,column,"display name"}
		QUESTION          = {n=1},
		NOTIFICATIONS	  = {n=2},
		LOCK_OFF          = {n=3},
		LOCK_ON           = {n=4},
		SETTINGS          = {n=5},
		CLOSE             = {n=6},
		DOTS              = {n=7},
		FRAME             = {n=8},
		STEP_PREV         = {n=9},
		STEP_NEXT         = {n=10},
		LOADGUIDE         = {n=11},
		QUESTCLEANUP      = {n=12},
		MORETABS          = {n=13},
		STEPREPORT        = {n=14},
		BUGREPORT         = {n=15},
		LIST              = {n=16},
		BURGER            = {n=17},
		INFO              = {n=18},
		DROPDOWN          = {n=19},
		SMALLX            = {n=20},
		INLINETRAVEL      = {n=21},
		GOLDGUIDE         = {n=22},
		ADDGUIDE          = {n=23},
		SHARE             = {n=24},
		MAPMARKER         = {n=25},
		CHANGEGUIDE       = {n=26},
		RIGHTRIGHT        = {n=27},
		PLUS              = {n=28},
		MINUS             = {n=29},
		RELOAD            = {n=30},
		FLASH             = {n=31},
		SEARCH            = {n=32},
		TRAINER		  = {n=33},
		FINDNPC		  = {n=34},
		RESIZE		  = {n=35},
		DRAG		  = {n=36},
		VISIBLE		  = {n=37},
		INVISIBLE	  = {n=38},
		BROOM		  = {n=39},
		WIDGETS		  = {n=40},
		WAND		  = {n=41},
		BAGMANY		  = {n=42},
		BAGONE		  = {n=43},
		BAGLIST		  = {n=44},
		VIEWER		  = {n=45},

		file = GQ.UI.SkinData("TitleButtons"),
		count = 64,
		width = 1,
		height = 1,
		padding = 1/16,
		texturewidth = 2048,
		textureheight = 128,
		default = "QUESTION",
	}

	self.Interactions = {
		-- name = {row,column,"display name"}
		CHECKBOX        = {n=1},
		CHECKBOX_ON	= {n=2},
		RADIO		= {n=3},
		RADIO_ON	= {n=4},

		file = GQ.UI.SkinData("InteractionTexture"),
		count = 4,
		width = 1,
		height = 1,
		padding = 1/16,
		default = "CHECKBOX",
	}

	self.RatingButtons = {
		HAPPY		={n=1},
		INDIFFERENT		={n=1},
		UNHAPPY			={n=1},

		file = GQ.SKINSDIR.."goatquest-button-states",
		count = 1,
		width = 1,
		height = 1,
		padding = 1/16,
		default = "INDIFFERENT",
	}

	self.RatingButtons_active = {
		HAPPY		={n=1},
		INDIFFERENT		={n=1},
		UNHAPPY			={n=1},

		file = GQ.SKINSDIR.."goatquest-button-states",
		count = 1,
		width = 1,
		height = 1,
		padding = 1/16,
		default = "INDIFFERENT",
	}

	self.FloatingIcons = {
		-- name = {row,column,"display name"}
		BROOM		  = {n=1},
		WIDGETS		  = {n=2},
		CLOSE		  = {n=3},

		file = GQ.UI.SkinData("FloatingButtons"),
		count = 4,
		width = 1,
		height = 1,
		padding = 0,
		default = "CLOSE",
	}

	self.Minimap = {
		NORMAL		={n=1},
		ACTIVE		={n=2},

		file = GQ.SKINSDIR.."goatquest-minimap",
		count = 2,
		width = 1,
		height = 1,
		padding = 0,
		default = "NORMAL",
	}

	self.SpecialButton = {
		-- name = {row,column,"display name"}
		GOATQUEST		  = {n=1},

		file = GQ.SKINSDIR.."goatquest-button-states",
		count = 1,
		width = 1,
		height = 1,
		padding = 0,
	}

	local getTexCoords = function(set,name)
		local function getTexCoord(set,name,i)
			local n=set[name].n
			return
				(n-1)/set.count + (set.padding/set.count),
				(n  )/set.count - (set.padding/set.count),
				(i-1)/4 + (set.padding/4),
				(i  )/4 - (set.padding/4)
		end
		return {getTexCoord(set,name,1)},{getTexCoord(set,name,2)},{getTexCoord(set,name,3)},{getTexCoord(set,name,4)}
	end

	local getTexCoordsRaw = function(set,name)
		local function getTexCoord(set,name,i)
			if not set.texturewidth then return end
			local n=set[name].n
			local w = set.texturewidth/set.count
			local h = set.textureheight/4
			return
				(n-1)*w + (set.padding/set.count),
				(n  )*w - (set.padding/set.count),
				(i-1)*h + (set.padding/4),
				(i  )*h - (set.padding/4)
		end
		return {getTexCoord(set,name,1)},{getTexCoord(set,name,2)},{getTexCoord(set,name,3)},{getTexCoord(set,name,4)}
	end



	-- make it possible to:  GQ.ButtonSets.TitleButtons.LOADGUIDE:AssignToButton(targetbutton)

	for _,set in pairs(self) do  if type(set)=="table" then
		for k,icon in pairs(set) do if type(icon)=="table" then
			icon.texcoords={getTexCoords(set,k)}
			icon.texcoordsraw={getTexCoordsRaw(set,k)}
			icon.AssignToButton = function(self,button)
				if not button:GetNormalTexture() then button:SetNormalTexture("dummy") end
				if not button:GetPushedTexture() then button:SetPushedTexture("dummy") end
				if not button:GetHighlightTexture() then button:SetHighlightTexture("dummy") end
				if not button:GetDisabledTexture() then button:SetDisabledTexture("dummy") end

				GQ.ChainCall(button:GetNormalTexture())    :SetTexture(set.file) :SetTexCoord(unpack(self.texcoords[1]))
				GQ.ChainCall(button:GetPushedTexture())    :SetTexture(set.file) :SetTexCoord(unpack(self.texcoords[2]))
				GQ.ChainCall(button:GetHighlightTexture()) :SetTexture(set.file) :SetTexCoord(unpack(self.texcoords[3])) :SetBlendMode("ADD")
				if button:GetDisabledTexture() then GQ.ChainCall(button:GetDisabledTexture())  :SetTexture(set.file) :SetTexCoord(unpack(self.texcoords[4])) end
			end

			icon.AssignToTexture = function(self,texture)
				GQ.ChainCall(texture)    :SetTexture(set.file) :SetTexCoord(unpack(self.texcoords[1]))
			end
			icon.GetFontString = function(self,width,height,offsetx,offsety)
				local icon1,icon2,icon3,icon4 = unpack(self.texcoordsraw)
				return {
					("%s:%d:%d:%d:%d:%d:%d:%d:%d:%d:%d"):format(set.file, width, height, offsetx or 0, offsety or 0, set.texturewidth,set.textureheight,icon1[1],icon1[2],icon1[3],icon1[4]),
					("%s:%d:%d:%d:%d:%d:%d:%d:%d:%d:%d"):format(set.file, width, height, offsetx or 0, offsety or 0, set.texturewidth,set.textureheight,icon2[1],icon2[2],icon2[3],icon2[4]),
					("%s:%d:%d:%d:%d:%d:%d:%d:%d:%d:%d"):format(set.file, width, height, offsetx or 0, offsety or 0, set.texturewidth,set.textureheight,icon3[1],icon3[2],icon3[3],icon3[4]),
					("%s:%d:%d:%d:%d:%d:%d:%d:%d:%d:%d"):format(set.file, width, height, offsetx or 0, offsety or 0, set.texturewidth,set.textureheight,icon4[1],icon4[2],icon4[3],icon4[4]),				
				}
			end	
	
		end end
		setmetatable(set,{__index=function(self,name) local def=self[self.default]  return {n=def.n,texcoords=def.texcoords,texcoordsraw=def.texcoordsraw, default=true,AssignToTexture=def.AssignToTexture,AssignToButton=def.AssignToButton} end})
	end end

	local ratings={HAPPY={"+",0.35,0.9,0.4},INDIFFERENT={"=",0.96,0.75,0.16},UNHAPPY={"-",1,0.35,0.3}}
	for _,set in ipairs({self.RatingButtons,self.RatingButtons_active}) do
		for name,style in pairs(ratings) do
			set[name].AssignToButton=function(icon,button)
				button:SetNormalTexture(nil)
				button:SetPushedTexture(nil)
				button:SetHighlightTexture(nil)
				button:SetDisabledTexture(nil)
				if not button.GoatQuestRatingLabel then
					button.GoatQuestRatingLabel=button:CreateFontString(nil,"OVERLAY")
					button.GoatQuestRatingLabel:SetPoint("CENTER")
					button.GoatQuestRatingLabel:SetFont(GQ.FontBold or GQ.Font,26)
				end
				button.GoatQuestRatingLabel:SetText(style[1])
				button.GoatQuestRatingLabel:SetTextColor(style[2],style[3],style[4],1)
				button.GoatQuestRatingLabel:Show()
			end
		end
	end
end
