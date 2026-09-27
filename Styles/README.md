# The GoatQuest viewer

How GoatQuest presents the running guide: one compact, flat panel for the
current step and its objectives, plus navigation. **Options → Step Display →
Number of steps shown** includes up to four following steps with their full
objectives.

Right-click a current objective or an **Along the way** objective to open its
step menu (skip, waypoint, completion and quest actions). The current step's
heading and blank space use its primary objective. Following steps remain
previews, as in the stock viewer.

**Options → Guide Viewer**:

| Option | What it does |
|---|---|
| Navigation | **Arrow**: a flat chevron in the accent colour with the distance, travel time and waypoint title. **Halo**: a ring at your character's feet whose notch points toward the waypoint, with the distance beside it. |
| Viewer size | Scales the panel, the arrow and the ring together. |
| Accent colour | **Class colour**, or **Custom colour** with a colour picker (GoatQuest gold until changed). It colours the panel's top edge, progress bars, quest titles, the arrow, the halo's notch and the waypoint pins on the world map, minimap and flight map, including the minimap's edge arrow. |
| Ring height | Halo only: moves the ring up or down to sit at your character's feet. |
| Move frames | Opens the movers (below). |
| Lock viewer | Stops dragging the panel by its header and the arrow by its body. |

The panel is the design once called Classbound (concept 1 in
`design/goatquest-concepts.html`); the ring is concept 7's Halo, without its
meters and top line, because the panel already shows the step and progress.
The rest of the addon UI (settings, guide browser, popups) uses the matching
GoatQuest skin in `Skins/Default/GoatQuest`.

## How it fits the engine

The stock viewer (`GQ.Frame`) remains the engine's source of truth. Step
completion (`GQ:TryToCompleteStep`), `GQ:DoUpdateFrame`, the arrow pipeline,
auto-taxi and guide popups all check `GQ.Frame:IsVisible()`. So the GoatQuest
viewer never hides the stock frame:

- The stock frame's parent, `GoatQuestFrameMaster`, is faded to alpha 0.
  `GQ.Frame:GetAlpha()` stays 1, so every engine check still passes.
- `GQ.Frame` is parked off-screen so its invisible buttons cannot catch clicks.
  Post-hooks on `GQ:ReanchorFrame` and `GQ:SetSkin` keep it parked.
- The action bar is pinned to the top edge of the panel and follows it when
  it moves; it cannot be dragged off while the viewer is active.
- The viewer mirrors `GQ.Frame`'s shown state and alpha. The viewer keybinding,
  the minimap button, cinematics, dungeon auto-hide and "hide in combat"
  therefore behave exactly as they did with the stock viewer.
- The stock arrow is set to alpha 0 and made click-through. The arrow pipeline
  keeps running and calls `ShowTraveling`, `ShowArrived`, `ShowText` and the
  other `Show*` methods on the arrow frame. Post-hooks on those methods give
  the viewer the angle, distance, ETA and title without re-implementing the maths.
- The secure spell icon over the arrow (hearthstone, portals) is a sibling
  frame, so it keeps working. While it is up, the stock arrow is shown again
  and the viewer's arrow or ring stops pointing.

## Moving the viewer's parts

**Move frames** (or `/gqviewer move`) puts a labelled gold box over the guide
panel and over the arrow or the halo ring, whichever the navigation shows.
Drag a box to move its part; the part follows while you drag. Right-click a box
to put that part back, or use **Reset all**. **Done**, `/gqviewer move` again,
or entering combat closes the boxes (a drag in progress is kept). Switching the
navigation while they are open swaps the arrow's box for the ring's. Moving
works while the viewer is locked. While the boxes are open the viewer stays
visible at full alpha, even if it is hidden. **Reset windows** puts every part
back.

`Movers.lua` never positions frames itself. The viewer lists its parts in
`:GetMovers()` and saves a drop in its own profile keys, so the Ring height
slider and positions saved by dragging the header keep working.

