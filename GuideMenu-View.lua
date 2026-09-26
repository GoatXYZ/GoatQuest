local name,GQ = ...

-- GLOBAL GoatQuest,ZGW
-- GLOBAL GQ_Override_BD,GQ_Override_BG

local GuideMenu = GQ.GuideMenu

local L = GQ.L
local FONT=GQ.Font
local FONTBOLD=GQ.FontBold
local CHAIN = GQ.ChainCall
local ui = GQ.UI
local SkinData = ui.SkinData

local MAINFRAME_WIDTH=825
local MAINFRAME_HEIGHT=630
local MAINFRAME_HEADER_HEIGHT=40
local MAINFRAME_FOOTER_HEIGHT=24

local HEADER_FONT_SIZE = 14
local SECTION_FONT_SIZE = 14
local MENU_FONT_SIZE = 13
local PAD = 16 -- content padding, as on the viewer panel's body

local FEATURED_COLUMN_WIDTH = 263

-- Sidebar items and header tabs: muted, text colour when hovered or active.
-- These are fallbacks; the skin's GuideMenuItemColor tokens win.
GuideMenu.BUTTONS_NORMAL_COLOR = {0.553,0.576,0.612,1}
GuideMenu.BUTTONS_HIGHLIGHT_COLOR = {0.925,0.918,0.902,1}
GuideMenu.BUTTONS_HIGHLIGHT_BG = {1,1,1,0.06}

local function ItemColor(active)
	return SkinData(active and "GuideMenuItemColorActive" or "GuideMenuItemColor") or (active and GuideMenu.BUTTONS_HIGHLIGHT_COLOR or GuideMenu.BUTTONS_NORMAL_COLOR)
end

local ICON_SIZE=15

local SCROLLTABLE_DATA = {
	ROW_COUNT = 20,
	LIST_WIDTH = 383,
	LIST_HEIGHT = 504,
	POSX = 1,
	POSY = -34,
	STRATA = "DIALOG",
	BORDER = {0,0,0,0},
	BACKGROUND = {0,0,0,0},
	ROWBACKGROUND = false,
	ROW_HEADER = 1,
	HIDESCROLLBAR = true
}
local SCROLLTABLE_COLUMNS = {
	{ title="", width=ICON_SIZE, headerwidth=15, titlej="LEFT", textj="LEFT", name="icon", type="icon",
		texture=function() return GQ.IconSets.GuideIconsSmall.file end,
		textureoffset=function() return GQ.IconSets.GuideIconsSmall['FOLDER'].texcoord end,
		texturecolor={1,1,1,1},
	},
	{ title="", width=300, titlej="LEFT", textj="LEFT", name="title", padding=5 },
	{ title="", width=14, titlej="RIGHT", textj="RIGHT", name="favourite", type="button", iconheight=20, iconwidth=20,padding=0,
		texture=function() return GQ.IconSets.GuideIconsSmall.file end,
		textureoffset=function() return GQ.IconSets.GuideIconsSmall['STAR'].texcoord end,
		tooltip=L['guidemenu_guidetooltips_favourite'],
	},
	{ title="", width=14, titlej="RIGHT", textj="RIGHT", name="loadbutton", type="button", iconheight=14, iconwidth=14,padding=0,
		texture=function() return GQ.ButtonSets.TitleButtons.file end,
		textureoffset=function() return GQ.ButtonSets.TitleButtons['LOADGUIDE'].texcoords[1] end,
		tooltip=L['guidemenu_guidetooltips_loadguide'],
	}
}

GuideMenu.Sections = {
	All={		MenuColumn=true,MenuGuides=true,CenterColumn=true,RightColumn=true,MenuOptions=true,WideColumn=true,WideColumnHome=true,WideColumnOptions=true,FullColumn=true},
	Home={		MenuColumn=true,MenuGuides=true,                                                    WideColumn=true,WideColumnHome=true },
	Featured={	                                                                                                                                               FullColumn=true},		                                   
	Favourites={	MenuColumn=true,MenuGuides=true,CenterColumn=true,RightColumn=true},
	Recent={	MenuColumn=true,MenuGuides=true,CenterColumn=true,RightColumn=true},
	Suggested={	MenuColumn=true,MenuGuides=true,CenterColumn=true,RightColumn=true},
	Search={	MenuColumn=true,MenuGuides=true,CenterColumn=true,RightColumn=true},
	Options={	MenuColumn=true,                                                   MenuOptions=true,WideColumn=true,			WideColumnOptions=true},
	Default={	MenuColumn=true,MenuGuides=true,CenterColumn=true,RightColumn=true},
}
setmetatable(GuideMenu.Sections,{__index=function(self,name) return GuideMenu.Sections.Default end})

local RightColumnSubmenus = {
	General = {
		{"gmcolorcode","toggle"},
		{"gmusecheck","toggle"},
		{"gmhidecompleted","toggle"},
		{"gmstarsuggested","toggle"}
	},
	Suggested = {
		{'gmsuggesttypes',"description"},
		{'gmsuggestleveling',"toggle"},
		{'gmsuggestdungeons',"toggle"},
		{'gmsuggestdailies',"toggle"},
		{'gmsuggestevents',"toggle"},
		{'gmsuggestprofessions',"toggle"},
		{'gmsuggestpets',"toggle"},
		{'gmsuggestreputations',"toggle"},
		{'gmsuggesttitles',"toggle"},
		{'gmsuggestachievements',"toggle"},
		callback=function() GuideMenu:ShowSuggested() GuideMenu:Update() end
	},
	Recent = {
		{"gmnumrecent","select",{5,10,30}},
		callback=function() GuideMenu:ShowRecent() GuideMenu:Update() end
	},
}

for cat,catdata in pairs(RightColumnSubmenus) do
	for _,fielddata in ipairs(catdata) do
		if fielddata[2]=="toggle" then
			local name = fielddata[1]
			fielddata.text = L['opt_'..name]
			fielddata.checked=function() return GQ.db.profile[name] end
			fielddata.func=function() GQ.db.profile[name] = not GQ.db.profile[name] if catdata.callback then catdata.callback() end end
			fielddata.isNotRadio=1
			fielddata.keepShownOnClick=1
		end
		if fielddata[2]=="description" then
			local name = fielddata[1]
			fielddata.text = L['opt_'..name]
			fielddata.notCheckable=1
			fielddata.keepShownOnClick=1
		end
		if fielddata[2]=="select" then
			local name = fielddata[1]
			fielddata.text = L['opt_'..name]
			fielddata.notCheckable=1
			fielddata.keepShownOnClick=1
			for _,value in ipairs(fielddata[3]) do
				table.insert(catdata,{
					text=value, 
					checked=function() return GQ.db.profile[name]==value end,
					func=function() GQ.db.profile[name]=value UIDropDownFork_Refresh(GQ.Frame.Controls.MenuHostGuides) end,
					isNotRadio=1,
					keepShownOnClick=1,
				})
			end
			fielddata.menuList=menuList
		end
	end
end

local faction=UnitFactionGroup("player"):sub(1,1)
local class = UnitClass("player")

local MIN_SEARCH_LENGTH = 3
function GuideMenu:Open(path,iscurrent,...)
	path=self:NormalizePath(path)
	if path=="Search" then
		local searchquery = GuideMenu.MainFrame.MenuGuides.SearchEdit:GetText()
		if searchquery=="Search" or #searchquery < MIN_SEARCH_LENGTH then
			path=self:NormalizePath(GuideMenu.PreviousSection)
		end

		self.search_lastquery = searchquery
	end

	local target=GuideMenu.Sections[path]
	local MainFrame=GuideMenu.MainFrame

	if path~="Search" and path~="QuestSearch" then
		GuideMenu.PreviousSection=path
	end
	GuideMenu.CurrentSection=path

	if iscurrent then 
		GQ.db.profile.gmlastsection="Current"
	elseif path~="Options" and path~="Search" and path~="QuestSearch" then 
		GQ.db.profile.gmlastsection=path
	end

	-- Clear focus when switching tabs
	GuideMenu.FocusedGuide=nil
	GuideMenu.FocusedQuest=nil
	GuideMenu.CurrentRow=nil
	GuideMenu.GuideListOffset=0
	GuideMenu:HideRequestFrame()
	GuideMenu:HideRowMouseOver()

	-- Handle special cases, where we do something else than just showing the guides
	if path:sub(1,4)=="GOLD" then
		if GQ.GuideOnly then return end
		GQ.Goldguide:Initialise()
		if not iscurrent then
			GuideMenu:Hide()
		end
		return
	end

	-- Show and hide proper frames
	for i,v in pairs(GuideMenu.Sections.All) do
		if target[i] then
			MainFrame[i]:Show()
		else
			MainFrame[i]:Hide()
		end
	end

	-- Close all open menus
	CloseDropDownForks()

	-- Highlight proper element in top menu
	for key,v in pairs(MainFrame.Header.Tabs) do
		if path==key or (key=="Guides" and self:IsCategoryAllowed(path) and not iscurrent) or (iscurrent and key=="Current") then
			v:SetFont(FONTBOLD,HEADER_FONT_SIZE)
			v:SetTextColor(unpack(ItemColor(true)))
			v.LeftDecor:SetWidth(v:GetStringWidth()+4)
			v.LeftDecor:Show()
			v:SetLockHighlight(true)
		else
			v:SetFont(FONT,HEADER_FONT_SIZE)
			v:SetTextColor(unpack(ItemColor(false)))
			v.LeftDecor:Hide()
			v:SetLockHighlight(false)
		end
	end

	GuideMenu.CurrentPath=path

	-- Prepare the data
	if path=="Recent" then
		GuideMenu:ShowRecent()
	elseif path=="Suggested" or path=="SUGGESTED" then
		GuideMenu:ShowSuggested()
	elseif path=="Current" then
		GuideMenu:ShowCurrent()
	elseif path=="Home" then
		GuideMenu:ShowHome()
	elseif path=="Featured" then
		GuideMenu:ShowFeatured()
	elseif path=="Options" then
		GuideMenu:ShowOptions(...)
	elseif path=="Search" then
		GuideMenu:Search()
	elseif path=="QuestSearch" then
		GuideMenu:SearchQuest(...)
	elseif path=="Favourites" then
		GuideMenu:ShowFavourites()
	else
		GuideMenu:ShowGuides(path,iscurrent)
	end

	GQ.Widgets:HideAllPopups()
	GuideMenu:Update()
end

