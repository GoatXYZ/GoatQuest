# Working in the shared source repository

- Edit `core/` or `flavors/<flavor>/files/`. `build/` and `dist/` are disposable output.
- A shared change must pass `py -3 build.py all`; a flavor-only change may use its flavor name.
  This runs tooling tests, the existing Lua 5.1/offline suites, and package checks.
- Preserve each flavor's TOC, saved variables, compatibility behavior, guide categories and
  release policy unless the task explicitly changes them. Client-specific directory contents
  belong to their flavor. Core/flavor path collisions are errors, not implicit overrides.
- Never copy personal `Licence.lua` or `License.lua` into canonical source or archives.
- The original sibling repositories are migration inputs, not build dependencies. Use the
  three-way importer for outstanding port-review fixes and resolve conflicts explicitly.
- `GoatWay` is a separate addon outside this migration.

## Release and update process

Follow [RELEASING.md](RELEASING.md) for source/guide updates, version bumps, validation,
manual GitHub releases, WowUp installs/updates and recovery. This is the canonical runbook;
older release documents under the flavor trees are historical. **Do not add GitHub Actions.**

- Release from `py -3 build.py all`, then `py -3 build.py --verify-release dist`.
- Publish both flavors together. Upload only the two ZIPs listed in `dist/release.json`, their
  matching checksum manifests, and `release.json`; never glob the whole output directory.
- Forever ZIPs end in `-forever.zip`; installed folder names remain `GoatQuest` and
  `GoatQuestRetail`. WowUp metadata flavors are `forever` and `mainline`, respectively.
- Single-flavor, assemble-only, failed or test-skipping builds are development output; they
  do not produce publishable `release.json`. Rebuild both flavors before a release.
- Keep addon versions and flavor TOC/build-manifest versions consistent. Commit the tested
  source, use a fresh tag, upload a draft with `gh`, verify downloaded assets, then publish.
- Refresh Retail subscription data only with an explicit installed-addon `--target`. Never
  write it into `core/` or the canonical flavor source, and never attach it to a release.
