-- Interaction with merchants, handling items in bags

local tinsert,tremove,print,ipairs,pairs,wipe=tinsert,tremove,print,ipairs,pairs,wipe
local CHAIN = GQ.ChainCall
local L = GQ.L

GQ.Inventory = {}
local Inventory = GQ.Inventory
Inventory.Items = {}

local PlayerName = UnitName("player")

local GoatQuest_GetMerchantItemInfo = function(index) 
	if GetMerchantItemInfo then return GetMerchantItemInfo(index) end

	local info = C_MerchantFrame.GetItemInfo(index);
	if info then
		return info.name, info.texture, info.price, info.stackCount, info.numAvailable, info.isPurchasable, info.isUsable, info.hasExtendedCost, info.currencyID, info.spellID;
	end
end

-- Move viewer next to vendor frame if covered by it.
-- Called from vendor goaltype
function Inventory:AttachViewerVendor()
	if not GQ.db.profile.repositionviewer then return end

	local frame = GQ.Frame:GetParent()

	if (frame:GetLeft() < MerchantFrame:GetRight()) and (frame:GetTop()<MerchantFrame:GetTop() and frame:GetTop()>MerchantFrame:GetBottom()) then
		GQ.F.SaveFrameAnchor(frame,"frame_anchor_prevendor")
		frame:ClearAllPoints()
		frame:SetPoint("LEFT",MerchantFrame,"RIGHT")
	end
end

-- Move viewer back to original position
function Inventory:DetachViewerVendor()
	if not GQ.db.profile.repositionviewer then return end

	if GQ.db.profile.frame_anchor_prevendor then
		GQ.F.SetFrameAnchor(GQ.Frame:GetParent(),GQ.db.profile.frame_anchor_prevendor)
	end
end

-------------------------------------------------------------------------------
--------- Trash items action button
-------------------------------------------------------------------------------

function Inventory:GetGrayTrashDetails()
	local itemList = {}
	-- Guides-only mode does not initialize the inventory manager or offer trash actions.
	if GQ.GuideOnly then return itemList end
	local keptItems = GQ.db.char.keptItems or {}
	for bagID=0, NUM_BAG_SLOTS do
		for bagSlotID=1,C_Container.GetContainerNumSlots(bagID) do
			local itemLink = C_Container.GetContainerItemLink(bagID,bagSlotID)
			if itemLink then
				local itemID = GQ.ItemLink.GetItemID(itemLink)
				local itemName, _, itemRarity, _, _, _, _, _, _, itemTexture, itemSellPrice = GQ:GetItemInfo(itemLink)
				local info = C_Container.GetContainerItemInfo(bagID, bagSlotID)
				if itemRarity==0 and not keptItems[itemID] then
					table.insert(itemList, {bagID, bagSlotID, itemName, itemID, info.stackCount, info.stackCount*itemSellPrice, itemTexture})
				end
			end
		end
	end

	table.sort(itemList, function(a,b) return a[6]<b[6] end)

	return itemList
end

-- Items to keep, at user's request.
function Inventory:addKeptItem(itemID)
	GQ.db.char.keptItems[itemID]=true
	GQ.ActionBar:SetActionButtons() -- to refresh 
end


function Inventory:HandleTrashMacro()
	local items = GQ.Inventory:GetGrayTrashDetails()
	local item = items and items[1]
	if not item then return end

	local mousebutton = GetMouseButtonClicked()
	if mousebutton=="LeftButton" and IsShiftKeyDown() then
		GQ.Inventory:DestroyItem(item) 
	elseif mousebutton=="RightButton" then
		GQ.Inventory:addKeptItem(item[4])
	end
end

function Inventory:DestroyItem(object)
	local bagID, bagSlotID, itemName, itemID, count, price, goatquest_texture = unpack(object)
	if not (bagID and bagSlotID) then return end
	local itemLink = C_Container.GetContainerItemLink(bagID,bagSlotID)
	if itemLink then
		local BagitemID = GQ.ItemLink.GetItemID(itemLink)
		if BagitemID==itemID then
			C_Container.PickupContainerItem(bagID, bagSlotID)
			DeleteCursorItem()

			GameTooltip:Hide()
			GQ.ActionBar.TrashButton.tooltip = L["actionbar_trash_destroying"]
		end
	end
end

-------------------------------------------------------------------------------
--------- Useless items detection
-------------------------------------------------------------------------------

function Inventory:IsTravelItem(itemid)
	if not LibRover and LibRover.data and LibRover.data.portkeys then return false end
	
	for _,item in ipairs(LibRover.data.portkeys) do
		if item.item==itemid then return true end
	end
	return false
