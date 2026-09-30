---==================================================================================================================---
---                                                                                                                  ---
---    Original Author(s) : NLTP_ASHES                                                                               ---
---    Edited : N/A                                                                                                  ---
---    Date : 30/09/2026                                                                                             ---
---    License : Public Domain Mark 1.0 Universal                                                                    ---
---                                                                                                                  ---
---    Script shader for the Nanosuit cloak mode, a port of Crysis's CloakLayer.cfx.                                 ---
---                                                                                                                  ---
---    One strict-sorted forward pass, with the states of Crysis's refraction pass : alpha blended, z tested and z   ---
---    written. Forward, because it refracts $user$generic_temp, the copy of the scene the engine takes right before ---
---    that phase. Strict-sorted, because that also brings HUD geometry into it; such an element only draws its      ---
---    first pass, and nanosuit_cloak.ps folds Crysis's two into one.                                                ---
---                                                                                                                  ---
---    With no l_point element, a cloaked surface casts no shadow.                                                   ---
---                                                                                                                  ---
---    Runs the engine's own deffer_model_bump-hq vertex shader, so a shader pack's TAA jitter applies.              ---
---                                                                                                                  ---
---    Textures :                                                                                                    ---
---      t_base    the surface's diffuse, unused but kept to identify the surface                                    ---
---      t_second  the surface's normal map, with its "#" error map, or nanosuit\cloak\cloak_flat_bump               ---
---                                                                                                                  ---
---    Driven by nanosuit_cloak.script through the "nanosuit_cloak" shader bus lane, laid out in nanosuit_cloak.ps.  ---
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