function GuideMenu:SetSectionHeader(text,arrow)
	local section = GuideMenu.MainFrame.CenterColumn.SectionInfo
	section.Name:SetText(text)
	if arrow then
		section.Texture:SetWidth(12)
		section.Texture:SetTexture(SkinData("TitleButtons"))
		section.Name:SetPoint("TOPLEFT",section.Texture,"TOPRIGHT",5,0)
	else
		section.Texture:SetWidth(1)
		section.Texture:SetTexture(nil)
		section.Name:SetPoint("TOPLEFT",section.Texture,"TOPRIGHT",-1,0)
		section:SetScript("OnClick", nil)
	end
end

function GuideMenu:SetWideSectionHeader(text)
	GuideMenu.MainFrame.WideColumn.Name:Show()
	GuideMenu.MainFrame.WideColumn.Decor:Show()
	GuideMenu.MainFrame.WideColumn.Name:SetText(text)
end

local SEARCH_TYPING_TIMEOUT=1
local function UpdateHandler(self, event)
	if not GuideMenu.MainFrame then return end
	if not GuideMenu.MainFrame:IsVisible() then return end

	if not GQ.GuideOnly and GuideMenu.MainFrame.WideColumnHome:IsMouseOver() then
		GQ.Widgets:HoverBarShow()
	elseif not GQ.GuideOnly then
		GQ.Widgets:HoverBarHide()
	end

	local search = GuideMenu.MainFrame.MenuGuides.SearchEdit:GetText()
	if GuideMenu.MainFrame.MenuGuides.SearchEdit:HasFocus()
	and time()-(GuideMenu.search_lasttyped or 0)>SEARCH_TYPING_TIMEOUT
	and search~=GuideMenu.search_lastquery
	and search~="Search"  then
		GuideMenu.search_lasttyped = time()
		GuideMenu:Open("Search")
	end

	if not GuideMenu.needToUpdate then return end
	GuideMenu.needToUpdate=false
	GuideMenu:Update()
end

function GuideMenu:ApplySkin()
	local MF = GuideMenu.MainFrame
	if not MF then return end

	-- The GoatQuest skin: the back of the viewer panel. Ink window with a hairline
	-- edge and a 2px gold rule along the top; the sidebar sits on the window's ink,
	-- content on slate, the details pane on ridge. Hairlines divide the header and
	-- the sidebar. Columns stop 1px short of the window edge so its hairline shows.
	local TINYMARGIN = SkinData("GuideMenuTinyMargin")
	local MARGIN = SkinData("GuideMenuMargin")
	local RULE = SkinData("GuideMenuRuleColor")
	local TEXT = SkinData("GuideMenuTextColor") or {1,1,1,1}

	CHAIN(MF)
		:SetBackdrop(SkinData("GuideMenuBackdrop"))
		:SetBackdropColor(unpack(SkinData("GuideMenuBackdropColor")))
		:SetBackdropBorderColor(unpack(SkinData("GuideMenuBackdropBorderColor")))
		:SetWidth(MAINFRAME_WIDTH+MARGIN*2)

	MF.TopRule:SetHeight(SkinData("GuideMenuTopRuleHeight") or 2)
	MF.TopRule:SetVertexColor(unpack(SkinData("GuideMenuTopRuleColor") or SkinData("Accent")))
	MF.HeaderRule:SetVertexColor(unpack(RULE))
	MF.SidebarRule:SetVertexColor(unpack(RULE))

	CHAIN(MF.Header)
		:SetBackdropColor(unpack(SkinData("GuideMenuHeaderFooterBackground")))
		:SetBackdropBorderColor(unpack(SkinData("GuideMenuHeaderFooterBorder")))
		:SetPoint("TOPLEFT",TINYMARGIN,-TINYMARGIN)
		:SetPoint("TOPRIGHT",-TINYMARGIN,TINYMARGIN)

	MF.Header.Wordmark:SetTextColor(unpack(SkinData("Accent")))

	for i,v in pairs(MF.Header.Tabs) do
		v:SetBackdropColor(0,0,0,0)
		v:SetBackdropBorderColor(0,0,0,0)
		v:SetNormalBackdropColor(0,0,0,0)
		v:SetHighlightBackdropColor(0,0,0,0)
		v:SetNormalTextColor(unpack(ItemColor(false)))
		v:SetHighlightTextColor(unpack(ItemColor(true)))
		v:SetHighlight(v.isHighlightLocked,true)
		v.LeftDecor:SetColorTexture(unpack(SkinData("GuideMenuGuideButtonDecorColor")))
	end

	CHAIN(MF.Header.CloseButton:GetHighlightTexture())
		:SetColorTexture(unpack(SkinData("ButtonHighlight")))
		:SetBlendMode("BLEND")
		:SetTexCoord(0,1,0,1)

	CHAIN(MF.CenterColumn)
		:ClearAllPoints()
		:SetPoint("TOPLEFT",MF.MenuColumn,"TOPRIGHT",-TINYMARGIN,0)
		:SetPoint("BOTTOMLEFT",MF.MenuColumn,"BOTTOMRIGHT",-TINYMARGIN,1)
		:SetWidth(386-(2*TINYMARGIN))
		:SetBackdrop(SkinData("GuideMenuContentBackdrop"))
		:SetBackdropColor(unpack(SkinData("GuideMenuContentBackground")))
		:SetBackdropBorderColor(unpack(SkinData("GuideMenuSectionBorder")))

	CHAIN(MF.WideColumn)
		:ClearAllPoints()
		:SetPoint("TOPLEFT",MF.MenuColumn,"TOPRIGHT",-TINYMARGIN,0)
		:SetPoint("BOTTOMRIGHT",MF,"BOTTOMRIGHT",-1-MARGIN,1)
		:SetBackdrop(SkinData("GuideMenuContentBackdrop"))
		:SetBackdropColor(unpack(SkinData("GuideMenuContentBackdropColor")))
		:SetBackdropBorderColor(unpack(SkinData("GuideMenuContentBackdropBorderColor")))

	CHAIN(MF.MenuColumn)
		:SetPoint("TOPLEFT",MF.Header,"BOTTOMLEFT",MARGIN,0)
		:SetBackdrop(SkinData("GuideMenuMenuBackground"))
		:SetBackdropColor(unpack(SkinData("GuideMenuMenuBackgroundColor")))
		:SetBackdropBorderColor(unpack(SkinData("GuideMenuMenuBackdropBorderColor")))

	CHAIN(MF.RightColumn)
		:ClearAllPoints()
		:SetPoint("TOPRIGHT",MF.Header,"BOTTOMRIGHT",-1-MARGIN,0)
		:SetPoint("BOTTOMRIGHT",MF,"BOTTOMRIGHT",-1-MARGIN,1)
		:SetBackdrop(SkinData("GuideMenuDetailsBackdrop"))
		:SetBackdropColor(unpack(SkinData("GuideMenuDetailsBackdropColor")))
		:SetBackdropBorderColor(unpack(SkinData("GuideMenuDetailsBackdropBorderColor")))

	CHAIN(MF.RightColumn.GuideMascot)
		:SetPoint("BOTTOM",0,TINYMARGIN)
		:SetPoint("LEFT",TINYMARGIN,0)
		:SetPoint("RIGHT",-TINYMARGIN,0)

	CHAIN(MF.RightColumn.GuideImage)
		:SetPoint("TOP",0,-TINYMARGIN)
		:SetPoint("LEFT",TINYMARGIN,0)
		:SetPoint("RIGHT",-TINYMARGIN,0)

	MF.RightColumn.GuideTitle:SetTextColor(unpack(SkinData("GuideMenuTitleColor") or TEXT))
	MF.RightColumn.GuideDesc:SetTextColor(unpack(TEXT))
	MF.RightColumn.GuideProgressLabel:SetTextColor(unpack(SkinData("MutedColor") or TEXT))

	local search = MF.MenuGuides.SearchEdit
	search:SetTextColor(unpack(SkinData(search:HasFocus() and "SearchEditTextColorActive" or "SearchEditTextColor")))
	search.SearchGlass:SetVertexColor(unpack(SkinData("SearchEditTextColor")))

	CHAIN(search.back)
		:SetBackdrop(SkinData("SearchBackdrop"))
		:SetBackdropColor(unpack(SkinData("SearchEditBackdropColor")))
		:SetBackdropBorderColor(unpack(SkinData("SearchEditBorderColor")))
		:ClearAllPoints()
		:SetPoint("TOPLEFT",search,"TOPLEFT",-8,4)
		:SetPoint("BOTTOMRIGHT",search,"BOTTOMRIGHT",28,-4)

	-- Section titles (Archivo SemiBold) with a hairline under them.
	for _,decor in ipairs({MF.CenterColumn.SectionInfo.Decor,MF.WideColumn.Decor,MF.FullColumn.Decor}) do
		decor:SetBackdropColor(unpack(RULE))
		decor:SetBackdropBorderColor(0,0,0,0)
	end
	for _,title in ipairs({MF.CenterColumn.SectionInfo.Name,MF.WideColumn.Name,MF.FullColumn.Name}) do
		title:SetTextColor(unpack(SkinData("GuideMenuTitleColor") or TEXT))
	end
	MF.MenuGuides.OptionsDecor:SetVertexColor(unpack(RULE))

	CHAIN(MF.FullColumn)
		:ClearAllPoints()
		:SetPoint("TOP",MF.Header,"BOTTOM")
		:SetPoint("BOTTOM",MF,"BOTTOM",0,1)
		:SetPoint("LEFT",MF,"LEFT",MARGIN+1,0)
		:SetPoint("RIGHT",MF,"RIGHT",-MARGIN-1,0)
		:SetBackdrop(SkinData("GuideMenuContentBackdrop"))
		:SetBackdropColor(unpack(SkinData("GuideMenuContentBackdropColor")))
		:SetBackdropBorderColor(unpack(SkinData("GuideMenuContentBackdropBorderColor")))

	CHAIN(MF.FullColumnFeatured.Dropdown.frame)
		:SetBackdrop(SkinData("GuideMenuFeaturedDropdown"))
		:SetBackdropColor(unpack(SkinData("GuideMenuFeaturedDropdownBackdropColor")))
		:SetBackdropBorderColor(unpack(SkinData("GuideMenuFeaturedDropdownBackdropBorderColor")))

	CHAIN(MF.RightColumn.GuideProgress)
		:SetTexture(SkinData("ProgressBarTextureFile"))
		:SetDecor(SkinData("ProgressBarDecorUse"))
	MF.RightColumn.GuideProgress.Texture:SetVertexColor(unpack(SkinData("ProgressBarTextureColor")))

	CHAIN(GuideMenu.FeaturedTooltip)
		:SetBackdropColor(unpack(SkinData("Ridge")))
		:SetBackdropBorderColor(unpack(SkinData("AceGUIControlBorderColor")))

	-- Guide unavailable: dims the content area, message on a ridge card.
	local ink = SkinData("Ink")
	CHAIN(GuideMenu.MissingPopup)
		:SetBackdrop(SkinData("GuideMenuContentBackdrop"))
		:SetBackdropColor(ink[1],ink[2],ink[3],0.8)
		:SetBackdropBorderColor(0,0,0,0)

	CHAIN(GuideMenu.MissingPopup.Frame)
		:SetBackdropColor(unpack(SkinData("Ridge")))
		:SetBackdropBorderColor(unpack(SkinData("Hairline")))
	GuideMenu.MissingPopup.Text:SetTextColor(unpack(TEXT))

