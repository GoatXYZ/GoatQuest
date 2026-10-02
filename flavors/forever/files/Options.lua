local name,GQ = ...

-- GLOBAL HBD,SLASH_GOATQUESTWAY1,Spoo,GoatQuest,GoatQuestFrame,GoatQuestFrame_DevLabel,GoatQuestFrame_Guides_GuideShareButton_OnClick,GoatQuestFrame_LockButton,GoatQuestFrame_OnSize,GoatQuestFrame_ReportButton,GoatQuestMapIcon,GoatQuestPointer_ArrowCtrl


local L = GQ.L
local LM = GQ.LM
local LI = GQ.LI
local LC = GQ.LC
local LQ = GQ.LQ
local LS = GQ.LS
local DL = GQ.DL

local playername = UnitName("player")
local playerclasslocal,playerclass,playerclassnum = UnitClass("player")

function GQ:Options_Initialize()
	--self.db:SetProfile("char/"..UnitName("player").." - "..GetRealmName())

	self:Options_DefineOptionTables()
	self:Options_RegisterDefaults()
	self:Options_SetupConfig()
	self:Options_SetupBlizConfig()
end

function GQ:Options_SetFromMode()
	self.db.profile.dispmode = self.db.profile.dispmodepri and self.db.profile.dispprimary or self.db.profile.dispsecondary
	for k,kv in pairs(self.db.profile.dispmode) do self.db.profile[k]=kv end

	if self.db.profile.showcountsteps==0 then GoatQuestFrame:SetHeight(self.db.profile.fullheight) end

	local hide = self.db.profile.hideborder
	self.borderfadedout = self.Frame.Border:GetAlpha()<0.1
	self.Frame.leftCount = hide and 999 or 0
	self.Frame.mouseCount = hide and 0 or 999

	self:UpdateFrame(true)
	self:AlignFrame()
	self:UpdateLocking()
	self:ScrollToCurrentStep()
end

local function sort_by_order(a,b)
	return (a[2].order or 0)<(b[2].order or 0)
end

local function ResetToDefaults(options_tab,parent)
	parent = parent or options_tab
	if options_tab.args then
		-- store args in a sorted table
		local t={}
		for k,v in pairs(options_tab.args) do
			tinsert(t,{k,v})
		end
		sort(t,sort_by_order)

		for i,j in ipairs(t) do
			local k,v = j[1],j[2]
			local oldval = GQ.db.profile[k]
			local defval = GQ.db.defaults.profile[k]
			if oldval~=defval then

				-- first force it
				--[[
				if v.type=="color" then
					local c = GQ.db.defaults.profile[k]
					GQ.db.profile[k] = {r=c.r,g=c.g,b=c.b,a=c.a}
				else
					GQ.db.profile[k]=GQ.db.defaults.profile[k]
				end
				--]]

				-- then pretend to be nice
				if type(v.set)=="function" then
					if v.type=="color" then
						local c = defval
						v.set({k},c.r,c.g,c.b,c.a)
					else
						v.set({k},defval)
					end
				elseif type(v.set)=="string" then
					parent.handler[v.set] (parent.handler, {k},defval)
				elseif parent.set then
					parent.set ({k},defval)
				else -- just set it
					if v.type=="color" then
						local c = defval
						GQ.db.profile[k] = {r=c.r,g=c.g,b=c.b,a=c.a}
					else
						GQ.db.profile[k]=defval
					end
				end
			end
			if v.args then
				ResetToDefaults(v,parent)
			end
		end
	end
end

