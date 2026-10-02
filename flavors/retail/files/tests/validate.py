"""Offline GoatQuestRetail checks. Requires Python 3.10+ and lupa (Lua 5.1 runtime).

    py -3 tests/validate.py

Runs the load-graph, TOC/locale, retail-flag, map, hook, guides-only and catalogue
checks below, then every tests/test_*.py. Each check reports PASS or FAIL and the exit
code is non-zero if any failed. These are offline checks: rendering, protected actions,
guide accuracy and real loading performance still need an in-game test on 12.1.
"""
from pathlib import Path
import re
import runpy
import sys
import traceback

sys.path.insert(0, str(Path(__file__).resolve().parent))
from gqtest import ADDON, PRIVATE_FILES, ROOT, build_release, lua_runtime as new_lua, read, warn  # noqa: E402

TEXT_LOCALES = set(build_release.TEXT_LOCALES)
LICENCE = "Licence.lua"


def check_load_graph():
    """Every file any client locale can load exists and compiles; the enUS client loads only its own locale."""
    files, _, missing = build_release.load_graph(None)
    assert not [path for path in missing if path not in PRIVATE_FILES], f"Missing load dependencies: {missing}"
    if LICENCE in missing:
        warn("Licence.lua is absent: the load graph names it, tiered guides stay unregistered without it")
    lua = new_lua()
    for relative in files:
        if not relative.endswith(".lua"):
            continue
        data = (ROOT / relative).read_bytes().removeprefix(b"\xef\xbb\xbf")
        try:
            lua.compile(data)
        except Exception:
            if relative in PRIVATE_FILES:  # a syntax message could quote key text
                raise AssertionError(f"{relative} does not compile (message withheld)") from None
            raise
    enus, inline, _ = build_release.load_graph("enUS")
    for _, text in inline:
        lua.compile(text.encode())
    loaded = set(enus)
    for name in ("Compat/Bootstrap.lua", "Compat/Identity.lua", "Compat/GuideOnly.lua", "Compat/Diagnostics.lua",
                 "files-GoatQuest.xml", "Styles/Styles.xml", LICENCE):
        assert name in loaded or name in missing, f"Not loaded: {name}"
    foreign = [path for path in files if path.split("/")[0] in {
        "Code-Classic", "Code-Forever", "Data-Classic", "Guides-Classic", "Guides-ClassicSeason",
        "Libs-Classic", "Localization-Classic", "migration"}]
    assert not foreign, f"Classic/Forever files on the retail load path: {foreign[:5]}"
    assert "Localization-Retail/Localization.xml" not in files, "the stock XML would compile every locale"
    own = sorted(path for path in enus if path.startswith("Localization-Retail/"))
    assert own == ["Localization-Retail/NPCs_enUS.lua", "Localization-Retail/Quests_enUS.lua"], own
    size = sum((ROOT / path).stat().st_size for path in enus if path not in missing)
    print(f"PASS load graph: {len(files)} files for all locales, {len(enus)} files ({size / 1e6:.1f} MB) "
          f"and {len(inline)} inline scripts for an enUS client; Lua 5.1 syntax")


