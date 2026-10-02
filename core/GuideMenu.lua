local name,GQ = ...

-- look for this stuff
-- RETIRE AFTER NEW MENU

-- #GLOBALS GoatQuest,ZGW

local GuideMenu = {}
GQ.GuideMenu = GuideMenu

local L = GQ.L
local FONT=GQ.Font
local FONTBOLD=GQ.FontBold
local CHAIN = GQ.ChainCall
local ui = GQ.UI
local SkinData = ui.SkinData

local STATUS_COLORS = { -- rrggbbaa
	SUGGESTED =	{hex="#ffffffff"},
	VALID =		{hex="#ffffffff"},
	COMPLETE =	{hex="#808080ff"},
	OUTLEVELED =	{hex="#aaaaaaff"},
	INVALID =	{hex="#e60000ff"},
} 
for stat,data in pairs(STATUS_COLORS) do -- convert hex to inline color and vertex array
	data.r,data.g,data.b,data.a = GQ.F.HTMLColor(data.hex)
	data.code = "|c"..data.hex:sub(8,9)..data.hex:sub(2,3)..data.hex:sub(4,5)..data.hex:sub(6,7)
end

GuideMenu.STATUS_COLORS=STATUS_COLORS -- used in popups, so let us make it public

-- Browse existing guide data without creating folders from display labels or saved paths.
local guideCategories = {LEVELING=true,DUNGEONS=true,PROFESSIONS=true}
function GuideMenu:IsCategoryAllowed(path)
	if type(path)~="string" then return false end
	local category = path:match("^([^\\]+)")
	return not GQ.GuideOnly or (GQ.GuideCategories or guideCategories)[category]==true
end

function GuideMenu:NormalizePath(path)
	if path=="Leveling Guides" then path="LEVELING"
	elseif path=="Dungeon Guides" then path="DUNGEONS"
	elseif path=="Profession Guides" then path="PROFESSIONS" end
	if type(path)=="string" then path=GQ:SanitizeGuideTitle(path) end
	if GQ.GuideOnly then
		if path=="Current" or path=="Recent" or path=="Options" or path=="Search" or path=="QuestSearch" then return path end
		if not self:IsCategoryAllowed(path) then return "LEVELING" end
		local group=GQ:FindOrCreateGroup(GQ.registered_groups,path,true)
		if not group or group.hidden or group.name=="Hidden Guides" then return "LEVELING" end
	end
	return path or "LEVELING"
end

function GuideMenu:IsGuideVisible(guide,path)
	if not guide or guide.hidden or not self:IsCategoryAllowed(guide.title or guide.fullpath) then return false end
	if guide.condition_visible and not guide.condition_visible() then
		return not not (path and guide.linkedhidden and guide.linked and guide.linked[path])
	end
	return true
end

function GuideMenu:HasVisibleGuides(group)
	if not group or group.hidden or group.name=="Hidden Guides" or not self:IsCategoryAllowed(group.fullpath) then return false end
	for _,guide in ipairs(group.guides or {}) do
		if self:IsGuideVisible(guide,group.fullpath) then return true end
	end
	for _,child in ipairs(group.groups or {}) do
		if self:HasVisibleGuides(child) then return true end
	end
	return false
end

function GuideMenu:ShowEmptyState(message)
	if not self.Request then return end
	self.Request.text:SetText(message)
	self.Request.requestbtn:Hide()
	self.Request.img:Hide()
	self.Request:Show()
end

function GuideMenu:CreateRequestFrame()
	local frame = CHAIN(ui:Create("Frame",GuideMenu.MainFrame))
		:SetSize(350,160)
		:SetPoint("TOPLEFT", GuideMenu.MainFrame.CenterColumn, "TOPLEFT", 14, -55)
		:SetBackdropColor(0,0,0,0)
		:CanDrag(false)
		:Hide()
		.__END
	GuideMenu.Request = frame

	frame.text = CHAIN(frame:CreateFontString())
		:SetFont(FONT,12,"")
		:SetJustifyH("LEFT")
		:SetPoint("TOPLEFT", frame)
		:SetWidth(345)
		:SetWordWrap(true)
		:SetText(L['guidemenu_section_search_noresults'])
		.__END
	
	frame.img = frame:CreateTexture()
	frame.img:SetPoint("TOPLEFT", frame, 0, -23)
	frame.img:SetTexture(GQ.DIR.."/Skins/guide_request.tga","REPEAT","REPEAT")
	frame.img:SetSize(13,12)

	frame.requestbtn = CHAIN(CreateFrame("Button","RequestGuideBtn",frame))
		:SetPoint("TOPLEFT", frame.img, "TOPRIGHT", 5, 10)
		:SetScript("OnClick", function()
			GQ:Print(L['guidemenu_section_search_submitted_chat'])
			frame.text:SetText(L['guidemenu_section_search_submitted'])
			GuideMenu:SaveDump(self.search_lastquery, time())
			frame.requestbtn:Hide()
			frame.img:Hide()
		end)
		:SetSize(500,30)
		:Show()
		.__END

	frame.requestbtnFS = CHAIN(frame.requestbtn:CreateFontString())
		:SetPoint("TOPLEFT",frame.requestbtn,"TOPLEFT")
		:SetFont(FONT,12,"")
		:SetTextColor(unpack(SkinData("GuideMenuTextColor")))
		:SetSize(500,40)
		:SetJustifyH("LEFT")
		:SetText("")
	.__END

