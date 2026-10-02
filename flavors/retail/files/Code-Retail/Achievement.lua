local name,GQ = ...

local Achievement = {
	Icons = {},
	AvailGuides = {},
}

GQ.Achievement = Achievement

tinsert(GQ.startups,{"Achievement: frame hook",function(self)
	hooksecurefunc("ToggleAchievementFrame",function() Achievement:IconSetup() end)
end})

local CHAIN = GQ.ChainCall
local L = GQ.L

--GoatQuest button for the Achievement Journal

function Achievement.Icon_OnClick(self,but)
	local achievebut=self:GetParent()
	local achieveID = achievebut.id
	if achieveID and Achievement.AvailGuides[achieveID] then
		GQ.Tabs:LoadGuideToTab(Achievement.AvailGuides[achieveID],1,"achieveid")
		return
	end
	GQ:Error("How odd. Achievement GoatQuest Button clicked, but we don't seem to have a guide for %s",achievebut.label:GetText())
end

function Achievement.ScheduleUpdate()
	GQ:ScheduleTimer(function() Achievement.UpdateIcons() end, 0.0001)
end

function Achievement.UpdateIcons()
	GQ.SearchIconPool:ReleaseAll()

	local i, blizzbutton
	for i,blizzbutton in ipairs(AchievementFrameAchievements.ScrollBox.view.frames) do
		local button = GQ.SearchIconPool:Acquire()
		button:SetParent(blizzbutton)
		button:SetPoint("TOPRIGHT",blizzbutton,"TOPRIGHT",-5,-5)
		button:SetFrameLevel(blizzbutton.Shield:GetFrameLevel()+1)
		button.tooltiptext = L['achieveframe_button']:format(blizzbutton.Label:GetText())
		button:SetScript("OnClick", function(...) GQ.Achievement.Icon_OnClick(...) end)

		local achieveID = blizzbutton.id
	
		if achieveID and Achievement.AvailGuides[achieveID] and blizzbutton:IsShown() then
			GQ:Debug("&achieveguides Showing icon for achievement %d",achieveID,blizzbutton.Label:GetText())
			button:Show()
		else
			if GQ.db.profile.debug then
				if not blizzbutton:IsShown() then
					GQ:Debug("&achieveguides Not showing icon for achievement button %d... hidden",i)
				elseif not achieveID then
					GQ:Debug("&achieveguides Not showing icon for achievement %s... unknown??",blizzbutton.Label:GetText())
				elseif not Achievement.AvailGuides[achieveID] then
					GQ:Debug("&achieveguides Not showing icon for achievement %d %s: no guide",achieveID,blizzbutton.Label:GetText())
				elseif blizzbutton.completed then
					GQ:Debug("&achieveguides Not showing icon for achievement %d %s: completed",achieveID,blizzbutton.Label:GetText())
				end
			end
			button:Hide()
		end
	end
	--]]
end

function Achievement:IconSetup()
	if self.loaded then return end

	for g,guide in ipairs(GQ.registeredguides) do
		if guide.headerdata.achieveid then
			if type(guide.headerdata.achieveid) == "table" then
				local id
				for _,id in pairs(guide.headerdata.achieveid) do
					self.AvailGuides[id]=guide 
				end
			elseif type(guide.headerdata.achieveid) == "number" then
				self.AvailGuides[guide.headerdata.achieveid]=guide 
			end
		end
	end

	GQ.SearchIconPool = GQ.SearchIconPool or CreateFramePool("BUTTON",nil,"GoatQuestSearchButton")
	hooksecurefunc(AchievementFrameAchievements.ScrollBox,"Update",Achievement.ScheduleUpdate)

	Achievement.loaded=true
end