def check_toc():
    """Retail TOC metadata and per-locale [AllowLoadTextLocale] gating."""
    meta = build_release.toc_metadata()
    assert meta["Interface"] == "120100", meta.get("Interface")
    assert meta["SavedVariables"] == "GoatQuestSettings"
    assert meta["IconTexture"].startswith(f"Interface\\AddOns\\{ADDON}\\"), meta["IconTexture"]
    assert sorted(path.name for path in ROOT.glob("*.toc")) == [f"{ADDON}.toc"], "one TOC: no _Mainline or flavour TOCs"
    entries = build_release.toc_entries()
    gated = {path: locales for path, locales in entries if locales}
    listed = [path for path, _ in entries]
    assert len(listed) == len(set(listed)), "Duplicate TOC entry"
    for path, locales in gated.items():
        assert set(locales) <= TEXT_LOCALES, f"{path}: unknown locale in {locales}"
        assert path.startswith("Localization-Retail/"), f"Unexpected locale gate: {path}"
    problems = []
    for file in sorted((ROOT / "Localization-Retail").glob("*.lua")):
        relative = file.relative_to(ROOT).as_posix()
        text = file.read_text(encoding="utf-8-sig", errors="replace")[:400]
        guard = re.match(r'\s*if\s+GetLocale\(\)\s*~=\s*"(\w+)"\s+then\s+return\s+end', text)
        if relative not in listed:
            problems.append(f"{relative}: never loaded (not in the TOC)")
        elif relative == "Localization-Retail/NPCs_enUS.lua":
            # The base NPC table every locale falls back to: unconditional on every client.
            if relative in gated or guard or not text.lstrip().startswith('GoatQuest_L("NPCs", "enUS"'):
                problems.append(f"{relative}: must be the unconditional NPC base table")
        elif relative not in gated:
            problems.append(f"{relative}: compiled on every client (no AllowLoadTextLocale)")
        elif not guard:
            problems.append(f"{relative}: no GetLocale() guard")
        elif set(gated[relative]) != {guard.group(1)}:
            # A file gated for a client its guard rejects is compiled there for nothing.
            idle = ", ".join(locale for locale in gated[relative] if locale != guard.group(1))
            problems.append(f"{relative}: guard GetLocale()~=\"{guard.group(1)}\" returns early on its "
                            f"[AllowLoadTextLocale] client(s) {idle}, so the file loads there but does nothing")
        else:
            # Localization/Base.lua applies a table only when its locale equals GetLocale().
            table = re.search(r'GoatQuest_L\("\w+",\s*"(\w+)"', text)
            if not table or table.group(1) != guard.group(1):
                problems.append(f"{relative}: registers its table for {table and table.group(1)!r}, "
                                f"not the guarded locale {guard.group(1)!r}")
    assert not problems, "Localization-Retail gating:\n  " + "\n  ".join(problems)
    print(f"PASS TOC: Interface 120100, one TOC, {len(gated)} locale-gated files whose GetLocale guards match; "
          "NPC base table unconditional")


def check_retail_flags():
    """WoW 12.1 build info yields the Retail flavour without touching Blizzard globals."""
    core = read("GoatQuest.lua")
    flags = "\n".join(re.findall(r"^GQ\.Is(?:Classic\w*|Retail)\s*=.*$", core, re.M))
    # The bundled travel/map libraries derive their own flavour from the same globals.
    libs = "\n".join(line for path in ("Libs/LibRover-1.0/LibRover-1.0.lua", "Libs/LibTaxi-1.0/LibTaxi-1.0.lua")
                     for line in re.findall(r"^\s*Lib\.Is(?:Classic\w*|Retail)\s*=.*$", read(path), re.M))
    hbd = re.search(r"^local WoWClassic\s*=.*$", read("Libs/HereBeDragons/HereBeDragons-2.0.lua"), re.M).group(0)
    lua = new_lua()
    lua.globals()[b"flags"] = flags.encode()
    lua.globals()[b"libFlags"] = ("local addon=...\nlocal Lib={}\n" + libs + "\n" + hbd + "\nreturn Lib,WoWClassic").encode()
    lua.execute(br'''
    WOW_PROJECT_ID,WOW_PROJECT_MAINLINE,WOW_PROJECT_CLASSIC=1,1,2
    WOW_PROJECT_BURNING_CRUSADE_CLASSIC,WOW_PROJECT_WRATH_CLASSIC=5,11
    WOW_PROJECT_CATACLYSM_CLASSIC,WOW_PROJECT_MISTS_CLASSIC=14,19
    GetBuildInfo=function() return "12.1.0","69933","Sep 1 2026",120100 end
    C_QuestLog={GetInfo=function() end}
    C_Seasons=nil
    local GQ={}
    assert(loadfile(root.."/Compat/Bootstrap.lua"))(addon,GQ)
    assert(not GQ.IsForever, "a 12.1 client is not WoW Forever")
    assert(WOW_PROJECT_ID==1 and WOW_PROJECT_MAINLINE==1 and WOW_PROJECT_CLASSIC==2, "Blizzard globals must not change")
    if GQ.Compat and GQ.Compat.interfaceVersion~=nil then assert(GQ.Compat.interfaceVersion==120100) end
    assert(loadstring("local GQ=...\n"..flags))(GQ)
    assert(GQ.IsRetail==true, "IsRetail")
    assert(not (GQ.IsClassic or GQ.IsClassicTBC or GQ.IsClassicWOTLK or GQ.IsClassicCATA or GQ.IsClassicMOP))
    local Lib,WoWClassic=assert(loadstring(libFlags))(GQ)
    assert(Lib.IsRetail==true and not Lib.IsClassic and not WoWClassic, "LibRover/LibTaxi/HereBeDragons flavour")
    ''')
    print("PASS retail flags: 12.1.0 (69933) / 120100 is Retail (engine, LibRover, LibTaxi, HereBeDragons), "
          "not Forever or Classic; WOW_PROJECT_* unchanged")


