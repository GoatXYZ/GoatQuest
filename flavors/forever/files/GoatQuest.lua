assert(not _G['GQ'],"GoatQuest: disable other guide viewers before enabling GoatQuest.")

-- GLOBAL BINDING_HEADER_GOATQUEST,BINDING_NAME_GOATQUEST_WAYPOINT_NEXT,BINDING_NAME_GOATQUEST_WAYPOINT_PREV,BINDING_NAME_GOATQUEST_NEXT,BINDING_NAME_GOATQUEST_OPENGUIDE,BINDING_NAME_GOATQUEST_PREV
-- GLOBAL CloseDropDownForks,EasyFork,UIDropDownFork_AddButton,UIDropDownFork_SetText
-- GLOBAL SLASH_RE1,GOATQUEST_COMMAND,GOATQUESTFRAME_TITLE
-- GLOBAL GQF_Default_Menu,GQFSectionDropDown_Func,GoatQuestFrame,GoatQuestFrame_Border_TabBack,GoatQuestFrameMaster,GoatQuestMaintenanceFrame,GoatQuestMapIcon
-- GLOBAL GQ_DEV
-- Other addons:
-- GLOBAL Cartographer_QuestInfo,Chatter,LightHeaded
-- Unused:
-- GLOBAL GetCurrentMapAreaID,C_MapBar,SetMapByID,SetDungeonMapLevel

local addonName,GoatQuest = ...
LibStub("AceAddon-3.0"):NewAddon(GoatQuest,addonName, "AceConsole-3.0","AceEvent-3.0","AceTimer-3.0","AceHook-3.0")

local GQ=GoatQuest
GQ.StandAlone = C_AddOns.GetAddOnMetadata(addonName,"X-Standalone")

--global exports
_G['GoatQuest']=GoatQuest
_G['GQ']=GQ

GQ.L = GoatQuest_L("Main")
GQ.LS = GoatQuest_L("G_string")

local L = GQ.L
local LI = GQ.LI
local LC = GQ.LC
local LQ = GQ.LQ
local LS = GQ.LS

GQ.HBD = LibStub("HereBeDragons-GQ")
GQ.HBDPins = LibStub("HereBeDragons-Pins-GQ")

local HBD=GQ.HBD
local HBDPins=GQ.HBDPins

--GQ.name = L['name_plain']

GQ.Vars={}

-- Time to add some testing. ~~ Jeremiah
GQ.TestFramework = {}
GQ.TestFramework.UnitTests = {} -- Not used yet.
GQ.UseUnitTesting = false -- Turn off before release!

GQ.IsClassic = GQ.IsForever or WOW_PROJECT_ID == WOW_PROJECT_CLASSIC
GQ.IsClassicTBC = WOW_PROJECT_ID == WOW_PROJECT_BURNING_CRUSADE_CLASSIC
GQ.IsClassicWOTLK = WOW_PROJECT_ID == WOW_PROJECT_WRATH_CLASSIC
GQ.IsClassicCATA = WOW_PROJECT_ID == WOW_PROJECT_CATACLYSM_CLASSIC
GQ.IsClassicMOP = WOW_PROJECT_ID == WOW_PROJECT_MISTS_CLASSIC
GQ.IsRetail = not GQ.IsForever and WOW_PROJECT_ID == WOW_PROJECT_MAINLINE
GQ.IsClassicSoM =  C_Seasons and (GQ.IsClassic and C_Seasons.HasActiveSeason() and C_Seasons.GetActiveSeason()==Enum.SeasonID.SeasonOfMastery)
GQ.IsClassicSoD =  C_Seasons and (GQ.IsClassic and C_Seasons.HasActiveSeason() and C_Seasons.GetActiveSeason()==(Enum.SeasonID.SeasonOfDiscovery or 2))
GQ.IsClassicHardcore =  C_Seasons and (GQ.IsClassic and C_Seasons.HasActiveSeason() and (C_Seasons.GetActiveSeason()==Enum.SeasonID.Hardcore or C_Seasons.GetActiveSeason()==Enum.SeasonID.FreshHardcore))
GQ.IsClassicAnniv =  C_Seasons and (GQ.IsClassic and C_Seasons.HasActiveSeason() and (C_Seasons.GetActiveSeason()==Enum.SeasonID.Fresh or C_Seasons.GetActiveSeason()==Enum.SeasonID.FreshHardcore))
GQ.IsClassicAnnivHardcore =  C_Seasons and (GQ.IsClassic and C_Seasons.HasActiveSeason() and C_Seasons.GetActiveSeason()==Enum.SeasonID.FreshHardcore)

GQ.IsPandariaRemix =  (C_TimerunningUI and C_TimerunningUI.GetActiveTimerunningSeasonID) and C_TimerunningUI.GetActiveTimerunningSeasonID() == Constants.TimerunningConsts.TIMERUNNING_SEASON_PANDARIA
GQ.IsLegionRemix =  function() return PlayerGetTimerunningSeasonID and PlayerGetTimerunningSeasonID() == Constants.TimerunningConsts.TIMERUNNING_SEASON_LEGION end

function GQ:GetFlavourVersion()
	local flavour,variant="?",""
	
	if GQ.IsClassic then flavour="Classic" end
	if GQ.IsClassicTBC then flavour="ClassicTBC" end
	if GQ.IsClassicWOTLK then flavour="ClassicWOTLK" end
	if GQ.IsClassicCATA then flavour="ClassicCATA" end
	if GQ.IsClassicMOP then flavour="ClassicMOP" end
	if GQ.IsRetail then flavour="Retail" end
	if GQ.IsForever then flavour="Forever" end
	
	if GQ.IsClassicSoM then variant="SoM" end
	if GQ.IsClassicSoD then variant="SoD" end
	if GQ.IsClassicHardcore then variant="Hardcore" end
	if GQ.IsClassicAnniv then variant="Anniv" end
	if GQ.IsClassicAnnivHardcore then variant="AnnivHardcore" end
	if GQ.IsPandariaRemix then variant="PandariaRemix" end
	if GQ.IsLegionRemix() then variant="LegionRemix" end

	return {
		flavour=flavour,
		variant=variant,
		projectID=WOW_PROJECT_ID,
		seasonID=(C_Seasons and C_Seasons.GetActiveSeason()) or 0,
		timerunningID=PlayerGetTimerunningSeasonID and PlayerGetTimerunningSeasonID() or 0
	}
end

GQ.CLASSIC_SCALE_ADJUST = GQ.IsRetail and 1 or UIParent:GetEffectiveScale()

local DIR = "Interface\\AddOns\\"..addonName
GQ.DIR = DIR
GQ.SKINSDIR = GQ.DIR .. "\\Skins\\"
GQ.ARROWSDIR = GQ.DIR .. "\\Arrows\\"
if GQ.IsRetail     then GQ.IMAGESDIR = GQ.DIR .. "\\Guides-Retail\\Images\\" end
if GQ.IsClassicTBC then GQ.IMAGESDIR = GQ.DIR .. "\\Guides-TBC\\Images\\" end
if GQ.IsClassicWOTLK then GQ.IMAGESDIR = GQ.DIR .. "\\Guides-WOTLK\\Images\\" end
if GQ.IsClassicCATA then GQ.IMAGESDIR = GQ.DIR .. "\\Guides-CATA\\Images\\" end
if GQ.IsClassic    then GQ.IMAGESDIR = GQ.DIR .. "\\Guides-Classic\\Images\\" end
if GQ.IsClassicMOP    then GQ.IMAGESDIR = GQ.DIR .. "\\Guides-MOP\\Images\\" end

GOATQUEST_COMMAND = "goatquest"
GOATQUESTFRAME_TITLE = "GoatQuest"

BINDING_HEADER_GOATQUEST = L["name_plain"]
BINDING_NAME_GOATQUEST_OPENGUIDE = L["binding_togglewindow"]
BINDING_NAME_GOATQUEST_PREV = L["binding_prev"]
BINDING_NAME_GOATQUEST_NEXT = L["binding_next"]
BINDING_NAME_GOATQUEST_WAYPOINT_NEXT = L["binding_waypoint_next"]
BINDING_NAME_GOATQUEST_WAYPOINT_PREV = L["binding_waypoint_prev"]


do
	local version, build, date, tocversion = GetBuildInfo()
	build = tonumber(build)
	tocversion = tonumber(tocversion)
	GQ.Expansion_Cata = true
	GQ.Expansion_Mists = (build>=15799)
	GQ.Expansion_Warlords = (build>=18566)
	GQ.Expansion_Legion = (build>=22248)
	GQ.Expansion_Shadowlands = (tocversion>=90000)

	GQ.Patch_7_2 = (build>=23721)
end



-- local libs

local BZ = LibStub("LibBabble-SubZone-3.0")
local BZL = BZ:GetUnstrictLookupTable()
local BZR = setmetatable({_table=BZ:GetReverseLookupTable()},{__index=function(t,k) return t._table[k] or k end})
GQ.BZL = BZL
GQ.BZR = BZR
local BF = LibStub("LibBabble-Faction-3.0")
local BFL = BF:GetUnstrictLookupTable()
local BFR = BF:GetReverseLookupTable()
GQ.BFL = BFL
GQ.BFR = BFR
--local Dewdrop = AceLibrary("Dewdrop-2.0")
GQ.LibTaxi = LibStub("LibTaxi-1.0")


-- localizing common functions

local _G,assert,table,string,tinsert,tremove,tonumber,tostring,type,ipairs,pairs,setmetatable,math,resume,status,yield,debugprofilestop =
      _G,assert,table,string,tinsert,tremove,tonumber,tostring,type,ipairs,pairs,setmetatable,math,coroutine.resume,coroutine.status,coroutine.yield,debugprofilestop
local IsQuestFlaggedCompleted = C_QuestLog.IsQuestFlaggedCompleted


GQ.registeredguides = {}  ---@type Guide[]
GQ.registered_guide_types = {} ---@type { [GuideType]: Guide[] }
GQ.registeredmapspotsets = {}
GQ.guidesets = {}
GQ.registered_groups = { groups={},guides={}}
GQ.RegisteredGuidesTitles = {}
GQ.RegisteredGuidesByIdent = {}


GQ.CartographerDatabase = { }


local MAX_GUIDES_HISTORY = 30


GQ.STARTUP_INTENSITY=10
local STARTUP_SPAM_FREQUENCY=0.1

GQ.startups = {}
GQ.LIBROVER_MANAGED_STARTUP=true



GQ.CFG = {}
GQ.CFG.LINES_PER_STEP = 30

local LINES_PER_STEP = GQ.CFG.LINES_PER_STEP


GQ.StepLimit = 20

GQ.mentionedQuests = {}


GQ.ACTION_BUTTONS_DISABLED = true


local MIN_HEIGHT=10

-- GQ.STEPMARGIN_X=3
-- GQ.STEPMARGIN_Y=3


-- This gets really useful, probably move to functions or make it GQ member?
local function SkinData(parm)
	return GQ.UI.SkinData(parm)
end


GQ.MIN_STEP_HEIGHT=12
GQ.MIN_SPOT_HEIGHT=40

local MIN_WIDTH = 260
local MAX_WIDTH = 800

--local FONT = STANDARD_TEXT_FONT
local FONT=L['MainFont']
local FONTBOLD=L['MainFontBold']
GQ.Font = FONT
GQ.FontBold = FONTBOLD

local lastcompletion=0


--GQ.CLEAR_GUIDE_RAWDATA_AFTER_PARSING = 1
-- DON'T. Guides that are UNloaded have their .steps cleared - they need rawdata to be parsed again!


--GQ.BUTTONS_INLINE=true


-- BAD GLOBALS!

local math_modf=math.modf
if not math.round then
	math.round=function(n) local x,y=math_modf(n) return n>0 and (y>=0.5 and x+1 or x) or (y<=-0.5 and x-1 or x) end
end
local round=math.round


StaticPopupDialogs['GOATQUEST_HELP'] = {
	text = L['static_help'],
	button1 = OKAY,
	hideOnEscape = 1,
	timeout = 0,
	whileDead = 1,
}

StaticPopupDialogs['GOATQUEST_SIS'] = {
	text = L['static_sis'],
	button1 = OKAY,
	button2 = CANCEL,
	OnAccept = function(self) GQ:SIS_Activate() end,
	hideOnEscape = 1,
	timeout = 0,
	whileDead = 1,
}

StaticPopupDialogs['GOATQUEST_DEFAULT'] = {
	text = L['static_caption'].."%s",
	button1 = OKAY,
	hideOnEscape = 1,
	timeout = 0,
	whileDead = 1,
}

GQ.timestamp_loaded = debugprofilestop()
GQ.timestamp_loaded_GT = GetTime()

function GQ:OnInitialize()  --ADDON_LOADED
	self:MigrateLegacySettings()
	GQ.db = LibStub("AceDB-3.0"):New("GoatQuestSettings")

	GQ.db.global.gii_cache=GQ.db.global.gii_cache or {}

	GQ.db.global.sv_version = (tonumber(GQ.db.global.sv_version) or 1)  + 1
	assert(GQ.version,"Ver.lua missing!")
	--print("gq oninit")
	--if not CHECK then CHECK = 3 end

--	if not GoatQuestMiniFrame then error("GoatQuest step frame not loaded.") end

	GQ.startuptimestamps:Punch("libs.xml start",___GQ_TIMESTAMP_LOADLIBSXML_START)
	GQ.startuptimestamps:Punch("libs.xml end",___GQ_TIMESTAMP_LOADLIBSXML_END)
	GQ.startuptimestamps:Punch("localization.xml start",___GQ_TIMESTAMP_LOADLOCALIZATIONXML_START)
	GQ.startuptimestamps:Punch("localization.xml end",___GQ_TIMESTAMP_LOADLOCALIZATIONXML_END)
	GQ.startuptimestamps:Punch("guides/autoload.xml start",___GQ_TIMESTAMP_LOADGUIDESXML_START)
	GQ.startuptimestamps:Punch("guides/autoload.xml end",___GQ_TIMESTAMP_LOADGUIDESXML_END)
	GQ.startuptimestamps:Punch("files.xml start",___GQ_TIMESTAMP_LOADFILESXML_START)
	GQ.startuptimestamps:Punch("files.xml end",___GQ_TIMESTAMP_LOADFILESXML_END)
	GQ.startuptimestamps:Punch("OnInitialize")
	self.timestamp_initing = debugprofilestop()
	
	self.Profiler:Store("file-load-total",self.loading_memory_total,self.time_loadedfiles,self.time_loadedfiles)  -- time_loadedfiles set in files.xml

	self.startuptimes["Loading libs"]=GQ.startuptimestamps["libs.xml end"]-GQ.startuptimestamps["libs.xml start"]
	self.startuptimes["Loading guides"]=GQ.startuptimestamps["guides/autoload.xml end"]-GQ.startuptimestamps["guides/autoload.xml start"]
	self.startuptimes["Loading code"]=GQ.startuptimestamps["files.xml end"]-GQ.startuptimestamps["files.xml start"]-self.startuptimes["Loading guides"]
	--self.startuptimes["Loading variables"]=self.timestamp_initing-self.loadtime

	local t1=debugprofilestop()

	self:Debug ("&startup Initializing...")

	if self.db.profile.do_disable_profiler then
		SetCVar("scriptProfile","0")
		self.db.profile.do_disable_profiler = nil
	end
	if (GetCVar("scriptProfile")=="1") then
		self:Debug("Somebody set us up a bomb: Lua profiler is enabled. Disabling it on next reload")
		self.ProfilerMode=true
		self.db.profile.do_disable_profiler = true
	end

	self:Options_Initialize()
	self:ApplyGuideOnlySettings()

	GoatQuestMapIcon:Setup()

	self:WarnAboutDebugSettings()

	--GQ:Print("Loading...")

	
	if IsShiftKeyDown() then
		self:Debug ("MAINTENANCE MODE!")

		-- DISABLE all maint settings
		for k,v in pairs(self.db.char) do if k:match("^maint_") then self.db.char[k]=false end end

		GoatQuestMaintenanceFrame:Show()
	
	else
		
		-- ENABLE all maint settings. They should be enabled already, by default, anyway...
		for k,v in pairs(self.db.char) do if k:match("^maint_") then self.db.char[k]=true end end
	end



	self.db.char.completedQuests=nil --wipe and flush

	self.CurrentStepNum = self.db.char.step
	self.CurrentGuideName = self.db.char.guidename

	self.briefstepexpansionlines = {}
	self.briefstepexpansionspeedlines = {}

	self.QuestCacheTime = 0
	self.QuestCacheUndertimeRepeats = 0
	self.StepCompletion = {}
	self.recentlyAcceptedQuests = {}
	self.recentlyLostQuests = {}
	self.recentlyCompletedQuests = {}
	self.LastSkip = 1

	self.quests = {}
	self.questsbyid = {}

	self.bandwidth = 0

	self.TomTomWaypoints = {}

	self.instantQuests = {}
	self.dailyQuests = self.dailyQuests or {}

	self.completionelapsed = 0
	self.completionintervaldefault = 1.0 -- when sitting on a step, waiting for it to complete.
	self.completionintervallong = 1.0 -- when starting skipping through steps
	self.completionintervalmin = 0.01 -- after skipping through some steps
	self.completionintervalspeed = 0.8 -- multiplier of speed at each step in a row
	self.completioninterval = self.completionintervaldefault
	self.completionstreak = 0

	self:Debug ("&startup Initializing step 2...")
	self.db.char.lastlogin = time()

	-- initialize/convert history
	if not self.db.char.guides_history_GQ4clear then self.db.char.guides_history={} self.db.char.guides_history_GQ4clear=true end
	if not tonumber((next(self.db.char.guides_history))) then -- convert back to flat
		local g={}
		for gtype,guide in pairs(self.db.char.guides_history) do  tinsert(g,guide)  end
		self.db.char.guides_history=g
	end

	self:ClearRecentActivities() -- just to make sure they're not nils

	--self.AutoskipTemp = true

	self:Debug ("&startup Initializing skin...")

	self:SetSkin(self.db.profile.skin,self.db.profile.skinstyle)
	
	GoatQuestFrame = self.Frame
	GQ.Replacements:Startup()

	self.Frame:SetSpecialState("loading")

	self.frameNeedsResizing = 0

	self.Frame:SetScale(self.db.profile.framescale)
	self.Frame:AlignFrame()
	self:UpdateLocking()
	self:ReanchorFrame()

	if GQ.DEV and GQ.LibTaxi and GQ.LibTaxi.errors and next(GQ.LibTaxi.errors) then GQ:Print("DEV: LibTaxi reports errors. See LibTaxi.errors") end

	self:Debug ("&startup Initialized in %.2f",debugprofilestop()-t1)

	-- Making sure no Bag Addon can see our dearest minimap icons
	local trueMinimapGetChildren=Minimap.GetChildren
	assert(trueMinimapGetChildren) -- if that ever breaks we might need to reschedule the operation or something
	function Minimap:GetChildren()
		local res={ trueMinimapGetChildren(self) }
		for k,v in pairs(res) do
			if v.isGoatQuestWaypoint then
				table.remove(res,k) -- Nothing to see here, move along
			end
		end
		return unpack(res)
	end

	CinematicFrame:HookScript("OnShow", GQ.F.CutsceneCancel)
	MovieFrame:HookScript("OnShow", GQ.F.MovieCancel)

	--[[
	if GoatQuestTalentAdvisor and GoatQuestTalentAdvisor.revision > self.revision then
		self.revision = GoatQuestTalentAdvisor.revision
		self.version = GoatQuestTalentAdvisor.version
		self.date = GoatQuestTalentAdvisor.date
	end
	--]]

	GQ.LibRover:DoStartup()

	-- home detection, moved to events


	GQ.db.char.questrewards=GQ.db.char.questrewards or {}
	if GQ.IsRetail then
		-- Client version numbers do not guarantee that the legacy choice API exists.
		if not GQ.Expansion_Shadowlands and type(SendQuestChoiceResponse)=="function"
			and C_QuestChoice and type(C_QuestChoice.GetQuestChoiceInfo)=="function" then
			hooksecurefunc("SendQuestChoiceResponse",function(...) GQ:QuestRewardSelect(...) end)
		end
		if C_PlayerChoice and type(C_PlayerChoice.SendPlayerChoiceResponse)=="function" then
			hooksecurefunc(C_PlayerChoice,"SendPlayerChoiceResponse",function(...) GQ:PlayerChoiceResponce(...) end)
		end
	end

	if self.DEV then
		GQ.DebugFrame = GQ.ChainCall(CreateFrame("FRAME","GoatQuestDebugFrame",UIParent)) :SetPoint("TOPLEFT") :SetSize(1,1) .__END
		GQ.DebugFrame.text1 = GQ.ChainCall(GQ.DebugFrame:CreateFontString()) :SetPoint("TOPLEFT") :SetFontObject(SystemFont_Tiny) .__END
		if self.db.profile.fpsgraph then
			GQ:StartFPSFrame()
		end
	end

	self.maxlevel = GetMaxLevelForExpansionLevel(GetExpansionLevel())
	

	if self.ERRORS then self:Print("Errors were detected on startup, see GQ.ERRORS") end

	GQ.startuptimestamps:Punch("oninitialize_complete")

	-- clear timestamp globals
	for k,v in pairs(_G) do if k:find("___GQ_TIMESTAMP",1,true) then _G[k]=nil end end

	self:StoreTelemetryBasics()

	self:Debug("&startup Initialized")
end

function GQ:OnEnable()  --PLAYER_LOGIN

	self:Debug("&startup Enabling...")

	local t1=debugprofilestop()

	GoatQuestMapIcon:Show()

	self:UpdateMapButton()
	self:ApplySkin()

	self:AddEventHandler("UNIT_INVENTORY_CHANGED")

	-- combat detection for hiding in combat
	self:AddEventHandler("PLAYER_REGEN_DISABLED")
	self:AddEventHandler("PLAYER_REGEN_ENABLED")
	--self:AddEventHandler("WORLD_MAP_UPDATE")

	--self:AddEventHandler("SPELL_UPDATE_COOLDOWN")

	self:AddEventHandler("PLAYER_CONTROL_GAINED")  -- try to force current zone updates; should prevent GoTo lines from locking up after a taxi flight

	self:AddEventHandler("PLAYER_ENTERING_WORLD")  -- cache current map id
	self:AddEventHandler("ZONE_CHANGED")
	self:AddEventHandler("ZONE_CHANGED_INDOORS")
	self:AddEventHandler("ZONE_CHANGED_NEW_AREA")
	self:AddEventHandler("NEW_WMO_CHUNK")
	
	--[[ bfa alpha change
	self:AddEventHandler("MAP_BAR_UPDATE")
	--]]

	--self:AddEventHandler("COMBAT_LOG_EVENT_UNFILTERED")
	self:AddEventHandler("LOADING_SCREEN_DISABLED")
	self:AddEventHandler("LOADING_SCREEN_ENABLED")
	self:AddEventHandler("CINEMATIC_START");
	self:AddEventHandler("CINEMATIC_STOP");

	self:AddEventHandler("TAXIMAP_OPENED")

	self:AddEventHandler("GET_ITEM_INFO_RECEIVED")

	--[[
	if GQ.IsRetail then
		self:AddEventHandler("PLAYER_CHOICE_UPDATE")
		self:AddEventHandler("PLAYER_CHOICE_CLOSE")
	end
	--]]
	
	self:AddEventHandler("PLAYER_LEVEL_UP")
	--self:AddEventHandler("UNIT_AURA",GQ.RecordTirisfal)
	self:AddEventHandler("HEARTHSTONE_BOUND", function()
		GoatQuest.recentlyHomeChanged = true
	end)

	self:AddEventHandler("CRITERIA_EARNED")

	--self:AddEventHandler("UPDATE_VEHICLE_ACTIONBAR") -- refresh actionbar when vehicle/pet is summoned/dismissed

	self:AddMessageHandler("GQ_LOADING_TOPLEVEL_GROUPS_UPDATED")

	if not (self.GuideOnly or self.IsForever) then
		self:AddEventHandler("UPDATE_MOUSEOVER_UNIT",function() GQ.HandleRaidmarker("mouseover") end)
		self:AddEventHandler("UNIT_TARGET",function() GQ.HandleRaidmarker("target") end)
	end

	self:Hook_QuestChoice()

	-- hook templates and objects to use with suggesting guides from world map icons
	local mixin_to_template = {
		AreaPOIPinMixin = "AreaPOIPinTemplate",
		AreaPOIEventPinMixin = "AreaPOIEventPinTemplate",
		VignettePinMixin = "VignettePinTemplate",
		DelveEntrancePinMixin = "DelveEntrancePinTemplate",
	}

	local function register_for_suggestion(pin)
		if pin:GetScript("OnMouseUp") then
			hooksecurefunc(pin,"OnMouseUp", function(pin,button) GQ:SuggestGuideFromBlizzardIcon(pin) end)
		else
			pin:EnableMouse(true)
			pin:SetScript("OnMouseUp",function(pin) GQ:SuggestGuideFromBlizzardIcon(pin) end)
		end
	end

	for pinmixin,pintemplate in pairs(mixin_to_template) do
		local mixin = _G[pinmixin]
		if mixin then
			hooksecurefunc(mixin,"OnAcquired", register_for_suggestion)
			for pin,_ in WorldMapFrame:EnumeratePinsByTemplate(pintemplate) do register_for_suggestion(pin) end
		end
	end
	-- done hooking stuff for world map



	--self.Localizers:PruneNPCs()  -- off until we start doing it by data, not by name. ~sinus 2013-04-09

	self.Log.entries = self.db.char.debuglog
	self.Log:Add("Viewer started. ---------------------------")

	-- waiting for QUEST_LOG_UPDATE for true initialization...

	if GQ_DEV then GQ_DEV() end
	self:SetBeta()

	if self.db.profile.frame_anchor then
		GQ.F.SetFrameAnchor(self.Frame:GetParent(),GQ.db.profile.frame_anchor)
	end


	GoatQuestMapIcon:SetLoading(true)

	self:Debug("&startup Enabled in %.2f ms",debugprofilestop()-t1)

	self.loading=""
end

function GQ:OnDisable()
--	self:UnregisterAllEvents()
	
	GoatQuestMapIcon:Hide()
	self.Frame:Hide()
end

-- Compare two guides or guide groups. Sort wisely according to either registered_sortings or registration order (first-come-first-serve)
local function CompGroups(a,b)
	local aname=GQ.GuideTitles[a.name]
	local bname=GQ.GuideTitles[b.name]

	local sa=GQ.registered_sortings[aname or a.title_short]
	local sb=GQ.registered_sortings[bname or b.title_short]

	if sa and sb then return sa<sb else return a.ord<b.ord end
end

local function SortGroups(group,recurse)
	table.sort(group.groups,CompGroups)
	table.sort(group.guides,CompGroups)
	if recurse then for i,gr in ipairs(group.groups) do
		SortGroups(gr,recurse)
	end end
end


function GQ:Startup_LoadGuides_Threaded()
	local full_load = not self.GuideOnly and self.db.profile.loadguidesfully

	if #self.registeredguides>0 then
		self.loading = L['loading_guides']


		-- prune banned first
		local newreg = {} ---@type Guide[]
		for i=1,#self.registeredguides do
			local guide=self.registeredguides[i]
			if self.GuideFuncs:IsGuideBanned(guide.title) or (guide.beta and not GQ.BETA) then
				self.registeredguides[i]=nil
			else
				tinsert(newreg,guide)
				guide.num=#newreg
			end
		end
		self.registeredguides = newreg

		-- FAST START: load current guide first!
		self:LoadInitialGuide("fastload")

		local t=debugprofilestop()
		local count_total=#self.registeredguides
		local count=0
		local guides_this_tick=0

		for i,guide in ipairs(self.registeredguides) do repeat
			guide:ParseHeader()
			if full_load then guide:Parse(full_load) end  -- may yield, caught by @coro_startup
			--if guide.type=="pet" or guide.type=="mount" then
			--	guide:Parse(true) -- Those guys are useful for detector
			--end

			-- if parsed then assign to a group
			local group,tit = guide.title:match("^(.*)\\+(.-)$")
			group = group and self:FindOrCreateGroup(self.registered_groups,group) or self.registered_groups
			guide.ord=#group.guides+1
			tinsert(group.guides,guide)

			-- set up all links for that guide (guide in more than one location feature)
			if guide.headerdata.linked then
				local isvisible = not guide.condition_visible or guide.condition_visible()
					
				if not (guide.headerdata.linkedhidden and isvisible) then 
					for guidepath,_ in pairs(guide.headerdata.linked) do
						if guidepath:sub(-1) == "\\" then guidepath = guidepath:sub(1,-2) end
						local group = self:FindOrCreateGroup(self.registered_groups,guidepath) or self.registered_groups
						guide.ord=#group.guides+1
						tinsert(group.guides,guide)
					end
				end
			end

			guides_this_tick=guides_this_tick+1
			count=count+1

			if debugprofilestop()-t>(self.LOADGUIDES_INTENSITY or self.STARTUP_INTENSITY) then  -- let it take us down to 3fps, it's the startup. -- NOOOO! - 2016-03-28 21:21:06 sinus
				self.loadprogress = i/#self.registeredguides
				self:SendMessage("GQ_LOADING")
				yield("loadguides: " .. (full_load and "parsing fully" or "parsing headers") .. " ("..guides_this_tick..")",count/count_total*100)
				guides_this_tick=0
				t=debugprofilestop()
			end
		until true end
		yield("loadguides: " .. (full_load and "parsed fully" or "parsed headers"))
	
		-- parse tabbed guides, so we can check for step completion inactive tabs
		if GQ.db.char.tabguides then 
			for tabnum,guidedata in pairs(GQ.db.char.tabguides) do
				local guide = GQ:GetGuideByTitle(guidedata.title)
				if guide then guide:Parse(true) end
			end
		end
		yield("loadguides tabbed")

		for i,guide in ipairs(self.registeredguides) do
			if guide.startlevel and not guide.endlevel and guide.next then
				local nextg = self:GetGuideByTitle(guide.next)
				if nextg and nextg.startlevel and nextg.startlevel>guide.startlevel then
					guide.endlevel = nextg.startlevel
				end
			end
			--[[
			-- too fast for progress, eh?
			self.loadprogress = i/#self.registeredguides
			self:SendMessage("GQ_LOADING")
			yield()
			--]]
		end

		yield("loadguides: startleveling")
	end

	-- sort guides, according to preset sortings.
	SortGroups(self.registered_groups,"recurse")
	yield("loadguides: sorting groups")

	-- WIPE!
	--self.ParseQuestChains=nil
	--self.CreateReverseQuestChains=nil
	self.RegisterGuide=function() GQ:Print("Too late to RegisterGuide at this point!") end
	self.RegisterMapSpots=nil

	self:SendMessage("GQ_LOADING")

	self.guidesloaded=true

	--self:UpdateGuideMenuButton()

	self:CheckGuideJumps()

	if #self.ParseLog>0 then
		self:ShowDump(self.ParseLog,"Errors in guides",{readonly=true})
	end

	yield("loadguides: complete.")

	self:Debug("&startup Loading guides ended.")