end

local blacklist = {
	[2901] = true,  -- mining pick
	[1819] = true,  -- gouging pick
	[5956] = true,  -- blacksmith hammer
	[6367] = true,  -- big iron fishing pole
	[19970] = true, -- arcanite fishing pole
	[6365] = true,  -- strong fishing pole
	[6256] = true,  -- fishing pole
	[6366] = true,  -- darkwood fishing pole
	[12225] = true, -- blump family fishing pole
	[7005] = true,  -- skinning knife
	[2709] = true,  -- pips skinner
	[9901] = true,  -- zulian slicer
}

-- Returns items deemed to be unusable.
function Inventory:GetUnusableItems()
	local Upgrades = GQ.ItemScore.Upgrades
	local itemsList = {}
	local onlyscan
	Upgrades:ScanBagsForUpgrades(onlyscan)
	--Upgrades:ScanBagsForUpgradesForAlts()

	for bagID=0, NUM_BAG_SLOTS do
		for bagSlotID=1,C_Container.GetContainerNumSlots(bagID) do repeat
			if not (C_Container and C_Container.GetContainerItemEquipmentSetInfo and C_Container.GetContainerItemEquipmentSetInfo(bagID,bagSlotID)) then -- don't sell equipment sets
				local itemLink = C_Container.GetContainerItemLink(bagID,bagSlotID)
				if itemLink then
					local itemdetails = GQ.ItemScore:GetItemDetails(itemLink)
					if not itemdetails then break end  --continue
					local stripped_itemlink = GQ.ItemScore.strip_link(itemLink)
					local itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount, itemEquipLoc, itemTexture, itemSellPrice = GQ:GetItemInfo(itemLink)

					local isSoulbound = GQ.IsItemBound(bagID, bagSlotID)
					local id = GQ.ItemLink.GetItemID(itemLink)

					local isUpgrade,_,_,_,rejectedUpgrade = Upgrades:IsUpgrade(stripped_itemlink)
					--isUpgrade = isUpgrade or Upgrades:IsUpgradeForAlt(stripped_itemlink)
					isUpgrade = isUpgrade or Upgrades:IsUpgradeForOffspec(stripped_itemlink)

					local fam,fmax=0,0
					if id then fam,fmax = GQ.ItemScore.Upgrades:GetItemUniqueness(id) end
					
					if id	and ((isSoulbound  and not (isUpgrade or rejectedUpgrade=="rejected")) or (itemRarity==1 and not isUpgrade))		-- sell non-upgrades that are bound or white
						and (itemSellPrice or 0) > 0								-- that have sell price
						and (itemdetails.class==Enum.ItemClass.Weapon or itemdetails.class==Enum.ItemClass.Armor) -- are weapon/armor
						and ((not GQ.db.char.keptItems) or GQ.db.char.keptItems[id]==nil)			-- not blacklisted by user
						and (not blacklist[id])									-- nor by us
						and itemRarity<5									-- and don't even look at legendaries
						and fam~=473										-- or their precursors
						and not Inventory:IsTravelItem(id)							-- or item used by travel system
					then
						local item = {}
						item.ID=id
						item.bagID=bagID
						item.bagSlotID=bagSlotID
						item.itemName=itemName
						item.itemLink=itemLink
						item.itemQuality=itemRarity
						table.insert(itemsList, item)
					end
				end
			end
		until true  end
	end
	table.sort(itemsList,function(a,b) return a.itemName<b.itemName end)
	
	return itemsList
end


-------------------------------------------------------------------------------
--------- Gray items vendor selling
-------------------------------------------------------------------------------

function Inventory:SetUpGreySellButton()
	if self.greysellbutton then return end
	self.greysellbutton = CHAIN(CreateFrame("Button", "GoatQuestSellButton", MerchantFrame, "UIPanelButtonTemplate"))
		:SetPoint("TOPLEFT", 60, -30)
		:SetWidth(100)
		:SetText(L['loot_sellgreybutton'])
		:SetScript("OnClick",Inventory.SellGreyItems)
	.__END
end

local loot_sellgreyitems_blacklist = { -- some items are breaking auto sell for some reason. blacklist them
	[158178]=true, -- Mangled Tortollan Scroll
	[167873]=true, -- Remnant of the Void
	[252415]=true, -- Trovehunter's Bounty
}

