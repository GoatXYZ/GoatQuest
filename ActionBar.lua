local name,GQ = ...

local GetSpellInfo = GQ.Retrofit.C_Spell.GetSpellInfo
local GetSpellCooldown = GQ.Retrofit.C_Spell.GetSpellCooldown

-- GLOBAL BINDING_HEADER_GOATQUESTACTIONBAR

local ActionBar = {
	Buttons = {},
	KeyboundButtons = {},
}

GQ.ActionBar = ActionBar

local CHAIN = GQ.ChainCall
local L = GQ.L
local ui = GQ.UI
local SkinData = ui.SkinData

local BUTTON_SIZE = 30
local BAR_HEIGHT = BUTTON_SIZE+10

local GetSpellCooldown = C_Spell.GetSpellCooldown or GetSpellCooldown

local function OnEvent(self, event)
	if not GQ.db.profile.enable_actionbar then return end -- disabled
	if not GQ.ActionBar or not GQ.ActionBar.Frame then return end -- we are too early
	if not GQ.CurrentStep then return end -- we will retry on step focus
	if event=="BAG_UPDATE_DELAYED" and not GQ.db.profile.actionbar_trash then return end -- trasher is disabled, we do not care about bag changes
	if event=="PLAYER_REGEN_DISABLED" then ActionBar.Lockdown = true end
	if event=="PLAYER_REGEN_ENABLED" then ActionBar.Lockdown = false end
		
	if event=="GQ_STARTED_SKIPPING" then 
		ActionBar:ClearBar("forcehide")
		return
	end
	
	if event~="GQ_STOPPED_SKIPPING" and GQ.skipping then return end

	-- only events registered here are for updating action bar, so no need to handle them separately
	ActionBar:SetActionButtons()

	if (event=="GQ_STEP_CHANGED" or event=="GQ_GOAL_COMPLETED" or event=="GQ_GOAL_UNCOMPLETED") and not GQ.skipping and ActionBar.Frame.snapped then
		GQ:ScheduleTimer(function() ActionBar:SavePosition() end,0.1)
	end
end

local function DragStart(self)
	if InCombatLockdown() or ActionBar.Lockdown then return false end

	local objtype = self:GetAttribute("type")
	local object = self:GetAttribute(objtype)
	if objtype == 'item' then
		C_Item.PickupItem(object)
	elseif objtype == 'macro' then
		PickupMacro(object)
	elseif objtype == 'petaction' then
		PickupPetAction(object)
	elseif objtype == 'spell' then
		PickupSpell(object)
	end
end

function ActionBar:IsExpandingRight()	--[2]=("Right") in actionbar_direction = expanding buttons to the right, anchored to the left
	return GQ.db.profile.actionbar_direction == 2
end

function ActionBar:Initialise()
	ActionBar:CreateFrame()

	-- create globals for blizzard keybind menu
	for i=1,5 do
		_G[("BINDING_NAME_CLICK GoatQuestAB%d:LeftButton"):format(i)] = ("GoatQuest action button %d"):format(i)
	end
	BINDING_HEADER_GOATQUESTACTIONBAR = "GoatQuest Action Bar"
	GQ:AddMessageHandler("GQ_STEP_CHANGED",OnEvent)
	GQ:AddMessageHandler("GQ_GOAL_COMPLETED",OnEvent)
	GQ:AddMessageHandler("GQ_GOAL_UNCOMPLETED",OnEvent)
	GQ:AddMessageHandler("GQ_STARTED_SKIPPING",OnEvent)
	GQ:AddMessageHandler("GQ_STOPPED_SKIPPING",OnEvent)

	GQ:AddMessageHandler("GQ_NPC_TRANSLATED",OnEvent)
	GQ:AddEventHandler("PLAYER_REGEN_ENABLED",OnEvent)
	GQ:AddEventHandler("PLAYER_REGEN_DISABLED",OnEvent)
	if GQ.IsRetail then GQ:AddEventHandler("UPDATE_VEHICLE_ACTIONBAR",OnEvent) end
	GQ:AddEventHandler("BAG_UPDATE_DELAYED",OnEvent)

	local function poolinit(frame)
		frame:SetAttribute("_onstate-combathide", "if newstate == 'show' then self:Show(); else self:Hide(); end")
		frame:SetParent(ActionBar.Frame)
		frame:SetSize(BUTTON_SIZE,BUTTON_SIZE)
		--frame:RegisterForClicks("AnyUp") -- all active flavours now use retail settings. use this line if wotlk/cata revival regresses
		frame:RegisterForClicks("AnyUp","AnyDown")

		frame:RegisterForDrag("LeftButton")
		frame:SetScript("OnDragStart", DragStart)
	end

	local function pooloverlayinit(frame)
		frame:SetAttribute("_onstate-combathide", "if newstate == 'show' then self:Show(); else self:Hide(); end")
		frame:SetHighlightTexture("Interface/Buttons/ButtonHilight-Square")
		frame:SetParent(ActionBar.Frame)
		frame:SetSize(BUTTON_SIZE,BUTTON_SIZE)
		frame:SetMouseClickEnabled(false)
		frame:SetScript("OnEvent", frame.UpdateCooldown)
		frame:RegisterEvent("ACTIONBAR_UPDATE_COOLDOWN")
	end

	local function poolresetter(pool,frame)
		frame:SetAttribute("type",nil)
		frame:SetAttribute("macro",nil)
		frame:SetAttribute("item",nil)
		frame:SetAttribute("itemid",nil)
		frame:SetAttribute("spell",nil)
		frame:SetAttribute("spellid",nil)
		frame:SetAttribute("petaction",nil)
		frame:SetAttribute("petid",nil)
		frame:Hide()
		frame:ClearAllPoints()
	end

	local function pooloverlayresetter(pool,frame)
		frame.icon:SetTexture(nil)
		frame.button=nil
		frame.tooltip=nil
		frame:Hide()
		frame:ClearAllPoints()
	end
	
	ActionBar.ButtonPool = CreateFramePool("BUTTON",nil,"GoatQuestActionButton",poolresetter,nil,poolinit)
	ActionBar.ButtonOverlayPool = CreateFramePool("BUTTON",ActionBar.Frame,"GoatQuestActionButtonOverlay",pooloverlayresetter,nil,pooloverlayinit)

	for i=1,5 do 
		local button = CreateFrame("BUTTON","GoatQuestAB"..i,nil,"GoatQuestActionButton")
		poolinit(button)
		ActionBar.KeyboundButtons[i] = button
	end
	
	ActionBar.PoolInit = poolinit
	ActionBar.PoolOverlayInit = pooloverlayinit
	ActionBar.PoolResetter = poolresetter

	local numAccountMacros, numCharacterMacros = GetNumMacros();
	for i = 0 + numAccountMacros, 1, -1 do
		local name, icon, body = GetMacroInfo(i)
		if name and name:match("^GoatQuestAction[0-9]+$") then
			DeleteMacro(i)
		end
	end

	for i = 120 + numCharacterMacros, 121, -1 do
		local name, icon, body = GetMacroInfo(i)
		if name and name:match("^GoatQuestAction[0-9]+$") then
			DeleteMacro(i)
		end
	end
	ActionBar.initialised=true
	
	if GQ.postcombatmode then ActionBar:SetActionButtons() end -- on classic, init will run after PLAYER_REGEN_ENABLED, so natural startup will not trigger. force refesh now.
