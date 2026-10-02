"""Exercise GoatQuest branding with the real Lua atlas and popup consumers."""
from pathlib import Path
import re
import struct
import sys
import xml.etree.ElementTree as ET

sys.path.insert(0, str(Path(__file__).resolve().parent))
from gqtest import ROOT, lua_runtime  # noqa: E402

lua = lua_runtime()
lua.execute(br'''
local function region()
    local r={}
    function r:SetTexture(v) self.texture=v end
    function r:SetTexCoord(...) self.coords={...} end
    function r:SetBlendMode(v) self.blend=v end
    function r:SetText(v) self.text=v end
    function r:SetFont(...) self.font={...} end
    function r:SetTextColor(...) self.color={...} end
    function r:SetPoint(...) self.point={...} end
    function r:Show() self.shown=true end
    return r
end
local function button(retail)
    local b={}
    for _,kind in ipairs({"Normal","Pushed","Highlight","Disabled"}) do
        b["Set"..kind.."Texture"]=function(self,v)
            assert(v~=nil or not retail, "Retail 12.x rejects nil button textures")
            self[kind]=v and region() or nil
        end
        if retail then b["Clear"..kind.."Texture"]=function(self) self[kind]=nil end end
        b["Get"..kind.."Texture"]=function(self) return self[kind] end
    end
    function b:CreateFontString() self.label=region() return self.label end
    return b
end
GQ={DIR="Interface\\AddOns\\"..addon,SKINSDIR="Interface\\AddOns\\"..addon.."\\Skins\\",Font="regular.ttf",FontBold="bold.ttf",L=setmetatable({},{__index=function(t,k) return k end}),F={},UI={}}
function GQ.ChainCall(object)
    return setmetatable({__END=object},{__index=function(self,key)
        return function(_,...) object[key](object,...) return self end
    end})
end
function GQ.UI.SkinData(key) return key end
function GQ.F.HTMLColor() return 1,1,1,1 end
assert(loadfile(root.."/Skins.lua"))(addon,GQ)
GQ.ButtonSets:Create()
GQ.IconSets:Create()
local function verifyAtlasIcon(icon,path,left,right)
    local b=button(); icon:AssignToButton(b)
    for row,kind in ipairs({"Normal","Pushed","Highlight","Disabled"}) do
        local t=b[kind]
        assert(t.texture==GQ.SKINSDIR..path)
        assert(t.coords[1]==left and t.coords[2]==right)
        assert(t.coords[3]==(row-1)/4 and t.coords[4]==row/4)
    end
    assert(b.Highlight.blend=="ADD")
end
verifyAtlasIcon(GQ.ButtonSets.Minimap.NORMAL,"goatquest-minimap",0,0.5)
verifyAtlasIcon(GQ.ButtonSets.Minimap.ACTIVE,"goatquest-minimap",0.5,1)
for _,icon in pairs(GQ.ButtonSets.SpecialButton) do
    if type(icon)=="table" then verifyAtlasIcon(icon,"goatquest-button-states",0,1) end
end
local expected={HAPPY="+",INDIFFERENT="=",UNHAPPY="-"}
for _,retail in ipairs({false,true}) do -- buttons without and with the 12.x Clear*Texture methods
    for _,set in ipairs({GQ.ButtonSets.RatingButtons,GQ.ButtonSets.RatingButtons_active}) do
        for name,label in pairs(expected) do
            local b=button(retail);set[name]:AssignToButton(b)
            assert(b.label.text==label and b.label.shown)
            assert(b.Normal==nil and b.Pushed==nil and b.Highlight==nil and b.Disabled==nil)
        end
    end
end
local about=region()
GQ.IconSets.OptionsIcons.about:AssignToTexture(about)
assert(about.texture==GQ.SKINSDIR.."goatquest-options-icons")
assert(about.coords[1]==0.5 and about.coords[2]==1 and about.coords[3]==11/32 and about.coords[4]==12/32)
local notice=region()
local icons=GQ.IconSets.NotificationIcons
icons[icons.default]:AssignToTexture(notice)
assert(notice.texture==GQ.SKINSDIR.."goatquest-notification-icons")
assert(notice.coords[1]==7/32 and notice.coords[2]==8/32)
local parent=button()
local title=GQ:CreateBrandTitle(parent,16)
assert(title.text=="GoatQuest" and title.font[1]=="bold.ttf" and title.font[2]==16)
assert(loadfile(root.."/GoatQuestMapIcon.lua"))()
local setup={}
function GQ.F.AssignButtonTexture(button,path,index,count)
    setup={button,path,index,count}
end
local mapbutton=button();GoatQuestMapIcon_Mixin.Setup(mapbutton)
assert(setup[1]==mapbutton and setup[2]==GQ.SKINSDIR.."goatquest-minimap" and setup[3]==1 and setup[4]==2)
assert(loadfile(root.."/StaticPopups.lua"))(addon,GQ)
local path,coords=GQ.PopupHandler:GetNCTextureInfo("default")
assert(path==GQ.SKINSDIR.."goatquest-notification-icons" and coords[1]==7/32 and coords[2]==8/32)
for _,file in ipairs({"Goal.lua","QuestDB.lua","CreatureViewer.lua","Item-GearFinder.lua","GuideMenu.lua","GuideMenu-View.lua","TitanGoatQuest.lua","Code-Retail/PointerMap.lua","GoldUI/Goldguide-View.lua","Code-Retail/GoldUI/Auctiontools-View.lua","Libs/LibTaxi-1.0/LibTaxi-1.0.lua"}) do
    assert(loadfile(root.."/"..file),file)
end
GQ.Skins:AddSkin("default","Default")
assert(loadfile(root.."/Skins/Default/GoatQuest/Style.lua"))(addon,GQ)
local skin=GQ.Skins:GetSkin("default")
local count=0
for id,style in pairs(skin.styles) do count=count+1 end
assert(count==1 and skin.defaultStyle=="goatquest")
local style=skin:GetStyle()
assert(style.id=="goatquest" and style.name=="GoatQuest")
assert(style.TitleLogo==GQ.SKINSDIR.."goatquest-icon")
assert(style.TitleLogoSize[1]==style.TitleLogoSize[2])
-- One accent (GoatQuest gold) and the flat widget mode.
local function same(a,b) for i=1,4 do if math.abs((a[i] or 1)-(b[i] or 1))>0.002 then return false end end return true end
local gold={0.961,0.749,0.161,1}
assert(same(style.Accent,gold) and style.GuideMenuTopRuleColor==style.Accent and style.GuideMenuGuideButtonDecorColor==style.Accent)
assert(style.AceGUISliderThumbColor==style.Accent and style.ProgressBarTextureColor==style.Accent)
assert(style.StyleAceGUI==true and style.AceGUIFlat==true and style.UseOpacity==false)
assert(same(style.Ink,{15/255,17/255,21/255,1}) and same(style.Slate,{21/255,24/255,29/255,1}) and same(style.Ridge,{27/255,31/255,37/255,1}))
assert(style.GuideMenuBackdropBorderColor==style.Hairline and style.AceGUIControlColor==style.Ridge)
local dir=GQ.SKINSDIR.."default\\goatquest\\"
assert(style.InteractionTexture==dir.."checkradio-flat" and style.CheckMark==dir.."check")
-- Every backdrop is flat: 1px white edges, no rounded edge textures.
for key,value in pairs(style) do
    if type(value)=="table" and (value.bgFile or value.edgeFile) then
        assert(value.bgFile==nil or value.bgFile==GQ.SKINSDIR.."white",key)
        assert(value.edgeFile==nil or (value.edgeFile==GQ.SKINSDIR.."white" and value.edgeSize==1),key)
    end
end
''')