local function isvalidsellabegray(itemID)
	if loot_sellgreyitems_blacklist[itemID] then return false,0 end
	local _, _, quality, _, _, _, _, _, _, _, price, classID, subclassID, _, _, _, _, _ = GQ:GetItemInfo(itemID)
	if quality>0 then return false,0 end
	--if classID==Enum.ItemClass.Consumable and subclassID==Enum.ItemConsumableSubclass.Other then return false,0 end
	if classID==Enum.ItemClass.Questitem then return false,0 end
	return price > 0,price
end

local function loot_sellgreyitems_thread() --Auto Sell Grey Items
	local attempt = 0
	while true do
		if not MerchantFrame:IsVisible() then GQ:Print("Selling of grey items interrupted. Results may not be accurate.") break end
		local grays = 0
		for bag=0, NUM_BAG_SLOTS do
			for slot=1, C_Container.GetContainerNumSlots(bag) do
				if not MerchantFrame:IsVisible() then break end
				local itemID=C_Container.GetContainerItemID(bag,slot)
				if itemID  then
					local itemInfo = C_Container.GetContainerItemInfo(bag,slot)
					if not loot_sellgreyitems_blacklist[itemID] then
						if isvalidsellabegray(itemID) then
							grays = grays + 1
							C_Container.UseContainerItem(bag,slot) -- Will use an item and since vendor is open, will sell the item.
							coroutine.yield()
						end
					end
				end
			end
			coroutine.yield()
		end
		attempt = attempt + 1
		if grays == 0 then break end
		if attempt == 50 then break end
	end
	
	-- report and exit
	if not MerchantFrame:IsVisible() then GQ:Print("Selling of grey items interrupted. Results may not be accurate.") end
	if Inventory.SellingGreyTotal>0 then
		for i,v in pairs(Inventory.SellingGreyStatus) do
			GQ:Print(v)
		end
		GQ:Print(L['loot_sellgreys_total']:format(GetMoneyString(Inventory.SellingGreyTotal)))
	end
end

Inventory.SellingGreyStatus = {}
function Inventory:SellGreyItems() --Auto Sell Grey Items
	table.wipe(Inventory.SellingGreyStatus)
	Inventory.SellingGreyTotal=0

	-- gather info
	for bag=0, NUM_BAG_SLOTS do
		for slot=1, C_Container.GetContainerNumSlots(bag) do
			local item=C_Container.GetContainerItemID(bag,slot)
			if item  then
				local itemInfo = C_Container.GetContainerItemInfo(bag,slot)
				if itemInfo.quality==0 and not noValue then
					local valid,price = isvalidsellabegray(item)
					if valid then
						table.insert(Inventory.SellingGreyStatus,L['loot_sellgreys_sold']:format(itemInfo.hyperlink,itemInfo.stackCount,GetMoneyString(price*itemInfo.stackCount)))
						Inventory.SellingGreyTotal = Inventory.SellingGreyTotal + price*itemInfo.stackCount
					end
				end
			end
		end
	end

	-- work
	Inventory.SellingGreyThread = coroutine.create(loot_sellgreyitems_thread)
	Inventory.SellingGreyTimer = GQ:ScheduleRepeatingTimer(function()
		local ok,ret = coroutine.resume(Inventory.SellingGreyThread)
		if coroutine.status(Inventory.SellingGreyThread)=="dead" then 
			GQ:CancelTimer(Inventory.SellingGreyTimer) 
		end
	end,
	0.1)
end

-------------------------------------------------------------------------------
--------- Buy guide items
-------------------------------------------------------------------------------

function Inventory:FindItemsToBuyDelayed(delay) 
	GQ:CancelTimer(Inventory.FindeItemsTimer)
	Inventory.FindeItemsTimer = GQ:ScheduleTimer(function() Inventory:FindItemsToBuy() end,delay or 0.1)
end



