"""Exercise GoatQuest branding and disabled viewer controls without a WoW client."""
from pathlib import Path
import os
import re
import sys
import xml.etree.ElementTree as ET

sys.path.insert(0, str(Path(os.environ.get("TEMP", ".")) / "goatquest-lua-tests"))
from lupa.lua51 import LuaRuntime

ROOT = Path(__file__).resolve().parents[1]
viewer = (ROOT / "Skins/Default/ViewerFrame.lua").read_text()
skills = (ROOT / "Skills.lua").read_text()


def extract(source, name, local=False):
    prefix = "local " if local else ""
    pattern = r"^(?P<indent>[ \t]*)" + prefix + "function " + re.escape(name)
    match = re.search(pattern + r"\(.*?^(?P=indent)end[ \t]*$", source, re.M | re.S)
    assert match, f"Missing function: {name}"
    return match.group(0)


functions = [extract(viewer, "HookMenuMessages", local=True)]
for name in (
    "GQ_DefaultSkin_Frame_Mixin:ApplyGuideOnlyControls",
    "GQ_DefaultSkin_Frame_Mixin:OnShow",
    "GQ_DefaultSkin_Frame_Mixin:MenuSettingsButton_OnClick",
    "GQ_DefaultSkin_Frame_Mixin.GuideShareButton_OnClick",
    "GQ_DefaultSkin_Frame_Mixin.GuideShareButton_OnEnter",
    "GQ_DefaultSkin_Frame_Mixin.StepNum_OnMouseWheel",
):
    functions.append(extract(viewer, name))
functions.append(extract(skills, "Skills:ShowSkillPopup"))

lua = LuaRuntime(encoding=None, unpack_returned_tuples=True)
lua.globals()[b"root"] = str(ROOT).replace("\\", "/").encode()
lua.globals()[b"helpers"] = "\n".join(functions).encode()
viewer_xml = ET.fromstring((ROOT / "Skins/Default/ViewerFrame.xml").read_bytes())
wheel_handlers = [node.text for node in viewer_xml.iter()
                  if node.tag.endswith("OnMouseWheel") and node.text
                  and "StepNum_OnMouseWheel" in node.text]
