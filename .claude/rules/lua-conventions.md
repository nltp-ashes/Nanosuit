---
paths:
  - "gamedata/scripts/**/*.script"
---

# Lua conventions

Some scripts like `arm.script`, `ui_mcm_argb_input.script`, `speed.script` and `weight.script` are
vendored and follow none of this. Other addons ship them under the same filename, so they stay
unmodified.

## File layout

Body sections are marked with a banner of the same 120 columns as the header:

```lua
-- ---------------------------------------------------------------------------------------------------------------------
-- Constants, global variables and imported functions
-- ---------------------------------------------------------------------------------------------------------------------
```

Recurring section names are :
- `Constants, global variables and imported functions`
  - with `-- Imports`, `-- Constants`, `-- Globals` sub-labels inside
- `General functions`
- `Callbacks registration`
- `<Name> class`

The class banner names the class in that file :
- concrete files name themselves (`Speed mode class`, `Recoil booster class`), 
- abstract bases name the concept (`Mode class`, `Booster class`, `Item booster class`).

Indentation is 4 spaces.

## File and class naming

| Pattern                               | For                                                             |
|---------------------------------------|-----------------------------------------------------------------|
| `nanosuit_<subsystem>.script`         | a core subsystem — `energy`, `malfunctor`, `binoculars`         |
| `nanosuit_shader_<name>.script`       | a core subsystem driving a shader — `glow`, `cloak`             |
| `nanosuit_mode_<name>.script`         | a suit mode — `armor`, `power`, `speed`, `cloak`                |
| `nanosuit_booster_<name>.script`      | a booster that is *not* item-based                              |
| `nanosuit_booster_item_<name>.script` | a booster that sets an effect on carried items                  |
| `nanosuit_sequence_<name>.script`     | a scripted animated sequence                                    |
| `nanosuit_ui_<name>.script`           | a UI element                                                    |

- One class per file, named after the file's concept (`speed`, `recoil`, `ui_hud`); 
- Abstract bases are `abstract_*`;
- Class instance fields are `m_`-prefixed;
- Script-level constants are `SCREAMING_UPPER_CASE`;
- Shared helpers are aliased under `-- Imports` (`actor_slots_enum = nanosuit_utils.actor_slots_enum`) when
  too long.

## Class hierarchy

`core` owns everything: the four modes in `m_modes`, and each subsystem as `m_glow`, `m_energy`,
`m_hud`, `m_vaporizer` and so on. Every mode, booster and subsystem takes `core` as its first
constructor argument and keeps it as `m_core`, which is how they reach each other.

- Modes derive `nanosuit_mode.abstract_mode`
- Boosters derive `nanosuit_booster.abstract_booster` — `__init`, `destroy`, `apply`, `remove`.
  Each booster names itself after its class (`super(core, "jump")`)
- Item boosters derive `nanosuit_booster_item.abstract_item_booster`, which adds the slot cache,
  `filter`/`set`/`unset`, and keeps the effect on the items as they move in and out of their slot

A booster is an item booster only if its effect is a property set on a `game_object`. Reload speed
is not, which is why `nanosuit_booster_reload.script` sits on the plain base.

## Lifecycle

`__init` / `destroy` bracket the object, `apply` / `remove` bracket the effect. Callbacks are
registered in `apply` and unregistered in `remove`, never in the constructor. Overrides call the
base implementation explicitly — `nanosuit_mode.abstract_mode.apply(self, play_voice, play_on, "yellow")` —
and modes attach their boosters through `apply_booster` / `remove_booster`, keyed by the booster
class itself (`self:apply_booster(nanosuit_booster_jump.jump)`), so a mode holds one instance per class.

Tuning constants live in `__init` as `m_`-fields (`m_ads_factor`, `m_recoil_factor`,
`m_reload_speed_coef`); only player-facing options go through
`nanosuit_mcm.get_config(section, key)` and `nanosuit_mcm.get_outfit_config(key, default)`.

## Locality of behaviour

> The behaviour of a unit of code should be as obvious as possible by looking only at that unit of
> code. — [Locality of Behaviour](https://htmx.org/essays/locality-of-behaviour/)

This holds at every scale :
- Reading a booster is enough to know what it turns on and off, without opening the mode that
  applies it or the core.
- Reading the core is enough to know that it creates its subsystems and handles their lifecycle,
  without knowing what each of them does.
- Reading a function is enough to know what it does, without reading the functions around it.

In practice :
- An effect lives whole in one place. The jump booster carries its callback, energy cost, sound and
  tuning constants; the mode only applies and removes it. When an effect moves into a booster,
  everything that only serves that effect moves with it.
- A hook on someone else's code sits in the script whose behaviour it serves : the NPC visibility
  hook in `nanosuit_booster_stealth.script`, the anomaly hooks in `nanosuit_malfunctor.script`.
  `nanosuit_patches.script` is only for compatibility with other addons.
- Duplication against indirection is weighed case by case. A shared helper or base class keeps the
  logic in one place but sends the reader elsewhere to follow it; duplicated code reads on its own
  but has to be kept in sync. Neither wins by default.

## Named values

An index into a fixed-layout table carries no meaning on its own : `str_explode(value, ",")[3]`
does not say *speed*, and `pos[1]`, `pos[2]` do not say *x*, *y*. Bind every such field to a named
local before using it, and let a one-line comment carry the layout when it comes from a config :

```lua
-- anm_<name> = <hand animation>, <item animation>, <speed>, <end>
local anm_params = str_explode(value, ",")
local speed = anm_params[3]

return tonumber(speed) or 1
```

Name the fields the code actually uses, not all of them. A bare index is only fine where the table
is a genuine list and the index is a loop counter or a random pick.

## Comments

Sparse and deliberate. Class scripts document nothing per-function — names carry the meaning, and a
comment is reserved for what the code cannot convey: an engine quirk, an ordering requirement, a
non-obvious unit. `nanosuit_utils.script` is the one exception, where every public helper gets a
`--- Function used to …` block with `--- @param` / `--- @return`. Unfinished work is flagged
`TODO : …` or `FIXME : …`, with the space before the colon.

Comments describe what the code does, not what it does not do or how it got that way. No
"simplified", "no longer …", "instead of the old …", "X was removed" : a change's history belongs in
the commit, not the file. Mention an absence only when a reader needs it, typically a deliberate
omission someone would otherwise "fix".

## Logging

Log through `nanosuit_utils`, never `printf` directly. Each helper prefixes the line with its level
and the calling script's name, read from the stack — do not repeat the subsystem in the message:

| Helper      | Output                                   | For                                          |
|-------------|------------------------------------------|----------------------------------------------|
| `print_dbg` | `[NS] DEBUG \| <script> \| <message>`    | traces, only printed with the MCM debug mode |
| `print_i`   | `[NS] INFO \| <script> \| <message>`     | lifecycle events that should always appear   |
| `print_w`   | `~[NS] WARNING \| <script> \| <message>` | degraded but working                         |
| `print_e`   | `![NS] ERROR \| <script> \| <message>`   | broken                                       |

Never tail-call them (`return nanosuit_utils.print_i(…)`): the tail call drops the caller's frame and
the line is tagged with the wrong script.

Anomaly's `printf` (`_g.script`) is not `string.format`: it only substitutes `%s`, running each
argument through `tostring` (vectors print as `x,y,z`). `%d`, `%.2f` and the like are printed
literally. Round in Lua before logging when precision matters — `string.format("%.2f", x)` as the
argument, placed in a `%s`.
