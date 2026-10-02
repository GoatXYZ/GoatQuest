local Goal = GQ.GoalProto
local GOALTYPES = GQ.GOALTYPES

-- returns: current, needed, remaining
function Goal.GetQuestGoalData(questid,objnum,count)
	local questdata,goaldata,goalcountnow,goalcountneeded,remaining
	questdata=GQ.questsbyid[questid]
	if not questdata or not questdata.inlog or not objnum then return end

	-- quest-goal completion display; lame 0/5
	goaldata = questdata.goals[objnum]
	if not goaldata then return end

	goalcountneeded = min(count or 9999,goaldata.needed or 9999)
	goalcountnow = goaldata.num
	remaining = goalcountneeded-goalcountnow
	if remaining<=0 then remaining=goalcountneeded end

	return goalcountnow,goalcountneeded,remaining
end


GOALTYPES['learnmount'] = GOALTYPES['get']
GOALTYPES['learnpet'] = GOALTYPES['get']

GOALTYPES['accept'].iscomplete = function(self)
	local quest = GQ.questsbyid[self.questid]
	local complete = (GQ.completedQuests[self.questid] and not self.repeatablequest)
	    or (GQ.recentlyCompletedQuests[self.questid] or GQ.recentlyCompletedQuests[self.quest])
	    or (quest and quest.inlog)

	return complete, complete or (GQ.QuestDB:IsQuestPossible(self.questid)==GQ.QuestDB.VALID_NOW)     --[[or GQ.recentlyAcceptedQuests[id] --]]
end

GOALTYPES['earn'] = GOALTYPES['get'] -- no currency tabs in classic

function Goal:IsValidRole()
	local role,role2 = self.grouprole,self.grouprole2

	if role=="DPS" or role2=="DPS" then return true end
	if GQ.ItemScore.playeristank and role=="TANK" or role2=="TANK" then return true end
	if GQ.ItemScore.playerishealer and role=="HEALER" or role2=="HEALER" then return true end

	return false
end