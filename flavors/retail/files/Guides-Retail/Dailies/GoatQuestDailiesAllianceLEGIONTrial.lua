local GoatQuest=GoatQuest
if not GoatQuest then return end
if UnitFactionGroup("player")~="Alliance" then return end
if GQ:DoMutex("DailiesALEGION") then return end
GoatQuest.GuideMenuTier = "TRI"
GoatQuest:RegisterGuidePlaceholder("Events Guides\\Brawler's Guild\\Legion Brawler's Guild")
GoatQuest:RegisterGuidePlaceholder("Daily Guides\\Legion\\The Originals")