end

function ActionBar:SetActionButtons()
	if not ActionBar.initialised then return end
	if ActionBar.SetTimer then GQ:CancelTimer(ActionBar.SetTimer) end
	if InCombatLockdown() or ActionBar.Lockdown then
		ActionBar.SetTimer = GQ:ScheduleTimer(function() 
			ActionBar:SetActionButtons()
		end, 1)
		return
	end

	if ActionBar.SetTimer then GQ:CancelTimer(ActionBar.SetTimer) end
	ActionBar.SetTimer = GQ:ScheduleTimer(function() 
		ActionBar:SetActionButtonsQueued()
	end, 0)
end

function ActionBar:SetActionButtonsQueued()
	if not GQ.CurrentStep then 
		GQ.ActionBar:ClearBar()
		ActionBar:ReanchorButtons() 
		return 
	end

	ActionBar:ClearBar()

	-- current step
	local actions,actions_npc = {},{}
	local actions_lookup,actions_npc_lookup = {},{}

	local goals = {}
	
	for gi,goal in ipairs(GQ.CurrentStep.goals) do
		tinsert(goals,goal)
	--	print(goals[1])
	--	print(goals[2])
	end
	for si,step in ipairs(GQ:GetStickiesAt(GQ.CurrentStep.num)) do
		if not step:IsComplete() then
			for gi,goal in ipairs(step.goals) do tinsert(goals,goal) end
		end
	end

	for gi,goal in ipairs(goals) do
		if goal:IsVisible() and not goal:IsComplete() then
			if goal.castspell and goal.castspellid and GQ.db.profile.actionbar_quest then
				table.insert(actions,{"spell",goal.castspellid})
			elseif goal.castspell and goal.extraaction  and GQ.db.profile.actionbar_quest then
				table.insert(actions,{"extraaction",goal.extraaction})
			elseif (goal.item or goal.itemid) and (goal.action=="use" or goal.action=="useany") and GQ.db.profile.actionbar_quest then
				local switch_to_equip = false
				if goal.itemid and not goal.forceuse then
					local itemID, itemType, itemSubType, itemEquipLoc, icon, classID, subClassID = GetItemInfoInstant(goal.itemid)
					if not (itemEquipLoc=="INVTYPE_NON_EQUIP" or itemEquipLoc=="INVTYPE_NON_EQUIP_IGNORE") then
						if not C_Item.IsEquippedItem(goal.itemid) then
							table.insert(actions,{"equip",goal.itemid,desaturated = C_Item.GetItemCount(goal.itemid or goal.item)==0})
							switch_to_equip = true
						end
					end
				end
				if not switch_to_equip then
					table.insert(actions,{"item",goal.itemid or goal.item,desaturated = C_Item.GetItemCount(goal.itemid or goal.item)==0})
				end
			elseif goal.script and goal.script:find("DoEmote")  and GQ.db.profile.actionbar_quest then
				table.insert(actions,{"emote",goal.script})
			elseif goal.script and GQ.db.profile.actionbar_quest then
				table.insert(actions,{"script",goal.script})
			elseif goal.macrosrc and GQ.db.profile.actionbar_quest then
				table.insert(actions,{"macro",goal.macrosrc})
			elseif goal.petaction and GQ.db.profile.actionbar_quest then
				local num,name,tex = GQ.FindPetActionInfo(goal)
				if num and name then
					table.insert(actions,{"petaction",{num,name,tex}})
				end
			elseif (goal.action=="equipped" or goal.action=="equip") and goal.targetid and C_Item.GetItemCount(goal.targetid)>0 then
				table.insert(actions,{"equip",goal.targetid})
			elseif goal.action=="talk" and goal.npcid and GQ.db.profile.actionbar_talk and not actions_npc_lookup[goal.usename or goal.npc] then
				table.insert(actions_npc,{"talk",goal.useid or goal.npcid,goal.usename or goal.npc})
				actions_npc_lookup[goal.usename or goal.npc]=true
			elseif goal.action=="clicknpc" and goal.npcid and GQ.db.profile.actionbar_talk and not actions_npc_lookup[goal.usename or goal.npc] then
				table.insert(actions_npc,{"clicknpc",goal.useid or goal.npcid,goal.usename or goal.npc})
				actions_npc_lookup[goal.usename or goal.npc]=true
			elseif goal.action=="kill" and (goal.targetid or goal.targets) and GQ.db.profile.actionbar_kill then
				if goal.targets then
					for _,target in ipairs(goal.targets) do
						if not actions_npc_lookup[target[1]] then
							table.insert(actions_npc,{"kill",target[2],target[1],sticky=goal.parentStep:IsCurrentlySticky()})
							actions_npc_lookup[target[1]]=true
						end
					end
				else
					table.insert(actions_npc,{"kill",goal.useid or goal.targetid,goal.usename or goal.target,sticky=goal.parentStep:IsCurrentlySticky()})
					actions_npc_lookup[goal.usename or goal.target]=true
				end
			elseif goal.action=="openskill" and goal.tradeskill then
				table.insert(actions,{"openskill",goal})
			elseif goal.action=="create" and goal.spellid then
				table.insert(actions,{"create",goal})
			end
		end -- if goal visible
	end -- for goal in step

	local usedactions = {}

	local counter = 0
	for _,data in ipairs(actions) do 
		usedactions[data[1]] = usedactions[data[1]] or {}
		if not usedactions[data[1]][data[2]] then 
			counter = counter + 1
			GQ.ActionBar:SetButton(data[1],data[2],data[3],counter,nil,data.desaturated) 
			usedactions[data[1]][data[2]] = true
		end
	end
	for _,data in ipairs(actions_npc) do 
		usedactions[data[1]] = usedactions[data[1]] or {}
		if not usedactions[data[1]][data[2]] then 
			counter = counter + 1
			GQ.ActionBar:SetButton(data[1],data[2],data[3],counter,data.sticky,data.desaturated)
			usedactions[data[1]][data[2]] = true
		end
	end


	ActionBar.TrashButton = nil
	if not GQ.GuideOnly and GQ.db.profile.actionbar_trash then
		counter = counter + 1
		ActionBar.TrashButton = GQ.ActionBar:SetButton("trash",{},nil,counter)
	end
	ActionBar:ReanchorButtons()
