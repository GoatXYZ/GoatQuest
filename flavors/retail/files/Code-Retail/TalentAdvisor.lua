local name,GQ = ...

GQ.TalentAdvisor = {}

local TA = GQ.TalentAdvisor
local CHAIN = GQ.ChainCall

local currency_to_build = {
	[1] = "tclass",
	[2] = "tspec",
	--"thleft","thright" are set up later, since they can be any combination of 3,4,5
}


function TA.Initialise()
	if TA.Initialised then return end
	-- hook functions
	PlayerSpellsFrame.SpecFrame:HookScript("OnShow",TA.SetSpec)
	PlayerSpellsFrame.TalentsFrame:HookScript("OnShow",function() TA.SetTalents() end)
	PlayerSpellsFrame.TalentsFrame.SelectionChoiceFrame:HookScript("OnShow",TA.SetSelectionTalents)
	--GQ:AddEventHandler("TRAIT_NODE_CHANGED",TA.DelayedSetTalents)
	GQ:AddEventHandler("TRAIT_TREE_CURRENCY_INFO_UPDATED",TA.DelayedSetTalents)

	-- set up icons
	TA.IconPool = CreateFramePool("BUTTON",nil,"GoatQuestTalentIconButton")
	TA.IconSelectionPool = CreateFramePool("BUTTON",nil,"GoatQuestTalentIconButton")

	TA.SpecIcon  = CHAIN(CreateFrame("Button"))
		:SetSize(30,30)
		:SetPoint("TOPRIGHT")
		:SetNormalTexture(GQ.SKINSDIR.."goatquest-icon")
		:SetFrameStrata("HIGH")
		:SetFrameLevel(76)	
		:SetScript("OnEnter", function() TA.ShowTooltip(TA.SpecIcon) end)
		:SetScript("OnLeave", function() GameTooltip:Hide() end)
		:Hide()
	.__END
	TA.SpecIcon:GetNormalTexture():SetTexCoord(0,0,0,1/2 , 1,0,1,1/2)

	-- add menu button
	local mapbuttonsize=20

	TA.MenuButton = GQ.ChainCall(CreateFrame("BUTTON",nil,PlayerSpellsFrame.TalentsFrame,"GoatQuestSpecialButton_Template"))
		:ApplySkin()
		:SetSize(32,32)
		:SetPoint("RIGHT",PlayerSpellsFrame.TalentsFrame.ApplyButton,"LEFT", -20, 0)
		:SetFrameLevel(611)

		:SetScript("OnClick", function() TA:ShowMenu() end)
		:Show()
	.__END

	-- record class
	TA.PlayerClass = select(2,UnitClass("player"))
	TA.ClassBuilds = TA.Builds[TA.PlayerClass]

	TA.Initialised = true

	-- strip TalentNodes, do reverse mapping
	TA.TalentNodes = TA.TalentNodes[TA.PlayerClass]
	TA.TalentNodesLookup = {}
	for spec,trees in pairs(TA.TalentNodes) do
		TA.TalentNodesLookup[spec] = {}
		for tree,nodes in pairs(trees) do
			TA.TalentNodesLookup[spec][tree]={}
			for name,node in pairs(nodes) do
				if TA.TalentNodesLookup[spec][tree][node] then GQ:Debug("&talentadvisor duplicate %s %s %s",spec,tree,node) end
				if type(node)=="table" then
					for _,variant in ipairs(node) do
						TA.TalentNodesLookup[spec][tree][variant]=name
					end
				else
					TA.TalentNodesLookup[spec][tree][node]=name
				end
			end
		end
	end

	GQ:ScheduleRepeatingTimer(function() 
		if TA.Learning then
			TA:LearnNextTalent()
		end
	end,0.1)
end

function TA.ShowTooltip(object)
	GameTooltip:SetOwner(object,"ANCHOR_TOP")
	GameTooltip:SetText("GoatQuest recommendation")
	GameTooltip:Show()
