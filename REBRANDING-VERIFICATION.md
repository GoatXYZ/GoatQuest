# GoatQuest 1.0.0 rebranding verification

Completed on September 25, 2026 against the installed WoW Forever addon.

## Completed

- Product identity, guide browser, viewer, settings, dialog captions and troubleshooting
  consistently identify GoatQuest across all 12 supported UI locale fallbacks.
- Gold goat textures replace the AddOns icon, minimap, quest finder, notification logo,
  About icon and special buttons. Popup and navigation headers use readable text.
- All five style definitions use GoatQuest logo fallbacks and square icon dimensions.
  The four styles that used the original orange accent now use GoatQuest amber.
- Branded guide filenames, internal identifiers, templates, frames and keybinding
  commands were renamed with their callers. The engine shorthand is `GQ`.
- Keybindings from the original addon are not imported; bind the GoatQuest commands once.
- Forty-three obsolete branded graphics were archived outside AddOns and verified
  against SHA-256 hashes. Shared icon sheets were visually inspected; branded cells
  in the notification and About sheets were replaced while other cells were retained.

## Verification results

`py -3.10 tests/validate.py` passes:

- 365 loaded files and 14 inline scripts: dependencies resolve and Lua 5.1 syntax compiles.
- 494 Lua/XML/TOC files: no unexpected old product names, shorthand or branded filenames remain.
  XML frame/template/mixin references agree with their Lua definitions.
- All 12 locale fallbacks and popup captions pass.
- TGA dimensions, alpha, sprite coordinates and button-state artwork pass checks
  against the packaged goat icon, using the actual Lua texture consumers.
- 670 unique Alliance guides and 635 Horde guides still register. Shared dependencies
  and next-guide links remain intact across Leveling, Dungeons and Professions.
- Settings migration, browser routing, tabs/history,
  quest localization/tracking, map coordinates, guide action buttons, combat startup
  deferral and disabled automatic raid marking pass their regression checks.

The GoatZyg settings import remains for compatibility. The audit checks that exception.

## Backups and limits

Full pre-change backup: `Interface/GoatQuest-Backups/pre-complete-rebrand-20260925-153148`.
Archived artwork inventory: `Interface/GoatQuest-Backups/archived-brand-assets-20260925-1600/manifest.json`.

These checks use the installed files and a Lua 5.1 test runtime. They do not represent
a live WoW rendering test. Native client behavior such as protected operations and
keybinding persistence must still be observed in-game. Fully exit and relaunch WoW
to refresh TOC metadata and textures, then use `/goatquestdebug` to confirm 1.0.0.
