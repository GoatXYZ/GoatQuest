local name,GQ = ...

local Modules = {}
GQ.Modules = Modules

IntroWizard = {}
Modules.IntroWizard = IntroWizard

local L = GQ.L
local CHAIN = GQ.ChainCall

local MAIN_WIDTH = 410
local LINE_WIDTH = 370
local SECT_Y = -30
local SUBSECT_Y = -5
local CHECKBOX_X = -20
local CHECKBOX_Y = 1
--local COLOR_PENDING = {1,1,1}
local COLOR_PENDING = {203/255,83/255,0}
--local COLOR_COMPLETED = {0.5,0.7,0.5}
local COLOR_COMPLETED = {26/255,199/255,48/255}
local COLOR_OVERRIDDEN = {0.5,0.5,0.5}
local COLOR_HEADER = {0.9,0.6,0.1}
--local COLOR_TITLE = {1,0.9,0.1}
local TRENDS_OLD = 4 * 24 --same as ServerTrends const

local TOOLTIP_DATA = {
	help = { text = L['checklist_tooltip_help'], chkbox = "trends_help", condition = true },
	auctioneer = { text = L['checklist_tooltip_auctioneer'], chkbox = "auction_fnd", condition = true },
	banker = { text = L['checklist_tooltip_banker'], chkbox = "bank_fnd", condition = true },
	taxi = { text = L['checklist_tooltip_taxi'], chkbox = "taxi_fnd", condition = true },
	reload = { text = "Click here to reload", chkbox="trends_step2", condition = true },
}

function IntroWizard:GenerateOverrides()
	for i = 1, 5 do
		local condition
		if i == 1 then
			--if trends is not overridden and not completed, AND AH is not overridden
			condition = not GQ.db.char.checks[1].override and not GQ.db.char.checks[1].value 
						and not GQ.db.char.checks[2].override
		elseif i == 2 then
			--if AH is not overridden and not completed, AND trends is not overridden  
			condition = not GQ.db.char.checks[2].override and not GQ.db.char.checks[2].value 
						and not GQ.db.char.checks[1].override
		else	--all other checks are independent and do not need micromanagement
			condition = not GQ.db.char.checks[i].override and not GQ.db.char.checks[i].value
		end
		
		TOOLTIP_DATA["override" .. i] = {
			text = L['checklist_tooltip_override' .. (i > 2 and "2" or i > 4 and "3" or "")],
			chkbox = ({ "trends_checkbox", "auction_checkbox", "bank_checkbox", "prof_checkbox", "taxi_checkbox" })[i],
			condition = condition
		}
	end
end

function IntroWizard:ShowTooltip(type)
	IntroWizard:GenerateOverrides()
	local tooltips = TOOLTIP_DATA[type]

	local chkbox = IntroWizard.ChecklistPopup.buttons
	for i, element in ipairs({strsplit(".", tooltips.chkbox)}) do
		chkbox = chkbox[element]
	end

	if chkbox and chkbox:IsVisible() and tooltips.condition then
		if chkbox.checkbox == 5 then return end		--No override for taxi.
		GameTooltip:SetOwner(chkbox, "ANCHOR_TOPLEFT")
		GameTooltip:SetText(tooltips.text)
		GameTooltip:Show()
	end
end

function IntroWizard:RefreshChecklist()
	IntroWizard.ChecklistTimer = GQ:ScheduleRepeatingTimer(function()
		IntroWizard:CheckObjectives()
	end,2)
end

function IntroWizard:CreateCheckline(id, elem)
	local section = GQ.ChainCall(IntroWizard.ChecklistPopup:CreateFontString())
		:SetFont(elem.font, elem.size, "")
		:SetJustifyH(elem.justify)
		:SetText(elem.title)
		:SetWordWrap(true)
	.__END

	if elem.width then section:SetWidth(elem.width) end

	section.anchor_id = elem.anchor_id
	section.style = elem.style
	section.line = elem.line

	return section
end