function Inventory:FindItemsToBuy()
	GQ.NotificationCenter:RemoveEntry("goldbuy")

	if not (GQ.db.profile.autobuy and GQ.db.profile.enable_vendor_tools) then return end
	if not (MerchantFrame and MerchantFrame:IsVisible()) then return end
	if not GQ.CurrentStep then return end

	local goals=GQ.CurrentStep.goals
	local totalCost,neededSlots = 0,0
	local id

	self.ItemsToBuy = self.ItemsToBuy or {}
	wipe(self.ItemsToBuy)

	-- get list of needed items from current step
	for _,goal in ipairs(GQ.CurrentStep.goals) do while(1) do
		-- is incomplete buy
		if goal.action~="buy" or goal.status=="complete" or (goal.condition_visible and not goal.condition_visible()) then break end	
		if not goal.targetid then break end

		--local complete, possible, done, needed = goal:IsComplete()
		local done, needed = goal.got, goal.count

		self.ItemsToBuy[goal.targetid] = self.ItemsToBuy[goal.targetid] or {amount=0, name=goal.target, itemid=goal.targetid}
		
		self.ItemsToBuy[goal.targetid].amount = self.ItemsToBuy[goal.targetid].amount + (needed - (done or 0))
		break
	end end

	GQ:Debug("Trying to find items to buy")

	-- calculate space needed and find items at vendor
	local found = false -- to handle items that are buyable with gold, but cost 0c
	for index=1,GetMerchantNumItems() do while(1) do 
		local merchItemName,_,costForOne,merchantStack,numAvail,_,_,hasExtendedCost = GoatQuest_GetMerchantItemInfo(index)
		if hasExtendedCost then break end -- item is not buyable with gold. abort

		local itemlink = GetMerchantItemLink(index)
		local itemid = itemlink and GQ.ItemLink.GetItemID(itemlink)
		if not itemid then break end -- no details, abort

		local item = self.ItemsToBuy[itemid]
		if not item then break end -- we do not need this, abort

		local maxStack = GetMerchantItemMaxStack(index)

		if item.amount%maxStack == 0 then 
			neededSlots = neededSlots + floor(item.amount/maxStack)
		else 
			neededSlots = neededSlots + floor(item.amount/maxStack) + 1 
		end

		if numAvail~=-1 and numAvail < item.amount then GQ:Print(L['loot_autobuynostock']:format(merchItemName,item.amount)) return end -- not enough, aaaabort
		
		totalCost = totalCost + item.amount*(costForOne/merchantStack)

		self.ItemsToBuy[itemid].index = index
		self.ItemsToBuy[itemid].maxStack = maxStack
		found = true
		break
	end end
	if totalCost <= 0 and not found then return end -- items dont exist in this step or are of a different type than gold
	
	GQ:Debug("Found items")

	local playerMoney = GetMoney()
	if playerMoney >= totalCost then
		GQ:Debug("Trying to buy items")
		local title,itemtext = L["notifcenter_loot_text"],""
		for name,item in pairs(self.ItemsToBuy) do 
			if item.index then
				itemtext = "|n"..itemtext..item.name.." x |cffff0000"..item.amount.."|r" 
			end
		end
		local text = L['loot_autobuyframetext']:format(itemtext,GQ.GetMoneyString(totalCost))
		GQ.NotificationCenter:AddEntry("goldbuy",title,text,{special=true, specialtext="Buy items", forcemode="detailed", displaytime=9999, transient=true, anchor={"LEFT",MerchantFrame,"RIGHT",0,0}})
	elseif playerMoney < totalCost then
		GQ:Print(L['loot_autobuypoor']:format(GQ.GetMoneyString(totalCost)))
	end
end

function Inventory:BuyItems()
	local items = {}
	for i,v in pairs(Inventory.ItemsToBuy) do table.insert(items,v) end
	table.sort(items,function(a,b) return (a.index or 0)>(b.index or 0) end)

	for name,item in ipairs(items) do
		if item.index then
			while item.amount > 0 do
				local buyAmount = item.amount

				if item.amount > item.maxStack then
					buyAmount = item.maxStack
				end
				if buyAmount<=0 then return end
				BuyMerchantItem(item.index,buyAmount)
				item.amount=item.amount-buyAmount
			end
		end
	end
	wipe(self.ItemsToBuy) -- wipe table after we are done
end


-------------------------------------------------------------------------------
--------- Free space in bags indicator
-------------------------------------------------------------------------------

function Inventory:SetUpBagspaceText()
	Inventory.BagSpaceText = CHAIN(MainMenuBarBackpackButton:CreateFontString(nil,"OVERLAY"))
		:SetPoint("BOTTOMRIGHT",-1,3)
		:SetHeight(13)
		:SetFont("Fonts\\ARIALN.TTF",14,"OUTLINE")
		:SetText("")
	.__END
	Inventory.BagSpaceTextBG = CHAIN(MainMenuBarBackpackButton:CreateTexture(nil,"OVERLAY"))
		:SetPoint("LEFT")
		:SetPoint("RIGHT")
		:SetPoint("BOTTOM",0,3)
		:SetHeight(12)
		:SetTexture(GQ.SKINSDIR.."white")
		:SetVertexColor(0,0,0,0.5)
	.__END

end

