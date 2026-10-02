"""Waypoint pins take the GoatQuest viewer's accent: Pointer.Icons and
Pointer:SetWaypointColor, and the minimap edge arrow tint in markerproto:SetIcon,
run from Pointer.lua's own source."""
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from gqtest import ROOT, lua_runtime  # noqa: E402

src = (ROOT / "Pointer.lua").read_text(encoding="utf-8-sig").replace("\r\n", "\n")


def cut(start, end):
    i = src.index(start)
    j = src.index(end, i) + len(end)
    return src[i:j]


icons = cut("Pointer.iconScale = 1", "\treturn true\nend\n")
seticon = cut("function markerproto:SetIcon(icon)", "\tself.icon = icon\nend\n")
assert "254/255" not in src, "no orange pins left"

lua = lua_runtime()
lua.execute(b'assert(loadfile(root.."/tests/wowmock.lua"))()')
lua.execute(b'''
Pointer = {waypoints={}, waypoints_ants={}}
GQ = {StyleDir="Interface\\\\AddOns\\\\"..addon.."\\\\Skins\\\\Default\\\\GoatQuest\\\\", db={profile={minimap_marker_opacity=1}}}
__CLASS = {}
Enum = {UIMapType={Continent=2,World=1,Cosmic=0}}
markerproto = {}
''')
lua.execute(b"local poi_onworldmap = function() end\n" + icons.encode())
lua.execute(b"local full_coords={0,1,0,1}\n" + seticon.encode())
lua.execute(br'''
local function near(a,b) return math.abs(a-b)<1e-6 end
local Icons = Pointer.Icons
local GOLD = {0.96,0.75,0.16}
local function is(tex,c) return near(tex.r,c[1]) and near(tex.g,c[2]) and near(tex.b,c[3]) end

-- Before the viewer sets its accent, pins and their edge arrows are GoatQuest gold.
for _,name in ipairs(Pointer.ACCENT_ICONS) do
	local icon = rawget(Icons,name)
	assert(icon and is(icon.tex,GOLD),name)
	assert(not icon.edgetex or is(icon.edgetex,GOLD),name.." edge")
end
assert(Icons.crosshair.tex.r==1 and Icons.ant.tex.r==1 and Icons.ant_taxi.tex.g==1,"other markers keep their colours")

-- A marker built from the real SetIcon, with the frames it draws into.
local function marker(icon)
	local m = setmetatable({type="way"},{__index=markerproto})
	m.frame_minimap = CreateFrame("Frame",nil,UIParent)
	m.frame_minimap.icon = m.frame_minimap:CreateTexture()
	m.frame_minimap.arrow = m.frame_minimap:CreateTexture()
	m.frame_worldmap = CreateFrame("Frame",nil,UIParent)
	m.frame_worldmap.icon = m.frame_worldmap:CreateTexture()
	m.frame_taximap = CreateFrame("Frame",nil,UIParent)
	m.frame_taximap.icon = m.frame_taximap:CreateTexture()
	m:SetIcon(icon)
	return m
end
local way = marker(Icons.greendotbig)
local ant = marker(Icons.ant)
Pointer.waypoints[1] = way
Pointer.waypoints_ants[1] = ant
local function colourOf(tex) local r,g,b = tex:GetVertexColor() return {r,g,b} end
local function show(tex,c) local v = colourOf(tex) return near(v[1],c[1]) and near(v[2],c[2]) and near(v[3],c[3]) end
assert(show(way.frame_minimap.icon,GOLD) and show(way.frame_worldmap.icon,GOLD) and show(way.frame_taximap.icon,GOLD))
assert(show(way.frame_minimap.arrow,GOLD),"the minimap edge arrow matches the pin")
assert(show(ant.frame_minimap.arrow,{1,1,1}),"ants keep their own colour")

-- The viewer's accent recolours every pin and refreshes the markers on the maps.
local PALADIN = {0.96,0.55,0.73}
local refreshed = 0
local orig = markerproto.SetIcon
markerproto.SetIcon = function(self,...) refreshed = refreshed+1 return orig(self,...) end
assert(Pointer:SetWaypointColor(unpack(PALADIN))==true)
assert(refreshed==2,"waypoints and ants redrawn")
for _,name in ipairs(Pointer.ACCENT_ICONS) do
	local icon = rawget(Icons,name)
	assert(is(icon.tex,PALADIN) and (not icon.edgetex or is(icon.edgetex,PALADIN)),name)
end
assert(show(way.frame_minimap.icon,PALADIN) and show(way.frame_worldmap.icon,PALADIN) and show(way.frame_taximap.icon,PALADIN))
assert(show(way.frame_minimap.arrow,PALADIN))
assert(Icons.crosshair.tex.r==1 and Icons.crosshair.edgetex.r==1 and Icons.ant.tex.r==1,"only the accent markers change")

-- The viewer calls this on every render: an unchanged colour does no work.
refreshed = 0
assert(Pointer:SetWaypointColor(unpack(PALADIN))==false and refreshed==0)
-- A picked colour.
assert(Pointer:SetWaypointColor(0.2,0.7,0.65)==true and show(way.frame_worldmap.icon,{0.2,0.7,0.65}))
''')
print("PASS waypoint pins: gold by default, follow the viewer's accent on every map and the minimap edge arrow, "
      "unchanged colours skip the redraw, other markers keep their colours")
