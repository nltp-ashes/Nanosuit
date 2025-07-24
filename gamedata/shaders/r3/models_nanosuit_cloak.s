---==================================================================================================================---
---                                                                                                                  ---
---    Original Author(s) : LVutner                                                                                  ---
---    Edited : N/A                                                                                                  ---
---    Date : 07/07/2025                                                                                             ---
---    License : See README.md                                                                                       ---
---                                                                                                                  ---
---    Script shader for the Nanosuit cloak mode.                                                                    ---
---                                                                                                                  ---
---==================================================================================================================---

function normal(shader, t_base, t_second, t_detail)
	shader:begin("nanosuit_cloak", "nanosuit_cloak")
	shader:dx10stencil(true, cmp_func.always, 255 , 127, stencil_op.keep, stencil_op.replace, stencil_op.keep)
	shader:dx10stencil_ref(1)		
	: zb(true,true)
	: blend(false, blend.srcalpha, blend.invsrcalpha)
	: aref(true, 0)
	: sorting(2,true)
	: distort(true)
	shader:dx10texture("s_image", "$user$generic_temp")
	shader:dx10texture("s", [[nanosuit\cloak_pattern]])
	shader:dx10sampler("smp_base")
	shader:dx10sampler("smp_linear")
	shader:dx10sampler("smp_nofilter")
	shader:dx10sampler("smp_rtlinear")
end
