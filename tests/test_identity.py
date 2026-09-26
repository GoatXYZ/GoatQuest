"""Verify renamed loading/commands and lossless one-time legacy settings import."""
from pathlib import Path
import os
import sys

sys.path.insert(0, str(Path(os.environ.get("TEMP", ".")) / "goatquest-lua-tests"))
from lupa.lua51 import LuaRuntime

ROOT = Path(__file__).resolve().parents[1]
lua = LuaRuntime(encoding=None, unpack_returned_tuples=True)
lua.globals()[b"root"] = str(ROOT).replace("\\", "/").encode()
lua.execute(br'''
local z={}
assert(loadfile(root.."/Compat/MigrateSettings.lua"))("GoatQuest",z)
local requests=0
C_AddOns={DoesAddOnExist=function(name) assert(name=="GoatZyg") return true end,
    GetAddOnMetadata=function(name,key) assert(key=="X-GoatQuest-Migration") return "1" end,
    LoadAddOn=function()
        requests=requests+1
        GoatZygSettings={profileKeys={["Goat - Realm"]="Default"},
            profiles={Default={framescale=0.9,gmlastsection="Leveling Guides",loadguidesfully=true}},
            char={["Goat - Realm"]={guidename="LEVELING\\Westfall (13-15)",step=12,
                tabguides={{title="LEVELING\\Westfall (13-15)"}},waypoints={x=0.4,y=0.6}}},global={}}
        return true
    end}
assert(z:MigrateLegacySettings() and requests==1)
assert(GoatQuestSettings~=GoatZygSettings)
assert(GoatQuestSettings.char["Goat - Realm"].step==12)
assert(GoatQuestSettings.char["Goat - Realm"].waypoints.x==0.4)
assert(GoatQuestSettings.profiles.Default.framescale==0.9)
assert(GoatQuestSettings.global.goatquest_imported_from=="GoatZyg")
GoatQuestSettings.char["Goat - Realm"].step=13
assert(GoatZygSettings.char["Goat - Realm"].step==12,"legacy save must not be mutated")
assert(not z:MigrateLegacySettings() and requests==1,"never overwrite existing GoatQuest progress")

-- The data loader may already have been loaded by OptionalDeps.
GoatQuestSettings=nil
assert(z:MigrateLegacySettings() and requests==1)
-- A disabled/missing loader fails safely without deleting either save.
GoatQuestSettings,GoatZygSettings=nil,nil
C_AddOns.LoadAddOn=function() requests=requests+1 return nil,"DISABLED" end
assert(not z:MigrateLegacySettings() and z.legacySettingsImportError=="DISABLED")
assert(GoatQuestSettings==nil and GoatZygSettings==nil)
C_AddOns.DoesAddOnExist=function() return false end
local oldRequests=requests
assert(not z:MigrateLegacySettings() and requests==oldRequests)
-- Never attempt to load an old full viewer in place of the migration-only addon.
C_AddOns.DoesAddOnExist=function() return true end
C_AddOns.GetAddOnMetadata=function() return nil end
assert(not z:MigrateLegacySettings() and requests==oldRequests)

-- Scope and entry point survive importing old profile defaults.
SlashCmdList={}
z.startups={}; z.db={profile={gmlastsection="Leveling Guides",loadguidesfully=true}}
z.GuideMenu={Show=function(self,path) assert(path=="LEVELING") self.shown=true end}
assert(loadfile(root.."/Compat/GuideOnly.lua"))("GoatQuest",z)
z:ApplyGuideOnlySettings()
assert(z.db.profile.gmlastsection=="LEVELING" and not z.db.profile.loadguidesfully)
assert(z.GuideCategories.LEVELING and z.GuideCategories.DUNGEONS and z.GuideCategories.PROFESSIONS)
assert(not z.GuideCategories.GOLD and not z.GuideCategories.EVENTS and not z.GuideCategories.REPUTATIONS)
assert(SLASH_GOATQUESTGUIDES1=="/goatquestguides")
SlashCmdList.GOATQUESTGUIDES(); assert(z.GuideMenu.shown)
z.db.profile.gmlastsection="PROFESSIONS\\Cooking"; z:ApplyGuideOnlySettings()
assert(z.db.profile.gmlastsection=="PROFESSIONS\\Cooking","remember valid browsing location")
z.db.profile.gmlastsection="GOLD"; z:ApplyGuideOnlySettings()
assert(z.db.profile.gmlastsection=="LEVELING")
print("PASS GoatQuest identity: settings copied once, old saves retained, canonical guide routes and allowed categories")
''')

toc = (ROOT / "GoatQuest.toc").read_text()
assert "## SavedVariables: GoatQuestSettings" in toc
assert "GoatQuestSettings" in (ROOT / "GoatQuest.lua").read_text(encoding="utf-8-sig")
assert not (ROOT / "GoatZyg.toc").exists()
assert "files-GoatQuest.xml" in toc
assert 'file="GoatQuest.lua"' in (ROOT / "files-GoatQuest.xml").read_text()
legacy_toc = (ROOT / "migration/GoatZyg.toc").read_text()
assert "## SavedVariables: GoatZygSettings" in legacy_toc
assert "## X-GoatQuest-Migration: 1" in legacy_toc
assert not [line for line in legacy_toc.splitlines() if line.strip() and not line.startswith("#")], "Migration loader must not run the retired viewer"