function IntroWizard:CreateCheckButton(id,btn)
	local button = GQ.ChainCall(CreateFrame("Button",nil,IntroWizard.ChecklistPopup))
		:SetSize(15, 15)
		:SetScript("OnEnter", function() IntroWizard:ShowTooltip(btn.tooltip) end)
		:SetScript("OnLeave", function() GameTooltip:Hide() end)
	.__END

	button.anchor_id = btn.anchor_id
	button.checkbox = btn.checkbox
	if btn.custom_y then button.custom_y = btn.custom_y end

	if btn.ww then button:SetScript("OnClick", function() GQ.WhoWhere:FindNPC_Smart(btn.ww) end) end

	return button
end

function IntroWizard:Checklist()
	if not IntroWizard.ChecklistPopup then
		if not GQ.db.char.checks then
			GQ.db.char.checks = {}
			for i = 1, 5 do
				GQ.db.char.checks[i] = { value = false, override = false }
			end
		end
		local dialog = GQ.PopupHandler:NewPopup("Checklist","default")
		dialog:SetText("","")
		dialog.noMinimizeToNC = true
		dialog.declinebutton:Hide()
		dialog.acceptbutton:Hide()
		dialog.logo:Show()
		dialog.settings:Hide()
		dialog.minimize:SetScript("OnClick",function() dialog:Hide() GQ.CancelTimer(IntroWizard.ChecklistTimer) end)
		dialog:SetScript("OnDragStop", function(self)
			self:StopMovingOrSizing()
			GQ.F.SaveFrameAnchor(self,"checklist_anchor")
		end)
		
		IntroWizard.ChecklistPopup = dialog
		local crossh = GQ.IconSets.AuctionToolsPriceIcons.CROSSH:GetFontString(13,13,nil,nil,255,255,255)

		dialog.elements = {
			title = {line=true,font=GQ.FontBold, size=18, title=L['checklist_title'], justify="CENTER", anchor_id="dialog",custom_anchor="TOPLEFT"},
			trends = {line=true,font=GQ.FontBold, size=14, title=L['checklist_trends'], justify="LEFT", anchor_id="title"},
			trends_step1 = {line=true,font=GQ.Font, size=14, title=L['checklist_trends_step1'], justify="LEFT", width=LINE_WIDTH, style="sub", anchor_id="trends"},
			trends_step2FS = {line=true,font=GQ.Font, size=14, title=L['checklist_trends_step2FS'], justify="LEFT", width=LINE_WIDTH, style="icon", anchor_id="trends_step2"},
			auction = {line=true,font=GQ.FontBold, size = 14, title = L['checklist_auction'], justify = "CENTER", anchor_id="trends_step2"},
			auction_step1FS = {line=true,font=GQ.Font, size = 14, title = L['checklist_auction_step1'], justify = "LEFT", width=170, style = "sub", anchor_id = "auction"},
			auction_step2 = {line=true,font=GQ.Font, size = 14, title = L['checklist_auction_step2'], justify = "CENTER", style = "sub", anchor_id = "auction_step1FS"},
			bank = {line=true,font=GQ.FontBold, size = 14, title = L['checklist_bank'], justify = "CENTER", style = "main", anchor_id = "auction_step2"},
			bank_step1FS = {line=true,font=GQ.Font, size = 14, title = L['checklist_bank_step1'], justify = "LEFT", width=127, style = "sub", anchor_id = "bank"},
			prof = {line=true,font=GQ.FontBold, size = 14, title = L['checklist_prof'], justify = "CENTER", style = "main", anchor_id = "bank_step1FS"},
			prof_step1 = {line=true,font=GQ.Font, size = 14, title = L['checklist_prof_step1'], justify = "CENTER", style = "sub", anchor_id = "prof"},
			taxi = {line=true,font=GQ.FontBold, size = 14, title = L['checklist_taxi'], justify = "CENTER", style = "main", anchor_id = "prof"},
			taxi_step1FS = {line=true,font=GQ.Font, size = 14, title = L['checklist_taxi_step1'], justify = "LEFT", width=230, style = "sub", anchor_id = "taxi"},
			allset = {line=true,font=GQ.FontBold, size=18, title=L['checklist_allset'], justify="CENTER", anchor_id="dialog"},
		}
		
		for i, elem in pairs(dialog.elements) do
			local section = IntroWizard:CreateCheckline(i, elem)
			dialog.elements[i] = section
		end

		dialog.buttons = {
			trends_step2 = {anchor_id = "trends_step1",tooltip="reload",custom_y=-35},
			trends_help = {anchor_id = "trends",tooltip="help"},
			auction_step1 = {anchor_id = "auction",tooltip="auctioneer",ww="Auctioneer",custom_y=-15},
			auction_fnd = {anchor_id = "auction_step1FS",tooltip="auctioneer",ww="Auctioneer"},
			bank_fnd = {anchor_id = "bank_step1FS",tooltip="banker",ww="Banker"},
			bank_step1 = {anchor_id = "bank",tooltip="banker",ww="Banker",custom_y=-15},
			taxi_fnd = {anchor_id = "taxi_step1FS",tooltip="taxi",ww="Flightmaster"},	
			taxi_step1 = {anchor_id = "taxi",tooltip="taxi",ww="Flightmaster",custom_y=-15},

			trends_checkbox = {anchor_id = "trends",tooltip="override1",checkbox=2},
			auction_checkbox = {anchor_id = "auction",tooltip="override2",checkbox=2},
			bank_checkbox = {anchor_id = "bank",tooltip="override3",checkbox=3},
			prof_checkbox = {anchor_id = "prof",tooltip="override4",checkbox=4},
			taxi_checkbox = {anchor_id = "taxi",tooltip="override5",checkbox=5}
		}

		for i, btn in pairs(dialog.buttons) do
			local button = IntroWizard:CreateCheckButton(i, btn)
			dialog.buttons[i] = button
		end

		local function SetupCrosshairButton(button)
			button:SetSize(15, 15)

			local tex = button:CreateTexture(nil, "ARTWORK")
			tex:SetAllPoints()
			GQ.IconSets.AuctionToolsPriceIcons.CROSSH:AssignToTexture(tex)

			button.icon = tex
		end

		if GQ.IsClassic then SetupCrosshairButton(dialog.buttons.taxi_fnd) end
		SetupCrosshairButton(dialog.buttons.auction_fnd)
		SetupCrosshairButton(dialog.buttons.bank_fnd)

	--elements anchors
		dialog.elements.title:SetPoint("TOPLEFT",dialog,10,-15)
		dialog.elements.title:SetPoint("RIGHT",dialog) 
		dialog.elements.trends:SetPoint("TOPLEFT",dialog.elements.title,"BOTTOMLEFT",25,-30)
		dialog.elements.auction:SetPoint("TOPLEFT",dialog.buttons.trends_step2,"BOTTOMLEFT",0,-15)

		dialog.elements.allset:SetPoint("BOTTOMLEFT",dialog,5,15)
		dialog.elements.allset:SetPoint("BOTTOMRIGHT",dialog,-5,15)

	--size and others
		dialog.elements.allset:SetHeight(45)
		GQ.ButtonSets.TitleButtons.QUESTION:AssignToButton(dialog.buttons.trends_help)

		if not GQ.IsClassic then
			dialog.elements.taxi:Hide()
			dialog.buttons.taxi_step1:Hide()
			dialog.elements.taxi_step1FS:Hide()
		end

		dialog.buttons.trends_step2:SetSize(MAIN_WIDTH, 25)
		dialog.buttons.trends_step2:SetScript("OnClick", function() ReloadUI() end)

		dialog.buttons.auction_step1:SetSize(160, 25)
		dialog.buttons.bank_step1:SetSize(127, 25)
		dialog.buttons.taxi_step1:SetSize(140, 25)

		for i, section in pairs(dialog.elements) do
			if section.anchor_id and section.style then
				local anchor = dialog.elements[section.anchor_id]
				local anchor_btn = dialog.buttons[section.anchor_id]
				if section.anchor_id == "dialog" then anchor = dialog end
				if anchor or anchor_btn then
					if section.style == "sub" then
						section:SetPoint("TOPLEFT", anchor or anchor_btn, "BOTTOMLEFT", 0, SUBSECT_Y)
					elseif section.style == "main" then
						section:SetPoint("TOPLEFT", anchor or anchor_btn, "BOTTOMLEFT", 0, SECT_Y)
					elseif section.style == "icon" then
						section:SetPoint("TOPLEFT",anchor_btn)
					else
						
					end
				end
			end
		end

		for i, button in pairs(dialog.buttons) do
			local anchor = dialog.elements[button.anchor_id]
			if button.checkbox then
				button:SetPoint("TOPLEFT",anchor,CHECKBOX_X,CHECKBOX_Y)
				button:SetScript("OnClick", function() IntroWizard:ToggleCheck(button.checkbox) end)
			elseif button.custom_y then
				button:SetPoint("TOPLEFT",anchor,0,button.custom_y)
			--elseif button.style == "sub" then
				--button:SetPoint("TOPLEFT", anchor, "BOTTOMLEFT", 0, SUBSECT_Y)
			else
				button:SetPoint("TOPLEFT",anchor,"TOPRIGHT",5,2)
			end
		end
		
		dialog.AdjustSize = function(self)
			IntroWizard.ChecklistPopup:Show()
			IntroWizard:CheckObjectives()
			self:SetSize(MAIN_WIDTH,IntroWizard:ChecklistHeight())
		end
	end

	if GQ.db.profile.checklist_anchor then
		GQ.F.SetFrameAnchor(IntroWizard.ChecklistPopup,GQ.db.profile.checklist_anchor)
	else
		IntroWizard.ChecklistPopup:ClearAllPoints()
		IntroWizard.ChecklistPopup:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 10, -10)
	end

	IntroWizard.ChecklistPopup:Show()
	IntroWizard:RefreshChecklist()
	IntroWizard:CheckObjectives()
