// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'
// Upgrade NOTE: replaced '_World2Object' with 'unity_WorldToObject'
// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge Beta 0.34 
// Shader Forge (c) Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:0.34;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:1,limd:1,uamb:True,mssp:True,lmpd:False,lprd:False,enco:False,frtr:True,vitr:True,dbil:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,blpr:3,bsrc:0,bdst:6,culm:0,dpts:2,wrdp:False,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:1,x:32252,y:32686|diff-2-RGB,emission-21-OUT,disp-42-OUT,tess-13-OUT;n:type:ShaderForge.SFN_Tex2d,id:2,x:33272,y:32745,ptlb:node_2,ptin:_node_2,tex:0636e226d2c454f40b2b2a8920350d90,ntxv:0,isnm:False|UVIN-9-OUT;n:type:ShaderForge.SFN_TexCoord,id:8,x:34147,y:32738,uv:0;n:type:ShaderForge.SFN_Append,id:9,x:33439,y:32745|A-10-OUT,B-22-OUT;n:type:ShaderForge.SFN_Add,id:10,x:33495,y:32508|A-11-OUT,B-20-OUT;n:type:ShaderForge.SFN_Fmod,id:11,x:33654,y:32506|A-8-V,B-12-OUT;n:type:ShaderForge.SFN_Vector1,id:12,x:33654,y:32455,v1:1;n:type:ShaderForge.SFN_Vector1,id:13,x:32909,y:33300,v1:8;n:type:ShaderForge.SFN_NormalVector,id:14,x:33273,y:33202,pt:False;n:type:ShaderForge.SFN_Multiply,id:15,x:32909,y:33182|A-17-OUT,B-14-OUT;n:type:ShaderForge.SFN_Desaturate,id:16,x:32909,y:32942|COL-34-OUT;n:type:ShaderForge.SFN_Multiply,id:17,x:32909,y:33062|A-16-OUT,B-18-OUT;n:type:ShaderForge.SFN_Slider,id:18,x:33166,y:33079,ptlb:displacement,ptin:_displacement,min:0,cur:0.3915658,max:1;n:type:ShaderForge.SFN_Time,id:19,x:34400,y:32665;n:type:ShaderForge.SFN_Add,id:20,x:33654,y:32620|A-25-OUT,B-8-U;n:type:ShaderForge.SFN_Multiply,id:21,x:32784,y:32757|A-2-RGB,B-2-RGB;n:type:ShaderForge.SFN_Add,id:22,x:33654,y:32745|A-26-OUT,B-8-V;n:type:ShaderForge.SFN_Slider,id:23,x:33843,y:33050,ptlb:U Pan,ptin:_UPan,min:0,cur:0.4964393,max:1;n:type:ShaderForge.SFN_Slider,id:24,x:34013,y:32460,ptlb:V Pan,ptin:_VPan,min:0,cur:0.2364805,max:1;n:type:ShaderForge.SFN_Multiply,id:25,x:34013,y:32526|A-19-T,B-24-OUT;n:type:ShaderForge.SFN_Multiply,id:26,x:33843,y:32904|A-19-T,B-23-OUT;n:type:ShaderForge.SFN_Fresnel,id:27,x:33017,y:32497|EXP-29-OUT;n:type:ShaderForge.SFN_Slider,id:29,x:33191,y:32508,ptlb:node_29,ptin:_node_29,min:0,cur:18.04512,max:20;n:type:ShaderForge.SFN_OneMinus,id:30,x:32857,y:32497|IN-27-OUT;n:type:ShaderForge.SFN_Multiply,id:31,x:32679,y:32497|A-30-OUT,B-30-OUT;n:type:ShaderForge.SFN_ValueProperty,id:33,x:33240,y:32946,ptlb:node_33,ptin:_node_33,glob:False,v1:5;n:type:ShaderForge.SFN_Reflect,id:34,x:33063,y:32830|A-2-RGB,B-14-OUT;n:type:ShaderForge.SFN_Binormal,id:38,x:33534,y:33043;n:type:ShaderForge.SFN_Reflect,id:40,x:32682,y:33182|A-15-OUT,B-14-OUT;n:type:ShaderForge.SFN_Reflect,id:42,x:32494,y:33297|A-40-OUT,B-15-OUT;proporder:2-18-24-23-29-33;pass:END;sub:END;*/

