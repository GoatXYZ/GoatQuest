# How GoatQuestRetail uses Licence.lua

GoatQuest for WoW Forever removed `Licence.lua` and every check of it. GoatQuestRetail keeps both,
unchanged from the stock Retail guide viewer, because on Retail the guide content comes from your own
paid Zygor guide subscription. This document explains what the file is, every place the addon reads
it, what happens when it is missing or out of date, how to keep it current, and why it is kept.

It describes behaviour only. It deliberately leaves out how a key is built or checked in detail (see
[What this document leaves out](#what-this-document-leaves-out)). File references are
`path:line` in this repository. Function and line ranges were checked against the code when this was
written.

## Summary

- `Licence.lua` is the guide subscription data that the Zygor client writes for your account: one
  opaque key per guide category, expansion tier and faction, plus an expiry date (`DATE_E`).
- Every guide passes a subscription check (`GQ:NeedsAnimatedPopup`) when it is registered at load
  time. A guide without a valid key for its category, tier and faction is not registered, so it does
  not appear anywhere. The check fails closed: no file, no matching key or an invalid key all hide
  the guide.
- `DATE_E` drives the "Subscription expired" popup, a chat warning near and after expiry, and whether
  beta guide content is shown.
- To keep it current, update your guides with the Zygor client, run `py -3 tools/refresh_licence.py`
  from your GoatQuestRetail source folder, then type `/reload`. `/goatquestdebug` shows the file's status.
- The keys are personal. `Licence.lua` is git-ignored, never packaged in release ZIPs and never
  printed by any GoatQuestRetail tool or command.

## What the file contains

`Licence.lua` is plain Lua with a single table:

| Line(s) | Content | Meaning |
|---|---|---|
| 1 | `if not GoatQuest then return end` | Does nothing unless the addon namespace already exists. |
| 2 | `GoatQuest.Licences = {` | Every value lives in `GQ.Licences`. |
| 3 | `DATE_E = <number>, -- <date and time>` | Expiry of this subscription data as a Unix timestamp. The comment shows the same moment as a readable date. |
| rest | `<CATEGORY> = { <TIER> = { A = "<key>", H = "<key>" }, ... }` | One key per category, tier and faction. |

**Categories** are the guide types that the engine derives from the first part of a guide's title
path (`GQ:SanitizeGuideTitle`, `GoatQuest.lua:4470`; for example "Leveling Guides\..." becomes
`LEVELING`). The Retail file has entries for `LEVELING`, `LOREMASTER`, `DAILIES`, `EVENTS`,
`DUNGEONS`, `GEAR`, `PROFESSIONS`, `ACHIEVEMENTS`, `GOLD`, `PETSMOUNTS`, `TITLES`, `REPUTATIONS`,
`MACROS` and `MISC`. GoatQuestRetail shows only Leveling, Dungeons and Professions, but the file is
used exactly as delivered.

**Tiers** are the values the guide files put in `GoatQuest.GuideMenuTier`. Each file has one tier,
mostly matching its expansion:

| Tier | Used by Retail guide files for |
|---|---|
| `TRI` | Starter guides (`Starters*.lua`, the Pandaren starter file) and the "Trial" files |
| `CAT` | Classic-to-Cataclysm era files (`...CATA.lua`) |
| `MOP`, `WOD`, `LEG`, `BFA` | Mists of Pandaria, Warlords of Draenor (including Garrison), Legion, Battle for Azeroth (and one `...DRAGON.lua` file) |
| `SHA` | Shadowlands and every later expansion file (`SHADOW`, `DRAGON`, `TWW`, `MID`) and Class Heritage |
| `DRA`, `ELI`, `CLA` | Present in the file, but no Retail guide file uses them |

Not every category has every tier: the Retail file has no `CAT` slot for `DUNGEONS` and `GEAR`,
`GOLD` has only `WOD`, `LEG`, `BFA`, `SHA` and `CLA`, and `MACROS` and `MISC` have only `TRI` and
`WOD`. The file holds 212 keys in total.

**Factions** are `A` (Alliance) and `H` (Horde). The check uses `A` when `UnitFactionGroup("player")`
is "Alliance" and `H` for everything else, including Neutral characters (`Parser.lua:328`).

**Keys** are opaque text. Each key embeds a validity check and an expiry date verified by
`GQ:NeedsAnimatedPopup`.

The stock code also reads an optional `DATE_S` date (`Functions.lua:1457`, `1517`). The Retail file
has no `DATE_S`, so those branches never fire while the file is present.

## Where it is loaded and why the order matters

`GoatQuestRetail.toc:44` loads `files-GoatQuest.xml`, which loads in this order (the same positions
as the stock `files-Retail.xml`, lines 9, 11, 15, 27, 46 and 124 there):

| `files-GoatQuest.xml` | File | Why it matters |
|---|---|---|
| 9 | `GoatQuest.lua` | Creates the global `GoatQuest` (`GoatQuest.lua:20`) that `Licence.lua` line 1 requires. |
| 11 | `Licence.lua` | Fills `GQ.Licences`. |
| 15 | `Functions.lua` | Defines `GQ:RenderAnimation` (`Functions.lua:1149-1162`), which the check uses to build the names it looks up. |
| 27 | `Parser.lua` | Defines the check, `GQ:NeedsAnimatedPopup` (`Parser.lua:324-367`). |
| 46 | `Guide.lua` | Defines `Guide:New`, which calls the check, and the type/tier/faction lists it compares against (`Guide.lua:118-152`). |
| 130 | `Guides-Retail\Autoload.xml` | The guide files. Each one calls `GoatQuest:RegisterGuide` while it is being loaded. |

Two ordering rules follow:

1. `Licence.lua` must load after `GoatQuest.lua`. Loaded earlier, line 1 returns silently,
   `GQ.Licences` stays empty and every guide is hidden.
2. `Licence.lua` must load before the guide files. The check runs once per guide, while the guide
   file executes during addon loading. Its result holds for the whole session, so a refreshed file
   only takes effect after `/reload` or a new login.

## Every code path that reads it

### 1. The registration gate (`Guide.lua`, `Parser.lua`)

1. A guide file calls `GQ:RegisterGuide` (`GoatQuest.lua:4502`), which calls
   `GQ.GuideProto:New` (`GoatQuest.lua:4514`, defined as `Guide:New` at `Guide.lua:22`).
2. `Guide:New` records the guide's category from its title path and its tier from
   `GQ.GuideMenuTier` (`subtype=GQ.GuideMenuTier`, `Guide.lua:91`).
3. Unless the title path contains `SHARED`, it calls `GQ:NeedsAnimatedPopup(guide)`
   (`Guide.lua:104`). If that returns true, it sets `GQ.AnimatePopup = true` (`Guide.lua:105`) and
   returns nil, and `GQ:RegisterGuide` stops at `if not guide then return end`
   (`GoatQuest.lua:4517`). The guide is never added to `GQ.registeredguides`, so the browser,
   search, suggestions and "next guide" links never see it.

`GQ:NeedsAnimatedPopup` (`Parser.lua:324-367`) is the subscription check. Its names ("animation",
"seasonal decorations") are deliberately misleading, and the table names it reads (`Licences`,
`GuideProto`) are assembled at run time by `GQ:RenderAnimation` instead of appearing as text. It:

- looks up the key for the guide's category, tier and the player's faction in `GQ.Licences`
  (`Parser.lua:336`);
- returns true (hide the guide) when `GQ.Licences` is missing or has no key in that slot
  (`Parser.lua:364-365`);
- otherwise verifies the key: that it belongs to that category, tier and faction, that its built-in
  validity check passes and that its embedded expiry date has not passed. It returns false (register
  the guide) only if all of that holds (`Parser.lua:337-363`).

Who is affected:

- **Every catalogue guide.** All 235 guide files in `Guides-Retail` that register guides set
  `GoatQuest.GuideMenuTier` before their first registration (checked offline), so every
  Leveling, Dungeons and Professions guide, including the free starter guides (tier `TRI`), needs a
  valid key.
- **Untiered guides** would get `subtype=nil`, find no key and be hidden. Missing data hides
  guides; it never unlocks them. No catalogue guide is untiered.
- **`SHARED` guides** skip the check (`Guide.lua:104`). Only party guide sharing creates them
  (`Sync.lua:377`, title `SHARED\<guide>`), and GoatQuestRetail does not start Sync
  (`"Sync startup"`, `Compat/GuideOnly.lua:16`). No catalogue guide title contains `SHARED`.
- **Placeholders** (`GQ:RegisterGuidePlaceholder`, `GoatQuest.lua:4533`) do not pass through
  `Guide:New` and are not checked. They are listed as unavailable entries. Only the "Trial" files use
  them, and those files do not run while the full files are installed (next section).

An offline run of the unmodified check against the current `Licence.lua` and the current catalogue
registered every Leveling, Dungeons and Professions entry for both factions (1579 Alliance and
1647 Horde registrations, none hidden). One stock entry is always hidden, even with a current file: the
"Alliance Loremaster Guides\Your guides will load after you choose a faction." placeholder guide in
`Guides-Retail/Leveling/GoatQuestLevelingPandaStarterMOP.lua` (category `LOREMASTER`, tier `TRI`).
So `GQ.AnimatePopup` is true in every session, and "guides withheld this session: yes" in
`/goatquestdebug` is normal on its own.

### 2. Tier tagging, `GQ:DoMutex` and the Trial files

Every guide file starts with a faction check, a `GQ:DoMutex` call and a tier assignment. Some files
put the mutex call before the faction check. For example
`Guides-Retail/Leveling/GoatQuestLevelingAllianceDRAGON.lua:3-5`:

```lua
if UnitFactionGroup("player")~="Alliance" then return end
if GQ:DoMutex("LevelingADRAGON") then return end
GoatQuest.GuideMenuTier = "SHA"
```

- `GQ:DoMutex` (`GoatQuest.lua:5226-5229`) first resets `GoatQuest.GuideMenuTier` to nil, then
  returns true if this mutex name has already been claimed and claims it otherwise.
- The file then sets its tier, and every `RegisterGuide` call after that is checked against that tier.
- Each full file has a "Trial" twin (`...Trial.lua`) that uses the same mutex name and tier `TRI`.
  The Trial twin mostly registers placeholders and a few free guides. `Guides-Retail/Autoload.xml`
  lists the full file first, so the full file claims the mutex and its Trial twin returns at the
  `DoMutex` line. With the full files installed, Trial content never registers. Without a full file,
  its Trial twin would load instead: placeholders, plus free guides that need the `TRI` key.

### 3. The expiry popup when startup finishes

At the end of the startup thread, after the guides and the initial guide have loaded, the addon calls
`GQ.Licence:CheckExpirationPopup()` (`GoatQuest.lua:999`; function at `Functions.lua:1450-1497`):

- If `DATE_E` has passed, it shows a "Subscription expired" popup unless
  `profile.expired_elite_shown` is set (`Functions.lua:1464-1476`). That flag is only set when
  `DATE_S` has also passed. The Retail file has no `DATE_S`, so the popup appears at every login and
  `/reload` while the data is expired. While `DATE_E` is in the future, the flag is cleared.
- If `GQ.Licences` does not exist (the file is missing or failed to load), it shows a "Guides
  outdated" popup at every login (`Functions.lua:1460-1461`, `1478-1482`).
- Either popup also makes the guide viewer visible (`GQ:SetVisible(nil,true)`, `Functions.lua:1485`).

GoatQuestRetail changed only the popup body text (`Functions.lua:1468`, `1480`) so that it describes
the real fix: update your guides with the Zygor client, run `py -3 tools/refresh_licence.py` from your
GoatQuestRetail source folder and type `/reload`. The conditions, dates and flags are stock.

### 4. The chat warning while the viewer is shown

Whenever the visible viewer redraws, `GQ:DoUpdateFrame` (`GoatQuest.lua:2675`) calls
`GQ.Licence:CheckExpirationWarning()` (`GoatQuest.lua:2680`; function at
`Functions.lua:1499-1530`). It returns immediately without `GQ.Licences`. Otherwise it prints one
chat warning per session (`GQ.Licence.WarningShown_E`) once `DATE_E` is less than an hour away or
has passed. Only the message text (`Functions.lua:1502`) was changed.

### 5. Beta content (`GQ:SetBeta`)

At `PLAYER_LOGIN`, `GQ:OnEnable` calls `self:SetBeta()` (`GoatQuest.lua:569`; function at
`GoatQuest.lua:6091-6095`). An explicit argument or a saved `profile.debug_beta` override wins.
Otherwise `GQ.BETA` is true only while `DATE_E` is in the future. `GQ.BETA` controls:

- guides registered between `GQ.BETASTART()` and `GQ.BETAEND()` (flagged at `GoatQuest.lua:4516`,
  dropped at `GoatQuest.lua:621` when `GQ.BETA` is false);
- guide steps inside `--@@BETASTART` / `--@@BETAEND` sections (`Parser.lua:1846-1847`, `2070`,
  hidden by `Step.lua:186`);
- beta-flagged entries of the guide menu and widgets (`GuideMenu-View.lua:1351`,
  `UiWidgets/Visuals.lua:37`).

No Leveling, Dungeons or Professions file currently contains beta guides or beta sections, so today
this only matters for hidden categories. `GQ.BETA` is computed once per session.

### 6. `GQ.Licence` helpers that never take effect

`Functions.lua:1415-1448` also defines:

- `GQ.Licence:CheckLicence` (`1417-1425`), with `GetType`, `GetSubtype` and `GetSide`
  (`1427-1429`). Nothing calls `CheckLicence`, and it calls `GQ.Licence:GetKey` and
  `GQ.Licence:ShowExpiredPopup`, which are not defined anywhere. It would raise an error if it were
  ever called.
- `GQ.Licence:VerifyKeyIntegrity` (`1433-1443`) and `GQ.Licence:VerifyKeyExpiration`
  (`1445-1448`). Both depend on a global `GenericGoatQuestLicenceEngine`, which nothing in this addon
  or in any installed Retail addon defines (only the stock `ZygorGuidesViewer/Functions.lua`
  mentions its stock name). `VerifyKeyIntegrity` returns false at its first or second line, and
  `VerifyKeyExpiration` returns false.
- The only call, in the `"Guide: registering events"` startup (`Guide.lua:1244`), passes
  `GQ.registered_guide_key`, which is never assigned, and ignores the result.

These helpers have no effect on which guides load. They are kept because they are stock code.

### 7. The dormant "animated" popup

`GQ:ShowAnimatedPopup` (`GoatQuest.lua:5195-5211`) would show a "Subscription expired" popup
with a renewal message. Its only call is commented out (`GoatQuest.lua:1011`), so it never runs.
`GQ.AnimatePopup` is set by the gate but read only by GoatQuestRetail's own status messages
(below).

### 8. GoatQuestRetail additions that read it (read-only)

- `/goatquestdebug` (`Compat/Diagnostics.lua:14-28`) prints whether `Licence.lua` loaded, the
  `DATE_E` date with the days left or since expiry, and whether any guide was hidden by the check
  this session. It never prints keys.
- When no guide at all registered and the check hid at least one, startup prints "No guides loaded:
  the guide subscription data in Licence.lua is missing, invalid or expired"
  (`GoatQuest.lua:988-989`) instead of the generic message.
- `tools/refresh_licence.py` reads the upstream file and `Licence.lua` offline (see
  [Keeping it current](#keeping-it-current)).

None of these changes which guides register.

## When the file is missing, malformed or expired

| Situation | Guides | What you see |
|---|---|---|
| Current file, all keys valid | All catalogue guides register (see the Loremaster placeholder above). | Nothing. |
| Less than an hour before `DATE_E` | Unchanged. | One chat warning per session while the viewer is shown. |
| `DATE_E` has passed, keys still valid | Unchanged until the keys' own expiry dates pass. Beta content is hidden (`GQ.BETA` false). | "Subscription expired" popup at every login and `/reload`, plus one chat warning per session. |
| Keys' own expiry dates have passed | Every guide whose key expired is hidden: in practice the whole catalogue. | The browser categories are empty, "0 guides are loaded.", "No guides loaded: the guide subscription data in Licence.lua is missing, invalid or expired...", plus the "Subscription expired" popup and warning. |
| One key missing or damaged | Only that category/tier/faction's guides are hidden, with no message. | Those guides are missing from the browser. |
| File missing, or loaded before `GoatQuest.lua` | Every guide is hidden. | "Guides outdated" popup at every login, "0 guides are loaded.", the "No guides loaded: ..." line, and "Licence.lua not loaded" in `/goatquestdebug`. |
| File is not valid Lua | Same as missing: none of it runs. | Additionally, WoW reports a Lua error for `Licence.lua` (visible with Lua errors shown or in an error addon such as BugSack). |
| `DATE_E` missing, keys valid | Guides register by key. Beta content is hidden. | No popup or warning. `/goatquestdebug` shows "no expiry date". |

With the current file, the keys' own expiry dates fall on the same day as `DATE_E`. An offline run of
the unmodified check, using the local date, registered every kept-category guide on that day and none
from the next day. In practice, the "Subscription expired" popup appears from the moment stored in
`DATE_E`, and the guides disappear at the first login or `/reload` on the following day.

The check itself never writes to saved settings. A refresh followed by `/reload` registers the guides
again. A Lua error from a corrupted `Licence.lua` can quote part of the file, so do not share such
error reports or screenshots unredacted.

## Keeping it current

1. Update your guides with the Zygor client. It rewrites
   `World of Warcraft\_retail_\Interface\AddOns\ZygorGuidesViewer\Licence.lua` for your account. That
   folder must stay installed, but keep Zygor Guides Viewer disabled in game while GoatQuestRetail is
   enabled.
2. In your GoatQuestRetail source folder (the repository; release ZIPs do not contain `tools/`), run:

   ```
   py -3 tools/refresh_licence.py           # copy the current subscription data
   py -3 tools/refresh_licence.py --check   # only report; exit code 1 when an update is pending
   ```

   The tool copies the upstream file through the shared name transform (`tools/goat_transform.py`).
   It updates this folder and, if one exists, the installed copy in `_retail_\Interface\AddOns`
   (`--target` selects folders explicitly). Before writing, it confirms that the upstream file has
   a Licences table and `DATE_E`, that the transform leaves every key string unchanged and that
   the result loads in Lua 5.1 when `lupa` is installed. It replaces the file atomically. It refuses
   to replace a file with one that expires earlier unless you pass `--allow-older`. Running it again
   changes nothing. Exit codes: 0 means up to date or refreshed, 1 means an update is pending
   (`--check`) or was refused, and 2 means the upstream file is missing or unusable.
   It prints paths and expiry dates only.
3. Type `/reload` in game. `/goatquestdebug` should show the new expiry date.

The game can stay open while you refresh. The file is only read at load time.

## Privacy

- The keys belong to your subscription. Treat `Licence.lua` like a password file.
- `.gitignore:3` ignores `/Licence.lua`. Check it with `git check-ignore -v Licence.lua`.
  The file is not in the git index.
- `tools/build_release.py` never packages it (`PRIVATE_FILES`, `tools/build_release.py:32`, checked
  in `release_files()` and skipped by `_source_files()` when the manifest is generated). Every
  installation gets its own copy from `tools/refresh_licence.py` (`--target` for a ZIP install).
- `tools/refresh_licence.py`, `/goatquestdebug` and the startup messages print dates and status only.
  The offline tests use synthetic keys and skip the real file in content scans (`PRIVATE_FILES` and
  `source_files()` in `tests/gqtest.py`).
- Do not paste `Licence.lua`, or error reports that quote it, into issues, chats or logs.

## Why it is kept

GoatQuest for Forever removed the file and its checks. GoatQuestRetail does not. On Retail, the
guides in `Guides-Retail` are the content of your Zygor subscription,
and `Licence.lua` is what limits them to a valid, current subscription. Removing the check, defaulting
it to "allowed", setting `GQ.BETA` permanently or registering hidden guides another way would make
every guide available without a valid key, which would bypass the paid subscription.
GoatQuestRetail therefore keeps the stock behaviour:

- `GQ:NeedsAnimatedPopup`, the `Guide:New` gate, `GQ.AnimationVariables` and `GQ:RenderAnimation`,
  the `GQ.Licence` table and functions, `GQ:SetBeta` and the expiry calls match the stock Retail code
  apart from the name transform.
- GoatQuestRetail changed only the user-facing popup and warning texts, the wording of two
  commented-out messages, and added the read-only status reporting and the refresh tool described
  above.

## What this document leaves out

This document does not describe the key format, how a key's validity check or embedded expiry date
is computed, or any other detail that could be used to create, alter or extend a key. Keys come only
from the Zygor client for an active subscription. If guides disappear, refresh the file from an
up-to-date Zygor installation.
