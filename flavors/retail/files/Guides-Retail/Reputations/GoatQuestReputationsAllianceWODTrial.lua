local GoatQuest=GoatQuest
if not GoatQuest then return end
if UnitFactionGroup("player")~="Alliance" then return end
if GQ:DoMutex("ReputationsAWOD") then return end
GoatQuest.GuideMenuTier = "TRI"
GoatQuest:RegisterGuidePlaceholder("Reputation Guides\\Warlords of Draenor\\Arakkoa Outcasts")
GoatQuest:RegisterGuidePlaceholder("Reputation Guides\\Warlords of Draenor\\Council of Exarchs")
GoatQuest:RegisterGuidePlaceholder("Reputation Guides\\Warlords of Draenor\\Hand of the Prophet")
GoatQuest:RegisterGuidePlaceholder("Reputation Guides\\Warlords of Draenor\\Order of the Awakened")
GoatQuest:RegisterGuidePlaceholder("Reputation Guides\\Warlords of Draenor\\The Saberstalkers")
GoatQuest:RegisterGuide("Reputation Guides\\Warlords of Draenor\\Sha'tari Defense",{
description="This guide will walk you through becoming exalted with the Sha'tari Defense faction.",
achieveid={9476},
patch='60001',
},[[
step
Routing to Rep |next "menu" |only if hasbuilding(144,2) or hasbuilding(145,3)
Routing to End |next "end" |only if default
stickystart "info"
step
label "menu"
Killing enemies in Talador gives you Sha'tari Defense reputation:
Shattrath City |next "shattrath" |confirm
Bladefury Hold |next "bladefury" |confirm
step
label "shattrath"
kill Imp Charmer##83017+, Sargerei Felbringer##84334+, Gorebound Insurgent##87337+, Shadowbourne Felcaster##84871+, Fel Seer##84873+
Kill mobs around _Shattrath City_ for Sha'tari Defense reputation |goto Talador 45.10,35.40
Return to the main menu |next "menu" |confirm
step
label "bladefury"
kill Grom'kar Bulwark##85454+, Grom'kar Punisher##85458+, Grom'kar Deadeye##85450+, Grom'kar Blademaster##85456+
Kill mobs around _Bladefury Hold_ for Sha'tari Defense reputation |goto Talador 68.80,3.50
Return to the main menu |next "menu" |confirm
step
label "info"
Your current reputation rank is:
_Neutral_ |only if rep("Sha'tari Defense")==Neutral
_Friendly_ |only if rep("Sha'tari Defense")==Friendly
_Honored_ |only if rep("Sha'tari Defense")==Honored
_Revered_ |only if rep("Sha'tari Defense")==Revered
_Exalted_ |only if rep("Sha'tari Defense")==Exalted
step
label "end"
You must have at least a _level 2 Trading Post_ in your Garrison to gain Sha'tari Defense reputation!
|tip Use the Garrison Buildings guide to accomplish this.
]])
GoatQuest:RegisterGuidePlaceholder("Reputation Guides\\Warlords of Draenor\\Steamwheedle Preservation Society")
GoatQuest:RegisterGuidePlaceholder("Reputation Guides\\Warlords of Draenor\\Wrynn's Vanguard")