def check_maps():
    lua = new_lua()
    lua.execute(br'''
    PI,abs,max,tinsert = math.pi,math.abs,math.max,table.insert
    Enum = {UIMapType={Continent=2,Dungeon=4,Micro=5,Zone=3,Orphan=6}}
    local function mapCase(empty)
        local kal,ek = 12,13 -- Retail Kalimdor and Eastern Kingdoms
        local maps = {}
        if not empty then
            maps[kal]={100,200,1000,2000,instance=1}
            maps[ek]={300,400,3000,4000,instance=0}
        end
        C_Map = {
            GetMapInfo=function(id)
                if maps[id] then return {mapID=id,mapType=2,parentMapID=947} end
            end,
            GetWorldPosFromMapPos=function() return nil end,
        }
        local z = {IsRetail=true,startups={},
            HBD={mapData=maps},LibRover={data={FloorByID={},InstanceMapsRev={}}}}
        assert(loadfile(root.."/MapCoords.lua"))(addon,z)
        local virtual = z.MapCoords.virtual_calculated
        if not empty then
            assert(virtual[0][1].x==3600 and virtual[0][1].y==4000)
            assert(virtual[0][1].w==100 and virtual[0][1].h==200)
            assert(virtual[1][0].x==800 and virtual[1][0].y==2000)
            local x,y = z.MapCoords.Mxlt(kal,0.5,0.5,ek,true,true)
            assert(type(x)=="number" and type(y)=="number")
            assert(x==x and y==y)
            assert(z.MapCoords.Mdist(kal,0,0,kal,0.5,0)==50)
            z.MapCoords.MAPDATA[ek]=nil
            z.MapCoords.TranslateVirtualContinents()
            assert(not virtual[0][1] and not virtual[1][0])
        end
        assert(next(virtual[1220])==nil, "continents without map data must be skipped")
    end
    mapCase(false)
    mapCase(true) -- no continent data yet
    ''')
    print("PASS maps: Retail continents, missing parents/children skipped, navigation math")


