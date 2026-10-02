# GoatQuest (Retail) 1.0.0

Quest guides and navigation for World of Warcraft Retail **12.1.0.69933 / Interface 120100**
(Midnight). Addon folder: `GoatQuestRetail`. Visible guide categories: **Leveling, Dungeons,
Professions**.

GoatQuestRetail is the Retail port of GoatQuest, the personal derivative of the guide viewer that
was made for WoW Forever. It carries GoatQuest's viewer, skin, browser and guides-only scope over to
the Retail engine and guide content. It is not an official upstream release.

## Before you start

- The guide content and the subscription data come from your own Zygor Guides Viewer installation
  and subscription. Keep `_retail_\Interface\AddOns\ZygorGuidesViewer` installed and up to date
  with the Zygor client, but **disable Zygor Guides Viewer in game** while GoatQuest is enabled.
- The tools need Python 3.10 or later (`py -3`). Installing `lupa` adds extra Lua checks to the
  tools and is required for the offline tests.

## Install and first launch

1. Put the addon in `_retail_\Interface\AddOns\GoatQuestRetail`: either extract
   `dist/GoatQuestRetail-1.0.0.zip` (it contains one `GoatQuestRetail` folder) or use this
   repository folder.
2. Copy your subscription data. From this source folder run `py -3 tools/refresh_licence.py`.
   It writes `Licence.lua` here and in an installed `AddOns\GoatQuestRetail` copy. For another
   install location add `--target "<path to AddOns\GoatQuestRetail>"`. Release ZIPs never contain
   `Licence.lua`, and without it no guide loads (see [Subscription data](#subscription-data)).
3. Optional, once: import your Zygor settings and guide progress. Close WoW, then run
   `py -3 tools/import_zygor_settings.py` (dry run) and `py -3 tools/import_zygor_settings.py --apply`.
   For each account it copies `ZygorGuidesViewer.lua` to `GoatQuestRetail.lua` in
   `WTF\Account\<account>\SavedVariables`, renaming only the saved variable. It never overwrites an
   existing GoatQuestRetail save and never changes the Zygor file. Recent-guide history is cleared
   once, the old "hide in dungeons" setting and keybindings do not carry over, and saved skin
   choices fall back to the GoatQuest skin.
4. Start the game, enable **GoatQuest (Retail)** and disable Zygor Guides Viewer.
5. `/goatquestguides` opens the guide browser. `/goatquest` opens the command and options
   interface, `/goatquest options` opens settings and `/goatquest way 33,44` sets a waypoint
   (`/gqway` for short). On the minimap button, left-click shows or hides the viewer and right-click
   opens settings. `/gqviewer` controls the viewer (see below).
6. `/goatquestdebug` reports version **1.0.0**, the client build and locale, the indexed and fully
   parsed guide counts, whether settings were imported, and the subscription data's expiry date.
   It never prints keys.

GoatQuest uses **GoatQuestSettings**. Saved tabs for hidden categories are archived inside those
settings and can be restored when the categories return; guide history is kept.

## Subscription data

GoatQuestRetail keeps the stock subscription check unchanged. Every guide is registered only if
`Licence.lua` holds a valid, current key for its category, expansion tier and faction, exactly as in
the stock Retail viewer. When the data expires, a popup and a chat warning appear, and guides stop
loading after the keys' own expiry date. To refresh it:

1. Update your guides with the Zygor client.
2. From this source folder run `py -3 tools/refresh_licence.py` (`--check` only reports).
3. Type `/reload` in game.

`Licence.lua` holds personal keys. It is git-ignored, never packaged and never printed by any tool
or command. [LICENCE-USAGE.md](LICENCE-USAGE.md) in the source folder describes every code path
that reads it, what happens when it is missing or expired, and the privacy rules.

## What changed compared with the stock Retail viewer

- Renamed the addon, global namespace (`GoatQuest`, shorthand `GQ`), frames, templates, settings,
  slash commands, titles and asset paths. Product texts no longer point to the original support,
  subscription or desktop-client services; the subscription messages explain the refresh above.
- Replaced the original mascot, logos, wordmarks and branded screenshots with the gold goat mark and
  GoatQuest text. Theme accents use GoatQuest amber.
- Replaced Home/Featured with **Guides / Current / Recent**, a GoatQuest title and one Settings
  entry. The sidebar, search, recent and current views show only the three categories, and the
  quest-log finder only offers guides the browser can show.
- Added the compact GoatQuest viewer and the flat GoatQuest skin (below). The Starlight, Stealth
  and Midnight skins and their arrows are gone.
- Talent advice, gear upgrades and item scores, inventory and vendor automation, auction and gold
  tools, telemetry, synchronization and sharing, housing, automatic raid marking and the
  home/featured promotions are not started, and their options are hidden. Retail-only systems
  outside the three categories are off as well: the World Quest planner, the rare/treasure map
  markers (POI), the pet-battle hooks and the achievement-frame hook. Covenant tracking stays on
  because the Shadowlands leveling guides use it.
- Retail 12.x fixes: settings panels register with 12.x category IDs, guide rating buttons clear
  their textures with the 12.x methods, Portuguese (ptBR) NPC and quest names now load (the stock
  files used the wrong locale code), and two leveling guides' "next guide" links and the Horde Death
  Knight starter's image name are corrected.
- The guide viewer, navigation, quest tracking, step completion, keybindings and "hide in combat"
  are the stock engine's.

## The GoatQuest viewer

GoatQuest shows the guide in one compact, flat panel: the step, its objectives with thin progress
bars, what's along the way and what comes next. The only colour is the accent: your class colour,
or a custom colour you pick (**Options → Guide Viewer → Accent colour**; it starts out GoatQuest
gold). Waypoint pins on the world map, minimap and flight map use the same accent.

**Navigation** picks how GoatQuest points the way:

- **Arrow:** a flat chevron in the accent colour with the distance, travel time and waypoint title.
- **Halo:** a ring at your character's feet whose notch points toward the waypoint, with the
  distance beside it. **Ring height** moves it to sit at your feet at your usual camera distance.

To place the panel and the arrow or ring, use **Move frames** (or `/gqviewer move`). A gold box
appears over each part. Drag a box to move its part, right-click to reset it, then click **Done**.
Combat closes the movers. `/gqviewer arrow` and `/gqviewer halo` switch the navigation.

The rest of the interface (settings, guide browser, popups) uses the matching GoatQuest skin:
flat surfaces, hairline borders, Archivo type and a gold rule along the top edge. The stock engine
keeps running underneath. See [Styles/README.md](Styles/README.md) for how it works.

## Loading and performance

Measured offline by compiling every file the TOC loads (`.work/loadgraph.py`), not in game:

| Client | Files | Compiled source |
|---|---|---|
| Stock Retail viewer (enUS) | 1000 | 96.7 MB |
| GoatQuestRetail, enUS | 393 | 41.3 MB |
| GoatQuestRetail, enGB / deDE | 392 / 394 | 40.4 / 42.1 MB |

- **Guide catalogue:** `Guides-Retail/Autoload.xml` loads 92 of the 680 upstream manifest scripts
  (21.4 of 57.5 MB of guide source): Images.lua, the 7 include files the kept guides use, and the
  Leveling (31), Dungeons (28) and Professions (25) guide files in upstream order. Every other entry
  stays in the manifest as an XML comment, so a category can be restored by uncommenting it. 84
  "Trial" files are commented as dead: their full counterpart loads first behind the same guard, so
  they can never register a guide. 25 include files no kept guide uses are commented too.
- **Localization:** each NPC and quest name file is gated with `[AllowLoadTextLocale]`, so a client
  compiles only its own locale (16.6 MB of locale files in stock).
- **Data:** the realm price tables of the gold tools, the Featured promotions and the POI module
  are not loaded.

Offline registration with the subscription check stubbed open: Alliance 1533 unique guides
(Leveling 553, Dungeons 293, Professions 685), Horde 1604 (622, 293, 687). In game, your
subscription decides which of them register. Guide headers form the browser index at login; full
step parsing happens when a guide is selected and for saved tabs. No in-game load time or memory
has been measured yet.

## Scope and known gaps

- Some kept guides offer optional steps that open one of 12 Dailies or Reputations guides (for
  example the Draenor dungeons' garrison dailies). Those guides are not loaded, so the step reports
  a missing guide. `py -3 tools/sync_guides.py` lists them.
- The Jewelcrafting daily guide (in the Cataclysm Dailies files) and the "Points of interest"
  leveling entry live in unloaded files.
- A few upstream step typos are kept as shipped (for example `ste` instead of `step`, which merges
  two steps); the stock viewer behaves the same.

## Updating guides after a Zygor update

The guide files are generated from the installed upstream addon; do not edit them by hand.

```
py -3 tools/sync_guides.py                  # dry run: report what would change
py -3 tools/sync_guides.py --apply          # write changed guide files and Autoload.xml
py -3 tools/sync_guides.py --apply --prune  # also delete files no longer shipped upstream
```

The tool reads the upstream `Guides-Retail` (never writes there), applies the shared rename
(`tools/goat_transform.py`), neutralizes support addresses and invented product names in guide
text, applies its list of upstream fixes, leaves out the branded images, and regenerates
`Autoload.xml` with the same selection rules. The dry run also lists links into unloaded
categories, missing includes, leftover branding and unknown guide keywords in new or changed
files. Engine files outside `Guides-Retail` are not synced; upstream engine changes need a manual
merge. After an update, run the tests and refresh `Licence.lua`.

## Verification

Run `py -3 tests/validate.py` (Python 3.10+ with `lupa`). It checks the TOC and XML load graph
for every locale, Lua 5.1 syntax, the per-locale gating, Retail build flags, the guides-only
configuration, both factions' catalogue registration and links, that `Guides-Retail` matches the
sync tool's output, texture and font paths, the subscription check (identical to stock, plus
behaviour with synthetic keys), settings import, the browser, viewer, skin, options, quest tracking,
raid-marker and action-button behaviour, and the release ZIP.

These are offline checks. Rendering, protected actions, quest accuracy and real loading
performance still need an in-game check on 12.1.

## Releasing

1. Run `py -3 tests/validate.py`.
2. After adding, deleting or changing files, run `py -3 tools/build_release.py --manifest` to
   regenerate `build-manifest.json` (needs the transformed upstream baseline in
   `..\.work\retail-baseline`).
3. Run `py -3 tools/build_release.py`. It writes `dist/GoatQuestRetail-1.0.0.zip` (the version
   comes from the TOC) with one `GoatQuestRetail` folder: the code the TOC can load for any
   locale, the runtime assets and this README. It never contains `Licence.lua`, tests, tools,
   design files, unloaded guide categories or developer notes.
4. A ZIP install needs its own `Licence.lua`: run `tools/refresh_licence.py --target` from the
   source folder (step 2 of the install).
