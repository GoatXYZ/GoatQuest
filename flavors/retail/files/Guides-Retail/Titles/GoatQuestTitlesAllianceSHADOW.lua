local GoatQuest=GoatQuest
if not GoatQuest then return end
if UnitFactionGroup("player")~="Alliance" then return end
if GQ:DoMutex("TitlesASHADOW") then return end
GoatQuest.GuideMenuTier = "SHA"
GoatQuest:RegisterGuide("Title Guides\\Shadowlands Titles\\General\\of Lordaeron",{
description="This title is earned by completing the Lordaeron storyline introduced in patch 9.2.5.",
patch='90205',
},[[
leechsteps "Achievement Guides\\Quest Achievements\\Shadowlands\\Return to Lordaeron" 1-43
step
_Congratulations!_
You Earned the "of Lordaeron" Title.
]])
