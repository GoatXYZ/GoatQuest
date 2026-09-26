local name,GQ = ...

local L = GQ.L
local BZL,BZR = GQ.BZL,GQ.BZR

local tinsert=tinsert

GQ.Waypoints = {}
local Waypoints = GQ.Waypoints

--============================================= internal =============================================

function GQ:ShowWaypoints(command)  
	local t1=debugprofilestop()  repeat
	table.wipe(LibRover.cfgNodeStepOverride)

	if (GQ.CurrentStep and GQ.CurrentStep.zombiewalk) then
		GQ.Pointer:ClearWaypoints("corpse")
	end
	
	if GQ.Pointer.corpsearrow_shown then
		self:Debug("&waypoints Corpse arrow shown; bailing out of ShowWaypoints.")
		return
	end

	local LibRover = GQ.LibRover

	self:Debug("&waypoints &_PUSH ShowWaypoints called as '%s' by %s",tostring(command or "nil"),debugstack(3):match("(\\.- in function .-)\n"))

	self.Pointer:ClearWaypoints("way")
	self.Pointer:ClearSet("route")
	self.Pointer:ClearSet("farm")
	self.Pointer:ClearSet("path")

	-- clear: JUST CLEAR.
	if command=="clear" then
		GQ:Debug("&waypoints ShowWaypoints: just clearing.")
		break
	end

	local step = GQ.GetFocusedStep and GQ:GetFocusedStep() or GQ.CurrentStep
	if not step then GQ:Debug("&waypoints &_POP No step.") break end


	---------------- NORMAL FUNCTION -------------

	--if goal then  GQ:Debug("&waypoints Pointing to goal %d",goal.num)  end

	GQ:Debug("&waypoints Pointing to step %d (%s), %d goals, waypath %s.",step.num,step.is_poi and "poi" or "guide",#step.goals,step.waypath and "present" or "absent")


	local arrowpoint,pathpoint,farmpoint


	-- SHOW FARM PATH.

	local waypath = step and step.waypath
	
	--[[  -- DISABLED temporarily. TODO!!!  Or not; one can now "use goto" in paths to import gotos.
		... or not. Needed to have gotos automatically converted after all.
		--]]
	
	if not waypath then  -- improvise waypath from gotos. If this succeeds, DON'T show goto waypoints separately.
		waypath = {coords={},loop=false,ants="straight",follow="none",made_from_gotos=true }  --,markers="none",follow="none",inline_travel=true
		for gi,goal in ipairs(step.goals) do goal.waypoint_moved_to_waypath=nil end
		for gi,goal in ipairs(step.goals) do if goal.x and not goal.action=="mapmarker" then
			goal.waypoint_marker_override=nil
			if not goal:IsVisible() then
				-- do nada
				GQ:Debug("&waypoints Waypath improv: Goal %d hidden",gi)
				goal.waypoint_moved_to_waypath=true
			elseif goal:IsInlineTravel() then
				if gi<(step.current_waypoint_goal_num or 0) then
					GQ:Debug("&waypoints Waypath improv: Goal %d skipped",gi)
				else
					if not goal.zombiewalk or (goal.zombiewalk and GQ.Pointer:IsCorpseArrowNeeded()) then
					-- only show zombiewalk steps when player is dead (and then only show those)
						GQ:Debug("&waypoints Waypath improv: Goal %d goto converted to waypath (inline travel)",gi)
						tinsert(waypath.coords,goal) -- all travel points leading up to destination
					end
					goal.waypoint_icon=GQ.Pointer.Icons.greendotbig
				end
				goal.waypoint_moved_to_waypath=true
			else
				GQ:Debug("&waypoints Waypath improv: Goal %d goto converted to waypath (final coords), improv will end",gi)
				goal.waypoint_marker_override="greendot"
				--goal.waypoint_icon=GQ.Pointer.Icons.none
				goal.waypoint_iconoverride=true
				tinsert(waypath.coords,goal) -- destination itself
				goal.waypoint_moved_to_waypath=true
				break  -------------------------------- STOP CONVERTING
			end
		end end
		
		--[[
		if #waypath.coords<2 then
			GQ:Debug("&waypoints Waypath improv: Only %d gotos, aborting.",#waypath.coords)
			waypath=nil 
			for gi,goal in ipairs(step.goals) do goal.waypoint_moved_to_waypath=nil end
		end
		--]]

		--step.waypath=waypath
	end

	if waypath then
		local pathtype = waypath.loop and "farm" or "path"
		GQ:Debug("&waypoints Waypath present in step, showing %d points as '%s'. (calling ShowSet)",#waypath.coords,pathtype)
		if pathtype=="farm" then waypath.markers="none" end
		local pointset = GQ.Pointer:ShowSet(waypath,pathtype)
		--if not waypath.loop then  arrowpoint = pointset.points[1]  end  -- Pointer defaults to points[1] in GetNextInPath anyway.  Miiight not play nice with Travel, but this is a band-aid...
	else
		GQ:Debug("&waypoints Waypath NOT present in step.")
	end

	-- SHOW STEP WAYPOINTS.

	local pointed = false

	local points = {}  -- fill this with correct source material.

	if step.goals then
		if false --[[ never true! --]] then
			--[[
				if not goal.force_noway then
					points={goal}
					GQ.CurrentStep.current_waypoint_goal_num = goal.num
				end
			--]]
			--print("goal: "..goal:GetText())
		else
			local canhidetravel=false
			--if not self.db.profile.showinlinetravel then for i,goal in ipairs(step.goals) do if not goal:IsInlineTravel() then canhidetravel=true break end end end
			for i,goal in ipairs(step.goals) do
				if goal.x and goal:IsVisible() and (not goal.force_noway) and (not (canhidetravel and goal:IsInlineTravel())) and (not goal.waypoint_moved_to_waypath) and (goal.action~="mapmarker") then
					if goal.parentStep.is_poi then
						goal.waypoint_icon = GQ.Pointer.Icons.graydot
					else
						if GQ.db.profile.nav_finaldest_circle==1 then goal.waypoint_icon = GQ.Pointer.Icons.greendotbig
						elseif GQ.db.profile.nav_finaldest_circle==2 then goal.waypoint_icon = GQ.Pointer.Icons.crosshair
						else goal.waypoint_icon = nil
						end
					end
					GQ:Debug("&waypoints Goal %d added.",i)
					tinsert(points,goal)
				else
					GQ:Debug("&waypoints Goal %d not added.",i)
				end
				if goal.ways then
					GQ:Debug("&waypoints Goal %d has %d ways, adding those.",i,#goal.ways)
					for j,way in ipairs(goal.ways) do
						tinsert(points,way)
					end
				end
			end
		end
	else
		GQ:Debug("&waypoints No goals in step!?")
	end

	-- if any points are present (that is: haven't been removed to waypath), show them as regular markers.
	if points and #points>0 then
		local goal=nil --TODO: what was this?
		GQ:Debug("&waypoints Showing %s: (#points=|cffffaadd%d|r, waypath |cffffaadd%s|r, Pointer.DestinationWaypoint=|cffffaadd%s|r)", goal and "goal" or "step goals",  #points, waypath and "PRESENT" or "absent", tostring(GQ.Pointer.DestinationWaypoint))
		arrowpoint,farmpoint = GQ.Pointer.set_waypoints(points,35,30,"way")
	else
		GQ:Debug("&waypoints No step points (left) to show.")
	end
	-- regardless of points and waypaths, try to point towards "current" goal.
	if (waypath or (points and #points>0)) and step.current_waypoint_goal_num then
		local cwgn = step.current_waypoint_goal_num
		--[[
		-- make sure the point is still visible!
		while not step.goals[cwgn] or not step.goals[cwgn]:IsVisible() do
			cwgn = cwgn + 1
		end
		--]]
		if not step.goals[cwgn]:IsVisible() then GQ.CurrentStep:CycleWaypoint(nil,"no cycle","current invisible in waypoints") end
		
		arrowpoint=GQ.Pointer:GetWaypointByGoal(step.goals[step.current_waypoint_goal_num])
		GQ:Debug("&waypoints Arrowpoint set to cwgn = |cffffaadd%d|r",step.current_waypoint_goal_num)
	else
	end

	-- Waypoints are set.

	-- NOW, POINT THE ARROW / PLOT THE PATH.

	-- Wait. If player is dead, point there instead.
	--[[ -- or not, it breaks dead navigation
	if self.Pointer.corpsearrow or self.Pointer:IsCorpseArrowNeeded() then
		self:Debug("&waypoints ShowWaypoints: we have a corpse!.")
		GQ.Pointer:FindCorpseArrow(true)
		break --------------------------------------------------------------------------------
	end
	--]]

	if GQ.Pointer.SavedPointsLoaded and GQ.db.char.pointsetsmanual[1] then
		arrowpoint = GQ.db.char.pointsetsmanual[1]
	end

	GQ:Debug("&waypoints Point the arrow! arrowpoint %s, farmpoint %s, waypath %s",GQ.Pointer.waypoint_tostring_color(arrowpoint),GQ.Pointer.waypoint_tostring_color(farmpoint),waypath and (#waypath.coords>0) and (#waypath.coords.." points") or "empty")

	if arrowpoint and WorldMapFrame:IsShown() then 
		if GQ.WorldQuests and (GQ.WorldQuests.PreventMapSwitch or 0 > 0) then
			GQ.WorldQuests.PreventMapSwitch = GQ.WorldQuests.PreventMapSwitch - 1
		elseif not UnitOnTaxi("player") and GQ.db.profile.autoswitchmap then
			if WorldMapFrame.HandleUserActionOpenSelf then
				OpenWorldMap(arrowpoint.m)
			else
				if not InCombatLockdown then ShowUIPanel(WorldMapFrame) end
				WorldMapFrame:SetMapID(arrowpoint.m);
			end
		end
	end

	if GQ.db.profile.pathfinding then
		last_waypath = waypath
		local waypath_poi = nil --TODO: shouldn't this be set to something?
		last_waypath_poi = waypath_poi
		if GQ.Pointer.nummanual>0 then
			-- leave it the hell alone.
			GQ:Debug("&waypoints Finding path to: Pointer.DestinationWaypoint (there are manual points)")
			GQ.Pointer:FindTravelPath(GQ.Pointer.DestinationWaypoint)
		elseif arrowpoint then
			if step.travelcfg then
				for i,v in pairs(step.travelcfg) do
					LibRover.cfgNodeStepOverride[i]=v
				end
			end
			
			GQ:Debug("&waypoints Finding path to: arrowpoint")
			GQ.Pointer:FindTravelPath(arrowpoint)
		elseif (waypath or waypath_poi) and not pointed and GQ.Pointer.nummanual==0 then
			-- setup step specific overrides
			if step.travelcfg then
				for i,v in pairs(step.travelcfg) do
					LibRover.cfgNodeStepOverride[i]=v
				end
			end

			GQ:Debug("&waypoints Finding path to: waypath")
			-- TRY TO POINT TO A FARM PATH.
			-- find center of farm path and point there
			-- BAD.
			if waypath then
				if waypath.loop then
					-- EXPERIMENTAL: travel to path's general area.
					local _,_,currentmapid = LibRover:GetPlayerPosition()
					local currentmapfloor = LibRover:GetFloorByMapID(currentmapid)
					if currentmapid ~= waypath.coords[1].map or currentmapfloor ~= waypath.coords[1].floor then
						self:Debug("&waypoints Pointing to a looped path! We're not in the farm path's zone, let's travel.")
						GQ.Pointer:FindTravelPath("farm")
					else
						-- otherwise we are there, stick to strick
						self:Debug("&waypoints Pointing to a looped path! We're in the farm path's zone. Clearing travel, just follow the route.")
						LibRover:Abort("waypoints loop")
						GQ.Pointer:ClearSet("route")
						local nextway = GQ.Pointer:PointToNextInPath("farm")  -- it's looped, so it's a farm, OK
						
						-- but are we close enough?
						if nextway then
							local px,py,pm = GQ.LibRover:GetPlayerPosition()
							local dist = GQ.HBD:GetZoneDistance(pm,px,py,nextway.m,nextway.x,nextway.y) or 9999
							if dist > 500 then
								-- too far, use proper routing
								GQ.Pointer:FindTravelPath(nextway)
							end
						end
					end
					break -------------------------------------------------------------------------------
				end

				local firstcoord = waypath.coords[1]
				local _,_,currentmapid=LibRover:GetPlayerPosition()
				if firstcoord and not firstcoord.force_noway then
					if currentmapid~=firstcoord.map then
						self:Debug("&waypoints Pointing to a path! We're not in the path's zone, let's travel to the first point.")

						local way = GQ.Pointer:SetWaypoint(firstcoord.map,firstcoord.x,firstcoord.y,{icon=GQ.Pointer.Icons.none})
						if way then GQ.Pointer:FindTravelPath(way) end
					else
						self:Debug("&waypoints Pointing to a path! We're in the path's zone. Clearing travel, just follow the route.")
						LibRover:Abort("waypoints noloop")
						GQ.Pointer:ClearSet("route")
						GQ.Pointer:PointToNextInPath("path")  -- it's not looped, handle it somehow.
						-- ^ POSSIBLY change to waypath, because... why is it "path" now anyway? Seems like a bug, but won't regress into it now. ~~ 2022-01-24 sinus
					end
				else
					self:Debug("&waypoints Pointing to a path NOT! First point is noway'ed.")
					LibRover:Abort("waypoints noloop")
					GQ.Pointer:ClearSet("route")
				end
			end
		elseif not step:IsDynamic() then 
			GQ:Debug("&waypoints Aborting, because no manuals and no arrowpoint and no waypath conditions: waypath %s, waypath_poi %s, pointed %s",waypath,waypath_poi,pointed)
			LibRover:Abort("waypoints")
			GQ.Pointer.PathFoundHandler("failure")
		end
	else
		self.Pointer:FindTravelPath (arrowpoint)
	end

	if step.WorldQuestQueueRouter then
		GQ.WorldQuests:QueueProcess()
	end

	if arrowpoint and not UnitIsDeadOrGhost("player")
	and not self.Pointer.ArrowFrame.waypoint
	then
		-- don't overwrite the stinking arrow
		self:Debug("&waypoints Pointing to arrowpoint... again?")
		self.Pointer:ShowArrow (arrowpoint)
	else
	end

	until true
	self:Debug("&waypoints &_POP ShowWaypoints ends [%.2f ms]",debugprofilestop()-t1)
end