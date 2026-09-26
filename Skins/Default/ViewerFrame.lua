local name,GQ = ...
local GoatQuest = GQ
local L = GQ.L

local CHAIN = GQ.ChainCall

local UIFrameFadeOut,UIFrameFadeIn=GQ.UIFrameFade.UIFrameFadeOut,GQ.UIFrameFade.UIFrameFadeIn  -- prevent taint
local SkinData = GQ.UI.SkinData

local tinsert=tinsert

-- GLOBAL DropDownForkList1,FindNearestFrame,GQ_SetHeight,
-- GLOBAL BackFlatTemplate_Mixin,GQ_DefaultSkin_DefaultStep_Mixin,GQ_DefaultSkin_Frame_Mixin,GQ_DefaultSkin_MenuButton_Mixin,GQ_DefaultSkin_StepLine_Mixin,GQ_DefaultSkin_StepLineClicker_Mixin,GQ_DefaultSkin_TitleButton_Mixin,GQ_ResizerMixin,GoatQuestFrameMaster
-- GLOBAL CloseDropDownForks,EasyFork,UIDropDownFork_separatorInfo,UIDropDownFork_SetAnchor
-- GLOBAL GoatQuestFrame_HideTooltip,GoatQuestFrame_size,GoatQuestMapIcon,GoatQuestPointer_ArrowCtrl
-- GLOBAL ReloadUI


local round=math.round

local fromRGB_a = GQ.F.fromRGB_a
local fromRGBA = GQ.F.fromRGBA
local fromRGBmul_a = GQ.F.fromRGBmul_a
local fromRGB = GQ.F.fromRGB
local mix4=GQ.F.mix4

local obscured

local LINES_PER_STEP = GQ.CFG.LINES_PER_STEP

local LastUsedStep=0
local FrameSetUp = false

GQ_DefaultSkin_Frame_Mixin = {}

function GQ.GenericDragStartHandler(source,button)
	if not GQ.db.profile["windowlocked"] then 
		if button=='LeftButton' then 
			GoatQuestFrameMaster:StartMoving() 
			GQ.framemoving=true 
		else 
			GQ:SetOption("Display","resizeup") 
		end
	end
end

function GQ.GenericDragStopHandler()
	GoatQuestFrameMaster:StopMovingOrSizing() 
	GQ:AlignFrame() 
	GQ.framemoving=nil
end