end

-- UIParent dimensions already account for the player's UI scale.
function GuideMenu:FitToScreen()
	local frame=self.MainFrame
	if not frame then return end
	local width,height=UIParent:GetWidth(),UIParent:GetHeight()
	if width and height and width>0 and height>0 then
		frame:SetScale(math.min(1,(width-32)/frame:GetWidth(),(height-32)/frame:GetHeight()))
	end
end

function GuideMenu:CreateFrames()
	-- Main Container
	local MF = CHAIN(ui:Create("Frame", UIParent, "GoatQuest_GuideMenu"))
		:SetSize(MAINFRAME_WIDTH,MAINFRAME_HEIGHT)
		:SetPoint("CENTER",UIParent)
		:SetFrameStrata("DIALOG")
		:CanDrag(true)
		:SetScript("OnUpdate",UpdateHandler)
		:SetScript("OnShow",function() GuideMenu:FitToScreen() end)
		:SetScript("OnHide",function() 
			GuideMenu.UseTab=nil  -- reset tab behaviour to 'add new tab'
			GQ.Widgets:DisableConfig()
		end)
		:Hide()
	.__END
	GuideMenu.MainFrame= MF
	tinsert(UISpecialFrames, "GoatQuest_GuideMenu") -- allows the frame to be closable with ESC keypress

	-- The viewer panel's signature: an accent rule along the full top edge, over the hairline.
	MF.TopRule = CHAIN(MF:CreateTexture(nil,"OVERLAY",nil,7))
		:SetTexture(GQ.SKINSDIR.."white")
		:SetPoint("TOPLEFT",MF,"TOPLEFT",0,0)
		:SetPoint("TOPRIGHT",MF,"TOPRIGHT",0,0)
		:SetHeight(2)
	.__END

	-- Top menu
	MF.Header = CHAIN(ui:Create("Frame", MF))
		:SetPoint("TOPLEFT")
		:SetPoint("TOPRIGHT")
		:SetHeight(MAINFRAME_HEADER_HEIGHT)
		:SetBackdropBorderColor(0,0,0,0)
		.__END

		-- Hairline between the header and the columns, inside the window's edge.
		MF.HeaderRule = CHAIN(MF.Header:CreateTexture(nil,"OVERLAY"))
			:SetTexture(GQ.SKINSDIR.."white")
			:SetPoint("BOTTOMLEFT",MF.Header,"BOTTOMLEFT",1,0)
			:SetPoint("BOTTOMRIGHT",MF.Header,"BOTTOMRIGHT",-1,0)
			:SetHeight(1)
		.__END

		MF.Header.CloseButton = CHAIN(CreateFrame("Button", nil, MF.Header, nil))
			:SetPoint("RIGHT",MF.Header,"RIGHT",-11,0)
			:SetSize(18,18)
			:SetScript("OnClick",function() GuideMenu:Hide() end)
			:SetScript("OnEnter",function(self) self:GetNormalTexture():SetVertexColor(unpack(ItemColor(true))) end)
			:SetScript("OnLeave",function(self) self:GetNormalTexture():SetVertexColor(unpack(ItemColor(false))) end)
		.__END
		GQ.ButtonSets.TitleButtons.CLOSE:AssignToButton(MF.Header.CloseButton)
		MF.Header.CloseButton:GetNormalTexture():SetVertexColor(unpack(ItemColor(false)))

		MF.Header.Wordmark = CHAIN(MF.Header:CreateFontString())
			:SetPoint("LEFT",MF.Header,"LEFT",16,0)
			:SetFont(FONTBOLD,18)
			:SetTextColor(1,0.75,0.22,1)
			:SetText("GoatQuest")
		.__END
		MF.Header.Tabs={}
		local previous
		for _,tab in ipairs({{"Guides","LEVELING"},{"Current","Current"},{"Recent","Recent"}}) do
			local label,path=tab[1],tab[2]
			local button=CHAIN(ui:Create("Button",MF.Header))
				:SetSize(80,24)
				:SetFont(FONT,HEADER_FONT_SIZE)
				:SetText(label)
				:SetScript("OnClick",function() GuideMenu:Open(path) end)
			.__END
			if previous then button:SetPoint("LEFT",previous,"RIGHT",8,0)
			else button:SetPoint("LEFT",MF.Header.Wordmark,"RIGHT",24,0) end
			MF.Header.Tabs[label]=button
			previous=button
		end

		local function HeaderButton_SetHighlight(button,tf,force)
			if not force and button.isHighlightLocked then return end
			button:SetTextColor(unpack(tf and button.HighlightTextColor or button.NormalTextColor))
		end

		local function HeaderButton_SetNormalTextColor(button,r,g,b,a)
			button.NormalTextColor={r,g,b,a}
			button:SetTextColor(r,g,b,a)
		end

		local function HeaderButton_SetHighlightTextColor(button,r,g,b,a)
			button.HighlightTextColor={r,g,b,a}
		end

		local function HeaderButton_SetLockHighlight(button,tf)
			button:SetHighlight(tf,true)
			button.isHighlightLocked = tf
		end

		for i,button in pairs(MF.Header.Tabs) do
			button.SetHighlight = HeaderButton_SetHighlight
			button.SetNormalTextColor = HeaderButton_SetNormalTextColor
			button.SetHighlightTextColor = HeaderButton_SetHighlightTextColor
			button.SetLockHighlight = HeaderButton_SetLockHighlight
			CHAIN(button)
				:SetNormalTextColor(unpack(ItemColor(false)))
				:SetHighlightTextColor(unpack(ItemColor(true)))
				:SetScript("OnEnter",function(button) button:SetHighlight(true) end)
				:SetScript("OnLeave",function(button) button:SetHighlight(false) end)

			-- Active tab: a 2px accent bar sitting on the header's hairline.
			button.LeftDecor = CHAIN(button:CreateTexture(nil,"OVERLAY"))
				:SetHeight(2)
				:SetWidth(button:GetStringWidth()+4)
				:SetPoint("BOTTOM",button,"BOTTOM",0,-(MAINFRAME_HEADER_HEIGHT-button:GetHeight())/2)
				:SetColorTexture(unpack(SkinData("GuideMenuGuideButtonDecorColor")))
				--:Hide()
			.__END

		end


	--[[
	MF.Footer = CHAIN(ui:Create("Frame",MF))
		:SetPoint("TOPLEFT",MF,"BOTTOMLEFT",0,MAINFRAME_FOOTER_HEIGHT)
		:SetPoint("TOPRIGHT",MF,"BOTTOMRIGHT",0,MAINFRAME_FOOTER_HEIGHT)
		:SetHeight(MAINFRAME_FOOTER_HEIGHT)
		:SetFrameLevel(MF:GetFrameLevel()+1)
		:SetToplevel(true)
		.__END
		MF.FooterVersion = CHAIN(MF.Footer:CreateFontString())
			:SetFont(FONTBOLD,12)
			:SetText("VER:")
		.__END

		MF.FooterVersionVal = CHAIN(MF.Footer:CreateFontString())
			:SetPoint("LEFT",MF.FooterVersion ,"RIGHT",5,0)
			:SetFont(FONT,12)
			:SetText(GQ.version)
		.__END
		
		--MF.FooterSettingsButton = CHAIN(CreateFrame("Button",nil,MF.Footer))
		--	:SetSize(15,15)
		--	:SetScript("OnClick",function() GuideMenu:Open("Options") end)
		--.__END
		--GQ.F.AssignButtonTexture(MF.FooterSettingsButton,(SkinData("TitleButtons")),5,32)
	--]]

	MF.MenuColumn = CHAIN(ui:Create("Frame", MF))
		:SetPoint("TOPLEFT",MF.Header,"BOTTOMLEFT")
		:SetPoint("BOTTOMLEFT",MF)
		:SetWidth(222)
		.__END

		-- Hairline between the sidebar and the content; hidden with the sidebar.
		MF.SidebarRule = CHAIN(MF.MenuColumn:CreateTexture(nil,"OVERLAY"))
			:SetTexture(GQ.SKINSDIR.."white")
			:SetPoint("TOPRIGHT",MF.MenuColumn,"TOPRIGHT",0,0)
			:SetPoint("BOTTOMRIGHT",MF.MenuColumn,"BOTTOMRIGHT",0,1)
			:SetWidth(1)
		.__END

		MF.MenuGuides = CHAIN(CreateFrame("Frame", nil, MF.MenuColumn))
			:SetPoint("TOPLEFT")
			:SetPoint("BOTTOMRIGHT")
			.__END
			local function set_empty(self)
				if self:GetText():lower()=="" then self:SetText("Search") end 
				self:SetTextColor(unpack(SkinData("SearchEditTextColor")))
			end
			local function set_not_empty(self)
				if self:GetText():lower()=="search" then self:SetText("") end 
				self:SetTextColor(unpack(SkinData("SearchEditTextColorActive")))
			end

			MF.MenuGuides.SearchEdit = CHAIN(ui:Create("EditBox",MF.MenuGuides))
				:SetPoint("TOPLEFT",MF.MenuGuides,"TOPLEFT",PAD+8,-PAD)
				:SetSize(222-2*PAD-8-28,18)
				:SetFont(GQ.Font,MENU_FONT_SIZE,"")
				:SetScript("OnEnterPressed",function() MF.MenuGuides.SearchEdit:ClearFocus() GuideMenu:Open("Search") GuideMenu:SearchHistory_Commit() end)
				:HookScript("OnEscapePressed",function(self) self:SetText("") self:ClearFocus() GuideMenu:Open(GuideMenu.PreviousSection or "LEVELING") end)
				--:SetScript("OnTextChanged",function(edit,user) if user then GuideMenu:Open("Search") end end)
				:SetScript("OnEditFocusGained",function(self) self:HighlightText() set_not_empty(self) end)
				:SetScript("OnEditFocusLost",function(self) self:HighlightText(0,0) set_empty(self) end)
				:SetText("Search")
			.__END

			MF.MenuGuides.SearchEdit.SearchGlass = CHAIN(MF.MenuGuides.SearchEdit:CreateTexture())
				:SetPoint("RIGHT",MF.MenuGuides.SearchEdit.back,-8,0):SetSize(12,12)
				:SetTexture(GQ.DIR.."\\Skins\\search")
			.__END
			
			GuideMenu:PrepareGuidesMenuButtons()

			MF.MenuGuides.Options = GuideMenu:MakeMenuButton("ButtonOptions","Settings",SkinData("TitleButtons"),5,64,1,4)
			MF.MenuGuides.Options:SetPoint("BOTTOMLEFT",MF.MenuGuides,"BOTTOMLEFT",0,10)
			MF.MenuGuides.Options:SetScript("OnClick", function() GuideMenu:Open("Options") end)

			MF.MenuGuides.OptionsDecor = CHAIN(MF.MenuGuides:CreateTexture())
				:SetTexture(GQ.DIR.."\\Skins\\white")
				:SetPoint("BOTTOMLEFT",MF.MenuGuides.Options,"TOPLEFT",PAD,10)
				:SetSize(222-2*PAD,1)
				:SetVertexColor(unpack(SkinData("GuideMenuRuleColor")))
			.__END
			--if not GQ.db.profile.gmshowoptionsleft then MF.MenuGuides.Options:Hide() MF.MenuGuides.OptionsDecor:Hide() end

		MF.MenuOptions = CHAIN(CreateFrame("Frame", "GQ_Menu_OptionsList", MF.MenuColumn))
			:SetPoint("TOPLEFT")
			:SetPoint("BOTTOMRIGHT")
			:Hide()
			.__END



	MF.CenterColumn = CHAIN(ui:Create("Frame", MF))
		:SetPoint("TOPLEFT",MF.MenuColumn,"TOPRIGHT",0,0)
		:SetPoint("BOTTOMLEFT",MF.MenuColumn,"BOTTOMRIGHT",0,1)
		:SetWidth(382)
		:SetBackdropBorderColor(0,0,0,0)
		.__END

		MF.CenterColumn.SectionInfo = CHAIN(CreateFrame("Button",nil))
			:SetHeight(22)
			:SetParent(MF.CenterColumn)
			:SetPoint("TOP")
			:SetPoint("LEFT")
			:SetPoint("RIGHT")
			.__END
			local SectionInfo=MF.CenterColumn.SectionInfo
			SectionInfo.Texture = CHAIN(SectionInfo:CreateTexture(nil,"ARTWORK")) 
				:SetSize(12,12) 
				:SetTexture(GQ.ButtonSets.TitleButtons.file)
				:SetTexCoord(unpack(GQ.ButtonSets.TitleButtons['STEP_PREV'].texcoords[1]))
				:SetPoint("TOPLEFT",SectionInfo,"TOPLEFT",10,-10)
				.__END

			SectionInfo.Name = CHAIN(SectionInfo:CreateFontString())
				:SetFont(FONTBOLD,SECTION_FONT_SIZE)
				:SetJustifyH("LEFT")
				:SetPoint("TOPLEFT",SectionInfo.Texture,"TOPRIGHT",5,2)
				:SetPoint("RIGHT",SectionInfo,"RIGHT",-34,0)
				:SetWordWrap(false)
				:SetText("No section selected")
				.__END

			SectionInfo.Decor = CHAIN(ui:Create("Frame",SectionInfo,nil))
				:SetPoint("TOPLEFT",SectionInfo,"BOTTOMLEFT",0,-10)
				:SetSize(379,1)
				:SetFrameLevel(SectionInfo:GetFrameLevel()+3)
				:SetBackdropColor(unpack(SkinData("GuideMenuRuleColor")))
				:SetBackdropBorderColor(0,0,0,0)
			.__END

		SectionInfo.SettingsButton = CHAIN(CreateFrame("Button",nil,SectionInfo,"GQ_DefaultSkin_TitleButton_Template"))
			:SetScript("OnClick",function() GuideMenu:ToggleSectionMenu() end)
			:SetPoint("RIGHT",-5,-6)
			.__END
		SectionInfo.SettingsButton.buttonkey = "DOTS"
		SectionInfo.SettingsButton:ApplySkin()

		SectionInfo.SettingsButton:GetNormalTexture():SetRotation(1.57079633) -- 90 degree in radians
		SectionInfo.SettingsButton:GetPushedTexture():SetRotation(1.57079633) -- 90 degree in radians
		SectionInfo.SettingsButton:GetHighlightTexture():SetRotation(1.57079633) -- 90 degree in radians
		SectionInfo.SettingsButton:GetDisabledTexture():SetRotation(1.57079633) -- 90 degree in radians

		MF.GuideListScrollFrame= ui:Create("ScrollTable",MF.CenterColumn,"GQ_GuideScrollTable",SCROLLTABLE_COLUMNS,SCROLLTABLE_DATA)
		MF.GuideListScrollFrame:SetScript("OnMouseWheel", function(self,delta)
			GuideMenu.GuideListOffset=GuideMenu.GuideListOffset-delta
			GuideMenu.needToUpdate=true
		end)
		MF.GuideListScrollFrame.scrollbar:SetScript("OnVerticalScroll",function(me,offset)
			GuideMenu.GuideListOffset=math.round(offset)
			GuideMenu.needToUpdate=true
		end)


		local function load_button_onclick(row)
			if not row then return end
			if row.guide then
				GuideMenu:ActivateGuide(row.guide)
			elseif row.quest then
				GuideMenu:Open("QuestSearch",false,row.quest.questid)
			end
		end
		
		for _,row in pairs(MF.GuideListScrollFrame.rows) do
			-- adjust elements positions
			row.icon:ClearAllPoints()
			row.icon:SetPoint("BOTTOMLEFT",row,"BOTTOMLEFT",9,4)
			row.title:SetPoint("BOTTOMLEFT",row.icon,"BOTTOMRIGHT",0,1) 
			row.loadbutton:ClearAllPoints()
			row.loadbutton:SetPoint("BOTTOMRIGHT",row,"BOTTOMRIGHT",-5,5)
			row.favourite:ClearAllPoints()
			row.favourite:SetPoint("RIGHT",row.loadbutton,"LEFT",-5,0)

			-- add mouseover scripts
			row:SetScript("OnEnter",function() GuideMenu:ShowRowMouseOver(row) GuideMenu.CurrentRow=row end)
			row:SetScript("OnLeave",function() GuideMenu:HideRowMouseOver(row) GuideMenu.CurrentRow=nil end)

			local load_button_onenter=row.loadbutton:GetScript("OnEnter")
			local load_button_onleave=row.loadbutton:GetScript("OnLeave")
			row.loadbutton:SetScript("OnEnter",function(but) row:GetScript("OnEnter")(row) load_button_onenter(but) end)
			row.loadbutton:SetScript("OnLeave",function(but) row:GetScript("OnLeave")(row) load_button_onleave(but) end)
			row.loadbutton:SetScript("OnClick",function(but) load_button_onclick(row) end)
			row.loadbutton:Hide()

			local favourite_button_onenter=row.favourite:GetScript("OnEnter")
			local favourite_button_onleave=row.favourite:GetScript("OnLeave")
			row.favourite:SetScript("OnEnter",function(but) row:GetScript("OnEnter")(row) favourite_button_onenter(but) end)
			row.favourite:SetScript("OnLeave",function(but) row:GetScript("OnLeave")(row) favourite_button_onleave(but) end)
			row.favourite:SetScript("OnClick",function(but) if row.guide then row.guide:ToggleFavourite() GuideMenu:Update() end end)
			row.favourite:Hide()

			row:SetHighlightBackdropColor(unpack(SkinData("ButtonHighlight")))

			-- add suggested icon overlay and animation
			row.iconover = CHAIN(row:CreateTexture()) 
				:SetPoint("CENTER",row.icon,"CENTER",3,-3) 
				:SetSize(17,17) 
				:SetDrawLayer("ARTWORK",1)
				:SetTexture(GQ.IconSets.GuideIconsSmall.file)
				:SetTexCoord(unpack(GQ.IconSets.GuideIconsSmall['STAR'].texcoord))
			 .__END
			row.iconover.anim = CHAIN(row.iconover:CreateAnimationGroup()) 
				:SetLooping("REPEAT") .__END
			CHAIN(row.iconover.anim:CreateAnimation("SCALE")) 
				:SetScale(1.4,1.4) 
				:SetDuration(0.5) 
				:SetSmoothing("OUT")
			CHAIN(row.iconover.anim:CreateAnimation("SCALE")) 
				:SetScale(0.7143,0.7143) 
				:SetDuration(0.5) 
				:SetSmoothing("IN")
		end

	MF.WideColumn = CHAIN(ui:Create("Frame", MF))
		:SetPoint("TOPLEFT",MF.MenuColumn,"TOPRIGHT",0,0)
		:SetPoint("BOTTOMRIGHT",MF,"BOTTOMRIGHT",-1,1)
		:SetBackdropBorderColor(0,0,0,0)
		:Hide()
		.__END

		-- Section title (e.g. "Guide Viewer") in SemiBold with a hairline under it.
		MF.WideColumn.Name = CHAIN(MF.WideColumn:CreateFontString())
			:SetFont(FONTBOLD,SECTION_FONT_SIZE)
			:SetJustifyH("LEFT")
			:SetPoint("TOPLEFT",MF.WideColumn,"TOPLEFT",PAD,-12)
			:SetWidth(602-2*PAD)
			:SetWordWrap(false)
			:SetText("No section selected")
			.__END

		MF.WideColumn.Decor = CHAIN(ui:Create("Frame",MF.WideColumn,nil))
			:SetPoint("TOPLEFT",MF.WideColumn.Name,"BOTTOMLEFT",0,-9)
			:SetSize(602-2*PAD,1)
			:SetFrameLevel(MF.WideColumn:GetFrameLevel()+3)
			:SetBackdropColor(unpack(SkinData("GuideMenuRuleColor")))
			:SetBackdropBorderColor(0,0,0,0)
		.__END

		MF.WideColumnHomeInner = CHAIN(CreateFrame("Frame", nil, MF.WideColumn))
			:SetPoint("TOPLEFT")
			:SetPoint("BOTTOMRIGHT")
			:SetWidth(600)
			:SetHeight(100)
		.__END

		MF.WideColumnHome = CHAIN(ui:Create("ScrollChild",MF.WideColumn, nil, MF.WideColumnHomeInner))
			:SetPoint("TOPLEFT")
			:SetPoint("BOTTOMRIGHT",-16,1)
			:Hide()
			.__END
		MF.WideColumnHome:SetHideWhenUseless(true)

		-- The option widgets line up with the title: the container adds 10.
		MF.WideColumnOptions = CHAIN(CreateFrame("Frame", "GQ_Menu_OptionsDetails", MF.WideColumn))
			:SetPoint("TOPLEFT",MF.WideColumn.Decor,"BOTTOMLEFT",-10,-8)
			:SetPoint("BOTTOMRIGHT",-6,6)
			:Hide()
			.__END

		MF.WideColumnOptions.AceContainer = LibStub("AceGUI-3.0-Z"):Create("ScrollFrame-Z")
		MF.WideColumnOptions.AceContainer.type="SimpleGroup-Z"  -- I hate myself. AceConfigDialog would make a new ScrollFrame inside our perfectly good ScrollFrame, breaking it to hell, because it's not a *Group. So... this ScrollFrame has to masquerade as a SimpleGroup.
		MF.WideColumnOptions.AceContainer.frame:SetParent(MF.WideColumnOptions)
		MF.WideColumnOptions.AceContainer.frame:SetPoint("TOPLEFT",MF.WideColumnOptions,"TOPLEFT",10,0)
		MF.WideColumnOptions.AceContainer.frame:SetPoint("BOTTOMRIGHT")

	MF.FullColumn = CHAIN(ui:Create("Frame", MF))
		:SetPoint("TOP",MF.Header,"BOTTOM")
		:SetPoint("BOTTOM",MF)
		:SetPoint("LEFT",MF,SkinData("GuideMenuMargin"),0)
		:SetPoint("RIGHT",MF,-SkinData("GuideMenuMargin"),0)
		:SetBackdropBorderColor(0,0,0,0)
		:Hide()
		.__END
		MF.FullColumn.Name = CHAIN(MF.FullColumn:CreateFontString())
			:SetFont(FONTBOLD,SECTION_FONT_SIZE)
			:SetJustifyH("LEFT")
			:SetPoint("TOPLEFT",MF.FullColumn,"TOPLEFT",PAD,-12)
			:SetWidth(600)
			:SetWordWrap(false)
			:SetText("No section selected")
			.__END

		MF.FullColumn.Decor = CHAIN(ui:Create("Frame",MF.FullColumn,nil))
			:SetPoint("TOPLEFT",MF.FullColumn.Name,"BOTTOMLEFT",0,-9)
			:SetSize(823-2*PAD,1)
			:SetFrameLevel(MF.FullColumn:GetFrameLevel()+3)
			:SetBackdropColor(unpack(SkinData("GuideMenuRuleColor")))
			:SetBackdropBorderColor(0,0,0,0)
		.__END

		MF.FullColumnFeaturedInner = CHAIN(GQ.CreateFrameWithBG("Frame", "Featured_Content", MF))
			:SetPoint("TOPLEFT")
			:SetPoint("BOTTOMRIGHT")
			:SetWidth(825)
			:SetHeight(200)
			:SetBackdropColor(1,1,1,1)
		.__END

		MF.FullColumnFeatured = CHAIN(ui:Create("ScrollChild",MF.FullColumn, nil ,MF.FullColumnFeaturedInner))
			:SetPoint("TOPLEFT",MF.FullColumn.Decor,"BOTTOMLEFT",-PAD,-1)
			:SetPoint("BOTTOMRIGHT",-16,1)
			:SetBackdropColor(1,1,0,1)
			:SetHeight(200)
			.__END
		MF.FullColumnFeatured:SetHideWhenUseless(true)

		MF.FullColumnFeatured.Dropdown = CHAIN(ui:Create("DropDown",MF.FullColumn,2,MF.FullColumn:GetFrameLevel()+2))
			:SetPoint("TOPRIGHT",MF.FullColumn,"TOPRIGHT",-PAD,-8)
			:SetSize(200,20)
		.__END

		for i,dataset in ipairs(GuideMenu.Featured) do
			local item = MF.FullColumnFeatured.Dropdown:AddItem(dataset.title,dataset.group,function(item)
				GuideMenu:ShowFeatured(item.userdata.value)
				GQ.db.char.lastfeatured = item.userdata.value
			end)
		end
		if GQ.db.char.lastfeatured then
			MF.FullColumnFeatured.Dropdown:SetCurrentSelectedByValue(GQ.db.char.lastfeatured)
		else
			MF.FullColumnFeatured.Dropdown:SetCurrentSelectedByValue(GuideMenu.Featured[1].group)

		end
	
	MF.RightColumn = CHAIN(ui:Create("Frame", MF))
		:SetPoint("TOPRIGHT",MF.Header,"BOTTOMRIGHT")
		:SetPoint("BOTTOMRIGHT",MF)
		:SetWidth(219)
		.__END


		MF.RightColumn.GuideImage = CHAIN(MF.RightColumn:CreateTexture(nil,"ARTWORK")) 
			:SetHeight(139) 
			:SetPoint("TOP",0,-1) 
			:SetPoint("LEFT",1,0) 
			:SetPoint("RIGHT",-1,0) 
			:SetTexture(nil)
			:SetTexCoord(0,220/256,0,139/256)
		.__END

		MF.RightColumn.GuideMascot = CHAIN(MF.RightColumn:CreateTexture(nil,"ARTWORK")) 
			:SetHeight(289) 
			:SetPoint("BOTTOM",0,1) 
			:SetPoint("LEFT",1,0) 
			:SetPoint("RIGHT",-1,0) 
			:SetTexture(nil)
			:SetTexCoord(0,220/256,0,289/512)
		.__END

		if GQ.GuideOnly then
			MF.RightColumn.GuideMascot:Hide()
			MF.RightColumn.GuideImage:SetTexture(nil)
		end

		MF.RightColumn.GuideModel = CHAIN(CreateFrame("PlayerModel",nil,MF.RightColumn,"GoatQuestPlayerModel"))
			:SetHeight(139) 
			:SetPoint("TOP") 
			:SetPoint("LEFT",0,0) 
			:SetPoint("RIGHT",-1,0) 
			:SetAutoRotation(0.4)
		.__END

		MF.RightColumn.GuideTitle = CHAIN(MF.RightColumn:CreateFontString())
			:SetPoint("TOPLEFT",MF.RightColumn.GuideImage,"BOTTOMLEFT",10,-12)
			:SetFont(FONTBOLD,13)
			:SetText()
			:SetWidth(199)
			:SetJustifyH("left")
			:Hide()
		.__END

		MF.RightColumn.GuideDesc = CHAIN(MF.RightColumn:CreateFontString())
			:SetPoint("TOPLEFT",MF.RightColumn.GuideTitle,"BOTTOMLEFT",0,-10)
			:SetFont(FONT,12)
			:SetText()
			:SetWidth(199)
			:SetJustifyH("left")
			:Hide()
		.__END

		MF.RightColumn.GuideProgressLabel = CHAIN(MF.RightColumn:CreateFontString())
			:SetPoint("TOPLEFT",MF.RightColumn.GuideDesc,"BOTTOMLEFT",0,-10)
			:SetFont(FONT,12)
			:SetText("Progress:")
			:SetWidth(199)
			:SetJustifyH("left")
			:Hide()
		.__END
		MF.RightColumn.GuideProgress = CHAIN(ui:Create("ProgressBar",MF.RightColumn))
			:SetSize(199,7)
			:SetFrameLevel(MF.RightColumn:GetFrameLevel()+3)
			:SetPoint("TOPLEFT",MF.RightColumn.GuideProgressLabel,"BOTTOMLEFT",0,-12)
			:SetDecor(SkinData("ProgressBarDecorUse"))
			:SetAnim(false)
			:Hide()
		.__END

		MF.RightColumn.RightColumnMenu = CreateFrame("FRAME",MF,nil,"UIDropDownForkTemplate")

	if GQ.DEV then
		MF.GuidePathExport = CHAIN(ui:Create("EditBox",MF))
			:SetPoint("BOTTOM",MF,"BOTTOM",0,3)
			:SetWidth(350)
			:SetTextColor(1,1,1,1)
			:SetBackdropColor(0,0,0,1)
			:SetBackdropBorderColor(0.3,0.3,0.3,1)
			:SetScript("OnEditFocusLost",function(self)
				self:HighlightText(0,0)
			end)
			:SetScript("OnEditFocusGained",function(self)
				self:HighlightText()
			end)
			:Hide()
		.__END
		if GQ.db.profile.debug_display then
			MF.GuidePathExport:Show()
		end
	end

	GuideMenu.FeaturedTooltip = CHAIN(ui:Create("Frame", MF))
		:SetFrameStrata("DIALOG")
		:SetFrameLevel(20)
		:SetBackdropColor(0,0,0,1)
		:SetBackdropBorderColor(0.3,0.3,0.3,1)
		:SetWidth(260)
		.__END
	GuideMenu.FeaturedTooltip.GuideModel = CHAIN(CreateFrame("PlayerModel",nil,GuideMenu.FeaturedTooltip,"GoatQuestPlayerModel"))
		:SetHeight(100) 
		:SetWidth(100) -- updated in parser.item.ontooltip
		:SetPoint("TOPLEFT",10,0) 
		:SetAutoRotation(0.4)
		:Hide()
	.__END
	GuideMenu.FeaturedTooltip.Text = CHAIN(GuideMenu.FeaturedTooltip:CreateFontString())
		:SetFont(FONT,12)
		:SetWordWrap(true)
		:SetWidth(260) -- updated in parser.item.ontooltip
		:SetPoint("RIGHT",-5,0)
		:SetJustifyH("LEFT")
		.__END

	GuideMenu.MissingPopup = CHAIN(GQ.CreateFrameWithBG("Button", nil, GuideMenu.MainFrame))
		--:SetAllPoints()
		:SetPoint("LEFT",GuideMenu.MainFrame.MenuColumn,"RIGHT")
		:SetPoint("RIGHT")
		:SetPoint("BOTTOM")
		:SetPoint("TOP",GuideMenu.MainFrame.Header,"BOTTOM")
		:SetFrameLevel(10)
		:EnableMouse(true)
		:SetScript("OnMousewheel",function() return false end) -- have own handler, so the event does not get propagated
		:SetScript("OnShow",function() GuideMenu.MainFrame.MenuGuides.SearchEdit:ClearFocus() end)
		:SetScript("OnClick",function() GuideMenu.MissingPopup:Hide() end)
		:Hide()
	.__END
		GuideMenu.MissingPopup.Frame = CHAIN(ui:Create("Frame", GuideMenu.MissingPopup))
			:SetPoint("CENTER")
			:SetWidth(400)
			:SetHeight(200)
			.__END
			GuideMenu.MissingPopup.Text = CHAIN(GuideMenu.MissingPopup.Frame:CreateFontString())
					:SetFont(FONT,14)
				:SetJustifyH("CENTER")
				:SetPoint("CENTER")
				:SetWidth(380)
				:SetWordWrap(true)
				:SetText(L["guidemenu_missing_popup"])
				.__END

	GQ:AddMessageHandler("SKIN_UPDATED",GuideMenu.ApplySkin)
	GuideMenu:ApplySkin()
	GuideMenu:FitToScreen()
