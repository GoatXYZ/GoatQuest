# Plan: importing new guides into GoatQuest

Status: plan only. No importer has been implemented.

GoatQuest 1.0.0 uses a locally installed Classic guide source. The current guide snapshot
was compared with source revision 37145. A newer installation should be treated as an
external input, reviewed before any files are copied into GoatQuest.

## Goal

Import new guide content while keeping GoatQuest's viewer, branding, Forever fixes and
three visible guide categories (Leveling, Dungeons and Professions). The process should
be repeatable, reviewable in git and verified before replacing the live add-on.

## Known structure

- The 95 installed Classic and seasonal guide files were produced by a consistent name
  and namespace transform. Guide author metadata was previously exempted.
- Guides use `RegisterGuide`, `RegisterGuidePlaceholder`, `RegisterInclude`,
  `RegisterMapSpots`, `DoMutex`, `GuideMenuTier` and `IMAGESDIR`, plus flavour flags.
- The step and goal language is the main compatibility surface. Compare referenced goal
  types, condition functions and engine members before loading new guides.
- The current engine has substantial local changes. Merge engine updates separately from
  guide data and keep Forever compatibility changes under review.

## Proposed workflow

1. Make read-only snapshots of the installed Classic and Retail source add-ons outside
   `Interface/AddOns`. Record revision numbers and SHA-256 hashes.
2. Compare the new source tree with the snapshot. Detect added flavours, files, goal
   types and condition functions.
3. Transform source names, paths and namespaces in a staging directory. Keep original
   author fields untouched during comparison. Check that the transform reproduces the
   known revision before using it on a new release.
4. Generate the installed catalogue manifest in source load order, including shared
   includes and the selected categories only.
5. Import guide changes on a working branch. Review engine changes individually.
6. Run `py -3 tests/validate.py`, inspect the menu in game and verify guide progression
   before replacing the live installation.

If a future release delivers protected or server streamed content, stop the import.
This plan does not grant distribution rights to upstream content.
