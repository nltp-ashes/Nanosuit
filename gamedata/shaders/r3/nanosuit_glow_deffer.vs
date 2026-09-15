//====================================================================================================================//
//                                                                                                                    //
//     Original Author(s) : NLTP_ASHES                                                                                //
//     Edited : N/A                                                                                                   //
//     Date : 15/09/2026                                                                                              //
//     License : See README.md                                                                                        //
//                                                                                                                    //
//     Vertex shader shared by both passes of the Nanosuit glow.                                                      //
//                                                                                                                    //
//     This is the engine's deffer_model_bump-hq.vs with one extra output, the coordinate the                         //
//     travelling wave runs along. Both the g-buffer pass and the emissive pass use it, which is what                 //
//     keeps them from fighting over the depth buffer : the same compiled vertex shader produces bit                  //
//     identical positions, so the emissive pass always passes its own depth test. Two separate vertex                //
//     shaders computing the same maths are free to round differently, and the emissive pass then                     //
//     fails on roughly half the pixels, which is the speckling this replaces.                                        //
//                                                                                                                    //
//     The wave coordinate is taken in model space, after skinning, so the wave travels along the body                //
//     and follows it as it animates instead of sliding around as the character moves.                                //
//                                                                                                                    //
//     The output struct lives in nanosuit_glow.h, shared with the emissive pixel shader. The stock                   //
//     deferred pixel shader takes p_bumped, which lands on the same registers, so it links unchanged.                //
//     Keep this file in sync with the stock one if Anomaly ever changes deffer_model_bump.vs.                        //
//                                                                                                                    //
//====================================================================================================================//

//	Match deffer_model_bump-hq.vs, the variant uber_deffer() picks for a bump mapped model.
#define USE_PARALLAX

#include "common.h"
#include "skin.h"
#include "nanosuit_glow.h"

#if defined(USE_PARALLAX) || defined(USE_STEEPPARALLAX)
	uniform float3x4 m_invW;
#endif

v2p_nanosuit_glow _main(v_model I)
{
	float4 w_pos = I.P;

	// Eye-space pos/normal
	v2p_nanosuit_glow O;
	O.hpos     = mul(m_WVP, w_pos);
	float2 tc  = I.tc;
	float3 Pe  = mul(m_WV, w_pos);
	O.tcdh     = float4(tc.xyyy);

	//  Hemi cube lighting
	float3 Nw       = mul((float3x3)m_W, (float3)I.N);
	float3 hc_pos   = (float3)hemi_cube_pos_faces;
	float3 hc_neg   = (float3)hemi_cube_neg_faces;
	float3 hc_mixed = (Nw < 0) ? hc_neg : hc_pos;
	float  hemi_val = dot(hc_mixed, abs(Nw));
	hemi_val        = saturate(hemi_val);

	O.position = float4(Pe, hemi_val);

#if defined(USE_R2_STATIC_SUN) && !defined(USE_LM_HEMI)
	O.tcdh.w   = L_material.y;                      // (,,,dir-occlusion)
#endif

	// Tangent space to eye space
	float3   N     = I.N;
	float3   T     = I.T;
	float3   B     = I.B;
	float3x3 xform = mul((float3x3)m_WV, float3x3(
	                     2*T.x, 2*B.x, 2*N.x,
	                     2*T.y, 2*B.y, 2*N.y,
	                     2*T.z, 2*B.z, 2*N.z
	                 ));

	O.M1 = xform[0];
	O.M2 = xform[1];
	O.M3 = xform[2];

#ifdef USE_TDETAIL
	O.tcdbump = O.tcdh * dt_params;                 // dt tc
#endif

	// Where this vertex sits along the wave, in model space so it rides with the bones
	O.wave = dot(w_pos.xyz, GLOW_WAVE_AXIS);

	return O;
}

/////////////////////////////////////////////////////////////////////////
#ifdef SKIN_NONE
v2p_nanosuit_glow main(v_model v)           { return _main(v);             }
#endif

#ifdef SKIN_0
v2p_nanosuit_glow main(v_model_skinned_0 v) { return _main(skinning_0(v)); }
#endif

#ifdef SKIN_1
v2p_nanosuit_glow main(v_model_skinned_1 v) { return _main(skinning_1(v)); }
#endif

#ifdef SKIN_2
v2p_nanosuit_glow main(v_model_skinned_2 v) { return _main(skinning_2(v)); }
#endif

#ifdef SKIN_3
v2p_nanosuit_glow main(v_model_skinned_3 v) { return _main(skinning_3(v)); }
#endif

#ifdef SKIN_4
v2p_nanosuit_glow main(v_model_skinned_4 v) { return _main(skinning_4(v)); }
#endif