end

function TA.SetSpec()
	if not GQ.db.profile.talenton then return end

	local suggested_spec = TA.SuggestedSpec[TA.PlayerClass]
	
	for frame in PlayerSpellsFrame.SpecFrame.SpecContentFramePool:EnumerateActive() do
		if frame.specIndex == suggested_spec then
			TA.SpecIcon:SetParent(frame)
			TA.SpecIcon:ClearAllPoints()
			TA.SpecIcon:SetPoint("TOPRIGHT",frame.SpecImage)
			TA.SpecIcon:Show()
		end
	end
end

function TA.DelayedSetTalents() 
	-- TRAIT_TREE_CURRENCY_INFO_UPDATED can now fire outside of talent frame, make sure we are loaded first
	if not (PlayerSpellsFrame and PlayerSpellsFrame.TalentsFrame:IsVisible()) then return end
	if not TA.Initialised then return end 
	C_Timer.After(0,function() TA.SetTalents()  end)
end

local function getNodeEntries(nodeInfo)
	local entries = {}
	for _,entry in ipairs(nodeInfo.entryIDs) do table.insert(entries,entry) end
	if nodeInfo.type==0 then entries[2]=nil end -- some nodes have split entries eventhough they are single talent ones

	return entries
end

function TA.SetTalents(ident) 
	if not GQ.db.profile.talenton then return end
	if not GQ.db.profile.ta_toggle_icons then return end
	local spec = GetSpecialization()
	if not spec then return end
	ident = ident or GQ.db.char.talentbuilds[spec]

	-- get build
	TA.ActiveBuild = TA:GetBuild(ident) 
	if not TA.ActiveBuild then return end

	-- get build status
	local status = TA:GetBuildStatus() 

	-- map blizzard talent buttons to entryIDs
	local blizzbuttons = {}
	for _,blizzbutton in pairs(PlayerSpellsFrame.TalentsFrame.nodeIDToButton) do
		for _,entryID in ipairs(getNodeEntries(blizzbutton.nodeInfo)) do
			blizzbuttons[entryID] = blizzbutton
		end
	end

	-- for each talent in build, find node, show icons
	TA.IconPool:ReleaseAll()
	for entryID,data in pairs(status) do
		local blizzbutton = blizzbuttons[entryID]
		if blizzbutton and data~="GOOD" then
			local nodeinfo = blizzbutton.nodeInfo
			local available = nodeinfo.meetsEdgeRequirements
			local value = data

			if type(data)=="table" then
				value = data[1]
				available = not data[2] and available
			end

			local goatquestbutton = TA.IconPool:Acquire()
			CHAIN(goatquestbutton)
				:SetParent(blizzbutton)
				:SetPoint("TOPRIGHT",blizzbutton,"TOPRIGHT",18,18)
				:SetFrameStrata("MEDIUM")
				:SetFrameLevel(1900)
				:SetValue(value)
				:Show()

			-- sets desaturation if node can't be reached, or paid for
			goatquestbutton:SetAvailable(available and blizzbutton:CanAfford())
		end
	end
end

function TA.SetSelectionTalents()
	if not GQ.db.profile.talenton then return end
	if not GQ.db.profile.ta_toggle_icons then return end

	local blizzbuttons = {}
	for _,blizzbutton in pairs(PlayerSpellsFrame.TalentsFrame.SelectionChoiceFrame.selectionFrameArray) do
		blizzbuttons[blizzbutton.entryID] = blizzbutton
	end

	local status = TA:GetBuildStatus() 
	TA.IconSelectionPool:ReleaseAll()
	for entryID,data in pairs(status) do
		local blizzbutton = blizzbuttons[entryID]
		if blizzbutton then
			local value = type(data)=="table" and data[1] or data
			
			local goatquestbutton = TA.IconSelectionPool:Acquire()
			CHAIN(goatquestbutton)
				:SetParent(blizzbutton)
				:SetPoint("TOPRIGHT",blizzbutton,"TOPRIGHT",10,10)
				:SetFrameStrata("HIGH")
				:SetFrameLevel(2000)
				:SetValue(value)
				:Show()
		end
	end
