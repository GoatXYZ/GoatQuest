# GoatQuest UI/UX review

Reviewed the supplied screenshot and the installed Lua/XML implementation. The screenshot
shows the left and middle portions of the browser, so conclusions about the hidden right
edge come from code, not visual evidence. Live WoW rendering has not been inspected.

## Design direction

Keep the existing restrained dark surface, readable sans-serif type and amber accent.
Use the accent for identity and selection, with consistent targets and labels. The primary
flow is **choose a category -> select a guide -> follow its steps and navigation arrow**.
Keep only Leveling, Dungeons and Professions visible, as requested. Leave saved histories
and the other guide source files intact for possible later expansion.

## Findings and implemented fixes

| Priority | Finding | Change |
|---|---|---|
| High | Two Leveling entries; a display label was being treated as a new category ID. | Canonical LEVELING routing and safe category lookup. |
| High | Disabled Gold and other unwanted sections remained exposed. | Three-category browser; matching filters in search and recent/current views. |
| High | Settings links used a different addon name than registration. | GoatQuest registration and callers use the same name. |
| High | Skills/share/checklist controls exposed disabled systems. | Hide controls and guard stale callbacks. |
| High | Reducing the catalogue could delete saved tabs or activate empty tabs. | Restore from a snapshot, archive unavailable tabs, and retain guide history. |
| Medium | Home and Featured added navigation and promotional clutter. | Guides, Current and Recent header; one Settings entry. |
| Medium | Recent and Options tabs occupied the same header anchor. | Sequential non-overlapping tab layout. |
| Medium | Fixed-size menu could extend beyond smaller UI areas. | Fit to available screen space without upscaling; retain dragging and clamp. |
| Medium | Header text competed with its settings control. | Bound heading text to available width. |
| Medium | No-results flow offered a misleading product request action. | Local guidance for finding a guide; remove request CTA. |
| Medium | Selecting a quest search result could lose its detail selection. | Correct quest focus assignment and retention. |
| Medium | Step-number mouse-wheel XML passed one malformed argument. | Pass self and delta correctly. |
| Low | Mixed legacy identity across active controls. | GoatQuest wordmarks, commands, settings and action/keybinding labels. |
| Medium | Inherited popups and help text advertised original-product support, uploads and trial upgrades. | GoatQuest popup captions, accurate local-feedback wording, installed-catalogue messages and separate original-author credits. |

## Loading review

The original implementation reads its catalogue at login/reload, then parses headers.
Detailed steps are normally parsed on selection and for saved open tabs. Loading fewer
catalogue categories and preventing full-library debug parsing are useful low-risk
reductions. True per-guide disk loading would need separate load-on-demand data addons
plus a small index and dependency tracking; it has not been implemented in this pass.

The installed catalogue changed from 90 scripts / 7.89 MB of source to 37 scripts / 5.77 MB.
Offline registration yields 670 unique Alliance guides and 635 Horde guides. These figures
describe source loading and catalogue coverage, not actual RAM consumption or elapsed time.

## Remaining in-game verification

- Confirm settings import, saved Westfall progress, frame placement and keybindings.
- Check the browser at the user's UI scale: title, search, list, details, close target and scrollbars.
- Select guides in each retained category, advance/backtrack steps, and follow map/arrow navigation.
- Confirm no fresh Lua or protected-action errors after clearing historical entries.
- Measure login/reload time and memory before deciding whether a larger lazy-loading refactor is worthwhile.

The layout changes are code-reviewed and exercised with offline mocks. This document does
not claim a live screenshot comparison or measured in-game performance improvement.
