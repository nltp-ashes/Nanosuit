---
paths:
  - "gamedata/**/*.script"
  - "gamedata/**/*.ltx"
  - "gamedata/**/*.xml"
  - "gamedata/**/*.s"
  - "gamedata/**/*.ps"
  - "gamedata/**/*.vs"
---

# File headers

Every script opens with a 120-column header block: author, `Edited`, date (`DD/MM/YYYY`), license,
then a one-line `Script used to …` description. Configs and shaders carry the same block in their
own comment syntax. Where an engine interaction is subtle, the explanation goes here as prose rather
than as inline comments — see `nanosuit_shader_glow.script` or `nanosuit_booster_reload.script`.

Whenever you modify a file, set its header `Date` to the current day. This applies to every file
carrying such a header, `.ltx` and `.xml` included, not just scripts. Keep the column width intact.