end

function IntroWizard:ToggleCheck(check)
	GQ.db.char.checks[check].override = not GQ.db.char.checks[check].override
	IntroWizard:CheckObjectives()
end

function IntroWizard:CheckObjectives()
	if not IntroWizard.ChecklistPopup or not IntroWizard.ChecklistPopup:IsVisible() then return end
	local dialog = IntroWizard.ChecklistPopup
	local checks = GQ.db.char.checks
	local trends = GQ.Gold.servertrends

	if trends then
		local last_trends = floor(time() - (trends.date or 0))/3600

		if last_trends < TRENDS_OLD or IntroWizard:CheckAllObjectives() then 
			checks[1].value = true
		else
			checks[1].value = false
		end
	end

	if GQ.Gold:LastScan(15) then
		checks[2].value = true
	elseif not IntroWizard:CheckAllObjectives() then
		checks[2].value = false
	end

	if GQ.Inventory:CharacterBankKnown() then checks[3].value = true end

	for i, prof in pairs(GQ.Professions.tradeskills) do
		local needsscanning = prof.crafting and GQ.Professions:HasProfessionUnscanned(prof.name) and not prof.nonclickable

		if not GQ.db.char.unscanned then GQ.db.char.unscanned = {} end
		local unscanned = GQ.db.char.unscanned

		if needsscanning then
			local dupe = false
			for j, entry in ipairs(unscanned) do
				if entry.name == prof.name then
					dupe = true
					break
				end
			end

			if not dupe then
				local object = GQ.Professions:GetSkillDataByName(prof.name)
				local name = GQ.Professions.LocaleSkills[prof.name]
				local icon
				if GQ.IsClassic then
					icon = object.icon
				else
					icon = C_TradeSkillUI.GetTradeSkillTexture(object.skill)
				end
				table.insert(unscanned, {name = name, icon = icon})
				checks[4].value = false
			end
		else
			if GQ:MatchProfs(prof.name,1) then
				for j, entry in ipairs(unscanned) do
					if entry.name == prof.name then
						table.remove(unscanned, j)
						break
					end
				end
			end
		end
	end

	if GQ.db.char.unscanned[1] == nil then checks[4].value = true end

	if GQ.IsClassic then
		if LibTaxi:IsContinentKnown() then checks[5].value = true end
	end
	
	IntroWizard:ChecklistLayout()
