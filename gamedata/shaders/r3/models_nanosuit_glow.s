---==================================================================================================================---
---                                                                                                                  ---
---    Original Author(s) : NLTP_ASHES                                                                               ---
---    Edited : N/A                                                                                                  ---
---    Date : 15/09/2026                                                                                             ---
---    License : Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0)           ---
---                                                                                                                  ---
---    Script shader for the glowing parts of the Nanosuit.                                                          ---
---                                                                                                                  ---
---    The surface is a normal, deferred rendered, bump mapped model : with the glow switched off it is              ---
---    lit exactly like any other outfit (normal map, sun shadows, dynamic lights, SSAO), which is what              ---
---    armor mode should look like. On top of that, an emissive pass adds self illumination where the                ---
---    glow map says so, which is what speed and strength modes look like.                                           ---
---                                                                                                                  ---
---    Three elements are compiled :                                                                                 ---
---      normal     : the g-buffer pass, flagged emissive so the engine queues l_special for us                      ---
---      l_point    : the shadow map pass, so the outfit keeps casting shadows                                       ---
---      l_special  : the emissive pass, added into the light accumulator before the dynamic lights                  ---
---                                                                                                                  ---
---    Textures, all derived from the diffuse texture's name :                                                       ---
---      <diffuse>        the diffuse texture, as given by the material                                              ---
---      <diffuse>_bump   the normal map          (mandatory, this is a bump mapped shader)                          ---
---      <diffuse>_bump#  the normal map's errors (mandatory, same)                                                  ---
---      <diffuse>_glow   the glow map            (mandatory)                                                        ---
---                                                                                                                  ---
---    In the glow map, black means the texel never emits light, white means it emits at full strength.              ---
---    A colored glow map additionally tints the emitted light, on top of the color the script sends.                ---
---                                                                                                                  ---
---    The glow itself is driven from Lua, through the "nanosuit_glow" shader bus lane :                             ---
---      rgb : color of the emitted light                                                                            ---
---      w   : strength of the emitted light, 0 switches the glow off entirely                                       ---
---    A lane nobody registered reads (0,0,0,0), so with no script running the outfit is simply a normal             ---
---    deferred outfit. See the header of nanosuit_glow.ps for the values Crysis uses per mode.                      ---
---                                                                                                                  ---
---==================================================================================================================---

function normal(shader, t_base, t_second, t_detail)

	-- Same pass uber_deffer() builds for a bump mapped model at SE_R2_NORMAL_HQ, plus the emissive flag.
	-- The "-hq" variants are the stock shaders with parallax mapping enabled.
	shader:begin("deffer_model_bump-hq", "deffer_base_bump-hq")
	: fog      (false)
	: emissive (true)

	shader:dx10texture("s_base",  t_base)
	shader:dx10texture("s_bumpX", t_base .. "_bump#")    -- must be bound before s_bump
	shader:dx10texture("s_bump",  t_base .. "_bump")
	shader:dx10sampler("smp_base")
	shader:dx10sampler("smp_linear")

	shader:dx10stencil(true, cmp_func.always, 255, 127, stencil_op.keep, stencil_op.replace, stencil_op.keep)
	shader:dx10stencil_ref(1)
end

function l_point(shader, t_base, t_second, t_detail)

	-- Shadow map pass, identical to the one CBlender_deffer_model builds for SE_R2_SHADOW.
	shader:begin("shadow_direct_model", "dumb")
	: fog (false)
	: zb  (true, true)

	shader:dx10texture("s_base", t_base)
	shader:dx10sampler("smp_base")
	shader:dx10sampler("smp_linear")
	shader:dx10color_write_enable(false, false, false, false)
end

function l_special(shader, t_base, t_second, t_detail)

	-- Emissive pass. Additive, so it brightens the light already in the accumulator instead of
	-- replacing it, and depth equal because the geometry already wrote its depth in normal().
	shader:begin("nanosuit_glow", "nanosuit_glow")
	: fog      (false)
	: zb       (true, false)
	: blend    (true, blend.one, blend.one)
	: emissive (true)

	shader:dx10zfunc(cmp_func.lessequal)

	shader:dx10texture("s_glow", t_base .. "_glow")
	shader:dx10sampler("smp_base")
end
