//====================================================================================================================//
//                                                                                                                    //
//     Original Author(s) : NLTP_ASHES                                                                                //
//     Edited : N/A                                                                                                   //
//     Date : 15/09/2026                                                                                              //
//     License : See README.md                                                                                        //
//                                                                                                                    //
//     Interface between the two passes of the Nanosuit glow.                                                         //
//                                                                                                                    //
//     This struct has to be declared identically on both sides, and not merely carry the same                        //
//     semantics : DX10 links a vertex shader to a pixel shader by register and component, and the                    //
//     compiler packs a scalar like wave into whatever component is left over in an earlier register.                 //
//     Declare a subset of these fields in the pixel shader and they repack into different registers,                 //
//     the signatures stop matching, and the pixel shader reads whatever happens to be in the slot.                   //
//     One shared declaration is the only way to be sure, hence this file.                                            //
//                                                                                                                    //
//     This is the engine's v2p_bumped with wave added. The stock deferred pixel shader takes                         //
//     p_bumped, which lands on the same registers for TEXCOORD0 to TEXCOORD4 and simply never reads                  //
//     TEXCOORD7, so it links against this unchanged.                                                                 //
//                                                                                                                    //
//====================================================================================================================//

#ifndef NANOSUIT_GLOW_H
#define NANOSUIT_GLOW_H

//	Axis, in model space, the wave travels along. Y is up the body for a character.
static const float3 GLOW_WAVE_AXIS = float3(0.0f, 1.0f, 0.0f);

struct v2p_nanosuit_glow
{
#if defined(USE_R2_STATIC_SUN) && !defined(USE_LM_HEMI)
	float4 tcdh     : TEXCOORD0;    // texture coordinates, w = sun occlusion
#else
	float2 tcdh     : TEXCOORD0;    // texture coordinates
#endif
	float4 position : TEXCOORD1;    // position + hemi
	float3 M1       : TEXCOORD2;    // nmap 2 eye - 1
	float3 M2       : TEXCOORD3;    // nmap 2 eye - 2
	float3 M3       : TEXCOORD4;    // nmap 2 eye - 3
#ifdef USE_TDETAIL
	float2 tcdbump  : TEXCOORD5;    // d-bump
#endif
#ifdef USE_LM_HEMI
	float2 lmh      : TEXCOORD6;    // lm-hemi
#endif
	float  wave     : TEXCOORD7;    // model space position along the wave axis
	float4 hpos     : SV_Position;
};

#endif