def check_quest_choice_hooks():
    core = read("GoatQuest.lua")
    start = core.index("\tGQ.db.char.questrewards=")
    end = core.index("\n\tif self.DEV then", start)
    lua = new_lua()
    lua.globals()[b"initHooks"] = core[start:end].encode()
    start = core.index("function GQ:Hook_QuestChoice()")
    end = core.index("\nfunction GQ.Surrogate_SendQuestChoiceResponse", start)
    lua.globals()[b"enableHooks"] = core[start:end].encode()
    lua.execute(br'''
    local function hooksCase(legacy, modern, getter, expected)
        local z={IsRetail=true,db={char={}},events=0,rewards=0,responses=0,choices=0}
        function z:AddMessageHandler() self.events=self.events+1 end
        function z:QuestRewardSelect() self.rewards=self.rewards+1 end
        function z:PlayerChoiceResponce() self.responses=self.responses+1 end
        function z.Surrogate_SendQuestChoiceResponse() z.choices=z.choices+1 end
        SendQuestChoiceResponse=legacy and function() end or nil
        C_QuestChoice=getter and {GetQuestChoiceInfo=function() return 1 end} or nil
        C_PlayerChoice=modern and {SendPlayerChoiceResponse=function() end} or nil
        local hooks={}
        hooksecurefunc=function(target,name,callback)
            if type(target)=="string" then
                assert(type(_G[target])=="function", "attempted to hook missing global")
                callback=name
            else
                assert(type(target[name])=="function", "attempted to hook missing namespace function")
            end
            hooks[#hooks+1]=callback
        end
        assert(loadstring("local GQ=...; "..initHooks))(z)
        assert(loadstring("local GQ=...; "..enableHooks))(z)
        z:Hook_QuestChoice()
        assert(#hooks==expected)
        for _,hook in ipairs(hooks) do hook(7) end
        assert(z.responses==(modern and 1 or 0))
        assert(z.rewards==((legacy and getter) and 1 or 0))
        assert(z.choices==z.rewards and z.events==z.rewards)
    end
    hooksCase(false,true,false,1) -- 12.1: C_PlayerChoice only
    hooksCase(false,false,false,0)
    hooksCase(true,false,true,2)
    hooksCase(true,true,true,3)
    hooksCase(true,false,false,0)
    ''')
    print("PASS quest-choice hooks: C_PlayerChoice on 12.1; missing, legacy and partial APIs")


def check_guide_only():
    source = read("Compat/GuideOnly.lua")
    table = re.search(r"local disabledStartups = \{(.*?)\n\}", source, re.S)
    assert table, "Compat/GuideOnly.lua: disabledStartups table not found"
    disabled = re.findall(r'\["([^"]+)"\]\s*=\s*true', table.group(1))
    # GoatQuest's disabled systems plus the Retail-only ones outside the three categories.
    for required in ("Talent Advisor", "ItemScore", "InventoryManager setup", "Gold", "Telemetry", "Sync startup",
                     "PlayerHousing setup", "Guide Menu Featured",
                     "WorldQuests", "POI hooks", "POI map icon", "PetBattle hooks", "Achievement: frame hook"):
        assert required in disabled, f"Optional system not disabled: {required}"
    # GuideOnly.lua neutralizes startups already registered when it runs: each disabled name
    # must be registered by a file loaded before it (or by a file that is not loaded at all).
    order, _, _ = build_release.load_graph("enUS")
    position = {path: index for index, path in enumerate(order)}
    registered = {}
    for path in (ROOT).rglob("*.lua"):
        relative = path.relative_to(ROOT).as_posix()
        if relative.startswith(("tests/", "Guides-")) or relative in PRIVATE_FILES:
            continue
        pattern = r'tinsert\(\s*(?:GQ|self|GoatQuest)\.startups\s*,\s*\{\s*"([^"]+)"'
        for name in re.findall(pattern, path.read_text(encoding="utf-8-sig", errors="replace")):
            registered.setdefault(name, []).append(relative)
    guide_only = position["Compat/GuideOnly.lua"]
    for name in disabled:
        assert name in registered, f"disabledStartups names no startup (typo or removed): {name}"
        late = [path for path in registered[name] if position.get(path, -1) > guide_only]
        assert not late, f"{name} registers after Compat/GuideOnly.lua and would still run: {late}"
    lua = new_lua()
    lua.globals()[b"disabledNames"] = lua.table_from([name.encode() for name in disabled])
    lua.execute(br'''
    SlashCmdList={}
    local ran={}
    local z={db={profile={}},startups={{"Travel System",function() ran.nav=true end}}}
    for _,name in ipairs(disabledNames) do
        table.insert(z.startups,{name,function() ran[name]=true end})
    end
    assert(loadfile(root.."/Compat/GuideOnly.lua"))(addon,z)
    z:ApplyGuideOnlySettings()
    for _,startup in ipairs(z.startups) do startup[2]() end
    assert(ran.nav, "navigation must start")
    for _,name in ipairs(disabledNames) do assert(not ran[name], name.." must stay disabled") end
    assert(not z.db.profile.sync_enabled and not z.db.profile.autogear and not z.db.profile.enable_vendor_tools)
    assert(z.GuideOnlyHiddenOptions.gear and not z.GuideOnlyHiddenOptions.maps)
    assert(z.GuideOnly and z.GuideCategories.LEVELING and z.GuideCategories.DUNGEONS and z.GuideCategories.PROFESSIONS)
    local count=0 for _ in pairs(z.GuideCategories) do count=count+1 end
    assert(count==3, "only Leveling, Dungeons and Professions are visible")
    ''')
    print(f"PASS guides-only configuration: navigation starts, {len(disabled)} optional startups stay disabled")


