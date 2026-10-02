"""The GoatQuest skin: one style and one arrow skin, legacy ids resolving to
them, and the flat AceGUI widgets used by the settings menu.

    py -3 tests/test_goatquest_skin.py
"""
from pathlib import Path
import os
import re
import sys
import xml.etree.ElementTree as ET

sys.path.insert(0, str(Path(os.environ.get("TEMP", ".")) / "goatquest-lua-tests"))
from lupa.lua51 import LuaRuntime

ROOT = Path(__file__).resolve().parents[1]


def scripts(xml_path):
    tree = ET.fromstring((ROOT / xml_path).read_bytes())
    return [e.get("file") for e in tree.iter() if e.tag.split("}")[-1] in {"Script", "Include"} and e.get("file")]


# Load order: the GoatQuest style and arrow skin only.
assert scripts("Skins/Default/Skin.xml") == ["ViewerFrame.lua", "ViewerFrame.xml", "Skin.lua", "GoatQuest\\Style.lua"]
arrow_scripts = [s for s in scripts("Arrows/Arrows.xml") if s.endswith("Arrow.lua")]
assert arrow_scripts == ["GoatQuest\\Arrow.lua"], arrow_scripts

# No code may load a texture from a removed skin directory.
removed = re.compile(r"(Skins|Arrows)[\\/]+(default[\\/]+)?(Starlight|Stealth|Midnight)", re.I)
offenders = []
for path in ROOT.rglob("*"):
    rel = path.relative_to(ROOT).as_posix()
    if not path.is_file() or path.suffix not in {".lua", ".xml"} or rel.startswith(("Guides-", ".git", "design/")):
        continue
    for number, line in enumerate(path.read_text(encoding="utf-8", errors="replace").splitlines(), 1):
        if removed.search(line):
            offenders.append(f"{rel}:{number}: {line.strip()}")
assert not offenders, "\n".join(offenders)