GQ_DefaultSkin_DefaultStep_Mixin = {}
--
	function GQ_DefaultSkin_DefaultStep_Mixin:OnLoad()
		self:EnableMouse(true)
		self:RegisterForClicks("LeftButtonUp","RightButtonUp")
		
		self:CreateLines()

		self:ApplySkin()
	end

	function GQ_DefaultSkin_DefaultStep_Mixin:ApplySkin()
		self:SetBackdrop(SkinData("StepBackdrop"))
		self:SetBackdropColor(unpack(SkinData("StepBackdropColor")))
		self:SetBackdropBorderColor(unpack(SkinData("StepBackdropBorderColor")))
		self.border:SetBackdrop(SkinData("StepBorderBackdrop"))

		self:ApplySkinToLines()
	end

	function GQ_DefaultSkin_DefaultStep_Mixin:OnClick(self,button)
		if not self.step.isFocused then
			GQ:SetStepFocus(self.step)
			return
		end

		if GQ.CurrentStep==self.step or self.is_sticky or self.is_poi then
			for i=1,#self.lines do
				if self.lines[i].clicker:IsMouseOver() then self.lines[i].clicker:OnClick(button) end
			end
			return
		end


		if not GQ.CurrentGuide.steps[self.stepnum]
		or not GQ.CurrentGuide.steps[self.stepnum]:AreRequirementsMet() then return end
		if GQ.db.profile.showcountsteps>0 then return end
		GQ.pause = true
		GQ:Debug("pausing in onclick")
		GQ:FocusStep(self.stepnum,true)
	end

	function GQ_DefaultSkin_DefaultStep_Mixin:OnEnter()
		if not self.step.isFocused then
			--GQ:UpdateFrame(true)
		end

		--if not GQ.db.profile.showbriefsteps then return end

		--[[
		GameTooltip:SetOwner(self,"ANCHOR_CURSOR")
		GameTooltip:ClearAllPoints()
		GameTooltip:ClearLines()
		GameTooltip:SetText(("Step %d. %s %s"):format(self.step.num, self.step:GetTitle() or "", self.step.level and ((" (level %s)"):format(self.step.level)) or ""))
		for i,goal in ipairs(self.step.goals) do
			GameTooltip:AddLine(goal:GetText(true,false))
		end
		GameTooltip:Show()
		GameTooltip:SetWidth(300)
		GameTooltip:Show()
		--]]

		--if self.step==GQ.CurrentStep then

		--	GQ.briefstepexpansionspeed = 5
		--	GQ.briefstepexpansionspeedlines[self.num] = 5
			--GQ.briefstepexpanded=self.step
		--end

		-- expansion moved to the onupdate handler
	end

	function GQ_DefaultSkin_DefaultStep_Mixin:OnLeave()
		if not self or GameTooltip:GetOwner()==self then
			GameTooltip:Hide()
			--GQ:Debug("HIDING in Step_OnLeave")
		end

		--[[
		if not GQ.db.profile.showbriefsteps then return end

		GQ.briefstepexpansionspeed = -5
		GQ.briefstepexpansionspeedlines[self.num] = -5
		GQ.briefstepexpanded=nil
		--]]

		--GQ:UpdateFrame(true)
	end

	function GQ_DefaultSkin_DefaultStep_Mixin:OnUpdate(elapsed)
		local clicker

		--[[
			for i=1,#self.lines do
				clicker=self.lines[i].clicker

				if clicker:IsVisible() then
					if clicker.over and not MouseIsOver(clicker) then
						if DropDownForkList1 and DropDownForkList1:IsShown() and DropDownForkList1.dropdown==GQ.Frame.Menu and GQ.Frame.Menu.goalframe==self.lines[i] then
							-- umm.
						else
							clicker:SetAlpha(0.0)
							clicker:OnLeave()
							clicker.over=false
						end
					end
				end
			end

			if true or GQ.CurrentStep==self.step then
				-- ugly! but first leave's, then enter's.

				for i=1,#self.lines do  if self.lines[i]:IsVisible() then

					local obscured = (GetMouseFocus()~=WorldFrame and GetMouseFocus()~=self)
					clicker=self.lines[i].clicker

					if IsMouseButtonDown("RightButton") and MouseIsOver(clicker) and not underAction then
						clicker:OnClick() --runs only if the click is a right click. ***Is possible for it to not work if click goes up and down without OnUpdate running***
					end

					if clicker:IsVisible() and MouseIsOver(clicker) and not clicker.over and not self.step:IsCurrentlySticky() then
						if not obscured or not underAction then
							clicker:OnEnter()
							clicker:SetAlpha(0.15)
							clicker.over=true
						end
					end
				end end
			end
		--]]
	end

	function GQ_DefaultSkin_DefaultStep_Mixin:OnDragStart(button)
		if not GQ.db.profile["windowlocked"] then 
			GoatQuestFrameMaster:StartMoving() 
			GQ.framemoving=true 
		end
	end
	function GQ_DefaultSkin_DefaultStep_Mixin:OnDragStop()
		GQ.GenericDragStopHandler()
	end

	function GQ_DefaultSkin_DefaultStep_Mixin:CreateLines()
		self.lines = {}
		for i=1,LINES_PER_STEP do
			local line = CreateFrame("FRAME",nil,self,"GQ_DefaultSkin_StepLine_Template")

			self.lines[i]=line
			self['line'..i]=line -- for debugging only!
			
			line.num = i
			line.parentStep = self

			line:ClearAllPoints()
			if i==1 then
				-- overridden in ApplySkinToLines anyway
				--line:SetPoint("TOPLEFT",step,GQ.STEPMARGIN_X,-GQ.STEPMARGIN_Y)
				--line:SetPoint("TOPRIGHT",step,-GQ.STEPMARGIN_X,-GQ.STEPMARGIN_Y)
			else
				line:SetPoint("TOPLEFT",self.lines[i-1],"BOTTOMLEFT",0,-SkinData("StepLineSpacing"))
				line:SetPoint("TOPRIGHT",self.lines[i-1],"BOTTOMRIGHT",0,-SkinData("StepLineSpacing"))
			end

		end
	end

	function GQ_DefaultSkin_DefaultStep_Mixin:ApplySkinToLines()
		-- Lines/goals
		self.lines[1]:SetPoint("TOPLEFT",self,"TOPLEFT",SkinData("StepPaddingWidth"),-SkinData("StepPaddingTop"))
		self.lines[1]:SetPoint("TOPRIGHT",self,"TOPRIGHT",-SkinData("StepPaddingWidth"),-SkinData("StepPaddingTop"))
		for j,line in ipairs(self.lines) do
			line:ApplySkin()
		end
	end

	function GQ_DefaultSkin_DefaultStep_Mixin:Render()
		--frame = _G['GoatQuestFrame_Step'..stepframenum]
		local stepdata = self.step
		local profile=GQ.db.profile

		local changed,dirty = stepdata:Translate()
		if dirty then
			GQ.frameNeedsUpdating=true
		end
		if changed and not dirty then
			GQ.do_showwaypoints_after_updateframe = true  -- kinda overkill, but works. Refresh all waypoints if something got translated.
		end

		local showbriefsteps = profile.showbriefsteps-- and self.db.profile.minimode

		--print(stepframenum,stepdata,stepdata and GQ:IsStepFocused(stepdata))
		self:ShowClickersIfFocused()
		self:ShowBorderIfCurrent()
		self:Show()


		--[[
		if not self.stepchanged and not stepdata:NeedsUpdating() or (nomoredisplayed and not self:IsVisible()) then
			break --continue
		end
		--]]
		--print("Displaying step "..frame.stepnum)

		--#### position step frame
		--print("BXCGQW step width",self:GetWidth(),"line1 width",self.lines[1]:GetWidth(),debugstack)

		--self:SetWidth(showallsteps and GQ.Frame.Controls.Child:GetWidth() or GQ.Frame.Controls.Scroll:GetWidth()) -- this is needed so the text lines below can access proper widths
		self:SetWidth(GQ.Frame.Controls.StepContainer:GetWidth()) -- this is needed so the text lines below can access proper widths

		-- out of screen space? bail.
		-- but only in all steps mode!
		--[[
		local top=self:GetTop()
		local bottom=Scroll:GetBottom()
		if showallsteps and top and bottom and top<bottom then
			self:Hide()
			nomoredisplayed=true
			break --continue!
		end
		--]]

		--#### fill step frame with text and data, show lines as needed


		self:HideLines()

		local lineframe

		-- header?:
		local steplabel = stepdata:GetStepDisplayLabel()
		if steplabel then
				lineframe = self:NextLine()
			lineframe:ShowAsHeader(steplabel)
			end
		--

		--#### insert goals

		local goals = stepdata.goals

		---------------------- STICKIES INLINE ----------------------
		-- does a sticky live in here?
		-- DISABLED for now. profile.stickydisplay is now only 3 or 4. No inline stickies.
		--[=[
			if profile.stickyon and profile.stickydisplay<3 then
				local stickies = self:GetStickiesAt(stepnum)
				for _,sticky in ipairs(stickies) do
					-- we have a sticky!!
					--print("sticky",sticky.step.label)

					local complete,possible = sticky.step:IsComplete()

					if not complete or stepdata:IsComplete() then
						-- method one (only one so far)
						if not goals then 
							goals=goals_temp
							wipe(goals)
							GQ.MergeTable(stepdata.goals,goals)
						end

						GQ.MergeTable(sticky.step.goals,goals)
					end
				end
			end
		--]=]


		local canhidetravel=false
		if not profile.showinlinetravel or self.is_sticky then for i,goal in ipairs(goals) do if not goal:IsInlineTravel() then canhidetravel=true break end end end

		local full = false
		
		local hadstickies
		for i,goal in ipairs(goals) do

			if full then goal.dirtytext = true end

			-- STICKIES inline-ish

			-- DISABLED for now. profile.stickydisplay is now only 3 or 4. No inline stickies.
			--[=[
				if (profile.stickyon and profile.showcountsteps==1) and goal.parentStep.is_sticky and goal.parentStep~=GQ.CurrentStep and (profile.stickydisplay==1 or profile.stickydisplay==2) then
					if hadstickies~=goal.parentStep then
						--lineframe.label:SetFont(FONT,round(profile.fontsecsize or profile.fontsize + (self.CurrentSkinStyle.StepFontSizeMod or 0))) -- TODO skindata() friendly?
						line=line+1  lineframe=frame.lines[line]
						lineobj=lineframe
						if profile.stickydisplay==1 then
							lineobj.label:SetText("")
						elseif profile.stickydisplay==2 then
							lineobj.label:SetFont(FONT,round(profile.fontsecsize))
							lineobj.label:SetText("- also -")
							lineobj.indent=0
						end
						lineobj:SetHeight(2)
						lineobj.back:SetBackdropColor(1,1,1,1)
						lineobj.briefhidden = showbriefsteps
						lineobj.goal=nil
						lineobj.special="stickyseparator"
						hadstickies=goal.parentStep
						--lineframe.label:SetMultilineIndent(1)
					end
				end
			--]=]

			local status = goal:GetStatus()

			if status=="hidden" and not profile.showwrongsteps then
				-- don't display the line, simple
			elseif canhidetravel and goal:IsInlineTravel() then
				-- don't display inline travel if it's to be hidden

			--elseif goal.parentStep and goal.parentStep.is_sticky and goal.action=="goto" and not profile.stickygoto then
			--	-- hide gotos in stickies, when so configured

			--elseif goal:IsInlineTravel() and not goal.force_walk and LibRover:CanFlyAt(goal.map) then
			--	-- skip travel lines player can just fly over.

			elseif profile.collapsecompleted and goal:CanBeIndentHidden() and not stepdata:IsComplete() then
				-- collapse the line, if completed children say so

			else
				local briefhidden = showbriefsteps
					and (
						not goal:IsCompleteable()
						or (profile.hidecompletedinbrief and status=="complete" and not stepdata:IsComplete())
					)
					and not goal.showinbrief
				--steptext = steptext .. ("  "):rep(goal.indent or 0) .. goal:GetText() .. "|n"
				local indent = ("  "):rep(showbriefsteps and 0 or (goal.indent or 0))
				--local goaltxt = goal:GetText(stepnum>=self.CurrentStepNum)
				--local goaltxt = goal:GetText(true,profile.showbriefsteps and (self.briefstepexpansion<=0.1 --[[or stepdata~=self.briefstepexpanded--]]))
				local goaltxt = goal:GetText(true,showbriefsteps and ((self.briefstepexpansionlines[self.num] or 0)<=0.1 --[[or stepdata~=self.briefstepexpanded--]]))

				if goaltxt~="?" and goaltxt~="" then
					if profile.showwrongsteps and status=="hidden" then goaltxt = "|cff880000[*BAD*]|r "..goaltxt end

					lineframe = self:NextLine()
					--local link = ((goal.tooltip and not profile.tooltipsbelow) or (goal.x and not profile.windowlocked)) and " |cffdd44ff*|r" or ""  -- goto asterisk
					--if stepdata:IsCurrentlySticky() then link="" end
					if not goal or not goal.action then error("invalid goal") end
					if goal.action=="grind" then
						lineframe:ShowAsGrind(goal,indent..goaltxt,briefhidden)
					else
						lineframe:ShowAsGoal(goal,indent..goaltxt,briefhidden)
						goal:OnShow()
					end
					--lineframe.label:SetMultilineIndent(1)
				end

				if (goaltxt=="?" or profile.tooltipsbelow) and goal.tooltip then
					local goaltxt = goal.tooltip
					if profile.showwrongsteps and status=="hidden" then goaltxt = "|cff880000[*BAD*]|r "..goaltxt end

					lineframe = self:NextLine()
					lineframe:ShowAsGoalTip(goal,indent.."|cffeeeecc".. goaltxt.."|r")
				end
				if goal.loadguide then
					if profile.showwrongsteps and status=="hidden" then goaltxt = "|cff880000[*BAD*]|r "..goaltxt end

					lineframe:ShowAsLoadguide(goal,indent..goaltxt)
				end
				if GQ.Sync and goal:IsCompleteable() and GQ.Sync:IsEnabled() and profile.share_showparty then
					local partystatus,color=GQ.Sync:GetStepGoalPartyStatusText(goal.parentStep.num,goal.num)
					if partystatus then
						lineframe = self:NextLine()
						lineframe:ShowAsSecText(indent..partystatus)
						if color then lineframe:SetBackColor(GQ.F.HTMLColor(color)) end
					end
				end
			end
		end

		-- add synced party members' step numbers at the last line
		if GQ.Sync and stepdata==GQ.CurrentStep and GQ.Sync:IsEnabled() and profile.share_showparty then
			local aheadbehind = GQ.Sync:GetAheadBehind()
			if aheadbehind then
				lineframe = self:NextLine()
				lineframe:ShowAsSecText(aheadbehind)
			end
		end

		-- ALL collapsed? come on...
		if showbriefsteps then
			local all_collapsed=true
			for l=1,self.lines_shown do
				if not self.lines[l].briefhidden then
					all_collapsed=false
					break
				end
			end
			if all_collapsed then
				lineframe = self:NextLine()
				lineframe:ShowAsSecText("|cffaaaaaa"..L['stepcollapsed'].."|r")
				lineframe.briefhidden = false
				lineframe.special = "allcollapsed"
			end
		end

		--[[ show all is off ~~sinus 2020-10-16
			if showallsteps and TMP_TRUNCATE then
				if stepframenum>1 then
					local stepbottom = self.stepframes[stepframenum-1]:GetBottom()
					local scrollbottom = Scroll:GetBottom()
					if stepbottom and scrollbottom then
						heightleft = stepbottom-scrollbottom - 2*SkinData("StepLineMarginY") - 5
					else
						heightleft = 0
						--self:Debug("Error in step height calculation! step "..stepframenum.." stepbottom="..tostring(stepbottom).." scrollbottom="..tostring(scrollbottom)..", forcing update")
						self.frameNeedsUpdating=true
					end
				end

				if heightleft<self.MIN_STEP_HEIGHT then
					frame:Hide()
					nomoredisplayed=true
					break --continue
				end
			end
		--]]

		--[[
			if height<self.MIN_STEP_HEIGHT then
				frame.lines[1]:SetPoint("TOPLEFT",frame,GQ.STEPMARGIN_X,-4)
				frame.lines[1]:SetPoint("TOPRIGHT",frame,-GQ.STEPMARGIN_X,-4)
				height=self.MIN_STEP_HEIGHT
			else
				frame.lines[1]:SetPoint("TOPLEFT",frame,GQ.STEPMARGIN_X,-4)
				frame.lines[1]:SetPoint("TOPRIGHT",frame,-GQ.STEPMARGIN_X,-4)
			end
			-- how about NO special cases
		--]]

		--self:Debug("step "..stepframenum.." height "..height)
		--end

		--[[
			if profile.showallsteps and totalheight>GoatQuestFrameScroll:GetHeight() then
				nomoredisplayed=true
				frame:Hide()
				break --continue
			end
		--]]


		--[[
			if frame.is_sticky and profile.stickydisplay==3 then
				frame:SetBackdropBorderColor(sr,sg,sb,1)
			else
				frame:SetBackdropBorderColor(0,0,0,1)
			end
		--]]


		--[=[
			if showallsteps then
				if stepdata.num<self.CurrentStepNum then
					frame:SetAlpha(0.3)
				elseif stepdata.num==self.CurrentStepNum then
					frame:SetAlpha(1.0)
				else
					frame:SetAlpha(0.8)
				end
			else
				if true --[[ don't mess with step alpha anymore, as of 2020-09-29 --]] then
					frame:SetAlpha(1.0)
				elseif stepdata==focusedstep or (GQ.CurrentStep==focusedstep and frame.is_sticky) then -- focused step or it's sticky
					if stepframenum==1 or frame.is_sticky then
						frame:SetAlpha(1.0)
					else
						frame:SetAlpha(0.8-0.4*((stepframenum-1)/(profile.showcountsteps-1)))
					end
				elseif MouseIsOver(frame) then
					frame:SetAlpha(0.65)
				else
					frame:SetAlpha(0.3)
				end
			end
		--]=]

		--[[
			if stepnum==self.CurrentStepNum then
				--frame:EnableMouse(0)
				--frame:SetScript("OnClick",nil)
			else
				--frame:EnableMouse(1)
			end
		--]]

		self:SetBackgroundForStep()
		self:AdjustHeight()

	end
	
	function GQ_DefaultSkin_DefaultStep_Mixin:HideLines()
		for j,line in ipairs(self.lines) do
			line:Hide()
			if line.goal then line.goal:OnHide() end
			line.goal=nil
			line.tipgoal=nil
		end
		self.lines_shown=0
	end
	function GQ_DefaultSkin_DefaultStep_Mixin:NextLine()
		self.lines_shown=self.lines_shown+1
		local lineframe = self.lines[self.lines_shown]
		lineframe:Show()
		lineframe:SetTextIndent()
		return lineframe
	end
	
	function GQ_DefaultSkin_DefaultStep_Mixin:AdjustHeight()
		local linesheight = 0
		for j,line in ipairs(self.lines) do if line:IsShown() then
			line:AdjustHeight()
			linesheight = linesheight + line:GetHeight()
			if j>1 then linesheight = linesheight + SkinData("StepLineSpacing") end
		end end
		if true then    -- not frame.truncated or not TMP_TRUNCATE
			self:SetHeight(linesheight + SkinData("StepPaddingTop") + SkinData("StepPaddingBottom"))
		else --legacy
			self:SetHeight(heightleft + 2 * SkinData("StepPaddingTop"))
		end
	end

	function GQ_DefaultSkin_DefaultStep_Mixin:ShowClickersIfFocused()
		local focused = self.step and GQ:IsStepFocused(self.step)
		for j,line in ipairs(self.lines) do line.clicker:SetShown(focused) end
	end
	
	function GQ_DefaultSkin_DefaultStep_Mixin:ShowBorderIfCurrent()
		self.border:SetShown(self.step==GQ.CurrentStep and GQ.db.profile.showallsteps)
	end

	--[[
			-- STICKY COLORS
			local sr,sg,sb,sa = 0.4,0.4,0.4,0.5
			sa = sa * profile.opacitymain
	]]
	function GQ_DefaultSkin_DefaultStep_Mixin:SetBackgroundForStep()
		local profile = GQ.db.profile
		local stepdata = self.step
		profile.stepbackalpha=1.0 * profile.opacitymain * profile.opacitymain  -- twice, to make it more transparent, as it's overlaid on normal window background anyway.
		if stepdata:AreRequirementsMet() then
			if stepdata:IsComplete() and GQ.Sync and GQ.Sync:IsClearToProceed() then
				self:SetBackdropColor(fromRGBmul_a(profile.goalbackcomplete,0.5,profile.stepbackalpha))
				if (not SkinData("StepBackdropPersistentBorder")) then
					self:SetBackdropBorderColor(fromRGBmul_a(profile.goalbackcomplete,0.5,profile.stepbackalpha))
				end
				--self:SetBackdropColor(0,0.7,0,0.5)
			elseif (profile.skipobsolete and stepdata:IsObsolete()) then
				self:SetBackdropColor(fromRGBmul_a(profile.goalbackobsolete,0.5,profile.stepbackalpha))
				if (not SkinData("StepBackdropPersistentBorder")) then
					self:SetBackdropBorderColor(fromRGBmul_a(profile.goalbackobsolete,0.5,profile.stepbackalpha))
				end
			elseif (profile.skipauxsteps and stepdata:IsAuxiliarySkippable()) then
				self:SetBackdropColor(fromRGBmul_a(profile.goalbackaux,0.5,profile.stepbackalpha))
				if (not SkinData("StepBackdropPersistentBorder")) then
					self:SetBackdropBorderColor(fromRGBmul_a(profile.goalbackaux,0.5,profile.stepbackalpha))
				end
			else
				local r,g,b = unpack(SkinData("StepBackdropColor") or {0,0,0})
				self:SetBackdropColor(r,g,b,profile.stepbackalpha)
				if (not SkinData("StepBackdropPersistentBorder")) then
					self:SetBackdropBorderColor(0,0,0,profile.stepbackalpha)
				end
			end
		else
			self:SetBackdropColor(0.5,0.0,0.0,profile.stepbackalpha)
			if (not SkinData("StepBackdropPersistentBorder")) then
				self:SetBackdropBorderColor(0.5,0.0,0.0,profile.stepbackalpha)
			end
		end

		--[[
			if not profile.showstepborders then
				self:SetBackdropColor(0,0,0,0)
				self:SetBackdropBorderColor(0,0,0,0)
			end
		--]]
	end
--

GQ_DefaultSkin_StepLine_Mixin = {}
--
	function GQ_DefaultSkin_StepLine_Mixin:OnLoad()
		self.label = self.content.label
		self.icon = self.content.icon

		--label:SetMultilineIndent(true)

		self.clicker.parentLine = self
		--clicker.num = i
		--clicker:RegisterForClicks("LeftButtonUp","RightButtonUp")

		self.anim_fade = self.back.Fade

		self:ApplySkin()
	end

	function GQ_DefaultSkin_StepLine_Mixin:ApplySkin()
		self:SetHeight(22)

		self.clicker:SetBackdrop(SkinData("StepLineClickerBackdrop"))
		
		self.back:SetBackdrop(SkinData("StepLineBackBackdrop"))
		self.back:SetColor(unpack(SkinData("StepLineBackBackdropColor")))
		
		CHAIN(self.content)
			:ClearAllPoints()
			:SetPoint("BOTTOMLEFT",SkinData("StepLinePaddingWidth"),SkinData("StepLinePaddingHeight"))
			:SetPoint("TOPRIGHT",-SkinData("StepLinePaddingWidth"),-SkinData("StepLinePaddingHeight"))

		local iconsize=SkinData("StepLineIconSize") * GQ.db.profile.fontsize
		GQ.ChainCall(self.icon)
			:ClearAllPoints()
			:SetPoint("TOPLEFT",self.content,"TOPLEFT")
			:SetTexture(GQ.SKINSDIR.."icons")
			:SetSize(iconsize,iconsize)
		self:SetIcon(1)

		GQ.ChainCall(self.label)
			:ClearAllPoints()
			:SetPoint("TOPLEFT",self.icon,"TOPRIGHT",SkinData("StepLineIconMarginRight"),0)
			:SetPoint("TOPRIGHT",self.content,"TOPRIGHT",0,0)
	end

	function GQ_DefaultSkin_StepLine_Mixin:SetText(text)
		self.label:SetHeight(300)
		self.label:SetText(text)
		self.label:SetHeight(self.label:GetStringHeight())
		--if text:find("globs") then print("BCHJDRY",self.label:GetStringHeight()) end
	end

	function GQ_DefaultSkin_StepLine_Mixin:SetIcon(n,desaturated)
		if n==false then self.icon:Hide() return end
		local iconcount=GQ.IconSets.StepLineIcons.cols

		self.icon:SetTexture(SkinData("StepLineIcons"))
		self.icon:SetTexCoord((n-1)/iconcount,n/iconcount,0,1)
		self.icon:SetDesaturated(not not desaturated)
		self.icon:Show()
	end

	function GQ_DefaultSkin_StepLine_Mixin:SetIconTexture(tex)
		self.icon:SetTexture(tex)
		self.icon:SetTexCoord(0,1,0,1)
		self.icon:Show()
	end

	function GQ_DefaultSkin_StepLine_Mixin:SetBackColor(r,g,b,a)
		self.br,self.bg,self.bb,self.ba = r,g,b,a
		--local h=self.backhighlight or 0
		--self.back:SetColor(r+(1-r)*h,g+(1-g)*h,b+(1-b)*h,a)
		self.back:SetColor(r,g,b,a)
		self.back:SetColor(r,g,b,a)
	end

	function GQ_DefaultSkin_StepLine_Mixin:PlayFadeAnim(sr,sg,sb,sa,r,g,b,a)
		local af=self.anim_fade
		af.sr, af.sg, af.sb, af.sa = sr,sg,sb,sa
		af.r, af.g, af.b, af.a = r,g,b,a
		af:Play()
	end

	function GQ_DefaultSkin_StepLine_Mixin:SetFadeAnimRGBA(r,g,b,a)
		local af=self.anim_fade
		af.r,af.g,af.b,af.a = r,g,b,a
		if af:IsDone() or not af:IsPlaying() then
			local oldr,oldg,oldb,olda = self.back:GetBackdropColor()
			if abs(oldr-r)>0.01 or abs(oldg-g)>0.01 or abs(oldb-b)>0.01 or abs(olda-a)>0.01 then
				self:SetBackColor(r,g,b,a)
				GQ:Debug("&greenlines %d not playing, changing %s%d,%d,%d|r to %s%d,%d,%d",self.goal.num,GQ.ArrayToStringColor({oldr,oldg,oldb,olda}),oldr*255,oldg*255,oldb*255,GQ.ArrayToStringColor({r,g,b,a}),r*255,g*255,b*255)
			end
		else -- still playing
			-- just let it do its thing with the new .r,.g,.b,.a values.
		end
	end

	function GQ_DefaultSkin_StepLine_Mixin:HideBack()
		local af=self.anim_fade
		af.sr, af.sg, af.sb, af.sa = 0,0,0,0
		af:Stop()
		self:SetBackColor(0,0,0,0)
	end
	
	-- STICKY COLORS
	local sr,sg,sb,sa = 0.4,0.4,0.4,0.5
	function GQ_DefaultSkin_StepLine_Mixin:ShowAsStickySeparator(sr,sg,sb)  -- used only in inline sticky mode, thus unused
		self.icon:Hide()
		self:SetBackColor(sr,sg,sb,1)
	end
	function GQ_DefaultSkin_StepLine_Mixin:ShowAsStickyLine(sr,sg,sb)  -- used only in inline sticky mode, thus unused
		self.icon:Hide()
		self:SetBackColor(sr,sg,sb,sa * GQ.db.profile.opacitymain)
	end
	function GQ_DefaultSkin_StepLine_Mixin:ShowAsSubtitle()
		self.icon:Hide()
		self:SetBackColor(0,0,0,1)
	end
	function GQ_DefaultSkin_StepLine_Mixin:SetBackHighlight(highlight)  -- better, but unused
		self.backhighlight = highlight
		self:SetBackColor(self.br,self.bg,self.bb,self.ba)
	end
	function GQ_DefaultSkin_StepLine_Mixin:AddHighlightToBack()
		local h=0.1
		self.back:SetColor(self.br+(1-self.br)*h,self.bg+(1-self.bg)*h,self.bb+(1-self.bb)*h,self.ba)
	end
	function GQ_DefaultSkin_StepLine_Mixin:SetTextIndent()
		local icon_indent = GQ.db.profile.goalicons and SkinData("IconIndent") or 0
		self.label:SetSpacing(0)
		--self.label:SetPoint("TOPLEFT",self.isheader and 0 or icon_indent+2,(self.num==1 and -2 or -1))
	end
	function GQ_DefaultSkin_StepLine_Mixin:ShowAsHeader(text)
		self:SetText(text)
		--self.label:SetMultilineIndent(1)
		self.goal = nil
		self.label:SetFont(GQ.Font,round(GQ.db.profile.fontsecsize))
		self.icon:Hide()
		-- TODO how about we let skin decide?
		self:SetBackColor(0,0,0,0.3*GQ.db.profile.opacitymain)
		self.isheader=true
		self:SetTextIndent()
	end
	function GQ_DefaultSkin_StepLine_Mixin:ShowAsGrind(goal,text,briefhidden)
		self.goal=goal
		self.isheader = nil
		self.tipgoal = nil
		self.back:Hide()
		self.label:SetSpacing(5)
		self.label:SetFont(GQ.Font,round(goal.action~="info" and GQ.db.profile.fontsize + (SkinData("StepFontSizeMod") or 0) or GQ.db.profile.fontsecsize)) -- TODO skindata() friendly?
		self:SetText(text)
		self.briefhidden = briefhidden
		self.special = (goal.parentStep and goal.parentStep.is_sticky and goal.parentStep~=GQ.CurrentStep and "stickyline")
		self:ShowGoalBackground()
	end
	
	function GQ_DefaultSkin_StepLine_Mixin:ShowAsGoal(goal,text,briefhidden)
		self.goal=goal
		self.isheader = nil
		self.tipgoal = nil
		self.back:Hide()
		self.label:SetFont(GQ.Font,round(goal.action~="info" and GQ.db.profile.fontsize + (SkinData("StepFontSizeMod") or 0) or GQ.db.profile.fontsecsize)) -- TODO skindata() friendly?
		self:SetText(text)
		self.briefhidden = briefhidden
		self.special = (goal.parentStep and goal.parentStep.is_sticky and goal.parentStep~=GQ.CurrentStep and "stickyline")

		self:ShowGoalIcon()
		self:ShowGoalBackground()
	end

	local action_is_poi = {poi_treasure=1, poi_rare=1, poi_questobjective=1, poiannounce=1, poiaccess=1, poicurrency=1}
	function GQ_DefaultSkin_StepLine_Mixin:ShowGoalIcon()
		local goal=self.goal
		local label=self.label
		local status,done,needed = goal:GetStatus()
		if GQ.db.profile.goalicons then
			--label:SetPoint("TOPLEFT",self.icon,"TOPRIGHT",SkinData("StepLineIconMarginRight"),0)

			if goal.next then
				self:SetIcon(GQ.actionicons['next'])
			elseif goal.loadguide then
				self:SetIcon(GQ.actionicons['loadguide'])
			elseif goal.action=="achieve" and goal.achieveid then
				self:SetIconTexture(goal.achieveicon)
			elseif action_is_poi[goal.action] then
				self:SetIcon(GQ.actionicons[goal.action])
			elseif status=="passive" then

				if goal.action=="talk" or goal.action=="from" or goal.action=="goto" or
				goal.action=="goldcollect" or goal.action=="goldtracker" or (goal.action=="image" and not goal.inline) then
					self:SetIcon(GQ.actionicons[goal.action])
				elseif (goal.action=="image" and goal.inline) then
					self:SetIcon(0)
				else
					self:SetIcon(1)
				end

			elseif status=="incomplete" then

				self:SetIcon(GQ.actionicons[goal.action])

			elseif status=="complete" then

				self:SetIcon(3)

			elseif status=="impossible" then

				self:SetIcon(GQ.actionicons[goal.action],"desaturated")

			elseif status=="obsolete" then

				--icon:SetIcon(GQ.actionicons[goal.action])
				--icon:SetDesaturated(false)
				self:SetIcon(GQ.actionicons[goal.action],"desaturated")

			else	-- maybe hidden, maybe WTF
				self:SetIcon(1)
			end
		else
			self:SetIcon(false)
			--label:SetPoint("TOPLEFT",SkinData("StepLineIconOffset"),-1)
		end
	end

	function GQ_DefaultSkin_StepLine_Mixin:ShowGoalBackground()
		local goal=self.goal
		local status,done,needed = goal:GetStatus()
		local progress = (done or 0)/(needed or 1)

		if GQ.db.profile.goalbackgrounds then

			self.back:Show()

			-- COLORS

			local r,g,b,a=0,0,0,0

			local profile = GQ.db.profile

			if status=="passive" then
				--if line.special=="stickyline" then
				--	r,g,b,a = 0.2,0.15,0,1
				--else
					r,g,b,a = 0,0,0,0
				--end
				--[[
				if self.db.profile.highlight_goto and goal.x and GQ.Pointer.DestinationWaypoint and GQ.Pointer.DestinationWaypoint.goal==goal then
					r,g,b,a = 1,1,1,0.1
				end
				--]]

			elseif status=="incomplete" then

				local inc=profile.goalbackincomplete
				local pro=profile.goalbackprogressing
				local com=profile.goalbackcomplete
				r,g,b = GQ.gradient3(profile.goalbackprogress and progress*0.7 or 0,  inc.r,inc.g,inc.b, pro.r,pro.g,pro.b, com.r,com.g,com.b, 0.5)
				a = profile.goalbackincomplete.a

				--local r,g,b,a = gradientRGBA(profile.goalbackincomplete,profile.goalbackcomplete,profile.goalbackprogress and progress*0.7 or 0)

			elseif status=="complete" then

				r,g,b,a = fromRGBA(profile.goalbackcomplete)

			elseif status=="impossible" then

				r,g,b,a = fromRGBA(profile.goalbackimpossible)


			elseif status=="warning" then

				r,g,b,a = fromRGBA(profile.goalbackwarning)
			end

			-- FLASHES

			local needsAnimating = GQ.goalsneedanimating[goal]

			a = a * profile.opacitymain

			if (goal.action~="goto" and goal.action~="fly") and profile.goalupdateflash and needsAnimating and GQ.frameNeedsResizing==0 then

				if self.special=="stickyline" then  r,g,b,a=mix4(sr,sg,sb,sa, r,g,b,0.3)  end

				goal.needsAnimating=nil

				self:PlayFadeAnim(1,1,1,1,r,g,b,a)
				GQ.goalsneedanimating[goal]=nil
				--GQ:Debug("Animating progress: %s",goal:GetText())

				-- GQ.completionelapsed = 0  -- experimental delay

			elseif status=="complete" and needsAnimating and profile.goalcompletionflash and GQ.frameNeedsResizing==0 then

				local c=profile.goalbackcomplete
				self:PlayFadeAnim(1,1,1,1,c.r,c.g,c.b,c.a)
				GQ.goalsneedanimating[goal]=nil
				--GQ:Debug("Animating completion.")

				-- GQ.completionelapsed = 0  -- experimental delay
			end

			if self.special=="stickyline" and profile.stickycolored then  r,g,b,a=mix4(sr,sg,sb,sa, r,g,b,a*0.5)  end
			self:SetFadeAnimRGBA(r,g,b,a)

			if GQ.db.profile.highlight_goto and self.step and GQ:IsStepFocused(self.step) and goal and goal.num==self.step.current_waypoint_goal_num then
				self:AddHighlightToBack()
			end

		else
			self:HideBack()
		end

		if status=="impossible" then
			self:SetAlpha(0.4)
		else
			self:SetAlpha(1.0)
		end
	end

	function GQ_DefaultSkin_StepLine_Mixin:ShowAsGoalTip(goal,text)
		self:SetAlpha(1)
		self:Show()
		self.label:SetFont(GQ.Font,round(GQ.db.profile.fontsecsize))
		self:SetText(text)
		self:SetIcon(false)
		self:HideBack()
		--self.label:SetMultilineIndent(1)
		self.goal = nil
		self.tipgoal = goal
		self.briefhidden = true
		self.special = (goal.parentStep.is_sticky and goal.parentStep~=GQ.CurrentStep and "stickyline")
	end
	function GQ_DefaultSkin_StepLine_Mixin:ShowAsPriText(text)  --unused
		self:Show()
		self.label:SetFont(GQ.Font,GQ.db.profile.fontsize)
		self:SetText(text)
		self:SetIcon(false)
		self:HideBack()
		self.goal = nil
		self.tipgoal = nil
	end
	function GQ_DefaultSkin_StepLine_Mixin:ShowAsSecText(text)
		self:SetAlpha(1)
		self:Show()
		self.label:SetFont(GQ.Font,round(GQ.db.profile.fontsecsize))
		self:SetText(text)
		self:SetIcon(false)
		self:HideBack()
		self.goal=nil
		self.tipgoal = nil
		self.briefhidden = true
	end

	function GQ_DefaultSkin_StepLine_Mixin:ShowAsLoadguide(goal,text,briefhidden)
		self.goal=goal
		self.isheader = nil
		self.tipgoal = nil
		self.back:Hide()
		self.label:SetFont(GQ.Font,round(goal.action~="info" and GQ.db.profile.fontsize + (SkinData("StepFontSizeMod") or 0) or GQ.db.profile.fontsecsize)) -- TODO skindata() friendly?
		self:SetText(text)
		self.briefhidden = briefhidden
		self.special = (goal.parentStep and goal.parentStep.is_sticky and goal.parentStep~=GQ.CurrentStep and "stickyline")

		self:ShowGoalIcon()
		self:ShowGoalBackground()
		self:SetAlpha(1)

	end


	function GQ_DefaultSkin_StepLine_Mixin:AdjustHeight()
		--local icon_indent = GQ.db.profile.goalicons and SkinData("IconIndent") or 0
		
		-- WHY do we need a workaround like that!?  Stupid frames get a width of 0 because of an OnSizeChanged call out of nowhere
		local max_text_width = self.parentStep:GetWidth() - 2 * SkinData("StepPaddingWidth") - 2 * SkinData("StepLinePaddingWidth") - self.icon:GetWidth() - SkinData("StepLineIconMarginRight")
		if max_text_width<0 then max_text_width=max_text_width+GQ.Frame.Controls.StepContainer:GetWidth() end  -- BFA 8.0.1.26530 bug: step's frame has a width of 0 here...
		self.label:SetSize(max_text_width,300)
		
		--if self.label:GetText():find("yellow globs") then print(("line:%d text:%d %d %d"):format(self:GetWidth(),self.label:GetWidth(),self.label:GetHeight(),self.label:GetStringHeight(),0)) end
		local lineheight = self.label:GetStringHeight()
		self.label:SetHeight(lineheight+10)

		--print("QWEQWEWB",self.num,self.label:GetWidth(),textheight)
		--if text:IsTruncated() then textheight=textheight+self.db.profile.fontsize+6 end
		lineheight = lineheight + 2 * SkinData("StepLinePaddingHeight")

		if self.special=="stickyseparator" then  --deprecated
			if GQ.db.profile.stickydisplay==1 then
				lineheight=2
			elseif GQ.db.profile.stickydisplay==2 then
				--self.label:SetText("- also -")
				--lineheight = textheight + STEP_LINE_SPACING
			end
		end

		--[=[ brief steps
			if false and self.briefhidden and showbriefsteps --[[and stepdata==self.CurrentStep--]] then
				--lineheight = lineheight * self.briefstepexpansion
				lineheight = lineheight * (self.briefstepexpansionlines[stepframenum] or 0)

				--self:SetAlpha(self.briefstepexpansion)
				self:SetAlpha(self.briefstepexpansionlines[stepframenum] or 0)
				self.label:SetAlpha(self.briefstepexpansionlines[stepframenum] or 0)
				self.icon:SetAlpha(self.briefstepexpansionlines[stepframenum] or 0)
			else
				self:SetAlpha(1)
				self.label:SetAlpha(1)
				self.icon:SetAlpha(1)
			end
		--]=]

		--text:SetWidth(GoatQuestFrameScroll:GetWidth()-30)

		--[[ showallsteps is off ~~sinus 2020-10-16 
			if false and TMP_TRUNCATE and showallsteps and height>heightleft then
				self.goal=nil
				if l<=2 then
					abort=true
					break
				else
					frame.truncated=true
					frame.lines[l-1].label:SetText("   . . .")
					frame.lines[l-1].goal=nil
					self:Hide()
					height=height-lineheight
				end
			else
				self:Show()
				--if self.goal then frame.goallines[self.goal.num]=self end
			end
		--]]

		self:SetHeight(lineheight)
	end
	
--

GQ_DefaultSkin_StepLineClicker_Mixin = {}
--
	function GQ_DefaultSkin_StepLineClicker_Mixin:OnEnter()
		if not self.parentLine.parentStep.is_sticky then self:SetAlpha(0.15) end
		GQ:GoalOnEnter(self.parentLine)
	end

	function GQ_DefaultSkin_StepLineClicker_Mixin:OnLeave()
		if not self.parentLine.parentStep.is_sticky
		--and not (DropDownForkList1 and DropDownForkList1:IsShown() and DropDownForkList1.dropdown==GQ.Frame.Menu and GQ.Frame.Menu.goalframe==self.parentLine)
		then
			self:SetAlpha(0.0)
		end
		GQ:GoalOnLeave(self.parentLine)
	end

	function GQ_DefaultSkin_StepLineClicker_Mixin:OnClick(button)
		GQ:SendMessage("CLICKED_GOAL",button,self.parentLine.goal and self.parentLine.goal.num)
		GQ:GoalOnClick(self.parentLine,button)
	end

	function GQ_DefaultSkin_StepLineClicker_Mixin:OnUpdate(elapsed)
		do return end
		--GQ:Debug(self:GetName())
		if self:IsMouseOver() then
			if self.wasDressUp~=IsModifiedClick("DRESSUP") then
				self.wasDressUp=IsModifiedClick("DRESSUP")
				self:OnEnter()
				return
			end
			if self.wasCompare~=IsModifiedClick("COMPAREITEMS") then
				self.wasCompare=IsModifiedClick("COMPAREITEMS")
				self:OnEnter()
				return
			end
		end
	end

	function GQ_DefaultSkin_StepLineClicker_Mixin:OnLoad()
		if self.SetBackdrop then self:OnBackdropLoaded() end
		self:EnableMouse(true)
		self:RegisterForClicks("LeftButtonUp","RightButtonUp")
	end

--

--function GQ_DefaultSkin_Frame_Mixin:SearchButton_OnClick(button)
--	GQ.WhoWhere:ShowFindNearest()
--end
--function GQ_DefaultSkin_Frame_Mixin:SearchButton_OnEnter(button)
--	GQ.WhoWhere:OnEnter()
--end


local GQF
local Border
local TitleBar

local function CreateProgressBar(frame)
	local ProgressBar = GQ.UI:Create("ProgressBar",frame)
	local modes = {"quests","steps","exp"}

	function ProgressBar:Update()
		local current_guide = GQ.CurrentGuide
		local mode = GQ.db.profile.progressbarmode or "steps"

		if not current_guide or not current_guide.CurrentStepNum or not GQ.db.profile.progress then 
			ProgressBar:SetPercent(0)
			return 
		end

		-- progress
		local percent,num,total = current_guide:GetCompletion(mode)
		
		if mode=="exp" then
			num = UnitXP("player");
			if UnitLevel("player") == GetMaxPlayerLevel() then num = UnitXPMax("player") end

			total = UnitXPMax("player");
			percent = max(num / total, 0);
		end

		-- color
		local r,g,b,a
		if mode == "quests" then
			r,g,b,a = 0,204/255,1/255,1
		elseif mode=="steps" then
			r,g,b,a = 0,204/255,1/255,1
		else -- exp
			local rested = GetRestState()
			if rested==1 then -- rested
				r,g,b,a =  56/255,90/255,215/255,1
			else
				r,g,b,a =  127/255,63/255,156/255,1
			end
		end


		-- text and tooltip
		local tooltiptext = L['frame_guide_'..mode..'completed']:format(num,total)
		local maintext = (percent==1) and (mode=="exp" and L['frame_exp_complete'] or L['frame_guide_complete']) or L['frame_guide_'..mode..'progress']:format(floor(percent*100))

		ProgressBar:SetColor(r,g,b,a)
		ProgressBar:SetPercent(percent*100)
		ProgressBar:SetText(maintext)
		ProgressBar:SetTooltip(tooltiptext)
	end

	local function ProgressBar_OnClick(self)
		local modeindex = 1
		-- find current mode
		for i,v in ipairs(modes) do 
			if GQ.db.profile.progressbarmode==v then modeindex=i end 
		end
	
		-- loop through modes array
		if modeindex==#modes then 
			modeindex = 1 
		else
			modeindex = modeindex + 1
		end

		-- update profile
		GQ.db.profile.progressbarmode = modes[modeindex] 

		GQ:SendMessage("CLICKED_PROGRESSBAR",GQ.db.profile.progressbarmode)

		ProgressBar:Update()
		ProgressBar:GetScript("OnEnter")(ProgressBar)
	end
	ProgressBar:SetScript("OnClick",function(self) ProgressBar_OnClick(self) end)
	GQ:AddEventHandler("PLAYER_XP_UPDATE",ProgressBar.Update)

	frame.ProgressBar = ProgressBar
	GQ.ProgressBar = ProgressBar
	return ProgressBar
end

---@class FrameXMLWidget
---@field GetObjectType fun()
---@field GetParentKey fun()

--GQ_DefaultSkin_Frame_Mixin
	local profile

	function GQ_DefaultSkin_Frame_Mixin:OnLoad()
		local Border = self.Border
		local TitleBar = Border.TitleBar
		local Toolbar = Border.Toolbar
		local TabContainer = Border.TabContainer
		local Scroll = self.Border.Scroll		

		-- exports
		---@type {[string]:FrameXMLWidget}
		self.Controls = {
			--LockButton = Border.TitleBar.LockButton,
			TitleBar = TitleBar or error(),
			CloseButton = TitleBar.CloseButton or error(),
			ReportButton = TitleBar.ReportButton or error(),
			Logo = TitleBar.Logo or error(),
			DevLabel = TitleBar.DevLabel or error(),

			--SearchButton = Border.TitleBar.SearchButton,
			MenuSettingsButton = Border.MenuSettingsButton or error(),
			MenuAdditionalButton = Toolbar.MenuAdditionalButton or error(),
			PrevButton = Toolbar.PrevButton or error(),
			NextButton = Toolbar.NextButton or error(),
			NextButtonSpecial = Toolbar.NextButtonSpecial or error(),
			GuideShareButton = Toolbar.GuideShareButton or error(),
			--MiniButton = Border.Toolbar.MiniButton,
			Toolbar = Toolbar,
			StepNum = Toolbar.StepNum or error(),
			ReportStep = Toolbar.ReportStep or error(),

			Scroll = Scroll or error(),
			StepContainer = Scroll.StepContainer or error(),
			DefaultStateButton = self.Border.DefaultStateButton or error(),

			TabContainer = TabContainer or error(),
			TabsAddButton = TabContainer.TabsAddButton or error(),
			TabsMoreButton = TabContainer.TabsMoreButton or error(),

			MenuHostSettings = self.MenuHostSettings or error(),
			MenuHostAdditional = self.MenuHostAdditional or error(),
			MenuHostGuides = self.MenuHostGuides or error(),
			MenuHostNotifications = TitleBar.MenuHostNotifications or error(),
		}

		self:ApplyGuideOnlyControls()
		self:EnableMouseWheel(1)

		-- Settings Button
		CHAIN(Border.MenuSettingsButton)
			:ClearAllPoints()
			:SetPoint("TOPLEFT", TitleBar,"TOPLEFT",9,-7)
			:SetFrameLevel(5)

		-- Progress Bar
		self.Controls.ProgressBar = CHAIN(CreateProgressBar(self))
			:SetFrameLevel(self:GetFrameLevel()+5)
			:SetTextOnMouse(true)
		.__END

		-- Search Button
		--CHAIN(TitleBar.SearchButton)
		--	:ClearAllPoints()
		--	:SetPoint("TOPLEFT", TitleBar ,"TOPLEFT",30,-7)
		--	:SetSize(16,16)
		--	:SetNormalTexture(GQ.SKINSDIR.."icons-inventorymanager")
		--	:SetPushedTexture(GQ.SKINSDIR.."icons-inventorymanager")
		--	:SetHighlightTexture(GQ.SKINSDIR.."icons-inventorymanager")
		--TitleBar.SearchButton.ntx:SetTexCoord(0,0.125,0,0.5)
		--TitleBar.SearchButton.htx:SetTexCoord(0,0.125,0,0.5)
		--TitleBar.SearchButton.ptx:SetTexCoord(0,0.125,0,0.5)


		-- scrollbar

		Scroll.ScrollByDelta = function(self,delta)
			if not self.Bar:IsShown() then return end
			local step = GQ.db.profile.showcountsteps>0 and 30 --[[pixels]] or 3 --[[steps]]
			self.Bar:SetValue(self.Bar:GetValue()+delta*step)
		end
		Scroll:EnableMouseWheel(1)
		Scroll:SetScript("OnMouseWheel",function(f,delta) Scroll:ScrollByDelta(-delta) end)
		Scroll.OldSetVerticalScroll = Scroll.SetVerticalScroll
		Scroll.SetVerticalScroll = function(self)
			if GQ.db.profile.showcountsteps==0 then
				GQ:UpdateFrame() -- will redisplay based on self.Bar:GetValue(), no actual scrolling involved
			else
				return self:OldSetVerticalScroll(self.Bar:GetValue())
			end
		end
		Scroll.GetContentHeight = function()
			return GQ.Frame.Controls.StepContainer:GetHeight()
		end
		Scroll.GetScrollRange = function(self)
			if GQ.db.profile.showcountsteps>0 then return max(0,self:GetContentHeight()-self:GetHeight()) or 0
			else return GQ.CurrentGuide and GQ.CurrentGuide.steps and #GQ.CurrentGuide.steps or 0 end
		end

		CHAIN(Scroll.Bar:CreateTexture("BACKGROUND"))
			:SetColorTexture(0,0,0,0.4)
			:SetPoint("TOPLEFT",Scroll.Bar,"TOPLEFT")
			:SetPoint("BOTTOMRIGHT",Scroll.Bar,"BOTTOMRIGHT")

		-- arrow holder tex coords:
		-- 862/1024,907/1024,124/512,169/512
		Scroll.Bar.ScrollUpButton  :SetScript("OnClick",function(self,button) Scroll:ScrollByDelta(-1) end)
		Scroll.Bar.ScrollDownButton:SetScript("OnClick",function(self,button) Scroll:ScrollByDelta(1)  end)
		--Scroll.Bar.ThumbTexture:SetTexCoord(871/1024,896/1024,202/512,256/512)
		Scroll.Bar.ThumbTexture:SetSize(12,30)
		Scroll.scrollBarHideable = 1

		GQ.Skins:AddStyleToBlizzardScrollBar(Scroll.Bar)
		--
		GQ:AddMessageHandler("GQ_STEP_CHANGED",function()
			if GQ.db.profile.fixedheight then GQ.Frame.Controls.Scroll.Bar:SetValue(0) end
		end)

		
		Toolbar.PrevButton:RegisterForClicks("LeftButtonUp", "RightButtonUp")
		Toolbar.NextButton:RegisterForClicks("LeftButtonUp", "RightButtonUp")


		--GQF.SmoothSetHeight = GQ_SetHeight


		--local back=Border:GetRegions()
		--back:SetBlendMode("ADD")

		Border.SetBackdropBorderColorRGB = function(self,col)
			self:SetBackdropBorderColor(col.r,col.g,col.b,col.a)
		end

		-- flash
		
		-- COMMENTING for WoD crashes..?  Not anymore, Blizz fixed their shit
		self:SetupBorderFlash()

		self.mouseCount=0
		self.leftCount=0

		self.oldxPos,self.oldyPos = 0,0

		self:SetupDragWithAnything()
	
		self:CreateStepPools()
		self:HookControlMessages()
		self:SetSpecialState("loading")
	end

	function GQ_DefaultSkin_Frame_Mixin:SetupBorderFlash()
		local bg = self:CreateAnimationGroup()
		bg:SetLooping("NONE")
		local f = bg:CreateAnimation("Animation","GoatQuestFrame_bdflash")
		f:SetDuration(1.0)
		if f.SetMaxFramerate then f:SetMaxFramerate(99) end  -- 4.1 PTR issue? is SetMaxFramerate gone?
		f:SetSmoothing("OUT")
		f:SetScript("OnUpdate",doborderrgb)  -- TODO: fix this unknown var
		f.target = self.Border
		f.StartRGB = function(self,r,g,b,a,r2,g2,b2,a2)
			self.fromr,self.fromg,self.fromb,self.froma = r,g,b,a
			self.tor,self.tog,self.tob,self.toa = r2,g2,b2,a2
			self:Stop()
			self:Play()
		end
		self.bdflash = f

		self.ThinFlash:SetBackdrop({bgFile="Interface\\Buttons\\white8x8",edgeFile=GQ.DIR.."\\Skins\\glowborder", tile = true, edgeSize=32, tileSize = 128, insets = { left = 20, right = 20, top = 20, bottom = 20 }})
		self.ThinFlash:SetBackdropColor(1,1,1,0.5)
		self.ThinFlash:SetAlpha(0.0)
	end

	function GQ_DefaultSkin_Frame_Mixin:HookControlMessages()
		-- add debug/telemetry wrapper
		for k,v in pairs(self.Controls) do
			if v.GetObjectType and v:GetObjectType()=="Button" then
				local old_func = v:GetScript("OnClick")
				v:SetScript("OnClick",function(f,but,...)  GQ:SendMessage("BUTTON_CLICKED",k,but)  return old_func(f,but,...)  end)
			end
		end
	end

	-- make stuff drag me
	function GQ_DefaultSkin_Frame_Mixin:SetupDragWithAnything()
		self.everything = {}
		local function grab_all_children(tab)
			for _,c in ipairs(tab) do
				tinsert(self.everything,c)
				if c.GetChildren then grab_all_children{c:GetChildren()} end
				if c.GetRegions then grab_all_children{c:GetRegions()} end
			end
		end
		grab_all_children({self:GetChildren()})
		grab_all_children({self:GetRegions()})

		for _,control in ipairs(self.everything) do
			if control.GenericDrag then
				control:SetScript("OnDragStart",function(self,button) GQ.GenericDragStartHandler(self,button) end)
				control:SetScript("OnDragStop",function(self) GQ.GenericDragStopHandler(self) end)
				control:RegisterForDrag("LeftButton")
				control:EnableMouse(true)
			end
		end
	end

	function GQ_DefaultSkin_Frame_Mixin:CreateStepPools()
		self.stepframes = {}
		local function stepPoolResetter(pool,step)
			step:Hide()
		end
		assert(self.Controls.StepContainer,"StepContainer missing!")
		self.stepFramePools = {
			default=CreateFramePool("BUTTON",self.Controls.StepContainer,"GQ_DefaultSkin_DefaultStep_Template",stepPoolResetter),
			silly=CreateFramePool("BUTTON",self.Controls.StepContainer,"GQ_DefaultSkin_SillyStep_Template",stepPoolResetter),
		}


		self.stickySepPool = CreateTexturePool(self, "OVERLAY", 7, "GQ_DefaultSkin_StickySeparator_Template");
	end

	function GQ_DefaultSkin_Frame_Mixin:ApplyGuideOnlyControls()
		if not GQ.GuideOnly then return end
		self.Controls.GuideShareButton:Hide()
		self.Controls.Logo:Hide()
		if not self.GoatQuestTitle then
			self.GoatQuestTitle = self.Controls.TitleBar:CreateFontString(nil,"OVERLAY")
			self.GoatQuestTitle:SetFont(GQ.FontBold or GQ.Font,14)
			self.GoatQuestTitle:SetPoint("CENTER",self.Controls.Logo,"CENTER")
			self.GoatQuestTitle:SetTextColor(0.96,0.75,0.16)
			self.GoatQuestTitle:SetText(L.name_plain)
		end
		self.GoatQuestTitle:Show()
	end

	function GQ_DefaultSkin_Frame_Mixin:OnHide()
		GQ:Frame_OnHide()
		GQ:SendMessage("GQ_FRAME_VISIBILITY", false)
	end

	function GQ_DefaultSkin_Frame_Mixin:OnShow()
		self:ApplyGuideOnlyControls()
		GQ:Frame_OnShow()
		local flavour = (GQ.IsRetail and " retail") or (GQ.IsClassicTBC and " tbc") or (GQ.IsClassic and " classic") or (GQ.IsClassicWOTLK and " wotlk") or (GQ.IsClassicCATA and " cata") or (GQ.IsClassicMOP and " mop") or ""
		self.Controls.DevLabel:SetText(GQ.name.." rev "..GQ.revision..flavour)
		self.Controls.DevLabel:SetShown(GQ.db.profile.debug_display and not GQ.db.profile.hide_dev_once)
		GQ:SendMessage("GQ_FRAME_VISIBILITY", true)
	end

	function GQ_DefaultSkin_Frame_Mixin:ClearSteps()
		for typ,pool in pairs(self.stepFramePools) do
			pool:ReleaseAll()
		end
		self.stickySepPool:ReleaseAll()

		table.wipe(self.stepframes)
	end

	function GQ_DefaultSkin_Frame_Mixin:HideRemainingSteps()
		-- handled by pool release resetter now

		--for typ,pool in pairs(self.stepFramePools) do
		--	for i,step in ipairs(pool.inactiveObjects) do step:Hide() end
		--end
	end

	function GQ_DefaultSkin_Frame_Mixin:AddStep(step,mode)
		if #self.stepframes>GQ.StepLimit then return end

		step:PrepareCompletion()

		if (mode == "sticky" and not GQ.db.profile.alwaysshowstickies) then
			local iscomplete, ispossible = step:IsComplete()
			if iscomplete then return end  -- refuse to add completed stickies
		end
		if not step:AreRequirementsMet() and not GQ.db.profile.showwrongsteps then return end  -- refuse to add wrong steps

		local template = step.template or "default"
		local stepframe = self.stepFramePools[template]:Acquire()
		stepframe.step = step
		stepframe.num = #self.stepframes+1
		stepframe.stepnum = step.num
		stepframe.is_sticky = (mode == "sticky")
		stepframe:ClearAllPoints()
		
		assert(self.Controls.StepContainer,"StepContainer missing!")
		if stepframe.num==1 then
			stepframe:SetPoint("TOPLEFT",self.Controls.StepContainer,"TOPLEFT",0,0)
			stepframe:SetPoint("TOPRIGHT",self.Controls.StepContainer,"TOPRIGHT",0,0)

		else
			local stickytexture = self.stickySepPool:Acquire()
			stickytexture:SetParent(stepframe)
			stickytexture:SetPoint("TOP",self.stepframes[stepframe.num-1],"BOTTOM",0,-SkinData("StepStickyBarSpace"))
			stickytexture:SetPoint("LEFT",stepframe)
			stickytexture:SetPoint("RIGHT",stepframe)
			stickytexture:SetHeight(SkinData("StepStickyBarHeight"))
			stickytexture:SetVertexColor(unpack(SkinData("StepStickySeparatorColor")))
			stickytexture:SetSnapToPixelGrid(false)
			stickytexture:Show()

			--[[
			local stickytexture_bottom = self.stickySepPool:Acquire()
			stickytexture_bottom:SetParent(stepframe)
			stickytexture_bottom:SetPoint("TOP",stepframe,"BOTTOM")
			stickytexture_bottom:SetPoint("LEFT",stepframe)
			stickytexture_bottom:SetPoint("RIGHT",stepframe)
			stickytexture_bottom:SetHeight(SkinData("StepStickyBarHeight"))
			stickytexture:SetVertexColor(unpack(SkinData("StepStickySeparatorColor")))
			stickytexture:SetSnapToPixelGrid(false)
			stickytexture_bottom:Show()
			--]]

			stepframe:SetPoint("TOPLEFT",self.stepframes[stepframe.num-1],"BOTTOMLEFT",0,-SkinData("StepStickyBarSpace") -SkinData("StepStickyBarHeight") -SkinData("StepStickyBarSpace"))
			stepframe:SetPoint("TOPRIGHT",self.stepframes[stepframe.num-1],"BOTTOMRIGHT",0,-SkinData("StepStickyBarSpace") -SkinData("StepStickyBarHeight") -SkinData("StepStickyBarSpace"))
			--
			--frame:SetPoint("TOPLEFT",getglobal("GoatQuestFrame_Step"..(stepnum-1)),"BOTTOMLEFT",0,-GQ.STEP_SPACING)
			--frame:SetPoint("TOPRIGHT",getglobal("GoatQuestFrame_Step"..(stepnum-1)),"BOTTOMRIGHT",0,-GQ.STEP_SPACING)
		end

		stepframe:Render()

		tinsert(self.stepframes,stepframe)
		self.Controls.StepContainer['step'..stepframe.num..'_'..stepframe.stepnum]=stepframe  -- for debugging only
	end

	local throttle=0
	local updatetime=1/30
	function GQ_DefaultSkin_Frame_Mixin:OnUpdate(elapsed)
		if not profile then profile=GQ.db.profile end
		--[[
		if not self.aligned then
			self.aligned=true
			GQ:AlignFrame()
		end

		if GQ.temp_scansize then
			local scale = self:GetScale()
			local left,top,bottom,right = self:GetLeft(),self:GetTop(),self:GetBottom(),self:GetRight()
			GQ:Debug(("In OnUpdate: %.2f scale: left %.2f, top %.2f, bottom %.2f, right %.2f"):format(scale,left,top,bottom,right))
			GQ.temp_scansize=false
		end
		--]]

		if GQ.delayFlash and GQ.delayFlash==2 then
			GQ.delayFlash = 3
		end

		throttle=throttle+elapsed ; if throttle<updatetime then return end ; elapsed=throttle ; throttle=0

		local locked = GQ.db.profile.windowlocked

		self.Border:Show()
		self.Border:SetAlpha(1)

		--[[
		local gt=GetTime()-(GoatQuestFrame_ThinFlash.starttime or 0)
		if gt>0 and GoatQuestFrame_ThinFlash:IsShown() then
			local a = 0.5 - gt*3
			GoatQuestFrame_ThinFlash:SetAlpha(a)
			if (a<0.01) then
				--GoatQuestFrame_ThinFlash:Hide()
			end
		end
		--]]

		-- flash
		-- the regular code sets GQ.delayFlash to 1 and then to 2; upon first update it gets promoted to 3, and only upon that is the flash fired
		-- this is to make sure it flashes after steps had time to rearrange themselves

		-- COMMENTING for WoD crashes..?  Not anymore, Blizz fixed their shit
		if GQ.delayFlash and GQ.delayFlash==3 then
			local ThinFlash = self.ThinFlash
			ThinFlash.flash:Stop()
			--if Border:IsVisible() then
			--else
				if profile.showcountsteps==0 then
					ThinFlash:ClearAllPoints()
					ThinFlash:SetPoint("TOPLEFT",self.Scroll,"TOPLEFT",-18,18)
					local lastbottom=0
					for i=2,20 do
						if self.stepframes[i]:IsVisible() then lastbottom=self.Scroll:GetTop()-self.stepframes[i]:GetBottom() end
					end
					if lastbottom>0 then
						lastbottom = self.Scroll:GetHeight()-lastbottom
					end
					ThinFlash:SetPoint("BOTTOMRIGHT",self.Scroll,"BOTTOMRIGHT",18 - 15,-18 + lastbottom)
				else
					ThinFlash:ClearAllPoints()
					ThinFlash:SetPoint("TOPLEFT",self.stepframes[1],"TOPLEFT",-18,18)
					ThinFlash:SetPoint("BOTTOMRIGHT",self.stepframes[1],"BOTTOMRIGHT",18,-18)
				end
				ThinFlash.flash:Play()
				--GoatQuestFrame_ThinFlash.starttime = GetTime()+0.2
				ThinFlash:Show()
			--end
			GQ.delayFlash = 0
		end



		--[[
		if not GQ.briefstepexpansion then GQ.briefstepexpansion=0.01 end
		if not GQ.briefstepexpansionspeed then GQ.briefstepexpansionspeed=0 end
		local oldexpansion=GQ.briefstepexpansion
		GQ.briefstepexpansion = GQ.briefstepexpansion + elapsed*GQ.briefstepexpansionspeed
		if GQ.briefstepexpansion>1 then GQ.briefstepexpansion=1 end
		if GQ.briefstepexpansion<0.01 then GQ.briefstepexpansion=0.01 end
		if GQ.briefstepexpansion~=oldexpansion then GQ.frameNeedsUpdating = true end
		--]]

		for i=1,LINES_PER_STEP do
			local ex=GQ.briefstepexpansionlines
			local sp=GQ.briefstepexpansionspeedlines
			if not ex[i] then ex[i]=0.01 end
			if not sp[i] then sp[i]=0 end
			local oldexpansion=ex[i]
			ex[i] = ex[i] + elapsed*sp[i]
			if ex[i]>1 then ex[i]=1 end
			if ex[i]<0.01 then ex[i]=0.01 end
			if ex[i]~=oldexpansion then GQ.frameNeedsUpdating = true end
		end

		-- title button flash
		if GQ.Tabs.AddButton then
			if (not GQ.CurrentGuide and not GQ.loading) or GQ.suggesting then
				GQ.Tabs.AddButton.flashing = true
				GQ.Tabs.AddButton:LockHighlight()
			else
				GQ.Tabs.AddButton.flashing = nil
				GQ.Tabs.AddButton:UnlockHighlight()
			end
		end

		if GQ.frameNeedsUpdating then
			GQ.frameNeedsUpdating=nil
			--GQ:Debug("frameNeedsUpdating, so updating.")
			GQ:UpdateFrame()
		end

		-- and now the FAST step surfing
		if GQ.fastforward then
			GQ.completionelapsed = GQ.completionelapsed + elapsed
			if GQ.completionelapsed>=GQ.completioninterval then
				GQ:TryToCompleteStep(true)
			end
		end

		-- step onenter/onleave replacement
		if false and profile.showbriefsteps then   -- we don't support that anymore
			local hoverspeed = 1/profile.briefopentime
			local outspeed = 1/profile.briefclosetime   --nasty hack for easy different mouse cooldowns
			for i=1,#self.stepframes do
				local stepf = self.stepframes[i]
				if stepf and stepf:IsShown() then

					-- menu open? postpone.
					if DropDownForkList1 and DropDownForkList1:IsShown() and DropDownForkList1.dropdown==GQ.Frame.Menu then break end

					if not stepf.mousecounter then stepf.mousecounter=0 end

					if stepf:IsMouseOver() then
						if stepf.mousecounter<0 then stepf.mousecounter=0 end
						stepf.mousecounter = (stepf.mousecounter or 0) + elapsed*hoverspeed
						if stepf.mousecounter>=0.99 then
							-- enter
							--GQ.briefstepexpansionspeed = 5
							GQ.briefstepexpansionspeedlines[stepf.num] = 5
						end
					else
						if stepf.mousecounter>1 then stepf.mousecounter=1 end
						stepf.mousecounter = (stepf.mousecounter or 0) - elapsed*outspeed
						if stepf.mousecounter<=0.001 then
							-- leave
							--GQ.briefstepexpansionspeed = -5
							GQ.briefstepexpansionspeedlines[stepf.num] = -5
						end
					end

				end
			end
		end
	end

	local resizing=false
	local update_twice
	local once
	local FLICKERING_SCROLL=true
	function GQ_DefaultSkin_Frame_Mixin:OnSizeChanged()
		if FLICKERING_SCROLL then  -- protect from calling twice in same frame
			if once then return end
			once=true
			C_Timer.After(0.001,function() once=false end)
		end

		if resizing then return end
		resizing=true

		if not GQ or not GQ.db then resizing=false return end

		local width = self:GetWidth()
		local margin = SkinData("ViewerMargin")*2

		if not self.Controls then return end -- 10.1 sometimes calls for onsizechanged before frame is fully loaded. make sure we are ready before moving on.

		-- sorry. Can't rely on SetPoint alone, as they notoriously report GetWidth()==0 during resizes.
		self.Controls.StepContainer:SetWidth(GQ.db.profile.showcountsteps==0 and width-margin-19 or width-margin)

		self.Controls.Scroll.Bar:SetValue(0)

		--GQ:Debug("Calling UpdateFrame")
		GQ:UpdateFrame(true)
		--[[
		if not update_twice then  update_twice=true  C_Timer.After(0.001,function() resizing=true update_twice=nil GQ:Debug("Calling UpdateFrame a second time") GQ:UpdateFrame(true) resizing=false end) end
		C_Timer.After(0.002,function() resizing=true GQ:UpdateFrame(true) resizing=false end)
		--]]

		--if self.stepframes and self.stepframes[1] and self.stepframes[1].lines[1]:GetWidth()==0 then GQ:UpdateFrame(true) end
		--[[
		print("SCROLL:",self.Scroll.Child:GetWidth())
		if self.stepframes[1] then
			print("STEP:",self.stepframes[1]:GetWidth())
			print("LINE:",self.stepframes[1].lines[1]:GetWidth())
		else print("NO STEPFRAMES") end
		GQ:ResizeFrame()
		if self.stepframes[1] then
			print("STEP:",self.stepframes[1]:GetWidth())
			print("LINE:",self.stepframes[1].lines[1]:GetWidth())
		else print("NO STEPFRAMES") end
		--GQ.ProgressBar:SetUp()
		--]]

		self.oldWidth=self:GetWidth()
		if GQ.db.profile.showcountsteps==0 or GQ.db.profile.fixedheight then
			GQ.db.profile.fullheight = self:GetHeight()
		end

		if self.ApplySkin then self:ApplySkin() end  -- needed for upside-down texcoord trickery  -- might not be there yet on load!!!

		resizing=false
		--self.aligncount=4
	end
	
	function GQ_DefaultSkin_Frame_Mixin:OnMouseWheel(delta)
		if IsControlKeyDown() then
			if delta>0 then delta=0.25 else delta=-0.25 end
			GQ.db.profile.framescale = GQ.db.profile.framescale + delta
			if GQ.db.profile.framescale<0.75 then GQ.db.profile.framescale=0.75 end
			if GQ.db.profile.framescale>1.75 then GQ.db.profile.framescale=1.75 end
			self:SetScale(GQ.db.profile.framescale)
			GQ:UpdateFrame(true)
	
			--[[
			if GQ.db.profile.debug_newicons then
				if self:GetScale()>1.0 then
					self.Controls.LockButton:GetNormalTexture():SetTexCoord(0.5,0.5+(28/32)/2,0,(28/32))
				else
					self.Controls.LockButton:GetNormalTexture():SetTexCoord(0,0.25,0,0.5)
				end
			end
			--]]
		end
	end

	function GQ_DefaultSkin_Frame_Mixin:StopFlashAnimation()
		for i,stepfr in ipairs(self.stepframes) do
			for l=1,#stepfr.lines do
				local line = stepfr.lines[l]
				local anim_fade = line.anim_fade
				anim_fade:Stop()
				if anim_fade.r then -- if it ever ran... finalize it.
					local back=line.back
					back:SetBackdropColor(anim_fade.r,anim_fade.g,anim_fade.b,anim_fade.a)
					back:SetBackdropBorderColor(anim_fade.r,anim_fade.g,anim_fade.b,anim_fade.a)
				end
			end
		end
	end
	
	function GQ_DefaultSkin_Frame_Mixin:ResetWindow()
		if GQ.Tutorial.Running then
			GQ.Tutorial:Close()
		end
		self:GetParent():ClearAllPoints()
		self:GetParent():SetPoint("CENTER")
		GQ:SetOption("Cover","dispmodepri on")
		GoatQuestMapIcon:ClearAllPoints()
		GoatQuestMapIcon:SetPoint("CENTER",Minimap,"BOTTOMLEFT",16,16)
		GQ:UpdateFrame(true)
		GoatQuestPointer_ArrowCtrl:ClearAllPoints()
		GoatQuestPointer_ArrowCtrl:SetPoint("TOP",UIParent,"TOP",0,-200)
		if GQ.ActionBar.Frame then
			GQ.ActionBar.Frame:ClearAllPoints()
			GQ.ActionBar.Frame:SetPoint("BOTTOMLEFT",GQ.Frame,"TOPLEFT",0,10)
			GQ.db.profile.actionbar_anchor = nil
		end
		--[[
		if self.db.profile.mv_enabled then
			GQ.CV:AlignFrame() -- merged reset buttons
		end
		--]]
	end

	function GQ_DefaultSkin_Frame_Mixin:SetSpecialState(state)
		self.specialstate = state
		self:ShowSpecialState()
	end

	function GQ_DefaultSkin_Frame_Mixin:ShowSpecialState()	
		local state = self.specialstate
		local L = GQ.L
		if state=="loading" then
			self.Controls.MenuSettingsButton:Hide()
			self.Controls.TabContainer:Hide()
			self.Controls.Toolbar:Hide()
			self.Controls.Scroll:Hide()
			self.Controls.ProgressBar:Hide()
			self.Border.Back:Show()

			self.Controls.DefaultStateButton:SetScript("OnClick",nil)
			self.Controls.DefaultStateButton:Show()
			self.Controls.DefaultStateButton:SetText(L["viewer_special_loading"])
		
		elseif state=="select" then
			self.Controls.MenuSettingsButton:Show()
			self.Controls.TabContainer:Hide()
			self.Controls.Toolbar:Hide()
			self.Controls.Scroll:Hide()
			self.Controls.ProgressBar:Hide()
			self.Border.Back:Show()

			GQ.BugReport.GuideRating:HideRatingWidgets()

			if not InCombatLockdown() and GQ.ActionBar.Frame then GQ.ActionBar.Frame:Hide() end

			self.Controls.DefaultStateButton:SetScript("OnClick",function() GQ.GuideMenu:Show() end)
			self.Controls.DefaultStateButton:Show()
			self.Controls.DefaultStateButton:SetText(L["viewer_special_select"])
		else
			self.Controls.MenuSettingsButton:Show()
			self.Controls.TabContainer:Show()
			self.Controls.Toolbar:Show()
			self.Controls.Scroll:Show()	
			self.Border.Back:Show()

			if not GQ.CurrentGuide or not GQ.CurrentStep.score then
				self.Controls.ProgressBar:Show()
				GQ.Frame.Controls.StepContainer:Show()
			else
				self.Controls.ProgressBar:Hide()
				GQ.Frame.Controls.StepContainer:Hide()
			end
			if (GQ.CurrentGuide and not GQ.CurrentStep.score) and GQ.BugReport.GuideRating.NoRatingFrame then
				GQ.BugReport.GuideRating.NoRatingFrame:Hide()
			end

			if (GQ.CurrentGuide and not GQ.CurrentStep.score) and GQ.BugReport.GuideRating.GoatQuestPopup then
				GQ.BugReport.GuideRating.GoatQuestPopup:Hide()
			end

			if GQ.BugReport.GuideRating.GuideRatingViewer and GQ.BugReport.GuideRating.GuideRatingViewer:IsVisible() and GQ.BugReport.GuideRating.NoRatingFrame then
				GQ.BugReport.GuideRating.NoRatingFrame:Hide()
			end

			--GQ.Tabs:ReanchorTabs()
			--GQ.QuestDB:MaybeShowButton()

			self.Controls.DefaultStateButton:SetScript("OnClick",nil)
			self.Controls.DefaultStateButton:Hide()
		end
		
	end
--

--border showing delay
local fadespeed=0.15
local xPos,yPos
local stepframe,line



--[[
function GQFSectionDropDown_Initialize(frame,level,menulist)
	GQ:InitializeDropDown(frame,level,menulist)
end

function GQFSectionDropDown_Func()
	GQ:SetGuide(this.value)
--	ToggleDropDownMenu(1, nil, GoatQuestFrame_SectionDropDown, GoatQuestFrame, 0, 0);
end
--]]

--[[
function GQ_SetHeight(self,height)
	self.targetheight = height
	GoatQuestFrame_size:Play()
end
--]]

function GoatQuestFrame_HideTooltip(self)
	if (not self or GameTooltip:GetOwner()==self or GameTooltip:GetOwner()==GQ.Frame) then
		--GQ:Debug("HIDING in HideTooltip")
		GameTooltip:Hide()
	end
end

-------------------------------------
-- Button handlers
-------------------------------------

--[[
function GQ_DefaultSkin_Frame_Mixin.LockButton_OnClick(self,button)
	GQ:SetOption("Display","windowlocked")
	GQ.GuideMenu:RefreshOptions("GoatQuest-Display")
	GQ_DefaultSkin_Frame_Mixin.LockButton_OnEnter(self,button)
end

function GQ_DefaultSkin_Frame_Mixin.LockButton_OnEnter(self)
	GameTooltip:SetOwner(GQ.Frame, "ANCHOR_TOP")
	GameTooltip:SetText(L[GQ.db.profile["windowlocked"] and 'frame_locked' or 'frame_unlocked'])
	GameTooltip:AddLine(L[GQ.db.profile["windowlocked"] and 'frame_unlock' or 'frame_lock'],0,1,0)
	GameTooltip:Show()
end
--]]

-------------------------------------
-- Popup menus
-------------------------------------

local function HookMenuMessages(menu,message)
	-- add debug/telemetry wrapper
	for i,v in ipairs(menu) do
		if v.func then
			local old_func = v.func
			v.func=function(item,state)  GQ:SendMessage(message,v.text,state)  return old_func(item,state)  end
		end
	end
end


function GQ_DefaultSkin_Frame_Mixin:MenuSettingsButton_OnClick()
	if DropDownForkList1 and DropDownForkList1:IsShown() and DropDownForkList1.dropdown==GQ.Frame.Controls.MenuHostSettings then CloseDropDownForks() return end

	local setting_menu = {
		{-- 0
			text=L["menu_GuideMenu"],
			iconset=GQ.ButtonSets.TitleButtons,
			iconkey="LIST",
			func=function() GQ.GuideMenu:Show() end,
			notCheckable=1,
			paddingbottom=8,
		},
		{-- 1
			text=L["menu_Startup"],
			iconset=GQ.ButtonSets.TitleButtons,
			iconkey="WAND",
			func=function() if not GQ.GuideOnly then GQ.Modules.IntroWizard:Checklist() end end,
			notCheckable=1,
		},
		UIDropDownFork_separatorInfo, -- 2
		{ -- 3
			text=L["menu_LockViewer"],
			iconset=GQ.ButtonSets.TitleButtons,
			iconkey="LOCK_ON",
			func=function() GQ.db.profile.windowlocked = not GQ.db.profile.windowlocked GQ:UpdateLocking() end, 
			checked=function() return GQ.db.profile.windowlocked end,
			isNotRadio=1,
			keepShownOnClick=1,
			paddingbottom=8,
		},
		UIDropDownFork_separatorInfo, -- 4
		{ -- 7
			text = L['pointer_arrowmenu_findnearest'], -- aka findNPC
			iconset=GQ.ButtonSets.TitleButtons,
			iconkey="TRAINER",
			hasArrow=true,
			menuList = GQ.WhoWhere.Types,
			notCheckable=true,
			disabled = GQ.loading,
		},
		UIDropDownFork_separatorInfo, -- 8
		{ -- 9
			text=L["menu_Reset"],
			iconset=GQ.ButtonSets.TitleButtons,
			iconkey="CLOSE",
			func=function() self:ResetWindow() end, 
			notCheckable=1,
			paddingbottom=8,
		},
		{ -- 10
			text=L["menu_Reload"],
			iconset=GQ.ButtonSets.TitleButtons,
			iconkey="RELOAD",
			func=function() ReloadUI() end, 
			notCheckable=1,
		},
		UIDropDownFork_separatorInfo, -- 11
		{ -- 12
			text=L["menu_Settings"],
			iconset=GQ.ButtonSets.TitleButtons,
			iconkey="SETTINGS",
			func=function() GQ:OpenOptions() end,
			notCheckable=1,
		},
	}
	
	if GQ.DEV then
		table.insert(setting_menu,7,
		{ -- 7
			text = "Locations", -- via widget
			iconset=GQ.ButtonSets.TitleButtons,
			iconkey="MAPMARKER",
			hasArrow=true,
			paddingbottom = 4,
			menuList = GQ.WhoWhere.GetFavouriteLocations,
			notCheckable=true,
			disabled = GQ.loading,
		})	
	end

	if not (GQ.GuideOnly or GQ.IsForever) and (GQ.IsClassic or GQ.IsClassicTBC or GQ.IsClassicWOTLK) then
		table.insert(setting_menu,8, -- after findnearest
			{
				text=L["menu_ShowSkills"],
				iconset=GQ.ButtonSets.TitleButtons,
				iconkey="FINDNPC",
				func=function() GQ.Skills:ShowSkillPopup(nil,nil,"forceShow") end,
				notCheckable=1,
			}
		)
	end

	if GQ.GuideOnly then table.remove(setting_menu,2) end -- optional startup checklist

	for i,v in ipairs(setting_menu) do
		v.maxWidth=170
	end

	HookMenuMessages(setting_menu,"MAINMENU_ITEM")

	UIDropDownFork_SetAnchor(self.MenuHostSettings, 0, 0, "TOP", self.Controls.MenuSettingsButton, "BOTTOM")
	EasyFork(setting_menu,self.MenuHostSettings,nil,0,0,"MENU",10)
	DropDownForkList1:SetPoint("LEFT",self,"LEFT")
end

function GQ_DefaultSkin_Frame_Mixin:MenuSettingsButton_OnEnter()
	GameTooltip:SetOwner(GQ.Frame, "ANCHOR_TOP")
	GameTooltip:SetText(L['frame_settings'])
	GameTooltip:AddLine(L['frame_settings1'],0,1,0)
	--GameTooltip:AddLine(L['frame_settings2'],0,1,0)
	GameTooltip:Show()
end


function GQ_DefaultSkin_Frame_Mixin:MenuAdditionalButton_OnClick()
	if DropDownForkList1 and DropDownForkList1:IsShown() and DropDownForkList1.dropdown==self.Controls.MenuHostAdditional then CloseDropDownForks() return end

	local additional_menu = {
		UIDropDownFork_separatorInfo,
		{
			text=L["menu_TravelLines"],
			iconset=GQ.ButtonSets.TitleButtons,
			iconkey="INLINETRAVEL",
			func=function() 
				GQ:SetOption("StepDisplay","showinlinetravel")
				GQ.GuideMenu:RefreshOptions("GoatQuest-Display")
				GQ:UpdateFrame(true)
				GQ:ReanchorFrame()
				GQ:AlignFrame()
			end,
			checked=function() return GQ.db.profile.showinlinetravel end,
			isNotRadio=1,
			keepShownOnClick=1,
		},
	}

	if GQ.IsRetail then
		table.insert(additional_menu,1,{
				text=L["menu_QuestCleanup"],
				iconset=GQ.ButtonSets.TitleButtons,
				iconkey="FLASH",
				func=function() GQ:ShowQuestCleanup() end,
				notCheckable=1,
			}
		)

	else
		table.insert(additional_menu,1,{
				text=L["frame_SISButton"],
				iconset=GQ.ButtonSets.TitleButtons,
				iconkey="FLASH",
				func=function() GQ.QuestDB:ShowGuideHelper() end,
				notCheckable=1,
			}
		)
	end

	for i,v in ipairs(additional_menu) do
		if v.iconset then
			v.icon = v.iconset.file
			local texcoord=v.iconset[v.iconkey].texcoords
			v.tCoordLeft = texcoord[1][1]
			v.tCoordRight = texcoord[1][2]
			v.tCoordTop = texcoord[1][3]
			v.tCoordBottom = texcoord[1][4]
		end
	end

	HookMenuMessages(additional_menu,"ADDITIONALMENU_ITEM")

	UIDropDownFork_SetAnchor(self.MenuHostAdditional, 0, 0, "TOP", self.Controls.MenuAdditionalButton, "BOTTOM")
	EasyFork(additional_menu,self.MenuHostAdditional,nil,0,0,"MENU",10)
	DropDownForkList1:SetPoint("RIGHT",self,"RIGHT")
end

function GQ_DefaultSkin_Frame_Mixin.MenuAdditionalButton_OnEnter(self)
	GameTooltip:SetOwner(GQ.Frame, "ANCHOR_TOP")
	GameTooltip:Show()
end


-------------------

function GQ_DefaultSkin_Frame_Mixin.PrevButton_OnClick(self,button)
	if IsControlKeyDown() and not IsAltKeyDown() then
		GQ:FocusStep(1,true) -- and force focus
		GQ.pause=nil
	else
		local count=IsShiftKeyDown() and 10 or 1
		for i=1,count do
			GQ:PreviousStep(button=="RightButton",true) -- fast,forcefocus
		end
	end
	if GQ.db.profile.flipsounds then
		PlaySound(SOUNDKIT.IG_MINIMAP_ZOOM_IN)
	end
	if GQ.BugReport.GuideRating.GoatQuestPopup then GQ.BugReport.GuideRating.GoatQuestPopup:Hide() GQ.BugReport.GuideRating.GoatQuestPopupOn:Hide() end
end

function GQ_DefaultSkin_Frame_Mixin.PrevButton_OnEnter(self)
	GameTooltip:SetOwner(GQ.Frame, "ANCHOR_TOP")
	GameTooltip:SetText(L['frame_stepnav_prev'])
	GameTooltip:AddLine(L['frame_stepnav_prev_click'],0,1,0)
	GameTooltip:AddLine(L['frame_stepnav_prev_right'],0,1,0)
	GameTooltip:AddLine(L['frame_stepnav_prev_ctrl'],0,1,0)
	GameTooltip:Show()
end

-------------------

function GQ_DefaultSkin_Frame_Mixin.NextButton_OnClick(self,button)
	local count=IsShiftKeyDown() and 10 or 1
	for i=1,count do
		GQ:SkipStep(button=="RightButton",false,true)
	end
	if GQ.db.profile.flipsounds then
		PlaySound(SOUNDKIT.IG_MINIMAP_ZOOM_IN)
	end
end

function GQ_DefaultSkin_Frame_Mixin.NextButton_OnEnter(self)
	GameTooltip:SetOwner(GQ.Frame, "ANCHOR_TOP")
	GameTooltip:SetText(L['frame_stepnav_next'])
	GameTooltip:AddLine(L['frame_stepnav_next_click'],0,1,0)
	GameTooltip:AddLine(L['frame_stepnav_next_right'],0,1,0)
	GameTooltip:Show()
end

function GQ_DefaultSkin_Frame_Mixin.NextButtonSpecial_OnClick(self)
	GQ.QuestDB:FocusNextStepForQuest()
end
function GQ_DefaultSkin_Frame_Mixin.NextButtonSpecial_OnEnter(self)
	local questID = GQ.CurrentGuide.QuestSearchID
	local title = GQ.QuestDB:GetQuestName(questID)

	GameTooltip:SetOwner(GQ.Frame, "ANCHOR_TOP")
	GameTooltip:SetText(L['frame_stepnav_nextquest']:format(title or questID))
	GameTooltip:AddLine(L['frame_stepnav_nextquest_click'],0,1,0)
	GameTooltip:AddLine(L['frame_stepnav_nextquest_right'],0,1,0)
	GameTooltip:Show()
end

-------------------

function GQ_DefaultSkin_Frame_Mixin.HelpButton_OnClick(self,button)
	if not GQ.Tutorial.TooltipFrame or not GQ.Tutorial.TooltipFrame:IsVisible() then
		GQ.Tutorial:Run()
	end
end

function GQ_DefaultSkin_Frame_Mixin.HelpButton_OnEnter(self)
	GameTooltip:SetOwner(GQ.Frame, "ANCHOR_TOP")
	GameTooltip:SetText(L['frame_helpbutton'])
	GameTooltip:AddLine(L['frame_helpbutton_desc'],0,1,0)
	GameTooltip:Show()
end
--------------------

function GQ_DefaultSkin_Frame_Mixin.ReportButton_OnClick(self,button)
	GQ.BugReport:GenerateAndShow()
end

function GQ_DefaultSkin_Frame_Mixin.ReportButton_OnEnter(self)
	GameTooltip:SetOwner(GQ.Frame, "ANCHOR_TOP")
	GameTooltip:SetText(L['frame_reportbutton'])
	GameTooltip:AddLine(L['frame_reportbutton_desc'],0,1,0)
	GameTooltip:Show()
end
--------------------

--------------------

function GQ_DefaultSkin_Frame_Mixin.GuideShareButton_OnClick(self,button)
	if GQ.GuideOnly then return end
	GQ.Sync:OnShareButtonClick(button)
end

function GQ_DefaultSkin_Frame_Mixin.GuideShareButton_OnEnter(self)
	if GQ.GuideOnly then return end
	GQ.Sync:OnShareButtonEnter()
end
--]]