end

function GuideMenu:ExportPath(row)
	if row.guide then
		GuideMenu.MainFrame.GuidePathExport:SetText(row.guide.title:gsub("\\","\\\\"))
	elseif row.group then
		GuideMenu.MainFrame.GuidePathExport:SetText(row.group.fullpath:gsub("\\","\\\\"))
	end

	if ZGW.MainFrame.Subframes_whatsnew then
		ZGW.MainFrame.Subframes_whatsnew.edit_GuideSearch:SetText(GuideMenu.MainFrame.GuidePathExport:GetText())
	else
		GuideMenu.MainFrame.GuidePathExport:SetFocus()
		GuideMenu.MainFrame.GuidePathExport:HighlightText()
	end
end

local function MenuButton_SetHighlight(button,tf,force)
	if not force and button.isHighlightLocked then return end
	local color = tf and button.caption.HighlightTextColor or button.caption.NormalTextColor
	button.caption:SetTextColor(unpack(color))
	if button.texture then
		GQ.F.SetSpriteTexCoord(button.texture,unpack(tf and button.spritecoords_hilite or button.spritecoords))
		button.texture:SetVertexColor(unpack(color))
	end
end

local function MenuButton_SetHighlightSprite(button,x,w,y,h)
	button.spritecoords_hilite = {x,w,y,h}