Shader "Shader Forge/Twist" {
    Properties {
        _node_2 ("node_2", 2D) = "white" {}
        _displacement ("displacement", Range(0, 1)) = 0.3915658
        _VPan ("V Pan", Range(0, 1)) = 0.2364805
        _UPan ("U Pan", Range(0, 1)) = 0.4964393
        _node_29 ("node_29", Range(0, 20)) = 18.04512
        _node_33 ("node_33", Float ) = 5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        Pass {
            Name "ForwardBase"
            Tags {
                "LightMode"="ForwardBase"
            }
            //Blend One OneMinusSrcColor
            ZWrite Off
            
            CGPROGRAM
            #pragma hull hull
            #pragma domain domain
            #pragma vertex tessvert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma exclude_renderers xbox360 ps3 flash d3d11_9x 
            #pragma target 5.0
            uniform float4 _LightColor0;
            uniform float4 _TimeEditor;
            uniform sampler2D _node_2; uniform float4 _node_2_ST;
            uniform float _displacement;
            uniform float _UPan;
            uniform float _VPan;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o;
                o.uv0 = v.texcoord0;
                o.normalDir = mul(float4(v.normal,0), unity_WorldToObject).xyz;
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos(v.vertex);
                return o;
            }
            #ifdef UNITY_CAN_COMPILE_TESSELLATION
                struct TessVertex {
                    float4 vertex : INTERNALTESSPOS;
                    float3 normal : NORMAL;
                    float4 tangent : TANGENT;
                    float2 texcoord0 : TEXCOORD0;
                };
                struct OutputPatchConstant {
                    float edge[3]         : SV_TessFactor;
                    float inside          : SV_InsideTessFactor;
                    float3 vTangent[4]    : TANGENT;
                    float2 vUV[4]         : TEXCOORD;
                    float3 vTanUCorner[4] : TANUCORNER;
                    float3 vTanVCorner[4] : TANVCORNER;
                    float4 vCWts          : TANWEIGHTS;
                };
                TessVertex tessvert (VertexInput v) {
                    TessVertex o;
                    o.vertex = v.vertex;
                    o.normal = v.normal;
                    o.tangent = v.tangent;
                    o.texcoord0 = v.texcoord0;
                    return o;
                }
                void displacement (inout VertexInput v){
                    float2 node_8 = v.texcoord0;
                    float4 node_19 = _Time + _TimeEditor;
                    float2 node_9 = float2((fmod(node_8.g,1.0)+((node_19.g*_VPan)+node_8.r)),((node_19.g*_UPan)+node_8.g));
                    float4 node_2 = tex2Dlod(_node_2,float4(TRANSFORM_TEX(node_9, _node_2),0.0,0));
                    float3 node_14 = v.normal;
                    float3 node_15 = ((dot(reflect(node_2.rgb,node_14),float3(0.3,0.59,0.11))*_displacement)*node_14);
                    v.vertex.xyz +=  reflect(reflect(node_15,node_14),node_15);
                }
                float Tessellation(TessVertex v){
                    return 8.0;
                }
                OutputPatchConstant hullconst (InputPatch<TessVertex,3> v) {
                    OutputPatchConstant o;
                    float ts = Tessellation( v[0] );
                    o.edge[0] = ts;
                    o.edge[1] = ts;
                    o.edge[2] = ts;
                    o.inside = ts;
                    return o;
                }
                [domain("tri")]
                [partitioning("fractional_odd")]
                [outputtopology("triangle_cw")]
                [patchconstantfunc("hullconst")]
                [outputcontrolpoints(3)]
                TessVertex hull (InputPatch<TessVertex,3> v, uint id : SV_OutputControlPointID) {
                    return v[id];
                }
                [domain("tri")]
                VertexOutput domain (OutputPatchConstant tessFactors, const OutputPatch<TessVertex,3> vi, float3 bary : SV_DomainLocation) {
                    VertexInput v;
                    v.vertex = vi[0].vertex*bary.x + vi[1].vertex*bary.y + vi[2].vertex*bary.z;
                    v.normal = vi[0].normal*bary.x + vi[1].normal*bary.y + vi[2].normal*bary.z;
                    v.tangent = vi[0].tangent*bary.x + vi[1].tangent*bary.y + vi[2].tangent*bary.z;
                    v.texcoord0 = vi[0].texcoord0*bary.x + vi[1].texcoord0*bary.y + vi[2].texcoord0*bary.z;
                    displacement(v);
                    VertexOutput o = vert(v);
                    return o;
                }
            #endif
            fixed4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
/////// Normals:
                float3 normalDirection =  i.normalDir;
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
////// Lighting:
                float attenuation = 1;
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = dot( normalDirection, lightDirection );
                float3 diffuse = max( 0.0, NdotL) * attenColor + UNITY_LIGHTMODEL_AMBIENT.rgb;
////// Emissive:
                float2 node_8 = i.uv0;
                float4 node_19 = _Time + _TimeEditor;
                float2 node_9 = float2((fmod(node_8.g,1.0)+((node_19.g*_VPan)+node_8.r)),((node_19.g*_UPan)+node_8.g));
                float4 node_2 = tex2D(_node_2,TRANSFORM_TEX(node_9, _node_2));
                float3 emissive = (node_2.rgb*node_2.rgb);
                float3 finalColor = 0;
                float3 diffuseLight = diffuse;
                finalColor += diffuseLight * node_2.rgb;
                finalColor += emissive;
/// Final Color:
                return fixed4(finalColor,1);
            }
            ENDCG
        }
        Pass {
            Name "ForwardAdd"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            ZWrite Off
            
            Fog { Color (0,0,0,0) }
            CGPROGRAM
            #pragma hull hull
            #pragma domain domain
            #pragma vertex tessvert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdadd
            #pragma exclude_renderers xbox360 ps3 flash d3d11_9x 
            #pragma target 5.0
            uniform float4 _LightColor0;
            uniform float4 _TimeEditor;
            uniform sampler2D _node_2; uniform float4 _node_2_ST;
            uniform float _displacement;
            uniform float _UPan;
            uniform float _VPan;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                LIGHTING_COORDS(3,4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o;
                o.uv0 = v.texcoord0;
                o.normalDir = mul(float4(v.normal,0), unity_WorldToObject).xyz;
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos(v.vertex);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            #ifdef UNITY_CAN_COMPILE_TESSELLATION
                struct TessVertex {
                    float4 vertex : INTERNALTESSPOS;
                    float3 normal : NORMAL;
                    float4 tangent : TANGENT;
                    float2 texcoord0 : TEXCOORD0;
                };
                struct OutputPatchConstant {
                    float edge[3]         : SV_TessFactor;
                    float inside          : SV_InsideTessFactor;
                    float3 vTangent[4]    : TANGENT;
                    float2 vUV[4]         : TEXCOORD;
                    float3 vTanUCorner[4] : TANUCORNER;
                    float3 vTanVCorner[4] : TANVCORNER;
                    float4 vCWts          : TANWEIGHTS;
                };
                TessVertex tessvert (VertexInput v) {
                    TessVertex o;
                    o.vertex = v.vertex;
                    o.normal = v.normal;
                    o.tangent = v.tangent;
                    o.texcoord0 = v.texcoord0;
                    return o;
                }
                void displacement (inout VertexInput v){
                    float2 node_8 = v.texcoord0;
                    float4 node_19 = _Time + _TimeEditor;
                    float2 node_9 = float2((fmod(node_8.g,1.0)+((node_19.g*_VPan)+node_8.r)),((node_19.g*_UPan)+node_8.g));
                    float4 node_2 = tex2Dlod(_node_2,float4(TRANSFORM_TEX(node_9, _node_2),0.0,0));
                    float3 node_14 = v.normal;
                    float3 node_15 = ((dot(reflect(node_2.rgb,node_14),float3(0.3,0.59,0.11))*_displacement)*node_14);
                    v.vertex.xyz +=  reflect(reflect(node_15,node_14),node_15);
                }
                float Tessellation(TessVertex v){
                    return 8.0;
                }
                OutputPatchConstant hullconst (InputPatch<TessVertex,3> v) {
                    OutputPatchConstant o;
                    float ts = Tessellation( v[0] );
                    o.edge[0] = ts;
                    o.edge[1] = ts;
                    o.edge[2] = ts;
                    o.inside = ts;
                    return o;
                }
                [domain("tri")]
                [partitioning("fractional_odd")]
                [outputtopology("triangle_cw")]
                [patchconstantfunc("hullconst")]
                [outputcontrolpoints(3)]
                TessVertex hull (InputPatch<TessVertex,3> v, uint id : SV_OutputControlPointID) {
                    return v[id];
                }
                [domain("tri")]
                VertexOutput domain (OutputPatchConstant tessFactors, const OutputPatch<TessVertex,3> vi, float3 bary : SV_DomainLocation) {
                    VertexInput v;
                    v.vertex = vi[0].vertex*bary.x + vi[1].vertex*bary.y + vi[2].vertex*bary.z;
                    v.normal = vi[0].normal*bary.x + vi[1].normal*bary.y + vi[2].normal*bary.z;
                    v.tangent = vi[0].tangent*bary.x + vi[1].tangent*bary.y + vi[2].tangent*bary.z;
                    v.texcoord0 = vi[0].texcoord0*bary.x + vi[1].texcoord0*bary.y + vi[2].texcoord0*bary.z;
                    displacement(v);
                    VertexOutput o = vert(v);
                    return o;
                }
            #endif
            fixed4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
/////// Normals:
                float3 normalDirection =  i.normalDir;
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = dot( normalDirection, lightDirection );
                float3 diffuse = max( 0.0, NdotL) * attenColor;
                float3 finalColor = 0;
                float3 diffuseLight = diffuse;
                float2 node_8 = i.uv0;
                float4 node_19 = _Time + _TimeEditor;
                float2 node_9 = float2((fmod(node_8.g,1.0)+((node_19.g*_VPan)+node_8.r)),((node_19.g*_UPan)+node_8.g));
                float4 node_2 = tex2D(_node_2,TRANSFORM_TEX(node_9, _node_2));
                finalColor += diffuseLight * node_2.rgb;
/// Final Color:
                return fixed4(finalColor * 1,0);
            }
            ENDCG
        }
        Pass {
            Name "ShadowCollector"
            Tags {
                "LightMode"="ShadowCollector"
            }
            
            Fog {Mode Off}
            CGPROGRAM
            #pragma hull hull
            #pragma domain domain
            #pragma vertex tessvert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCOLLECTOR
            #define SHADOW_COLLECTOR_PASS
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcollector
            #pragma exclude_renderers xbox360 ps3 flash d3d11_9x 
            #pragma target 5.0
            uniform float4 _TimeEditor;
            uniform sampler2D _node_2; uniform float4 _node_2_ST;
            uniform float _displacement;
            uniform float _UPan;
            uniform float _VPan;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                V2F_SHADOW_COLLECTOR;
                float2 uv0 : TEXCOORD5;
                float3 normalDir : TEXCOORD6;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o;
                o.uv0 = v.texcoord0;
                o.normalDir = mul(float4(v.normal,0), unity_WorldToObject).xyz;
                o.pos = UnityObjectToClipPos(v.vertex);
                TRANSFER_SHADOW_COLLECTOR(o)
                return o;
            }
            #ifdef UNITY_CAN_COMPILE_TESSELLATION
                struct TessVertex {
                    float4 vertex : INTERNALTESSPOS;
                    float3 normal : NORMAL;
                    float4 tangent : TANGENT;
                    float2 texcoord0 : TEXCOORD0;
                };
                struct OutputPatchConstant {
                    float edge[3]         : SV_TessFactor;
                    float inside          : SV_InsideTessFactor;
                    float3 vTangent[4]    : TANGENT;
                    float2 vUV[4]         : TEXCOORD;
                    float3 vTanUCorner[4] : TANUCORNER;
                    float3 vTanVCorner[4] : TANVCORNER;
                    float4 vCWts          : TANWEIGHTS;
                };
                TessVertex tessvert (VertexInput v) {
                    TessVertex o;
                    o.vertex = v.vertex;
                    o.normal = v.normal;
                    o.tangent = v.tangent;
                    o.texcoord0 = v.texcoord0;
                    return o;
                }
                void displacement (inout VertexInput v){
                    float2 node_8 = v.texcoord0;
                    float4 node_19 = _Time + _TimeEditor;
                    float2 node_9 = float2((fmod(node_8.g,1.0)+((node_19.g*_VPan)+node_8.r)),((node_19.g*_UPan)+node_8.g));
                    float4 node_2 = tex2Dlod(_node_2,float4(TRANSFORM_TEX(node_9, _node_2),0.0,0));
                    float3 node_14 = v.normal;
                    float3 node_15 = ((dot(reflect(node_2.rgb,node_14),float3(0.3,0.59,0.11))*_displacement)*node_14);
                    v.vertex.xyz +=  reflect(reflect(node_15,node_14),node_15);
                }
                float Tessellation(TessVertex v){
                    return 8.0;
                }
                OutputPatchConstant hullconst (InputPatch<TessVertex,3> v) {
                    OutputPatchConstant o;
                    float ts = Tessellation( v[0] );
                    o.edge[0] = ts;
                    o.edge[1] = ts;
                    o.edge[2] = ts;
                    o.inside = ts;
                    return o;
                }
                [domain("tri")]
                [partitioning("fractional_odd")]
                [outputtopology("triangle_cw")]
                [patchconstantfunc("hullconst")]
                [outputcontrolpoints(3)]
                TessVertex hull (InputPatch<TessVertex,3> v, uint id : SV_OutputControlPointID) {
                    return v[id];
                }
                [domain("tri")]
                VertexOutput domain (OutputPatchConstant tessFactors, const OutputPatch<TessVertex,3> vi, float3 bary : SV_DomainLocation) {
                    VertexInput v;
                    v.vertex = vi[0].vertex*bary.x + vi[1].vertex*bary.y + vi[2].vertex*bary.z;
                    v.normal = vi[0].normal*bary.x + vi[1].normal*bary.y + vi[2].normal*bary.z;
                    v.tangent = vi[0].tangent*bary.x + vi[1].tangent*bary.y + vi[2].tangent*bary.z;
                    v.texcoord0 = vi[0].texcoord0*bary.x + vi[1].texcoord0*bary.y + vi[2].texcoord0*bary.z;
                    displacement(v);
                    VertexOutput o = vert(v);
                    return o;
                }
            #endif
            fixed4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                SHADOW_COLLECTOR_FRAGMENT(i)
            }
            ENDCG
        }
        Pass {
            Name "ShadowCaster"
            Tags {
                "LightMode"="ShadowCaster"
            }
            Cull Off
            Offset 1, 1
            
            Fog {Mode Off}
            CGPROGRAM
            #pragma hull hull
            #pragma domain domain
            #pragma vertex tessvert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCASTER
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma exclude_renderers xbox360 ps3 flash d3d11_9x 
            #pragma target 5.0
            uniform float4 _TimeEditor;
            uniform sampler2D _node_2; uniform float4 _node_2_ST;
            uniform float _displacement;
            uniform float _UPan;
            uniform float _VPan;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv0 : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o;
                o.uv0 = v.texcoord0;
                o.normalDir = mul(float4(v.normal,0), unity_WorldToObject).xyz;
                o.pos = UnityObjectToClipPos(v.vertex);
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            #ifdef UNITY_CAN_COMPILE_TESSELLATION
                struct TessVertex {
                    float4 vertex : INTERNALTESSPOS;
                    float3 normal : NORMAL;
                    float4 tangent : TANGENT;
                    float2 texcoord0 : TEXCOORD0;
                };
                struct OutputPatchConstant {
                    float edge[3]         : SV_TessFactor;
                    float inside          : SV_InsideTessFactor;
                    float3 vTangent[4]    : TANGENT;
                    float2 vUV[4]         : TEXCOORD;
                    float3 vTanUCorner[4] : TANUCORNER;
                    float3 vTanVCorner[4] : TANVCORNER;
                    float4 vCWts          : TANWEIGHTS;
                };
                TessVertex tessvert (VertexInput v) {
                    TessVertex o;
                    o.vertex = v.vertex;
                    o.normal = v.normal;
                    o.tangent = v.tangent;
                    o.texcoord0 = v.texcoord0;
                    return o;
                }
                void displacement (inout VertexInput v){
                    float2 node_8 = v.texcoord0;
                    float4 node_19 = _Time + _TimeEditor;
                    float2 node_9 = float2((fmod(node_8.g,1.0)+((node_19.g*_VPan)+node_8.r)),((node_19.g*_UPan)+node_8.g));
                    float4 node_2 = tex2Dlod(_node_2,float4(TRANSFORM_TEX(node_9, _node_2),0.0,0));
                    float3 node_14 = v.normal;
                    float3 node_15 = ((dot(reflect(node_2.rgb,node_14),float3(0.3,0.59,0.11))*_displacement)*node_14);
                    v.vertex.xyz +=  reflect(reflect(node_15,node_14),node_15);
                }
                float Tessellation(TessVertex v){
                    return 8.0;
                }
                OutputPatchConstant hullconst (InputPatch<TessVertex,3> v) {
                    OutputPatchConstant o;
                    float ts = Tessellation( v[0] );
                    o.edge[0] = ts;
                    o.edge[1] = ts;
                    o.edge[2] = ts;
                    o.inside = ts;
                    return o;
                }
                [domain("tri")]
                [partitioning("fractional_odd")]
                [outputtopology("triangle_cw")]
                [patchconstantfunc("hullconst")]
                [outputcontrolpoints(3)]
                TessVertex hull (InputPatch<TessVertex,3> v, uint id : SV_OutputControlPointID) {
                    return v[id];
                }
                [domain("tri")]
                VertexOutput domain (OutputPatchConstant tessFactors, const OutputPatch<TessVertex,3> vi, float3 bary : SV_DomainLocation) {
                    VertexInput v;
                    v.vertex = vi[0].vertex*bary.x + vi[1].vertex*bary.y + vi[2].vertex*bary.z;
                    v.normal = vi[0].normal*bary.x + vi[1].normal*bary.y + vi[2].normal*bary.z;
                    v.tangent = vi[0].tangent*bary.x + vi[1].tangent*bary.y + vi[2].tangent*bary.z;
                    v.texcoord0 = vi[0].texcoord0*bary.x + vi[1].texcoord0*bary.y + vi[2].texcoord0*bary.z;
                    displacement(v);
                    VertexOutput o = vert(v);
                    return o;
                }
            #endif
            fixed4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