def check_guide_registration():
    """Execute the loaded catalogue scripts for both factions with a counting RegisterGuide."""
    files, _, _ = build_release.load_graph("enUS")
    guides = [path for path in files if path.startswith("Guides-") and path.endswith(".lua")]
    results = []
    for faction in ("Alliance", "Horde"):
        lua = new_lua()
        lua.globals()[b"faction"] = faction.encode()
        lua.execute(br'''
        GQ={IsRetail=true,count=0,mutex={},Gold={},titles={},
            L=setmetatable({},{__index=function(_,key) return key end}),
            IMAGESDIR="Interface/AddOns/"..addon.."/Guides-Retail/Images/"}
        GoatQuest=GQ
        function UnitFactionGroup() return faction end
        function UnitClass() return "Mage","MAGE",8 end
        function UnitRace() return "Human","Human",1 end
        function GetLocale() return "enUS" end
        function GQ:DoMutex(name)
            if self.mutex[name] then return true end
            self.mutex[name]=true
        end
        function GQ:RegisterGuide(title,metadata,body)
            assert(type(title)=="string")
            self.count=self.count+1
            self.titles[title:match("^[^\\]+")]=true
        end
        function GQ:RegisterGuidePlaceholder() end
        function GQ:RegisterInclude() end
        function GQ:RegisterMapSpots() end
        function GQ:RegisterGuideSorting() end
        function GQ.BETASTART() end
        function GQ.BETAEND() end
        -- Other engine services that catalogue scripts touch at load time (POI sets,
        -- sorting data) are covered by test_guide_loading; here they absorb any call.
        local sink=setmetatable({},{__call=function(self) return self end})
        getmetatable(sink).__index=function() return sink end
        setmetatable(GQ,{__index=function() return sink end})
        ''')
        for relative in guides:
            lua.execute((ROOT / relative).read_bytes().removeprefix(b"\xef\xbb\xbf"))
        count = lua.globals()[b"GQ"][b"count"]
        assert count > 300, f"Missing {faction} guides: {count}"
        results.append(f"{faction} {count}")
    print(f"PASS catalogue scripts: {len(guides)} files; registrations {', '.join(results)} "
          "(metadata/body parsing happens in-game)")


CHECKS = [check_load_graph, check_toc, check_retail_flags, check_maps, check_quest_choice_hooks,
          check_guide_only, check_guide_registration]


def main():
    failures = []
    for check in CHECKS:
        try:
            check()
        except Exception as error:  # noqa: BLE001 - report every failing check
            failures.append(check.__name__)
            print(f"FAIL {check.__name__}: {error}")
            if not isinstance(error, AssertionError):  # unexpected: show where
                traceback.print_exc(limit=-2, file=sys.stdout)
    for test in sorted((ROOT / "tests").glob("test_*.py")):
        try:
            runpy.run_path(str(test), run_name="__main__")
        except BaseException as error:  # noqa: BLE001 - includes SystemExit from a test
            if isinstance(error, KeyboardInterrupt):
                raise
            if isinstance(error, SystemExit) and error.code in (None, 0):
                continue  # optional checks may report a skip when upstream is not installed
            failures.append(test.name)
            lines = str(error).splitlines() or [type(error).__name__]
            print(f"FAIL {test.name}: " + "\n    ".join(line[:300] for line in lines[:15]))
    if failures:
        print(f"{len(failures)} offline check(s) failed: {', '.join(failures)}")
        raise SystemExit(1)
    print("All offline checks passed. In-game testing on WoW 12.1 is still required.")


if __name__ == "__main__":
    main()