end

GQ.maint_done={}
local function waitformaint(maint)
	while not GQ.db.char[maint] do yield("waiting for "..maint) end
	GQ.maint_done[maint]=true
end

--- prints check results into GQ.ParseLog
function GQ:CheckGuideJumps()
	-- check jump validity
	if self.db.profile.loadguidesfully then
		for _,guide in ipairs(self.registeredguides) do
			for si,step in ipairs(guide.steps) do
				for gi,goal in ipairs(step.goals) do
					local jumpguide,jumpstep
					local jumptype = ""
					if goal.next then
						jumptype = "next"
						jumpstep,jumpguide = step:GetJumpDestination(goal.next)
					end
					if goal.loadguidestep then
						jumptype = "loadguide"
						jumpstep = goal.loadguidestep
						jumpguide = goal.loadguide
					end

					if jumpguide and jumpstep and not tonumber(jumpstep) then
						local jumpedguide = GQ:GetGuideByTitle(jumpguide)
						if not jumpedguide then
							self.ParseLog = self.ParseLog .. ("Guide %s step %d goal %d :\n%s jump guide missing \"%s\"\n\n"):format(guide.title,si,gi,jumptype,jumpguide)
						elseif not jumpedguide.steplabels[jumpstep] then
							self.ParseLog = self.ParseLog .. ("Guide %s step %d goal %d :\n%s jump guide missing label \"%s\" - %s\n\n"):format(guide.title,si,gi,jumptype,jumpguide,jumpstep)
						end
					end
				end -- goal
			end -- step
		end -- guide
	end
end

function GQ:StartupModule_Threaded(startup,timeleft)  -- resumed in _StartupThread. Returns when module is 100% done. May yield, or may let the module startup yield.
	timeleft = timeleft or GQ.STARTUP_INTENSITY
	
	self:Debug("&startup Starting module: |cffddffaa%s|r (allotted time: |cffffddee%d|rms)",startup.name,timeleft)

	startup.thread = coroutine.create(function() startup.func(self) end)

	if coroutine.status(startup.thread)~="suspended" then self:ErrorThrow("Error during initialization sequence: module '"..startup.name.."' didn't start") end

	local t0=debugprofilestop()
	local t=t0
	--local gc=0
	repeat
		if self.db.profile.safe_startup then t=debugprofilestop() yield("Before startup module: ".. startup.name .." ...") end
		local t1 = debugprofilestop()
		GQ.Profiler:Start("startup-module-"..startup.name)

		---
		local ok,ret,r2,r3 = coroutine.resume(startup.thread,timeleft)  -- @coro_startupmodule_threaded ; yields from startup modules are caught here.
		if not ok then  self:ErrorThrow(
			"Error during initialization sequence '"..startup.name.."':\n"..
			tostring(ret).."\n"..
			"-- STARTUP THREAD STACK: --\n"..
			GQ.MinimizeStack(debugstack(startup.thread))..
			"GoatQuest v"..GQ.version..", WoW v"..table.concat({table.removemulti({GetBuildInfo()},1,2)},".").."\n"
		)  end
		---
		--gc=gc+1  if gc%30==0 then collectgarbage("step",1) end

		local progress,msg=ret,r2

		GQ.Profiler:Stop()
		t1 = debugprofilestop()-t1
		if self.db.profile.safe_startup then t=debugprofilestop() yield(("Startup module: |cffffddee%s|r took %d ms"):format(startup.name,t1)) end
		--if not self.db.profile.safe_startup then self:Debug("&startup Startup module: %s in %d ms",name,t1) end
		--if self.db.profile.safe_startup then t=debugprofilestop() yield("Finished startup module: "..name..(" in %d ms"):format(t1))
		--elseif debugprofilestop()-t>100 then t=debugprofilestop() yield("(startup modules up to "..i..")") end

		if debugprofilestop()-t>timeleft then t=debugprofilestop() timeleft=yield("(startup module: "..startup.name..")",progress,msg) or timeleft end  -- caught by @coro_startup

	until coroutine.status(startup.thread)=="dead"

	self:Debug("&startup Starting module: |cffddffaa%s|r done in |cffffddee%d|rms.",startup.name,debugprofilestop()-t0)
end

GQ.startups_late = {}

