local name,GQ = ...
local Styles = GQ.Styles

-- Builds a plain snapshot of the current guide step for the GoatQuest viewer.
-- The viewer never reads engine objects directly; everything it draws comes
-- from this table, which keeps it simple and testable.
--
-- snapshot = {
--   state       "guide" | "loading" | "none"
--   guideName   "Westfall"            guideTitle "Westfall (13-15)"
--   range       "13–15" or nil         stepNum, stepCount, stepFraction
--   lines       { line, ... }  visible goals of the current step, see MakeLine
--   primary     index into lines of the first incomplete goal (or 1)
--   along       { line, ... }  incomplete goals of sticky steps running alongside
--   upcoming    { {stepNum=..., lines={...}}, ... } additional displayed steps
--   prev, next  { text=... } or nil   neighbouring step summaries
--   waypoint    { x, y, zone, title } in percent, or nil
-- }

local Model = {}
Styles.Model = Model

local EN_DASH = "\226\128\147"
local Decolor = Styles.Decolor

local function QuestTitle(goal)
	local q = goal.quest
	if type(q)=="table" and q.title then return q.title end
	if goal.questid and GQ.questsbyid and GQ.questsbyid[goal.questid] and GQ.questsbyid[goal.questid].title then
		return GQ.questsbyid[goal.questid].title
	end
	if type(q)=="string" and not q:match("^%d+$") then return q end
end

local function ShortLabel(goal,text)
	local target = goal.target or goal.item or goal.npc
	if type(target)=="string" and target~="" then return Decolor(target) end
	return text
end

--- Split "Westfall (13-15)" into "Westfall" and "13–15".
function Model.SplitTitle(title)
	if not title then return nil end
	title = title:match("([^\\]+)$") or title
	local base,lo,hi = title:match("^(.-)%s*%((%d+)%s*%-%s*(%d+)%)%s*$")
	if base then return base,lo..EN_DASH..hi,title end
	return title,nil,title
end

local function MakeLine(goal,status,done,needed)
	local text = goal:GetText(false,false,false,true) or ""
	local isTip = false
	if text=="?" then text = goal.tooltip or "" isTip = true end
	text = Decolor(text)
	if text=="" then return nil end
	needed = tonumber(needed)
	done = tonumber(done)
	local counted = needed and needed>1 and done and true or false
	return {
		text = text,
		label = ShortLabel(goal,text),
		action = goal.action,
		status = status,
		complete = status=="complete",
		passive = status=="passive",
		done = counted and math.min(done,needed) or nil,
		needed = counted and needed or nil,
		counted = counted,
		fraction = counted and math.min(1,done/needed) or (status=="complete" and 1 or 0),
		quest = QuestTitle(goal),
		tip = (not isTip) and goal.tooltip and Decolor(goal.tooltip) or nil,
		isTip = isTip,
		goal = goal,
	}
end

local function VisibleLines(step,skipTravel,onlyIncomplete)
	local lines = {}
	if not step or not step.goals then return lines end
	local many = #step.goals>1
	for _,goal in ipairs(step.goals) do
		local status,done,needed = goal:GetStatus()
		local skip = status=="hidden"
			or (skipTravel and many and goal.IsInlineTravel and goal:IsInlineTravel())
			or (onlyIncomplete and status=="complete")
		if not skip then
			local line = MakeLine(goal,status,done,needed)
			if line then tinsert(lines,line) end
		end
	end
	return lines
end

--- First readable goal text of a step, for the previous and "then" lines.
function Model.Summary(step)
	if not step or not step.goals then return nil end
	for _,goal in ipairs(step.goals) do
		local visible = true
		if goal.IsVisible then visible = goal:IsVisible() end
		if visible then
			local text = goal:GetText(false,false,false,true)
			if text and text~="" and text~="?" then return Decolor(text) end
		end
	end
	if step.GetTitle then return step:GetTitle() end
end

local function SafeSummary(step)
	local ok,text = pcall(Model.Summary,step)
	return ok and text or nil
end

local function Waypoint(step)
	if not step or not step.goals then return nil end
	local goal = step.current_waypoint_goal_num and step.goals[step.current_waypoint_goal_num]
	if not (goal and goal.x) then
		for _,g in ipairs(step.goals) do
			if g.x and g.y and g.action~="mapmarker" then goal = g break end
		end
	end
	if not (goal and goal.x and goal.y) then return nil end
	local zone
	if goal.map and C_Map and C_Map.GetMapInfo then
		local info = C_Map.GetMapInfo(goal.map)
		zone = info and info.name
	end
	return {x=goal.x*100, y=goal.y*100, zone=zone, title=goal.waytitle and Decolor(goal.waytitle) or nil}
end

function Model:Build()
	local guide,step = GQ.CurrentGuide,GQ.CurrentStep
	local snap = {lines={}, along={}, upcoming={}, primary=1}

	if not guide or not step then
		snap.state = "none"
		return snap
	end
	local title = guide.title_short or guide.title
	snap.guideName,snap.range,snap.guideTitle = Model.SplitTitle(title)
	if not guide.fully_parsed then
		snap.state = "loading"
		return snap
	end
	snap.state = "guide"

	local steps = guide.steps or {}
	local num = GQ.CurrentStepNum or step.num or 1
	snap.stepNum = num
	snap.stepCount = #steps
	snap.stepFraction = #steps>0 and math.min(1,num/#steps) or 0

	local profile = GQ.db and GQ.db.profile or {}
	snap.lines = VisibleLines(step,not profile.showinlinetravel)
	for i,line in ipairs(snap.lines) do
		if not line.complete and not line.isTip then snap.primary = i break end
	end

	for _,sticky in ipairs(GQ.CurrentStickies or {}) do
		if sticky~=step then
			for _,line in ipairs(VisibleLines(sticky,true,true)) do
				line.sticky = true
				tinsert(snap.along,line)
			end
		end
	end

	-- Respect the same step range as the stock viewer. Check requirements before
	-- exposing future objectives (class/race and optional steps may be hidden).
	local count = tonumber(profile.showcountsteps) or 1
	local last = math.min(#steps,num+math.max(1,count)-1)
	for i=num+1,last do
		local upcoming = steps[i]
		if upcoming and (profile.showwrongsteps or not upcoming.AreRequirementsMet or upcoming:AreRequirementsMet()) then
			if upcoming.PrepareCompletion then upcoming:PrepareCompletion() end
			tinsert(snap.upcoming,{stepNum=i,lines=VisibleLines(upcoming,not profile.showinlinetravel)})
		end
	end
	if steps[num-1] then snap.prev = {text=SafeSummary(steps[num-1])} end
	if steps[last+1] then snap.next = {text=SafeSummary(steps[last+1])} end

	snap.waypoint = Waypoint(step)
	return snap
end