end

local function MenuButton_SetLockHighlight(button,tf)
	button:SetHighlight(tf,true)
	button.isHighlightLocked = tf
	button.LeftDecor:SetShown(tf)
	button.ActiveFill:SetShown(tf)
end

local function MenuButton_SetNormalTextColor(button,r,g,b,a)
	button.caption.NormalTextColor={r,g,b,a}
	button.caption:SetTextColor(r,g,b,a)
end

local function MenuButton_SetHighlightTextColor(button,r,g,b,a)
	button.caption.HighlightTextColor={r,g,b,a}
end

function GuideMenu:MakeMenuButton(name,caption,texture,x,w,y,h)
	local parent = GuideMenu.MainFrame.MenuGuides
	local but = CHAIN(CreateFrame("Button"))
		:SetSize(222,24)
		:SetFrameLevel(4)
		:SetParent(parent)
	.__END
	
	if texture then
		-- Icons are drawn in the item's text colour (one accent in the UI: the gold marker).
		but.texture = CHAIN(but:CreateTexture(nil,"ARTWORK")) 
			:SetSize(16,16) 
			:SetPoint("LEFT",but,"LEFT",PAD,0) 
			:SetTexture(texture)
			:SetDesaturated(true)
		.__END

		but.spritecoords={x,w,y,h}
		GQ.F.SetSpriteTexCoord(but.texture,x,w,y,h)
	end

	-- Active item: a 2px accent bar on the left and a faint fill.
	but.LeftDecor = CHAIN(but:CreateTexture(nil,"ARTWORK")) 
		:SetWidth(2) 
		:SetPoint("TOPLEFT",but,0,0) 
		:SetPoint("BOTTOMLEFT",but,0,0) 
		:SetColorTexture(unpack(SkinData("GuideMenuGuideButtonDecorColor")))
		:Hide()
	.__END

	but.ActiveFill = CHAIN(but:CreateTexture(nil,"BACKGROUND")) 
		:SetAllPoints(but)
		:SetColorTexture(unpack(SkinData("GuideMenuItemActiveFill") or {1,1,1,0.04}))
		:Hide()
	.__END

	but.caption = CHAIN(but:CreateFontString(name.."_c","ARTWORK")) 
		:SetPoint("LEFT",but.texture or but,but.texture and "RIGHT" or "LEFT",but.texture and 8 or PAD,0) 
		:SetFont(FONT,MENU_FONT_SIZE) 
		:SetText(caption)
	.__END

	but.SetHighlight = MenuButton_SetHighlight
	but.SetHighlightSprite = MenuButton_SetHighlightSprite
	but.SetLockHighlight = MenuButton_SetLockHighlight
	but.SetNormalTextColor = MenuButton_SetNormalTextColor
	but.SetHighlightTextColor = MenuButton_SetHighlightTextColor

	but:SetNormalTextColor(unpack(ItemColor(false)))
	but:SetHighlightTextColor(unpack(ItemColor(true)))
	but:SetHighlight(false,true)

	but:SetHighlightTexture("dummy") -- we need to set it, so it gets created. 
	but:GetHighlightTexture():SetColorTexture(unpack(SkinData("ButtonHighlight")))

	but:SetScript("OnEnter",function(but) but:SetHighlight(true) end)
	but:SetScript("OnLeave",function(but) but:SetHighlight(false) end)

	return but
