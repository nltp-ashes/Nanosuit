# CLAUDE.md

Where everything lives, and how to look things up. For what the addon *is*, see
[README.md](README.md).

Coding conventions live in `.claude/rules/` and load when the matching files are touched:
`file-headers.md` for every file carrying a header block, `lua-conventions.md` for `.script` files.

## Paths

Machine-specific paths live in `env/.env` (git-ignored), one `KEY=value` per line, imported here:

@env/.env

If the import above shows nothing, read `env/.env` before reaching for any path outside the repo.
Paths below are written as `$KEY\…` and resolve against that file.

| Key                    | What                                                                     |
|------------------------|--------------------------------------------------------------------------|
| `MO2_DIR`              | Mod Organizer 2                                                          |
| `MO2_MODS_DIR`         | Every installed MO2 addon, this one included                             |
| `GAME_DIR`             | Game install                                                             |
| `VANILLA_GAMEDATA_DIR` | **Unpacked vanilla gamedata**                                            |
| `ENGINE_SOURCE_DIR`    | **Engine source** (the modded exes)                                      |
| `LUAC_PATH`            | `luac` 5.1.5, used by the edit hook                                      |

Not every machine has every key. A key is left out when that machine lacks the tool or folder — no
`LUAC_PATH` where luac is not installed, no `ENGINE_SOURCE_DIR` where the engine is not checked
out. Treat a missing key as "not available here": skip what depends on it and say so, rather than
guessing a path or searching the disk for one.

The addon is itself an MO2 mod, so it sits in `$MO2_MODS_DIR` next to every other installed addon.

The game installation keeps its gamedata packed in `db\` — only a few `configs\` are readable there. 
Read base scripts, configs, shaders, sounds and textures from `$VANILLA_GAMEDATA_DIR` instead
(`scripts\`, `configs\`, `shaders\`, `sounds\`, `textures\`, …).

The engine repo holds the C++ under `src\` (`xrGame`, `xrEngine`, `xrSound`, `xrServerEntities`)
**and its own `gamedata\scripts\`** — the Lua half of the modded exes, most importantly
`callbacks_gameobject.script`.

## Looking things up

**A script callback.** `$VANILLA_GAMEDATA_DIR\scripts` only has *vanilla* Anomaly. Everything the
modded exes add is declared in `$ENGINE_SOURCE_DIR\gamedata\scripts\callbacks_gameobject.script`,
which ships **packed** as `$MO2_MODS_DIR\(Main) Modded Exes [*]\db\mods\00_modded_exes_gamedata.db0`.
That archive is compressed, so grepping it (or `$MO2_MODS_DIR`, or `$VANILLA_GAMEDATA_DIR`) finds
nothing and makes a callback look like it does not exist. Search the engine repo's
`gamedata\scripts` before concluding anything is missing.

**A Lua API.** The luabind registrations in `src\xrGame\*_script*.cpp` are the ground truth for what
a class exposes (`script_game_object_script*.cpp`, `WeaponAK74.cpp` for `CWeapon`,
`script_sound_script.cpp` for `sound_object`, …). Default arguments live in the matching header.

**What a config key actually does.** Follow it through the engine source rather than guessing from
other addons — a lot of ltx behavior is conditional in ways the configs do not hint at.

**A real-world usage example.** Grep `$MO2_MODS_DIR` for the API; with hundreds of addons
installed, most things are used somewhere.

## Engine requirements

The addon targets the modded exes and says so in [README.md](README.md) under REQUIREMENTS — Anomaly
1.5.3 plus **Modded Exes <version> or newer**. That is a hard requirement, not a suggestion.

So code freely against anything those exes expose, and **do not write fallbacks for older builds**.
No `or 1` defaults on callback result fields, no `if <engine feature> then` guards, no silent
degradation paths. A player on an outdated exe is expected to hit a Lua error and go read the
requirements — a crash is a clearer message than a feature quietly doing nothing.

When the user is applying changes to the engine side to enable a feature you are working on, expect
these features to be the new norm even if they are unreleased and the README isn't updated yet.

When the addon starts relying on an engine feature newer than the version the README pins, bump the
README. That line is the contract.

## Tooling

A PostToolUse hook (`.claude/hooks/check_edit.js`) checks every Edit/Write : `luac -p` on `.script`
files (syntax only — it will not catch a bad callback name or a nil index; skipped without
`LUAC_PATH`), bare-LF line endings
(the working tree is CRLF under `core.autocrlf=true`), and a header `Date` that is not today. It
does not see Bash edits, so never use `sed -i` on tracked files — it strips the CRs.
