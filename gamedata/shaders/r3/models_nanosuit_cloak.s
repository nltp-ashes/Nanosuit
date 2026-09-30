---==================================================================================================================---
---                                                                                                                  ---
---    Original Author(s) : NLTP_ASHES                                                                               ---
---    Edited : N/A                                                                                                  ---
---    Date : 30/09/2026                                                                                             ---
---    License : Public Domain Mark 1.0 Universal                                                                    ---
---                                                                                                                  ---
---    Script shader for the Nanosuit cloak mode, a port of Crysis's CloakLayer.cfx.                                 ---
---                                                                                                                  ---
---    The cloaked surface is a single strict-sorted pass in the forward phase, with Crysis's own states for         ---
---    its refraction pass : alpha blended, z tested and z written. Forward, because it refracts the scene           ---
---    behind it and the engine copies that scene to $user$generic_temp right before the forward phase. Strict       ---
---    sorted, because that is what puts HUD geometry into the forward phase too, rather than in the g-buffer,       ---
---    and a strict-sorted element only ever draws its first pass : nanosuit_cloak.ps explains how both of           ---
---    Crysis's passes fit in one.                                                                                   ---
---                                                                                                                  ---
---    There is no l_point element, so a cloaked surface casts no shadow.                                            ---
---                                                                                                                  ---
---    It runs the engine's own deffer_model_bump-hq vertex shader, so a shader pack's TAA jitter applies to it      ---
---    like to any other model.                                                                                      ---
---                                                                                                                  ---
---    Textures :                                                                                                    ---
---      t_base    the surface's own diffuse texture, unused but kept so that it identifies the surface              ---
---      t_second  the surface's normal map, whose "#" error map must exist next to it. Anything without a           ---
---                normal map of its own gets nanosuit\cloak\cloak_flat_bump, see nanosuit_cloak.script              ---
---                                                                                                                  ---
---    The cloak itself is driven from Lua by nanosuit_cloak.script, through the "nanosuit_cloak" shader bus         ---
---    lane. See the header of nanosuit_cloak.ps for its layout.                                                     ---
---                                                                                                                  ---
---==================================================================================================================---

function normal(shader, t_base, t_second, t_detail)
    shader:begin       ("deffer_model_bump-hq", "nanosuit_cloak")
          :sorting     (2, true)
          :blend       (true, blend.srcalpha, blend.invsrcalpha)
          :zb          (true, true)
          :fog         (false)

    shader:dx10texture ("s_cloak_scene",  "$user$generic_temp")
    shader:dx10texture ("s_bumpX",        t_second .. "#") -- must be bound before s_bump
    shader:dx10texture ("s_bump",         t_second)
    shader:dx10texture ("s_cloak_hex",    [[nanosuit\cloak\cloak_hex_ddn]])
    shader:dx10texture ("s_cloak_perlin", [[nanosuit\cloak\cloak_perlin]])
    shader:dx10texture ("s_cloak_noise",  [[nanosuit\cloak\cloak_noise3d]])
    shader:dx10texture ("s_cloak_sparks", [[nanosuit\cloak\cloak_sparks]])

    shader:dx10sampler ("smp_base")
    shader:dx10sampler ("smp_linear")
    shader:dx10sampler ("smp_nofilter")
end