--------------------

function GQ_DefaultSkin_Frame_Mixin.MiniButton_OnClick(self,button)
	GQ:SetOption("StepDisplay","showinlinetravel")
	GQ.GuideMenu:RefreshOptions("GoatQuest-Display")
	--if GQ.optionpanels['display']:IsVisible() then GQ:OpenOptions('display') end
	--GQ:UpdateMiniMode()

	--if button=="LeftButton" then
	--	GQ:SetOption("Display","showcountsteps "..(GQ.db.profile.showallsteps and GQ.db.profile.showcountsteps or 0))
	--else
	--	GQ:OpenQuickSteps()
	--end
	GQ_DefaultSkin_Frame_Mixin.MiniButton_OnEnter(self,button)
	GQ:UpdateFrame(true)
	GQ:ReanchorFrame()
	GQ:AlignFrame()
end

function GQ:Guides_Mini_to_Full()
	GQ:SetOption("Cover","dispmodepri")
	--if GQ.optionpanels['display']:IsVisible() then GQ:OpenOptions('display') end
	GQ:ReanchorFrame()
	GQ:AlignFrame()
end


function GQ_DefaultSkin_Frame_Mixin.MiniButton_OnEnter(self,button)
	GameTooltip:SetOwner(GQ.Frame, "ANCHOR_TOP")
	GameTooltip:SetText(L[GQ.db.profile.showinlinetravel and 'frame_showinlinetravel_on' or 'frame_showinlinetravel_off'])
	GameTooltip:AddLine(L[GQ.db.profile.showinlinetravel and 'frame_showinlinetravel_gooff' or 'frame_showinlinetravel_goon'],0,1,0)
	--GameTooltip:AddLine(L['frame_minright'],0,1,0)
	GameTooltip:Show()