function Inventory:UpdateBagspaceText()
	if not GQ.db.profile.showbagspace then
		Inventory.BagSpaceText:Hide()
		Inventory.BagSpaceTextBG:Hide()
		return
	end

	Inventory.BagSpaceText:Show()
	Inventory.BagSpaceTextBG:Show()

	local total,free = 0,0
	for bag=0,NUM_BAG_SLOTS do
		total = total + C_Container.GetContainerNumSlots(bag)
		free = free + C_Container.GetContainerNumFreeSlots(bag)
	end

	if free>10 then
		Inventory.BagSpaceText:SetFont("Fonts\\ARIALN.TTF",14,"OUTLINE")
	else
		Inventory.BagSpaceText:SetFont("Fonts\\ARIALN.TTF",16,"OUTLINE")
	end

	Inventory.BagSpaceText:SetText(free)
end





-------------------------------------------------------------------------------
--------- Recording of bag items
-------------------------------------------------------------------------------

local function recordbankbag(bagnum)
	local savedinventory = Inventory.Bankdata[PlayerName]
	for i=1,C_Container.GetContainerNumSlots(bagnum) do
		local link = C_Container.GetContainerItemLink(bagnum,i)
		local itemInfo = C_Container.GetContainerItemInfo(bagnum, i)
		if link then
			local _, _, _, _, _, classID, subclassID = C_Item.GetItemInfoInstant(link)

			link = GQ.ItemLink.StripBlizzExtras(link,true)
			link = link:gsub("%[",""):gsub("%]","")
			table.insert(savedinventory,("item^%d^%d^%d^%d^%s^%d^%d"):format(bagnum,i,itemInfo.stackCount,itemInfo.iconFileID,link,classID,subclassID))
		end
	end
	local slots = C_Container.GetContainerNumSlots(bagnum)
	local free = C_Container.GetContainerNumFreeSlots(bagnum)

	return slots,free
end

Inventory.BankSlots = {-1,6,7,8,9,10,11,12}
if not GQ.IsRetail then Inventory.BankSlots = {-1,6,7,8,9,10,11} end

function Inventory:RecordBank()
	local savedinventory = Inventory.Bankdata[PlayerName]
	table.wipe(savedinventory)

	local total_free,total_slots = 0,0
	local NUM_BAG_SLOTS = GQ.IsRetail and 5 or NUM_BAG_SLOTS -- retail NBS is not updated to understand reagent bank

	for index,bagnum in ipairs(Inventory.BankSlots) do
		local slot = C_Container.ContainerIDToInventoryID(NUM_BAG_SLOTS + index-1)
		local bagtexture = GetInventoryItemTexture("player",slot)
		local baglink = GetInventoryItemLink("player",slot)
		local slots,free = recordbankbag(bagnum)

		total_free = total_free + free
		total_slots = total_slots + slots

		if bagnum == -1 then -- bank does not have a default icon for main frame, so lets put map tracking icon here
			bagtexture=136453
			baglink = "Bank"
		end
		if baglink then
			baglink = baglink:gsub("%[",""):gsub("%]","")
			table.insert(savedinventory,("bag^%d^%d^%d^%d^%s"):format(bagnum,bagtexture,slots,free,baglink))
		end
	end

	-- reagent bank
	if IsReagentBankUnlocked and IsReagentBankUnlocked() then
		local bagnum = -3
		local slots,free = recordbankbag(bagnum)
		local baglink = "Reagent Bank"
		table.insert(savedinventory,("bag^%d^%d^%d^%d^%s"):format(bagnum,136453,slots,free,baglink))
	end

	-- warband bank
	if GQ.IsRetail then
		local tabDataFetched = C_Bank.FetchPurchasedBankTabData(Enum.BankType.Account)
		for _,tabData in ipairs(tabDataFetched) do
			local slots,free = recordbankbag(tabData.ID)
			table.insert(savedinventory,("bag^%d^%d^%d^%d^%s"):format(tabData.ID,tabData.icon,slots,free,ACCOUNT_BANK_PANEL_TITLE.." "..tabData.name))
		end
	end

	table.insert(savedinventory,("meta^%d^%d^%d"):format(time(),total_slots,total_free))
	GQ:SendMessage("INVENTORY_BANK_UPDATED")
end

function Inventory:CharacterBankKnown()
	if Inventory.Bankdata[PlayerName] and Inventory.Bankdata[PlayerName][1] then return true end
	return false
end