local function _StartupThread()
	local self=GQ
		
	waitformaint("maint_startup_01") ----------------------------------
	
	self.loading="Loading..."

	--self.registeredmapspotsets = {}
	waitformaint("maint_startup_pointer") ---------------------


	if self.Pointer then self.Pointer:Startup() end
	if self.Foglight then self.Foglight:Startup() end
	GQ.LibTaxi:Startup(GQ.db.char.taxis)

	GQ.HBD:FixPhasedContinents()
	
	waitformaint("maint_startup_modules") ---------------------

	if GQ.db.profile.debug and ChatFrame1 and ChatFrame1.SetMaxLines then ChatFrame1:SetMaxLines(2000) end

	local popup = GQ.PopupHandler:NewPopup("GenericPopup","default")


	yield("Before startups.")

	-- startup 'modules'
	GQ.Profiler:Start("startup-total")
	GQ.Profiler:Stop("startup-total")
	for i,startup in ipairs(self.startups) do
		if type(startup)=="table" then  startup.name,startup.func=unpack(startup)
		elseif type(startup)=="function" then  self.startups[i]={name="unnamed("..i..")",func=startup}  startup=self.startups[i]  end
		if type(startup.after)=="string" then startup.after={startup.after} end
	end
	local function startup_is_done (s)
		for i,startup in ipairs(self.startups) do  if startup.name==s or startup.id==s then return startup.done end  end
	end
	local function all_done (a)
		for i,v in ipairs(a) do  if not startup_is_done(v) then return false end  end
		return true
	end
	
	GQ.postcombatmode = GQ:IsPlayerInCombat()
	local function run_startup_cycle(phase)
		local done=0
		for i,startup in ipairs(self.startups) do  if not startup.done then
			if (not startup.postcombat or phase=="postcombat" or not GQ.postcombatmode) and (not startup.after or all_done(startup.after)) then
				GQ:StartupModule_Threaded(startup)  -- may yield, then @coro_startup catches
				startup.done=true
				done=done+1
			else
				self:Debug("&startup Module |cffddffaa%s|r |cffffee88awaits|r |cffddffaa%s|r",startup.name,(startup.after and table.concat(startup.after,",")) or (startup.postcombat and "post combat"))
			end
		end end
		return done
	end

	--- Run a full round of startups, until nothing new starts up, or 20 cycles pass. Name irrelevant.
	--- @param phase string - just for the logs
	local function run_startup_phase(phase)
		for cycles=1,20 do
			yield("Startup cycle "..phase..": "..cycles)
			local done=run_startup_cycle(phase)
			if done==0 then yield("Nothing done, ending cycles") break end
		end
	end

	--- Simulate a completed startup phase for other phases to wait for with "after="
	--- @param flag string name of phase
	local function set_startup_flag(flag)
		tinsert(self.startups,{id=flag,func=function() end,done=true})
	end


	run_startup_phase("before_guides") ------------------


	GQ.Profiler:Start("startup-total")
	GQ.Profiler:Stop("startup-total")

	self:Debug("&startup Startup modules (early) are done.")

	-- fast start!
	self:SetVisible(nil,self.db.profile.enable_viewer)
	self:UpdateFrame(true)
	--self:UpdateGuideMenuButton()

	self:Debug("&startup Loading guides...")
	waitformaint("maint_startup_loadguides") ----------------------------

	self:Startup_LoadGuides_Threaded()  -- may yield, then @coro_startup catches

	self:Debug("&startup Guides loaded. ---------")

	--[[
	self:Debug("Caching follow-ups...")
	self:CacheMentionedFollowups()
	self:Debug("Cached.")
	yield(1)
	--]]

	-- wait for asyncs to finish
	--while #GQ.startup_async_threads and not GQ.startup_async_threads.alldead do yield("waiting for asyncs...") end

	set_startup_flag("guides_loaded")
	run_startup_phase("after_guides")

	set_startup_flag("all")
	run_startup_phase("after_all")

	self.completiontimer = self:ScheduleRepeatingTimer("TryToCompleteStep", 0.1)
	self.maptimer = self:ScheduleRepeatingTimer("CacheCurrentMapID", 1.0)

	self:SendMessage("GQ_GUIDES_PARSED", "done")

	if not GQ.db.profile.delayed_startup then
		self:LoadInitialGuide()
	end

	self:SendMessage("GQ_INITIAL_GUIDE_LOADED")
	-- If player is in combat, show a warning and wait for combat to end, since it breaks Pointer.
	if GQ:IsPlayerInCombat() then
		if not displayedInCombatWarning then
			self:Print("You are in combat! GoatQuest will resume loading when you're safe again.")
			displayedInCombatWarning = true
		end
		while GQ:IsPlayerInCombat() do
			yield("Startup cycle - waiting for post combat")
		end
	end 
	
	run_startup_phase("postcombat")
	
	for i,startup in ipairs(self.startups) do  if not startup.done then  error("Startup: "..startup.name.." still not done!!!") end  end
	
	-- markers will not show naturally, since their code was already called while pointer was still not loaded, so they had no waypoints. 
	-- if we did show combat startup warning, we know we had to pause, so lets force the markers to show up
	if displayedInCombatWarning then GQ.Pointer:ShowMapMarkers() end

	self.startups=nil  -- clear out, save memory

	self:Debug("&startup Startup modules (late) are done.")


	waitformaint("maint_startup_final") ----------------------------

	self.loading="Cleaning up..."
	--collectgarbage("step",10000)
	--yield("garbage collected? why?")

	--self.MagicKey:CreateFrame()
	--self.magickeytimer = self:ScheduleRepeatingTimer("SetMagicKey", 0.2)

	self.pause = true


	--if self.DEV then self:ScheduleRepeatingTimer("ThunderStageForceUpdate", 10.0) end -- TEMPORARY TIMING OF THUNDER ISLE

	--self.notetimer = self:ScheduleRepeatingTimer("ShowWaypoints", 1)
	--self.dailytimer = self:ScheduleRepeatingTimer("QuestTracking_ResetDailies", 5)

	--self:CancelTimer(self.startuptimer,true)


	--while self.LibRover and self.LibRover.startup_thread and not self.LibRover.ready do yield("waiting for Travel") end
	--while self.ItemScore and self.ItemScore.GearFinder and self.ItemScore.GearFinder.started and not self.ItemScore.GearFinder.cached do yield("waiting for GearFinder") end

	

	self:Print(L['welcome_guides']:format(#self.registeredguides))
	if #self.registeredguides==0 then
		self:Print("No guides loaded. Check that your GoatQuest installation includes its guide files.")
	end

	self.Checklist:CatchEvent("_GUIDES_LOADED_")

	self:SetVisible(nil,self.db.profile.enable_viewer) -- didn't we do this already?
	self:UpdateFrame(true)

	if not self.db.profile.ranconfig2 then
		self.Config:Run()
	end



	self:Debug("&startup Loading time - guides: %.2f",self.startuptimes["Loading guides"] or -1)
	self:Debug("&startup Loading time - DEV: %.2f",self.loading_time_DEV or -1)
	self:Debug("&startup Loading time - total: %.2f",self.startuptimes["Loading libs"]+self.startuptimes["Loading guides"]+self.startuptimes["Loading code"])

	--collectgarbage()
	self.pause = nil
	return ("end")  -- VS Code Lua extension breaks on "return 'end'", unbelievable
end

-- This gets called every frame on startup, by MasterFrame. Needs to return true to confirm successful startup.
local thread
local startup_time=0
local startup_frames,startup_ticks=0,0
local last_gettime
local displayedInCombatWarning = false


GQ.startuptimes={}
GQ.startuptimes.index={}
function GQ.startuptimes:View()
	local ret = {}
	for i,t in ipairs(self.index) do tinsert(ret,("%s = %.3f ms"):format(t,self[t])) end
	return ret
end
function GQ.startuptimes:Add(k,v)
	self[k]=(self[k] or 0)+v
end
setmetatable(GQ.startuptimes,{__newindex=function(t,k,v) tinsert(t.index,k) rawset(t,k,v) end})


GQ.startuptimestamps={}
function GQ.startuptimestamps:View()
	local ret = {}
	for k,t in pairs(self) do if tonumber(t) then tinsert(ret,{k,t}) end end
	sort(ret,function(a,b) return a[2]<b[2] end)
	local ret2={}
	for i,v in ipairs(ret) do ret2[i]=("%d (+%d): %s"):format(v[2],(i>1) and (v[2]-ret[i-1][2]) or 0,v[1]) end
	return ret2
end
function GQ.startuptimestamps:Punch(name,time)
	self[name]=time or debugprofilestop()
end

function GQ:ViewStartupTimes()
	return {timestamps=GQ.startuptimestamps:View(),times=GQ.startuptimes:View()}
end


local lastret,lastrettime=0,0
local lastprogress=-1
function GQ:StartupStep()  -- called from MasterFrame
	-- Startup creates secure buttons and may span frames. Pause if combat begins between yields.
	if InCombatLockdown() then return false end
	if not last_gettime then last_gettime=GetTime() end
	if last_gettime==GetTime() then return end  -- ah-ha, NOT loaded then!
	if GQ.IsRetail then
		if (UnitExists("player") and UnitInVehicle("player")) then self.loading_screen_disabled = true end -- Blizz... if we are in vehicle, loading_screen_disabled will never fire after loading
	end

	if UnitExists("player") then self.loading_screen_disabled=true end
	if not self.loading_screen_disabled then return end

	
	if not thread then
		thread = coroutine.create(_StartupThread)
		self:Debug("&startup Startup thread created.")
		return
	end

	startup_frames = startup_frames + 1

	local thistime=0
	local thisframet = debugprofilestop()
	if self.db.profile.debug_detailedstartup then self:Debug("&startup Startup frame %d...",startup_frames) end

	if GetFramerate()<40 then GQ.STARTUP_INTENSITY=5
	elseif GetFramerate()<60 then GQ.STARTUP_INTENSITY=10
	else GQ.STARTUP_INTENSITY=20 end
	if GQ.db.profile.loadguidesfully then GQ.STARTUP_INTENSITY=100 end -- loadfully is allowed to be slow
	if GQ.db.profile.loadguidesfully and GQ.loadprogress and GQ.loadprogress-lastprogress>0.05 then GQ:Print(("Loading... %d%%"):format(GQ.loadprogress*100))  lastprogress=GQ.loadprogress  end

	while debugprofilestop()-thisframet<self.STARTUP_INTENSITY do
		local t = debugprofilestop()

		local good,msg,progress,msg2 = resume(thread,max(0,self.STARTUP_INTENSITY-debugprofilestop()+thisframet))  -- THIS IS WHERE STARTUP THINGS HAPPEN. yield: msg,progress,msg2  -- @coro_startup
		t = debugprofilestop()-t	startup_ticks = startup_ticks + 1	startup_time=startup_time + t
		if self.db.profile.debug_detailedstartup or lastret~=msg then
			self:Debug("&startup &_SUB0 Startup frame %d tick %d |cffeeff88%s|r (%s%d%%) took |cffffeeaa%d|rms",startup_frames,startup_ticks,tostring(msg),msg2 and msg2.."; " or "",progress or 100,t)
			lastret=msg
			lastrettime=GetTime()
		end
		if GetTime()-lastrettime>STARTUP_SPAM_FREQUENCY then lastret=nil end

		self.startuptimes[msg or "?"]=(self.startuptimes[msg or "?"] or 0) + t

		if not good then
			self.loading=nil
			self:Print("ERROR initializing, check the Lua errors and report them, please.")
			error("ERROR in startup frame ".. startup_frames ..": ".. tostring(msg) .."\nin\n".. debugstack(thread),2)
			GoatQuestFrameMaster:SetScript("OnUpdate",nil)
			break
		elseif status(thread)=="dead" then
			self:Debug("&startup COMPLETE!");
			self:Debug("&startup Startup complete in %.2f (%d ticks in %d frames)",startup_time,startup_ticks,startup_frames)
			self:Debug("&startup From file load to variables = %.2f",GQ.timestamp_initing-GQ.timestamp_loaded)
			self:Debug("&startup Total startup (realtime) = %.2f",debugprofilestop()-GQ.timestamp_initing)
			self.startuptimes['Total (realtime)']=debugprofilestop()-GQ.timestamp_initing
			self.startuptimes['Total (pure)']=startup_time
			self.loading=nil
			self.initialized = true
			self.db.profile.hide_dev_once = false
			GoatQuestFrameMaster:SetScript("OnUpdate",nil)
			break
		
		elseif msg and type(msg)=="string" and msg:find("waiting") then
			self:Debug("&startup Waiting: %s",msg)
		
			break
		
		elseif msg and msg==1 then
			self.master_forceupdate=true  -- that doesn't do anything anymore...
			self.loading=nil
			break
		else
			-- just happily continue
		end

		if self.db.profile.safe_startup then break end
	end
end

function GQ:LOADING_SCREEN_DISABLED()
	self:Debug("&events LOADING_SCREEN_DISABLED! Let's go!")
	self.startuptimestamps:Punch("loading_screen_disabled")
	self.loading_screen_disabled=true
end

function GQ:LOADING_SCREEN_ENABLED()
	self:Debug("&events LOADING_SCREEN_ENABLED! Freeze!")
	self.loading_screen_disabled=false
end

local temp_hidden
function GQ:CINEMATIC_START()
	temp_hidden = self.Frame:IsShown()
	self.Frame:Hide()
end
function GQ:CINEMATIC_STOP()
	self.Frame:SetShown(temp_hidden)
end

-- my event handling. Multiple handlers allowed, just for the heck of it.

-- Handler is either:
-- - function - called as f(event,...)
-- - string - called as self[f](event,...)
-- - table {obj,str} - called as obj[str](obj,event,...)
-- - table {obj,fun} - called as fun(obj,event,...)
-- - true - called as self[event](event,...)

local meta_newtables = {__index = function(tbl, key) tbl[key] = {} return tbl[key] end}
GQ.Events_Events=setmetatable({},meta_newtables)
function GQ:AddEventHandler(event,handler)
	tinsert(self.Events_Events[event],handler or true)
	if #self.Events_Events[event]==1 then self:RegisterEvent(event,"EventHandler_Events") end
	return handler
end

GQ.Events_Messages=setmetatable({},meta_newtables)
function GQ:AddMessageHandler(event,handler)
	tinsert(self.Events_Messages[event],handler or true)
	if #self.Events_Messages[event]==1 then self:RegisterMessage(event,"EventHandler_Messages") end
	return handler
end

local function _RemoveHandler(tab,removehandler)
	for num,handler in ipairs(tab) do
		if handler == removehandler then
			return tremove(tab,num)
		end
	end
end

function GQ:RemoveEventHandler(event,removehandler)
	return _RemoveHandler(self.Events_Events[event],removehandler)
end

function GQ:RemoveMessageHandler(event,removehandler)
	return _RemoveHandler(self.Events_Messages[event],removehandler)
end


local handleit = function(self,handler,event,...)
	if type(handler)=="function" then  -- call given function
		handler(self,event,...)
	elseif type(handler)=="string" then  -- call function in self by name
		assert(self[handler],"No function "..handler.." in event handler object!")
		self[handler](self,event,...)
	elseif type(handler)=="table" then  -- call method in object, given as {object,"method"} or {object,object.function}
		local obj,call = unpack(handler)
		if type(call)=="string" then
			local fun=obj[call]
			assert(fun,"No function "..call.." in given object!")
			fun(obj,event,...)
		elseif type(call=="function") then
			call(obj,event,...)
		end
	elseif handler==true then  -- call self:EVENT_NAME
		assert(type(self[event])=="function","No function "..event.." in event handler!")
		self[event](self,event,...)
	else
		error("What's "..tostring(handler).."? Not a valid message/event handler!")
	end
end
function GQ:EventHandler_Events(event,...)
	for i,handler in ipairs(self.Events_Events[event]) do
		handleit(self,handler,event,...)
	end
end
function GQ:EventHandler_Messages(event,...)
	for i,handler in ipairs(self.Events_Messages[event]) do
		handleit(self,handler,event,...)
	end
end



local UpdateCentral_Mixin = {}

function UpdateCentral_Mixin:AddHandler(handler)
	if type(handler)~="function" then error("Update handler "..tostring(handler).." is not a function") end
	tinsert(self.UpdateHandlers,handler)
end

function UpdateCentral_Mixin:RemoveHandler(removehandler)
	for num,handler in ipairs(self.UpdateHandlers) do
		if handler == removehandler then
			tremove(self.UpdateHandlers,num)
			return
		end
	end
end

function UpdateCentral_Mixin:AddHiding(object)
	if type(object)~="table" then error("Hiding handler "..tostring(object).." is not a frame") end
	GQ:ScheduleTimer(function() 
		for num,obj in ipairs(self.HideObjects) do 
			if obj == object then return end
		end

		tinsert(self.HideObjects,object) 
	end,0)
end

function UpdateCentral_Mixin:RemoveHiding(removeobject)
	if type(removeobject)~="table" then error("Hiding handler "..tostring(removeobject).." is not a frame") end
	for num,object in ipairs(self.HideObjects) do
		if object == removeobject then
			tremove(self.HideObjects,num)
			return
		end
	end
end

function UpdateCentral_Mixin:OnUpdate(elapsed)
	for i,handler in ipairs(self.UpdateHandlers) do
		handler(elapsed)
	end
end

function UpdateCentral_Mixin:OnEvent(event)
	if event=="GLOBAL_MOUSE_UP" then -- special handler for GMU
		for i,object in ipairs(self.HideObjects) do
			if object and object:IsVisible() and not object:IsMouseOver() then object:Hide() end
		end
	end
end

function UpdateCentral_Mixin:Init()
	self.UpdateHandlers = {}
	self.HideObjects = {}
	self:SetScript("OnUpdate",self.OnUpdate)
	self:SetScript("OnEvent",self.OnEvent)
	if C_EventUtils.IsEventValid("GLOBAL_MOUSE_UP") then
		self:RegisterEvent("GLOBAL_MOUSE_UP") -- we always track GMU to handle frame hiding. 
	end
end

GQ.UpdateCentral = Mixin(CreateFrame("FRAME"),UpdateCentral_Mixin)
GQ.UpdateCentral:Init()

--GQ.UpdateCentral:AddHandler(function() print(GetTime()) end)


function GQ:ForceReloadInitialGuide()
	self.CurrentGuide=nil
	self.db.char.guidename=nil
	self.db.char.step=nil
	self.db.char.tabguides=nil
	self.db.char.unloadedguide=nil
	
	ReloadUI()
end

function GQ:LoadInitialGuide(fastload)
	--if not self.guidesloaded then self:ErrorThrow("Guides failed to load! Cannot load initial guide.") return end
	-- Keep archived category progress saved, but do not restart its disabled systems.
	local savedGuide = self.db.char.guidename
	if self.GuideOnly and savedGuide and self.GuideCategories
		and not self.GuideCategories[savedGuide:match("^[^\\]+")]
		and not self.CurrentGuide then
		self.Frame:SetSpecialState("select")
		return
	end
	if self.CurrentGuide then 
		self.Frame:SetSpecialState("normal")
		return 
	end

	--if self.db.char["starting"] then
	if GQ.db.char.maint_startup_startguide then
		if self.db.char.guidename and string.find(self.db.char.guidename,"GOLD\\Crafting\\") then
			if GQ.Goldguide then
				if GQ.db.char.goldguide_crafting_guides[1] then
					local chore = GQ.db.char.goldguide_crafting_guides[1].chore
					setmetatable(chore,{__index=GQ.Goldguide.Crafting})
					--chore:GetRecipeReagents()
					GQ.Goldguide.Crafting.GenerateGuide(chore)
				end
			else
				GQ.Gold.generate_guide()
			end
		else
			GQ:Debug("&startup Loading initial guide: %s step %d",self.db.char.guidename or "?",self.db.char.step or 0)
			self:SetGuide(self.db.char.guidename,self.db.char.step)
		end

		if GQ.db.char.unloadedguide then 
			self.Frame:SetSpecialState("select")
		elseif not self.CurrentGuide and not fastload then
			if self.db.char.tabguides and next(self.db.char.tabguides) then -- try loading one of existing tabs first
				local _,guidedata = next(self.db.char.tabguides)
				self:SetGuide(guidedata.title,guidedata.step)
			else -- look for starter guide
				self:Print("Finding proper starter section.")
				local gs = self:FindSuggestedGuides("LEVELING")['LEVELING']
				if not gs or #gs==0 then
					self.Frame:SetSpecialState("select")
					self:Print("No guides suggested for your char. Please open guide menu and select the guide you want to use.")
				elseif #gs==1 then
					self:SetGuide(gs[1])
				else --many
					local exclusion_max=-1
					local topguide
					for gi,guide in ipairs(gs) do
						local excl = guide.condition_suggested_exclusive
						if not excl then excl=0 elseif excl==true then excl=1 end
						if excl>exclusion_max then 
							exclusion_max = excl
							topguide = guide
						end
					end
					self:SetGuide(topguide)
				end
				--self.db.char["starting"] = false
			end
		end
	end

	self:QuestTracking_CacheQuestLog("LoadInitialGuide")  -- just in case it didn't get cached before.

	self.frameNeedsResizing = 1
	self:AlignFrame()
	self:UpdateFrame(true)
end

GQ.GuideTitles = {
	["SUGGESTED"]=L['guidepicker_suggested'],["RECENT"]=L['guidepicker_recent'],["SEARCH"]=L['guidepicker_searchresults'],
	["LEVELING"]=L['guidepicker_leveling'] ,
	["EVENTS"]=L['guidepicker_events'] ,
	["DAILIES"]=L['guidepicker_dalies'] ,
	["LOREMASTER"]=L['guidepicker_loremaster'] ,
	["GOLD"]=L['guidepicker_gold'] ,
	["PROFESSIONS"]=L['guidepicker_professions'] ,
	["PETSMOUNTS"]=L['guidepicker_pets'] ,
	["ACHIEVEMENTS"]=L['guidepicker_achievements'] ,
	["TITLES"]=L['guidepicker_titles'] ,
	["REPUTATIONS"]=L['guidepicker_reps'] ,
	["MACROS"]=L['guidepicker_macros'] ,
	["DUNGEONS"]=L['guidepicker_dungeon'] ,
	["GEAR"]=L['guidepicker_gear'] ,
}
setmetatable(GQ.GuideTitles,{__index=function(i,v) return v end})

function GQ:GetGuideByTitle(title)
	if not title then return end
	local ident = title:match("id:(.*)")

	if ident and GQ.RegisteredGuidesByIdent[ident] then
		title = GQ.RegisteredGuidesByIdent[ident]
	end


	title = GQ:SanitizeGuideTitle(title)  -- code-side fix for "common" guides.
	for i,v in ipairs(self.registeredguides) do
		if v.title==title then return v end
	end
end



-- ###########################################################################################################################################################
-- ###########################################################################################################################################################



GQ.StepHistory = {}

function GQ.StepHistory:Prune()
	local _gsh = GQ.db.char.guidestephistory   if not _gsh then return end

	local to_remove={}
	for guide,history in pairs(_gsh) do
		if time()-(history.lasttime or 1548000000) > 86400*180  or  guide:find("SHARED\\")  then -- 6 months old, or it's a shared guide that shouldn't've been recorded here anyway
			tinsert(to_remove,guide)
		end
	end
	for i,guide in ipairs(to_remove) do _gsh[guide]=nil end
end

function GQ.StepHistory:AddGuide(name)
	local _gsh = GQ.db.char.guidestephistory
	_gsh[name] = _gsh[name] or {}
	local _gshn=_gsh[name]
	if _gshn[1] then _gsh[name]={['steps']=_gshn} _gshn=_gsh[name] end  -- convert old data
	_gshn.steps = _gshn.steps or {}
	_gshn.lasttime = time()
	return _gshn
end

function GQ.StepHistory:AddStep(name,num)
	local _gshns = GQ.db.char.guidestephistory[name].steps
	if _gshns[#_gshns]~=num then
		tinsert(_gshns,num)
	end
end

function GQ.StepHistory:GetPreviousValidStep(name)
	local step
	local _gshns = GQ.db.char.guidestephistory[name].steps
	local hlen = #_gshns
	local stepnum
	local backed=0
	local okaytostay
	repeat
		-- pop stepnum from history
		stepnum = _gshns[hlen-backed]

		-- valid number?
		if stepnum then
			-- history popped 'pop'erly, hurr durr

			-- get the step
			local s = GQ.CurrentGuide.steps[stepnum]
			if s then
				backed = backed + 1
				step = s
			end
		else
			-- we broke history or it just ran out, whatever

			GQ:Debug("step history broken, omg")


			-- TODO: Currently, when running out of history, we default to the first valid of the guide. Needs a message / confirmation.

			local s = GQ.CurrentGuide:GetFirstValidStep()  -- always returns something, or breaks.
			if s then
				backed = hlen  -- rewind it all
				step = s
				okaytostay = true
			end
		end
	until step:AreRequirementsMet() and (step~=GQ.CurrentStep or okaytostay)
	return step,backed
end

function GQ.StepHistory:Back(name,num)
	local _gshns = GQ.db.char.guidestephistory[name].steps
	local step
	for i=1,num do step=tremove(_gshns) end
	return step
end

function GQ.StepHistory:HasHistory(name)
	local _gshns = GQ.db.char.guidestephistory[name].steps
	return _gshns and #_gshns>0
end



-- ###########################################################################################################################################################
-- ###########################################################################################################################################################



function GQ:SetGuide(name,step,source,silent,prevguide)
	if not name then return end

	-- if we already had something active, gracefully exit it
	if GQ.CurrentStep then
		GQ.CurrentStep:OnLeave()
	end

	step=step or 1
	--self:Debug("SetGuide "..name.." ("..tostring(step)..")")

	GQ.db.char.guideTurnInsOnly = false
	--[[ -- tabs say no more auto cleanup
	if GQ.db.char.forceCleanUp then
		GQ:ShowQuestCleanup(true) -- true = automated, will not show popup if there are no quests to abandon
		GQ.db.char.forceCleanUp = false
	end
	--]]

	local guide
	if type(name)=="number" then
		local num = name
		if self.registeredguides[num] then
			guide = self.registeredguides[num]
		else
			self:Print("Cannot find guide number: "..num,nil,"FORCE")
			--return false
		end
	elseif type(name)=="string" then
		-- Accept guide paths with or without the product-name prefix.
		name = name:gsub("^GoatQuest's ","")
			:gsub("^Alliance ",""):gsub("^Horde ","")

		guide = self:GetGuideByTitle(name)
		if not guide then
			self:Print("Cannot find guide: "..name,nil,"FORCE")
			self:Debug("Cannot find guide: %s",name)
			return false
		end
	else
		guide=name  --omg, object
	end

	--if guide.is_stored then guide = self.db.global.storedguides[name] end

	local err

	self:Debug("&startup SetGuide to %s",guide.title)

	if guide then
		if prevguide ~= nil then
			if not GQ.GuideFuncs:IsValid(guide,step,"rating",nil,nil,prevguide) then return end
		else
			if not GQ.GuideFuncs:IsValid(guide,step,source or "setguide") then return end
		end

		-- unload guides
		if self.CurrentGuide and self.CurrentGuide~=guide then 
			self.CurrentGuide:Unload() 
		end

		guide:ParseHeader()
		guide:Parse(true)

		if guide.steps then
			--self.MapNotes = _G["GoatQuestGuides_"..faction.."Mapnotes"]
			local name = guide.title

			self.CurrentGuide = guide
			self.CurrentGuideName = name
			self.db.char.guidename = name

			self.StepHistory:Prune()
			self.StepHistory:AddGuide(name)


			-- History support moved to tabs:AssignGuide

			self.CurrentStep = nil
			self.CurrentStepNum = nil

			self.LastSkip = 1

			if guide.headerdata.singlestep then step=guide.headerdata.singlestep end

			local stepobj = guide:GetFirstValidStep(step) -- make sure it's valid
			if stepobj then
				--self:QuestTracking_ResetDailies(true)
				name=name:gsub(self.CurrentGuide.type,GQ.GuideTitles[self.CurrentGuide.type]) -- make LEVELING-Leveling and such.
				
				 -- don't announce switched world quest guides
				if not silent then self:Print(L["message_loadedguide"]:format(name,step)) end
				self:Debug("&step Guide loaded: %s",name)

				self:SendMessage("GQ_GUIDE_LOADED",guide.title)

				-- History support moved to tabs:AssignGuide

				self:FocusStep(stepobj.num,true)

				GQ.Tabs.AddButton:UnlockHighlight()
			else
				err = "No valid steps!"
			end
		else
			err = "Guide not parsed"
		end
	else
		err = L["message_missingguide"]:format(name)
	end

	if err then
		self:Print("Unable to load guide "..guide.title..": "..err)
		self.db.char['guide'] = nil
		self.db.char['step'] = nil
		self.CurrentGuide = nil
		self.CurrentStep = nil
	end

	if self.CurrentGuide and not self.CurrentGuide.headerdata.shared and self.Sync:IsSlave() then  -- disable slave mode if user picks another guide
		self:Debug("&sync Guide changed to not shared, deactivating slave mode.")
		self.Sync:Deactivate()
	elseif self.CurrentGuide and self.CurrentGuide.headerdata.shared and not self.Sync:IsSlave() then 
		self:Debug("&sync Guide changed to shared, reactivating slave mode")
		self.Sync:ActivateAsSlave()
	end

	self.pause = nil
	self.completioninterval = self.completionintervaldefault

	-- Clear info about guide that was set to set to turn-ins-only mode 
	self.db.char.guideTurnInsOnly = false

	self:UpdateFrame(true)

	GQ.ProgressBar:Update()
	GQ.Tabs:UpdateCurrentTab("guidechange",step)
end

---@param typ GuideType
function GQ:FindSuggestedGuides(typ)
	local suggested={} ---@type { [GuideType]:Guide[]}
	local suggroups={} ---@type { [string]:Guide[]}
	local scope = typ and self.registered_guide_types[typ] or self.registeredguides
	for i,guide--[[@type Guide]] in ipairs(scope) do
		local status=guide:GetStatus()
		if status=="SUGGESTED" then
			if not suggested[guide.type] then suggested[guide.type]={} end
			tinsert(suggested[guide.type],guide)
		end
		if guide.sugGroup and (status=="VALID" or status=="SUGGESTED") then
			if not suggroups[guide.sugGroup] then suggroups[guide.sugGroup]={} end
			tinsert(suggroups[guide.sugGroup],guide)
		end
	end
	return suggested,suggroups
end

function GQ:ForeachInGuidesAsync(guides,callback,progress,done)
	local function work()
		for i,guide in ipairs(guides) do
			callback(guide)
			if i%100==0 then  if progress then progress(i) end  yield() end
		end
	end
	local coro = coroutine.create(work)
	C_Timer.NewTicker(0.01,function(ticker)
		local d1 = debugprofilestop()
		repeat
			print("rep")
			resume(coro)
		until status(coro)=="dead" or (debugprofilestop()-d1>0.05)
		if status(coro)=="dead" then ticker:Cancel() done() end
	end,999)
end

function GQ:ForeachInGuidesAsync2(guides,callback,progress,done)
	self.Promise:New():Defer(function(success,failure)
		local d1 = debugprofilestop()
		for i,guide in ipairs(guides) do
			callback(guide)
			if i%10==0 then
				if debugprofilestop()-d1>0.05 then  if progress then progress(i) end  yield() end
				d1 = debugprofilestop()
			end
		end
		success()
	end):Then(done)
end

function GQ:FindSuggestedGuidesAsync(typ)
	local suggested={} ---@type { [GuideType]:Guide[]}
	local suggroups={} ---@type { [string]:Guide[]}
	local scope = typ and self.registered_guide_types[typ] or self.registeredguides
	self:ForeachInGuidesAsync(scope,function(guide)
		local status=guide:GetStatus()
		if status=="SUGGESTED" then
			if not suggested[guide.type] then suggested[guide.type]={} end
			tinsert(suggested[guide.type],guide)
		end
		if guide.sugGroup and (status=="VALID" or status=="SUGGESTED") then
			if not suggroups[guide.sugGroup] then suggroups[guide.sugGroup]={} end
			tinsert(suggroups[guide.sugGroup],guide)
		end
	end,print,function() Spoo{suggested,suggroups} end)
end

function GQ:FindSuggestedGuidesAsync2(typ)
	local suggested={} ---@type { [GuideType]:Guide[]}
	local suggroups={} ---@type { [string]:Guide[]}
	local scope = typ and self.registered_guide_types[typ] or self.registeredguides
	self:ForeachInGuidesAsync2(scope,function(guide)
		local status=guide:GetStatus()
		if status=="SUGGESTED" then
			if not suggested[guide.type] then suggested[guide.type]={} end
			tinsert(suggested[guide.type],guide)
		end
		if guide.sugGroup and (status=="VALID" or status=="SUGGESTED") then
			if not suggroups[guide.sugGroup] then suggroups[guide.sugGroup]={} end
			tinsert(suggroups[guide.sugGroup],guide)
		end
	end,print,function() Spoo{suggested,suggroups} end)
end

function GQ:GetGuideFolderInfo(folder)
	local suggest
	for i,guide in ipairs(folder.guides) do
		if guide.GetStatus and guide:GetStatus()=="SUGGESTED" then suggest=true end
	end
	if not suggest then
		for i,group in ipairs(folder.groups) do
			if self:GetGuideFolderInfo(group) then suggest=true end
		end
	end
	return suggest
end

-- function GQ:SearchForCompleteableGoal() --removed

function GQ:ClearRecentActivities()
	if not self.recentlyVisitedCoords then --First time, intialize them all as tables
		self.recentlyVisitedCoords = {}
		self.recentlyCompletedGoals = {}
		self.recentlyChangedGoals = {}
		self.recentlyCompletedQuests = {} --only for instant repeatables, which sucks.
		self.recentlyAcceptedQuests = {}
		self.recentlyStickiedGoals = {}
		self.recentGoalProgress = {}
		self.recentCooldownsPulsing = {}
		self.recentCooldownsStarted = {}
		self.recentlyHomeChanged = false
		self.recentlyDiscoveredFlightpath = false
		self.recentlyLearnedRecipes = {}
		self.recentKills = {}
	else --wipe them. Creating them new every time is silly.
		wipe(self.recentlyVisitedCoords)
		wipe(self.recentlyCompletedGoals)
		wipe(self.recentlyChangedGoals)
		wipe(self.recentlyCompletedQuests) --only for instant repeatables, which sucks.
		wipe(self.recentlyAcceptedQuests)
		wipe(self.recentlyStickiedGoals)
		wipe(self.recentGoalProgress)
		wipe(self.recentCooldownsPulsing)
		wipe(self.recentCooldownsStarted)
		self.recentlyHomeChanged = false
		self.recentlyDiscoveredFlightpath = false
		wipe(self.recentlyLearnedRecipes)
		wipe(self.recentKills)
		-- self.completedQuestTitles = {} -- let's not use this anymore, with GetQuestID available
	end
	self.step_share_onceflag = nil
end

function GQ:FocusStep(num,forcefocus)
	LibRover:BoatLockDisable("stepchange")
	if type(num)=="string" and self.CurrentGuide.steplabels then local s=num  num=self.CurrentGuide.steplabels[num]  if num then num=num[1] end  self:Debug("&step FocusStep: %s = %s",s,tostring(num))  end
	if type(num)=="table" then num=num.num end
	if not num or num<=0 then return end
	if not self.CurrentGuide then return end
	if not self.CurrentGuide.steps then return end
	if num>#self.CurrentGuide.steps then return end
	if self.CurrentGuide.headerdata.singlestep then num=self.CurrentGuide.headerdata.singlestep end

	--[[ CreatureViewer removal, 7.0
	GQ.CreatureViewer.models={}
	GQ.CreatureViewer.Frame:Hide()
	--]]
	local quiet
	self:Debug("&step FocusStep %d%s",num,(quiet and " (quiet)" or ""))

	if self.CurrentGuide.type ~= "SHARED" then  -- don't store history for those, it just doesn't work
		-- Record step into history
		if self.LastSkip>0 and self.CurrentStep then
			self.StepHistory:AddStep(self.CurrentGuide.title,self.CurrentStep.num)
			if self.db.char.guides_history[1] and self.db.char.guides_history[1][1]==self.CurrentGuide.title then
				self.db.char.guides_history[1][2]=self.CurrentStep.num
			end
		end
	end

	local prevFocus = (self.CurrentStep and self.CurrentStep.isFocused) or (not self.CurrentStep and true)

	-- clear previous step report label
	local prevguide,prevnum = (self.CurrentStep and self.CurrentStep.parentGuide.title),self.CurrentStepNum
	if self.CurrentStep then
		self.CurrentStep.reportlabel = nil
		self.CurrentStep:OnLeave()
	end

	self.CurrentStepNum = num
	self.db.char.step = num
	self.CurrentStep = self.CurrentGuide.steps[num]
	self.CurrentGuide.CurrentStepNum = num

	if self.CurrentStep.score then
		if GQ.completionstreak<3 then
			GQ.BugReport.GuideRating:ShowGuideRating()
		else
			if not GQ.BugReport.GuideRating.NoRatingFrame then
				GQ.BugReport.GuideRating:CreateAltFrame()
				GQ.BugReport.GuideRating.NoRatingFrame:Show()
			elseif not GQ.BugReport.GuideRating.NoRatingFrame:IsVisible() then
				GQ.BugReport.GuideRating.NoRatingFrame:Show()
			end
		end
	else
		GQ.BugReport.GuideRating:HideRatingWidgets()
		if GQ.db.char.scoredguides[GQ.CurrentGuide.next] == "declined" then
			GQ.db.char.scoredguides[GQ.CurrentGuide.next] = nil
		end
	end

	local reportlabel = self.CurrentStep and GQ.QuestDB.GetStepTag and (GQ.QuestDB:GetStepTag(self.CurrentStep) or "").." " or ""
	reportlabel = reportlabel .. ("(From %s step %s, fast forward %s, skipping %s"):format(tostring(prevguide),tostring(prevnum),tostring(self.fastforward),tostring(self.skipping))

	if GQ.IsClassic or GQ.IsClassicTBC or GQ.IsClassicWOTLK or GQ.IsClassicCATA or GQ.IsClassicMOP then
		if GQ.CurrentGuide and (GQ.db.char.guideTurnInsOnly == GQ.CurrentGuide.title) then
			reportlabel = reportlabel .. ", guide in turnins only mode"
		end
			
		if (GQ.db.char.SISquests and GQ.db.char.SISguides) then
			local end_guide,end_step = GQ.db.char.SISdestination[1],GQ.db.char.SISdestination[2]
			reportlabel = reportlabel .. ", SIS running, destination "..end_guide.." step "..end_step
			if not GQ.db.char.SISguides[GQ.CurrentGuide.title] then
				reportlabel = reportlabel .. ", guide is not part of sis catchup"
			end
		end
	end	

	self.CurrentStep.reportlabel = reportlabel..")"

	self.Frame:StopFlashAnimation()  -- possibly prevent lines staying green from previous step

	if prevFocus or forcefocus then GQ:SetStepFocus(self.CurrentStep) end

	self:ClearRecentActivities()

	-- Whoa whoa. The step might load a different guide at this point! Play safe.
	local cs=self.CurrentStep
	local cg=self.CurrentGuide
	self.CurrentStep:PrepareCompletion(true)
	self.CurrentStep:OnEnter()

	if (cs~=self.CurrentStep) or (cg~=self.CurrentGuide) then self:Debug("&step FocusStep: guide or step changed! bailing.") return end

	self.stepchanged = true

	self.CurrentStep.zombiewalk = false

	for i,goal in ipairs(self.CurrentStep.goals) do
		if goal:IsComplete() then
			self.recentlyCompletedGoals[goal]=true
			goal:SaveStickyComplete()
		end

		if goal.zombiewalk then self.CurrentStep.zombiewalk=true end
	end

	GQ.Pointer:DoCorpseCheck() -- in case we need to handle zombiewalk
	
	local stepcomplete,steppossible = self.CurrentStep:IsComplete()
	if self.pause then
		if (self.db.profile.skipimpossible and not steppossible)
		--or (self.db.profile.skipobsolete and self.CurrentStep:IsObsolete())
		or (self.db.profile.skipauxsteps and self.CurrentStep:IsAuxiliarySkippable())
		then
			stepcomplete=true
			--self.pause=nil
		end
		self.LastSkip=1
		if not stepcomplete then
			self:Debug("unpausing")
			self.pause=nil
		end
	end
	--and self.LastSkip~=0) then self.AutoskipTemp=false else self.AutoskipTemp=true end


	-- add to last-guides history 
	--[[ Why? We do that it setguide, and we have set curret step already at the beggining of FocusStep
 	if not self.db.char.guides_history_GQ45clear then self.db.char.guides_history={} self.db.char.guides_history_GQ45clear=true end
	local history = self.db.char.guides_history
	local found
	for gi,guidestep in ipairs(history) do
		if guidestep[1]==self.CurrentGuide.title then guidestep[2]=self.CurrentStepNum found=1 break end
	end

	if not found then
		tinsert(history,{self.CurrentGuide.title,self.CurrentStepNum})
	end
	if #history>20 then tremove(history,1) end
	--]]

	-- TRACK QUESTS
	if GQ.db.profile.autotrackquests then
		for gi,goal in ipairs(cs.goals) do
			if goal.questid then self:TrackQuest(goal.questid) break end
		end
	end


	-- SANITIZE MAPS. In case there's zoning involved.
	if cs.map then cs.map=self.Pointer:SanitizePhase(cs.map) end
	for gi,goal in ipairs(cs.goals) do
		if goal.map then goal.map=self.Pointer:SanitizePhase(goal.map) end
	end


	-- pre-fetch the next step's translation, this seems like a good place to do it
	local nextstep,stepnum,guide=self.CurrentStep:GetNextStep()
	if nextstep then nextstep:Translate() end


	self:SendMessage("GQ_STEP_CHANGED",num)

	if not quiet then
		self:FocusStepUnquiet()
	end

	--self:TryToDisplayCreature()
	--self:UpdateMinimapArrow(true)

	--Hide goal image popup if it exists
	if GQ.GoalPopupImageFrame then
		GQ.GoalPopupImageFrame:Hide()
	end

	--Maybe show map preview
	if GQ.db.profile.preview and (not GetPlayerFacing() or GQ.db.char.fakeinstance) and GQ.db.profile.preview_control=="step" then
		GQ.PointerMap:ShowPreview()
	end

	if GQ.Gold.Appraiser and GQ.Gold.Appraiser.Loaded and GQ.Gold.Appraiser.AddGuideItemsToBuy then
		GQ.Gold.Appraiser:AddGuideItemsToBuy()
	end

	GQ.Tabs:UpdateCurrentTab("focus",num)

	-- if user changed guide/step, he may need to equip/dequip quest gear
	if not self.skipping then
		local goto_count = 0
		for gi,goal in ipairs(cs.goals) do
			if goal.map then goto_count=goto_count+1 end
		end
		if not (goto_count>0 and GQ.db.profile.pathfinding) then
		-- no travel lines, or travel disabled, librover will not trigger, so finalise step
			self:SendMessage("GQ_STEP_FINALISED")
		end
	end

	GQ.QuestDB:MaybeShowButton()

	GQ.Pointer:ShowMapMarkers()

	GQ:UpdateFrameStepSkipping()
	GQ.ClearRaidmarker()
end

function GQ:FocusStepQuiet(num)
	return self:FocusStep(num,true)
end

function GQ:FocusStepUnquiet()
	self.Frame:StopFlashAnimation()
	self.frameNeedsResizing = self.frameNeedsResizing + 1
	self:UpdateFrame(true)
	--self:ScrollToCurrentStep()

	--self:UpdateCartographerExport()  -- moved to Waypoints where it belongs.
	
	self:GetFocusedStep():ResetCurrentWaypoint()
	self:ShowWaypoints()

	--[[
	-- Stickies don't get waypoints now, as of 2015-06-18.
	local stickies = self:GetStickiesAt(nil)
	for _,sticky in ipairs(stickies) do
		if not sticky:IsComplete() or self.CurrentStep:IsComplete() then self:ShowWaypoints("sticky",sticky) end
	end
	--]]
end

function GQ:TrackQuest(id)
	if tonumber(GetCVar("autoQuestWatch"))==0 then return end
	if GQ.IsClassicCATA then return end -- SetSuperTrackedQuestID on cata crashes game
	if GQ.IsClassicMOP then return end -- and on classic mop as well

	local q = GQ.questsbyid[id]
	if not q or not q.inlog then return end
	-- Forever uses Classic map data but the modern, quest-ID-based watch API.
	local modernQuestWatch = C_QuestLog and type(C_QuestLog.GetQuestWatchType)=="function"
		and type(C_QuestLog.AddQuestWatch)=="function"
	if modernQuestWatch then
		if not C_QuestLog.GetQuestWatchType(id) then
			C_QuestLog.AddQuestWatch(id)
		end
	elseif type(IsQuestWatched)=="function" and type(AddQuestWatch)=="function" then
		if not IsQuestWatched(q.index) then
			AddQuestWatch(q.index)
			if WatchFrame_Update then WatchFrame_Update() end
		end
	end
	if C_SuperTrack and type(C_SuperTrack.SetSuperTrackedQuestID)=="function" then
		C_SuperTrack.SetSuperTrackedQuestID(id)
	elseif type(SetSuperTrackedQuestID)=="function" then
		SetSuperTrackedQuestID(id)
	end
	if modernQuestWatch and type(QuestPOIUpdateIcons)=="function" then
		QuestPOIUpdateIcons()
	end
end

function GQ:PointToQuest(map,id)
	local _,x,y,obj = QuestPOIGetIconInfo(id)
	if x and y then
		self.Pointer:SetWaypoint(map,x,y)
	end
end

-- return step = step obj
-- return backed = num of valid history skips
function GQ:GetPreviousValidStep()
	return self.StepHistory:GetPreviousValidStep(self.db.char.guidename)
end

function GQ:PreviousStep(fast,forcefocus)
	if not self.CurrentGuide then return end

	if self.completionstreak==0 then GQ.completioninterval=GQ.completionintervallong end  -- first skip

	-- reset completion timers
	lastcompletion=GetTime()
	self.completionelapsed=0

	self.LastSkip = -1
	self.lastskip_rec = -1

	self.autopause = IsAltKeyDown() and IsControlKeyDown()

	local guidename = self.db.char.guidename

	local step,backed = self:GetPreviousValidStep(guidename)
	if self.autopause then step=self.CurrentGuide.steps[self.CurrentStepNum-1] end  -- HACK.
	if not step then return end

	self:Debug("PreviousStep to %d%s",step.num,(fast and ' (fast)' or ''))

	-- drop 'backed' history states
	self.StepHistory:Back(guidename,backed)

	if not self.StepHistory:HasHistory(guidename) then
		self.fastforward = false
		self.skipping = false
		self.pause = true
	else
		self.fastforward = fast
		self.skipping = fast
		self.pause = not fast
		if fast then self:SendMessage("GQ_STARTED_SKIPPING") end
	end

	if self.autopause then self.pause=true self.fastforward=false end

	self:FocusStep(step,forcefocus)

	GQ.ProgressBar:Update()
end

function GQ:SkipStep(fast,hack,forcefocus) --Hack used for testing, forces showing endguide popup
	if not self.CurrentGuide then return end

	if self.completionstreak then GQ.completioninterval=GQ.completionintervallong end  -- first skip
	if GQ.Sync:IsSlave() then return end -- don't skip

	-- reset completion timers
	lastcompletion=GetTime()
	self.completionelapsed=0

	self.LastSkip = 1
	self.lastskip_rec = 1
	self.fastforward = fast
	self.skipping = fast
	if fast then self:SendMessage("GQ_STARTED_SKIPPING") end

	local nextstep

	self.autopause = IsAltKeyDown() and IsControlKeyDown()

	if self.autopause then  -- forced next+1 step
		nextstep=self.CurrentGuide.steps[self.CurrentStepNum+1]
		self.CurrentStep.needsreload=nil
	end  -- HACK.

	if self.CurrentStep.needsreload then return self:ReloadStep(fast) end

	if not nextstep and not hack then  -- when not forced, that is: usually.
		local nextstep2,stepnum,guide

		if fast and self.db.profile.instantskip then nextstep2,stepnum,guide=self.CurrentStep:GetNextCompletableStep() self:Debug("Next completable step is: %d",stepnum)
		else
			nextstep2,stepnum,guide=self.CurrentStep:GetNextValidStep()
			if nextstep2 then self:Debug("Next valid step is: %d",nextstep2.num)
			elseif guide then self:Debug("Next valid step is: %d in %s",stepnum,guide.title)
			else self:Debug("Next valid step: none!")
			end
		end  -- always returns a step, unless we're at the end.

		if guide then
			--print("ABOUT TO JUMP GUIDES to:",guide,stepnum)
			self:SetGuide(guide,stepnum)
			return
		end
		nextstep=nextstep2
	end

	self:Debug("SkipStep to %s%s",(nextstep and nextstep.num or "?"),(fast and ' (fast)' or ''))

	if (not nextstep or hack) and (not self.CurrentGuide.headerdata.poiloader) --[[or (self.CurrentStep and (self.CurrentStep.num == #self.CurrentGuide.steps))--]] then
		-- final step
		self.pause = true
		self.fastforward = false
		if self.skipping then self:SendMessage("GQ_STOPPED_SKIPPING") end
		self.skipping = false
		local nextguide
		if self.CurrentGuide.next then
			nextguide = GQ:GetGuideByTitle(GQ.CurrentGuide.next)
		end

	if nextguide and GQ.completionstreak>3 and not hack then
		GQ:SetGuide(GQ.CurrentGuide.next)
		end
		return
	end

	self.pause = not fast
	if self.autopause then self.pause=true end

	self:FocusStep(nextstep,forcefocus) -- simple enough
	self:UpdateFrame(true)

	--[[
	else
		-- last step! or something went wrong and GetNextValidStep couldn't find anything to hop onto.

		--if self.CurrentStep.num == #self.CurrentGuide.steps then  -- never mind! assuming loss of next step = end of guide. Wondering if this is safe... ~sinus 2011-08-16
			self.pause = true
			self.fastforward = false
			if self.CurrentGuide.next then
				if not self.NextGuidePopup then
					self.NextGuidePopup = GQ.PopupHandler:NewPopup("GoatQuestNextPopup","default")

					self.NextGuidePopup.noMinimize = 1 --Can not minimize this one
				end

				if self.NextGuidePopup.nextguide ~= self.CurrentGuide.next then
					self.NextGuidePopup.nextguide=self.CurrentGuide.next
					self.NextGuidePopup.OnAccept = function(self)
						GQ:SetGuide(GQ.NextGuidePopup.nextguide)
					end

					self.NextGuidePopup:SetText(L['dialog_nextguide']:format(self:GetShortGuideTitle(self.CurrentGuide.next)))
					self.NextGuidePopup:Show()
					self.NextGuidePopup.declinebutton:Show()
					self.NextGuidePopup.acceptbutton:Show()
					return
				end

				--self:SetGuide(self.CurrentGuide.next,1)
				--return
			elseif self.CurrentGuide.steps and #self.CurrentGuide.steps>1 then
				if not self.EndGuidePopup then
					self.EndGuidePopup = GQ.PopupHandler:NewPopup("GoatQuestEndPopup","default")
					
					self.EndGuidePopup.declinebutton:Hide()
					GQ.ChainCall(self.EndGuidePopup.acceptbutton)
						:ClearAllPoints()
						:SetPoint("BOTTOM",self.EndGuidePopup,"BOTTOM",0,5)

					self.EndGuidePopup.noMinimize = 1 --Can not minimize this one
				end

				self.EndGuidePopup:SetText(L['dialog_endguide'])
				self.EndGuidePopup:Show()
				return
			end
		--else
		--	error("Missed the end of the guide..?")
		--end
	end
	--]]

	GQ.ProgressBar:Update()
end

function GQ:NextGuide()

	local nextguide
	if self.CurrentGuide.next then
		nextguide = GQ:GetGuideByTitle(GQ.CurrentGuide.next)
	end

	if nextguide and GQ.db.profile.n_popup_enable and GQ.db.profile.n_popup_guides and not hack then
		nextguide:AdvertiseWithPopup()
	else GQ.GuideMenu:Show()
	end
end

function GQ:ReloadStep(fast)
	self.LastSkip=1
	self.pause = not fast
	self.fastforward = fast
	self.skipping = fast
	if fast then self:SendMessage("GQ_STARTED_SKIPPING") end
	self.CurrentStep.needsreload = nil
	self:FocusStep(self.CurrentStepNum)
end

--- A quest is 'interesting' if any follow-ups to it appear anywhere in the guides and they're not grey.
-- As of 3.1, no follow-ups are tracked.

--[[
local followupcache={}
function GQ:GetMentionedFollowups(questid)
	if followupcache[questid] then return followupcache[questid] end
	local q,f
	local live = {questid}
	local fups = {}
	local lev
	--self:Debug("Caching mentioned followups of "..questid)
	local cycles=0
	while #live>0 do
		cycles=cycles+1
		assert(cycles<1000,"Quest "..questid.." has infinitely resolving live followups: "..table.concat(live,","))

		q = tremove(live,1)
		lev = self.mentionedQuests[q]
		if lev then tinsert(fups,{q,lev}) end

		f = self.RevChains[q]
		if f then
			for i=1,#f do
				-- make sure there are no circular references
				if f[i]==questid then break end
				local found
				-- don't add stuff that's already in the live group
				for l=1,#live do if live[l]==f[i] or live[l]==questid then found=true break end end
				-- and don't add stuff that's already in followups
				if not found then for l=1,#fups do if fups[l][1]==f[i] then found=true break end end end
				if found then break end
				tinsert(live,f[i])

				--error("Circular quest reference: "..q.." requires "..f[i]..", already required by "..questid)  -- screw it, they MAY require old quests, just not in circles. Fix circles quietly.
			end
		end
		assert(#live<1000,"Quest "..questid.." has live followups > 1000: "..table.concat(live,","))
	end
	followupcache[questid]=fups
	return fups
end

-- A quest's "maximum chained level" can be safely cached, I guess.
-- MAY YIELD.
function GQ:CacheMentionedFollowups()
	local f,maxlev
	self.maxQuestLevels = {}
	local count=0
	for qid,lev in pairs(self.mentionedQuests) do
		--self.loadprogress=count/30000
		count=count+1
		if count>100 then count=0 yield() end
		f=GQ:GetMentionedFollowups(qid)
		for i=1,#f do
			if f[i][2]>lev then lev=f[i][2] end
		end
		self.maxQuestLevels[qid]=lev
	end
end
--]]

--- Attempt to complete current step.
-- 09-09-24:
local lastnextsuggested
local goalsneedanimating={}
GQ.goalsneedanimating=goalsneedanimating

function GQ:TryToCompleteStep(force)
	-- initial bail-out checks
		if not self.loading_screen_disabled then return end
		if not self.CurrentStep or not self.CurrentGuide then return end

		-- frame hidden? bail.
		if not self.Frame:IsVisible() or self.Frame:GetAlpha()<0.1 then return end
	--

	-- out-of-schedule check
		self.CurrentStep:CheckVisitedGotos()
	--

	--== prevent overtime checks. Only proceed with the completion once every self.completioninterval (which varies from self.completionintervallong to self.completionintervalmin).
		local t=GetTime()
		local elapsed=t-lastcompletion
		lastcompletion=t
		self.completionelapsed=self.completionelapsed+elapsed

		local interval=self.completioninterval
		if self.completionelapsed<interval and not force then  -- Too fast. Abort completion checks and, obviously, the subsequent skipping, too.
			return
		end
		self.completionelapsed = 0
	--

	local stepcomplete,steppossible = self.CurrentStep:IsComplete()

	local completing = stepcomplete


	-- smart skipping: treat invalid or impossible or skippable as completed
	if (not self.CurrentStep:AreRequirementsMet()
	or (self.db.profile.skipimpossible and not steppossible))
	and self.fastforward -- but only skip invalids/impossibles if we're already skipping forward!
	--or (self.db.profile.skipobsolete and self.CurrentStep:IsObsolete())
	--or (self.db.profile.skipauxsteps and self.CurrentStep:IsAuxiliarySkippable())
	then
		completing=true
		--self.pause=nil
	end
	
	
	if (stepcomplete or not steppossible) and self.CurrentStep.delay and not self.fastforward then
		self.CurrentStep.delay = self.CurrentStep.delay - 0.1
		if self.CurrentStep.delay<=0 then 
			self.CurrentStep.delay = nil 
			self.pause = nil
		end
		return
	end
	

	-- never skip poi landing step
	if self.CurrentStep.ispoiloader then completing = false end

	if completing and self.Sync and self.Sync:IsEnabled() then
		if self.Sync:IsClearToProceed(self.CurrentStepNum) then -- check synced party members. Who is on the same step, but has it incomplete?
			GQ.Sync:Debug("Party members completed the step, moving on.")
		else
			GQ.Sync:Debug("Waiting for party members to complete step.")
			completing = false
		end
	end

	if not completing then
		interval = self.completionintervaldefault
		self.pause=nil
	end

	local confirmcompleted = false
	local confirmfound = false
	local anycompletable = false
	wipe(goalsneedanimating)
	local step = self.CurrentStep
	for i,goal in ipairs(step.goals) do  if goal:IsCompleteable() then
		local iscomplete,ispossible,done,needed = goal:IsComplete()
		if iscomplete and not self.recentlyCompletedGoals[goal] then
			self.recentlyCompletedGoals[goal] = true
			goalsneedanimating[goal] = true
			goal:OnCompleted()
			self:SendMessage("GQ_GOAL_COMPLETED",step.num,i)
			self:Debug("Goal completed: step %d goal %d",step.num,i)
		elseif not iscomplete and self.recentlyCompletedGoals[goal] then
			self.recentlyCompletedGoals[goal] = false
			goalsneedanimating[goal] = nil
			goal:OnUncompleted()
			self:SendMessage("GQ_GOAL_UNCOMPLETED",step.num,i)
			self:Debug("Goal uncompleted: step %d goal %d",step.num,i)
		end

		if self.recentGoalProgress[goal]==nil then self.recentGoalProgress[goal]=done end
		if self.recentGoalProgress[goal]~=done and (goal.action~="goto" or (self.recentGoalProgress[goal]==1 ~= done==1)) then  -- announce and animate anything BUT a goto.
			goal.dirtytext=true
			goalsneedanimating[goal]=true
			self:SendMessage("GQ_GOAL_PROGRESS",step.num,i)
			self:Debug("Goal progress: step %d goal %d progress %d->%d",step.num,i,self.recentGoalProgress[goal] or -1,done or -1)
		end
		self.recentGoalProgress[goal] = done
		
		if ispossible and goal:IsVisible() then anycompletable=true end

		if goal.action == "confirm" and goal.always then
			confirmfound = true
			if goal.status == "complete" then confirmcompleted = true end
		end
	end end
	if confirmfound and confirmcompleted ~= true then completing = false end

	if not anycompletable and step.anywascompletable then completing = true end -- if there are no completable visible goals, but we know that step had them, they went away so we should skip the step

	if self.pause or self.db.profile.dontprogress then
		interval = self.completionintervaldefault
		self.LastSkip = 1
		self.completionstreak=0
	else
		if completing then
			--self.recentlyCompletedQuests = {} -- forget it! We're skipping the step, already.
			self:Debug("Skipping step: %d (%s)",self.CurrentStepNum,(stepcomplete and "complete" or (steppossible and "possible?" or "impossible")))
			local s=""
			for gn,goal in ipairs(self.CurrentStep.goals) do s=s..goal:GetDebugDump().."\n" end
			self:Debug("Skipped goals were:\n%s",s)

			if self.lasttriedstep and self.lasttriedstep==self.CurrentStep and not self.lastwascompleted then
				--newly completed!
				PlaySound(self.db.profile.completesound)
				if self.db.profile.flashborder then
					self.delayFlash=1
				end
				self:SendMessage("STEP_COMPLETED",self.CurrentStepNum)
			end

			-- do, do, do the SKIP!
			if self.LastSkip<0 then 
				self:PreviousStep(true) 
			else 
				if not GQ.QuestDB:MaybeStopOnThisStep() then -- unless not
					self:SkipStep(true) 
				end
			end
			if not self.fastforward then interval=self.completionintervallong end -- first skip, set speed to slow and begin speeding up.

			self.fastforward=true

			interval = interval * self.completionintervalspeed
			if interval<self.completionintervalmin then interval=self.completionintervalmin end
			self.completionstreak=self.completionstreak+1
			--skipped=skipped+1
			--if skipped>100 then break end

			--self:UpdateFrame()
			--updated=true

			--self.completioninterval = self.completionshortinterval


			--GoatQuestFrame_CoverFlash_blink:Play()

			--stepcomplete = self.CurrentStep:IsComplete()
		else
			interval = self.completionintervaldefault
			self.pause=nil
			self.fastforward=nil
			if self.skipping then self:SendMessage("GQ_STOPPED_SKIPPING") end
			self.skipping = false
			self.LastSkip = 1
			self.completionstreak = 0
			--self.completioninterval = self.completionlonginterval
		end

		--[[
		if updated and not self.db.profile.showallsteps then
			self.stepframes[1].slideup:Play()
		end
		--]]

		--if not stepcomplete then self.AutoskipTemp=true end

		--if not updated then self:UpdateFrame() end
	end
	
	-- self:MaybeSuggestNextGuide()  -- Patch 7.3.5: don't suggest next levels. Players progress to the end of the guide, always. It doesn't make much sense to skip. TODO: detect when they've actually outleveled the current zone!
	self:UpdateFrame()

	GQ.Tabs:CheckForStepCompletion()

	self.lasttriedstep = self.CurrentStep
	self.lastwascompleted = stepcomplete

	self.completioninterval = interval
end

function GQ:MaybeSuggestNextGuide()
	--if self.CurrentGuide.title:find("Pandaria 85") then return end  -- don't suggest when in there. simple. -- 6/25/2013 We can suggest Pandaria again.
	-- And now check if the next guide is up for suggesting.
	-- However, don't bother suggesting others when we're exclusive and still suggested.
	-- Also, do not show the suggest if we are on last step of the guide, we will soon switch anyway and we avoid issues with popup queue

	if self.CurrentGuide.condition_suggested_exclusive then return end
	if self.CurrentStepNum == #self.CurrentGuide.steps then return end  -- proceed normally

	-- ELSE...
	local nextguidetitle = self.CurrentGuide.next
	if not nextguidetitle or GQ.db.char.ignoredguides[nextguidetitle] or (GQ.tempguideblock and GQ.tempguideblock[nextguidetitle]) then return end  -- boo.

	local nextguide = self:GetGuideByTitle(nextguidetitle)
	if nextguide then
		local nextsuggested = (nextguide:GetStatus()=="SUGGESTED")
		GQ.suggesting = nextsuggested
		if not lastnextsuggested and nextsuggested and self.db.profile.n_popup_guides then -- plain guide popup block is in AWP
			nextguide:AdvertiseWithPopup()
		end
		lastnextsuggested = nextsuggested
	end
end

function GQ:InitializeDropDown(frame)
	if not self.guidesloaded then return end

	local guides = GoatQuest.registeredguides

	if not guides then return end

	for i,guide in ipairs(guides) do

--		ChatFrame1:AddMessage(section)
		local info = {}
		info.text = guide.title
		info.value = guide.title
		info.func = GQFSectionDropDown_Func
		if (self.CurrentGuideName == guide.title) then
			info.checked = 1
		else
			info.checked = nil
		end
		info.button = 1
--		if (i == 1) then
--			info.isTitle = 1
--		end
		UIDropDownFork_AddButton(info)
	end
	UIDropDownFork_SetText(frame, self.CurrentGuideName)
end


function GQ:UpdateLocking()
	self.Frame:UpdateLocking()
end

--[[
function GQ:HideCooldown(arg)
	arg.cooldown:Hide()
	self.recentCooldownsPulsing[goal] = 2
end
--]]



--local function gradientRGBA(f,t,p)  --removed

function GQ:SetDisplayMode(mode)
	self.db.profile.displaymode=mode
	self:UpdateFrame(true)
end

local getstickies_temp={}
function GQ:GetStickiesAt(stepnum,laststepnum) -- was stepnum,show_complete but second param was no longer used
	local laststepnum = laststepnum or stepnum
	local changed = false
	for _,stickystep in ipairs(getstickies_temp) do
		if stickystep:IsComplete() or not stickystep:CanBeSticky() then
			changed = true
		end
	end

	stepnum = stepnum or self.CurrentStepNum
	local step = self.CurrentGuide.steps[stepnum]
	wipe(getstickies_temp)
	if step.stickies then
		for _,stickystep in ipairs(step.stickies) do
			if (stickystep.num>laststepnum) and ((not stickystep:IsComplete("novisibilitychecks") and stickystep:CanBeSticky()) or self.db.profile.alwaysshowstickies) then
				tinsert(getstickies_temp,stickystep)
			end
		end
	end
	return getstickies_temp,changed
end

local Tpi=6.2832
local cardinals = {"N","NW","W","SW","S","SE","E","NE","N"}
local function GetCardinalDirName(angle)
	for i=1,9 do
		if Tpi*((i*2)-1)/16>angle then return cardinals[i] end
	end
end
local function GetCardinalDirNum(angle)
	while angle<0 do angle=angle+Tpi end
	while angle>Tpi do angle=angle-Tpi end
	local ret=1
	for i=1,16 do
		if Tpi*((i*2)-1)/32>angle then ret=i break end
	end
	return ret
end

local itemsources={"vendor","drop","ore","herb","skin"}

local gold_ox,gold_oy=0,0

GQ.actionicons={
	["accept"]=5,
	["turnin"]=6,
	["kill"]=7,
	["from"]=7,
	["get"]=8,
	["collect"]=8,
	["goldcollect"]=8,
	["goldtracker"]=8,
	["poi_questobjective"]=8,
	["buy"]=8,
	["goal"]=9,
	["image"]=9,
	["home"]=10,
	["fpath"]=11,
	["goto"]=12,
	["talk"]=13,
	["next"]=14,
	["poi_treasure"]=15,
	["poi_rare"]=16,
	['loadguide']=18,

	["poiannounce"]=0,
	["poiaccess"]=0,
	["poicurrency"]=0,
}
setmetatable(GQ.actionicons,{__index=function() return 2 end})


function GQ:UpdateFrame(full,onupdate)
	do return self:DoUpdateFrame(full,onupdate) end  -- bandaid bypass
	self.updateframe_dirty=true
	self.updateframe_dirty_full=full
	self.updateframe_dirty_onupdate=onupdate
	if not self.updateframetimer then self.updateframetimer = self:ScheduleRepeatingTimer("UpdateFrame_Schedule", 0.01) end
end

function GQ:UpdateFrame_Schedule() -- called each frame
	if self.updateframe_dirty then
		self:DoUpdateFrame(self.updateframe_dirty_full,self.updateframe_dirty_onupdate)
		self.updateframe_dirty=false
		self.updateframe_dirty_full=nil
		self.updateframe_dirty_onupdate=nil
	end
end

function GQ:DoUpdateFrame(full,onupdate)
	if full then self.stepchanged=true end

	if not self.Frame or not self.Frame:IsVisible() then return end

	--if InCombatLockdown() then return end
	--[[
	--		self.Frame:SetAlpha(0.5)
		return
	else
	--		self.Frame:SetAlpha(1.0)
	end
	--]]

	--self:Debug("updatemini")

	--if GoatQuestMiniFrame_bdflash:IsPlaying() and not GoatQuestMiniFrame_bdflash:IsDone() then return end

	self.db.profile.displaymode="guide"

	local focusedstep = GQ:GetFocusedStep()

	--if self.loading then GoatQuestFrame_Border_GuideBack_SectionTitle:SetText(self.loading:format((self.loadprogress or 0)*100)) end
	
	--self.Frame.Border.Gold:Hide() - bfa alpha change unused frame

	self.do_showwaypoints_after_updateframe = false
	
	if GQ.BugReport.GuideRating.GuideRatingViewer and GQ.BugReport.GuideRating.GuideRatingViewer:IsVisible()
		and (GQ.Frame.Border:GetHeight() < 274) and (not GQ.BugReport.GuideRating.GoatQuestPopup or not GQ.BugReport.GuideRating.GoatQuestPopup:IsVisible()) then
			GQ.BugReport.GuideRating:ShowGuideRating()
	end

	if GQ.BugReport.GuideRating.GoatQuestPopup and GQ.BugReport.GuideRating.GoatQuestPopup:IsVisible() and GQ.Frame.Border:GetHeight() >= 274 then
		GQ.BugReport.GuideRating:ShowGuideRating()
		GQ.BugReport.GuideRating.GoatQuestPopup:Hide()
		GQ.BugReport.GuideRating.GoatQuestPopupOn:Hide()
	end

	local Scroll = self.Frame.Controls.Scroll

	if self.CurrentGuide and self.CurrentGuide.steps and self.CurrentGuide.fully_parsed then
		
		self.Frame.Border.Toolbar:Show()
		--if full then
		self.Frame.Border.Toolbar.StepNum.Step:SetText(self.CurrentStepNum)
		--GoatQuestFrame_Border_GuideBack_SectionTitle:SetText(self.CurrentGuide.title_short)
		--end
		
		local showallsteps = (self.db.profile.showcountsteps==0)

		Scroll:Show()

		local stepnum,stepdata

		local firststep = (showallsteps and math.floor(Scroll.Bar:GetValue()) or self.CurrentStepNum) or 1
		firststep=max(1,firststep)
		local laststep = showallsteps and #self.CurrentGuide.steps or self.CurrentStepNum+self.db.profile.showcountsteps-1
		laststep=min(laststep,#self.CurrentGuide.steps)
		local diff = #self.CurrentGuide.steps - laststep
		if self.db.profile.showcountsteps > 1 then
			if laststep == #self.CurrentGuide.steps then
				laststep = min(laststep,#self.CurrentGuide.steps) - diff - 1
			end
		end

		--self:Debug("first step "..firststep..", last step "..laststep)
		-- run through buttons and assign steps for them

		local nomoredisplayed=false

		
		local stickies,changed
		if self.db.profile.stickyon and (self.db.profile.stickydisplay==3 or self.db.profile.stickydisplay==4) and not showallsteps then
			stickies,changed = self:GetStickiesAt(firststep,laststep)
			if changed then
				self:SendMessage("GQ_STEP_CHANGED",num)
			end
		end
		GQ.CurrentStickies = stickies

		-- FIRST, assign steps to frames.
			
			-- automate adding steps to stepframes. Refuse to add completed stickies, or wrong steps.
				GQ.Frame:ClearSteps()

			-- "First" step goes, well, first.
				GQ.Frame:AddStep(self.CurrentGuide.steps[firststep])
			
			-- Now the stickies that accompany it, if any.
				if stickies then
					for _,sticky in ipairs(stickies) do
						GQ.Frame:AddStep(sticky,"sticky")  -- completed stickies will be ignored
					end
				end

			-- And now any future steps, if any.
				for stepnum=firststep+1,laststep do  GQ.Frame:AddStep(self.CurrentGuide.steps[stepnum])  end

				GQ.Frame:HideRemainingSteps()

			-- Clear out steps from further frames.
			-- no need, they're not even shown
				--for f=self.framenum,self.StepLimit do self.stepframes[f].step=nil self.stepframes[f].stepnum=nil end

		-- All steps are assigned to their stepframes!

		-- SECOND, display frames.

		--[[ DO NOT REATTACH.
			for stepframenum = 1,self.StepLimit do
				local frame = self.stepframes[stepframenum]
				local prevframe = self.stepframes[stepframenum-1]
				if prevframe then
					if (prevframe.step and prevframe.step:IsComplete()) or prevframe:GetHeight()==0 then
						local attachable_frame = find_attachable_frame(stepframenum)
						frame:SetPoint("TOPLEFT",attachable_frame,"BOTTOMLEFT",0,-GQ.STEP_SPACING)
						frame:SetPoint("TOPRIGHT",attachable_frame,"BOTTOMRIGHT",0,-GQ.STEP_SPACING)
					else
						frame:SetPoint("TOPLEFT",prevframe:GetName(),"BOTTOMLEFT",0,-GQ.STEP_SPACING)
						frame:SetPoint("TOPRIGHT",prevframe:GetName(),"BOTTOMRIGHT",0,-GQ.STEP_SPACING)
					end
				end
			end
		--]]


		self.stepchanged=false

		--self:HighlightCurrentStep()

		-- steps displayed, clear the remaining slots

	else -- no current guide?

		--[[
		Scroll:Hide()
		GQ.Frame.Border.Toolbar:Hide()
		local guides = self:GetGuides()
		if #guides>0 then
			GQ:Print(L["guide_notselected"])
		else
			GQ:Print(L["guide_notloaded"])
		end
		for i,stepframe in ipairs(self.stepframes) do stepframe:Hide() end
		self.ProgressBar:Hide()
		minh=0
		--]]
	end

	--if self.Frame:GetHeight()<minh-0.01 then self.Frame:SetHeight(minh) end

	self:ResizeFrame()
	self.Frame:ShowSpecialState()

	if self.do_showwaypoints_after_updateframe then
		self:ShowWaypoints()  
	end

	if self.delayFlash and self.delayFlash>0 then
		self.delayFlash=2 --ready to flash!
		--GoatQuestFrame_bdflash:StartRGB(1,1,1,1,0,1,0,1)
	end
end


function GQ:SetFrameScale(scale)
	scale = self.db.profile.framescale
	self.Frame:SetScale(scale)
end

function GQ:ReanchorFrame()
	local frame = self.Frame
	local framemaster = frame:GetParent()
	local upsideup = not self.db.profile.resizeup


	local tabbar_height = 2
	if #GQ.registeredmapspotsets>0 then
		tabbar_height = 20
	end


	local lef = frame:GetLeft()
	frame:ClearAllPoints()
	local tabh = GQ.Frame.Border.TabContainer:GetHeight()

	if frame.sizedleft then
		local poi,rel,relpoi,x,y = framemaster:GetPoint()
		framemaster:ClearAllPoints()
		framemaster:SetPoint(poi,rel,relpoi,x+lef-frame.sizedleft,y)
		frame.sizedleft=nil
	end

	if upsideup then
		--frame:SetPoint("TOP",nil,"TOP",(left+right)/2-(uiwidth/2/scale),top-uiheight/scale)
		--frame:SetPoint("TOP",frame:GetParent(),"BOTTOMLEFT",left+width/2,top)
		frame:SetPoint("TOPLEFT",framemaster)
		frame:SetClampRectInsets(0,0,-48-tabh,0)
	else
		--frame:SetPoint("BOTTOM",nil,"BOTTOM",(left+right)/2-(uiwidth/2/scale),bottom)
		--frame:SetPoint("BOTTOM",frame:GetParent(),"BOTTOMLEFT",left+width/2,bottom)
		frame:SetPoint("BOTTOMLEFT",framemaster)
		frame:SetClampRectInsets(0,0,0,48+tabh)
	end

	--frame:UpdateMiniMode()
end

function GQ:AlignFrame()
	self.Frame:AlignFrame()
	GQ.F.SaveFrameAnchor(self.Frame:GetParent(),"frame_anchor")
end

function GQ:ApplySkin()
	self.Frame:ApplySkin()
end

local resizing
function GQ:ResizeFrame(source)
	if not self.Frame or not self.db then return end
	-- if InCombatLockdown() then return end -- no longer needed, actionbuttons are now detached from viewerframe

	-- protect from self-calling, and reset it the next frame
	if resizing then return end
	resizing=true
	C_Timer.After(0.001,function() resizing=false self.frameNeedsResizing=0 end)	

	--[[
	if self.frameNeedsResizing then
		if self.frameNeedsResizing>0 then self.frameNeedsResizing = self.frameNeedsResizing - 1 end
		if self.frameNeedsResizing>0 then return nil end
	end
	--]]

	--GoatQuestFrame_Border:SetBackdropColor(self.db.profile.skincolors.back[1],self.db.profile.skincolors.back[2],self.db.profile.skincolors.back[3],self.db.profile.backopacity)

	local ctrls = self.Frame.Controls
	local Scroll = ctrls.Scroll
	local StepContainer = ctrls.StepContainer

	--self:Debug("resizing from "..tostring(GoatQuestFrame:GetHeight()))
	--if not self.CurrentStepNum or not _G['GoatQuestFrame_Step'..self.CurrentStepNum] then return end

	local MAX_CONTENT_HEIGHT=600

	--print("--- RESIZE:")

	local function CalculateHeight()
		local last_bottom=false
		local sc_width = StepContainer:GetWidth()
		if self.Frame.Controls.DefaultStateButton:IsShown() then return self.Frame.Controls.DefaultStateButton.min_height end
		for i,stepframe in ipairs(self.Frame.stepframes) do  if stepframe:IsShown() then
			stepframe:SetWidth(sc_width)
			stepframe:AdjustHeight()
			last_bottom = stepframe:GetBottom()
			--if i>1 then contentheight = contentheight + SkinData("StepStickyBarSpace")+SkinData("StepStickyBarHeight")+SkinData("StepStickyBarSpace")  end
			--if i>1 then height = height + SkinData("StepSpacing") + (stepframe.is_sticky and SkinData("StepStickyBarSpace")+SkinData("StepStickyBarHeight")+SkinData("StepStickyBarHeight") or 0) end
			--contentheight = contentheight + stepframe:GetHeight()
		end end
		if not last_bottom then return 0.1 end
		local height = self.Frame.stepframes[1]:GetTop() - last_bottom
		--print(("h = %d"):format(height))
		return height
	end

	local CONTROLS_HEIGHT = SkinData("TopHeight")+SkinData("TabsHeight")+SkinData("ProgressBarSpaceHeight")
	local autoresize = not self.db.profile.fixedheight and self.db.profile.showcountsteps~=0
	local allstepsmode = self.db.profile.showcountsteps==0

	local MIN_SCROLLABLE_CONTENT_HEIGHT = 80
	if self.Frame.SetResizeBounds then
		self.Frame:SetResizeBounds(MIN_WIDTH,CONTROLS_HEIGHT+(autoresize and 0 --[[n/a]] or MIN_SCROLLABLE_CONTENT_HEIGHT),MAX_WIDTH,CONTROLS_HEIGHT+MAX_CONTENT_HEIGHT)
	else
	self.Frame:SetMinResize(MIN_WIDTH,CONTROLS_HEIGHT+(autoresize and 0 --[[n/a]] or MIN_SCROLLABLE_CONTENT_HEIGHT))
	self.Frame:SetMaxResize(MAX_WIDTH,CONTROLS_HEIGHT+MAX_CONTENT_HEIGHT)
	end

	-- calculate full wide height
	--print("Try: full width")
	StepContainer:SetWidth(Scroll:GetWidth())
	local contentheight = CalculateHeight()  --print("height a:",contentheight)
	StepContainer:SetHeight(contentheight)

	local adjusted_contentheight
	if autoresize then
		if GQ.CurrentGuide and GQ.CurrentStep.score then
			if source == "ratingframe" then
				adjusted_contentheight = 244
				GQ:ScheduleTimer(function()
					GQ.BugReport.GuideRating.GuideRatingViewer:Show()
				end, 0.1)
	--		elseif source == "cancelledframe" then
	--			adjusted_contentheight = 115
	--			GQ:ScheduleTimer(function()
	--				GQ.BugReport.GuideRating.CancelledRatingFrame:Show()
	--			end, 0.1)
			end

			if GQ.BugReport.GuideRating.NoRatingFrame and GQ.BugReport.GuideRating.NoRatingFrame:IsVisible() then
				adjusted_contentheight = 125
			elseif GQ.BugReport.GuideRating.CancelledRatingFrame and GQ.BugReport.GuideRating.CancelledRatingFrame:IsVisible() then
				adjusted_contentheight = 115
			elseif GQ.BugReport.GuideRating.GuideRatingViewer and GQ.BugReport.GuideRating.GuideRatingViewer:IsVisible() then
				adjusted_contentheight = 244
			end

		else adjusted_contentheight = min(contentheight,MAX_CONTENT_HEIGHT)
		end
		if contentheight_got_adjusted then
			--print(("adj h to %d"):format(adjusted_contentheight))
		else
			--print("adj h? no")
		end
		if adjusted_contentheight ~= nil then local height = max(adjusted_contentheight + CONTROLS_HEIGHT, MIN_HEIGHT)
		self.Frame:SetHeight(height ) end
	
	else

		-- do we need the scrollbar?
		local scrollbar_needed = allstepsmode or contentheight>Scroll:GetHeight()+0.1 or contentheight>MAX_CONTENT_HEIGHT
		local cur_h = Scroll:GetHeight()
		if scrollbar_needed and cur_h<MIN_SCROLLABLE_CONTENT_HEIGHT then
			-- WHY!? :(
			-- Enlarge the frame even in scrolly mode :(
			adjusted_contentheight = max(cur_h,min(contentheight,MIN_SCROLLABLE_CONTENT_HEIGHT))
			--print("adj contentheight = ",math.round(adjusted_contentheight))
			local height = adjusted_contentheight
			self.Frame:SetHeight(height-0.1 + CONTROLS_HEIGHT )
			-- do we STILL need the scrollbar?
		else
			--print("scrollbar not needed: sn",scrollbar_needed and "yes" or "no","ch",math.round(contentheight))
		end
	end

	local scrollbar_needed = allstepsmode or contentheight>Scroll:GetHeight()+0.1 or contentheight>MAX_CONTENT_HEIGHT
	if scrollbar_needed then
			-- enable the scrolls and resize the container
		local barsize = SkinData("ScrollBarButtonSize") or {16,16}
		StepContainer:SetWidth(Scroll:GetWidth()-barsize[1])
		--print("Try: with scrollbar")
		contentheight = CalculateHeight() --print("height b:",contentheight)
		StepContainer:SetHeight(contentheight)

		-- set scroll range
		if allstepsmode then
			Scroll.Bar:SetMinMaxValues(1,GQ.CurrentGuide and #GQ.CurrentGuide.steps)
		else
			Scroll.Bar:SetMinMaxValues(0,Scroll:GetScrollRange())
		end
		Scroll.Bar:SetValue(Scroll.Bar:GetValue())
		Scroll.Bar:Show()
		Scroll.Bar.ThumbTexture:Show()
	else
		--print(("scroll not needed; ch %d < sc %d"):format(contentheight,Scroll:GetHeight()))
		Scroll.Bar:Hide()
	end

	--print(("Content: %d"):format(math.round(StepContainer:GetHeight())))
	--print(("Scroll: %d"):format(math.round(Scroll:GetHeight())))

	--local tabh = GQ.Frame.Border.TabContainer:GetHeight()


	-- do not call this on the same frame, as getwidth/height inside will be broken
	-- self:ScheduleTimer(function() GQ.ProgressBar:Refresh() end,0)
	


		--self:Debug(("%d %d"):format(left,bottom))
	--		GoatQuestFrame:SetHeight(GoatQuestFrame_Text:GetHeight()+35)


	--	if GoatQuestFrame_ActiveStep_Line1:GetTop() then
			--GoatQuestFrame_Resize.max = GoatQuestFrame_Line1:GetTop()-GoatQuestFrame_TextInfo2:GetBottom()+35
			--GoatQuestFrame_Resize:Stop()
			--GoatQuestFrame_Resize:Play()

	--		GoatQuestFrame:SetHeight(GoatQuestFrame_ActiveStep_Line1:GetTop()-GoatQuestFrame_TextInfo2:GetBottom()+35)
	--	end

	--	end

--	end

end

function GQ:GoalProgress(goal)
	return "epic fail"
end

function GQ:ScrollToCurrentStep()  -- deprecated: no more scrolling
	do return end
--	if self.ForceScrollToCurrentStep and self.CurrentStep then
--		self.ForceScrollToCurrentStep = false
		if self.CurrentStep and self.db.profile.displaymode=="guide" then

			local height=0
			local step
			if self.db.profile.showcountsteps==0 then
				local topstep = self.Frame.stepframes[1] and self.Frame.stepframes[1].stepnum
				if not topstep then return end
				if topstep>self.CurrentStepNum --above
				or (topstep+self.StepLimit-1<self.CurrentStepNum) --way below
--				or (GoatQuestFrame_Step1:GetTop()-_G['GoatQuestFrame_Step'..(self.CurrentStepNum-topstep+1)]:GetBottom()+GQ.STEP_SPACING>GoatQuestFrameScroll:GetHeight()) --barely offscreen
				or not self.Frame.stepframes[self.CurrentStepNum-topstep+1]
				or not self.Frame.stepframes[self.CurrentStepNum-topstep+1]:IsShown()
				or self.Frame.stepframes[self.CurrentStepNum-topstep+1].truncated
				then
					self.Frame.Scroll.Bar:SetValue(self.CurrentStepNum)
					self.Frame.Scroll.Bar:Show()
				end
			else
				self.Frame.Scroll.Bar:Hide()
			end
		end
--	else
--		self.ForceScrollToCurrentStep = true
--	end
end

function GQ:IsVisible()
	return self.Frame:IsVisible()
end

function GQ:SetVisible(info,onoff)
	self.Frame:SetShown(onoff) 
	self.db.profile.enable_viewer = not not onoff
	if onoff then GQ.Tabs:ReanchorTabs() end
	self:SendMessage("WINDOW_SHOWN",not not onoff)
end

function GQ:ToggleFrame()
	GQ:SetVisible(nil,not self.Frame:IsShown())
	GQ.ActionBar:ToggleFrame()
end

function GQ:IsDefaultFitting(default)
	-- deprecated?
	local _,race = UnitRace("player")
	local _,class = UnitClass("player")
	if (class=="DEATHKNIGHT") then race=class end
	default=default:upper()
	race=race:upper()
	class=class:upper()
	return race==default or class==default or race.." "..class==default
end

--- Checks if the player's race/class matches the requirements.
-- @param requirement May be a string or a table of strings (which are then ORed).
-- @return true if matching, false if not.
local RaceClassMatchCache={}
function GQ:RaceClassMatch(fit,nocache,r,c)
	-- get string identifier for given query, either uppercase string or comma joined array
	local fitstring = (type(fit)=="table" and table.concat(fit,",") or fit:upper())
	if not nocache and RaceClassMatchCache[fitstring]~=nil then return RaceClassMatchCache[fitstring] end

	if type(fit)=="table" then
		for i,v in ipairs(fit) do local r,x=self:RaceClassMatch(v)  if r then return r,x end end
		return false --otherwise
	end

	if not nocache and RaceClassMatchCache[fit]~=nil then return RaceClassMatchCache[fit] end

	local _,race = UnitRace("player")
	if r then race = r end
	local _,class = UnitClass("player")
	if c then class = c end
	local faction = UnitFactionGroup("player")
	race=race:upper()
	class=class:upper()
	faction=faction:upper()
	fit=fit:upper()
	local neg=false
	if fit:sub(1,1)=="!" then
		neg=true
		fit=fit:sub(2)
	end
	fit=fit :gsub("UNDEAD","SCOURGE") :gsub("LFDRAENEI","LIGHTFORGEDDRAENEI") :gsub("HMTAUREN","HIGHMOUNTAINTAUREN") :gsub("ZTROLL","ZANDALARITROLL")
	local ret = (race==fit or class==fit or faction==fit or race.." "..class==fit)

	-- cache both full result
	RaceClassMatchCache[fit] = ret

	if neg then return not ret else return ret end
end

function GQ:RaceClassMatchList(list)
	list=list..","
	local st,en=1
	for fit in list:gmatch("(.-),") do
		if self:RaceClassMatch(fit) then return true end
	end
end

--[[
local spamthrot_sec=5
local spamthrot_msgs=5
local spamthrot_last=""
local spamthrot_last_repeated=false
local spamthrot_squelch=30
local spamthrot_squelch_time=0
local spamthrot_times={}  for i=1,spamthrot_msgs do spamthrot_times[i]=0 end
local spamthrot
--]]
function GQ:Print(s,ifdebug,force)
	if ifdebug then self:Debug(s) end

	if not force and not GQ.db.profile.noisy then return end

	--[[
	if not GQ.DEV and not GQ.db.profile.debug and not force then  -- spam throttle on clients only
		if s==spamthrot_last then
			if not spamthrot_last_repeated then
				ChatFrame1:AddMessage(L['name']..": (last message repeats)")
				spamthrot_last_repeated=true
			end
			return
		end

		spamthrot_last=s
		
		local time = time()
		if time<spamthrot_squelch_time then return end
		spamthrot_last=s
		
		for i=1,spamthrot_msgs-1 do spamthrot_times[i]=spamthrot_times[i+1] end
		spamthrot_times[spamthrot_msgs]=time
		if spamthrot_times[5]-spamthrot_times[1]<spamthrot_sec then
			ChatFrame1:AddMessage(L['name']..": "..tostring(s))  -- last one in
			ChatFrame1:AddMessage(L['name']..": "..("%d messages under %d seconds, silencing for %d seconds. Use |cffffee00/goatquest noisy|r to silence permanently."):format(spamthrot_msgs,spamthrot_sec,spamthrot_squelch))
			spamthrot_squelch_time=time+spamthrot_squelch
			return
		end
	end
	--]]
	
	ChatFrame1:AddMessage(L['name']..": "..tostring(s))
end

local thunder_stack
function GQ:ThunderStageForceUpdate()
	do return end  -- TODO: reimplement this with C_Map
	if thunder_stack then return end
	if WorldMapFrame:IsShown() and GetCurrentMapAreaID()~=928 then --Wait for them to close the map then update
		GQ.WaitingOnThunderStage = true
		return
	end
	thunder_stack=1

	GQ.WaitingOnThunderStage = nil

	local lastmap,lastfloor

	GQ.WMU_Suspend()
	if GetCurrentMapAreaID()~=928 then
		lastmap,lastfloor = GetCurrentMapAreaID(),GQ.GetCurrentMapDungeonLevel()
		SetMapByID(928) --Thunder Isle
	end

	if C_MapBar.GetTag()=="THUNDER_ISLE" then
		GQ.db.char.thunderstage = (C_MapBar.GetPhaseIndex() + 1) or 1
		GQ.db.char.thunderprogress = (C_MapBar.GetCurrentValue()/C_MapBar.GetMaxValue()) or 0

		--[[
		if GQ.DEV then
			-- TEMPORARY TIMING OF THUNDER ISLE
			if not GQ.db.global.thundertimes then GQ.db.global.thundertimes={} end
			local val = C_MapBar.GetCurrentValue()
			if val>0 and GQ.db.global.thunderprogress_last~=val then
				GQ.db.global.thundertimes[time()] = val
				GQ.db.global.thunderprogress_last=val
			end
		end
		--]]
	end

	if lastmap then SetMapByID(lastmap) SetDungeonMapLevel(lastfloor) end
	GQ.WMU_Resume()
	thunder_stack=nil
end

function GQ:GetThunderStage()
	if not GQ.db.char.thunderstage or GQ.WaitingOnThunderStage then
		GQ:ThunderStageForceUpdate()
	end

	return (GQ.db.char.thunderstage or 1),(GQ.db.char.thunderprogress or 0)
end




	local last_thunder_check
	local function avgdev(data,basetime,progtime)
		local cnt,totaldev=0,0
		for time,prog in pairs(data) do
			cnt=cnt+1
			local dev = (time-basetime) * progtime  -  prog
			totaldev=totaldev+dev
		end
		return totaldev/cnt
	end

	function GQ:AnalyzeThunderData(reset)
		local mintime,maxtime=9999999999,0
		local progs = GQ.db.global.thundertimes
		if reset then wipe(progs) end
		for time,data in pairs(progs) do
			if time<mintime then mintime=time end
			if time>maxtime then maxtime=time end
		end

		local progtime=(progs[maxtime]-progs[mintime])/(maxtime-mintime)


		-- at this point,   progress = (time()-zerotime) * progtime

		local minprog,maxprog=0.01,5
		local mindev,maxdev=99999999,0

		for i=1,20 do
			progtime=(minprog+maxprog)/2
			local zerotime = mintime - progs[mintime]/progtime
			print ("progtime",progtime,"dev",avgdev(progs,zerotime,progtime))
			if avgdev(progs,zerotime,progtime)<0 then
				minprog=progtime
			else maxprog=progtime
			end
		end

		local zerotime =  mintime - progs[mintime]/progtime

		print("progress/time = ",progtime)

		local s = ""
		for t=mintime,maxtime do
			if progs[t] then
				local expected = (t-mintime) * progtime + progs[mintime]
				print("time",t,"progress",progs[t],"deviation",progs[t]-expected)
				s = s .. t .. "\t" .. progs[t] .. "\n"
			end
		end
		GQ:ShowDump(s)

		local fulldate = zerotime + 1000000/progtime

		print("|cffffbb001000000|cff88ff00 estimated in ",fulldate," = |cffffbb00",date("%Y-%m-%d %H:%M:%S",fulldate))
	end

	function GQ:GetThunderStageQQ()
		do return 1 end -- TODO: reimplement

		if WorldMapFrame:IsShown() and GetCurrentMapAreaID()~=928 then  -- wrong map shown! should we force it or not..?
			if GQ.db.char.thunderstage then
				-- cached? return that
				return GQ.db.char.thunderstage
			else
				-- FORCE. EVIL.
				SetMapByID(928) --Thunder Isle
			end
		end

		if GetCurrentMapAreaID()~=928 then return GQ.db.char.thunderstage end  -- the best we can do, if we weren't forcing it

		local stage = (C_MapBar and C_MapBar.BarIsShown() and C_MapBar.GetPhaseIndex() + 1)  or  1

		GQ.db.char.thunderstage = stage  -- save

		last_thunder_check = GetTime()

		return GQ.db.char.thunderstage
	end

function GQ:MatchProfs(fitprof,levelmin)
	local data = self.Professions:GetSkill(fitprof)
	if not data then return false end

	if data.placeholder then
		-- check if they have it, but didn't scan it yet
		for _,index in pairs({GetProfessions()}) do
			local _, _, skillLevel, _, _, _, skillLine = GetProfessionInfo(index)
			local skill = GQ.Professions.tradeskills[skillLine]
			if skill and skill.name == fitprof then
				return skillLevel>=levelmin
			end
		end
	end

	if not data.active then
		return false --We don't have this profession so forget it.
	elseif data.level > 0 then --sanity check.
		return data.level>=levelmin
	end
end

GQ.WorldEventIDs = {
	[141] = "FEAST OF WINTER VEIL",
	[181] = "NOBLEGARDEN",
	[341] = "MIDSUMMER FIRE FESTIVAL",
	[327] = "LUNAR FESTIVAL",
	[423] = "LOVE IS IN THE AIR",
	[404] = "PILGRIM'S BOUNTY",
	[321] = "HARVEST FESTIVAL",
	[324] = "HALLOW'S END",
	[409] = "DAY OF THE DEAD",
	[479] = "DARKMOON FAIRE",
	[201] = "CHILDREN'S WEEK",
	[372] = "BREWFEST",
	[62]  = "FIREWORKS SPECTACULAR", 
}

function GQ:FindEvent(eventName)
	eventName=eventName:upper()
	local dateobject = C_DateAndTime.GetCurrentCalendarTime()
	local month,day,year = dateobject.month,dateobject.monthDay,dateobject.year

	local numEvents = C_Calendar.GetNumDayEvents(0, day);
	local now = GQ.F.GetSecondsFromTime(dateobject)

	for event=1, numEvents do
		local eventdata = C_Calendar.GetDayEvent(0,day,event)
		if GQ.IsSecret(eventdata) or GQ.IsSecret(eventdata.calendarType) then return false end
		if eventdata and eventdata.calendarType=="HOLIDAY" and --We don't care about any other events
		   (eventName==GQ.WorldEventIDs[eventdata.eventID] or eventName==eventdata.title) then --Does the ring fit?
			local startTime = GQ.F.GetSecondsFromTime(eventdata.startTime)
			local endTime = GQ.F.GetSecondsFromTime(eventdata.endTime)
			if (now-startTime)>0 and (now-endTime)<0 then -- Is it running?
				return true
			end
		end	
	end
	return false -- Nothing else was returned, so the event is not active.
end


function GQ:UNIT_INVENTORY_CHANGED(event,unit)
	self:UpdateFrame(true)
	if unit=="player" then
		self:TryToCompleteStep(true)
	end
end

--local MapBarLastupdate=0
function GQ:MAP_BAR_UPDATE(event)
	--local time = GetTime();
	--if MapBarLastupdate~= time then
	--	MapBarLastupdate = time
		GQ:ThunderStageForceUpdate()
	--end
end

-- handled in QuestTracking; duplicating it here may cause race conditions and bad quest detection
--[[
function GQ:QUEST_LOG_UPDATE(event,unit)
	self:Debug("QUEST_LOG_UPDATE")
	self:UpdateFrame(true)
	if unit=="player" then
		self:TryToCompleteStep(true)
	end
end
--]]

function GQ:UpdateFrameStepSkipping()
	if not self.Frame then return end
	local enabled = self.CurrentGuide and self.CurrentStep
	self.Frame.Border.Toolbar.NextButton:SetEnabled(enabled and self.CurrentStep.num<#self.CurrentGuide.steps)
	self.Frame.Border.Toolbar.PrevButton:SetEnabled(enabled and self.CurrentStep.num>1)
end


local StartupTimingFrame = CreateFrame("FRAME",nil,UIParent)
StartupTimingFrame:Show()
StartupTimingFrame:RegisterEvent("ADDON_LOADED")
StartupTimingFrame:RegisterEvent("VARIABLES_LOADED")
StartupTimingFrame:SetScript("OnEvent",function(f,event,arg)
	if event=="ADDON_LOADED" and arg==addonName then GQ.startuptimestamps:Punch("addonloaded") end
	if event=="VARIABLES_LOADED" then GQ.startuptimestamps:Punch("variablesloaded") end
end)


local blobstate=nil
function GQ:PLAYER_REGEN_DISABLED()
	-- delay it ALL, because some stuff will already taint; InCombatLockdown() may not yet be up.
	self:ScheduleTimer(function()
		--GoatQuestFrame_Cover:Show()
		--GoatQuestFrame_Cover:EnableMouse(true)
		if self.db.profile.hideincombat then
			if self.Frame:IsVisible() then
				GQ.UIFrameFade.UIFrameFadeOut(self.Frame,0.5,1.0,0.0)
				self.hiddenincombat = true
			end

			-- Arrow and action bar are handled by secure AttributeDriver
	
			--[[ CreatureViewer removal, 7.0
			if self.CV.Frame:IsVisible() then
				GQ.UIFrameFade.UIFrameFadeOut(self.CV.Frame,0.5,1.0,0.0)
				self.cvhiddenincombat = true
			end
			--]]
		end
	--[[
		blobstate = WorldMapBlobFrame:IsShown()
		WorldMapBlobFrame:SetParent(nil)
		--WorldMapBlobFrame:ClearAllPoints()
		WorldMapBlobFrame:Hide()
		WorldMapBlobFrame.Hide = function() blobstate=nil end
		WorldMapBlobFrame.Show = function() blobstate=true end
	--]]
	self:UpdateFrameStepSkipping()
	end,0)
end

function GQ:PLAYER_REGEN_ENABLED()
	--GoatQuestFrame_Cover:Hide()
	--GoatQuestFrame_Cover:EnableMouse(false)

	-- delay it ALL, because some stuff will still taint; InCombatLockdown() may not yet be down.
	self:ScheduleTimer(function()
		if self.CurrentStep then self.CurrentStep:PrepareCompletion(true) end
		self:UpdateFrame(true)
	
		if self.hiddenincombat then
			GQ.UIFrameFade.UIFrameFadeIn(self.Frame,0.5,0.0,1.0)
			self.hiddenincombat = nil
		end

		-- Arrow and action bar are handled by secure AttributeDriver

		--[[ CreatureViewer removal, 7.0
		if self.cvhiddenincombat then
			GQ.UIFrameFade.UIFrameFadeIn(self.CV.Frame,0.5,0.0,1.0) --This will fade the creature viewer to the same level as the window. Not a bad thing imo
			self.cvhiddenincombat = nil
		end
		--]]
	
		self:UpdateLocking()
	--[[
		WorldMapBlobFrame:SetParent(WorldMapFrame)
		--WorldMapBlobFrame:SetAllPoints(WorldMapDetailFrame)
		WorldMapBlobFrame.Hide = nil
		WorldMapBlobFrame.Show = nil
		if blobstate then WorldMapBlobFrame:Show() end
	--]]
		if self.call_after_combat then self.call_after_combat() self.call_after_combat=nil end
		self:UpdateFrameStepSkipping()
	end,0)
end

function GQ:SPELL_UPDATE_COOLDOWN()
	--self:Debug("Updating cooldowns")
end

function GQ:PLAYER_CONTROL_GAINED()
	GetRealZoneText()
	self:TryToCompleteStep(true)
	self:CacheCurrentMapID()
end

function GQ:CRITERIA_EARNED()
	self:TryToCompleteStep(true)
end

function GQ:WORLD_MAP_UPDATE()
	self:CacheCurrentMapID()
end

function GQ:NEW_WMO_CHUNK()
	-- if not WorldMapFrame:IsVisible() then GQ.WMU_Suspend() SetMapToCurrentZone() GQ.WMU_Resume() end  -- force map reset, otherwise floor numbers will still be wrong  -- TODO: reimplement with C_Map? maybe? maybe not?
	self:CacheCurrentMapID()
end

function GQ:PLAYER_ENTERING_WORLD()
	self:Debug("&events PLAYER_ENTERING_WORLD! Let's go!")
	self.loading_screen_disabled=true
	self:CacheCurrentMapID()
end

function GQ:ZONE_CHANGED_INDOORS()
	-- if not WorldMapFrame:IsVisible() then GQ.WMU_Suspend() SetMapToCurrentZone() GQ.WMU_Resume() end   -- TODO: reimplement with C_Map? maybe? maybe not?
	self:CacheCurrentMapID()
end

function GQ:ZONE_CHANGED()
	self:CacheCurrentMapID()
	self:CachePOIs()
	self:UpdateFrame(true)
end

function GQ:ZONE_CHANGED_NEW_AREA()
	-- if not WorldMapFrame:IsVisible() then GQ.WMU_Suspend() SetMapToCurrentZone() GQ.WMU_Resume() end   -- TODO: reimplement with C_Map? maybe? maybe not?
	self:CacheCurrentMapID()

	-- clean up scenario based choices if player is not on a scenario map
	GQ:PlayerChoiceCleanUp()
	self:UpdateFrame(true)
end

function GQ:TAXIMAP_OPENED()
	if not GQ.IsRetail then
		Dismount()
	end

	if self.db.profile.autotaxi and self.CurrentStep and GQ.Frame:IsVisible() then
		local destination
		for gi,goal in ipairs(self.CurrentStep.goals) do
			--if goal.action=="fly" and goal.map==GQ.CurrentMapID then

			if goal.action=="fly" then
				destination = goal.landing
				break
			end
		end
		if destination then
			self:Debug("Autotaxi destination: %s",destination)
			local dest_i
			for i=1,NumTaxiNodes() do
				if TaxiNodeName(i):find(destination)==1 then
					dest_i=i
					destination = TaxiNodeName(i)
					break
				end
			end
			if not dest_i then
				self:Debug("Cannot fly to %s: destination not found on map.",destination)
			elseif TaxiNodeGetType(dest_i)~="REACHABLE" then
				self:Print("Cannot fly to %s: destination unreachable.",destination)
			elseif TaxiNodeCost(dest_i)>GetMoney() then
				self:Print("Cannot fly to %s: not enough money.",destination)
			else
				-- finally!
				self:Print("Taking taxi to ".. TaxiNodeName(dest_i)..".")
				TakeTaxiNode(dest_i)
			end
		end
	end
end

GQ.CurrentMapID,GQ.CurrentMapFloor = 0,0

function GQ:CacheCurrentMapID()
	if not self.loading_screen_disabled then return end

	local _,_,m,f=GQ.LibRover:GetPlayerPosition()
	if m and m~=0 then
		GQ.CurrentMapID,GQ.CurrentMapFloor = m,f
	end
	-- HBD migration snip: various astrolabe stupidity workarounds
end

function GQ:FindData(array,what,data)
	if not (type(array)=="table") then return nil end
	local i,d
	for i,d in pairs(array) do if d[what]==data then return d end end
end

function GQ:Frame_OnShow()
	if GQ.initialized then PlaySound(SOUNDKIT.IG_QUEST_LOG_OPEN) end
	self:Debug("&events GQ:Frame_OnShow")
	--GoatQuestFrame_Filter()
	--[[
	if UnitFactionGroup("player")=="Horde" then
		GoatQuestFrameTitleAlliance:Hide()
	else
		GoatQuestFrameTitleHorde:Hide()
	end
	--]]

	if self.CurrentStep then
		self.db.profile.enable_viewer = true
		self:UpdateFrame(true)
		self:AlignFrame()

		if self.db.profile.hidearrowwithguide then
			self:ShowWaypoints()
		end

		--[[ CreatureViewer removal, 7.0
		-- Trying to show the modelviewer frame
		-- During startup operation we may be shown numerous times,
		-- so let's make sure we're trying to do a nice thing
		if self.db.profile.mv_enabled and self.CV then
			self:TryToDisplayCreature(true)
		end
		--]]
	end
end

function GQ:Frame_OnHide()
	PlaySound(SOUNDKIT.IG_QUEST_LOG_CLOSE)
	self.db.profile.enable_viewer = false

	--[[

	-- this is a HELL ugly hack.
	-- "Do not hide when it's the World Map that hid us".
	if not WorldMapFrame.blockWorldMapUpdate -- this would mean we're enlarging the small map
	and not debugstack():find("TOGGLEWORLDMAP") -- UGLY hack
	then
		if self.db.profile.hidearrowwithguide then
			self:Debug("Hiding arrow with guide")
			self:ShowWaypoints("clear")
		end

		-- if modelviewer is on, also hide it as well
		if self.CV.Frame:IsShown() then
			self:Debug("Hiding modelviewer with guide.")
			self.CV:Hide()
		end
	end
	--]]

	--[[ CreatureViewer removal, 7.0
	if self.CV then self.CV:Hide() end
	--]]
end

function GQ:SetStepFocus(step)

	if step.isFocused or (step:IsCurrentlySticky() and GQ.CurrentStep.isFocused) then return end  -- no change.

	-- defocus everything
	if GQ.CurrentGuide and GQ.CurrentGuide.steps then
		for i,v in pairs(GQ.CurrentGuide.steps) do
			v.isFocused = false
		end
	end

	if step.is_sticky then
		step = GQ.CurrentStep
	end
	

	step.isFocused = true
	
	self:Debug("&step Focus changed to step %s (%s)",step.num, "guide")
	
	
	if GQ.focusedguide ~= step.parentGuide then 
	-- if we changed guide, then force refresh, otherwise refresh was triggered somewhere else already
		GQ.focusedguide = step.parentGuide
		GQ:UpdateFrame()
	end
	
	--GQ:ShowWaypoints()  -- will be done later anyway, no need
end

function GQ:IsStepFocused(step)
	if step.isFocused then return true end
	if GQ.CurrentStep.isFocused and step:IsCurrentlySticky() then return true end
	return false
end


function GQ:GetFocusedStep()
	if GQ.CurrentStep and GQ.CurrentStep.isFocused then
		return GQ.CurrentStep
	else
		return nil
	end	
end

GQ.GoalClickedTime = GetTime()

function GQ:GoalOnClick(frame,button)
	--timer is a hack to make sure multiple consecutive goals arent clicked
	--at the same time. 0.2 seconds between clicks distinguishes between humans
	local curTime = GetTime()
	if curTime - self.GoalClickedTime < 0.2 then  return  end
	self.GoalClickedTime = curTime
	local goalframe=frame
	if goalframe.parentLine then goalframe = goalframe.parentLine end
	local stepframe = goalframe.parentStep
	local goal = goalframe.goal or goalframe.tipgoal

	if not goal then return end

	if not goal.parentStep.isFocused then 
		return 
	end

	if self.db.profile.showcountsteps>0 and stepframe.step~=self.CurrentStep and not stepframe.is_sticky then return end -- no clicking on non-current steps in compact mode
	
	--if stepframe:GetScript("OnClick") then stepframe:GetScript("OnClick")(stepframe,button) end

	--local num=goalframe.goalnum
	self:Debug("goal clicked, step %s goal %s ",goal.parentStep.num,goal.num)
	--local goal = self.CurrentStep.goals[num]

	--if button=="LeftButton" and not goal.parentStep.isFocused then GQ:SetStepFocus(goal.parentStep) end -- grab focus for clicked step

	if button=="LeftButton" and not goal.parentStep.isFocused then return end -- don't act if we are not focused

	if button=="LeftButton" then
		goal:OnClick(button)
	else
		GQ:OpenQuickStepMenu(stepframe,goalframe)
	end
end

function GQ:GoalOnEnter(goalframe)
	local goal = goalframe.goal or goalframe.tipgoal
	if not goal then return end

	local step = goal.parentStep

	if not step.isFocused or step:IsCurrentlySticky() then 
		return 
	end

	local wayline,infoline,image

	if goal.tooltip and not self.db.profile.tooltipsbelow then
		infoline = "|cff00ff00"..goal.tooltip.."|r"
	end
	local tooltipline,hyperlink = goal:GetTooltip()
	if goal.x and goal.y and goal.map then
		-- if locked or force_noway, then no clicking, bare info.
		local tipformat = (self.db.profile.windowlocked or goal.force_noway) and 'tooltip_waypoint_coords' or 'tooltip_waypoint'
		local coords = math.round(goal.x*100)..";"..math.round(goal.y*100)
		local map = (GQ.GetMapNameByID(goal.map) or ('#'..goal.map)).." "
		wayline = L[tipformat]	:format(goal.waytitle and (goal.waytitle.." ("..map..coords..")") or map..coords)
	end

	if goal.image then
		image = DIR.."\\Images\\"..goal.image..".tga"
	end

	if infoline or wayline or image or goal.itemid or tooltipline or hyperlink then
		GameTooltip:SetOwner(self.Frame,"ANCHOR_BOTTOM") --GameTooltip moved above the Viewer
		GameTooltip:ClearAllPoints()
		--[[
		GameTooltip:ClearAllPoints()
		GameTooltip:SetOwner(goalframe,"ANCHOR_TOP") --GameTooltip moved above the goal. Cursor overlaps it when it's below.
		--]]
		--GameTooltip:SetOwner(goalframe,"ANCHOR_TOPLEFT")
		--GameTooltip:SetPoint("BOTTOM",goalframe,"TOP")

		if goal.itemid then
			GameTooltip:SetOwner(goalframe,"ANCHOR_LEFT") -- Items tooltip to the left of the line
			GameTooltip:ClearAllPoints()
			GameTooltip:SetPoint("BOTTOMRIGHT",goalframe,"TOPLEFT")

			GameTooltip:SetHyperlink("item:"..goal.itemid)
			--else
			--	GameTooltip:SetText(goal:GetText())
		end

		local lines={}

		local lines=1
		if infoline then  GameTooltip:AddLine(infoline,1,1,1)  lines=lines+1  end
		if wayline then  GameTooltip:AddLine(wayline,1,1,1)  lines=lines+1  end
		if tooltipline then  GameTooltip:AddLine(tooltipline,1,1,1)  lines=lines+1  end

		for line=1,lines do  
			local linewidth = _G['GameTooltipTextLeft'..line]:GetWidth()
			if not GQ.IsSecret(linewidth) and linewidth>300 then _G['GameTooltipTextLeft'..line]:SetWidth(300) end
		end

		if hyperlink then GameTooltip:SetHyperlink(hyperlink) end

		GameTooltip:Show()

		if image then
			local img

			--[[
			local img = _G['GameTooltipGoatQuestImage']
			if not img then
				img = GameTooltip:CreateTexture("GameTooltipGoatQuestImage","ARTWORK")
			end
			--]]
			img = GameTooltipTexture1
			GameTooltip:AddLine(" ")
			GameTooltip:AddTexture(image)
			img:ClearAllPoints()
			img:SetPoint("TOPLEFT",_G['GameTooltipTextLeft'..lines],"BOTTOMLEFT")
			--img:SetTexture(image)
			img:SetWidth(128)
			img:SetHeight(128)
			img:Show()
			GameTooltip:Show()
			GameTooltip:SetHeight(150 + lines*20)
		end
	end

	if goal:IsViableDressup() then
		ShowInspectCursor()
	else
		ResetCursor()
	end
end

function GQ:GoalOnLeave(goalframe,num)
	if goalframe and (GameTooltip:GetOwner()==goalframe or GameTooltip:GetOwner()==self.Frame) then GameTooltip:Hide() end
end


local function insert_guides(arr,guides)
	local data
	for i,guide in ipairs(guides) do
		data = GQ:GetGuideByTitle(guide.full)
		local item = {
			text = guide.step and L['menu_last_entry']:format(guide.short or "?",guide.step) or (guide.short or "?"),
			checked = function() return GQ.CurrentGuideName==guide.full end,
			func = function()  CloseDropDownForks()  GQ:SetGuide(guide.full,guide.step) end,
			tooltipTitle = data and data.description and guide.short,
			tooltipText = data and data.description,
			tooltipOnButton = true,
		}
		tinsert(arr,item)
	end
end

local function group_to_array(group)
	local arr = {}
	for i,group in ipairs(group.groups) do
		local item = {
			text = group.name,
			hasArrow = true,
			menuList = group_to_array(group),
			keepShownOnClick = true,
			func = function(self) _G[self:GetName().."Check"]:Hide() end,
			--notCheckable = true
		}
		--if #item.menuTable>0 then
			tinsert(arr,item)
		--end
	end
	insert_guides(arr,group.guides)
	return arr
end

function GQ:GetMostRecentGuide(gtype)
	local guides = self.db.char.guides_history[gtype]
	if guides and guides[1] then
		local firstguide = guides[1]
		local g = self:GetGuideByTitle(firstguide[1])
		if g then
			g.CurrentStepNum = firstguide[2]
			return g

		end
		return nil
	end
	return nil

end

-- RETIRE AFTER NEW MENU
function GQ:GetGuidesHistory(gtype)
	local unwrapped={}
	for gi,guide_and_step in ipairs(self.db.char.guides_history) do
		if not gtype or guide_and_step[1]:find(gtype.."\\",1,1)==1 then
			local g = self:GetGuideByTitle(guide_and_step[1])
			if g then
				g.CurrentStepNum = guide_and_step[2]
				tinsert(unwrapped,g)
			end
		end
	end
	return unwrapped
end

function GQ:OpenGuideMenu(path)
	if self.Menu then 
		if path=="HOME" and GQ.CurrentGuide and not GQ.CurrentGuideName:match("GOLD\\") and not GQ.CurrentGuideName:match("PETSMOUNTS\\Pets") then
			GQ.GuideMenu:Show()
			GQ.GuideMenu:Open("Current")
			return
		end
		GQ.GuideMenu:Show(path)
	end
end

function GQ:FakeCompleteGoal(goal,docomplete)
	if docomplete==nil then docomplete=not self.recentlyCompletedGoals[goal] end
	if docomplete then
		--self.recentlyCompletedGoals[goal]=true
		self.recentlyStickiedGoals[goal]=true
	else
		self.recentlyCompletedGoals[goal]=false
		self.recentlyStickiedGoals[goal]=false
		self.recentlyVisitedCoords[goal]=false
	end
	--goal.fake_complete = true
	self.pause=nil
	self.LastSkip=1
	--self.AutoskipTemp = true
	self:TryToCompleteStep(true)
end

function GQ:FakeCompleteQuest(questid,docomplete,questtitle)
	self.completedQuests[questtitle]=docomplete
	if questid then self.completedQuests[questid]=docomplete end
	self:Print("Marking quest '"..questtitle.."'"..(questid and " (#"..questid..")" or "").." as "..(docomplete and "completed" or "incomplete"))
	self:TryToCompleteStep(true)
end

function GQ:OpenMapToQuest(questid)
	do return end --unused
	local WorldMap_OpenToQuest --removed
	if self.questsbyid[questid] and WorldMap_OpenToQuest then -- 3.3.0
		WorldMap_OpenToQuest(questid)
		local done,posX,posY,obj = QuestPOIGetIconInfo(questid)
		if posX or posY then
			local q = self.questsbyid[questid]
			local title
			if q then title=q.title end
			self:Debug("Setting waypoint to POI: %d %d",posX*100,posY*100)
			self.Pointer:SetWaypoint(nil,nil,posX*100,posY*100,{title=title,type="manual"})
		end
	end
end

function GQ:FindNextActiveQuest()
	if not self.CurrentGuide then return end
	for stepnum=self.CurrentStep.num+1,#self.CurrentGuide.steps do
		local step=self.CurrentGuide.steps[stepnum]
		if not step then break end
		for gi,goal in ipairs(step.goals) do
			if goal.questid and PlayerIsOnQuest(goal.questid) then
				self:FocusStep(stepnum)
				return
			end
		end
	end
	self:Print("No steps found that match quests in your log.")
end

local lastquestid,lastquesttitle
local showqiretries=0
--[[
function GQ:ShowQuestInfo(questid,questtitle,indump)
	self:Debug("Showing chains for "..tostring(questid).." '"..tostring(questtitle).."'")
	if not questid then questid=lastquestid questtitle=lastquesttitle else showqiretries=0 end
	lastquestid=questid lastquesttitle=questtitle showqiretries=showqiretries+1

	--if InCombatLockdown() then return end
	local max = self.maxQuestLevels[questid] or -1
	local lev = self.mentionedQuests[questid] or -1
	local col = GetQuestDifficultyColor(lev)
	local s
	if (max>lev) then
		s = ("Quest |cff%02x%02x%02x[|Hquest:%d:%d|h%s|h]|r (#%d) [level %s + chains to %s]"):format(col.r*255,col.g*255,col.b*255,questid,UnitLevel("player"),questtitle,questid,lev>0 and lev or "?",max>0 and max or "?")
	else
		s = ("Quest |cff%02x%02x%02x[|Hquest:%d:%d|h%s|h]|r (#%d) [level %s]"):format(col.r*255,col.g*255,col.b*255,questid,UnitLevel("player"),questtitle,questid,lev>0 and lev or "?")
	end

	local pre = self.Chains[questid]
	if pre then
		if type(pre)=="number" then
			s = s .. "\nPrerequisite:"
			pre={"",pre}
		else
			s = s .. "\nPrerequisites ("..(pre[1]=="AND" and "ALL" or "ANY").."):"
		end
		for i=2,#pre do
			local id = tonumber(pre[i])
			local quest,inlog = self.Localizers:GetQuestData(id)
			lev = self.mentionedQuests[id] or -1
			local caching=nil
			if (quest and not caching) then
				col = GetQuestDifficultyColor(lev)
				s=s..("\n- |cff%02x%02x%02x[|Hquest:%d:%d|h%s|h]|r (#%d) [level %s]"):format(col.r*255,col.g*255,col.b*255,id,UnitLevel("player"),quest.title,id,lev>0 and lev or "?")
			else
				if showqiretries<5 then
					if showqiretries==1 then self:Print("Retrieving quest information, please wait...") end
					self:ScheduleTimer("ShowQuestInfo",1) return
				else
					s=s.."\n- #"..id.." (retrieving quest information, please try again)"
					caching=true
				end
			end
		end
	end
	local mentioned = self:GetMentionedFollowups(questid)
	local q
	if #mentioned>1 then
		q = "Follow-ups:"
		for i=2,#mentioned do
			local id = tonumber(mentioned[i][1])
			local quest = self.Localizers:GetQuestData(id)
			lev = mentioned[i][2]
			local caching=nil
			if (quest and not caching) then
				col = GetQuestDifficultyColor(lev)
				q=q..("\n- |cff%02x%02x%02x[|Hquest:%d:%d|h%s|h]|r (#%d) [level %s]"):format(col.r*255,col.g*255,col.b*255,id,UnitLevel("player"),quest.title,id,lev>0 and lev or "?")
			else
				if showqiretries<5 then
					if showqiretries==1 then self:Print("Retrieving quest information, please wait...") end
					self:ScheduleTimer("ShowQuestInfo",1) return
				else
					q=q.."\n- #"..id.." (retrieving quest information, please try again)"
					caching=true
				end
			end
		end
	else
		q = "No follow-ups."
	end

	local rem=""
	local remaining = self:GetQuestRemainingInChain(questid)
	if remaining then
		rem = "\n\n"..remaining.." quests remain till end of chain."
	end

	if indump then
		self:ShowDump(s.."\n"..q..rem,"Quest information",false)
	else
		self:Print("Quest information:")
		local ss = s.."\n"..q..rem
		local sslines = {strsplit("\n",ss)}
		for i,l in ipairs(sslines) do print(l) end
	end
end

function GQ:ToggleWatchQuest(questid)
end
--]]

function GQ:OpenQuickStepMenu(stepframe,goalframe)
	self.Frame.Menu.stepframe=stepframe
	self.Frame.Menu.goalframe=goalframe

	local step = stepframe.step
	local goal = goalframe.goal or goalframe.tipgoal

	local menu = {
		{
			text = L['qmenu_step']:format(step.num,step.level or "?"),
			isTitle = true,
			notCheckable=true,
		}
	}
	tinsert(menu,{
		text = L['qmenu_step_skip'],
		tooltipTitle = L['qmenu_step_skip'],
		tooltipText = L["qmenu_step_skip_desc"],
		tooltipOnButton = true,
		func = function() self:SkipStep(true) end,
		--icon = GQ.DIR .. "\\Skins\\minimaparrow-green-dot",
		keepShownOnClick = false,
		notCheckable=true, indented=true,
	})


	if goal:IsCompleteable() or (goal.map and goal.x) then
		tinsert(menu,{
			text = L['qmenu_goal']:format(goal:GetText():gsub("%|r",""):gsub("%|c........","")),
			isTitle = true,
			notCheckable=true,
		})
	end

	if goal.map and goal.x then
		local map = GQ.GetMapNameByID(goal.map) or ('#'..goal.map)
		tinsert(menu,{
			text = L['qmenu_goal_waypoint']:format(map,goal.x*100,goal.y*100),
			tooltipTitle = L['qmenu_goal_waypoint']:format(map,goal.x*100,goal.y*100),
			tooltipText = L['qmenu_goal_waypoint_desc'],
			tooltipOnButton = true,
			func = function()  goal.parentStep:CycleWaypointTo(goal.num)  end,
			notCheckable=true, indented=true,
		})
	end

	--[[ CreatureViewer removal, 7.0
		local id = goal.npcid or (goal.mobs and goal.mobs[1] and goal.mobs[1].id) or (goal.action=="kill" and goal.targetid)
		if id then
			local name = self.Localizers:GetTranslatedNPC(id) or "(creature)"
			tinsert(menu,{
				text = L['qmenu_goal_creature_data']:format(name),
				tooltipTitle = L['qmenu_goal_creature'],
				tooltipTitleText = L['qmenu_goal_creature_desc']:format(name),
				tooltipOnButton = true,
				func = function()
					self.db.profile.viewcreature=true
					self.CreatureViewer:ShowCreature(id,name)
					if self.CreatureViewer.failed then
						self:Print("Creature is not yet available - too far.")
					end
				end,
				--Try both and hopefully one works.
				isNotRadio=true,
			})
		end
	--]]

	if goal:IsCompleteable() then
		tinsert(menu,{
			text = L['qmenu_goal_complete'],
			tooltipTitle = L['qmenu_goal_complete'],
			tooltipText = L['qmenu_goal_complete_desc'],
			tooltipOnButton = true,
			checked = function()  return goal:IsComplete()  end,
			func = function()  self:FakeCompleteGoal(goal,not self.recentlyCompletedGoals[goal])  end,
			isNotRadio=true,
		})
		if goal.quest then
			local quest,inlog = self.Localizers:GetQuestData(goal.quest.id)
			local title = quest and quest.title or "?"
			tinsert(menu,{
				text = L['qmenu_quest']:format(title),
				isTitle = true,
				notCheckable = true,
			})
			--[[
			-- no quest info anymore
			tinsert(menu,{
				text = L['qmenu_quest_info']:format(title),
				tooltipTitle = L['qmenu_quest_info']:format(title),
				tooltipText = L['qmenu_quest_info_desc'],
				tooltipOnButton = true,
				func = function() self:ShowQuestInfo(goal.quest.id,title,IsShiftKeyDown())  end,
			})
			--]]
			if inlog then
				if GQ.IsRetail or GQ.IsForever then
					tinsert(menu,{
						text = L['qmenu_quest_openlog'],
						tooltipTitle = L['qmenu_quest_openlog'],
						tooltipText = L['qmenu_quest_openlog_desc'],
						tooltipOnButton = true,
						func = function() QuestMapFrame_OpenToQuestDetails(goal.quest.id) end,
					})
					tinsert(menu,{
						text = L['qmenu_quest_watched'],
						tooltipTitle = L['qmenu_quest_watched'],
						tooltipText = L['qmenu_quest_watched_desc'],
						tooltipOnButton = true,
						checked = function() return C_QuestLog.GetQuestWatchType(goal.quest.id) end,
						func = function()
							if C_QuestLog.GetQuestWatchType(goal.quest.id) then
								C_QuestLog.RemoveQuestWatch(goal.quest.id)
								--WatchFrame_Update()
							else
								if ( C_QuestLog.GetNumQuestWatches() < Constants.QuestWatchConsts.MAX_QUEST_WATCHES ) then
									C_QuestLog.AddQuestWatch(goal.quest.id)
									--WatchFrame_Update()
								end
							end
						end,
						isNotRadio=true,
					})
				end
				local quest_map = GetQuestUiMapID and GetQuestUiMapID(goal.quest.id)
				if quest_map and quest_map>0 then
					tinsert(menu,{
						text = L['qmenu_quest_openmap'],
						tooltipTitle = L['qmenu_quest_openmap'],
						tooltipText = L['qmenu_quest_openmap_desc'],
						tooltipOnButton = true,
						func = function()  OpenWorldMap(quest_map)  GQ:PointToQuest(quest_map,goal.quest.id)  end,
					})
				end
			end

			-- woo, LightHeaded support!
			if LightHeaded then
				tinsert(menu,{
					text = L['qmenu_quest_lightheaded'],
					tooltipTitle = L['qmenu_quest_lightheaded'],
					tooltipText = L['qmenu_quest_lightheaded_desc'],
					tooltipOnButton = true,
					func = function()
						if IsShiftKeyDown() then
							local s = LightHeaded:GetPageText(goal.quest.id)
							self:ShowDump(s,"Quest info - courtesy of LightHeaded")
						else
							ShowUIPanel(QuestLogFrame)
							LightHeaded:UpdateFrame(goal.quest.id, LightHeaded.db.profile.singlepage and -1 or 1)
						end
					end,
				})
			end

			if self.db.profile.debug_display then
				tinsert(menu,{
					text = "(debug) force quest complete",
					tooltipTitle = self.completedQuests[goal.questid] and L['qmenu_quest_complete_tip'] or L['qmenu_quest_complete_in_tip'],
					tooltipText = self.completedQuests[goal.questid] and L['qmenu_quest_complete_desc'] or L['qmenu_quest_complete_in_desc'],
					checked = function()  return self.completedQuests[goal.questid]  end,
					func = function()  self:FakeCompleteQuest(goal.questid,not self.completedQuests[goal.questid],goal.quest.title)  end,
					isNotRadio=true,
				})
				tinsert(menu,{
					text = "(debug) trace quest log changes for this quest",
					checked = function()  return self.DEBUG_QUEST_ID==goal.questid  end,
					func = function()  if self.DEBUG_QUEST_ID==goal.questid then self.DEBUG_QUEST_ID=nil self:Debug("Not tracing.") else self.DEBUG_QUEST_ID=goal.questid self:Debug("Tracing quest %d",goal.questid) end end,
					isNotRadio=true,
				})
			end
			--[[
			tinsert(menu,{
				text = L['qmenu_quest_complete'],
				tooltipTitle = self.completedQuests[goal.quest.id] and L['qmenu_quest_complete_tip'] or L['qmenu_quest_complete_in_tip'],
				tooltipText = self.completedQuests[goal.quest.id] and L['qmenu_quest_complete_desc'] or L['qmenu_quest_complete_in_desc'],
				checked = function()  return self.completedQuests[goal.quest.id]  end,
				func = function()  self:FakeCompleteQuest(goal.quest.id,not self.completedQuests[goal.quest.id],goal.quest.title)  end,
				isNotRadio=true,
			})
			--]]
		end
	end
	if self.borderfadedout and not self.db.profile.delayshowborder then
		tinsert(menu,{
			text = L['opt_group_display'],
			isTitle = true,
			notCheckable=true,
		})
		tinsert(menu,{
			text = L['qmenu_border_restore'],
			tooltipTitle = L['qmenu_border_restore'],
			tooltipText = L['qmenu_border_restore_desc'],
			tooltipOnButton = true,
			--checked = function()  return self.db.profile.hideborder  end,
			func = function()  
				GQ:Guides_Mini_to_Full()
				end,
			isNotRadio=true,
		})
	end

	tinsert(menu,{
		text = L['qmenu_shareto'],
		hasArrow = true,
		isNotRadio=true,
		notCheckable=true, indented=true,
		menuList = {
			{ text = L['qmenu_shareto_party'], checked = function() return self.db.profile.share_target=="PARTY" end, func = function() self.db.profile.share_target="PARTY"  CloseDropDownForks() end },
			{ text = L['qmenu_shareto_raid'], checked = function() return self.db.profile.share_target=="RAID" end, func = function() self.db.profile.share_target="RAID" CloseDropDownForks() end },
			{ text = L['qmenu_shareto_say'], checked = function() return self.db.profile.share_target=="SAY" end, func = function() self.db.profile.share_target="SAY" CloseDropDownForks() end },
		}
	})

	local rolegoals
	for i,g in ipairs(step.goals) do  if g.grouprole then   rolegoals=true  break  end end
	if rolegoals then
		tinsert(menu,{
			text = L['qmenu_share_allgrouproles'],
			func = function() step:ShareToChat(self.db.profile.share_target or "SAY","rolegoals","brand") end,
		})
	end

	--[[
		{
			text = L['opt_miniresizeup'],
			tooltipTitle = L['opt_miniresizeup'],
			func = function() self:SetOption("Display","resizeup") end,
			checked = function() return self.db.profile.resizeup end,
			isNotRadio=true,
			keepShownOnClick = true,
		},
		{
			text = L['opt_hideincombat'],
			tooltipTitle = L['opt_hideincombat'],
			tooltipText = L['opt_hideincombat_desc'],
			checked = function()  return self.db.profile.hideincombat  end,
			func = function()  self:SetOption("Display","hideincombat")  end,
			isNotRadio=true,
			keepShownOnClick = true,
		},
		{
			text = L['opt_configuration'],
			tooltipTitle = L['opt_configuration'],
			tooltipText = L['opt_configuration_desc'],
			isNotRadio=true,
			notCheckable=true,
			func = function()  self:OpenOptions()  end,
		},
		{
			name = L['opt_group_step'],
			isTitle = true,
		},
		{
			text = L["opt_do_searchforgoal"],
			notCheckable = true,
			func = function() GQ:SearchForCompleteableGoal() end
		}
	--]]

	tinsert(menu,{
		text = L['qmenu_close'],
		hasArrow = false,
		func = function()  CloseDropDownForks() end,
		notCheckable=true, indented=true,
	})

	EasyFork(menu,self.Frame.Menu,goalframe,0,0,"MENU",3)  -- replacement for EasyMenu, just not as insecure.
end

--[[
function GQ:OpenQuickSteps()
	local menu = {
		{
			text=L["opt_showcountsteps"],
			isTitle = true,
			notCheckable = true,
		},
		{
			text=L["opt_showbriefsteps"],
			func=function() self:SetOption("Step","showbriefsteps") end,
			checked=function() return self.db.profile.showbriefsteps end,
			isNotRadio = true,
		},
		{
			text=L["opt_showcountsteps_all"],
			func=function() self:SetOption("Step","showcountsteps 0") end,
			checked=function() return self.db.profile.showallsteps end,
		},
		{
			text='1',
			func=function() self:SetOption("Step","showcountsteps 1") end,
			checked=function() return not self.db.profile.showallsteps and self.db.profile.showcountsteps==1 end,
		},
		{
			text='2',
			func=function() self:SetOption("Step","showcountsteps 2") end,
			checked=function() return not self.db.profile.showallsteps and self.db.profile.showcountsteps==2 end,
		},
		{
			text='3',
			func=function() self:SetOption("Step","showcountsteps 3") end,
			checked=function() return not self.db.profile.showallsteps and self.db.profile.showcountsteps==3 end,
		},
		{
			text='4',
			func=function() self:SetOption("Step","showcountsteps 4") end,
			checked=function() return not self.db.profile.showallsteps and self.db.profile.showcountsteps==4 end,
		},
		{
			text='5',
			func=function() self:SetOption("Step","showcountsteps 5") end,
			checked=function() return not self.db.profile.showallsteps and self.db.profile.showcountsteps==5 end,
		},
	}

	GQFMenu.onHide = function()
		GQFMenu.stepframe=nil
		GQFMenu.goalframe=nil
	end

	EasyFork(menu,GQFMenu,"cursor",0,0,"MENU",3)
end
--]]

function GQ:OpenMapToQuestGoal(questid,goalnum)
end

local function split(str,sep)
	local fields = {}
	str = str..sep
	str:gsub("(.-)"..sep, function(c) tinsert(fields, c) end)
	return fields
end

function GQ:FindOrCreateGroup(group,title,onlyfind)
	local path = split(title,"\\")

	-- create one
	local partialpath
	for i=1,#path do
		local found = false
		for n,gr in ipairs(group.groups) do
			if gr.name==path[i] then
				found=true
				group=gr
			end
		end
		partialpath = (partialpath and partialpath.."\\" or "") .. path[i]
		if not found then
			if onlyfind then 
				return false
			else
				local gr = {name=path[i],fullpath=partialpath,groups={},guides={},ord=#group.groups+1}
				tinsert(group.groups,gr)
				if i==1 then  -- we're at top level
					SortGroups(group, false and "no recurse")
					self:SendMessage("GQ_LOADING_TOPLEVEL_GROUPS_UPDATED")
				end
				group=gr
			end
		end
	end
	return group
end

-- IN: "GoatQuest's Alliance Leveling Guides"
-- OUT: "Leveling"
function GQ:SanitizeGuideTitle(title)
	if not title then return end
	title = title:gsub([[\\]],[[\]])
	title = title:gsub("^GoatQuest's ","")
	title = title :gsub("^Alliance ","") :gsub("^Horde ","")  -- code-side fix for "common" guides.
	--title = title :gsub(" Guide$","") :gsub(" Guides$","")

	-- fix old-style guide paths
	title = title
		:gsub("^Event.-\\","EVENTS\\")
		:gsub("^Dail.-\\","DAILIES\\")
		:gsub("^Leveling.-\\","LEVELING\\")
		:gsub("^Loremaster.-\\","LOREMASTER\\")
		:gsub("^Profession.-\\","PROFESSIONS\\")
		:gsub("^Achievement.-\\","ACHIEVEMENTS\\")
		:gsub("^Pet.-\\","PETSMOUNTS\\")
		:gsub("^Reputation.-\\","REPUTATIONS\\")
		:gsub("^Title.-\\","TITLES\\")
		:gsub("^Macro.-\\","MACROS\\")
		:gsub("^Dungeon.-\\","DUNGEONS\\")
		:gsub("^Gear.-\\","GEAR\\")
		:gsub("^Test Guide.-\\","TEST\\")
		:gsub("^Misc.-\\","MISC\\")

	return title
end

function GQ:GetShortGuideTitle(longtitle)
	local sane = GQ:SanitizeGuideTitle(longtitle)
	return sane:match("([^\\]*)$") or longtitle
end

function GQ:RegisterGuide(title,header,data)
	title = self:SanitizeGuideTitle(title)
	
	if header.linked then
		local newlinked = {}
		for _,linkname in ipairs(header.linked) do
			if linkname:sub(-1) == "\\" then linkname = linkname:sub(1,-2) end
			newlinked[self:SanitizeGuideTitle(linkname)]=true
		end
		header.linked = newlinked
	end
	
	local guide = GQ.GuideProto:New(title,header,data)

	if GQ.BETAguides and guide then guide.beta=true end
	if not guide then return end

	--[[
	local file,line = GQ.F.GetCurrentPath(3)
	header.source_file = file
	header.source_line = line
	--]]

	tinsert(self.registeredguides,guide)
	if not self.registered_guide_types[guide.type] then self.registered_guide_types[guide.type]={} end
	tinsert(self.registered_guide_types[guide.type],guide)
end

local placeholder_header_data = {}
local placeholder_get_status = function() return "MISSING","" end
local placeholder_empty_function = function() end
function GQ:RegisterGuidePlaceholder(title)
	title = self:SanitizeGuideTitle(title)

	local path,tit = title:match("^(.*)\\+(.-)$")
	if not path then path=title end
	local guidetype = path:match("^(.-)\\") or path

	local guide = {
		title=title,
		title_short=tit or title,
		num=#GQ.registeredguides+1,
		type=guidetype,
		missing=true,
		headerdata=placeholder_header_data,
		GetStatus=placeholder_get_status,
		ParseHeader=placeholder_empty_function,
		Parse=placeholder_empty_function,
		IsFavourite=placeholder_empty_function,
		GetCompletion=placeholder_empty_function,
	}

	tinsert(self.registeredguides,guide)
end


function GQ.BETASTART()
	GQ.BETAguides=true
end
function GQ.BETAEND()
	GQ.BETAguides=false
end

GQ.registered_mapspotset_groups = { groups={},guides={}}

function GQ:RegisterMapSpots(title,data)
	local group,tit = title:match("^(.*)\\+(.-)$")
	if group then
		group = self:FindOrCreateGroup(self.registered_mapspotset_groups,group)
	else
		group = self.registered_mapspotset_groups
	end

	local set = self.MapSpotSetProto:NewRaw(title,tit or title,data)

	tinsert(group.guides,{full=title,short=tit or title,num=#self.registeredmapspotsets+1})
	tinsert(self.registeredmapspotsets,set)
end

GQ.registered_sortings = {}
local test=0
function GQ:RegisterGuideSorting(array)
	for i,gr in ipairs(array) do
		self.registered_sortings[gr]=i
	end
end

GQ.registered_includes = {}
function GQ:RegisterInclude(title,text)
	self.registered_includes[title]={text=text}

	self.registered_includes[title].GetParsed = function (self,params)
		local function parse_param(param)
			return params and params[param] or ""
		end
		return self.text:gsub("%%(%w+)%%",parse_param)
	end
end

GQ.registered_functions = {}
function GQ:RegisterFunction(title,func)
	self.registered_functions[title]={func=func}

	self.registered_functions[title].GetParsed = function (self,params)
		local function parse_param(param)
			return params[param] or ""
		end
		local text = func()
		return text:gsub("%%(%w+)%%",parse_param)
	end
end

--[[
function GQ:UnregisterGuide(name)
	local data
	if type(name)=="number" then
		if self.registeredguides[name] then
			data = self.registeredguides[name].data
			table.remove(self.registeredguides,name)
			self:Print("Unregistered guide number: "..name)
		else
			self:Print("Cannot find guide number: "..name)
			return false
		end
	else
		local i,v
		for i,v in ipairs(self.registeredguides) do
			if v.title==name then
				data = v
				table.remove(self.registeredguides,i)
				self:Print("Unregistered guide: "..name)
			end
		end
		if not data then
			self:Print("Cannot find guide: "..name)
			return false
		end
	end
	if data.is_stored then
		self.db.global.storedguides[name] = nil
		self:Print("Removed stored data for: "..name)
	end
	return true
end
--]]

--[[
function GQ:RegisterStoredGuides()
	local k,v
	for k,v in pairs(self.db.global.storedguides) do
		table.insert(self.registeredguides,{title=k,data=v,is_stored=true})
		self:Print("Retrieved guide "..k.." from storage.")
	end
end
--]]

function GQ:UpdateMapButton()
	if self.db.profile.showmapbutton then GoatQuestMapIcon:Show() else GoatQuestMapIcon:Hide() end
end

GQ.ProfilerRunning=nil -- Just not to forget

function GQ:ProfilerEnable()
	SetCVar("scriptProfile","1")
	ReloadUI()
end

-- This attempts to create a CSV profile report based on any GQ function we can get our hands on
-- If you are doing funny stuff with functions, keep in mind that any function is accounted only once
-- so if a function is encountered in several namespaces, you only get one
function GQ:ProfilerReport()
    -- Sanity
    if GetCVar("scriptProfile")~="1" and not self.ProfilerMode then
        self:Print("Profiling is not enabled, cannot do this, sorry. Please enable the profiler in GoatQuest settings and rety.")
        return
    end

	if self.ProfilerRunning then
		local gscope=getfenv(0) -- Global scope
		local culprits={} -- Table of all functions we are interested in
		local tablesVisited={} -- Tables we have already touched, a countermeasure against cyclical links
		tablesVisited[tablesVisited]=true
		tablesVisited[culprits]=true

		local function tryToRegisterFunc(f,n)
			if not culprits[f] or #culprits[f]>#n then
				culprits[f]={name=n} -- Yeah the function is the table key, you saw it right ~aprotas
			end
		end

		-- First, let's gather the culprits
		local function inspect(obj,objname) -- local func to recursively inspect an object and its subobjects and so on
			tablesVisited[obj]=true
			for kk,vv in pairs(obj) do
				if type(vv)=="function" then
					tryToRegisterFunc(vv,objname..":"..tostring(kk))
					elseif type(vv)=="table" and not tablesVisited[vv] then
					inspect(vv,objname.."."..tostring(kk))
				end
			end
		end
		inspect(gscope,"")

		-- Getting the data and saving them in a database
		self.db.profile.profiler_stats={}
		for fun,tab in pairs(culprits) do
			local _
			tab.fulltime,tab.count=GetFunctionCPUUsage(fun,true)
			tab.puretime,_=GetFunctionCPUUsage(fun,false)
			if tab.count>0 then -- We don't want THIS much litter, do we?
				table.insert(self.db.profile.profiler_stats,{name=tab.name,fulltime=tab.fulltime,
						puretime=tab.puretime,count=tab.count,fullavg=tab.fulltime/tab.count,pureavg=tab.puretime/tab.count})
			end
		end

		-- Nice, now we have to sort it and find 100-top entries, I guess that's gonna be enough for testing and not too much for overflood
		table.sort(self.db.profile.profiler_stats,function(n1,n2)return n1.fulltime>n2.fulltime end)

		local s=""
		s="fulltime,puretime,count,fullavg,pureavg,func\n"
		for i=1,min(#self.db.profile.profiler_stats,100) do
			local v=self.db.profile.profiler_stats[i]
			s=s..v.fulltime..","..v.puretime..","..v.count..","..v.fullavg..","..v.pureavg..","..v.name.."\n"
		end

		self:ShowDump(s,"Profiler Report",{readonly=true}) -- TODO emails and stuff,make it readonly
		self:Print("Profiler report created.")
		self.ProfilerRunning=nil
	else
		self:Print("Profiling recording started.")
		self.ProfilerRunning=true
	end
    -- Reset the counters
    ResetCPUUsage()
end


local math_floor = math.floor
local function round(num, digits)
	-- banker's rounding
	local mantissa = 10^digits
	local norm = num*mantissa
	norm = norm + 0.5
	local norm_f = math_floor(norm)
	if norm == norm_f and (norm_f % 2) ~= 0 then
		return (norm_f-1)/mantissa
	end
	return norm_f/mantissa
end

function GQ:Echo (s)
	--if not self.db.profile.silent then
	self:Print(tostring(s))
	--end
end


local debugcolor="|cffff88dd"

local last_t=0
local mscycle=false
local mscolors={"|cffffcc00","|cffffaa00"}
local timecolor=mscolors[1]

GQ.DEBUG_DEPTH=0
GQ.DEBUG_STACK={}

local REPLACECODE = "|c00000000"

local framestart_t = 0
local display={}
function GQ:Debug (msg,...)
	local profile = GQ.db and GQ.db.profile   if not profile then return end
	if not profile.debug then return end
	
	--local initial_time=debugprofilestop()

	table.wipe(display)
	for i=1,select("#",...) do display[i]=select(i,...) or "nil" end
	-- just in case:
	table.insert(display,0) table.insert(display,0) table.insert(display,0)

	local depth=0
	if profile.debug_showdepth then debugstack():gsub("\n",function() depth=depth+1 end) end

	local flagsmsg
	local stack_depth=2
	local stackflag,stack_delayed_change
	local show_warning
	local replace_id
	while msg:sub(1,1)=="&" do
		local flag,rest = msg:match("^&([a-zA-Z0-9_]+)%s*(.*)$")
		if flag then
			if flag=="_SUB0" then
				stack_depth=nil
			elseif flag=="_SUB" then
				stack_depth=3
			elseif flag=="_SUB2" then
				stack_depth=4
			elseif flag=="_SUB3" then
				stack_depth=5
			elseif flag=="_PUSH" then
				stack_delayed_change=1
				stackflag = "-> "
				tinsert(GQ.DEBUG_STACK,msg)
			elseif flag=="_POP" then
				GQ.DEBUG_DEPTH=max(0,GQ.DEBUG_DEPTH-1)
				tremove(GQ.DEBUG_STACK)
				stackflag = "<- "
			elseif flag=="_WARN" then
				show_warning=true
			elseif flag=="_REPLACE" then
				replace_id,rest = rest:match("^(%S+)%s*(.*)$")
			else
				local flagdata = GQ.db.profile.debug_flags and GQ.db.profile.debug_flags[flag]
				if flagdata==false then return end -- Any flag false = message is out.  "false" strictly, otherwise assume it SET!
				if type(flagdata)=="table" then
					if not flagdata.enabled then return end
					if flagdata.color then flag = "|c"..flagdata.color..flag.."|r" end
				end
				flagsmsg = (flagsmsg and (flagsmsg.." ") or "") .. "[" .. flag .. "]"
			end
			msg = rest
		else
			msg="?"..msg:sub(2) -- failsafe, cut the & off
		end
	end

	--[[
		-- maybe... no.
		if GQ.SHOW_STACKDEPTH_IN_DEBUG then
		local i=0
		msg:gsub("\n",
	--]]

	if stackflag then msg = stackflag..msg end
	msg = strrep("- ",GQ.DEBUG_DEPTH) .. msg
	if stack_delayed_change then GQ.DEBUG_DEPTH=GQ.DEBUG_DEPTH+stack_delayed_change end

	if flagsmsg then msg = flagsmsg.." "..msg end
	if replace_id then msg = msg .. REPLACECODE.."["..replace_id.."]|r" end
	msg = strrep(".",depth) .. " " .. msg
	local formatted_msg = format(tostring(msg),unpack(display)) :gsub("|r",debugcolor)

	local func
	if stack_depth and profile.debug_showcall then
		func = debugstack(stack_depth,1,-1)
		func = func:match("^(.-)\n") or func
		func = func:gsub(".*\\([^\\]-:%d+): in function `(.-)'","%1:%2") or func
		func = func:gsub(".*\\([^\\]-:%d+): in function.-string \"*(:.-)\"","%1:%2") or func
		func = func:gsub(".*\\([^\\]-:%d+): in function <.->","%1:<local>") or func
	end

	if true then -- self and self.db and self.db.profile and self.db.profile.debug and not self.db.profile.quiet then
		self.DebugI = (self.DebugI or 0) + 1
		--func = func:match("in function `(.-)'") or func
		--func = func:match("in function.-string \"*(:.-)\"") or func
		local current_time = debugprofilestop()
		local t = GetTime()
		if t~=last_t then
			framestart_t = current_time
			mscycle=not mscycle
			last_t=t
			timecolor=mscolors[mscycle and 1 or 2]
		end
		local debugms = current_time-framestart_t

		local chatframe = GQ.debugframe
		if not chatframe then
			chatframe = _G[GQ.db.profile.debug_frame or "ChatFrame1"]
			GQ.debugframe = chatframe
		end
		if not chatframe then chatframe=ChatFrame1 end

		local message
		if func then
			message = ("|cffffee77Z|r: %s%06.03f+%03d|r |cff00ddbb#%d:|r %s%s  |cffaaaaaa(%s)"):format(timecolor,(t-self.timestamp_loaded_GT),debugms,self.DebugI,debugcolor,formatted_msg,func)
		elseif self.db.profile.debug_fps then
			message = ("|cffffee77Z|r: %s%06.03f+%03d|r@%03d |cff00ddbb#%d:|r %s%s"):format(timecolor,(t-self.timestamp_loaded_GT),debugms,GetFramerate(),self.DebugI,debugcolor,formatted_msg)
		else
			message = ("|cffffee77Z|r: %s%06.03f+%03d|r |cff00ddbb#%d:|r %s%s"):format(timecolor,(t-self.timestamp_loaded_GT),debugms,self.DebugI,debugcolor,formatted_msg)
		end
		--if GQ.timeshift then message = date().."."..("%03d"):format((GetTime()+GQ.timeshift-time())*1000).." "..message end

		local replace_at
		if replace_id then  -- find same message in history
			local buffer = chatframe.historyBuffer
			local i=buffer.headIndex or #buffer.elements
			local maxdist=10 -- how far back we can replace
			local dist=0
			repeat
				local msg=buffer.elements[i]
				if not msg then break end
				if msg.message:find(REPLACECODE.."["..replace_id,1,true) then replace_at=i break end
				i=i-1
				if i<1 then i=#buffer.elements end
				dist=dist+1
			until replace_at or dist>=maxdist
		end
		if replace_at then
			chatframe.historyBuffer.elements[replace_at].message=message
			chatframe:MarkDisplayDirty()
		else
			chatframe:AddMessage(message)
		end
		if show_warning then
			RaidNotice_AddMessage(RaidWarningFrame, "[|cffff8800Z|r] "..formatted_msg, HIGHLIGHT_FONT_COLOR);
		end
	end
	if func then
		self.Log:Add("%s (%s)",formatted_msg,func)
	else
		self.Log:Add("%s",formatted_msg)
	end

	--local debug_time=debugprofilestop()-initial_time
end

function GQ:Debug_FlagsMenu()
	GQ.Debug_FlagsTable = {}
	for k,v in pairs(GQ.db.profile.debug_flags) do
		GQ.Debug_FlagsTable[setmetatable({},{__tostring=function() return k .. ": " .. (GQ.db.profile.debug_flags[k].enabled and "ON" or "OFF") end})] = function() GQ:SetOption("Cover","debugflag "..k) end
	end
	Spoo (GQ.Debug_FlagsTable)
end


-- HACKS
function GQ:ListQuests(from,to)
	local CQI=Cartographer_QuestInfo
	local qlog = ""
	for i=from,to do
		local level = CQI:PeekQuest(i)
		--if not level then level=0 end
		if level then
			local title,_,_,_,nobjs = CQI:GetQuestText(i,level)
			--if not title then title = CQI:GetQuestText(i,level) end -- well, they said to repeat it...
			--self:Print(i..": |cff808080|Hquest:"..i..":"..level.."|h["..tostring(title).."]|h|r "..(type(objs)=="table" and "{"..table.concat(nobjs,",").."}" or ""))
			qlog = qlog .. i..": "..tostring(title)..(type(nobjs)=="table" and " {"..table.concat(nobjs,",").."}" or "") .. "|n"
		end
	end
	if Chatter then
		Chatter:GetModule("Chat Copy").editBox:SetText(qlog)
		Chatter:GetModule("Chat Copy").editBox:HighlightText(0)
		Chatter:GetModule("Chat Copy").frame:Show()
	end
end

function GQ:ReloadTranslation()
	for i,guide in ipairs(self.registeredguides) do
		for s,step in ipairs(guide.steps) do
			for g,goal in ipairs(step.goals) do
				goal.L=false
			end
		end
	end
end

-- used for steps and goals
--[[
function GQ.ConditionTrue(subject,case)
	if not subject.conditions then return false end
	local f=subject.conditions[case]
	if type(f)=="function" then
		return f()
	elseif type(f)=="string" then
		f=subject.conditions[f]
		assert(type(f)=="function","What? This step has cross-referencing conditions? wtf.")
		return not f()
	end
end
--]]

function GQ.gradient3(perc,ar,ag,ab,br,bg,bb,cr,cg,cb, middle)
	if perc >= 1 then
		return cr,cg,cb
	elseif perc<=0 then
		return ar,ag,ab
	else
		if perc<=middle then
			perc=perc/middle
			return ar+(br-ar)*perc, ag+(bg-ag)*perc, ab+(bb-ab)*perc
		else
			perc=(perc-middle)/(1-middle)
			return br+(cr-br)*perc, bg+(cg-bg)*perc, bb+(cb-bb)*perc
		end
	end
end

--hooksecurefunc("WorldMapFrame_UpdateQuests",function() if not InCombatLockdown() then text=nil end end)
--hooksecurefunc("QuestInfo_Display",function() if not InCombatLockdown() then shownFrame=nil bottomShownFrame=nil end end)



--[[


function FindAch_AchievementFrame_OnShow(self)
	local editbox = AchievementFrame_FindAch_Edit
	if not editbox then
		editbox = CreateFrame("EditBox","AchievementFrame_FindAch_Edit",AchievementFrame,"InputBoxTemplate")
		editbox:SetSize(150,30)
		editbox:SetPoint("TOPLEFT",AchievementFrame,"TOPLEFT",150,15)
		editbox:Show()
		editbox:SetFocus(false)
	end
end

function FindAch_Listen_OnEvent(self,event,...)
	if event=="ADDON_LOADED" and ...=="Blizzard_AchievementUI" then
		AchievementFrame:HookScript("OnShow",FindAch_AchievementFrame_OnShow)
	end
end
local frame=CreateFrame("FRAME","FindAch_Listen")
frame:SetScript("OnEvent",FindAch_Listen_OnEvent)
frame:RegisterEvent("ADDON_LOADED")

--]]

-- encraption.
function GQ:CraptOnReload(name)

end


function GQ:COMBAT_LOG_EVENT_UNFILTERED(event,time,evtype,a1,a2,a3,a4,a5)
	--print(evtype,a3)
	if evtype=="PARTY_KILL" then
		if a3==UnitName("player") then
			self.MagicKey.retarget_time = GetTime()
			self:SetMagicKey()
		end
	end
end


-- CONVENIENCE: /re for Reload
SLASH_RE1 = "/re"
function SlashCmdList.RE(text)  ReloadUI()  end

local lastbind
function GQ:SetMagicKey(reset)
	if not self.MagicKey.FR then return end
	if reset then lastbind=nil end

	if not GQ.db.profile.magickey or GQ.db.profile.magickey==""
		or InCombatLockdown()
		or not GQ.CurrentStep or not GQ.CurrentStep.goals or not GQ.Frame:IsShown()
		then
			self.MagicKey.FR:Hide()
			return
		end

	self.MagicKey.FR:Show()

	local bind,bind2

	local function DoBind(bind,bind2,desc)
		if not bind then
			self.MagicKey:SetHint("")
		end

		if lastbind~=(bind2 or bind) then
			if bind=="CLICK" then
				SetBindingClick(self.db.profile.magickey,bind2)
			else
				SetBinding(self.db.profile.magickey,bind)
			end
			lastbind=bind2 or bind
			self:Debug("Magic Key binding: %s",tostring(bind2 or bind))
		end

		self.MagicKey:SetHint(desc)
	end

	-- turn in quests
	if self.db.profile.magickey_acceptturnin and GossipFrame:IsShown() or QuestFrame:IsShown() then
		for gi,g in ipairs(self.CurrentStep.goals) do
			if g.action=="accept" or g.action=="turnin" then
				return DoBind("CLICK","GoatQuest_MagicKeyHint_Button", "Accept/Turn In")
			end
		end
	end

	-- suggest retargeting corpses
	if self.db.profile.magickey_targetcorpse and self.MagicKey.retarget_time and (GetTime()-self.MagicKey.retarget_time < 3) and not UnitName("target") then
		return DoBind("TARGETLASTTARGET",nil, "Target corpse")
	end


	local targetid = self.GetTargetId()
	if self.db.profile.magickey_loot and UnitIsDead("target") then
		return DoBind("InteractTarget",nil,"Loot")
	end

	for gi,g in ipairs(self.CurrentStep.goals) do
		if g:IsComplete() then
			-- do nothing ;P

		elseif targetid and ((UnitName("target") == g.target) or (targetid == (g.npcid or (g.mobs and g.mobs[1] and g.mobs[1].id)))) then
			-- interact in its varieties
			local hint
			if UnitIsFriend("target","player") and self.db.profile.magickey_talk then
				return DoBind("InteractTarget",nil,"Talk")
			elseif not UnitIsFriend("target","player") and self.db.profile.magickey_attack then
				return DoBind("InteractTarget",nil,"Attack")
			end

		elseif g.macro then
			local src = g.macrosrc
			local hint
			if src then
				local npc = src:match("/target (.+)\n")
				if npc then
					if self.db.profile.magickey_target then
						return DoBind("MACRO "..g.macro, nil, "Target: "..npc)
					end
				else
					if self.db.profile.magickey_itemspell then
						return DoBind("MACRO "..g.macro, nil, "Use macro: "..g:GetText())
					end
				end
			else
				return DoBind("MACRO "..g.macro, nil, "(macro?)")
			end


		elseif _G['GoatQuestFrame_Act'..(g.num+1)..'Action']:IsShown() then
			if self.db.profile.magickey_itemspell then
				return DoBind("CLICK","GoatQuestFrame_Act"..(g.num+1).."Action", g:GetText())
			end
		end

		--[[
		if (g.action=="kill" and g.target) or (g.action=="talk" and g.npcid) or (g.action=="from" and (g.mobs and g.mobs[1] and g.mobs[1].name)) then
			firstname=(g.target or g.npcid) or (g.mobs and g.mobs[1] and g.mobs[1].name)

			break
		end
		--]]
	end

	return DoBind(nil,nil,nil)
end

function GQ.MagicButton_OnClick(but)
	GQ:QuestAutoStuff()
end

-- SECURE!
function GQ:MagicRaidMarker(marker)
	-- Keep legacy target macros chainable without changing protected raid markers.
	if GQ.GuideOnly or GQ.IsForever then return GQ end
	if GQ.IsRetail then return end
	if not GQ.db.profile.targetonclick then return GQ end
	
	if not UnitExists("target") then return end

	if UnitCanAttack("player","target") then
		local raidmarker = marker or 8
		local icon = GetRaidTargetIndex("target")
		if icon~=raidmarker then
			SetRaidTarget("target",raidmarker)
			GQ.UsedRaidMarkers[raidmarker] = true
		end
	else
		local raidmarker = marker or 1

		local icon = GetRaidTargetIndex("target")
		if icon~=raidmarker then
			SetRaidTarget("target",raidmarker)
			GQ.UsedRaidMarkers[raidmarker] = true
		end
	end
	return GQ  -- for chaining
end
function GQ:MaybeClearRaidMarker(index)
	if GQ.GuideOnly or GQ.IsForever then return end
	if GQ.IsRetail then return end
	if not UnitExists("target") then return end
	if GetRaidTargetIndex("target")==index then SetRaidTarget("target",0) end
end

GQ.MRM = GQ.MagicRaidMarker
GQ.MCM = GQ.MaybeClearRaidMarker



function GQ:MacroClickGoal(stepnum,goalnum)
	if self.CurrentGuide and self.CurrentGuide.steps[stepnum] and self.CurrentGuide.steps[stepnum].goals[goalnum] then self.CurrentGuide.steps[stepnum].goals[goalnum]:OnClick() end
end
GQ.CG = GQ.MacroClickGoal

function GQ:Unparse(id,y,m,d)
	local c,b=string.char,string.byte
	local function enc(a)
		print("coding "..a)
		return c(a%10+1+16*math.floor(a/10))
	end
	local s=("%08d%2d%2d%2d"):format(id,y%100,m,d)
	--local s="12345678010203"
	local s2=""
	for di,i in ipairs{id/100000,id/1000,id/10,id,y,m,d} do s2=s2..enc(b(math.floor(i)%10)) end
	return s2
end

function GQ:DoMutex(m)
	GoatQuest.GuideMenuTier = nil
	if self.guidesets[m] then return true else self.guidesets[m]=true end
end

local flatlist
function GQ:GetFlatListOfGroups(source,search,target,notoplevel,curlevel)
	if not source then  -- start!
		source=self.registered_groups
		if target then flatlist=target else flatlist={} end
	end
	curlevel=curlevel or 1
	if not source.groups then return end
	for gi,g in pairs(source.groups) do
		if not (notoplevel and curlevel==1)
		and (not search  or  g.name and (g.name:lower():find(search,1,true) or g.name:lower():gsub("%p",""):find(search,1,true))) then
			tinsert(flatlist,g)
		end
		if #g.groups>0 then self:GetFlatListOfGroups(g,search,target,notoplevel,curlevel+1) end
	end
	return flatlist
end

function GQ:FindGuides(sub)
	local logic="AND"
	if sub:sub(1,3)=="OR " then
		logic="OR"
		sub=sub:sub(4)
	end
	sub=sub:lower()
	local found={}
	self:GetFlatListOfGroups(nil,sub,found, "notoplevel")
	--[[
	for gi,g in pairs(self.registered_groups.groups) do
		if g.name and (g.name:lower():find(sub,1,true) or g.name:lower():gsub("%p",""):find(sub,1,true)) then
			tinsert(found,g)
		end
	end
	--]]

	local already_found={}
	local function do_find(sub,scope,into)
		for gi,g in pairs(scope) do
			if not (g.type=="TEST") and not (logic=="OR" and already_found[g]) then
				if (g.title_short and g.title_short:lower():find(sub,1,true)) then
					if not (GQ.db.profile.gmhidecompleted and (g:GetStatus()=="OUTLEVELED" or g:GetStatus()=="COMPLETE")) then
						tinsert(into,g)
						already_found[g]=true
					end
				elseif g.keywords then
					for _,word in pairs(g.keywords) do
						if word:lower():find(sub,1,true) then
							tinsert(into,g)
							already_found[g]=true
							break
						end
					end
				end
			end
		end
	end

	local firstword=true
	for word in sub:gmatch("([^%s]+)") do
		if firstword or logic=="OR" then
			do_find(word,self.registeredguides,found)
		else
			local temp={}
			do_find(word,found,temp)
			found=temp
		end
		firstword=false
	end
	return found
end

local function get_flat_guides(group)
	local results = {}
	for _,guide in ipairs(group.guides) do
		local guide_patch = guide.patch or "-1"
		results[guide_patch] = results[guide_patch] or {}
		table.insert(results[guide_patch],guide)
	end
	for _,group in ipairs(group.groups) do
		for guide_patch,guides in pairs(get_flat_guides(group)) do
			results[guide_patch] = results[guide_patch] or {}
			for _,guide in ipairs(guides) do
				table.insert(results[guide_patch],guide)
			end
		end
	end
	return results
end

local function value_find(haystack,needle)
	needle = needle:lower()
	if type(haystack)=="table" then
		for _,straw in pairs(haystack) do
			if straw:lower()==needle then
				return true
			end
		end
		return false
	else
		return haystack:lower()==needle
	end
end
FindFilteredGuidesCache,FindFilteredGuidesContextCache = {},{}
function GQ:FindFilteredGuides(filters,path)
	filters = filters or {}
	local filterstring = path
	for i,v in pairs(filters) do
		if type(v)=="table" then
			filterstring = filterstring .. i
			for j,w in ipairs(v) do
				filterstring = filterstring .. w
			end
		else
			filterstring = filterstring .. i..v
		end
	end
			
	-- if we are given specific path to check, see if we have it cached already
	if path and not FindFilteredGuidesContextCache[path] then
		-- if not, get all guides in that group and all its decendants
		local group = GQ:FindOrCreateGroup(GQ.registered_groups,path,true)
		if group then
			FindFilteredGuidesContextCache[path] = get_flat_guides(group)
		else
		end
	end
	
	-- default context is eeeeverything
	local context = GQ.registeredguides
	
	if path then 
		-- we have a specific path, so grab it from cache
		if filters.patch then
			-- if we are given patch in filters, grab only guides that were already presorted there
			if type(filters.patch)=="number" or type(filters.patch)=="string" then
				-- single patch, simple lookup
				context = FindFilteredGuidesContextCache[path][filters.patch] or {}
			else 
				-- multiple patches, grab all their arrays and merge into one
				context = {}
				for _,patch in ipairs(filters.patch) do
					if FindFilteredGuidesContextCache[path][patch] then
						for _,guide in ipairs(FindFilteredGuidesContextCache[path][patch]) do
							table.insert(context,guide)
						end
					end
				end
			end
		else
			-- path given, but no patch. grab all guides from that group
			context = {}
			if FindFilteredGuidesContextCache[path] then
				for patch,patchguides in pairs(FindFilteredGuidesContextCache[path]) do
					for _,guide in ipairs(patchguides) do
						table.insert(context,guide)
					end
				end
			end
		end
	end


	local checked = 0
	if not FindFilteredGuidesCache[filterstring] then
		FindFilteredGuidesCache[filterstring] = {}

		for _,guide in ipairs(context) do
			checked = checked + 1
			local valid = true
			for key,value in pairs(filters) do
				if guide[key] then
					if value~="*" then
						if type(value)=="table" then
							local mode_and = value[1]=="AND"
							local lvalid = mode_and
							for _,subvalue in pairs(value) do
								if mode_and then
									if subvalue~="AND" then
										lvalid = lvalid and value_find(guide[key],subvalue)
									end
								else
									lvalid = lvalid or value_find(guide[key],subvalue)
								end
							end
							valid = valid and lvalid
						else
							valid = valid and value_find(guide[key],value)
						end
					end
					-- value=="*" is always true
				else
					valid=false
				end
			end
			if valid then table.insert(FindFilteredGuidesCache[filterstring],{guide.title,guide.title_short}) end
		end
	end
	return FindFilteredGuidesCache[filterstring],checked
end

function GQ:UnloadUnusedGuides()
	self:Debug("Unimplemented: unloading unused guides.")
end

function GQ:ClearCurrentGuide()
	self.CurrentGuide=nil
	self.db.profile.guidename=nil
	self:UpdateFrame()
end

-- WARNING Heuristic in this thread. We assume that this is called only after all the guides are registered
-- and therefore, to optimize things a bit, we cache the results of parsing, so that subsequent request to
-- load the same type will immediately return. This will malfunction if the guides are added online between
-- the calls to this function. ~aprotas

local guideTypesLoaded={}

function GQ:LoadGuidesByType(guidetype)
	assert(guidetype)
	if guideTypesLoaded[guidetype] then return end

	local t1=debugprofilestop()
	for gi,g in pairs(self.registeredguides) do
		if g.type==guidetype then
			g:Parse(true)
		end
	end
	GQ:Debug("&startup Loaded guides by type: %s = %dms",guidetype,debugprofilestop()-t1)
	guideTypesLoaded[guidetype]=true
end

function GQ:LoadNeededGuides()
	local t0=debugprofilestop()
	for gi,g in pairs(self.registeredguides) do
		if g.need_to_parse then
			local success = g:Parse(true)
			g.need_to_parse = nil
			if debugprofilestop()-t0>100 then return nil end  -- 0.1s allowed here
		end
	end
	return true
end

GQ.ParseLog = ""

function GQ:Error(s,...)
	if (...) then s=s:format(...) end
	self:Print("|cffff0000ERROR:|r "..s)
	GQ.ParseLog = GQ.ParseLog .. s .. "\n\n"
	return s
end

function GQ:ErrorThrow(...)
	local s = self:Error(...)

	--geterrorhandler()(s)
	error(s)
end

-- HBD migration snip: Ship Arrival Times 


local lasttime,lastmem=GetTime(),0
local memavg={0,0,0,0,0}
function GQ:MemHogging()
	UpdateAddOnMemoryUsage()
	local mem = GetAddOnMemoryUsage(addonName)
	local time = GetTime()
	if time~=lasttime and mem~=lastmem then
		local total=0
		for i=1,4 do memavg[i]=memavg[i+1] total=total+memavg[i+1] end
		local kbs = floor((mem-lastmem)/(time-lasttime))
		memavg[5]=kbs

		kbs=(kbs+total)/5

		GQ.DebugFrame.text1:SetText(("%s %d"):format(strrep(".",kbs/3),kbs))
	end
	lasttime,lastmem=time,mem
end

local memmark=0
function GQ:MemHogStart()
	UpdateAddOnMemoryUsage()
	memmark=GetAddOnMemoryUsage(addonName)
end

function GQ:MemHogStop(desc)
	UpdateAddOnMemoryUsage()
	local memmark2=GetAddOnMemoryUsage(addonName)
	print("|cff00ff88",desc,("%.1f"):format(memmark2-memmark))
end

function GQ:MemHogTest()
	self:MemHogStart()
	self:MemHogStop()
	self:MemHogStart()
	self:MemHogStop()
	self:MemHogStart()
	local a={}
	for i=1,1000 do a[i]={} end
	self:MemHogStop()
end


function GQ:StartFPSFrame()
	if not GQ.FPSFrame then
		local SIZE=300
		local MAXFPS=60
		GQ.FPSFrame = GQ.ChainCall(CreateFrame("FRAME","GoatQuestFPSFrame",UIParent)) :SetPoint("BOTTOMLEFT") :SetSize(SIZE+11,MAXFPS) :SetFrameStrata("DIALOG") .__END
		GQ.FPSFrame.back = GQ.ChainCall(GQ.FPSFrame:CreateTexture()) :SetAllPoints() :SetColorTexture(0,0,0,1) .__END
		GQ.FPSFrame.bars={}
		GQ.FPSFrame.fpsbars={}
		for b=1,SIZE do
			tinsert(GQ.FPSFrame.bars, GQ.ChainCall(GQ.FPSFrame:CreateTexture()) :SetPoint("BOTTOMLEFT",GQ.FPSFrame,"BOTTOMLEFT",b,0) :SetSize(1,MAXFPS) :SetColorTexture(1,1,1) :SetDrawLayer("ARTWORK",1) .__END)
			tinsert(GQ.FPSFrame.fpsbars, GQ.ChainCall(GQ.FPSFrame:CreateTexture()) :SetPoint("BOTTOMLEFT",GQ.FPSFrame,"BOTTOMLEFT",b,0) :SetSize(1,2) :SetColorTexture(1,1,1) :SetDrawLayer("ARTWORK",2) .__END)
		end
		GQ.FPSFrame.fpsbar = GQ.ChainCall(GQ.FPSFrame:CreateTexture()) :SetPoint("BOTTOMLEFT",GQ.FPSFrame.bars[SIZE],"BOTTOMRIGHT",3,0) :SetSize(5,MAXFPS) :SetColorTexture(1,1,1) :SetDrawLayer("ARTWORK",1) .__END
		GQ.FPSFrame.hicbar = GQ.ChainCall(GQ.FPSFrame:CreateTexture()) :SetPoint("BOTTOMLEFT",GQ.FPSFrame.bars[SIZE],"BOTTOMRIGHT",10,0) :SetSize(5,MAXFPS) :SetColorTexture(1,1,1) :SetDrawLayer("ARTWORK",1) .__END
		GQ.FPSFrame.value = GQ.ChainCall(GQ.FPSFrame:CreateFontString()) :SetPoint("TOPLEFT",5,-5) :SetFont("Fonts\\ARIALN.TTF",14,"OUTLINE") .__END
		tinsert(GQ.FPSFrame.bars,GQ.FPSFrame.fpsbar)

		local barheights={}
		local fpslineheights={}
		for b=1,SIZE do barheights[b]=0 fpslineheights[b]=0 end

		local hiccup=0
		function GQ.FPSFrame:OnUpdate(elapsed)
			local t1=debugprofilestop()
			--local fps=GetFramerate()
			local n=floor(min(max(1,elapsed*100),SIZE))  -- n bars to cover
			for b=1,SIZE-n do
				barheights[b]=barheights[b+n]
				fpslineheights[b]=fpslineheights[b+n]
			end

			local fps=1/elapsed
			local h=min(fps,MAXFPS)
			local avgfps=min(MAXFPS,GetFramerate())
			for b=SIZE-n+1,SIZE do
				barheights[b]=h
				fpslineheights[b]=avgfps
			end

			local h=min(max(GetFramerate(),1),MAXFPS)
			barheights[SIZE+1]=h  -- fpsbar

			local elams = elapsed*1000
			if elams>50 then --20fps, awful
				hiccup=hiccup+ (elams/50) * 8
			--elseif elams>17 then --60fps, expected
			--	hiccup=hiccup+ ( (elams-17) ) / 10
			end
			hiccup = min(max(0,hiccup-elapsed*5),MAXFPS)
			self.hicbar:SetHeight(min(max(1,hiccup),MAXFPS))


			for b=1,SIZE+1 do
				local h1=barheights[b]/MAXFPS
				local r=(h1<0.5) and 1 or 2-(h1*2)
				local g=(h1<0.5) and h1*2 or 1
				self.bars[b]:SetColorTexture(r,g,0)

				self.bars[b]:SetHeight(barheights[b])
				if b<=SIZE then self.fpsbars[b]:SetPoint("BOTTOMLEFT",b,fpslineheights[b]) end
			end

			local h1=hiccup/MAXFPS
			local r=(h1<0.5) and h1*2 or 1
			local g=(h1<0.5) and 1 or 2-(h1*2)
			self.hicbar:SetColorTexture(r,g,0)

			GQ.FPSFrame.value:SetText(math.floor(tonumber(fps)))

		end
		GQ.FPSFrame:SetScript("OnUpdate",GQ.FPSFrame.OnUpdate)
	end
	GQ.FPSFrame:SetShown(GQ.db.profile.fpsgraph)
end


GQ.Quest_Choices = {}
function GQ:GQ__QUEST_CHOICE_SENT(event,id,choice)
	GQ:Debug("Quest choice: choice id |cffffeeaa%d|r, selected |cffffeeaa%d|r",id,choice)
	GQ.Quest_Choices[id]=choice
end

function GQ:Hook_QuestChoice()
	if GQ.Expansion_Shadowlands then return end
	if not GQ.IsRetail then return end
	if type(SendQuestChoiceResponse)~="function" then return end
	if not C_QuestChoice or type(C_QuestChoice.GetQuestChoiceInfo)~="function" then return end
	hooksecurefunc("SendQuestChoiceResponse",function(...) GQ.Surrogate_SendQuestChoiceResponse(...) end)
	GQ:AddMessageHandler("GQ__QUEST_CHOICE_SENT")
end

function GQ.Surrogate_SendQuestChoiceResponse(choice)
	local id = C_QuestChoice.GetQuestChoiceInfo()
	GQ:SendMessage("GQ__QUEST_CHOICE_SENT",id,choice)
end


-- player choices made in Blizzard_PlayerChoiceUI
function GQ.PLAYER_CHOICE_UPDATE()
	-- requested, but not used in the end
	-- broken in dragonflight
	do return end

	GQ.db.char.playerchoices = GQ.db.char.playerchoices or {}
	local playerchoices = GQ.db.char.playerchoices 

	local choice = C_PlayerChoice.GetPlayerChoiceInfo()

	if not choice then
		GQ.db.char.playerchoicegroup=nil
		return 
	end

	GQ.db.char.playerchoicegroup = choice.choiceID

	playerchoices[choice.choiceID] = playerchoices[choice.choiceID] or {}

	for i=1,choice.numOptions do
		local c = C_PlayerChoice.GetCurrentPlayerChoiceInfo()
		playerchoices[choice.choiceID][i] = playerchoices[choice.choiceID][i] or {selected=false,name=(c.header or "").." "..(c.subheader or "")}
		playerchoices[choice.choiceID][i].responseIdentifier=c.responseIdentifier -- each time we open the dialog window, buttons are getting new ids, so we need to update
	end
	playerchoices[choice.choiceID].scenario = C_Scenario.IsInScenario()
end

function GQ.PLAYER_CHOICE_CLOSE()
	local playerchoices = GQ.db.char.playerchoices 
	if not playerchoices then return end

	for iset,set in pairs(GQ.db.char.playerchoices) do
		local selected = false
		for ichoice,choice in ipairs(set) do
			selected = selected or choice.selected
		end
		if not selected then
			GQ.db.char.playerchoices[iset]=nil
		end
	end
end

function GQ:PlayerChoiceCleanUp()
	if not GQ.db.char.playerchoices then return end
	local inscenario = C_Scenario.IsInScenario()
	for i,v in pairs(GQ.db.char.playerchoices) do
		if v.scenario and not inscenario then
			GQ.db.char.playerchoices[i]=nil
		end
	end
end

function GQ:PlayerChoiceResponce(buttonID)
	if not GQ.db.char.playerchoicegroup then return end
	local currentplayerchoices = GQ.db.char.playerchoices and GQ.db.char.playerchoices[GQ.db.char.playerchoicegroup]

	if not currentplayerchoices then return end

	for i,v in ipairs(currentplayerchoices) do
		if v.responseIdentifier==buttonID then
			v.selected = true
		else
			v.selected = false
		end
	end
end


function GQ:QuestRewardSelect(choice)
	local id = C_QuestChoice.GetQuestChoiceInfo()
	local questrewards=GQ.db.char.questrewards
	for i,v in pairs(questrewards) do
		if v.quest==id then questrewards[i]=nil end -- unset previous choices for this quest
	end
	questrewards[choice]={quest=id, unconfirmed=true} -- selected, not confirmed via quest
end

function GQ:QuestRewardConfirm()
	local questrewards=GQ.db.char.questrewards
	for i,v in pairs(questrewards) do
		if v.unconfirmed then v.unconfirmed=nil end -- mark previous unconfirmed choice as confirmed
	end
end


function GQ:WarnAboutDebugSettings()
	if self.db.profile.fakecombat then self:Print("WARNING, DEBUG: Faked combat is on.",nil,true) end
	if self.db.profile.fakeskills and next(self.db.profile.fakeskills) then self:Print("WARNING, DEBUG: Fake professions are set.",nil,true) end
	if self.db.profile.fakereps and next(self.db.profile.fakereps) then self:Print("WARNING, DEBUG: Fake reputations are set.",nil,true) end
	if self.db.profile.fakelevel then self:Print("WARNING, DEBUG: Fake level is set to "..self.db.profile.fakelevel,nil,true) end
	if self.db.profile.debug_librover_fakenofly then self:Print("WARNING, DEBUG: Fake No Flying is enabled",nil,true) end
end

local legion_popup_class = { "Warrior","Paladin","Hunter","Rogue","Priest","Death Knight","Shaman","Mage","Warlock","Monk","Druid","Demon Hunter" }
function GQ:PLAYER_LEVEL_UP(event,level)
	-- if player is max level, request one last time, then stop recording times
	if level==self.maxlevel then
		GQ:CancelTimer(self.leveltimer)
		self.leveltimer = nil
		RequestTimePlayed()
	end

	if not GQ.IsRetail then
		if GQ.db.profile.n_popup_skills and GQ.db.profile.n_popup_skills_level then -- use payload level, unitlevel is not yet updated
			GQ:ScheduleTimer(function() GQ.Skills:ShowSkillPopup(level) end,5) 
		end
	else
	--[[
		local title,message,guide
		local _,_,classnum = UnitClass("player")
		local classname = legion_popup_class[classnum]

		if level==101 then
			guide = GQ:GetGuideByTitle("Leveling Guides\\Legion (100-110)\\"..classname.." Order Hall Quests")
			title = "First Class Order Hall Quest Available"
			message = "\nA new Class Order Hall questline is now available.\nWould you like to load the guide for this?"
		elseif level==102 then
			--if GQ:RaceClassMatch("DEMONHUNTER") then
			--	guide = GQ:GetGuideByTitle("Leveling Guides\\Starter Guides\\Demon Hunter (98-100)")
			--else
				guide = GQ:GetGuideByTitle("Leveling Guides\\Legion (100-110)\\"..classname.." Intro & Artifacts")
			--end
			title = "Additional Artifact Weapons Now Available"
			message = "\nYou can now unlock the artifact \nweapons for your other class specs. \nWould you like to load the guide for this?\n"
		elseif level==103 then
			guide = GQ:GetGuideByTitle("Leveling Guides\\Legion (100-110)\\"..classname.." Order Hall Quests")
			title = "Additional Order Hall Quests Available"
			message = "\nAdditional Order Hall quests are now available.\nWould you like to load the guide for this?"
		elseif level==110 then
			guide = GQ:GetGuideByTitle("Leveling Guides\\Legion (100-110)\\"..classname.." Order Hall Quests")
			title = "Additional Order Hall Quests Available"
			message = "\nAdditional Order Hall quests are now available.\nWould you like to load the guide for this?"
		end

		if guide then
			guide:LegionPopup(title,message,level)
		end
	--]]
	end
end

local POIcache={}
function GQ:CachePOIs()
	local mapid = GQ.GetCurrentMapID() or 0
	POIcache[mapid]=POIcache[mapid] or {}
	table.wipe(POIcache[mapid])
	local points = C_AreaPoiInfo.GetAreaPOIForMap(mapid)
	if points then
		for _,poiID in pairs(points) do
			if poiID then POIcache[mapid][poiID]=true end
		end
	end
end

function GQ:IsPOIActive(poiid)
	for map,pois in pairs(POIcache) do
		if pois[poiid] then return true end
	end
end
GQ.POIcache=POIcache

-- hooked from blizzard world map icons (those that have poiID defined) to load guide step tied to that specific object
-- uses guides defined in guidetitles array
-- checks all steps for rare-12345 label matching poiID number
function GQ:SuggestGuideFromBlizzardIcon(object)
	if not object then 
		GQ:Debug("&_SUB &worldquests clicked something, but no object given")
		return 
	end
	local poiID = object.areaPoiID or object.areaPOIID or (object.poiInfo and object.poiInfo.areaPoiID)

	local vignetteID = object.vignetteID

	if not (poiID or vignetteID) then
		GQ:Debug("&_SUB &worldquests clicked something, but no id was found. Object saved to GQ.wqclickobject")
		GQ.wqclickobject = object
		return 
	end

	local step_guide, step_label, content, prefix

	local headerfield = (poiID and "areapoiid") or (vignetteID and "vignetteID")
	local headervalue = poiID or vignetteID
	local headertypefield = (poiID and "areapoitype") or (vignetteID and "vignettetype")

	for _,guide in pairs(GQ.registeredguides) do
		if guide.headerdata[headerfield] then
			local matched = guide.headerdata[headerfield]==headervalue
			if type(guide.headerdata[headerfield])=="table" then
				for i,v in ipairs(guide.headerdata[headerfield]) do
					if v==headervalue then
						matched = true
						break
					end
				end
			end
			if matched then
				step_guide = guide
				step_label = 1
				content = guide.headerdata[headertypefield]
				break
			end
		end
	end

	if not step_label and poiID then
		local guidetitles = {
			["Dailies Guides\\Legion\\Broken Shore Rares"] = {content="rare elite", prefix="rare"},
			["Dungeon Guides\\Legion Scenarios\\Argus Invasions"] = {content="invasion point", prefix="invasion"},
		}
		for guidetitle,guidedata in pairs(guidetitles) do
			local guide = self:GetGuideByTitle(guidetitle)
			if not guide then return end
			if not guide.fully_parsed then guide:Parse(true) end  -- possible FPS hit!
			content,prefix = guidedata.content, guidedata.prefix
			if guide.steplabels then
				for labelname,labeldata in pairs(guide.steplabels) do
					if labelname == prefix.."-"..poiID then
						step_label = labeldata[1]
						step_guide = guide
					end
				end
			end
			if step_label then break end
		end
	end

	if not step_label then
		GQ:Debug("&_SUB &worldquests no label for object %s",poiID)
		return
	end
	
	if GQ.CurrentGuide==step_guide then
		GQ:Debug("&_SUB &worldquests switching to %s",poiID)
		GQ:FocusStep(step_label,true)
	else
		GQ:Debug("&_SUB &worldquests loading %s",poiID)
		GQ.Tabs:LoadGuideToTab(step_guide,step_label,"areapoiid")
	end

end


-- Startup Checklist. Eventually abandoned, but may be useful someday.
	local Checklist = {}
	local CL=Checklist
	GQ.Checklist = Checklist
	Checklist.events_sequence = {}
	Checklist.events_fired = {}
	Checklist.framenum = 0
	Checklist.starttime = debugprofilestop()

	function Checklist:SetupListener()
		local Listener = CreateFrame("FRAME","GoatQuestChecklistListener")
		Listener:SetScript("OnEvent", GQ.Checklist.FrameOnEvent)
		Listener:SetScript("OnUpdate", GQ.Checklist.FrameOnUpdate)
		Listener:UnregisterAllEvents()

		-- listed in usual startup order
		Listener:RegisterEvent("ADDON_LOADED")
		Listener:RegisterEvent("VARIABLES_LOADED")
		Listener:RegisterEvent("SPELLS_CHANGED") -- not on all startups
		Listener:RegisterEvent("PLAYER_LOGIN")
		Listener:RegisterEvent("PLAYER_ENTERING_WORLD")
		Listener:RegisterEvent("QUEST_LOG_UPDATE")
		Listener:RegisterEvent("PLAYER_ALIVE") -- not on all startups
		Listener:RegisterEvent("ZONE_CHANGED_NEW_AREA") -- does NOT fire on a reload

		Listener:RegisterEvent("PLAYER_CONTROL_GAINED")
		Listener:RegisterEvent("NEW_WMO_CHUNK")
		self.Listener = Listener
	end

	function Checklist:CatchEvent(event,...)
		if not self.events_fired[event] then
			self.events_fired[event] = 1
			--frame:UnregisterEvent(event)
			local s = event.." f=" .. self.framenum .. (" t=%.3f"):format(debugprofilestop()-self.starttime)
				.. "  DG ".. ((abs((GQ.HBD:TranslateZoneCoordinates(0.5,0.5,1077,0,1018,0) or 0) - 0.41)<0.1) and "OK" or "FAIL")
				.. "  TSL ".. ((abs((GQ.HBD:TranslateZoneCoordinates(0.5,0.5,1072,0,1024,0) or 0) - 0.347)<0.1) and "OK" or "FAIL")
				.. "  you're in "..GQ.GetMapNameByID(C_Map.GetBestMapForUnit("player") or 0)
			--print(s)
			tinsert(self.events_sequence,s)
		end
		if self.events_fired["_FIRST_FRAME_"] and self.events_fired["QUEST_LOG_UPDATE"] and self.events_fired["_GUIDES_LOADED_"] and self.events_fired["ZONE_CHANGED_NEW_AREA"] then
			if GQ.db.profile.delayed_startup then
				print("*** Starting up from checklist!")
				GQ:LoadInitialGuide()
			else
				print("*** Checklist complete! Would start now.")
			end
			self.Listener:UnregisterAllEvents()
			self.Listener:Hide()
		end
	end

	function Checklist.FrameOnUpdate(frame,elapsed)
		Checklist.framenum = Checklist.framenum + 1
		Checklist:CatchEvent("_FIRST_FRAME_")
		frame:SetScript("OnUpdate",nil)
	end
	function Checklist.FrameOnEvent(frame,event,...)
		Checklist:CatchEvent(event,...)
	end
	--Checklist:SetupListener()
--

function GQ.IsLegionOn()
	return IsQuestFlaggedCompleted(44663) or GQ:GetPlayerPreciseLevel()>=50
end

local last_glvl
function GQ.GetGarrisonLevel(real)
	local garr60 = Enum.GarrisonType.Type_6_0 or Enum.GarrisonType.Type_6_0_Garrison
	if not real and (GQ.db.profile.fake_garrison or -1) > -1 then return GQ.db.profile.fake_garrison end
	local glvl = C_Garrison.GetGarrisonInfo(garr60)
	          or (not IsQuestFlaggedCompleted((UnitFactionGroup("player")=="Alliance") and 34586 or 36567) and 0)
	          or last_glvl
	last_glvl=glvl
	return glvl
end

local collectors = {
	[14] = {Horde=11, Alliance=116}, -- arathi highlands warfront
	[62] = {Horde=118, Alliance=117}, -- darkshore warfront
}

local function getmaptexture(map)
	local textures = C_MapExplorationInfo.GetExploredMapTextures(map)
	if not textures then return -1 end
	if textures[1] then return textures[1].fileDataIDs[1] end
end       

function GQ.InPhase(phasename)
	if not phasename then return true end
	if phasename==GQ.db.profile.fakephase then return true end

	local level = UnitLevel('player')
	local faction = UnitFactionGroup("player")
	local hasbuff = GQ.Parser.ConditionEnv.hasbuff
	local state
	local getmapartid = C_Map.GetMapArtID
	local getstate = C_ContributionCollector and C_ContributionCollector.GetState
	local quest = C_QuestLog.IsQuestFlaggedCompleted
	local areapoi = GQ.Parser.ConditionEnv.areapoi
	
	phasename = phasename:lower():gsub(" ","")

	-- expansion checks
	if phasename=="bfa" then
		if faction=="Horde" then 
			local q=GQ.questsbyid[50769]
			return quest(50769) or (q and q.inlog)
		else
			local q=GQ.questsbyid[46728]
			return quest(46728) or (q and q.inlog)
		end

	-- time travel checks
	elseif phasename=="olddarnassus" then
		return getmapartid(62)==67
	elseif phasename=="oldundercity" then
		return not (quest(51443) or quest(60361) or quest(46727) or quest(58983)) or quest(52758) -- Not started BFA, or timetravels after UC destruction
	elseif phasename=="undercityooze" then
		return (quest(51443) or quest(60361) or quest(46727) or quest(58983)) and not (quest(65655) or quest(65656)) and not quest(52758) -- Started BFA, not done 9.2.5 quests, no timetravel
	elseif phasename=="undercitycharred" then
		return (quest(65655) or quest(65656)) and not quest(52758) -- done quests, no timetravel

	elseif (phasename=="oldsilithius" or phasename=="oldsilithus") then
		return getmapartid(81)==86
	elseif phasename=="oldblastedlands" then
		return getmapartid(17)==18
	elseif phasename=="newblastedlands" then
		return getmapartid(17)==628
	elseif phasename=="oldpeak" then -- unused?
		return hasbuff("spell:609811")
	elseif phasename=="oldarathi" then
		return getmapartid(14)==15
	elseif phasename=="newarathi" then
		return getmapartid(14)==1137
	elseif phasename=="olddustwallow" then
		return getmapartid(70)==75
	elseif phasename=="newdustwallow" then
		return getmapartid(70)==498
	elseif phasename=="olddarkshore" then
		return quest(54411) -- timetravel flag
	-- 8.3 invasion checks
	elseif phasename=="olduldum" then
		return quest(50659) -- timetravel flag
	elseif phasename=="oldvale" then
		return quest(59024) or not (areapoi(390,6573) or areapoi(1530,6574)) -- timetravel flag, or zidormi not yet spawned
	elseif phasename=="ulduminvasionleft" then
		return getmaptexture(1527)==3165083
	elseif phasename=="ulduminvasioncenter" then
		return getmaptexture(1527)==3165092
	elseif phasename=="ulduminvasionright" then
		return getmaptexture(1527)==3165098
	elseif phasename=="valeinvasionleftcenter" then
		return getmaptexture(1530)==3155832
	elseif phasename=="valeinvasionleft" then
		return getmaptexture(1530)==3155826
	elseif phasename=="valeinvasionright" then
		return getmaptexture(1530)==3155841

	-- warfront checks
	elseif phasename=="warfrontarathiassault" then
		return getstate and getstate(collectors[14][faction])<=2 -- state is the same no matter what timetravel phase you are in
	elseif phasename=="warfrontarathicontrol" then
		return getstate and getstate(collectors[14][faction])>=3 -- ^
	elseif phasename=="warfrontdarkshoreassault" then
		return getstate and getstate(collectors[62][faction])<=2 -- ^
	elseif phasename=="warfrontdarkshorecontrol" then
		return getstate and getstate(collectors[62][faction])>=3 -- ^

	elseif phasename=="oldsilvermoon" then
		return level<80 or not areapoi(23,8794)

	-- shadowlands
	elseif phasename=="exilesreach" then
		if quest(58418) then return true end
		local currentmap = C_Map.GetBestMapForUnit("player")
		return (currentmap==1726 or currentmap==1409)
	end
end

function GQ:TestPhases()
	local phases = {"olddarnassus","oldundercity","undercityooze","undercitycharred","oldsilithus","oldblastedlands","bfa","oldarathi","newarathi","olddustwallow","newdustwallow","oldpeak","warfrontarathiassault","warfrontarathicontrol","warfrontdarkshoreassault","warfrontdarkshorecontrol"}
	for i,ph in ipairs(phases) do
		print(ph,":",GQ.InPhase(ph) and "|cff00ff00YES" or "|cffff0000NO")
	end
end

--[[
function GQ.RecordTirisfal(_,_,unit)
	if unit~="player" then return end

	local map = C_Map.GetBestMapForUnit("player")
	if map == 18 or map == 2070 then
		GQ.db.char.tirisfalbuff = false
		for i=1,40 do
			local auraData = GetAuraDataByIndex("player",i,"HELPFUL")
			if auraData and auraData.spellId == 276827 then
				GQ.db.char.tirisfalbuff = true
			end
		end	
	end
end
--]]

function GQ:IsBoostedChar()
	return IsQuestFlaggedCompleted(34398)
end

function GQ.IsLegionBoatLock()
	return (IsQuestFlaggedCompleted(40519) or IsQuestFlaggedCompleted(43926)) and not (IsQuestFlaggedCompleted(40593) or IsQuestFlaggedCompleted(40607))
end

function GQ:SetBeta(val)
	if val~=nil then GQ.BETA=val return end
	if self.db.profile.debug_beta~=nil then GQ.BETA=self.db.profile.debug_beta return end
	-- Installed beta guides are available by default; explicit overrides still apply.
	GQ.BETA = true
end



function GQ:FakeWidescreen()
	WorldFrame:ClearAllPoints()
	WorldFrame:SetPoint("TOPLEFT",UIParent,"TOPLEFT",0,-150)
	WorldFrame:SetPoint("BOTTOMRIGHT",UIParent,"BOTTOMRIGHT",0,150)
end

function GQ:SaveChromieProgress()
	-- returns the number of cleared dragonshrines in Death of Chromie scenario, increased by 1 to mimic |count 1..8
	if not C_Scenario.IsInScenario() then return 1 end

	GQ.DragonShrineCount = GQ.DragonShrineCount or 1

	if C_Map.GetBestMapForUnit("player")~=897 then return GQ.DragonShrineCount end
	local count = 5
	local points = C_AreaPoiInfo.GetAreaPOIForMap(897)
	if points then
		for _,poiID in pairs(points) do
			if poiID~=5325 then count=count-1 end
		end
	end

	GQ.DragonShrineCount = count
	return count
end

local dragonshrines = {
	[5317] = "Obsidian", -- Zorathides
	[5318] = "Obsidian", -- dragonshrine
	[5319] = "Ruby", -- Talar Icechill 
	[5320] = "Ruby", -- dragonshrine
	[5321] = "Azure", -- Void Garg 
	[5322] = "Azure", -- dragonshrine
	[5323] = "Emerald", -- Thalas Vyle
	[5324] = "Emerald", -- dragonshrine
}
function GQ:IsDragonshrineUp(name)
	if not C_Scenario.IsInScenario() then return false end

	if not GQ.DragonShrineCache then GQ.DragonShrineCache={} end
	if C_Map.GetBestMapForUnit("player")~=897 then return GQ.DragonShrineCount end

	local points = C_AreaPoiInfo.GetAreaPOIForMap(897)
	if points then
		for _,poiID in pairs(points) do
			if dragonshrines[poiID] and dragonshrines[poiID]==name then
				GQ.DragonShrineCache[name]=true
				return true
			end
		end
	end
	GQ.DragonShrineCache[name]=false
	return false
end

function GQ:IsBoosted(boost,do_popup)
	boost = boost or "default"
	self:Debug("Isboosted? %s %s",boost,tostring(do_popup))
	GQ.db.char.isboosted = GQ.db.char.isboosted or {}
	local boosted = GQ.db.char.isboosted[boost]
	if type(boosted)=="boolean" then return boosted end
	if boost=="any" or boost=="at all" then return GQ.db.char.isboosted[90] or GQ.db.char.isboosted[100] or GQ.db.char.isboosted[110] end
	if not do_popup then return nil end

	if GQ.PopupHandler:IsInNC("GoatQuestBoostConfirm") then return nil end

	-- popup time
	if not self.BoostConfirmPopup then
		self.BoostConfirmPopup =  GQ.PopupHandler:NewPopup("GoatQuestBoostConfirm","default")

		local popup = self.BoostConfirmPopup
		popup.acceptbutton:SetText("Yes, I did.")
		popup.OnAccept = function(self)
			GQ.db.char.isboosted[self.boost]=true
			if GQ.db.char.isboosted[110] then GQ.db.char.isboosted[100]=true end
			if GQ.db.char.isboosted[100] then GQ.db.char.isboosted[90]=true end
		end
		popup.declinebutton:SetText("No, I didn't.")
		popup.OnDecline = function(self)
			GQ.db.char.isboosted[self.boost]=false
		end

		popup.noMinimize = 1 --Can not minimize this one
	
	end

	self.BoostConfirmPopup:SetText("Have you boosted this character to level "..boost.."?")
	self.BoostConfirmPopup.boost = boost

	self:Debug("IsBoosted showing popup")
	self.BoostConfirmPopup:Show()

	return nil
end

function GQ:StoreTelemetryBasics()
	local _
	self.db.char.faction = UnitFactionGroup("player")
	_,self.db.char.race = UnitRace("player")
	_,self.db.char.class = UnitClass("player")
end

function GQ.DevStart() 	GQ.DevGuides = true	end
function GQ.DevEnd()	 	GQ.DevGuides = nil	end

function GQ:EnableMessageDebugging()
	local Orig_SendMessage = GQ.SendMessage
	GQ.SendMessage = function(self,...)
		EventRegistry:TriggerEvent("GQ SendMessage",...)
		Orig_SendMessage(self,...)
	end
end

function GoatQuest_OnAddonCompartmentEnter(addonName,buttonFrame)
	GameTooltip:SetOwner(buttonFrame) --GameTooltip moved above the Viewer
	GameTooltip:ClearAllPoints()
	GameTooltip:AddLine(("|cffffffff%s|r |cffaaaaaav|r|cffcccccc%s|r"):format(GQ.L.name,GQ.version))
	GameTooltip:AddLine(GQ.L['minimap_tooltip'],0,1,0,1)
	GameTooltip:Show()
end

function GoatQuest_OnAddonCompartmentLeave(addonName,buttonFrame)
	GameTooltip:Hide()
end

---@param mouseButton "LeftButton"|"RightButton"|"MiddleButton"
function GoatQuest_OnAddonCompartmentClick(addonName,mouseButton,buttonFrame)
	if mouseButton=="LeftButton" then
		GQ:ToggleFrame()
	else
		GQ:OpenOptions()
	end
end

local last_time=0
local timer
timer = C_Timer.NewTicker(0.01,function()
	local tm=time()
	if tm-last_time==1 then
		GQ.timeshift=tm-GetTime()
		timer:Cancel()
	else
		--print (tm-last_time)
	end
	last_time=tm
end)
-- and now you can use GetTime()+GQ.timeshift instead of time() if needed

--GQ:EnableMessageDebugging()



GQ.UsedRaidMarkers = {}
function GQ.HandleRaidmarker(unit)
	if GQ.GuideOnly or GQ.IsForever then return end
	if GQ.IsRetail then return end
	-- nothing for us to do
	if not GQ.db.profile.mouseovermarkers then return end
	if not GQ.CurrentStep then return end

	local isdead = UnitIsDead(unit)


	-- don't spam groups
	if IsInGroup() and not UnitIsGroupLeader('player') then return end
	if UnitGUID("pet")==UnitGUID(unit) then return end -- don't flag own pets

	local target = GQ.GetUnitId(unit)
	if not target then return end
	local marker = 0
	

	local goals = {}
	for si,step in ipairs(GQ:GetStickiesAt(GQ.CurrentStep.num)) do
		if not step:IsComplete() then
			for gi,goal in ipairs(step.goals) do tinsert(goals,goal) end
		end
	end
	for gi,goal in ipairs(GQ.CurrentStep.goals) do
		tinsert(goals,goal)
	end

	for _,goal in ipairs(goals) do
		local showmarker = false
		if goal.targets then
			for _,goaltarget in ipairs(goal.targets) do
				if goaltarget[2]==target then
					showmarker = true
				end
			end
		else
			if goal.targetid==target or goal.npcid==target then
				showmarker = true
			end
		end

		if showmarker then
			if goal.action=="kill" and not isdead then
				if goal.parentStep:IsCurrentlySticky() then
					marker = 7
				else
					marker = 8
				end
			end
			if goal.action=="talk" and not isdead then
				marker = 1
			end
			if goal.action=="click" or goal.action=="clicknpc"  then
				marker = 6
			end
		end
	end

	if marker==0 then return end

	if GetRaidTargetIndex(unit)~=marker then
		SetRaidTarget(unit,marker)
		GQ.UsedRaidMarkers[marker] = true
	end
end

function GQ.ClearRaidmarker()
	if GQ.GuideOnly or GQ.IsForever then return end
	if GQ.skipping then return end	
	if GQ.IsRetail then return end
	-- don't mess with groups
	if IsInGroup() then return end

	if GQ.UsedRaidMarkers[1] then GQ.UsedRaidMarkers[1]=nil SetRaidTarget("player",1) end
	if GQ.UsedRaidMarkers[6] then GQ.UsedRaidMarkers[6]=nil SetRaidTarget("player",6) end
	if GQ.UsedRaidMarkers[7] then GQ.UsedRaidMarkers[7]=nil SetRaidTarget("player",7) end
	if GQ.UsedRaidMarkers[8] then GQ.UsedRaidMarkers[8]=nil SetRaidTarget("player",8) end
	SetRaidTarget("player",0)
end