end

function GuideMenu:PrepareGuidesMenuButtons()
	GuideMenu.MainFrame.MenuColumn.GuideButtons = GuideMenu.MainFrame.MenuColumn.GuideButtons or {}
	local buttons = GuideMenu.MainFrame.MenuColumn.GuideButtons
	local iconset = GQ.IconSets.TabsIcons
	local previous
	for _,button in pairs(buttons) do button:Hide() button:ClearAllPoints() end
	for _,group in ipairs(GQ.registered_groups.groups) do
		if self:IsCategoryAllowed(group.fullpath) and self:HasVisibleGuides(group) then
			local icon=iconset[group.name]
			local button=buttons[group.name] or self:MakeMenuButton("Button"..group.name,icon.label,iconset.file,icon[1],iconset.cols,icon[2],iconset.rows)
			buttons[group.name]=button
			if previous then button:SetPoint("TOPLEFT",previous,"BOTTOMLEFT",0,-8)
			else
				button:SetPoint("TOP",GuideMenu.MainFrame.MenuGuides.SearchEdit,"BOTTOM",0,-14)
				button:SetPoint("LEFT",GuideMenu.MainFrame.MenuGuides)
			end
			local path=group.fullpath
			button:SetScript("OnClick",function() GuideMenu:Open(path) end)
			button:Show()
			previous=button
		end
	end
end

function GQ:GQ_LOADING_TOPLEVEL_GROUPS_UPDATED()
	if GuideMenu and GuideMenu.MainFrame then
		GuideMenu:PrepareGuidesMenuButtons()
	end
end

local firstpages = {['1_home']="Home",['2_current']="Current",['3_recent']="Recent",['4_suggested']="Suggested"}
function GuideMenu:Show(path,...)
	if not GuideMenu.MainFrame then
		GuideMenu:CreateFrames()
	end
	GQ.LOADGUIDES_INTENSITY=100
	GQ:AddMessageHandler("GQ_GUIDES_PARSED",function() GuideMenu:Update() end)


	GuideMenu.GuideListOffset=0
	GuideMenu:PrepareGuidesMenuButtons()
	GuideMenu:FitToScreen()
	GuideMenu.MainFrame:DoFadeIn()

	if not GQ.GuideOnly and path~="Options" and path~="QuestSearch" then
		if GQ.db.profile.gmlasthomeversion~=GuideMenu.HomeVersion then path="Home" end
		GQ.db.profile.gmlasthomeversion = GuideMenu.HomeVersion
	end

	if not path then
		if GQ.db.profile.gmfirstpage=="5_last" then
			path = GQ.db.profile.gmlastsection
		else
			path = firstpages[GQ.db.profile.gmfirstpage]
		end
		GuideMenu.MainFrame.MenuGuides.SearchEdit:SetText("")	
		GuideMenu.MainFrame.MenuGuides.SearchEdit:SetFocus()	
	end

	GuideMenu:Open(path or "LEVELING",nil,...)
end

function GuideMenu:Hide()
	GuideMenu.MainFrame:DoFadeOut()
	for i,v in pairs(GQ.registeredguides) do
		if v~=GQ.CurrentGuide and v.fully_parsed and not v.poi then
			v:Unload()
		end
	end
end

-- group header: 16px bold			=> 15px
-- type header: 18px normal			=> 17
-- section: 15px bold
-- text: 15px normal
-- guide list: 15px normal, goatquest orange

local function featured_colourise(str,gray,dev)
	if not (gray or dev) then
		str = str:gsub("[**]+([^\*]+)[**]+","|cfff4bf2a%1|r")
		str = str:gsub("[==]+([^\=]+)[==]+","|cffbbbbbb%1|r")
	elseif dev then
		str = str:gsub("[**]+([^\*]+)[**]+","|cffff9a5c%1|r")
		str = str:gsub("[==]+([^\=]+)[==]+","|cffbbbbbb%1|r")
		if not str:find("(DEV)") then str=str .. " (DEV)" end
	else
		str = str:gsub("[**]+([^\*]+)[**]+","|cffaaaaaa%1|r")
		str = str:gsub("[==]+([^\=]+)[==]+","|cffaaaaaa%1|r")
	end
	return str
end