function GQ:Options_DefineOptionTables()
	local Getter_Simple = function(info)
		return self.db.profile[info[#info]]
	end
	local Setter_Simple = function(info,value)
		self.db.profile[info[#info]] = value
	end
	local Setter_Loud = function(info,value)
		self.db.profile[info[#info]] = value
		INF=info
		GQ:Print(info.option.name..": "..(type(value)=="boolean" and (value and "|cff00ff88ON|r" or "|cffff0055OFF|r")) or "|cff00ff88"..value.."|r",nil,"FORCE")
	end
	local Setter_Update = function(info,value)
		Setter_Simple(info,value)
		self:UpdateFrame()
	end
	local Getter_Sub = function(var,info)
		return self.db.profile[var][info[#info]]
	end
	local Setter_Sub = function(var,info,value)
		self.db.profile[var][info[#info]] = value
		self:Options_SetFromMode()
	end

	local function Setter_Travel(i,v)
		Setter_Simple(i,v)

		LibRover:UpdateConfig()
		if GQ.Pointer.DestinationWaypoint and GQ.Pointer.DestinationWaypoint.type=="manual" then
			LibRover:UpdateNow()
		else
			GQ:ShowWaypoints()
		end
	end

	local LibRover,LibTaxi=GQ.LibRover,GQ.LibTaxi


	local order=1
	local target_stack={}
	local target_args
	local AddOptionSpace,AddOptionSep
	local function AddOption(optname,optdata)
		optdata=optdata or {}
		if optname=='' then optname=nil end
		optdata.name = optdata.name or (optname and L["opt_"..optname]) or ''
		optdata.desc = optdata.desc or (optname and rawget(L,"opt_"..optname.."_desc"))  -- force a nil when there's no description
		if optdata.type=="description" then  optdata.font = optdata.font or GQ.font_dialogsmall  end
		if optdata.type=="toggle" then  optdata.font = optdata.font or GQ.font_dialog  end
		if optdata.type=="execute" then  optdata.font = optdata.font or GQ.font_dialog  end
		if optdata.type=="header" then  optdata.font = optdata.font or GQ.font_dialog  end
		if optdata.type=="color" then  optdata.font = optdata.font or GQ.font_dialog  end
		if optdata.type=="input" then  optdata.font = optdata.font or GQ.font_dialogsmall  optdata.labelFont = optdata.labelFont or GQ.font_dialogsmall  optdata.buttonNormalFont = optdata.buttonNormalFont or GQ.font_dialog    end
		if optdata.type=="range" then  optdata.labelFont = GQ.font_dialog  optdata.rangeFont = GQ.font_dialogsmall  optdata.valueFont = GQ.font_dialogsmall    end
		if optdata.type=="select"  then
			--AddOption("", { type="description", name=optdata.name or optname, width="full", font=GQ.font_dialog })
			--optdata.name=""
			optdata.labelFont = optdata.labelFont or GQ.font_dialog  optdata.valueFont = optdata.valueFont or GQ.font_dialog
		end
		if optdata.type=="select" and not optdata.hidden and not optdata.guiHidden and not optdata._inline then
			AddOptionSep()
		end

		optdata._inline=nil
		--elseif optdata.type=="button" then
		--	optdata.font = GQ.font_dialog
		--	--optdata.highlightFont = GQ.font_dialog
		--end
		--optdata.descFont = GQ.font_dialogdesc
		order=order+1
		optdata.order = optdata.order or order
		target_args[(not target_args[optname]) and optname or "_"..order] = optdata
		return optdata
	end
	function AddOptionSpace()
		AddOption("", { type="description", name=" ", width="full", font=GQ.font_dialogsmall })
	end
	local function AddSubgroup(optname,optdata)
		optdata = AddOption(optname,optdata)
		optdata.type="group"
		optdata.childGroups = optdata.childGroups or "tab"
		if optdata.inline==nil then optdata.inline = true end
		optdata.font = GQ.font_dialog
		optdata.args = {}
		tinsert(target_stack,target_args) --push
		target_args = optdata.args
	end
	local function EndSubgroup()
		target_args = tremove(target_stack) --pop
	end

	GQ.optiontables_bliznames = {}

	local function AddOptionGroup(groupname,groupupname,slash,groupdata)
		groupdata = groupdata or {}
		if GQ.GuideOnlyHiddenOptions[groupname] then groupdata.guiHidden=true groupdata.cmdHidden=true end
		groupdata.args = groupdata.args or {}
		groupdata.name = groupdata.name or L["opt_group_"..groupname]
		groupdata.font = GQ.font_dialoglarge
		groupdata.desc = groupdata.desc or L["opt_group_"..groupname.."_desc"]
		groupdata.handler = self
		groupdata.get = Getter_Simple
		groupdata.set = Setter_Simple
		groupdata.type = "group"

		self.optiontables[groupname]=groupdata
		local blizname = "GoatQuest"..(groupupname and ("-"..groupupname) or "")
		self.optiontables_bliznames[groupdata]=blizname
		tinsert(self.optiontables_ordered,{name=groupname,blizname=blizname,slash=slash})

		target_args = groupdata.args

		AddOptionSpace()

		--AddOption('',{type="description", name = groupdata.name, font=groupdata.font })
		--AddOption('',{type="header", name = "" })  -- separator

		--AddOption('',{type="description", name = groupdata.desc })
		--AddOption('',{type="description",cmdHidden=true,name=" "})
		
	end
	function AddOptionSep(data)
		if not data then data={} end
		data.type="description"
		data.cmdHidden=true
		AddOption('',data)
	end

	self.optiontables = {}
	self.optiontables_ordered = {}

	-- The GoatQuest skin's type (GQ.Font: Archivo, or the locale's own font).
	-- Text #ECEAE6, muted #8D939C.
	self.font_dialog = CreateFont("GoatQuestFontDialog")
	self.font_dialog:SetFont(GQ.Font, 12, "")
	self.font_dialog:SetTextColor(0.925, 0.918, 0.902, 1)
	self.font_dialog_gray = CreateFont("GoatQuestFontDialogGray")
	self.font_dialog_gray:SetFont(GQ.Font, 12, "")
	self.font_dialog_gray:SetTextColor(0.553, 0.576, 0.612, 1)
	self.font_dialoglarge = CreateFont("GoatQuestFontDialogLarge")
	self.font_dialoglarge:SetFont(GQ.FontBold, 14, "")
	self.font_dialoglarge:SetTextColor(0.925, 0.918, 0.902, 1)
	self.font_dialogsmall = CreateFont("GoatQuestFontDialogSmall")
	self.font_dialogsmall:SetFont(GQ.Font, 10, "")
	self.font_dialogsmall:SetTextColor(0.553, 0.576, 0.612, 1)
	self.font_dialog_white = CreateFont("GoatQuestFontDialogGray")
	self.font_dialog_white:SetFont(GQ.Font, 12, "")
	self.font_dialog_white:SetTextColor(1,1,1, 1)
	self.font_dialog_red = CreateFont("GoatQuestFontDialogRed")
	self.font_dialog_red:SetFont(GQ.Font, 12, "")
	self.font_dialog_red:SetTextColor(1,0.3,0.3, 1)

	local locale=GetLocale()

	if locale=="zhCN" or locale=="zhTW" then
		self.font_dialog:SetFont(GQ.L["MainFont"], 14, "")
		self.font_dialog_gray:SetFont(GQ.L["MainFont"], 14, "")
		self.font_dialoglarge:SetFont(GQ.L["MainFont"], 16, "")
		self.font_dialogsmall:SetFont(GQ.L["MainFont"], 12, "")
	end

	local DEV = self.DEV and not self.db.profile.hide_dev_once

	AddOptionGroup("cover","Cover","goatquest",{  name = L["name_plain"], desc = L["desc"], _onlybliz=true })  	---- OPTIONS: main
	do
		AddOption('show',{
			guiHidden=true,
			type = 'execute',
			func = function(inp) GQ:ToggleFrame() end,
		})

		AddOption('hide',{
			guiHidden=true,
			type = 'execute',
			func = function(inp) GQ:ToggleFrame() end,
		})

		AddOption('options',{
			guiHidden=true,
				type = 'execute',
				func = function(inp)
					GQ:OpenOptions()
				end,
		})
		AddOption('way',{
			guiHidden=true,
			type="execute",
			func = function(params)
				local input=params.input:match("^way%s*(.-)%s*$")
				if not input then GQ:Print("Error parsing command.") return end
				if input=="" then
					GQ:Print("Set a destination waypoint, using travel directions.\n"..
					"Usage: |cffffee88/goatquest way|r |cffddff88<map> <xx,yy>|r\n"..
					"Examples:\n"..
					"  /goatquest way 33,44   |cff888888(points within the current zone)|r\n"..
					"  /goatquest way Stormwind City 61.9 75.1\n"..
					"  /goatquest way Elwynn Forest   |cff888888(points to the middle of any zone)|r\n"..
					"You can shorten '/goatquest way' to '/gqway'.")
					--GQ:Print("You can skip the map to use the current zone (or the zone in your map window). Coords can be in any format.")
					--GQ:Print("Map can be English or in your language. Coords can be 12,34 or 12.2,34.4 or 12;34 or 12 34.")
					return
				end
				GQ.Pointer:SetWaypointByCommandLine(input)
			end,
		})
		AddOption('debug',{
			hidden = true,
			type = 'toggle',
			get = function() return self.db.profile.debug end,
			set = function() self.db.profile.debug = not self.db.profile.debug  GQ:Print("Debugging: "..(self.db.profile.debug and "|cff00ff88ON|r" or "|cffff0055OFF|r")) end,
		})

		AddOption('execconfig',{
			hidden = true,
				type = 'execute',
				func = function(inp)
					GQ:OpenOptions()
				end,
		})
		AddOption('profiler',{
			hidden = true,
			type = 'toggle',
			get = function() return GetCVar("scriptProfile")=="1" end,
			set = GQ.ProfilerEnable, -- Can only be enabled
		})
		AddOption('debugflag',{
			hidden = true,
			type = 'execute',
			func = function(inp)
				inp = inp.input:sub(#inp[1]+2)
				if inp=="" then for k,v in pairs(self.db.profile.debug_flags) do if type(v)=="table" then GQ:Print("|c"..(v.color or "ffffffff").. k .."|r "..tostring(v.enabled)) else GQ:Print(k.." "..tostring(v)) end end return end
				local f=self.db.profile.debug_flags[inp]
				if f==nil then f=true end
				if type(f)=="boolean" then f={enabled=f} self.db.profile.debug_flags[inp]=f end
				f.enabled = not f.enabled
				GQ:Print("Debug flag "..inp.." is now "..(f.enabled and "ON" or "OFF"))
			end,
		})
		AddOption('debugflags',{
			hidden = true,
			type = 'execute',
			func = function(inp)  GQ:Debug_FlagsMenu()  end
		})

		AddOption('detectpet',{
			hidden = true,
			name = L['Detect mount/pet'],
			desc = L['Perform a mount/pet detection.'],
			type = 'execute',
			func = function() GQ.CreatureDetector:Detect("force") end,
		})


		AddOption('questid',{
			hidden = true,
			name = L['Search guides for a quest'],
			type = 'execute',
			func = function(params) 
				local input=params.input:match("^questid%s*(%d+)$")
				GQ.QuestDB:SuggestGuidesForQuest(input) end,
		})

		--[[hidden--]] AddOption('tabs_icon', { type = 'toggle', width="double", desc="Use tabs icons", _default = true, set=function(i,v) Setter_Simple(i,v) GQ.Tabs:ApplySkin() end, hidden=true })
		--[[hidden--]] AddOption('briefopentime',{ type = 'range', min = 0.1, max = 2, step = 0.1, bigStep = 0.1, _default=0.5, hidden=true })
		--[[hidden--]] AddOption('briefclosetime',{ type = 'range', min = 0.1, max = 5, step = 0.1, bigStep = 0.1, _default=1.0, hidden=true })
		--[[hidden--]] AddOption('dispmodepri',{
			type = 'toggle',
			hidden=true,
			set = function(i,v)
				self.db.profile.dispmodepri = v
				self:Options_SetFromMode()
				end,
		})	
		--[[hidden--]]	AddOption('share_masterslave',{
				type = 'select',
				values = {
					[0]=L['opt_share_masterslave_none'],
					[1]=L['opt_share_masterslave_master'],
					[2]=L['opt_share_masterslave_slave'],
				},
				_default = 0,
				width="double",
				set = function(i,v) Setter_Simple(i,v)  GQ.Sync:Activate()  if GQ.CurrentGuide and GQ.CurrentGuide.headerdata.shared then GQ:ClearCurrentGuide() end end,
				disabled = function() return not self.db.profile.share_enabled end,
				hidden=true,
			})
		--[[hidden--]] AddOption('enable_vendor_tools',{ type = 'toggle',_default=true,width="full", hidden=true })
		--[[hidden--]] AddOption('showgreyvalue',{type = 'toggle', width="full", set = function(i,v) Setter_Simple(i,v) end, disabled=function() return not GQ.db.profile.enable_vendor_tools end, _default=false, hidden=true })
		--[[hidden--]] AddOption('autobuyframe',{ type='toggle',indent=20,_default=true, width="full", disabled=function() return not (self.db.profile.autobuy and GQ.db.profile.enable_vendor_tools) end, indent=15, width="double", hidden=true}) -- Confirm purchase
		--[[hidden--]] AddOption('im_prefer_repair',{ type = 'toggle', width = "full", set = function(i,v) Setter_Simple(i,v)  self:UpdateLocking()  end, _default = true, descStyle="inline",disabled=function() return not GQ.db.profile.enable_vendor_tools end, hidden=true }) -- Only find repair vendors
		--[[hidden--]] AddOption('autotrackquests',{ type = 'toggle', width = "full", _default = false, hidden = function() return not GQ.db.profile.debug end, })
		--[[hidden--]] AddOption('audiocues',{ type = 'toggle', width = "full", _default = false, hidden=true })
		--[[hidden--]] AddOption('minimapzoom',{ type = 'toggle', width = "full", set = function(i,v) Setter_Simple(i,v)  self.Pointer:MinimapZoomChanged() end, _default = false, hidden=true, })
		--[[hidden--]] AddOption('share_target',{ hidden=true, type = 'select', _default="SAY", width="single", values = {['SAY']="/say",['PARTY']="/party",['RAID']="/raid"}})
	end

	AddOptionGroup("display","Display","zgdisplay")  	---- OPTIONS: display
	do
		AddOption('enable_viewer',{  type = 'toggle',  
			get = function() 
				return self.db.profile.enable_viewer 
			end,  
			set = function(i,v)
				Setter_Simple(i,v)
				GoatQuest:ToggleFrame()
			end,
			_default=true,
			width=200,
		})

		AddOption('windowlocked',{ type = 'toggle', set = function(i,v) Setter_Simple(i,v)  self:UpdateLocking()  if GQ.Styles then GQ.Styles:ApplySettings() end  end, })

		-- The GoatQuest viewer (Styles/): the guide panel, plus the arrow or the
		-- halo for navigation.
		local function NavIs(id) return GQ.db.profile.viewer_nav==id end
		local function Setter_Viewer(i,v) Setter_Simple(i,v)  GQ.Styles:ApplySettings()  end
		AddOption('viewer_nav',{
			type = 'select',
			values = {arrow=L["opt_viewer_nav_arrow"], halo=L["opt_viewer_nav_halo"]},
			sorting = {"arrow","halo"},
			set = Setter_Viewer,
			_default = "arrow",
		})
		AddOption('viewer_scale',{ type = 'range', min = 0.6, max = 1.6, step = 0.05, bigStep = 0.05, isPercent = true, set = Setter_Viewer, _default = 1, })
		AddOption('viewer_accent',{
			type = 'select',
			values = {class=L["opt_viewer_accent_class"], custom=L["opt_viewer_accent_custom"]},
			sorting = {"class","custom"},
			set = Setter_Viewer,
			_default = "class",
			_inline = true,
		})
		-- The custom accent, GoatQuest gold until changed. Also tints the waypoint pins.
		AddOption('viewer_accent_color',{
			type = 'color',
			hidden = function() return GQ.db.profile.viewer_accent~="custom" end,
			get = function() return GQ.Styles:GetAccent() end,
			set = function(_,r,g,b)
				GQ.db.profile.viewer_accent_color = {r=r,g=g,b=b}
				GQ.Styles:ApplySettings()
			end,
			hasAlpha = false,
			width = "half",
			_default = {r=0.96,g=0.75,b=0.16},
		})
		AddOption('viewer_halo_offset',{ type = 'range', min = -300, max = 200, step = 5, bigStep = 10, set = Setter_Viewer, hidden = function() return not NavIs("halo") end, _default = -90, })
		-- Movers (Styles/Movers.lua), on a row of their own. The options close so the viewer is in view.
		AddOptionSep()
		AddOption('viewer_move',{ type = 'execute', func = function()
			if GQ.Styles.Movers:Open() then GQ.GuideMenu:Hide() end
		end, })

		AddOptionSep()
		--AddOption('hidetracker',{ type = 'toggle', set = function(i,v) Setter_Simple(i,v)  GQ.Replacements:UpdateVisibility("force")  end, _default=false, width=200,})
		AddOption('hideexptracker',{ type = 'toggle', set = function(i,v) Setter_Simple(i,v)  GQ.Replacements:UpdateVisibility("force")  end, _default=false, })

		-- The standard viewer's size, font size, flip and progress bar: hidden now that the
		-- GoatQuest viewer presents the guide, but popups still read framescale and fontsize.

		local framescales={0.625, 0.750, 0.875, 1, 1.125, 1.250, 1.375, 1.500, 1.625, 1.750}
		AddOption('framescale_s',{
			hidden = true,
			type = 'select',
			values = {[1]=L["opt_framescale_s_small"],[2]="'",[3]="'",[4]="||",[5]="'",[6]="'",[7]="'",[8]="'",[9]="'",[10]=L["opt_framescale_s_large"]},
			style = 'slider',
			set = function(i,v)
				Setter_Simple(i,v)
				self.db.profile.framescale = framescales[v]
				self.Frame:SetScale(GQ.db.profile.framescale)
				self:AlignFrame()
				self:UpdateFrame()
			end,
			get = function(i,v)
				for k,v in ipairs(framescales) do if self.db.profile.framescale==v then return k end end
				return 4
			end,
			_default=4	,
			width="single", 
			_inline=true,
		})
		AddOption('',{ type = 'description', name="  ", width=30, hidden = true})
		local fontsizes={7,8,9,10,11,12,13,14,15,17}
		AddOption('fontsize_s',{
			hidden = true,
			type = 'select',
			values = {[1]=L["opt_framescale_s_small"],[2]="'",[3]="'",[4]="||",[5]="'",[6]="'",[7]="'",[8]="'",[9]="'",[10]=L["opt_framescale_s_large"]},
			style = 'slider',
			set = function(i,v)
				Setter_Simple(i,v)
				self.db.profile.fontsize = fontsizes[v]
				self.db.profile.fontsecsize = fontsizes[v]*0.9
				self:UpdateFrame()
			end,
			get = function(i,v)
				for k,v in ipairs(fontsizes) do if self.db.profile.fontsize==v then return k end end
				return 3
			end,
			_default=3,
			width="single",
			_inline=true,
		})

		AddOption('',{type='description', name=L['opt_widgets'], font=GQ.font_dialog_gray, hidden = true})
		AddOption('widgetfloatopacity',{
			hidden = true,
			type = 'select',
			values = {[0.5]=L["opt_opacity_low"],[0.55]="'",[0.6]="'",[0.65]="||",[0.7]="'",[0.75]="'",[0.8]="'",[0.85]="'",[0.9]="'",[1]=L["opt_opacity_high"]},
			style = 'slider',
			set = function(i,v)
				Setter_Simple(i,v)
				GQ:SendMessage("SKIN_UPDATED")
			end,
			_default=1,
			width="single",
			_inline=true,
		})
		local widgetfloatframescales={0.625, 0.750, 0.875, 1, 1.125, 1.250, 1.375, 1.500, 1.625, 1.750}
		AddOption('widgetfloatscale_s',{
			hidden = true,
			type = 'select',
			values = {[1]=L["opt_framescale_s_small"],[2]="'",[3]="'",[4]="||",[5]="'",[6]="'",[7]="'",[8]="'",[9]="'",[10]=L["opt_framescale_s_large"]},
			style = 'slider',
			set = function(i,v)
				Setter_Simple(i,v)
				self.db.profile.widgetfloatscale = widgetfloatframescales[v]
				GQ:SendMessage("SKIN_UPDATED")
			end,
			get = function(i,v)
				for k,v in ipairs(widgetfloatframescales) do if self.db.profile.widgetfloatscale==v then return k end end
				return 4
			end,
			_default=4	,
			width="single", 
			_inline=true,
		})



		AddOption('resizeup',{
			hidden = true,
			type = 'toggle',
			set = function(i,v)
				Setter_Simple(i,v)
				self:Debug("size up? %s",tostring(self.db.profile.resizeup))
				local left,right,top,bottom = GQ.Frame:GetLeft(),GQ.Frame:GetRight(),GQ.Frame:GetTop(),GQ.Frame:GetBottom()
				local scale = GQ.Frame:GetScale()
				if not v then  -- right side up
					GQ.MasterFrame:ClearAllPoints()
					GQ.MasterFrame:SetPoint("TOPLEFT",UIParent,"BOTTOMLEFT",left*scale,top*scale)
				else  -- upside-down
					GQ.MasterFrame:ClearAllPoints()
					GQ.MasterFrame:SetPoint("BOTTOMLEFT",UIParent,"BOTTOMLEFT",left*scale,bottom*scale)
				end
				self:ReanchorFrame()
				--self.frameNeedsResizing = self.frameNeedsResizing + 1
				self:UpdateFrame(true)
				self.Frame:ApplySkin()
				self.Tabs:ApplySkin()
				GQ.BugReport.GuideRating:Position()

				C_Timer.After(0.001,function()
					--self.frameNeedsResizing = self.frameNeedsResizing + 1
					self:UpdateFrame(true)
				end)
				--self:AlignFrame()
				-- THIS SUCKS.
			end,
			width="double", 
		})

		AddOption('gqhideindungeons',{ type = 'toggle', name="Hide viewer when entering dungeons and raids", width = "full", _default = false })
		AddOption('showafterdungeons',{ type = 'toggle', name="Show viewer again when leaving", indent = 20, width = "full", _default = true, disabled = function() return not self.db.profile.gqhideindungeons end })

		AddOption('hideincombat',{ type = 'toggle', width="double", _default = false, set = function(i,v) Setter_Simple(i,v) GQ.Pointer:SetCombatHiding(v) GQ.ActionBar:SetCombatHiding() end,})
		AddOption('hidebarincombat',{ 
			type = 'toggle', 
			width="double",
			indent=20,
			_default = false,
			set = function(i,v) Setter_Simple(i,v) GQ.ActionBar:SetCombatHiding() end,
			disabled=function() return not self.db.profile.hideincombat end,

		})
		AddOption('repositionviewer',{ type = 'toggle', width="double", _default = true})
		AddOption('progress',{ type = 'toggle', hidden = true, width = "full", set = function(i,v) Setter_Simple(i,v) GQ:ApplySkin() end, _default = true})
		AddOption('showmapbutton',{ type = 'toggle', width = "full", _default=true, set = function(i,v) Setter_Simple(i,v)  self:UpdateMapButton()  end, })

		AddOptionSpace()
		AddOption('resetwindow',{
			type = 'execute',
			func = function() GQ.Frame:ResetWindow()  GQ.Styles:ResetPositions() end,
		})
	end

	AddOptionGroup("stepdisplay","StepDisplay","zgstepdisplay")  	---- OPTIONS: step display
	do
		AddOption('showcountsteps',{  type = "select",  values={  --[[[0]=L["opt_showcountsteps_all"],--]] [1]="1 (default)", [2]="2",[3]="3",[4]="4",[5]="5" } ,
			set=function(i,v)
				Setter_Simple(i,v)
				GQ.Frame:OnSizeChanged()
				GQ:UpdateFrame()
			end,
			_default=1,
			width="full", pulloutWidth="single", 
			marginTop=-6,
		})

		AddOption('fixedheight',{ type = 'toggle', width = "full", _default=false, set = function(i,v) Setter_Simple(i,v) GQ:UpdateFrame() end })
		
		if GQ.IsClassic then
			AddOptionSpace()
			AddOption('showvendor',{ type = 'toggle', width = "full", _default=true, set = function(i,v) Setter_Simple(i,v) GQ:UpdateFrame() end })
			AddOption('showtrainer',{ type = 'toggle', width = "full", _default=true, set = function(i,v) Setter_Simple(i,v) GQ:UpdateFrame() end })
			AddOption('showstablemaster',{ type = 'toggle', width = "full", _default=true, set = function(i,v) Setter_Simple(i,v) GQ:UpdateFrame() end })
		end

			AddOption('skiphome',{
				type = 'toggle',
				_default = false,
				width="full",
			})
		AddOption('skiptaxi',{
				type = 'toggle',
				_default = false,
				width="full",
			})

		AddOptionSpace()
			AddOption('showinlinetravel',{ type = 'toggle', width = "full", _default=false, set = function(i,v) Setter_Simple(i,v) GQ:ShowWaypoints() GQ:UpdateFrame() end })
			
		AddOption('',{ type = 'description', name=L['opt_stepdisplay_dungeon'], font=GQ.font_dialog_gray})
			if GQ.IsRetail then
				AddOption('showallroles',{ type = 'toggle', width = "full", desc = function() return L['opt_showallroles_desc'] .. (UnitGroupRolesAssigned("Player")=="NONE" and "\n"..L['opt_showallroles_descwarnnone'] or "") end, _default=true, })
			else
				AddOption('showallroles',{ type = 'toggle', width = "full", desc = L['opt_showallroles_desc'], _default=true})
			end

		AddOptionSep()

		AddOption('',{ type = 'description', name=L['opt_group_share'], font=GQ.font_dialog_gray})
		AddOption('sync_enabled',{
			type = 'toggle',
			_default = true,
			width="full",
			set=function(i,v) Setter_Simple(i,v)  GQ.Sync:UpdateMode()  end,
		})
		AddOption('sync_snap',{
			type = 'toggle',
			_default = true,
			width="full",
			disabled=function() return not GQ.db.profile.sync_enabled end,
			set=function(i,v) Setter_Simple(i,v)  end,
		})
		AddOption('share_masterslave',{
			type = 'select',
			values = {
				[0]=L['opt_share_masterslave_none'],
				[1]=L['opt_share_masterslave_master'],
				[2]=L['opt_share_masterslave_slave'],
			},
			_default = 0,
			width="double",
			set = function(i,v)  Setter_Simple(i,v)  GQ.Sync:UpdateMode()  end,
			disabled = function() return not self.db.profile.share_enabled end,
			hidden=true,
		})
	end

	AddOptionGroup("automation","Automation","zgautomation")  	---- OPTIONS: Automation
	do
		AddOption('',{ type = 'description', name=L['opt_header_automation_quests'], font=GQ.font_dialog_gray})
		AddOption('autoacceptturnin',{ type = 'toggle', _default=not GQ.DEV, width="full", set=function(k,v) Setter_Simple(k,v) self.db.profile.autoaccept=v self.db.profile.autoturnin=v end})
		AddOption('autoacceptturninall',{
			name=function() return L['opt_autoacceptturninall'] end,
			desc=function() return L['opt_autoacceptturninall_desc'] end,
			type = 'toggle',
			width="single",
			disabled=function() return not self.db.profile.autoacceptturnin end,
			indent=20,
		})
		AddOption('autogossip',{ type = 'toggle', width = "full", _default = not GQ.DEV })
		AddOptionSep()

		AddOption('',{ type = 'description', name=L['opt_header_automation_travel'], font=GQ.font_dialog_gray})
		AddOption('autotaxi',        { type = 'toggle', width = "double", disabled=function() return not self.db.profile.pathfinding end, set=Setter_Travel, _default=false, })

		AddOption('',{ type = 'description', name=L['opt_header_automation_inventory'], font=GQ.font_dialog_gray})
		AddOption('autobuy',{ type = 'toggle',_default=true,width="full", disabled=function() return not GQ.db.profile.enable_vendor_tools end})  -- Buy guide items
		AddOption('showgreysellbutton',{ type = 'toggle',_default=true,width=200, set=function(i,v) Setter_Simple(i,v)  GQ.Inventory:SetUpGreySellButton()  GQ.Inventory.greysellbutton:SetShown(v) end, disabled=function() return not GQ.db.profile.enable_vendor_tools end })  -- Show vendor button
		AddOption('autosell',{ type = 'toggle', _default=true,width=250,disabled=function() return not GQ.db.profile.enable_vendor_tools end})  -- Sell gray items
		--AddOption('autosellother',{ type = 'toggle', _default=false,width="full", disabled=function() return not GQ.db.profile.enable_vendor_tools end}) -- Sell unusable items

		AddOption('',{ type = 'description', name=L['opt_autorepair'], font=GQ.font_dialog_white})
		AddOption('autorepair',{
			name = "",
			type = 'select',
			width="355",
			values = function() 
				local t = {
					[1]=L['opt_autorepair_manual'],	----Do not auto-repair
					[2]=L['opt_autorepair_ownonly'],	----Use own money to auto-repair
				}
				if not GQ.IsClassic then
					t[3]=L['opt_autorepair_guildandown']	----Use guild money if possible, if not use own money
					t[4]=L['opt_autorepair_ownandguild']	----Use own money if possible, if not use guild money
				end
				return t
			end,
			_default = 1,
		})

		AddOption('',{
		    type='description',
		    name=L['opt_autorepair_notinguild'],
		    font=GQ.font_dialog_red,
		    hidden=function() return IsInGuild() or GQ.db.profile.autorepair<=2 end
		})

		AddOption('',{
		    type='description',
		    name=L['opt_autorepair_nopermission'],
		    font=GQ.font_dialog_red,
		    hidden=function() return not IsInGuild() or CanGuildBankRepair() or GQ.db.profile.autorepair<=2 end
		})

		--[[	Auto-cancel removed because of an intermittent CancelCinematic bug
		AddOptionSpace()

		AddOptionSpace()
			AddOption('',{ type = 'description', name=L['opt_header_others'], font=GQ.font_dialog_gray})
			AddOption('autoskipcutscenes', {type = 'toggle', width="double", _default=false,})
		--]]
	end

	AddOptionGroup("actionbuttons","Action Buttons","zgactionbuttons")  	---- OPTIONS: Action Buttons
	do
		AddOption('enable_actionbar',{  type = 'toggle',  
			get = function() 
				return self.db.profile.enable_actionbar 
			end,  
			set = function(i,v)
				Setter_Simple(i,v)
				if not v then 
					GQ.ActionBar:ClearBar()
				else
					GQ.ActionBar:SetActionButtons()
				end
				GQ.ActionBar:ToggleFrame()
			end,
			_default=true,
			width="double",
		})

		AddOption('actionbar_direction',{
			type = 'select',
			width="145",
			values = {
					[1]=("Left"),
					[2]=("Right"),
				},
			_default = 2,
			disabled = function() return not self.db.profile.enable_actionbar end,
			set = function(i,v)
				Setter_Simple(i,v)
				GQ.ActionBar:GetDirection()
			end,
		})

		AddOptionSep()
		local framescales={0.625, 0.750, 0.875, 1.000, 1.125, 1.250, 1.375, 1.500, 1.625, 1.750}
		AddOption('actionbar_scale_s',{
			type = 'select',
			values = {[1]=L["opt_framescale_s_small"],[2]="'",[3]="'",[4]="||",[5]="'",[6]="'",[7]="'",[8]="'",[9]="'",[10]=L["opt_framescale_s_large"]},
			style = 'slider',
			set = function(i,v)
				Setter_Simple(i,v)
				self.db.profile.actionbar_scale = framescales[v]
				self.ActionBar:SetScale(GQ.db.profile.actionbar_scale)
			end,
			get = function(i,v)
				for k,v in ipairs(framescales) do if self.db.profile.actionbar_scale==v then return k end end
				return 4
			end,
			_default=4,
			width="single", 
			_inline=true,
			disabled = function() return not self.db.profile.enable_actionbar end,
		})
		AddOptionSpace()

		AddOption('',{ type = 'description', name=L['opt_actionbar_types_title'], font=GQ.font_dialog_gray})
		AddOption('actionbar_quest',{ 
			type = 'toggle', 
			_default = true, 
			width = "full", 
			set = function(i,v)
				Setter_Simple(i,v)
				GQ.ActionBar:SetActionButtons()
			end,
			disabled = function() return not self.db.profile.enable_actionbar end,
		})
		AddOption('actionbar_talk',{ 
			type = 'toggle', 
			_default = true, 
			width = "full", 
			set = function(i,v)
				Setter_Simple(i,v)
				GQ.ActionBar:SetActionButtons()
			end,
			disabled = function() return not self.db.profile.enable_actionbar end,
		})
		AddOption('actionbar_kill',{ 
			type = 'toggle', 
			_default = true, 
			width = "full", 
			set = function(i,v)
				Setter_Simple(i,v)
				GQ.ActionBar:SetActionButtons()
			end,
			disabled = function() return not self.db.profile.enable_actionbar end,
		})

		AddOption('actionbar_trash',{ 
			type = 'toggle', 
			hidden = GQ.GuideOnly,
			_default = true, 
			width = "full", 
			set = function(i,v)
				Setter_Simple(i,v)
				GQ.ActionBar:SetActionButtons()
			end,
			disabled = function() return not self.db.profile.enable_actionbar end,
		})

		AddOptionSpace()
		AddOption('targetonclick',{ 
			type = 'toggle', 
			hidden = GQ.GuideOnly or GQ.IsForever,
			_default = true, 
			width = "full", 
			disabled = function() return not self.db.profile.enable_actionbar end,
		})
	end

	AddOptionGroup("travelsystem","Waypoint Arrow","zgtravel")  	---- OPTIONS: Waypoint Arrow
	do
		AddOption('arrowshow',{  width="double", type = 'toggle', set = function(i,v) Setter_Simple(i,v)  self.Pointer:UpdateArrowVisibility() end, _default=true, })
		AddOption('arrowfreeze',{ type = 'toggle', set = function(i,v) Setter_Simple(i,v)  self.Pointer:SetupArrow() end, _default=false, })
		--[[ hidden --]] AddOption('arrowalpha',{
			type = 'range',
			set = function(i,v) Setter_Simple(i,v) 	GQ.Pointer:SetupArrow()  end,
			min = 0.3, max = 1.0, step = 0.1, bigStep = 0.1, isPercent = true,
			_default = 1.0,
			hidden = true,
		})
		AddOptionSep()

		local arrowscales={0.625, 0.750, 0.875, 1.000, 1.125, 1.250, 1.375, 1.500, 1.625, 1.750}
		AddOption('arrowscale_s',{
			type = 'select',
			values = {[1]=L["opt_framescale_s_small"],[2]="'",[3]="'",[4]="||",[5]="'",[6]="'",[7]="'",[8]="'",[9]="'",[10]=L["opt_framescale_s_large"]},
			style = 'slider',
			set = function(i,v)
				Setter_Simple(i,v)
				self.db.profile.arrowscale = arrowscales[v]
				GQ.Pointer:SetupArrow()
			end,
			get = function(i,v)
				for k,v in ipairs(arrowscales) do if self.db.profile.arrowscale==v then return k end end
				return 2
			end,
			_default=2,
			width="single", 
			_inline=true,
		})
		AddOption('',{ type = 'description', name="  ", width=30})

		local arrowfontsizes={7,8,9,10,11,12,13,14,15,17}
		AddOption('arrowfontsize_s',{
			type = 'select',
			values = {[1]=L["opt_framescale_s_small"],[2]="'",[3]="'",[4]="||",[5]="'",[6]="'",[7]="'",[8]="'",[9]="'",[10]=L["opt_framescale_s_large"]},
			style = 'slider',
			set = function(i,v)
				Setter_Simple(i,v)
				self.db.profile.arrowfontsize = arrowfontsizes[v]
				GQ.Pointer:SetFontSize(self.db.profile.arrowfontsize)
			end,
			get = function(i,v)
				for k,v in ipairs(arrowfontsizes) do if self.db.profile.arrowfontsize==v then return k end end
				return 4
			end,
			_default=4,
			width="single",
			_inline=true,
		})
		AddOptionSpace()
		AddOption('arrowoutline',     { type = 'toggle', width = "double", _default=false,  set=function(i,v) Setter_Simple(i,v) GQ.Pointer:SetFontSize(GQ.db.profile.arrowfontsize) end, })

		AddOptionSpace()
			AddOption('arrowskin',{
				type = "select",
				values = function()
					local t={}
					for id,skin in pairs(self.Pointer.ArrowSkins) do
						t[id]=skin.name
					end
					return t
				end,
				hidden = true,
				_default = "GoatQuest",
			})

		AddOption('arrowunit',{ type = 'select', _default=1, 
			values={
				[1]="yards / miles",
				[2]="kilometers / meters",
			},
			width="single", pulloutWidth="single", 
		})

		AddOptionSpace()
		AddOption('',{ type = 'description', name=L['opt_travelsystem_enable_title'], font=GQ.font_dialog_gray})
		AddOption('pathfinding',{
			hidden = function() return LibRover.is_stub end, -- and not GQ.guidesets['PetsMountsA'] and not GQ.guidesets['PetsMountsH'],
			type = 'toggle',
			set = function(i,v) 
				Setter_Simple(i,v)  
				if v and not LibRover.ready then
					GQ.LIBROVER_MANAGED_STARTUP = false
					LibRover:DoStartup()
				end
				LibRover.updating=v  
				self.Pointer.TempWaypath=nil  
				self:ShowWaypoints() 
			end,
			width="full",
			_default = true,
		})

		AddOption('',{ type = 'description', name=L['opt_travelmethods_title'], font=GQ.font_dialog_gray})
	
		for index=1,4 do
			AddOption('travelmode_'..index,{
				type = 'toggle',
				set = function(i,v) 
					if self.db.global.travelmode==index then return end -- we are faking radio, so can't uncheck oneself
					--for j=1,5 do
					--	self.db.global['travelmode_'..j] = false
					--end
					self.db.global.travelmode = index
					Setter_Travel(i,v)
				end,
				get = function() return self.db.global.travelmode==index end,
				width="double",
				_default = j==3,
			})
		end

		AddSubgroup("travelmode_custom",{
			name = "",
			font=GQ.font_dialog,
			inline=true,
			hidden = function() return GQ.db.global.travelmode~=4 end,
		})
			AddOption('sep00pathf',{ type="header", name=L["opt_travelmode_4"] })
			AddOption('pathfinding_comfort',     { 
				type = 'toggle', 
				width = "double", 
				hidden = function() return GQ.db.global.travelmode~=4 end, 
				_default=false,
				set = function(i,v)
					local val = v and 1 or 0
					Setter_Travel(i,val)
				end,
				get = function()
					return GQ.db.profile.pathfinding_comfort==1
				end,
				indent=20,
			})
			AddOption('travelavoidportals',     { type = 'toggle', width = "double", hidden = function() return GQ.db.global.travelmode~=4 end, _default=false,  set=Setter_Travel, indent=20,})
			AddOption('travelusehs',     { type = 'toggle', width = "double", hidden = function() return GQ.db.global.travelmode~=4 end, _default=true,  set=Setter_Travel, indent=20,})
			AddOption('traveluseitems',     { type = 'toggle', width = "double", hidden = function() return GQ.db.global.travelmode~=4 end, _default=true,  set=Setter_Travel, indent=20,})
			AddOption('travelusespells',     { type = 'toggle', width = "double", hidden = function() return GQ.db.global.travelmode~=4 end, _default=true,  set=Setter_Travel, indent=20,})
		EndSubgroup()
	
		AddOption('travelprefertaxi',     { type = 'toggle', width = "double", _default=not GQ.IsRetail, set=Setter_Travel, })
	end

	AddOptionGroup("maps","Maps","zgmaps")  	---- OPTIONS: Maps
	do
		AddOption('',{ type = 'description', name=L['opt_maps_general_title'], font=GQ.font_dialog_gray})
		AddOption('maplines_enabled',{ type = 'toggle', width = "double", set = function(i,v) Setter_Simple(i,v) GQ.Pointer:ClearAntsAndLines() end, _default = true, })
		AddOption('maplines', {
			type = 'select',
			values={ [1]=L["opt_maplines_ants"], [2]=L["opt_maplines_solid"] },
			width="single", pulloutWidth="single",
			set = function(i,v)
				Setter_Simple(i,v)
				GQ.Pointer:ClearAntsAndLines()
			end,
			_default=2
		})

		AddOptionSpace()
		AddOption('',{ type = 'description', name=L['opt_maps_world_title'], font=GQ.font_dialog_gray})
		AddOption('foglight',{ type = 'toggle', width = "full", set = function(i,v) Setter_Simple(i,v)  self.Foglight:ToggleOverlay() end, _default = true, })

		AddOption('mapicons',{
			type = 'toggle',
			_default = true,
			set = function(i,v)
				Setter_Simple(i,v)
				GQ.Pointer:ClearWaypoints("manual")
				GQ:ShowWaypoints()
			end
		})

		if GQ.IsRetail or GQ.IsClassicMOP then
			AddOptionSpace()
			AddOption('poienabled',{ type = 'toggle', width = "double", set = function(i,v) Setter_Simple(i,v) GQ.Poi:ChangeState(v) end, _default = true, })
			AddOptionSep()
			AddOption('poisize',{
				type = 'select',
				style = 'slider',
				values = { [17] = L["opt_framescale_s_small"], [20] = L["opt_framescale_s_normal"], [23] = L["opt_framescale_s_large"] },
				set = function(i,v) Setter_Simple(i,v) GQ.Pointer:RefreshDynamicValues() end,
				_default = 20,
				disabled = function() return not self.db.profile.poienabled end,
				width="single", 
			})
			AddOption('poialphatoggle',{
				type = 'toggle',
				set = function(i,v) Setter_Simple(i,v) GQ.db.profile.poialpha = (v and 0.68 or 1)  GQ.Pointer:RefreshDynamicValues() end,
				_default = false,
				disabled = function() return not self.db.profile.poienabled end,
				width="double", 
			})
			AddOptionSpace()
			AddOption('poishow',{type='description', font=GQ.font_dialog })
				AddOption('poishow_rare',{
					name = L['opt_poishow_rare'],
					desc = L['opt_poishow_rare_desc'],
					type = 'toggle',
					set = function(i,v) Setter_Simple(i,v) GQ.db.profile.hideguide.rare=not v GQ.Poi:ChangeState(true) end,
					get = function() return not GQ.db.profile.hideguide.rare end,
					disabled = function() return not self.db.profile.poienabled end,
					_default = true,
				})
				AddOption('poishow_treasure',{
					name = L['opt_poishow_treasure'],
					desc = L['opt_poishow_treasure_desc'],
					type = 'toggle',
					set = function(i,v) Setter_Simple(i,v) GQ.db.profile.hideguide.treasure=not v GQ.Poi:ChangeState(true) end,
					get = function() return not GQ.db.profile.hideguide.treasure end,
					disabled = function() return not self.db.profile.poienabled end,
					_default = true,
				})
				
				AddOptionSep()

			AddOption('',{ type = 'description', name=L['opt_poitype'], font=GQ.font_dialog_white})
			AddOption('poitype',{
				name = "",
				type = 'select',
				values = {
					[1]=L['opt_poitype_quick'],
					[2]=L['opt_poitype_complete'],
				},
				_default = 2,
				set = function(i,v) Setter_Simple(i,v) GQ.Poi:ChangeState(true) end,
				disabled = function() return not self.db.profile.poienabled end,
			})
			AddOptionSpace()

			AddOption('worldquestenable',{ type = 'toggle', _default=true, width="full", set=function(i,v) Setter_Simple(i,v) if v then GQ.WorldQuests.DisplayFrame:Show() else GQ.WorldQuests.DisplayFrame:Hide() end if WorldMapFrame then WorldMapFrame:OnMapChanged() end end})
			AddOption('worldquestlocal',{ type = 'toggle', _default=true, width="full", desc=L["opt_worldquestlocal_desc"], disabled=function() return not self.db.profile.worldquestenable end, indent=20 })
			AddOption('worldquestmap',{ type = 'toggle', width = "full", _default = true, set = function(i,v) Setter_Simple(i,v) if not v then self.db.profile.n_popup_wq = false end end })
			AddOption('worldquestscale',{
				type = 'select',
				style = 'slider',
				values = { 
					[0.70] = L["opt_framescale_s_small"], 
					[0.80] = "'", 
					[0.90] = "'", 
					[1.00] = L["opt_framescale_s_normal"], 
					[1.10] = "'", 
					[1.20] = L["opt_framescale_s_large"] 
				},
				set = function(i,v) Setter_Simple(i,v) GQ.WorldQuests.DisplayFrame:SetScale(v) end,
				_default = 1,
				disabled=function() return not self.db.profile.worldquestenable end, 
				indent=20,
				width="single", 
				_inline=true,
			})
		
		end

		AddOptionSpace()
		AddOption('',{ type = 'description', name=L['opt_maps_taxi_title'], font=GQ.font_dialog_gray})
		AddOption('highlighttaxi', {
			type = 'toggle',
			set = Setter_Simple, 
			get = Getter_Simple, 
			width="double",
			_default=true
		})

		AddOptionSpace()
		AddOption('',{ type = 'description', name=L['opt_maps_dungeon_title'], font=GQ.font_dialog_gray})
		AddOption('preview',     { 
			desc = L['opt_preview_desc'],
			type = 'toggle', 
			width = "double", 
			get = Getter_Simple, 
			set = function(i,v) 
				Setter_Simple(i,v)
				if v then
					if not GetPlayerFacing() then GQ.PointerMap:ShowPreview() end
				else
					GQ.PointerMap:HidePreview()
				end
			end, 
			_default=true,  })
		AddOptionSep()
		AddOption('preview_scale',{
			type = 'select',
			style = 'slider',
			values = { 
				[0.5] = L["opt_preview_scale_small"], 
				[0.55] = "'", 
				[0.6] = "'", 
				[0.65] = "'", 
				[0.7] = L["opt_preview_scale_normal"], 
				[0.80] = "'", 
				[0.90] = "'", 
				[1.00] = "'", 
				[1.10] = "'", 
				[1.20] = L["opt_preview_scale_full"] 
			},
			set = function(i,v) Setter_Simple(i,v) GQ.PointerMap:UpdateSettings() end,
			_default = 1,
			disabled = function() return not self.db.profile.preview end,
			width="single", 
			_inline=true,
		})
		AddOption('',{ type = 'description', name="  ", width=30})
		AddOption('preview_alpha',{
			type = 'select',
			style = 'slider',
			values = { 
				[0.5] = L["opt_preview_alpha_low"], 
				[0.55] = "'", 
				[0.6] = "'", 
				[0.65] = "'", 
				[0.7] = L["opt_preview_alpha_normal"], 
				[0.80] = "'", 
				[0.85] = "'", 
				[0.90] = "'", 
				[0.95] = "'", 
				[1] = L["opt_preview_alpha_high"] 
			},
			set = function(i,v) Setter_Simple(i,v) GQ.PointerMap:UpdateSettings() end,
			_default = 0.7,
			disabled = function() return not self.db.profile.preview end,
			width="single", 
			_inline=true,
			--hidden=true,
		})
		AddOption('',{ type = 'description', name="  ", width=30})
		AddOptionSep()
		AddOption('preview_duration',{
			type = 'select',
			values = { [0] = L["opt_preview_duration_perm"], [3] = L["opt_preview_duration_3"], [5] = L["opt_preview_duration_5"], [10] = L["opt_preview_duration_10"] },
			set = function(i,v) Setter_Simple(i,v) GQ.PointerMap:UpdateSettings() end,
			_default = 0,
			disabled = function() return not self.db.profile.preview end,
			width="single",
			_inline=true,
		})
		AddOption('',{ type = 'description', name="  ", width=30})
		AddOption('preview_control',{
			type = 'select',
			values = { 
				manual = L["opt_preview_control_manual"], 
				step = L["opt_preview_control_step"],
				--stepnc = L["opt_preview_control_stepnc"],
			},
			set = Setter_Simple,
			_default = "manual",
			disabled = function() return not self.db.profile.preview end,
			width="single",
			_inline=true,
		})

	end

	if not GQ.GuideOnly then
	AddOptionGroup("gear","Gear","zggear")	---- OPTIONS: gear
	do
		AddOption('sep00devdisp',{ type="header", name=L['opt_gear_title']})
		--AddOption('',{ type = 'description', name=L['opt_gear_title'], font=GQ.font_dialog_gray})
		AddOption('autogear',{ type = 'toggle',width="full", _default=true, set = function(i,v) 
			Setter_Simple(i,v) 
			GQ.ItemScore.GearFinder:UpdateSystemTab() 
			GQ.ItemScore.Upgrades:AttachBagButton() 
			GQ.ItemScore.Upgrades:ScoreEquippedItems()
			GQ.ItemScore.Upgrades:RefreshBags()
		end})
		AddOption('autogear_max',{type = 'toggle', width = "full", _default = false, indent=20, disabled = function() return not self.db.profile.autogear end, set = function(i,v) 
			Setter_Simple(i,v) 
			GQ.ItemScore.GearFinder:UpdateSystemTab() 
			GQ.ItemScore.Upgrades:AttachBagButton() 
			GQ.ItemScore.Upgrades:ScoreEquippedItems()
			GQ.ItemScore.Upgrades:RefreshBags()
		end})
		
		AddOptionSpace()

		AddOption('autogearpopup',{ type = 'toggle', width="double", disabled = function() return not self.db.profile.autogear end, _default=true})

		AddOptionSpace()
		AddOption('questitemselector',{ type = 'toggle', width="double", _default=true})
		AddOption('autoselectitem',{ type = 'toggle', width="double", _default=false, disabled = function() return not self.db.profile.questitemselector end, indent=20 })
		AddOption('autogearauto',{ type='toggle', width="full", _default=false, disabled=function() return not self.db.profile.autogear end })
		if GQ.IsRetail or GQ.IsClassicWOTLK or GQ.IsClassicCATA or GQ.IsClassicMOP then 
			AddOption('autogear_keepheirlooms',{ type = 'toggle', width="double", _default=false, disabled = function() return not self.db.profile.autogear end})
		end

		AddOption('itemscore_tooltips',{ type = 'toggle',width="full", _default=true, set = Setter_Simple, disabled=function() return not self.db.profile.autogear end})
		--[[hidden--]]AddOption('itemscore_tooltips_azerite',{ type = 'toggle',width="full", _default=true, indent=20, set = Setter_Simple, disabled=function() return not (self.db.profile.autogear and self.db.profile.itemscore_tooltips) end, hidden=true})

		
		AddOption('sep00devdisp',{ type="header", name="Gear Finder"})
		--AddOption('',{ type = "description", name = L["opt_gear_sources"]:format(), font=GQ.font_dialog })
		AddOption('autogear_finder',{type = 'toggle', width = "full", _default = true, set = function(i,v) 
			Setter_Simple(i,v)
			GQ.ItemScore.GearFinder:UpdateSystemTab()
		end})
		AddOptionSpace()
		AddOption('',{ type = "description", name = L["opt_gear_sources_dungeons"]:format(), font=GQ.font_dialog_gray, width="full", disabled=function() return not self.db.profile.autogear_finder end })
			AddOption('gear_1',{ name=PLAYER_DIFFICULTY1,  type='toggle', width="100", _default=true, set = function(i,v) Setter_Simple(i,v) GQ.ItemScore.GearFinder:ClearResults() end, disabled=function() return not self.db.profile.autogear_finder end, })
			AddOption('gear_2',{ name=PLAYER_DIFFICULTY2,  type='toggle', width="100", _default=true, set = function(i,v) Setter_Simple(i,v) GQ.ItemScore.GearFinder:ClearResults() end, disabled=function() return not self.db.profile.autogear_finder end, })
			if GQ.IsRetail then
				AddOption('gear_23',{ name=PLAYER_DIFFICULTY6,  type='toggle', width="100", _default=false, set = function(i,v) Setter_Simple(i,v) GQ.ItemScore.GearFinder:ClearResults() end, disabled=function() return not self.db.profile.autogear_finder end, })
				AddOption('gear_24',{ name=PLAYER_DIFFICULTY_TIMEWALKER,  type='toggle', width="120", _default=false, set = function(i,v) Setter_Simple(i,v) GQ.ItemScore.GearFinder:ClearResults() end, disabled=function() return not self.db.profile.autogear_finder end, })
				AddOption('gear_8',{ name="Mythic+",  type='toggle', width="100", _default=false, set = function(i,v) Setter_Simple(i,v) GQ.ItemScore.GearFinder:ClearResults() end, disabled=function() return not self.db.profile.autogear_finder end, })
				AddOption('gear_8_level',{
					name="Mythic difficulty",
					--name="Mythic upgrade level",
					type = 'select',
					style = 'slider',
					values = function() 
						local rets = {}
						for level,_ in pairs(GQ.ItemScore.MythicPlusMods) do
							rets[level] = "+"..level
						end
						return rets
					end,
					_default=2,
					width=400,
					hidden=function() return not self.db.profile.gear_8 end,
					set = function(i,v) Setter_Simple(i,v) GQ.ItemScore.GearFinder:ClearResults() end, disabled=function() return not (self.db.profile.autogear_finder and self.db.profile.gear_8) end, })
			end
			if GQ.IsClassicWOTLK then 
				AddOptionSpace()
				AddOption('gear_91',{ name="Titan Rune Alpha", type='toggle', width="100", _default=false, 
					set = function(i,v) 
						Setter_Simple(i,v) 
						GQ.ItemScore.GearFinder:ClearResults() 
						GQ.ItemScore.GearFinder:SetTitanRune() 
					end, 
					width="double", 
					disabled=function() return not self.db.profile.autogear end, }) 
				AddOption('gear_92',{ name="Titan Rune Beta", type='toggle', width="100", _default=false, 
					set = function(i,v) 
						Setter_Simple(i,v) 
						GQ.ItemScore.GearFinder:ClearResults() 
						GQ.ItemScore.GearFinder:SetTitanRune() 
					end, 
					width="double", 
					disabled=function() return not self.db.profile.autogear end, }) 
			end

		AddOptionSpace()
		AddOption('',{ type = "description", name = L["opt_gear_sources_raids"]:format(), font=GQ.font_dialog_gray, width="full" })
			if GQ.IsRetail then 
				AddOption('gear_17',{ name=PLAYER_DIFFICULTY3, type='toggle', width="100", _default=true, set = function(i,v) Setter_Simple(i,v) GQ.ItemScore.GearFinder:ClearResults() end, disabled=function() return not self.db.profile.autogear_finder end, }) 
				AddOption('gear_14',{ name=PLAYER_DIFFICULTY1, type='toggle', width="100", _default=false, set = function(i,v) Setter_Simple(i,v) GQ.db.profile.gear_3=v GQ.db.profile.gear_4=v GQ.ItemScore.GearFinder:ClearResults() end, disabled=function() return not self.db.profile.autogear_finder end, }) -- also setting filters for prelfr raids 
				AddOption('gear_15',{ name=PLAYER_DIFFICULTY2, type='toggle', width="100", _default=false, set = function(i,v) Setter_Simple(i,v) GQ.db.profile.gear_5=v GQ.db.profile.gear_6=v GQ.ItemScore.GearFinder:ClearResults() end, disabled=function() return not self.db.profile.autogear_finder end, }) 
				AddOption('gear_16',{ name=PLAYER_DIFFICULTY6, type='toggle', width="100", _default=false, set = function(i,v) Setter_Simple(i,v) GQ.db.profile.gear_7=v GQ.ItemScore.GearFinder:ClearResults() end, disabled=function() return not self.db.profile.autogear_finder end, }) 
			end
			if GQ.IsClassicWOTLK or GQ.IsClassicCATA then
				AddOption('gear_3',{ name=RAID_DIFFICULTY1, type='toggle', width="100", _default=false, set = function(i,v) Setter_Simple(i,v) GQ.ItemScore.GearFinder:ClearResults() end, disabled=function() return not self.db.profile.autogear_finder end, })
				--AddOption('gear_5',{ name=RAID_DIFFICULTY3, type='toggle', width="150", _default=false, set = function(i,v) Setter_Simple(i,v) GQ.ItemScore.GearFinder:ClearResults() end, disabled=function() return not self.db.profile.autogear end, }) 
				AddOption('gear_4',{ name=RAID_DIFFICULTY2, type='toggle', width="100", _default=false, set = function(i,v) Setter_Simple(i,v) GQ.ItemScore.GearFinder:ClearResults() end, disabled=function() return not self.db.profile.autogear_finder end, })
				--AddOption('gear_6',{ name=RAID_DIFFICULTY4, type='toggle', width="150", _default=false, set = function(i,v) Setter_Simple(i,v) GQ.ItemScore.GearFinder:ClearResults() end, disabled=function() return not self.db.profile.autogear end, }) 
			end
			
			if GQ.IsClassicMOP then
				AddOption('gear_3',{ name=RAID_DIFFICULTY1, type='toggle', width="100", _default=false, set = function(i,v) Setter_Simple(i,v) GQ.ItemScore.GearFinder:ClearResults() end, disabled=function() return not self.db.profile.autogear_finder end, })
				AddOption('gear_5',{ name=RAID_DIFFICULTY3, type='toggle', width="150", _default=false, set = function(i,v) Setter_Simple(i,v) GQ.ItemScore.GearFinder:ClearResults() end, disabled=function() return not self.db.profile.autogear end, }) 
				AddOption('gear_4',{ name=RAID_DIFFICULTY2, type='toggle', width="100", _default=false, set = function(i,v) Setter_Simple(i,v) GQ.ItemScore.GearFinder:ClearResults() end, disabled=function() return not self.db.profile.autogear_finder end, })
				AddOption('gear_6',{ name=RAID_DIFFICULTY4, type='toggle', width="150", _default=false, set = function(i,v) Setter_Simple(i,v) GQ.ItemScore.GearFinder:ClearResults() end, disabled=function() return not self.db.profile.autogear end, }) 
				AddOption('gear_7',{ name=PLAYER_DIFFICULTY3, type='toggle', width="150", _default=false, set = function(i,v) Setter_Simple(i,v) GQ.ItemScore.GearFinder:ClearResults() end, disabled=function() return not self.db.profile.autogear end, }) 
			end
			
			if GQ.IsClassic or GQ.IsClassicTBC then
				AddOption('gear_14',{ name=PLAYER_DIFFICULTY1, type='toggle', width="100", _default=false, set = function(i,v) Setter_Simple(i,v) GQ.db.profile.gear_3=v GQ.db.profile.gear_4=v GQ.ItemScore.GearFinder:ClearResults() end, disabled=function() return not self.db.profile.autogear_finder end, }) -- also setting filters for prelfr raids 
			end

			AddOptionSpace()

		AddOptionSpace()

		AddOption('clearnotupgrades',{
			type = 'execute',	
			func=function ()
				if GQ.IsRetail then
					wipe(GQ.db.char.badupgrade[GetSpecialization() or 1])
				else
					wipe(GQ.db.char.badupgrade[GQ.db.char.gear_selected_build or 1])
				end
				GQ:Print(L['opt_itemscore_ae_clearednotupgrade'])
			     end,
			 width='single',
			 disabled=function() return not self.db.profile.autogear end,
		})

		AddOptionSpace()
		AddOption('markupgrades',{ type = 'toggle',width="full", _default=true, set = function(i,v) Setter_Simple(i,v) GQ.ItemScore.Upgrades:RefreshBags() end, disabled = function() return not self.db.profile.autogear end,})
		AddOption('upgradebest',{
			type = 'select',
			values = { 
				[0] = "all upgrades",
				[1] = "best in slot upgrades",
			},
			set = function(i,v)
				Setter_Simple(i,v==1)
				GQ.ItemScore.Upgrades:RefreshBags()
			end,
			get = function(i,v)
				return self.db.profile.upgradebest and 1 or 0
			end,
			_default = false,
			width="single",
			_inline=true,
			disabled = function() return not (self.db.profile.autogear and self.db.profile.markupgrades) end,
		})

		local slot_ids = {
			INVSLOT_MAINHAND,
			INVSLOT_OFFHAND,
			INVSLOT_HEAD,
			INVSLOT_NECK,
			INVSLOT_SHOULDER,
			INVSLOT_BACK,
			INVSLOT_CHEST,
			INVSLOT_WRIST,
			INVSLOT_HAND,
			INVSLOT_WAIST,
			INVSLOT_LEGS,
			INVSLOT_FEET,
			INVSLOT_FINGER1,
			INVSLOT_TRINKET1,
		}

		AddOption('upgradeslot',{
			type = 'select',
			values = {
				[0] = "all slots",
				[1] = INVTYPE_WEAPONMAINHAND,
				[2] = INVTYPE_WEAPONOFFHAND,
				[3] = INVTYPE_HEAD,
				[4] = INVTYPE_NECK,
				[5] = INVTYPE_SHOULDER,
				[6] = INVTYPE_CLOAK,
				[7] = INVTYPE_CHEST,
				[8] = INVTYPE_WRIST,
				[9] = INVTYPE_HAND,
				[10] = INVTYPE_WAIST,
				[11] = INVTYPE_LEGS,
				[12] = INVTYPE_FEET,
				[13] = INVTYPE_FINGER,
				[14] = INVTYPE_TRINKET,
			},
			set = function(i,v)
				GQ.db.profile.upgradeslot2 = nil
				if v>0 then
					GQ.db.profile.upgradeslot = slot_ids[v]
					if slot_ids[v]==INVSLOT_FINGER1 then print("ring") GQ.db.profile.upgradeslot2=INVSLOT_FINGER2 end
					if slot_ids[v]==INVSLOT_TRINKET1 then print("trink") GQ.db.profile.upgradeslot2=INVSLOT_TRINKET2 end
				else
					GQ.db.profile.upgradeslot = false
				end
				GQ.ItemScore.Upgrades:RefreshBags()
			end,
			get = function(i,v)
				for i,slot in ipairs(slot_ids) do
					if slot==GQ.db.profile.upgradeslot then return i end
				end
				return 0
			end,				
			_default = false,
			width="single",
			_inline=true,
			disabled = function() return not (self.db.profile.autogear and self.db.profile.markupgrades) end,
		})

		AddOption('upgrademarker',{
			type = 'select',
			values = {
				[1] = "border",
				[2] = "icon",
			},
			set = function(i,v)
				Setter_Simple(i,v)
				GQ.ItemScore.Upgrades:RefreshBags()
			end,
			_default = 1,
			width="single",
			_inline=true,
			disabled = function() return not (self.db.profile.autogear and self.db.profile.markupgrades) end,
		})	

		AddOptionSpace()
		AddOption('badupgradehotkey',{ type = 'toggle', width="full", _default=true, disabled = function() return not (self.db.profile.autogear and self.db.profile.markupgrades) end,})
		--AddOption('sep00badupgrade',{ type="header", name="Bad upgrade reporting" })
			
		local modifierkeys = {{"IsShiftKeyDown","Shift"},{"IsControlKeyDown","Control"},{"IsAltKeyDown","Alt"}}
		GQ.ItemScore.modifierkeys = modifierkeys
		AddOption('gearreportkey',{
			name = "Hotkey:",
			type = 'select',
			values = function()
				local ret = {}
				for i,v in ipairs(modifierkeys) do
					ret[i]=v[2]
				end
				return ret
			end,
			set = function(i,v)
				Setter_Simple(i,modifierkeys[v][1])
			end,
			get = function(i,v)
				for k,v in ipairs(modifierkeys) do if self.db.profile.gearreportkey==v[1] then return k end end
			end,
			width="single",
			_inline=true,
			_default = "IsAltKeyDown",
			disabled = function() return not (self.db.profile.autogear and self.db.profile.markupgrades and self.db.profile.badupgradehotkey) end,
		})

		local mousekeys = {{"LeftButton","Left click"},{"RightButton","Right click"}}
		GQ.ItemScore.mousekeys = mousekeys
		AddOption('gearreportmouse',{
			name = "Mouse button:",
			type = 'select',
			values = function()
				local ret = {}
				for i,v in ipairs(mousekeys) do
					ret[i]=v[2]
				end
				return ret
			end,
			set = function(i,v)
				Setter_Simple(i,mousekeys[v][1])
			end,
			get = function(i,v)
				for k,v in ipairs(mousekeys) do if self.db.profile.gearreportmouse==v[1] then return k end end
			end,
			width="single",
			_inline=true,
			_default = "RightButton",
			disabled = function() return not (self.db.profile.autogear and self.db.profile.markupgrades and self.db.profile.badupgradehotkey) end,
		})
	end

	AddOptionGroup("itemscore","Itemscore","zgitemscore")  	---- OPTIONS: itemscore
	do

		AddOption('',{type="description", name=L['opt_itemscore_warning'], font=GQ.font_dialog })
		AddOptionSpace()

		AddOption('',{
			type="description",
			name=L["opt_gear_score_class"],
			width=150,
		})

		if GQ.IsRetail then
			AddOption('gear_selected_class',{
				type = "select",
				name="",
				values = function()
					local t={}
					for i=1,GetNumClasses() do -- values taken from blizz api
						local name,tag,id = GetClassInfo(i)
						t[i] = name
					end
					return t
				end,
				set = function(i,v) 
					GQ.db.char.gear_selected_class = v
					Setter_Simple(i,v) 
					if v == select(3,UnitClass("player")) then
						GQ.db.char.gear_selected_spec = GetSpecialization() or 1
					else
						GQ.db.char.gear_selected_spec = 1 
					end
				end,
				get = function(i,v)
					if not GQ.db.char.gear_selected_class then
						GQ.db.char.gear_selected_class = select(3,UnitClass("player"))
						GQ.db.char.gear_selected_spec = GetSpecialization() or 1
					end
					return GQ.db.char.gear_selected_class
				end,
				_inline=true
			})
			AddOptionSep()

			AddOption('',{
				type="description",
				name=L["opt_gear_score_spec"],
				width=150,
			})

			AddOption('gear_selected_spec',{
				type = "select",
				name="",
				values = function()
					local t={}
					local name,tag,id = GetClassInfo(GQ.db.char.gear_selected_class or 1)
					for specnum,specdata in pairs(GQ.ItemScore.Defaults[tag]) do
						if specnum<5 or (GQ.ItemScore.playerlevel<(GQ.db.char.gear_selected_class==13 and 60 or 10)) then -- show starter spec only on low level characters
							t[specnum] = GQ.SpecByNumber[tag][specnum] -- values taken from parser.lua classtalents
						end
					end
					return t
				end,
				set = function(i,v) GQ.db.char.gear_selected_spec=v Setter_Simple(i,v) end,
				get = function() return GQ.db.char.gear_selected_spec end,
				_inline=true
			})

			AddSubgroup("gear_gems",{
				name = "",
				font=GQ.font_dialog,
				inline=true,
			})
				AddOption('gear_maxGem',{
					name = L['opt_gear_maxGem'],
					desc = L['opt_gear_maxGem_desc'],
					style = 'slider',
					type = 'select',
					width="double", 
					values = {
						[0]=NONE,
						[2]=ITEM_QUALITY2_DESC,
						[3]=ITEM_QUALITY3_DESC,
						[4]=ITEM_QUALITY4_DESC,
					},
					set = function(i,v) Setter_Simple(i,v) GQ.ItemScore:DelayedRefreshUserData() end, 
					get = Getter_Simple, 
					_default=0,
					_inline=true,
				})
				AddOptionSpace()
			EndSubgroup()
		else
			AddOption('',{
				type="description", 
				name=playerclasslocal, 
				font=GQ.font_dialog, 
				width=150,
			})
			AddOptionSep()
			AddOption('',{
				type="description",
				name=L["opt_gear_score_spec"],
				width=150,
			})
			AddOption('gear_selected_build',{
				type = "select",
				name="",
				values = function() return GQ.ItemScore.Builds[playerclass] end,
				get = function() return GQ.db.char.gear_selected_build end,
				set = function(i,v) Setter_Simple(i,v) GQ.db.char.gear_selected_build=v end,
				_inline=true,
				_default=1,
			})
		end
		AddOptionSep()

		if GQ.IsClassic or GQ.IsClassicTBC or GQ.IsClassicWOTLK then
			for specnum,specdata in pairs(GQ.ItemScore.Defaults[playerclass]) do
				AddOption('',{
					type="description",
					name= L["opt_gear_select_set_active"]:format(specdata.name or "this spec"),
					width=300,
					font=GQ.font_dialog,
					hidden=function() 
						local visibility = tonumber(GQ.db.char.gear_active_build)==specnum and tonumber(GQ.db.char.gear_selected_build)==specnum
						return not visibility 
					end
				})
				AddOption('',{
					type = 'execute',	
					name = L["opt_gear_select_set_inactive"]:format(specdata.name or "this spec"),
					func=function ()
						GQ.db.char.gear_active_build = specnum
						GQ.ItemScore:DelayedRefreshUserData()
					end,
					width=340,
					hidden=function() 
						local visibility = tonumber(GQ.db.char.gear_active_build)~=specnum and tonumber(GQ.db.char.gear_selected_build)==specnum
						return not visibility 
					end,
					style = "Accent",
				})
			end
		end		
		AddOptionSpace()
		
		
		AddOption('gearshowallstats',{ type = 'toggle', _default=false, width="full"})

		local function display_stat(class,spec,name)
			-- always show everything?
			if GQ.db.profile.gearshowallstats then return true end

			local prefix = spec..'_'
			local statset = GQ.ItemScore.rules[class][spec].stats
			local profile = GQ.ItemScore.altDB[playername].statweights

			-- user unset the stat, don't show
			if profile[prefix..name]=="" or profile[prefix..name]=="0" then return false end

			-- user set the stat, do show
			if profile[prefix..name] and tonumber(profile[prefix..name])>0 then return true end

			-- goatquest default exists, do show
			if statset[name] then return true end
			
			-- nothing yet, don't show
			return false
		end

		local function get_stat(class,spec,name)
			local prefix = spec..'_'
			local statset = GQ.ItemScore.rules[class][spec].stats
			local profile = GQ.ItemScore.altDB[playername].statweights

			-- user unset the stat, don't show
			if profile[prefix..name]=="" or profile[prefix..name]=="0" then return nil end

			-- user set the stat, do show
			if profile[prefix..name] and tonumber(profile[prefix..name]) and tonumber(profile[prefix..name])>0 then return tostring(profile[prefix..name]) end

			-- goatquest default exists, do show
			if statset[name] then return tostring(statset[name]) end

			-- nothing yet, don't show
			return nil
		end

		local function set_stat(class,spec,name,value)
			local prefix = spec..'_'
			local statset = GQ.ItemScore.rules[class][spec].stats
			local profile = GQ.ItemScore.altDB[playername].statweights
			
			if value=="" or value==nil then value=0 end
			profile[prefix..name]=tostring(tonumber(value or 0))

			if not GQ.ItemScore:UsesCustomWeights(class,spec) then
				-- remove anything we have saved, user is on our defaults
				for index=1,#GQ.ItemScore.Keywords do
					profile[prefix..name]=nil
				end
			else
				-- save anything that is not yet saved
				for statname,statvalue in pairs(GQ.ItemScore.rules[class][spec].stats) do
					profile[prefix..statname] = profile[prefix..statname] or statvalue
				end
			end

		end

		for specnum,specdata in pairs(GQ.ItemScore.Defaults[playerclass]) do
			local groupname = 'gear_'..specnum
			AddSubgroup(groupname,{
				width=300, 
				name = "",
				hidden=function()
					local visibility
					if GQ.IsRetail then
						visibility = tonumber(GQ.db.char.gear_selected_spec)==specnum
					else
						visibility = tonumber(GQ.db.char.gear_selected_build)==specnum
					end
					return not visibility end

			})
			AddOption(groupname.."_score",{ 
				type = 'toggle',
				name = L["opt_gear_score_offspec"],
				_default=true, 
				get = function() 
					-- we want this char bound, not profile. 
					local v = GQ.db.char[groupname.."_score"]
					if type(v)=="boolean" then 
						return v 
					else 
						return true
					end
				end,
				set = function(i,v) 
					GQ.db.char[groupname.."_score"] = v
				end,
				width = "full", 
				})

				AddOption('',{
					type="description",
					name= L["opt_gear_custom_active"],
					width=150,
					hidden=function() return not GQ.ItemScore:UsesCustomWeights(playerclass,specnum) end
				})
				AddOptionSep()

				for index=1,#GQ.ItemScore.Keywords do
					local stat = GQ.ItemScore.Keywords[index]
					if not stat.multi then
						AddOption('',{
							type="description",
							name= "     "..stat.gqdisplay,
							width=150,
							hidden=function() return not display_stat(playerclass,specnum,stat.blizz) end
						})
						AddOption(groupname.."_"..stat.blizz,{
							name = "",
							type = 'input',
							width=130,
							get = function() return get_stat(playerclass,specnum,stat.blizz) end,
							set = function(i,v) 
								set_stat(playerclass,specnum,stat.blizz,v) 
								GQ.ItemScore:DelayedRefreshUserData()
							end,
							hidden=function() return not display_stat(playerclass,specnum,stat.blizz) end,
							buttontext = "OK",
						})
						AddOption("",{
							type="description",
							width=290,
							hidden=function() return not display_stat(playerclass,specnum,stat.blizz) end
						})
					end
				end

				AddOption('',{
					type="description",
					name= "",
					width='single',
				})
				AddOption('',{
					type = 'execute',	
					name = "Reset",
					func=function ()
						table.wipe(GQ.ItemScore.altDB[playername].statweights)
						GQ.ItemScore:DelayedRefreshUserData()
					end,
					width='single',
				})

			EndSubgroup()
		end

		if GQ.IsRetail then
			AddSubgroup("gearimport",{
				width=250, 
				name = "",
				font=GQ.font_dialog,
				inline=true,
				hidden=function() 
					local visibility = tonumber(GQ.db.char.gear_selected_class)==GQ.ItemScore.playerclassNum
					return not visibility 
				end
			})
				AddOption("gearimport",{
					name = function() 
						local specname = GQ.SpecByNumber[playerclass][GQ.db.char.gear_selected_spec or 1] -- values taken from parser.lua classtalents
						return L["opt_gearimport_text"]:format(specname,name)
					end,
					type = 'input',
					width = 'full',
					buttontext = "Import",
					buttonwidth = 170,
					multiline = true,
					get = function()
						local ret = GQ.ItemScore.lastPawnString or ""
						GQ.ItemScore.lastPawnString = ""
						return ret
					end,
					set = function(i,v)
						GQ.ItemScore:ImportPawn(v) 
						GQ.ItemScore:RefreshUserData()
					end,
					font=GQ.font_dialog,
					autoselect=true,
				})

				AddOption('gearexport',{
					type = 'execute',	
					func=function ()
						GQ.ItemScore:ExportPawn() 
					     end,
					 width='single',
				})
			EndSubgroup()
		end
	end


	AddOptionGroup("gold","Gold","zggold")  	---- OPTIONS: gold
	do
		--AddOption('goldimport',{
		--	type = 'execute',
		--	func=function ()
		--		GQ.Gold.ServerTrends:ImportQuick() 
		--	 end,
		--	 width='single',
		--})
		AddOption('gold_format',{
			name = L['opt_gold_format'],
			desc = L['opt_gold_format_desc'],
			type = 'select',
			values = function()
				local modes = {1,2} --{0,3,4}
				local ret={}
				for _,mode in pairs(modes) do
					ret[mode]=GQ.GetMoneyString(123456,nil,mode)
				end
				return ret
			end,
			set = function(i,v) Setter_Simple(i,v) GQ.Gold.Appraiser.needToUpdate=true end,
			_default = 1,
			width="full", pulloutWidth="single", 
			marginTop=-6,
		})
		AddOptionSpace()

		if GQ.Gold.Appraiser then
			--AddSubgroup('auction_tools',{width='full'})

				AddOption('',{type="description", name=L['opt_gold_auctions_title'], font=GQ.font_dialog })
				AddOption('auction_enable',{ type = 'toggle', width = "full", set = function(i,v)
					Setter_Simple(i,v)
					if v then
						if AuctionHouseFrame and AuctionHouseFrame:IsVisible() then
							GQ.Gold.Appraiser:ShowWindow()
						end
					else
						GQ.Gold.Appraiser:HideWindow()
					end
				end, _default = true, descStyle="inline", })
				AddOption('autoscan',{ type = 'toggle',_default=false,width="full",disabled=function() return not GQ.db.profile.auction_enable end})
				AddOption('quickscan',{ type = 'toggle',_default=false,width="double",disabled=function() return not GQ.db.profile.auction_enable end})
				--[[hidden--]] AddOption('auction_autoshow_tab',{ type = 'toggle',_default=false,width="double",disabled=function() return not GQ.db.profile.auction_enable end, hidden=true,})
				--[[hidden--]] AddOption('smartstack',{ type = 'toggle',_default=true, hidden=true,})

				AddOptionSep()
				AddOption('ahscanintensity',{
					name = L['opt_gold_ahscanintensity'],
					desc = L['opt_gold_ahscanintensity_desc'],
					type = 'select',
					style = "slider",
					values = {
						[2000]=L['opt_gold_ahscanintensity_low'],
						[5000]=L['opt_gold_ahscanintensity_default'],
						[10000]=L['opt_gold_ahscanintensity_high'],
					},
					_default = 5000,
					width="single", 
				})
				AddOptionSep()

				--[[
					AddOptionSep()
					AddOption('appraiser_undercut',{
						name = L['opt_gold_appraiser_undercut'],
						desc = L['opt_gold_appraiser_undercut_desc'],
						type = 'select',
						values = {
							[0]=L['opt_gold_appraiser_undercut_none'],
							[1]=L['opt_gold_appraiser_undercut_1p'],
							[2]=L['opt_gold_appraiser_undercut_2p'],
							[5]=L['opt_gold_appraiser_undercut_5p'],
							[10]=L['opt_gold_appraiser_undercut_10p'],
							[20]=L['opt_gold_appraiser_undercut_20p'],
							[10001]=L['opt_gold_appraiser_undercut_1c'],
						},
						_default = 1,
						width = "single",
					})
				--]]

				AddOptionSep()
				AddOption('gold_reset_hidden',{
					type = 'execute',
					--hidden=true,
					width = "double",
					func = function()
						GQ.db.char.AThiddenitems = {}
						GQ.Gold.Appraiser:Update()
					end,
				})
			--EndSubgroup()

			--[=[
			AddOption('mail_enable',{ type = 'toggle', width = "full", 
			set = function(i,v)
				Setter_Simple(i,v)
				if v then
					if MailFrame and MailFrame:IsVisible() then
						GQ.Mailtools:Initialise()
					end
					GQ.Mailtools:ShowSystemTabs()
				else
					GQ.Mailtools:HideSystemTabs()
				end

			end, _default = true, descStyle="inline", })
			AddOption('mail_reset_hidden',{
				type = 'execute',
				width = "double",
				--hidden=true,
				func = function()
					GQ.db.char.MThiddenitems = {}
					GQ.Mailtools:GetListOfInventory()
					GQ.Mailtools:Update()
				end,
			})
			--]=]

			--AddSubgroup('gold_tooltips',{width='full'})

				AddOption('gold_tooltips_show',{ type = 'toggle',_default=true, width = "double", })
				AddOptionSep()

				--[[
				AddOption('gold_tooltips_ah',{
					name = L['opt_gold_tooltips_ah'],
					desc = L['opt_gold_tooltips_ah_desc'],
					type = 'select',
					values = {
						[0]=L['opt_gold_tooltips_ah_none'],
						[1]=L['opt_gold_tooltips_ah_simple'],
						[2]=L['opt_gold_tooltips_ah_dynamic'],
						[3]=L['opt_gold_tooltips_ah_full'],
					},
					_default = 2,
					width = "single",
					disabled=function() return not GQ.db.profile.gold_tooltips_show end
				})
				AddOptionSep()
				--]]
				AddOption('gold_tooltips_out',{
					name = L['opt_gold_tooltips_out'],
					desc = L['opt_gold_tooltips_out_desc'],
					type = 'select',
					values = {
						[0]=L['opt_gold_tooltips_out_none'],
						[1]=L['opt_gold_tooltips_out_simple'],
						[2]=L['opt_gold_tooltips_out_dynamic'],
						[3]=L['opt_gold_tooltips_out_full'],
					},
					_default = 1,
					width="full", pulloutWidth="single", 
					disabled=function() return not GQ.db.profile.gold_tooltips_show end
				})
				--[[
				AddOptionSep()
				AddOption('gold_tooltips_shift',{ 
					type = 'toggle',
					_default=true, 
					width = "double",
					disabled=function() return not GQ.db.profile.gold_tooltips_show end
				})
				--]]
			--EndSubgroup()


			--[[
			AddSubgroup('gold_tooltips_guide',{width='full'})
				AddOption('gold_tooltips_guide',{
					name = L['opt_gold_tooltips_guide'],
					desc = L['opt_gold_tooltips_guide_desc'],
					type = 'select',
					values = {
						[0]=L['opt_gold_tooltips_guide_none'],
						[1]=L['opt_gold_tooltips_guide_shift'],
						[2]=L['opt_gold_tooltips_guide_always'],
					},
					_default = 1,
					width = "single",
					disabled=function() return not GQ.db.profile.gold_tooltips_show end
				})
			EndSubgroup()
			--]]

		end

		--AddSubgroup('golddisplay',{width='full'})
		--EndSubgroup()

		--[[
		AddOption('gold_profitlevel',{
			name = L['opt_gold_profitlevel'],
			desc = L['opt_gold_profitlevel_desc'],
			type = 'select',
			values = {
				[0.00]=L['opt_gold_profitlevel_fastest'],
				[0.25]=L['opt_gold_profitlevel_fast'],
				[0.50]=L['opt_gold_profitlevel_medium'],
				[0.75]=L['opt_gold_profitlevel_slow'],
				[1.00]=L['opt_gold_profitlevel_slowest']
				},
			_default = 0.25,
			width = "single",
		})
		--]]

	end

	end -- optional gear and auction settings
	AddOptionGroup("notification","Notification","zgnc")	---- OPTIONS: notification
	do
		AddOption('',{ type = 'description', name=L['opt_group_notification'], font=GQ.font_dialog})
			AddOptionSpace()
			AddOption('nc_enable',{ type = 'toggle', width = "full", _default = true,
				set = function(i,v) 
					Setter_Simple(i,v)
					GQ.NotificationCenter:UpdateButton()
				end,
			})
			AddOptionSpace()
			AddOption('nc_size',{
				type = 'select',
				width="145",
				values = {
						[1]=(L['opt_nc_size_compact']),
						[2]=(L['opt_nc_size_detailed']),
					},
				_default = 2,
				disabled = function() return not self.db.profile.nc_enable end,
				set = function(i,v) Setter_Simple(i,v)

				end,
			})


			local durations = {2,5,10,15,20,25,30}
			AddOption('nc_duration',{
				--name = L['opt_nc_duration'],
				type = 'select',
				width="140",
				values = function()
					local t={}
					for _,dur in ipairs(durations) do
						t[dur] = dur.."s"
					end
					return t
				end,
				_default = 5,
				disabled = function() return not self.db.profile.nc_enable end,
			})
			
			AddOptionSep()

			AddOption('nc_position',{
				--name = L['opt_n_popup_candrag'],
				type = 'select',
				width="140",
				values = {
						[1]=(L['opt_nc_left']),
						[2]=(L['opt_nc_right']),
						[3]=(L['opt_nc_lastpos']),
					},
				_default = 1,
				disabled = function() return not self.db.profile.nc_enable end,
				set = function(i,v) 
					Setter_Simple(i,v)
					GQ.NotificationCenter:UpdatePosition()
				end,
			})

			AddOptionSpace()
			AddOption('nc_sendtonc',{ type = 'toggle', width = "full", set = Setter_Simple, _default = false, disabled = function() return not self.db.profile.nc_enable end,})
			AddOption('nc_markseen',{ type = 'toggle', width = "full", set = Setter_Simple, _default = false, disabled = function() return not self.db.profile.nc_enable end,})
			AddOption('nc_hidewhenclosed',{ type = 'toggle', width = "full", _default = true, disabled = function() return not self.db.profile.nc_enable end,})
			AddOptionSpace()
			AddOptionSep()
			AddOption('sep00devdisp',{ type="header", name="Advanced Options" })
			AddOption('nc_showall',{ type = 'toggle', _default=false, width="full", disabled = function() return not self.db.profile.nc_enable end,})

		AddOption('',{ type = 'description', name=L['opt_nc_types'], hidden=function() return not self.db.profile.nc_showall end, font=GQ.font_dialog})
			AddOptionSep()
			AddOption('nc_welcome',{ type = 'toggle', width = "full", _default = true, hidden=function() return not self.db.profile.nc_showall end, disabled = function() return not self.db.profile.nc_enable end,})
			AddOption('nc_general',{ type = 'toggle', width = "full", _default = true, hidden=function() return not self.db.profile.nc_showall end, disabled = function() return not self.db.profile.nc_enable end,})
			AddOption('nc_orientation',{ type = 'toggle', width = "full", _default = true, hidden=function() return not self.db.profile.nc_showall end, disabled = function() return not self.db.profile.nc_enable end,})
			AddOption('nc_events',{ type = 'toggle', width = "full", _default = true, hidden=function() return not self.db.profile.nc_showall end, disabled = function() return not self.db.profile.nc_enable end,})
			AddOptionSpace()
			AddOption('nc_gear',{ type = 'toggle', width = "full", _default = true, hidden=function() return not self.db.profile.nc_showall end, disabled = function() return not self.db.profile.nc_enable or not self.db.profile.autogear end,})
			AddOption('nc_gear_max',{type = 'toggle', width = "full", _default = false, indent=20, hidden=function() return not self.db.profile.nc_showall end, disabled = function() return not self.db.profile.nc_enable or not self.db.profile.nc_gear or not self.db.profile.autogear or self.db.profile.autogear_max end,})
			--AddOption('n_popup_gear_alt',{ type = 'toggle', width = "full", _default = true,disabled = function() return not (self.db.profile.nc_enable and self.db.profile.n_popup_gear) end, indent=20, hidden=not GQ.DEV})
			AddOption('nc_dungeon',{ type = 'toggle', width = "full", _default = true, hidden=function() return not self.db.profile.nc_showall end, disabled = function() return not (self.db.profile.nc_enable) end,})
			AddOption('nc_riding',{ type = 'toggle', width = "full", _default = true, hidden=function() return not self.db.profile.nc_showall end, disabled = function() return not (self.db.profile.nc_enable) end,})
			if GQ.IsRetail then
				AddOption('nc_monk',{ type = 'toggle', width = "full", _default = true, hidden=function() return not self.db.profile.nc_showall end, disabled=function() return not (select(3,UnitClass("player"))==10 and self.db.profile.nc_enable) end,})
			end
			if not GQ.IsClassic then
				AddOption('nc_dailyquest',{ type = 'toggle', width = "full", _default = true, hidden=function() return not self.db.profile.nc_showall end, disabled = function() return not self.db.profile.nc_enable end,})
				AddOption('nc_worldquest',{ type = 'toggle', width = "full", _default = true, hidden=function() return not self.db.profile.nc_showall end, disabled = function() return not self.db.profile.nc_enable end,})
				AddOption('nc_creatures',{ type = 'toggle', width = "full", _default = true, hidden=function() return not self.db.profile.nc_showall end, disabled = function() return not (self.db.profile.nc_enable) end,})
			end
			AddOption('nc_cutscenes',{ type = 'toggle', width = "full", _default = true, hidden=function() return not self.db.profile.nc_showall end, disabled = function() return not (self.db.profile.nc_enable) end,})

		if GQ.IsClassic or GQ.IsClassicTBC or GQ.IsClassicWOTLK then
			AddOption('nc_skills',{ type = 'toggle', width = "full", _default = true, hidden=function() return not self.db.profile.nc_showall end, disabled = function() return not self.db.profile.nc_enable end,})
			AddOptionSep()
			AddOption('',{ type = 'description', name=L['opt_nc_skillstitle'], font=GQ.font_dialog, indent=20, hidden=function() return not self.db.profile.nc_showall end, disabled = function() return not (self.db.profile.nc_enable and self.db.profile.nc_skills) end,})
				AddOptionSep()
				AddOption('',{type="description", name=L['opt_group_notify'], font=GQ.font_dialog, indent=20, hidden=function() return not self.db.profile.nc_showall end, disabled = function() return not (self.db.profile.nc_enable and self.db.profile.nc_skills) end,})
				AddOption('nc_skills_optional',{ type = 'toggle', width = "single", indent=20, set = function(i,v) Setter_Simple(i,v) GQ.Skills:RefreshSkillPopup() end, _default = true, hidden=function() return not self.db.profile.nc_showall end, disabled=function() return not (self.db.profile.nc_enable and self.db.profile.nc_skills) end })
				AddOption('nc_skills_future',{ type = 'toggle', width = "single", indent=20,   set = function(i,v) Setter_Simple(i,v) GQ.Skills:RefreshSkillPopup() end, _default = true, hidden=function() return not self.db.profile.nc_showall end, disabled=function() return not (self.db.profile.nc_enable and self.db.profile.nc_skills) end })
				AddOptionSep()
				AddOption('',{type="description", name=L['opt_nc_skillstriggertitle'], hidden=function() return not self.db.profile.nc_showall end, font=GQ.font_dialog })
				AddOption('nc_skills_login',{ type = 'toggle', indent=20, width = "double", _default = true, hidden=function() return not self.db.profile.nc_showall end, disabled=function() return not (self.db.profile.nc_enable and self.db.profile.nc_skills) end, indent=20, })
				AddOption('nc_skills_level',{ type = 'toggle', indent=20, width = "double", _default = true, hidden=function() return not self.db.profile.nc_showall end, disabled=function() return not (self.db.profile.nc_enable and self.db.profile.nc_skills) end, indent=20, })
				AddOption('nc_skills_town',{ type = 'toggle', indent=20, width = "double", _default = true, hidden=function() return not self.db.profile.nc_showall end, disabled=function() return not (self.db.profile.nc_enable and self.db.profile.nc_skills) end, indent=20, })
				AddOption('nc_skills_dist',{ type = 'toggle', indent=20, width = "double", _default = true, hidden=function() return not self.db.profile.nc_showall end, disabled=function() return not (self.db.profile.nc_enable and self.db.profile.nc_skills) end, indent=20, })
				AddOption('nc_skills_trainer',{ type = 'toggle', indent=20, width = "double", _default = true, hidden=function() return not self.db.profile.nc_showall end, disabled=function() return not (self.db.profile.nc_enable and self.db.profile.nc_skills) end, indent=20, })
				AddOptionSep()
				AddOption('',{
					type = 'execute',	
					name = L['opt_nc_skills_clear'],
					func=function ()
						table.wipe(GQ.db.char.bannedskills)
						table.wipe(GQ.db.char.learnedskills)
						--GQ.Skills.SkillsPopup:Hide()
						--GQ.Skills:ShowSkillPopup()
					end,
					width='single',
					hidden=function() return not self.db.profile.nc_showall end,
					disabled=function()
						return not self.db.profile.nc_enable
					end,
				})
		end

	end

	AddOptionGroup("extras","Extras","zgextras")	---- OPTIONS: extras
	do
		AddOption('',{ type = 'description', name=L['opt_chat_title'], font=GQ.font_dialog_gray})
		AddOption('noisy',{ type = 'toggle', width = "full", set=Setter_Loud, _default=true })
		AddOption('analyzereps',{ type = 'toggle', width = "full", _default=false })
		if GQ.IsRetail then
			AddOption('petbattleframe',{ type = 'toggle', width = "full", set = function(i,v) Setter_Simple(i,v) end, _default = true, })
			AddOption('talenton',{ type = 'toggle', width="full", set = function(i,v)   Setter_Simple(i,v)  GQ.TalentAdvisor:Toggle(v)  end, _default=true})
		end
		if GQ.IsClassicMOP then
			AddOption('petbattleframe',{ type = 'toggle', width = "full", set = function(i,v) Setter_Simple(i,v) end, _default = true, })
			AddOption('talenton',{ type = 'toggle', width="full", set = function(i,v)   Setter_Simple(i,v)  GQ.TalentAdvisor:Toggle(v)  end, _default=true})
		end



		if GQ.IsClassic or GQ.IsClassicTBC or GQ.IsClassicWOTLK then
			AddOption('beta_use_chains',{ 
				type = 'toggle', 
				_default=true,
				width="full",
				set = function(i,v) Setter_Simple(i,v) GQ.QuestDB:Cancel() end,
			})
		end	
		if not GQ.IsRetail then
			AddOption('showbagspace',{ type = 'toggle', width = "full", _default=false, set = function(i,v) Setter_Simple(i,v) GQ.Inventory:UpdateBagspaceText() end,})
			AddOption('mouseovermarkers',{ type = 'toggle', width = "full", _default=true, hidden=GQ.GuideOnly or GQ.IsForever})
		end


		AddOption('',{ type = 'description', name="Rating", font=GQ.font_dialog_gray})
		AddOption('ratings',{ 
			type = 'toggle', 
			width = "full", 
			_default=true,
			set=function(i,v) 
				Setter_Simple(i,v)
				if GQ.BugReport.GuideRating.GuideRatingViewer or GQ.BugReport.GuideRating.NoRatingFrame then
					if GQ.BugReport.GuideRating.GuideRatingViewer and GQ.BugReport.GuideRating.GuideRatingViewer:IsVisible() then
						GQ.BugReport.GuideRating:ShowGuideRating()
					else 
						GQ.BugReport.GuideRating:ShowGuideRating() GQ.BugReport.GuideRating.GuideRatingViewer:Hide() GQ.BugReport.GuideRating:ShowGuideRating()
					end
				else
					GQ.BugReport.GuideRating:ShowGuideRating()
				end
			end
		})

		AddOption('sep00spam',{ type="header", name="Chat" })
			AddOption('spam_levelup',{
				name = "Announce level up times to:",
				type = 'toggle',
				width = "double",
				set = function(i,v)
					Setter_Simple(i,v)
					GQ.db.profile.spam_levelup_emote = true
					GQ:RefreshOptions()
				end,
				_default=true,
			})

				AddOption('spam_levelup_emote',{
					name = "General chat",
					type = 'toggle',
					width = "double",
					disabled = function() return not (self.db.profile.spam_levelup) end,
					indent=20,
					_default=true,
				})

				AddOption('spam_levelup_party',{
					name = "Party chat",
					type = 'toggle',
					width = "double",
					disabled = function() return not (self.db.profile.spam_levelup) end,
					indent=20,
					_default=false,
				})

				AddOption('spam_levelup_guild',{
					name = "Guild chat",
					type = 'toggle',
					width = "double",
					disabled = function() return not (self.db.profile.spam_levelup) end,
					indent=20,
					_default=false,
				})
	end

	if not GQ.GuideOnly and (GQ.IsClassic or GQ.IsClassicTBC or GQ.IsClassicWOTLK or GQ.IsClassicCATA) then
		local options = GQ.ZTA:SetupConfig()

		AddOptionGroup("zta","GoatQuestTalentAdvisor","zgtalent",options)
	end


	AddOptionGroup("profile","ProfilesAlt","zgprofile",{ useLayout="FlowTop", }) 	---- OPTIONS: profile
	do
		self.db.RegisterCallback(self, "OnProfileChanged", "ProfileSwitch")

		GQ.confirmOverwritePopup = {}
		GQ.profileContext = {}
		tinsert(GQ.startups, {"Options overwrite wtf?",function() GQ.confirmOverwritePopup = GQ.PopupHandler:NewPopup("ConfirmOverwrite", "default") end})

		local profile = GQ.db
		local profilesWithoutCurrent = {}
		local currentProfile = profile:GetCurrentProfile()
		local function getProfilesWithoutCurrent()
			--local profilesWithoutCurrent = {}
			for k, v in pairs(GQ.db:GetProfiles()) do
				if v ~= currentProfile then
					profilesWithoutCurrent[k]=v
				else
					profilesWithoutCurrent[k]=nil
				end
			end
			return profilesWithoutCurrent
		end
 
		local deleteProfileOption,copyProfileOption,proftext
		
		local function getCurrentProfileIndex()
			currentProfile = profile:GetCurrentProfile()
			for k, v in pairs(profile:GetProfiles()) do
				if v == currentProfile then
					return k
				end
			end
		end
		
		local function refreshProfiles()
			profilesWithoutCurrent = {}
			deleteProfileOption.values = getProfilesWithoutCurrent()
		end
		
		local function getProfiles()
			getProfilesWithoutCurrent()
			return GQ.db:GetProfiles()
		end
		
		AddOption('profile_description',{ type = "description",})
		--Spoo(nil, nil, proftext)
		AddOptionSep()
		AddOption('profile_current',{ type = 'select', values=getProfiles,
			get=getCurrentProfileIndex,
			set=function(index, value)
				--Spoo(nil, nil, self)
				currentProfile = profile:GetProfiles()[value]
				GQ.db:SetProfile(currentProfile)
				
				GQ.db.char.gear_selected_spec = GetSpecialization and GetSpecialization() or 1

				getProfilesWithoutCurrent()
				Setter_Simple(index, value)
				return value
			end,
			_default=getCurrentProfileIndex(),
			width="double",-- pulloutWidth="single",
			labelFont=GQ.font_dialog_gray,
			labelFont=GQ.font_dialog_gray
		})

		AddOptionSep()
		AddOption('profile_default',{  type = 'toggle',  
			get = function() 
				return GQ.db.profile.is_default
			end,  
			set = function(i,v)
				if v then
					for i,v in pairs(GQ.db.profiles) do
						v.is_default=nil
					end
				end
				GQ.db.profile.is_default=v
			end,
			_default=true,
			width="double",
		})
		AddOptionSep()

		AddOption('profile_reset',{ type = 'execute', func=function(i, value)
			local was_usernamed = GQ.db.profiles[GQ.db:GetCurrentProfile()].usernamed
			local was_default = GQ.db.profile.is_default

			-- If we have crafting guide active, unset it, as it will be gone after profile reset
			if GQ.db.char.guidename and string.find(self.db.char.guidename,"GOLD\\Crafting\\") then
				GQ.db.char.guidename = nil
				GQ.CurrentGuide = nil
			end
			
			--GQ.db:ResetProfile()
			local reset_tables = {"menu","display","navi","poi","notification","gear","itemscore","gold","enhancements"}
			for i,v in pairs(reset_tables) do
			--Spoo(GQ.optiontables)
				if GQ.optiontables[v] then
				ResetToDefaults(GQ.optiontables[v])
			end
			end

			GQ.db.char.gear_selected_spec = GetSpecialization() or 1

			for class,classdata in pairs(GQ.ItemScore.Defaults) do
				for specnum,specdata in pairs(classdata) do
					local groupname = 'gear_'..class..'_'..specnum
					for index,stat in pairs(specdata) do -- prefill defaults, so that hidden has something to work with
						if not GQ.db.profile[groupname.."_"..stat.name] then
							GQ.db.profile[groupname.."_"..stat.name] = tostring(stat.weight)
						end
					end
				end
			end
			
			GQ:ProfileSwitch()
			--GQ:UpdateSkin()

			GQ.db.profile.usernamed = was_usernamed
			GQ.db.profile.is_default = was_default

			ReloadUI()
		end})
		AddOptionSep()

		AddOption('',{ type = "description", name = L["opt_profile_manage"]:format(), font=GQ.font_dialog_gray, width="double" })
		AddOptionSep()

		AddSubgroup("__newprofile",{
			--width=250, 
			name = "",
			font=GQ.font_dialog,
			--marginTop=-25,
		})
			AddOption('newprofiletext',{ type = "description", name = ""})
			local newprofile = AddOption('',{ 
				type = 'input', 
				confirm=function(i, value)
					for k, v in pairs(profile:GetProfiles()) do
						if v == value then
							return true
						end
					end
					return false
				end,
				buttonStatic=true,
				buttontext=L['opt_newprofile'],
				buttonheight=25,
				confirmText="Duplicate profile found, do you want to overwrite it?",
				set=function(i, value)
					if value == nil or value == "" then return end

					local current = GQ.db:GetCurrentProfile()

					GQ.db:SetProfile(value)
					GQ.db:CopyProfile(current)
					GQ:ProfileSwitch()

					getProfilesWithoutCurrent()
					currentProfile = value
					refreshProfiles()
					return getCurrentProfileIndex()
				end,
				width="double",
			})
		EndSubgroup()

		AddOptionSpace()
		AddOptionSep()

		AddSubgroup("__deleteprofile",{
			--width=250, 
			name = "",
			font=GQ.font_dialog,
			--marginTop=5,
		})
			AddOption('deleteprofiletext',{ type = "description", name = ""})
			local delete_profile
			deleteProfileOption = AddOption('',{ 
				type = 'select', 
				values=getProfilesWithoutCurrent, 
				get = function() return delete_profile end,
				set = function(i,v) delete_profile=v end,
				width = "double",
			})
			AddOption('deleteprofile',{ 
				type = 'execute', 
				func=function(i, value)
					local delete_name = getProfilesWithoutCurrent()[delete_profile]
					if not delete_name then return end
					print("Profile "..delete_name.." deleted.")
					GQ.db:DeleteProfile(delete_name)
					refreshProfiles()
				end,
				width = "double",
			})
		EndSubgroup()

		AddOptionSep()
		AddOption('',{ type = "description", name = " ", font=GQ.font_dialog_gray, width="full" })
		AddOptionSep()

		AddOption('wipe_settings',{ desc = function() return GQ.db.profile.temp_tried_to_wipe and L['opt_wipe_settings_desc2'] or L['opt_wipe_settings_desc'] end, type = 'execute', func=function(i, value)
			if IsShiftKeyDown() then
				if GQ.IsRetail then
					table.wipe(GoatQuestSettings)
				else
					table.wipe(GoatQuestSettings)
				end
				ReloadUI()
			else
				GQ.db.profile.temp_tried_to_wipe = true

				C_Timer.After(2,function() GQ.db.profile.temp_tried_to_wipe=nil end)
				
				local cont = GQ.GuideMenu.MainFrame.WideColumnOptions.AceContainer
				local chi = cont and cont.children
				for i,v in ipairs(chi) do if v.userdata[1]=="wipe_settings" then
					--ScriptAnimationUtil.ShakeFrame(v.frame,{ {x=-5,y=0}, {x=5,y=0},{x=-5,y=0}, {x=5,y=0},{x=-5,y=0}, {x=5,y=0}}, 2.0, 0.04)
					v.frame:GetScript("OnEnter")(v.frame)
					return
				end end
			end
		end})

		AddOptionSep()
		AddOptionSep()
		AddOption('',{ type = "description", name = L["opt_widgetsbackup"], font=GQ.font_dialog_gray, width="full" })
		AddOptionSep()
		AddSubgroup("widgetsimport",{
			width=250, 
			name = "",
			font=GQ.font_dialog,
			inline=true,
		})
			AddOption('widgetsexport',{
				type = 'execute',	
				func=function ()
					GQ.Widgets:Backup()
				     end,
				 width='single',
			})
			AddOption("widgetsimport",{
				type = 'input',
				name = "",
				width = 'full',
				buttontext = "Restore",
				buttonwidth = 170,
				multiline = true,
				get = function()
					local ret = GQ.Widgets.lastExportString or ""
					GQ.Widgets.lastExportString = ""
					return ret
				end,
				set = function(i,v)
					GQ.Widgets:Import(v) 
				end,
				font=GQ.font_dialog,
				autoselect=true,
			})

	end
	
	AddOptionGroup("about","About","zgabout")	---- OPTIONS: about
	do
		AddOption('',{ type = "description", name = L["opt_about_desc1"], font=GQ.font_dialog })
		AddOption('',{ type = "description", name = L["opt_about_credits"], font=GQ.font_dialog })
		AddOption('',{ type = "description", name = L["opt_about_desc4"]:format(self.version), font=GQ.font_dialog })
		AddOptionSpace()
		AddOption('',{ type = "description", name = L["opt_tech_support_header"], font=GQ.font_dialog_gray })
		AddOption('',{ type = "description", name = L["opt_tech_support"]:format(self.version), font=GQ.font_dialog })
		AddOptionSep()
		AddOption('report',{ type = 'execute', func = function() GQ.BugReport:GenerateAndShow() end, })
	end
	
	--self.optiontables['profile'] = LibStub("AceDBOptions-3.0"):GetOptionsTable(self.db)
	--tinsert(self.optiontables_ordered,{name='profile',blizname="GoatQuest-Profile"})


	--AddOptionGroup("modelviewer","ModelViewer","zgmv")
	--do
	--	AddOption('mv_enabled',{ type = 'toggle', width = "full", set = function(i,v) Setter_Simple(i,v)  self:TryToDisplayCreature() end, _default = true, descStyle="inline", })
	--	AddOption('mv_rotation',{ type = 'toggle', width = "full", disabled = function() return not self.db.profile.mv_enabled end, _default = true, descStyle="inline", })
	--	AddOption('mv_slideshow',{ type = 'toggle', width = "full", disabled = function() return not self.db.profile.mv_enabled end, _default = true, descStyle="inline", })
	--	AddOption('mv_reset',{ type = 'execute', width = "single", disabled = function() return not self.db.profile.mv_enabled end, func=function() GQ.CV:AlignFrame() end, descStyle="inline", })
	--end



	--if GQ.db.profile.debug then	---- OPTIONS: debug
		AddOptionGroup("debugset","DebugSet","zgdebugset", { name="Debug: settings", guiHidden = not self.DEV or self.db.profile.hide_dev_once, })
		do
			AddOption('loadguidesfully',{ name = "Load full guides at startup", desc = "Horribly increases startup time, but loads and checks all guides.\nRestart for this to take effect.", type = 'toggle', width = "full", })
			AddOption('showwrongsteps',{ name = "Ignore step/line conditions", type = "toggle", width = "full", })
			AddOption('alwaysshowstickies',{ name = "Always show stickies", type = "toggle", width = "full", })
			--AddOption('shownpcdebug',{ name = "Show NPC Debug button", type="toggle", width = "full", set = function(i,v)  Setter_Simple(i,v)  GQ:NPCDebugUpdate()  end  })
			AddOption('debug_frame',{
				name = "Debug Output Frame",
				desc = "Usually ChatFrame1..ChatFrame9",
				type = 'input',
				set = function(i,v) Setter_Simple(i,v) GQ.debugframe = _G[v] end,
				_default = "ChatFrame1"
			})
			AddOption('debug_showdepth',{ name = "Debug log: show .... stack depth", type="toggle", width = "full"  })
			AddOption('debug_showcall',{ name = "Debug log: show function call", type="toggle", width = "full"  })

			AddOption('fpsgraph',{ name="FPS Graph", desc="Show a detailed FPS graph. Max=60fps.", type = 'toggle', width = "full", _default=false, set = function(i,v) Setter_Simple(i,v)  GQ:StartFPSFrame() end, })
			--AddOption('npcdebugauto',{ name = "Automatically add current npcs to list", type="toggle", width = "full", })
			
			AddOption('bug_button',{  type = 'toggle',  
				get = function()
					return self.db.profile.reportbutton 
				end,  set = function()
					if self.db.profile.reportbutton then
						self.db.profile.reportbutton=false
						GoatQuestFrame_ReportButton:Hide()
					else
						GoatQuestFrame_ReportButton:Show()
						self.db.profile.reportbutton=true
					end 
				end,
				width = "full",
				hidden = function() return not GQ.db.profile.debug end,
			})

			AddOption('skipimpossible',{ type = 'toggle', set = function(i,v) Setter_Simple(i,v)  self:UpdateFrame()  end, width = "full", _default = true })
			AddOption('skipflysteps',{ type = 'toggle', set = function(i,v) Setter_Simple(i,v)  self:UpdateFrame()  end, width = "full" })
			AddOption('dontprogress',{ type = 'toggle', width = "full" })
			AddOption('nocyclegotos',{ type = 'toggle', set = function(i,v) Setter_Simple(i,v)  self:UpdateFrame()  end, width = "full" })
			AddOption('nohidegotosinflight',{ type = 'toggle', set = function(i,v) Setter_Simple(i,v)  self:UpdateFrame()  end, width = "full" })

			AddOptionSpace()

			AddOption('sep00devdisp',{ type="header", name="Dev information" })

			AddOption('debug_display',{ name = "Show developer information", type="toggle", width = "full", _default = false,
				set = function(i,v) 
					Setter_Simple(i,v)  
					GQ.Testing.SetPointerDebugState(v)

					GQ.Frame.Border.TitleBar.DevLabel:SetShown(v)
					if LibTaxi.TaxiFrameButton then
						LibTaxi.TaxiFrameButton:SetShown(v)
						LibTaxi.TaxiFrameButton2:SetShown(v)
					end
					if GQ.GuideMenu.MainFrame then 
						GQ.GuideMenu:PrepareGuidesMenuButtons() 
						GQ.GuideMenu.MainFrame.GuidePathExport:SetShown(v)
					end
				end, 
			})

			AddOption('debug_centermap',{ name = "Keep map centered", type="toggle", width = "full", _default = false })

			AddOption('disabledev',{ name = "Disable dev menu for next reload", type = 'execute', width = "double", func = function() self.db.profile.hide_dev_once=true ReloadUI() end})
		end

		AddOptionGroup("debugfake","DebugFake","zgdebugfake", { name="Debug: faking stuff", guiHidden = not self.DEV or self.db.profile.hide_dev_once, })
		do
			AddOption('fakelevel',{
				name = "Fake level (0=disable)",
				width="full",
				type = 'range', min = 0, max = 120, step = 0.2, bigStep = 0.2,  -- EXPANSION: update
				get = function(i,v) return self.db.char[i[#i]] end,
				set = function(i,v) self.db.char[i[#i]]=v end,
			})

			AddOption('fakecombat',{
				name = "Fake combat mode",
				desc = "Check to simulate combat mode, for testing of 'delay after combat' and similar situations.",
				type = 'toggle',
				set = function(i,v) Setter_Simple(i,v)  if (v and not UnitAffectingCombat("player")) or (not v and UnitAffectingCombat("player")) then self:PLAYER_REGEN_DISABLED() else self:PLAYER_REGEN_ENABLED() end  end,
			})
			AddOptionSep()
			if GQ.IsClassic then
				AddOption('fakeHC',{
					name = "Fake HC/non-HC",
					desc = "Select the realm type to fake, or reset to default.",
					type = 'select',
					values = {
						[0]="Hardcore",
						[1]="Normal",
						[2]="Default",
					},
					set = function(i,v)
						Setter_Simple(i,v)
							if GQ.db.profile.fakeHC == 0 then GQ.db.char.fakehardcore=true end
							if GQ.db.profile.fakeHC == 1 then GQ.db.char.fakehardcore=false end
							if GQ.db.profile.fakeHC == 2 then GQ.db.char.fakehardcore=nil end
					end,
				_default = 2,
				})
			end

			do -- Fake skills
				local skills={"Alchemy","Archaeology","Blacksmithing","Cooking","Enchanting","Engineering","First Aid","Fishing","Herbalism","Inscription","Jewelcrafting","Leatherworking","Mining","Skinning","Tailoring"}
				local skillvalues={}  for i,v in ipairs(skills) do skillvalues[v]=v end
				if GQ.IsClassic or GQ.IsClassicTBC or GQ.IsClassicWOTLK or GQ.IsClassicCATA or GQ.IsClassicMOP then
					AddOption('fakeskill',{
						name = "Fake profession",
						desc = "Check to simulate skill levels.",
						type = 'select',
						values=skillvalues,
						set = function(i,v)
							Setter_Simple(i,v)

							local fs = GQ.db.profile.fakeskills[v]

							self:SetOption("DebugFake","fakeskillcheck " .. (fs and "on" or "off"))

							if fs then
								local fsl = GQ.optiontables.debugfake.args.fakeskilllevel
								if not fsl then return end
								fsl.min=max(0,tonumber(fs and fs.max or 0)-100)
								fsl.max=tonumber(fs and fs.max or 0)
								self:SetOption("DebugFake","fakeskilllevel ".. (fs and fs.level or 0))
								self:SetOption("DebugFake","fakeskillmax ".. (fs and fs.max or 0))
							end
							  end,
						_default = "Alchemy",
						_inline=true,
					})
					AddOption('fakeskillcheck',{
						name = "Fake",
						desc = "",
						type = 'toggle',
						set = function(i,v)
							Setter_Simple(i,v)
							if v then
								if not GQ.db.profile.fakeskills[GQ.db.profile.fakeskill] then
									self:SetOption("DebugFake","fakeskilllevel 0")
									self:SetOption("DebugFake","fakeskillmax 75")
								end
							else
								GQ.db.profile.fakeskills[GQ.db.profile.fakeskill]=nil
							end
							  end,
						get = function(i)
							local skill = GQ.db.profile.fakeskills[GQ.db.profile.fakeskill]
							return not not skill
							  end,
						width = "half",
					})
					AddOption('fakeskilllevel',{
						name = "Skill",
						desc = "Skill level.",
						type = 'range',
						min = 0,
						max = 800, -- EXPANSION: update
						step = 1,
						bigStep = 1,
						set = function(i,v)
							Setter_Simple(i,v)
							if GQ.db.profile.fakeskillcheck then
								local skill = GQ.db.profile.fakeskills[GQ.db.profile.fakeskill] or {active=true,level=0,max=0}
								skill.level = tonumber(v)
								GQ.db.profile.fakeskills[GQ.db.profile.fakeskill]=skill
							end
							  end,
						get = function(i)
							local skill = GQ.db.profile.fakeskills[GQ.db.profile.fakeskill]
							return skill and skill.level or 0
							  end,
						disabled = function() return not GQ.db.profile.fakeskillcheck end,
						width="half",
						_default = 0,
					})
					AddOption('fakeskillmax',{
						name = "Skill max",
						desc = "Max skill level.",
						type = 'select',
						values={
							[0]="none",
							[75]="75 Apprentice",
							[150]="150 Journeyman",
							[225]="225 Expert",
							[300]="300 Artisan",
							[375]="375 Master",
							[450]="450 Grand Master",
							[525]="525 Illustrious G. M.",
							[600]="600 Zen Master",
							[700]="700 Draenor Master",				
							[800]="800 Legion", -- EXPANSION: add more
						},
						set = function(i,v)
							Setter_Simple(i,v)
							if GQ.db.profile.fakeskillcheck then
								local skill = GQ.db.profile.fakeskills[GQ.db.profile.fakeskill] or {active=true,level=0,max=0}
								skill.max = tonumber(v)
								skill.level = min(skill.max,max(0,skill.level,skill.max-100))
								GQ.db.profile.fakeskills[GQ.db.profile.fakeskill]=skill

								local fsl = GQ.optiontables.debugfake.args.fakeskilllevel
								if not fsl then return end
								fsl.min=max(0,tonumber(skill.max)-100)
								fsl.max=tonumber(skill.max)
								self:SetOption("DebugFake","fakeskilllevel ".. skill.level)
							end
						end,
						get = function(i)
							local skill = GQ.db.profile.fakeskills[GQ.db.profile.fakeskill]
							return skill and skill.max or 0
							  end,
						disabled = function() return not GQ.db.profile.fakeskillcheck end,
						--width=140,
						_default = 0,
						_inline = true
					})
					AddOption('fakeskilllist',{
						name = function()
							local s = "Faked skills:"
							for fsn,fs in pairs(GQ.db.profile.fakeskills) do
								s = s .. "\n" .. fsn .." = " .. fs.level .. "/" .. fs.max
							end
							if not next(GQ.db.profile.fakeskills) then s = s .. "  none" end
							return s
							   end,
						desc = "",
						type = "description",
						width = "full",
					})
					AddOption('fakeskillclear',{
						type = "execute",
						name = "Clear all skills",
						func = function()
							GQ.db.profile.fakeskills={}
							self:SetOption("DebugFake","fakeskillcheck off")
							self:SetOption("DebugFake","fakeskilllevel ".. GQ.db.profile.fakeskilllevel)
							   end,
					})
				else
					AddOption('fakeskilltype',{
						name = "Fake profession",
						desc = "Check to simulate skill levels.",
						type = 'select',
						values=skillvalues,
						set = Setter_Simple,
						_default = "Alchemy",
						_inline=true,
						width=120,
					})

					AddOption('fakeskill',{
						name = "",
						type = 'select',
						values=function() 
							local arr = {}
							for i,skillgroup in pairs(GQ.Professions.tradeskills) do
								if skillgroup.name==GQ.db.profile.fakeskilltype then
									for j,skill in pairs(skillgroup.subs) do
										arr[skill.name]=skill.name
									end
								end
							end
							return arr
						end,
						set = function(i,v)
							Setter_Simple(i,v)

							local fs = GQ.db.profile.fakeskills[v]

							self:SetOption("DebugFake","fakeskillcheck " .. (fs and "on" or "off"))

							if fs then
								local fsl = GQ.optiontables.debugfake.args.fakeskilllevel
								if not fsl then return end
								fsl.min=max(0,tonumber(fs and fs.max or 0)-100)
								fsl.max=tonumber(fs and fs.max or 0)
								self:SetOption("DebugFake","fakeskilllevel ".. (fs and fs.level or 0))
								self:SetOption("DebugFake","fakeskillmax ".. (fs and fs.max or 0))
							end
							end,
						_default = "",
						_inline=true,
						width=140,
					})
					AddOption('fakeskillcheck',{
						name = "Fake",
						desc = "",
						type = 'toggle',
						set = function(i,v)
							Setter_Simple(i,v)
							if v then
								if not GQ.db.profile.fakeskills[GQ.db.profile.fakeskill] then
									self:SetOption("DebugFake","fakeskilllevel 0")
									self:SetOption("DebugFake","fakeskillmax 75")
								end
							else
								GQ.db.profile.fakeskills[GQ.db.profile.fakeskill]=nil
							end
							end,
						get = function(i)
							local skill = GQ.db.profile.fakeskills[GQ.db.profile.fakeskill]
							return not not skill
							end,
						width = 80,
					})
					AddOption('fakeskilllevel',{
						name = "Skill",
						desc = "Skill level.",
						type = 'range',
						min = 0,
						max = 800, -- EXPANSION: update
						step = 1,
						bigStep = 1,
						set = function(i,v)
							Setter_Simple(i,v)
							if GQ.db.profile.fakeskillcheck then
								local skill = GQ.db.profile.fakeskills[GQ.db.profile.fakeskill] or {active=true,level=0,max=0}
								skill.level = tonumber(v)
								GQ.db.profile.fakeskills[GQ.db.profile.fakeskill]=skill
							end
							end,
						get = function(i)
							local skill = GQ.db.profile.fakeskills[GQ.db.profile.fakeskill]
							return skill and skill.level or 0
							end,
						disabled = function() return not GQ.db.profile.fakeskillcheck end,
						width="half",
						_default = 0,
					})

					local levels_alchemy = {
						[0]="none",
						[75]="75 Apprentice",
						[150]="150 Journeyman",
						[225]="225 Expert",
						[300]="300 Artisan",
						[375]="375 Master",
						[450]="450 Grand Master",
						[525]="525 Illustrious G. M.",
						[600]="600 Zen Master",
						[700]="700 Draenor Master",				
						[800]="800 Legion Master",
						[950]="950 Battle for Azeroth Master",
					}
					local levels_core = {
						[0]="none",
						[75]="75 Apprentice",
						[150]="150 Journeyman",
						[225]="225 Expert",
						[300]="300 Artisan",
					}

					local levels_sub_75 = {
						[0]="none",
						[75]="75 learned",
					}

					local levels_sub_100 = {
						[0]="none",
						[100]="100 learned",
					}

					local levels_sub_175 = {
						[0]="none",
						[175]="175 learned",
					}

					local levels_shadowlands = {
						[0]="none",
						[75]="75",
						[100]="100",
						[115]="115",
						[150]="150",
						[175]="175",
						[200]="200",
					}

					AddOption('fakeskillmax',{
						name = "Skill max",
						desc = "Max skill level.",
						type = 'select',
						values=function() 
							local fakeskill = GQ.db.profile.fakeskill
							if not fakeskill then return {} end

							if fakeskill=="Alchemy" then 
								return levels_alchemy
							elseif fakeskill:find("Outland") or fakeskill:find("Northrend") or fakeskill:find("Cataclysm") or fakeskill:find("Pandaren") or fakeskill:find("Way of") then
								return levels_sub_75
							elseif fakeskill:find("Draenor") or fakeskill:find("Legion") then
								return levels_sub_100
							elseif fakeskill:find("Shadowlands") then
								return levels_shadowlands
							elseif fakeskill:find("Tiran") or fakeskill:find("Zandalari") then
								return levels_sub_175
							else
								return levels_core
							end
						end,
						set = function(i,v)
							Setter_Simple(i,v)
							if GQ.db.profile.fakeskillcheck then
								local skill = GQ.db.profile.fakeskills[GQ.db.profile.fakeskill] or {active=true,level=0,max=0}
								skill.max = tonumber(v)
								skill.level = min(skill.max,max(0,skill.level,skill.max-100))
								GQ.db.profile.fakeskills[GQ.db.profile.fakeskill]=skill

								local fsl = GQ.optiontables.debugfake.args.fakeskilllevel
								if not fsl then return end
								fsl.min=max(0,tonumber(skill.max)-100)
								fsl.max=tonumber(skill.max)
								self:SetOption("DebugFake","fakeskilllevel ".. skill.level)
							end
						end,
						get = function(i)
							local skill = GQ.db.profile.fakeskills[GQ.db.profile.fakeskill]
							return skill and skill.max or 0
							end,
						disabled = function() return not GQ.db.profile.fakeskillcheck end,
						width=100,
						_default = 0,
						_inline = true
					})
					AddOption('fakeskilllist',{
						name = function()
							local s = "Faked skills:"
							for fsn,fs in pairs(GQ.db.profile.fakeskills) do
								s = s .. "\n" .. fsn .." = " .. fs.level .. "/" .. fs.max
							end
							if not next(GQ.db.profile.fakeskills) then s = s .. "  none" end
							return s
							end,
						desc = "",
						type = "description",
						width = "full",
					})
					AddOption('fakeskillclear',{
						type = "execute",
						name = "Clear all skills",
						func = function()
							GQ.db.profile.fakeskills={}
							self:SetOption("DebugFake","fakeskillcheck off")
							self:SetOption("DebugFake","fakeskilllevel ".. GQ.db.profile.fakeskilllevel)
							end,
					})
				end
			end

			AddOptionSep()

			do -- Fake Reputation
				AddOption('fakerep',{
					name = "Fake reputation",
					desc = "Simulate reputations.",
					type = 'select',
					values = function() return self.factions_mentioned or {} end,
					set = function(i,v)
						Setter_Simple(i,v)

						local fr = GQ.db.profile.fakereps[v]

						self:SetOption("DebugFake","fakerepcheck " .. (fr and "on" or "off"))

						if fr then
							self:SetOption("DebugFake","fakerepstanding ".. (fr or 4))
						end
						end,
					_default = "",
					_inline=true,
				})
				AddOption('fakerepcheck',{
					name = "Fake",
					desc = "",
					type = 'toggle',
					set = function(i,v)
						Setter_Simple(i,v)
						if v then
							if not GQ.db.profile.fakereps[GQ.db.profile.fakerep] then
								self:SetOption("DebugFake","fakerepstanding 4")
							end
						else
							GQ.db.profile.fakereps[GQ.db.profile.fakerep]=nil
						end
						end,
					get = function(i)
						local rep = GQ.db.profile.fakereps[GQ.db.profile.fakerep]
						return not not rep
						end,
					width = "half",
					_default = false,
				})
				AddOption('fakerepstanding',{
					name = "Standing",
					desc = "Pick your rep level.",
					type = 'select',
					values = function() local standings=GQ:GetReputation(GQ.db.profile.fakerep).reptypemeta.standings  local ret={}  for i,v in ipairs(standings) do ret[i]=v.name end  return ret  end,
					set = function(i,v)
						Setter_Simple(i,v)
						if GQ.db.profile.fakerepcheck then
							GQ.db.profile.fakereps[GQ.db.profile.fakerep]=v
						end
						end,
					get = function(i)
						return GQ.db.profile.fakereps[GQ.db.profile.fakerep]
						end,
					disabled = function() return not GQ.db.profile.fakerepcheck end,
					_default = 4,
					_inline = true,
				})
				AddOption('fakereplist',{
					name = function()
						local s = "Faked reputations:"
						for fake_id,fr in pairs(GQ.db.profile.fakereps) do
							local rep = GQ:GetReputation(fake_id)
							s = s .. "\n" .. (rep.name or "?") .." ("..fake_id..") = " .. rep:GetStandingName(fr)
						end
						if not next(GQ.db.profile.fakereps) then s = s .. "  none" end
						return s
						end,
					desc = "",
					type = "description",
					width = "full",
				})
				AddOption('fakerepclear',{
					type = "execute",
					name = "Clear all reps",
					func = function()
						GQ.db.profile.fakereps={}
						self:SetOption("DebugFake","fakerepcheck off")
						self:SetOption("DebugFake","fakerepstanding ".. GQ.db.profile.fakerepstanding)
						end,
				})
			end

			do -- Travel fakes
				AddOption('sep00pathf',{ type="header", name="Travel" })

				AddOption('debug_librover_maxspeed',{
					name = "Riding skill:",
					desc = "Reload after changing to/from flying to load proper baked map data!",
					type = 'select',
					values={
						[0]="unset",
						[0.01]="No skill (0)",
						[0.6]="Apprentice (75) [slow ride]",
						[1.0]="Journeyman (150) [fast ride]",
						[1.5]="Expert (225) [slow flight]",
						[2.8]="Artisan (300) [fast flight]",
						[3.1]="Master (375) [epic flight]",
					},
					set = function(i,v)
						if v==0 then v=nil end
						Setter_Simple(i,v)
						LibRover:CheckMaxSpeeds()
						LibRover:UpdateNow()
					end,
				})
				AddOptionSep()
				for i,n in ipairs{{"flightazeroth","Azeroth"},{"flightnorthrend","Northrend"},{"flightpandaria","Pandaria"},{"flightdraenor","Draenor"},{"flightlegion","Legion"},{"flightbfa","BfA"},{"flightsl","Shadowlands"},{"flightdf","Dragonflight"},{"dragonriding","Dragonriding with skills"}} do  --EXPANSION
					AddOption('debug_librover_'..n[1],{
						name = n[2],
						desc = "",
						type = 'toggle',
						tristate = true,
						width = 110,
						set = function(i,v) Setter_Simple(i,v) LibRover:CheckMaxSpeeds() LibRover:UpdateNow() end,
					})
				end
				AddOption('',{ type = "description", name = "(reload needed)", font=GQ.font_dialog })

				AddOptionSep()

				local OriginalIsFlying = IsFlying
				AddOption('debug_librover_fakenofly',{
					name = "Force walking",
					desc = "Travel will treat player as if on ground all the time",
					type = 'toggle',
					set = function(i,v) Setter_Simple(i,v) 
						if v then
							IsFlying = function() return false end
						else
							IsFlying = OriginalIsFlying
						end
					end,
				})
				if GQ.db.profile.debug_librover_fakenofly then
					IsFlying = function() return false end
				end
			
				-- EXPANSION: add more
				AddOptionSep()

				--[[
				AddOption('debug_librover_steps',{
					name = "Verbose pathfinding",
					desc = "",
					type = 'toggle',
					set = function(i,v)
						Setter_Simple(i,v)
						LibRover.debug_cnodes = v
						--LibRover.debug_onodes = v
						if (v) then LibRover:GoSlow() end
					end,
				})
				AddOption('debug_librover_updating',{
					name = "Realtime",
					desc = "",
					type = 'toggle',
					set = function(i,v) Setter_Simple(i,v) LibRover.do_updating = v end,
				})
				--]]
			end

			do -- Fake Popups
				AddOption('sep00faketoasts',{ type="header", name="Message Toasts" })
				AddOption('faketoast_1', { type = 'execute', width=160, 
					name="Welcome Message", 
					func=function(info,val)
						GQ.NotificationCenter:AddEntry("welcome","Welcome to GoatQuest","This is a test welcome message",{cleartype=true,keeponclick=true}) 
					end
				})
				AddOption('faketoast_2', { type = 'execute', width=160, 
					name="Weekly Quests", 
					func=function(info,val)
						GQ.NotificationCenter:AddEntry("weekly","Weekly Quests have reset on the server.","",{dontsave=true})
					end
				})
				AddOption('faketoast_2.5', { type = 'execute', width=160, 
					name="Daily Quests", 
					func=function(info,val)
						GQ.NotificationCenter:AddEntry("daily","Daily Quests have reset on the server.","",{dontsave=true})
					end
				})
				AddOption('faketoast_3', { type = 'execute', width=160, 
					name="Events", 
					func=function(info,val) GQ.NotificationCenter:AddEntry("event","The Noblegarden Event is in progress.","Click to see guides for it.",{folder="EVENTS\\Noblegarden"}) end
				})
				AddOption('faketoast_4', { type = 'execute', width=160, 
					name="Orientation Guide", 
					func=function(info,val) GQ.NotificationCenter:AddEntry("orientation","Run Startup Orientation to improve guide directions","Click to run now",{cleartype=true}) end
				})
				AddOption('faketoast_5', { type = 'execute', width=160, 
					name="Guide Updates", 
					func=function(info,val) GQ.NotificationCenter:AddEntry("guides","See new and updated guides","",{cleartype=true,keeponclick=true}) end
				})
				AddOption('faketoast_6', { type = 'execute', width=160, 
					name="Feature Updates", 
					func=function(info,val) GQ.NotificationCenter:AddEntry("features","New in this update","",{cleartype=true,keeponclick=true}) end
				})

				AddOption('sep00fakepopups',{ type="header", name="Popups" })
				AddOption('fakepopup_1', { type = 'execute', width=140, 
					name="Quest cleanup", 
					func=function(info,val) GQ:ShowQuestCleanup() end
				})
				AddOption('fakepopup_11', { type = 'execute', width=140, 
					name="Boosted", 
					func=function(info,val) GQ:IsBoosted(100,true) end
				})
				--[[
				AddOption('fakepopup_7', { type = 'execute', width=140, 
					name="Sell useless", 
					func=function(info,val) GQ.Inventory:SellUnusableItems() end
				})
				--]]
				AddOption('fakepopup_6', { type = 'execute', width=140, 
					name="Suggest dungeon", 
					func=function(info,val) GQ.GuideFuncs:SuggestDungeonGuide(GQ:GetGuideByTitle("GoatQuest's Dungeon Guides\\Classic Dungeons\\The Stormwind Stockade")) end
				})
				AddOption('fakepopup_6.5', { type = 'execute', width=185, 
					name="Suggest dungeon (multi)", 
					func=function(info,val) GQ.GuideFuncs:SuggestDungeonGuide(GQ:GetGuideByTitle("Dungeon Guides\\Draenor Raids\\Highmaul - Normal/Heroic")) end
				})
				AddOptionSep()
				--[[
				AddOption('fakepopup_2', { type = 'execute', width=140,
					name="Legion quests", 
					func=function(info,val) GQ:PLAYER_LEVEL_UP(nil,GQ.FakeLevelForPopup or 101) end
				})
					AddOption('fakepopup_2_dropdown',{
						name="Level",
						type = 'select',
						values={ [101]=101, [102]=102, [103]=103, [110]=110 },
						set = function(i,v) GQ.FakeLevelForPopup = v end,
						get = function() return GQ.FakeLevelForPopup or 101 end,
						_inline=true
					})
				AddOptionSep()
				--]]
				AddOption('fakepopup_3', { type = 'execute', width=140, 
					name="Riding training", 
					func=function(info,val) GQ.GuideFuncs:LearnMountGuideSuggestion(GQ.FakeLevelForRiding or 20) end
				})
					AddOption('fakepopup_3_dropdown',{
						name="Level",
						type = 'select',
						values={ [20]=20, [40]=40, [60]=60, [80]=80, [90]=90,  },
						set = function(i,v) GQ.FakeLevelForRiding = v end,
						get = function() return GQ.FakeLevelForRiding or 20 end,
						_inline=true
					})
				AddOptionSep()

				AddOption('fakepopup_4', { type = 'execute', width=140, 
					name="Monk quests", 
					func=function(info,val) GQ.GuideFuncs:MonkQuest(GQ.FakeLevelForMonk or 1) end
				})
					AddOption('fakepopup_4_dropdown',{
						name="Level",
						type = 'select',
						values={ [1]=1, [20]=20, [30]=30, [40]=40, [50]=50, [60]=60, [70]=70, [80]=80, [90]=90,  },
						set = function(i,v) GQ.FakeLevelForMonk = v end,
						get = function() return GQ.FakeLevelForMonk or 1 end,
						_inline=true
					})
				AddOptionSep()
				--[[
				AddOption('fakepopup_5', { type = 'execute', width=140, 
					name="Monk reload", 
					func=function(info,val) GQ.GuideFuncs:AskReload() end
				})
				--]]
				AddOption('fakepopup_8', { type = 'execute', width=140, 
					name="Bad guide popup", 
					func=function(info,val) GQ:SetGuide(GQ.CurrentGuide,nil,"forcebad") end
				})
				--[[
				AddOption('fakepopup_9', { type = 'execute', width=140, 
					name="End of guide", 
					func=function(info,val) GQ:SkipStep(false,true) end
				})
				AddOption('fakepopup_10', { type = 'execute', width=140, 
					name="Next guide", 
					func=function(info,val) GQ.CurrentGuide:AdvertiseWithPopup(true,true) end
				})
				--]]
				AddOption('faketoast_11', { type = 'execute', width=160, 
					name="Creature detector", 
					func=function(info,val)
						GQ.NotificationCenter:AddEntry("pet","Baby Blizzard Bear","",{guide="PETSMOUNTS\\Battle Pets\\Beast Pets\\Baby Blizzard Bear"})
					end
				})
				AddOption('faketoast_12', { type = 'execute', width=160, 
					name="Find gear upgrades", 
					func=function(info,val)
						GQ.NotificationCenter:AddEntry("gear","You have 2 new upgrades available","")
					end
				})
				AddOption('faketoast_13', { type = 'execute', width=160, 
					name="Cutscene", 
					func=function(info,val)
						GQ.NotificationCenter:AddEntry("cutscene","A cutscene has been skipped.","")
					end
				})
				AddOption('faketoast_14', { type = 'execute', width=160, 
					name="Skills", 
					func=function(info,val)
						GQ.NotificationCenter:AddEntry("skills", "You have new skills available.", "Click to see skills.",{cleartype=true})
					end
				})
			end

			do -- Fake goal status
				AddOption('sep00fakegoals',{ type="header", name="Goals" })
				AddOption('fakegoal_list',{
					name="Current goal steps",
					type = 'select',
					values = function()
						if not GQ.CurrentStep then return {"--none--"} end
						local t={}
						for goalnum,goaldata in pairs(GQ.CurrentStep.goals) do
							t[goalnum] = goaldata:GetText()
						end
						return t
					end,
					set = function(i,v) GQ.FakeStepNum = v end,
					get = function() return GQ.FakeStepNum or 1 end,
					_inline=true
				})

				local goal_status = { "--default--", "hidden","passive","complete","warning","impossible","incomplete" }
				AddOption('fakegoal_list',{
					name="Status",
					type = 'select',
					values = goal_status,
					set = function(i,v) 
						if not GQ.CurrentStep or not GQ.CurrentStep.goals[1] then return end
						local goal = GQ.CurrentStep.goals[GQ.FakeStepNum or 1]
						if goal_status[v]=="--default--" then 
							goal.fakestatus = nil
						else
							goal.fakestatus = goal_status[v]
						end
						GQ:UpdateFrame()
					end,
					get = function() 
						if not GQ.CurrentStep or not GQ.CurrentStep.goals[1] then return 1 end
						local status = GQ.CurrentStep.goals[GQ.FakeStepNum or 1]:GetStatus() 
						for i,v in pairs(goal_status) do
							if v==status then return i end
						end
						return 1
					end,
					_inline=true
				})
				AddOption('fakegoal_refresh', { type = 'execute', width=140, 
					name="refresh", 
					func=function() GQ:RefreshOptions() end
				})
				AddOption('dontprogress',{ type = 'toggle', width = "full" })
			end
	
			if GQ.IsRetail then
				AddOption('sep00fakegarrison',{ type="header", name="Garrison" })
				AddOption('fake_garrison', { 
					name="Garrison level",
					type = 'select',
					values = function()
						return { [-1] = "--not set: "..GQ.GetGarrisonLevel(true).."--", [0] = "not built", [1] = "level 1", [2] = "level 2", [3] = "level 3" }
					end,
					_default = -1
				})

				AddOption('sep00fakecovenant',{ type="header", name="Shadowlands Covenants" })
				AddOption('fake_covenant', {
					name="Covenant",
					type = 'select',
					values = function()
						local val = { [-1] = "--not set: "..(C_Covenants.GetCovenantData(C_Covenants.GetActiveCovenantID()) or {textureKit="none"}).textureKit.."--", [0]="None" }
						for i,v in pairs(C_Covenants.GetCovenantIDs()) do
							val[v]=C_Covenants.GetCovenantData(v).textureKit
						end
						return val
					end,
					set = function(i,v)  if v==-1 then v=false end  Setter_Simple(i,v)  end,
					get = function(i)  return Getter_Simple(i) or -1  end,
					_default = false
				})
				AddOption('fake_covenant_feature_transport', {
					name="Feature: Transport Network",
					type = 'select',
					values = function()
						local val = { [-1] = "--not set: "..GQ.Parser.ConditionEnv.covenantnetwork().."--", [0]=0, [1]=1, [2]=2, [3]=3 }
						return val
					end,
					set = function(i,v)  if v==-1 then v=false end  Setter_Simple(i,v)  end,
					get = function(i)  return Getter_Simple(i) or -1  end,
					_default = false
				})
			end
			
			AddOption('sep00fakespam',{ type="header", name="Announcements" })
			AddOption('fakespam_levelup', { type = 'execute', width=160, 
					name="Level up", 
					func=function(info,val)
						GQ.Announcements:SendMessage()
		end
				})

		end

		AddOptionGroup("debugdig","DebugDig","zgdebugdig", { name="Debug: data digging", guiHidden = not self.DEV or self.db.profile.hide_dev_once, })
		do
			
			if GQ.IsRetail then
				AddOption('sep00scen',{ type="header", name="Scenarios / Dungeons" })
				AddOption('dumpscenario',{ name = "Dump scenario objectives", width = "double", disabled=function() return not C_Scenario.IsInScenario() end, desc = "", type = 'execute', func = function() GQ:DumpScenario() end})
			end


			AddOption('sep00fogl',{ type="header", name="Foglight" })

			AddOption('foglightdumpnew',{ name = "Update all maps data", type = 'execute', width = "double", func = function() GQ.Testing.FoglightDumper:UpdateAll() end})
			AddOption('foglightdumpnew',{ name = "Update current zone data", desc = "Map visible in map frame, or one player is on", type = 'execute', width = "double", func = function() GQ.Testing.FoglightDumper:UpdateCurrent() end})
			AddOption('foglightdumpnew',{ name = "Refresh current zone data", desc = "Map visible in map frame, or one player is on.\nGet fresh copy of overlays, ignoring current data", type = 'execute', width = "double", func = function() GQ.Testing.FoglightDumper:RefreshCurrent() end})


			AddOption('sep00score',{ type="header", name="Itemscore" })
			AddOption('score_this', { type = 'execute', name="Score cursor item", desc=function() if GetCursorInfo()=="item" then return GQ.ItemScore:ScoreCursor("quiet").."\n\nClick button to send this to a Dump window."  else  return "Drag an item here to score it..." end end,
				func=function(info,val)
					GQ:ShowDump(GQ.ItemScore:ScoreCursor("quiet"),"ItemScore")
				end
			})


			if GQ.Testing and GQ.Testing.LootDumper then
				AddOption('sep00score',{ type="header", name="Loot Dumper" })
				local LootDumper = GQ.Testing.LootDumper
				AddOption('lootdumper_enable', { 
					type = 'execute', 
					name="Initialise", 
					width=140, 
					func=function(info,val) 
						LootDumper:Startup() 
					end
				})

				AddOption('lootdumper_abort', { 
					type = 'execute', 
					name="Abort thread", 
					width=140, 
					disabled=function() return not LootDumper.Events end, 
					func=function(info,val) LootDumper.Worker=nil end
				})

				AddOption('lootdumper_getall', { 
					type = 'execute', 
					name="Get all info", 
					width=140, 
					disabled=function() return not LootDumper.Events end, 
					func=function(info,val) LootDumper:GetAllInstancesInfo() end
				})
				
				AddOption('lootdumper_wipe', { 
					type = 'execute', 
					name="Reset all", 
					width=140, 
					disabled=function() return not LootDumper.Events end, 
					func=function(info,val) 
						table.wipe(LootDumper.Instances) 
						table.wipe(LootDumper.LFGtoMap)
						LootDumper.Instances = nil
						LootDumper.LFGtoMap = nil
						LootDumper.GotAllInstancesInfo = false
						LootDumper:GetInstances()
						LootDumper:MapLFGtoMap()
					end
				})
				
				
				AddOption('lootdumper_backup', { 
					type = 'execute', 
					name="Backup data", 
					width=140, 
					disabled=function() return not LootDumper.Events end, 
					func=function(info,val) GQ.db.char.lootdumperbackup=GQ.Testing.LootDumper.Instances end
				})
				AddOption('lootdumper_getall', { 
					type = 'execute', 
					name="Restore data", 
					width=140, 
					disabled=function() return not GQ.db.char.lootdumperbackup end, 
					func=function(info,val) LootDumper:Startup() GQ.Testing.LootDumper.Instances=GQ.db.char.lootdumperbackup end
				})
				
				AddOptionSpace()

				GQ.db.profile.lootdumper_select_instance = nil
				GQ.db.profile.lootdumper_select_instance_tier = nil
				AddOption('lootdumper_select_instance_tier',{
					type = "select",
					name="",
					values = function() 
						local results = {}
						for i,v in ipairs(LootDumper.dungeonTierTable) do
							results[i]=v[1]
						end
						results[0]="All"
						return results
					end,
					disabled=function() return not LootDumper.Events end, 
					_inline=true
				})
				AddOption('lootdumper_select_instance',{
					type = "select",
					name="",
					values = function()
						if not LootDumper.OptionsMap then return {} end
						
						if not GQ.db.profile.lootdumper_select_instance_tier or GQ.db.profile.lootdumper_select_instance_tier==0 then return LootDumper.OptionsMap end
						
						local results = {}
						for i,v in ipairs(LootDumper.OptionsMap) do
							if v.TierID==GQ.db.profile.lootdumper_select_instance_tier then
								table.insert(results,v)
							end
						end
						return results
					end,
					disabled=function() return not LootDumper.Events end, 
					set = function(i,v)
						Setter_Simple(i,v) 
						LootDumper.SelectedInstance = i.option.values()[v].id
						GQ:RefreshOptions()
					end,
					--get = function() return LootDumper.SelectedInstance end,
					_inline=true
				})

				AddOption('lootdumper_loot_current', { 
					type = 'execute', 
					name = "Get loot",
					width=180, 
					disabled=function() return not LootDumper.SelectedInstance end, 
					func=function(info,val) LootDumper:GetInstanceLoot(LootDumper.SelectedInstance) end
				})

				AddOption('lootdumper_generate_current', { 
					type = 'execute', 
					name = "Generate guide",
					width=180, 
					disabled=function() return not (LootDumper.Events and LootDumper.SelectedInstance and LootDumper.Instances[LootDumper.SelectedInstance].GatheredLoot) end, 
					func=function(info,val) 
						LootDumper:GetInstanceGuides(LootDumper.SelectedInstance,IsShiftKeyDown()) 
					end
				})

				AddOptionSpace()

				AddOption('lootdumper_loot_all', { 
					type = 'execute', 
					name="Get loot for all instances",
					width=280, 
					disabled=function() return not LootDumper.Events end, 
					func=function(info,val) LootDumper:GetAllInstancesLoot() end
				})

				AddOption('lootdumper_generate_all', { 
					type = 'execute', 
					name=function()
						local gathered = 0
						if LootDumper.Instances then for instnum,instdata in pairs(LootDumper.Instances) do if instdata.GatheredLoot then gathered=gathered+1 end end end
						return "Generate guides for "..gathered.." gathered dungeons"
					end,
					width=280, 
					disabled=function() 
						local gathered = 0
						if LootDumper.Instances then for instnum,instdata in pairs(LootDumper.Instances) do if instdata.GatheredLoot then gathered=gathered+1 end end end
						return not (LootDumper.Events and gathered>0)
					end,
					func=function(info,val) LootDumper:GetAllInstancesGuides() end
				})

				AddOptionSpace()

				AddOption('lootdumper_dump_info', { 
					type = 'execute', 
					name="Show instance knowledge",
					width=280, 
					disabled=function() return not LootDumper.Events end, 
					func=function(info,val) Spoo(LootDumper.InstancesByName) end
				})

				AddOption('lootdumper_dump_lfr', { 
					type = 'execute', 
					name="Show LFR boss to instance for current char",
					width=280, 
					disabled=function() return not LootDumper.Events end, 
					func=function(info,val) LootDumper:GetRFGBosses() end
				})

				AddOption('lootdumper_dump_lfg', { 
					type = 'execute', 
					name="Show LFG info",
					desc="Needs GotAllInstancesInfo first",
					width=280, 
					disabled=function() return not LootDumper.GotAllInstancesInfo end, 
					func=function(info,val) LootDumper:DumpLFGData() end
				})

				AddOption('lootdumper_dump_lfg', { 
					type = 'execute', 
					name="Show LFGid to mapid info",
					width=280, 
					disabled=function() return not LootDumper.Events end, 
					func=function(info,val) Spoo(LootDumper.LFGtoMap) end
				})
			end

			AddOption('sep00astrol',{ type="header", name="HBD map adjustment" })
			AddOption('debug_astrol_map',{
				name = "Map ID",
				desc = "",
				type = 'input',
				_default = ""
			})
			AddOption('debug_astrol_floor',{
				name = "Floor #",
				desc = "leave empty to adjust map itself",
				type = 'input',
				_default = ""
			})
			AddOption('debug_astrol_load',{ name = "Load", type = 'execute', width = "single", func = function()
				local map=HBD.mapData[tonumber(GQ.db.profile.debug_astrol_map)]
				local flr = tonumber(GQ.db.profile.debug_astrol_floor)
				if flr then map=map.floors[flr] end
				GQ.db.profile.debug_astrol_xoff = map[3]
				GQ.db.profile.debug_astrol_yoff = map[4]
				GQ.db.profile.debug_astrol_w = map[1]
				GQ.db.profile.debug_astrol_h = map[2]
				self:UpdateFrame()
			end})
			AddOption('debug_astrol_xoff',{
				type = 'range',
				min = -50000, max = 50000, step = 1, bigStep = 10,
				set = function(i,v)
					Setter_Simple(i,v)
					local map=HBD.mapData[tonumber(GQ.db.profile.debug_astrol_map)]
					local flr = tonumber(GQ.db.profile.debug_astrol_floor)
					if flr then map=map.floors[flr] end
					map[3] = v
					GQ.Pointer:UpdateWaypoints()
				end
			})
			AddOption('debug_astrol_yoff',{
				type = 'range',
				min = -50000, max = 50000, step = 1, bigStep = 10,
				set = function(i,v)
					Setter_Simple(i,v)
					local map=HBD.mapData[tonumber(GQ.db.profile.debug_astrol_map)]
					local flr = tonumber(GQ.db.profile.debug_astrol_floor)
					if flr then map=map.floors[flr] end
					map[4] = v
					GQ.Pointer:UpdateWaypoints()
				end
			})
			AddOption('debug_astrol_w',{
				type = 'range',
				min = 0, max = 40000, step = 1, bigStep = 10,
				set = function(i,v)
					Setter_Simple(i,v)
					local map=HBD.mapData[tonumber(GQ.db.profile.debug_astrol_map)]
					local flr = tonumber(GQ.db.profile.debug_astrol_floor)
					if flr then map=map.floors[flr] end
					map[1] = v
					 map[2] = v*0.6667
					 GQ.db.profile.debug_astrol_h=map[2]
					 self:UpdateFrame()
					GQ.Pointer:UpdateWaypoints()
				end
			})
			AddOption('debug_astrol_h',{
				type = 'range',
				min = 0, max = 40000, step = 1, bigStep = 10,
				set = function(i,v)
					Setter_Simple(i,v)
					local map=HBD.mapData[tonumber(GQ.db.profile.debug_astrol_map)]
					local flr = tonumber(GQ.db.profile.debug_astrol_floor)
					if flr then map=map.floors[flr] end
					map[2] = v
					GQ.Pointer:UpdateWaypoints()
				end
			})
			AddOption('debug_astrol_prec',{
				name = "Precise",
				desc = "",
				type = 'toggle',
				set = function(i,v)
					Setter_Simple(i,v)
					local function setprecise(var,tf,defmin,defmax)
						local opt = GQ.GuideMenu.MainFrame.WideColumnOptions.AceContainer.optiontable.args[var]
						local val = GQ.db.profile[var]
						if tf then
							opt.min=val-2000
							opt.max=val+2000
						else
							opt.min=defmin
							opt.max=defmax
						end
					end
					setprecise("debug_astrol_xoff",v,-50000,50000)
					setprecise("debug_astrol_yoff",v,-50000,50000)
					setprecise("debug_astrol_w",v,0,10000)
					setprecise("debug_astrol_h",v,0,10000)
					self:UpdateFrame()
				end
			})		
		end


		AddOptionGroup("debugremoved","DebugRemoved","zgdebugremoved", { name="Debug: removed options", guiHidden = not self.DEV or self.db.profile.hide_dev_once, })
		do
			AddOption('n_popup_guides',{ type = 'toggle', width = "full", _default = true, disabled = function() return not self.db.profile.n_popup_enable end,})		--This should not be needed since next guide popups went away with Guide Reviews, but it's everywhere and bugs out the floating toast if removed

			AddOption('guide_viewer_advanced',{  type = 'toggle', width="double", plusminus=true })
			AddSubgroup("advancedcust_subgroup", {hidden=function() return not self.db.profile.guide_viewer_advanced end})  
				
				AddOption('',{ type = "header", name = L["opt_step_display_header"]:format(), hidden=function() return not self.db.profile.guide_viewer_advanced end})
				AddOption('',{type="description",name=L['opt_modes_desc'], hidden=function() return not self.db.profile.guide_viewer_advanced end})

						local function setrgb(colortable,r,g,b,a)
					if not colortable then return end

					colortable.r = r
					colortable.g = g
					colortable.b = b
					colortable.alpha = a

					self:UpdateFrame()
				end

				AddOptionSep()

				local function rgb2list (rgba)
					if not rgba then rgba={r=0,g=1,b=0,a=1} end
					return rgba.r,rgba.g,rgba.b,rgba.a
				end

				--AddOption('desc_mp',{ type="header", name=L["opt_modepri"], desc=L["opt_modes_desc"] },
				AddOption('showstepborders',{ type = 'toggle', _default = true, disabled=true, hidden=function() return not self.db.profile.guide_viewer_advanced end })
				AddOption('stepbackalpha',{
					type = 'range',
					min=0.0, max=1.0, step = 0.1, bigStep = 0.1, isPercent = true,
					--disabled = function() return not self.db.profile.showstepborders end,
					--_default = 0.5,
					disabled = true,
					_default = 1.0,
					hidden=function() return not self.db.profile.guide_viewer_advanced end,
				}) --[[TODOest TODO, this violates the Stealth's Skin very idea, talk to Sinus on that matter]]
				AddOptionSep({type="description",name="",order=3, hidden=function() return not self.db.profile.guide_viewer_advanced end})

				AddOption('stepnumbers',{ type = 'toggle', _default = false, hidden=function() return not self.db.profile.guide_viewer_advanced end })
				AddOption('highlight_goto',{ type = 'toggle', _default = false, width="double", set=function(k,v) Setter_Simple(k,v) GQ:UpdateFrame() end, hidden=function() return not self.db.profile.guide_viewer_advanced end })

				AddOptionSep({hidden=function() return not self.db.profile.guide_viewer_advanced end})
				AddOption('goalicons',{ type = 'toggle', _default = true, hidden=function() return not self.db.profile.guide_viewer_advanced end })
				AddOption('tooltipsbelow',{ type = 'toggle', _default = true, width = "double", hidden=function() return not self.db.profile.guide_viewer_advanced end })

				AddOption('goaltotals',{ type = 'toggle', _default = true, hidden=function() return not self.db.profile.guide_viewer_advanced end})
				--AddOption('goalcolorize',{ type = 'toggle', width = "double", _default = false,})

				AddOption('collapsecompleted',{ type = 'toggle', width = "full", hidden=function() return not self.db.profile.guide_viewer_advanced end })

				AddOption('',{ type="header", name=L["opt_goalbackcolor_desc"], hidden=function() return not self.db.profile.guide_viewer_advanced end })

				AddOption('goalbackgrounds',{ type = 'toggle', _default = true, hidden=function() return not self.db.profile.guide_viewer_advanced end })
				AddOption('goalbackprogress',{
					type = 'toggle',
					disabled = function()  return not self.db.profile.goalbackgrounds  end,
					_default = false, -- I think it was a bug setting this to false. ~aprotas --It was intended. ~Errc
					hidden=function() return not self.db.profile.guide_viewer_advanced end,
				})

				AddOptionSep({hidden=function() return not self.db.profile.guide_viewer_advanced end})
				AddOption('',{ type="description", width="double", name=L["opt_goalcolor_completion_desc"], hidden=function() return not self.db.profile.guide_viewer_advanced end })
				AddOption('',{ type="description", width="single", name=L["opt_goalcolor_other_desc"], hidden=function() return not self.db.profile.guide_viewer_advanced end })
				AddOptionSep({hidden=function() return not self.db.profile.guide_viewer_advanced end})
				AddOption('goalbackincomplete',{
					type = 'color',
					width="double",
					disabled = function()  return not self.db.profile.goalbackgrounds  end,
					get = function()  return rgb2list(self.db.profile.goalbackincomplete)  end,
					set = function(_,r,g,b,a)  self.db.profile.goalbackincomplete={r=r,g=g,b=b,a=a}  self:UpdateFrame()  end,
					hasAlpha = true,
					hidden=function() return not self.db.profile.guide_viewer_advanced end,
					_default={r=0.65,g=0.08,b=0.10,a=0.7}
				})
				AddOption('goalbackimpossible',{
					type = 'color',
					disabled = function()  return not self.db.profile.goalbackgrounds  end,
					get = function()  return rgb2list(self.db.profile.goalbackimpossible)  end,
					set = function(_,r,g,b,a)  self.db.profile.goalbackimpossible={r=r,g=g,b=b,a=a}  self:UpdateFrame()  end,
					hasAlpha = true,
					hidden=function() return not self.db.profile.guide_viewer_advanced end,
					_default = {r=0.3,g=0.3,b=0.3,a=0.7}
				})
				AddOptionSep({hidden=function() return not self.db.profile.guide_viewer_advanced end})
				AddOption('goalbackprogressing',{
					type = 'color',
					width="double",
					disabled = function()  return not self.db.profile.goalbackgrounds or not self.db.profile.goalbackprogress  end,
					get = function()  return rgb2list(self.db.profile.goalbackprogressing)  end,
					set = function(_,r,g,b,a)  self.db.profile.goalbackprogressing={r=r,g=g,b=b,a=a}  self:UpdateFrame()  end,
					hasAlpha = true,
					hidden=function() return not self.db.profile.guide_viewer_advanced end,
					_default={r=0.6,g=0.7,b=0.0,a=0.7}
				})
				AddOption('goalbackwarning',{
					type = 'color',
					disabled = function()  return not self.db.profile.goalbackgrounds  end,
					get = function()  return rgb2list(self.db.profile.goalbackwarning)  end,
					set = function(_,r,g,b,a)  self.db.profile.goalbackwarning={r=r,g=g,b=b,a=a}  self:UpdateFrame()  end,
					hasAlpha = true,
					hidden=function() return not self.db.profile.guide_viewer_advanced end,
					_default={r=0.5,g=0.0,b=0.8,a=0.7}
				})
				AddOptionSep({hidden=function() return not self.db.profile.guide_viewer_advanced end})
				AddOption('goalbackcomplete',{
					type = 'color',
					width="double",
					disabled = function()  return not self.db.profile.goalbackgrounds  end,
					get = function()  return rgb2list(self.db.profile.goalbackcomplete)  end,
					set = function(_,r,g,b,a)  self.db.profile.goalbackcomplete={r=r,g=g,b=b,a=a}  self:UpdateFrame()  end,
					hasAlpha = true,
					hidden=function() return not self.db.profile.guide_viewer_advanced end,
					_default={r=0.2,g=0.7,b=0.0,a=0.7}
				})
				AddOption('goalbackaux',{
					type = 'color',
					hidden = function()  return not self.db.profile.goalbackgrounds  end,
					get = function()  return self.db.profile.goalbackaux.r,self.db.profile.goalbackaux.g,self.db.profile.goalbackaux.b,self.db.profile.goalbackaux.a  end,
					set = function(_,r,g,b,a)  self.db.profile.goalbackaux={['r']=r,['g']=g,['b']=b,['a']=a}  self:UpdateFrame()  end,
					hasAlpha = true,
					hidden=function() return not self.db.profile.guide_viewer_advanced end,
					_default = {r=0.0,g=0.5,b=0.8,a=0.5},
				})

				AddOption('',{ type="header", name=L["opt_flash_desc"], hidden=function() return not self.db.profile.guide_viewer_advanced end })

				AddOption('goalupdateflash',{
					type = 'toggle',
					disabled = function()  return not self.db.profile.goalbackgrounds  end,
					set = function(_,v)  Setter_Simple(_,v)  if v then self.db.profile.goalcompletionflash=true end  GQ:TryToCompleteStep()  end,
					width = "single",
					hidden=function() return not self.db.profile.guide_viewer_advanced end,
					_default = true,
				})
				AddOption('goalcompletionflash',{
					type = 'toggle',
					--hidden = function()  return not self.db.profile.goalbackgrounds  end,
					disabled = function()  return not self.db.profile.goalbackgrounds end,
					get = function()  return self.db.profile.goalcompletionflash --[[or self.db.profile.goalupdateflash--]]  end,
					set = function(_,v)  Setter_Simple(_,v)  if not v then self.db.profile.goalupdateflash=false end  GQ:TryToCompleteStep()  end,
					width = "single",
					hidden=function() return not self.db.profile.guide_viewer_advanced end,
					_default = true,
				})
				AddOption('flashborder',{
					type = 'toggle',
					set = function(i,v) Setter_Simple(i,v) if (v) then self.delayFlash=1 end  GQ:TryToCompleteStep()  end,
					width = "single",
					hidden=function() return not self.db.profile.guide_viewer_advanced end,
					_default = true,
				})
				AddOptionSep({hidden=function() return not self.db.profile.guide_viewer_advanced end})

				AddOption('',{ type="header", name=L["opt_guide_step_other"], hidden=function() return not self.db.profile.guide_viewer_advanced end })

			EndSubgroup()
			
			
			AddOption('travel_system_advanced',{  type = 'toggle', width="double", plusminus=true})
			-- ENABLES:
			AddSubgroup('ants',{width='single', hidden=function() return not self.db.profile.travel_system_advanced or not self.db.profile.pathfinding end})

				--[[
				AddOption('desc2',{
					type = "description",
					name = L['opt_pathfinding_subdesc']:format(GQ.LibRover.update_interval),
				})
				--]]
		
				local function rgb2list (savedcolors)
					if not savedcolors then return end
					return savedcolors.r,savedcolors.g,savedcolors.b,savedcolors.alpha
				end
				local function rgbalpha2rgba (rgbalpha)
					return {r=rgbalpha.r,g=rgbalpha.g,b=rgbalpha.b,a=rgbalpha.alpha}
				end
				local function rgba2rgbalpha (rgba)
					return {r=rgba.r,g=rgba.g,b=rgba.b,alpha=rgba.a}
				end
		
				-- set r,g,b,alpha on a table using another table or a quad of values.
				local function setrgb(colortable,r,g,b,a)
					if not colortable then return end
					if type(r)=="table" then
						local rgbalpha=r
						colortable.r,colortable.g,colortable.b,colortable.a,colortable.alpha = rgbalpha.r,rgbalpha.g,rgbalpha.b,rgbalpha.a,rgbalpha.alpha
					else
						colortable.r,colortable.g,colortable.b,colortable.a,colortable.alpha = r,g,b,a,a
					end
				end

				AddOption('antspeed',{
					type = 'select',
					disabled = function() return self.db.profile.waypointaddon~="internal" and self.db.profile.waypointaddon~="tomtom" end,
					values={ [1]=L["opt_antspeed_vslow"], [5]=L["opt_antspeed_slow"]:format(5), [10]=L["opt_antspeed_normal"]:format(10), [30]=L["opt_antspeed_fast"]:format(30), [999]=L["opt_antspeed_full"] },
					_default = 30
				})

				AddOptionSep()

				--local antcolor_disabled = function()  return not self.db.profile.customcolorants or self.db.profile.singlecolorants  end
				local antcolor_disabled = function()  return false  end
				--local antcolor_hidden = function()  return GQ.optiontables.travelsystem.args.ants.args.customcolorants:hidden() or self.db.profile.singlecolorants  end
				local antcolor_hidden = function()  return  not self.db.profile.multicolorants  end

				AddOption('colorantssingle',{
					type = 'color',
					--hidden = function()  return GQ.optiontables.travelsystem.args.ants.args.customcolorants:hidden() or not self.db.profile.singlecolorants or not self.db.profile.customcolorants  end,
					--hidden = function()  return  not antcolor_hidden()   end,
					disabled = function()  return  not antcolor_hidden()   end,
					get = function()  return rgb2list(self.db.profile.colorantssingle)  end,
					set = function(_,r,g,b,a)
						setrgb(self.db.profile.colorantssingle, r, g, b, a)
						GQ.Pointer.Icons:SetAntColorsFromOptions()
					end,
					hasAlpha = true,
					_default=rgbalpha2rgba(GQ.Pointer.Icons.ant_default)
				})

				AddOption('multicolorants',{ type = 'toggle', width="full", _default=false, set = function(i,v) Setter_Simple(i,v)  GQ.Pointer.Icons:SetAntColorsFromOptions()  end })

				AddOption('colorantsother',{--Add color to this table
					type = 'color',
					width="half",
					disabled = antcolor_disabled,
					hidden = antcolor_hidden,
					get = function()  return rgb2list(antcolor_disabled() and rgbalpha2rgba(GQ.Pointer.Icons.ant_walk_default) or self.db.profile.colorantsother)  end,
					set = function(_,r,g,b,a)
						setrgb(self.db.profile.colorantsother, r, g, b, a)
						GQ.Pointer.Icons:SetAntColorsFromOptions()
					end,
					hasAlpha = true,
					_default=rgbalpha2rgba(GQ.Pointer.Icons.ant_walk_default)
				})

				AddOption('colorantsfly',{
					type = 'color',
					width="half",
					disabled = antcolor_disabled,
					hidden = antcolor_hidden,
					get = function()  return rgb2list(antcolor_disabled() and rgbalpha2rgba(GQ.Pointer.Icons.ant_flying_default) or self.db.profile.colorantsfly)  end,
					set = function(_,r,g,b,a)
						setrgb(self.db.profile.colorantsfly, r, g, b, a)
						GQ.Pointer.Icons:SetAntColorsFromOptions()
					end,
					hasAlpha = true,
					_default=rgbalpha2rgba(GQ.Pointer.Icons.ant_flying_default)
				})

				AddOption('colorantstaxi',{
					type = 'color',
					width="half",
					disabled = antcolor_disabled,
					hidden = antcolor_hidden,
					get = function()  return rgb2list(antcolor_disabled() and rgbalpha2rgba(GQ.Pointer.Icons.ant_taxi_default) or self.db.profile.colorantstaxi)  end,
					set = function(_,r,g,b,a)
						setrgb(self.db.profile.colorantstaxi, r, g, b, a)
						GQ.Pointer.Icons:SetAntColorsFromOptions()
					end,
					hasAlpha = true,
					_default=rgbalpha2rgba(GQ.Pointer.Icons.ant_taxi_default)
				})

				AddOption('colorantsship',{
					type = 'color',
					width="half",
					disabled = antcolor_disabled,
					hidden = antcolor_hidden,
					get = function()  return rgb2list(antcolor_disabled() and rgbalpha2rgba(GQ.Pointer.Icons.ant_ship_default) or self.db.profile.colorantsship)  end,
					set = function(_,r,g,b,a)
						setrgb(self.db.profile.colorantsship, r, g, b, a)
						GQ.Pointer.Icons:SetAntColorsFromOptions()
					end,
					hasAlpha = true,
					_default=rgbalpha2rgba(GQ.Pointer.Icons.ant_ship_default)
				})

				AddOption('colorantsportal',{
					type = 'color',
					width="half",
					disabled = antcolor_disabled,
					hidden = antcolor_hidden,
					get = function()  return rgb2list(antcolor_disabled() and rgbalpha2rgba(GQ.Pointer.Icons.ant_portal_default) or self.db.profile.colorantsportal)  end,
					set = function(_,r,g,b,a)
						setrgb(self.db.profile.colorantsportal, r, g, b, a)
						GQ.Pointer.Icons:SetAntColorsFromOptions()
					end,
					hasAlpha = true,
					_default=rgbalpha2rgba(GQ.Pointer.Icons.ant_portal_default)
				})

				--AddOption('customcolorants',{ type = 'toggle', width="full", hidden = function() return self.db.profile.antspacing==0 end, set = function(i,v) Setter_Simple(i,v)  GQ.Pointer.Icons:SetAntColorsFromOptions()  end})

				AddOptionSep()

				AddOption('desc',{
					type = "description",
					name = "You can press [Defaults] below to revert to default colors.",
				})
			EndSubgroup()

			
			--[[
			AddOption('skin',{
				type = "select",
				values = function()
					local t={}
					for id,skin in pairs(self.Skins) do  t[id]=skin.name  end
					return t
				end,
				set = function(_,n)
					self:SetSkin(n)
					self:ScrollToCurrentStep()
				      end,
				_default = "default", -- TODO make (default) tag autoappendable
			})
			--]]

			AddOptionSpace()
			AddOption('gmfirstpage', { type = 'select', values=GQ.GuideOnly and { ['1_home']="Guides", ['2_current']="Current", ['3_recent']="Recent", ['5_last']="Last viewed" } or { ['1_home']=L['opt_gmfirstpage_home'], ['2_current']=L['opt_gmfirstpage_current'], ['3_recent']=L['opt_gmfirstpage_recent'], ['4_suggested']=L['opt_gmfirstpage_suggested'], ['5_last']=L['opt_gmfirstpage_last'] }, width="full", pulloutWidth="single", _default=GQ.GuideOnly and "5_last" or "1_home" })

			do




				--AddOption('arrowmeters',{ type = 'toggle', width = "full", _default=false, })
				AddOption('',{ type = 'description', name="  ", width=30})
				AddOptionSpace()

				AddOptionSpace()
				AddOption('maplines_graphic', {
					type = 'select',
					values={ [1]="Road", [2]="Bubbles", [3]="Arrows", [4]="Zap" },
					width="single", pulloutWidth="single",
					hidden=true,
					_default=1
				})
				AddOption('maplines_density', {
					type = 'select',
					style = 'slider',
					values={ [1]="1", [2]="2", [3]="3", [4]="4" },
					width="single", pulloutWidth="single",
					hidden=true,
					_default=1
				})
				AddOption('maplines_thickness', {
					type = 'range',
					min = 3,
					max = 10,
					step=0.1,bigStep=0.1,
					width="single",
					hidden=not DEV,
					_default=5
				})
				AddOption('maplines_animspeed', {
					type = 'range',
					min = 0.2,
					max = 3,
					step=0.1,bigStep=0.1,
					width="single",
					hidden=not DEV,
					_default=1.4
				})
				AddOption('maplines_dotsize', {
					type = 'range',
					min = 20,
					max = 40,
					step=1,bigStep=1,
					width="single",
					set=function(i,v)
						Setter_Simple(i,v)
						GQ.Pointer.Icons.greendotbig.size=v
						GQ.Pointer:RescaleMarkers()
					end,
					hidden=not DEV,
					_default=30
				})

				AddOption('ant_movespeed', {
					type = 'range',
					min = 0.2,
					max = 5,
					step=0.1,bigStep=0.1,
					width="single",
					hidden=not DEV,
					_default=1
				})
				AddOption('ant_spacing', {
					type = 'range',
					min = 10,
					max = 100,
					step=5,bigStep=5,
					width="single",
					hidden=not DEV,
					_default=30
				})
				AddOption('nav_finaldest_circle', {
					type = 'select',
					values={ [1]="just dot", [2]="just xhair" },
					width="single", pulloutWidth="single",
					set=function(k,v)
						Setter_Simple(k,v)
						GQ:ShowWaypoints()
					end,
					hidden=not DEV,
					_default=1
				})
				AddOption('minimap_ant_opacity', {
					type = 'range',
					min = 0.1,
					max = 1.0,
					step=0.1,bigStep=0.1,
					width="single",
					set=function(k,v)
						Setter_Simple(k,v)
						GQ.Pointer.Icons:SetAntColorsFromOptions()
					end,
					hidden=not DEV,
					_default=0.7
				})
				AddOption('minimap_marker_opacity', {
					type = 'range',
					min = 0.1,
					max = 1.0,
					step=0.1,bigStep=0.1,
					width="single",
					set=function(k,v)
						Setter_Simple(k,v)
						GQ:ShowWaypoints()
					end,
					hidden=not DEV,
					_default=1
				})

				AddOption('minimap_maplines_opacity', {
					type = 'range',
					min = 0.1,
					max = 1.0,
					step=0.1,bigStep=0.1,
					width="single",
					set=function(k,v)
						Setter_Simple(k,v)
						GQ:ShowWaypoints()
					end,
					hidden=not DEV,
					_default=1
				})
				AddOption('worldmap_maplines_opacity', {
					type = 'range',
					min = 0.1,
					max = 1.0,
					step=0.1,bigStep=0.1,
					width="single",
					set=function(k,v)
						Setter_Simple(k,v)
						GQ:ShowWaypoints()
					end,
					hidden=not DEV,
					_default=1
				})
				AddOption('maplines_repeat', {
					type = 'toggle',
					width="single",
					hidden=not DEV,
					_default=true
				})
				AddOptionSpace()


				--[[ hidden --]] AddOption('corpsearrow',{
					type = 'toggle',
					disabled = function() return self.db.profile.waypointaddon=="none" end,
					_default = true,
					hidden = true,
					width="double",
				})
				--[[ hidden --]] AddOption('hidearrowwithguide',{
					type = 'toggle',
					--disabled = function() return self.db.profile.waypointaddon=="none" end,
					_default = true,
					hidden = true,
				})

				--AddOption("enable_travel",{type="toggle",_default=true})
			
				AddOptionSep()
				AddOptionSpace()
				AddOption('',{ type = 'description', name=L['opt_group_travelsystem'], font=GQ.font_dialog_gray})
				AddOptionSep()



				AddOption('pathfinding_speed',{
					type = 'select', values={ [1]=L["opt_pathfinding_speed_slow"], [15]=L["opt_pathfinding_speed_medium"], [50]=L["opt_pathfinding_speed_fast"] },
					style = "slider",
					hidden=true,
					_default = 15
				})

				AddOptionSep()
				AddOptionSpace()


				-- make the WHOLE group obey 'pathfinding' for visibility.
				--for k,opt in pairs(self.optiontables['travelsystem']['args']) do if k~="pathfinding" and not opt.hidden then opt.hidden=function() return not self.db.profile.pathfinding end end end
			end
		
		
		end

		AddOptionGroup("debugshare","DebugShare","zgdebugshare", { name="Debug: share", guiHidden = not self.DEV or self.db.profile.hide_dev_once, })
		do
			AddOption('share_toggle',{
				name = function() return GQ.db.profile.share_enabled and "Stop sharing" or "Start sharing" end,
				type = 'execute',
				width="full",
				disabled=function() return not GQ.Sync:IsInGroup() end,
				func=function() GoatQuestFrame_Guides_GuideShareButton_OnClick() end,
			})

			AddOption('share_showparty',{
				type = 'toggle',
				_default = true,
				width="full",
				set = function(i,v) Setter_Simple(i,v)  GQ:UpdateFrame()  end,
				disabled = function() return not self.db.profile.share_enabled end,
			})
			AddOption('share_partydisplaystyle',{
				name = "Party display style:",
				type = 'select',
				values = {
					[1]="Party: |cffff8888Alice|r, |cff00ff00Bob|r",
					[2]="Alice (incomplete), Bob (complete)",
					[3]="Alice [ ], Bob [X]",
					[4]="|cffff8888Alice|r, |cffff8888Bob [1/3]|r, |cff00ff00Charlie|r",
				},
				_default = 4,
				width="double",
			})
			AddOption('share_fakeparty',{
				name = "Fake party:",
				type = 'select',
				values = {
					[0]="Off",
					[1]="Mixed (Alice is done, Bob slacks)",
					[2]="All done",
					[3]="Full house",
					[4]="Random",
					[5]="Me and Myself",
				},
				_default = 0,
				set=function(i,v) Setter_Simple(i,v) GQ.Sync:FakePartyGenerator(v) GQ:UpdateFrame() end,
				width="double",
			})
			AddOptionSpace()
		end

		AddOptionGroup("debugvariants","DebugVariants","zgdebugvaiants", { name="Debug: variants", guiHidden = not self.DEV or self.db.profile.hide_dev_once, })
		do
			AddOption('hidetracker',{ type = 'toggle', set = function(i,v) Setter_Simple(i,v)  GQ.Replacements:UpdateVisibility("force")  end, _default=false, width=200,})
			AddOption('gmshowoptions',{ type = 'toggle', hidden=GQ.GuideOnly, name="Guide Menu variant: show Options in top bar", set = function(i,v) if GQ.GuideOnly then return end Setter_Simple(i,v)  GQ.F.SetVisible(GQ.GuideMenu.MainFrame.Header.Tabs.Options,v)  end, width = "full", _default = false })
			AddOption('gmshowoptionsleft',{ type = 'toggle', hidden=GQ.GuideOnly, name="Guide Menu variant: show Options in left panel", set = function(i,v) if GQ.GuideOnly then return end Setter_Simple(i,v)  GQ.F.SetVisible(GQ.GuideMenu.MainFrame.MenuGuides.Options,v) GQ.F.SetVisible(GQ.GuideMenu.MainFrame.MenuGuides.OptionsDecor,v) end, width = "full", _default = false })
			AddOption('debug_newicons',{ type = 'toggle', name="Use new test icons", width = "full", _default = false })
			AddOption('start_on_closest_waypoint',{ type = 'toggle', width = "full", set=function(i,v) Setter_Simple(i,v) GQ.Pointer:ResetCurrentWaypoint() end, _default = false })
			AddOption('hijack_builtin_waypoint',{ type = 'toggle', width = "full", set=function(i,v) Setter_Simple(i,v) C_Map.ClearUserWaypoint() GQ.Pointer:ResetCurrentWaypoint() end, _default = false })
			AddOption('windowedmap',{ type = 'toggle', width = "full", _default = false })
			AddOption('ga_removeilvl',{name = 'Allow gear suggestions outside of the current item level', type = 'toggle', width = "full", _default = false })

			local fontsizes={7,8,9,10,11,12,13,14,15,17}
			AddOption('nc_toast_textsize',{
				type = 'select',
				values = {[1]=L["opt_framescale_s_small"],[2]="'",[3]="'",[4]="||",[5]="'",[6]="'",[7]="'",[8]="'",[9]="'",[10]=L["opt_framescale_s_large"]},
				style = 'slider',
				set = function(i,v)
					Setter_Simple(i,v)
					self.db.profile.nc_toast_fontsize= fontsizes[v]
				end,
				get = function(i,v)
					for k,v in ipairs(fontsizes) do if self.db.profile.nc_toast_fontsize==v then return k end end
					return 4
				end,
				_default=4,
				width="single",
				_inline=true,
			})

			AddOption('sep00pathf',{ type="header", name="Boat lock" })

			AddOption('debug_librover_boat_arrive',{
				name = "Enter boatlock when arriving at boat starting point",
				type = 'toggle',
				width = "double",
				set = function(i,v) Setter_Simple(i,v) LibRover:UpdateNow() end,
				_default=true,
			})
			AddOption('debug_librover_boat_moves',{
				name = "Enter boatlock when on rocking boat",
				type = 'toggle',
				width = "double",
				set = function(i,v) Setter_Simple(i,v) LibRover:UpdateNow() end,
				_default=false,
			})

			AddOption('debug_librover_boat_loading',{
				name = "Disable boatlock on loading screens",
				type = 'toggle',
				width = "double",
				set = function(i,v) Setter_Simple(i,v) LibRover:UpdateNow() end,
				_default=true,
			})

			AddOption('debug_librover_boat_menu',{
				name = "Disable boatlock on arrow menu",
				type = 'toggle',
				width = "double",
				set = function(i,v) Setter_Simple(i,v) LibRover:UpdateNow() end,
				_default=true,
			})

			AddOption('debug_librover_boat_timedprevent',{
				name = "Prevent relocking for 30s after breaking out of the lock using menu",
				type = 'toggle',
				width = "double",
				set = function(i,v) Setter_Simple(i,v) LibRover:UpdateNow() end,
				_default=true,
			})			

		end
		self.db.profile.hide_dev_once = false
	--end


	AddOptionGroup("dev","Dev","zgdev", { guiHidden=true })
		AddOption('load_im', { type = 'toggle', desc="Enable Inventory Manager", _default = false, set=Setter_Loud })
		AddOption('show_ui', { type = 'toggle', desc="Enable Updated UI", _default = false, set=Setter_Loud })
		AddOption('load_gold', { type = 'toggle', desc="Enable Gold guides", _default = false, set=Setter_Loud })
		AddOption('load_all', { type = 'toggle', desc="Enable all!", _default = false, set=function(info,val) Setter_Loud(info,val) self.db.profile.load_mail=val self.db.profile.load_im=val self.db.profile.load_betaguides=val self.db.profile.load_gold=val self.db.profile.show_ui=val end })
		AddOption('show_gold', { type = 'execute', desc="Show Gold Guide", _default = false, func=function(info,val) GQ.Gold:Show() end })
		AddOption('show_appraiser', { type = 'execute', desc="Show Appraiser", _default = false, func=function(info,val) GQ.Gold.Appraiser:Show() end })
		AddOption('load_mail', { type = 'toggle', desc="Enable Mail Helper", _default = false, set=Setter_Loud })

	if GQ.IsClassic or GQ.IsClassicTBC or GQ.IsClassicWOTLK then
		local extras = GQ.ZTA:SetupConfigExtra()
		for key,v in pairs(extras) do
			for i,opt in pairs(v.args) do
				self.optiontables[key].args[i]=opt
			end
		end
	end

	self.db.profile.hide_dev_once = false
end

-- Some things, if not switched right away on a profile switch, will save the
-- old settings over the new when reloading the game. It's also nice to see
-- things dynamically update themselves on a switch :).
-- Fires in .db callback "OnProfileChanged".
function GQ:ProfileSwitch()
	GQ.Pointer:SetupArrow()

	-- Main frame position and size
	if GQ.db.profile.frame_anchor then
		GQ.F.SetFrameAnchor(GQ.Frame:GetParent(),GQ.db.profile.frame_anchor)
		GQ.Frame:SetScale(GQ.db.profile.framescale)
		GQ:ApplySkin()
	end

	-- Minimap button
	GQ:UpdateMapButton()

	-- Arrow frame position and size
	if GQ.db.profile.anchor_arrow then
		GQ.F.SetFrameAnchor(GQ.Pointer.ArrowFrameCtrl,GQ.db.profile.anchor_arrow)
	end


	-- Gold guide position
	if GQ.Gold and GQ.Gold.FUI and GQ.Gold.FUI:IsShown() and GQ.db.profile.gold_anchor then
		GQ.F.SetFrameAnchor(GQ.Gold.FUI,GQ.db.profile.gold_anchor)
	end

	-- Main frame orientation - up/down
	self:AlignFrame()

	-- Main lock button state
	--local BUTTONTEXTURE = GQ.CurrentSkinStyle:SkinData("TitleButtons")
	--if GQ.db.profile["windowlocked"] then
	--	GQ.F.AssignButtonTexture(GoatQuestFrame_LockButton,BUTTONTEXTURE,4,32)
	--else
	--	GQ.F.AssignButtonTexture(GoatQuestFrame_LockButton,BUTTONTEXTURE,3,32)
	--end

	-- Register world quest profile defaults
	if GQ.WorldQuests then
		GQ.WorldQuests:SetFilters()
	end
end

local defaults = {
	char = {
		starting = true,
		section = 1,
		step = 1,
		completedQuests = {},
		--permaCompletedDailies = {}, -- deprecating this, let's see if it works.
		completedDailies = {},
		debuglog = {},
		
		maint_dostartup = true,
		maint_startup_01 = true,
		maint_startup_pointer= true,
		maint_startup_modules = true,
		maint_startup_loadguides = true,
		maint_startup_final = true,
		maint_startup_startguide = true,
		
		maint_enableprogressbar = true,
		maint_fetchquestdata = true,
		maint_fetchitemdata = true,

		notifcations = {},
		bannedskills = {},
		learnedskills = {},

		guides_history = {},

		cookingMasteries = {},
		RecipesKnown = {},
		goodbadguides = {},
		ignoredguides = {},
		stephistory = {},
		taxis = {},
		badupgrade = { --There are four specs/builds possible.
			[1] = {},
			[2] = {},
			[3] = {},
			[4] = {},
		},
		pointsetsmanual = {},
		timeperlevel = {},
		altqueue = {},
		scoredguides = {},
		ratingfeedbackcache = {},
		ratingscorecache = {},
		reportedupgrades = {},
		talentbuilds = {},
		guideflags = {},
		playerhouse = {},
	},
	factionrealm = {
		characters = {},
		bankdata = {}
	},
	realm = {
		characters = {},
		bankdata = {}
	},
	global = {
		storedguides = { },
		-- instantDailies = {}, -- let's not use this anymore, with GetQuestID available
		
		gold_info_pages = true,  -- default: show info pages

		bannedtoasts = {},
	},
	profile = {
		debug = false,
		debug_flags = {
			["display"]=false, 
			['sticky']={enabled=true,color="ffff5500"},		--orange
			['LibRover']={enabled=true,color="ffffbb00"},		--yellow
			['pointer']={enabled=true,color="ff00ff00"},		--green
			['waypoints']={enabled=true,color="ffc3ff69"},		--light green
			['startup']={enabled=true,color="ffff3300"},		--red
			['popup']={enabled=true,color="ff31f5f2"},		--teal
			['petguides']={enabled=true,color="ff3199f5"},		--blue
			['itemscore']={enabled=true,color="fffefaf7"},		--white
			['step_setup']={enabled=true,color="ffff8caf"},		--peach
			['LibTaxi']={enabled=true,color="ffcb8437"},		--light brown
			['sync']={enabled=true,color="ffcc56fc"},		--purple
			['greenlines']={enabled=true,color="ff0c994a"},		--dark green
			['toasts']={enabled=true,color="ff1761d4"},		--dark blue
			['inventory']={enabled=true,color="ffeef5ff"},		--very light blue, almost white
			['lr_initpath_v']=false 
		},
		--autosizemini = true,
		--minimode = false,
		visible = true,
		ranconfig2 = false,

		-- Talent System
			currentBuild = "None",
			talenticon = true,
			talentpopup = 2,

		levelprogbar="steps", -- level, steps, inventory ~~ Jeremiah

		suggestiondungeonnum={},

		-- convenience
		badupgrade = { --There are four specs possible.
			[1] = {},
			[2] = {},
			[3] = {},
			[4] = {},
		},
		questitemcache = {},

		cvanchor = true,
		hideborder = false, --hidden anyway
		showborder = true,  -- legacy
		nevershowborder = false,
		bordershowdelay = 0.5,
		borderhidedelay = 1.0,
		showbriefsteps = false,
		hidecompletedinbrief = true,
		opacitymain = 1.0,  -- legacy

		framescale = 1.0,  -- legacy
		fontsize = 11,  -- legacy
		fontsecsize = 10,  -- legacy

		actionbar_scale = 1.0,

		--progress=true,
		progresscolor={r=0.0,b=0.0,g=1.0,alpha=0.8},
		--backcolor = {r=0.18,g=0.05,b=0.23,a=0.56},

		--trackchains = true,

		--goalbackobsolete   = {r=0.0,g=0.5,b=0.8,a=0.5},
		--skipobsolete = true,
		--levelsahead = 0,
		--chainskip = true,
		--chainskipcount = 5,

		stickyon = true,
		stickydisplay = 3,
		stickydisplaybool = true,
		stickygoto = true,

		arrowskin = "GoatQuest",
		arrowscale = 1.0,
		corpsearrow = true,


		filternotes = true,
		minimapnotedesc = true,

		waypointaddon = "internal",

		--golddetectiondist = 400,
		--goldreqmode = 3, -- current
		--golddistmode = 1, -- in range

		fullheight = 400,

		completesound = SOUNDKIT.MAP_PING,
		flipsounds = true,

		--colorborder = true,

		-- hidden

		slidebarconfig = {},

		displaymode = "guide",

		dispmodepri = true,
		dispprimary = {showcountsteps=1,hideborder=false,nevershowborder=false,showbriefsteps=false},
		hideprimary = {showcountsteps=1,hideborder=true,nevershowborder=true,showbriefsteps=true},
		dispsecondary = {showcountsteps=1,hideborder=true,nevershowborder=true,showbriefsteps=true,hidecompletedinbrief=true},

		badguidewarning = true,

		fakeskills = {},
		fakereps = {},

		tweaks_domacros = true,

		arrowscale = 1,
		arrowfontsize = 10,
		arrowfontsize_s = 2,

		gold_lowdemand = false,
		gold_farm_itemfilter = "all",
		gold_gather_prof = "all",
		gold_run_type = "all",
		gold_info_page = {
			crafting = true,
			farming = true,
			gathering = true,
			goldrun = true,
			auction = true,
		},

		appraiser_undercut = 1,
		hideguide={},

		previousguide={}, -- stores guide used before loading suggested dungeon guide

		gmfirstpage="1_home",
		gmcolorcode=false,
		gmusecheck=true,
		gmhidecompleted=false,
		gmstarsuggested=false,
		gmnumrecent=30,
		gmsuggestleveling=true,
		gmsuggestdungeons=true,
		gmsuggestdailies=true,
		gmsuggestevents=true,
		gmsuggestprofessions=true,
		gmsuggestpets=true,
		gmsuggestreputations=true,
		gmsuggesttitles=true,
		gmsuggestachievements=true,

		notifiedevents = {},

		knowngossips = {},
		knowngossipsbynpc = {},
		ta_toggle_icons = true,

		WQmode = {},
		WQreward = {},
		WQreputation = {},

		featuredhide = {},
	},
}

function GQ:Options_RegisterDefaults()
	-- apply other-module-dependent defaults.
	defaults.profile.colorantsother=GQ.Pointer.Icons.ant_walk_default
	defaults.profile.colorantstaxi=GQ.Pointer.Icons.ant_taxi_default
	defaults.profile.colorantsship=GQ.Pointer.Icons.ant_ship_default
	defaults.profile.colorantportal=GQ.Pointer.Icons.ant_portal_default
	defaults.profile.colorantsfly=GQ.Pointer.Icons.ant_flying_default
	defaults.profile.colorantssingle=GQ.Pointer.Icons.ant_default

	for k,v in pairs(self.optiontables) do  self:Options_GrabDefaults(v,defaults)  end  -- can work only once, as it CLEARS the _default fields!! (and it has to, as they're non-standard.)
	
	-- dependent defaults
	defaults.profile.autoaccept=defaults.profile.autoacceptturnin
	defaults.profile.autoturnin=defaults.profile.autoacceptturnin

	-- merge in ZTA defaults
	if GQ.ZTA and GQ.ZTA.PrepareConfigDefaults then  for g,o in pairs(GQ.ZTA:PrepareConfigDefaults()) do for k,v in pairs(o) do defaults[g]=defaults[g] or {}; defaults[g][k]=v; end end end

	self.db:RegisterDefaults(defaults)

	-- FORCE OVERRIDES:

	if self.db.profile.arrowskin=="sheen" then self.db.profile.arrowskin="fancy" end
	
	-- Options that are not settable anymore, but are still used:
	self.db.profile.n_nc_numpetguides = 5
	self.db.profile.enable_vendor_tools = true
	--self.db.profile.autogear_protectheirlooms = true
	--self.db.profile.autogear_protectheirlooms_all = true
	self.db.profile.geareffects = true
	self.db.profile.gold_format_white = false

	self.db.profile.gold_tooltips_ah = 2
	self.db.profile.gold_tooltips_shift = true
	self.db.profile.gold_tooltips_guide = 1
	self.db.profile.gold_profitlevel = 0.25

	self.db.profile.n_nc_enabled = true

	if self.db.profile.fake_covenant==-1 then self.db.profile.fake_covenant=false end
	if self.db.profile.fake_covenant_feature_transport==-1 then self.db.profile.fake_covenant_feature_transport=false end

	-- self.db.profile.auction_autoshow_tab = true

	if self.db.char.BakedCache then
		if GQ.db.profile.dumpmapdontcleansv then
			print("Baked cache data found and used.\nRemember to run Baker to save it to data files later!")
		else
			StaticPopup_Show('GOATQUEST_DEFAULT',"Baked cache data found.\nYou should run Baker now,\nif you haven't already.")
			self.db.char.BakedCache = nil
		end
	end

	if self.db.char.LootDumper then
		StaticPopup_Show('GOATQUEST_DEFAULT',"Saved loot guides found.\nYou should get them,\nif you haven't already.")
		self.db.char.LootDumper = nil
		self.db.char.LootDumperFaction = nil
	end

	self.db.char.favourites = self.db.char.favourites or {}


	--self.db.profile.waypointaddon = "internal"
	--self.db.profile.minicons = true

	self.db.profile.stickycolored = false

	local df=self.db.profile.debug_flags
	for flag,flagdata in pairs(df) do if type(flagdata)=="boolean" then df[flag]={enabled=flagdata} end end -- convert
	for dfn,dfd in pairs(df) do  dfd.color=dfd.color or defaults.profile.debug_flags[dfn] and defaults.profile.debug_flags[dfn].color  end-- assign colors, if there weren't any

	self.db.profile.load_mail=true
	self.db.profile.load_im=true
	self.db.profile.load_betaguides=true
	self.db.profile.load_gold=true
	self.db.profile.show_ui=true
	self.db.profile.dispprimary = self.db.profile.dispprimary or {}
	self.db.profile.dispprimary.showborder = true
	self.db.profile.dispprimary.hideborder = false

	--self.db.profile.maplines_thickness=9
	self.db.profile.maplines_thickness=5
	self.db.profile.maplines_animspeed=1.4
	self.db.profile.maplines_dotsize=30
	self.Pointer.Icons.greendotbig.size=self.db.profile.maplines_dotsize
	self.db.profile.maplines_alpha=1
	self.db.profile.maplines_density=1
	self.db.profile.maplines_graphic=1
	self.db.profile.nav_finaldest_circle=1

	self.db.profile.opacitymain = 1

	self.db.char.guidestephistory = self.db.char.guidestephistory or {}

	if self.db.profile.singlecolorants~=nil and not self.db.profile.singlecolorants__renamed then
		self.db.profile.multicolorants = not self.db.profile.singlecolorants
		self.db.profile.singlecolorants=nil
		self.db.profile.singlecolorants__renamed=true
	end

	-- One skin and one arrow: GoatQuest. Starlight, Stealth and the glass variants are gone.
	self.db.profile.skinstyle = "goatquest"
	self.db.profile.arrowskin = "GoatQuest"
	self.db.profile.opacitytoggle = nil
	self.db.profile.arrowskinselect = nil
	self.db.profile.tmp__was_starlight = nil

	-- one-time switch to binary speed setting
	if self.db.profile.pathfinding_comfort~=0 and self.db.profile.pathfinding_comfort~=1 then
		self.db.profile.pathfinding_comfort=0
	end

	if not type(self.db.profile.ta_toggle_icons)=="boolean" then self.db.profile.ta_toggle_icons=true end

	-- auto-guess debug frame, to make it easier.
	-- Meh, too many problems :/
	--[[
	for i=1,10 do
		local name = 'ChatFrame'..i
		if _G[name] and _G[name].name=="GQ" and _G[name]:IsShown() then self.db.profile.debug_frame=name end
	end
	--]]
	if not _G[self.db.profile.debug_frame] then self.db.profile.debug_frame=nil end


	self.db.global.travelmode = self.db.global.travelmode or 3

	-- move statweight from profile to factionrealm/realm
	if not GQ.GuideOnly and not self.db.char.statweightsmoved then
		local altDB = GQ.IsRetail and GQ.db.realm.characters or GQ.db.factionrealm.characters

		altDB[playername] = {statweights={}, gear={}}
		for specnum,specdata in pairs(GQ.ItemScore.Defaults[playerclass]) do
			local prefix = 'gear_'..playerclass..'_'..specnum.."_"
			local prefixnew = specnum.."_"
			for index=1,#GQ.ItemScore.Keywords do
				local stat = GQ.ItemScore.Keywords[index]
				if not stat.multi then
					if self.db.profile[prefix..stat.blizz] then
						altDB[playername].statweights[prefixnew..stat.blizz] = tonumber(self.db.profile[prefix..stat.blizz])
					end
				end
				--self.db.profile[prefix..stat.blizz] = nil 
				-- don't reset, since there may be other characters using that override. 
				-- we will let it die in peace after next savedvars wipe
			end
			self.db.char["gear_"..specnum.."_score"] = true
		end
		self.db.char.statweightsmoved = true
	end

	-- itemscore
	GQ.db.char.gear_selected_build = GQ.db.char.gear_selected_build or 1
	GQ.db.char.gear_active_build = GQ.db.char.gear_active_build or 1

end

function GQ:Options_GrabDefaults(options_tab,defaults)
	if options_tab.args then
		for k,v in pairs(options_tab.args) do
			if v._default~=nil then
				defaults.profile[k]=v._default
				v._default=nil
			elseif v.args then
				self:Options_GrabDefaults(v,defaults)
			end
		end
	end
end

local AceConfigRegistry = LibStub("AceConfigRegistry-3.0-Z")
function GQ:Options_ResetToDefaults(blizname)
	for opttab,optblizname in pairs(self.optiontables_bliznames) do
		if optblizname==blizname then
			ResetToDefaults(opttab)
			AceConfigRegistry:NotifyChange(blizname)
			return
		end
	end
end

function GQ:Options_SetupConfig()
	local AceConfig = LibStub("AceConfig-3.0-Z")

	for i,v in ipairs(self.optiontables_ordered) do
		AceConfig:RegisterOptionsTable(v.blizname, self.optiontables[v.name], v.slash );
	end
end

function GQ:Options_SetupPanels() -- Unused!
	local AceConfigDialog = LibStub("AceConfigDialog-3.0-Z")
	local AceGUI = LibStub("AceGUI-3.0-Z")

	self.optionpanels = {}
	for i,v in ipairs(self.optiontables_ordered) do
		if v.name~="dev" and not self.optiontables[v.name].guiHidden then
			local group = AceGUI:Create("ScrollFrame-Z")
			group:SetName(v, v.parent)
			--panel:SetTitle(name or appName)
			--group:SetUserData("appName", appName)
			--panel:SetCallback("OnShow", FeedToBlizPanel)
			--panel:SetCallback("OnHide", ClearBlizPanel)
			local panel = group.frame
			panel.optiontable = self.optiontables[v.name]
			self.optionpanels[v.name=='main' and '' or v.name] = panel
			--AceConfigDialog.BlizOptions[v.blizname][v.blizname]:SetCallback("default",function(group) GQ:Options_ResetToDefaults(group) end)
		end
	end

	self.db.profile.skipauxsteps = true
	self.db.profile.magickey_bind = ""
	if self.db.profile.autogearframe~= nil then
		self.db.profile.autogearauto = not self.db.profile.autogearframe   self.db.profile.autogearframe = nil
	end
end

function GQ:Options_SetupBlizConfig()
	local AceConfigDialog = LibStub("AceConfigDialog-3.0-Z")

	--InterfaceOptionsFrame:GetRegions():SetColorTexture(0,0,0,0.9) -- make the whole options pane a bit transparent
	AceConfigDialog:SetDefaultSize("GoatQuest", 600, 400)
	self.optionpanels = {}
	for i,v in ipairs(self.optiontables_ordered) do
		if v.name~="dev" and not self.optiontables[v.name].guiHidden then
			local panel = AceConfigDialog:AddToBlizOptions(v.blizname, self.optiontables[v.name].name, v.name~='cover' and self.optiontables.cover.name)
			panel.optiontable = self.optiontables[v.name]
			self.optionpanels[v.name=='main' and '' or v.name] = panel
			AceConfigDialog.BlizOptions[v.blizname][v.blizname]:SetCallback("default",function(group) GQ:Options_ResetToDefaults(group) end)
		end
	end

	self.db.profile.skipauxsteps = true
	self.db.profile.magickey_bind = ""
	if self.db.profile.autogearframe~= nil then
		self.db.profile.autogearauto = not self.db.profile.autogearframe   self.db.profile.autogearframe = nil
	end
end


function GQ:GetCurrentGuideNum()
	if not self.CurrentGuide then return nil end
	for i,data in pairs(GoatQuest.registeredguides) do
		if data.title==self.CurrentGuide.title then return i end
	end
end


function GQ:OpenOptions(v,noretry)
    self.GuideMenu:Show("Options",v)
     -- ugly hack #154 - sliders show in incorrect position when first opening options. any interaction with window fixes them... so lets open the window again.

    local retry = 0
    if GQ.OptionsRetryTimer then 
        GQ:CancelTimer(GQ.OptionsRetryTimer)
        GQ.OptionsRetryTimer = nil
    end

    GQ.OptionsRetryTimer = GQ:ScheduleRepeatingTimer(function() 
        if retry == 5 then 
            GQ:CancelTimer(GQ.OptionsRetryTimer)
            GQ.OptionsRetryTimer = nil
        end
        retry = retry + 1
        self.GuideMenu:Show("Options",v) 
    end, 0)
end

function GQ:RefreshOptions()
	if GQ.GuideMenu.MainFrame and GQ.GuideMenu.MainFrame.WideColumnOptions.AceContainer:IsVisible() then LibStub("AceConfigDialog-3.0-Z"):Open(GQ.GuideMenu.current_option,GQ.GuideMenu.MainFrame.WideColumnOptions.AceContainer) end
end


function GQ:SetOption(cat,cmd)
	LibStub("AceConfigCmd-3.0-Z").HandleCommand(self, "goatquest", "GoatQuest"..(cat~="" and "-"..cat or ""), cmd)
end



-- 2016-09-28 22:23 sinus: Beginning to build a separate options frame.
function GQ:OPTTEST()
	GQ.OPTTEST_F = GQ.ChainCall(CreateFrame("FRAME","GQOPTTEST_F")) :SetSize(700,500) :SetPoint("CENTER",UIParent) :Show() .__END
	GQ.OPTTEST_F.b = GQ.ChainCall(GQ.OPTTEST_F:CreateTexture()) :SetAllPoints() :SetColorTexture(0,0,0,0.5) .__END
	
	GQ.OPTTEST_F.Content = GQ.ChainCall(CreateFrame("FRAME","GQOPTTEST_F2",GQ.OPTTEST_F)) :SetPoint("BOTTOMRIGHT") :SetPoint("TOPLEFT",GQ.OPTTEST_F,"TOPLEFT",200,0) .__END

	local F = GQ.OPTTEST_F
	local C = F.Content
	local SCRF=LibStub("AceGUI-3.0-Z"):Create("ScrollFrame-Z")  SCRF.frame:SetParent(C)  SCRF.frame:SetAllPoints()
	

	local AceConfigDialog = LibStub("AceConfigDialog-3.0-Z")
	local function B_Click(self)
		print("clicked",self.opt_blizname)
		AceConfigDialog:Open(self.opt_blizname,SCRF)
	end
	
	F.groupbuttons = {}
	local lastB
	for i,v in ipairs(self.optiontables_ordered) do
		if v.name~="dev" then
			local B = CreateFrame("BUTTON","GQOPTTESTGROUP"..i,F,"UIPanelButtonTemplate")
			if not lastB then B:SetPoint("TOPLEFT",F,"TOPLEFT") else B:SetPoint("TOPLEFT",lastB,"BOTTOMLEFT") end
			lastB=B
			B.opt_blizname = v.blizname
			B.opt_groupname = v.name~='main' and self.optiontables.main.name

			B:SetText(self.optiontables[v.name].name)
			B:SetWidth(190)
			B:SetScript("OnClick",B_Click)

			tinsert(F.groupbuttons,B)
			
			--local panel = AceConfigDialog:AddToBlizOptions(v.blizname, self.optiontables[v.name].name, v.name~='main' and self.optiontables.main.name)
			--panel.optiontable = self.optiontables[v.name]
			--self.optionpanels[v.name=='main' and '' or v.name] = panel
			--AceConfigDialog.BlizOptions[v.blizname][v.blizname]:SetCallback("default",function(group) GQ:Options_ResetToDefaults(group) end)
		end
	end
end



-- Additional shortcut: /gqway

SLASH_GOATQUESTWAY1 = '/gqway'
SlashCmdList["GOATQUESTWAY"] = function (msg,editbox)  GQ:SetOption("Cover","way "..msg)  end
