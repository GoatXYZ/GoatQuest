local name,GQ=...

local data=GQ._NPCModels
assert(data,"NPCModels missing")
GQ._NPCModels=nil
GQ.NPCModels={}  setmetatable(GQ.NPCModels,{__index=function(t,k) if type(k)~='number' then return end local model=data:match('\n'..k..'=(%d+)') return tonumber(model) end})

GQ.ModelsToNPC={} setmetatable(GQ.ModelsToNPC, {
__index=function(t,id) 
	if type(id)~='number' then return end

	local npcid=data:match('\n(%d+)='..id.."\n") 
	return tonumber(npcid)
end})

function GQ.ModelsToNPCCounter(id,count)
	
	local start,_,endd=0,0,0;

	while(count >= 0 ) do
		start,endd=data:find("%d+="..id.."\n",endd) --start looking at the end of the last match.
		if not endd then return end --none found now.
		count = count-1
	end
		
	local npcid=data:match("(%d+)",start)

	return tonumber(npcid)
end