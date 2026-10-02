# Shared-source extraction

Implemented from the architecture discussed in T3 thread
`1a97f5e4-2a97-483d-859e-9495725dda12` on 2026-10-02: shared source with independently
assembled Forever and Retail addons. The referenced Retail thread was still awaiting its
review results when this snapshot was imported. Future fixes can be reconciled with
`py -3 tools/import_sources.py --apply`.

## Imported state

| Flavor | Original tree | Source files | Release version |
| --- | --- | ---: | --- |
| Forever | `C:/GoatWoW/GoatQuest` | 760 | 1.3.1 |
| Retail | `C:/GoatWoW/GoatQuestRetail` | 1,532 | 1.0.0 |

The source includes the original working-tree edits, not just committed files. Personal
subscription files and ignored/generated output were excluded before reading file content.
`import-state.json` records SHA-256 hashes of imported files for three-way reconciliation;
it is not a checksum manifest of the subsequently edited shared source.

389 files now live in `core/` (about 16 MB). The assembled inventories retain their original
file counts. The original repositories and installed addons were not changed.

## Deliberate changes beyond relocation

- Forever's release selector reads the assembled working tree instead of requiring a second
  Git repository inside it. Its existing runtime directory policy remains, with an explicit
  personal-file exclusion.
- `MapCoords.lua` and `QuestTracking.lua` are shared; their only differences were line endings.
- `Styles/Viewer.lua` uses the localized product name for the empty-state title on both clients.
- `Skins.lua` shares the Retail texture-clearing helper: use the client's `Clear*Texture`
  methods when present, with the legacy setter fallback otherwise.
- The shared viewer fixture takes the addon folder as a parameter, defaults to Forever for
  its older tests, and provides the real product-name value from `Compat/Identity.lua`.
  Forever's viewer-name assertion now checks that value.
- Retail's validator accepts an optional test's successful `SystemExit(0)` as success; a
  nonzero exit still fails. This makes its existing upstream-absent skip work on other machines.

Remaining divergent engine files stay in their flavor trees. In particular the bootstrap,
startup lists, guide registration, localization, TOCs, data/catalogues and subscription behavior
were not combined speculatively. All viewer implementation files and the UI mock are shared.

## Validation

`py -3 build.py all` runs the repository tooling tests and both original offline suites.
Tests cover shared edits reaching both addons, stale-file cleanup, flavor separation, import
conflicts/deletions, load dependencies and locale entries, private files, safe output paths,
deterministic ZIP contents and optional test exits. Each package has its own checksum manifest.

The Retail guide-sync dry run matched the installed revision 37179 exactly: 984 files,
92 loaded catalogue scripts, no additions, removals or changes. The wrapper saves applied
guide changes to the canonical flavor directory, rather than losing them in a build workspace.

Offline validation does not establish in-game behavior. The existing Retail test for registration
with personal keys skips its positive path because keys are deliberately absent from this source.