assert len(wheel_handlers) == 1
lua.globals()[b"wheelSource"] = wheel_handlers[0].encode()
lua.execute(b'''
local originalCredit="Original copyright remains unchanged"
local originalRights="All Rights Reserved"
L=setmetatable({opt_about_desc2=originalCredit,opt_about_desc3=originalRights},
    {__index=function(_,key) return key end})
function GoatQuest_L() return L end
GQ={GuideOnly=true,IsForever=true,IsClassic=true,L=L,Font="OpenSans",name="GoatQuest",revision=1,
    db={profile={}},ButtonSets={TitleButtons={}},WhoWhere={Types={}},SendMessage=function() end,
    Frame_OnShow=function() end}
assert(loadfile(root.."/Compat/Identity.lua"))("GoatQuest",GQ)
assert(GoatQuest==GQ and L.name_plain=="GoatQuest")
assert(L.viewer_special_select:find("GoatQuest",1,true))
assert(L.opt_about_desc2==originalCredit and L.opt_about_desc3==originalRights)
assert(L.opt_tech_support:find("/goatquestdebug",1,true))
assert(L.opt_wipe_settings_desc:find("GoatQuest",1,true))

GQ_DefaultSkin_Frame_Mixin={}
Skills={}
assert(loadstring(helpers))()

local fontCreations=0
local function control()
    return {shown=true,Hide=function(self) self.shown=false end,
        Show=function(self) self.shown=true end,
        SetShown=function(self,show) self.shown=show end,
        SetText=function(self,text) self.text=text end,
        SetFont=function() end,SetPoint=function() end,SetTextColor=function() end}
end
local frame=setmetatable({Controls={GuideShareButton=control(),Logo=control(),TitleBar=control(),
    DevLabel=control(),PrevButton=control(),NextButton=control()}},{__index=GQ_DefaultSkin_Frame_Mixin})
frame.Controls.TitleBar.CreateFontString=function()
    fontCreations=fontCreations+1
    return control()
end
frame:ApplyGuideOnlyControls()
frame.Controls.GuideShareButton:Show() -- simulate a later show/skin refresh
frame.Controls.Logo:Show()
frame:OnShow()
assert(not frame.Controls.GuideShareButton.shown and not frame.Controls.Logo.shown)
assert(frame.GoatQuestTitle.text=="GoatQuest" and frame.GoatQuestTitle.shown and fontCreations==1)
assert(frame.Controls.PrevButton.shown and frame.Controls.NextButton.shown)
-- The optional Sync module is deliberately absent: stale callbacks must safely do nothing.
frame.GuideShareButton_OnClick(frame,"LeftButton")
frame.GuideShareButton_OnEnter(frame)

local menu
UIDropDownFork_separatorInfo={separator=true}
DropDownForkList1={IsShown=function() return false end,SetPoint=function() end}
function UIDropDownFork_SetAnchor() end
function EasyFork(items) menu=items end
GQ.Frame=frame
frame.Controls.MenuHostSettings={}
frame.Controls.MenuSettingsButton={}
local openedGuides,openedOptions=0,0
GQ.GuideMenu={Show=function() openedGuides=openedGuides+1 end}
function GQ:OpenOptions() openedOptions=openedOptions+1 end
frame:MenuSettingsButton_OnClick()
local byName={}
for _,item in ipairs(menu) do byName[item.text or "separator"]=item end
assert(not byName.menu_Startup and not byName.menu_ShowSkills)
assert(byName.menu_LockViewer and not byName.menu_EnableTransparency, "transparency went with the Starlight/Stealth glass skins")
assert(byName.pointer_arrowmenu_findnearest.menuList==GQ.WhoWhere.Types)
byName.menu_GuideMenu.func()
byName.menu_Settings.func()
assert(openedGuides==1 and openedOptions==1)

-- Old direct calls must not dereference the disabled trainer popup even with forceShow.
Skills:ShowSkillPopup(nil,nil,true)
GQ.GuideOnly=false
Skills:ShowSkillPopup(nil,nil,true) -- Forever still forbids the legacy trainer UI
frame:MenuSettingsButton_OnClick()
for _,item in ipairs(menu) do assert(item.text~=L.menu_ShowSkills) end
GQ.IsForever=false
Skills:ShowSkillPopup(nil,nil,true) -- absent popup is also safe before optional initialization

-- Positive controls preserve the optional behavior for a fully initialized legacy viewer.
local displayed=0
Skills.SkillsPopup={ClearAllPoints=function() end,SetPoint=function() end,
    DisplayEmpty=function() displayed=displayed+1 end}
-- Empty display uses the normal nil path; no training data is needed for this control.
function Skills:GetLearnableSkills() return nil end
Skills:ShowSkillPopup(nil,"legacy",true)
assert(displayed==1 and Skills.SkillsPopup.mode=="legacy")
frame:MenuSettingsButton_OnClick()
byName={}
for _,item in ipairs(menu) do byName[item.text or "separator"]=item end
assert(byName.menu_Startup and byName.menu_ShowSkills)
local shared=0
GQ.Sync={OnShareButtonClick=function() shared=shared+1 end,OnShareButtonEnter=function() shared=shared+1 end}
frame.GuideShareButton_OnClick(frame,"LeftButton")
frame.GuideShareButton_OnEnter(frame)
assert(shared==2)

-- Exercise the real XML callback, including its argument handoff to the step navigator.
local previous,nextStep,shift=0,0,false
function IsShiftKeyDown() return shift end
function GQ:Debug(format,...) string.format(format,...) end
function GQ:PreviousStep(fast,force) assert(fast==false and force==true) previous=previous+1 end
function GQ:SkipStep(fast,hack,force)
    assert(fast==false and hack==false and force==true)
    nextStep=nextStep+1
end
local mouseWheel=assert(loadstring("return function(self,delta) "..wheelSource.." end"))()
mouseWheel({},1)
mouseWheel({},-1)
assert(previous==1 and nextStep==1)
shift=true
mouseWheel({},1)
mouseWheel({},-1)
assert(previous==11 and nextStep==11)
print("PASS viewer cleanup: GoatQuest identity, hidden optional controls, safe callbacks; guides/navigation retained")
print("PASS step-number mousewheel: XML forwards delta; previous/next and Shift navigation work")
''')