end

---------------------

function GQ_DefaultSkin_Frame_Mixin.CloseButton_OnClick(self,button)
	GQ.Frame:Hide()
	GQ.db.profile.enable_viewer = false
	GQ.ActionBar:ToggleFrame()
end

function GQ_DefaultSkin_Frame_Mixin.ReportStepButton_OnClick(self,button)
	GQ.BugReport.StepFeedback:Show()
end

function GQ_DefaultSkin_Frame_Mixin.ReportStepButton_OnEnter(self)
	GQ.BugReport.StepFeedback:ShowTooltip(self)
end

---------------------
function GQ_DefaultSkin_Frame_Mixin.Scroll_OnUpdate(self,elapsed)
	if self:GetVerticalScrollRange()==0 then
		--GoatQuestFrameScroll_ScrollFill:Hide()
	else
		--GoatQuestFrameScroll_ScrollFill:Show()
		if  GQ.ForceScrollToCurrentStep then
			GQ:ScrollToCurrentStep()
		end
	end
end

function GQ_DefaultSkin_Frame_Mixin.Scroll_Slider_OnValueChanged(self,value)
	self:GetParent():SetVerticalScroll(value)
	GQ:UpdateFrame(true)
end

function GQ_DefaultSkin_Frame_Mixin.StepNum_OnMouseWheel(self,delta)
	GQ:Debug("step num wheel %d",delta)
	local count=IsShiftKeyDown() and 10 or 1
	for i=1,count do
		if delta>0 then
			GQ:PreviousStep(false,true) -- fast,forcefocus
		else
			GQ:SkipStep(false,false,true) -- fast,hack,forcefocus
		end
	end
