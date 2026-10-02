local GoatQuest=GoatQuest
if not GoatQuest then return end
if UnitFactionGroup("player")~="Alliance" then return end
if GQ:DoMutex("ScenarioAMOP") then return end
GoatQuest.GuideMenuTier = "TRI"
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Pandaria (10-70)\\Pandaria Scenarios\\A Brewing Storm (10-70)")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Pandaria (10-70)\\Pandaria Scenarios\\A Brewing Storm (Heroic)")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Pandaria (10-70)\\Pandaria Scenarios\\Greenstone Village (10-70)")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Pandaria (10-70)\\Pandaria Scenarios\\Theramore's Fall (10-70)")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Pandaria (10-70)\\Pandaria Scenarios\\Dagger in the Dark (20-70)")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Pandaria (10-70)\\Pandaria Scenarios\\Lion's Landing (20-70)")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Pandaria (10-70)\\Pandaria Scenarios\\Unga Ingoo (20-70)")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Pandaria (10-70)\\Pandaria Scenarios\\A Little Patience (20-70)")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Pandaria (10-70)\\Pandaria Scenarios\\Arena of Annihilation (25-70)")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Pandaria (10-70)\\Pandaria Scenarios\\Brewmoon Festival (25-70)")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Pandaria (10-70)\\Pandaria Scenarios\\Crypt of Forgotten Kings (25-70)")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Pandaria (10-70)\\Pandaria Scenarios\\Crypt of Forgotten Kings (Heroic)")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Pandaria (10-70)\\Pandaria Scenarios\\Assault on Zan'vess (30-70)")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Pandaria (10-70)\\Pandaria Scenarios\\Battle on the High Seas (40-70)")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Pandaria (10-70)\\Pandaria Scenarios\\Battle on the High Seas (Heroic)")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Pandaria (10-70)\\Pandaria Scenarios\\Blood in the Snow (40-70)")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Pandaria (10-70)\\Pandaria Scenarios\\Blood in the Snow (Heroic)")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Pandaria (10-70)\\Pandaria Scenarios\\Dark Heart of Pandaria (40-70)")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Pandaria (10-70)\\Pandaria Scenarios\\Dark Heart of Pandaria (Heroic)")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Pandaria (10-70)\\Pandaria Scenarios\\The Secrets of Ragefire (40-70)")
GoatQuest:RegisterGuidePlaceholder("Dungeon Guides\\Pandaria (10-70)\\Pandaria Scenarios\\The Secrets of Ragefire (Heroic)")