end


function ActionBar:ShowTooltip()
	if ActionBar.Active then return end

	GameTooltip:SetOwner(ActionBar.Frame,"ANCHOR_BOTTOMLEFT")
	GameTooltip:SetText("GoatQuest Action Bar")
	GameTooltip:Show()

end

function ActionBar:CreateFrame() 
	if not ActionBar.Frame then
		ActionBar.Frame = CHAIN(ui:Create("Frame", UIParent, "GoatQuest_ActionBar","BackdropTemplate,SecureHandlerStateTemplate"))
			:SetSize(BAR_HEIGHT,BAR_HEIGHT)
			:SetFrameStrata("LOW")
			:SetFrameLevel(10)
			:CanDrag(true)
			:SetScript("OnEnter", function()
				ActionBar:ShowTooltip()
				end
			)
			:SetScript("OnLeave", function()
				GameTooltip:Hide()
				end
			)
			:SetScript("OnDragStart", function(self)
				if InCombatLockdown() or self.Lockdown then return end
				self:StartMoving()
			end)
			:SetScript("OnDragStop", function(self)
				if InCombatLockdown() or self.Lockdown then return end
				self:StopMovingOrSizing()
				ActionBar:SavePosition()
			end)
			:SetScript("OnMouseDown", function(self)
				-- store mouse-on-frame location, to take over dragging position
				local ssc=self:GetEffectiveScale()
				local l,b=self:GetLeft()*ssc,self:GetBottom()*ssc
				local cx,cy = GetCursorPosition()
				self.drag_offset_x,self.drag_offset_y = cx-l,cy-b
			end)
			:SetScript("OnUpdate",ActionBar.Frame_OnUpdate)
			:SetScript("OnSizeChanged",function() if not GQ.db.profile.actionbar_anchor then ActionBar:SavePosition(true) end end)
			:SetAttribute("_onstate-combathide", "if newstate == 'show' then self:Show(); else self:Hide(); end")
			:Hide()
		.__END
		ActionBar.Frame.close = CHAIN(CreateFrame("Button",nil,ActionBar.Frame,"GQ_DefaultSkin_TitleButton_Template"))
			:SetPoint("TOPRIGHT",ActionBar.Frame,"TOPRIGHT", -5, -4)
			:SetScript("OnClick", function() 
				GQ.db.profile.enable_actionbar = false
				ActionBar:ToggleFrame()
			 end)
			.__END
		ActionBar.Frame.close.buttonkey = "CLOSE"
		ActionBar.Frame.close:ApplySkin()
		ActionBar:PositionX()

		ActionBar.Frame.Overlay = CHAIN(ui:Create("Frame", ActionBar.Frame))
			:SetAllPoints()
			:SetAlpha(1)
			:SetFrameLevel(15)
			:EnableMouse(true)
			:Hide()
		.__END

		if GQ.db.profile.actionbar_anchor then
			GQ.F.SetFrameAnchor(ActionBar.Frame,GQ.db.profile.actionbar_anchor)
			ActionBar.Frame.snapped = GQ.db.profile.actionbar_anchor_snapped
		else
			ActionBar.Frame.snapped = true
			ActionBar:SavePosition()
		end
	end

	GQ:AddMessageHandler("SKIN_UPDATED",ActionBar.ApplySkin)
	ActionBar:SetCombatHiding()
	if not (InCombatLockdown() or ActionBar.Lockdown) then ActionBar.Frame:Hide() end

	ActionBar:ApplySkin()
