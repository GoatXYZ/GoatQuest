# GoatQuest shared source

One source repository builds two independent addons. There is no extra core addon to install.

| Flavor | Addon folder | Current version | Client interface |
| --- | --- | --- | --- |
| `forever` | `GoatQuest` | 1.4.0 | 16001 |
| `retail` | `GoatQuestRetail` | 1.0.0 | 120100 |

## Build a release

Follow [Release and update process](RELEASING.md) for the complete manual GitHub/WowUp runbook.
There are no GitHub Actions.

Python 3.10+ and `lupa` with its Lua 5.1 runtime are required for the offline checks.

```powershell
py -3 -m pip install -r requirements-dev.txt
py -3 build.py all
```

The build runs the repository tooling tests, assembles a clean test workspace for each flavor, runs its existing full offline
suite, and only packages when all requested suites pass. It also checks the packaged TOC/XML
dependencies for every locale, archive integrity, private-file exclusion and folder naming.

Outputs:

- `dist/GoatQuest/` and `dist/GoatQuestRetail/`: installable addon folders.
- `dist/GoatQuest-<version>-forever.zip` and `dist/GoatQuestRetail-<version>.zip`: deterministic archives.
- Each ZIP's matching `.manifest.json`: file hashes, archive hash and test status.
- `dist/release.json`: WowUp metadata for both flavors, generated only after a tested `all` build.

`py -3 build.py --verify-release dist` verifies the five assets to upload. It also works on
a directory containing those assets downloaded from GitHub.

`py -3 build.py forever` or `py -3 build.py retail` builds just that flavor. Versions remain
independent: edit the flavor's TOC(s) and `build-manifest.json` together. Forever's primary
and `_Mainline` TOCs must remain identical. `--assemble-only` prepares a disposable test
workspace; `--skip-tests` is for development and records the skipped tests in the manifest.
Every build removes the previous `release.json`. Failed, single-flavor, assemble-only and
test-skipping builds leave it absent. Historical ZIPs may remain; upload only the assets
listed by a freshly verified full release, not every ZIP in `dist/`.

## Where to edit

- `core/`: code, UI, assets and test resources used by both clients. Edit once, test both.
- `flavors/forever/files/`: Forever-specific source, content, TOCs, tools and tests.
- `flavors/retail/files/`: Retail-specific source, content, TOC, tools and tests.
- `build/`: generated complete source trees. Changes here are discarded by the next build.
- `tools/`: repository assembly and migration tools; these are never packaged.

Every file in `core/` goes into both test workspaces. A flavor cannot silently shadow a core
file: the build rejects duplicate paths. Move genuinely different implementations to each
flavor. Code/Data/Guides/Localization/Libs flavor directories stay in their flavor even when
an individual file currently matches. The flavor release policy selects which assembled
files ship; tests, authoring tools and dormant Retail code remain source-only.

The initial extraction preserved both working trees, including their uncommitted port fixes.
The original `../GoatQuest` and `../GoatQuestRetail` repositories remain intact as migration
inputs. They are not needed to build this repository. `../GoatWay` is a separate addon.

## Bring in remaining port-review fixes

```powershell
py -3 tools/import_sources.py
py -3 tools/import_sources.py --apply
py -3 build.py all
```

The importer compares each original tree with `migration/import-state.json` and this repository.
It preserves changes made only here, imports changes made only in the original, and stops before
writing if both sides changed differently. Shared files split into flavor files when one client
changes. Identical files consolidate automatically. Use `--forever <path>` and `--retail <path>`
if the originals moved. The default command only reports; `--apply` writes the reconciled source.
Once the port review is complete, make new product changes here rather than in the old forks.

## Guide updates and personal data

Retail's existing guide-sync tool is retained. Use the repository wrapper so changes land in
the canonical flavor source, not a disposable build:

```powershell
py -3 tools/sync_guides.py retail
py -3 tools/sync_guides.py retail --apply
py -3 build.py retail
```

Forever's upstream importer was still a plan at extraction time; its
`flavors/forever/files/GUIDE-IMPORT-PLAN.md` remains the reference. Import reviewed changes from
the original Forever tree with `tools/import_sources.py`; no generic upstream rewrite is used.

Personal `Licence.lua`/`License.lua` files are never imported, committed or packaged. Retail
keeps its current runtime subscription behavior; supply personal data to the installed addon
using its existing refresh tool, with an explicit `--target` for the installation. The detailed
behavior is in `flavors/retail/files/LICENCE-USAGE.md`. Builds require no personal keys.

Offline checks do not replace testing in each game client. This repository is local; the build
does not install, publish or upload anything. Existing per-flavor attribution and usage notes
remain with their source.
