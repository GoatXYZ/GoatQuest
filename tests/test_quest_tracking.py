"""Exercise real quest tracking functions against modern and legacy API fixtures."""
import os
from pathlib import Path
import sys

sys.path.insert(0, str(Path(os.environ.get("TEMP", ".")) / "goatquest-lua-tests"))
from lupa.lua51 import LuaRuntime

ROOT = Path(__file__).resolve().parents[1]


def run_tests():
    lua = LuaRuntime(encoding=None, unpack_returned_tuples=True)
    core = (ROOT / "GoatQuest.lua").read_text(encoding="utf-8-sig")
    begin = core.index("function GQ:TrackQuest(id)")
    end = core.index("\nfunction GQ:PointToQuest", begin)
    lua.globals()[b"trackSource"] = core[begin:end].encode()

    tracking = (ROOT / "QuestTracking.lua").read_text(encoding="utf-8-sig")
    begin = tracking.index("function GQ.QuestTracking_hook_SetAbandonQuest()")
    end = tracking.index("\nfunction GQ:MarkUselessQuests()", begin)
    lua.globals()[b"abandonSource"] = tracking[begin:end].encode()

    anchor = core.index("text = L['qmenu_quest_watched']")
    begin = core.rindex("tinsert(menu,{", 0, anchor)
    end = core.index("})", core.index("isNotRadio=true", anchor)) + 2
    lua.globals()[b"menuSource"] = core[begin:end].encode()

    lua.execute(b'''
    local function newViewer()
        local z={IsRetail=false,IsForever=true,questsbyid={
            [102]={id=102,index=3,inlog=true},[103]={id=103,index=5,inlog=false},
        }}
        assert(loadstring("local GQ=...; "..trackSource))(z)
        assert(loadstring("local GQ=...; "..abandonSource))(z)
        return z
    end
    local watched,added,tracked,icons=nil,{},nil,0
    GetCVar=function(name) assert(name=="autoQuestWatch") return "1" end
    C_QuestLog={
        GetQuestWatchType=function(id) assert(id==102) return watched end,
        AddQuestWatch=function(id,...)
            assert(id==102 and select("#",...)==0, "modern watch expects quest ID")
            added[#added+1]=id
        end,
    }
    C_SuperTrack={SetSuperTrackedQuestID=function(id) tracked=id end}
    IsQuestWatched,AddQuestWatch,SetSuperTrackedQuestID=nil,nil,nil
    QuestPOIUpdateIcons=function() icons=icons+1 end
    local z=newViewer()
    z:TrackQuest(102)
    assert(#added==1 and tracked==102 and icons==1)
    watched=0 -- Manual watch enum: zero is a valid watched state in Lua.
    z:TrackQuest(102)
    assert(#added==1 and icons==2)
    tracked=nil
    z:TrackQuest(103); z:TrackQuest(999)
    assert(#added==1 and not tracked and icons==2)
    GetCVar=function() return "0" end
    z:TrackQuest(102)
    assert(not tracked and #added==1)
    GetCVar=function() return "1" end
    z.IsClassicCATA=true; z:TrackQuest(102); z.IsClassicCATA=false
    z.IsClassicMOP=true; z:TrackQuest(102); z.IsClassicMOP=false
    assert(not tracked)

    -- Watching still succeeds when optional tracking/icon APIs are absent.
    C_SuperTrack,QuestPOIUpdateIcons=nil,nil
    watched=nil
    z:TrackQuest(102)
    assert(#added==2)

    -- Older clients use log indices for watches, quest IDs for super-tracking.
    C_QuestLog=nil
    local legacyAdds,updates=0,0
    IsQuestWatched=function(index) assert(index==3) return false end
    AddQuestWatch=function(index) assert(index==3) legacyAdds=legacyAdds+1 end
    WatchFrame_Update=function() updates=updates+1 end
    SetSuperTrackedQuestID=function(id) tracked=id end
    z.IsForever=false
    z:TrackQuest(102)
    assert(legacyAdds==1 and updates==1 and tracked==102)
    IsQuestWatched,AddQuestWatch,SetSuperTrackedQuestID=nil,nil,nil
    z:TrackQuest(102) -- Missing optional APIs must not break guide activation.
    print("PASS TrackQuest: Forever quest IDs, existing watches, disabled tracking, legacy indices, missing optional APIs")

    local selected=102
    C_QuestLog={GetSelectedQuest=function() return selected end}
    z.IsForever=true
    z.quests={{id=102,index=3}}
    z.QuestTracking_hook_SetAbandonQuest()
    z.QuestTracking_hook_AbandonQuest()
    assert(z.recentAbandonedQuestID==102)
    selected=0; z.QuestTracking_hook_SetAbandonQuest(); z.QuestTracking_hook_AbandonQuest()
    assert(z.recentAbandonedQuestID==nil)
    selected=nil; z.QuestTracking_hook_SetAbandonQuest()
    assert(z.recentAbandonedQuestID_proto==nil)
    z.IsForever=false
    GetQuestLogSelection=function() return 3 end
    z.QuestTracking_hook_SetAbandonQuest()
    assert(z.recentAbandonedQuestID_proto==102)
    GetQuestLogSelection=function() return 9 end
    z.QuestTracking_hook_SetAbandonQuest()
    assert(z.recentAbandonedQuestID_proto==nil, "clear abandoned ID when no quest matches")
    print("PASS abandonment: modern quest IDs, legacy indices, stale state cleared")

    local watched=true
    local added,removed=0,0
    local watchCount=0
    C_QuestLog={
        GetQuestWatchType=function(id) assert(id==102) return watched end,
        RemoveQuestWatch=function(id) assert(id==102) removed=removed+1 watched=nil end,
        AddQuestWatch=function(id,...) assert(id==102 and select("#",...)==0) added=added+1 watched=true end,
        GetNumQuestWatches=function() return watchCount end,
    }
    Constants={QuestWatchConsts={MAX_QUEST_WATCHES=25}}
    tinsert=table.insert
    local menu={}
    local labels=setmetatable({},{__index=function(_,key) return key end})
    assert(loadstring("local menu,L,goal=...; "..menuSource))(menu,labels,{quest={id=102}})
    assert(menu[1].checked())
    menu[1].func(); assert(removed==1 and not watched)
    menu[1].func(); assert(added==1 and watched)
    watched=nil; watchCount=25
    menu[1].func(); assert(added==1)
    print("PASS quest menu: tracking can be removed/re-added and watch limit is respected")
    ''')


if __name__ == "__main__":
    run_tests()
