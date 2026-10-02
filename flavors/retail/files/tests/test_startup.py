"""Verify startup and its UI refresh pause in lockdown, then resume normally."""
from pathlib import Path
import sys

sys.path.insert(0, str(Path(__file__).resolve().parent))
from gqtest import function_source, lua_runtime, read  # noqa: E402

source = read("GoatQuest.lua")
startup = "function GQ:StartupStep()" + source.split("function GQ:StartupStep()", 1)[1]
startup = startup.split("\nfunction GQ:LOADING_SCREEN_DISABLED()", 1)[0]

lua = lua_runtime()
lua.globals()[b"startupSource"] = startup.encode()
lua.execute(b'''
local frameTime,profileTime,locked=0,0,true
local created,resumed,updates,phases=0,0,0,0
local startupUpdatesRemoved=0
local create=coroutine.create
coroutine.create=function(func) created=created+1 return create(func) end
function GetTime() return frameTime end
function debugprofilestop() profileTime=profileTime+0.01 return profileTime end
function GetFramerate() return 60 end
function UnitExists() return true end
function InCombatLockdown() return locked end
GoatQuestFrameMaster={SetScript=function(_,event,handler)
    assert(event=="OnUpdate" and handler==nil)
    startupUpdatesRemoved=startupUpdatesRemoved+1
end}
GQ={
    loading=true,STARTUP_INTENSITY=20,db={profile={},char={maint_dostartup=true}},
    startuptimes={},timestamp_initing=0,timestamp_loaded=0,
    Debug=function() end, Print=function() end,
    UpdateFrame=function() assert(not locked) updates=updates+1 end,
}

function testResume(...)
    assert(not locked,"startup resumed during combat")
    resumed=resumed+1
    return coroutine.resume(...)
end
function testStartupThread()
    phases=phases+1
    coroutine.yield("waiting for next test frame")
    phases=phases+1
    coroutine.yield("waiting for next test frame")
    phases=phases+1
    return "end"
end
-- Supply the same closure state the production function uses; only startup work is mocked.
assert(loadstring([[
local thread
local startup_time,startup_frames,startup_ticks=0,0,0
local last_gettime
local lastret,lastrettime,lastprogress=0,0,-1
local STARTUP_SPAM_FREQUENCY=10
local max,status,resume=math.max,coroutine.status,testResume
local _StartupThread=testStartupThread
]]..startupSource))()
assert(loadfile(root.."/MasterFrame.lua"))(addon,GQ)
local function frame()
    frameTime=frameTime+0.1
    GoatQuestFrameMaster_OnUpdate({},0.1)
end

-- Initial lockdown: neither allocate/resume the coroutine nor refresh the UI.
assert(GQ:StartupStep()==false)
frame()
frame()
assert(created==0 and resumed==0 and updates==0 and phases==0)

locked=false
frame() -- existing startup waits for GetTime to advance
frame() -- create the coroutine
assert(created==1 and resumed==0 and updates==2)

-- Enter combat after creation, before the first resume.
locked=true
frame()
assert(created==1 and resumed==0 and updates==2)
locked=false
frame()
assert(created==1 and resumed==1 and phases==1 and updates==3)

-- Enter combat while the existing coroutine is suspended in a startup module.
locked=true
frame()
frame()
assert(created==1 and resumed==1 and phases==1 and updates==3)
locked=false
frame()
assert(created==1 and resumed==2 and phases==2 and updates==4)
frame()
assert(created==1 and resumed==3 and phases==3 and updates==5)
assert(GQ.initialized and GQ.loading==nil and startupUpdatesRemoved==1)
frame()
assert(resumed==3 and updates==5) -- master startup handler is now inactive
print("PASS startup: initial/mid-startup combat pauses coroutine and UI; same coroutine completes afterward")
''')

# Guide startup on Retail: the stock key check runs, and beta content follows the licence dates.
functions = read("Functions.lua")
licence = functions[functions.index("GQ.Licence = {}"):functions.index("function GQ.Licence:CheckExpirationPopup()")]
guides = lua_runtime()
guides.globals()[b"betaSource"] = function_source(source, "GQ:SetBeta").encode()
guides.globals()[b"licenceSource"] = licence.encode()
guides.execute(b'''
tinsert=table.insert
local now=1000000
time=function() return now end
C_QuestLog={IsQuestFlaggedCompleted=function() return false end}
StaticPopupDialogs={}
local events={}
GQ={IsRetail=true,startups={},db={profile={}},
    L=setmetatable({},{__index=function(_,key) return key end})}
function GQ:AddEventHandler(event,handler)
    assert(type(handler)=="function")
    events[event]=handler
end
assert(loadstring("local GQ=...\\n"..licenceSource))(GQ)
assert(loadfile(root.."/Guide.lua"))(addon,GQ)
local ran=false
for _,startup in ipairs(GQ.startups) do
    if startup[1]=="Guide: registering events" then
        startup[2](GQ) -- includes the stock key check, which must not fail without a key engine
        ran=true
    end
end
assert(ran and events.PLAYER_XP_UPDATE and events.PLAYER_LEVEL_UP and events.LOADING_SCREEN_DISABLED)
assert(events.NEUTRAL_FACTION_SELECT_RESULT, "Retail registers the neutral-faction (Pandaren) event")
assert(GenericGoatQuestLicenceEngine==nil)
assert(GQ.Licence:VerifyKeyIntegrity(nil)==false and GQ.Licence:VerifyKeyIntegrity("synthetic")==false)
assert(GQ.Licence:VerifyKeyExpiration("synthetic")==false)

assert(loadstring(betaSource))()
GQ.Licences=nil
GQ:SetBeta()
assert(not GQ.BETA, "without licence data, beta guides stay off")
GQ.Licences={DATE_E=now+60,DATE_S=now+60}
GQ:SetBeta()
assert(GQ.BETA==true, "an active subscription date enables beta guides")
GQ.Licences={DATE_E=now-60,DATE_S=now+60}
GQ:SetBeta()
assert(GQ.BETA==false, "an expired subscription date disables beta guides")
GQ.db.profile.debug_beta=true
GQ:SetBeta()
assert(GQ.BETA==true)
GQ:SetBeta(false)
assert(GQ.BETA==false)
GQ.db.profile.debug_beta=nil
GQ:SetBeta(true)
assert(GQ.BETA==true)
''')
print("PASS guide startup: Retail events, stock key check without an engine; beta follows synthetic licence dates and explicit overrides")