end

function ActionBar:ShowDisabledOverlay()
	ActionBar.Frame.Overlay:Show()
end

local SNAP_Y=5
function ActionBar.Frame_OnUpdate(self)
	if InCombatLockdown() or self.Lockdown then return end

	if self:IsDragging() then
		local ssc=self:GetEffectiveScale()
		local x,y = GetCursorPosition()
		local l,b=x-self.drag_offset_x,y-self.drag_offset_y
		local zsc=GQ.Frame:GetEffectiveScale()
		local zt=GQ.Frame:GetTop()*zsc
		local gq_width = GQ.Frame:GetWidth()
		local zs, zsw

		local anchorLeft = ActionBar:IsExpandingRight()
		zs  = ((anchorLeft and GQ.Frame:GetLeft()) or GQ.Frame:GetRight()) * zsc
		zsw = anchorLeft and (zs + gq_width) or zs

		-- added left/right edge check
		if ((math.abs(zs-l)<10 or math.abs((zsw)-(l+self:GetWidth()*ssc))<10) and math.abs((zt+SNAP_Y)-b)<10) then
			self.snapped=true
			self:ClearAllPoints()
			-- changed the default snap to the left to condition
			local side = ActionBar:IsExpandingRight() and "LEFT" or "RIGHT"
			self:SetPoint("BOTTOM"..side, GQ.Frame, "TOP"..side, 0, 10)
		else
			self.snapped=false
		end
	elseif GQ.framemoving and ActionBar.Frame.snapped then
		-- if we are snapped, and main frame is dragged, update our position
		ActionBar:SavePosition()
	end
end

function ActionBar:SavePosition(options)
	if self.SnapTimer then GQ:CancelTimer(self.SnapTimer) end
	if InCombatLockdown() or self.Lockdown then
		self.SnapTimer = GQ:ScheduleTimer(function() 
			self:SavePosition()
		end, 1)
		return
	end

	local ssc = self.Frame:GetEffectiveScale()
	local zsc = GQ.Frame:GetEffectiveScale()
	local zt=GQ.Frame:GetTop()*zsc
	local anchorLeft = ActionBar:IsExpandingRight()
	local zs  = ((anchorLeft and GQ.Frame:GetLeft()) or GQ.Frame:GetRight()) * zsc
	local anchor = anchorLeft and "BOTTOMLEFT" or "BOTTOMRIGHT"
	local xOffset = anchorLeft and zs or (zs - GetScreenWidth() * UIParent:GetEffectiveScale())

	self.Frame:ClearAllPoints()

	if self.Frame.snapped then
		-- do not anchor to gq frame - causes action blocked when trying to refresh main frame during combat
		-- instead anchor to uiparent where we would be positioned
		-- but also check direction and calculate distance from the right edge, if snapped to right
		self.Frame:SetPoint(anchor, UIParent, anchor, xOffset/ssc, (zt+SNAP_Y)/ssc)
	elseif not options then
		local x,y = GetCursorPosition()
		local l,b = x-(self.Frame.drag_offset_x or 0), y-(self.Frame.drag_offset_y or 0)

		local frameWidth = self.Frame:GetWidth()

		if not anchorLeft then
			self.Frame:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMLEFT", (l/ssc) + frameWidth, b/ssc)
		else
			self.Frame:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", l/ssc, b/ssc)
	
		end
	else
		local anchorData = GQ.db.profile.actionbar_anchor
		local newAnchor = anchorData

		newAnchor[1] = ActionBar:IsExpandingRight() and "BOTTOMLEFT" or "BOTTOMRIGHT"

		GQ.F.SetFrameAnchor(ActionBar.Frame, newAnchor)
		GQ.db.profile.actionbar_anchor = newAnchor
	end

	GQ.db.profile.actionbar_anchor_snapped = self.Frame.snapped 
	GQ.F.SaveFrameAnchor(self.Frame,"actionbar_anchor")