end

function GQ_DefaultSkin_Frame_Mixin.ThinFlash_OnLoad(self)
	local backdrop = {
		bgFile="Interface/Buttons/white8x8",
		edgeFile="Interface/Store/store-item-highlight",
		edgeTile=true,
		edgeSize=32,
		insets={left=20,right=20,top=20,bottom=20}
	}
	self:OnBackdropLoaded()
	self:SetBackdrop(backdrop)
end

--------------------

GQ_ResizerMixin = {}
--
	function GQ_ResizerMixin:OnLoad(button)
		self:SetScript("OnMouseDown",self.StartSizing)
		self:SetScript("OnMouseUp",self.SizeOff)
		--self:SetScript("OnEnter",self.HighlightOn)
		--self:SetScript("OnLeave",self.HighlightOff)

		self.Highlight = CHAIN(self:CreateTexture())
			:SetAllPoints()
			:SetColorTexture(1,1,1,0.1)
			:Hide()
			.__END
	end

	function GQ_ResizerMixin:StartSizing(button)
		if GQ.db.profile.windowlocked then return false end
		local dir=self.ResizerDir
		local can_size_vertically = (GQ.db.profile.fixedheight or GQ.db.profile.showcountsteps==0)
		if not can_size_vertically then
			if dir=="BOTTOMLEFT" then dir="LEFT"
			elseif dir=="BOTTOMRIGHT" then dir="RIGHT"
			elseif dir=="BOTTOM" then return end
		end
		if GQ.db.profile.resizeup then dir=dir:gsub("BOTTOM","TOP") end
		if dir=="BOTTOMLEFT" or dir=="LEFT" then GQ.Frame.sizedleft=self:GetParent():GetLeft() end
		self:GetParent():StartSizing(dir)
	end

	function GQ_ResizerMixin:HighlightOn(button)
		if GQ.db.profile.windowlocked then return end
		--SetCursor("UI_RESIZE_CURSOR")
		self.Highlight:Show()
	end

	function GQ_ResizerMixin:HighlightOff(button)
		--SetCursor(nil)
		self.Highlight:Hide()
	end

	function GQ_ResizerMixin:SizeOff(button)
		--GoatQuestFrameMaster:StopMovingOrSizing()
		self:GetParent():StopMovingOrSizing()
		GQ:ReanchorFrame()
		GQ:AlignFrame()
	end