end

function IntroWizard:ChecklistLayout()
	local checks = GQ.db.char.checks
	local dialog = IntroWizard.ChecklistPopup
	if checks[1].value or checks[2].override then
		GQ.ButtonSets.Interactions.CHECKBOX_ON:AssignToButton(dialog.buttons.trends_checkbox)
		dialog.elements.trends_step1:Hide()
		dialog.buttons.trends_step2:Hide()
		dialog.elements.trends_step2FS:Hide()
		dialog.elements.auction:SetPoint("TOPLEFT",dialog.elements.trends,"BOTTOMLEFT",0,-30)

		if checks[1].value then dialog.elements.trends:SetTextColor(unpack(COLOR_COMPLETED)) else dialog.elements.trends:SetTextColor(unpack(COLOR_OVERRIDDEN)) end
	else
		GQ.ButtonSets.Interactions.CHECKBOX:AssignToButton(dialog.buttons.trends_checkbox)
		dialog.elements.trends_step1:Show()
		dialog.buttons.trends_step2:Show()
		dialog.elements.trends_step2FS:Show()
		dialog.elements.auction:SetPoint("TOPLEFT",dialog.elements.trends_step2FS,"BOTTOMLEFT",0,-30)
		dialog.elements.allset:Hide()
		dialog.elements.trends:SetTextColor(unpack(COLOR_PENDING))
	end

	if checks[2].value or checks[2].override then
		GQ.ButtonSets.Interactions.CHECKBOX_ON:AssignToButton(dialog.buttons.auction_checkbox)
		dialog.buttons.auction_step1:Hide()
		dialog.elements.auction_step1FS:Hide()
		dialog.buttons.auction_fnd:Hide()
		dialog.elements.auction_step2:Hide()
		dialog.elements.bank:SetPoint("TOPLEFT",dialog.elements.auction,"BOTTOMLEFT",0,-30)
		if checks[2].value then dialog.elements.auction:SetTextColor(unpack(COLOR_COMPLETED)) else dialog.elements.auction:SetTextColor(unpack(COLOR_OVERRIDDEN)) end
	else
		GQ.ButtonSets.Interactions.CHECKBOX:AssignToButton(dialog.buttons.auction_checkbox)
		dialog.buttons.auction_step1:Show()
		dialog.elements.auction_step1FS:Show()
		dialog.buttons.auction_fnd:Show()
		dialog.elements.auction_step2:Show()
		dialog.elements.bank:SetPoint("TOPLEFT",dialog.elements.auction_step2,"BOTTOMLEFT",0,-30)
		dialog.elements.allset:Hide()
		dialog.elements.auction:SetTextColor(unpack(COLOR_PENDING))
	end

	if checks[3].value or checks[3].override then
		GQ.ButtonSets.Interactions.CHECKBOX_ON:AssignToButton(dialog.buttons.bank_checkbox)
		dialog.buttons.bank_step1:Hide()
		dialog.elements.bank_step1FS:Hide()
		dialog.buttons.bank_fnd:Hide()
		dialog.elements.prof:SetPoint("TOPLEFT",dialog.elements.bank,"BOTTOMLEFT",0,-30)
		if checks[3].value then dialog.elements.bank:SetTextColor(unpack(COLOR_COMPLETED)) else dialog.elements.bank:SetTextColor(unpack(COLOR_OVERRIDDEN)) end
	else
		GQ.ButtonSets.Interactions.CHECKBOX:AssignToButton(dialog.buttons.bank_checkbox)
		dialog.buttons.bank_step1:Show()
		dialog.elements.bank_step1FS:Show()
		dialog.buttons.bank_fnd:Show()
		dialog.elements.prof:SetPoint("TOPLEFT",dialog.elements.bank_step1FS,"BOTTOMLEFT",0,-30)
		dialog.elements.allset:Hide()
		dialog.elements.bank:SetTextColor(unpack(COLOR_PENDING))
	end

	if checks[4].value or checks[4].override then
		GQ.ButtonSets.Interactions.CHECKBOX_ON:AssignToButton(dialog.buttons.prof_checkbox)
		dialog.elements.prof_step1:Hide()
		if checks[4].value then dialog.elements.prof:SetTextColor(unpack(COLOR_COMPLETED)) else dialog.elements.prof:SetTextColor(unpack(COLOR_OVERRIDDEN)) end
		IntroWizard:HideProfButtons()
		if GQ.IsClassic then dialog.elements.taxi:SetPoint("TOPLEFT",dialog.elements.prof,"BOTTOMLEFT",0,-30) end
	else
		GQ.ButtonSets.Interactions.CHECKBOX:AssignToButton(dialog.buttons.prof_checkbox)
		dialog.elements.prof_step1:Show()
		dialog.elements.prof:SetTextColor(unpack(COLOR_PENDING))
		IntroWizard:CreateProfButtons()
		local btncount = IntroWizard:CalculateButtons()
		if GQ.IsClassic then dialog.elements.taxi:SetPoint("TOPLEFT",dialog.elements.prof_step1,"BOTTOMLEFT",0,- (22 * btncount + 30)) end
		dialog.elements.allset:Hide()
	end

	if GQ.IsClassic then
		if checks[5].value or checks[5].override then
			GQ.ButtonSets.Interactions.CHECKBOX_ON:AssignToButton(dialog.buttons.taxi_checkbox)
			dialog.elements.taxi_step1FS:Hide()
			dialog.buttons.taxi_fnd:Hide()
			if checks[5].value then dialog.elements.taxi:SetTextColor(unpack(COLOR_COMPLETED)) else dialog.elements.taxi:SetTextColor(unpack(COLOR_OVERRIDDEN)) end
		else
			GQ.ButtonSets.Interactions.CHECKBOX:AssignToButton(dialog.buttons.taxi_checkbox)
			dialog.elements.taxi_step1FS:Show()
			dialog.buttons.taxi_fnd:Show()
			dialog.elements.taxi:SetTextColor(unpack(COLOR_PENDING))
			dialog.elements.allset:Hide()
		end
	end

	if IntroWizard:CheckAllObjectives() then dialog.elements.allset:Show() end

	IntroWizard.ChecklistPopup:SetHeight(IntroWizard:ChecklistHeight())
	IntroWizard:ReanchorButtons()