end

function TA:ParseLines(text,spec,tree)
	local array={}
	local index=1
	local st,en,line
	text = text .. "\n"
	local count

	if not (TA.TalentNodes[spec] and TA.TalentNodes[spec][tree]) then return array end

	local TalentNodes = TA.TalentNodes[spec][tree]

	while (index<#text) do
		st,en,line=string.find(text,"(.-)\n",index)
		if not en then break end
		index = en + 1
		line = line:gsub("//.*$",""):gsub("%-%-.*$","")  -- comments away
		line = line:gsub("^[%s	]+",""):gsub("[%s	]+$","")  -- whitespace away
		line = line:gsub("||","|")
		line = line:gsub("/[0-9]+","")  -- /3 are just fluff, remove

		if line~="" then tinsert(array,line) end
	end
	return array
end

local function GetConfigID()
	return PlayerSpellsFrame.TalentsFrame.configurationInfo.ID
end

function TA:GetBuild(ident) 
	-- get current spec
	local spec = GetSpecialization()
	if not spec then return end

	-- get build data
	local build
	
	for i,v in pairs(TA.ClassBuilds) do
		if v.ident == ident then
			build = v
		end
	end
	if not build then
		for i,v in pairs(TA.ClassBuilds) do
			if v.spec == spec and v.suggested then
				build = v
			end
		end
	end

	if not build then return end
	GQ.db.char.talentbuilds[spec] = build.ident

	-- parse build, explode to one point per entry
	local talentFrame = PlayerSpellsFrame.TalentsFrame
	
	local configID = GetConfigID()
	local currencyToTree={}
	for i,v in pairs(talentFrame.treeCurrencyInfo) do currencyToTree[v.traitCurrencyID] = i end

	if not build.parsed then 
		build.tclass = TA:ParseLines(build.classtalents,build.spec,1) 
		build.tspec = TA:ParseLines(build.spectalents,build.spec,2)

		local heroPanel = PlayerSpellsFrame.TalentsFrame.HeroTalentsContainer
		local herotrees = heroPanel and heroPanel.activeSubTreeSelectionNodeInfo and heroPanel.activeSubTreeSelectionNodeInfo.entryIDs
		if herotrees then
			local left = herotrees[1]
			local right = herotrees[2]

			-- set currency_to_build to point to correct trees
			local leftEntryInfo =  C_Traits.GetEntryInfo(configID, left)
			local leftTreeInfo = C_Traits.GetSubTreeInfo(configID, leftEntryInfo.subTreeID);
			local rightEntryInfo =  C_Traits.GetEntryInfo(configID, right)
			local rightTreeInfo = C_Traits.GetSubTreeInfo(configID, rightEntryInfo.subTreeID);
		
			build.thleftnum,build.thrightnum = currencyToTree[leftTreeInfo.traitCurrencyID],currencyToTree[rightTreeInfo.traitCurrencyID]
			build.thleft = TA:ParseLines(build.herolefttalents,build.spec,build.thleftnum) 
			build.thright = TA:ParseLines(build.herorighttalents,build.spec,build.thrightnum) 
		end
	end

	-- build spell to entry mapping
	TA.NodeToEntry = {}

	for _,button in pairs(talentFrame.nodeIDToButton) do
		local nodeInfo = button.nodeInfo
		local cost = C_Traits.GetNodeCost(configID,nodeInfo.ID)
		local tree = cost and cost[1] and currencyToTree[cost[1].ID]

		if tree then
			for entryNum,entryID in pairs(getNodeEntries(nodeInfo)) do
				TA.NodeToEntry[tree] = TA.NodeToEntry[tree] or {}
				TA.NodeToEntry[tree][("%s,%s,%s"):format(nodeInfo.posX,nodeInfo.posY,entryNum)]=entryID
			end
		end
	end
	
	return build
end

local function getEntryIDbyTalent(tree,talent)
	if not TA.ActiveBuild then return false end
	local node = TA.TalentNodes[TA.ActiveBuild.spec][tree][talent]
	if type(node)=="table" then
		local returns={}
		for _,multinode in ipairs(node) do
			table.insert(returns,TA.NodeToEntry[tree][multinode])
		end
		return returns
	end
	return TA.NodeToEntry[tree][node]
end

function TA:GetBuildStatus()
	local build = TA.ActiveBuild
	local status = {}

	if not build then return status end

	local currencyInfo = PlayerSpellsFrame.TalentsFrame.treeCurrencyInfo
	if not currencyInfo then return status end
	
	local total_points = {}
	for _,talent in ipairs(build.tclass) do
		local entryID = getEntryIDbyTalent(1,talent)
		if entryID then
			if type(entryID)=="table" then
				for i,multiEntryID  in pairs(entryID) do
					total_points[multiEntryID] = (total_points[multiEntryID] or 0) + 1
				end
			else
				total_points[entryID] = (total_points[entryID] or 0) + 1
			end
		end
	end
	for _,talent in ipairs(build.tspec) do
		local entryID = getEntryIDbyTalent(2,talent)
		if entryID then
			if type(entryID)=="table" then
				for i,multiEntryID  in pairs(entryID) do
					total_points[multiEntryID] = (total_points[multiEntryID] or 0) + 1
				end
			else
				total_points[entryID] = (total_points[entryID] or 0) + 1
			end
		end
	end
	if build.thleft then
		for _,talent in ipairs(build.thleft) do
			local entryID = getEntryIDbyTalent(build.thleftnum,talent)
			if entryID then
				if type(entryID)=="table" then
					for i,multiEntryID  in pairs(entryID) do
						total_points[multiEntryID] = (total_points[multiEntryID] or 0) + 1
					end
				else
					total_points[entryID] = (total_points[entryID] or 0) + 1
				end
			end
		end
	end
	if build.thright then
		for _,talent in ipairs(build.thright) do
			local entryID = getEntryIDbyTalent(build.thrightnum,talent)
			if entryID then
				if type(entryID)=="table" then
					for i,multiEntryID  in pairs(entryID) do
						total_points[multiEntryID] = (total_points[multiEntryID] or 0) + 1
					end
				else
					total_points[entryID] = (total_points[entryID] or 0) + 1
				end
			end
		end
	end
	
	-- check if nodes have correct amount of points spent
	for _,blizzbutton in pairs(PlayerSpellsFrame.TalentsFrame.nodeIDToButton) do
		local nodeInfo = blizzbutton.nodeInfo
		local activeEntry = nodeInfo.activeEntry 
		local entryInfo = blizzbutton.entryInfo 
		local activeEntryID = activeEntry and activeEntry.entryID
		local isCapstoneNode = entryInfo and (entryInfo.type == Enum.TraitNodeEntryType.SpendCapstoneCircle or entryInfo.type == Enum.TraitNodeEntryType.SpendCapstoneSquare);
		local currentRank = activeEntry and activeEntry.rank or nodeInfo.activeRank
		if isCapstoneNode then currentRank = activeEntry.entryID==blizzbutton.entryID and nodeInfo.activeRank or 0 end
		
		if activeEntryID then
			if (nodeInfo.currentRank or 0)>(nodeInfo.ranksPurchased or 0) then
				-- talent learned automatically, cannot be unlearned
				status[activeEntryID] = "GOOD"
			elseif not total_points[activeEntryID] then
				if currentRank>0 then
					status[activeEntryID] = "BAD"
				end
			elseif total_points[activeEntryID]==currentRank then
				status[activeEntryID] = "GOOD"
			elseif total_points[activeEntryID]<currentRank then
				status[activeEntryID] = "BAD"
			else
				status[activeEntryID] = total_points[activeEntryID] - currentRank
			end
		else
			for _,entryID in ipairs(getNodeEntries(nodeInfo)) do
				if not total_points[entryID] then
					if currentRank>0 then
						status[entryID] = "BAD"
					end
				elseif total_points[entryID]==currentRank  then
					status[entryID] = "GOOD"
				elseif total_points[entryID]<currentRank then
					status[entryID] = "BAD"
				else
					status[entryID] = total_points[entryID] - currentRank
				end
			end
		end
	end

	local foundNext = false
	for _,talent in ipairs(build.tclass) do
		local entryID = getEntryIDbyTalent(1,talent)
		if entryID then
			if tonumber(status[entryID]) then
				status[entryID] = {tonumber(status[entryID]), foundNext}
				foundNext = true
			end
		end
	end

	local foundNext = false
	for _,talent in ipairs(build.tspec) do
		local entryID = getEntryIDbyTalent(2,talent)
		if entryID then
			if type(entryID)=="table" then
				for i,multiEntryID  in pairs(entryID) do
					if tonumber(status[multiEntryID]) then
						status[multiEntryID] = {tonumber(status[multiEntryID]), foundNext}
						foundNext = true
					end
				end
			else
				if tonumber(status[entryID]) then
					status[entryID] = {tonumber(status[entryID]), foundNext}
					foundNext = true
				end
			end
		end
	end

	if build.thleft then
		local foundNext = false
		for _,talent in ipairs(build.thleft) do
			local entryID = getEntryIDbyTalent(build.thleftnum,talent)
			if entryID then
				if tonumber(status[entryID]) then
					status[entryID] = {tonumber(status[entryID]), foundNext}
					foundNext = true
				end
			end
		end
	end

	if build.thright then
		local foundNext = false
		for _,talent in ipairs(build.thright) do
			local entryID = getEntryIDbyTalent(build.thrightnum,talent)
			if entryID then
				if tonumber(status[entryID]) then
					status[entryID] = {tonumber(status[entryID]), foundNext}
					foundNext = true
				end
			end
		end
	end
			

	-- return array of etries-status for current level
	return status
end

function TA:LearnBuild()
	local build = TA.ActiveBuild
	if not build then return end

	local talentsframe = PlayerSpellsFrame.TalentsFrame

	local configID = GetConfigID()
	local treeID = talentsframe.talentTreeID
	C_Traits.ResetTree(configID,treeID)

	local currencyToTree={}
	for i,v in pairs(talentsframe.treeCurrencyInfo) do currencyToTree[v.traitCurrencyID] = i end
	currency_to_build[3]=nil
	currency_to_build[4]=nil
	currency_to_build[5]=nil

	-- Hero talents
	local heroPanel = talentsframe.HeroTalentsContainer
	if heroPanel then
		if UnitLevel("player") >= heroPanel.heroSpecsRequiredLevel then
			local heroSubtrees = heroPanel.activeSubTreeSelectionNodeInfo
			local nodeID = heroSubtrees.ID
			local left = heroSubtrees.entryIDs[1]
			local right = heroSubtrees.entryIDs[2]

			-- set currency_to_build to point to correct trees
			local leftEntryInfo =  C_Traits.GetEntryInfo(configID, left)
			local leftTreeInfo = C_Traits.GetSubTreeInfo(configID, leftEntryInfo.subTreeID);
			local rightEntryInfo =  C_Traits.GetEntryInfo(configID, right)
			local rightTreeInfo = C_Traits.GetSubTreeInfo(configID, rightEntryInfo.subTreeID);
			currency_to_build[currencyToTree[leftTreeInfo.traitCurrencyID]] = "thleft"
			currency_to_build[currencyToTree[rightTreeInfo.traitCurrencyID]] = "thright"
			
			-- pick sugested tree
			if build.hero=="left" then C_Traits.SetSelection(configID,nodeID,left) end
			if build.hero=="right" then C_Traits.SetSelection(configID,nodeID,right) end
		end
	end

	-- wait till next frame, so that blizz data for nodes refreshes into reset state
	GQ:ScheduleTimer(function() TA.Learning = true end,0)
end

function logerror(index,name,spell,reason)
	GQ:Debug(("&talentadvisor Failed to learn %s %s##%s : %s"):format(index,name or "?",spell or "?",reason))
end

function TA:LearnNextTalent()
	local build = TA.ActiveBuild
	if not build then return end

	local configID = GetConfigID()
	local treeID = PlayerSpellsFrame.TalentsFrame.talentTreeID

	local entry_to_node = {}
	for _,blizzbutton in pairs(PlayerSpellsFrame.TalentsFrame.nodeIDToButton) do
		local nodeInfo = blizzbutton.nodeInfo
		for _,entryID in ipairs(nodeInfo.entryIDs) do
			entry_to_node[entryID] = nodeInfo
		end
	end

			
	local points_at_level = {}
	local currencyInfo = PlayerSpellsFrame.TalentsFrame.treeCurrencyInfo
	for currency,buildtype in pairs(currency_to_build) do
		local pointsMax = currencyInfo[currency].maxQuantity
		local builddata = build[buildtype]
		for i=1,pointsMax do
			if builddata[i] then
				local spellID = builddata[i]
				local entryID = spellID and getEntryIDbyTalent(currency,builddata[i])
				if spellID and entryID then
					local node = entry_to_node[entryID]
					local apexnode = type(entryID)=="table"
					
					if apexnode then
						for _,multiEntryID in ipairs(entryID) do
							if entry_to_node[multiEntryID] then
								entryID = multiEntryID
								node = entry_to_node[multiEntryID]
								break
							end
						end
					end
					points_at_level[entryID] = (points_at_level[entryID] or 0) + 1

					if node then 
						if not node.meetsEdgeRequirements then
							logerror(i,builddata[i].name,spellID,"requirements not met")
							TA.Learning = false
							return
						end
						local activeEntry = node.activeEntry 
						local node_entryID = activeEntry and activeEntry.entryID or node.entryIDs[1]
						local currentRank = activeEntry and activeEntry.rank or node.activeRank or 0

						if node_entryID~=entryID or points_at_level[entryID] > currentRank then
							node.activeEntry = node.activeEntry or {}
							node.activeEntry.entryID = entryID
							node.activeEntry.rank = points_at_level[entryID]
							if #node.entryIDs>1 and not node.nextEntry and not apexnode then
								C_Traits.SetSelection(configID,node.ID,entryID)
							else
								C_Traits.PurchaseRank(configID,node.ID)
							end
							return
						end
					else
						logerror(i,builddata[i].name,entryID,"node doesn't exist")
						TA.Learning = false
						return
					end
				else
					logerror(i,builddata[i].name,spellID,"entry doesn't exist")
					TA.Learning = false
					return
				end
			end
		end
	end
	TA.Learning = false
	return
end

function TA:Toggle(mode)
	-- show/hide icons
	if not TA.Initialised then return end

	if mode then
		TA.SetSpec()
		TA.SetTalents()
		TA.SpecIcon:Show()
		TA.MenuButton:Show()
	else
		TA.IconPool:ReleaseAll()
		TA.IconSelectionPool:ReleaseAll()
		TA.SpecIcon:Hide()
		TA.MenuButton:Hide()
	end
end

function TA:ShowMenu()
	local L=GoatQuest_L("zta")
	local parent=TA.MenuButton
	if not TA.MenuDropdown then TA.MenuDropdown = CreateFrame("FRAME",nil,TA.MenuButton,"UIDropDownForkTemplate") end
	if DropDownForkList1 and DropDownForkList1:IsShown() and DropDownForkList1.dropdown==TA.MenuDropdown then CloseDropDownForks() return end
	UIDropDownFork_SetAnchor(TA.MenuDropdown, 0, 0, "BOTTOMLEFT", TA.MenuButton, "BOTTOMRIGHT")

	local menu = {
		{ 
			text = L['ta_toggle_icons'],
			keepShownOnClick=true, 
			checked = function() return GQ.db.profile.ta_toggle_icons end, 
			func = function() 
				GQ.db.profile.ta_toggle_icons = not GQ.db.profile.ta_toggle_icons
				TA:Toggle(GQ.db.profile.ta_toggle_icons)
				UIDropDownFork_Refresh(TA.MenuDropdown) 
			end 
		},
		{
			text = L['ta_select_suggested'],
			func = function() TA:LearnBuild() end,
			notCheckable=0,
		},
		UIDropDownFork_separatorInfo,
	}


	local spec = GetSpecialization()
	if not spec then return end

	if TA.ClassBuilds and spec then
		for _,build in ipairs(TA.ClassBuilds) do
			if build.spec==spec then
				table.insert(menu,{
					text = build.name,
					func = function() TA.SetTalents(build.ident) UIDropDownFork_RefreshAll(TA.MenuDropdown) end,
					checked = function() 
						local spec = GetSpecialization()
						if not spec then return end
						return GQ.db.char.talentbuilds[spec]==build.ident 
					end,
					keepShownOnClick = true,
				})
			end
		end
	end

	if GQ.DEV then
		table.insert(menu,UIDropDownFork_separatorInfo)
		table.insert(menu,{
			text = "DEV: Live record build",
			func = function() GQ.Testing.RecordTalents() end,
			notCheckable=0,
		})
		table.insert(menu,{
			text = "DEV: Dump talents",
			func = function() GQ.Testing.DumpTalents() end,
			notCheckable=0,
		})
		table.insert(menu,{
			text = "DEV: Export current build",
			func = function() GQ.Testing.ExportCurrentBuild() end,
			notCheckable=0,
		})
		table.insert(menu,{
			text = "DEV: Check for talent changes",
			func = function() GQ.Testing.CheckForChanges() end,
			notCheckable=0,
		})
	end


	

	EasyFork(menu,TA.MenuDropdown,nil,0,0,"MENU",false)
	UIDropDownFork_SetWidth(TA.MenuDropdown, 300)
end

GoatQuestTalentIconButton_Mixin = {}
function GoatQuestTalentIconButton_Mixin:SetValue(value)
	self:EnableMouse(false)	
	self.currentvalue = value
	GQ.IconSets.TalentPoints[value]:AssignToTexture(self:GetNormalTexture())
end

function GoatQuestTalentIconButton_Mixin:SetAvailable(mode)
	self.playAnimation = false
	self.glow:Hide()
	self:SetScript("OnUpdate",nil)

	local mode = mode or self.currentvalue=="BAD" -- bad is always highlighted
	if mode then
		if self.currentvalue=="GOOD" then
			self:SetAlpha(0.5)
		else
			self:SetAlpha(1)
			if self.currentvalue~="BAD" then
				self.playAnimation = true
				self.glow:Show()
				self.el = 0
				self.animcycle = 0
				self:SetScript("OnUpdate",self.HandleAnimation)
			end
		end
	else
		self:SetAlpha(0.5)
	end
	self:GetNormalTexture():SetDesaturated(not mode)
end

function GoatQuestTalentIconButton_Mixin:HandleAnimation(elapsed)
	if not self.playAnimation then return end
	
	self.el = self.el + elapsed
	if self.el>0.1 then
		self.el = 0
		self.animcycle = self.animcycle + 1
		if self.animcycle>8 then self.animcycle=1 end
		local texkey = "ANIM" .. self.animcycle
		GQ.IconSets.TalentPoints[texkey]:AssignToTexture(self.glow.tex)
	end
end

tinsert(GQ.startups,{"Talent Advisor",function(self)
	EventUtil.ContinueOnAddOnLoaded("Blizzard_PlayerSpells", TA.Initialise);
end})