--

BackFlatTemplate_Mixin = {}

function BackFlatTemplate_Mixin:OnBackdropLoaded()
	if not self.Center then
		self.Center = self:CreateTexture()
		self.Center:SetDrawLayer("BACKGROUND")
		self.Center:SetAllPoints()
	end
	self.backdropColor = {1,1,1,1}
end
function BackFlatTemplate_Mixin:SetBackdrop(data)
	self.backdropInfo = data
	self.Center:SetTexture(data.bgFile)
	if data.bgFile then self.Center:Show() end
end
function BackFlatTemplate_Mixin:GetBackdrop()
	return self.backdropInfo
end
function BackFlatTemplate_Mixin:SetBackdropColor(r,g,b,a)
	self.backdropColor[1]=r
	self.backdropColor[2]=g
	self.backdropColor[3]=b
	self.backdropColor[4]=a
	self.Center:SetColorTexture(r,g,b,a)
	if a>0 then self.Center:Show() end
end
local empty={}
function BackFlatTemplate_Mixin:GetBackdropColor(r,g,b,a)
	return unpack(self.backdropColor)
end
function BackFlatTemplate_Mixin:SetColor(r,g,b,a)
	self:SetBackdropColor(r,g,b,a)
	self:Show()
end
function BackFlatTemplate_Mixin:SetBackdropBorderColor() -- no border; compatibility only
end