local temp,names = {},{}
function Inventory:ParseBank(ident)
	table.wipe(temp)
	table.wipe(names)
	if not ident then return temp end
	if not Inventory.Bankdata then return temp end -- too soon, you called us too soon

	if ident=="*" then
		for n,_ in pairs(Inventory.Bankdata) do
			table.insert(names,n)
		end
	else
		table.insert(names,ident)
	end

	for _,character in ipairs(names) do
		local entries = Inventory.Bankdata[character]
		if not entries then return temp end

		temp[character] = {}
		
		for _,line in ipairs(entries) do
			local type,arg1,arg2,arg3,arg4,arg5,arg6,arg7 = strsplit("^",line)
			if type=="item" then
				local bag=tonumber(arg1)
				local slot=tonumber(arg2)
				local name = arg5:match(".*%|h(.*)%|h.*")
				temp[character][bag] = temp[character][bag] or {}
				temp[character][bag][slot] = {type="item", link=arg5, name=name, icon=tonumber(arg4), count=tonumber(arg3), class=tonumber(arg6), subclass=tonumber(arg7), bag=bag, slot=slot, owner=character}
			elseif type=="bag" then
				local bag = tonumber(arg1)
				temp[character][bag] = temp[character][bag] or {}
				temp[character][bag].bag = {type="bag", link=arg5, name=name, texture=tonumber(arg2), slots=tonumber(arg3), free=tonumber(arg4), bag=bag, owner=character}
			elseif type=="meta" then
				local timestamp = tonumber(arg1)
				local total_slots = tonumber(arg2)
				local total_free = tonumber(arg3)
				local timeobj = C_DateAndTime.GetCalendarTimeFromEpoch(timestamp*1000000)  -- seconds to microseconds
				local timestamp = FormatShortDate(timeobj.monthDay, timeobj.month, timeobj.year) .. " " .. GameTime_GetFormattedTime(timeobj.hour, timeobj.minute, true)

				temp[character].timestamp = timestamp
				temp[character].total_slots = total_slots
				temp[character].total_free = total_free	
			end
		end
		temp[character].character = name
	end
	return temp
end

function Inventory:ParseBankSummary()
	if not (Inventory.BankContent and Inventory.BankContent[PlayerName]) then return {} end
	local summary = {}

	for bag,bagdata in pairs(Inventory.BankContent[PlayerName]) do
		if tonumber(bag) then
			for slot,slotdata in pairs(bagdata) do
				if tonumber(slot) then
					summary[slotdata.link] = (summary[slotdata.link] or 0) + slotdata.count
				end
			end
		end
	end

	return summary
end

function Inventory:CountBank(itemid)
	local found = 0
	for itemlink,count in pairs(Inventory.BankSummary) do
		if itemid == GQ.ItemLink.GetItemID(itemlink) then
			found = found + count
		end
	end
	return found
end


-------------------------------------------------------------------------------
--------- Autorepair
-------------------------------------------------------------------------------

function Inventory:AutoRepair()
	if CanMerchantRepair() then
		local gqgoldneeded = GetRepairAllCost()
		local gqmoneyheld = GetMoney()
		local gqcangbrepair = CanGuildBankRepair()
		local gqgbankamount = GetGuildBankWithdrawMoney()

		if gqgoldneeded==0 or GQ.db.profile.autorepair==1 then return end
		if GQ.db.profile.autorepair==2 or (not IsInGuild() and GQ.db.profile.autorepair>2) then
			if (gqgoldneeded <=gqmoneyheld) then								---Use own money: has money
				RepairAllItems()
				GQ:Print(L['im_ar_repairamount']..GQ.GetMoneyString(gqgoldneeded)..".")
			else																---Use own money: no money
				GQ:Print(L['im_ar_cannotar'])
			end
		elseif GQ.db.profile.autorepair==3 then
			if gqcangbrepair and (gqgbankamount >= gqgoldneeded) then			---Use guild money, then own: can guild repair
				RepairAllItems(1)
				GQ:Print(L['im_ar_repairamount']..GQ.GetMoneyString(gqgoldneeded)..L['im_ar_guild'])
			elseif gqgoldneeded <=gqmoneyheld then								---Use guild money, then own: cannot guild repair but has money
				RepairAllItems()
				GQ:Print(L['im_ar_repairamount']..GQ.GetMoneyString(gqgoldneeded)..".")
			elseif not gqcangbrepair then GQ:Print(L['im_ar_noguildrepairs'])		---Use guild money, then own: no money, guild not allowed
			else																---Use guild money, then own: no guild, no money
				GQ:Print(L['im_ar_cannotar2'])
			end
		elseif GQ.db.profile.autorepair==4 then
			if gqgoldneeded <=gqmoneyheld then									---Use own money, then guild: has money
				RepairAllItems()
				GQ:Print(L['im_ar_repairamount']..GQ.GetMoneyString(gqgoldneeded)..".")
			elseif gqcangbrepair and (gqgbankamount >= gqgoldneeded) then		---Use own money, then guild: no money but has guild
				RepairAllItems(1)
				GQ:Print(L['im_ar_repairamount']..GQ.GetMoneyString(gqgoldneeded)..L['im_ar_guild'])
			elseif not gqcangbrepair then GQ:Print(L['im_ar_noguildrepairs'])		---Use own money, then guild: no money, guild not allowed
			else																---Use own money, then guild: no money, no guild
				GQ:Print(L['im_ar_cannotar2'])
			end
		end
	end
