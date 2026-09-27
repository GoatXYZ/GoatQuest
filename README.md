# GoatQuest 1.3.0

Quest guides and navigation for WoW Forever beta **1.60.1.70009 / Interface 16001**.
Visible guide categories: **Leveling, Dungeons, Professions**.

## First launch after the rename

1. Fully exit and restart WoW; a new addon folder needs to be discovered.
2. Enable **GoatQuest (Forever)** and **GoatQuest - Settings Import** for this first login.
3. Keep the original Retail and Classic guide viewer add-ons disabled.
4. Use `/goatquestguides` to browse guides. `/goatquest` opens the command/options interface;
   `/goatquest options` opens settings, and `/goatquest way 33,44` sets a waypoint.
   On the minimap button, left-click shows or hides the viewer and right-click opens settings.
5. `/goatquestdebug` should report **1.3.0**. It also reports the indexed/fully parsed guide
   counts and whether old settings were imported.

GoatQuest uses **GoatQuestSettings**. On first launch it copies your old **GoatZygSettings**,
including character guide progress and profiles, without changing the old save. Existing
GoatQuest progress is never overwritten by a later import. The import addon contains no
viewer or gameplay code. After successful import and logout, it can be disabled.
Saved tabs for unavailable categories are archived inside GoatQuest settings and can be
restored when those guides are made available again; guide history is retained.

The previous GoatZyg installation is archived outside AddOns under
`Interface/GoatQuest-Backups`. The old GoatZyg folder now contains only the settings loader.
The original Retail and Classic source addons have not been changed.

## What changed

- Version 1.3.0 pins the action bar to the top of the guide viewer; it follows the
  viewer when it moves and can no longer be dragged away.
- Version 1.1.0 restores the selected 1–5 steps in the viewer and right-click
  menus for current objectives and **Along the way** objectives.
- Renamed the addon, main engine/global namespace, frame prefixes, asset paths, settings,
  slash commands, visible title, settings links, action-button labels and keybinding labels.
- Updated inherited interface text and popup captions to GoatQuest. Missing-guide messages
  describe the installed catalogue, and troubleshooting no longer points to the original
  product's support, subscription or desktop-client services.
- The engine shorthand is `GQ` (global, frames, templates, mixins and events). Keybindings
  and the "Hide viewer when entering dungeons" option from earlier builds are not carried
  over, and recent-guide history is cleared once on first login.
- Replaced AddOns/minimap/quest-finder/About/notification icons with the gold goat mark,
  and popup/navigation banners with GoatQuest text. Theme accents use GoatQuest amber.
- Renamed guide files and internal frame/template identifiers. Archived 43 old graphics
  outside AddOns; the original source-addon installations remain separate and unchanged.
- Replaced Home/Featured with **Guides / Current / Recent**, a GoatQuest title and one Settings entry.
- Removed the duplicate Leveling category, hidden/empty folders, and unsupported-category entries.
- Kept the chosen categories consistent across the sidebar, search, recent and current views.
- Improved section heading bounds, close-button hit area, small-screen fitting, search empty
  states and quest-result selection. The guide browser remains draggable and screen-clamped.
- Removed sharing, Skills advice and setup-checklist controls whose supporting systems are disabled.
- Fixed scrolling the step number. All prior quest/map/tracking/startup/raid-marker fixes remain.

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
flat surfaces, hairline borders, Archivo type and a gold rule along the top edge. The Starlight
and Stealth skins, their arrows and the transparency option are gone.

The stock engine keeps running underneath, so step completion, navigation, keybindings and
"hide in combat" behave as before. See [Styles/README.md](Styles/README.md) for how it works.

## Loading and performance

The enabled guide catalogue files are read at login/reload. Guide headers form the browser
index; full step parsing happens when a guide is selected and for saved open guide tabs.
Full-library parsing is disabled in guides-only mode.

GoatQuest does not load or require `Licence.lua`. Installed guides have no runtime key or
expiration checks. Beta guides are available by default; explicit beta overrides still apply.

The catalogue now includes only Leveling, Dungeons and Professions plus shared dependencies.
Unused guide files remain on disk for reversible expansion later. Season of Discovery files
in the separate seasonal catalogue are not loaded on Forever. Some seasonal text is still
embedded in shared leveling files. Catalogue scripts decreased from **90 to 37**, and their
source size from **7.89 MB to 5.77 MB** (about 27% less). This is **not** true per-guide
loading from disk, and no in-game speed or memory claim has been measured.

## Scope

Talent advice, gear upgrades, inventory/vendor automation, auction tools, gold scanning,
telemetry, housing, synchronization and automatic raid marking remain disabled. Some shared
support definitions are retained because the guide/navigation engine references them.

Classic quest content is inherited from the supplied guides; changed/new Forever quests and
routes are not automatically authored or verified by this adaptation.

This is a personal derivative of the supplied source copies, not an official upstream release or
a clean-room rewrite.

## Verification

Run `python tests/validate.py` with Python 3 and Lupa's Lua 5.1 runtime installed. The checks
cover the manifest/XML load graph, Lua syntax, both factions' guide registration, shared guide
dependencies, settings migration, browser routing/filtering, viewer controls, map/navigation
math, quest text/tracking, guide action buttons, startup without a license payload, and
startup deferral across combat.

These are offline checks. Actual rendering, protected-action behavior, beta quest accuracy,
and real loading performance still need an in-game check after restart.

See [REBRANDING-VERIFICATION.md](REBRANDING-VERIFICATION.md) for the completed branding
audit and the exact kinds of legacy references intentionally retained.

See [UI-UX-REVIEW.md](UI-UX-REVIEW.md) for the review and remaining validation items.
API compatibility was compared with the matching extracted Blizzard UI source:
[Forever branch](https://github.com/Gethe/wow-ui-source/tree/forever).
