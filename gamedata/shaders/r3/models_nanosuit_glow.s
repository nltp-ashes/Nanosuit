---==================================================================================================================---
---                                                                                                                  ---
---    Original Author(s) : NLTP_ASHES                                                                               ---
---    Edited : N/A                                                                                                  ---
---    Date : 30/09/2026                                                                                             ---
---    License : Public Domain Mark 1.0 Universal                                                                    ---
---                                                                                                                  ---
---    Script shader for the glowing parts of the Nanosuit.                                                          ---
---                                                                                                                  ---
---    The surface is a deferred bump mapped model, lit like any other outfit, which is armor mode. An emissive pass ---
---    adds self illumination where the glow map says so, which is speed and strength modes. The g-buffer has        ---
---    nowhere to store emission, hence the second draw.                                                             ---
---                                                                                                                  ---
---    Elements :                                                                                                    ---
---      normal     : the g-buffer pass, flagged emissive so the engine queues l_special                             ---
---      l_point    : the shadow map pass                                                                            ---
---      l_special  : the emissive pass, added into the light accumulator before the dynamic lights                  ---
---                                                                                                                  ---
---    Both passes run the engine's own deffer_model_bump-hq vertex shader, and the g-buffer pass its own pixel      ---
---    shader, so a shader pack's changes apply here too : with Screen Space Shaders, the TAA jitter and the motion  ---
---    vectors that keep the suit from ghosting. The shared vertex shader also puts both passes on the same depth.   ---
---                                                                                                                  ---
---    Textures, named after the diffuse, all mandatory :                                                            ---
---      <diffuse>        the diffuse texture                                                                        ---
---      <diffuse>_bump   the normal map                                                                             ---
---      <diffuse>_bump#  the normal map's error map                                                                 ---
---      <diffuse>_glow   the glow map : black never emits, white emits at full strength, a color tints the light    ---
---                                                                                                                  ---
---    Driven by the "nanosuit_glow" shader bus lane, see nanosuit_glow.ps. An unregistered lane reads zero, which   ---
---    leaves a plain deferred outfit.                                                                               ---
---                                                                                                                  ---
---==================================================================================================================---

function normal(shader, t_base, t_second, t_detail)
    shader:begin           ("deffer_model_bump-hq", "deffer_base_bump-hq")
          :fog             (false)
          :emissive        (true)

    shader:dx10texture     ("s_base",  t_base)
    shader:dx10texture     ("s_bumpX", t_base .. "_bump#") -- must be bound before s_bump
    shader:dx10texture     ("s_bump",  t_base .. "_bump")

    shader:dx10sampler     ("smp_base")
    shader:dx10sampler     ("smp_linear")

    shader:dx10stencil     (true, cmp_func.always, 255, 127, stencil_op.keep, stencil_op.replace, stencil_op.keep)
    shader:dx10stencil_ref (1)
end

function l_point(shader, t_base, t_second, t_detail)
    shader:begin                  ("shadow_direct_model", "dumb")
          :fog                    (false)
          :zb                     (true, true)

    shader:dx10texture            ("s_base", t_base)

    shader:dx10sampler            ("smp_base")
    shader:dx10sampler            ("smp_linear")

    shader:dx10color_write_enable (false, false, false, false)
end

function l_special(shader, t_base, t_second, t_detail)
    shader:begin       ("deffer_model_bump-hq", "nanosuit_glow")
          :fog         (false)
          :zb          (true, false)
          :blend       (true, blend.one, blend.one)
          :emissive    (true)

    shader:dx10zfunc   (cmp_func.lessequal)

    shader:dx10texture ("s_glow",  t_base .. "_glow")
    shader:dx10texture ("s_bumpX", t_base .. "_bump#") -- must be bound before s_bump
    shader:dx10texture ("s_bump",  t_base .. "_bump")

    shader:dx10sampler ("smp_base")
end