lua = LuaRuntime(encoding=None, unpack_returned_tuples=True)
lua.globals()[b"root"] = str(ROOT).replace("\\", "/").encode()
pointer = (ROOT / "Pointer.lua").read_text(encoding="utf-8")
start = pointer.index("Pointer.ArrowSkins = {}")
end = pointer.index("function Pointer:UpdateArrowVisibility")
lua.globals()[b"pointerArrowSkins"] = pointer[start:end].encode()
lua.execute(br'''
assert(loadfile(root.."/tests/wowmock.lua"))()
local Mock = WoWMock
local Frame, Texture, FontString = Mock.Frame, Mock.Texture, Mock.FontString
local noop = function() end

-- Enough of the widget API for the AceGUI widgets: unknown API methods (by verb) do nothing.
local Region = getmetatable(Frame).__index
local verbs = {"Set","Get","Enable","Disable","Lock","Unlock","Clear","Highlight","Insert","Is","Has","Register","Unregister"}
setmetatable(Frame,{__index=function(_,k)
	local v = Region[k] if v~=nil then return v end
	if type(k)=="string" then for _,verb in ipairs(verbs) do if k:find("^"..verb.."%u") then return noop end end end
end})
function Frame:SetBackdrop(b) self.backdrop = b end
function Frame:GetName() return self.name end
function Frame:GetChildren()
	local frames = {}
	for _,c in ipairs(self.children) do if c.RunScript then frames[#frames+1] = c end end
	return unpack(frames)
end
function Frame:SetBackdropColor(...) self.backdropColor = {...} end
function Frame:SetBackdropBorderColor(...) self.backdropBorderColor = {...} end
function Frame:GetFontString() self.fs = self.fs or self:CreateFontString() return self.fs end
function Frame:SetText(t) self:GetFontString():SetText(t) end
function Frame:GetText() return self:GetFontString():GetText() end
function Frame:SetNormalFontObject(f) self.normalFont = f end
function Frame:SetHighlightFontObject(f) self.highlightFont = f end
function Frame:SetDisabledFontObject(f) self.disabledFont = f end
for _,kind in ipairs({"Normal","Pushed","Disabled","Highlight"}) do
	local key = kind:lower().."Tex"
	Frame["Set"..kind.."Texture"] = function(self,path)
		if path==nil then self[key] = nil return end
		self[key] = self[key] or self:CreateTexture()
		self[key]:SetTexture(path)
	end
	Frame["Get"..kind.."Texture"] = function(self) return self[key] end
end
function Frame:CreateAnimationGroup()
	local group = {Play=noop,Stop=noop,SetLooping=noop}
	function group:CreateAnimation() return {SetScale=noop,SetDuration=noop,SetSmoothing=noop,SetRadians=noop} end
	return group
end
function Frame:SetThumbTexture(p) self.thumb = self.thumb or self:CreateTexture() self.thumb:SetTexture(p) end
function Frame:GetThumbTexture() return self.thumb end
function Frame:SetTextInsets(...) self.insets = {...} end
function Frame:HasFocus() return false end
function Frame:SetTextColor(...) self.textcolor = {...} end
function Frame:GetValue() return self.value or 0 end
function Frame:SetValue(v) self.value = v end
function Frame:IsEnabled() return self.enabled~=false end
function FontString:SetFontObject(f) self.fontObject = f if f then self.textcolor = {f:GetTextColor()} end end
function FontString:GetFontObject() return self.fontObject end
local baseFontString = Frame.CreateFontString
function Frame:CreateFontString(name,layer,template)
	local fs = baseFontString(self,name,layer,template)
	fs.fontObject = template and _G[template]
	return fs
end
function Texture:SetSize(w,h) self.width,self.height = w,h end
Texture.CreateAnimationGroup = function(...) return Frame.CreateAnimationGroup(...) end

local baseCreate = CreateFrame
local anonymous = 0
function CreateFrame(kind,name,parent,template)
	if type(name)~="string" then name = nil end -- the client ignores a non-string name
	if not name and template and template:find("UIDropDownForkTemplate") then
		anonymous = anonymous+1
		name = "MockDropDown"..anonymous
	end
	local f = baseCreate(kind,name,parent,template)
	f.name = name
	template = template or ""
	local function three(prefix)
		for _,k in ipairs({"Left","Middle","Right"}) do f[k] = f:CreateTexture(prefix and prefix..k) end
	end
	if template:find("UIPanelButtonTemplate") or template:find("InputBoxTemplate") then three() end
	if template:find("UIPanelButtonTemplate") then f:SetHighlightTexture("highlight") end
	if template:find("GQ_DefaultSkin_TitleButton_Template") then
		f.ApplySkin = function(self) GQ.ButtonSets.TitleButtons[self.buttonkey]:AssignToButton(self) end
	end
	if template:find("UIDropDownForkTemplate") then
		three(name)
		f.Text = f:CreateFontString(name.."Text")
		local b = baseCreate("Button",name.."Button",f)
		f.Button = b
		for _,k in ipairs({"Normal","Pushed","Disabled","Highlight"}) do b[k.."Texture"] = b:CreateTexture(name.."Button"..k.."Texture") end
	end
	if template:find("UIPanelScrollBarTemplate") then
		f.ScrollUpButton = baseCreate("Button",nil,f)
		f.ScrollDownButton = baseCreate("Button",nil,f)
		f.ThumbTexture = f:CreateTexture()
		f.thumb = f.ThumbTexture
	end
	if template:find("UIPanelScrollFrameTemplate") then
		f.ScrollBar = CreateFrame("Slider",name.."ScrollBar",f,"UIPanelScrollBarTemplate")
	end
	return f
end

local Font = {}
Font.__index = Font
function Font:SetFont(path,size,flags) self.font = {path,size,flags} end
function Font:GetFont() return unpack(self.font or {}) end
function Font:SetTextColor(r,g,b,a) self.color = {r,g,b,a or 1} end
function Font:GetTextColor() local c = self.color or {1,1,1,1} return c[1],c[2],c[3],c[4] end
function CreateFont(name) local f = setmetatable({name=name},Font) if name then _G[name] = f end return f end
for _,name in ipairs({"GameFontNormal","GameFontNormalSmall","GameFontHighlight","GameFontHighlightSmall","GameFontHighlightLarge","ChatFontNormal"}) do CreateFont(name) end
GameFontNormal:SetTextColor(1,0.82,0)
GameFontNormal:SetFont("frizqt.ttf",12)
PlaySound = noop
ChatEdit_InsertLink = noop
C_Spell = {}
OKAY, ACCEPT, CLOSE = "Okay", "Accept", "Close"
local lua_errors = {}
function geterrorhandler() return function(e) table.insert(lua_errors,e) end end
-- WoW's xpcall passes extra arguments on to the function; plain Lua 5.1 does not.
local xpcall51 = xpcall
function xpcall(f,handler,...)
	local n,args = select("#",...),{...}
	return xpcall51(function() return f(unpack(args,1,n)) end,handler)
end

-- GoatQuest: UI helpers, skins, the one style.
GQ = {DIR="Interface\\AddOns\\GoatQuest", SKINSDIR="Interface\\AddOns\\GoatQuest\\Skins\\",
	Font="archivo.ttf", FontBold="archivo-semibold.ttf", F={}, db={profile={}}, sent={},
	L=setmetatable({},{__index=function(t,k) return k end})}
function GQ.ChainCall(object)
	return setmetatable({__END=object},{__index=function(self,key)
		return function(_,...) object[key](object,...) return self end
	end})
end
function GQ.F.HTMLColor() return 1,1,1,1 end
function GQ:SendMessage(m) table.insert(self.sent,m) end
assert(loadfile(root.."/UiWidgets/Main.lua"))("GoatQuest",GQ)
assert(loadfile(root.."/Skins.lua"))("GoatQuest",GQ)
local skin = GQ.Skins:AddSkin("default","Default")
local frames = 0
function skin:CreateFrame() frames = frames+1 end
assert(loadfile(root.."/Skins/Default/GoatQuest/Style.lua"))("GoatQuest",GQ)
local S = skin:GetStyle("goatquest")
assert(S and S.name=="GoatQuest" and skin.defaultStyle=="goatquest")

-- Saved style ids from older versions all land on GoatQuest; the transparency toggle is gone.
GQ.db.profile.opacitytoggle = true
for _,id in ipairs({"starlight","stealth","starlight-glass","stealth-glass","midnight","glass","goatquest",false}) do
	GQ.db.profile.skinstyle = nil
	GQ:SetSkin(id and "default" or "nope", id or nil)
	assert(GQ.CurrentSkinStyle==S, tostring(id))
	assert(GQ.db.profile.skin=="default" and GQ.db.profile.skinstyle=="goatquest")
	assert(GQ.StyleDir==GQ.SKINSDIR.."default\\goatquest\\")
end
assert(frames==8 and GQ.sent[#GQ.sent]=="SKIN_UPDATED")
assert(GQ.ButtonSets.Interactions.file==S.InteractionTexture)
assert(GQ.UI.SkinData("AceGUIFlat")==true)

-- Arrow skin: the only one is GoatQuest, old ids fall back to it without a chat message.
Pointer = {}
GQ.Pointer = Pointer
GQ.ARROWSDIR = GQ.DIR.."\\Arrows\\"
function Mixin(t,...) for _,m in ipairs({...}) do for k,v in pairs(m) do t[k]=v end end return t end
GoatQuest_ArrowSkin_Mixin = {GetDir=function(self) return GQ.ARROWSDIR..self.id.."\\" end}
local printed = 0
function GQ:Print() printed = printed+1 end
function Pointer:CreateArrowFrame() self.ArrowFrame = {Hide=noop} end
assert(loadstring(pointerArrowSkins))()
assert(loadfile(root.."/Arrows/GoatQuest/Arrow.lua"))("GoatQuest",GQ)
assert(Pointer.ArrowSkins.GoatQuest and next(Pointer.ArrowSkins,"GoatQuest")==nil)
local arrow = Pointer.ArrowSkins.GoatQuest
assert(arrow.name=="GoatQuest" and arrow.options.texture==GQ.DIR.."\\Arrows\\GoatQuest\\arrow")
for _,id in ipairs({"Starlight","starlight","Stealth","stealth","GoatQuest",false}) do
	Pointer:SetArrowSkin(id or nil)
	assert(Pointer.CurrentArrowSkin==arrow and GQ.db.profile.arrowskin=="GoatQuest", tostring(id))
end
GQ.db.profile.arrowskin = "Starlight"
assert(Pointer:GetSkinPath()==GQ.DIR.."\\Arrows\\GoatQuest\\" and printed==0)

-- The settings menu's AceGUI widgets, flat.
assert(loadfile(root.."/Libs/LibStub/LibStub.lua"))()
assert(loadfile(root.."/Libs/AceGUI-3.0/AceGUI-3.0.lua"))()
for _,w in ipairs({"Button","CheckBox","DropDown-Items","DropDown","EditBox","MultiLineEditBox","Slider","SliderLabeled","Heading","ColorPicker"}) do
	assert(loadfile(root.."/Libs/AceGUI-3.0/widgets/AceGUIWidget-"..w..".lua"))()
end
for _,w in ipairs({"InlineGroup","ScrollFrame"}) do
	assert(loadfile(root.."/Libs/AceGUI-3.0/widgets/AceGUIContainer-"..w..".lua"))()
end
local AceGUI = LibStub("AceGUI-3.0-Z")
local function same(a,b) for i=1,4 do if math.abs((a[i] or 1)-(b[i] or 1))>0.001 then return false end end return true end
local set = GQ.ButtonSets.Interactions
local function coords(t,c) for i=1,4 do if t.texcoord[i]~=c[i] then return false end end return true end

-- Checkbox: 14px, the atlas rows follow the state; radios really use the radio cells.
local cb = AceGUI:Create("CheckBox-Z")
assert(cb.skinned and cb.checkbg.width==14 and cb.check.texture==set.file)
cb:SetValue(true)
assert(cb.check.shown and not cb.checkbg.shown)
assert(coords(cb.check,set.CHECKBOX_ON.texcoords[1]) and coords(cb.highlight,set.CHECKBOX_ON.texcoords[3]))
cb:SetDisabled(true)
assert(coords(cb.check,set.CHECKBOX_ON.texcoords[4]) and same(cb.text.textcolor,S.AceGUITextColorDisabled))
cb:SetDisabled(false)
assert(same(cb.text.textcolor,S.AceGUITextColor))
cb:SetType("radio")
cb:SetValue(false)
assert(coords(cb.checkbg,set.RADIO.texcoords[1]) and coords(cb.check,set.RADIO_ON.texcoords[1]))
assert(coords(cb.highlight,set.RADIO.texcoords[3]) and cb.highlight.blend=="ADD")

-- Button: flat fill, the hover tint covers it exactly, Archivo SemiBold; ink on the gold accent style.
local btn = AceGUI:Create("Button-Z")
local hl = btn.frame:GetHighlightTexture()
assert(btn.frame.backdrop==S.AceGUIButtonTexture and same(btn.frame.backdropColor,S.AceGUIButtonTextureColor))
assert(#hl.points==2 and hl.points[1][1]=="TOPLEFT" and hl.points[1][2]==btn.frame and hl.points[1][4]==0 and hl.points[1][5]==0)
assert(hl.points[2][1]=="BOTTOMRIGHT" and hl.points[2][2]==btn.frame and hl.points[2][4]==0 and hl.points[2][5]==0)
assert(same(hl.color,S.AceGUIButtonHighlightColor) and hl.blend=="BLEND")
assert(btn.frame.normalFont:GetFont()=="archivo-semibold.ttf" and same({btn.frame.normalFont:GetTextColor()},S.TextColor))
assert(not btn.frame.Left.shown and not btn.frame.Middle.shown and not btn.frame.Right.shown)
btn:SetStyle("Accent")
btn:ApplySkin()
assert(same(btn.frame.backdropColor,S.Accent) and same({btn.frame.normalFont:GetTextColor()},S.Ink))

-- Dropdown: a flat ridge box with a 1px edge instead of the slice textures, muted chevron.
local dd = AceGUI:Create("Dropdown-Z")
local box = dd.flatbox
assert(box and box:IsShown() and not dd.dropdown.Left.shown and not dd.dropdown.Middle.shown and not dd.dropdown.Right.shown)
assert(same(box.fill.color,S.AceGUIControlColor) and same(box.edges[1].color,S.AceGUIControlBorderColor))
assert(box.fill.layer=="BACKGROUND" and box.edges[1].layer=="BORDER" and box.edges[1].height==1 and box.edges[3].width==1)
assert(same(_G[dd.dropdown:GetName().."ButtonNormalTexture"].color,S.AceGUIChevronColor))
dd.button_cover:RunScript("OnEnter")
assert(same(box.edges[2].color,S.AceGUIControlBorderColorHover))
dd.button_cover:RunScript("OnLeave")
assert(same(box.edges[2].color,S.AceGUIControlBorderColor))
dd:SetDisabled(true)
assert(same(dd.text.textcolor,S.AceGUITextColorDisabled))
assert(dd.pullout.frame.backdrop==S.AceGUIDropDownBackdrop and dd.pullout.slider.thumb.width==S.ScrollBarThumbWidth)
local item = AceGUI:Create("Dropdown-Item-Toggle-Z")
assert(item.check.texture==S.CheckMark and same(item.check.color,S.Accent))

-- Edit box: the same box; text padded inside it.
local eb = AceGUI:Create("EditBox-Z")
assert(eb.flatbox:IsShown() and not eb.editbox.Left.shown and eb.editbox.insets[1]==2)
eb.editbox:RunScript("OnEnter")
assert(same(eb.flatbox.edges[1].color,S.AceGUIControlBorderColorHover))

-- Sliders: 2px track, slim gold thumb.
for _,kind in ipairs({"Slider-Z","SliderLabeled-Z"}) do
	local sl = AceGUI:Create(kind)
	local thumb = sl.slider:GetThumbTexture()
	assert(sl.slider.backdrop==nil and sl.slider.flatTrack.height==2 and sl.slider.flatTrack.shown, kind)
	assert(thumb.width==4 and thumb.height==14 and same(thumb.color,S.Accent), kind)
	sl:SetDisabled(true)
	assert(same(sl.slider:GetThumbTexture().color,S.AceGUITextColorDisabled), kind)
end

-- Option headings: SemiBold, left-aligned, then a hairline.
local heading = AceGUI:Create("Heading-Z")
heading:SetText("Travel")
heading:SetFontObject(GameFontNormal)
assert(not heading.left.shown and heading.right.shown and heading.right.height==1 and same(heading.right.color,S.Hairline))
assert(heading.label.justifyH=="LEFT" and heading.label.font=="archivo-semibold.ttf")

-- Colour swatch (the accent picker): a flat 12px swatch in a 1px edge, like the checkboxes.
local cp = AceGUI:Create("ColorPicker-Z")
cp:SetColor(0.2,0.7,0.65,1)
assert(cp.flat and cp.colorSwatch.texture=="Interface\\Buttons\\WHITE8X8" and cp.colorSwatch.width==12)
assert(cp.colorSwatch.background.width==14 and same(cp.colorSwatch.background.color,{1,1,1,0.25}))
assert(same(cp.colorSwatch.color,{0.2,0.7,0.65,1}))
cp:SetDisabled(true)
assert(same(cp.text.textcolor,S.DimColor))
cp:SetDisabled(false)
assert(same(cp.text.textcolor,S.TextColor))

-- Inline groups and the options scroll frame.
local group = AceGUI:Create("InlineGroup-Z")
assert(group.border.backdrop==S.AceGUIGroupBackdrop and same(group.border.backdropBorderColor,S.Hairline))
local scroll = AceGUI:Create("ScrollFrame-Z")
assert(scroll.scrollbar.ScrollUpButton.alpha==0 and scroll.scrollbar.ThumbTexture.width==4)
assert(same(scroll.scrollbar.ThumbTexture.color,S.ScrollBarColor))
local ml = AceGUI:Create("MultiLineEditBox-Z")
assert(ml.scrollBG.backdrop==S.AceGUIEditBackdropMultiline and same(ml.scrollBG.backdropColor,S.AceGUIEditBackdropColor))

assert(#lua_errors==0, lua_errors[1])

-- The Guide Menu window (guides and settings) built for real and skinned.
UISpecialFrames = {}
floor,ceil,max,min,abs,format = math.floor,math.ceil,math.max,math.min,math.abs,string.format
math.round = math.round or function(v) return math.floor(v+0.5) end
GQ.GuideOnly = true
GQ.startups = {}
GQ.registered_groups = {groups={}}
GQ.db.char = {}
GQ.Widgets = {DisableConfig=noop, HideAllPopups=noop}
function GQ:AddMessageHandler() end
function GQ.F.SetSpriteTexCoord(texture,x,w,y,h) texture:SetTexCoord((x-1)/w,x/w,(y-1)/h,y/h) end
function GQ.F.AssignButtonTexture(button,file) button:SetNormalTexture(file) button:SetHighlightTexture(file) end
function GQ:ScheduleTimer() end
function GQ.CreateFrameWithBG(kind,name,parent,template) return CreateFrame(kind,name,parent,template or "BackdropTemplate") end
function UnitFactionGroup() return "Alliance" end
function UnitClass() return "Paladin","PALADIN" end
function UIFrameFadeIn() end
for _,w in ipairs({"Frame","Button","EditBox","ScrollBar","ScrollChild","ScrollItems","ScrollTable","DropDown","ProgressBar","ToggleButton"}) do
	assert(loadfile(root.."/UiWidgets/"..w..".lua"))("GoatQuest",GQ)
end
assert(loadfile(root.."/GuideMenu.lua"))("GoatQuest",GQ)
assert(loadfile(root.."/GuideMenu-View.lua"))("GoatQuest",GQ)
local GM = GQ.GuideMenu
GM.Featured = {{title="Leveling",group="LEVELING"}}
GM:CreateFrames()
local MF = GM.MainFrame

-- Ink window, hairline edge, the 2px gold rule along the top.
assert(MF.backdrop==S.GuideMenuBackdrop and same(MF.backdropColor,{15/255,17/255,21/255,0.97}) and same(MF.backdropBorderColor,S.Hairline))
assert(MF.TopRule.height==2 and same(MF.TopRule.color,S.Accent) and MF.TopRule.layer=="OVERLAY")
assert(MF.TopRule.points[1][1]=="TOPLEFT" and MF.TopRule.points[2][1]=="TOPRIGHT")
assert(same(MF.HeaderRule.color,S.Hairline) and MF.HeaderRule.height==1)
assert(same(MF.SidebarRule.color,S.Hairline) and MF.SidebarRule.width==1)
-- Header: gold wordmark, muted tabs with a gold bar under the active one.
assert(same(MF.Header.Wordmark.textcolor,S.Accent) and MF.Header.Wordmark.text=="GoatQuest")
local tab = MF.Header.Tabs.Guides
assert(same(tab:GetFontString().textcolor,S.MutedColor) and same(tab.LeftDecor.color,S.Accent) and tab.LeftDecor.height==2)
tab:SetLockHighlight(true)
assert(same(tab:GetFontString().textcolor,S.TextColor))
-- Sidebar on the window's ink, content on slate, details on ridge; columns clear the window's edge.
assert(same(MF.MenuColumn.backdropColor,{0,0,0,0}))
assert(same(MF.WideColumn.backdropColor,S.Slate) and same(MF.CenterColumn.backdropColor,S.Slate))
assert(same(MF.RightColumn.backdropColor,S.Ridge))
assert(MF.WideColumn.points[2][1]=="BOTTOMRIGHT" and MF.WideColumn.points[2][4]==-1 and MF.WideColumn.points[2][5]==1)
-- Section title in SemiBold with a hairline under it; options content aligned with it.
assert(MF.WideColumn.Name.font=="archivo-semibold.ttf" and same(MF.WideColumn.Decor.backdropColor,S.Hairline))
assert(MF.WideColumnOptions.AceContainer.flatScrollBar)
-- Sidebar items: muted, the active one in text colour with the gold marker.
local settings = MF.MenuGuides.Options
assert(settings.texture.desaturated and same(settings.caption.textcolor,S.MutedColor))
settings:SetLockHighlight(true)
assert(settings.LeftDecor.shown and settings.ActiveFill.shown and same(settings.caption.textcolor,S.TextColor))
assert(same(settings.texture.color,S.TextColor) and same(settings.LeftDecor.color,S.Accent))
-- Search box: a flat ridge control.
local back = MF.MenuGuides.SearchEdit.back
assert(back.backdrop==S.SearchBackdrop and same(back.backdropColor,S.Ridge) and same(back.backdropBorderColor,S.AceGUIControlBorderColor))
assert(#lua_errors==0, lua_errors[1])
''')
print("PASS GoatQuest skin: one style and arrow skin, legacy ids resolve, flat checkbox/radio, button, dropdown, edit box, sliders, headings, groups, scroll bars; guide menu window built and skinned")