GQ_DefaultSkin_TitleButton_Mixin = {}
function GQ_DefaultSkin_TitleButton_Mixin:AssignTextures(set,key)
	set = set or self.buttonset
	key = key or self.buttonkey
	local but = GQ.F.dig_in(GQ.ButtonSets,set,key)
	if not but then error("TitleButton can't find proper buttonset: "..set.." . "..key) end
	but:AssignToButton(self)
	local highlight_alpha = SkinData("TitleButtonHighlightAlpha")
	if highlight_alpha then self:GetHighlightTexture():SetAlpha(highlight_alpha) end
end
function GQ_DefaultSkin_TitleButton_Mixin:SetSizeFromSkin()
	local size = SkinData("TitleButtonSize")
	self:SetSize(self.forcewidth or size,self.forceheight or size)
end
function GQ_DefaultSkin_TitleButton_Mixin:SetTextureInsetsFromSkin()
	local insetx = self.forceinsetx or SkinData("TitleButtonInset") or 0
	local insety = self.forceinsety or  SkinData("TitleButtonInset") or 0
	for _,tx in ipairs{self:GetNormalTexture(),self:GetPushedTexture(),self:GetDisabledTexture()} do
		if tx then
			GQ.ChainCall(tx)
				:ClearAllPoints()
				:SetPoint("BOTTOMLEFT",self,"BOTTOMLEFT",insetx,insety)
				:SetPoint("TOPRIGHT",self,"TOPRIGHT",-insetx,-insety)
		end
	end
	local inset = SkinData("TitleButtonInsetHighlight") or SkinData("TitleButtonInset")
	GQ.ChainCall(self:GetHighlightTexture())
		:ClearAllPoints()
		:SetPoint("BOTTOMLEFT",self,"BOTTOMLEFT",inset,inset)
		:SetPoint("TOPRIGHT",self,"TOPRIGHT",-inset,-inset)