end

function ActionBar:ApplySkin()
	local MF = ActionBar.Frame
	if not MF then return end

	GQ.ButtonSets.TitleButtons.CLOSE:AssignToButton(MF.close)

	local function set_alpha(new_a,r,g,b,a) return r,g,b,new_a*a end
	local OPACITY = SkinData("UseOpacity") and GQ.db.profile.opacity or  1

	MF:SetBackdrop(SkinData("ActionBarBackdrop"))
	MF:SetBackdropColor(set_alpha(OPACITY,unpack(SkinData("ActionBarBackdropColor"))))
	MF:SetBackdropBorderColor(set_alpha(OPACITY,unpack(SkinData("ActionBarBackdropBorderColor"))))

	ActionBar:SetAlpha()
	ActionBar:SetScale()
	ActionBar:PositionX()
end

function ActionBar:PositionX()
	ActionBar.Frame.close:ClearAllPoints()
	local side  = (GQ.db.profile.actionbar_direction == 1) and "RIGHT" or "LEFT"
	local x  = (side == "RIGHT") and -5 or 5
	ActionBar.Frame.close:SetPoint("TOP"..side, ActionBar.Frame, "TOP"..side, x, -4)
end

function ActionBar:GetDirection()
	ActionBar:SetActionButtons()
	ActionBar:PositionX()
	ActionBar:SavePosition(true)
end

function ActionBar:ToggleFrame()
	if not ActionBar.initialised then return end
	if not ActionBar.Frame then
		ActionBar:CreateFrame()
	end

	if ActionBar.ToggleTimer then GQ:CancelTimer(ActionBar.ToggleTimer) end
	if InCombatLockdown() or ActionBar.Lockdown then 
		ActionBar.ToggleTimer = GQ:ScheduleTimer(function() 
			ActionBar:ToggleFrame()
		end, 1)
		return
	end
	
	if GQ.db.profile.enable_actionbar and GQ.db.profile.enable_viewer then
		ActionBar.Frame:Show()
		ActionBar:SetActionButtons()
		ActionBar:PositionX()
		if self.Frame.snapped then
			-- update position, since viewer may have been moved while we were hidden
		ActionBar:SavePosition()
		end
	else
		ActionBar.Frame:Hide()
	end
		
end