end

function GuideMenu:HideRequestFrame()
	if GuideMenu.Request then GuideMenu.Request:Hide() end
end

function GuideMenu:SaveDump(text,timestamp,header)
	timestamp = timestamp or time()
	GQ.db.global.bugreports = GQ.db.global.bugreports or {}
	GQ.db.global.bugreports[timestamp]=GuideMenu:FormatDumpForUpload(text)
end

function GuideMenu:FormatDumpForUpload(content,more_headers)
	local header = ""
	header = header .. "bug_report_id="..GQ.BugReport:GetUniqueId().."\n"
	header = header .. "bug_report_sent=0\n"
	header = header .. "bug_report_time="..time().."\n"
	header = header .. "bug_report_version="..GQ.version.."\n"
	header = header .. "bug_report_player="..GQ.BugReport:GetReport_Player_Basic().."\n"
	header = header .. "bug_report_guiderequest="..content.."\n"
	if more_headers then header = header .. more_headers end

	return ("%s\n%s\n---->>\n%s\n<<----\n%s"):format("%%BUG_REPORT_START%%",header,"","%%BUG_REPORT_END%%")
end

function GuideMenu:ShowHome()
	if not GuideMenu.HomeReady then
		GuideMenu:CreateHome()
	end
	
	GuideMenu.MainFrame.WideColumn.Name:Hide()
	GuideMenu.MainFrame.WideColumn.Decor:Hide()
	GuideMenu:UpdateHomeWidgets()

	GuideMenu.GuideCategory=nil
end

local temp_structure={}
function GuideMenu:Search()
	table.wipe(temp_structure)
	table.wipe(GuideMenu.Guides)
	GuideMenu.Request:Hide()
	local searchtext=GuideMenu.MainFrame.MenuGuides.SearchEdit:GetText()
	local category

	local nresults=0

	--[[
	if #searchtext<2 then
		GuideMenu:SetSectionHeader("Search",false)
		GuideMenu.GuideCategory=nil
		return
	end
	--]]

	local questID = searchtext:match("^quest:(%d+)$")
	if questID then -- redirect to search for quest by id
		GuideMenu.CurrentPath = "QuestSearch"
		GuideMenu:SearchQuest(tonumber(questID))
		return
	end

	-- Get list of search results, and separate them to category folders
	for _,object in pairs(GQ:FindGuides(searchtext)) do
		if (object.groups and self:HasVisibleGuides(object)) or (not object.groups and self:IsGuideVisible(object)) then
			category,_ = (object.fullpath or object.title):match("^([^\\]+)\\(.*)$")
			temp_structure[category]=temp_structure[category] or {}
			table.insert(temp_structure[category],object)
			nresults=nresults+1
		end
	end

	-- Build array of results with added headers and spacers
	local first_folder=true
	for i,group in ipairs(GQ.registered_groups.groups) do
		if temp_structure[group.name] then
			if first_folder then
				first_folder=false
			else
				tinsert(GuideMenu.Guides,{header=true})
			end
			tinsert(GuideMenu.Guides,{header=true,header_name=GQ.IconSets.TabsIcons[group.name].label,header_icon=group.name})

			-- Sort guides in category folders by name
			table.sort(temp_structure[group.name],function(a,b)
				if a.title_short and b.title_short then
					-- both are guides
					return a.title_short<b.title_short
				elseif a.name and b.name then
					-- both are folders
					return a.name<b.name
				else
					-- mix, folders first
					return (a.name and 1 or 0)>(b.name and 1 or 0)
				end
			end)

			for j,object in pairs(temp_structure[group.name]) do
				table.insert(GuideMenu.Guides,object)
			end
		end
	end