# WoW supports uncompressed, 32-bit power-of-two TGA textures; validate the packaged
# atlas dimensions and ensure every button state actually contains the approved art.
def tga_pixels(path):
    raw = path.read_bytes()
    image_id, color_map, image_type = raw[:3]
    width, height, bits, descriptor = struct.unpack_from("<HHBB", raw, 12)
    assert color_map == 0 and image_type == 2 and bits == 32, path
    assert descriptor & 15 == 8 and not descriptor & 16, path
    start = 18 + image_id
    pixels = raw[start:start + width * height * 4]
    assert len(pixels) == width * height * 4
    rows = [pixels[y*width*4:(y+1)*width*4] for y in range(height)]
    if not descriptor & 32:
        rows.reverse()
    return width, height, rows

w, h, approved = tga_pixels(ROOT / "Skins/goatquest-icon.tga")
assert (w, h) == (64, 64)
for filename, columns in [("goatquest-button-states", 1), ("goatquest-minimap", 2)]:
    w, h, rows = tga_pixels(ROOT / f"Skins/{filename}.tga")
    assert (w, h) == (columns * 64, 256)
    for row in range(4):
        for col in range(columns):
            assert [line[col*256:(col+1)*256] for line in rows[row*64:(row+1)*64]] == approved
w, h, rows = tga_pixels(ROOT / "Skins/goatquest-options-icons.tga")
assert (w, h) == (128, 2048)
for col in range(2):
    assert [line[col*256:(col+1)*256] for line in rows[11*64:12*64]] == approved