function ActionBar:SetButton(btype,object,fallbackname,counter,sticky,desaturated) 
	if not GQ.db.profile.enable_actionbar then return end
	
	if btype and not object then GQ:Debug("ActionButton must have data defined if type is set") return end

	local button,freshbutton
	if counter>5 then
		button,freshbutton = ActionBar.ButtonPool:Acquire()
		if not GQ.IsRetail and freshbutton then ActionBar.PoolInit(button) end -- classic does not have custom creationFunc yet, need to call it by hand
	else
		button = ActionBar.KeyboundButtons[counter]
	end

	local macro_text,macro_text_right,shift_macro_text, shift_macro_text_right = "","","","" 
	local macro_name,macro_tooltip
	local goatquest_texture_key,goatquest_tooltip_func, goatquest_texture, _

	local macro_texture = 134327

	-- set data based on type

	if btype=="item" then 
		macro_name,_,_,_,_,_,_,_,_,macro_texture = GQ:GetItemInfo(object)
		macro_text = (macro_name and "#showtooltip "..macro_name.."\n" or "").."/use item:"..object
		button:SetAttribute("itemid",object)
		
	elseif btype=="equip" then 
		macro_name,_,_,_,_,_,_,_,_,macro_texture = GQ:GetItemInfo(object)
		macro_text = (macro_name and "#showtooltip "..macro_name.."\n" or "").."/equip item:"..object
		button:SetAttribute("itemid",object)	
	elseif btype=="spell" then
		local spellData = GetSpellInfo(object)
		macro_name,macro_texture = spellData.name, spellData.iconID
		macro_text = (macro_name and "#showtooltip "..macro_name.."\n" or "").."/cast "..macro_name
		button:SetAttribute("spellid",object)
	elseif btype=="extraaction" then
		local spellData = GetSpellInfo(object)
		macro_name,macro_texture = spellData.name, spellData.iconID
		macro_text = (macro_name and "#showtooltip "..macro_name.."\n" or "").."/click ExtraActionButton1"
		button:SetAttribute("spellid",object)
	elseif btype=="petaction" then
		local num
		num,macro_name,macro_texture = unpack(object)
		macro_text = (macro_name and "#showtooltip "..macro_name.."\n" or "").."/cast "..macro_name
		button:SetAttribute("petaction",num)
		button:SetAttribute("petid",num)
	elseif btype=="emote" then
		if type(object)=="number" then 
			macro_text = GetMacroBody(object)
			_,macro_texture = GetMacroInfo(object)
		else
			macro_text = "/run "..object
		end
		--_,macro_texture = GetMacroInfo(object)
		goatquest_texture_key = "EMOTE"
		macro_tooltip = macro_text:match("\"(.*)\"") -- /run DoEmote("blah") -> blah
	elseif btype=="script" then
		macro_text = "/run "..object
		macro_tooltip = object
		goatquest_texture_key = "SCRIPT"
	elseif btype=="macro" then
		macro_text = object
		macro_tooltip = object
		goatquest_texture_key = "SCRIPT"
	elseif btype=="goatquest" then
		button:SetAttribute("goatquest","goatquest")
	elseif btype=="talk" then
		local name = GQ.Localizers:GetTranslatedNPC(object,fallbackname)
		macro_name = L["stepgoal_talk to"]:format(name)
		macro_tooltip = macro_name
		macro_text = (macro_name and "#showtooltip "..macro_name.."\n" or "").."/cleartarget\n/target "..name
		if not (GQ.GuideOnly or GQ.IsForever) then
			macro_text = macro_text .. "\n/tm 1"
		end
		goatquest_texture_key = "TALK"
	elseif btype=="clicknpc" then
		local name = GQ.Localizers:GetTranslatedNPC(object,fallbackname)
		macro_name = L["stepgoal_clicknpc"]:format(name)
		macro_tooltip = macro_name
		macro_text = (macro_name and "#showtooltip "..macro_name.."\n" or "").."/cleartarget\n/target "..name
		if not (GQ.GuideOnly or GQ.IsForever) then
			macro_text = macro_text .. "\n/tm 6"
		end
		goatquest_texture_key = "TALK"
	elseif btype=="kill" then
		local name = GQ.Localizers:GetTranslatedNPC(object,fallbackname)
		macro_name = L["stepgoal_kill"]:format(name)
		macro_tooltip = macro_name
		macro_text = (macro_name and "#showtooltip "..macro_name.."\n" or "").."/cleartarget\n/target "..name.."\n/cleartarget [dead]"
		if not (GQ.GuideOnly or GQ.IsForever) then
			if not sticky then
				macro_text = macro_text .. "\n/tm 8"
			else
				macro_text = macro_text .. "\n/tm 7"
			end
		end
		goatquest_texture_key = "KILL"
	elseif btype=="openskill" then
		local skilldata = GQ.Professions:GetSkillDataByName(object.tradeskill)
		if skilldata.skill then
			local name = GQ.Professions.LocaleSkills[object.tradeskill]
			macro_name = "Open "..name.." tradeskill"
			if GQ.IsRetail then
				macro_texture = C_TradeSkillUI.GetTradeSkillTexture(skilldata.skill)
				macro_text = (macro_name and "#showtooltip "..macro_name.."\n" or "").."/run C_TradeSkillUI.OpenTradeSkill("..skilldata.parent..")"
			else
				macro_texture = skilldata.icon
				macro_text = (macro_name and "#showtooltip "..macro_name.."\n" or "").."/cast "..name

			end
		end
		macro_tooltip = macro_name

	elseif btype=="trash" then
		goatquest_texture_key = "TRASH"
		local items = GQ.Inventory:GetGrayTrashDetails()
		local item = items and items[1]
		if item then
			local _, _, itemName, _, count, price, _ = unpack(item)
			object = item -- store, so that we have data to pass to destroy function
			--macro_name = itemID
			macro_tooltip = L["actionbar_trash"]:format(count,itemName,GQ.GetMoneyString(price))
			macro_name = macro_tooltip
			if #items>1 then
				macro_tooltip = macro_tooltip .. L["actionbar_trash_more_header"]
				for i=2,#items do
					macro_tooltip = macro_tooltip .. L["actionbar_trash_more"]:format(items[i][5],items[i][3],GQ.GetMoneyString(items[i][6]))
				end
			end
			shift_macro_text = (macro_name and "#showtooltip "..macro_name.."\n" or "").."/run GQ.Inventory:HandleTrashMacro()"
			macro_text_right = shift_macro_text
		else
			--macro_texture = 1505955
			macro_tooltip = L["actionbar_trash_nothing"]
		end
	elseif btype=="create" then
		ActionBar.creategoal = object.num
		local spellData = GetSpellInfo(object.spellid)
		macro_name = spellData.name
		if  (GQ.Professions:GetRecipe(object.spellid)) then
			macro_text = (macro_name and "#showtooltip "..macro_name.."\n" or "").."/run GQ.ActionBar:CreateGoaltype("..ActionBar.creategoal..")"
			local product =  (GQ.Professions:GetRecipe(object.spellid)).productid
			local  _,_,_,_,_,_,_,_,_,ptexture = GQ:GetItemInfo(product)
			if ptexture then
				macro_texture = ptexture
			elseif spellData then
				macro_texture = spellData.iconID
			else
				goatquest_texture_key = "SCRIPT"
			end
		else
			goatquest_texture_key = "SCRIPT"
			macro_text = (macro_name and "#showtooltip "..macro_name.."\n" or "").."/run GQ.ActionBar:CreateGoaltype("..ActionBar.creategoal..")"
		end
		macro_tooltip = L["stepgoal_create"] :format(macro_name)
	end

	if InCombatLockdown() or ActionBar.Lockdown then -- just in case we got into combat state while function was running
		ActionBar.SetTimer = GQ:ScheduleTimer(function() 
			ActionBar:SetActionButtons()
		end, 1)
		return
	end

	button:SetAttribute("type","macro")
	button:SetAttribute("macrotext1",macro_text)
	button:SetAttribute("macrotext2",macro_text_right)
	button:SetAttribute("shift-macrotext1",shift_macro_text)
	button:SetAttribute("shift-macrotext2",shift_macro_text_right)
	

	local overlay,freshoverlay = ActionBar.ButtonOverlayPool:Acquire()
	if not GQ.IsRetail and freshoverlay then ActionBar.PoolOverlayInit(overlay) end -- classic does not have creationFunc yet, need to call it by hand
	overlay:Setup(button,goatquest_texture_key,macro_tooltip,btype,macro_texture,object)
	
	overlay.icon:SetDesaturated(desaturated)
	overlay:SetAlpha(desaturated and (sh_alpha or 0.3) or 1)

	table.insert(ActionBar.Buttons,button)

	return button