end

function IntroWizard:ChecklistHeight()
	local spacing
	if GQ.IsClassic then spacing = 75 else spacing = 50 end
	local height = 45 + 47 + spacing --Logo and top + settings and bottom + spacing difference between the main checks and other lines
	local width = 0
	for i, object in pairs(IntroWizard.ChecklistPopup.elements) do
		if object:IsVisible() and object.line then		--don't calculate the height of the collapsed bullet points
			height = height + object:GetHeight() + 5	--spacing between the main checks (trends, bank, AH, professions, taxi)
		end
	end

	if IntroWizard.btnArray then
		for i, object in ipairs (IntroWizard.btnArray) do
			if object:IsVisible() then height = height + 22 end
		end
	end

	return height
end

--SecureActionButtons cannot be anchored to anything other than UIParent, or an element anchored to UParent directly.
--Need an ugly hack
function IntroWizard:ReanchorButtons()
	local dialog = IntroWizard.ChecklistPopup
	local offset = 0
	if dialog.elements.taxi:IsVisible() then offset = 36 end
	if dialog.elements.taxi_step1FS:IsVisible() then offset = 55 end
	if IntroWizard.btnArray then
		for i, btn in ipairs (IntroWizard.btnArray) do
			btn:SetPoint("BOTTOMLEFT", dialog, 45, offset + 22 * i)
		end
	end
