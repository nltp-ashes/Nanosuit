//====================================================================================================================//
//                                                                                                                    //
//     Original Author(s) : NLTP_ASHES                                                                                //
//     Edited : N/A                                                                                                   //
//     Date : 15/09/2026                                                                                              //
//     License : Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0)            //
//                                                                                                                    //
//     Vertex shader for the emissive pass of the Nanosuit glow.                                                      //
//                                                                                                                    //
//     Transforms the position exactly like deffer_model_bump.vs does, so this pass lands on the depth                //
//     the g-buffer pass already wrote, and hands the pixel shader the texture coordinates plus the                   //
//     coordinate the travelling wave runs along.                                                                     //
//                                                                                                                    //
//     That coordinate is taken in model space, after skinning, so the wave travels along the body and                //
//     follows it as it animates instead of sliding around as the character moves through the world.                  //
//                                                                                                                    //
//====================================================================================================================//

#include "common.h"
#include "skin.h"

//	Axis, in model space, the wave travels along. Y is up the body for a character.
static const float3 GLOW_WAVE_AXIS = float3(0.0f, 1.0f, 0.0f);

struct v2p
{
	float2 tc0  : TEXCOORD0;    // glow map texture coordinates
	float  wave : TEXCOORD1;    // position along the wave axis, in model space
	float4 hpos : SV_Position;
};

v2p _main(v_model v)
{
	v2p o;

	o.hpos = mul(m_WVP, v.P);                 // same xform as the g-buffer pass
	o.tc0  = v.tc.xy;                         // copy tc
	o.wave = dot(v.P.xyz, GLOW_WAVE_AXIS);    // model space, skinning already applied

	return o;
}

/////////////////////////////////////////////////////////////////////////
#ifdef SKIN_NONE
v2p main(v_model v)           { return _main(v);             }
#endif

#ifdef SKIN_0
v2p main(v_model_skinned_0 v) { return _main(skinning_0(v)); }
#endif

#ifdef SKIN_1
v2p main(v_model_skinned_1 v) { return _main(skinning_1(v)); }
#endif

#ifdef SKIN_2
v2p main(v_model_skinned_2 v) { return _main(skinning_2(v)); }
#endif

#ifdef SKIN_3
v2p main(v_model_skinned_3 v) { return _main(skinning_3(v)); }
#endif

#ifdef SKIN_4
v2p main(v_model_skinned_4 v) { return _main(skinning_4(v)); }
#endif
