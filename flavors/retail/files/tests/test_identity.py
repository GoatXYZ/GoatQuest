"""Verify retail identity: settings, imported-save marker, commands and allowed guide routes."""
from pathlib import Path
import sys

sys.path.insert(0, str(Path(__file__).resolve().parent))
from gqtest import ROOT, build_release, lua_runtime, read  # noqa: E402

lua = lua_runtime()
lua.execute(br'''
local now=1700000000
time=function() return now end
local z={}
assert(loadfile(root.."/Compat/MigrateSettings.lua"))(addon,z)
-- First login of a fresh install: an empty save is marked, nothing is reported as imported.
GoatQuestSettings=nil
assert(not z:MigrateLegacySettings() and not z.legacySettingsImported)
assert(type(GoatQuestSettings)=="table" and GoatQuestSettings.global.goatquest_retail)
assert(GoatQuestSettings.global.goatquest_imported_from==nil)
-- A copied (renamed) Zygor save has data but no marker: keep every value, record the import once.
GoatQuestSettings={profileKeys={["Goat - Realm"]="Default"},
    profiles={Default={framescale=0.9,gmlastsection="LEVELING"}},
    char={["Goat - Realm"]={guidename="LEVELING\\Exile's Reach",step=12,tabguides={{title="LEVELING\\Exile's Reach"}}}}}
assert(z:MigrateLegacySettings() and z.legacySettingsImported)
assert(GoatQuestSettings.char["Goat - Realm"].step==12 and GoatQuestSettings.profiles.Default.framescale==0.9)
assert(GoatQuestSettings.global.goatquest_imported_from=="ZygorGuidesViewer")
assert(GoatQuestSettings.global.goatquest_imported_at==now)
-- Later logins never re-import or overwrite progress.
z.legacySettingsImported=nil
GoatQuestSettings.char["Goat - Realm"].step=13
now=now+60
assert(not z:MigrateLegacySettings() and not z.legacySettingsImported)
assert(GoatQuestSettings.char["Goat - Realm"].step==13 and GoatQuestSettings.global.goatquest_imported_at==now-60)

-- Scope and entry point survive imported profile defaults.
SlashCmdList={}
z.startups={}; z.db={profile={gmlastsection="Leveling Guides",loadguidesfully=true}}
z.GuideMenu={Show=function(self,path) assert(path=="LEVELING") self.shown=true end}
assert(loadfile(root.."/Compat/GuideOnly.lua"))(addon,z)
z:ApplyGuideOnlySettings()
assert(z.db.profile.gmlastsection=="LEVELING" and not z.db.profile.loadguidesfully)
assert(z.GuideCategories.LEVELING and z.GuideCategories.DUNGEONS and z.GuideCategories.PROFESSIONS)
assert(not z.GuideCategories.GOLD and not z.GuideCategories.EVENTS and not z.GuideCategories.REPUTATIONS)
assert(not z.GuideCategories.PETSMOUNTS and not z.GuideCategories.ACHIEVEMENTS and not z.GuideCategories.DAILIES)
assert(SLASH_GOATQUESTGUIDES1=="/goatquestguides")
SlashCmdList.GOATQUESTGUIDES(); assert(z.GuideMenu.shown)
z.db.profile.gmlastsection="PROFESSIONS\\Cooking"; z:ApplyGuideOnlySettings()
assert(z.db.profile.gmlastsection=="PROFESSIONS\\Cooking","remember valid browsing location")
z.db.profile.gmlastsection="GOLD"; z:ApplyGuideOnlySettings()
assert(z.db.profile.gmlastsection=="LEVELING")
print("PASS GoatQuest identity: imported saves kept and marked once, fresh saves marked; canonical guide routes and allowed categories")
''')

# /goatquestdebug reports the retail client and the licence state without key values.
lua = lua_runtime()
lua.execute(br'''
local lines={}
print=function(text) lines[#lines+1]=text end
SlashCmdList={}
tinsert=table.insert
date=os.date
time=function() return 1700000000 end
GetBuildInfo=function() return "12.1.0","69933","Sep 1 2026",120100 end
GetLocale=function() return "enUS" end
WOW_PROJECT_ID=1
C_Map={GetBestMapForUnit=function() return 2393 end,GetMapInfo=function() return {name="Silvermoon City"} end}
function GoatQuest_L() return {} end
local z={version="1.0.0.37179",IsRetail=true,initialized=true,GuideCategories={LEVELING=true,DUNGEONS=true,PROFESSIONS=true},
    registeredguides={{type="LEVELING"},{type="DUNGEONS",fully_parsed=true},{type="GOLD"}},db={global={}}}
assert(loadfile(root.."/Compat/Diagnostics.lua"))(addon,z)
assert(SLASH_GOATQUESTDEBUG1=="/goatquestdebug")
local secret="SYNTHETIC-KEY-0000000000000"
z.Licences={LEVELING={TRI={A=secret}},DATE_E=time()+86400*3}
SlashCmdList.GOATQUESTDEBUG()
local output=table.concat(lines,"\n")
assert(output:find("12.1.0",1,true) and output:find("120100",1,true) and output:find("Retail=true",1,true))
assert(not output:find("Forever",1,true), "Forever-only diagnostics on Retail")
assert(not output:find(secret,1,true), "diagnostics must never print key values")
assert(output:find("Licence",1,true))
''')
print("PASS /goatquestdebug: retail build, locale, guides and licence state; no key values")

meta = build_release.toc_metadata()
assert meta["SavedVariables"] == "GoatQuestSettings"
assert "GoatQuestSettings" in read("GoatQuest.lua")
order = [path for path, _ in build_release.toc_entries()]
assert order.index("Compat/MigrateSettings.lua") < order.index("files-GoatQuest.xml"), "import marker runs before AceDB"
assert "files-GoatQuest.xml" in order
assert 'file="GoatQuest.lua"' in read("files-GoatQuest.xml")
assert not (ROOT / "migration").exists() and not (ROOT / "GoatZyg.toc").exists(), "Forever's GoatZyg loader has no retail role"
assert "GoatZyg" not in read("Compat/MigrateSettings.lua") and "GoatZyg" not in meta.get("OptionalDeps", "")
print("PASS identity metadata: GoatQuestSettings, import marker before the engine, no Forever migration loader")