end

function IntroWizard:CalculateButtons()
	local count = 0
	for i, btn in ipairs (IntroWizard.btnArray) do
		if btn:IsVisible() then count = count + 1 end
	end

	return count
end

function IntroWizard:HideProfButtons()
	if not IntroWizard.btnArray then return end
	for i,btn in ipairs(IntroWizard.btnArray) do
		btn:Hide()
		IntroWizard.btnTxtArray[i]:Hide()
	end
end

function IntroWizard:CreateProfButtons()
	if not GQ.db.char.unscanned or GQ.db.char.checks[4].override then return end
	if not IntroWizard.btnArray then IntroWizard.btnArray = {} IntroWizard.btnTxtArray = {} else IntroWizard:HideProfButtons() end
	local dialog = IntroWizard.ChecklistPopup
	
	for i, prof in ipairs(GQ.db.char.unscanned) do
		if IntroWizard.btnArray[i] and IntroWizard.btnArray[i].btn then
			btntxt:SetText(prof.name)
			btn:SetTexture(prof.icon)
			btn:SetScript("OnClick", function() C_TradeSkillUI.OpenTradeSkill(GQ.Professions:GetSkillDataByName(prof.name).parent) end)
			btn:Show()
			btntxt:Show()
		else
			local macro_text = "/cast "..GQ.Professions:GetSkillDataByName(prof.name).name
			local btn = GQ.ChainCall(CreateFrame("Button", "UnscannedProfButton"..i, dialog, "SecureActionButtonTemplate"))
				:SetNormalTexture(prof.icon)
				:RegisterForClicks("LeftButtonUp")
				:SetSize(20,20)
				:EnableMouse(true)
				:SetText("")
				:SetAttribute("type", "macro")
				:SetAttribute("macrotext", macro_text)
				:SetScript("OnLeave", function()
					GameTooltip:Hide()
					end
				)
			.__END
			
			local btntxt = GQ.ChainCall(CreateFrame("Button", "UnscannedProfText"..i, dialog))
				:SetSize(150, 25)
				:SetPoint("LEFT",btn,"RIGHT",10,0)
				:GetParent()
				:SetScript("OnEnter", function()
					GameTooltip:SetOwner(IntroWizard.btnArray[i], "ANCHOR_TOPLEFT", 2, 2)
					GameTooltip:SetText("Click to open " .. prof.name .. " profession window.")
					GameTooltip:Show()
				end)
				:SetScript("OnLeave", function()
					GameTooltip:Hide()
				end)
			.__END

			local btntxtFS = GQ.ChainCall(btntxt:CreateFontString(nil, "OVERLAY"))
			    :SetFont(GQ.Font,11)
			    :SetTextColor(1,1,1)
			    :SetJustifyH("LEFT")
			    :SetAllPoints(btntxt)
			    :SetText(prof.name)
			.__END

			if not GQ.IsClassic and not GQ.IsClassicMOP then
				btntxt:SetScript("OnClick", function()
					C_TradeSkillUI.OpenTradeSkill(GQ.Professions:GetSkillDataByName(prof.name).parent)	
				end)
			else
				btntxt:SetAttribute("type", "macro")
				btntxt:SetAttribute("macrotext", macro_text)
			end
			
			IntroWizard.btnArray[i] = btn
			IntroWizard.btnTxtArray[i] = btntxt
			
			btn:SetScript("OnEnter", function()
				GameTooltip:SetOwner(IntroWizard.btnArray[i], "ANCHOR_TOPLEFT", 2, 2)
				GameTooltip:SetText("Click to open " .. prof.name .. " profession window.")
				GameTooltip:Show()
			end)
			
			if not GQ.IsClassic and not GQ.IsClassicMOP then
				btn:SetScript("OnClick", function()
					C_TradeSkillUI.OpenTradeSkill(GQ.Professions:GetSkillDataByName(prof.name).parent)	
				end)
			end
			
			btn:Show()
			btntxt:Show()
		end
	end
	IntroWizard:ChecklistHeight()