function GuideMenu:CreateHome()
	GQ.Widgets.Config = CHAIN(GQ.CreateFrameWithBG("Frame", nil, GuideMenu.MainFrame.WideColumnHomeInner))
		:SetBackdropColor(0,0,0,0)
		:SetMovable(true)
		:SetPoint("TOPLEFT")
		:SetWidth(600)
		:Hide()
		.__END

	GQ.Widgets.Parent = CHAIN(GQ.CreateFrameWithBG("Frame", nil, GuideMenu.MainFrame.WideColumnHomeInner, nil))
		:SetPoint("TOPLEFT")
		:SetWidth(600)
		--:SetScript("OnEnter",GQ.Widgets.HoverBarShow)
		--:SetScript("OnLeave",GQ.Widgets.HoverBarHide)
	.__END
		GQ.Widgets.Parent.ConfigHoverBar = CHAIN(GQ.CreateFrameWithBG("Button","HoverBar",GuideMenu.MainFrame.WideColumnHome))
			:SetPoint("BOTTOMRIGHT",-5,5)
			:SetSize(48,48)
			:SetAlpha(0.75)
			:Show()
			:SetFrameLevel(10)
		.__END

		GQ.Widgets.Parent.ConfigButton = CHAIN(GQ.CreateFrameWithBG("Button",nil,GQ.Widgets.Parent.ConfigHoverBar))
			:SetPoint("BOTTOMRIGHT",-6,6)
			:SetSize(32,32)
			:SetScript("OnClick",GQ.Widgets.ToggleConfig)
			:SetScript("OnEnter",GQ.Widgets.ConfigButtonTooltip)
			:SetScript("OnLeave",function() GameTooltip:Hide() end)
			:Hide()
		.__END
		GQ.ButtonSets.FloatingIcons.WIDGETS:AssignToButton(GQ.Widgets.Parent.ConfigButton)

		GQ.Widgets.Parent.ClearButton = CHAIN(GQ.CreateFrameWithBG("Button",nil,GQ.Widgets.Parent.ConfigHoverBar))
			:SetPoint("RIGHT",GQ.Widgets.Parent.ConfigButton,"LEFT",-6,0)
			:SetSize(32,32)
			:SetScript("OnClick",GQ.Widgets.ClearWidgets)
			:SetScript("OnEnter",GQ.Widgets.ClearButtonTooltip)
			:SetScript("OnLeave",function() GameTooltip:Hide() end)
			:Hide()
		.__END
		GQ.ButtonSets.FloatingIcons.BROOM:AssignToButton(GQ.Widgets.Parent.ClearButton)

		GQ.Widgets.Parent.ExitAddButton = CHAIN(GQ.CreateFrameWithBG("Button",nil,GQ.Widgets.Parent.ConfigHoverBar))
			:SetPoint("RIGHT",GQ.Widgets.Parent.ConfigButton,"LEFT",-6,0)
			:SetSize(32,32)
			:SetScript("OnClick",GQ.Widgets.ExitAddMode)
			:SetScript("OnEnter",GQ.Widgets.ExitAddButtonTooltip)
			:SetScript("OnLeave",function() GameTooltip:Hide() end)
			:Hide()
		.__END
		GQ.ButtonSets.FloatingIcons.CLOSE:AssignToButton(GQ.Widgets.Parent.ExitAddButton)

	GQ.Widgets.Fader = CHAIN(GQ.CreateFrameWithBG("Button", nil, GQ.GuideMenu.MainFrame))
		--:SetAllPoints()
		:SetPoint("LEFT",GuideMenu.MainFrame.MenuColumn,"RIGHT")
		:SetPoint("RIGHT")
		:SetPoint("BOTTOM")
		:SetPoint("TOP",GuideMenu.MainFrame.Header,"BOTTOM",0,1)
		:SetFrameLevel(10)
		:EnableMouse(true)
		:SetScript("OnMousewheel",function() return false end) -- have own handler, so the event does not get propagated
		:SetScript("OnShow",function() GuideMenu.MainFrame.MenuGuides.SearchEdit:ClearFocus() end)
		:Hide()
	.__END


	GQ.Widgets:SetupWidgets()
	GuideMenu:UpdateHomeWidgets()

	GuideMenu.HomeReady=true
end

function GuideMenu:UpdateHomeWidgets()
	GQ.Widgets:ApplyLayout()

	local height = GQ.Widgets.Parent:IsVisible() and GQ.Widgets.Parent:GetHeight() or GQ.Widgets.Config:GetHeight() 

	GuideMenu.MainFrame.WideColumnHomeInner:SetHeight(height)
	GuideMenu.MainFrame.WideColumnHome:TotalValue(height)

	if GQ.Widgets.Config:IsVisible() or not GQ.Widgets.ConfigMode then 
		GuideMenu.MainFrame.WideColumnHome:SetValue(0)
		GuideMenu.MainFrame.WideColumnHome:SetVerticalScroll(0)
	end
end

function GuideMenu:StartFeatured()
	GuideMenu.FeaturedShowcase = {}
	GuideMenu.FeaturedRoadmap = {}
end

local function grab_showcase(element,array,source)
	local guide = element.guide
	local folder = element.folder

	if source=="guideslist" then -- from guideslist
		if not array.hash[element[1]] then 
			table.insert(array,{"item",guide=element[1],text="**"..element[2].."**"})
			array.hash[element[1]] = true
			return 1
		end
	elseif (element[1]=="item") 
		and (element.guide or element.folder) 
		and (not element.faction or (element.faction==faction)) 
		and (not element.beta or GQ.BETA) 
		and (not element.roadmaponly) 
		and (not element.class or (element.class==class)) then

		if not array.hash[element.guide or element.folder] then 
			table.insert(array,{"item",guide=element.guide,folder=element.folder,text=element.text})
			array.hash[element.guide or element.folder] = true
			return 1
		end
	end
	return 0
end