end

function Inventory.OnEvent(self, event)
	if event=="BAG_UPDATE_DELAYED" then
		Inventory:FindItemsToBuyDelayed() 
		Inventory:UpdateBagspaceText()
	elseif event=="MERCHANT_SHOW" then
		Inventory:SetUpGreySellButton()
		Inventory.greysellbutton:SetShown(GQ.db.profile.showgreysellbutton)

		if GQ.db.profile.autosell and GQ.db.profile.enable_vendor_tools then Inventory:SellGreyItems() end
		--if GQ.db.profile.autosellother and GQ.db.profile.enable_vendor_tools then Inventory:SellUnusableItems() end

		Inventory.FindItemsToBuyMissedNames = false
		GQ:ScheduleTimer(function()  -- MERCHANT_SHOW now fires before MerchantFrame is visible, delay till next onupdate
			Inventory:FindItemsToBuyDelayed() 
			Inventory:AutoRepair()
		end,0)
	elseif event=="MERCHANT_UPDATE" then
		Inventory:FindItemsToBuyDelayed(1) 	
	elseif event=="MERCHANT_CLOSED" then
		table.wipe(Inventory.ItemsToBuy)
		GQ.NotificationCenter:RemoveEntry("goldbuy")
	elseif event=="BANKFRAME_OPENED" then
		Inventory:RecordBank()
	elseif event=="BANKFRAME_CLOSED" then
		Inventory.BankContent = Inventory:ParseBank(PlayerName)
		Inventory.BankSummary = Inventory:ParseBankSummary()
	elseif event=="BAG_UPDATE" then
		if BankFrame and BankFrame:IsVisible() then
			if not GQ:Throttler("Inventory_BAG_UPDATE",0) then
				Inventory:RecordBank()
			end
		end
	elseif event=="GQ_STEP_FINALISED" or event=="GQ_GOAL_COMPLETED" or event=="GQ_GOAL_UNCOMPLETED" then
		Inventory:FindItemsToBuyDelayed() 
	end
end



tinsert(GQ.startups,{"InventoryManager setup",function(self)
	GQ.db.char.keptItems = GQ.db.char.keptItems or {}
	if GQ.IsRetail then
		Inventory.Bankdata = GQ.db.realm.bankdata
	else
		Inventory.Bankdata = GQ.db.factionrealm.bankdata
	end

	Inventory.Bankdata[PlayerName] = Inventory.Bankdata[PlayerName] or {}

	GQ:AddEventHandler("MERCHANT_SHOW",Inventory.OnEvent)
	GQ:AddEventHandler("MERCHANT_CLOSED",Inventory.OnEvent)
	GQ:AddEventHandler("MERCHANT_UPDATE",Inventory.OnEvent)
	GQ:AddEventHandler("BANKFRAME_OPENED",Inventory.OnEvent)
	GQ:AddEventHandler("BANKFRAME_CLOSED",Inventory.OnEvent)
	GQ:AddEventHandler("BAG_UPDATE",Inventory.OnEvent)
	GQ:AddEventHandler("BAG_UPDATE_DELAYED",Inventory.OnEvent)
	GQ:AddEventHandler("PLAYERBANKSLOTS_CHANGED",Inventory.OnEvent)
	GQ:AddEventHandler("MAIL_SHOW",Inventory.OnEvent)

	Inventory:SetUpBagspaceText()
	Inventory:UpdateBagspaceText()

	Inventory.ItemsToBuy = {}

	GQ:AddMessageHandler("GQ_STEP_FINALISED",Inventory.OnEvent)
	GQ:AddMessageHandler("GQ_GOAL_COMPLETED",Inventory.OnEvent)
	GQ:AddMessageHandler("GQ_GOAL_UNCOMPLETED",Inventory.OnEvent)

	Inventory.BankContent = Inventory:ParseBank(PlayerName)
	Inventory.BankSummary = Inventory:ParseBankSummary()

	GQ:SendMessage("INVENTORY_STARTUP_DONE")
end})