end

function ActionBar:CreateGoaltype(goal)
	GQ:PerformTradeSkillGoal(GQ.CurrentStep.goals[goal])
end

function ActionBar:ClearBar(forcehide) 
	if not ActionBar.Frame then return end
	if ActionBar.ClearTimer then GQ:CancelTimer(ActionBar.ClearTimer) end
	if InCombatLockdown() or ActionBar.Lockdown then
		ActionBar.ClearTimer = GQ:ScheduleTimer(function() 
			ActionBar:ClearBar(forcehide)
		end, 1)
		return
	end

	
	if GQ.db.profile.enable_actionbar then ActionBar.Frame.Overlay:Show() end

	table.wipe(ActionBar.Buttons)
	for _,button in ipairs(ActionBar.KeyboundButtons) do ActionBar.PoolResetter(nil,button) end
	ActionBar.ButtonPool:ReleaseAll()
	ActionBar.ButtonOverlayPool:ReleaseAll()

	if forcehide or not GQ.db.profile.enable_actionbar then
		ActionBar.Frame:Hide()
	end
end

function ActionBar:ReanchorButtons(force) 
	if ActionBar.SetTimer then GQ:CancelTimer(ActionBar.SetTimer) end
	if InCombatLockdown() or ActionBar.Lockdown then
		ActionBar.SetTimer = GQ:ScheduleTimer(function() 
			ActionBar:SetActionButtons()
		end, 1)
		return
	end

	if not ActionBar.Frame then return end
	if not GQ.db.profile.enable_viewer then ActionBar.Frame.Overlay:Hide() ActionBar.Frame:Hide() return end -- viewer is hidden, go away
	if not GQ.db.profile.enable_actionbar and not force then return end -- everything is disabled, abort

	local previous = false
	local space = 5
	local width = space
	local active = false

	ActionBar.Frame:Show()
	ActionBar.Frame:SetAlpha(0.01)

	for _,button in ipairs(ActionBar.Buttons) do
		button:ClearAllPoints()
	end

	-- buttons anchoring needs to follow the actionbar direction
	for _, button in ipairs(ActionBar.Buttons) do
		local anchorRight = not ActionBar:IsExpandingRight()
		local side = anchorRight and "LEFT" or "RIGHT"
		local oppSide = anchorRight and "RIGHT" or "LEFT"
		local x = anchorRight and space or -space

		if not previous then
			button:SetPoint("TOP"..side, ActionBar.Frame, "TOP"..side, x, -space)
		else
			button:SetPoint("TOP"..side, previous, "TOP"..oppSide, x, 0)
		end

		width = width + button:GetWidth() + space
		previous = button
		active = true
		button:Show()
	end

	ActionBar.Active = active

	ActionBar.Frame:SetWidth(width+25)
	
	ActionBar.Frame.Overlay:Hide()

	if force=="off" then 
		ActionBar.Frame:Hide()
		return 
	elseif active or force=="on" then 
		ActionBar.Frame:SetAlpha(1)
		ActionBar.Frame:Show()
	-- -- actionbar_hide_useless variant
	--elseif GQ.db.profile.actionbar_hide_useless then
	--	ActionBar.Frame:Hide()
	--else 
	--	ActionBar.Frame:Show()
	else 
		ActionBar.Frame:Hide()
	end
end

function ActionBar:SetCombatHiding(mode)
	local mode = GQ.db.profile.hideincombat and GQ.db.profile.hidebarincombat

	for _,button in pairs(ActionBar.Buttons) do
		if button.SetCombatHiding then
			button:SetCombatHiding(mode)
		end
	end

	if mode then
		RegisterAttributeDriver(self.Frame, "state-combathide", "[combat] hide; show");
	else
		UnregisterAttributeDriver(self.Frame, "state-combathide");
	end
end

function ActionBar:SetScale() 
	if ActionBar.ScaleTimer then GQ:CancelTimer(ActionBar.ScaleTimer) end
	if InCombatLockdown() or ActionBar.Lockdown then 
		ActionBar.ScaleTimer = GQ:ScheduleTimer(function() 
			ActionBar:SetScale()
		end, 1)
		return
	end
	ActionBar.Frame:SetScale(GQ.db.profile.actionbar_scale)
end

