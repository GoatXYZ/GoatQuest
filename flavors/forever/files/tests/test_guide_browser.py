"""Exercise the actual Lua guide-browser routing, filtering, selection, and scale."""
from pathlib import Path
import os
import sys

sys.path.insert(0, str(Path(os.environ.get("TEMP", ".")) / "goatquest-lua-tests"))
from lupa.lua51 import LuaRuntime

ROOT = Path(__file__).resolve().parents[1]
lua = LuaRuntime(encoding=None, unpack_returned_tuples=True)
lua.globals()[b"root"] = str(ROOT).replace("\\", "/").encode()
core = (ROOT / "GoatQuest.lua").read_text(encoding="utf-8-sig")
start = core.index("local function split(str,sep)")
end = core.index("\nend", core.index("function GQ:SanitizeGuideTitle", start)) + len("\nend")
lua.globals()[b"groupSource"] = core[start:end].encode()
lua.execute(br'''
tinsert=table.insert
table.wipe=function(t) for key in pairs(t) do t[key]=nil end return t end
max,min=math.max,math.min
function UnitFactionGroup() return "Alliance" end
function UnitClass() return "Warrior" end
function CloseDropDownForks() end
function time() return 100 end
local function frame()
    return setmetatable({shown=false,text="",scripts={},points={}}, {__index=function(t,key)
        if key=="Show" then return function(self) self.shown=true end end
        if key=="Hide" then return function(self) self.shown=false end end
        if key=="SetShown" then return function(self,v) self.shown=v end end
        if key=="SetText" then return function(self,v) self.text=v end end
        if key=="GetText" then return function(self) return self.text end end
        if key=="SetScript" then return function(self,k,v) self.scripts[k]=v end end
        if key=="GetScript" then return function(self,k) return self.scripts[k] end end
        if key=="SetPoint" then return function(self,...) table.insert(self.points,{...}) end end
        if key=="ClearAllPoints" then return function(self) self.points={} end end
        return function() end
    end})
end
local icons={file="icons",cols=8,rows=4}
for _,name in ipairs({"LEVELING","DUNGEONS","PROFESSIONS","GOLD","EVENTS","FAVOURITES","Leveling Guides"}) do
    icons[name]={1,1,label=name}
end
GQ={GuideOnly=true,GuideCategories={LEVELING=true,DUNGEONS=true,PROFESSIONS=true},
    UI={SkinData=function() return {} end},F={HTMLColor=function() return 1,1,1,1 end},
    L=setmetatable({guidemenu_section_search_results="%d results",guidemenu_section_search_titleresults="%s: %d guide%s"},
        {__index=function(t,k) return k end}),startups={},IconSets={TabsIcons=icons},
    registered_groups={groups={},guides={}},QuestDB={},Widgets={HideAllPopups=function() end},
    db={profile={gmnumrecent=10},char={guides_history={},favourites={}}}}
assert(loadstring(groupSource))()
assert(GQ:SanitizeGuideTitle("GoatQuest's Alliance Leveling Guides\\Westfall (13-15)")=="LEVELING\\Westfall (13-15)")
assert(GQ:SanitizeGuideTitle("LEVELING\\Westfall (13-15)")=="LEVELING\\Westfall (13-15)")
assert(loadfile(root.."/GuideMenu.lua"))("GoatQuest",GQ)
assert(loadfile(root.."/GuideMenu-View.lua"))("GoatQuest",GQ)
local gm=GQ.GuideMenu
local realUpdate,realOpen,realHide=gm.Update,gm.Open,gm.HideRowMouseOver
function gm:Update() end -- Rendering is separately driven by WoW's frame runtime.
function gm:HideRowMouseOver() end
function gm:ShowGuideDetails(guide) self.displayed=guide end
function gm:ShowQuestDetails(quest) self.displayed=quest end
gm.Request=frame(); gm.Request.text=frame(); gm.Request.requestbtn=frame(); gm.Request.img=frame()
local main=frame()
gm.MainFrame=main
for section in pairs(gm.Sections.All) do main[section]=frame() end
main.MenuGuides.SearchEdit=frame()
main.MenuColumn.GuideButtons={GOLD=frame(),FAVOURITES=frame(),["Leveling Guides"]=frame()}
for _,button in pairs(main.MenuColumn.GuideButtons) do button:Show() end
main.Header={Tabs={}}
for _,name in ipairs({"GuideImage","GuideTitle","GuideDesc","GuideMascot","GuideProgressLabel","GuideProgress","GuideModel"}) do
    main.RightColumn[name]=frame()
end
main.CenterColumn.SectionInfo=frame()
main.CenterColumn.SectionInfo.Name=frame(); main.CenterColumn.SectionInfo.Texture=frame()
function gm:MakeMenuButton() return frame() end
local guideLookup={}
local function guide(title,hidden)
    local g={title=title,title_short=title:match("([^\\]+)$"),hidden=hidden,
        GetStatus=function() return "VALID" end,GetCompletion=function() return 0 end}
    guideLookup[title]=g
    return g
end
local westfall=guide("LEVELING\\Westfall (13-15)")
local hidden=guide("LEVELING\\Internal",true)
local wrongRace=guide("LEVELING\\Other Race"); wrongRace.condition_visible=function() return false end
local dungeon=guide("DUNGEONS\\Deadmines")
local profession=guide("PROFESSIONS\\Cooking")
local gold=guide("GOLD\\Mining routes")
local event=guide("EVENTS\\Harvest festival")
local hiddenFolder={name="Hidden Guides",fullpath="LEVELING\\Hidden Guides",groups={},guides={westfall}}
local emptyFolder={name="Unavailable",fullpath="LEVELING\\Unavailable",groups={},guides={hidden,wrongRace}}
local roots=GQ.registered_groups.groups
for _,data in ipairs({{"LEVELING",{westfall,hidden,wrongRace},{hiddenFolder,emptyFolder}},
    {"DUNGEONS",{dungeon}},{"EVENTS",{event}},{"GOLD",{gold}},{"PROFESSIONS",{profession}},
    {"Leveling Guides",{}}}) do
    table.insert(roots,{name=data[1],fullpath=data[1],guides=data[2],groups=data[3] or {}})
end
function GQ:GetGuideByTitle(title) return guideLookup[title] end
function GQ:SendMessage() error("browser must not create registered groups") end
function GQ:FindGuides() return {westfall,dungeon,profession,gold,event,hidden,wrongRace,hiddenFolder,emptyFolder} end
function GQ.QuestDB:GetQuestsByTitle()
    return {{questid=64,questtitle="Mixed quest",guides={{title=westfall.title},{title=gold.title}}},
        {questid=65,questtitle="Excluded quest",guides={{title=gold.title}}}}
end
function GQ.QuestDB:GetQuestName() return "Quest" end
function GQ.QuestDB:GetGuidesForQuest() return true,{[westfall.title]=3,[gold.title]=5,["GOLD\\Missing"]=1} end

-- Old display labels and removed sections route to a real category without mutation.
local initialCount=#roots
assert(gm:NormalizePath("Leveling Guides")=="LEVELING")
assert(gm:NormalizePath("Dungeon Guides")=="DUNGEONS")
assert(gm:NormalizePath("Profession Guides")=="PROFESSIONS")
assert(gm:NormalizePath("Leveling Guides\\Hidden Guides")=="LEVELING")
for _,path in ipairs({"Home","Featured","Favourites","Suggested","GOLD","EVENTS"}) do
    gm:Open(path)
    assert(gm.CurrentPath=="LEVELING" and gm.CurrentSection=="LEVELING")
end
gm.PreviousSection=nil; main.MenuGuides.SearchEdit:SetText("x"); gm:Open("Search")
assert(gm.CurrentPath=="LEVELING","short search without a previous section needs a safe fallback")
gm:ShowGuides("LEVELING\\Does not exist")
assert(gm.CurrentPath=="LEVELING" and #roots==initialCount)
gm:Open("LEVELING\\Does not exist")
assert(gm.CurrentSection=="LEVELING" and GQ.db.profile.gmlastsection=="LEVELING")
assert(#gm.Guides==1 and gm.Guides[1]==westfall,"hidden folders/guides must not appear")

-- Sidebar rebuilds hide stale buttons and preserve the registered order.
gm:PrepareGuidesMenuButtons()
local buttons=main.MenuColumn.GuideButtons
assert(buttons.LEVELING.shown and buttons.DUNGEONS.shown and buttons.PROFESSIONS.shown)
assert(not buttons.GOLD.shown and not buttons.FAVOURITES.shown and not buttons["Leveling Guides"].shown)
assert(not buttons.EVENTS)
assert(buttons.DUNGEONS.points[1][2]==buttons.LEVELING)
assert(buttons.PROFESSIONS.points[1][2]==buttons.DUNGEONS)
gm:PrepareGuidesMenuButtons()
assert(#buttons.DUNGEONS.points==1,"rebuild must reset existing anchors")

-- Search filters both guide results and quest-to-guide links.
main.MenuGuides.SearchEdit:SetText("quest")
gm:Search()
local titles,questCount={},0
for _,row in ipairs(gm.Guides) do
    if row.title then titles[row.title]=true end
    if row.questtitle then
        questCount=questCount+1
        assert(row.questid==64 and #row.guides==1 and row.guides[1].title==westfall.title)
    end
end
assert(titles[westfall.title] and titles[dungeon.title] and titles[profession.title])
assert(not titles[gold.title] and not titles[event.title] and not titles[hidden.title] and not titles[wrongRace.title])
assert(questCount==1)
gm:SearchQuest(64)
assert(gm.Guides[2]==westfall and westfall.QuestSearchStepNum==3 and #gm.Guides==2)

-- Recent/current views preserve saved data but only expose the selected categories.
local history={{gold.title,7},{westfall.title,4},{event.title,9},{profession.title,2}}
GQ.db.char.guides_history=history
gm:ShowRecent()
local shown={}
for _,row in ipairs(gm.Guides) do if row.title then shown[row.title]=true end end
assert(shown[westfall.title] and shown[profession.title] and not shown[gold.title] and not shown[event.title])
assert(#history==4 and history[1][1]==gold.title and history[3][2]==9)
GQ.CurrentGuide,GQ.CurrentGuideName=gold,gold.title
gm:ShowCurrent(); assert(gm.CurrentPath=="LEVELING")
GQ.CurrentGuide,GQ.CurrentGuideName=westfall,westfall.title
gm:ShowCurrent(); assert(gm.FocusedGuide==westfall and gm.displayed==westfall)

-- No results show useful local help, not an unavailable request workflow.
function GQ:FindGuides() return {} end
function GQ.QuestDB:GetQuestsByTitle() return {} end
gm:Search()
assert(gm.Request.shown and gm.Request.text.text:find("No guides found",1,true))
assert(not gm.Request.requestbtn.shown and not gm.Request.img.shown)
GQ.db.char.guides_history={}; gm:ShowRecent()
assert(gm.Request.text.text:find("recently opened",1,true))

-- Quest rows can be pinned and unpinned, and pinned details survive mouse leave.
local quest={questid=64,questtitle="Quest"}
gm:SetFocusedRow({quest=quest})
assert(gm.FocusedQuest==quest and gm.FocusedGuide==nil)
realHide(gm,nil,false)
assert(gm.displayed==quest)
gm:SetFocusedRow({quest=quest}); assert(gm.FocusedQuest==nil)
realHide(gm,nil,false)
assert(main.RightColumn.GuideTitle.text=="Choose a guide" and main.RightColumn.GuideTitle.shown)
assert(not main.RightColumn.GuideMascot.shown)

-- Fit the existing layout into effective UI dimensions without upscaling or moving it.
local width,height=700,500
UIParent={GetWidth=function() return width end,GetHeight=function() return height end}
main.GetWidth=function() return 825 end; main.GetHeight=function() return 630 end
main.SetScale=function(self,value) self.scale=value end
gm:FitToScreen()
assert(main.scale<1 and 825*main.scale<=width-32 and 630*main.scale<=height-32)
width,height=1920,1080; gm:FitToScreen(); assert(main.scale==1)
print("PASS guide browser: canonical routes; three-category sidebar/search/recent/current; hidden content; preserved history; empty/quest states; screen fit")
''')