w, h, _ = tga_pixels(ROOT / "Skins/goatquest-notification-icons.tga")
assert (w, h) == (1024, 32)
for name in ["GoatQuestMapIcon.xml", "Templates.xml", "Skins/Default/ViewerFrame.xml"]:
    ET.parse(ROOT / name)

# The GoatQuest skin: one style, flat textures generated by Skins/tools/make_textures.py.
style_dir = ROOT / "Skins/Default/GoatQuest"
style_src = (style_dir / "Style.lua").read_text(encoding="utf-8")
for name in sorted(set(re.findall(r'STYLEDIR\.\."([\w-]+)"', style_src))):
    assert (style_dir / f"{name}.tga").is_file(), f"Style texture missing: {name}"
# Empty leftover folders are harmless (the release only packages files); no file may remain.
for gone in ["Skins/Default/Starlight", "Skins/Default/Starlight-glass", "Skins/Default/Stealth",
             "Skins/Default/Stealth-glass", "Skins/Default/Midnight", "Arrows/Stealth", "Arrows/Starlight"]:
    assert not [path for path in (ROOT / gone).rglob("*") if path.is_file()], gone
for name, size in [("checkradio-flat", (128, 128)), ("check", (32, 32)), ("scroll-bar", (16, 64)),
                   ("floatingbuttons-thin", (128, 128)), ("guideicons-small", (128, 64))]:
    w, h, rows = tga_pixels(style_dir / f"{name}.tga")
    assert (w, h) == size, name


def pixel(rows, x, y):
    b, g, r, a = rows[y][x * 4:x * 4 + 4]
    return r, g, b, a


# ButtonSets.Interactions: CHECKBOX, CHECKBOX_ON, RADIO, RADIO_ON across; normal, pushed, highlight, disabled down.
_, _, rows = tga_pixels(style_dir / "checkradio-flat.tga")
gold, ink = (245, 191, 41), (15, 17, 21)
assert pixel(rows, 16, 16)[3] == 0                          # empty box
assert pixel(rows, 3, 16) == (255, 255, 255, 63)            # 1px (2 texels) white 25% edge
assert pixel(rows, 32 + 4, 32 - 4)[:3] == gold              # checked: gold fill
assert pixel(rows, 32 + 20, 14)[:3] == ink                  # with an ink check mark
assert pixel(rows, 64 + 16, 16)[3] == 0 and pixel(rows, 64 + 16, 3)[3] > 40   # radio ring
assert pixel(rows, 96 + 16, 16)[:3] == ink and pixel(rows, 96 + 16, 6)[:3] == gold
assert pixel(rows, 32 + 4, 96 + 4)[:3] == (111, 117, 126)   # disabled checked: dim fill
print("Visual branding contracts passed: Lua consumers, distinct ratings, square assets, and TGA button states.")