local invslots = {'AmmoSlot','BackSlot','Bag0Slot','Bag1Slot','Bag2Slot','Bag3Slot','ChestSlot','FeetSlot','Finger0Slot','Finger1Slot','HandsSlot','HeadSlot','LegsSlot','MainHandSlot','NeckSlot','SecondaryHandSlot','ShirtSlot','ShoulderSlot','TabardSlot','Trinket0Slot','Trinket1Slot','WaistSlot','WristSlot'}
if not GQ.IsRetail then table.insert(invslots,'RangedSlot') end
GQ.Inventory.InvSlots = invslots

-------------------------------------------------------------------------------
--------- Move between bags and bank
-------------------------------------------------------------------------------
Inventory.Queue = {}
function Inventory:QueueMoveItems(source,itemid,count)
	table.insert(Inventory.Queue,{source,itemid,count})

	if Inventory.QueueTimer then GQ:CancelTimer(Inventory.QueueTimer) end
	Inventory.QueueTimer = GQ:ScheduleRepeatingTimer(function() 
		Inventory:QueueMoveItemsHandler()
	end, 0.1)
end

function Inventory:QueueMoveItemsHandler()
	local entry = table.remove(Inventory.Queue,1)
	Inventory:MoveItems(unpack(entry))
	
	if #Inventory.Queue==0 then
		GQ:CancelTimer(Inventory.QueueTimer)
	end
end


local bankslots = GQ.IsRetail and {-1,6,7,8,9,10,11,12} or {-1,5,6,7,8,9,10}
local bagslots = GQ.IsRetail and {0,1,2,3,4,5} or {0,1,2,3,4}
function Inventory:MoveItems(source,itemid,count)
	if not itemid then return end

	local fromslots,toslots
	if source=="bank" then 
		fromslots = bankslots
		toslots = bagslots
	else
		fromslots = bagslots
		toslots = bankslots
	end
	
	if count=="all" then 
		if source=="bank" then
			-- all in bank, minus all in bags
			count = C_Item.GetItemCount(itemid,true) - C_Item.GetItemCount(itemid)
		else
			count = C_Item.GetItemCount(itemid) 
		end
	end
		
	-- verify that there is enough space in destination for the item
	local itemfamily = C_Item.GetItemFamily(itemid) or 0
	local isReagent = select(17,GQ:GetItemInfo(itemid))

	local spaceFound = false
	local itemFound = false
	for _,bagID in ipairs(toslots) do
		local slot = C_Container.ContainerIDToInventoryID(bagID)
		local bagItemID = GetInventoryItemID("player",slot)
		local bagfamily = bagItemID and C_Item.GetItemFamily(bagItemID) or 0
		
		if (bagfamily == 0) or (bit.band(itemfamily, bagfamily) > 0) then -- ok, the item can go here
			for bagSlotID=1,C_Container.GetContainerNumSlots(bagID) do
				if C_Container.GetContainerItemID(bagID,bagSlotID)==itemid then
					-- item is already in the bag. stack it here
					spaceFound = bagID
					itemFound = true
				end
			end
			-- if it is reagent, prefer putting it in reagent bag, unless we already found item elsewhere
			-- if we didn't find neither item nor space, grab first free bag
			if (not spaceFound or (not itemFound and isReagent and bagID==5)) and C_Container.GetContainerNumFreeSlots(bagID)>0 then 
				-- there is space in that bag, put it here
				spaceFound=bagID 
			end
		end
	end
				
	if not spaceFound then return end	

	for _,bagID in ipairs(fromslots) do
		for bagSlotID=1,C_Container.GetContainerNumSlots(bagID) do
			if count==0 then break end
			local itemInfo = C_Container.GetContainerItemInfo(bagID,bagSlotID)
			if itemInfo and itemInfo.itemID==itemid then
				if itemInfo.stackCount > count then
					C_Container.SplitContainerItem(bagID,bagSlotID,count)
					if spaceFound==BACKPACK_CONTAINER then
						PutItemInBackpack()
					else
						PutItemInBag(CONTAINER_BAG_OFFSET+spaceFound)
					end
					count = 0
				else
					C_Container.UseContainerItem(bagID,bagSlotID)
					count = count - itemInfo.stackCount
				end
			end
		end
	end
	ClearCursor()
end