local GoatQuest=GoatQuest
if not GoatQuest then return end
if UnitFactionGroup("player")~="Alliance" then return end
if GQ:DoMutex("ReputationsACLASSIC") then return end
GoatQuest.GuideMenuTier = "TRI"
GoatQuest:RegisterGuidePlaceholder("Reputation Guides\\Reputations\\Bloodsail Buccaneers")
GoatQuest:RegisterGuidePlaceholder("Reputation Guides\\Reputations\\Brood of Nozdormu")
GoatQuest:RegisterGuidePlaceholder("Reputation Guides\\Reputations\\Cenarion Circle")
GoatQuest:RegisterGuidePlaceholder("Reputation Guides\\Reputations\\Gelkis & Magram Centaur Clans")
GoatQuest:RegisterGuidePlaceholder("Reputation Guides\\Reputations\\Hydraxian Waterlords")
GoatQuest:RegisterGuidePlaceholder("Reputation Guides\\Reputations\\Ravenholdt")
GoatQuest:RegisterGuidePlaceholder("Reputation Guides\\Reputations\\Steamwheedle Cartel")
GoatQuest:RegisterGuidePlaceholder("Reputation Guides\\Reputations\\Timbermaw Hold")
GoatQuest:RegisterGuidePlaceholder("Reputation Guides\\Reputations\\Thorium Brotherhood")
GoatQuest:RegisterGuidePlaceholder("Reputation Guides\\Reputations\\Wintersaber Trainers")
GoatQuest:RegisterGuidePlaceholder("Reputation Guides\\Reputations\\Darnassus")
GoatQuest:RegisterGuidePlaceholder("Reputation Guides\\Reputations\\Gnomeregan Exiles")
GoatQuest:RegisterGuidePlaceholder("Reputation Guides\\Reputations\\Ironforge")
GoatQuest:RegisterGuidePlaceholder("Reputation Guides\\Reputations\\Stormwind City")
GoatQuest:RegisterGuidePlaceholder("Reputation Guides\\Reputations\\Argent Dawn")