end

function IntroWizard:CheckAllObjectives()
	if not GQ.db.char.checks then return end
	if GQ.IsClassic and not GQ.db.char.checks[5].value and not GQ.db.char.checks[5].override then
		return false
	else
		for i = 2, 4 do
			local check = GQ.db.char.checks[i]
			if not (check.value or check.override) then
				return false
			end
		end
		return true
	end
end



GQ.Modules.Housing = {}
local Housing = GQ.Modules.Housing

function Housing:UpdateFavour(event,favour)
	if not Housing.House then return end -- we don't know your address yet
	if favour.houseGUID~=Housing.House.houseGUID then return end -- not your place
	Housing.Level = favour.houseLevel
	Housing.Exp = favour.houseFavor
	Housing.ExpNeeded = C_Housing.GetHouseLevelFavorForLevel(favour.houseLevel+1)
end

function Housing:UpdateHouses(event,houses)
	for _,house in ipairs(houses) do
		if C_Housing.DoesFactionMatchNeighborhood(house.neighborhoodGUID) then
			Housing.House = house
			C_Housing.GetCurrentHouseLevelFavor(house.houseGUID)
		end
	end
end

function Housing:UpdateLocations()
	local locations = C_HousingNeighborhood.GetNeighborhoodMapData()
	local playerName = UnitName("player")
	for i,v in pairs(locations) do
		if v.ownerType == Enum.HousingPlotOwnerType.Self and v.ownerName==playerName then
			Housing.Location = {C_Map.GetBestMapForUnit("player"),v.mapPosition.x,v.mapPosition.y}
			break
		end
	end
	GQ.db.char.playerhouse = Housing.Location
