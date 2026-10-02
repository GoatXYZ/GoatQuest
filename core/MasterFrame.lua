local name,GQ = ...

-- GLOBAL GoatQuestFrameMaster_OnUpdate

function GoatQuestFrameMaster_OnUpdate(self,elapsed)
	if GQ.loading and GQ.db and GQ.db.char.maint_dostartup then
		if GQ:StartupStep() ~= false then
			GQ:UpdateFrame(true)
		end
	end
end

function GoatQuestFrameMaster_OnLoad(self)
	GQ.MasterFrame = self
end