local GoatQuest=GoatQuest
if not GoatQuest then return end
if UnitFactionGroup("player")~="Horde" then return end
if GQ:DoMutex("ScenarioHLEGION") then return end
GoatQuest.GuideMenuTier = "TRI"
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Legion Scenarios\\Whispers of a Frightened World")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Legion Scenarios\\The Deaths of Chromie Portals")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Legion Scenarios\\The Deaths of Chromie Speed Run")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Legion Scenarios\\The Deaths of Chromie (Stratholme Intro)")
