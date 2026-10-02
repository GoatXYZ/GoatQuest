# Release and update process

This is the canonical runbook for the shared source repository. All commands below run in
`C:\GoatWoW\GoatQuestSource` using PowerShell. Build and publish locally; **no GitHub Actions**.
Older release notes inside the flavor trees describe the pre-migration repositories.

## 1. Update canonical source

- Edit shared behavior in `core/`; edit client-specific behavior in `flavors/<flavor>/files/`.
- For outstanding fixes in the original sibling repositories, run the importer without
  `--apply` first. Inspect the changes/conflicts, then apply the reconciled source:

  ```powershell
  py -3 tools/import_sources.py
  py -3 tools/import_sources.py --apply
  ```

- For Retail guide updates, update the installed upstream guides, inspect the dry run and
  apply the existing transform through the repository wrapper:

  ```powershell
  py -3 tools/sync_guides.py retail
  py -3 tools/sync_guides.py retail --apply
  ```

  Use `--prune` only when deliberately removing guide files that disappeared upstream.
  Forever's upstream importer is still described by
  `flavors/forever/files/GUIDE-IMPORT-PLAN.md`; do not run the Retail importer against it.
- Do not edit `build/` or `dist/`; the next build replaces generated contents.

Stop on a nonzero command exit and resolve the reported issue before continuing.

## 2. Set versions and write release notes

Addon versions are independent. Bump each flavor whose shipped code or guide content changed;
a shared runtime fix normally bumps both. Never reuse a published version for different addon
contents. Keep these fields in agreement:

| Flavor | Version locations | Client metadata |
| --- | --- | --- |
| Forever | `flavors/forever/files/GoatQuest.toc`, `GoatQuest_Mainline.toc`, and `build-manifest.json` in that same directory | TOC `Interface`; currently 16001 |
| Retail | `flavors/retail/files/GoatQuestRetail.toc` and `build-manifest.json` in that same directory | TOC `Interface`; currently 120100 |

Forever's two TOCs must remain identical. Only change Interface values for a client build
actually supported and tested. The release builder reads them from each ZIP's primary TOC.
Update affected user-facing version references as part of the same change.

Write `release-notes.md` at the repository root with the Forever and Retail versions, changes,
validation performed and known limitations. Review `git status --short`, stage the intended
source/docs and commit them. `build/`, `dist/` and personal subscription files stay untracked.
For the first release, create the initial source commit and configure the intended `origin`
repository first. Check `git remote -v`; this runbook does not select an owner or repository.

Use a unique release tag such as `release-2026.10.02.1`. It identifies one source snapshot and
can contain different addon versions. Every published release carries both flavors, even if
one flavor's version has not changed.

## 3. Build and verify both flavors

Requirements: Python 3.10+, Git, and GitHub CLI (`gh`) for publishing. Install the tested Lua
runtime dependency once, then run the complete build:

```powershell
py -3 -m pip install -r requirements-dev.txt
if ($LASTEXITCODE -ne 0) { throw 'Dependency installation failed' }
py -3 build.py all
if ($LASTEXITCODE -ne 0) { throw 'Release build failed' }
py -3 build.py --verify-release dist
if ($LASTEXITCODE -ne 0) { throw 'Release verification failed' }
```

The full build runs repository tooling tests, both flavor suites and package dependency
checks. Successful output is:

| File | Purpose |
| --- | --- |
| `dist/GoatQuest-<version>-forever.zip` | Forever addon; root folder remains `GoatQuest/` |
| `dist/GoatQuestRetail-<version>.zip` | Retail addon; root folder remains `GoatQuestRetail/` |
| Each ZIP's matching `.manifest.json` | File hashes, ZIP hash, addon version and offline-test result |
| `dist/release.json` | WowUp's asset-to-client mapping: `forever` and `mainline`, with TOC interfaces and `nolib: false` |

Installable folders also remain in `dist/GoatQuest/` and `dist/GoatQuestRetail/` for local tests.
Our checksum manifests are separate from WowUp's required `release.json` format.

Each build invocation removes the previous `dist/release.json` before doing work. Only a
successful, tested **both-flavor** build regenerates it. `--skip-tests`, `--assemble-only`, a
single-flavor build or a failed build leaves no release metadata. Those commands are useful
for development, but must be followed by `py -3 build.py all` before publishing.

Historical ZIPs can remain in `dist/`, including the old unsuffixed Forever ZIP. **Never upload
`dist/*.zip` or `dist/*` blindly.** The current `release.json` and its matching checksum manifests
define the exact five assets to publish.

## 4. Test in game

Close the relevant client and test the generated addon folder in that client's `Interface/AddOns`.
Retain a separate backup of the current installation and relevant SavedVariables before changing
the installation. Confirm the right TOC/version, the guide browser, an actual guide step, quest
tracking and arrow/halo navigation. Check for new Lua errors on each supported client.

Retail's personal subscription data is never part of the ZIP. After an install or WowUp update,
refresh it in the **installed** Retail addon, using an explicit target:

