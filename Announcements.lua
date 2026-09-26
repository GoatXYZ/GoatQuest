local name,GQ = ...

local tinsert,tremove,print,ipairs,pairs,wipe,floor,ceil=tinsert,tremove,print,ipairs,pairs,wipe,floor,ceil

local Announce = {}
GQ.Announcements = Announce

local L = GQ.L
local FONT=GQ.Font
local FONTBOLD=GQ.FontBold
local ui = GQ.UI
local SkinData = ui.SkinData
local CHAIN = GQ.ChainCall

function Announce:Initialise()
	GQ:AddEventHandler("PLAYER_LEVEL_UP",function() Announce:SendMessage() end)
end

function Announce:FormatTime(seconds)
	local days = seconds / 86400
	local hours = seconds % 86400 / 3600
	local minutes = seconds % 3600 / 60

	if days >= 1 then
		return ("%01d days %01d hours %01d minutes"):format(days,hours,minutes)
	elseif hours >= 1 then
		return ("%01d hours %01d minutes"):format(hours,minutes)
	else
		return ("%01d minutes"):format(minutes)
	end
end


function Announce:FormatMessage()
	local timeplayed = GQ.db.char.timeperlevel
	local levelfrom = UnitLevel("player")
	local levelto = UnitLevel("player") + 1

	local message = ("{triangle} GoatQuest: I just leveled up from %s to %s! (%s)"):format(levelfrom,levelto,Announce:FormatTime(timeplayed[levelfrom]))

	return message
end

function Announce:SendMessage()
	if not GQ.db.profile.spam_levelup then return end

	local message = Announce:FormatMessage()
		
	if GQ.db.profile.spam_levelup_emote then SendChatMessage(message, "EMOTE") end
	if GQ.db.profile.spam_levelup_party then SendChatMessage(message, "PARTY") end
	if GQ.db.profile.spam_levelup_guild then SendChatMessage(message, "GUILD") end

end

tinsert(GQ.startups,{"Announcements startup",function(self)
	Announce:Initialise()
end})