function ActionBar:SetAlpha(value) 
	if ActionBar.OpacityTimer then GQ:CancelTimer(ActionBar.OpacityTimer) end
	if InCombatLockdown() or ActionBar.Lockdown then 
		ActionBar.OpacityTimer = GQ:ScheduleTimer(function() 
			ActionBar:SetAlpha()
		end, 1)
		return
	end
	ActionBar.Frame:SetAlpha(value or GQ.db.profile.opacitymain)
end

function ActionBar:TutorialPreview(mode) 
	local button = ActionBar.Buttons[1]

	if ActionBar.Frame:IsVisible() and (button and not button:GetAttribute("goatquest")) then return end -- there is a non-faked button visible, do not hide/show anything


	if mode=="on" then
		if not (button and button:GetAttribute("type")) then -- there is no button visible, make a fake one
			button = ActionBar:SetButton("macro","")
			button:SetAttribute("goatquest","goatquest")
		end
		ActionBar:ReanchorButtons("on")
	else
		if button then button:SetAttribute("type",nil) end -- clear whatever is visible
		ActionBar:ReanchorButtons(not GQ.db.profile.enable_actionbar and "off")
	end
end

tinsert(GQ.startups,{"ActionBar startup",function(self)
	ActionBar:Initialise()
end,postcombat=true})

GoatQuestActionButtonOverlay_Mixin = {}
function GoatQuestActionButtonOverlay_Mixin:OnEnter()
	if self.tooltipDisabled then return end
	if not self.button then return end

	local top = self.button:GetTop()
	local screenh = UIParent:GetHeight()
	if top>screenh/2 then
		GameTooltip:SetOwner(self,"ANCHOR_BOTTOM")
	else
		GameTooltip:SetOwner(self,"ANCHOR_TOP")
	end
	
	local button = self.button

	if button:GetAttribute("itemid") then
		local itemid = button:GetAttribute("itemid")
		local link = "item:"..itemid
		if not link then return end
		GameTooltip:SetHyperlink(link)
	elseif button:GetAttribute("spellid") then
		GameTooltip:SetSpellByID(button:GetAttribute("spellid"))
	elseif button:GetAttribute("petid") then
		GameTooltip:SetPetAction(button:GetAttribute("petid"))
	elseif self.tooltip then
		GameTooltip:SetText(self.tooltip)
	end

	GameTooltip:Show()
end
function GoatQuestActionButtonOverlay_Mixin:OnLeave()
	if (GameTooltip:GetOwner()==self) then
		GameTooltip:Hide()
	end
end

local fallback_textures = {
	spell=1121022,
	item=1121021,
	macro=1121020,
	petaction=1121022,
}
function GoatQuestActionButtonOverlay_Mixin:Setup(button,iconsetkey,tooltip,btype,macro_texture,object)
	self:SetAllPoints(button)
	self.tooltip = tooltip
	self.button = button

	if iconsetkey then
		GQ.IconSets.ActionBarIcons[iconsetkey]:AssignToTexture(self.icon)
	else
		self.icon:SetTexCoord(0,1,0,1)

		local button_type = button:GetAttribute("type")
		local tex, needsglobal = macro_texture, nil
		if button:GetAttribute("spellid") then
			local spellData = GetSpellInfo(button:GetAttribute("spellid"))
			tex = spellData.iconID
		elseif button:GetAttribute("itemid") then
			tex = select(10, GQ:GetItemInfo(button:GetAttribute("itemid")))
		elseif button:GetAttribute("macro") then
			tex = select(2,GetMacroInfo(button:GetAttribute("macro")))
		elseif button:GetAttribute("petaction") then
			_,tex = GetPetActionInfo(button:GetAttribute("petaction"))
		end
		if not tex then tex = fallback_textures[button_type] end
		
		self.icon:SetTexture(tex)
	end
	self:Show()
	self:UpdateCooldown()
end

function GoatQuestActionButtonOverlay_Mixin:UpdateCooldown()
	if not self.button then return end
	local button = self.button

	local starts,dur,ends = 0,0,0
	if button:GetAttribute("itemid") and tonumber(button:GetAttribute("itemid")) then
		starts,dur,ends = C_Container.GetItemCooldown(button:GetAttribute("itemid"))
	elseif button:GetAttribute("spellid") and tonumber(button:GetAttribute("spellid")) then
		local cooldown = GetSpellCooldown(button:GetAttribute("spellid"))
		starts,dur,ends = cooldown.startTime, cooldown.duration, cooldown.isEnabled
		if type(starts)=="table" then starts,dur,ends = starts.startTime,starts.duration,starts.startTime+starts.duration end
		if type(starts)=="table" then starts,dur,ends = starts.startTime,starts.duration,starts.startTime+starts.duration end
	elseif button:GetAttribute("petid") and tonumber(button:GetAttribute("petid")) then
		starts,dur,ends = GetPetActionCooldown(button:GetAttribute("petid"))
	end

	self.cooldown:SetDrawSwipe(true);
	
	if GQ.IsSecret(start) or GQ.IsSecret(dur) or GQ.IsSecret(ends) then return end

	CooldownFrame_Set(self.cooldown, starts,dur,ends)
	if (starts and starts>0) then self.cooldown:Show() else self.cooldown:Hide() end
end

function GoatQuestActionButtonOverlay_Mixin:Reset()
	self.icon:SetTexture(nil)
	self.tooltip=nil
	self:Hide()
	self:ClearAllPoints()
end