```powershell
$retailAddon = 'C:\Program Files (x86)\World of Warcraft\_retail_\Interface\AddOns\GoatQuestRetail'
py -3 flavors/retail/files/tools/refresh_licence.py --target $retailAddon
if ($LASTEXITCODE -ne 0) { throw 'Retail subscription refresh failed' }
```

Keep the user's upstream installation current. Do not use the refresh tool's default targets
from the canonical flavor directory: that would put personal data in source. Do not add personal
keys to release assets. In game, reload and verify guide registration. See the Retail
`LICENCE-USAGE.md` for the existing subscription behavior.

If testing leads to code changes, commit them and rebuild before proceeding.

## 5. Create a tagged draft release manually

Replace the two example values below. `gh auth status` must show access to the intended repository,
and `origin` must point to that same repository. Use the existing account's access; do not put
credentials in source, release notes or command arguments.

```powershell
$releaseRepository = 'OWNER/REPO'
$releaseTag = 'release-2026.10.02.1'
gh auth status
git remote -v
git status --short
```

Require a clean source working tree, with `release-notes.md` committed. Build again if anything
changed since validation. Tag and push the exact tested commit:

```powershell
if (git status --porcelain) { throw 'Commit the intended changes before tagging' }
git tag -a $releaseTag -m "GoatQuest release $releaseTag"
if ($LASTEXITCODE -ne 0) { throw 'Tag creation failed' }
git push origin HEAD
if ($LASTEXITCODE -ne 0) { throw 'Source push failed' }
git push origin "refs/tags/$releaseTag"
if ($LASTEXITCODE -ne 0) { throw 'Tag push failed' }
```

Read the current metadata and construct the upload list explicitly. Keep these commands in
the same PowerShell session as the repository/tag variables:

```powershell
py -3 build.py --verify-release dist
if ($LASTEXITCODE -ne 0) { throw 'Release assets failed verification' }
$releaseMetadata = Get-Content -Raw -LiteralPath dist/release.json | ConvertFrom-Json
$releaseAssets = @('dist/release.json')
foreach ($entry in $releaseMetadata.releases) {
    $releaseAssets += Join-Path 'dist' $entry.filename
    $releaseAssets += Join-Path 'dist' ([IO.Path]::ChangeExtension($entry.filename, '.manifest.json'))
}
gh release create $releaseTag @releaseAssets --repo $releaseRepository --verify-tag --draft --title "GoatQuest $releaseTag" --notes-file release-notes.md
if ($LASTEXITCODE -ne 0) { throw 'Draft creation/upload failed; inspect the existing draft before retrying' }
gh release view $releaseTag --repo $releaseRepository
```

If upload fails, inspect the existing draft and repair its missing assets. Do not create another
tag or blindly replay a release creation command. GitHub's automatic source ZIP/tarball is not
an installable addon and is not one of the five release assets.

## 6. Verify uploaded assets, publish, and check WowUp

Download the draft into a new empty directory and validate what GitHub actually stored:

```powershell
$releaseDownload = Join-Path 'build' ("release-download-" + [guid]::NewGuid().ToString('N'))
gh release download $releaseTag --repo $releaseRepository --dir $releaseDownload
if ($LASTEXITCODE -ne 0) { throw 'Release download failed' }
py -3 build.py --verify-release $releaseDownload
if ($LASTEXITCODE -ne 0) { throw 'Uploaded release failed verification' }
```

Review the draft's notes, both ZIPs, both checksum manifests and `release.json`, then publish:

```powershell
gh release edit $releaseTag --repo $releaseRepository --draft=false --latest
if ($LASTEXITCODE -ne 0) { throw 'Publishing failed; inspect the release state before retrying' }
```

In WowUp, use a version with Forever support; the checked implementation is **2.24.0-beta.6**.
For each game installation, choose **Install from URL** and enter the same GitHub repository
URL. Confirm that Forever gets `GoatQuest` and Retail gets `GoatQuestRetail`, with the intended
versions. Then test **Check Updates** on a subsequent release. A direct ZIP URL does not provide
an update feed. Private repositories also require repository access configured in WowUp; verify
package selection and download there, not just through an authenticated `gh` session.

For updates, repeat this runbook with a fresh tag. Publish both flavors together; an unchanged
flavor may retain its version. Refresh Retail's installed subscription data after the update.

## Recovery

- Build or verification failure: resolve it and rerun `py -3 build.py all`. Do not publish old
  assets left in `dist/` without current release metadata.
- Bad draft: repair or discard the draft before publishing. Inspect remote state after errors.
- Bad published release: restore the previous package locally while preparing a new, higher
  addon version from the last known good code. Publish a new tag with both flavors. Do not move
  existing tags or silently replace published ZIP contents; WowUp clients may have cached them.

## Protocol references

- [WowUp GitHub installation and direct ZIP behavior](https://wowup.io/guide/get-addons/overview)
- [WowUp 2.24.0-beta.6 GitHub provider: release.json and Forever mapping](https://github.com/WowUp/WowUp/blob/v2.24.0-beta.6/wowup-electron/src/app/addon-providers/github-addon-provider.ts)
- [GitHub CLI release creation](https://cli.github.com/manual/gh_release_create)
- [GitHub CLI release editing](https://cli.github.com/manual/gh_release_edit)
