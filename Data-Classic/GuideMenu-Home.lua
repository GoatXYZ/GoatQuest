local name,GQ = ...
local GuideMenu = GQ.GuideMenu

-- Kept for callers of the optional notes widget; the main browser opens Guides.
GuideMenu.Messages = {
    welcome = {
        action = function() GQ.GuideMenu:Show("LEVELING") end,
        title = "Welcome to GoatQuest",
        text = "Quest routes, dungeon walkthroughs and profession guides for WoW Forever.",
    },
}
GuideMenu.GoatQuestMessage = [[
GoatQuest: guides and navigation for WoW Forever.
For troubleshooting, use /goatquestdebug and include the first Lua error.
]]
GuideMenu.Bulletin = {
    {"title", text="GoatQuest 1.0.0"},
    {"item", text="Guides and navigation for Leveling, Dungeons and Professions."},
    {"item", text="Open /goatquestguides to choose a guide."},
}
