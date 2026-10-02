# GoatQuest release-2026.10.02.1

This is the first release from the shared GoatQuest source repository. It includes two addons:

| Addon | Version | Client | WowUp flavor |
| --- | --- | --- | --- |
| `GoatQuest` | 1.4.0 | WoW Forever (Interface 16001) | `forever` |
| `GoatQuestRetail` | 1.0.0 | Retail (Interface 120100) | `mainline` |

## Changes

### GoatQuest 1.4.0 (Forever)
- Built from the shared source repository instead of the old standalone tree.
- Rating buttons clear their textures with the client's `Clear*Texture` methods when available.
- With no guide loaded, the viewer title shows the product name.

### GoatQuestRetail 1.0.0 (Retail, first release)
- Retail port of GoatQuest: the same viewer, skin, arrow/halo navigation and accent colours.
- Leveling, Dungeons and Professions guides.

## Install
- **WowUp** (2.24.0-beta.6 or later): choose *Install from URL*, enter
  `https://github.com/GoatXYZ/GoatQuest`. Forever installs `GoatQuest` and Retail
  installs `GoatQuestRetail`.
- **Manual**: extract `GoatQuest-1.4.0-forever.zip` into `_classic_beta_/Interface/AddOns`, or
  `GoatQuestRetail-1.0.0.zip` into `_retail_/Interface/AddOns`. Fully restart the game afterwards.

## Validation
- `py -3 build.py all`: tooling tests, both flavors' Lua 5.1 offline suites and package
  dependency checks passed.
- `py -3 build.py --verify-release dist`: checksums and release metadata verified.

## Known limitations
- In-game testing on the current clients is still recommended after updating.
- Retail guides need the user's own subscription data. It is not included in the ZIP; see the
  Retail `LICENCE-USAGE.md`.
