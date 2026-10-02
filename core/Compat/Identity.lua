local addonName, GQ = ...
local L = GoatQuest_L("Main")
L.name = "|cfff4bf2aGoatQuest|r"
L.name_plain = "GoatQuest"
L.zgname = "|cfff4bf2aGoatQuest|r"

-- Brand the active guide/navigation UI.
L.viewer_special_select = "Welcome to GoatQuest.\n|cfff4bf2aClick here|r to choose a guide."
L.opt_about_desc1 = "GoatQuest: Guides and Navigation"
L.opt_about_credits = "GoatQuest uses third-party engine and guide content."
L.opt_showmapbutton = "Show GoatQuest button on the minimap"
L.opt_preview = "Enable GoatQuest dungeon map"
L.opt_hidetracker_desc = "Hide the WoW objective tracker while GoatQuest is visible."
L.opt_hideexptracker_desc = "Hide the WoW experience bar while GoatQuest shows experience progress."
L.opt_noisy = "Show GoatQuest chat messages"
L.opt_profile_description = "Profiles save your GoatQuest settings and can be shared across your characters. Changes are saved automatically."
L.opt_wipe_settings_desc = "Clear all GoatQuest settings for every character on this account.|n|cffff8800This cannot be undone.|r|nHold Shift while clicking to confirm."
L.opt_wipe_settings_desc2 = L.opt_wipe_settings_desc
L.pointer_arrowmenu_freeze_desc = "Enable interaction again in GoatQuest options, under Waypoint Arrow."
L.pointer_arrowmenu_hide_desc = "Show the arrow again in GoatQuest options, under Waypoint Arrow."
L.static_caption = "|cfff4bf2aGoatQuest|r\n \n"
L.opt_tech_support_header = "Troubleshooting"
L.opt_tech_support = "For GoatQuest troubleshooting, use /goatquestdebug and include the first Lua error. Reports are not uploaded automatically."

-- Public addon namespace used by the bundled engine and guides.
GoatQuest = GQ
