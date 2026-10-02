local name,GQ = ...

local Config = {}
GQ.Config = Config

function Config:Run()
	local profiles = GQ.db.profiles

	if not GQ.db.profile.usernamed then 
	-- we are not using goatquest profile, find default or create new one

		local default_found=false
		for profilename,profile in pairs(profiles) do
			if profile.is_default then
				GQ.db:SetProfile(profilename)
				default_found=true
				GQ.db.char.profile_selected=true
				--[[
				for page,pdata in pairs(GQ.optiontables) do
					if pdata.args then for field,fdata in pairs(pdata.args) do
						local newval = GQ.db.profile[fdata]
						if newval and type(fdata.set)=="function" then
							if fdata.type=="color" then
								--field.set({k},newval.r,newval.g,newval.b,newval.a) -- TODO: rework? what's k?
							else
								--field.set({k},newval)
							end
						end
					end end
				end
				GQ:Print("Enabled default profile: "..profilename)
				--]]
				break
			end
		end
		if not default_found then
			local profilename = GetUnitName("player") or "Default"
			GQ.db:SetProfile(profilename)
			GQ:Options_RegisterDefaults()
			GQ.db.profile.usernamed = true
		end
	end

	-- clean up generic ace profiles
	local skip_fields={profile_current=true,dispprimary=true,debug_flags=true}
	for profile,profiledata in pairs(GQ.db.profiles) do
			if not profiledata.usernamed then
			local profile_is_default=true
			for key,val in pairs(profiledata) do
				if not skip_fields[key] and GQ.db.defaults.profile[key] and val~=GQ.db.defaults.profile[key] then
					profile_is_default=false
					break
				end
			end
			if profile_is_default then
				GQ.db:DeleteProfile(profile)
			end
		end
	end

	if GQ.db.profile.ranconfig2 then GQ.db.global.saw_tutorial=true end

	--[[
	if not GQ.db.global.saw_tutorial then
		GQ.Tutorial:Run()
		GQ.db.global.saw_tutorial=true
	end
	--]]
end