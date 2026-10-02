"""Verify startup and its UI refresh pause in lockdown, then resume normally."""
from pathlib import Path
import os
import sys

sys.path.insert(0, str(Path(os.environ.get("TEMP", ".")) / "goatquest-lua-tests"))
from lupa.lua51 import LuaRuntime

ROOT = Path(__file__).resolve().parents[1]
source = (ROOT / "GoatQuest.lua").read_text()
startup = "function GQ:StartupStep()" + source.split("function GQ:StartupStep()", 1)[1]
startup = startup.split("\nfunction GQ:LOADING_SCREEN_DISABLED()", 1)[0]

lua = LuaRuntime(encoding=None, unpack_returned_tuples=True)
lua.globals()[b"root"] = str(ROOT).replace("\\", "/").encode()
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
assert(loadfile(root.."/MasterFrame.lua"))("GoatQuest",GQ)
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

# Guide startup must work without loading a personal payload or an external engine.
beta = "function GQ:SetBeta(val)" + source.split("function GQ:SetBeta(val)", 1)[1]
beta = beta.split("\nend", 1)[0] + "\nend"
guides = LuaRuntime(encoding=None, unpack_returned_tuples=True)
guides.globals()[b"root"] = str(ROOT).replace("\\", "/").encode()
guides.globals()[b"betaSource"] = beta.encode()
guides.execute(b'''
tinsert=table.insert
C_QuestLog={IsQuestFlaggedCompleted=function() return false end}
StaticPopupDialogs={}
for _,retail in ipairs({false,true}) do
    local events={}
    GQ={IsRetail=retail,startups={},db={profile={}},
        L=setmetatable({},{__index=function(_,key) return key end})}
    function GQ:AddEventHandler(event,handler)
        assert(type(handler)=="function")
        events[event]=handler
    end
    assert(loadfile(root.."/Guide.lua"))("GoatQuest",GQ)
    local ran=false
    for _,startup in ipairs(GQ.startups) do
        if startup[1]=="Guide: registering events" then
            startup[2](GQ)
            ran=true
        end
    end
    assert(ran and events.PLAYER_XP_UPDATE and events.PLAYER_LEVEL_UP and events.LOADING_SCREEN_DISABLED)
    assert((events.NEUTRAL_FACTION_SELECT_RESULT~=nil)==retail)
    assert(GQ.Licence==nil and GQ.Licences==nil)

    assert(loadstring(betaSource))()
    GQ:SetBeta()
    assert(GQ.BETA==true)
    -- Stale data from an older install cannot expire installed beta content.
    GQ.Licences={DATE_E=0,DATE_S=0}
    GQ:SetBeta()
    assert(GQ.BETA==true)
    GQ.db.profile.debug_beta=false
    GQ:SetBeta()
    assert(GQ.BETA==false)
    GQ:SetBeta(true)
    assert(GQ.BETA==true)
    GQ.db.profile.debug_beta=true
    GQ:SetBeta(false)
    assert(GQ.BETA==false)
    GQ:SetBeta()
    assert(GQ.BETA==true)
end
print("PASS guide startup without license data/engine; beta defaults and explicit overrides")
''')