end
function GQ_DefaultSkin_TitleButton_Mixin:ApplySkin()
	self.buttonset = self.buttonset or "TitleButtons"
	self:AssignTextures()
	self:SetSizeFromSkin()
	self:SetTextureInsetsFromSkin()
end
function GQ_DefaultSkin_TitleButton_Mixin:SetButtonColor(r,g,b,a)
	for _,tx in ipairs{self:GetNormalTexture(),self:GetPushedTexture(),self:GetDisabledTexture()} do
		tx:SetVertexColor(r,g,b,a)
	end
end


GQ_DefaultSkin_MenuButton_Mixin = {}
function GQ_DefaultSkin_MenuButton_Mixin:AssignTexture(set,key)
	set = set or self.textureset
	key = key or self.texturekey
	local but = GQ.F.dig_in(GQ.ButtonSets,set,key)
	if not but then error("MenuButton can't find proper textureset: "..set.." . "..key) end
	but:AssignToTexture(self.Icon)
end
function GQ_DefaultSkin_MenuButton_Mixin:SetLabelFont()
	self.Text:SetFont(GQ.Font,12)
	--if self.Check then 
	--	CHAIN(self.Check)
	--		:SetBackdrop(SkinData("NewToggle"))
	--		:SetBackdropColor(unpack(SkinData("NewToggleBackdropColor")))
	--		:SetBackdropBorderColor(unpack(SkinData("NewToggleBorderColor")))
	--		:Show()
	--end
end
function GQ_DefaultSkin_MenuButton_Mixin:ApplySkin()
	self:AssignTexture()
	self:SetLabelFont()
	self.hilitex = self.hilitex or CHAIN(self:CreateTexture())
		:SetPoint("TOPLEFT",0,-1)
		:SetPoint("BOTTOMRIGHT",0,1)
	.__END
	self.hilitex:SetColorTexture(unpack(SkinData("ButtonHighlight")))
	self:SetHighlightTexture(self.hilitex)
end

--[=[
-------------------------
local Rdown,Tdown
function GoatQuestFrame_OnKeyDown(self,value)
	local propagate=true
--[[	GQ:Print("down "..value)
	if value=="LCTRL" then
		propagate=false
	elseif value=="R" then
		propagate=false
		Rdown=true
	elseif value=="T" then
		propagate=false
		Tdown=true
	end
	if Rdown and Tdown then print("R + T") end
--]]
	self:SetPropagateKeyboardInput(propagate)
end

function GoatQuestFrame_OnKeyUp(self,value)
	--[[
	GQ:Print("up "..value)
	if (value=="R") then Rdown=false end
	if (value=="T") then Tdown=false end
	--]]
end
--]=]

GQ_DefaultSkin_GuideStar_Mixin = {}
function GQ_DefaultSkin_GuideStar_Mixin:OnClick(mousebutton)

local active={}
	active[3] = GQ.ButtonSets.RatingButtons_active.HAPPY
	active[2] = GQ.ButtonSets.RatingButtons_active.INDIFFERENT
	active[1] = GQ.ButtonSets.RatingButtons_active.UNHAPPY

	if GQ.BugReport.GuideRating.score == nil or GQ.BugReport.GuideRating.score ~= self.ButtonNumber then
		GQ.BugReport.GuideRating.score = self.ButtonNumber
		GQ.ButtonSets.RatingButtons.HAPPY:AssignToButton(GQ.BugReport.GuideRating.GuideRatingViewer.face1)
		GQ.ButtonSets.RatingButtons.INDIFFERENT:AssignToButton(GQ.BugReport.GuideRating.GuideRatingViewer.face2)
		GQ.ButtonSets.RatingButtons.UNHAPPY:AssignToButton(GQ.BugReport.GuideRating.GuideRatingViewer.face3)

		GQ.BugReport.GuideRating.GuideRatingViewer.face1:SetAlpha(0.3)
		GQ.BugReport.GuideRating.GuideRatingViewer.face2:SetAlpha(0.3)
		GQ.BugReport.GuideRating.GuideRatingViewer.face3:SetAlpha(0.3)

		active[self.ButtonNumber]:AssignToButton(self)
		GQ.db.char.ratingscorecache[GQ.CurrentGuide.title] = self.ButtonNumber
		self:SetAlpha(0.5)

		GQ.BugReport.GuideRating.GuideRatingViewer.scroll.child:SetText("|cff888888"..L['viewer_special_rateexp'])

	else
		GQ.db.char.ratingscorecache[GQ.CurrentGuide.title] = nil
		GQ.BugReport.GuideRating.score = nil
	
		GQ.BugReport.GuideRating.GuideRatingViewer.scroll.child:SetText("")
	end
end

function GQ_DefaultSkin_GuideStar_Mixin:OnEnter()
	GQ.BugReport.GuideRating.GuideRatingViewer.face1:SetAlpha(0.3)
	GQ.BugReport.GuideRating.GuideRatingViewer.face2:SetAlpha(0.3)
	GQ.BugReport.GuideRating.GuideRatingViewer.face3:SetAlpha(0.3)
	if GQ.BugReport.GuideRating.score == self.ButtonNumber then
		self:SetAlpha(0.6)
	else
		self:SetAlpha(0.4)
	end
	
	if self.ButtonNumber == 3 then
	GQ.RatingTimer = GQ:ScheduleTimer(function()
		CHAIN(GameTooltip):SetOwner(GQ.BugReport.GuideRating.GuideRatingViewer.face1,"ANCHOR_TOP") :SetText(L['viewer_special_amazing']) :Show()
		end, 0.1)
	elseif self.ButtonNumber == 2 then
		GQ.RatingTimer = GQ:ScheduleTimer(function()
		CHAIN(GameTooltip):SetOwner(GQ.BugReport.GuideRating.GuideRatingViewer.face2,"ANCHOR_TOP") :SetText(L['viewer_special_average']) :Show()
		end, 0.1)
	elseif self.ButtonNumber == 1 then
		GQ.RatingTimer = GQ:ScheduleTimer(function()
		CHAIN(GameTooltip):SetOwner(GQ.BugReport.GuideRating.GuideRatingViewer.face3,"ANCHOR_TOP") :SetText(L['viewer_special_bad']) :Show()
		end, 0.1)
	end
end

function GQ_DefaultSkin_GuideStar_Mixin:OnLeave()
	GameTooltip:Hide()
	if GQ.RatingTimer then GQ:CancelTimer(GQ.RatingTimer) end
end

GoatQuestSpecialButton_Mixin = {}
function GoatQuestSpecialButton_Mixin:SetTextureInsetsFromSkin()
	local insetx = self.forceinsetx or SkinData("TitleButtonInset") or 0
	local insety = self.forceinsety or  SkinData("TitleButtonInset") or 0
	for _,tx in ipairs{self:GetNormalTexture(),self:GetPushedTexture(),self:GetDisabledTexture(),self:GetHighlightTexture()} do
		if tx then
			GQ.ChainCall(tx)
				:ClearAllPoints()
				:SetPoint("BOTTOMLEFT",self,"BOTTOMLEFT",insetx,insety)
				:SetPoint("TOPRIGHT",self,"TOPRIGHT",-insetx,-insety)
		end
	end
end
-- inherits GQ_DefaultSkin_TitleButton. Override functions in proper objects
function GoatQuestSpecialButton_Mixin:OnEnter() end
function GoatQuestSpecialButton_Mixin:OnLeave() end
function GoatQuestSpecialButton_Mixin:OnClick() end