--	Spoo(temp_structure)
--	Spoo(GuideMenu.Guides)
	-- Get list of matching quests, and add it to beggining of results

	local quests = GQ.QuestDB:GetQuestsByTitle(searchtext)
	for i=#quests,1,-1 do
		local quest=quests[i]
		for j=#quest.guides,1,-1 do
			local guide=GQ:GetGuideByTitle(quest.guides[j].title)
			if not self:IsGuideVisible(guide) then table.remove(quest.guides,j) end
		end
		if #quest.guides==0 then table.remove(quests,i) end
	end
	if #quests>0 then
		for i,object in ipairs(quests) do
			object.name = object.questtitle .. (" (%d guide%s)"):format(#object.guides,#object.guides>1 and "s" or "")
			tinsert(GuideMenu.Guides,i,object)
			nresults=nresults+1
		end
		tinsert(GuideMenu.Guides,1,{header=true,header_name="QUESTS"})
		tinsert(GuideMenu.Guides,#quests+2,{header=true})
	end

	if #searchtext>0 and not GuideMenu.Guides[1] then
		GuideMenu:ShowEmptyState("No guides found. Try a zone, dungeon, profession, or quest name.")
		GuideMenu:SetSectionHeader(L['guidemenu_section_search_results']:format(nresults),false)
	elseif #searchtext>0 then
		GuideMenu.Request:Hide()
		GuideMenu:SetSectionHeader(L['guidemenu_section_search_results']:format(nresults),false)
	else
		GuideMenu:SetSectionHeader(L['guidemenu_section_search'],false)
	end

	GuideMenu.GuideCategory=nil

	self.search_lastquery = searchtext
	self:AddSearchHistory(searchtext,nresults)
end

local TYPING_TIMEOUT=5
local SEARCH_HISTORY_MAX=50
function GuideMenu:AddSearchHistory(searchtext,numresults)
	GQ.db.char.searchhistory = GQ.db.char.searchhistory or {}
	if not #searchtext or #searchtext==0 then return end
	local sh = GQ.db.char.searchhistory
	
	-- commit all old entries
	for i,search in ipairs(sh) do
		if time()-search.time > TYPING_TIMEOUT then -- replace
			search.fresh = nil
		end
	end
	
	local lastsearch = sh[#sh]
	if lastsearch and lastsearch.fresh then -- replace
		lastsearch.query = searchtext
		lastsearch.numresults = numresults
		return
	else -- add
		tinsert(sh,{query=searchtext,numresults=numresults,time=time(),fresh=true})
	end

	-- trim
	while (#sh>SEARCH_HISTORY_MAX) do tremove(sh,1) end
end

function GuideMenu:SearchHistory_Commit()
	GQ.db.char.searchhistory = GQ.db.char.searchhistory or {}
	local last = GQ.db.char.searchhistory[#GQ.db.char.searchhistory]
	if not last then return end
	last.fresh = nil
end

function GuideMenu:SearchQuest(questID)
	GuideMenu:HideRequestFrame()
	table.wipe(temp_structure)
	table.wipe(GuideMenu.Guides)

	local questtitle = GQ.QuestDB:GetQuestName(questID)

	local status,results = GQ.QuestDB:GetGuidesForQuest(questID)
	if not status then results={} end

	-- Get list of search results, and separate them to category folders
	local nresults=0
	for guideTitle,stepNum in pairs(results) do
		local object = GQ:GetGuideByTitle(guideTitle)
		if object and object.GetStatus and self:IsGuideVisible(object) then
			object.QuestSearchStepNum = stepNum
			object.QuestSearchID = questID
			local category,_ = (object.fullpath or object.title):match("^([^\\]+)\\(.*)$")
			temp_structure[category]=temp_structure[category] or {}
			table.insert(temp_structure[category],object)
			nresults=nresults+1
		end
	end

	-- Build array of results with added headers and spacers
	local first_folder=true
	for i,group in ipairs(GQ.registered_groups.groups) do
		if temp_structure[group.name] then
			if first_folder then
				first_folder=false
			else
				tinsert(GuideMenu.Guides,{header=true})
			end
			tinsert(GuideMenu.Guides,{header=true,header_name=GQ.IconSets.TabsIcons[group.name].label,header_icon=group.name})

			-- Sort guides in category folders by name
			table.sort(temp_structure[group.name],function(a,b)
				if a.title_short and b.title_short then
					-- both are guides
					return a.title_short<b.title_short
				elseif a.name and b.name then
					-- both are folders
					return a.name<b.name
				else
					-- mix, folders first
					return (a.name and 1 or 0)>(b.name and 1 or 0)
				end
			end)

			for j,object in pairs(temp_structure[group.name]) do
				table.insert(GuideMenu.Guides,object)
			end
		end
	end

	if nresults==0 then self:ShowEmptyState("No matching guides in Leveling, Dungeons, or Professions.") end
	GuideMenu:SetSectionHeader(L['guidemenu_section_search_titleresults']:format(questtitle or questID,nresults,nresults>1 and "s" or ""),true)
	GuideMenu.MainFrame.CenterColumn.SectionInfo:SetScript("OnClick",function() GuideMenu:Open("Search",false) end)
	GuideMenu.MainFrame.CenterColumn:SetScript("OnMouseUp",function(this,but) if but=="RightButton" then GuideMenu:Open("Search",false) end end)

	GuideMenu.GuideCategory=nil
end

GuideMenu.Guides = {}
function GuideMenu:ShowGuides(path,iscurrent)
	GuideMenu:HideRequestFrame()
	GuideMenu:SetFocusedRow()
	if iscurrent then 
		GuideMenu.FocusedGuide=GQ.CurrentGuide 
		GuideMenu:ShowGuideDetails()
	else
		GuideMenu:HideRowMouseOver()
	end
 
	path = self:NormalizePath(path)
	self.group = GQ:FindOrCreateGroup(GQ.registered_groups,path,true)
	if not self.group or not self:IsCategoryAllowed(path) then
		path="LEVELING"
		self.group=GQ:FindOrCreateGroup(GQ.registered_groups,path,true)
	end
	self.group = self.group or {groups={},guides={}}
	GuideMenu.CurrentPath=path
	table.wipe(GuideMenu.Guides)
	for _,group in ipairs(self.group.groups) do
		if self:HasVisibleGuides(group) then
			group.missing=not self:AnyGuideValid(group)
			tinsert(GuideMenu.Guides,group)
		end
	end
	for _,guide in ipairs(self.group.guides) do
		if self:IsGuideVisible(guide,path) and guide.GetStatus
		and not (GQ.db.profile.gmhidecompleted and (guide:GetStatus()=="OUTLEVELED" or guide:GetStatus()=="COMPLETE")) then
			tinsert(GuideMenu.Guides,guide)
			guide:GetCompletion()
		end
	end
	if #GuideMenu.Guides==0 then self:ShowEmptyState("No guides to display. Try another category or turn off Hide completed guides.") end

	-- Update header to show or hide the parent folder button
	local parent,name = path:match("^(.+)\\(.-)$")
	local center = GuideMenu.MainFrame.CenterColumn
	local section = center.SectionInfo
	local highlight,_
	
	if parent then
		GuideMenu:SetSectionHeader(name,true)
		highlight,_ = path:match("^([^\\]+)\\(.*)$")
		section:SetScript("OnClick",function() GuideMenu:Open(parent) end)
		center:SetScript("OnMouseUp",function(this,but) if but=="RightButton" then GuideMenu:Open(parent) end end)
	else
		GuideMenu:SetSectionHeader(GQ.IconSets.TabsIcons[path].label,false)
		highlight=path
		center:SetScript("OnMouseUp",nil)
	end

	-- Which guide section is to be highlighted
	GuideMenu.GuideCategory = highlight
end

function GuideMenu:ShowParent()
	local center = GuideMenu.MainFrame.CenterColumn
	if center:GetScript("OnMouseUp") then
		center:GetScript("OnMouseUp")(center,"RightButton")
	end
end

function GuideMenu:OpenGuide(guide)
	local path,guide = guide.title:match("^(.+)\\(.-)$")
	GuideMenu:Show(path) 
end

function GuideMenu:ShowCurrent()
	if not GQ.CurrentGuideName or not self:IsGuideVisible(GQ.CurrentGuide) then GuideMenu:Open("LEVELING") return end

	local path,guide = GQ.CurrentGuideName:match("^(.+)\\(.-)$")
	GuideMenu:Open(path,true)
	GuideMenu:ShowGuideDetails(GuideMenu.FocusedGuide)
end

local recent_groups={}
function GuideMenu:ShowRecent() 
	table.wipe(GuideMenu.Guides)
	table.wipe(recent_groups)

	local limit = GQ.db.profile.gmnumrecent

	-- get foldered limit last guides
	local added = 0
	GuideMenu:HideRequestFrame()
	for i,object in ipairs(GQ.db.char.guides_history) do
	        local category,_ = object[1]:match("^([^\\]+)\\(.*)$")
		recent_groups[category] = recent_groups[category] or {}
		local guide = GQ:GetGuideByTitle(object[1])
		if self:IsGuideVisible(guide) and guide.GetStatus and not (GQ.db.profile.gmhidecompleted and (guide:GetStatus()=="OUTLEVELED" or guide:GetStatus()=="COMPLETE")) then
			guide:GetCompletion()
			guide.CurrentStepNum = object[2]
			table.insert(recent_groups[category],guide)
			added=added+1
		end
		if added==limit then break end
	end

	local first_folder=true
	for i,group in ipairs(GQ.registered_groups.groups) do
		local hist = recent_groups[group.name]
		if hist and #hist > 0 then 
			if first_folder then
				first_folder=false
			else
				tinsert(GuideMenu.Guides,{header=true})
			end
			tinsert(GuideMenu.Guides,{header=true,header_name=GQ.IconSets.TabsIcons[group.name].label,header_icon=group.name})

			for k, guide in pairs(hist) do
				tinsert(GuideMenu.Guides,guide)
			end
		end
	end

	if #GuideMenu.Guides==0 then self:ShowEmptyState("Your recently opened guides will appear here. Choose a category to get started.") end
	GuideMenu:SetSectionHeader(L['guidemenu_section_recent'],false)

	-- Which guide section is to be highlighted
	GuideMenu.GuideCategory = nil
end

local suggested={}
function GuideMenu:FindSuggestedGuides()
	table.wipe(suggested)
	for i,guide in ipairs(GQ.registeredguides) do
		if guide.condition_suggested_raw or guide.type=="LEVELING" then
			local pass,msg = guide:DoCond("suggested")
			if pass then 
				-- ok, it is suggested, but let's check if it is valid and not completed
				local status=guide:GetStatus()
				if status=="SUGGESTED" then
					if not suggested[guide.type] then suggested[guide.type]={} end
					tinsert(suggested[guide.type],guide)
				end
			end
		end
	end
	local sgroups = GQ:FindOrCreateGroup(GQ.registered_groups,"SUGGESTED")

	for i,group in pairs(sgroups.groups) do
		if not suggested[group.category] then suggested[group.category]={} end
		tinsert(suggested[group.category],group)
	end

	return suggested
end

function GuideMenu:ShowSuggested() 
	table.wipe(GuideMenu.Guides)

	local sguides = GuideMenu:FindSuggestedGuides()

	local first_folder=true
	for i,group in ipairs(GQ.registered_groups.groups) do
		local hist = sguides[group.name]
		if hist and #hist > 0 then 
			if GQ.db.profile["gmsuggest"..(group.name):lower()] then
				if first_folder then
					first_folder=false
				else
					tinsert(GuideMenu.Guides,{header=true})
				end
				tinsert(GuideMenu.Guides,{header=true,header_name=GQ.IconSets.TabsIcons[group.name].label,header_icon=group.name})

				for k, guide in pairs(hist) do
					if guide.GetCompletion then guide:GetCompletion() end
					tinsert(GuideMenu.Guides,guide)
				end
			end
		end
	end

	GuideMenu:SetSectionHeader(L['guidemenu_section_suggested'],false)

	-- Which guide section is to be highlighted
	GuideMenu.GuideCategory = nil
end

function GuideMenu:ShowFavourites() 
	table.wipe(GuideMenu.Guides)
	table.wipe(recent_groups)

	for object,_ in pairs(GQ.db.char.favourites) do
	        local category,_ = object:match("^([^\\]+)\\(.*)$")
		recent_groups[category] = recent_groups[category] or {}
		local guide = GQ:GetGuideByTitle(object)
		if self:IsGuideVisible(guide) and guide.GetStatus and not (GQ.db.profile.gmhidecompleted and (guide:GetStatus()=="OUTLEVELED" or guide:GetStatus()=="COMPLETE")) then
			guide:GetCompletion()
			table.insert(recent_groups[category],guide)
		end
	end

	local first_folder=true
	for i,group in ipairs(GQ.registered_groups.groups) do
		local hist = recent_groups[group.name]
		if hist and #hist > 0 then 
			if first_folder then
				first_folder=false
			else
				tinsert(GuideMenu.Guides,{header=true})
			end
			tinsert(GuideMenu.Guides,{header=true,header_name=GQ.IconSets.TabsIcons[group.name].label,header_icon=group.name})

			for k, guide in pairs(hist) do
				tinsert(GuideMenu.Guides,guide)
			end
		end
	end

	GuideMenu:SetSectionHeader(L['guidemenu_section_favourites'],false)

	-- Which guide section is to be highlighted
	GuideMenu.GuideCategory = nil
end


function GuideMenu:Refresh()	
	GuideMenu:Open(GuideMenu.CurrentPath)
end

function GuideMenu:Update()
	-- Highlight guide category in left side menu
	for i,v in pairs(GuideMenu.MainFrame.MenuColumn.GuideButtons) do
		v:SetLockHighlight(i==GuideMenu.GuideCategory or i==GuideMenu.CurrentSection:upper())
	end

	if GuideMenu.CurrentSection=="Home" then
		-- We handle home page in GuideMenu:ShowHome()
	elseif GuideMenu.CurrentSection=="Options" then
		-- Options are in options
	else
		local rownum=0
		local ROW_COUNT = GuideMenu.MainFrame.GuideListScrollFrame:CountRows()
		local results=#GuideMenu.Guides

		GuideMenu.GuideListOffset = max(0,min((GuideMenu.GuideListOffset or 0),results-ROW_COUNT))
		local rowoff=GuideMenu.GuideListOffset

		local itemindex = 1
		for ii,object in ipairs(GuideMenu.Guides) do
			rownum = itemindex-rowoff
			if rownum>0 and rownum<ROW_COUNT+1 then 
				local row = GuideMenu.MainFrame.GuideListScrollFrame.rows[rownum]
				local isGuide = object.title_short
				local isHeader = object.header
				local suggested=false
				local complete=false
				local status
				row.guide=nil
				row.group=nil
				row.quest=nil

				-- Reset row to defaults
				row.icon:SetTexture(GQ.IconSets.GuideIconsSmall.file)
				row.icon:SetVertexColor(1,1,1,1)
				row:SetNormalBackdropColor(0,0,0,0) 
				row.title:SetFont(FONT,12)
				row.loadbutton:Hide()
				row.favourite:Hide()

				if isGuide then
					row.guide=object
					status=object.GetStatus and object:GetStatus()
					suggested=(status=="SUGGESTED")
					complete=object.GetCompletion and object:GetCompletion()==1

					if complete and GQ.db.profile.gmusecheck then
						row.icon:SetTexture(GQ.IconSets.StepLineIcons.file)
						row.icon:SetTexCoord(unpack(GQ.IconSets.StepLineIcons['CHECK'].texcoord))
					else
						row.icon:SetTexCoord(unpack(GQ.IconSets.GuideIconsSmall['GUIDE'].texcoord))
					end
					if GQ.db.profile.gmcolorcode then
						local col=STATUS_COLORS[status]
						row.icon:SetVertexColor(col.r,col.g,col.b,col.a)
					end				

					row:SetScript("OnClick",function(this,button) 
						if GQ.DEV and ZGW and IsShiftKeyDown() then GuideMenu:ExportPath(row) return end

						if button=="RightButton" then GuideMenu:ShowParent() return end
						GuideMenu:SetFocusedRow(row) 
					end)
					row:SetScript("OnDoubleClick",function(this,button) GuideMenu:ActivateGuide(row.guide) end)

					if object==GuideMenu.FocusedGuide then 
						row:SetNormalBackdropColor(unpack(SkinData("GuideMenuRowSelectedColor"))) 
					end

					if not GQ.GuideOnly and object.IsFavourite and object:IsFavourite() then
						row.favourite:GetNormalTexture():SetDesaturated(false)
						row.favourite:Show()
					else
						row.favourite:GetNormalTexture():SetDesaturated(true)
					end						

				elseif isHeader then
					row:SetScript("OnClick",nil)
					row:SetScript("OnDoubleClick",nil)
					if object.header_name then
						row.icon:SetTexture(GQ.IconSets.TabsIcons.file)
						row.icon:SetTexCoord(unpack(GQ.IconSets.TabsIcons[object.header_icon or object.header_name].texcoord))
						row.title:SetFont(FONTBOLD,12)
					else
						row.icon:SetTexCoord(0,0,0,0)
					end
				elseif object.questtitle then
					if object.completed and GQ.db.profile.gmusecheck then
						row.icon:SetTexture(GQ.IconSets.StepLineIcons.file)
						row.icon:SetTexCoord(unpack(GQ.IconSets.StepLineIcons['CHECK'].texcoord))
					else
						row.icon:SetTexCoord(unpack(GQ.IconSets.GuideIconsSmall['EXCLAMATION'].texcoord))
					end

					if object==GuideMenu.FocusedQuest then 
						row:SetNormalBackdropColor(unpack(SkinData("GuideMenuRowSelectedColor"))) 
					end

					row.quest = object
					row:SetScript("OnClick",function() GuideMenu:SetFocusedRow(row) end)
					row:SetScript("OnDoubleClick",function() GuideMenu:Open("QuestSearch",false,object.questid) end)
				else
					-- normal guide list object or quest, folder clickable and starable
					row.group=object
					row.icon:SetTexCoord(unpack(GQ.IconSets.GuideIconsSmall['FOLDER'].texcoord))
					row:SetScript("OnDoubleClick",nil)
					row:SetScript("OnClick",function(this,button) 
						if GQ.DEV and IsShiftKeyDown() then GuideMenu:ExportPath(row) return end
						if button=="RightButton" then GuideMenu:ShowParent() return end
						GuideMenu:SetFocusedRow() 
						GuideMenu:Open(object.fullpath) 
					end)
					if not object.fullpath:find("PETSMOUNTS") then
						suggested=GQ:GetGuideFolderInfo(object)
					end
				end

				row.title:SetText((object.name or object.title_short or object.header_name or "")
					.. (object.beta and GQ.L['guidebeta'] or "")
					.. (object.devonly and GQ.L['guidedev'] or "")
					.. (object.devpartial and GQ.L['guidedevpart'] or "")
					.. (object.hardcore and GQ.L['guidehardcore'] or "")
				)
				if suggested and GQ.db.profile.gmstarsuggested then
					row.iconover:Show()
					row.iconover.anim:Play()
				else
					row.iconover:Hide()
				end

				if object.missing then
					row.title:SetTextColor(unpack(SkinData("GuideMenuTextColorMissing")))
					row.icon:SetDesaturated(true)
					if isGuide then
						row:SetScript("OnClick",function(this,button) GuideMenu:ShowMissingPopup(row) end)
						row:SetScript("OnDoubleClick",function(this,button) GuideMenu:ShowMissingPopup(row.guide) end)
					end
				else
					row.title:SetTextColor(unpack(SkinData("GuideMenuTextColor")))
					row.icon:SetDesaturated(false)
				end

				
				row:Show()
			end
			itemindex=itemindex+1 
		end

		GuideMenu.MainFrame.GuideListScrollFrame:TotalValue(results)
		GuideMenu.MainFrame.GuideListScrollFrame:SetValue(rowoff)
		for r=rownum+1,ROW_COUNT do 
			GuideMenu.MainFrame.GuideListScrollFrame.rows[r]:Hide() 
			GuideMenu.MainFrame.GuideListScrollFrame.rows[r].guide=nil 
		end

		if GuideMenu.CurrentRow then GuideMenu.CurrentRow:GetScript("OnEnter")(GuideMenu.CurrentRow) end
	end

	-- if guides need loading, make a guide-load cycle.
	GuideMenu.guideparsetimer = GuideMenu.guideparsetimer or GQ:ScheduleRepeatingTimer(function()
		local all_loaded = GQ:LoadNeededGuides()
		GQ:Debug("Menu: guide full parse cycle: %sall loaded",(all_loaded and "" or "not "))
		if all_loaded then
			GQ:CancelTimer(GuideMenu.guideparsetimer)
			GuideMenu.guideparsetimer = nil
		else
			GuideMenu:Update()
		end
	end, 0.1)
end

function GuideMenu:SetFocusedRow(row)
	if row and (row.guide or row.quest) then 
		if row.quest then
			GuideMenu.FocusedGuide=nil
			if row.quest==GuideMenu.FocusedQuest then
				GuideMenu.FocusedQuest=nil
			else
				GuideMenu.FocusedQuest=row.quest
			end
		elseif row.guide then
			GuideMenu.FocusedQuest=nil
			if row.guide==GuideMenu.FocusedGuide then
				GuideMenu.FocusedGuide=nil
			elseif row.guide then
				GuideMenu.FocusedGuide=row.guide
			end
		end
	else
		-- clear focus
		GuideMenu.FocusedGuide=nil
		GuideMenu.FocusedQuest=nil
	end

	GuideMenu:Update()
end

function GuideMenu:ActivateGuide(guide)
	if not self:IsGuideVisible(guide) then return end

	if not GQ.GuideFuncs:IsValid(guide,nil,"guidemenu") then return end

	-- see if guide already exists, if so activate it and close menu
	if GQ.Tabs:TryToActivateGuide(guide) then 
		GuideMenu:SetFocusedRow()
		GuideMenu:Hide()

		GQ:SetGuide(guide.title,GuideMenu.CurrentPath == "QuestSearch" and guide.QuestSearchStepNum or 1)
		return 
	end
	
	-- depending on mode, either add new tab or replace active one
	if not GuideMenu.UseTab then 
		local tab = GQ.Tabs:GetTabFromPool()
		tab:SetAsCurrent()
		GuideMenu.UseTab = tab
	end

	if GuideMenu.CurrentPath == "QuestSearch" then
		if GuideMenu.UseTab.isActive then
			GQ:SetGuide(guide.title,guide.QuestSearchStepNum or 1)
		else
			GuideMenu.UseTab:AssignGuide(guide.title,guide.QuestSearchStepNum or 1)
		end
	else
		if GuideMenu.UseTab.isActive then
			GQ:SetGuide(guide.title,1) -- guide.CurrentStepNum
		else
			GuideMenu.UseTab:AssignGuide(guide.title,1)
		end
	end

	GuideMenu:SetFocusedRow()
	GuideMenu:Hide()
end

function GuideMenu:ShowRowMouseOver(row)
	--local menu = GuideMenu:GetSectionMenu()
	--if menu and menu:IsVisible() then return end

	if row.guide or row.group or row.quest then row:SetBackdropColor(unpack(row.bdhcolor)) end

	if row.guide and row.guide.missing then 
		GuideMenu:ShowGuideDetails(row.guide)
		row.loadbutton:Hide()
		row.loadbutton.tooltip = L['guidemenu_guidetooltips_missing']
	elseif row.group and row.group.missing then
		GuideMenu:ShowFolderDetails(row.group)
		row.loadbutton:Hide()
		row.loadbutton.tooltip = L['guidemenu_guidetooltips_missing']
	elseif row.guide and row.guide.headerdata then 
		GuideMenu:ShowGuideDetails(row.guide)
		row.loadbutton:Show()
		row.loadbutton.tooltip = L['guidemenu_guidetooltips_loadguide']
		row.favourite:SetShown(not GQ.GuideOnly)
	elseif row.quest then
		GuideMenu:ShowQuestDetails(row.quest)
		row.loadbutton:Show()
		row.loadbutton.tooltip = L['guidemenu_guidetooltips_showquests']
	end
end

function GuideMenu:ShowFolderDetails(group)
	local right = GuideMenu.MainFrame.RightColumn
	right.GuideTitle:SetText(group.name)
	right.GuideDesc:SetText(L["guidemenu_missing_message"])
	right.GuideTitle:Show()
	right.GuideDesc:Show()
end

function GuideMenu:ShowGuideDetails(guide)
	local right = GuideMenu.MainFrame.RightColumn
	if not guide then return end

	--CloseDropDownForks()

	--if GuideMenu.FocusedGuide then guide=GuideMenu.FocusedGuide end -- always show focused

	right.GuideTitle:SetText(guide.title_short .. (guide.beta and GQ.L['guidebeta'] or ""))

	if guide.missing then
		right.GuideDesc:SetText(L["guidemenu_missing_message"])
		right.GuideTitle:Show()
		right.GuideDesc:Show()
		return
	end

	local desc=""

	if GQ.db.profile.debug_display then
		desc = (guide.filepath or "").."\n\n"
	end

	if guide.startlevel and guide.startlevel>0 then
		local color="|cffeceae6"
		if guide.endlevel and guide.endlevel<GQ:GetPlayerPreciseLevel() then
			color=STATUS_COLORS.OUTLEVELED.code
		elseif guide.startlevel>GQ:GetPlayerPreciseLevel() then
			color=STATUS_COLORS.INVALID.code
		end

		desc = desc..color.."Required level: ".. GQ.FormatLevel(guide.startlevel,"mono").."|r\n"
	end
	local guide_desc = (guide.headerdata.description or ""):gsub("_(.-)_","|cfff5bf29%1|r") -- emphasis in GoatQuest gold
	right.GuideDesc:SetText(desc..guide_desc)
	
	right.GuideImage:SetHeight(139)
	if guide.image then
		right.GuideImage:SetTexture(guide.image)
		right.GuideImage:SetTexCoord(0,1,0,1)
		right.GuideModel:Hide()
	elseif guide.headerdata.model and (type(guide.headerdata.model)=="number" or guide.headerdata.model[1]) then
		right.GuideModel:SetModels(guide.headerdata.model)
		right.GuideImage:SetTexture(nil)
		right.GuideModel:Show()
	else
		right.GuideImage:SetTexture(nil)
		if GQ.GuideOnly then right.GuideImage:SetHeight(1) end
		right.GuideImage:SetTexCoord(0,220/256,0,139/256)
		right.GuideModel:Hide()
	end

	local complete,current,total = guide:GetCompletion()

	if type(complete)~="string" then
		complete = complete or 0
		complete=math.round(complete*100)/100
		
		right.GuideProgress:SetPercent(complete*100)
		right.GuideProgress:SetText((complete*100).."%")
		right.GuideProgressLabel:Show()
		right.GuideProgress:Show()
	end

	right.GuideTitle:Show()
	right.GuideDesc:Show()
end

function GuideMenu:ShowQuestDetails(quest)
	local right = GuideMenu.MainFrame.RightColumn
	if not quest then return end

	right.GuideTitle:SetText(quest.questtitle)

	local iconset = GQ.IconSets.TabsIcons

	local inline_icon = "|T"..iconset.file..":14:14:0:0:"..iconset.width..":"..iconset.height..":%d:%d:%d:%d|t"

	local desc="Following guides found for this quest:\n"

	for _,guide in ipairs(quest.guides) do
		local texcoords = GQ.IconSets.TabsIcons[guide.type].texcoord
		local l,r,t,b = texcoords[1]*iconset.width,texcoords[2]*iconset.width,texcoords[3]*iconset.height,texcoords[4]*iconset.height
		desc = desc .. inline_icon:format(l,r,t,b) .. guide.title_short .. "\n"
	end
	right.GuideDesc:SetText(desc)

	local first_guide = quest.guides[1] and GQ:GetGuideByTitle(quest.guides[1].title)
	if not first_guide then return end

	right.GuideImage:SetHeight(139)
	if first_guide.image then
		right.GuideImage:SetTexture(first_guide.image)
		right.GuideImage:SetTexCoord(0,1,0,1)
		right.GuideModel:Hide()
	elseif first_guide.headerdata.model and (type(first_guide.headerdata.model)=="number" or first_guide.headerdata.model[1]) then
		right.GuideModel:SetModels(first_guide.headerdata.model)
		right.GuideImage:SetTexture(nil)
		right.GuideModel:Show()
	else
		right.GuideImage:SetTexture(nil)
		if GQ.GuideOnly then right.GuideImage:SetHeight(1) end
		right.GuideImage:SetTexCoord(0,220/256,0,139/256)
		right.GuideModel:Hide()
	end

	--[[
	local complete,current,total = guide:GetCompletion()

	if type(complete)~="string" then
		complete = complete or 0
		complete=math.round(complete*100)/100
		
		right.GuideProgress:SetPercent(complete*100)
		right.GuideProgress:SetText((complete*100).."%")
		right.GuideProgressLabel:Show()
		right.GuideProgress:Show()
	end
	--]]

	right.GuideTitle:Show()
	right.GuideDesc:Show()
end

function GuideMenu:HideRowMouseOver(row,force) 
	if row then row:SetBackdropColor(unpack(row.bdcolor)) end

	if row and row.guide then
		if not row.guide:IsFavourite() then row.favourite:Hide() end
		row.loadbutton:Hide()
	elseif row and row.quest then
		row.loadbutton:Hide()
	end

	if GuideMenu.FocusedGuide and not force then GuideMenu:ShowGuideDetails(GuideMenu.FocusedGuide) return end
	if GuideMenu.FocusedQuest and not force then GuideMenu:ShowQuestDetails(GuideMenu.FocusedQuest) return end
	--if GuideMenu.FocusedGuide then GuideMenu:ShowGuideDetails() return end -- always show focused
	
	local right = GuideMenu.MainFrame and GuideMenu.MainFrame.RightColumn
	if not right then return end

	right.GuideImage:SetTexture(nil)
	right.GuideImage:SetHeight(GQ.GuideOnly and 1 or 139)
	right.GuideImage:SetTexCoord(0,220/256,0,139/256)

	if GQ.GuideOnly then
		right.GuideTitle:SetText("Choose a guide")
		right.GuideDesc:SetText("Select a guide to see its details. Double-click it or use the arrow on its row to begin.")
		right.GuideTitle:Show()
		right.GuideDesc:Show()
		right.GuideMascot:Hide()
	else
		right.GuideTitle:Hide()
		right.GuideDesc:Hide()
	end
	right.GuideProgressLabel:Hide()
	right.GuideProgress:Hide()
	right.GuideModel:Hide()
end

function GuideMenu:AnyGuideValid(group)
	for _,guide in ipairs(group.guides) do
		if not guide.missing then
			return true
		end
	end

	for _,subgroup in ipairs(group.groups) do
		if GuideMenu:AnyGuideValid(subgroup) then
			return true
		end
	end

	return false
end

function GuideMenu:ShowMissingPopup(row)
	GuideMenu.MissingPopup:Show()
end

tinsert(GQ.startups,{"Guide Menu",function(self)
	GuideMenu:CreateFrames()
	if not GQ.GuideOnly then GuideMenu:CreateHome() end
	GuideMenu:CreateRequestFrame()
end})

tinsert(GQ.startups,{"Guide Menu Featured",function(self)
	GuideMenu:StartFeatured()
end,after="guides_loaded"})