```lua
function Viewer:GetMovers()
	return {{id="panel", label=L["..."], region=self.panel, point="TOPLEFT",
		Set=function(x,y) end,   -- place `point` of the region at x,y (UIParent units, from its bottom-left)
		Reset=function() end}}   -- clear the saved keys and place the part at its default
end
```

## Commands

`/gqviewer arrow` or `/gqviewer halo` sets the navigation (no word switches
it); `/gqviewer move` opens or closes the movers.

### WoW API limits respected

- Only unnamed, non-secure frames are created; no protected action is taken.
- Changes to the stock frames are applied out of combat. A takeover or arrow
  mouse change requested in combat waits for `PLAYER_REGEN_ENABLED`.
- Addons cannot draw in the 3D world, so the halo is a fixed overlay the player
  positions near the character's feet.
- Textures rotate with `Texture:SetRotation`; font strings never rotate.
- Font strings have no strikethrough; finished lines use a muted colour and a
  check mark instead.
- Optional client APIs are feature-detected: `CUSTOM_CLASS_COLORS`,
  `C_ClassColor`, `RAID_CLASS_COLORS`, `GetPhysicalScreenSize`.
- Fonts ship as static TTF instances; WoW does not reliably render variable fonts.
  None cover Cyrillic, Korean or Chinese, so those clients use the game font.

## Files

| File | Role |
|---|---|
| `Styles.xml` | Load order; included from `files-GoatQuest.xml` after `ActionBar.lua`. |
| `Core.lua` | Stock takeover, combat deferral, visibility mirroring, arrow data tap, update driver, settings migration, fonts, colours, widget helpers, `/gqviewer`. |
| `Model.lua` | Builds the plain snapshot the viewer renders (see the header comment for the schema). |
| `Movers.lua` | The move boxes and their bar (Reset all, Done); closes on combat. |
| `Halo.lua` | The ring, its notch and arrival state. |
| `Viewer.lua` | The panel, the arrow, and switching navigation between the arrow and the halo. |
| `Textures/*.tga` | White-on-transparent textures tinted in Lua. Regenerate with `py -3 Styles/tools/make_textures.py`. |
| `Fonts/*.ttf` | Archivo, Archivo Narrow, Atkinson Hyperlegible (SIL OFL; licences alongside). |

`nav` (the arrow data tap) fields: `mode` (`travel`, `arrived`, `error`,
`special`, `hidden`), `angle` (radians relative to facing: 0 is straight ahead,
increasing counter-clockwise, which is what `Texture:SetRotation` expects),
`dist` (yards), `eta` (seconds), `title`.

## Settings (profile keys)

`viewer_nav` (`arrow` or `halo`), `viewer_scale`, `viewer_accent` (`class` or
`custom`), `viewer_accent_color` (`{r,g,b}`, the custom colour),
`viewer_point` and `viewer_arrowpoint` (saved positions),
`viewer_halo_offset` and `viewer_halo_x` (ring, in screen units; `_x` is set only
by the movers). The stock `windowlocked` option locks dragging.

Profiles from before the merge are migrated once at startup (`Styles.Migrate`):
the size, accent and positions carry over from the old `styles_*` keys, a Halo
user keeps the halo for navigation, a gold accent becomes a custom colour that
starts out gold, and the Guiding Wind, top line and style choice keys are
removed.

The viewer hands its accent to `GQ.Pointer:SetWaypointColor(r,g,b)` whenever
it tints (the call skips unchanged colours). That recolours the pin icons in
`Pointer.ACCENT_ICONS` and redraws the markers; path ants keep their own
colours from the Maps options.

## Tests

`tests/wowmock.lua` is a small WoW UI mock (frame hierarchy, visibility, alpha,
points and rectangles, scripts and hooks, textures, font strings, combat
lockdown). `tests/styles_fixture.lua` builds a fake engine with the Westfall
step used in the mockups. `tests/test_viewer_core.py` covers Core and the model,
`tests/test_viewer_panel.py` the panel and arrow, `tests/test_viewer_halo.py` the
ring, and `tests/test_viewer_movers.py` the movers. All run from
`tests/validate.py`.
