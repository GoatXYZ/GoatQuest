"""Minimap button: left-click shows or hides the viewer, right-click opens the
settings (or closes them when they are showing), and the tooltip says so
even with the notification system off."""
import os
import re
import sys
from pathlib import Path

sys.path.insert(0, str(Path(os.environ.get("TEMP", ".")) / "goatquest-lua-tests"))
from lupa.lua51 import LuaRuntime

ROOT = Path(__file__).resolve().parents[1]

lua = LuaRuntime(encoding=None, unpack_returned_tuples=True)
lua.globals()[b"root"] = str(ROOT).replace("\\", "/").encode()
lua.execute(br'''
tinsert = table.insert
local calls = {}
GQ = {L={name="GoatQuest",minimap_tooltip="tip"}, GuideMenu={}, db={profile={nc_enable=false}}}
function GQ:ToggleFrame() tinsert(calls,"toggle") end
function GQ:OpenOptions(v) tinsert(calls,"options") end
local tip = {lines={}}
function tip:SetOwner(owner,anchor) self.owner,self.anchor = owner,anchor end
function tip:SetText(t) self.lines = {t} end
function tip:AddLine(t) tinsert(self.lines,t) end
function tip:Show() self.shown = true end
function tip:Hide() self.shown = false end
GameTooltip = tip

assert(loadfile(root.."/GoatQuestMapIcon.lua"))()
local M,button = GoatQuestMapIcon_Mixin,{}

-- Notifications are off (guide-only mode forces it): the tooltip still shows.
M.OnEnter(button)
assert(tip.shown and tip.owner==button and tip.anchor=="ANCHOR_LEFT")
assert(tip.lines[1]=="GoatQuest" and tip.lines[2]=="tip")
M.OnLeave(button)
assert(not tip.shown)

-- The guide menu has never been opened.
M.OnClick(button,"LeftButton")
M.OnClick(button,"RightButton")
assert(calls[1]=="toggle" and calls[2]=="options")

-- Settings showing: right-click closes them; left-click still toggles the viewer.
local visible = true
GQ.GuideMenu.MainFrame = {IsVisible=function() return visible end}
GQ.GuideMenu.CurrentPath = "Options"
function GQ.GuideMenu:Hide() tinsert(calls,"close") end
tip.shown = true
M.OnClick(button,"RightButton")
assert(calls[3]=="close" and not tip.shown)
M.OnClick(button,"LeftButton")
assert(calls[4]=="toggle")
-- The browser on a guide page: right-click switches it to the settings.
GQ.GuideMenu.CurrentPath = "LEVELING"
M.OnClick(button,"RightButton")
assert(calls[5]=="options")
-- Closed browser left on the settings page: right-click opens them again.
visible,GQ.GuideMenu.CurrentPath = false,"Options"
M.OnClick(button,"RightButton")
assert(calls[6]=="options" and #calls==6)
''')

# The English tooltip describes the new clicks and matches the addon compartment.
enus = (ROOT / "Localization/Core_enUS.lua").read_text(encoding="utf-8-sig")
line = re.search(r"^\s*minimap_tooltip = (.*)$", enus, re.M).group(1)
assert "Show or hide the viewer" in line and "Settings" in line and "Notifications" not in line, line
assert line.index("Left-Click") < line.index("Show or hide") < line.index("Right-Click") < line.index("Settings")
core = (ROOT / "GoatQuest.lua").read_text(encoding="utf-8-sig")
compartment = core[core.index("function GoatQuest_OnAddonCompartmentClick"):]
compartment = compartment[:compartment.index("\nend")]
assert compartment.index('"LeftButton"') < compartment.index("ToggleFrame") < compartment.index("OpenOptions")
print("PASS minimap button: left-click toggles the viewer, right-click opens/closes settings, tooltip always shown")