end

function Housing:UpdateInitiative()
	local data = C_NeighborhoodInitiative.GetNeighborhoodInitiativeInfo()
	Housing.Initiative = data and data.initiativeID
end


function Housing:Startup()
	if not GQ.IsRetail then return end

	GQ:AddEventHandler("HOUSE_LEVEL_FAVOR_UPDATED",Housing.UpdateFavour)
	GQ:AddEventHandler("PLAYER_HOUSE_LIST_UPDATED",Housing.UpdateHouses)
	GQ:AddEventHandler("NEIGHBORHOOD_MAP_DATA_UPDATED",Housing.UpdateLocations)
	GQ:AddEventHandler("NEIGHBORHOOD_INITIATIVE_UPDATED",Housing.UpdateInitiative)
	GQ:AddEventHandler("INITIATIVE_TASKS_TRACKED_LIST_CHANGED",Housing.UpdateInitiative)

	Housing.Location = GQ.db.char.playerhouse

	C_Housing.GetPlayerOwnedHouses()
	C_NeighborhoodInitiative.RequestNeighborhoodInitiativeInfo()
	Housing:UpdateLocations()
end

tinsert(GQ.startups,{"PlayerHousing setup",function(self)
	if not GQ.IsRetail then return end
	Housing:Startup()
end})


GQ.Modules.GossipHandler = {}
local GossipHandler = GQ.Modules.GossipHandler
GossipHandler.Gossips = {}

function GossipHandler.Events(self,event)
	if event=="GOSSIP_SHOW" then
		local gossips = {}
		if C_GossipInfo.GetOptions then
			gossips = C_GossipInfo.GetOptions()
		elseif GetGossipOptions then
			local temp = {GetGossipOptions()}
			for i=1, #temp, 2 do
				table.insert(gossips,{name=temp[i],type="gossip"})
			end
		end
		
		if #gossips==0 then return end

		GossipHandler.Gossips = gossips
	end
end

function GossipHandler.Announce(gossipIndex)
	if gossipIndex then
		for i,v in pairs(GossipHandler.Gossips) do
			if v.orderIndex == gossipIndex then
				GQ:SendMessage("GQ_GOSSIP_PICKED",v.gossipOptionID)
			end
		end
	end
end

tinsert(GQ.startups,{"PlayerHousing setup",function(self)
	GQ:AddEventHandler("GOSSIP_SHOW",GossipHandler.Events)
	hooksecurefunc(C_GossipInfo, "SelectOptionByIndex",GossipHandler.Announce)
end})