function GuideMenu:ParseFeatured(index)
	local group = GuideMenu.Featured[index]
	if not group then return end

	-- split featured groups into sections
	group.parsed = true

	local parsedgroup = {}
	local parsedsection
	for _,element in ipairs(group) do
		if element[1]=="section" then
			parsedsection = {name=element.text}
			table.insert(parsedgroup,parsedsection)
		end

		table.insert(parsedsection,element)
	end
	parsedgroup.title = group.title
	parsedgroup.group = group.group

	-- build showcase data
	local auto_showcase_limit = 7 -- how many guides to pull into showcase view
	local showcasegroup = {}
	showcasegroup.title = parsedgroup.title
	showcasegroup.group = parsedgroup.group
	showcasegroup.separators = {}
	GuideMenu.FeaturedShowcase[index] = showcasegroup

	for _,section in ipairs(parsedgroup) do
		local parsedsection = {name = section.name, hash={}}
		local forced = false
		local count=0
		local only_guideslists = true

		for _,element in ipairs(section) do
			if element.showcaseonly then table.insert(parsedsection,element) end 
			if element[1]=="section" then table.insert(parsedsection,element) end 

			if element.roadmaponly then forced=true end -- if anything is set to be forced in roadmap, we want to show the section in showcase 
			if (element[1]~="section" and element[1]~="banner" and element[1]~="guideslist") then only_guideslists=false end

			if element[1]=="columns" then
				for si,subelement in ipairs(element) do
					if count<auto_showcase_limit then
						count = count + grab_showcase(subelement,parsedsection,"columns")
					end
					if element.roadmaponly then forced=true end
				end
			elseif element[1]=="guideslist" then
				local res,checked = GQ:FindFilteredGuides(element.filters,element.path)
				if res then
					for si,subelement in ipairs(res) do
						if count<auto_showcase_limit then
							count = count + grab_showcase(subelement,parsedsection,"guideslist")
						end
					end
				end
			else
				if count<auto_showcase_limit then
					count = count + grab_showcase(element,parsedsection,"element")
				end
			end
		end

		parsedsection.hash = nil
		if forced or (only_guideslists and count>0) or (not only_guideslists and #parsedsection>0) then
			table.insert(showcasegroup,parsedsection)
		end
	end

	-- build roadmap data
	local roadmapgroup = {}
	GuideMenu.FeaturedRoadmap[index] = roadmapgroup
	for _,section in ipairs(parsedgroup) do
		local parsedsection = {}
		for _,element in ipairs(section) do
			if not (element.showcaseonly or element[1]=="section") then
				table.insert(parsedsection,element)
			elseif element[1]=="section" then
				table.insert(parsedsection,{"roadmap_section",text=element.text})
			end
		end
		table.insert(roadmapgroup,parsedsection)
	end

	GuideMenu.FeaturedReady = true
	local t2=debugprofilestop()
end


GuideMenu.ActiveFeatured = {}
function GuideMenu:ShowFeatured(index,sectionindex)
	if not GuideMenu.FeaturedShowcase then return end -- too early
	local MF = GuideMenu.MainFrame
	local total_height = 0
	local index = index or GQ.db.char.lastfeatured or 1

	-- if we are given string idents for group and/or section, find their numeric values
	if type(index)=="string" then
		for i,dataset in ipairs(GuideMenu.Featured) do
			if dataset.group == index then 
				index = i 
				break
			end
		end
	end

	local data = GuideMenu.Featured[index]
	if not data then return end
	
	if not data.parsed then GuideMenu:ParseFeatured(index) end
	
	if type(sectionindex)=="string" then
		for i,dataset in ipairs(GuideMenu.Featured[index]) do
			if dataset.name == sectionindex then 
				sectionindex = i 
				break
			end
		end
	end

	
	if type(sectionindex)=="string" then sectionindex = 1 end

	if not MF:IsVisible() then
		GuideMenu:Show("Featured")
	end

	-- hide currently visible
	if GuideMenu.ActiveFeatured[1] then
		for i,section in ipairs(GuideMenu.FeaturedShowcase[GuideMenu.ActiveFeatured[1]]) do
			if section.frame then section.frame:Hide() end
		end
		for i,section in ipairs(GuideMenu.FeaturedRoadmap[GuideMenu.ActiveFeatured[1]]) do
			if section.frame then section.frame:Hide() end
		end
	end

	-- if needed, build frames for given group/section, lay them out, and display
	if not sectionindex then -- we are showing showcase mode
		local category = GuideMenu.FeaturedShowcase[index]

		local blockindex = 1
		for i,section in ipairs(category) do
			if not section.frame then
				local parentindex = (blockindex-1)%3+1
				section.frame = CHAIN(CreateFrame("Button",nil,MF.FullColumnFeaturedInner,"BackdropTemplate"))
					:SetPoint("TOP",0,-5)
					:SetPoint("LEFT",FEATURED_COLUMN_WIDTH*(parentindex-1)+5+(5*parentindex-5),0)
					:SetWidth(FEATURED_COLUMN_WIDTH)
					:SetClampedToScreen(false)
					:SetBackdrop(SkinData("GuideMenuCardBackdrop"))
					:SetBackdropColor(unpack(SkinData("GuideMenuCardColor")))
					:SetBackdropBorderColor(unpack(SkinData("GuideMenuCardBorderColor")))
					:Show()
				.__END

				GQ.Visuals:Render(section,FEATURED_COLUMN_WIDTH,section.frame,{TOPLEFT={0,0}, GUIDESTATUS=true, NOWORDWRAP=true, BOTTOMPADDING={banner=10,item=0}})

				section.frame:SetScript("OnClick", function() GQ.GuideMenu:ShowFeatured(index,i) end)

				section.frame.footer = CHAIN(CreateFrame("Frame", nil, section.frame, nil))
					:SetPoint("BOTTOMLEFT",5,0)
					:SetPoint("BOTTOMRIGHT",-5,0)
					:SetHeight(20)
				.__END

				section.frame.footer.intext = CHAIN(section.frame.footer:CreateFontString())
					:SetAllPoints()
					:SetHeight(20)
					:SetFont(GQ.Font,11)
					:SetJustifyH("LEFT")
					:SetTextColor(unpack(SkinData("MutedColor")))
					:SetText("See more")
					:SetIgnoreParentAlpha(true)
				.__END
				section.frame.footer.decor = CHAIN(section.frame.footer:CreateTexture())
					:SetVertexColor(unpack(SkinData("GuideMenuRuleColor")))
					:SetPoint("TOPLEFT",section.frame.footer.intext,0,2)
					:SetPoint("TOPRIGHT",section.frame.footer.intext,0,2)
					:SetHeight(1)
					:SetTexture(GQ.SKINSDIR.."white")
				.__END
				section.frame.footer.arrow = CHAIN(section.frame.footer:CreateTexture())
					:SetPoint("RIGHT",section.frame.footer.intext)
					:SetVertexColor(unpack(SkinData("MutedColor")))
					:SetSize(12,12)
				.__END
				GQ.ButtonSets.TitleButtons.STEP_NEXT:AssignToTexture(section.frame.footer.arrow)
				
				if prev then
					section.frame:SetPoint("TOP",prev,"BOTTOM",0,-5)
				end

				section.frame:SetHeight(section.frame:GetHeight() + 15) -- add space for footer
				section.frame.type = section.name
				section.frame.text = GQ.IconSets.TabsIcons[section.name].label
				section.frame.title = section.name

				blockindex = blockindex + 1
			end

			section.frame:Show()

			-- resize, position and display category
			local row = math.floor((i-1)/3)+1
			section.row = row

			if i%3==1 then -- first block of row, make separator, we will attach next rows to it. 
				local object,e_height,space = GQ.Visuals:separator(section.frame,100)

				category.separators[row] = object
				category.separators[row]:SetVertexColor(0,0,0,0)
				category.separators[row]:SetPoint("TOP",section.frame,"BOTTOM",0,0)
			end

			-- store the height the row has, expanding to tallest element
			category.separators[row].rowheight = math.max(category.separators[row].rowheight or 0,section.frame:GetHeight())

			if row>1 then
				section.frame:SetPoint("TOP",category.separators[row-1],"BOTTOM",0,-5)
			end		
		end

		for i,section in ipairs(category) do -- set all sections in given row to rows height
			section.frame:SetHeight(category.separators[section.row].rowheight)
		end

		for i,row in pairs(category.separators) do
			total_height = total_height + row.rowheight + 5 -- + vertical offset
		end	
	else -- we are showing roadmap for given section
		local section = GuideMenu.FeaturedRoadmap[index][sectionindex]
		if not section.frame then
			section.frame = CHAIN(CreateFrame("Button",nil,MF.FullColumnFeaturedInner,"BackdropTemplate"))
				:SetPoint("TOPLEFT")
				:SetPoint("RIGHT")
				:SetClampedToScreen(false)
				:SetBackdrop(SkinData("MainBackdrop"))
				:SetBackdropColor(0,0,0,0)
				:SetBackdropBorderColor(0,0,0,0)
				:Show()
			.__END

			GQ.Visuals:Render(section,785,section.frame,{GUIDESTATUS=true,GUIDESTATUSBACKGROUND=true})

			local group_ident = GuideMenu.FeaturedShowcase[index].group
			local section_ident = GuideMenu.FeaturedShowcase[index][sectionindex].name

			local content_group
			for i,object in ipairs(section.frame.Objects) do
				if object.ztype=="content" then
					object.group_ident = ("%s_%s_%d"):format(group_ident,section_ident,i)
					content_group = object.group_ident
				end

				if content_group and object.ztype~="content" then
					object.zident = content_group
				end

				if object.ztype == "roadmap_section" then
					object:SetScript("OnClick",function() GuideMenu:ShowFeatured(index) end)
				end
			end
		end

		section.frame:Show()

		local featuredhide = GQ.db.profile.featuredhide
		total_height = 0
		local prev
		-- we can't just check height of section frame, since player can show/hide blocks within
		-- calculate height really used, and reanchor stuff. 
		for i,object in ipairs(section.frame.Objects) do
			if object.group_ident then
				object.group_visible = not featuredhide[object.group_ident]
				object:UpdateText()
			end
			if object.zident then
				if featuredhide[object.zident] then
					object:Hide()
				else
					object:Show()
				end
			end

			if object:IsVisible() then
				if prev then
					object:SetPoint("TOPLEFT",prev,"BOTTOMLEFT",0,-object.space)
				else
					object:SetPoint("TOPLEFT",section.frame,"TOPLEFT",10,-5)
				end
				prev = object
				total_height = total_height + object:GetHeight() + object.space
			end
		end
	end

	-- update scrollframe dimensions
	MF.FullColumnFeaturedInner:SetHeight(total_height)
	MF.FullColumnFeatured:TotalValue(total_height)
	MF.FullColumnFeatured:SetValue(0)
	MF.FullColumnFeatured:SetVerticalScroll(0)

	-- save which sectioni is currently visible
	GuideMenu.ActiveFeatured[1] = index
	GuideMenu.ActiveFeatured[2] = sectionindex

	-- update header
	GuideMenu.MainFrame.FullColumn.Name:SetText("Featured: "..data.title)
	GuideMenu.MainFrame.FullColumnFeatured.Dropdown:SetCurrentSelectedByValue(data.group)
	GuideMenu.GuideCategory=nil

end

function GuideMenu:ShowBulletin()
	GQ.GuideMenu:Show("Home") 
	GQ.Widgets.Registered.goatquestmessage:ShowPopup()
end

function GuideMenu:GetSectionMenu()
	if GuideMenu.CurrentPath=="Recent" then return "Recent" end
	if GuideMenu.CurrentPath=="Suggested" then return "Suggested" end

	return "General"
end

function GuideMenu:ToggleSectionMenu()
	local MF = GuideMenu.MainFrame

	if DropDownForkList1 and DropDownForkList1:IsShown() and DropDownForkList1.dropdown==GQ.Frame.Controls.MenuHostGuides then CloseDropDownForks() return end

	local menu = GuideMenu:GetSectionMenu()

	UIDropDownFork_SetAnchor(GQ.Frame.Controls.MenuHostGuides, 0, 0, "TOP",MF.CenterColumn.SectionInfo.SettingsButton,"BOTTOM")
	EasyFork(RightColumnSubmenus[menu],GQ.Frame.Controls.MenuHostGuides,nil,0,0,"MENU",10)
	DropDownForkList1:SetPoint("RIGHT",MF.RightColumn)
	UIDropDownFork_SetWidth(GQ.Frame.Controls.MenuHostGuides,210,10)
end



local function OptionButton_OnClick(button)
	GuideMenu.current_option = button.optiongroupblizname
	GuideMenu.MainFrame.WideColumnOptions.AceContainer.optiontable = button.optiontable
	GuideMenu.MainFrame.WideColumnOptions.AceContainer.groupname = button.optiongroupblizname
	GuideMenu:SetWideSectionHeader(button.optiontable.name)

	-- reset scroll on panel switch
	local s = LibStub("AceConfigDialog-3.0-Z"):GetStatusTable(button.optiongroupblizname)
	s.scrollvalue, s.offset = nil, nil
    
	GQ:ScheduleTimer(function()
		LibStub("AceConfigDialog-3.0-Z"):Open(button.optiongroupblizname,GuideMenu.MainFrame.WideColumnOptions.AceContainer)
	end,0)
	GuideMenu:HighlightOptionButton(button.optiongroupblizname)
end

function GuideMenu:ShowOptions(opt)
	opt = opt or "GoatQuest-Display"
	self:ShowOptionButtons()
	for i,but in pairs(self.MainFrame.MenuOptions.buttons) do  if but.optiongroupblizname==opt or but.optiongroupname==opt then OptionButton_OnClick(but) return end end
end

local option_icons = { "general","stepdisplay","display","travelsystem","poi","notification","gear","itemscore","gold","extras","profile","about","share" }
local option_icons_rev = {}
for k,v in ipairs(option_icons) do option_icons_rev[v]=k end

function GuideMenu:ShowOptionButtons()
	GuideMenu.MainFrame.MenuOptions.buttons = GuideMenu.MainFrame.MenuOptions.buttons or {}
	local previous_button

	local iconset = GQ.IconSets.OptionsIcons

	for i,opttableord in ipairs(GQ.optiontables_ordered) do  repeat
		local opttable = GQ.optiontables[opttableord.name]
		if opttable.guiHidden then break end --continue
		if opttable._onlybliz then break end --continue
		if not GuideMenu.MainFrame.MenuOptions.buttons[i] then
			local icon = iconset[opttableord.name]
			local button = GuideMenu:MakeMenuButton("ButtonOptions_"..opttableord.name,icon.label,iconset.file,icon[1],iconset.cols,icon[2],iconset.rows)
			--button:SetHighlightSprite(1,2,i,16)
			button:SetParent(GuideMenu.MainFrame.MenuOptions)
			if previous_button then
				button:SetPoint("TOPLEFT",previous_button,"BOTTOMLEFT",0,-6)
			else
				button:SetPoint("TOPLEFT",GuideMenu.MainFrame.MenuOptions,"TOPLEFT",0,-10)
			end
			button.optiongroupblizname = opttableord.blizname
			button.optiongroupname = opttableord.name
			button.optiontable = opttable
			button:SetScript("OnClick",OptionButton_OnClick)
			button:Show()
			previous_button = button
			GuideMenu.MainFrame.MenuOptions.buttons[i] = button
		end
	until true  end
	GuideMenu.MainFrame.MenuOptions:Show()
end

function GuideMenu:CreateOptions()
end

function GuideMenu:HighlightOptionButton(blizname)
	for i,button in pairs(self.MainFrame.MenuOptions.buttons) do  -- not ipairs, since array does not start at 1
		button:SetLockHighlight(button.optiongroupblizname==blizname)  
		button.LeftDecor:SetShown(button.optiongroupblizname==blizname)
	end
end

function GuideMenu:RefreshOptions(blizname)
	blizname = blizname or self.current_option
	if self.MainFrame and self.MainFrame.MenuOptions:IsVisible() and self.current_option == blizname then GQ:OpenOptions(blizname) end
end