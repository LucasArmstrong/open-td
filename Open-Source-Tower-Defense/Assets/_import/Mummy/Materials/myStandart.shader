// Compiled shader for PC, Mac & Linux Standalone, uncompressed size: 338.2KB

// Skipping shader variants that would not be included into build of current scene.

Shader "CuttOnShader" {
Properties {
 _Color ("Main Color", Color) = (1,1,1,1)
 _MainTex ("Base (RGB) Trans (A)", 2D) = "white" { }
 _BumpMap ("Normalmap", 2D) = "bump" { }
 _Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
}
SubShader { 
 LOD 300
 Cull off
 Tags { "QUEUE"="AlphaTest" "IGNOREPROJECTOR"="true" "RenderType"="TransparentCutout" }


 // Stats for Vertex shader:
 //       d3d11 : 55 avg math (44..67)
 //    d3d11_9x : 58 avg math (44..72)
 //        d3d9 : 63 avg math (45..81)
 //      opengl : 18 avg math (18..19), 3 avg texture (3..4), 1 branch
 // Stats for Fragment shader:
 //       d3d11 : 17 avg math (16..18), 2 avg texture (2..3)
 //    d3d11_9x : 17 avg math (16..19), 2 texture
 //        d3d9 : 21 avg math (21..22), 3 avg texture (3..4)
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardBase" "SHADOWSUPPORT"="true" "QUEUE"="AlphaTest" "IGNOREPROJECTOR"="true" "RenderType"="TransparentCutout" }
  ColorMask RGB
  GpuProgramID 59653
Program "vp" {
SubProgram "opengl " {
// Stats: 18 math, 3 textures, 1 branches
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"!!GLSL
#ifdef VERTEX
uniform vec4 unity_SHAr;
uniform vec4 unity_SHAg;
uniform vec4 unity_SHAb;
uniform vec4 unity_SHBr;
uniform vec4 unity_SHBg;
uniform vec4 unity_SHBb;
uniform vec4 unity_SHC;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 _MainTex_ST;
uniform vec4 _BumpMap_ST;
attribute vec4 TANGENT;
varying vec4 xlv_TEXCOORD0;
varying vec4 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD3;
varying vec3 xlv_TEXCOORD4;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xy = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_1.zw = ((gl_MultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  vec3 tmpvar_2;
  tmpvar_2 = (_Object2World * gl_Vertex).xyz;
  vec4 v_3;
  v_3.x = _World2Object[0].x;
  v_3.y = _World2Object[1].x;
  v_3.z = _World2Object[2].x;
  v_3.w = _World2Object[3].x;
  vec4 v_4;
  v_4.x = _World2Object[0].y;
  v_4.y = _World2Object[1].y;
  v_4.z = _World2Object[2].y;
  v_4.w = _World2Object[3].y;
  vec4 v_5;
  v_5.x = _World2Object[0].z;
  v_5.y = _World2Object[1].z;
  v_5.z = _World2Object[2].z;
  v_5.w = _World2Object[3].z;
  vec3 tmpvar_6;
  tmpvar_6 = normalize(((
    (v_3.xyz * gl_Normal.x)
   + 
    (v_4.xyz * gl_Normal.y)
  ) + (v_5.xyz * gl_Normal.z)));
  mat3 tmpvar_7;
  tmpvar_7[0] = _Object2World[0].xyz;
  tmpvar_7[1] = _Object2World[1].xyz;
  tmpvar_7[2] = _Object2World[2].xyz;
  vec3 tmpvar_8;
  tmpvar_8 = normalize((tmpvar_7 * TANGENT.xyz));
  vec3 tmpvar_9;
  tmpvar_9 = (((tmpvar_6.yzx * tmpvar_8.zxy) - (tmpvar_6.zxy * tmpvar_8.yzx)) * TANGENT.w);
  vec4 tmpvar_10;
  tmpvar_10.x = tmpvar_8.x;
  tmpvar_10.y = tmpvar_9.x;
  tmpvar_10.z = tmpvar_6.x;
  tmpvar_10.w = tmpvar_2.x;
  vec4 tmpvar_11;
  tmpvar_11.x = tmpvar_8.y;
  tmpvar_11.y = tmpvar_9.y;
  tmpvar_11.z = tmpvar_6.y;
  tmpvar_11.w = tmpvar_2.y;
  vec4 tmpvar_12;
  tmpvar_12.x = tmpvar_8.z;
  tmpvar_12.y = tmpvar_9.z;
  tmpvar_12.z = tmpvar_6.z;
  tmpvar_12.w = tmpvar_2.z;
  vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = tmpvar_6;
  vec3 x2_14;
  vec3 x1_15;
  x1_15.x = dot (unity_SHAr, tmpvar_13);
  x1_15.y = dot (unity_SHAg, tmpvar_13);
  x1_15.z = dot (unity_SHAb, tmpvar_13);
  vec4 tmpvar_16;
  tmpvar_16 = (tmpvar_6.xyzz * tmpvar_6.yzzx);
  x2_14.x = dot (unity_SHBr, tmpvar_16);
  x2_14.y = dot (unity_SHBg, tmpvar_16);
  x2_14.z = dot (unity_SHBb, tmpvar_16);
  gl_Position = (gl_ModelViewProjectionMatrix * gl_Vertex);
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_10;
  xlv_TEXCOORD2 = tmpvar_11;
  xlv_TEXCOORD3 = tmpvar_12;
  xlv_TEXCOORD4 = ((x2_14 + (unity_SHC.xyz * 
    ((tmpvar_6.x * tmpvar_6.x) - (tmpvar_6.y * tmpvar_6.y))
  )) + x1_15);
}


#endif
#ifdef FRAGMENT
uniform vec4 _WorldSpaceLightPos0;
uniform vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform sampler2D _BumpMap;
uniform vec4 _Color;
uniform float _Cutoff;
varying vec4 xlv_TEXCOORD0;
varying vec4 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD3;
varying vec3 xlv_TEXCOORD4;
void main ()
{
  vec3 worldN_1;
  vec4 tmpvar_2;
  tmpvar_2 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) * _Color);
  vec3 normal_3;
  normal_3.xy = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).wy * 2.0) - 1.0);
  normal_3.z = sqrt((1.0 - clamp (
    dot (normal_3.xy, normal_3.xy)
  , 0.0, 1.0)));
  float x_4;
  x_4 = (tmpvar_2.w - _Cutoff);
  if ((x_4 < 0.0)) {
    discard;
  };
  worldN_1.x = dot (xlv_TEXCOORD1.xyz, normal_3);
  worldN_1.y = dot (xlv_TEXCOORD2.xyz, normal_3);
  worldN_1.z = dot (xlv_TEXCOORD3.xyz, normal_3);
  vec4 c_5;
  vec4 c_6;
  c_6.xyz = ((tmpvar_2.xyz * _LightColor0.xyz) * max (0.0, dot (worldN_1, _WorldSpaceLightPos0.xyz)));
  c_6.w = tmpvar_2.w;
  c_5.w = c_6.w;
  c_5.xyz = (c_6.xyz + (tmpvar_2.xyz * xlv_TEXCOORD4));
  gl_FragData[0] = c_5;
}


#endif
"
}
SubProgram "d3d9 " {
// Stats: 45 math
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord4
Matrix 4 [_Object2World] 3
Matrix 7 [_World2Object] 3
Matrix 0 [glstate_matrix_mvp]
Vector 18 [_BumpMap_ST]
Vector 17 [_MainTex_ST]
Vector 12 [unity_SHAb]
Vector 11 [unity_SHAg]
Vector 10 [unity_SHAr]
Vector 15 [unity_SHBb]
Vector 14 [unity_SHBg]
Vector 13 [unity_SHBr]
Vector 16 [unity_SHC]
"vs_2_0
def c19, 1, 0, 0, 0
dcl_position v0
dcl_tangent v1
dcl_normal v2
dcl_texcoord v3
dp4 oPos.x, c0, v0
dp4 oPos.y, c1, v0
dp4 oPos.z, c2, v0
dp4 oPos.w, c3, v0
mad oT0.xy, v3, c17, c17.zwzw
mad oT0.zw, v3.xyxy, c18.xyxy, c18
dp4 oT1.w, c4, v0
dp4 oT2.w, c5, v0
dp4 oT3.w, c6, v0
mul r0.xyz, v2.y, c8
mad r0.xyz, c7, v2.x, r0
mad r0.xyz, c9, v2.z, r0
nrm r1.xyz, r0
mul r0.x, r1.y, r1.y
mad r0.x, r1.x, r1.x, -r0.x
mul r2, r1.yzzx, r1.xyzz
dp4 r3.x, c13, r2
dp4 r3.y, c14, r2
dp4 r3.z, c15, r2
mad r0.xyz, c16, r0.x, r3
mov r1.w, c19.x
dp4 r2.x, c10, r1
dp4 r2.y, c11, r1
dp4 r2.z, c12, r1
add oT4.xyz, r0, r2
dp3 r0.z, c4, v1
dp3 r0.x, c5, v1
dp3 r0.y, c6, v1
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul r0.xyz, r0.w, r0
mov oT1.x, r0.z
mul r2.xyz, r0, r1.zxyw
mad r2.xyz, r1.yzxw, r0.yzxw, -r2
mul r2.xyz, r2, v1.w
mov oT1.y, r2.x
mov oT1.z, r1.x
mov oT2.x, r0.x
mov oT3.x, r0.y
mov oT2.y, r2.y
mov oT3.y, r2.z
mov oT2.z, r1.y
mov oT3.z, r1.z

"
}
SubProgram "d3d11 " {
// Stats: 44 math
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord4
ConstBuffer "$Globals" 208
Vector 160 [_MainTex_ST]
Vector 176 [_BumpMap_ST]
ConstBuffer "UnityLighting" 720
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefieceddjgogjgohdpkmhgnhccjdcfibjceecccabaaaaaafeajaaaaadaaaaaa
cmaaaaaaceabaaaanmabaaaaejfdeheopaaaaaaaaiaaaaaaaiaaaaaamiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaanbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaanjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaaoaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaaoaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaoaaaaaaaacaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaaoaaaaaaaadaaaaaaaaaaaaaaadaaaaaaagaaaaaa
apaaaaaaojaaaaaaaaaaaaaaaaaaaaaaadaaaaaaahaaaaaaapaaaaaafaepfdej
feejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepem
epfcaaklepfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
apaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaakeaaaaaa
acaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapaaaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaa
ahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefc
haahaaaaeaaaabaanmabaaaafjaaaaaeegiocaaaaaaaaaaaamaaaaaafjaaaaae
egiocaaaabaaaaaacnaaaaaafjaaaaaeegiocaaaacaaaaaabdaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaa
fpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
pccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaa
gfaaaaadpccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagiaaaaacaeaaaaaa
diaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaa
kgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaa
acaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaa
abaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaakaaaaaaogikcaaaaaaaaaaa
akaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaadaaaaaaagiecaaaaaaaaaaa
alaaaaaakgiocaaaaaaaaaaaalaaaaaadiaaaaaihcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
acaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaaaaaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaa
egacbaaaaaaaaaaadgaaaaaficcabaaaacaaaaaaakaabaaaaaaaaaaadiaaaaai
hcaabaaaabaaaaaafgbfbaaaabaaaaaajgiecaaaacaaaaaaanaaaaaadcaaaaak
hcaabaaaabaaaaaajgiecaaaacaaaaaaamaaaaaaagbabaaaabaaaaaaegacbaaa
abaaaaaadcaaaaakhcaabaaaabaaaaaajgiecaaaacaaaaaaaoaaaaaakgbkbaaa
abaaaaaaegacbaaaabaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaaabaaaaaa
egacbaaaabaaaaaaeeaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaah
hcaabaaaabaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadiaaaaaibcaabaaa
acaaaaaaakbabaaaacaaaaaaakiacaaaacaaaaaabaaaaaaadiaaaaaiccaabaaa
acaaaaaaakbabaaaacaaaaaaakiacaaaacaaaaaabbaaaaaadiaaaaaiecaabaaa
acaaaaaaakbabaaaacaaaaaaakiacaaaacaaaaaabcaaaaaadiaaaaaibcaabaaa
adaaaaaabkbabaaaacaaaaaabkiacaaaacaaaaaabaaaaaaadiaaaaaiccaabaaa
adaaaaaabkbabaaaacaaaaaabkiacaaaacaaaaaabbaaaaaadiaaaaaiecaabaaa
adaaaaaabkbabaaaacaaaaaabkiacaaaacaaaaaabcaaaaaaaaaaaaahhcaabaaa
acaaaaaaegacbaaaacaaaaaaegacbaaaadaaaaaadiaaaaaibcaabaaaadaaaaaa
ckbabaaaacaaaaaackiacaaaacaaaaaabaaaaaaadiaaaaaiccaabaaaadaaaaaa
ckbabaaaacaaaaaackiacaaaacaaaaaabbaaaaaadiaaaaaiecaabaaaadaaaaaa
ckbabaaaacaaaaaackiacaaaacaaaaaabcaaaaaaaaaaaaahhcaabaaaacaaaaaa
egacbaaaacaaaaaaegacbaaaadaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaa
acaaaaaaegacbaaaacaaaaaaeeaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
diaaaaahhcaabaaaacaaaaaaagaabaaaaaaaaaaaegacbaaaacaaaaaadiaaaaah
hcaabaaaadaaaaaaegacbaaaabaaaaaacgajbaaaacaaaaaadcaaaaakhcaabaaa
adaaaaaajgaebaaaacaaaaaajgaebaaaabaaaaaaegacbaiaebaaaaaaadaaaaaa
diaaaaahhcaabaaaadaaaaaaegacbaaaadaaaaaapgbpbaaaabaaaaaadgaaaaaf
cccabaaaacaaaaaaakaabaaaadaaaaaadgaaaaafbccabaaaacaaaaaackaabaaa
abaaaaaadgaaaaafeccabaaaacaaaaaaakaabaaaacaaaaaadgaaaaafbccabaaa
adaaaaaaakaabaaaabaaaaaadgaaaaafbccabaaaaeaaaaaabkaabaaaabaaaaaa
dgaaaaaficcabaaaadaaaaaabkaabaaaaaaaaaaadgaaaaaficcabaaaaeaaaaaa
ckaabaaaaaaaaaaadgaaaaafeccabaaaadaaaaaabkaabaaaacaaaaaadgaaaaaf
cccabaaaadaaaaaabkaabaaaadaaaaaadgaaaaafcccabaaaaeaaaaaackaabaaa
adaaaaaadgaaaaafeccabaaaaeaaaaaackaabaaaacaaaaaadiaaaaahbcaabaaa
aaaaaaaabkaabaaaacaaaaaabkaabaaaacaaaaaadcaaaaakbcaabaaaaaaaaaaa
akaabaaaacaaaaaaakaabaaaacaaaaaaakaabaiaebaaaaaaaaaaaaaadiaaaaah
pcaabaaaabaaaaaajgacbaaaacaaaaaaegakbaaaacaaaaaabbaaaaaibcaabaaa
adaaaaaaegiocaaaabaaaaaacjaaaaaaegaobaaaabaaaaaabbaaaaaiccaabaaa
adaaaaaaegiocaaaabaaaaaackaaaaaaegaobaaaabaaaaaabbaaaaaiecaabaaa
adaaaaaaegiocaaaabaaaaaaclaaaaaaegaobaaaabaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaabaaaaaacmaaaaaaagaabaaaaaaaaaaaegacbaaaadaaaaaa
dgaaaaaficaabaaaacaaaaaaabeaaaaaaaaaiadpbbaaaaaibcaabaaaabaaaaaa
egiocaaaabaaaaaacgaaaaaaegaobaaaacaaaaaabbaaaaaiccaabaaaabaaaaaa
egiocaaaabaaaaaachaaaaaaegaobaaaacaaaaaabbaaaaaiecaabaaaabaaaaaa
egiocaaaabaaaaaaciaaaaaaegaobaaaacaaaaaaaaaaaaahhccabaaaafaaaaaa
egacbaaaaaaaaaaaegacbaaaabaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 44 math
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord4
ConstBuffer "$Globals" 208
Vector 160 [_MainTex_ST]
Vector 176 [_BumpMap_ST]
ConstBuffer "UnityLighting" 720
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedkmgpknlgoonfagkljnjnkgfekkaceingabaaaaaajaanaaaaaeaaaaaa
daaaaaaagiaeaaaaoaalaaaaniamaaaaebgpgodjdaaeaaaadaaeaaaaaaacpopp
niadaaaafiaaaaaaaeaaceaaaaaafeaaaaaafeaaaaaaceaaabaafeaaaaaaakaa
acaaabaaaaaaaaaaabaacgaaahaaadaaaaaaaaaaacaaaaaaaeaaakaaaaaaaaaa
acaaamaaahaaaoaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafbfaaapkaaaaaiadp
aaaaaaaaaaaaaaaaaaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabia
abaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjaaeaaaaae
aaaaadoaadaaoejaabaaoekaabaaookaaeaaaaaeaaaaamoaadaaeejaacaaeeka
acaaoekaafaaaaadaaaaabiaacaaaajabcaaaakaafaaaaadaaaaaciaacaaaaja
bdaaaakaafaaaaadaaaaaeiaacaaaajabeaaaakaafaaaaadabaaabiaacaaffja
bcaaffkaafaaaaadabaaaciaacaaffjabdaaffkaafaaaaadabaaaeiaacaaffja
beaaffkaacaaaaadaaaaahiaaaaaoeiaabaaoeiaafaaaaadabaaabiaacaakkja
bcaakkkaafaaaaadabaaaciaacaakkjabdaakkkaafaaaaadabaaaeiaacaakkja
beaakkkaacaaaaadaaaaahiaaaaaoeiaabaaoeiaceaaaaacabaaahiaaaaaoeia
afaaaaadaaaaabiaabaaffiaabaaffiaaeaaaaaeaaaaabiaabaaaaiaabaaaaia
aaaaaaibafaaaaadacaaapiaabaacjiaabaakeiaajaaaaadadaaabiaagaaoeka
acaaoeiaajaaaaadadaaaciaahaaoekaacaaoeiaajaaaaadadaaaeiaaiaaoeka
acaaoeiaaeaaaaaeaaaaahiaajaaoekaaaaaaaiaadaaoeiaabaaaaacabaaaiia
bfaaaakaajaaaaadacaaabiaadaaoekaabaaoeiaajaaaaadacaaaciaaeaaoeka
abaaoeiaajaaaaadacaaaeiaafaaoekaabaaoeiaacaaaaadaeaaahoaaaaaoeia
acaaoeiaafaaaaadaaaaapiaaaaaffjaalaaoekaaeaaaaaeaaaaapiaakaaoeka
aaaaaajaaaaaoeiaaeaaaaaeaaaaapiaamaaoekaaaaakkjaaaaaoeiaaeaaaaae
aaaaapiaanaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoeka
aaaaoeiaabaaaaacaaaaammaaaaaoeiaafaaaaadaaaaahiaabaaffjaapaamjka
aeaaaaaeaaaaahiaaoaamjkaabaaaajaaaaaoeiaaeaaaaaeaaaaahiabaaamjka
abaakkjaaaaaoeiaaiaaaaadaaaaaiiaaaaaoeiaaaaaoeiaahaaaaacaaaaaiia
aaaappiaafaaaaadaaaaahiaaaaappiaaaaaoeiaabaaaaacabaaaboaaaaakkia
afaaaaadacaaahiaaaaaoeiaabaanciaaeaaaaaeacaaahiaabaamjiaaaaamjia
acaaoeibafaaaaadacaaahiaacaaoeiaabaappjaabaaaaacabaaacoaacaaaaia
abaaaaacabaaaeoaabaaaaiaafaaaaadadaaahiaaaaaffjaapaaoekaaeaaaaae
adaaahiaaoaaoekaaaaaaajaadaaoeiaaeaaaaaeadaaahiabaaaoekaaaaakkja
adaaoeiaaeaaaaaeadaaahiabbaaoekaaaaappjaadaaoeiaabaaaaacabaaaioa
adaaaaiaabaaaaacacaaaboaaaaaaaiaabaaaaacadaaaboaaaaaffiaabaaaaac
acaaacoaacaaffiaabaaaaacadaaacoaacaakkiaabaaaaacacaaaeoaabaaffia
abaaaaacadaaaeoaabaakkiaabaaaaacacaaaioaadaaffiaabaaaaacadaaaioa
adaakkiappppaaaafdeieefchaahaaaaeaaaabaanmabaaaafjaaaaaeegiocaaa
aaaaaaaaamaaaaaafjaaaaaeegiocaaaabaaaaaacnaaaaaafjaaaaaeegiocaaa
acaaaaaabdaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaa
fpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaa
gfaaaaadpccabaaaadaaaaaagfaaaaadpccabaaaaeaaaaaagfaaaaadhccabaaa
afaaaaaagiaaaaacaeaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
aaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaa
akaaaaaaogikcaaaaaaaaaaaakaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaa
adaaaaaaagiecaaaaaaaaaaaalaaaaaakgiocaaaaaaaaaaaalaaaaaadiaaaaai
hcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaa
aaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaaoaaaaaakgbkbaaa
aaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaa
apaaaaaapgbpbaaaaaaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaaacaaaaaa
akaabaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaafgbfbaaaabaaaaaajgiecaaa
acaaaaaaanaaaaaadcaaaaakhcaabaaaabaaaaaajgiecaaaacaaaaaaamaaaaaa
agbabaaaabaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaabaaaaaajgiecaaa
acaaaaaaaoaaaaaakgbkbaaaabaaaaaaegacbaaaabaaaaaabaaaaaahbcaabaaa
aaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaafbcaabaaaaaaaaaaa
akaabaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaaagaabaaaaaaaaaaaegacbaaa
abaaaaaadiaaaaaibcaabaaaacaaaaaaakbabaaaacaaaaaaakiacaaaacaaaaaa
baaaaaaadiaaaaaiccaabaaaacaaaaaaakbabaaaacaaaaaaakiacaaaacaaaaaa
bbaaaaaadiaaaaaiecaabaaaacaaaaaaakbabaaaacaaaaaaakiacaaaacaaaaaa
bcaaaaaadiaaaaaibcaabaaaadaaaaaabkbabaaaacaaaaaabkiacaaaacaaaaaa
baaaaaaadiaaaaaiccaabaaaadaaaaaabkbabaaaacaaaaaabkiacaaaacaaaaaa
bbaaaaaadiaaaaaiecaabaaaadaaaaaabkbabaaaacaaaaaabkiacaaaacaaaaaa
bcaaaaaaaaaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaaegacbaaaadaaaaaa
diaaaaaibcaabaaaadaaaaaackbabaaaacaaaaaackiacaaaacaaaaaabaaaaaaa
diaaaaaiccaabaaaadaaaaaackbabaaaacaaaaaackiacaaaacaaaaaabbaaaaaa
diaaaaaiecaabaaaadaaaaaackbabaaaacaaaaaackiacaaaacaaaaaabcaaaaaa
aaaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaaegacbaaaadaaaaaabaaaaaah
bcaabaaaaaaaaaaaegacbaaaacaaaaaaegacbaaaacaaaaaaeeaaaaafbcaabaaa
aaaaaaaaakaabaaaaaaaaaaadiaaaaahhcaabaaaacaaaaaaagaabaaaaaaaaaaa
egacbaaaacaaaaaadiaaaaahhcaabaaaadaaaaaaegacbaaaabaaaaaacgajbaaa
acaaaaaadcaaaaakhcaabaaaadaaaaaajgaebaaaacaaaaaajgaebaaaabaaaaaa
egacbaiaebaaaaaaadaaaaaadiaaaaahhcaabaaaadaaaaaaegacbaaaadaaaaaa
pgbpbaaaabaaaaaadgaaaaafcccabaaaacaaaaaaakaabaaaadaaaaaadgaaaaaf
bccabaaaacaaaaaackaabaaaabaaaaaadgaaaaafeccabaaaacaaaaaaakaabaaa
acaaaaaadgaaaaafbccabaaaadaaaaaaakaabaaaabaaaaaadgaaaaafbccabaaa
aeaaaaaabkaabaaaabaaaaaadgaaaaaficcabaaaadaaaaaabkaabaaaaaaaaaaa
dgaaaaaficcabaaaaeaaaaaackaabaaaaaaaaaaadgaaaaafeccabaaaadaaaaaa
bkaabaaaacaaaaaadgaaaaafcccabaaaadaaaaaabkaabaaaadaaaaaadgaaaaaf
cccabaaaaeaaaaaackaabaaaadaaaaaadgaaaaafeccabaaaaeaaaaaackaabaaa
acaaaaaadiaaaaahbcaabaaaaaaaaaaabkaabaaaacaaaaaabkaabaaaacaaaaaa
dcaaaaakbcaabaaaaaaaaaaaakaabaaaacaaaaaaakaabaaaacaaaaaaakaabaia
ebaaaaaaaaaaaaaadiaaaaahpcaabaaaabaaaaaajgacbaaaacaaaaaaegakbaaa
acaaaaaabbaaaaaibcaabaaaadaaaaaaegiocaaaabaaaaaacjaaaaaaegaobaaa
abaaaaaabbaaaaaiccaabaaaadaaaaaaegiocaaaabaaaaaackaaaaaaegaobaaa
abaaaaaabbaaaaaiecaabaaaadaaaaaaegiocaaaabaaaaaaclaaaaaaegaobaaa
abaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaabaaaaaacmaaaaaaagaabaaa
aaaaaaaaegacbaaaadaaaaaadgaaaaaficaabaaaacaaaaaaabeaaaaaaaaaiadp
bbaaaaaibcaabaaaabaaaaaaegiocaaaabaaaaaacgaaaaaaegaobaaaacaaaaaa
bbaaaaaiccaabaaaabaaaaaaegiocaaaabaaaaaachaaaaaaegaobaaaacaaaaaa
bbaaaaaiecaabaaaabaaaaaaegiocaaaabaaaaaaciaaaaaaegaobaaaacaaaaaa
aaaaaaahhccabaaaafaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaadoaaaaab
ejfdeheopaaaaaaaaiaaaaaaaiaaaaaamiaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapapaaaanbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapapaaaa
njaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaaoaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaadaaaaaaapadaaaaoaaaaaaaabaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaapaaaaaaoaaaaaaaacaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaa
oaaaaaaaadaaaaaaaaaaaaaaadaaaaaaagaaaaaaapaaaaaaojaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaahaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofe
aaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheolaaaaaaa
agaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
keaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakeaaaaaaabaaaaaa
aaaaaaaaadaaaaaaacaaaaaaapaaaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaa
adaaaaaaapaaaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaa
keaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaklklkl"
}
SubProgram "opengl " {
// Stats: 19 math, 4 textures, 1 branches
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"!!GLSL
#ifdef VERTEX
uniform vec4 _ProjectionParams;
uniform vec4 unity_SHAr;
uniform vec4 unity_SHAg;
uniform vec4 unity_SHAb;
uniform vec4 unity_SHBr;
uniform vec4 unity_SHBg;
uniform vec4 unity_SHBb;
uniform vec4 unity_SHC;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 _MainTex_ST;
uniform vec4 _BumpMap_ST;
attribute vec4 TANGENT;
varying vec4 xlv_TEXCOORD0;
varying vec4 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD3;
varying vec3 xlv_TEXCOORD4;
varying vec4 xlv_TEXCOORD5;
void main ()
{
  vec4 tmpvar_1;
  vec4 tmpvar_2;
  tmpvar_2 = (gl_ModelViewProjectionMatrix * gl_Vertex);
  tmpvar_1.xy = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_1.zw = ((gl_MultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  vec3 tmpvar_3;
  tmpvar_3 = (_Object2World * gl_Vertex).xyz;
  vec4 v_4;
  v_4.x = _World2Object[0].x;
  v_4.y = _World2Object[1].x;
  v_4.z = _World2Object[2].x;
  v_4.w = _World2Object[3].x;
  vec4 v_5;
  v_5.x = _World2Object[0].y;
  v_5.y = _World2Object[1].y;
  v_5.z = _World2Object[2].y;
  v_5.w = _World2Object[3].y;
  vec4 v_6;
  v_6.x = _World2Object[0].z;
  v_6.y = _World2Object[1].z;
  v_6.z = _World2Object[2].z;
  v_6.w = _World2Object[3].z;
  vec3 tmpvar_7;
  tmpvar_7 = normalize(((
    (v_4.xyz * gl_Normal.x)
   + 
    (v_5.xyz * gl_Normal.y)
  ) + (v_6.xyz * gl_Normal.z)));
  mat3 tmpvar_8;
  tmpvar_8[0] = _Object2World[0].xyz;
  tmpvar_8[1] = _Object2World[1].xyz;
  tmpvar_8[2] = _Object2World[2].xyz;
  vec3 tmpvar_9;
  tmpvar_9 = normalize((tmpvar_8 * TANGENT.xyz));
  vec3 tmpvar_10;
  tmpvar_10 = (((tmpvar_7.yzx * tmpvar_9.zxy) - (tmpvar_7.zxy * tmpvar_9.yzx)) * TANGENT.w);
  vec4 tmpvar_11;
  tmpvar_11.x = tmpvar_9.x;
  tmpvar_11.y = tmpvar_10.x;
  tmpvar_11.z = tmpvar_7.x;
  tmpvar_11.w = tmpvar_3.x;
  vec4 tmpvar_12;
  tmpvar_12.x = tmpvar_9.y;
  tmpvar_12.y = tmpvar_10.y;
  tmpvar_12.z = tmpvar_7.y;
  tmpvar_12.w = tmpvar_3.y;
  vec4 tmpvar_13;
  tmpvar_13.x = tmpvar_9.z;
  tmpvar_13.y = tmpvar_10.z;
  tmpvar_13.z = tmpvar_7.z;
  tmpvar_13.w = tmpvar_3.z;
  vec4 tmpvar_14;
  tmpvar_14.w = 1.0;
  tmpvar_14.xyz = tmpvar_7;
  vec3 x2_15;
  vec3 x1_16;
  x1_16.x = dot (unity_SHAr, tmpvar_14);
  x1_16.y = dot (unity_SHAg, tmpvar_14);
  x1_16.z = dot (unity_SHAb, tmpvar_14);
  vec4 tmpvar_17;
  tmpvar_17 = (tmpvar_7.xyzz * tmpvar_7.yzzx);
  x2_15.x = dot (unity_SHBr, tmpvar_17);
  x2_15.y = dot (unity_SHBg, tmpvar_17);
  x2_15.z = dot (unity_SHBb, tmpvar_17);
  vec4 o_18;
  vec4 tmpvar_19;
  tmpvar_19 = (tmpvar_2 * 0.5);
  vec2 tmpvar_20;
  tmpvar_20.x = tmpvar_19.x;
  tmpvar_20.y = (tmpvar_19.y * _ProjectionParams.x);
  o_18.xy = (tmpvar_20 + tmpvar_19.w);
  o_18.zw = tmpvar_2.zw;
  gl_Position = tmpvar_2;
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_11;
  xlv_TEXCOORD2 = tmpvar_12;
  xlv_TEXCOORD3 = tmpvar_13;
  xlv_TEXCOORD4 = ((x2_15 + (unity_SHC.xyz * 
    ((tmpvar_7.x * tmpvar_7.x) - (tmpvar_7.y * tmpvar_7.y))
  )) + x1_16);
  xlv_TEXCOORD5 = o_18;
}


#endif
#ifdef FRAGMENT
uniform vec4 _WorldSpaceLightPos0;
uniform vec4 _LightColor0;
uniform sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform sampler2D _BumpMap;
uniform vec4 _Color;
uniform float _Cutoff;
varying vec4 xlv_TEXCOORD0;
varying vec4 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD3;
varying vec3 xlv_TEXCOORD4;
varying vec4 xlv_TEXCOORD5;
void main ()
{
  vec3 worldN_1;
  vec4 tmpvar_2;
  tmpvar_2 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) * _Color);
  vec3 normal_3;
  normal_3.xy = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).wy * 2.0) - 1.0);
  normal_3.z = sqrt((1.0 - clamp (
    dot (normal_3.xy, normal_3.xy)
  , 0.0, 1.0)));
  float x_4;
  x_4 = (tmpvar_2.w - _Cutoff);
  if ((x_4 < 0.0)) {
    discard;
  };
  worldN_1.x = dot (xlv_TEXCOORD1.xyz, normal_3);
  worldN_1.y = dot (xlv_TEXCOORD2.xyz, normal_3);
  worldN_1.z = dot (xlv_TEXCOORD3.xyz, normal_3);
  vec4 c_5;
  vec4 c_6;
  c_6.xyz = ((tmpvar_2.xyz * (_LightColor0.xyz * texture2DProj (_ShadowMapTexture, xlv_TEXCOORD5).x)) * max (0.0, dot (worldN_1, _WorldSpaceLightPos0.xyz)));
  c_6.w = tmpvar_2.w;
  c_5.w = c_6.w;
  c_5.xyz = (c_6.xyz + (tmpvar_2.xyz * xlv_TEXCOORD4));
  gl_FragData[0] = c_5;
}


#endif
"
}
SubProgram "d3d9 " {
// Stats: 51 math
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord4
Matrix 4 [_Object2World] 3
Matrix 7 [_World2Object] 3
Matrix 0 [glstate_matrix_mvp]
Vector 20 [_BumpMap_ST]
Vector 19 [_MainTex_ST]
Vector 10 [_ProjectionParams]
Vector 11 [_ScreenParams]
Vector 14 [unity_SHAb]
Vector 13 [unity_SHAg]
Vector 12 [unity_SHAr]
Vector 17 [unity_SHBb]
Vector 16 [unity_SHBg]
Vector 15 [unity_SHBr]
Vector 18 [unity_SHC]
"vs_2_0
def c21, 1, 0.5, 0, 0
dcl_position v0
dcl_tangent v1
dcl_normal v2
dcl_texcoord v3
mad oT0.xy, v3, c19, c19.zwzw
mad oT0.zw, v3.xyxy, c20.xyxy, c20
dp4 oT1.w, c4, v0
dp4 oT2.w, c5, v0
dp4 oT3.w, c6, v0
mul r0.xyz, v2.y, c8
mad r0.xyz, c7, v2.x, r0
mad r0.xyz, c9, v2.z, r0
nrm r1.xyz, r0
mul r0.x, r1.y, r1.y
mad r0.x, r1.x, r1.x, -r0.x
mul r2, r1.yzzx, r1.xyzz
dp4 r3.x, c15, r2
dp4 r3.y, c16, r2
dp4 r3.z, c17, r2
mad r0.xyz, c18, r0.x, r3
mov r1.w, c21.x
dp4 r2.x, c12, r1
dp4 r2.y, c13, r1
dp4 r2.z, c14, r1
add oT4.xyz, r0, r2
dp4 r0.y, c1, v0
mul r1.w, r0.y, c10.x
mul r2.w, r1.w, c21.y
dp4 r0.x, c0, v0
dp4 r0.w, c3, v0
mul r2.xz, r0.xyww, c21.y
mad oT5.xy, r2.z, c11.zwzw, r2.xwzw
dp4 r0.z, c2, v0
mov oPos, r0
mov oT5.zw, r0
dp3 r0.z, c4, v1
dp3 r0.x, c5, v1
dp3 r0.y, c6, v1
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul r0.xyz, r0.w, r0
mov oT1.x, r0.z
mul r2.xyz, r0, r1.zxyw
mad r2.xyz, r1.yzxw, r0.yzxw, -r2
mul r2.xyz, r2, v1.w
mov oT1.y, r2.x
mov oT1.z, r1.x
mov oT2.x, r0.x
mov oT3.x, r0.y
mov oT2.y, r2.y
mov oT3.y, r2.z
mov oT2.z, r1.y
mov oT3.z, r1.z

"
}
SubProgram "d3d11 " {
// Stats: 47 math
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord4
ConstBuffer "$Globals" 208
Vector 160 [_MainTex_ST]
Vector 176 [_BumpMap_ST]
ConstBuffer "UnityPerCamera" 144
Vector 80 [_ProjectionParams]
ConstBuffer "UnityLighting" 720
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0
eefiecedlbkpjeiglankmpapcbmpjcbjdbhiehfpabaaaaaabeakaaaaadaaaaaa
cmaaaaaaceabaaaapeabaaaaejfdeheopaaaaaaaaiaaaaaaaiaaaaaamiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaanbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaanjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaaoaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaaoaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaoaaaaaaaacaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaaoaaaaaaaadaaaaaaaaaaaaaaadaaaaaaagaaaaaa
apaaaaaaojaaaaaaaaaaaaaaaaaaaaaaadaaaaaaahaaaaaaapaaaaaafaepfdej
feejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepem
epfcaaklepfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
apaaaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaalmaaaaaa
acaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaalmaaaaaaadaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapaaaaaalmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaa
ahaiaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaaapaaaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefcbiaiaaaaeaaaabaa
agacaaaafjaaaaaeegiocaaaaaaaaaaaamaaaaaafjaaaaaeegiocaaaabaaaaaa
agaaaaaafjaaaaaeegiocaaaacaaaaaacnaaaaaafjaaaaaeegiocaaaadaaaaaa
bdaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaad
hcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaa
abaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaad
pccabaaaadaaaaaagfaaaaadpccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaa
gfaaaaadpccabaaaagaaaaaagiaaaaacafaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaakaaaaaa
ogikcaaaaaaaaaaaakaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaadaaaaaa
agiecaaaaaaaaaaaalaaaaaakgiocaaaaaaaaaaaalaaaaaadiaaaaaihcaabaaa
abaaaaaafgbfbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaakhcaabaaa
abaaaaaaegiccaaaadaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaabaaaaaa
dcaaaaakhcaabaaaabaaaaaaegiccaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaa
egacbaaaabaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaadaaaaaaapaaaaaa
pgbpbaaaaaaaaaaaegacbaaaabaaaaaadgaaaaaficcabaaaacaaaaaaakaabaaa
abaaaaaadiaaaaaihcaabaaaacaaaaaafgbfbaaaabaaaaaajgiecaaaadaaaaaa
anaaaaaadcaaaaakhcaabaaaacaaaaaajgiecaaaadaaaaaaamaaaaaaagbabaaa
abaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaaacaaaaaajgiecaaaadaaaaaa
aoaaaaaakgbkbaaaabaaaaaaegacbaaaacaaaaaabaaaaaahbcaabaaaabaaaaaa
egacbaaaacaaaaaaegacbaaaacaaaaaaeeaaaaafbcaabaaaabaaaaaaakaabaaa
abaaaaaadiaaaaahhcaabaaaacaaaaaaagaabaaaabaaaaaaegacbaaaacaaaaaa
diaaaaaibcaabaaaadaaaaaaakbabaaaacaaaaaaakiacaaaadaaaaaabaaaaaaa
diaaaaaiccaabaaaadaaaaaaakbabaaaacaaaaaaakiacaaaadaaaaaabbaaaaaa
diaaaaaiecaabaaaadaaaaaaakbabaaaacaaaaaaakiacaaaadaaaaaabcaaaaaa
diaaaaaibcaabaaaaeaaaaaabkbabaaaacaaaaaabkiacaaaadaaaaaabaaaaaaa
diaaaaaiccaabaaaaeaaaaaabkbabaaaacaaaaaabkiacaaaadaaaaaabbaaaaaa
diaaaaaiecaabaaaaeaaaaaabkbabaaaacaaaaaabkiacaaaadaaaaaabcaaaaaa
aaaaaaahhcaabaaaadaaaaaaegacbaaaadaaaaaaegacbaaaaeaaaaaadiaaaaai
bcaabaaaaeaaaaaackbabaaaacaaaaaackiacaaaadaaaaaabaaaaaaadiaaaaai
ccaabaaaaeaaaaaackbabaaaacaaaaaackiacaaaadaaaaaabbaaaaaadiaaaaai
ecaabaaaaeaaaaaackbabaaaacaaaaaackiacaaaadaaaaaabcaaaaaaaaaaaaah
hcaabaaaadaaaaaaegacbaaaadaaaaaaegacbaaaaeaaaaaabaaaaaahbcaabaaa
abaaaaaaegacbaaaadaaaaaaegacbaaaadaaaaaaeeaaaaafbcaabaaaabaaaaaa
akaabaaaabaaaaaadiaaaaahhcaabaaaadaaaaaaagaabaaaabaaaaaaegacbaaa
adaaaaaadiaaaaahhcaabaaaaeaaaaaaegacbaaaacaaaaaacgajbaaaadaaaaaa
dcaaaaakhcaabaaaaeaaaaaajgaebaaaadaaaaaajgaebaaaacaaaaaaegacbaia
ebaaaaaaaeaaaaaadiaaaaahhcaabaaaaeaaaaaaegacbaaaaeaaaaaapgbpbaaa
abaaaaaadgaaaaafcccabaaaacaaaaaaakaabaaaaeaaaaaadgaaaaafbccabaaa
acaaaaaackaabaaaacaaaaaadgaaaaafeccabaaaacaaaaaaakaabaaaadaaaaaa
dgaaaaafbccabaaaadaaaaaaakaabaaaacaaaaaadgaaaaafbccabaaaaeaaaaaa
bkaabaaaacaaaaaadgaaaaaficcabaaaadaaaaaabkaabaaaabaaaaaadgaaaaaf
iccabaaaaeaaaaaackaabaaaabaaaaaadgaaaaafeccabaaaadaaaaaabkaabaaa
adaaaaaadgaaaaafcccabaaaadaaaaaabkaabaaaaeaaaaaadgaaaaafcccabaaa
aeaaaaaackaabaaaaeaaaaaadgaaaaafeccabaaaaeaaaaaackaabaaaadaaaaaa
diaaaaahbcaabaaaabaaaaaabkaabaaaadaaaaaabkaabaaaadaaaaaadcaaaaak
bcaabaaaabaaaaaaakaabaaaadaaaaaaakaabaaaadaaaaaaakaabaiaebaaaaaa
abaaaaaadiaaaaahpcaabaaaacaaaaaajgacbaaaadaaaaaaegakbaaaadaaaaaa
bbaaaaaibcaabaaaaeaaaaaaegiocaaaacaaaaaacjaaaaaaegaobaaaacaaaaaa
bbaaaaaiccaabaaaaeaaaaaaegiocaaaacaaaaaackaaaaaaegaobaaaacaaaaaa
bbaaaaaiecaabaaaaeaaaaaaegiocaaaacaaaaaaclaaaaaaegaobaaaacaaaaaa
dcaaaaakhcaabaaaabaaaaaaegiccaaaacaaaaaacmaaaaaaagaabaaaabaaaaaa
egacbaaaaeaaaaaadgaaaaaficaabaaaadaaaaaaabeaaaaaaaaaiadpbbaaaaai
bcaabaaaacaaaaaaegiocaaaacaaaaaacgaaaaaaegaobaaaadaaaaaabbaaaaai
ccaabaaaacaaaaaaegiocaaaacaaaaaachaaaaaaegaobaaaadaaaaaabbaaaaai
ecaabaaaacaaaaaaegiocaaaacaaaaaaciaaaaaaegaobaaaadaaaaaaaaaaaaah
hccabaaaafaaaaaaegacbaaaabaaaaaaegacbaaaacaaaaaadiaaaaaiccaabaaa
aaaaaaaabkaabaaaaaaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaakncaabaaa
abaaaaaaagahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadp
dgaaaaafmccabaaaagaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaaagaaaaaa
kgakbaaaabaaaaaamgaabaaaabaaaaaadoaaaaab"
}
SubProgram "opengl " {
// Stats: 18 math, 3 textures, 1 branches
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"!!GLSL
#ifdef VERTEX
uniform vec4 unity_4LightPosX0;
uniform vec4 unity_4LightPosY0;
uniform vec4 unity_4LightPosZ0;
uniform vec4 unity_4LightAtten0;
uniform vec4 unity_LightColor[8];
uniform vec4 unity_SHAr;
uniform vec4 unity_SHAg;
uniform vec4 unity_SHAb;
uniform vec4 unity_SHBr;
uniform vec4 unity_SHBg;
uniform vec4 unity_SHBb;
uniform vec4 unity_SHC;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 _MainTex_ST;
uniform vec4 _BumpMap_ST;
attribute vec4 TANGENT;
varying vec4 xlv_TEXCOORD0;
varying vec4 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD3;
varying vec3 xlv_TEXCOORD4;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xy = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_1.zw = ((gl_MultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  vec3 tmpvar_2;
  tmpvar_2 = (_Object2World * gl_Vertex).xyz;
  vec4 v_3;
  v_3.x = _World2Object[0].x;
  v_3.y = _World2Object[1].x;
  v_3.z = _World2Object[2].x;
  v_3.w = _World2Object[3].x;
  vec4 v_4;
  v_4.x = _World2Object[0].y;
  v_4.y = _World2Object[1].y;
  v_4.z = _World2Object[2].y;
  v_4.w = _World2Object[3].y;
  vec4 v_5;
  v_5.x = _World2Object[0].z;
  v_5.y = _World2Object[1].z;
  v_5.z = _World2Object[2].z;
  v_5.w = _World2Object[3].z;
  vec3 tmpvar_6;
  tmpvar_6 = normalize(((
    (v_3.xyz * gl_Normal.x)
   + 
    (v_4.xyz * gl_Normal.y)
  ) + (v_5.xyz * gl_Normal.z)));
  mat3 tmpvar_7;
  tmpvar_7[0] = _Object2World[0].xyz;
  tmpvar_7[1] = _Object2World[1].xyz;
  tmpvar_7[2] = _Object2World[2].xyz;
  vec3 tmpvar_8;
  tmpvar_8 = normalize((tmpvar_7 * TANGENT.xyz));
  vec3 tmpvar_9;
  tmpvar_9 = (((tmpvar_6.yzx * tmpvar_8.zxy) - (tmpvar_6.zxy * tmpvar_8.yzx)) * TANGENT.w);
  vec4 tmpvar_10;
  tmpvar_10.x = tmpvar_8.x;
  tmpvar_10.y = tmpvar_9.x;
  tmpvar_10.z = tmpvar_6.x;
  tmpvar_10.w = tmpvar_2.x;
  vec4 tmpvar_11;
  tmpvar_11.x = tmpvar_8.y;
  tmpvar_11.y = tmpvar_9.y;
  tmpvar_11.z = tmpvar_6.y;
  tmpvar_11.w = tmpvar_2.y;
  vec4 tmpvar_12;
  tmpvar_12.x = tmpvar_8.z;
  tmpvar_12.y = tmpvar_9.z;
  tmpvar_12.z = tmpvar_6.z;
  tmpvar_12.w = tmpvar_2.z;
  vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = tmpvar_6;
  vec3 x2_14;
  vec3 x1_15;
  x1_15.x = dot (unity_SHAr, tmpvar_13);
  x1_15.y = dot (unity_SHAg, tmpvar_13);
  x1_15.z = dot (unity_SHAb, tmpvar_13);
  vec4 tmpvar_16;
  tmpvar_16 = (tmpvar_6.xyzz * tmpvar_6.yzzx);
  x2_14.x = dot (unity_SHBr, tmpvar_16);
  x2_14.y = dot (unity_SHBg, tmpvar_16);
  x2_14.z = dot (unity_SHBb, tmpvar_16);
  vec4 tmpvar_17;
  tmpvar_17 = (unity_4LightPosX0 - tmpvar_2.x);
  vec4 tmpvar_18;
  tmpvar_18 = (unity_4LightPosY0 - tmpvar_2.y);
  vec4 tmpvar_19;
  tmpvar_19 = (unity_4LightPosZ0 - tmpvar_2.z);
  vec4 tmpvar_20;
  tmpvar_20 = (((tmpvar_17 * tmpvar_17) + (tmpvar_18 * tmpvar_18)) + (tmpvar_19 * tmpvar_19));
  vec4 tmpvar_21;
  tmpvar_21 = (max (vec4(0.0, 0.0, 0.0, 0.0), (
    (((tmpvar_17 * tmpvar_6.x) + (tmpvar_18 * tmpvar_6.y)) + (tmpvar_19 * tmpvar_6.z))
   * 
    inversesqrt(tmpvar_20)
  )) * (1.0/((1.0 + 
    (tmpvar_20 * unity_4LightAtten0)
  ))));
  gl_Position = (gl_ModelViewProjectionMatrix * gl_Vertex);
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_10;
  xlv_TEXCOORD2 = tmpvar_11;
  xlv_TEXCOORD3 = tmpvar_12;
  xlv_TEXCOORD4 = (((x2_14 + 
    (unity_SHC.xyz * ((tmpvar_6.x * tmpvar_6.x) - (tmpvar_6.y * tmpvar_6.y)))
  ) + x1_15) + ((
    ((unity_LightColor[0].xyz * tmpvar_21.x) + (unity_LightColor[1].xyz * tmpvar_21.y))
   + 
    (unity_LightColor[2].xyz * tmpvar_21.z)
  ) + (unity_LightColor[3].xyz * tmpvar_21.w)));
}


#endif
#ifdef FRAGMENT
uniform vec4 _WorldSpaceLightPos0;
uniform vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform sampler2D _BumpMap;
uniform vec4 _Color;
uniform float _Cutoff;
varying vec4 xlv_TEXCOORD0;
varying vec4 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD3;
varying vec3 xlv_TEXCOORD4;
void main ()
{
  vec3 worldN_1;
  vec4 tmpvar_2;
  tmpvar_2 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) * _Color);
  vec3 normal_3;
  normal_3.xy = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).wy * 2.0) - 1.0);
  normal_3.z = sqrt((1.0 - clamp (
    dot (normal_3.xy, normal_3.xy)
  , 0.0, 1.0)));
  float x_4;
  x_4 = (tmpvar_2.w - _Cutoff);
  if ((x_4 < 0.0)) {
    discard;
  };
  worldN_1.x = dot (xlv_TEXCOORD1.xyz, normal_3);
  worldN_1.y = dot (xlv_TEXCOORD2.xyz, normal_3);
  worldN_1.z = dot (xlv_TEXCOORD3.xyz, normal_3);
  vec4 c_5;
  vec4 c_6;
  c_6.xyz = ((tmpvar_2.xyz * _LightColor0.xyz) * max (0.0, dot (worldN_1, _WorldSpaceLightPos0.xyz)));
  c_6.w = tmpvar_2.w;
  c_5.w = c_6.w;
  c_5.xyz = (c_6.xyz + (tmpvar_2.xyz * xlv_TEXCOORD4));
  gl_FragData[0] = c_5;
}


#endif
"
}
SubProgram "d3d9 " {
// Stats: 75 math
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord4
Matrix 8 [_Object2World] 3
Matrix 11 [_World2Object] 3
Matrix 4 [glstate_matrix_mvp]
Vector 26 [_BumpMap_ST]
Vector 25 [_MainTex_ST]
Vector 17 [unity_4LightAtten0]
Vector 14 [unity_4LightPosX0]
Vector 15 [unity_4LightPosY0]
Vector 16 [unity_4LightPosZ0]
Vector 0 [unity_LightColor0]
Vector 1 [unity_LightColor1]
Vector 2 [unity_LightColor2]
Vector 3 [unity_LightColor3]
Vector 20 [unity_SHAb]
Vector 19 [unity_SHAg]
Vector 18 [unity_SHAr]
Vector 23 [unity_SHBb]
Vector 22 [unity_SHBg]
Vector 21 [unity_SHBr]
Vector 24 [unity_SHC]
"vs_2_0
def c27, 1, 0, 0, 0
dcl_position v0
dcl_tangent v1
dcl_normal v2
dcl_texcoord v3
dp4 oPos.x, c4, v0
dp4 oPos.y, c5, v0
dp4 oPos.z, c6, v0
dp4 oPos.w, c7, v0
mad oT0.xy, v3, c25, c25.zwzw
mad oT0.zw, v3.xyxy, c26.xyxy, c26
dp4 r0.x, c9, v0
add r1, -r0.x, c15
mov oT2.w, r0.x
mul r0, r1, r1
dp4 r2.x, c8, v0
add r3, -r2.x, c14
mov oT1.w, r2.x
mad r0, r3, r3, r0
dp4 r2.x, c10, v0
add r4, -r2.x, c16
mov oT3.w, r2.x
mad r0, r4, r4, r0
rsq r2.x, r0.x
rsq r2.y, r0.y
rsq r2.z, r0.z
rsq r2.w, r0.w
mov r5.x, c27.x
mad r0, r0, c17, r5.x
mul r5.xyz, v2.y, c12
mad r5.xyz, c11, v2.x, r5
mad r5.xyz, c13, v2.z, r5
nrm r6.xyz, r5
mul r1, r1, r6.y
mad r1, r3, r6.x, r1
mad r1, r4, r6.z, r1
mul r1, r2, r1
max r1, r1, c27.y
rcp r2.x, r0.x
rcp r2.y, r0.y
rcp r2.z, r0.z
rcp r2.w, r0.w
mul r0, r1, r2
mul r1.xyz, r0.y, c1
mad r1.xyz, c0, r0.x, r1
mad r0.xyz, c2, r0.z, r1
mad r0.xyz, c3, r0.w, r0
mul r0.w, r6.y, r6.y
mad r0.w, r6.x, r6.x, -r0.w
mul r1, r6.yzzx, r6.xyzz
dp4 r2.x, c21, r1
dp4 r2.y, c22, r1
dp4 r2.z, c23, r1
mad r1.xyz, c24, r0.w, r2
mov r6.w, c27.x
dp4 r2.x, c18, r6
dp4 r2.y, c19, r6
dp4 r2.z, c20, r6
add r1.xyz, r1, r2
add oT4.xyz, r0, r1
dp3 r0.z, c8, v1
dp3 r0.x, c9, v1
dp3 r0.y, c10, v1
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul r0.xyz, r0.w, r0
mov oT1.x, r0.z
mul r1.xyz, r0, r6.zxyw
mad r1.xyz, r6.yzxw, r0.yzxw, -r1
mul r1.xyz, r1, v1.w
mov oT1.y, r1.x
mov oT1.z, r6.x
mov oT2.x, r0.x
mov oT3.x, r0.y
mov oT2.y, r1.y
mov oT3.y, r1.z
mov oT2.z, r6.y
mov oT3.z, r6.z

"
}
SubProgram "d3d11 " {
// Stats: 64 math
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord4
ConstBuffer "$Globals" 208
Vector 160 [_MainTex_ST]
Vector 176 [_BumpMap_ST]
ConstBuffer "UnityLighting" 720
Vector 32 [unity_4LightPosX0]
Vector 48 [unity_4LightPosY0]
Vector 64 [unity_4LightPosZ0]
Vector 80 [unity_4LightAtten0]
Vector 96 [unity_LightColor0]
Vector 112 [unity_LightColor1]
Vector 128 [unity_LightColor2]
Vector 144 [unity_LightColor3]
Vector 160 [unity_LightColor4]
Vector 176 [unity_LightColor5]
Vector 192 [unity_LightColor6]
Vector 208 [unity_LightColor7]
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedbelbkhpbcgcloccamnekdbcdpnhpbkagabaaaaaaamamaaaaadaaaaaa
cmaaaaaaceabaaaanmabaaaaejfdeheopaaaaaaaaiaaaaaaaiaaaaaamiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaanbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaanjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaaoaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaaoaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaoaaaaaaaacaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaaoaaaaaaaadaaaaaaaaaaaaaaadaaaaaaagaaaaaa
apaaaaaaojaaaaaaaaaaaaaaaaaaaaaaadaaaaaaahaaaaaaapaaaaaafaepfdej
feejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepem
epfcaaklepfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
apaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaakeaaaaaa
acaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapaaaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaa
ahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefc
ciakaaaaeaaaabaaikacaaaafjaaaaaeegiocaaaaaaaaaaaamaaaaaafjaaaaae
egiocaaaabaaaaaacnaaaaaafjaaaaaeegiocaaaacaaaaaabdaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaa
fpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
pccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaa
gfaaaaadpccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagiaaaaacagaaaaaa
diaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaa
kgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaa
acaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaa
abaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaakaaaaaaogikcaaaaaaaaaaa
akaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaadaaaaaaagiecaaaaaaaaaaa
alaaaaaakgiocaaaaaaaaaaaalaaaaaadiaaaaaihcaabaaaaaaaaaaafgbfbaaa
abaaaaaajgiecaaaacaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaajgiecaaa
acaaaaaaamaaaaaaagbabaaaabaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaa
aaaaaaaajgiecaaaacaaaaaaaoaaaaaakgbkbaaaabaaaaaaegacbaaaaaaaaaaa
baaaaaahicaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaaeeaaaaaf
icaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaapgapbaaa
aaaaaaaaegacbaaaaaaaaaaadgaaaaafbccabaaaacaaaaaackaabaaaaaaaaaaa
diaaaaaibcaabaaaabaaaaaaakbabaaaacaaaaaaakiacaaaacaaaaaabaaaaaaa
diaaaaaiccaabaaaabaaaaaaakbabaaaacaaaaaaakiacaaaacaaaaaabbaaaaaa
diaaaaaiecaabaaaabaaaaaaakbabaaaacaaaaaaakiacaaaacaaaaaabcaaaaaa
diaaaaaibcaabaaaacaaaaaabkbabaaaacaaaaaabkiacaaaacaaaaaabaaaaaaa
diaaaaaiccaabaaaacaaaaaabkbabaaaacaaaaaabkiacaaaacaaaaaabbaaaaaa
diaaaaaiecaabaaaacaaaaaabkbabaaaacaaaaaabkiacaaaacaaaaaabcaaaaaa
aaaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaacaaaaaadiaaaaai
bcaabaaaacaaaaaackbabaaaacaaaaaackiacaaaacaaaaaabaaaaaaadiaaaaai
ccaabaaaacaaaaaackbabaaaacaaaaaackiacaaaacaaaaaabbaaaaaadiaaaaai
ecaabaaaacaaaaaackbabaaaacaaaaaackiacaaaacaaaaaabcaaaaaaaaaaaaah
hcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaacaaaaaabaaaaaahicaabaaa
aaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaaficaabaaaaaaaaaaa
dkaabaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaapgapbaaaaaaaaaaaegacbaaa
abaaaaaadiaaaaahhcaabaaaacaaaaaaegacbaaaaaaaaaaacgajbaaaabaaaaaa
dcaaaaakhcaabaaaacaaaaaajgaebaaaabaaaaaajgaebaaaaaaaaaaaegacbaia
ebaaaaaaacaaaaaadiaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaapgbpbaaa
abaaaaaadgaaaaafcccabaaaacaaaaaaakaabaaaacaaaaaadgaaaaafeccabaaa
acaaaaaaakaabaaaabaaaaaadiaaaaaihcaabaaaadaaaaaafgbfbaaaaaaaaaaa
egiccaaaacaaaaaaanaaaaaadcaaaaakhcaabaaaadaaaaaaegiccaaaacaaaaaa
amaaaaaaagbabaaaaaaaaaaaegacbaaaadaaaaaadcaaaaakhcaabaaaadaaaaaa
egiccaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaaadaaaaaadcaaaaak
hcaabaaaadaaaaaaegiccaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaa
adaaaaaadgaaaaaficcabaaaacaaaaaaakaabaaaadaaaaaadgaaaaafbccabaaa
adaaaaaaakaabaaaaaaaaaaadgaaaaafbccabaaaaeaaaaaabkaabaaaaaaaaaaa
dgaaaaafcccabaaaadaaaaaabkaabaaaacaaaaaadgaaaaafcccabaaaaeaaaaaa
ckaabaaaacaaaaaadgaaaaafeccabaaaadaaaaaabkaabaaaabaaaaaadgaaaaaf
iccabaaaadaaaaaabkaabaaaadaaaaaadgaaaaaficcabaaaaeaaaaaackaabaaa
adaaaaaadgaaaaafeccabaaaaeaaaaaackaabaaaabaaaaaadiaaaaahbcaabaaa
aaaaaaaabkaabaaaabaaaaaabkaabaaaabaaaaaadcaaaaakbcaabaaaaaaaaaaa
akaabaaaabaaaaaaakaabaaaabaaaaaaakaabaiaebaaaaaaaaaaaaaadiaaaaah
pcaabaaaacaaaaaajgacbaaaabaaaaaaegakbaaaabaaaaaabbaaaaaibcaabaaa
aeaaaaaaegiocaaaabaaaaaacjaaaaaaegaobaaaacaaaaaabbaaaaaiccaabaaa
aeaaaaaaegiocaaaabaaaaaackaaaaaaegaobaaaacaaaaaabbaaaaaiecaabaaa
aeaaaaaaegiocaaaabaaaaaaclaaaaaaegaobaaaacaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaabaaaaaacmaaaaaaagaabaaaaaaaaaaaegacbaaaaeaaaaaa
dgaaaaaficaabaaaabaaaaaaabeaaaaaaaaaiadpbbaaaaaibcaabaaaacaaaaaa
egiocaaaabaaaaaacgaaaaaaegaobaaaabaaaaaabbaaaaaiccaabaaaacaaaaaa
egiocaaaabaaaaaachaaaaaaegaobaaaabaaaaaabbaaaaaiecaabaaaacaaaaaa
egiocaaaabaaaaaaciaaaaaaegaobaaaabaaaaaaaaaaaaahhcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegacbaaaacaaaaaaaaaaaaajpcaabaaaacaaaaaafgafbaia
ebaaaaaaadaaaaaaegiocaaaabaaaaaaadaaaaaadiaaaaahpcaabaaaaeaaaaaa
fgafbaaaabaaaaaaegaobaaaacaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaa
acaaaaaaegaobaaaacaaaaaaaaaaaaajpcaabaaaafaaaaaaagaabaiaebaaaaaa
adaaaaaaegiocaaaabaaaaaaacaaaaaaaaaaaaajpcaabaaaadaaaaaakgakbaia
ebaaaaaaadaaaaaaegiocaaaabaaaaaaaeaaaaaadcaaaaajpcaabaaaaeaaaaaa
egaobaaaafaaaaaaagaabaaaabaaaaaaegaobaaaaeaaaaaadcaaaaajpcaabaaa
abaaaaaaegaobaaaadaaaaaakgakbaaaabaaaaaaegaobaaaaeaaaaaadcaaaaaj
pcaabaaaacaaaaaaegaobaaaafaaaaaaegaobaaaafaaaaaaegaobaaaacaaaaaa
dcaaaaajpcaabaaaacaaaaaaegaobaaaadaaaaaaegaobaaaadaaaaaaegaobaaa
acaaaaaaeeaaaaafpcaabaaaadaaaaaaegaobaaaacaaaaaadcaaaaanpcaabaaa
acaaaaaaegaobaaaacaaaaaaegiocaaaabaaaaaaafaaaaaaaceaaaaaaaaaiadp
aaaaiadpaaaaiadpaaaaiadpaoaaaaakpcaabaaaacaaaaaaaceaaaaaaaaaiadp
aaaaiadpaaaaiadpaaaaiadpegaobaaaacaaaaaadiaaaaahpcaabaaaabaaaaaa
egaobaaaabaaaaaaegaobaaaadaaaaaadeaaaaakpcaabaaaabaaaaaaegaobaaa
abaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadiaaaaahpcaabaaa
abaaaaaaegaobaaaacaaaaaaegaobaaaabaaaaaadiaaaaaihcaabaaaacaaaaaa
fgafbaaaabaaaaaaegiccaaaabaaaaaaahaaaaaadcaaaaakhcaabaaaacaaaaaa
egiccaaaabaaaaaaagaaaaaaagaabaaaabaaaaaaegacbaaaacaaaaaadcaaaaak
hcaabaaaabaaaaaaegiccaaaabaaaaaaaiaaaaaakgakbaaaabaaaaaaegacbaaa
acaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaabaaaaaaajaaaaaapgapbaaa
abaaaaaaegacbaaaabaaaaaaaaaaaaahhccabaaaafaaaaaaegacbaaaaaaaaaaa
egacbaaaabaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 64 math
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord4
ConstBuffer "$Globals" 208
Vector 160 [_MainTex_ST]
Vector 176 [_BumpMap_ST]
ConstBuffer "UnityLighting" 720
Vector 32 [unity_4LightPosX0]
Vector 48 [unity_4LightPosY0]
Vector 64 [unity_4LightPosZ0]
Vector 80 [unity_4LightAtten0]
Vector 96 [unity_LightColor0]
Vector 112 [unity_LightColor1]
Vector 128 [unity_LightColor2]
Vector 144 [unity_LightColor3]
Vector 160 [unity_LightColor4]
Vector 176 [unity_LightColor5]
Vector 192 [unity_LightColor6]
Vector 208 [unity_LightColor7]
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedefpdnijkfkdgppajcjbiadpaamfoligaabaaaaaaaabcaaaaaeaaaaaa
daaaaaaacaagaaaafabaaaaaeibbaaaaebgpgodjoiafaaaaoiafaaaaaaacpopp
ieafaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaakaa
acaaabaaaaaaaaaaabaaacaaaiaaadaaaaaaaaaaabaacgaaahaaalaaaaaaaaaa
acaaaaaaaeaabcaaaaaaaaaaacaaamaaahaabgaaaaaaaaaaaaaaaaaaaaacpopp
fbaaaaafbnaaapkaaaaaiadpaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacafaaaaia
aaaaapjabpaaaaacafaaabiaabaaapjabpaaaaacafaaaciaacaaapjabpaaaaac
afaaadiaadaaapjaaeaaaaaeaaaaadoaadaaoejaabaaoekaabaaookaaeaaaaae
aaaaamoaadaaeejaacaaeekaacaaoekaafaaaaadaaaaabiaacaaaajabkaaaaka
afaaaaadaaaaaciaacaaaajablaaaakaafaaaaadaaaaaeiaacaaaajabmaaaaka
afaaaaadabaaabiaacaaffjabkaaffkaafaaaaadabaaaciaacaaffjablaaffka
afaaaaadabaaaeiaacaaffjabmaaffkaacaaaaadaaaaahiaaaaaoeiaabaaoeia
afaaaaadabaaabiaacaakkjabkaakkkaafaaaaadabaaaciaacaakkjablaakkka
afaaaaadabaaaeiaacaakkjabmaakkkaacaaaaadaaaaahiaaaaaoeiaabaaoeia
ceaaaaacabaaahiaaaaaoeiaafaaaaadaaaaahiaaaaaffjabhaaoekaaeaaaaae
aaaaahiabgaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaahiabiaaoekaaaaakkja
aaaaoeiaaeaaaaaeaaaaahiabjaaoekaaaaappjaaaaaoeiaacaaaaadacaaapia
aaaaffibaeaaoekaafaaaaadadaaapiaabaaffiaacaaoeiaafaaaaadacaaapia
acaaoeiaacaaoeiaacaaaaadaeaaapiaaaaaaaibadaaoekaaeaaaaaeadaaapia
aeaaoeiaabaaaaiaadaaoeiaaeaaaaaeacaaapiaaeaaoeiaaeaaoeiaacaaoeia
acaaaaadaeaaapiaaaaakkibafaaoekaaeaaaaaeadaaapiaaeaaoeiaabaakkia
adaaoeiaaeaaaaaeacaaapiaaeaaoeiaaeaaoeiaacaaoeiaahaaaaacaeaaabia
acaaaaiaahaaaaacaeaaaciaacaaffiaahaaaaacaeaaaeiaacaakkiaahaaaaac
aeaaaiiaacaappiaabaaaaacafaaabiabnaaaakaaeaaaaaeacaaapiaacaaoeia
agaaoekaafaaaaiaafaaaaadadaaapiaadaaoeiaaeaaoeiaalaaaaadadaaapia
adaaoeiabnaaffkaagaaaaacaeaaabiaacaaaaiaagaaaaacaeaaaciaacaaffia
agaaaaacaeaaaeiaacaakkiaagaaaaacaeaaaiiaacaappiaafaaaaadacaaapia
adaaoeiaaeaaoeiaafaaaaadadaaahiaacaaffiaaiaaoekaaeaaaaaeadaaahia
ahaaoekaacaaaaiaadaaoeiaaeaaaaaeacaaahiaajaaoekaacaakkiaadaaoeia
aeaaaaaeacaaahiaakaaoekaacaappiaacaaoeiaafaaaaadaaaaaiiaabaaffia
abaaffiaaeaaaaaeaaaaaiiaabaaaaiaabaaaaiaaaaappibafaaaaadadaaapia
abaacjiaabaakeiaajaaaaadaeaaabiaaoaaoekaadaaoeiaajaaaaadaeaaacia
apaaoekaadaaoeiaajaaaaadaeaaaeiabaaaoekaadaaoeiaaeaaaaaeadaaahia
bbaaoekaaaaappiaaeaaoeiaabaaaaacabaaaiiabnaaaakaajaaaaadaeaaabia
alaaoekaabaaoeiaajaaaaadaeaaaciaamaaoekaabaaoeiaajaaaaadaeaaaeia
anaaoekaabaaoeiaacaaaaadadaaahiaadaaoeiaaeaaoeiaacaaaaadaeaaahoa
acaaoeiaadaaoeiaafaaaaadacaaapiaaaaaffjabdaaoekaaeaaaaaeacaaapia
bcaaoekaaaaaaajaacaaoeiaaeaaaaaeacaaapiabeaaoekaaaaakkjaacaaoeia
aeaaaaaeacaaapiabfaaoekaaaaappjaacaaoeiaaeaaaaaeaaaaadmaacaappia
aaaaoekaacaaoeiaabaaaaacaaaaammaacaaoeiaafaaaaadacaaahiaabaaffja
bhaamjkaaeaaaaaeacaaahiabgaamjkaabaaaajaacaaoeiaaeaaaaaeacaaahia
biaamjkaabaakkjaacaaoeiaaiaaaaadaaaaaiiaacaaoeiaacaaoeiaahaaaaac
aaaaaiiaaaaappiaafaaaaadacaaahiaaaaappiaacaaoeiaabaaaaacabaaaboa
acaakkiaafaaaaadadaaahiaabaanciaacaaoeiaaeaaaaaeadaaahiaabaamjia
acaamjiaadaaoeibafaaaaadadaaahiaadaaoeiaabaappjaabaaaaacabaaacoa
adaaaaiaabaaaaacabaaaeoaabaaaaiaabaaaaacabaaaioaaaaaaaiaabaaaaac
acaaaboaacaaaaiaabaaaaacadaaaboaacaaffiaabaaaaacacaaacoaadaaffia
abaaaaacadaaacoaadaakkiaabaaaaacacaaaeoaabaaffiaabaaaaacadaaaeoa
abaakkiaabaaaaacacaaaioaaaaaffiaabaaaaacadaaaioaaaaakkiappppaaaa
fdeieefcciakaaaaeaaaabaaikacaaaafjaaaaaeegiocaaaaaaaaaaaamaaaaaa
fjaaaaaeegiocaaaabaaaaaacnaaaaaafjaaaaaeegiocaaaacaaaaaabdaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaa
acaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadpccabaaa
adaaaaaagfaaaaadpccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagiaaaaac
agaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaa
egiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaal
dccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaakaaaaaaogikcaaa
aaaaaaaaakaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaadaaaaaaagiecaaa
aaaaaaaaalaaaaaakgiocaaaaaaaaaaaalaaaaaadiaaaaaihcaabaaaaaaaaaaa
fgbfbaaaabaaaaaajgiecaaaacaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaa
jgiecaaaacaaaaaaamaaaaaaagbabaaaabaaaaaaegacbaaaaaaaaaaadcaaaaak
hcaabaaaaaaaaaaajgiecaaaacaaaaaaaoaaaaaakgbkbaaaabaaaaaaegacbaaa
aaaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaa
eeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaa
pgapbaaaaaaaaaaaegacbaaaaaaaaaaadgaaaaafbccabaaaacaaaaaackaabaaa
aaaaaaaadiaaaaaibcaabaaaabaaaaaaakbabaaaacaaaaaaakiacaaaacaaaaaa
baaaaaaadiaaaaaiccaabaaaabaaaaaaakbabaaaacaaaaaaakiacaaaacaaaaaa
bbaaaaaadiaaaaaiecaabaaaabaaaaaaakbabaaaacaaaaaaakiacaaaacaaaaaa
bcaaaaaadiaaaaaibcaabaaaacaaaaaabkbabaaaacaaaaaabkiacaaaacaaaaaa
baaaaaaadiaaaaaiccaabaaaacaaaaaabkbabaaaacaaaaaabkiacaaaacaaaaaa
bbaaaaaadiaaaaaiecaabaaaacaaaaaabkbabaaaacaaaaaabkiacaaaacaaaaaa
bcaaaaaaaaaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaacaaaaaa
diaaaaaibcaabaaaacaaaaaackbabaaaacaaaaaackiacaaaacaaaaaabaaaaaaa
diaaaaaiccaabaaaacaaaaaackbabaaaacaaaaaackiacaaaacaaaaaabbaaaaaa
diaaaaaiecaabaaaacaaaaaackbabaaaacaaaaaackiacaaaacaaaaaabcaaaaaa
aaaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaacaaaaaabaaaaaah
icaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaaficaabaaa
aaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaapgapbaaaaaaaaaaa
egacbaaaabaaaaaadiaaaaahhcaabaaaacaaaaaaegacbaaaaaaaaaaacgajbaaa
abaaaaaadcaaaaakhcaabaaaacaaaaaajgaebaaaabaaaaaajgaebaaaaaaaaaaa
egacbaiaebaaaaaaacaaaaaadiaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaa
pgbpbaaaabaaaaaadgaaaaafcccabaaaacaaaaaaakaabaaaacaaaaaadgaaaaaf
eccabaaaacaaaaaaakaabaaaabaaaaaadiaaaaaihcaabaaaadaaaaaafgbfbaaa
aaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaakhcaabaaaadaaaaaaegiccaaa
acaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaadaaaaaadcaaaaakhcaabaaa
adaaaaaaegiccaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaaadaaaaaa
dcaaaaakhcaabaaaadaaaaaaegiccaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaa
egacbaaaadaaaaaadgaaaaaficcabaaaacaaaaaaakaabaaaadaaaaaadgaaaaaf
bccabaaaadaaaaaaakaabaaaaaaaaaaadgaaaaafbccabaaaaeaaaaaabkaabaaa
aaaaaaaadgaaaaafcccabaaaadaaaaaabkaabaaaacaaaaaadgaaaaafcccabaaa
aeaaaaaackaabaaaacaaaaaadgaaaaafeccabaaaadaaaaaabkaabaaaabaaaaaa
dgaaaaaficcabaaaadaaaaaabkaabaaaadaaaaaadgaaaaaficcabaaaaeaaaaaa
ckaabaaaadaaaaaadgaaaaafeccabaaaaeaaaaaackaabaaaabaaaaaadiaaaaah
bcaabaaaaaaaaaaabkaabaaaabaaaaaabkaabaaaabaaaaaadcaaaaakbcaabaaa
aaaaaaaaakaabaaaabaaaaaaakaabaaaabaaaaaaakaabaiaebaaaaaaaaaaaaaa
diaaaaahpcaabaaaacaaaaaajgacbaaaabaaaaaaegakbaaaabaaaaaabbaaaaai
bcaabaaaaeaaaaaaegiocaaaabaaaaaacjaaaaaaegaobaaaacaaaaaabbaaaaai
ccaabaaaaeaaaaaaegiocaaaabaaaaaackaaaaaaegaobaaaacaaaaaabbaaaaai
ecaabaaaaeaaaaaaegiocaaaabaaaaaaclaaaaaaegaobaaaacaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaabaaaaaacmaaaaaaagaabaaaaaaaaaaaegacbaaa
aeaaaaaadgaaaaaficaabaaaabaaaaaaabeaaaaaaaaaiadpbbaaaaaibcaabaaa
acaaaaaaegiocaaaabaaaaaacgaaaaaaegaobaaaabaaaaaabbaaaaaiccaabaaa
acaaaaaaegiocaaaabaaaaaachaaaaaaegaobaaaabaaaaaabbaaaaaiecaabaaa
acaaaaaaegiocaaaabaaaaaaciaaaaaaegaobaaaabaaaaaaaaaaaaahhcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaaaacaaaaaaaaaaaaajpcaabaaaacaaaaaa
fgafbaiaebaaaaaaadaaaaaaegiocaaaabaaaaaaadaaaaaadiaaaaahpcaabaaa
aeaaaaaafgafbaaaabaaaaaaegaobaaaacaaaaaadiaaaaahpcaabaaaacaaaaaa
egaobaaaacaaaaaaegaobaaaacaaaaaaaaaaaaajpcaabaaaafaaaaaaagaabaia
ebaaaaaaadaaaaaaegiocaaaabaaaaaaacaaaaaaaaaaaaajpcaabaaaadaaaaaa
kgakbaiaebaaaaaaadaaaaaaegiocaaaabaaaaaaaeaaaaaadcaaaaajpcaabaaa
aeaaaaaaegaobaaaafaaaaaaagaabaaaabaaaaaaegaobaaaaeaaaaaadcaaaaaj
pcaabaaaabaaaaaaegaobaaaadaaaaaakgakbaaaabaaaaaaegaobaaaaeaaaaaa
dcaaaaajpcaabaaaacaaaaaaegaobaaaafaaaaaaegaobaaaafaaaaaaegaobaaa
acaaaaaadcaaaaajpcaabaaaacaaaaaaegaobaaaadaaaaaaegaobaaaadaaaaaa
egaobaaaacaaaaaaeeaaaaafpcaabaaaadaaaaaaegaobaaaacaaaaaadcaaaaan
pcaabaaaacaaaaaaegaobaaaacaaaaaaegiocaaaabaaaaaaafaaaaaaaceaaaaa
aaaaiadpaaaaiadpaaaaiadpaaaaiadpaoaaaaakpcaabaaaacaaaaaaaceaaaaa
aaaaiadpaaaaiadpaaaaiadpaaaaiadpegaobaaaacaaaaaadiaaaaahpcaabaaa
abaaaaaaegaobaaaabaaaaaaegaobaaaadaaaaaadeaaaaakpcaabaaaabaaaaaa
egaobaaaabaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadiaaaaah
pcaabaaaabaaaaaaegaobaaaacaaaaaaegaobaaaabaaaaaadiaaaaaihcaabaaa
acaaaaaafgafbaaaabaaaaaaegiccaaaabaaaaaaahaaaaaadcaaaaakhcaabaaa
acaaaaaaegiccaaaabaaaaaaagaaaaaaagaabaaaabaaaaaaegacbaaaacaaaaaa
dcaaaaakhcaabaaaabaaaaaaegiccaaaabaaaaaaaiaaaaaakgakbaaaabaaaaaa
egacbaaaacaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaabaaaaaaajaaaaaa
pgapbaaaabaaaaaaegacbaaaabaaaaaaaaaaaaahhccabaaaafaaaaaaegacbaaa
aaaaaaaaegacbaaaabaaaaaadoaaaaabejfdeheopaaaaaaaaiaaaaaaaiaaaaaa
miaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaanbaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapapaaaanjaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahahaaaaoaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaa
oaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaoaaaaaaaacaaaaaa
aaaaaaaaadaaaaaaafaaaaaaapaaaaaaoaaaaaaaadaaaaaaaaaaaaaaadaaaaaa
agaaaaaaapaaaaaaojaaaaaaaaaaaaaaaaaaaaaaadaaaaaaahaaaaaaapaaaaaa
faepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfcee
aaedepemepfcaaklepfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaa
keaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaakeaaaaaaadaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaapaaaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaa
afaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl
"
}
SubProgram "opengl " {
// Stats: 19 math, 4 textures, 1 branches
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"!!GLSL
#ifdef VERTEX
uniform vec4 _ProjectionParams;
uniform vec4 unity_4LightPosX0;
uniform vec4 unity_4LightPosY0;
uniform vec4 unity_4LightPosZ0;
uniform vec4 unity_4LightAtten0;
uniform vec4 unity_LightColor[8];
uniform vec4 unity_SHAr;
uniform vec4 unity_SHAg;
uniform vec4 unity_SHAb;
uniform vec4 unity_SHBr;
uniform vec4 unity_SHBg;
uniform vec4 unity_SHBb;
uniform vec4 unity_SHC;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 _MainTex_ST;
uniform vec4 _BumpMap_ST;
attribute vec4 TANGENT;
varying vec4 xlv_TEXCOORD0;
varying vec4 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD3;
varying vec3 xlv_TEXCOORD4;
varying vec4 xlv_TEXCOORD5;
void main ()
{
  vec4 tmpvar_1;
  vec4 tmpvar_2;
  tmpvar_2 = (gl_ModelViewProjectionMatrix * gl_Vertex);
  tmpvar_1.xy = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_1.zw = ((gl_MultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  vec3 tmpvar_3;
  tmpvar_3 = (_Object2World * gl_Vertex).xyz;
  vec4 v_4;
  v_4.x = _World2Object[0].x;
  v_4.y = _World2Object[1].x;
  v_4.z = _World2Object[2].x;
  v_4.w = _World2Object[3].x;
  vec4 v_5;
  v_5.x = _World2Object[0].y;
  v_5.y = _World2Object[1].y;
  v_5.z = _World2Object[2].y;
  v_5.w = _World2Object[3].y;
  vec4 v_6;
  v_6.x = _World2Object[0].z;
  v_6.y = _World2Object[1].z;
  v_6.z = _World2Object[2].z;
  v_6.w = _World2Object[3].z;
  vec3 tmpvar_7;
  tmpvar_7 = normalize(((
    (v_4.xyz * gl_Normal.x)
   + 
    (v_5.xyz * gl_Normal.y)
  ) + (v_6.xyz * gl_Normal.z)));
  mat3 tmpvar_8;
  tmpvar_8[0] = _Object2World[0].xyz;
  tmpvar_8[1] = _Object2World[1].xyz;
  tmpvar_8[2] = _Object2World[2].xyz;
  vec3 tmpvar_9;
  tmpvar_9 = normalize((tmpvar_8 * TANGENT.xyz));
  vec3 tmpvar_10;
  tmpvar_10 = (((tmpvar_7.yzx * tmpvar_9.zxy) - (tmpvar_7.zxy * tmpvar_9.yzx)) * TANGENT.w);
  vec4 tmpvar_11;
  tmpvar_11.x = tmpvar_9.x;
  tmpvar_11.y = tmpvar_10.x;
  tmpvar_11.z = tmpvar_7.x;
  tmpvar_11.w = tmpvar_3.x;
  vec4 tmpvar_12;
  tmpvar_12.x = tmpvar_9.y;
  tmpvar_12.y = tmpvar_10.y;
  tmpvar_12.z = tmpvar_7.y;
  tmpvar_12.w = tmpvar_3.y;
  vec4 tmpvar_13;
  tmpvar_13.x = tmpvar_9.z;
  tmpvar_13.y = tmpvar_10.z;
  tmpvar_13.z = tmpvar_7.z;
  tmpvar_13.w = tmpvar_3.z;
  vec4 tmpvar_14;
  tmpvar_14.w = 1.0;
  tmpvar_14.xyz = tmpvar_7;
  vec3 x2_15;
  vec3 x1_16;
  x1_16.x = dot (unity_SHAr, tmpvar_14);
  x1_16.y = dot (unity_SHAg, tmpvar_14);
  x1_16.z = dot (unity_SHAb, tmpvar_14);
  vec4 tmpvar_17;
  tmpvar_17 = (tmpvar_7.xyzz * tmpvar_7.yzzx);
  x2_15.x = dot (unity_SHBr, tmpvar_17);
  x2_15.y = dot (unity_SHBg, tmpvar_17);
  x2_15.z = dot (unity_SHBb, tmpvar_17);
  vec4 tmpvar_18;
  tmpvar_18 = (unity_4LightPosX0 - tmpvar_3.x);
  vec4 tmpvar_19;
  tmpvar_19 = (unity_4LightPosY0 - tmpvar_3.y);
  vec4 tmpvar_20;
  tmpvar_20 = (unity_4LightPosZ0 - tmpvar_3.z);
  vec4 tmpvar_21;
  tmpvar_21 = (((tmpvar_18 * tmpvar_18) + (tmpvar_19 * tmpvar_19)) + (tmpvar_20 * tmpvar_20));
  vec4 tmpvar_22;
  tmpvar_22 = (max (vec4(0.0, 0.0, 0.0, 0.0), (
    (((tmpvar_18 * tmpvar_7.x) + (tmpvar_19 * tmpvar_7.y)) + (tmpvar_20 * tmpvar_7.z))
   * 
    inversesqrt(tmpvar_21)
  )) * (1.0/((1.0 + 
    (tmpvar_21 * unity_4LightAtten0)
  ))));
  vec4 o_23;
  vec4 tmpvar_24;
  tmpvar_24 = (tmpvar_2 * 0.5);
  vec2 tmpvar_25;
  tmpvar_25.x = tmpvar_24.x;
  tmpvar_25.y = (tmpvar_24.y * _ProjectionParams.x);
  o_23.xy = (tmpvar_25 + tmpvar_24.w);
  o_23.zw = tmpvar_2.zw;
  gl_Position = tmpvar_2;
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_11;
  xlv_TEXCOORD2 = tmpvar_12;
  xlv_TEXCOORD3 = tmpvar_13;
  xlv_TEXCOORD4 = (((x2_15 + 
    (unity_SHC.xyz * ((tmpvar_7.x * tmpvar_7.x) - (tmpvar_7.y * tmpvar_7.y)))
  ) + x1_16) + ((
    ((unity_LightColor[0].xyz * tmpvar_22.x) + (unity_LightColor[1].xyz * tmpvar_22.y))
   + 
    (unity_LightColor[2].xyz * tmpvar_22.z)
  ) + (unity_LightColor[3].xyz * tmpvar_22.w)));
  xlv_TEXCOORD5 = o_23;
}


#endif
#ifdef FRAGMENT
uniform vec4 _WorldSpaceLightPos0;
uniform vec4 _LightColor0;
uniform sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform sampler2D _BumpMap;
uniform vec4 _Color;
uniform float _Cutoff;
varying vec4 xlv_TEXCOORD0;
varying vec4 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD3;
varying vec3 xlv_TEXCOORD4;
varying vec4 xlv_TEXCOORD5;
void main ()
{
  vec3 worldN_1;
  vec4 tmpvar_2;
  tmpvar_2 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) * _Color);
  vec3 normal_3;
  normal_3.xy = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).wy * 2.0) - 1.0);
  normal_3.z = sqrt((1.0 - clamp (
    dot (normal_3.xy, normal_3.xy)
  , 0.0, 1.0)));
  float x_4;
  x_4 = (tmpvar_2.w - _Cutoff);
  if ((x_4 < 0.0)) {
    discard;
  };
  worldN_1.x = dot (xlv_TEXCOORD1.xyz, normal_3);
  worldN_1.y = dot (xlv_TEXCOORD2.xyz, normal_3);
  worldN_1.z = dot (xlv_TEXCOORD3.xyz, normal_3);
  vec4 c_5;
  vec4 c_6;
  c_6.xyz = ((tmpvar_2.xyz * (_LightColor0.xyz * texture2DProj (_ShadowMapTexture, xlv_TEXCOORD5).x)) * max (0.0, dot (worldN_1, _WorldSpaceLightPos0.xyz)));
  c_6.w = tmpvar_2.w;
  c_5.w = c_6.w;
  c_5.xyz = (c_6.xyz + (tmpvar_2.xyz * xlv_TEXCOORD4));
  gl_FragData[0] = c_5;
}


#endif
"
}
SubProgram "d3d9 " {
// Stats: 81 math
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord4
Matrix 8 [_Object2World] 3
Matrix 11 [_World2Object] 3
Matrix 4 [glstate_matrix_mvp]
Vector 28 [_BumpMap_ST]
Vector 27 [_MainTex_ST]
Vector 14 [_ProjectionParams]
Vector 15 [_ScreenParams]
Vector 19 [unity_4LightAtten0]
Vector 16 [unity_4LightPosX0]
Vector 17 [unity_4LightPosY0]
Vector 18 [unity_4LightPosZ0]
Vector 0 [unity_LightColor0]
Vector 1 [unity_LightColor1]
Vector 2 [unity_LightColor2]
Vector 3 [unity_LightColor3]
Vector 22 [unity_SHAb]
Vector 21 [unity_SHAg]
Vector 20 [unity_SHAr]
Vector 25 [unity_SHBb]
Vector 24 [unity_SHBg]
Vector 23 [unity_SHBr]
Vector 26 [unity_SHC]
"vs_2_0
def c29, 1, 0, 0.5, 0
dcl_position v0
dcl_tangent v1
dcl_normal v2
dcl_texcoord v3
mad oT0.xy, v3, c27, c27.zwzw
mad oT0.zw, v3.xyxy, c28.xyxy, c28
dp4 r0.x, c9, v0
add r1, -r0.x, c17
mov oT2.w, r0.x
mul r0, r1, r1
dp4 r2.x, c8, v0
add r3, -r2.x, c16
mov oT1.w, r2.x
mad r0, r3, r3, r0
dp4 r2.x, c10, v0
add r4, -r2.x, c18
mov oT3.w, r2.x
mad r0, r4, r4, r0
rsq r2.x, r0.x
rsq r2.y, r0.y
rsq r2.z, r0.z
rsq r2.w, r0.w
mov r5.x, c29.x
mad r0, r0, c19, r5.x
mul r5.xyz, v2.y, c12
mad r5.xyz, c11, v2.x, r5
mad r5.xyz, c13, v2.z, r5
nrm r6.xyz, r5
mul r1, r1, r6.y
mad r1, r3, r6.x, r1
mad r1, r4, r6.z, r1
mul r1, r2, r1
max r1, r1, c29.y
rcp r2.x, r0.x
rcp r2.y, r0.y
rcp r2.z, r0.z
rcp r2.w, r0.w
mul r0, r1, r2
mul r1.xyz, r0.y, c1
mad r1.xyz, c0, r0.x, r1
mad r0.xyz, c2, r0.z, r1
mad r0.xyz, c3, r0.w, r0
mul r0.w, r6.y, r6.y
mad r0.w, r6.x, r6.x, -r0.w
mul r1, r6.yzzx, r6.xyzz
dp4 r2.x, c23, r1
dp4 r2.y, c24, r1
dp4 r2.z, c25, r1
mad r1.xyz, c26, r0.w, r2
mov r6.w, c29.x
dp4 r2.x, c20, r6
dp4 r2.y, c21, r6
dp4 r2.z, c22, r6
add r1.xyz, r1, r2
add oT4.xyz, r0, r1
dp4 r0.y, c5, v0
mul r1.x, r0.y, c14.x
mul r1.w, r1.x, c29.z
dp4 r0.x, c4, v0
dp4 r0.w, c7, v0
mul r1.xz, r0.xyww, c29.z
mad oT5.xy, r1.z, c15.zwzw, r1.xwzw
dp4 r0.z, c6, v0
mov oPos, r0
mov oT5.zw, r0
dp3 r0.z, c8, v1
dp3 r0.x, c9, v1
dp3 r0.y, c10, v1
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul r0.xyz, r0.w, r0
mov oT1.x, r0.z
mul r1.xyz, r0, r6.zxyw
mad r1.xyz, r6.yzxw, r0.yzxw, -r1
mul r1.xyz, r1, v1.w
mov oT1.y, r1.x
mov oT1.z, r6.x
mov oT2.x, r0.x
mov oT3.x, r0.y
mov oT2.y, r1.y
mov oT3.y, r1.z
mov oT2.z, r6.y
mov oT3.z, r6.z

"
}
SubProgram "d3d11 " {
// Stats: 67 math
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord4
ConstBuffer "$Globals" 208
Vector 160 [_MainTex_ST]
Vector 176 [_BumpMap_ST]
ConstBuffer "UnityPerCamera" 144
Vector 80 [_ProjectionParams]
ConstBuffer "UnityLighting" 720
Vector 32 [unity_4LightPosX0]
Vector 48 [unity_4LightPosY0]
Vector 64 [unity_4LightPosZ0]
Vector 80 [unity_4LightAtten0]
Vector 96 [unity_LightColor0]
Vector 112 [unity_LightColor1]
Vector 128 [unity_LightColor2]
Vector 144 [unity_LightColor3]
Vector 160 [unity_LightColor4]
Vector 176 [unity_LightColor5]
Vector 192 [unity_LightColor6]
Vector 208 [unity_LightColor7]
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0
eefiecedcpljgpgfpldgjbfnhhipkgldffhpkcplabaaaaaammamaaaaadaaaaaa
cmaaaaaaceabaaaapeabaaaaejfdeheopaaaaaaaaiaaaaaaaiaaaaaamiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaanbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaanjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaaoaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaaoaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaoaaaaaaaacaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaaoaaaaaaaadaaaaaaaaaaaaaaadaaaaaaagaaaaaa
apaaaaaaojaaaaaaaaaaaaaaaaaaaaaaadaaaaaaahaaaaaaapaaaaaafaepfdej
feejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepem
epfcaaklepfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
apaaaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaalmaaaaaa
acaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaalmaaaaaaadaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapaaaaaalmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaa
ahaiaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaaapaaaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefcnaakaaaaeaaaabaa
leacaaaafjaaaaaeegiocaaaaaaaaaaaamaaaaaafjaaaaaeegiocaaaabaaaaaa
agaaaaaafjaaaaaeegiocaaaacaaaaaacnaaaaaafjaaaaaeegiocaaaadaaaaaa
bdaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaad
hcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaa
abaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaad
pccabaaaadaaaaaagfaaaaadpccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaa
gfaaaaadpccabaaaagaaaaaagiaaaaacahaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaakaaaaaa
ogikcaaaaaaaaaaaakaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaadaaaaaa
agiecaaaaaaaaaaaalaaaaaakgiocaaaaaaaaaaaalaaaaaadiaaaaaihcaabaaa
abaaaaaafgbfbaaaabaaaaaajgiecaaaadaaaaaaanaaaaaadcaaaaakhcaabaaa
abaaaaaajgiecaaaadaaaaaaamaaaaaaagbabaaaabaaaaaaegacbaaaabaaaaaa
dcaaaaakhcaabaaaabaaaaaajgiecaaaadaaaaaaaoaaaaaakgbkbaaaabaaaaaa
egacbaaaabaaaaaabaaaaaahicaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaa
abaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaahhcaabaaa
abaaaaaapgapbaaaabaaaaaaegacbaaaabaaaaaadgaaaaafbccabaaaacaaaaaa
ckaabaaaabaaaaaadiaaaaaibcaabaaaacaaaaaaakbabaaaacaaaaaaakiacaaa
adaaaaaabaaaaaaadiaaaaaiccaabaaaacaaaaaaakbabaaaacaaaaaaakiacaaa
adaaaaaabbaaaaaadiaaaaaiecaabaaaacaaaaaaakbabaaaacaaaaaaakiacaaa
adaaaaaabcaaaaaadiaaaaaibcaabaaaadaaaaaabkbabaaaacaaaaaabkiacaaa
adaaaaaabaaaaaaadiaaaaaiccaabaaaadaaaaaabkbabaaaacaaaaaabkiacaaa
adaaaaaabbaaaaaadiaaaaaiecaabaaaadaaaaaabkbabaaaacaaaaaabkiacaaa
adaaaaaabcaaaaaaaaaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaaegacbaaa
adaaaaaadiaaaaaibcaabaaaadaaaaaackbabaaaacaaaaaackiacaaaadaaaaaa
baaaaaaadiaaaaaiccaabaaaadaaaaaackbabaaaacaaaaaackiacaaaadaaaaaa
bbaaaaaadiaaaaaiecaabaaaadaaaaaackbabaaaacaaaaaackiacaaaadaaaaaa
bcaaaaaaaaaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaaegacbaaaadaaaaaa
baaaaaahicaabaaaabaaaaaaegacbaaaacaaaaaaegacbaaaacaaaaaaeeaaaaaf
icaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaahhcaabaaaacaaaaaapgapbaaa
abaaaaaaegacbaaaacaaaaaadiaaaaahhcaabaaaadaaaaaaegacbaaaabaaaaaa
cgajbaaaacaaaaaadcaaaaakhcaabaaaadaaaaaajgaebaaaacaaaaaajgaebaaa
abaaaaaaegacbaiaebaaaaaaadaaaaaadiaaaaahhcaabaaaadaaaaaaegacbaaa
adaaaaaapgbpbaaaabaaaaaadgaaaaafcccabaaaacaaaaaaakaabaaaadaaaaaa
dgaaaaafeccabaaaacaaaaaaakaabaaaacaaaaaadiaaaaaihcaabaaaaeaaaaaa
fgbfbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaakhcaabaaaaeaaaaaa
egiccaaaadaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaaeaaaaaadcaaaaak
hcaabaaaaeaaaaaaegiccaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaa
aeaaaaaadcaaaaakhcaabaaaaeaaaaaaegiccaaaadaaaaaaapaaaaaapgbpbaaa
aaaaaaaaegacbaaaaeaaaaaadgaaaaaficcabaaaacaaaaaaakaabaaaaeaaaaaa
dgaaaaafbccabaaaadaaaaaaakaabaaaabaaaaaadgaaaaafbccabaaaaeaaaaaa
bkaabaaaabaaaaaadgaaaaafcccabaaaadaaaaaabkaabaaaadaaaaaadgaaaaaf
cccabaaaaeaaaaaackaabaaaadaaaaaadgaaaaafeccabaaaadaaaaaabkaabaaa
acaaaaaadgaaaaaficcabaaaadaaaaaabkaabaaaaeaaaaaadgaaaaaficcabaaa
aeaaaaaackaabaaaaeaaaaaadgaaaaafeccabaaaaeaaaaaackaabaaaacaaaaaa
diaaaaahbcaabaaaabaaaaaabkaabaaaacaaaaaabkaabaaaacaaaaaadcaaaaak
bcaabaaaabaaaaaaakaabaaaacaaaaaaakaabaaaacaaaaaaakaabaiaebaaaaaa
abaaaaaadiaaaaahpcaabaaaadaaaaaajgacbaaaacaaaaaaegakbaaaacaaaaaa
bbaaaaaibcaabaaaafaaaaaaegiocaaaacaaaaaacjaaaaaaegaobaaaadaaaaaa
bbaaaaaiccaabaaaafaaaaaaegiocaaaacaaaaaackaaaaaaegaobaaaadaaaaaa
bbaaaaaiecaabaaaafaaaaaaegiocaaaacaaaaaaclaaaaaaegaobaaaadaaaaaa
dcaaaaakhcaabaaaabaaaaaaegiccaaaacaaaaaacmaaaaaaagaabaaaabaaaaaa
egacbaaaafaaaaaadgaaaaaficaabaaaacaaaaaaabeaaaaaaaaaiadpbbaaaaai
bcaabaaaadaaaaaaegiocaaaacaaaaaacgaaaaaaegaobaaaacaaaaaabbaaaaai
ccaabaaaadaaaaaaegiocaaaacaaaaaachaaaaaaegaobaaaacaaaaaabbaaaaai
ecaabaaaadaaaaaaegiocaaaacaaaaaaciaaaaaaegaobaaaacaaaaaaaaaaaaah
hcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaadaaaaaaaaaaaaajpcaabaaa
adaaaaaafgafbaiaebaaaaaaaeaaaaaaegiocaaaacaaaaaaadaaaaaadiaaaaah
pcaabaaaafaaaaaafgafbaaaacaaaaaaegaobaaaadaaaaaadiaaaaahpcaabaaa
adaaaaaaegaobaaaadaaaaaaegaobaaaadaaaaaaaaaaaaajpcaabaaaagaaaaaa
agaabaiaebaaaaaaaeaaaaaaegiocaaaacaaaaaaacaaaaaaaaaaaaajpcaabaaa
aeaaaaaakgakbaiaebaaaaaaaeaaaaaaegiocaaaacaaaaaaaeaaaaaadcaaaaaj
pcaabaaaafaaaaaaegaobaaaagaaaaaaagaabaaaacaaaaaaegaobaaaafaaaaaa
dcaaaaajpcaabaaaacaaaaaaegaobaaaaeaaaaaakgakbaaaacaaaaaaegaobaaa
afaaaaaadcaaaaajpcaabaaaadaaaaaaegaobaaaagaaaaaaegaobaaaagaaaaaa
egaobaaaadaaaaaadcaaaaajpcaabaaaadaaaaaaegaobaaaaeaaaaaaegaobaaa
aeaaaaaaegaobaaaadaaaaaaeeaaaaafpcaabaaaaeaaaaaaegaobaaaadaaaaaa
dcaaaaanpcaabaaaadaaaaaaegaobaaaadaaaaaaegiocaaaacaaaaaaafaaaaaa
aceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpaoaaaaakpcaabaaaadaaaaaa
aceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpegaobaaaadaaaaaadiaaaaah
pcaabaaaacaaaaaaegaobaaaacaaaaaaegaobaaaaeaaaaaadeaaaaakpcaabaaa
acaaaaaaegaobaaaacaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
diaaaaahpcaabaaaacaaaaaaegaobaaaadaaaaaaegaobaaaacaaaaaadiaaaaai
hcaabaaaadaaaaaafgafbaaaacaaaaaaegiccaaaacaaaaaaahaaaaaadcaaaaak
hcaabaaaadaaaaaaegiccaaaacaaaaaaagaaaaaaagaabaaaacaaaaaaegacbaaa
adaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaaaiaaaaaakgakbaaa
acaaaaaaegacbaaaadaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaa
ajaaaaaapgapbaaaacaaaaaaegacbaaaacaaaaaaaaaaaaahhccabaaaafaaaaaa
egacbaaaabaaaaaaegacbaaaacaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaa
aaaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaakncaabaaaabaaaaaaagahbaaa
aaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadpdgaaaaafmccabaaa
agaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaaagaaaaaakgakbaaaabaaaaaa
mgaabaaaabaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 52 math
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_NATIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord4
ConstBuffer "$Globals" 208
Vector 160 [_MainTex_ST]
Vector 176 [_BumpMap_ST]
ConstBuffer "UnityLighting" 720
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityShadows" 416
Matrix 128 [unity_World2Shadow0]
Matrix 192 [unity_World2Shadow1]
Matrix 256 [unity_World2Shadow2]
Matrix 320 [unity_World2Shadow3]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityShadows" 2
BindCB  "UnityPerDraw" 3
"vs_4_0_level_9_1
eefiecedfnemdlcjaoaliamihjjpfgdecpahabebabaaaaaajiapaaaaaeaaaaaa
daaaaaaaamafaaaanaanaaaamiaoaaaaebgpgodjneaeaaaaneaeaaaaaaacpopp
haaeaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaakaa
acaaabaaaaaaaaaaabaacgaaahaaadaaaaaaaaaaacaaaiaaaeaaakaaaaaaaaaa
adaaaaaaaeaaaoaaaaaaaaaaadaaamaaahaabcaaaaaaaaaaaaaaaaaaaaacpopp
fbaaaaafbjaaapkaaaaaiadpaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacafaaaaia
aaaaapjabpaaaaacafaaabiaabaaapjabpaaaaacafaaaciaacaaapjabpaaaaac
afaaadiaadaaapjaaeaaaaaeaaaaadoaadaaoejaabaaoekaabaaookaaeaaaaae
aaaaamoaadaaeejaacaaeekaacaaoekaafaaaaadaaaaabiaacaaaajabgaaaaka
afaaaaadaaaaaciaacaaaajabhaaaakaafaaaaadaaaaaeiaacaaaajabiaaaaka
afaaaaadabaaabiaacaaffjabgaaffkaafaaaaadabaaaciaacaaffjabhaaffka
afaaaaadabaaaeiaacaaffjabiaaffkaacaaaaadaaaaahiaaaaaoeiaabaaoeia
afaaaaadabaaabiaacaakkjabgaakkkaafaaaaadabaaaciaacaakkjabhaakkka
afaaaaadabaaaeiaacaakkjabiaakkkaacaaaaadaaaaahiaaaaaoeiaabaaoeia
ceaaaaacabaaahiaaaaaoeiaafaaaaadaaaaabiaabaaffiaabaaffiaaeaaaaae
aaaaabiaabaaaaiaabaaaaiaaaaaaaibafaaaaadacaaapiaabaacjiaabaakeia
ajaaaaadadaaabiaagaaoekaacaaoeiaajaaaaadadaaaciaahaaoekaacaaoeia
ajaaaaadadaaaeiaaiaaoekaacaaoeiaaeaaaaaeaaaaahiaajaaoekaaaaaaaia
adaaoeiaabaaaaacabaaaiiabjaaaakaajaaaaadacaaabiaadaaoekaabaaoeia
ajaaaaadacaaaciaaeaaoekaabaaoeiaajaaaaadacaaaeiaafaaoekaabaaoeia
acaaaaadaeaaahoaaaaaoeiaacaaoeiaafaaaaadaaaaapiaaaaaffjabdaaoeka
aeaaaaaeaaaaapiabcaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiabeaaoeka
aaaakkjaaaaaoeiaaeaaaaaeaaaaapiabfaaoekaaaaappjaaaaaoeiaafaaaaad
acaaapiaaaaaffiaalaaoekaaeaaaaaeacaaapiaakaaoekaaaaaaaiaacaaoeia
aeaaaaaeacaaapiaamaaoekaaaaakkiaacaaoeiaaeaaaaaeafaaapoaanaaoeka
aaaappiaacaaoeiaafaaaaadaaaaapiaaaaaffjaapaaoekaaeaaaaaeaaaaapia
aoaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiabaaaoekaaaaakkjaaaaaoeia
aeaaaaaeaaaaapiabbaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappia
aaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaafaaaaadaaaaahiaabaaffja
bdaamjkaaeaaaaaeaaaaahiabcaamjkaabaaaajaaaaaoeiaaeaaaaaeaaaaahia
beaamjkaabaakkjaaaaaoeiaaiaaaaadaaaaaiiaaaaaoeiaaaaaoeiaahaaaaac
aaaaaiiaaaaappiaafaaaaadaaaaahiaaaaappiaaaaaoeiaabaaaaacabaaaboa
aaaakkiaafaaaaadacaaahiaaaaaoeiaabaanciaaeaaaaaeacaaahiaabaamjia
aaaamjiaacaaoeibafaaaaadacaaahiaacaaoeiaabaappjaabaaaaacabaaacoa
acaaaaiaabaaaaacabaaaeoaabaaaaiaafaaaaadadaaahiaaaaaffjabdaaoeka
aeaaaaaeadaaahiabcaaoekaaaaaaajaadaaoeiaaeaaaaaeadaaahiabeaaoeka
aaaakkjaadaaoeiaaeaaaaaeadaaahiabfaaoekaaaaappjaadaaoeiaabaaaaac
abaaaioaadaaaaiaabaaaaacacaaaboaaaaaaaiaabaaaaacadaaaboaaaaaffia
abaaaaacacaaacoaacaaffiaabaaaaacadaaacoaacaakkiaabaaaaacacaaaeoa
abaaffiaabaaaaacadaaaeoaabaakkiaabaaaaacacaaaioaadaaffiaabaaaaac
adaaaioaadaakkiappppaaaafdeieefclmaiaaaaeaaaabaacpacaaaafjaaaaae
egiocaaaaaaaaaaaamaaaaaafjaaaaaeegiocaaaabaaaaaacnaaaaaafjaaaaae
egiocaaaacaaaaaaamaaaaaafjaaaaaeegiocaaaadaaaaaabdaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaa
fpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
pccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaa
gfaaaaadpccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagfaaaaadpccabaaa
agaaaaaagiaaaaacaeaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaa
aaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pccabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaa
akaaaaaaogikcaaaaaaaaaaaakaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaa
adaaaaaaagiecaaaaaaaaaaaalaaaaaakgiocaaaaaaaaaaaalaaaaaadiaaaaai
hcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaadaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaa
aaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaaoaaaaaakgbkbaaa
aaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaa
apaaaaaapgbpbaaaaaaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaaacaaaaaa
akaabaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaafgbfbaaaabaaaaaajgiecaaa
adaaaaaaanaaaaaadcaaaaakhcaabaaaabaaaaaajgiecaaaadaaaaaaamaaaaaa
agbabaaaabaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaabaaaaaajgiecaaa
adaaaaaaaoaaaaaakgbkbaaaabaaaaaaegacbaaaabaaaaaabaaaaaahbcaabaaa
aaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaafbcaabaaaaaaaaaaa
akaabaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaaagaabaaaaaaaaaaaegacbaaa
abaaaaaadiaaaaaibcaabaaaacaaaaaaakbabaaaacaaaaaaakiacaaaadaaaaaa
baaaaaaadiaaaaaiccaabaaaacaaaaaaakbabaaaacaaaaaaakiacaaaadaaaaaa
bbaaaaaadiaaaaaiecaabaaaacaaaaaaakbabaaaacaaaaaaakiacaaaadaaaaaa
bcaaaaaadiaaaaaibcaabaaaadaaaaaabkbabaaaacaaaaaabkiacaaaadaaaaaa
baaaaaaadiaaaaaiccaabaaaadaaaaaabkbabaaaacaaaaaabkiacaaaadaaaaaa
bbaaaaaadiaaaaaiecaabaaaadaaaaaabkbabaaaacaaaaaabkiacaaaadaaaaaa
bcaaaaaaaaaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaaegacbaaaadaaaaaa
diaaaaaibcaabaaaadaaaaaackbabaaaacaaaaaackiacaaaadaaaaaabaaaaaaa
diaaaaaiccaabaaaadaaaaaackbabaaaacaaaaaackiacaaaadaaaaaabbaaaaaa
diaaaaaiecaabaaaadaaaaaackbabaaaacaaaaaackiacaaaadaaaaaabcaaaaaa
aaaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaaegacbaaaadaaaaaabaaaaaah
bcaabaaaaaaaaaaaegacbaaaacaaaaaaegacbaaaacaaaaaaeeaaaaafbcaabaaa
aaaaaaaaakaabaaaaaaaaaaadiaaaaahhcaabaaaacaaaaaaagaabaaaaaaaaaaa
egacbaaaacaaaaaadiaaaaahhcaabaaaadaaaaaaegacbaaaabaaaaaacgajbaaa
acaaaaaadcaaaaakhcaabaaaadaaaaaajgaebaaaacaaaaaajgaebaaaabaaaaaa
egacbaiaebaaaaaaadaaaaaadiaaaaahhcaabaaaadaaaaaaegacbaaaadaaaaaa
pgbpbaaaabaaaaaadgaaaaafcccabaaaacaaaaaaakaabaaaadaaaaaadgaaaaaf
bccabaaaacaaaaaackaabaaaabaaaaaadgaaaaafeccabaaaacaaaaaaakaabaaa
acaaaaaadgaaaaafbccabaaaadaaaaaaakaabaaaabaaaaaadgaaaaafbccabaaa
aeaaaaaabkaabaaaabaaaaaadgaaaaaficcabaaaadaaaaaabkaabaaaaaaaaaaa
dgaaaaaficcabaaaaeaaaaaackaabaaaaaaaaaaadgaaaaafeccabaaaadaaaaaa
bkaabaaaacaaaaaadgaaaaafcccabaaaadaaaaaabkaabaaaadaaaaaadgaaaaaf
cccabaaaaeaaaaaackaabaaaadaaaaaadgaaaaafeccabaaaaeaaaaaackaabaaa
acaaaaaadiaaaaahbcaabaaaaaaaaaaabkaabaaaacaaaaaabkaabaaaacaaaaaa
dcaaaaakbcaabaaaaaaaaaaaakaabaaaacaaaaaaakaabaaaacaaaaaaakaabaia
ebaaaaaaaaaaaaaadiaaaaahpcaabaaaabaaaaaajgacbaaaacaaaaaaegakbaaa
acaaaaaabbaaaaaibcaabaaaadaaaaaaegiocaaaabaaaaaacjaaaaaaegaobaaa
abaaaaaabbaaaaaiccaabaaaadaaaaaaegiocaaaabaaaaaackaaaaaaegaobaaa
abaaaaaabbaaaaaiecaabaaaadaaaaaaegiocaaaabaaaaaaclaaaaaaegaobaaa
abaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaabaaaaaacmaaaaaaagaabaaa
aaaaaaaaegacbaaaadaaaaaadgaaaaaficaabaaaacaaaaaaabeaaaaaaaaaiadp
bbaaaaaibcaabaaaabaaaaaaegiocaaaabaaaaaacgaaaaaaegaobaaaacaaaaaa
bbaaaaaiccaabaaaabaaaaaaegiocaaaabaaaaaachaaaaaaegaobaaaacaaaaaa
bbaaaaaiecaabaaaabaaaaaaegiocaaaabaaaaaaciaaaaaaegaobaaaacaaaaaa
aaaaaaahhccabaaaafaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaanaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaaoaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaa
apaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaipcaabaaaabaaaaaa
fgafbaaaaaaaaaaaegiocaaaacaaaaaaajaaaaaadcaaaaakpcaabaaaabaaaaaa
egiocaaaacaaaaaaaiaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaak
pcaabaaaabaaaaaaegiocaaaacaaaaaaakaaaaaakgakbaaaaaaaaaaaegaobaaa
abaaaaaadcaaaaakpccabaaaagaaaaaaegiocaaaacaaaaaaalaaaaaapgapbaaa
aaaaaaaaegaobaaaabaaaaaadoaaaaabejfdeheopaaaaaaaaiaaaaaaaiaaaaaa
miaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaanbaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapapaaaanjaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahahaaaaoaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaa
oaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaoaaaaaaaacaaaaaa
aaaaaaaaadaaaaaaafaaaaaaapaaaaaaoaaaaaaaadaaaaaaaaaaaaaaadaaaaaa
agaaaaaaapaaaaaaojaaaaaaaaaaaaaaaaaaaaaaadaaaaaaahaaaaaaapaaaaaa
faepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfcee
aaedepemepfcaaklepfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaapaaaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaa
lmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaalmaaaaaaadaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaapaaaaaalmaaaaaaaeaaaaaaaaaaaaaaadaaaaaa
afaaaaaaahaiaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaaapaaaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl"
}
SubProgram "d3d11_9x " {
// Stats: 72 math
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_NATIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord4
ConstBuffer "$Globals" 208
Vector 160 [_MainTex_ST]
Vector 176 [_BumpMap_ST]
ConstBuffer "UnityLighting" 720
Vector 32 [unity_4LightPosX0]
Vector 48 [unity_4LightPosY0]
Vector 64 [unity_4LightPosZ0]
Vector 80 [unity_4LightAtten0]
Vector 96 [unity_LightColor0]
Vector 112 [unity_LightColor1]
Vector 128 [unity_LightColor2]
Vector 144 [unity_LightColor3]
Vector 160 [unity_LightColor4]
Vector 176 [unity_LightColor5]
Vector 192 [unity_LightColor6]
Vector 208 [unity_LightColor7]
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityShadows" 416
Matrix 128 [unity_World2Shadow0]
Matrix 192 [unity_World2Shadow1]
Matrix 256 [unity_World2Shadow2]
Matrix 320 [unity_World2Shadow3]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityShadows" 2
BindCB  "UnityPerDraw" 3
"vs_4_0_level_9_1
eefiecedjhhcbgedbnneodfiloangceocodkakicabaaaaaaaibeaaaaaeaaaaaa
daaaaaaameagaaaaeabcaaaadibdaaaaebgpgodjimagaaaaimagaaaaaaacpopp
bmagaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaakaa
acaaabaaaaaaaaaaabaaacaaaiaaadaaaaaaaaaaabaacgaaahaaalaaaaaaaaaa
acaaaiaaaeaabcaaaaaaaaaaadaaaaaaaeaabgaaaaaaaaaaadaaamaaahaabkaa
aaaaaaaaaaaaaaaaaaacpoppfbaaaaafcbaaapkaaaaaiadpaaaaaaaaaaaaaaaa
aaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabiaabaaapjabpaaaaac
afaaaciaacaaapjabpaaaaacafaaadiaadaaapjaaeaaaaaeaaaaadoaadaaoeja
abaaoekaabaaookaaeaaaaaeaaaaamoaadaaeejaacaaeekaacaaoekaafaaaaad
aaaaabiaacaaaajaboaaaakaafaaaaadaaaaaciaacaaaajabpaaaakaafaaaaad
aaaaaeiaacaaaajacaaaaakaafaaaaadabaaabiaacaaffjaboaaffkaafaaaaad
abaaaciaacaaffjabpaaffkaafaaaaadabaaaeiaacaaffjacaaaffkaacaaaaad
aaaaahiaaaaaoeiaabaaoeiaafaaaaadabaaabiaacaakkjaboaakkkaafaaaaad
abaaaciaacaakkjabpaakkkaafaaaaadabaaaeiaacaakkjacaaakkkaacaaaaad
aaaaahiaaaaaoeiaabaaoeiaceaaaaacabaaahiaaaaaoeiaafaaaaadaaaaahia
aaaaffjablaaoekaaeaaaaaeaaaaahiabkaaoekaaaaaaajaaaaaoeiaaeaaaaae
aaaaahiabmaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaahiabnaaoekaaaaappja
aaaaoeiaacaaaaadacaaapiaaaaaffibaeaaoekaafaaaaadadaaapiaabaaffia
acaaoeiaafaaaaadacaaapiaacaaoeiaacaaoeiaacaaaaadaeaaapiaaaaaaaib
adaaoekaaeaaaaaeadaaapiaaeaaoeiaabaaaaiaadaaoeiaaeaaaaaeacaaapia
aeaaoeiaaeaaoeiaacaaoeiaacaaaaadaeaaapiaaaaakkibafaaoekaaeaaaaae
adaaapiaaeaaoeiaabaakkiaadaaoeiaaeaaaaaeacaaapiaaeaaoeiaaeaaoeia
acaaoeiaahaaaaacaeaaabiaacaaaaiaahaaaaacaeaaaciaacaaffiaahaaaaac
aeaaaeiaacaakkiaahaaaaacaeaaaiiaacaappiaabaaaaacafaaabiacbaaaaka
aeaaaaaeacaaapiaacaaoeiaagaaoekaafaaaaiaafaaaaadadaaapiaadaaoeia
aeaaoeiaalaaaaadadaaapiaadaaoeiacbaaffkaagaaaaacaeaaabiaacaaaaia
agaaaaacaeaaaciaacaaffiaagaaaaacaeaaaeiaacaakkiaagaaaaacaeaaaiia
acaappiaafaaaaadacaaapiaadaaoeiaaeaaoeiaafaaaaadadaaahiaacaaffia
aiaaoekaaeaaaaaeadaaahiaahaaoekaacaaaaiaadaaoeiaaeaaaaaeacaaahia
ajaaoekaacaakkiaadaaoeiaaeaaaaaeacaaahiaakaaoekaacaappiaacaaoeia
afaaaaadaaaaaiiaabaaffiaabaaffiaaeaaaaaeaaaaaiiaabaaaaiaabaaaaia
aaaappibafaaaaadadaaapiaabaacjiaabaakeiaajaaaaadaeaaabiaaoaaoeka
adaaoeiaajaaaaadaeaaaciaapaaoekaadaaoeiaajaaaaadaeaaaeiabaaaoeka
adaaoeiaaeaaaaaeadaaahiabbaaoekaaaaappiaaeaaoeiaabaaaaacabaaaiia
cbaaaakaajaaaaadaeaaabiaalaaoekaabaaoeiaajaaaaadaeaaaciaamaaoeka
abaaoeiaajaaaaadaeaaaeiaanaaoekaabaaoeiaacaaaaadadaaahiaadaaoeia
aeaaoeiaacaaaaadaeaaahoaacaaoeiaadaaoeiaafaaaaadacaaapiaaaaaffja
blaaoekaaeaaaaaeacaaapiabkaaoekaaaaaaajaacaaoeiaaeaaaaaeacaaapia
bmaaoekaaaaakkjaacaaoeiaaeaaaaaeacaaapiabnaaoekaaaaappjaacaaoeia
afaaaaadadaaapiaacaaffiabdaaoekaaeaaaaaeadaaapiabcaaoekaacaaaaia
adaaoeiaaeaaaaaeadaaapiabeaaoekaacaakkiaadaaoeiaaeaaaaaeafaaapoa
bfaaoekaacaappiaadaaoeiaafaaaaadacaaapiaaaaaffjabhaaoekaaeaaaaae
acaaapiabgaaoekaaaaaaajaacaaoeiaaeaaaaaeacaaapiabiaaoekaaaaakkja
acaaoeiaaeaaaaaeacaaapiabjaaoekaaaaappjaacaaoeiaaeaaaaaeaaaaadma
acaappiaaaaaoekaacaaoeiaabaaaaacaaaaammaacaaoeiaafaaaaadacaaahia
abaaffjablaamjkaaeaaaaaeacaaahiabkaamjkaabaaaajaacaaoeiaaeaaaaae
acaaahiabmaamjkaabaakkjaacaaoeiaaiaaaaadaaaaaiiaacaaoeiaacaaoeia
ahaaaaacaaaaaiiaaaaappiaafaaaaadacaaahiaaaaappiaacaaoeiaabaaaaac
abaaaboaacaakkiaafaaaaadadaaahiaabaanciaacaaoeiaaeaaaaaeadaaahia
abaamjiaacaamjiaadaaoeibafaaaaadadaaahiaadaaoeiaabaappjaabaaaaac
abaaacoaadaaaaiaabaaaaacabaaaeoaabaaaaiaabaaaaacabaaaioaaaaaaaia
abaaaaacacaaaboaacaaaaiaabaaaaacadaaaboaacaaffiaabaaaaacacaaacoa
adaaffiaabaaaaacadaaacoaadaakkiaabaaaaacacaaaeoaabaaffiaabaaaaac
adaaaeoaabaakkiaabaaaaacacaaaioaaaaaffiaabaaaaacadaaaioaaaaakkia
ppppaaaafdeieefchealaaaaeaaaabaannacaaaafjaaaaaeegiocaaaaaaaaaaa
amaaaaaafjaaaaaeegiocaaaabaaaaaacnaaaaaafjaaaaaeegiocaaaacaaaaaa
amaaaaaafjaaaaaeegiocaaaadaaaaaabdaaaaaafpaaaaadpcbabaaaaaaaaaaa
fpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaa
adaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaa
gfaaaaadpccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaagfaaaaadpccabaaa
aeaaaaaagfaaaaadhccabaaaafaaaaaagfaaaaadpccabaaaagaaaaaagiaaaaac
agaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaa
egiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaal
dccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaakaaaaaaogikcaaa
aaaaaaaaakaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaadaaaaaaagiecaaa
aaaaaaaaalaaaaaakgiocaaaaaaaaaaaalaaaaaadiaaaaaihcaabaaaaaaaaaaa
fgbfbaaaabaaaaaajgiecaaaadaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaa
jgiecaaaadaaaaaaamaaaaaaagbabaaaabaaaaaaegacbaaaaaaaaaaadcaaaaak
hcaabaaaaaaaaaaajgiecaaaadaaaaaaaoaaaaaakgbkbaaaabaaaaaaegacbaaa
aaaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaa
eeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaa
pgapbaaaaaaaaaaaegacbaaaaaaaaaaadgaaaaafbccabaaaacaaaaaackaabaaa
aaaaaaaadiaaaaaibcaabaaaabaaaaaaakbabaaaacaaaaaaakiacaaaadaaaaaa
baaaaaaadiaaaaaiccaabaaaabaaaaaaakbabaaaacaaaaaaakiacaaaadaaaaaa
bbaaaaaadiaaaaaiecaabaaaabaaaaaaakbabaaaacaaaaaaakiacaaaadaaaaaa
bcaaaaaadiaaaaaibcaabaaaacaaaaaabkbabaaaacaaaaaabkiacaaaadaaaaaa
baaaaaaadiaaaaaiccaabaaaacaaaaaabkbabaaaacaaaaaabkiacaaaadaaaaaa
bbaaaaaadiaaaaaiecaabaaaacaaaaaabkbabaaaacaaaaaabkiacaaaadaaaaaa
bcaaaaaaaaaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaacaaaaaa
diaaaaaibcaabaaaacaaaaaackbabaaaacaaaaaackiacaaaadaaaaaabaaaaaaa
diaaaaaiccaabaaaacaaaaaackbabaaaacaaaaaackiacaaaadaaaaaabbaaaaaa
diaaaaaiecaabaaaacaaaaaackbabaaaacaaaaaackiacaaaadaaaaaabcaaaaaa
aaaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaacaaaaaabaaaaaah
icaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaaficaabaaa
aaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaapgapbaaaaaaaaaaa
egacbaaaabaaaaaadiaaaaahhcaabaaaacaaaaaaegacbaaaaaaaaaaacgajbaaa
abaaaaaadcaaaaakhcaabaaaacaaaaaajgaebaaaabaaaaaajgaebaaaaaaaaaaa
egacbaiaebaaaaaaacaaaaaadiaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaa
pgbpbaaaabaaaaaadgaaaaafcccabaaaacaaaaaaakaabaaaacaaaaaadgaaaaaf
eccabaaaacaaaaaaakaabaaaabaaaaaadiaaaaaihcaabaaaadaaaaaafgbfbaaa
aaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaakhcaabaaaadaaaaaaegiccaaa
adaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaadaaaaaadcaaaaakhcaabaaa
adaaaaaaegiccaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaaadaaaaaa
dcaaaaakhcaabaaaadaaaaaaegiccaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaa
egacbaaaadaaaaaadgaaaaaficcabaaaacaaaaaaakaabaaaadaaaaaadgaaaaaf
bccabaaaadaaaaaaakaabaaaaaaaaaaadgaaaaafbccabaaaaeaaaaaabkaabaaa
aaaaaaaadgaaaaafcccabaaaadaaaaaabkaabaaaacaaaaaadgaaaaafcccabaaa
aeaaaaaackaabaaaacaaaaaadgaaaaafeccabaaaadaaaaaabkaabaaaabaaaaaa
dgaaaaaficcabaaaadaaaaaabkaabaaaadaaaaaadgaaaaaficcabaaaaeaaaaaa
ckaabaaaadaaaaaadgaaaaafeccabaaaaeaaaaaackaabaaaabaaaaaadiaaaaah
bcaabaaaaaaaaaaabkaabaaaabaaaaaabkaabaaaabaaaaaadcaaaaakbcaabaaa
aaaaaaaaakaabaaaabaaaaaaakaabaaaabaaaaaaakaabaiaebaaaaaaaaaaaaaa
diaaaaahpcaabaaaacaaaaaajgacbaaaabaaaaaaegakbaaaabaaaaaabbaaaaai
bcaabaaaaeaaaaaaegiocaaaabaaaaaacjaaaaaaegaobaaaacaaaaaabbaaaaai
ccaabaaaaeaaaaaaegiocaaaabaaaaaackaaaaaaegaobaaaacaaaaaabbaaaaai
ecaabaaaaeaaaaaaegiocaaaabaaaaaaclaaaaaaegaobaaaacaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaabaaaaaacmaaaaaaagaabaaaaaaaaaaaegacbaaa
aeaaaaaadgaaaaaficaabaaaabaaaaaaabeaaaaaaaaaiadpbbaaaaaibcaabaaa
acaaaaaaegiocaaaabaaaaaacgaaaaaaegaobaaaabaaaaaabbaaaaaiccaabaaa
acaaaaaaegiocaaaabaaaaaachaaaaaaegaobaaaabaaaaaabbaaaaaiecaabaaa
acaaaaaaegiocaaaabaaaaaaciaaaaaaegaobaaaabaaaaaaaaaaaaahhcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaaaacaaaaaaaaaaaaajpcaabaaaacaaaaaa
fgafbaiaebaaaaaaadaaaaaaegiocaaaabaaaaaaadaaaaaadiaaaaahpcaabaaa
aeaaaaaafgafbaaaabaaaaaaegaobaaaacaaaaaadiaaaaahpcaabaaaacaaaaaa
egaobaaaacaaaaaaegaobaaaacaaaaaaaaaaaaajpcaabaaaafaaaaaaagaabaia
ebaaaaaaadaaaaaaegiocaaaabaaaaaaacaaaaaaaaaaaaajpcaabaaaadaaaaaa
kgakbaiaebaaaaaaadaaaaaaegiocaaaabaaaaaaaeaaaaaadcaaaaajpcaabaaa
aeaaaaaaegaobaaaafaaaaaaagaabaaaabaaaaaaegaobaaaaeaaaaaadcaaaaaj
pcaabaaaabaaaaaaegaobaaaadaaaaaakgakbaaaabaaaaaaegaobaaaaeaaaaaa
dcaaaaajpcaabaaaacaaaaaaegaobaaaafaaaaaaegaobaaaafaaaaaaegaobaaa
acaaaaaadcaaaaajpcaabaaaacaaaaaaegaobaaaadaaaaaaegaobaaaadaaaaaa
egaobaaaacaaaaaaeeaaaaafpcaabaaaadaaaaaaegaobaaaacaaaaaadcaaaaan
pcaabaaaacaaaaaaegaobaaaacaaaaaaegiocaaaabaaaaaaafaaaaaaaceaaaaa
aaaaiadpaaaaiadpaaaaiadpaaaaiadpaoaaaaakpcaabaaaacaaaaaaaceaaaaa
aaaaiadpaaaaiadpaaaaiadpaaaaiadpegaobaaaacaaaaaadiaaaaahpcaabaaa
abaaaaaaegaobaaaabaaaaaaegaobaaaadaaaaaadeaaaaakpcaabaaaabaaaaaa
egaobaaaabaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadiaaaaah
pcaabaaaabaaaaaaegaobaaaacaaaaaaegaobaaaabaaaaaadiaaaaaihcaabaaa
acaaaaaafgafbaaaabaaaaaaegiccaaaabaaaaaaahaaaaaadcaaaaakhcaabaaa
acaaaaaaegiccaaaabaaaaaaagaaaaaaagaabaaaabaaaaaaegacbaaaacaaaaaa
dcaaaaakhcaabaaaabaaaaaaegiccaaaabaaaaaaaiaaaaaakgakbaaaabaaaaaa
egacbaaaacaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaabaaaaaaajaaaaaa
pgapbaaaabaaaaaaegacbaaaabaaaaaaaaaaaaahhccabaaaafaaaaaaegacbaaa
aaaaaaaaegacbaaaabaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiocaaaadaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaa
amaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaa
aaaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaacaaaaaa
ajaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaaaiaaaaaaagaabaaa
aaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaa
akaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpccabaaaagaaaaaa
egiocaaaacaaaaaaalaaaaaapgapbaaaaaaaaaaaegaobaaaabaaaaaadoaaaaab
ejfdeheopaaaaaaaaiaaaaaaaiaaaaaamiaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapapaaaanbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapapaaaa
njaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaaoaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaadaaaaaaapadaaaaoaaaaaaaabaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaapaaaaaaoaaaaaaaacaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaa
oaaaaaaaadaaaaaaaaaaaaaaadaaaaaaagaaaaaaapaaaaaaojaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaahaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofe
aaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheomiaaaaaa
ahaaaaaaaiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
lmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaalmaaaaaaabaaaaaa
aaaaaaaaadaaaaaaacaaaaaaapaaaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaa
adaaaaaaapaaaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaa
lmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaalmaaaaaaafaaaaaa
aaaaaaaaadaaaaaaagaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaklklkl"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"!!GLSL"
}
SubProgram "d3d9 " {
// Stats: 21 math, 3 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
Vector 2 [_Color]
Float 3 [_Cutoff]
Vector 1 [_LightColor0]
Vector 0 [_WorldSpaceLightPos0]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_BumpMap] 2D 1
"ps_2_0
def c4, 2, -1, 0, 1
dcl t0
dcl t1.xyz
dcl t2.xyz
dcl t3.xyz
dcl_pp t4.xyz
dcl_2d s0
dcl_2d s1
texld r0, t0, s0
mov r1.w, c2.w
mad_pp r1, r0.w, r1.w, -c3.x
mul_pp r0, r0, c2
mov r2.x, t0.z
mov r2.y, t0.w
texkill r1
texld_pp r1, r2, s1
mad_pp r2.x, r1.w, c4.x, c4.y
mad_pp r2.y, r1.y, c4.x, c4.y
dp2add_sat_pp r2.w, r2, r2, c4.z
add_pp r2.w, -r2.w, c4.w
rsq_pp r2.w, r2.w
rcp_pp r2.z, r2.w
dp3_pp r1.x, t1, r2
dp3_pp r1.y, t2, r2
dp3_pp r1.z, t3, r2
dp3_pp r1.x, r1, c0
max_pp r2.x, r1.x, c4.z
mul_pp r1.xyz, r0, c1
mul_pp r2.yzw, r0.wzyx, t4.wzyx
mad_pp r0.xyz, r1, r2.x, r2.wzyx
mov_pp oC0, r0

"
}
SubProgram "d3d11 " {
// Stats: 16 math, 2 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_BumpMap] 2D 1
ConstBuffer "$Globals" 208
Vector 96 [_LightColor0]
Vector 144 [_Color]
Float 192 [_Cutoff]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
"ps_4_0
eefiecedmpipboalgmeepljolihnmlpgbmealhagabaaaaaaeaaeaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaapahaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapahaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefccaadaaaa
eaaaaaaamiaaaaaafjaaaaaeegiocaaaaaaaaaaaanaaaaaafjaaaaaeegiocaaa
abaaaaaaabaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaa
fibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaa
gcbaaaadpcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaa
adaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagfaaaaad
pccabaaaaaaaaaaagiaaaaacadaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaa
abaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaadcaaaaambcaabaaaabaaaaaa
dkaabaaaaaaaaaaadkiacaaaaaaaaaaaajaaaaaaakiacaiaebaaaaaaaaaaaaaa
amaaaaaadiaaaaaipcaabaaaaaaaaaaaegaobaaaaaaaaaaaegiocaaaaaaaaaaa
ajaaaaaadbaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaaaa
anaaaeadakaabaaaabaaaaaaefaaaaajpcaabaaaabaaaaaaogbkbaaaabaaaaaa
eghobaaaabaaaaaaaagabaaaabaaaaaadcaaaaapdcaabaaaabaaaaaahgapbaaa
abaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaaaceaaaaaaaaaialp
aaaaialpaaaaaaaaaaaaaaaaapaaaaahicaabaaaabaaaaaaegaabaaaabaaaaaa
egaabaaaabaaaaaaddaaaaahicaabaaaabaaaaaadkaabaaaabaaaaaaabeaaaaa
aaaaiadpaaaaaaaiicaabaaaabaaaaaadkaabaiaebaaaaaaabaaaaaaabeaaaaa
aaaaiadpelaaaaafecaabaaaabaaaaaadkaabaaaabaaaaaabaaaaaahbcaabaaa
acaaaaaaegbcbaaaacaaaaaaegacbaaaabaaaaaabaaaaaahccaabaaaacaaaaaa
egbcbaaaadaaaaaaegacbaaaabaaaaaabaaaaaahecaabaaaacaaaaaaegbcbaaa
aeaaaaaaegacbaaaabaaaaaabaaaaaaibcaabaaaabaaaaaaegacbaaaacaaaaaa
egiccaaaabaaaaaaaaaaaaaadeaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaa
abeaaaaaaaaaaaaadiaaaaaiocaabaaaabaaaaaaagajbaaaaaaaaaaaagijcaaa
aaaaaaaaagaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegbcbaaa
afaaaaaadgaaaaaficcabaaaaaaaaaaadkaabaaaaaaaaaaadcaaaaajhccabaaa
aaaaaaaajgahbaaaabaaaaaaagaabaaaabaaaaaaegacbaaaaaaaaaaadoaaaaab
"
}
SubProgram "d3d11_9x " {
// Stats: 16 math, 2 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_BumpMap] 2D 1
ConstBuffer "$Globals" 208
Vector 96 [_LightColor0]
Vector 144 [_Color]
Float 192 [_Cutoff]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
"ps_4_0_level_9_1
eefiecedehkgmapafjadbefkfllebidpnlnbgmkhabaaaaaaiaagaaaaaeaaaaaa
daaaaaaagmacaaaajeafaaaaemagaaaaebgpgodjdeacaaaadeacaaaaaaacpppp
niabaaaafmaaaaaaaeaacmaaaaaafmaaaaaafmaaacaaceaaaaaafmaaaaaaaaaa
abababaaaaaaagaaabaaaaaaaaaaaaaaaaaaajaaabaaabaaaaaaaaaaaaaaamaa
abaaacaaaaaaaaaaabaaaaaaabaaadaaaaaaaaaaaaacppppfbaaaaafaeaaapka
aaaaaaeaaaaaialpaaaaaaaaaaaaiadpbpaaaaacaaaaaaiaaaaaaplabpaaaaac
aaaaaaiaabaaaplabpaaaaacaaaaaaiaacaaaplabpaaaaacaaaaaaiaadaaapla
bpaaaaacaaaaaaiaaeaachlabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaaja
abaiapkaecaaaaadaaaaapiaaaaaoelaaaaioekaabaaaaacabaaaiiaabaappka
aeaaaaaeabaacpiaaaaappiaabaappiaacaaaakbafaaaaadaaaacpiaaaaaoeia
abaaoekaabaaaaacacaaabiaaaaakklaabaaaaacacaaaciaaaaapplaebaaaaab
abaaapiaecaaaaadabaacpiaacaaoeiaabaioekaaeaaaaaeacaacbiaabaappia
aeaaaakaaeaaffkaaeaaaaaeacaacciaabaaffiaaeaaaakaaeaaffkafkaaaaae
acaadiiaacaaoeiaacaaoeiaaeaakkkaacaaaaadacaaciiaacaappibaeaappka
ahaaaaacacaaciiaacaappiaagaaaaacacaaceiaacaappiaaiaaaaadabaacbia
abaaoelaacaaoeiaaiaaaaadabaacciaacaaoelaacaaoeiaaiaaaaadabaaceia
adaaoelaacaaoeiaaiaaaaadabaacbiaabaaoeiaadaaoekaalaaaaadacaacbia
abaaaaiaaeaakkkaafaaaaadabaachiaaaaaoeiaaaaaoekaafaaaaadacaacoia
aaaabliaaeaabllaaeaaaaaeaaaachiaabaaoeiaacaaaaiaacaabliaabaaaaac
aaaicpiaaaaaoeiappppaaaafdeieefccaadaaaaeaaaaaaamiaaaaaafjaaaaae
egiocaaaaaaaaaaaanaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafkaaaaad
aagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafibiaaaeaahabaaaaaaaaaaa
ffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaa
gcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaa
aeaaaaaagcbaaaadhcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
adaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaa
aagabaaaaaaaaaaadcaaaaambcaabaaaabaaaaaadkaabaaaaaaaaaaadkiacaaa
aaaaaaaaajaaaaaaakiacaiaebaaaaaaaaaaaaaaamaaaaaadiaaaaaipcaabaaa
aaaaaaaaegaobaaaaaaaaaaaegiocaaaaaaaaaaaajaaaaaadbaaaaahbcaabaaa
abaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaaaaanaaaeadakaabaaaabaaaaaa
efaaaaajpcaabaaaabaaaaaaogbkbaaaabaaaaaaeghobaaaabaaaaaaaagabaaa
abaaaaaadcaaaaapdcaabaaaabaaaaaahgapbaaaabaaaaaaaceaaaaaaaaaaaea
aaaaaaeaaaaaaaaaaaaaaaaaaceaaaaaaaaaialpaaaaialpaaaaaaaaaaaaaaaa
apaaaaahicaabaaaabaaaaaaegaabaaaabaaaaaaegaabaaaabaaaaaaddaaaaah
icaabaaaabaaaaaadkaabaaaabaaaaaaabeaaaaaaaaaiadpaaaaaaaiicaabaaa
abaaaaaadkaabaiaebaaaaaaabaaaaaaabeaaaaaaaaaiadpelaaaaafecaabaaa
abaaaaaadkaabaaaabaaaaaabaaaaaahbcaabaaaacaaaaaaegbcbaaaacaaaaaa
egacbaaaabaaaaaabaaaaaahccaabaaaacaaaaaaegbcbaaaadaaaaaaegacbaaa
abaaaaaabaaaaaahecaabaaaacaaaaaaegbcbaaaaeaaaaaaegacbaaaabaaaaaa
baaaaaaibcaabaaaabaaaaaaegacbaaaacaaaaaaegiccaaaabaaaaaaaaaaaaaa
deaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaaaadiaaaaai
ocaabaaaabaaaaaaagajbaaaaaaaaaaaagijcaaaaaaaaaaaagaaaaaadiaaaaah
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaegbcbaaaafaaaaaadgaaaaaficcabaaa
aaaaaaaadkaabaaaaaaaaaaadcaaaaajhccabaaaaaaaaaaajgahbaaaabaaaaaa
agaabaaaabaaaaaaegacbaaaaaaaaaaadoaaaaabejfdeheolaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapapaaaakeaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapahaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apahaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapahaaaakeaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"!!GLSL"
}
SubProgram "d3d9 " {
// Stats: 22 math, 4 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
Vector 2 [_Color]
Float 3 [_Cutoff]
Vector 1 [_LightColor0]
Vector 0 [_WorldSpaceLightPos0]
SetTexture 0 [_ShadowMapTexture] 2D 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_BumpMap] 2D 2
"ps_2_0
def c4, 2, -1, 0, 1
dcl t0
dcl t1.xyz
dcl t2.xyz
dcl t3.xyz
dcl_pp t4.xyz
dcl_pp t5
dcl_2d s0
dcl_2d s1
dcl_2d s2
texld r0, t0, s1
mov r1.w, c2.w
mad_pp r1, r0.w, r1.w, -c3.x
mul_pp r0, r0, c2
mov r2.x, t0.z
mov r2.y, t0.w
texkill r1
texld_pp r1, r2, s2
texldp_pp r2, t5, s0
mad_pp r3.x, r1.w, c4.x, c4.y
mad_pp r3.y, r1.y, c4.x, c4.y
dp2add_sat_pp r3.w, r3, r3, c4.z
add_pp r3.w, -r3.w, c4.w
rsq_pp r3.w, r3.w
rcp_pp r3.z, r3.w
dp3_pp r1.x, t1, r3
dp3_pp r1.y, t2, r3
dp3_pp r1.z, t3, r3
dp3_pp r1.x, r1, c0
max_pp r2.y, r1.x, c4.z
mul_pp r1.xyz, r2.x, c1
mul_pp r1.xyz, r0, r1
mul_pp r3.xyz, r0, t4
mad_pp r0.xyz, r1, r2.y, r3
mov_pp oC0, r0

"
}
SubProgram "d3d11 " {
// Stats: 18 math, 3 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 1
SetTexture 1 [_BumpMap] 2D 2
SetTexture 2 [_ShadowMapTexture] 2D 0
ConstBuffer "$Globals" 208
Vector 96 [_LightColor0]
Vector 144 [_Color]
Float 192 [_Cutoff]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
"ps_4_0
eefiecedbifagkadociocjhonohkfbiofjlfdfkeabaaaaaanmaeaaaaadaaaaaa
cmaaaaaapmaaaaaadaabaaaaejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaapahaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapahaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
apalaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefckeadaaaaeaaaaaaaojaaaaaa
fjaaaaaeegiocaaaaaaaaaaaanaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaa
fkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaa
acaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaa
ffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaa
gcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaa
aeaaaaaagcbaaaadhcbabaaaafaaaaaagcbaaaadlcbabaaaagaaaaaagfaaaaad
pccabaaaaaaaaaaagiaaaaacadaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaa
abaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaadcaaaaambcaabaaaabaaaaaa
dkaabaaaaaaaaaaadkiacaaaaaaaaaaaajaaaaaaakiacaiaebaaaaaaaaaaaaaa
amaaaaaadiaaaaaipcaabaaaaaaaaaaaegaobaaaaaaaaaaaegiocaaaaaaaaaaa
ajaaaaaadbaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaaaa
anaaaeadakaabaaaabaaaaaaefaaaaajpcaabaaaabaaaaaaogbkbaaaabaaaaaa
eghobaaaabaaaaaaaagabaaaacaaaaaadcaaaaapdcaabaaaabaaaaaahgapbaaa
abaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaaaceaaaaaaaaaialp
aaaaialpaaaaaaaaaaaaaaaaapaaaaahicaabaaaabaaaaaaegaabaaaabaaaaaa
egaabaaaabaaaaaaddaaaaahicaabaaaabaaaaaadkaabaaaabaaaaaaabeaaaaa
aaaaiadpaaaaaaaiicaabaaaabaaaaaadkaabaiaebaaaaaaabaaaaaaabeaaaaa
aaaaiadpelaaaaafecaabaaaabaaaaaadkaabaaaabaaaaaabaaaaaahbcaabaaa
acaaaaaaegbcbaaaacaaaaaaegacbaaaabaaaaaabaaaaaahccaabaaaacaaaaaa
egbcbaaaadaaaaaaegacbaaaabaaaaaabaaaaaahecaabaaaacaaaaaaegbcbaaa
aeaaaaaaegacbaaaabaaaaaabaaaaaaibcaabaaaabaaaaaaegacbaaaacaaaaaa
egiccaaaabaaaaaaaaaaaaaadeaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaa
abeaaaaaaaaaaaaaaoaaaaahgcaabaaaabaaaaaaagbbbaaaagaaaaaapgbpbaaa
agaaaaaaefaaaaajpcaabaaaacaaaaaajgafbaaaabaaaaaaeghobaaaacaaaaaa
aagabaaaaaaaaaaadiaaaaaiocaabaaaabaaaaaaagaabaaaacaaaaaaagijcaaa
aaaaaaaaagaaaaaadiaaaaahocaabaaaabaaaaaaagajbaaaaaaaaaaafgaobaaa
abaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegbcbaaaafaaaaaa
dgaaaaaficcabaaaaaaaaaaadkaabaaaaaaaaaaadcaaaaajhccabaaaaaaaaaaa
jgahbaaaabaaaaaaagaabaaaabaaaaaaegacbaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 19 math, 2 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_NATIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_BumpMap] 2D 1
SetTexture 15 [_ShadowMapTexture] 2D 15
ConstBuffer "$Globals" 208
Vector 96 [_LightColor0]
Vector 144 [_Color]
Float 192 [_Cutoff]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityShadows" 416
Vector 384 [_LightShadowData]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityShadows" 2
"ps_4_0_level_9_1
eefiecedlceekcecaeojcbocjiijnjapofaodbnmabaaaaaaoaahaaaaafaaaaaa
deaaaaaaniacaaaammagaaaanmagaaaakmahaaaaebgpgodjjmacaaaajmacaaaa
aaacppppdaacaaaagmaaaaaaafaadaaaaaaagmaaaaaagmaaadaaceaaaaaagmaa
apapaaaaaaaaabaaababacaaaaaaagaaabaaaaaaaaaaaaaaaaaaajaaabaaabaa
aaaaaaaaaaaaamaaabaaacaaaaaaaaaaabaaaaaaabaaadaaaaaaaaaaacaabiaa
abaaaeaaaaaaaaaaaaacppppfbaaaaafafaaapkaaaaaaaeaaaaaialpaaaaaaaa
aaaaiadpbpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaaiaabaaaplabpaaaaac
aaaaaaiaacaaaplabpaaaaacaaaaaaiaadaaaplabpaaaaacaaaaaaiaaeaachla
bpaaaaacaaaaaaiaafaacplabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaaja
abaiapkabpaaaaacaaaaaajaacaiapkaecaaaaadaaaaapiaaaaaoelaabaioeka
abaaaaacabaaaiiaabaappkaaeaaaaaeabaacpiaaaaappiaabaappiaacaaaakb
afaaaaadaaaacpiaaaaaoeiaabaaoekaabaaaaacacaaabiaaaaakklaabaaaaac
acaaaciaaaaapplaebaaaaababaaapiaecaaaaadabaacpiaacaaoeiaacaioeka
ecaaaaadacaacpiaafaaoelaaaaioekaaeaaaaaeadaacbiaabaappiaafaaaaka
afaaffkaaeaaaaaeadaacciaabaaffiaafaaaakaafaaffkafkaaaaaeadaadiia
adaaoeiaadaaoeiaafaakkkaacaaaaadadaaciiaadaappibafaappkaahaaaaac
adaaciiaadaappiaagaaaaacadaaceiaadaappiaaiaaaaadabaacbiaabaaoela
adaaoeiaaiaaaaadabaacciaacaaoelaadaaoeiaaiaaaaadabaaceiaadaaoela
adaaoeiaaiaaaaadabaacbiaabaaoeiaadaaoekaalaaaaadacaacciaabaaaaia
afaakkkaabaaaaacabaaaiiaafaappkabcaaaaaeadaacbiaacaaaaiaabaappia
aeaaaakaafaaaaadabaachiaadaaaaiaaaaaoekaafaaaaadabaachiaaaaaoeia
abaaoeiaafaaaaadadaachiaaaaaoeiaaeaaoelaaeaaaaaeaaaachiaabaaoeia
acaaffiaadaaoeiaabaaaaacaaaicpiaaaaaoeiappppaaaafdeieefcomadaaaa
eaaaaaaaplaaaaaafjaaaaaeegiocaaaaaaaaaaaanaaaaaafjaaaaaeegiocaaa
abaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaabjaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafkaiaaadaagabaaaapaaaaaafibiaaae
aahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaae
aahabaaaapaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaagcbaaaadhcbabaaa
acaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaad
hcbabaaaafaaaaaagcbaaaadhcbabaaaagaaaaaagfaaaaadpccabaaaaaaaaaaa
giaaaaacadaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaa
aaaaaaaaaagabaaaaaaaaaaadcaaaaambcaabaaaabaaaaaadkaabaaaaaaaaaaa
dkiacaaaaaaaaaaaajaaaaaaakiacaiaebaaaaaaaaaaaaaaamaaaaaadiaaaaai
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaegiocaaaaaaaaaaaajaaaaaadbaaaaah
bcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaaaaanaaaeadakaabaaa
abaaaaaaefaaaaajpcaabaaaabaaaaaaogbkbaaaabaaaaaaeghobaaaabaaaaaa
aagabaaaabaaaaaadcaaaaapdcaabaaaabaaaaaahgapbaaaabaaaaaaaceaaaaa
aaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaaaceaaaaaaaaaialpaaaaialpaaaaaaaa
aaaaaaaaapaaaaahicaabaaaabaaaaaaegaabaaaabaaaaaaegaabaaaabaaaaaa
ddaaaaahicaabaaaabaaaaaadkaabaaaabaaaaaaabeaaaaaaaaaiadpaaaaaaai
icaabaaaabaaaaaadkaabaiaebaaaaaaabaaaaaaabeaaaaaaaaaiadpelaaaaaf
ecaabaaaabaaaaaadkaabaaaabaaaaaabaaaaaahbcaabaaaacaaaaaaegbcbaaa
acaaaaaaegacbaaaabaaaaaabaaaaaahccaabaaaacaaaaaaegbcbaaaadaaaaaa
egacbaaaabaaaaaabaaaaaahecaabaaaacaaaaaaegbcbaaaaeaaaaaaegacbaaa
abaaaaaabaaaaaaibcaabaaaabaaaaaaegacbaaaacaaaaaaegiccaaaabaaaaaa
aaaaaaaadeaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaaaa
ehaaaaalccaabaaaabaaaaaaegbabaaaagaaaaaaaghabaaaapaaaaaaaagabaaa
apaaaaaackbabaaaagaaaaaaaaaaaaajecaabaaaabaaaaaaakiacaiaebaaaaaa
acaaaaaabiaaaaaaabeaaaaaaaaaiadpdcaaaaakccaabaaaabaaaaaabkaabaaa
abaaaaaackaabaaaabaaaaaaakiacaaaacaaaaaabiaaaaaadiaaaaaiocaabaaa
abaaaaaafgafbaaaabaaaaaaagijcaaaaaaaaaaaagaaaaaadiaaaaahocaabaaa
abaaaaaaagajbaaaaaaaaaaafgaobaaaabaaaaaadiaaaaahhcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegbcbaaaafaaaaaadgaaaaaficcabaaaaaaaaaaadkaabaaa
aaaaaaaadcaaaaajhccabaaaaaaaaaaajgahbaaaabaaaaaaagaabaaaabaaaaaa
egacbaaaaaaaaaaadoaaaaabfdegejdaaiaaaaaaiaaaaaaaaaaaaaaaejfdeheo
miaaaaaaahaaaaaaaiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaa
apaaaaaalmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapapaaaalmaaaaaa
abaaaaaaaaaaaaaaadaaaaaaacaaaaaaapahaaaalmaaaaaaacaaaaaaaaaaaaaa
adaaaaaaadaaaaaaapahaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
apahaaaalmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahahaaaalmaaaaaa
afaaaaaaaaaaaaaaadaaaaaaagaaaaaaapahaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl
"
}
}
 }


 // Stats for Vertex shader:
 //       d3d11 : 33 math
 //    d3d11_9x : 33 math
 //        d3d9 : 33 math
 //      opengl : 21 avg math (16..28), 4 avg texture (3..5), 1 branch
 // Stats for Fragment shader:
 //       d3d11 : 23 avg math (15..31), 3 avg texture (2..4)
 //    d3d11_9x : 23 avg math (15..31), 3 avg texture (2..4)
 //        d3d9 : 28 avg math (20..36), 4 avg texture (3..5)
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardAdd" "QUEUE"="AlphaTest" "IGNOREPROJECTOR"="true" "RenderType"="TransparentCutout" }
  ZWrite Off
  Blend One One
  ColorMask RGB
  GpuProgramID 111728
Program "vp" {
SubProgram "opengl " {
// Stats: 22 math, 4 textures, 1 branches
Keywords { "POINT" }
"!!GLSL
#ifdef VERTEX

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 _MainTex_ST;
uniform vec4 _BumpMap_ST;
attribute vec4 TANGENT;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec3 xlv_TEXCOORD2;
varying vec3 xlv_TEXCOORD3;
varying vec3 xlv_TEXCOORD4;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xy = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_1.zw = ((gl_MultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  vec4 v_2;
  v_2.x = _World2Object[0].x;
  v_2.y = _World2Object[1].x;
  v_2.z = _World2Object[2].x;
  v_2.w = _World2Object[3].x;
  vec4 v_3;
  v_3.x = _World2Object[0].y;
  v_3.y = _World2Object[1].y;
  v_3.z = _World2Object[2].y;
  v_3.w = _World2Object[3].y;
  vec4 v_4;
  v_4.x = _World2Object[0].z;
  v_4.y = _World2Object[1].z;
  v_4.z = _World2Object[2].z;
  v_4.w = _World2Object[3].z;
  vec3 tmpvar_5;
  tmpvar_5 = normalize(((
    (v_2.xyz * gl_Normal.x)
   + 
    (v_3.xyz * gl_Normal.y)
  ) + (v_4.xyz * gl_Normal.z)));
  mat3 tmpvar_6;
  tmpvar_6[0] = _Object2World[0].xyz;
  tmpvar_6[1] = _Object2World[1].xyz;
  tmpvar_6[2] = _Object2World[2].xyz;
  vec3 tmpvar_7;
  tmpvar_7 = normalize((tmpvar_6 * TANGENT.xyz));
  vec3 tmpvar_8;
  tmpvar_8 = (((tmpvar_5.yzx * tmpvar_7.zxy) - (tmpvar_5.zxy * tmpvar_7.yzx)) * TANGENT.w);
  vec3 tmpvar_9;
  tmpvar_9.x = tmpvar_7.x;
  tmpvar_9.y = tmpvar_8.x;
  tmpvar_9.z = tmpvar_5.x;
  vec3 tmpvar_10;
  tmpvar_10.x = tmpvar_7.y;
  tmpvar_10.y = tmpvar_8.y;
  tmpvar_10.z = tmpvar_5.y;
  vec3 tmpvar_11;
  tmpvar_11.x = tmpvar_7.z;
  tmpvar_11.y = tmpvar_8.z;
  tmpvar_11.z = tmpvar_5.z;
  gl_Position = (gl_ModelViewProjectionMatrix * gl_Vertex);
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_9;
  xlv_TEXCOORD2 = tmpvar_10;
  xlv_TEXCOORD3 = tmpvar_11;
  xlv_TEXCOORD4 = (_Object2World * gl_Vertex).xyz;
}


#endif
#ifdef FRAGMENT
uniform vec4 _WorldSpaceLightPos0;
uniform vec4 _LightColor0;
uniform sampler2D _LightTexture0;
uniform mat4 _LightMatrix0;
uniform sampler2D _MainTex;
uniform sampler2D _BumpMap;
uniform vec4 _Color;
uniform float _Cutoff;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec3 xlv_TEXCOORD2;
varying vec3 xlv_TEXCOORD3;
varying vec3 xlv_TEXCOORD4;
void main ()
{
  vec3 worldN_1;
  vec4 tmpvar_2;
  tmpvar_2 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) * _Color);
  vec3 normal_3;
  normal_3.xy = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).wy * 2.0) - 1.0);
  normal_3.z = sqrt((1.0 - clamp (
    dot (normal_3.xy, normal_3.xy)
  , 0.0, 1.0)));
  float x_4;
  x_4 = (tmpvar_2.w - _Cutoff);
  if ((x_4 < 0.0)) {
    discard;
  };
  vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = xlv_TEXCOORD4;
  vec3 tmpvar_6;
  tmpvar_6 = (_LightMatrix0 * tmpvar_5).xyz;
  worldN_1.x = dot (xlv_TEXCOORD1, normal_3);
  worldN_1.y = dot (xlv_TEXCOORD2, normal_3);
  worldN_1.z = dot (xlv_TEXCOORD3, normal_3);
  vec4 c_7;
  vec4 c_8;
  c_8.xyz = ((tmpvar_2.xyz * (_LightColor0.xyz * texture2D (_LightTexture0, vec2(
    dot (tmpvar_6, tmpvar_6)
  )).w)) * max (0.0, dot (worldN_1, 
    normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD4))
  )));
  c_8.w = tmpvar_2.w;
  c_7.w = c_8.w;
  c_7.xyz = c_8.xyz;
  gl_FragData[0] = c_7;
}


#endif
"
}
SubProgram "d3d9 " {
// Stats: 33 math
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord4
Matrix 4 [_Object2World] 3
Matrix 7 [_World2Object] 3
Matrix 0 [glstate_matrix_mvp]
Vector 11 [_BumpMap_ST]
Vector 10 [_MainTex_ST]
"vs_2_0
dcl_position v0
dcl_tangent v1
dcl_normal v2
dcl_texcoord v3
dp4 oPos.x, c0, v0
dp4 oPos.y, c1, v0
dp4 oPos.z, c2, v0
dp4 oPos.w, c3, v0
mad oT0.xy, v3, c10, c10.zwzw
mad oT0.zw, v3.xyxy, c11.xyxy, c11
dp4 oT4.x, c4, v0
dp4 oT4.y, c5, v0
dp4 oT4.z, c6, v0
dp3 r0.z, c4, v1
dp3 r0.x, c5, v1
dp3 r0.y, c6, v1
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul r0.xyz, r0.w, r0
mov oT1.x, r0.z
mul r1.xyz, v2.y, c8.zxyw
mad r1.xyz, c7.zxyw, v2.x, r1
mad r1.xyz, c9.zxyw, v2.z, r1
dp3 r0.w, r1, r1
rsq r0.w, r0.w
mul r1.xyz, r0.w, r1
mul r2.xyz, r0, r1
mad r2.xyz, r1.zxyw, r0.yzxw, -r2
mul r2.xyz, r2, v1.w
mov oT1.y, r2.x
mov oT1.z, r1.y
mov oT2.x, r0.x
mov oT3.x, r0.y
mov oT2.y, r2.y
mov oT3.y, r2.z
mov oT2.z, r1.z
mov oT3.z, r1.x

"
}
SubProgram "d3d11 " {
// Stats: 33 math
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord4
ConstBuffer "$Globals" 272
Vector 224 [_MainTex_ST]
Vector 240 [_BumpMap_ST]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
BindCB  "$Globals" 0
BindCB  "UnityPerDraw" 1
"vs_4_0
eefieceddhghnbmamjojmnfpekgacngjhkdldebiabaaaaaajaahaaaaadaaaaaa
cmaaaaaaceabaaaanmabaaaaejfdeheopaaaaaaaaiaaaaaaaiaaaaaamiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaanbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaanjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaaoaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaaoaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaoaaaaaaaacaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaaoaaaaaaaadaaaaaaaaaaaaaaadaaaaaaagaaaaaa
apaaaaaaojaaaaaaaaaaaaaaaaaaaaaaadaaaaaaahaaaaaaapaaaaaafaepfdej
feejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepem
epfcaaklepfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
apaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaiaaaakeaaaaaa
acaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaahaiaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaa
ahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefc
kmafaaaaeaaaabaaglabaaaafjaaaaaeegiocaaaaaaaaaaabaaaaaaafjaaaaae
egiocaaaabaaaaaabdaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaa
abaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaadhccabaaa
acaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaad
hccabaaaafaaaaaagiaaaaacadaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaabaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
abaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaabaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpccabaaaaaaaaaaaegiocaaaabaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaa
aaaaaaaaaoaaaaaaogikcaaaaaaaaaaaaoaaaaaadcaaaaalmccabaaaabaaaaaa
agbebaaaadaaaaaaagiecaaaaaaaaaaaapaaaaaakgiocaaaaaaaaaaaapaaaaaa
diaaaaaiccaabaaaaaaaaaaaakbabaaaacaaaaaaakiacaaaabaaaaaabaaaaaaa
diaaaaaiecaabaaaaaaaaaaaakbabaaaacaaaaaaakiacaaaabaaaaaabbaaaaaa
diaaaaaibcaabaaaaaaaaaaaakbabaaaacaaaaaaakiacaaaabaaaaaabcaaaaaa
diaaaaaiccaabaaaabaaaaaabkbabaaaacaaaaaabkiacaaaabaaaaaabaaaaaaa
diaaaaaiecaabaaaabaaaaaabkbabaaaacaaaaaabkiacaaaabaaaaaabbaaaaaa
diaaaaaibcaabaaaabaaaaaabkbabaaaacaaaaaabkiacaaaabaaaaaabcaaaaaa
aaaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaai
ccaabaaaabaaaaaackbabaaaacaaaaaackiacaaaabaaaaaabaaaaaaadiaaaaai
ecaabaaaabaaaaaackbabaaaacaaaaaackiacaaaabaaaaaabbaaaaaadiaaaaai
bcaabaaaabaaaaaackbabaaaacaaaaaackiacaaaabaaaaaabcaaaaaaaaaaaaah
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahicaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaaaaaaaaaa
dkaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaa
aaaaaaaadgaaaaafeccabaaaacaaaaaabkaabaaaaaaaaaaadiaaaaaihcaabaaa
abaaaaaafgbfbaaaabaaaaaajgiecaaaabaaaaaaanaaaaaadcaaaaakhcaabaaa
abaaaaaajgiecaaaabaaaaaaamaaaaaaagbabaaaabaaaaaaegacbaaaabaaaaaa
dcaaaaakhcaabaaaabaaaaaajgiecaaaabaaaaaaaoaaaaaakgbkbaaaabaaaaaa
egacbaaaabaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaa
abaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaa
abaaaaaapgapbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaahhcaabaaaacaaaaaa
egacbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaacaaaaaacgajbaaa
aaaaaaaajgaebaaaabaaaaaaegacbaiaebaaaaaaacaaaaaadiaaaaahhcaabaaa
acaaaaaaegacbaaaacaaaaaapgbpbaaaabaaaaaadgaaaaafcccabaaaacaaaaaa
akaabaaaacaaaaaadgaaaaafbccabaaaacaaaaaackaabaaaabaaaaaadgaaaaaf
eccabaaaadaaaaaackaabaaaaaaaaaaadgaaaaafeccabaaaaeaaaaaaakaabaaa
aaaaaaaadgaaaaafbccabaaaadaaaaaaakaabaaaabaaaaaadgaaaaafbccabaaa
aeaaaaaabkaabaaaabaaaaaadgaaaaafcccabaaaadaaaaaabkaabaaaacaaaaaa
dgaaaaafcccabaaaaeaaaaaackaabaaaacaaaaaadiaaaaaihcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiccaaaabaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaabaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaabaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaa
aaaaaaaadcaaaaakhccabaaaafaaaaaaegiccaaaabaaaaaaapaaaaaapgbpbaaa
aaaaaaaaegacbaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 33 math
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord4
ConstBuffer "$Globals" 272
Vector 224 [_MainTex_ST]
Vector 240 [_BumpMap_ST]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
BindCB  "$Globals" 0
BindCB  "UnityPerDraw" 1
"vs_4_0_level_9_1
eefiecedlaaiejlfkbgmijemhnpfeoggoifjdhjbabaaaaaaoaakaaaaaeaaaaaa
daaaaaaahmadaaaadaajaaaaciakaaaaebgpgodjeeadaaaaeeadaaaaaaacpopp
piacaaaaemaaaaaaadaaceaaaaaaeiaaaaaaeiaaaaaaceaaabaaeiaaaaaaaoaa
acaaabaaaaaaaaaaabaaaaaaaeaaadaaaaaaaaaaabaaamaaahaaahaaaaaaaaaa
aaaaaaaaaaacpoppbpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabiaabaaapja
bpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjaaeaaaaaeaaaaadoa
adaaoejaabaaoekaabaaookaaeaaaaaeaaaaamoaadaaeejaacaaeekaacaaoeka
afaaaaadaaaaahiaaaaaffjaaiaaoekaaeaaaaaeaaaaahiaahaaoekaaaaaaaja
aaaaoeiaaeaaaaaeaaaaahiaajaaoekaaaaakkjaaaaaoeiaaeaaaaaeaeaaahoa
akaaoekaaaaappjaaaaaoeiaafaaaaadaaaaapiaaaaaffjaaeaaoekaaeaaaaae
aaaaapiaadaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaafaaoekaaaaakkja
aaaaoeiaaeaaaaaeaaaaapiaagaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadma
aaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaafaaaaadaaaaahia
abaaffjaaiaamjkaaeaaaaaeaaaaahiaahaamjkaabaaaajaaaaaoeiaaeaaaaae
aaaaahiaajaamjkaabaakkjaaaaaoeiaaiaaaaadaaaaaiiaaaaaoeiaaaaaoeia
ahaaaaacaaaaaiiaaaaappiaafaaaaadaaaaahiaaaaappiaaaaaoeiaabaaaaac
abaaaboaaaaakkiaafaaaaadabaaaciaacaaaajaalaaaakaafaaaaadabaaaeia
acaaaajaamaaaakaafaaaaadabaaabiaacaaaajaanaaaakaafaaaaadacaaacia
acaaffjaalaaffkaafaaaaadacaaaeiaacaaffjaamaaffkaafaaaaadacaaabia
acaaffjaanaaffkaacaaaaadabaaahiaabaaoeiaacaaoeiaafaaaaadacaaacia
acaakkjaalaakkkaafaaaaadacaaaeiaacaakkjaamaakkkaafaaaaadacaaabia
acaakkjaanaakkkaacaaaaadabaaahiaabaaoeiaacaaoeiaaiaaaaadaaaaaiia
abaaoeiaabaaoeiaahaaaaacaaaaaiiaaaaappiaafaaaaadabaaahiaaaaappia
abaaoeiaafaaaaadacaaahiaaaaaoeiaabaaoeiaaeaaaaaeacaaahiaabaancia
aaaamjiaacaaoeibafaaaaadacaaahiaacaaoeiaabaappjaabaaaaacabaaacoa
acaaaaiaabaaaaacabaaaeoaabaaffiaabaaaaacacaaaboaaaaaaaiaabaaaaac
adaaaboaaaaaffiaabaaaaacacaaacoaacaaffiaabaaaaacadaaacoaacaakkia
abaaaaacacaaaeoaabaakkiaabaaaaacadaaaeoaabaaaaiappppaaaafdeieefc
kmafaaaaeaaaabaaglabaaaafjaaaaaeegiocaaaaaaaaaaabaaaaaaafjaaaaae
egiocaaaabaaaaaabdaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaa
abaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaadhccabaaa
acaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaad
hccabaaaafaaaaaagiaaaaacadaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaabaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
abaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaabaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpccabaaaaaaaaaaaegiocaaaabaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaa
aaaaaaaaaoaaaaaaogikcaaaaaaaaaaaaoaaaaaadcaaaaalmccabaaaabaaaaaa
agbebaaaadaaaaaaagiecaaaaaaaaaaaapaaaaaakgiocaaaaaaaaaaaapaaaaaa
diaaaaaiccaabaaaaaaaaaaaakbabaaaacaaaaaaakiacaaaabaaaaaabaaaaaaa
diaaaaaiecaabaaaaaaaaaaaakbabaaaacaaaaaaakiacaaaabaaaaaabbaaaaaa
diaaaaaibcaabaaaaaaaaaaaakbabaaaacaaaaaaakiacaaaabaaaaaabcaaaaaa
diaaaaaiccaabaaaabaaaaaabkbabaaaacaaaaaabkiacaaaabaaaaaabaaaaaaa
diaaaaaiecaabaaaabaaaaaabkbabaaaacaaaaaabkiacaaaabaaaaaabbaaaaaa
diaaaaaibcaabaaaabaaaaaabkbabaaaacaaaaaabkiacaaaabaaaaaabcaaaaaa
aaaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaai
ccaabaaaabaaaaaackbabaaaacaaaaaackiacaaaabaaaaaabaaaaaaadiaaaaai
ecaabaaaabaaaaaackbabaaaacaaaaaackiacaaaabaaaaaabbaaaaaadiaaaaai
bcaabaaaabaaaaaackbabaaaacaaaaaackiacaaaabaaaaaabcaaaaaaaaaaaaah
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahicaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaaaaaaaaaa
dkaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaa
aaaaaaaadgaaaaafeccabaaaacaaaaaabkaabaaaaaaaaaaadiaaaaaihcaabaaa
abaaaaaafgbfbaaaabaaaaaajgiecaaaabaaaaaaanaaaaaadcaaaaakhcaabaaa
abaaaaaajgiecaaaabaaaaaaamaaaaaaagbabaaaabaaaaaaegacbaaaabaaaaaa
dcaaaaakhcaabaaaabaaaaaajgiecaaaabaaaaaaaoaaaaaakgbkbaaaabaaaaaa
egacbaaaabaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaa
abaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaa
abaaaaaapgapbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaahhcaabaaaacaaaaaa
egacbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaacaaaaaacgajbaaa
aaaaaaaajgaebaaaabaaaaaaegacbaiaebaaaaaaacaaaaaadiaaaaahhcaabaaa
acaaaaaaegacbaaaacaaaaaapgbpbaaaabaaaaaadgaaaaafcccabaaaacaaaaaa
akaabaaaacaaaaaadgaaaaafbccabaaaacaaaaaackaabaaaabaaaaaadgaaaaaf
eccabaaaadaaaaaackaabaaaaaaaaaaadgaaaaafeccabaaaaeaaaaaaakaabaaa
aaaaaaaadgaaaaafbccabaaaadaaaaaaakaabaaaabaaaaaadgaaaaafbccabaaa
aeaaaaaabkaabaaaabaaaaaadgaaaaafcccabaaaadaaaaaabkaabaaaacaaaaaa
dgaaaaafcccabaaaaeaaaaaackaabaaaacaaaaaadiaaaaaihcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiccaaaabaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaabaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaabaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaa
aaaaaaaadcaaaaakhccabaaaafaaaaaaegiccaaaabaaaaaaapaaaaaapgbpbaaa
aaaaaaaaegacbaaaaaaaaaaadoaaaaabejfdeheopaaaaaaaaiaaaaaaaiaaaaaa
miaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaanbaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapapaaaanjaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahahaaaaoaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaa
oaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaoaaaaaaaacaaaaaa
aaaaaaaaadaaaaaaafaaaaaaapaaaaaaoaaaaaaaadaaaaaaaaaaaaaaadaaaaaa
agaaaaaaapaaaaaaojaaaaaaaaaaaaaaaaaaaaaaadaaaaaaahaaaaaaapaaaaaa
faepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfcee
aaedepemepfcaaklepfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaiaaaa
keaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaakeaaaaaaadaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaa
afaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl
"
}
SubProgram "opengl " {
// Stats: 16 math, 3 textures, 1 branches
Keywords { "DIRECTIONAL" }
"!!GLSL
#ifdef VERTEX

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 _MainTex_ST;
uniform vec4 _BumpMap_ST;
attribute vec4 TANGENT;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec3 xlv_TEXCOORD2;
varying vec3 xlv_TEXCOORD3;
varying vec3 xlv_TEXCOORD4;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xy = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_1.zw = ((gl_MultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  vec4 v_2;
  v_2.x = _World2Object[0].x;
  v_2.y = _World2Object[1].x;
  v_2.z = _World2Object[2].x;
  v_2.w = _World2Object[3].x;
  vec4 v_3;
  v_3.x = _World2Object[0].y;
  v_3.y = _World2Object[1].y;
  v_3.z = _World2Object[2].y;
  v_3.w = _World2Object[3].y;
  vec4 v_4;
  v_4.x = _World2Object[0].z;
  v_4.y = _World2Object[1].z;
  v_4.z = _World2Object[2].z;
  v_4.w = _World2Object[3].z;
  vec3 tmpvar_5;
  tmpvar_5 = normalize(((
    (v_2.xyz * gl_Normal.x)
   + 
    (v_3.xyz * gl_Normal.y)
  ) + (v_4.xyz * gl_Normal.z)));
  mat3 tmpvar_6;
  tmpvar_6[0] = _Object2World[0].xyz;
  tmpvar_6[1] = _Object2World[1].xyz;
  tmpvar_6[2] = _Object2World[2].xyz;
  vec3 tmpvar_7;
  tmpvar_7 = normalize((tmpvar_6 * TANGENT.xyz));
  vec3 tmpvar_8;
  tmpvar_8 = (((tmpvar_5.yzx * tmpvar_7.zxy) - (tmpvar_5.zxy * tmpvar_7.yzx)) * TANGENT.w);
  vec3 tmpvar_9;
  tmpvar_9.x = tmpvar_7.x;
  tmpvar_9.y = tmpvar_8.x;
  tmpvar_9.z = tmpvar_5.x;
  vec3 tmpvar_10;
  tmpvar_10.x = tmpvar_7.y;
  tmpvar_10.y = tmpvar_8.y;
  tmpvar_10.z = tmpvar_5.y;
  vec3 tmpvar_11;
  tmpvar_11.x = tmpvar_7.z;
  tmpvar_11.y = tmpvar_8.z;
  tmpvar_11.z = tmpvar_5.z;
  gl_Position = (gl_ModelViewProjectionMatrix * gl_Vertex);
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_9;
  xlv_TEXCOORD2 = tmpvar_10;
  xlv_TEXCOORD3 = tmpvar_11;
  xlv_TEXCOORD4 = (_Object2World * gl_Vertex).xyz;
}


#endif
#ifdef FRAGMENT
uniform vec4 _WorldSpaceLightPos0;
uniform vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform sampler2D _BumpMap;
uniform vec4 _Color;
uniform float _Cutoff;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec3 xlv_TEXCOORD2;
varying vec3 xlv_TEXCOORD3;
void main ()
{
  vec3 worldN_1;
  vec4 tmpvar_2;
  tmpvar_2 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) * _Color);
  vec3 normal_3;
  normal_3.xy = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).wy * 2.0) - 1.0);
  normal_3.z = sqrt((1.0 - clamp (
    dot (normal_3.xy, normal_3.xy)
  , 0.0, 1.0)));
  float x_4;
  x_4 = (tmpvar_2.w - _Cutoff);
  if ((x_4 < 0.0)) {
    discard;
  };
  worldN_1.x = dot (xlv_TEXCOORD1, normal_3);
  worldN_1.y = dot (xlv_TEXCOORD2, normal_3);
  worldN_1.z = dot (xlv_TEXCOORD3, normal_3);
  vec4 c_5;
  vec4 c_6;
  c_6.xyz = ((tmpvar_2.xyz * _LightColor0.xyz) * max (0.0, dot (worldN_1, _WorldSpaceLightPos0.xyz)));
  c_6.w = tmpvar_2.w;
  c_5.w = c_6.w;
  c_5.xyz = c_6.xyz;
  gl_FragData[0] = c_5;
}


#endif
"
}
SubProgram "d3d9 " {
// Stats: 33 math
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord4
Matrix 4 [_Object2World] 3
Matrix 7 [_World2Object] 3
Matrix 0 [glstate_matrix_mvp]
Vector 11 [_BumpMap_ST]
Vector 10 [_MainTex_ST]
"vs_2_0
dcl_position v0
dcl_tangent v1
dcl_normal v2
dcl_texcoord v3
dp4 oPos.x, c0, v0
dp4 oPos.y, c1, v0
dp4 oPos.z, c2, v0
dp4 oPos.w, c3, v0
mad oT0.xy, v3, c10, c10.zwzw
mad oT0.zw, v3.xyxy, c11.xyxy, c11
dp4 oT4.x, c4, v0
dp4 oT4.y, c5, v0
dp4 oT4.z, c6, v0
dp3 r0.z, c4, v1
dp3 r0.x, c5, v1
dp3 r0.y, c6, v1
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul r0.xyz, r0.w, r0
mov oT1.x, r0.z
mul r1.xyz, v2.y, c8.zxyw
mad r1.xyz, c7.zxyw, v2.x, r1
mad r1.xyz, c9.zxyw, v2.z, r1
dp3 r0.w, r1, r1
rsq r0.w, r0.w
mul r1.xyz, r0.w, r1
mul r2.xyz, r0, r1
mad r2.xyz, r1.zxyw, r0.yzxw, -r2
mul r2.xyz, r2, v1.w
mov oT1.y, r2.x
mov oT1.z, r1.y
mov oT2.x, r0.x
mov oT3.x, r0.y
mov oT2.y, r2.y
mov oT3.y, r2.z
mov oT2.z, r1.z
mov oT3.z, r1.x

"
}
SubProgram "d3d11 " {
// Stats: 33 math
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord4
ConstBuffer "$Globals" 208
Vector 160 [_MainTex_ST]
Vector 176 [_BumpMap_ST]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
BindCB  "$Globals" 0
BindCB  "UnityPerDraw" 1
"vs_4_0
eefiecedacndjggefnfciclbfgefdjbeimojoaigabaaaaaajaahaaaaadaaaaaa
cmaaaaaaceabaaaanmabaaaaejfdeheopaaaaaaaaiaaaaaaaiaaaaaamiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaanbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaanjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaaoaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaaoaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaoaaaaaaaacaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaaoaaaaaaaadaaaaaaaaaaaaaaadaaaaaaagaaaaaa
apaaaaaaojaaaaaaaaaaaaaaaaaaaaaaadaaaaaaahaaaaaaapaaaaaafaepfdej
feejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepem
epfcaaklepfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
apaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaiaaaakeaaaaaa
acaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaahaiaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaa
ahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefc
kmafaaaaeaaaabaaglabaaaafjaaaaaeegiocaaaaaaaaaaaamaaaaaafjaaaaae
egiocaaaabaaaaaabdaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaa
abaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaadhccabaaa
acaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaad
hccabaaaafaaaaaagiaaaaacadaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaabaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
abaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaabaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpccabaaaaaaaaaaaegiocaaaabaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaa
aaaaaaaaakaaaaaaogikcaaaaaaaaaaaakaaaaaadcaaaaalmccabaaaabaaaaaa
agbebaaaadaaaaaaagiecaaaaaaaaaaaalaaaaaakgiocaaaaaaaaaaaalaaaaaa
diaaaaaiccaabaaaaaaaaaaaakbabaaaacaaaaaaakiacaaaabaaaaaabaaaaaaa
diaaaaaiecaabaaaaaaaaaaaakbabaaaacaaaaaaakiacaaaabaaaaaabbaaaaaa
diaaaaaibcaabaaaaaaaaaaaakbabaaaacaaaaaaakiacaaaabaaaaaabcaaaaaa
diaaaaaiccaabaaaabaaaaaabkbabaaaacaaaaaabkiacaaaabaaaaaabaaaaaaa
diaaaaaiecaabaaaabaaaaaabkbabaaaacaaaaaabkiacaaaabaaaaaabbaaaaaa
diaaaaaibcaabaaaabaaaaaabkbabaaaacaaaaaabkiacaaaabaaaaaabcaaaaaa
aaaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaai
ccaabaaaabaaaaaackbabaaaacaaaaaackiacaaaabaaaaaabaaaaaaadiaaaaai
ecaabaaaabaaaaaackbabaaaacaaaaaackiacaaaabaaaaaabbaaaaaadiaaaaai
bcaabaaaabaaaaaackbabaaaacaaaaaackiacaaaabaaaaaabcaaaaaaaaaaaaah
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahicaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaaaaaaaaaa
dkaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaa
aaaaaaaadgaaaaafeccabaaaacaaaaaabkaabaaaaaaaaaaadiaaaaaihcaabaaa
abaaaaaafgbfbaaaabaaaaaajgiecaaaabaaaaaaanaaaaaadcaaaaakhcaabaaa
abaaaaaajgiecaaaabaaaaaaamaaaaaaagbabaaaabaaaaaaegacbaaaabaaaaaa
dcaaaaakhcaabaaaabaaaaaajgiecaaaabaaaaaaaoaaaaaakgbkbaaaabaaaaaa
egacbaaaabaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaa
abaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaa
abaaaaaapgapbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaahhcaabaaaacaaaaaa
egacbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaacaaaaaacgajbaaa
aaaaaaaajgaebaaaabaaaaaaegacbaiaebaaaaaaacaaaaaadiaaaaahhcaabaaa
acaaaaaaegacbaaaacaaaaaapgbpbaaaabaaaaaadgaaaaafcccabaaaacaaaaaa
akaabaaaacaaaaaadgaaaaafbccabaaaacaaaaaackaabaaaabaaaaaadgaaaaaf
eccabaaaadaaaaaackaabaaaaaaaaaaadgaaaaafeccabaaaaeaaaaaaakaabaaa
aaaaaaaadgaaaaafbccabaaaadaaaaaaakaabaaaabaaaaaadgaaaaafbccabaaa
aeaaaaaabkaabaaaabaaaaaadgaaaaafcccabaaaadaaaaaabkaabaaaacaaaaaa
dgaaaaafcccabaaaaeaaaaaackaabaaaacaaaaaadiaaaaaihcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiccaaaabaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaabaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaabaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaa
aaaaaaaadcaaaaakhccabaaaafaaaaaaegiccaaaabaaaaaaapaaaaaapgbpbaaa
aaaaaaaaegacbaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 33 math
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord4
ConstBuffer "$Globals" 208
Vector 160 [_MainTex_ST]
Vector 176 [_BumpMap_ST]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
BindCB  "$Globals" 0
BindCB  "UnityPerDraw" 1
"vs_4_0_level_9_1
eefiecedajlcejdcfaplecdiflgkbjikochajcnnabaaaaaaoaakaaaaaeaaaaaa
daaaaaaahmadaaaadaajaaaaciakaaaaebgpgodjeeadaaaaeeadaaaaaaacpopp
piacaaaaemaaaaaaadaaceaaaaaaeiaaaaaaeiaaaaaaceaaabaaeiaaaaaaakaa
acaaabaaaaaaaaaaabaaaaaaaeaaadaaaaaaaaaaabaaamaaahaaahaaaaaaaaaa
aaaaaaaaaaacpoppbpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabiaabaaapja
bpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjaaeaaaaaeaaaaadoa
adaaoejaabaaoekaabaaookaaeaaaaaeaaaaamoaadaaeejaacaaeekaacaaoeka
afaaaaadaaaaahiaaaaaffjaaiaaoekaaeaaaaaeaaaaahiaahaaoekaaaaaaaja
aaaaoeiaaeaaaaaeaaaaahiaajaaoekaaaaakkjaaaaaoeiaaeaaaaaeaeaaahoa
akaaoekaaaaappjaaaaaoeiaafaaaaadaaaaapiaaaaaffjaaeaaoekaaeaaaaae
aaaaapiaadaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaafaaoekaaaaakkja
aaaaoeiaaeaaaaaeaaaaapiaagaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadma
aaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaafaaaaadaaaaahia
abaaffjaaiaamjkaaeaaaaaeaaaaahiaahaamjkaabaaaajaaaaaoeiaaeaaaaae
aaaaahiaajaamjkaabaakkjaaaaaoeiaaiaaaaadaaaaaiiaaaaaoeiaaaaaoeia
ahaaaaacaaaaaiiaaaaappiaafaaaaadaaaaahiaaaaappiaaaaaoeiaabaaaaac
abaaaboaaaaakkiaafaaaaadabaaaciaacaaaajaalaaaakaafaaaaadabaaaeia
acaaaajaamaaaakaafaaaaadabaaabiaacaaaajaanaaaakaafaaaaadacaaacia
acaaffjaalaaffkaafaaaaadacaaaeiaacaaffjaamaaffkaafaaaaadacaaabia
acaaffjaanaaffkaacaaaaadabaaahiaabaaoeiaacaaoeiaafaaaaadacaaacia
acaakkjaalaakkkaafaaaaadacaaaeiaacaakkjaamaakkkaafaaaaadacaaabia
acaakkjaanaakkkaacaaaaadabaaahiaabaaoeiaacaaoeiaaiaaaaadaaaaaiia
abaaoeiaabaaoeiaahaaaaacaaaaaiiaaaaappiaafaaaaadabaaahiaaaaappia
abaaoeiaafaaaaadacaaahiaaaaaoeiaabaaoeiaaeaaaaaeacaaahiaabaancia
aaaamjiaacaaoeibafaaaaadacaaahiaacaaoeiaabaappjaabaaaaacabaaacoa
acaaaaiaabaaaaacabaaaeoaabaaffiaabaaaaacacaaaboaaaaaaaiaabaaaaac
adaaaboaaaaaffiaabaaaaacacaaacoaacaaffiaabaaaaacadaaacoaacaakkia
abaaaaacacaaaeoaabaakkiaabaaaaacadaaaeoaabaaaaiappppaaaafdeieefc
kmafaaaaeaaaabaaglabaaaafjaaaaaeegiocaaaaaaaaaaaamaaaaaafjaaaaae
egiocaaaabaaaaaabdaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaa
abaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaadhccabaaa
acaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaad
hccabaaaafaaaaaagiaaaaacadaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaabaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
abaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaabaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpccabaaaaaaaaaaaegiocaaaabaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaa
aaaaaaaaakaaaaaaogikcaaaaaaaaaaaakaaaaaadcaaaaalmccabaaaabaaaaaa
agbebaaaadaaaaaaagiecaaaaaaaaaaaalaaaaaakgiocaaaaaaaaaaaalaaaaaa
diaaaaaiccaabaaaaaaaaaaaakbabaaaacaaaaaaakiacaaaabaaaaaabaaaaaaa
diaaaaaiecaabaaaaaaaaaaaakbabaaaacaaaaaaakiacaaaabaaaaaabbaaaaaa
diaaaaaibcaabaaaaaaaaaaaakbabaaaacaaaaaaakiacaaaabaaaaaabcaaaaaa
diaaaaaiccaabaaaabaaaaaabkbabaaaacaaaaaabkiacaaaabaaaaaabaaaaaaa
diaaaaaiecaabaaaabaaaaaabkbabaaaacaaaaaabkiacaaaabaaaaaabbaaaaaa
diaaaaaibcaabaaaabaaaaaabkbabaaaacaaaaaabkiacaaaabaaaaaabcaaaaaa
aaaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaai
ccaabaaaabaaaaaackbabaaaacaaaaaackiacaaaabaaaaaabaaaaaaadiaaaaai
ecaabaaaabaaaaaackbabaaaacaaaaaackiacaaaabaaaaaabbaaaaaadiaaaaai
bcaabaaaabaaaaaackbabaaaacaaaaaackiacaaaabaaaaaabcaaaaaaaaaaaaah
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahicaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaaaaaaaaaa
dkaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaa
aaaaaaaadgaaaaafeccabaaaacaaaaaabkaabaaaaaaaaaaadiaaaaaihcaabaaa
abaaaaaafgbfbaaaabaaaaaajgiecaaaabaaaaaaanaaaaaadcaaaaakhcaabaaa
abaaaaaajgiecaaaabaaaaaaamaaaaaaagbabaaaabaaaaaaegacbaaaabaaaaaa
dcaaaaakhcaabaaaabaaaaaajgiecaaaabaaaaaaaoaaaaaakgbkbaaaabaaaaaa
egacbaaaabaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaa
abaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaa
abaaaaaapgapbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaahhcaabaaaacaaaaaa
egacbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaacaaaaaacgajbaaa
aaaaaaaajgaebaaaabaaaaaaegacbaiaebaaaaaaacaaaaaadiaaaaahhcaabaaa
acaaaaaaegacbaaaacaaaaaapgbpbaaaabaaaaaadgaaaaafcccabaaaacaaaaaa
akaabaaaacaaaaaadgaaaaafbccabaaaacaaaaaackaabaaaabaaaaaadgaaaaaf
eccabaaaadaaaaaackaabaaaaaaaaaaadgaaaaafeccabaaaaeaaaaaaakaabaaa
aaaaaaaadgaaaaafbccabaaaadaaaaaaakaabaaaabaaaaaadgaaaaafbccabaaa
aeaaaaaabkaabaaaabaaaaaadgaaaaafcccabaaaadaaaaaabkaabaaaacaaaaaa
dgaaaaafcccabaaaaeaaaaaackaabaaaacaaaaaadiaaaaaihcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiccaaaabaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaabaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaabaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaa
aaaaaaaadcaaaaakhccabaaaafaaaaaaegiccaaaabaaaaaaapaaaaaapgbpbaaa
aaaaaaaaegacbaaaaaaaaaaadoaaaaabejfdeheopaaaaaaaaiaaaaaaaiaaaaaa
miaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaanbaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapapaaaanjaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahahaaaaoaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaa
oaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaoaaaaaaaacaaaaaa
aaaaaaaaadaaaaaaafaaaaaaapaaaaaaoaaaaaaaadaaaaaaaaaaaaaaadaaaaaa
agaaaaaaapaaaaaaojaaaaaaaaaaaaaaaaaaaaaaadaaaaaaahaaaaaaapaaaaaa
faepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfcee
aaedepemepfcaaklepfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaiaaaa
keaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaakeaaaaaaadaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaa
afaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl
"
}
SubProgram "opengl " {
// Stats: 28 math, 5 textures, 1 branches
Keywords { "SPOT" }
"!!GLSL
#ifdef VERTEX

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 _MainTex_ST;
uniform vec4 _BumpMap_ST;
attribute vec4 TANGENT;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec3 xlv_TEXCOORD2;
varying vec3 xlv_TEXCOORD3;
varying vec3 xlv_TEXCOORD4;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xy = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_1.zw = ((gl_MultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  vec4 v_2;
  v_2.x = _World2Object[0].x;
  v_2.y = _World2Object[1].x;
  v_2.z = _World2Object[2].x;
  v_2.w = _World2Object[3].x;
  vec4 v_3;
  v_3.x = _World2Object[0].y;
  v_3.y = _World2Object[1].y;
  v_3.z = _World2Object[2].y;
  v_3.w = _World2Object[3].y;
  vec4 v_4;
  v_4.x = _World2Object[0].z;
  v_4.y = _World2Object[1].z;
  v_4.z = _World2Object[2].z;
  v_4.w = _World2Object[3].z;
  vec3 tmpvar_5;
  tmpvar_5 = normalize(((
    (v_2.xyz * gl_Normal.x)
   + 
    (v_3.xyz * gl_Normal.y)
  ) + (v_4.xyz * gl_Normal.z)));
  mat3 tmpvar_6;
  tmpvar_6[0] = _Object2World[0].xyz;
  tmpvar_6[1] = _Object2World[1].xyz;
  tmpvar_6[2] = _Object2World[2].xyz;
  vec3 tmpvar_7;
  tmpvar_7 = normalize((tmpvar_6 * TANGENT.xyz));
  vec3 tmpvar_8;
  tmpvar_8 = (((tmpvar_5.yzx * tmpvar_7.zxy) - (tmpvar_5.zxy * tmpvar_7.yzx)) * TANGENT.w);
  vec3 tmpvar_9;
  tmpvar_9.x = tmpvar_7.x;
  tmpvar_9.y = tmpvar_8.x;
  tmpvar_9.z = tmpvar_5.x;
  vec3 tmpvar_10;
  tmpvar_10.x = tmpvar_7.y;
  tmpvar_10.y = tmpvar_8.y;
  tmpvar_10.z = tmpvar_5.y;
  vec3 tmpvar_11;
  tmpvar_11.x = tmpvar_7.z;
  tmpvar_11.y = tmpvar_8.z;
  tmpvar_11.z = tmpvar_5.z;
  gl_Position = (gl_ModelViewProjectionMatrix * gl_Vertex);
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_9;
  xlv_TEXCOORD2 = tmpvar_10;
  xlv_TEXCOORD3 = tmpvar_11;
  xlv_TEXCOORD4 = (_Object2World * gl_Vertex).xyz;
}


#endif
#ifdef FRAGMENT
uniform vec4 _WorldSpaceLightPos0;
uniform vec4 _LightColor0;
uniform sampler2D _LightTexture0;
uniform mat4 _LightMatrix0;
uniform sampler2D _LightTextureB0;
uniform sampler2D _MainTex;
uniform sampler2D _BumpMap;
uniform vec4 _Color;
uniform float _Cutoff;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec3 xlv_TEXCOORD2;
varying vec3 xlv_TEXCOORD3;
varying vec3 xlv_TEXCOORD4;
void main ()
{
  vec3 worldN_1;
  vec4 tmpvar_2;
  tmpvar_2 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) * _Color);
  vec3 normal_3;
  normal_3.xy = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).wy * 2.0) - 1.0);
  normal_3.z = sqrt((1.0 - clamp (
    dot (normal_3.xy, normal_3.xy)
  , 0.0, 1.0)));
  float x_4;
  x_4 = (tmpvar_2.w - _Cutoff);
  if ((x_4 < 0.0)) {
    discard;
  };
  vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = xlv_TEXCOORD4;
  vec4 tmpvar_6;
  tmpvar_6 = (_LightMatrix0 * tmpvar_5);
  worldN_1.x = dot (xlv_TEXCOORD1, normal_3);
  worldN_1.y = dot (xlv_TEXCOORD2, normal_3);
  worldN_1.z = dot (xlv_TEXCOORD3, normal_3);
  vec4 c_7;
  vec4 c_8;
  c_8.xyz = ((tmpvar_2.xyz * (_LightColor0.xyz * 
    ((float((tmpvar_6.z > 0.0)) * texture2D (_LightTexture0, ((tmpvar_6.xy / tmpvar_6.w) + 0.5)).w) * texture2D (_LightTextureB0, vec2(dot (tmpvar_6.xyz, tmpvar_6.xyz))).w)
  )) * max (0.0, dot (worldN_1, 
    normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD4))
  )));
  c_8.w = tmpvar_2.w;
  c_7.w = c_8.w;
  c_7.xyz = c_8.xyz;
  gl_FragData[0] = c_7;
}


#endif
"
}
SubProgram "d3d9 " {
// Stats: 33 math
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord4
Matrix 4 [_Object2World] 3
Matrix 7 [_World2Object] 3
Matrix 0 [glstate_matrix_mvp]
Vector 11 [_BumpMap_ST]
Vector 10 [_MainTex_ST]
"vs_2_0
dcl_position v0
dcl_tangent v1
dcl_normal v2
dcl_texcoord v3
dp4 oPos.x, c0, v0
dp4 oPos.y, c1, v0
dp4 oPos.z, c2, v0
dp4 oPos.w, c3, v0
mad oT0.xy, v3, c10, c10.zwzw
mad oT0.zw, v3.xyxy, c11.xyxy, c11
dp4 oT4.x, c4, v0
dp4 oT4.y, c5, v0
dp4 oT4.z, c6, v0
dp3 r0.z, c4, v1
dp3 r0.x, c5, v1
dp3 r0.y, c6, v1
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul r0.xyz, r0.w, r0
mov oT1.x, r0.z
mul r1.xyz, v2.y, c8.zxyw
mad r1.xyz, c7.zxyw, v2.x, r1
mad r1.xyz, c9.zxyw, v2.z, r1
dp3 r0.w, r1, r1
rsq r0.w, r0.w
mul r1.xyz, r0.w, r1
mul r2.xyz, r0, r1
mad r2.xyz, r1.zxyw, r0.yzxw, -r2
mul r2.xyz, r2, v1.w
mov oT1.y, r2.x
mov oT1.z, r1.y
mov oT2.x, r0.x
mov oT3.x, r0.y
mov oT2.y, r2.y
mov oT3.y, r2.z
mov oT2.z, r1.z
mov oT3.z, r1.x

"
}
SubProgram "d3d11 " {
// Stats: 33 math
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord4
ConstBuffer "$Globals" 272
Vector 224 [_MainTex_ST]
Vector 240 [_BumpMap_ST]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
BindCB  "$Globals" 0
BindCB  "UnityPerDraw" 1
"vs_4_0
eefieceddhghnbmamjojmnfpekgacngjhkdldebiabaaaaaajaahaaaaadaaaaaa
cmaaaaaaceabaaaanmabaaaaejfdeheopaaaaaaaaiaaaaaaaiaaaaaamiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaanbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaanjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaaoaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaaoaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaoaaaaaaaacaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaaoaaaaaaaadaaaaaaaaaaaaaaadaaaaaaagaaaaaa
apaaaaaaojaaaaaaaaaaaaaaaaaaaaaaadaaaaaaahaaaaaaapaaaaaafaepfdej
feejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepem
epfcaaklepfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
apaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaiaaaakeaaaaaa
acaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaahaiaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaa
ahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefc
kmafaaaaeaaaabaaglabaaaafjaaaaaeegiocaaaaaaaaaaabaaaaaaafjaaaaae
egiocaaaabaaaaaabdaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaa
abaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaadhccabaaa
acaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaad
hccabaaaafaaaaaagiaaaaacadaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaabaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
abaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaabaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpccabaaaaaaaaaaaegiocaaaabaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaa
aaaaaaaaaoaaaaaaogikcaaaaaaaaaaaaoaaaaaadcaaaaalmccabaaaabaaaaaa
agbebaaaadaaaaaaagiecaaaaaaaaaaaapaaaaaakgiocaaaaaaaaaaaapaaaaaa
diaaaaaiccaabaaaaaaaaaaaakbabaaaacaaaaaaakiacaaaabaaaaaabaaaaaaa
diaaaaaiecaabaaaaaaaaaaaakbabaaaacaaaaaaakiacaaaabaaaaaabbaaaaaa
diaaaaaibcaabaaaaaaaaaaaakbabaaaacaaaaaaakiacaaaabaaaaaabcaaaaaa
diaaaaaiccaabaaaabaaaaaabkbabaaaacaaaaaabkiacaaaabaaaaaabaaaaaaa
diaaaaaiecaabaaaabaaaaaabkbabaaaacaaaaaabkiacaaaabaaaaaabbaaaaaa
diaaaaaibcaabaaaabaaaaaabkbabaaaacaaaaaabkiacaaaabaaaaaabcaaaaaa
aaaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaai
ccaabaaaabaaaaaackbabaaaacaaaaaackiacaaaabaaaaaabaaaaaaadiaaaaai
ecaabaaaabaaaaaackbabaaaacaaaaaackiacaaaabaaaaaabbaaaaaadiaaaaai
bcaabaaaabaaaaaackbabaaaacaaaaaackiacaaaabaaaaaabcaaaaaaaaaaaaah
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahicaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaaaaaaaaaa
dkaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaa
aaaaaaaadgaaaaafeccabaaaacaaaaaabkaabaaaaaaaaaaadiaaaaaihcaabaaa
abaaaaaafgbfbaaaabaaaaaajgiecaaaabaaaaaaanaaaaaadcaaaaakhcaabaaa
abaaaaaajgiecaaaabaaaaaaamaaaaaaagbabaaaabaaaaaaegacbaaaabaaaaaa
dcaaaaakhcaabaaaabaaaaaajgiecaaaabaaaaaaaoaaaaaakgbkbaaaabaaaaaa
egacbaaaabaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaa
abaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaa
abaaaaaapgapbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaahhcaabaaaacaaaaaa
egacbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaacaaaaaacgajbaaa
aaaaaaaajgaebaaaabaaaaaaegacbaiaebaaaaaaacaaaaaadiaaaaahhcaabaaa
acaaaaaaegacbaaaacaaaaaapgbpbaaaabaaaaaadgaaaaafcccabaaaacaaaaaa
akaabaaaacaaaaaadgaaaaafbccabaaaacaaaaaackaabaaaabaaaaaadgaaaaaf
eccabaaaadaaaaaackaabaaaaaaaaaaadgaaaaafeccabaaaaeaaaaaaakaabaaa
aaaaaaaadgaaaaafbccabaaaadaaaaaaakaabaaaabaaaaaadgaaaaafbccabaaa
aeaaaaaabkaabaaaabaaaaaadgaaaaafcccabaaaadaaaaaabkaabaaaacaaaaaa
dgaaaaafcccabaaaaeaaaaaackaabaaaacaaaaaadiaaaaaihcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiccaaaabaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaabaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaabaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaa
aaaaaaaadcaaaaakhccabaaaafaaaaaaegiccaaaabaaaaaaapaaaaaapgbpbaaa
aaaaaaaaegacbaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 33 math
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord4
ConstBuffer "$Globals" 272
Vector 224 [_MainTex_ST]
Vector 240 [_BumpMap_ST]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
BindCB  "$Globals" 0
BindCB  "UnityPerDraw" 1
"vs_4_0_level_9_1
eefiecedlaaiejlfkbgmijemhnpfeoggoifjdhjbabaaaaaaoaakaaaaaeaaaaaa
daaaaaaahmadaaaadaajaaaaciakaaaaebgpgodjeeadaaaaeeadaaaaaaacpopp
piacaaaaemaaaaaaadaaceaaaaaaeiaaaaaaeiaaaaaaceaaabaaeiaaaaaaaoaa
acaaabaaaaaaaaaaabaaaaaaaeaaadaaaaaaaaaaabaaamaaahaaahaaaaaaaaaa
aaaaaaaaaaacpoppbpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabiaabaaapja
bpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjaaeaaaaaeaaaaadoa
adaaoejaabaaoekaabaaookaaeaaaaaeaaaaamoaadaaeejaacaaeekaacaaoeka
afaaaaadaaaaahiaaaaaffjaaiaaoekaaeaaaaaeaaaaahiaahaaoekaaaaaaaja
aaaaoeiaaeaaaaaeaaaaahiaajaaoekaaaaakkjaaaaaoeiaaeaaaaaeaeaaahoa
akaaoekaaaaappjaaaaaoeiaafaaaaadaaaaapiaaaaaffjaaeaaoekaaeaaaaae
aaaaapiaadaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaafaaoekaaaaakkja
aaaaoeiaaeaaaaaeaaaaapiaagaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadma
aaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaafaaaaadaaaaahia
abaaffjaaiaamjkaaeaaaaaeaaaaahiaahaamjkaabaaaajaaaaaoeiaaeaaaaae
aaaaahiaajaamjkaabaakkjaaaaaoeiaaiaaaaadaaaaaiiaaaaaoeiaaaaaoeia
ahaaaaacaaaaaiiaaaaappiaafaaaaadaaaaahiaaaaappiaaaaaoeiaabaaaaac
abaaaboaaaaakkiaafaaaaadabaaaciaacaaaajaalaaaakaafaaaaadabaaaeia
acaaaajaamaaaakaafaaaaadabaaabiaacaaaajaanaaaakaafaaaaadacaaacia
acaaffjaalaaffkaafaaaaadacaaaeiaacaaffjaamaaffkaafaaaaadacaaabia
acaaffjaanaaffkaacaaaaadabaaahiaabaaoeiaacaaoeiaafaaaaadacaaacia
acaakkjaalaakkkaafaaaaadacaaaeiaacaakkjaamaakkkaafaaaaadacaaabia
acaakkjaanaakkkaacaaaaadabaaahiaabaaoeiaacaaoeiaaiaaaaadaaaaaiia
abaaoeiaabaaoeiaahaaaaacaaaaaiiaaaaappiaafaaaaadabaaahiaaaaappia
abaaoeiaafaaaaadacaaahiaaaaaoeiaabaaoeiaaeaaaaaeacaaahiaabaancia
aaaamjiaacaaoeibafaaaaadacaaahiaacaaoeiaabaappjaabaaaaacabaaacoa
acaaaaiaabaaaaacabaaaeoaabaaffiaabaaaaacacaaaboaaaaaaaiaabaaaaac
adaaaboaaaaaffiaabaaaaacacaaacoaacaaffiaabaaaaacadaaacoaacaakkia
abaaaaacacaaaeoaabaakkiaabaaaaacadaaaeoaabaaaaiappppaaaafdeieefc
kmafaaaaeaaaabaaglabaaaafjaaaaaeegiocaaaaaaaaaaabaaaaaaafjaaaaae
egiocaaaabaaaaaabdaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaa
abaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaadhccabaaa
acaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaad
hccabaaaafaaaaaagiaaaaacadaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaabaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
abaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaabaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpccabaaaaaaaaaaaegiocaaaabaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaa
aaaaaaaaaoaaaaaaogikcaaaaaaaaaaaaoaaaaaadcaaaaalmccabaaaabaaaaaa
agbebaaaadaaaaaaagiecaaaaaaaaaaaapaaaaaakgiocaaaaaaaaaaaapaaaaaa
diaaaaaiccaabaaaaaaaaaaaakbabaaaacaaaaaaakiacaaaabaaaaaabaaaaaaa
diaaaaaiecaabaaaaaaaaaaaakbabaaaacaaaaaaakiacaaaabaaaaaabbaaaaaa
diaaaaaibcaabaaaaaaaaaaaakbabaaaacaaaaaaakiacaaaabaaaaaabcaaaaaa
diaaaaaiccaabaaaabaaaaaabkbabaaaacaaaaaabkiacaaaabaaaaaabaaaaaaa
diaaaaaiecaabaaaabaaaaaabkbabaaaacaaaaaabkiacaaaabaaaaaabbaaaaaa
diaaaaaibcaabaaaabaaaaaabkbabaaaacaaaaaabkiacaaaabaaaaaabcaaaaaa
aaaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaai
ccaabaaaabaaaaaackbabaaaacaaaaaackiacaaaabaaaaaabaaaaaaadiaaaaai
ecaabaaaabaaaaaackbabaaaacaaaaaackiacaaaabaaaaaabbaaaaaadiaaaaai
bcaabaaaabaaaaaackbabaaaacaaaaaackiacaaaabaaaaaabcaaaaaaaaaaaaah
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahicaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaaaaaaaaaa
dkaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaa
aaaaaaaadgaaaaafeccabaaaacaaaaaabkaabaaaaaaaaaaadiaaaaaihcaabaaa
abaaaaaafgbfbaaaabaaaaaajgiecaaaabaaaaaaanaaaaaadcaaaaakhcaabaaa
abaaaaaajgiecaaaabaaaaaaamaaaaaaagbabaaaabaaaaaaegacbaaaabaaaaaa
dcaaaaakhcaabaaaabaaaaaajgiecaaaabaaaaaaaoaaaaaakgbkbaaaabaaaaaa
egacbaaaabaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaa
abaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaa
abaaaaaapgapbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaahhcaabaaaacaaaaaa
egacbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaacaaaaaacgajbaaa
aaaaaaaajgaebaaaabaaaaaaegacbaiaebaaaaaaacaaaaaadiaaaaahhcaabaaa
acaaaaaaegacbaaaacaaaaaapgbpbaaaabaaaaaadgaaaaafcccabaaaacaaaaaa
akaabaaaacaaaaaadgaaaaafbccabaaaacaaaaaackaabaaaabaaaaaadgaaaaaf
eccabaaaadaaaaaackaabaaaaaaaaaaadgaaaaafeccabaaaaeaaaaaaakaabaaa
aaaaaaaadgaaaaafbccabaaaadaaaaaaakaabaaaabaaaaaadgaaaaafbccabaaa
aeaaaaaabkaabaaaabaaaaaadgaaaaafcccabaaaadaaaaaabkaabaaaacaaaaaa
dgaaaaafcccabaaaaeaaaaaackaabaaaacaaaaaadiaaaaaihcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiccaaaabaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaabaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaabaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaa
aaaaaaaadcaaaaakhccabaaaafaaaaaaegiccaaaabaaaaaaapaaaaaapgbpbaaa
aaaaaaaaegacbaaaaaaaaaaadoaaaaabejfdeheopaaaaaaaaiaaaaaaaiaaaaaa
miaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaanbaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapapaaaanjaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahahaaaaoaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaa
oaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaoaaaaaaaacaaaaaa
aaaaaaaaadaaaaaaafaaaaaaapaaaaaaoaaaaaaaadaaaaaaaaaaaaaaadaaaaaa
agaaaaaaapaaaaaaojaaaaaaaaaaaaaaaaaaaaaaadaaaaaaahaaaaaaapaaaaaa
faepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfcee
aaedepemepfcaaklepfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaiaaaa
keaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaakeaaaaaaadaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaa
afaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl
"
}
SubProgram "opengl " {
// Stats: 23 math, 5 textures, 1 branches
Keywords { "POINT_COOKIE" }
"!!GLSL
#ifdef VERTEX

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 _MainTex_ST;
uniform vec4 _BumpMap_ST;
attribute vec4 TANGENT;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec3 xlv_TEXCOORD2;
varying vec3 xlv_TEXCOORD3;
varying vec3 xlv_TEXCOORD4;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xy = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_1.zw = ((gl_MultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  vec4 v_2;
  v_2.x = _World2Object[0].x;
  v_2.y = _World2Object[1].x;
  v_2.z = _World2Object[2].x;
  v_2.w = _World2Object[3].x;
  vec4 v_3;
  v_3.x = _World2Object[0].y;
  v_3.y = _World2Object[1].y;
  v_3.z = _World2Object[2].y;
  v_3.w = _World2Object[3].y;
  vec4 v_4;
  v_4.x = _World2Object[0].z;
  v_4.y = _World2Object[1].z;
  v_4.z = _World2Object[2].z;
  v_4.w = _World2Object[3].z;
  vec3 tmpvar_5;
  tmpvar_5 = normalize(((
    (v_2.xyz * gl_Normal.x)
   + 
    (v_3.xyz * gl_Normal.y)
  ) + (v_4.xyz * gl_Normal.z)));
  mat3 tmpvar_6;
  tmpvar_6[0] = _Object2World[0].xyz;
  tmpvar_6[1] = _Object2World[1].xyz;
  tmpvar_6[2] = _Object2World[2].xyz;
  vec3 tmpvar_7;
  tmpvar_7 = normalize((tmpvar_6 * TANGENT.xyz));
  vec3 tmpvar_8;
  tmpvar_8 = (((tmpvar_5.yzx * tmpvar_7.zxy) - (tmpvar_5.zxy * tmpvar_7.yzx)) * TANGENT.w);
  vec3 tmpvar_9;
  tmpvar_9.x = tmpvar_7.x;
  tmpvar_9.y = tmpvar_8.x;
  tmpvar_9.z = tmpvar_5.x;
  vec3 tmpvar_10;
  tmpvar_10.x = tmpvar_7.y;
  tmpvar_10.y = tmpvar_8.y;
  tmpvar_10.z = tmpvar_5.y;
  vec3 tmpvar_11;
  tmpvar_11.x = tmpvar_7.z;
  tmpvar_11.y = tmpvar_8.z;
  tmpvar_11.z = tmpvar_5.z;
  gl_Position = (gl_ModelViewProjectionMatrix * gl_Vertex);
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_9;
  xlv_TEXCOORD2 = tmpvar_10;
  xlv_TEXCOORD3 = tmpvar_11;
  xlv_TEXCOORD4 = (_Object2World * gl_Vertex).xyz;
}


#endif
#ifdef FRAGMENT
uniform vec4 _WorldSpaceLightPos0;
uniform vec4 _LightColor0;
uniform samplerCube _LightTexture0;
uniform mat4 _LightMatrix0;
uniform sampler2D _LightTextureB0;
uniform sampler2D _MainTex;
uniform sampler2D _BumpMap;
uniform vec4 _Color;
uniform float _Cutoff;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec3 xlv_TEXCOORD2;
varying vec3 xlv_TEXCOORD3;
varying vec3 xlv_TEXCOORD4;
void main ()
{
  vec3 worldN_1;
  vec4 tmpvar_2;
  tmpvar_2 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) * _Color);
  vec3 normal_3;
  normal_3.xy = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).wy * 2.0) - 1.0);
  normal_3.z = sqrt((1.0 - clamp (
    dot (normal_3.xy, normal_3.xy)
  , 0.0, 1.0)));
  float x_4;
  x_4 = (tmpvar_2.w - _Cutoff);
  if ((x_4 < 0.0)) {
    discard;
  };
  vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = xlv_TEXCOORD4;
  vec3 tmpvar_6;
  tmpvar_6 = (_LightMatrix0 * tmpvar_5).xyz;
  worldN_1.x = dot (xlv_TEXCOORD1, normal_3);
  worldN_1.y = dot (xlv_TEXCOORD2, normal_3);
  worldN_1.z = dot (xlv_TEXCOORD3, normal_3);
  vec4 c_7;
  vec4 c_8;
  c_8.xyz = ((tmpvar_2.xyz * (_LightColor0.xyz * 
    (texture2D (_LightTextureB0, vec2(dot (tmpvar_6, tmpvar_6))).w * textureCube (_LightTexture0, tmpvar_6).w)
  )) * max (0.0, dot (worldN_1, 
    normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD4))
  )));
  c_8.w = tmpvar_2.w;
  c_7.w = c_8.w;
  c_7.xyz = c_8.xyz;
  gl_FragData[0] = c_7;
}


#endif
"
}
SubProgram "d3d9 " {
// Stats: 33 math
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord4
Matrix 4 [_Object2World] 3
Matrix 7 [_World2Object] 3
Matrix 0 [glstate_matrix_mvp]
Vector 11 [_BumpMap_ST]
Vector 10 [_MainTex_ST]
"vs_2_0
dcl_position v0
dcl_tangent v1
dcl_normal v2
dcl_texcoord v3
dp4 oPos.x, c0, v0
dp4 oPos.y, c1, v0
dp4 oPos.z, c2, v0
dp4 oPos.w, c3, v0
mad oT0.xy, v3, c10, c10.zwzw
mad oT0.zw, v3.xyxy, c11.xyxy, c11
dp4 oT4.x, c4, v0
dp4 oT4.y, c5, v0
dp4 oT4.z, c6, v0
dp3 r0.z, c4, v1
dp3 r0.x, c5, v1
dp3 r0.y, c6, v1
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul r0.xyz, r0.w, r0
mov oT1.x, r0.z
mul r1.xyz, v2.y, c8.zxyw
mad r1.xyz, c7.zxyw, v2.x, r1
mad r1.xyz, c9.zxyw, v2.z, r1
dp3 r0.w, r1, r1
rsq r0.w, r0.w
mul r1.xyz, r0.w, r1
mul r2.xyz, r0, r1
mad r2.xyz, r1.zxyw, r0.yzxw, -r2
mul r2.xyz, r2, v1.w
mov oT1.y, r2.x
mov oT1.z, r1.y
mov oT2.x, r0.x
mov oT3.x, r0.y
mov oT2.y, r2.y
mov oT3.y, r2.z
mov oT2.z, r1.z
mov oT3.z, r1.x

"
}
SubProgram "d3d11 " {
// Stats: 33 math
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord4
ConstBuffer "$Globals" 272
Vector 224 [_MainTex_ST]
Vector 240 [_BumpMap_ST]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
BindCB  "$Globals" 0
BindCB  "UnityPerDraw" 1
"vs_4_0
eefieceddhghnbmamjojmnfpekgacngjhkdldebiabaaaaaajaahaaaaadaaaaaa
cmaaaaaaceabaaaanmabaaaaejfdeheopaaaaaaaaiaaaaaaaiaaaaaamiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaanbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaanjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaaoaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaaoaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaoaaaaaaaacaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaaoaaaaaaaadaaaaaaaaaaaaaaadaaaaaaagaaaaaa
apaaaaaaojaaaaaaaaaaaaaaaaaaaaaaadaaaaaaahaaaaaaapaaaaaafaepfdej
feejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepem
epfcaaklepfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
apaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaiaaaakeaaaaaa
acaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaahaiaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaa
ahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefc
kmafaaaaeaaaabaaglabaaaafjaaaaaeegiocaaaaaaaaaaabaaaaaaafjaaaaae
egiocaaaabaaaaaabdaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaa
abaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaadhccabaaa
acaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaad
hccabaaaafaaaaaagiaaaaacadaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaabaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
abaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaabaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpccabaaaaaaaaaaaegiocaaaabaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaa
aaaaaaaaaoaaaaaaogikcaaaaaaaaaaaaoaaaaaadcaaaaalmccabaaaabaaaaaa
agbebaaaadaaaaaaagiecaaaaaaaaaaaapaaaaaakgiocaaaaaaaaaaaapaaaaaa
diaaaaaiccaabaaaaaaaaaaaakbabaaaacaaaaaaakiacaaaabaaaaaabaaaaaaa
diaaaaaiecaabaaaaaaaaaaaakbabaaaacaaaaaaakiacaaaabaaaaaabbaaaaaa
diaaaaaibcaabaaaaaaaaaaaakbabaaaacaaaaaaakiacaaaabaaaaaabcaaaaaa
diaaaaaiccaabaaaabaaaaaabkbabaaaacaaaaaabkiacaaaabaaaaaabaaaaaaa
diaaaaaiecaabaaaabaaaaaabkbabaaaacaaaaaabkiacaaaabaaaaaabbaaaaaa
diaaaaaibcaabaaaabaaaaaabkbabaaaacaaaaaabkiacaaaabaaaaaabcaaaaaa
aaaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaai
ccaabaaaabaaaaaackbabaaaacaaaaaackiacaaaabaaaaaabaaaaaaadiaaaaai
ecaabaaaabaaaaaackbabaaaacaaaaaackiacaaaabaaaaaabbaaaaaadiaaaaai
bcaabaaaabaaaaaackbabaaaacaaaaaackiacaaaabaaaaaabcaaaaaaaaaaaaah
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahicaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaaaaaaaaaa
dkaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaa
aaaaaaaadgaaaaafeccabaaaacaaaaaabkaabaaaaaaaaaaadiaaaaaihcaabaaa
abaaaaaafgbfbaaaabaaaaaajgiecaaaabaaaaaaanaaaaaadcaaaaakhcaabaaa
abaaaaaajgiecaaaabaaaaaaamaaaaaaagbabaaaabaaaaaaegacbaaaabaaaaaa
dcaaaaakhcaabaaaabaaaaaajgiecaaaabaaaaaaaoaaaaaakgbkbaaaabaaaaaa
egacbaaaabaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaa
abaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaa
abaaaaaapgapbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaahhcaabaaaacaaaaaa
egacbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaacaaaaaacgajbaaa
aaaaaaaajgaebaaaabaaaaaaegacbaiaebaaaaaaacaaaaaadiaaaaahhcaabaaa
acaaaaaaegacbaaaacaaaaaapgbpbaaaabaaaaaadgaaaaafcccabaaaacaaaaaa
akaabaaaacaaaaaadgaaaaafbccabaaaacaaaaaackaabaaaabaaaaaadgaaaaaf
eccabaaaadaaaaaackaabaaaaaaaaaaadgaaaaafeccabaaaaeaaaaaaakaabaaa
aaaaaaaadgaaaaafbccabaaaadaaaaaaakaabaaaabaaaaaadgaaaaafbccabaaa
aeaaaaaabkaabaaaabaaaaaadgaaaaafcccabaaaadaaaaaabkaabaaaacaaaaaa
dgaaaaafcccabaaaaeaaaaaackaabaaaacaaaaaadiaaaaaihcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiccaaaabaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaabaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaabaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaa
aaaaaaaadcaaaaakhccabaaaafaaaaaaegiccaaaabaaaaaaapaaaaaapgbpbaaa
aaaaaaaaegacbaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 33 math
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord4
ConstBuffer "$Globals" 272
Vector 224 [_MainTex_ST]
Vector 240 [_BumpMap_ST]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
BindCB  "$Globals" 0
BindCB  "UnityPerDraw" 1
"vs_4_0_level_9_1
eefiecedlaaiejlfkbgmijemhnpfeoggoifjdhjbabaaaaaaoaakaaaaaeaaaaaa
daaaaaaahmadaaaadaajaaaaciakaaaaebgpgodjeeadaaaaeeadaaaaaaacpopp
piacaaaaemaaaaaaadaaceaaaaaaeiaaaaaaeiaaaaaaceaaabaaeiaaaaaaaoaa
acaaabaaaaaaaaaaabaaaaaaaeaaadaaaaaaaaaaabaaamaaahaaahaaaaaaaaaa
aaaaaaaaaaacpoppbpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabiaabaaapja
bpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjaaeaaaaaeaaaaadoa
adaaoejaabaaoekaabaaookaaeaaaaaeaaaaamoaadaaeejaacaaeekaacaaoeka
afaaaaadaaaaahiaaaaaffjaaiaaoekaaeaaaaaeaaaaahiaahaaoekaaaaaaaja
aaaaoeiaaeaaaaaeaaaaahiaajaaoekaaaaakkjaaaaaoeiaaeaaaaaeaeaaahoa
akaaoekaaaaappjaaaaaoeiaafaaaaadaaaaapiaaaaaffjaaeaaoekaaeaaaaae
aaaaapiaadaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaafaaoekaaaaakkja
aaaaoeiaaeaaaaaeaaaaapiaagaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadma
aaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaafaaaaadaaaaahia
abaaffjaaiaamjkaaeaaaaaeaaaaahiaahaamjkaabaaaajaaaaaoeiaaeaaaaae
aaaaahiaajaamjkaabaakkjaaaaaoeiaaiaaaaadaaaaaiiaaaaaoeiaaaaaoeia
ahaaaaacaaaaaiiaaaaappiaafaaaaadaaaaahiaaaaappiaaaaaoeiaabaaaaac
abaaaboaaaaakkiaafaaaaadabaaaciaacaaaajaalaaaakaafaaaaadabaaaeia
acaaaajaamaaaakaafaaaaadabaaabiaacaaaajaanaaaakaafaaaaadacaaacia
acaaffjaalaaffkaafaaaaadacaaaeiaacaaffjaamaaffkaafaaaaadacaaabia
acaaffjaanaaffkaacaaaaadabaaahiaabaaoeiaacaaoeiaafaaaaadacaaacia
acaakkjaalaakkkaafaaaaadacaaaeiaacaakkjaamaakkkaafaaaaadacaaabia
acaakkjaanaakkkaacaaaaadabaaahiaabaaoeiaacaaoeiaaiaaaaadaaaaaiia
abaaoeiaabaaoeiaahaaaaacaaaaaiiaaaaappiaafaaaaadabaaahiaaaaappia
abaaoeiaafaaaaadacaaahiaaaaaoeiaabaaoeiaaeaaaaaeacaaahiaabaancia
aaaamjiaacaaoeibafaaaaadacaaahiaacaaoeiaabaappjaabaaaaacabaaacoa
acaaaaiaabaaaaacabaaaeoaabaaffiaabaaaaacacaaaboaaaaaaaiaabaaaaac
adaaaboaaaaaffiaabaaaaacacaaacoaacaaffiaabaaaaacadaaacoaacaakkia
abaaaaacacaaaeoaabaakkiaabaaaaacadaaaeoaabaaaaiappppaaaafdeieefc
kmafaaaaeaaaabaaglabaaaafjaaaaaeegiocaaaaaaaaaaabaaaaaaafjaaaaae
egiocaaaabaaaaaabdaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaa
abaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaadhccabaaa
acaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaad
hccabaaaafaaaaaagiaaaaacadaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaabaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
abaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaabaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpccabaaaaaaaaaaaegiocaaaabaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaa
aaaaaaaaaoaaaaaaogikcaaaaaaaaaaaaoaaaaaadcaaaaalmccabaaaabaaaaaa
agbebaaaadaaaaaaagiecaaaaaaaaaaaapaaaaaakgiocaaaaaaaaaaaapaaaaaa
diaaaaaiccaabaaaaaaaaaaaakbabaaaacaaaaaaakiacaaaabaaaaaabaaaaaaa
diaaaaaiecaabaaaaaaaaaaaakbabaaaacaaaaaaakiacaaaabaaaaaabbaaaaaa
diaaaaaibcaabaaaaaaaaaaaakbabaaaacaaaaaaakiacaaaabaaaaaabcaaaaaa
diaaaaaiccaabaaaabaaaaaabkbabaaaacaaaaaabkiacaaaabaaaaaabaaaaaaa
diaaaaaiecaabaaaabaaaaaabkbabaaaacaaaaaabkiacaaaabaaaaaabbaaaaaa
diaaaaaibcaabaaaabaaaaaabkbabaaaacaaaaaabkiacaaaabaaaaaabcaaaaaa
aaaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaai
ccaabaaaabaaaaaackbabaaaacaaaaaackiacaaaabaaaaaabaaaaaaadiaaaaai
ecaabaaaabaaaaaackbabaaaacaaaaaackiacaaaabaaaaaabbaaaaaadiaaaaai
bcaabaaaabaaaaaackbabaaaacaaaaaackiacaaaabaaaaaabcaaaaaaaaaaaaah
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahicaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaaaaaaaaaa
dkaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaa
aaaaaaaadgaaaaafeccabaaaacaaaaaabkaabaaaaaaaaaaadiaaaaaihcaabaaa
abaaaaaafgbfbaaaabaaaaaajgiecaaaabaaaaaaanaaaaaadcaaaaakhcaabaaa
abaaaaaajgiecaaaabaaaaaaamaaaaaaagbabaaaabaaaaaaegacbaaaabaaaaaa
dcaaaaakhcaabaaaabaaaaaajgiecaaaabaaaaaaaoaaaaaakgbkbaaaabaaaaaa
egacbaaaabaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaa
abaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaa
abaaaaaapgapbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaahhcaabaaaacaaaaaa
egacbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaacaaaaaacgajbaaa
aaaaaaaajgaebaaaabaaaaaaegacbaiaebaaaaaaacaaaaaadiaaaaahhcaabaaa
acaaaaaaegacbaaaacaaaaaapgbpbaaaabaaaaaadgaaaaafcccabaaaacaaaaaa
akaabaaaacaaaaaadgaaaaafbccabaaaacaaaaaackaabaaaabaaaaaadgaaaaaf
eccabaaaadaaaaaackaabaaaaaaaaaaadgaaaaafeccabaaaaeaaaaaaakaabaaa
aaaaaaaadgaaaaafbccabaaaadaaaaaaakaabaaaabaaaaaadgaaaaafbccabaaa
aeaaaaaabkaabaaaabaaaaaadgaaaaafcccabaaaadaaaaaabkaabaaaacaaaaaa
dgaaaaafcccabaaaaeaaaaaackaabaaaacaaaaaadiaaaaaihcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiccaaaabaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaabaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaabaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaa
aaaaaaaadcaaaaakhccabaaaafaaaaaaegiccaaaabaaaaaaapaaaaaapgbpbaaa
aaaaaaaaegacbaaaaaaaaaaadoaaaaabejfdeheopaaaaaaaaiaaaaaaaiaaaaaa
miaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaanbaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapapaaaanjaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahahaaaaoaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaa
oaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaoaaaaaaaacaaaaaa
aaaaaaaaadaaaaaaafaaaaaaapaaaaaaoaaaaaaaadaaaaaaaaaaaaaaadaaaaaa
agaaaaaaapaaaaaaojaaaaaaaaaaaaaaaaaaaaaaadaaaaaaahaaaaaaapaaaaaa
faepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfcee
aaedepemepfcaaklepfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaiaaaa
keaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaakeaaaaaaadaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaa
afaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl
"
}
SubProgram "opengl " {
// Stats: 19 math, 4 textures, 1 branches
Keywords { "DIRECTIONAL_COOKIE" }
"!!GLSL
#ifdef VERTEX

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 _MainTex_ST;
uniform vec4 _BumpMap_ST;
attribute vec4 TANGENT;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec3 xlv_TEXCOORD2;
varying vec3 xlv_TEXCOORD3;
varying vec3 xlv_TEXCOORD4;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xy = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_1.zw = ((gl_MultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  vec4 v_2;
  v_2.x = _World2Object[0].x;
  v_2.y = _World2Object[1].x;
  v_2.z = _World2Object[2].x;
  v_2.w = _World2Object[3].x;
  vec4 v_3;
  v_3.x = _World2Object[0].y;
  v_3.y = _World2Object[1].y;
  v_3.z = _World2Object[2].y;
  v_3.w = _World2Object[3].y;
  vec4 v_4;
  v_4.x = _World2Object[0].z;
  v_4.y = _World2Object[1].z;
  v_4.z = _World2Object[2].z;
  v_4.w = _World2Object[3].z;
  vec3 tmpvar_5;
  tmpvar_5 = normalize(((
    (v_2.xyz * gl_Normal.x)
   + 
    (v_3.xyz * gl_Normal.y)
  ) + (v_4.xyz * gl_Normal.z)));
  mat3 tmpvar_6;
  tmpvar_6[0] = _Object2World[0].xyz;
  tmpvar_6[1] = _Object2World[1].xyz;
  tmpvar_6[2] = _Object2World[2].xyz;
  vec3 tmpvar_7;
  tmpvar_7 = normalize((tmpvar_6 * TANGENT.xyz));
  vec3 tmpvar_8;
  tmpvar_8 = (((tmpvar_5.yzx * tmpvar_7.zxy) - (tmpvar_5.zxy * tmpvar_7.yzx)) * TANGENT.w);
  vec3 tmpvar_9;
  tmpvar_9.x = tmpvar_7.x;
  tmpvar_9.y = tmpvar_8.x;
  tmpvar_9.z = tmpvar_5.x;
  vec3 tmpvar_10;
  tmpvar_10.x = tmpvar_7.y;
  tmpvar_10.y = tmpvar_8.y;
  tmpvar_10.z = tmpvar_5.y;
  vec3 tmpvar_11;
  tmpvar_11.x = tmpvar_7.z;
  tmpvar_11.y = tmpvar_8.z;
  tmpvar_11.z = tmpvar_5.z;
  gl_Position = (gl_ModelViewProjectionMatrix * gl_Vertex);
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_9;
  xlv_TEXCOORD2 = tmpvar_10;
  xlv_TEXCOORD3 = tmpvar_11;
  xlv_TEXCOORD4 = (_Object2World * gl_Vertex).xyz;
}


#endif
#ifdef FRAGMENT
uniform vec4 _WorldSpaceLightPos0;
uniform vec4 _LightColor0;
uniform sampler2D _LightTexture0;
uniform mat4 _LightMatrix0;
uniform sampler2D _MainTex;
uniform sampler2D _BumpMap;
uniform vec4 _Color;
uniform float _Cutoff;
varying vec4 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec3 xlv_TEXCOORD2;
varying vec3 xlv_TEXCOORD3;
varying vec3 xlv_TEXCOORD4;
void main ()
{
  vec3 worldN_1;
  vec4 tmpvar_2;
  tmpvar_2 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) * _Color);
  vec3 normal_3;
  normal_3.xy = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).wy * 2.0) - 1.0);
  normal_3.z = sqrt((1.0 - clamp (
    dot (normal_3.xy, normal_3.xy)
  , 0.0, 1.0)));
  float x_4;
  x_4 = (tmpvar_2.w - _Cutoff);
  if ((x_4 < 0.0)) {
    discard;
  };
  vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = xlv_TEXCOORD4;
  worldN_1.x = dot (xlv_TEXCOORD1, normal_3);
  worldN_1.y = dot (xlv_TEXCOORD2, normal_3);
  worldN_1.z = dot (xlv_TEXCOORD3, normal_3);
  vec4 c_6;
  vec4 c_7;
  c_7.xyz = ((tmpvar_2.xyz * (_LightColor0.xyz * texture2D (_LightTexture0, 
    (_LightMatrix0 * tmpvar_5)
  .xy).w)) * max (0.0, dot (worldN_1, _WorldSpaceLightPos0.xyz)));
  c_7.w = tmpvar_2.w;
  c_6.w = c_7.w;
  c_6.xyz = c_7.xyz;
  gl_FragData[0] = c_6;
}


#endif
"
}
SubProgram "d3d9 " {
// Stats: 33 math
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord4
Matrix 4 [_Object2World] 3
Matrix 7 [_World2Object] 3
Matrix 0 [glstate_matrix_mvp]
Vector 11 [_BumpMap_ST]
Vector 10 [_MainTex_ST]
"vs_2_0
dcl_position v0
dcl_tangent v1
dcl_normal v2
dcl_texcoord v3
dp4 oPos.x, c0, v0
dp4 oPos.y, c1, v0
dp4 oPos.z, c2, v0
dp4 oPos.w, c3, v0
mad oT0.xy, v3, c10, c10.zwzw
mad oT0.zw, v3.xyxy, c11.xyxy, c11
dp4 oT4.x, c4, v0
dp4 oT4.y, c5, v0
dp4 oT4.z, c6, v0
dp3 r0.z, c4, v1
dp3 r0.x, c5, v1
dp3 r0.y, c6, v1
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul r0.xyz, r0.w, r0
mov oT1.x, r0.z
mul r1.xyz, v2.y, c8.zxyw
mad r1.xyz, c7.zxyw, v2.x, r1
mad r1.xyz, c9.zxyw, v2.z, r1
dp3 r0.w, r1, r1
rsq r0.w, r0.w
mul r1.xyz, r0.w, r1
mul r2.xyz, r0, r1
mad r2.xyz, r1.zxyw, r0.yzxw, -r2
mul r2.xyz, r2, v1.w
mov oT1.y, r2.x
mov oT1.z, r1.y
mov oT2.x, r0.x
mov oT3.x, r0.y
mov oT2.y, r2.y
mov oT3.y, r2.z
mov oT2.z, r1.z
mov oT3.z, r1.x

"
}
SubProgram "d3d11 " {
// Stats: 33 math
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord4
ConstBuffer "$Globals" 272
Vector 224 [_MainTex_ST]
Vector 240 [_BumpMap_ST]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
BindCB  "$Globals" 0
BindCB  "UnityPerDraw" 1
"vs_4_0
eefieceddhghnbmamjojmnfpekgacngjhkdldebiabaaaaaajaahaaaaadaaaaaa
cmaaaaaaceabaaaanmabaaaaejfdeheopaaaaaaaaiaaaaaaaiaaaaaamiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaanbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaanjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaaoaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaaoaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaoaaaaaaaacaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaaoaaaaaaaadaaaaaaaaaaaaaaadaaaaaaagaaaaaa
apaaaaaaojaaaaaaaaaaaaaaaaaaaaaaadaaaaaaahaaaaaaapaaaaaafaepfdej
feejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepem
epfcaaklepfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
apaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaiaaaakeaaaaaa
acaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaahaiaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaa
ahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefc
kmafaaaaeaaaabaaglabaaaafjaaaaaeegiocaaaaaaaaaaabaaaaaaafjaaaaae
egiocaaaabaaaaaabdaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaa
abaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaadhccabaaa
acaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaad
hccabaaaafaaaaaagiaaaaacadaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaabaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
abaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaabaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpccabaaaaaaaaaaaegiocaaaabaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaa
aaaaaaaaaoaaaaaaogikcaaaaaaaaaaaaoaaaaaadcaaaaalmccabaaaabaaaaaa
agbebaaaadaaaaaaagiecaaaaaaaaaaaapaaaaaakgiocaaaaaaaaaaaapaaaaaa
diaaaaaiccaabaaaaaaaaaaaakbabaaaacaaaaaaakiacaaaabaaaaaabaaaaaaa
diaaaaaiecaabaaaaaaaaaaaakbabaaaacaaaaaaakiacaaaabaaaaaabbaaaaaa
diaaaaaibcaabaaaaaaaaaaaakbabaaaacaaaaaaakiacaaaabaaaaaabcaaaaaa
diaaaaaiccaabaaaabaaaaaabkbabaaaacaaaaaabkiacaaaabaaaaaabaaaaaaa
diaaaaaiecaabaaaabaaaaaabkbabaaaacaaaaaabkiacaaaabaaaaaabbaaaaaa
diaaaaaibcaabaaaabaaaaaabkbabaaaacaaaaaabkiacaaaabaaaaaabcaaaaaa
aaaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaai
ccaabaaaabaaaaaackbabaaaacaaaaaackiacaaaabaaaaaabaaaaaaadiaaaaai
ecaabaaaabaaaaaackbabaaaacaaaaaackiacaaaabaaaaaabbaaaaaadiaaaaai
bcaabaaaabaaaaaackbabaaaacaaaaaackiacaaaabaaaaaabcaaaaaaaaaaaaah
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahicaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaaaaaaaaaa
dkaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaa
aaaaaaaadgaaaaafeccabaaaacaaaaaabkaabaaaaaaaaaaadiaaaaaihcaabaaa
abaaaaaafgbfbaaaabaaaaaajgiecaaaabaaaaaaanaaaaaadcaaaaakhcaabaaa
abaaaaaajgiecaaaabaaaaaaamaaaaaaagbabaaaabaaaaaaegacbaaaabaaaaaa
dcaaaaakhcaabaaaabaaaaaajgiecaaaabaaaaaaaoaaaaaakgbkbaaaabaaaaaa
egacbaaaabaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaa
abaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaa
abaaaaaapgapbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaahhcaabaaaacaaaaaa
egacbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaacaaaaaacgajbaaa
aaaaaaaajgaebaaaabaaaaaaegacbaiaebaaaaaaacaaaaaadiaaaaahhcaabaaa
acaaaaaaegacbaaaacaaaaaapgbpbaaaabaaaaaadgaaaaafcccabaaaacaaaaaa
akaabaaaacaaaaaadgaaaaafbccabaaaacaaaaaackaabaaaabaaaaaadgaaaaaf
eccabaaaadaaaaaackaabaaaaaaaaaaadgaaaaafeccabaaaaeaaaaaaakaabaaa
aaaaaaaadgaaaaafbccabaaaadaaaaaaakaabaaaabaaaaaadgaaaaafbccabaaa
aeaaaaaabkaabaaaabaaaaaadgaaaaafcccabaaaadaaaaaabkaabaaaacaaaaaa
dgaaaaafcccabaaaaeaaaaaackaabaaaacaaaaaadiaaaaaihcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiccaaaabaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaabaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaabaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaa
aaaaaaaadcaaaaakhccabaaaafaaaaaaegiccaaaabaaaaaaapaaaaaapgbpbaaa
aaaaaaaaegacbaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 33 math
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord4
ConstBuffer "$Globals" 272
Vector 224 [_MainTex_ST]
Vector 240 [_BumpMap_ST]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
BindCB  "$Globals" 0
BindCB  "UnityPerDraw" 1
"vs_4_0_level_9_1
eefiecedlaaiejlfkbgmijemhnpfeoggoifjdhjbabaaaaaaoaakaaaaaeaaaaaa
daaaaaaahmadaaaadaajaaaaciakaaaaebgpgodjeeadaaaaeeadaaaaaaacpopp
piacaaaaemaaaaaaadaaceaaaaaaeiaaaaaaeiaaaaaaceaaabaaeiaaaaaaaoaa
acaaabaaaaaaaaaaabaaaaaaaeaaadaaaaaaaaaaabaaamaaahaaahaaaaaaaaaa
aaaaaaaaaaacpoppbpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabiaabaaapja
bpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjaaeaaaaaeaaaaadoa
adaaoejaabaaoekaabaaookaaeaaaaaeaaaaamoaadaaeejaacaaeekaacaaoeka
afaaaaadaaaaahiaaaaaffjaaiaaoekaaeaaaaaeaaaaahiaahaaoekaaaaaaaja
aaaaoeiaaeaaaaaeaaaaahiaajaaoekaaaaakkjaaaaaoeiaaeaaaaaeaeaaahoa
akaaoekaaaaappjaaaaaoeiaafaaaaadaaaaapiaaaaaffjaaeaaoekaaeaaaaae
aaaaapiaadaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaafaaoekaaaaakkja
aaaaoeiaaeaaaaaeaaaaapiaagaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadma
aaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaafaaaaadaaaaahia
abaaffjaaiaamjkaaeaaaaaeaaaaahiaahaamjkaabaaaajaaaaaoeiaaeaaaaae
aaaaahiaajaamjkaabaakkjaaaaaoeiaaiaaaaadaaaaaiiaaaaaoeiaaaaaoeia
ahaaaaacaaaaaiiaaaaappiaafaaaaadaaaaahiaaaaappiaaaaaoeiaabaaaaac
abaaaboaaaaakkiaafaaaaadabaaaciaacaaaajaalaaaakaafaaaaadabaaaeia
acaaaajaamaaaakaafaaaaadabaaabiaacaaaajaanaaaakaafaaaaadacaaacia
acaaffjaalaaffkaafaaaaadacaaaeiaacaaffjaamaaffkaafaaaaadacaaabia
acaaffjaanaaffkaacaaaaadabaaahiaabaaoeiaacaaoeiaafaaaaadacaaacia
acaakkjaalaakkkaafaaaaadacaaaeiaacaakkjaamaakkkaafaaaaadacaaabia
acaakkjaanaakkkaacaaaaadabaaahiaabaaoeiaacaaoeiaaiaaaaadaaaaaiia
abaaoeiaabaaoeiaahaaaaacaaaaaiiaaaaappiaafaaaaadabaaahiaaaaappia
abaaoeiaafaaaaadacaaahiaaaaaoeiaabaaoeiaaeaaaaaeacaaahiaabaancia
aaaamjiaacaaoeibafaaaaadacaaahiaacaaoeiaabaappjaabaaaaacabaaacoa
acaaaaiaabaaaaacabaaaeoaabaaffiaabaaaaacacaaaboaaaaaaaiaabaaaaac
adaaaboaaaaaffiaabaaaaacacaaacoaacaaffiaabaaaaacadaaacoaacaakkia
abaaaaacacaaaeoaabaakkiaabaaaaacadaaaeoaabaaaaiappppaaaafdeieefc
kmafaaaaeaaaabaaglabaaaafjaaaaaeegiocaaaaaaaaaaabaaaaaaafjaaaaae
egiocaaaabaaaaaabdaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaa
abaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaadhccabaaa
acaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaad
hccabaaaafaaaaaagiaaaaacadaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaabaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
abaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaabaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpccabaaaaaaaaaaaegiocaaaabaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaa
aaaaaaaaaoaaaaaaogikcaaaaaaaaaaaaoaaaaaadcaaaaalmccabaaaabaaaaaa
agbebaaaadaaaaaaagiecaaaaaaaaaaaapaaaaaakgiocaaaaaaaaaaaapaaaaaa
diaaaaaiccaabaaaaaaaaaaaakbabaaaacaaaaaaakiacaaaabaaaaaabaaaaaaa
diaaaaaiecaabaaaaaaaaaaaakbabaaaacaaaaaaakiacaaaabaaaaaabbaaaaaa
diaaaaaibcaabaaaaaaaaaaaakbabaaaacaaaaaaakiacaaaabaaaaaabcaaaaaa
diaaaaaiccaabaaaabaaaaaabkbabaaaacaaaaaabkiacaaaabaaaaaabaaaaaaa
diaaaaaiecaabaaaabaaaaaabkbabaaaacaaaaaabkiacaaaabaaaaaabbaaaaaa
diaaaaaibcaabaaaabaaaaaabkbabaaaacaaaaaabkiacaaaabaaaaaabcaaaaaa
aaaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaai
ccaabaaaabaaaaaackbabaaaacaaaaaackiacaaaabaaaaaabaaaaaaadiaaaaai
ecaabaaaabaaaaaackbabaaaacaaaaaackiacaaaabaaaaaabbaaaaaadiaaaaai
bcaabaaaabaaaaaackbabaaaacaaaaaackiacaaaabaaaaaabcaaaaaaaaaaaaah
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahicaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaaaaaaaaaa
dkaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaa
aaaaaaaadgaaaaafeccabaaaacaaaaaabkaabaaaaaaaaaaadiaaaaaihcaabaaa
abaaaaaafgbfbaaaabaaaaaajgiecaaaabaaaaaaanaaaaaadcaaaaakhcaabaaa
abaaaaaajgiecaaaabaaaaaaamaaaaaaagbabaaaabaaaaaaegacbaaaabaaaaaa
dcaaaaakhcaabaaaabaaaaaajgiecaaaabaaaaaaaoaaaaaakgbkbaaaabaaaaaa
egacbaaaabaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaa
abaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaa
abaaaaaapgapbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaahhcaabaaaacaaaaaa
egacbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaacaaaaaacgajbaaa
aaaaaaaajgaebaaaabaaaaaaegacbaiaebaaaaaaacaaaaaadiaaaaahhcaabaaa
acaaaaaaegacbaaaacaaaaaapgbpbaaaabaaaaaadgaaaaafcccabaaaacaaaaaa
akaabaaaacaaaaaadgaaaaafbccabaaaacaaaaaackaabaaaabaaaaaadgaaaaaf
eccabaaaadaaaaaackaabaaaaaaaaaaadgaaaaafeccabaaaaeaaaaaaakaabaaa
aaaaaaaadgaaaaafbccabaaaadaaaaaaakaabaaaabaaaaaadgaaaaafbccabaaa
aeaaaaaabkaabaaaabaaaaaadgaaaaafcccabaaaadaaaaaabkaabaaaacaaaaaa
dgaaaaafcccabaaaaeaaaaaackaabaaaacaaaaaadiaaaaaihcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiccaaaabaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaabaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaabaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaa
aaaaaaaadcaaaaakhccabaaaafaaaaaaegiccaaaabaaaaaaapaaaaaapgbpbaaa
aaaaaaaaegacbaaaaaaaaaaadoaaaaabejfdeheopaaaaaaaaiaaaaaaaiaaaaaa
miaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaanbaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapapaaaanjaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahahaaaaoaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaa
oaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaoaaaaaaaacaaaaaa
aaaaaaaaadaaaaaaafaaaaaaapaaaaaaoaaaaaaaadaaaaaaaaaaaaaaadaaaaaa
agaaaaaaapaaaaaaojaaaaaaaaaaaaaaaaaaaaaaadaaaaaaahaaaaaaapaaaaaa
faepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfcee
aaedepemepfcaaklepfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaiaaaa
keaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaakeaaaaaaadaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaa
afaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl
"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "POINT" }
"!!GLSL"
}
SubProgram "d3d9 " {
// Stats: 31 math, 4 textures
Keywords { "POINT" }
Matrix 0 [_LightMatrix0] 3
Vector 5 [_Color]
Float 6 [_Cutoff]
Vector 4 [_LightColor0]
Vector 3 [_WorldSpaceLightPos0]
SetTexture 0 [_LightTexture0] 2D 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_BumpMap] 2D 2
"ps_2_0
def c7, 2, -1, 0, 1
dcl t0
dcl_pp t1.xyz
dcl_pp t2.xyz
dcl_pp t3.xyz
dcl t4.xyz
dcl_2d s0
dcl_2d s1
dcl_2d s2
texld r0, t0, s1
mov r1.w, c5.w
mad_pp r1, r0.w, r1.w, -c6.x
mul_pp r0, r0, c5
mov r2.x, t0.z
mov r2.y, t0.w
mov r3.xyz, t4
mov_pp r3.w, c7.w
dp4_pp r4.x, c0, r3
dp4_pp r4.y, c1, r3
dp4_pp r4.z, c2, r3
dp3_pp r3.xy, r4, r4
texkill r1
texld_pp r1, r2, s2
texld_pp r2, r3, s0
add r3.xyz, -t4, c3
nrm_pp r4.xyz, r3
mad_pp r3.x, r1.w, c7.x, c7.y
mad_pp r3.y, r1.y, c7.x, c7.y
dp2add_sat_pp r3.w, r3, r3, c7.z
add_pp r3.w, -r3.w, c7.w
rsq_pp r3.w, r3.w
rcp_pp r3.z, r3.w
dp3_pp r1.x, t1, r3
dp3_pp r1.y, t2, r3
dp3_pp r1.z, t3, r3
dp3_pp r1.x, r1, r4
max_pp r2.y, r1.x, c7.z
mul_pp r1.xyz, r2.x, c4
mul_pp r1.xyz, r0, r1
mul_pp r0.xyz, r2.y, r1
mov_pp oC0, r0

"
}
SubProgram "d3d11 " {
// Stats: 25 math, 3 textures
Keywords { "POINT" }
SetTexture 0 [_MainTex] 2D 1
SetTexture 1 [_BumpMap] 2D 2
SetTexture 2 [_LightTexture0] 2D 0
ConstBuffer "$Globals" 272
Matrix 144 [_LightMatrix0]
Vector 96 [_LightColor0]
Vector 208 [_Color]
Float 256 [_Cutoff]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
"ps_4_0
eefiecedaeelhjpckdcjmkhhffbmcbobmlnbdngmabaaaaaajaafaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefchaaeaaaa
eaaaaaaabmabaaaafjaaaaaeegiocaaaaaaaaaaabbaaaaaafjaaaaaeegiocaaa
abaaaaaaabaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaa
fkaaaaadaagabaaaacaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaae
aahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaagcbaaaad
pcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaa
gcbaaaadhcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagfaaaaadpccabaaa
aaaaaaaagiaaaaacaeaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaaabaaaaaa
eghobaaaaaaaaaaaaagabaaaabaaaaaadcaaaaambcaabaaaabaaaaaadkaabaaa
aaaaaaaadkiacaaaaaaaaaaaanaaaaaaakiacaiaebaaaaaaaaaaaaaabaaaaaaa
diaaaaaipcaabaaaaaaaaaaaegaobaaaaaaaaaaaegiocaaaaaaaaaaaanaaaaaa
dbaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaaaaanaaaead
akaabaaaabaaaaaaaaaaaaajhcaabaaaabaaaaaaegbcbaiaebaaaaaaafaaaaaa
egiccaaaabaaaaaaaaaaaaaabaaaaaahicaabaaaabaaaaaaegacbaaaabaaaaaa
egacbaaaabaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaah
hcaabaaaabaaaaaapgapbaaaabaaaaaaegacbaaaabaaaaaaefaaaaajpcaabaaa
acaaaaaaogbkbaaaabaaaaaaeghobaaaabaaaaaaaagabaaaacaaaaaadcaaaaap
dcaabaaaacaaaaaahgapbaaaacaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaaa
aaaaaaaaaceaaaaaaaaaialpaaaaialpaaaaaaaaaaaaaaaaapaaaaahicaabaaa
abaaaaaaegaabaaaacaaaaaaegaabaaaacaaaaaaddaaaaahicaabaaaabaaaaaa
dkaabaaaabaaaaaaabeaaaaaaaaaiadpaaaaaaaiicaabaaaabaaaaaadkaabaia
ebaaaaaaabaaaaaaabeaaaaaaaaaiadpelaaaaafecaabaaaacaaaaaadkaabaaa
abaaaaaabaaaaaahbcaabaaaadaaaaaaegbcbaaaacaaaaaaegacbaaaacaaaaaa
baaaaaahccaabaaaadaaaaaaegbcbaaaadaaaaaaegacbaaaacaaaaaabaaaaaah
ecaabaaaadaaaaaaegbcbaaaaeaaaaaaegacbaaaacaaaaaabaaaaaahbcaabaaa
abaaaaaaegacbaaaadaaaaaaegacbaaaabaaaaaadeaaaaahbcaabaaaabaaaaaa
akaabaaaabaaaaaaabeaaaaaaaaaaaaadiaaaaaiocaabaaaabaaaaaafgbfbaaa
afaaaaaaagijcaaaaaaaaaaaakaaaaaadcaaaaakocaabaaaabaaaaaaagijcaaa
aaaaaaaaajaaaaaaagbabaaaafaaaaaafgaobaaaabaaaaaadcaaaaakocaabaaa
abaaaaaaagijcaaaaaaaaaaaalaaaaaakgbkbaaaafaaaaaafgaobaaaabaaaaaa
aaaaaaaiocaabaaaabaaaaaafgaobaaaabaaaaaaagijcaaaaaaaaaaaamaaaaaa
baaaaaahccaabaaaabaaaaaajgahbaaaabaaaaaajgahbaaaabaaaaaaefaaaaaj
pcaabaaaacaaaaaafgafbaaaabaaaaaaeghobaaaacaaaaaaaagabaaaaaaaaaaa
diaaaaaiocaabaaaabaaaaaaagaabaaaacaaaaaaagijcaaaaaaaaaaaagaaaaaa
diaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaajgahbaaaabaaaaaadgaaaaaf
iccabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhccabaaaaaaaaaaaagaabaaa
abaaaaaaegacbaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 25 math, 3 textures
Keywords { "POINT" }
SetTexture 0 [_MainTex] 2D 1
SetTexture 1 [_BumpMap] 2D 2
SetTexture 2 [_LightTexture0] 2D 0
ConstBuffer "$Globals" 272
Matrix 144 [_LightMatrix0]
Vector 96 [_LightColor0]
Vector 208 [_Color]
Float 256 [_Cutoff]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
"ps_4_0_level_9_1
eefiecednbiihajfnpjgaimaiaekpljdpgmdpfbhabaaaaaagaaiaaaaaeaaaaaa
daaaaaaapmacaaaaheahaaaacmaiaaaaebgpgodjmeacaaaameacaaaaaaacpppp
geacaaaagaaaaaaaaeaadaaaaaaagaaaaaaagaaaadaaceaaaaaagaaaacaaaaaa
aaababaaabacacaaaaaaagaaabaaaaaaaaaaaaaaaaaaajaaafaaabaaaaaaaaaa
aaaabaaaabaaagaaaaaaaaaaabaaaaaaabaaahaaaaaaaaaaaaacppppfbaaaaaf
aiaaapkaaaaaaaeaaaaaialpaaaaaaaaaaaaiadpbpaaaaacaaaaaaiaaaaaapla
bpaaaaacaaaaaaiaabaachlabpaaaaacaaaaaaiaacaachlabpaaaaacaaaaaaia
adaachlabpaaaaacaaaaaaiaaeaaahlabpaaaaacaaaaaajaaaaiapkabpaaaaac
aaaaaajaabaiapkabpaaaaacaaaaaajaacaiapkaecaaaaadaaaaapiaaaaaoela
abaioekaabaaaaacabaaaiiaafaappkaaeaaaaaeabaacpiaaaaappiaabaappia
agaaaakbafaaaaadaaaacpiaaaaaoeiaafaaoekaabaaaaacacaaabiaaaaakkla
abaaaaacacaaaciaaaaapplaafaaaaadadaachiaaeaafflaacaaoekaaeaaaaae
adaachiaabaaoekaaeaaaalaadaaoeiaaeaaaaaeadaachiaadaaoekaaeaakkla
adaaoeiaacaaaaadadaachiaadaaoeiaaeaaoekaaiaaaaadadaacdiaadaaoeia
adaaoeiaebaaaaababaaapiaecaaaaadabaacpiaacaaoeiaacaioekaecaaaaad
acaacpiaadaaoeiaaaaioekaacaaaaadadaaahiaaeaaoelbahaaoekaceaaaaac
aeaachiaadaaoeiaaeaaaaaeadaacbiaabaappiaaiaaaakaaiaaffkaaeaaaaae
adaacciaabaaffiaaiaaaakaaiaaffkafkaaaaaeadaadiiaadaaoeiaadaaoeia
aiaakkkaacaaaaadadaaciiaadaappibaiaappkaahaaaaacadaaciiaadaappia
agaaaaacadaaceiaadaappiaaiaaaaadabaacbiaabaaoelaadaaoeiaaiaaaaad
abaacciaacaaoelaadaaoeiaaiaaaaadabaaceiaadaaoelaadaaoeiaaiaaaaad
abaacbiaabaaoeiaaeaaoeiaalaaaaadacaacciaabaaaaiaaiaakkkaafaaaaad
abaachiaacaaaaiaaaaaoekaafaaaaadabaachiaaaaaoeiaabaaoeiaafaaaaad
aaaachiaacaaffiaabaaoeiaabaaaaacaaaicpiaaaaaoeiappppaaaafdeieefc
haaeaaaaeaaaaaaabmabaaaafjaaaaaeegiocaaaaaaaaaaabbaaaaaafjaaaaae
egiocaaaabaaaaaaabaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaa
abaaaaaafkaaaaadaagabaaaacaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaa
fibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaa
gcbaaaadpcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaa
adaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagfaaaaad
pccabaaaaaaaaaaagiaaaaacaeaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaa
abaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaadcaaaaambcaabaaaabaaaaaa
dkaabaaaaaaaaaaadkiacaaaaaaaaaaaanaaaaaaakiacaiaebaaaaaaaaaaaaaa
baaaaaaadiaaaaaipcaabaaaaaaaaaaaegaobaaaaaaaaaaaegiocaaaaaaaaaaa
anaaaaaadbaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaaaa
anaaaeadakaabaaaabaaaaaaaaaaaaajhcaabaaaabaaaaaaegbcbaiaebaaaaaa
afaaaaaaegiccaaaabaaaaaaaaaaaaaabaaaaaahicaabaaaabaaaaaaegacbaaa
abaaaaaaegacbaaaabaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaa
diaaaaahhcaabaaaabaaaaaapgapbaaaabaaaaaaegacbaaaabaaaaaaefaaaaaj
pcaabaaaacaaaaaaogbkbaaaabaaaaaaeghobaaaabaaaaaaaagabaaaacaaaaaa
dcaaaaapdcaabaaaacaaaaaahgapbaaaacaaaaaaaceaaaaaaaaaaaeaaaaaaaea
aaaaaaaaaaaaaaaaaceaaaaaaaaaialpaaaaialpaaaaaaaaaaaaaaaaapaaaaah
icaabaaaabaaaaaaegaabaaaacaaaaaaegaabaaaacaaaaaaddaaaaahicaabaaa
abaaaaaadkaabaaaabaaaaaaabeaaaaaaaaaiadpaaaaaaaiicaabaaaabaaaaaa
dkaabaiaebaaaaaaabaaaaaaabeaaaaaaaaaiadpelaaaaafecaabaaaacaaaaaa
dkaabaaaabaaaaaabaaaaaahbcaabaaaadaaaaaaegbcbaaaacaaaaaaegacbaaa
acaaaaaabaaaaaahccaabaaaadaaaaaaegbcbaaaadaaaaaaegacbaaaacaaaaaa
baaaaaahecaabaaaadaaaaaaegbcbaaaaeaaaaaaegacbaaaacaaaaaabaaaaaah
bcaabaaaabaaaaaaegacbaaaadaaaaaaegacbaaaabaaaaaadeaaaaahbcaabaaa
abaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaaaadiaaaaaiocaabaaaabaaaaaa
fgbfbaaaafaaaaaaagijcaaaaaaaaaaaakaaaaaadcaaaaakocaabaaaabaaaaaa
agijcaaaaaaaaaaaajaaaaaaagbabaaaafaaaaaafgaobaaaabaaaaaadcaaaaak
ocaabaaaabaaaaaaagijcaaaaaaaaaaaalaaaaaakgbkbaaaafaaaaaafgaobaaa
abaaaaaaaaaaaaaiocaabaaaabaaaaaafgaobaaaabaaaaaaagijcaaaaaaaaaaa
amaaaaaabaaaaaahccaabaaaabaaaaaajgahbaaaabaaaaaajgahbaaaabaaaaaa
efaaaaajpcaabaaaacaaaaaafgafbaaaabaaaaaaeghobaaaacaaaaaaaagabaaa
aaaaaaaadiaaaaaiocaabaaaabaaaaaaagaabaaaacaaaaaaagijcaaaaaaaaaaa
agaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaajgahbaaaabaaaaaa
dgaaaaaficcabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhccabaaaaaaaaaaa
agaabaaaabaaaaaaegacbaaaaaaaaaaadoaaaaabejfdeheolaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapapaaaakeaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahahaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahahaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" }
"!!GLSL"
}
SubProgram "d3d9 " {
// Stats: 20 math, 3 textures
Keywords { "DIRECTIONAL" }
Vector 2 [_Color]
Float 3 [_Cutoff]
Vector 1 [_LightColor0]
Vector 0 [_WorldSpaceLightPos0]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_BumpMap] 2D 1
"ps_2_0
def c4, 2, -1, 0, 1
dcl t0
dcl_pp t1.xyz
dcl_pp t2.xyz
dcl_pp t3.xyz
dcl_2d s0
dcl_2d s1
texld r0, t0, s0
mov r1.w, c2.w
mad_pp r1, r0.w, r1.w, -c3.x
mul_pp r0, r0, c2
mov r2.x, t0.z
mov r2.y, t0.w
texkill r1
texld_pp r1, r2, s1
mad_pp r2.x, r1.w, c4.x, c4.y
mad_pp r2.y, r1.y, c4.x, c4.y
dp2add_sat_pp r2.w, r2, r2, c4.z
add_pp r2.w, -r2.w, c4.w
rsq_pp r2.w, r2.w
rcp_pp r2.z, r2.w
dp3_pp r1.x, t1, r2
dp3_pp r1.y, t2, r2
dp3_pp r1.z, t3, r2
dp3_pp r1.x, r1, c0
max_pp r2.x, r1.x, c4.z
mul_pp r1.xyz, r0, c1
mul_pp r0.xyz, r2.x, r1
mov_pp oC0, r0

"
}
SubProgram "d3d11 " {
// Stats: 15 math, 2 textures
Keywords { "DIRECTIONAL" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_BumpMap] 2D 1
ConstBuffer "$Globals" 208
Vector 96 [_LightColor0]
Vector 144 [_Color]
Float 192 [_Cutoff]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
"ps_4_0
eefiecedhemoalkoojpnndnfpibkkgbbjpgfonpgabaaaaaabaaeaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcpaacaaaa
eaaaaaaalmaaaaaafjaaaaaeegiocaaaaaaaaaaaanaaaaaafjaaaaaeegiocaaa
abaaaaaaabaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaa
fibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaa
gcbaaaadpcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaa
adaaaaaagcbaaaadhcbabaaaaeaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
adaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaa
aagabaaaaaaaaaaadcaaaaambcaabaaaabaaaaaadkaabaaaaaaaaaaadkiacaaa
aaaaaaaaajaaaaaaakiacaiaebaaaaaaaaaaaaaaamaaaaaadiaaaaaipcaabaaa
aaaaaaaaegaobaaaaaaaaaaaegiocaaaaaaaaaaaajaaaaaadbaaaaahbcaabaaa
abaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaaaaanaaaeadakaabaaaabaaaaaa
efaaaaajpcaabaaaabaaaaaaogbkbaaaabaaaaaaeghobaaaabaaaaaaaagabaaa
abaaaaaadcaaaaapdcaabaaaabaaaaaahgapbaaaabaaaaaaaceaaaaaaaaaaaea
aaaaaaeaaaaaaaaaaaaaaaaaaceaaaaaaaaaialpaaaaialpaaaaaaaaaaaaaaaa
apaaaaahicaabaaaabaaaaaaegaabaaaabaaaaaaegaabaaaabaaaaaaddaaaaah
icaabaaaabaaaaaadkaabaaaabaaaaaaabeaaaaaaaaaiadpaaaaaaaiicaabaaa
abaaaaaadkaabaiaebaaaaaaabaaaaaaabeaaaaaaaaaiadpelaaaaafecaabaaa
abaaaaaadkaabaaaabaaaaaabaaaaaahbcaabaaaacaaaaaaegbcbaaaacaaaaaa
egacbaaaabaaaaaabaaaaaahccaabaaaacaaaaaaegbcbaaaadaaaaaaegacbaaa
abaaaaaabaaaaaahecaabaaaacaaaaaaegbcbaaaaeaaaaaaegacbaaaabaaaaaa
baaaaaaibcaabaaaabaaaaaaegacbaaaacaaaaaaegiccaaaabaaaaaaaaaaaaaa
deaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaaaadiaaaaai
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaaaaaaaaaaagaaaaaadgaaaaaf
iccabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhccabaaaaaaaaaaaagaabaaa
abaaaaaaegacbaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 15 math, 2 textures
Keywords { "DIRECTIONAL" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_BumpMap] 2D 1
ConstBuffer "$Globals" 208
Vector 96 [_LightColor0]
Vector 144 [_Color]
Float 192 [_Cutoff]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
"ps_4_0_level_9_1
eefiecedebfmlkppfccjlkdpfjkomfjoldbnejplabaaaaaadaagaaaaaeaaaaaa
daaaaaaaemacaaaaeeafaaaapmafaaaaebgpgodjbeacaaaabeacaaaaaaacpppp
liabaaaafmaaaaaaaeaacmaaaaaafmaaaaaafmaaacaaceaaaaaafmaaaaaaaaaa
abababaaaaaaagaaabaaaaaaaaaaaaaaaaaaajaaabaaabaaaaaaaaaaaaaaamaa
abaaacaaaaaaaaaaabaaaaaaabaaadaaaaaaaaaaaaacppppfbaaaaafaeaaapka
aaaaaaeaaaaaialpaaaaaaaaaaaaiadpbpaaaaacaaaaaaiaaaaaaplabpaaaaac
aaaaaaiaabaachlabpaaaaacaaaaaaiaacaachlabpaaaaacaaaaaaiaadaachla
bpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaajaabaiapkaecaaaaadaaaaapia
aaaaoelaaaaioekaabaaaaacabaaaiiaabaappkaaeaaaaaeabaacpiaaaaappia
abaappiaacaaaakbafaaaaadaaaacpiaaaaaoeiaabaaoekaabaaaaacacaaabia
aaaakklaabaaaaacacaaaciaaaaapplaebaaaaababaaapiaecaaaaadabaacpia
acaaoeiaabaioekaaeaaaaaeacaacbiaabaappiaaeaaaakaaeaaffkaaeaaaaae
acaacciaabaaffiaaeaaaakaaeaaffkafkaaaaaeacaadiiaacaaoeiaacaaoeia
aeaakkkaacaaaaadacaaciiaacaappibaeaappkaahaaaaacacaaciiaacaappia
agaaaaacacaaceiaacaappiaaiaaaaadabaacbiaabaaoelaacaaoeiaaiaaaaad
abaacciaacaaoelaacaaoeiaaiaaaaadabaaceiaadaaoelaacaaoeiaaiaaaaad
abaacbiaabaaoeiaadaaoekaalaaaaadacaacbiaabaaaaiaaeaakkkaafaaaaad
abaachiaaaaaoeiaaaaaoekaafaaaaadaaaachiaacaaaaiaabaaoeiaabaaaaac
aaaicpiaaaaaoeiappppaaaafdeieefcpaacaaaaeaaaaaaalmaaaaaafjaaaaae
egiocaaaaaaaaaaaanaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafkaaaaad
aagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafibiaaaeaahabaaaaaaaaaaa
ffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaa
gcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaa
aeaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaaefaaaaajpcaabaaa
aaaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaadcaaaaam
bcaabaaaabaaaaaadkaabaaaaaaaaaaadkiacaaaaaaaaaaaajaaaaaaakiacaia
ebaaaaaaaaaaaaaaamaaaaaadiaaaaaipcaabaaaaaaaaaaaegaobaaaaaaaaaaa
egiocaaaaaaaaaaaajaaaaaadbaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaa
abeaaaaaaaaaaaaaanaaaeadakaabaaaabaaaaaaefaaaaajpcaabaaaabaaaaaa
ogbkbaaaabaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaadcaaaaapdcaabaaa
abaaaaaahgapbaaaabaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaa
aceaaaaaaaaaialpaaaaialpaaaaaaaaaaaaaaaaapaaaaahicaabaaaabaaaaaa
egaabaaaabaaaaaaegaabaaaabaaaaaaddaaaaahicaabaaaabaaaaaadkaabaaa
abaaaaaaabeaaaaaaaaaiadpaaaaaaaiicaabaaaabaaaaaadkaabaiaebaaaaaa
abaaaaaaabeaaaaaaaaaiadpelaaaaafecaabaaaabaaaaaadkaabaaaabaaaaaa
baaaaaahbcaabaaaacaaaaaaegbcbaaaacaaaaaaegacbaaaabaaaaaabaaaaaah
ccaabaaaacaaaaaaegbcbaaaadaaaaaaegacbaaaabaaaaaabaaaaaahecaabaaa
acaaaaaaegbcbaaaaeaaaaaaegacbaaaabaaaaaabaaaaaaibcaabaaaabaaaaaa
egacbaaaacaaaaaaegiccaaaabaaaaaaaaaaaaaadeaaaaahbcaabaaaabaaaaaa
akaabaaaabaaaaaaabeaaaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegiccaaaaaaaaaaaagaaaaaadgaaaaaficcabaaaaaaaaaaadkaabaaa
aaaaaaaadiaaaaahhccabaaaaaaaaaaaagaabaaaabaaaaaaegacbaaaaaaaaaaa
doaaaaabejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
apapaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaakeaaaaaa
acaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaahahaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaa
ahaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "SPOT" }
"!!GLSL"
}
SubProgram "d3d9 " {
// Stats: 36 math, 5 textures
Keywords { "SPOT" }
Matrix 0 [_LightMatrix0]
Vector 6 [_Color]
Float 7 [_Cutoff]
Vector 5 [_LightColor0]
Vector 4 [_WorldSpaceLightPos0]
SetTexture 0 [_LightTexture0] 2D 0
SetTexture 1 [_LightTextureB0] 2D 1
SetTexture 2 [_MainTex] 2D 2
SetTexture 3 [_BumpMap] 2D 3
"ps_2_0
def c8, 2, -1, 0, 1
def c9, 0.5, 0, 0, 0
dcl t0
dcl_pp t1.xyz
dcl_pp t2.xyz
dcl_pp t3.xyz
dcl t4.xyz
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
texld r0, t0, s2
mov r1.w, c6.w
mad_pp r1, r0.w, r1.w, -c7.x
mul_pp r0, r0, c6
mov r2.xyz, t4
mov r2.w, c8.w
dp4_pp r3.x, c0, r2
dp4_pp r3.y, c1, r2
dp4_pp r3.z, c2, r2
dp4_pp r3.w, c3, r2
rcp r3.w, r3.w
mad_pp r2.xy, r3, r3.w, c9.x
dp3_pp r3.xy, r3, r3
mov r4.x, t0.z
mov r4.y, t0.w
texkill r1
texld_pp r1, r2, s0
texld_pp r2, r3, s1
texld_pp r4, r4, s3
mul r1.x, r1.w, r2.x
mul_pp r1.xyz, r1.x, c5
cmp_pp r1.xyz, -r3.z, c8.z, r1
mul_pp r1.xyz, r0, r1
add r2.xyz, -t4, c4
nrm_pp r3.xyz, r2
mad_pp r2.x, r4.w, c8.x, c8.y
mad_pp r2.y, r4.y, c8.x, c8.y
dp2add_sat_pp r1.w, r2, r2, c8.z
add_pp r1.w, -r1.w, c8.w
rsq_pp r1.w, r1.w
rcp_pp r2.z, r1.w
dp3_pp r4.x, t1, r2
dp3_pp r4.y, t2, r2
dp3_pp r4.z, t3, r2
dp3_pp r1.w, r4, r3
max_pp r2.x, r1.w, c8.z
mul_pp r0.xyz, r1, r2.x
mov_pp oC0, r0

"
}
SubProgram "d3d11 " {
// Stats: 31 math, 4 textures
Keywords { "SPOT" }
SetTexture 0 [_MainTex] 2D 2
SetTexture 1 [_BumpMap] 2D 3
SetTexture 2 [_LightTexture0] 2D 0
SetTexture 3 [_LightTextureB0] 2D 1
ConstBuffer "$Globals" 272
Matrix 144 [_LightMatrix0]
Vector 96 [_LightColor0]
Vector 208 [_Color]
Float 256 [_Cutoff]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
"ps_4_0
eefiecedmjcolbhnmngcfchgoacbaojaijnbcafiabaaaaaaieagaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcgeafaaaa
eaaaaaaafjabaaaafjaaaaaeegiocaaaaaaaaaaabbaaaaaafjaaaaaeegiocaaa
abaaaaaaabaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaa
fkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaa
acaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaagcbaaaadpcbabaaa
abaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaad
hcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaa
giaaaaacaeaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaa
aaaaaaaaaagabaaaacaaaaaadcaaaaambcaabaaaabaaaaaadkaabaaaaaaaaaaa
dkiacaaaaaaaaaaaanaaaaaaakiacaiaebaaaaaaaaaaaaaabaaaaaaadiaaaaai
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaegiocaaaaaaaaaaaanaaaaaadbaaaaah
bcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaaaaanaaaeadakaabaaa
abaaaaaadiaaaaaipcaabaaaabaaaaaafgbfbaaaafaaaaaaegiocaaaaaaaaaaa
akaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaaaaaaaaaajaaaaaaagbabaaa
afaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaaaaaaaaa
alaaaaaakgbkbaaaafaaaaaaegaobaaaabaaaaaaaaaaaaaipcaabaaaabaaaaaa
egaobaaaabaaaaaaegiocaaaaaaaaaaaamaaaaaaaoaaaaahdcaabaaaacaaaaaa
egaabaaaabaaaaaapgapbaaaabaaaaaaaaaaaaakdcaabaaaacaaaaaaegaabaaa
acaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaaefaaaaajpcaabaaa
acaaaaaaegaabaaaacaaaaaaeghobaaaacaaaaaaaagabaaaaaaaaaaadbaaaaah
icaabaaaabaaaaaaabeaaaaaaaaaaaaackaabaaaabaaaaaabaaaaaahbcaabaaa
abaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaefaaaaajpcaabaaaadaaaaaa
agaabaaaabaaaaaaeghobaaaadaaaaaaaagabaaaabaaaaaaabaaaaahbcaabaaa
abaaaaaadkaabaaaabaaaaaaabeaaaaaaaaaiadpdiaaaaahbcaabaaaabaaaaaa
dkaabaaaacaaaaaaakaabaaaabaaaaaadiaaaaahbcaabaaaabaaaaaaakaabaaa
adaaaaaaakaabaaaabaaaaaadiaaaaaihcaabaaaabaaaaaaagaabaaaabaaaaaa
egiccaaaaaaaaaaaagaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egacbaaaabaaaaaadgaaaaaficcabaaaaaaaaaaadkaabaaaaaaaaaaaaaaaaaaj
hcaabaaaabaaaaaaegbcbaiaebaaaaaaafaaaaaaegiccaaaabaaaaaaaaaaaaaa
baaaaaahicaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaaf
icaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaapgapbaaa
aaaaaaaaegacbaaaabaaaaaaefaaaaajpcaabaaaacaaaaaaogbkbaaaabaaaaaa
eghobaaaabaaaaaaaagabaaaadaaaaaadcaaaaapdcaabaaaacaaaaaahgapbaaa
acaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaaaceaaaaaaaaaialp
aaaaialpaaaaaaaaaaaaaaaaapaaaaahicaabaaaaaaaaaaaegaabaaaacaaaaaa
egaabaaaacaaaaaaddaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaa
aaaaiadpaaaaaaaiicaabaaaaaaaaaaadkaabaiaebaaaaaaaaaaaaaaabeaaaaa
aaaaiadpelaaaaafecaabaaaacaaaaaadkaabaaaaaaaaaaabaaaaaahbcaabaaa
adaaaaaaegbcbaaaacaaaaaaegacbaaaacaaaaaabaaaaaahccaabaaaadaaaaaa
egbcbaaaadaaaaaaegacbaaaacaaaaaabaaaaaahecaabaaaadaaaaaaegbcbaaa
aeaaaaaaegacbaaaacaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaadaaaaaa
egacbaaaabaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaa
aaaaaaaadiaaaaahhccabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaa
doaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 31 math, 4 textures
Keywords { "SPOT" }
SetTexture 0 [_MainTex] 2D 2
SetTexture 1 [_BumpMap] 2D 3
SetTexture 2 [_LightTexture0] 2D 0
SetTexture 3 [_LightTextureB0] 2D 1
ConstBuffer "$Globals" 272
Matrix 144 [_LightMatrix0]
Vector 96 [_LightColor0]
Vector 208 [_Color]
Float 256 [_Cutoff]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
"ps_4_0_level_9_1
eefiecedgpddklmmbjgmcinigbmhgjobecfblnojabaaaaaanaajaaaaaeaaaaaa
daaaaaaahiadaaaaoeaiaaaajmajaaaaebgpgodjeaadaaaaeaadaaaaaaacpppp
nmacaaaageaaaaaaaeaadeaaaaaageaaaaaageaaaeaaceaaaaaageaaacaaaaaa
adababaaaaacacaaabadadaaaaaaagaaabaaaaaaaaaaaaaaaaaaajaaafaaabaa
aaaaaaaaaaaabaaaabaaagaaaaaaaaaaabaaaaaaabaaahaaaaaaaaaaaaacpppp
fbaaaaafaiaaapkaaaaaaaeaaaaaialpaaaaaaaaaaaaiadpfbaaaaafajaaapka
aaaaaadpaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaaplabpaaaaac
aaaaaaiaabaachlabpaaaaacaaaaaaiaacaachlabpaaaaacaaaaaaiaadaachla
bpaaaaacaaaaaaiaaeaaahlabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaaja
abaiapkabpaaaaacaaaaaajaacaiapkabpaaaaacaaaaaajaadaiapkaecaaaaad
aaaaapiaaaaaoelaacaioekaabaaaaacabaaaiiaafaappkaaeaaaaaeabaacpia
aaaappiaabaappiaagaaaakbafaaaaadaaaacpiaaaaaoeiaafaaoekaafaaaaad
acaacpiaaeaafflaacaaoekaaeaaaaaeacaacpiaabaaoekaaeaaaalaacaaoeia
aeaaaaaeacaacpiaadaaoekaaeaakklaacaaoeiaacaaaaadacaacpiaacaaoeia
aeaaoekaagaaaaacacaaaiiaacaappiaaeaaaaaeadaacdiaacaaoeiaacaappia
ajaaaakaaiaaaaadacaacdiaacaaoeiaacaaoeiaabaaaaacaeaaabiaaaaakkla
abaaaaacaeaaaciaaaaapplaebaaaaababaaapiaecaaaaadabaacpiaadaaoeia
aaaioekaecaaaaadadaacpiaacaaoeiaabaioekaecaaaaadaeaacpiaaeaaoeia
adaioekaafaaaaadabaaabiaabaappiaadaaaaiaafaaaaadabaachiaabaaaaia
aaaaoekafiaaaaaeabaachiaacaakkibaiaakkkaabaaoeiaafaaaaadabaachia
aaaaoeiaabaaoeiaacaaaaadacaaahiaaeaaoelbahaaoekaceaaaaacadaachia
acaaoeiaaeaaaaaeacaacbiaaeaappiaaiaaaakaaiaaffkaaeaaaaaeacaaccia
aeaaffiaaiaaaakaaiaaffkafkaaaaaeabaadiiaacaaoeiaacaaoeiaaiaakkka
acaaaaadabaaciiaabaappibaiaappkaahaaaaacabaaciiaabaappiaagaaaaac
acaaceiaabaappiaaiaaaaadaeaacbiaabaaoelaacaaoeiaaiaaaaadaeaaccia
acaaoelaacaaoeiaaiaaaaadaeaaceiaadaaoelaacaaoeiaaiaaaaadabaaciia
aeaaoeiaadaaoeiaalaaaaadacaacbiaabaappiaaiaakkkaafaaaaadaaaachia
abaaoeiaacaaaaiaabaaaaacaaaicpiaaaaaoeiappppaaaafdeieefcgeafaaaa
eaaaaaaafjabaaaafjaaaaaeegiocaaaaaaaaaaabbaaaaaafjaaaaaeegiocaaa
abaaaaaaabaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaa
fkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaa
acaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaagcbaaaadpcbabaaa
abaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaad
hcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaa
giaaaaacaeaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaa
aaaaaaaaaagabaaaacaaaaaadcaaaaambcaabaaaabaaaaaadkaabaaaaaaaaaaa
dkiacaaaaaaaaaaaanaaaaaaakiacaiaebaaaaaaaaaaaaaabaaaaaaadiaaaaai
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaegiocaaaaaaaaaaaanaaaaaadbaaaaah
bcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaaaaanaaaeadakaabaaa
abaaaaaadiaaaaaipcaabaaaabaaaaaafgbfbaaaafaaaaaaegiocaaaaaaaaaaa
akaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaaaaaaaaaajaaaaaaagbabaaa
afaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaaaaaaaaa
alaaaaaakgbkbaaaafaaaaaaegaobaaaabaaaaaaaaaaaaaipcaabaaaabaaaaaa
egaobaaaabaaaaaaegiocaaaaaaaaaaaamaaaaaaaoaaaaahdcaabaaaacaaaaaa
egaabaaaabaaaaaapgapbaaaabaaaaaaaaaaaaakdcaabaaaacaaaaaaegaabaaa
acaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaaefaaaaajpcaabaaa
acaaaaaaegaabaaaacaaaaaaeghobaaaacaaaaaaaagabaaaaaaaaaaadbaaaaah
icaabaaaabaaaaaaabeaaaaaaaaaaaaackaabaaaabaaaaaabaaaaaahbcaabaaa
abaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaefaaaaajpcaabaaaadaaaaaa
agaabaaaabaaaaaaeghobaaaadaaaaaaaagabaaaabaaaaaaabaaaaahbcaabaaa
abaaaaaadkaabaaaabaaaaaaabeaaaaaaaaaiadpdiaaaaahbcaabaaaabaaaaaa
dkaabaaaacaaaaaaakaabaaaabaaaaaadiaaaaahbcaabaaaabaaaaaaakaabaaa
adaaaaaaakaabaaaabaaaaaadiaaaaaihcaabaaaabaaaaaaagaabaaaabaaaaaa
egiccaaaaaaaaaaaagaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egacbaaaabaaaaaadgaaaaaficcabaaaaaaaaaaadkaabaaaaaaaaaaaaaaaaaaj
hcaabaaaabaaaaaaegbcbaiaebaaaaaaafaaaaaaegiccaaaabaaaaaaaaaaaaaa
baaaaaahicaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaaf
icaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaapgapbaaa
aaaaaaaaegacbaaaabaaaaaaefaaaaajpcaabaaaacaaaaaaogbkbaaaabaaaaaa
eghobaaaabaaaaaaaagabaaaadaaaaaadcaaaaapdcaabaaaacaaaaaahgapbaaa
acaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaaaceaaaaaaaaaialp
aaaaialpaaaaaaaaaaaaaaaaapaaaaahicaabaaaaaaaaaaaegaabaaaacaaaaaa
egaabaaaacaaaaaaddaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaa
aaaaiadpaaaaaaaiicaabaaaaaaaaaaadkaabaiaebaaaaaaaaaaaaaaabeaaaaa
aaaaiadpelaaaaafecaabaaaacaaaaaadkaabaaaaaaaaaaabaaaaaahbcaabaaa
adaaaaaaegbcbaaaacaaaaaaegacbaaaacaaaaaabaaaaaahccaabaaaadaaaaaa
egbcbaaaadaaaaaaegacbaaaacaaaaaabaaaaaahecaabaaaadaaaaaaegbcbaaa
aeaaaaaaegacbaaaacaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaadaaaaaa
egacbaaaabaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaa
aaaaaaaadiaaaaahhccabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaa
doaaaaabejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
apapaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaakeaaaaaa
acaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaahahaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaa
ahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "POINT_COOKIE" }
"!!GLSL"
}
SubProgram "d3d9 " {
// Stats: 32 math, 5 textures
Keywords { "POINT_COOKIE" }
Matrix 0 [_LightMatrix0] 3
Vector 5 [_Color]
Float 6 [_Cutoff]
Vector 4 [_LightColor0]
Vector 3 [_WorldSpaceLightPos0]
SetTexture 0 [_LightTexture0] CUBE 0
SetTexture 1 [_LightTextureB0] 2D 1
SetTexture 2 [_MainTex] 2D 2
SetTexture 3 [_BumpMap] 2D 3
"ps_2_0
def c7, 2, -1, 0, 1
dcl t0
dcl_pp t1.xyz
dcl_pp t2.xyz
dcl_pp t3.xyz
dcl t4.xyz
dcl_cube s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
texld r0, t0, s2
mov r1.w, c5.w
mad_pp r1, r0.w, r1.w, -c6.x
mul_pp r0, r0, c5
mov r2.x, t0.z
mov r2.y, t0.w
mov r3.xyz, t4
mov_pp r3.w, c7.w
dp4_pp r4.x, c0, r3
dp4_pp r4.y, c1, r3
dp4_pp r4.z, c2, r3
dp3_pp r3.xy, r4, r4
texkill r1
texld_pp r1, r2, s3
texld r2, r4, s0
texld r3, r3, s1
add r2.xyz, -t4, c3
nrm_pp r4.xyz, r2
mad_pp r2.x, r1.w, c7.x, c7.y
mad_pp r2.y, r1.y, c7.x, c7.y
dp2add_sat_pp r4.w, r2, r2, c7.z
add_pp r4.w, -r4.w, c7.w
rsq_pp r4.w, r4.w
rcp_pp r2.z, r4.w
dp3_pp r1.x, t1, r2
dp3_pp r1.y, t2, r2
dp3_pp r1.z, t3, r2
dp3_pp r1.x, r1, r4
max_pp r2.x, r1.x, c7.z
mul_pp r1.x, r2.w, r3.x
mul_pp r1.xyz, r1.x, c4
mul_pp r1.xyz, r0, r1
mul_pp r0.xyz, r2.x, r1
mov_pp oC0, r0

"
}
SubProgram "d3d11 " {
// Stats: 26 math, 4 textures
Keywords { "POINT_COOKIE" }
SetTexture 0 [_MainTex] 2D 2
SetTexture 1 [_BumpMap] 2D 3
SetTexture 2 [_LightTextureB0] 2D 1
SetTexture 3 [_LightTexture0] CUBE 0
ConstBuffer "$Globals" 272
Matrix 144 [_LightMatrix0]
Vector 96 [_LightColor0]
Vector 208 [_Color]
Float 256 [_Cutoff]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
"ps_4_0
eefiecedfkbcancbmgfmpldfkcgoimiiekmpngamabaaaaaaomafaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcmmaeaaaa
eaaaaaaaddabaaaafjaaaaaeegiocaaaaaaaaaaabbaaaaaafjaaaaaeegiocaaa
abaaaaaaabaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaa
fkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaa
acaaaaaaffffaaaafidaaaaeaahabaaaadaaaaaaffffaaaagcbaaaadpcbabaaa
abaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaad
hcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaa
giaaaaacaeaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaa
aaaaaaaaaagabaaaacaaaaaadcaaaaambcaabaaaabaaaaaadkaabaaaaaaaaaaa
dkiacaaaaaaaaaaaanaaaaaaakiacaiaebaaaaaaaaaaaaaabaaaaaaadiaaaaai
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaegiocaaaaaaaaaaaanaaaaaadbaaaaah
bcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaaaaanaaaeadakaabaaa
abaaaaaaaaaaaaajhcaabaaaabaaaaaaegbcbaiaebaaaaaaafaaaaaaegiccaaa
abaaaaaaaaaaaaaabaaaaaahicaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaa
abaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaahhcaabaaa
abaaaaaapgapbaaaabaaaaaaegacbaaaabaaaaaaefaaaaajpcaabaaaacaaaaaa
ogbkbaaaabaaaaaaeghobaaaabaaaaaaaagabaaaadaaaaaadcaaaaapdcaabaaa
acaaaaaahgapbaaaacaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaa
aceaaaaaaaaaialpaaaaialpaaaaaaaaaaaaaaaaapaaaaahicaabaaaabaaaaaa
egaabaaaacaaaaaaegaabaaaacaaaaaaddaaaaahicaabaaaabaaaaaadkaabaaa
abaaaaaaabeaaaaaaaaaiadpaaaaaaaiicaabaaaabaaaaaadkaabaiaebaaaaaa
abaaaaaaabeaaaaaaaaaiadpelaaaaafecaabaaaacaaaaaadkaabaaaabaaaaaa
baaaaaahbcaabaaaadaaaaaaegbcbaaaacaaaaaaegacbaaaacaaaaaabaaaaaah
ccaabaaaadaaaaaaegbcbaaaadaaaaaaegacbaaaacaaaaaabaaaaaahecaabaaa
adaaaaaaegbcbaaaaeaaaaaaegacbaaaacaaaaaabaaaaaahbcaabaaaabaaaaaa
egacbaaaadaaaaaaegacbaaaabaaaaaadeaaaaahbcaabaaaabaaaaaaakaabaaa
abaaaaaaabeaaaaaaaaaaaaadiaaaaaiocaabaaaabaaaaaafgbfbaaaafaaaaaa
agijcaaaaaaaaaaaakaaaaaadcaaaaakocaabaaaabaaaaaaagijcaaaaaaaaaaa
ajaaaaaaagbabaaaafaaaaaafgaobaaaabaaaaaadcaaaaakocaabaaaabaaaaaa
agijcaaaaaaaaaaaalaaaaaakgbkbaaaafaaaaaafgaobaaaabaaaaaaaaaaaaai
ocaabaaaabaaaaaafgaobaaaabaaaaaaagijcaaaaaaaaaaaamaaaaaabaaaaaah
bcaabaaaacaaaaaajgahbaaaabaaaaaajgahbaaaabaaaaaaefaaaaajpcaabaaa
adaaaaaajgahbaaaabaaaaaaeghobaaaadaaaaaaaagabaaaaaaaaaaaefaaaaaj
pcaabaaaacaaaaaaagaabaaaacaaaaaaeghobaaaacaaaaaaaagabaaaabaaaaaa
diaaaaahccaabaaaabaaaaaadkaabaaaadaaaaaaakaabaaaacaaaaaadiaaaaai
ocaabaaaabaaaaaafgafbaaaabaaaaaaagijcaaaaaaaaaaaagaaaaaadiaaaaah
hcaabaaaaaaaaaaaegacbaaaaaaaaaaajgahbaaaabaaaaaadgaaaaaficcabaaa
aaaaaaaadkaabaaaaaaaaaaadiaaaaahhccabaaaaaaaaaaaagaabaaaabaaaaaa
egacbaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 26 math, 4 textures
Keywords { "POINT_COOKIE" }
SetTexture 0 [_MainTex] 2D 2
SetTexture 1 [_BumpMap] 2D 3
SetTexture 2 [_LightTextureB0] 2D 1
SetTexture 3 [_LightTexture0] CUBE 0
ConstBuffer "$Globals" 272
Matrix 144 [_LightMatrix0]
Vector 96 [_LightColor0]
Vector 208 [_Color]
Float 256 [_Cutoff]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
"ps_4_0_level_9_1
eefiecedaikfcdpdneglabdjbbihlohbfjpnjmogabaaaaaapiaiaaaaaeaaaaaa
daaaaaaadiadaaaaamaiaaaameaiaaaaebgpgodjaaadaaaaaaadaaaaaaacpppp
jmacaaaageaaaaaaaeaadeaaaaaageaaaaaageaaaeaaceaaaaaageaaadaaaaaa
acababaaaaacacaaabadadaaaaaaagaaabaaaaaaaaaaaaaaaaaaajaaafaaabaa
aaaaaaaaaaaabaaaabaaagaaaaaaaaaaabaaaaaaabaaahaaaaaaaaaaaaacpppp
fbaaaaafaiaaapkaaaaaaaeaaaaaialpaaaaaaaaaaaaiadpbpaaaaacaaaaaaia
aaaaaplabpaaaaacaaaaaaiaabaachlabpaaaaacaaaaaaiaacaachlabpaaaaac
aaaaaaiaadaachlabpaaaaacaaaaaaiaaeaaahlabpaaaaacaaaaaajiaaaiapka
bpaaaaacaaaaaajaabaiapkabpaaaaacaaaaaajaacaiapkabpaaaaacaaaaaaja
adaiapkaecaaaaadaaaaapiaaaaaoelaacaioekaabaaaaacabaaaiiaafaappka
aeaaaaaeabaacpiaaaaappiaabaappiaagaaaakbafaaaaadaaaacpiaaaaaoeia
afaaoekaabaaaaacacaaabiaaaaakklaabaaaaacacaaaciaaaaapplaafaaaaad
adaachiaaeaafflaacaaoekaaeaaaaaeadaachiaabaaoekaaeaaaalaadaaoeia
aeaaaaaeadaachiaadaaoekaaeaakklaadaaoeiaacaaaaadadaachiaadaaoeia
aeaaoekaaiaaaaadadaaciiaadaaoeiaadaaoeiaabaaaaacaeaacdiaadaappia
ebaaaaababaaapiaecaaaaadabaacpiaacaaoeiaadaioekaecaaaaadacaaapia
adaaoeiaaaaioekaecaaaaadadaaapiaaeaaoeiaabaioekaacaaaaadacaaahia
aeaaoelbahaaoekaceaaaaacaeaachiaacaaoeiaaeaaaaaeacaacbiaabaappia
aiaaaakaaiaaffkaaeaaaaaeacaacciaabaaffiaaiaaaakaaiaaffkafkaaaaae
aeaadiiaacaaoeiaacaaoeiaaiaakkkaacaaaaadaeaaciiaaeaappibaiaappka
ahaaaaacaeaaciiaaeaappiaagaaaaacacaaceiaaeaappiaaiaaaaadabaacbia
abaaoelaacaaoeiaaiaaaaadabaacciaacaaoelaacaaoeiaaiaaaaadabaaceia
adaaoelaacaaoeiaaiaaaaadabaacbiaabaaoeiaaeaaoeiaalaaaaadacaacbia
abaaaaiaaiaakkkaafaaaaadabaacbiaacaappiaadaaaaiaafaaaaadabaachia
abaaaaiaaaaaoekaafaaaaadabaachiaaaaaoeiaabaaoeiaafaaaaadaaaachia
acaaaaiaabaaoeiaabaaaaacaaaicpiaaaaaoeiappppaaaafdeieefcmmaeaaaa
eaaaaaaaddabaaaafjaaaaaeegiocaaaaaaaaaaabbaaaaaafjaaaaaeegiocaaa
abaaaaaaabaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaa
fkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaa
acaaaaaaffffaaaafidaaaaeaahabaaaadaaaaaaffffaaaagcbaaaadpcbabaaa
abaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaad
hcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaa
giaaaaacaeaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaa
aaaaaaaaaagabaaaacaaaaaadcaaaaambcaabaaaabaaaaaadkaabaaaaaaaaaaa
dkiacaaaaaaaaaaaanaaaaaaakiacaiaebaaaaaaaaaaaaaabaaaaaaadiaaaaai
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaegiocaaaaaaaaaaaanaaaaaadbaaaaah
bcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaaaaanaaaeadakaabaaa
abaaaaaaaaaaaaajhcaabaaaabaaaaaaegbcbaiaebaaaaaaafaaaaaaegiccaaa
abaaaaaaaaaaaaaabaaaaaahicaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaa
abaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaahhcaabaaa
abaaaaaapgapbaaaabaaaaaaegacbaaaabaaaaaaefaaaaajpcaabaaaacaaaaaa
ogbkbaaaabaaaaaaeghobaaaabaaaaaaaagabaaaadaaaaaadcaaaaapdcaabaaa
acaaaaaahgapbaaaacaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaa
aceaaaaaaaaaialpaaaaialpaaaaaaaaaaaaaaaaapaaaaahicaabaaaabaaaaaa
egaabaaaacaaaaaaegaabaaaacaaaaaaddaaaaahicaabaaaabaaaaaadkaabaaa
abaaaaaaabeaaaaaaaaaiadpaaaaaaaiicaabaaaabaaaaaadkaabaiaebaaaaaa
abaaaaaaabeaaaaaaaaaiadpelaaaaafecaabaaaacaaaaaadkaabaaaabaaaaaa
baaaaaahbcaabaaaadaaaaaaegbcbaaaacaaaaaaegacbaaaacaaaaaabaaaaaah
ccaabaaaadaaaaaaegbcbaaaadaaaaaaegacbaaaacaaaaaabaaaaaahecaabaaa
adaaaaaaegbcbaaaaeaaaaaaegacbaaaacaaaaaabaaaaaahbcaabaaaabaaaaaa
egacbaaaadaaaaaaegacbaaaabaaaaaadeaaaaahbcaabaaaabaaaaaaakaabaaa
abaaaaaaabeaaaaaaaaaaaaadiaaaaaiocaabaaaabaaaaaafgbfbaaaafaaaaaa
agijcaaaaaaaaaaaakaaaaaadcaaaaakocaabaaaabaaaaaaagijcaaaaaaaaaaa
ajaaaaaaagbabaaaafaaaaaafgaobaaaabaaaaaadcaaaaakocaabaaaabaaaaaa
agijcaaaaaaaaaaaalaaaaaakgbkbaaaafaaaaaafgaobaaaabaaaaaaaaaaaaai
ocaabaaaabaaaaaafgaobaaaabaaaaaaagijcaaaaaaaaaaaamaaaaaabaaaaaah
bcaabaaaacaaaaaajgahbaaaabaaaaaajgahbaaaabaaaaaaefaaaaajpcaabaaa
adaaaaaajgahbaaaabaaaaaaeghobaaaadaaaaaaaagabaaaaaaaaaaaefaaaaaj
pcaabaaaacaaaaaaagaabaaaacaaaaaaeghobaaaacaaaaaaaagabaaaabaaaaaa
diaaaaahccaabaaaabaaaaaadkaabaaaadaaaaaaakaabaaaacaaaaaadiaaaaai
ocaabaaaabaaaaaafgafbaaaabaaaaaaagijcaaaaaaaaaaaagaaaaaadiaaaaah
hcaabaaaaaaaaaaaegacbaaaaaaaaaaajgahbaaaabaaaaaadgaaaaaficcabaaa
aaaaaaaadkaabaaaaaaaaaaadiaaaaahhccabaaaaaaaaaaaagaabaaaabaaaaaa
egacbaaaaaaaaaaadoaaaaabejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL_COOKIE" }
"!!GLSL"
}
SubProgram "d3d9 " {
// Stats: 25 math, 4 textures
Keywords { "DIRECTIONAL_COOKIE" }
Matrix 0 [_LightMatrix0] 2
Vector 4 [_Color]
Float 5 [_Cutoff]
Vector 3 [_LightColor0]
Vector 2 [_WorldSpaceLightPos0]
SetTexture 0 [_LightTexture0] 2D 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_BumpMap] 2D 2
"ps_2_0
def c6, 2, -1, 0, 1
dcl t0
dcl_pp t1.xyz
dcl_pp t2.xyz
dcl_pp t3.xyz
dcl t4.xyz
dcl_2d s0
dcl_2d s1
dcl_2d s2
texld r0, t0, s1
mov r1.w, c4.w
mad_pp r1, r0.w, r1.w, -c5.x
mul_pp r0, r0, c4
mov r2.x, t0.z
mov r2.y, t0.w
mov r3.xyz, t4
mov_pp r3.w, c6.w
dp4_pp r4.x, c0, r3
dp4_pp r4.y, c1, r3
texkill r1
texld_pp r1, r2, s2
texld_pp r2, r4, s0
mad_pp r2.x, r1.w, c6.x, c6.y
mad_pp r2.y, r1.y, c6.x, c6.y
dp2add_sat_pp r1.x, r2, r2, c6.z
add_pp r1.x, -r1.x, c6.w
rsq_pp r1.x, r1.x
rcp_pp r2.z, r1.x
dp3_pp r1.x, t1, r2
dp3_pp r1.y, t2, r2
dp3_pp r1.z, t3, r2
dp3_pp r1.x, r1, c2
max_pp r2.x, r1.x, c6.z
mul_pp r1.xyz, r2.w, c3
mul_pp r1.xyz, r0, r1
mul_pp r0.xyz, r2.x, r1
mov_pp oC0, r0

"
}
SubProgram "d3d11 " {
// Stats: 20 math, 3 textures
Keywords { "DIRECTIONAL_COOKIE" }
SetTexture 0 [_MainTex] 2D 1
SetTexture 1 [_BumpMap] 2D 2
SetTexture 2 [_LightTexture0] 2D 0
ConstBuffer "$Globals" 272
Matrix 144 [_LightMatrix0]
Vector 96 [_LightColor0]
Vector 208 [_Color]
Float 256 [_Cutoff]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
"ps_4_0
eefiecedglbhmbbicifopmdcddfjbogfeichiffgabaaaaaaaiafaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcoiadaaaa
eaaaaaaapkaaaaaafjaaaaaeegiocaaaaaaaaaaabbaaaaaafjaaaaaeegiocaaa
abaaaaaaabaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaa
fkaaaaadaagabaaaacaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaae
aahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaagcbaaaad
pcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaa
gcbaaaadhcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagfaaaaadpccabaaa
aaaaaaaagiaaaaacadaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaaabaaaaaa
eghobaaaaaaaaaaaaagabaaaabaaaaaadcaaaaambcaabaaaabaaaaaadkaabaaa
aaaaaaaadkiacaaaaaaaaaaaanaaaaaaakiacaiaebaaaaaaaaaaaaaabaaaaaaa
diaaaaaipcaabaaaaaaaaaaaegaobaaaaaaaaaaaegiocaaaaaaaaaaaanaaaaaa
dbaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaaaaanaaaead
akaabaaaabaaaaaaefaaaaajpcaabaaaabaaaaaaogbkbaaaabaaaaaaeghobaaa
abaaaaaaaagabaaaacaaaaaadcaaaaapdcaabaaaabaaaaaahgapbaaaabaaaaaa
aceaaaaaaaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaaaceaaaaaaaaaialpaaaaialp
aaaaaaaaaaaaaaaaapaaaaahicaabaaaabaaaaaaegaabaaaabaaaaaaegaabaaa
abaaaaaaddaaaaahicaabaaaabaaaaaadkaabaaaabaaaaaaabeaaaaaaaaaiadp
aaaaaaaiicaabaaaabaaaaaadkaabaiaebaaaaaaabaaaaaaabeaaaaaaaaaiadp
elaaaaafecaabaaaabaaaaaadkaabaaaabaaaaaabaaaaaahbcaabaaaacaaaaaa
egbcbaaaacaaaaaaegacbaaaabaaaaaabaaaaaahccaabaaaacaaaaaaegbcbaaa
adaaaaaaegacbaaaabaaaaaabaaaaaahecaabaaaacaaaaaaegbcbaaaaeaaaaaa
egacbaaaabaaaaaabaaaaaaibcaabaaaabaaaaaaegacbaaaacaaaaaaegiccaaa
abaaaaaaaaaaaaaadeaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaa
aaaaaaaadiaaaaaigcaabaaaabaaaaaafgbfbaaaafaaaaaaagibcaaaaaaaaaaa
akaaaaaadcaaaaakgcaabaaaabaaaaaaagibcaaaaaaaaaaaajaaaaaaagbabaaa
afaaaaaafgagbaaaabaaaaaadcaaaaakgcaabaaaabaaaaaaagibcaaaaaaaaaaa
alaaaaaakgbkbaaaafaaaaaafgagbaaaabaaaaaaaaaaaaaigcaabaaaabaaaaaa
fgagbaaaabaaaaaaagibcaaaaaaaaaaaamaaaaaaefaaaaajpcaabaaaacaaaaaa
jgafbaaaabaaaaaaeghobaaaacaaaaaaaagabaaaaaaaaaaadiaaaaaiocaabaaa
abaaaaaapgapbaaaacaaaaaaagijcaaaaaaaaaaaagaaaaaadiaaaaahhcaabaaa
aaaaaaaaegacbaaaaaaaaaaajgahbaaaabaaaaaadgaaaaaficcabaaaaaaaaaaa
dkaabaaaaaaaaaaadiaaaaahhccabaaaaaaaaaaaagaabaaaabaaaaaaegacbaaa
aaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 20 math, 3 textures
Keywords { "DIRECTIONAL_COOKIE" }
SetTexture 0 [_MainTex] 2D 1
SetTexture 1 [_BumpMap] 2D 2
SetTexture 2 [_LightTexture0] 2D 0
ConstBuffer "$Globals" 272
Matrix 144 [_LightMatrix0]
Vector 96 [_LightColor0]
Vector 208 [_Color]
Float 256 [_Cutoff]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
"ps_4_0_level_9_1
eefiecedkjodmpkjkofkgpapijgabepmacfafibbabaaaaaakmahaaaaaeaaaaaa
daaaaaaanaacaaaamaagaaaahiahaaaaebgpgodjjiacaaaajiacaaaaaaacpppp
diacaaaagaaaaaaaaeaadaaaaaaagaaaaaaagaaaadaaceaaaaaagaaaacaaaaaa
aaababaaabacacaaaaaaagaaabaaaaaaaaaaaaaaaaaaajaaafaaabaaaaaaaaaa
aaaabaaaabaaagaaaaaaaaaaabaaaaaaabaaahaaaaaaaaaaaaacppppfbaaaaaf
aiaaapkaaaaaaaeaaaaaialpaaaaaaaaaaaaiadpbpaaaaacaaaaaaiaaaaaapla
bpaaaaacaaaaaaiaabaachlabpaaaaacaaaaaaiaacaachlabpaaaaacaaaaaaia
adaachlabpaaaaacaaaaaaiaaeaaahlabpaaaaacaaaaaajaaaaiapkabpaaaaac
aaaaaajaabaiapkabpaaaaacaaaaaajaacaiapkaecaaaaadaaaaapiaaaaaoela
abaioekaabaaaaacabaaaiiaafaappkaaeaaaaaeabaacpiaaaaappiaabaappia
agaaaakbafaaaaadaaaacpiaaaaaoeiaafaaoekaabaaaaacacaaabiaaaaakkla
abaaaaacacaaaciaaaaapplaafaaaaadacaacmiaaeaafflaacaablkaaeaaaaae
acaacmiaabaablkaaeaaaalaacaaoeiaaeaaaaaeacaacmiaadaablkaaeaakkla
acaaoeiaacaaaaadadaacdiaacaabliaaeaaoekaebaaaaababaaapiaecaaaaad
abaacpiaacaaoeiaacaioekaecaaaaadacaacpiaadaaoeiaaaaioekaaeaaaaae
acaacbiaabaappiaaiaaaakaaiaaffkaaeaaaaaeacaacciaabaaffiaaiaaaaka
aiaaffkafkaaaaaeabaadbiaacaaoeiaacaaoeiaaiaakkkaacaaaaadabaacbia
abaaaaibaiaappkaahaaaaacabaacbiaabaaaaiaagaaaaacacaaceiaabaaaaia
aiaaaaadabaacbiaabaaoelaacaaoeiaaiaaaaadabaacciaacaaoelaacaaoeia
aiaaaaadabaaceiaadaaoelaacaaoeiaaiaaaaadabaacbiaabaaoeiaahaaoeka
alaaaaadacaacbiaabaaaaiaaiaakkkaafaaaaadabaachiaacaappiaaaaaoeka
afaaaaadabaachiaaaaaoeiaabaaoeiaafaaaaadaaaachiaacaaaaiaabaaoeia
abaaaaacaaaicpiaaaaaoeiappppaaaafdeieefcoiadaaaaeaaaaaaapkaaaaaa
fjaaaaaeegiocaaaaaaaaaaabbaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaa
fkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaa
acaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaa
ffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaa
gcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaa
aeaaaaaagcbaaaadhcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
adaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaa
aagabaaaabaaaaaadcaaaaambcaabaaaabaaaaaadkaabaaaaaaaaaaadkiacaaa
aaaaaaaaanaaaaaaakiacaiaebaaaaaaaaaaaaaabaaaaaaadiaaaaaipcaabaaa
aaaaaaaaegaobaaaaaaaaaaaegiocaaaaaaaaaaaanaaaaaadbaaaaahbcaabaaa
abaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaaaaanaaaeadakaabaaaabaaaaaa
efaaaaajpcaabaaaabaaaaaaogbkbaaaabaaaaaaeghobaaaabaaaaaaaagabaaa
acaaaaaadcaaaaapdcaabaaaabaaaaaahgapbaaaabaaaaaaaceaaaaaaaaaaaea
aaaaaaeaaaaaaaaaaaaaaaaaaceaaaaaaaaaialpaaaaialpaaaaaaaaaaaaaaaa
apaaaaahicaabaaaabaaaaaaegaabaaaabaaaaaaegaabaaaabaaaaaaddaaaaah
icaabaaaabaaaaaadkaabaaaabaaaaaaabeaaaaaaaaaiadpaaaaaaaiicaabaaa
abaaaaaadkaabaiaebaaaaaaabaaaaaaabeaaaaaaaaaiadpelaaaaafecaabaaa
abaaaaaadkaabaaaabaaaaaabaaaaaahbcaabaaaacaaaaaaegbcbaaaacaaaaaa
egacbaaaabaaaaaabaaaaaahccaabaaaacaaaaaaegbcbaaaadaaaaaaegacbaaa
abaaaaaabaaaaaahecaabaaaacaaaaaaegbcbaaaaeaaaaaaegacbaaaabaaaaaa
baaaaaaibcaabaaaabaaaaaaegacbaaaacaaaaaaegiccaaaabaaaaaaaaaaaaaa
deaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaaaadiaaaaai
gcaabaaaabaaaaaafgbfbaaaafaaaaaaagibcaaaaaaaaaaaakaaaaaadcaaaaak
gcaabaaaabaaaaaaagibcaaaaaaaaaaaajaaaaaaagbabaaaafaaaaaafgagbaaa
abaaaaaadcaaaaakgcaabaaaabaaaaaaagibcaaaaaaaaaaaalaaaaaakgbkbaaa
afaaaaaafgagbaaaabaaaaaaaaaaaaaigcaabaaaabaaaaaafgagbaaaabaaaaaa
agibcaaaaaaaaaaaamaaaaaaefaaaaajpcaabaaaacaaaaaajgafbaaaabaaaaaa
eghobaaaacaaaaaaaagabaaaaaaaaaaadiaaaaaiocaabaaaabaaaaaapgapbaaa
acaaaaaaagijcaaaaaaaaaaaagaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaa
aaaaaaaajgahbaaaabaaaaaadgaaaaaficcabaaaaaaaaaaadkaabaaaaaaaaaaa
diaaaaahhccabaaaaaaaaaaaagaabaaaabaaaaaaegacbaaaaaaaaaaadoaaaaab
ejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapapaaaa
keaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaakeaaaaaaacaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaahahaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahahaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaa
abaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaa
fdfgfpfegbhcghgfheaaklkl"
}
}
 }


 // Stats for Vertex shader:
 //       d3d11 : 33 math
 //    d3d11_9x : 33 math
 //        d3d9 : 33 math
 //      opengl : 15 math, 3 texture, 1 branch
 // Stats for Fragment shader:
 //       d3d11 : 11 math, 2 texture
 //    d3d11_9x : 11 math, 2 texture
 //        d3d9 : 17 math, 3 texture
 Pass {
  Name "PREPASS"
  Tags { "LIGHTMODE"="PrePassBase" "QUEUE"="AlphaTest" "IGNOREPROJECTOR"="true" "RenderType"="TransparentCutout" }
  GpuProgramID 176808
Program "vp" {
SubProgram "opengl " {
// Stats: 15 math, 3 textures, 1 branches
"!!GLSL
#ifdef VERTEX

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 _MainTex_ST;
uniform vec4 _BumpMap_ST;
attribute vec4 TANGENT;
varying vec4 xlv_TEXCOORD0;
varying vec4 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD3;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xy = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_1.zw = ((gl_MultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  vec3 tmpvar_2;
  tmpvar_2 = (_Object2World * gl_Vertex).xyz;
  vec4 v_3;
  v_3.x = _World2Object[0].x;
  v_3.y = _World2Object[1].x;
  v_3.z = _World2Object[2].x;
  v_3.w = _World2Object[3].x;
  vec4 v_4;
  v_4.x = _World2Object[0].y;
  v_4.y = _World2Object[1].y;
  v_4.z = _World2Object[2].y;
  v_4.w = _World2Object[3].y;
  vec4 v_5;
  v_5.x = _World2Object[0].z;
  v_5.y = _World2Object[1].z;
  v_5.z = _World2Object[2].z;
  v_5.w = _World2Object[3].z;
  vec3 tmpvar_6;
  tmpvar_6 = normalize(((
    (v_3.xyz * gl_Normal.x)
   + 
    (v_4.xyz * gl_Normal.y)
  ) + (v_5.xyz * gl_Normal.z)));
  mat3 tmpvar_7;
  tmpvar_7[0] = _Object2World[0].xyz;
  tmpvar_7[1] = _Object2World[1].xyz;
  tmpvar_7[2] = _Object2World[2].xyz;
  vec3 tmpvar_8;
  tmpvar_8 = normalize((tmpvar_7 * TANGENT.xyz));
  vec3 tmpvar_9;
  tmpvar_9 = (((tmpvar_6.yzx * tmpvar_8.zxy) - (tmpvar_6.zxy * tmpvar_8.yzx)) * TANGENT.w);
  vec4 tmpvar_10;
  tmpvar_10.x = tmpvar_8.x;
  tmpvar_10.y = tmpvar_9.x;
  tmpvar_10.z = tmpvar_6.x;
  tmpvar_10.w = tmpvar_2.x;
  vec4 tmpvar_11;
  tmpvar_11.x = tmpvar_8.y;
  tmpvar_11.y = tmpvar_9.y;
  tmpvar_11.z = tmpvar_6.y;
  tmpvar_11.w = tmpvar_2.y;
  vec4 tmpvar_12;
  tmpvar_12.x = tmpvar_8.z;
  tmpvar_12.y = tmpvar_9.z;
  tmpvar_12.z = tmpvar_6.z;
  tmpvar_12.w = tmpvar_2.z;
  gl_Position = (gl_ModelViewProjectionMatrix * gl_Vertex);
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_10;
  xlv_TEXCOORD2 = tmpvar_11;
  xlv_TEXCOORD3 = tmpvar_12;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _BumpMap;
uniform vec4 _Color;
uniform float _Cutoff;
varying vec4 xlv_TEXCOORD0;
varying vec4 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD3;
void main ()
{
  vec4 res_1;
  vec3 worldN_2;
  vec3 normal_3;
  normal_3.xy = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).wy * 2.0) - 1.0);
  normal_3.z = sqrt((1.0 - clamp (
    dot (normal_3.xy, normal_3.xy)
  , 0.0, 1.0)));
  float x_4;
  x_4 = ((texture2D (_MainTex, xlv_TEXCOORD0.xy) * _Color).w - _Cutoff);
  if ((x_4 < 0.0)) {
    discard;
  };
  worldN_2.x = dot (xlv_TEXCOORD1.xyz, normal_3);
  worldN_2.y = dot (xlv_TEXCOORD2.xyz, normal_3);
  worldN_2.z = dot (xlv_TEXCOORD3.xyz, normal_3);
  res_1.xyz = ((worldN_2 * 0.5) + 0.5);
  res_1.w = 0.0;
  gl_FragData[0] = res_1;
}


#endif
"
}
SubProgram "d3d9 " {
// Stats: 33 math
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord4
Matrix 4 [_Object2World] 3
Matrix 7 [_World2Object] 3
Matrix 0 [glstate_matrix_mvp]
Vector 11 [_BumpMap_ST]
Vector 10 [_MainTex_ST]
"vs_2_0
dcl_position v0
dcl_tangent v1
dcl_normal v2
dcl_texcoord v3
dp4 oPos.x, c0, v0
dp4 oPos.y, c1, v0
dp4 oPos.z, c2, v0
dp4 oPos.w, c3, v0
mad oT0.xy, v3, c10, c10.zwzw
mad oT0.zw, v3.xyxy, c11.xyxy, c11
dp4 oT1.w, c4, v0
dp4 oT2.w, c5, v0
dp4 oT3.w, c6, v0
dp3 r0.z, c4, v1
dp3 r0.x, c5, v1
dp3 r0.y, c6, v1
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul r0.xyz, r0.w, r0
mov oT1.x, r0.z
mul r1.xyz, v2.y, c8.zxyw
mad r1.xyz, c7.zxyw, v2.x, r1
mad r1.xyz, c9.zxyw, v2.z, r1
dp3 r0.w, r1, r1
rsq r0.w, r0.w
mul r1.xyz, r0.w, r1
mul r2.xyz, r0, r1
mad r2.xyz, r1.zxyw, r0.yzxw, -r2
mul r2.xyz, r2, v1.w
mov oT1.y, r2.x
mov oT1.z, r1.y
mov oT2.x, r0.x
mov oT3.x, r0.y
mov oT2.y, r2.y
mov oT3.y, r2.z
mov oT2.z, r1.z
mov oT3.z, r1.x

"
}
SubProgram "d3d11 " {
// Stats: 33 math
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord4
ConstBuffer "$Globals" 208
Vector 160 [_MainTex_ST]
Vector 176 [_BumpMap_ST]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
BindCB  "$Globals" 0
BindCB  "UnityPerDraw" 1
"vs_4_0
eefieceddpfoflioabanidgfbffhgglpeicjbmmcabaaaaaakiahaaaaadaaaaaa
cmaaaaaaceabaaaameabaaaaejfdeheopaaaaaaaaiaaaaaaaiaaaaaamiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaanbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaanjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaaoaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaaoaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaoaaaaaaaacaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaaoaaaaaaaadaaaaaaaaaaaaaaadaaaaaaagaaaaaa
apaaaaaaojaaaaaaaaaaaaaaaaaaaaaaadaaaaaaahaaaaaaapaaaaaafaepfdej
feejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepem
epfcaaklepfdeheojiaaaaaaafaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
apaaaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaaimaaaaaa
acaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaaimaaaaaaadaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklfdeieefcnmafaaaaeaaaabaahhabaaaafjaaaaaeegiocaaaaaaaaaaa
amaaaaaafjaaaaaeegiocaaaabaaaaaabdaaaaaafpaaaaadpcbabaaaaaaaaaaa
fpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaa
adaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaa
gfaaaaadpccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaagfaaaaadpccabaaa
aeaaaaaagiaaaaacaeaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiocaaaabaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaabaaaaaa
aaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaabaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pccabaaaaaaaaaaaegiocaaaabaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaa
akaaaaaaogikcaaaaaaaaaaaakaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaa
adaaaaaaagiecaaaaaaaaaaaalaaaaaakgiocaaaaaaaaaaaalaaaaaadiaaaaai
ccaabaaaaaaaaaaaakbabaaaacaaaaaaakiacaaaabaaaaaabaaaaaaadiaaaaai
ecaabaaaaaaaaaaaakbabaaaacaaaaaaakiacaaaabaaaaaabbaaaaaadiaaaaai
bcaabaaaaaaaaaaaakbabaaaacaaaaaaakiacaaaabaaaaaabcaaaaaadiaaaaai
ccaabaaaabaaaaaabkbabaaaacaaaaaabkiacaaaabaaaaaabaaaaaaadiaaaaai
ecaabaaaabaaaaaabkbabaaaacaaaaaabkiacaaaabaaaaaabbaaaaaadiaaaaai
bcaabaaaabaaaaaabkbabaaaacaaaaaabkiacaaaabaaaaaabcaaaaaaaaaaaaah
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaaiccaabaaa
abaaaaaackbabaaaacaaaaaackiacaaaabaaaaaabaaaaaaadiaaaaaiecaabaaa
abaaaaaackbabaaaacaaaaaackiacaaaabaaaaaabbaaaaaadiaaaaaibcaabaaa
abaaaaaackbabaaaacaaaaaackiacaaaabaaaaaabcaaaaaaaaaaaaahhcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahicaabaaaaaaaaaaa
egacbaaaaaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaa
aaaaaaaadiaaaaahhcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaa
dgaaaaafeccabaaaacaaaaaabkaabaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaa
fgbfbaaaabaaaaaajgiecaaaabaaaaaaanaaaaaadcaaaaakhcaabaaaabaaaaaa
jgiecaaaabaaaaaaamaaaaaaagbabaaaabaaaaaaegacbaaaabaaaaaadcaaaaak
hcaabaaaabaaaaaajgiecaaaabaaaaaaaoaaaaaakgbkbaaaabaaaaaaegacbaaa
abaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaa
eeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaa
pgapbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaahhcaabaaaacaaaaaaegacbaaa
aaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaacaaaaaacgajbaaaaaaaaaaa
jgaebaaaabaaaaaaegacbaiaebaaaaaaacaaaaaadiaaaaahhcaabaaaacaaaaaa
egacbaaaacaaaaaapgbpbaaaabaaaaaadgaaaaafcccabaaaacaaaaaaakaabaaa
acaaaaaadiaaaaaihcaabaaaadaaaaaafgbfbaaaaaaaaaaaegiccaaaabaaaaaa
anaaaaaadcaaaaakhcaabaaaadaaaaaaegiccaaaabaaaaaaamaaaaaaagbabaaa
aaaaaaaaegacbaaaadaaaaaadcaaaaakhcaabaaaadaaaaaaegiccaaaabaaaaaa
aoaaaaaakgbkbaaaaaaaaaaaegacbaaaadaaaaaadcaaaaakhcaabaaaadaaaaaa
egiccaaaabaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaaadaaaaaadgaaaaaf
iccabaaaacaaaaaaakaabaaaadaaaaaadgaaaaafbccabaaaacaaaaaackaabaaa
abaaaaaadgaaaaafeccabaaaadaaaaaackaabaaaaaaaaaaadgaaaaafeccabaaa
aeaaaaaaakaabaaaaaaaaaaadgaaaaafbccabaaaadaaaaaaakaabaaaabaaaaaa
dgaaaaafbccabaaaaeaaaaaabkaabaaaabaaaaaadgaaaaaficcabaaaadaaaaaa
bkaabaaaadaaaaaadgaaaaaficcabaaaaeaaaaaackaabaaaadaaaaaadgaaaaaf
cccabaaaadaaaaaabkaabaaaacaaaaaadgaaaaafcccabaaaaeaaaaaackaabaaa
acaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 33 math
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord4
ConstBuffer "$Globals" 208
Vector 160 [_MainTex_ST]
Vector 176 [_BumpMap_ST]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
BindCB  "$Globals" 0
BindCB  "UnityPerDraw" 1
"vs_4_0_level_9_1
eefiecedadgeeaclphmmpoaijefooenflimldgngabaaaaaabmalaaaaaeaaaaaa
daaaaaaakaadaaaaieajaaaahmakaaaaebgpgodjgiadaaaagiadaaaaaaacpopp
bmadaaaaemaaaaaaadaaceaaaaaaeiaaaaaaeiaaaaaaceaaabaaeiaaaaaaakaa
acaaabaaaaaaaaaaabaaaaaaaeaaadaaaaaaaaaaabaaamaaahaaahaaaaaaaaaa
aaaaaaaaaaacpoppbpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabiaabaaapja
bpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjaaeaaaaaeaaaaadoa
adaaoejaabaaoekaabaaookaaeaaaaaeaaaaamoaadaaeejaacaaeekaacaaoeka
afaaaaadaaaaapiaaaaaffjaaeaaoekaaeaaaaaeaaaaapiaadaaoekaaaaaaaja
aaaaoeiaaeaaaaaeaaaaapiaafaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapia
agaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeia
abaaaaacaaaaammaaaaaoeiaafaaaaadaaaaahiaabaaffjaaiaamjkaaeaaaaae
aaaaahiaahaamjkaabaaaajaaaaaoeiaaeaaaaaeaaaaahiaajaamjkaabaakkja
aaaaoeiaaiaaaaadaaaaaiiaaaaaoeiaaaaaoeiaahaaaaacaaaaaiiaaaaappia
afaaaaadaaaaahiaaaaappiaaaaaoeiaabaaaaacabaaaboaaaaakkiaafaaaaad
abaaaciaacaaaajaalaaaakaafaaaaadabaaaeiaacaaaajaamaaaakaafaaaaad
abaaabiaacaaaajaanaaaakaafaaaaadacaaaciaacaaffjaalaaffkaafaaaaad
acaaaeiaacaaffjaamaaffkaafaaaaadacaaabiaacaaffjaanaaffkaacaaaaad
abaaahiaabaaoeiaacaaoeiaafaaaaadacaaaciaacaakkjaalaakkkaafaaaaad
acaaaeiaacaakkjaamaakkkaafaaaaadacaaabiaacaakkjaanaakkkaacaaaaad
abaaahiaabaaoeiaacaaoeiaaiaaaaadaaaaaiiaabaaoeiaabaaoeiaahaaaaac
aaaaaiiaaaaappiaafaaaaadabaaahiaaaaappiaabaaoeiaafaaaaadacaaahia
aaaaoeiaabaaoeiaaeaaaaaeacaaahiaabaanciaaaaamjiaacaaoeibafaaaaad
acaaahiaacaaoeiaabaappjaabaaaaacabaaacoaacaaaaiaabaaaaacabaaaeoa
abaaffiaafaaaaadadaaahiaaaaaffjaaiaaoekaaeaaaaaeadaaahiaahaaoeka
aaaaaajaadaaoeiaaeaaaaaeadaaahiaajaaoekaaaaakkjaadaaoeiaaeaaaaae
adaaahiaakaaoekaaaaappjaadaaoeiaabaaaaacabaaaioaadaaaaiaabaaaaac
acaaaboaaaaaaaiaabaaaaacadaaaboaaaaaffiaabaaaaacacaaacoaacaaffia
abaaaaacadaaacoaacaakkiaabaaaaacacaaaeoaabaakkiaabaaaaacadaaaeoa
abaaaaiaabaaaaacacaaaioaadaaffiaabaaaaacadaaaioaadaakkiappppaaaa
fdeieefcnmafaaaaeaaaabaahhabaaaafjaaaaaeegiocaaaaaaaaaaaamaaaaaa
fjaaaaaeegiocaaaabaaaaaabdaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaad
pcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaad
pccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaagfaaaaadpccabaaaaeaaaaaa
giaaaaacaeaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
abaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaabaaaaaaaaaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
abaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaa
aaaaaaaaegiocaaaabaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaakaaaaaa
ogikcaaaaaaaaaaaakaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaadaaaaaa
agiecaaaaaaaaaaaalaaaaaakgiocaaaaaaaaaaaalaaaaaadiaaaaaiccaabaaa
aaaaaaaaakbabaaaacaaaaaaakiacaaaabaaaaaabaaaaaaadiaaaaaiecaabaaa
aaaaaaaaakbabaaaacaaaaaaakiacaaaabaaaaaabbaaaaaadiaaaaaibcaabaaa
aaaaaaaaakbabaaaacaaaaaaakiacaaaabaaaaaabcaaaaaadiaaaaaiccaabaaa
abaaaaaabkbabaaaacaaaaaabkiacaaaabaaaaaabaaaaaaadiaaaaaiecaabaaa
abaaaaaabkbabaaaacaaaaaabkiacaaaabaaaaaabbaaaaaadiaaaaaibcaabaaa
abaaaaaabkbabaaaacaaaaaabkiacaaaabaaaaaabcaaaaaaaaaaaaahhcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaaiccaabaaaabaaaaaa
ckbabaaaacaaaaaackiacaaaabaaaaaabaaaaaaadiaaaaaiecaabaaaabaaaaaa
ckbabaaaacaaaaaackiacaaaabaaaaaabbaaaaaadiaaaaaibcaabaaaabaaaaaa
ckbabaaaacaaaaaackiacaaaabaaaaaabcaaaaaaaaaaaaahhcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaa
diaaaaahhcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaadgaaaaaf
eccabaaaacaaaaaabkaabaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaafgbfbaaa
abaaaaaajgiecaaaabaaaaaaanaaaaaadcaaaaakhcaabaaaabaaaaaajgiecaaa
abaaaaaaamaaaaaaagbabaaaabaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaa
abaaaaaajgiecaaaabaaaaaaaoaaaaaakgbkbaaaabaaaaaaegacbaaaabaaaaaa
baaaaaahicaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaaf
icaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaapgapbaaa
aaaaaaaaegacbaaaabaaaaaadiaaaaahhcaabaaaacaaaaaaegacbaaaaaaaaaaa
egacbaaaabaaaaaadcaaaaakhcaabaaaacaaaaaacgajbaaaaaaaaaaajgaebaaa
abaaaaaaegacbaiaebaaaaaaacaaaaaadiaaaaahhcaabaaaacaaaaaaegacbaaa
acaaaaaapgbpbaaaabaaaaaadgaaaaafcccabaaaacaaaaaaakaabaaaacaaaaaa
diaaaaaihcaabaaaadaaaaaafgbfbaaaaaaaaaaaegiccaaaabaaaaaaanaaaaaa
dcaaaaakhcaabaaaadaaaaaaegiccaaaabaaaaaaamaaaaaaagbabaaaaaaaaaaa
egacbaaaadaaaaaadcaaaaakhcaabaaaadaaaaaaegiccaaaabaaaaaaaoaaaaaa
kgbkbaaaaaaaaaaaegacbaaaadaaaaaadcaaaaakhcaabaaaadaaaaaaegiccaaa
abaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaaadaaaaaadgaaaaaficcabaaa
acaaaaaaakaabaaaadaaaaaadgaaaaafbccabaaaacaaaaaackaabaaaabaaaaaa
dgaaaaafeccabaaaadaaaaaackaabaaaaaaaaaaadgaaaaafeccabaaaaeaaaaaa
akaabaaaaaaaaaaadgaaaaafbccabaaaadaaaaaaakaabaaaabaaaaaadgaaaaaf
bccabaaaaeaaaaaabkaabaaaabaaaaaadgaaaaaficcabaaaadaaaaaabkaabaaa
adaaaaaadgaaaaaficcabaaaaeaaaaaackaabaaaadaaaaaadgaaaaafcccabaaa
adaaaaaabkaabaaaacaaaaaadgaaaaafcccabaaaaeaaaaaackaabaaaacaaaaaa
doaaaaabejfdeheopaaaaaaaaiaaaaaaaiaaaaaamiaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapapaaaanbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
apapaaaanjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaaoaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaaoaaaaaaaabaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapaaaaaaoaaaaaaaacaaaaaaaaaaaaaaadaaaaaaafaaaaaa
apaaaaaaoaaaaaaaadaaaaaaaaaaaaaaadaaaaaaagaaaaaaapaaaaaaojaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaahaaaaaaapaaaaaafaepfdejfeejepeoaafeebeo
ehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheo
jiaaaaaaafaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaa
apaaaaaaimaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaaimaaaaaa
abaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaaimaaaaaaacaaaaaaaaaaaaaa
adaaaaaaadaaaaaaapaaaaaaimaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
apaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl"
}
}
Program "fp" {
SubProgram "opengl " {
"!!GLSL"
}
SubProgram "d3d9 " {
// Stats: 17 math, 3 textures
Vector 0 [_Color]
Float 1 [_Cutoff]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_BumpMap] 2D 1
"ps_2_0
def c2, 2, -1, 0, 1
def c3, 0.5, 0, 0, 0
dcl t0
dcl t1.xyz
dcl t2.xyz
dcl t3.xyz
dcl_2d s0
dcl_2d s1
texld r0, t0, s0
mov r1.w, c0.w
mad_pp r0, r0.w, r1.w, -c1.x
mov r1.x, t0.z
mov r1.y, t0.w
texkill r0
texld_pp r0, r1, s1
mad_pp r1.x, r0.w, c2.x, c2.y
mad_pp r1.y, r0.y, c2.x, c2.y
dp2add_sat_pp r1.w, r1, r1, c2.z
add_pp r1.w, -r1.w, c2.w
rsq_pp r1.w, r1.w
rcp_pp r1.z, r1.w
dp3_pp r0.x, t1, r1
dp3_pp r0.y, t2, r1
dp3_pp r0.z, t3, r1
mad_pp r0.xyz, r0, c3.x, c3.x
mov_pp r0.w, c2.z
mov_pp oC0, r0

"
}
SubProgram "d3d11 " {
// Stats: 11 math, 2 textures
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_BumpMap] 2D 1
ConstBuffer "$Globals" 208
Vector 144 [_Color]
Float 192 [_Cutoff]
BindCB  "$Globals" 0
"ps_4_0
eefiecedobpgnjdmehcegdjflebggcdoidkjjmogabaaaaaaimadaaaaadaaaaaa
cmaaaaaammaaaaaaaaabaaaaejfdeheojiaaaaaaafaaaaaaaiaaaaaaiaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaapahaaaaimaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapahaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl
fdeieefcieacaaaaeaaaaaaakbaaaaaafjaaaaaeegiocaaaaaaaaaaaanaaaaaa
fkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaagcbaaaadpcbabaaa
abaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaad
hcbabaaaaeaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaaefaaaaaj
pcaabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaa
dcaaaaambcaabaaaaaaaaaaadkaabaaaaaaaaaaadkiacaaaaaaaaaaaajaaaaaa
akiacaiaebaaaaaaaaaaaaaaamaaaaaadbaaaaahbcaabaaaaaaaaaaaakaabaaa
aaaaaaaaabeaaaaaaaaaaaaaanaaaeadakaabaaaaaaaaaaaefaaaaajpcaabaaa
aaaaaaaaogbkbaaaabaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaadcaaaaap
dcaabaaaaaaaaaaahgapbaaaaaaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaaa
aaaaaaaaaceaaaaaaaaaialpaaaaialpaaaaaaaaaaaaaaaaapaaaaahicaabaaa
aaaaaaaaegaabaaaaaaaaaaaegaabaaaaaaaaaaaddaaaaahicaabaaaaaaaaaaa
dkaabaaaaaaaaaaaabeaaaaaaaaaiadpaaaaaaaiicaabaaaaaaaaaaadkaabaia
ebaaaaaaaaaaaaaaabeaaaaaaaaaiadpelaaaaafecaabaaaaaaaaaaadkaabaaa
aaaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaa
baaaaaahccaabaaaabaaaaaaegbcbaaaadaaaaaaegacbaaaaaaaaaaabaaaaaah
ecaabaaaabaaaaaaegbcbaaaaeaaaaaaegacbaaaaaaaaaaadcaaaaaphccabaaa
aaaaaaaaegacbaaaabaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaa
aceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaadgaaaaaficcabaaaaaaaaaaa
abeaaaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 11 math, 2 textures
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_BumpMap] 2D 1
ConstBuffer "$Globals" 208
Vector 144 [_Color]
Float 192 [_Cutoff]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedabmnbocmopecminnbjccabfjgcnmkchhabaaaaaahmafaaaaaeaaaaaa
daaaaaaabmacaaaakiaeaaaaeiafaaaaebgpgodjoeabaaaaoeabaaaaaaacpppp
kaabaaaaeeaaaaaaacaacmaaaaaaeeaaaaaaeeaaacaaceaaaaaaeeaaaaaaaaaa
abababaaaaaaajaaabaaaaaaaaaaaaaaaaaaamaaabaaabaaaaaaaaaaaaacpppp
fbaaaaafacaaapkaaaaaaaeaaaaaialpaaaaaaaaaaaaiadpfbaaaaafadaaapka
aaaaaadpaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaaplabpaaaaac
aaaaaaiaabaaaplabpaaaaacaaaaaaiaacaaaplabpaaaaacaaaaaaiaadaaapla
bpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaajaabaiapkaecaaaaadaaaaapia
aaaaoelaaaaioekaabaaaaacabaaaiiaaaaappkaaeaaaaaeaaaacpiaaaaappia
abaappiaabaaaakbabaaaaacabaaabiaaaaakklaabaaaaacabaaaciaaaaappla
ebaaaaabaaaaapiaecaaaaadaaaacpiaabaaoeiaabaioekaaeaaaaaeabaacbia
aaaappiaacaaaakaacaaffkaaeaaaaaeabaacciaaaaaffiaacaaaakaacaaffka
fkaaaaaeabaadiiaabaaoeiaabaaoeiaacaakkkaacaaaaadabaaciiaabaappib
acaappkaahaaaaacabaaciiaabaappiaagaaaaacabaaceiaabaappiaaiaaaaad
aaaacbiaabaaoelaabaaoeiaaiaaaaadaaaacciaacaaoelaabaaoeiaaiaaaaad
aaaaceiaadaaoelaabaaoeiaaeaaaaaeaaaachiaaaaaoeiaadaaaakaadaaaaka
abaaaaacaaaaciiaacaakkkaabaaaaacaaaicpiaaaaaoeiappppaaaafdeieefc
ieacaaaaeaaaaaaakbaaaaaafjaaaaaeegiocaaaaaaaaaaaanaaaaaafkaaaaad
aagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafibiaaaeaahabaaaaaaaaaaa
ffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaa
gcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaa
aeaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaaefaaaaajpcaabaaa
aaaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaadcaaaaam
bcaabaaaaaaaaaaadkaabaaaaaaaaaaadkiacaaaaaaaaaaaajaaaaaaakiacaia
ebaaaaaaaaaaaaaaamaaaaaadbaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
abeaaaaaaaaaaaaaanaaaeadakaabaaaaaaaaaaaefaaaaajpcaabaaaaaaaaaaa
ogbkbaaaabaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaadcaaaaapdcaabaaa
aaaaaaaahgapbaaaaaaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaa
aceaaaaaaaaaialpaaaaialpaaaaaaaaaaaaaaaaapaaaaahicaabaaaaaaaaaaa
egaabaaaaaaaaaaaegaabaaaaaaaaaaaddaaaaahicaabaaaaaaaaaaadkaabaaa
aaaaaaaaabeaaaaaaaaaiadpaaaaaaaiicaabaaaaaaaaaaadkaabaiaebaaaaaa
aaaaaaaaabeaaaaaaaaaiadpelaaaaafecaabaaaaaaaaaaadkaabaaaaaaaaaaa
baaaaaahbcaabaaaabaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaabaaaaaah
ccaabaaaabaaaaaaegbcbaaaadaaaaaaegacbaaaaaaaaaaabaaaaaahecaabaaa
abaaaaaaegbcbaaaaeaaaaaaegacbaaaaaaaaaaadcaaaaaphccabaaaaaaaaaaa
egacbaaaabaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaaaceaaaaa
aaaaaadpaaaaaadpaaaaaadpaaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaa
aaaaaaaadoaaaaabejfdeheojiaaaaaaafaaaaaaaiaaaaaaiaaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaapapaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapahaaaa
imaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaapahaaaaimaaaaaaadaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaapahaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
}
 }


 // Stats for Vertex shader:
 //       d3d11 : 37 math
 //    d3d11_9x : 37 math
 //        d3d9 : 33 math
 //      opengl : 6 avg math (5..7), 3 texture, 1 branch
 // Stats for Fragment shader:
 //       d3d11 : 6 avg math (6..7), 2 texture
 //    d3d11_9x : 6 avg math (6..7), 2 texture
 //        d3d9 : 7 avg math (6..9), 3 texture
 Pass {
  Name "PREPASS"
  Tags { "LIGHTMODE"="PrePassFinal" "QUEUE"="AlphaTest" "IGNOREPROJECTOR"="true" "RenderType"="TransparentCutout" }
  ZWrite Off
  GpuProgramID 222972
Program "vp" {
SubProgram "opengl " {
// Stats: 7 math, 3 textures, 1 branches
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
"!!GLSL
#ifdef VERTEX
uniform vec4 _ProjectionParams;
uniform vec4 unity_SHAr;
uniform vec4 unity_SHAg;
uniform vec4 unity_SHAb;
uniform vec4 unity_SHBr;
uniform vec4 unity_SHBg;
uniform vec4 unity_SHBb;
uniform vec4 unity_SHC;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 _MainTex_ST;
varying vec2 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD3;
varying vec3 xlv_TEXCOORD4;
void main ()
{
  vec4 tmpvar_1;
  vec4 tmpvar_2;
  tmpvar_2 = (gl_ModelViewProjectionMatrix * gl_Vertex);
  vec4 o_3;
  vec4 tmpvar_4;
  tmpvar_4 = (tmpvar_2 * 0.5);
  vec2 tmpvar_5;
  tmpvar_5.x = tmpvar_4.x;
  tmpvar_5.y = (tmpvar_4.y * _ProjectionParams.x);
  o_3.xy = (tmpvar_5 + tmpvar_4.w);
  o_3.zw = tmpvar_2.zw;
  tmpvar_1.zw = vec2(0.0, 0.0);
  tmpvar_1.xy = vec2(0.0, 0.0);
  vec4 v_6;
  v_6.x = _World2Object[0].x;
  v_6.y = _World2Object[1].x;
  v_6.z = _World2Object[2].x;
  v_6.w = _World2Object[3].x;
  vec4 v_7;
  v_7.x = _World2Object[0].y;
  v_7.y = _World2Object[1].y;
  v_7.z = _World2Object[2].y;
  v_7.w = _World2Object[3].y;
  vec4 v_8;
  v_8.x = _World2Object[0].z;
  v_8.y = _World2Object[1].z;
  v_8.z = _World2Object[2].z;
  v_8.w = _World2Object[3].z;
  vec3 tmpvar_9;
  tmpvar_9 = normalize(((
    (v_6.xyz * gl_Normal.x)
   + 
    (v_7.xyz * gl_Normal.y)
  ) + (v_8.xyz * gl_Normal.z)));
  vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = tmpvar_9;
  vec3 x2_11;
  vec3 x1_12;
  x1_12.x = dot (unity_SHAr, tmpvar_10);
  x1_12.y = dot (unity_SHAg, tmpvar_10);
  x1_12.z = dot (unity_SHAb, tmpvar_10);
  vec4 tmpvar_13;
  tmpvar_13 = (tmpvar_9.xyzz * tmpvar_9.yzzx);
  x2_11.x = dot (unity_SHBr, tmpvar_13);
  x2_11.y = dot (unity_SHBg, tmpvar_13);
  x2_11.z = dot (unity_SHBb, tmpvar_13);
  gl_Position = tmpvar_2;
  xlv_TEXCOORD0 = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = (_Object2World * gl_Vertex).xyz;
  xlv_TEXCOORD2 = o_3;
  xlv_TEXCOORD3 = tmpvar_1;
  xlv_TEXCOORD4 = ((x2_11 + (unity_SHC.xyz * 
    ((tmpvar_9.x * tmpvar_9.x) - (tmpvar_9.y * tmpvar_9.y))
  )) + x1_12);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform vec4 _Color;
uniform sampler2D _LightBuffer;
uniform float _Cutoff;
varying vec2 xlv_TEXCOORD0;
varying vec4 xlv_TEXCOORD2;
varying vec3 xlv_TEXCOORD4;
void main ()
{
  vec4 light_1;
  vec4 tmpvar_2;
  tmpvar_2 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  float x_3;
  x_3 = (tmpvar_2.w - _Cutoff);
  if ((x_3 < 0.0)) {
    discard;
  };
  vec4 tmpvar_4;
  tmpvar_4 = -(log2(texture2DProj (_LightBuffer, xlv_TEXCOORD2)));
  light_1.w = tmpvar_4.w;
  light_1.xyz = (tmpvar_4.xyz + xlv_TEXCOORD4);
  vec4 c_5;
  c_5.xyz = (tmpvar_2.xyz * light_1.xyz);
  c_5.w = tmpvar_2.w;
  gl_FragData[0] = c_5;
}


#endif
"
}
SubProgram "d3d9 " {
// Stats: 33 math
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 4 [_Object2World] 3
Matrix 7 [_World2Object] 3
Matrix 0 [glstate_matrix_mvp]
Vector 19 [_MainTex_ST]
Vector 10 [_ProjectionParams]
Vector 11 [_ScreenParams]
Vector 14 [unity_SHAb]
Vector 13 [unity_SHAg]
Vector 12 [unity_SHAr]
Vector 17 [unity_SHBb]
Vector 16 [unity_SHBg]
Vector 15 [unity_SHBr]
Vector 18 [unity_SHC]
"vs_2_0
def c20, 0.5, 1, 0, 0
dcl_position v0
dcl_normal v1
dcl_texcoord v2
mad oT0.xy, v2, c19, c19.zwzw
dp4 oT1.x, c4, v0
dp4 oT1.y, c5, v0
dp4 oT1.z, c6, v0
dp4 r0.y, c1, v0
mul r1.x, r0.y, c10.x
mul r1.w, r1.x, c20.x
dp4 r0.x, c0, v0
dp4 r0.w, c3, v0
mul r1.xz, r0.xyww, c20.x
mad oT2.xy, r1.z, c11.zwzw, r1.xwzw
mul r1.xyz, v1.y, c8
mad r1.xyz, c7, v1.x, r1
mad r1.xyz, c9, v1.z, r1
nrm r2.xyz, r1
mul r1.x, r2.y, r2.y
mad r1.x, r2.x, r2.x, -r1.x
mul r3, r2.yzzx, r2.xyzz
dp4 r4.x, c15, r3
dp4 r4.y, c16, r3
dp4 r4.z, c17, r3
mad r1.xyz, c18, r1.x, r4
mov r2.w, c20.y
dp4 r3.x, c12, r2
dp4 r3.y, c13, r2
dp4 r3.z, c14, r2
add oT4.xyz, r1, r3
dp4 r0.z, c2, v0
mov oPos, r0
mov oT2.zw, r0
mov oT3, c20.z

"
}
SubProgram "d3d11 " {
// Stats: 37 math
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 208
Vector 160 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 144
Vector 80 [_ProjectionParams]
ConstBuffer "UnityLighting" 720
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0
eefiecedcnicklgnmiabeimkjaeheiakhcdoadfmabaaaaaammahaaaaadaaaaaa
cmaaaaaaceabaaaanmabaaaaejfdeheopaaaaaaaaiaaaaaaaiaaaaaamiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaanbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaanjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaaoaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaaoaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaoaaaaaaaacaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaaoaaaaaaaadaaaaaaaaaaaaaaadaaaaaaagaaaaaa
apaaaaaaojaaaaaaaaaaaaaaaaaaaaaaadaaaaaaahaaaaaaapaaaaaafaepfdej
feejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepem
epfcaaklepfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
adamaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaiaaaakeaaaaaa
acaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapaaaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaa
ahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefc
oiafaaaaeaaaabaahkabaaaafjaaaaaeegiocaaaaaaaaaaaalaaaaaafjaaaaae
egiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaacnaaaaaafjaaaaae
egiocaaaadaaaaaabdaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaa
acaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaadpccabaaa
adaaaaaagfaaaaadpccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagiaaaaac
aeaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaaf
pccabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaakaaaaaaogikcaaaaaaaaaaaakaaaaaadiaaaaai
hcaabaaaabaaaaaafgbfbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaak
hcaabaaaabaaaaaaegiccaaaadaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaa
abaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaadaaaaaaaoaaaaaakgbkbaaa
aaaaaaaaegacbaaaabaaaaaadcaaaaakhccabaaaacaaaaaaegiccaaaadaaaaaa
apaaaaaapgbpbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaaiccaabaaaaaaaaaaa
bkaabaaaaaaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaakncaabaaaabaaaaaa
agahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadpdgaaaaaf
mccabaaaadaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaaadaaaaaakgakbaaa
abaaaaaamgaabaaaabaaaaaadgaaaaaipccabaaaaeaaaaaaaceaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaadiaaaaaibcaabaaaaaaaaaaaakbabaaaacaaaaaa
akiacaaaadaaaaaabaaaaaaadiaaaaaiccaabaaaaaaaaaaaakbabaaaacaaaaaa
akiacaaaadaaaaaabbaaaaaadiaaaaaiecaabaaaaaaaaaaaakbabaaaacaaaaaa
akiacaaaadaaaaaabcaaaaaadiaaaaaibcaabaaaabaaaaaabkbabaaaacaaaaaa
bkiacaaaadaaaaaabaaaaaaadiaaaaaiccaabaaaabaaaaaabkbabaaaacaaaaaa
bkiacaaaadaaaaaabbaaaaaadiaaaaaiecaabaaaabaaaaaabkbabaaaacaaaaaa
bkiacaaaadaaaaaabcaaaaaaaaaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egacbaaaabaaaaaadiaaaaaibcaabaaaabaaaaaackbabaaaacaaaaaackiacaaa
adaaaaaabaaaaaaadiaaaaaiccaabaaaabaaaaaackbabaaaacaaaaaackiacaaa
adaaaaaabbaaaaaadiaaaaaiecaabaaaabaaaaaackbabaaaacaaaaaackiacaaa
adaaaaaabcaaaaaaaaaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaa
abaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaa
eeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaa
pgapbaaaaaaaaaaaegacbaaaaaaaaaaadiaaaaahbcaabaaaabaaaaaabkaabaaa
aaaaaaaabkaabaaaaaaaaaaadcaaaaakbcaabaaaabaaaaaaakaabaaaaaaaaaaa
akaabaaaaaaaaaaaakaabaiaebaaaaaaabaaaaaadiaaaaahpcaabaaaacaaaaaa
jgacbaaaaaaaaaaaegakbaaaaaaaaaaabbaaaaaibcaabaaaadaaaaaaegiocaaa
acaaaaaacjaaaaaaegaobaaaacaaaaaabbaaaaaiccaabaaaadaaaaaaegiocaaa
acaaaaaackaaaaaaegaobaaaacaaaaaabbaaaaaiecaabaaaadaaaaaaegiocaaa
acaaaaaaclaaaaaaegaobaaaacaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaa
acaaaaaacmaaaaaaagaabaaaabaaaaaaegacbaaaadaaaaaadgaaaaaficaabaaa
aaaaaaaaabeaaaaaaaaaiadpbbaaaaaibcaabaaaacaaaaaaegiocaaaacaaaaaa
cgaaaaaaegaobaaaaaaaaaaabbaaaaaiccaabaaaacaaaaaaegiocaaaacaaaaaa
chaaaaaaegaobaaaaaaaaaaabbaaaaaiecaabaaaacaaaaaaegiocaaaacaaaaaa
ciaaaaaaegaobaaaaaaaaaaaaaaaaaahhccabaaaafaaaaaaegacbaaaabaaaaaa
egacbaaaacaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 37 math
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 208
Vector 160 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 144
Vector 80 [_ProjectionParams]
ConstBuffer "UnityLighting" 720
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0_level_9_1
eefiecedngkaammpkmebnfpgomliieacaneogfdgabaaaaaacealaaaaaeaaaaaa
daaaaaaaieadaaaaheajaaaagmakaaaaebgpgodjemadaaaaemadaaaaaaacpopp
oiacaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaakaa
abaaabaaaaaaaaaaabaaafaaabaaacaaaaaaaaaaacaacgaaahaaadaaaaaaaaaa
adaaaaaaaeaaakaaaaaaaaaaadaaamaaahaaaoaaaaaaaaaaaaaaaaaaaaacpopp
fbaaaaafbfaaapkaaaaaaadpaaaaiadpaaaaaaaaaaaaaaaabpaaaaacafaaaaia
aaaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjaaeaaaaae
aaaaadoaadaaoejaabaaoekaabaaookaafaaaaadaaaaahiaaaaaffjaapaaoeka
aeaaaaaeaaaaahiaaoaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaahiabaaaoeka
aaaakkjaaaaaoeiaaeaaaaaeabaaahoabbaaoekaaaaappjaaaaaoeiaafaaaaad
aaaaapiaaaaaffjaalaaoekaaeaaaaaeaaaaapiaakaaoekaaaaaaajaaaaaoeia
aeaaaaaeaaaaapiaamaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaanaaoeka
aaaappjaaaaaoeiaafaaaaadabaaabiaaaaaffiaacaaaakaafaaaaadabaaaiia
abaaaaiabfaaaakaafaaaaadabaaafiaaaaapeiabfaaaakaacaaaaadacaaadoa
abaakkiaabaaomiaafaaaaadabaaabiaacaaaajabcaaaakaafaaaaadabaaacia
acaaaajabdaaaakaafaaaaadabaaaeiaacaaaajabeaaaakaafaaaaadacaaabia
acaaffjabcaaffkaafaaaaadacaaaciaacaaffjabdaaffkaafaaaaadacaaaeia
acaaffjabeaaffkaacaaaaadabaaahiaabaaoeiaacaaoeiaafaaaaadacaaabia
acaakkjabcaakkkaafaaaaadacaaaciaacaakkjabdaakkkaafaaaaadacaaaeia
acaakkjabeaakkkaacaaaaadabaaahiaabaaoeiaacaaoeiaceaaaaacacaaahia
abaaoeiaafaaaaadabaaabiaacaaffiaacaaffiaaeaaaaaeabaaabiaacaaaaia
acaaaaiaabaaaaibafaaaaadadaaapiaacaacjiaacaakeiaajaaaaadaeaaabia
agaaoekaadaaoeiaajaaaaadaeaaaciaahaaoekaadaaoeiaajaaaaadaeaaaeia
aiaaoekaadaaoeiaaeaaaaaeabaaahiaajaaoekaabaaaaiaaeaaoeiaabaaaaac
acaaaiiabfaaffkaajaaaaadadaaabiaadaaoekaacaaoeiaajaaaaadadaaacia
aeaaoekaacaaoeiaajaaaaadadaaaeiaafaaoekaacaaoeiaacaaaaadaeaaahoa
abaaoeiaadaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaac
aaaaammaaaaaoeiaabaaaaacacaaamoaaaaaoeiaabaaaaacadaaapoabfaakkka
ppppaaaafdeieefcoiafaaaaeaaaabaahkabaaaafjaaaaaeegiocaaaaaaaaaaa
alaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaa
cnaaaaaafjaaaaaeegiocaaaadaaaaaabdaaaaaafpaaaaadpcbabaaaaaaaaaaa
fpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaa
gfaaaaadpccabaaaadaaaaaagfaaaaadpccabaaaaeaaaaaagfaaaaadhccabaaa
afaaaaaagiaaaaacaeaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaa
aaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaa
aaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaa
abaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaakaaaaaaogikcaaaaaaaaaaa
akaaaaaadiaaaaaihcaabaaaabaaaaaafgbfbaaaaaaaaaaaegiccaaaadaaaaaa
anaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaadaaaaaaamaaaaaaagbabaaa
aaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaadaaaaaa
aoaaaaaakgbkbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhccabaaaacaaaaaa
egiccaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaai
ccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaak
ncaabaaaabaaaaaaagahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadp
aaaaaadpdgaaaaafmccabaaaadaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaa
adaaaaaakgakbaaaabaaaaaamgaabaaaabaaaaaadgaaaaaipccabaaaaeaaaaaa
aceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadiaaaaaibcaabaaaaaaaaaaa
akbabaaaacaaaaaaakiacaaaadaaaaaabaaaaaaadiaaaaaiccaabaaaaaaaaaaa
akbabaaaacaaaaaaakiacaaaadaaaaaabbaaaaaadiaaaaaiecaabaaaaaaaaaaa
akbabaaaacaaaaaaakiacaaaadaaaaaabcaaaaaadiaaaaaibcaabaaaabaaaaaa
bkbabaaaacaaaaaabkiacaaaadaaaaaabaaaaaaadiaaaaaiccaabaaaabaaaaaa
bkbabaaaacaaaaaabkiacaaaadaaaaaabbaaaaaadiaaaaaiecaabaaaabaaaaaa
bkbabaaaacaaaaaabkiacaaaadaaaaaabcaaaaaaaaaaaaahhcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaaibcaabaaaabaaaaaackbabaaa
acaaaaaackiacaaaadaaaaaabaaaaaaadiaaaaaiccaabaaaabaaaaaackbabaaa
acaaaaaackiacaaaadaaaaaabbaaaaaadiaaaaaiecaabaaaabaaaaaackbabaaa
acaaaaaackiacaaaadaaaaaabcaaaaaaaaaaaaahhcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaabaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaaaaaaaaa
egacbaaaaaaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaah
hcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaadiaaaaahbcaabaaa
abaaaaaabkaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaakbcaabaaaabaaaaaa
akaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaiaebaaaaaaabaaaaaadiaaaaah
pcaabaaaacaaaaaajgacbaaaaaaaaaaaegakbaaaaaaaaaaabbaaaaaibcaabaaa
adaaaaaaegiocaaaacaaaaaacjaaaaaaegaobaaaacaaaaaabbaaaaaiccaabaaa
adaaaaaaegiocaaaacaaaaaackaaaaaaegaobaaaacaaaaaabbaaaaaiecaabaaa
adaaaaaaegiocaaaacaaaaaaclaaaaaaegaobaaaacaaaaaadcaaaaakhcaabaaa
abaaaaaaegiccaaaacaaaaaacmaaaaaaagaabaaaabaaaaaaegacbaaaadaaaaaa
dgaaaaaficaabaaaaaaaaaaaabeaaaaaaaaaiadpbbaaaaaibcaabaaaacaaaaaa
egiocaaaacaaaaaacgaaaaaaegaobaaaaaaaaaaabbaaaaaiccaabaaaacaaaaaa
egiocaaaacaaaaaachaaaaaaegaobaaaaaaaaaaabbaaaaaiecaabaaaacaaaaaa
egiocaaaacaaaaaaciaaaaaaegaobaaaaaaaaaaaaaaaaaahhccabaaaafaaaaaa
egacbaaaabaaaaaaegacbaaaacaaaaaadoaaaaabejfdeheopaaaaaaaaiaaaaaa
aiaaaaaamiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaanbaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaanjaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahahaaaaoaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apadaaaaoaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaoaaaaaaa
acaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaaoaaaaaaaadaaaaaaaaaaaaaa
adaaaaaaagaaaaaaapaaaaaaojaaaaaaaaaaaaaaaaaaaaaaadaaaaaaahaaaaaa
apaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffied
epepfceeaaedepemepfcaaklepfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadamaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaiaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklkl"
}
SubProgram "opengl " {
// Stats: 5 math, 3 textures, 1 branches
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" }
"!!GLSL
#ifdef VERTEX
uniform vec4 _ProjectionParams;
uniform vec4 unity_SHAr;
uniform vec4 unity_SHAg;
uniform vec4 unity_SHAb;
uniform vec4 unity_SHBr;
uniform vec4 unity_SHBg;
uniform vec4 unity_SHBb;
uniform vec4 unity_SHC;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 _MainTex_ST;
varying vec2 xlv_TEXCOORD0;
varying vec3 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD3;
varying vec3 xlv_TEXCOORD4;
void main ()
{
  vec4 tmpvar_1;
  vec4 tmpvar_2;
  tmpvar_2 = (gl_ModelViewProjectionMatrix * gl_Vertex);
  vec4 o_3;
  vec4 tmpvar_4;
  tmpvar_4 = (tmpvar_2 * 0.5);
  vec2 tmpvar_5;
  tmpvar_5.x = tmpvar_4.x;
  tmpvar_5.y = (tmpvar_4.y * _ProjectionParams.x);
  o_3.xy = (tmpvar_5 + tmpvar_4.w);
  o_3.zw = tmpvar_2.zw;
  tmpvar_1.zw = vec2(0.0, 0.0);
  tmpvar_1.xy = vec2(0.0, 0.0);
  vec4 v_6;
  v_6.x = _World2Object[0].x;
  v_6.y = _World2Object[1].x;
  v_6.z = _World2Object[2].x;
  v_6.w = _World2Object[3].x;
  vec4 v_7;
  v_7.x = _World2Object[0].y;
  v_7.y = _World2Object[1].y;
  v_7.z = _World2Object[2].y;
  v_7.w = _World2Object[3].y;
  vec4 v_8;
  v_8.x = _World2Object[0].z;
  v_8.y = _World2Object[1].z;
  v_8.z = _World2Object[2].z;
  v_8.w = _World2Object[3].z;
  vec3 tmpvar_9;
  tmpvar_9 = normalize(((
    (v_6.xyz * gl_Normal.x)
   + 
    (v_7.xyz * gl_Normal.y)
  ) + (v_8.xyz * gl_Normal.z)));
  vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = tmpvar_9;
  vec3 x2_11;
  vec3 x1_12;
  x1_12.x = dot (unity_SHAr, tmpvar_10);
  x1_12.y = dot (unity_SHAg, tmpvar_10);
  x1_12.z = dot (unity_SHAb, tmpvar_10);
  vec4 tmpvar_13;
  tmpvar_13 = (tmpvar_9.xyzz * tmpvar_9.yzzx);
  x2_11.x = dot (unity_SHBr, tmpvar_13);
  x2_11.y = dot (unity_SHBg, tmpvar_13);
  x2_11.z = dot (unity_SHBb, tmpvar_13);
  gl_Position = tmpvar_2;
  xlv_TEXCOORD0 = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = (_Object2World * gl_Vertex).xyz;
  xlv_TEXCOORD2 = o_3;
  xlv_TEXCOORD3 = tmpvar_1;
  xlv_TEXCOORD4 = ((x2_11 + (unity_SHC.xyz * 
    ((tmpvar_9.x * tmpvar_9.x) - (tmpvar_9.y * tmpvar_9.y))
  )) + x1_12);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform vec4 _Color;
uniform sampler2D _LightBuffer;
uniform float _Cutoff;
varying vec2 xlv_TEXCOORD0;
varying vec4 xlv_TEXCOORD2;
varying vec3 xlv_TEXCOORD4;
void main ()
{
  vec4 light_1;
  vec4 tmpvar_2;
  tmpvar_2 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  float x_3;
  x_3 = (tmpvar_2.w - _Cutoff);
  if ((x_3 < 0.0)) {
    discard;
  };
  vec4 tmpvar_4;
  tmpvar_4 = texture2DProj (_LightBuffer, xlv_TEXCOORD2);
  light_1.w = tmpvar_4.w;
  light_1.xyz = (tmpvar_4.xyz + xlv_TEXCOORD4);
  vec4 c_5;
  c_5.xyz = (tmpvar_2.xyz * light_1.xyz);
  c_5.w = tmpvar_2.w;
  gl_FragData[0] = c_5;
}


#endif
"
}
SubProgram "d3d9 " {
// Stats: 33 math
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 4 [_Object2World] 3
Matrix 7 [_World2Object] 3
Matrix 0 [glstate_matrix_mvp]
Vector 19 [_MainTex_ST]
Vector 10 [_ProjectionParams]
Vector 11 [_ScreenParams]
Vector 14 [unity_SHAb]
Vector 13 [unity_SHAg]
Vector 12 [unity_SHAr]
Vector 17 [unity_SHBb]
Vector 16 [unity_SHBg]
Vector 15 [unity_SHBr]
Vector 18 [unity_SHC]
"vs_2_0
def c20, 0.5, 1, 0, 0
dcl_position v0
dcl_normal v1
dcl_texcoord v2
mad oT0.xy, v2, c19, c19.zwzw
dp4 oT1.x, c4, v0
dp4 oT1.y, c5, v0
dp4 oT1.z, c6, v0
dp4 r0.y, c1, v0
mul r1.x, r0.y, c10.x
mul r1.w, r1.x, c20.x
dp4 r0.x, c0, v0
dp4 r0.w, c3, v0
mul r1.xz, r0.xyww, c20.x
mad oT2.xy, r1.z, c11.zwzw, r1.xwzw
mul r1.xyz, v1.y, c8
mad r1.xyz, c7, v1.x, r1
mad r1.xyz, c9, v1.z, r1
nrm r2.xyz, r1
mul r1.x, r2.y, r2.y
mad r1.x, r2.x, r2.x, -r1.x
mul r3, r2.yzzx, r2.xyzz
dp4 r4.x, c15, r3
dp4 r4.y, c16, r3
dp4 r4.z, c17, r3
mad r1.xyz, c18, r1.x, r4
mov r2.w, c20.y
dp4 r3.x, c12, r2
dp4 r3.y, c13, r2
dp4 r3.z, c14, r2
add oT4.xyz, r1, r3
dp4 r0.z, c2, v0
mov oPos, r0
mov oT2.zw, r0
mov oT3, c20.z

"
}
SubProgram "d3d11 " {
// Stats: 37 math
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 208
Vector 160 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 144
Vector 80 [_ProjectionParams]
ConstBuffer "UnityLighting" 720
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0
eefiecedcnicklgnmiabeimkjaeheiakhcdoadfmabaaaaaammahaaaaadaaaaaa
cmaaaaaaceabaaaanmabaaaaejfdeheopaaaaaaaaiaaaaaaaiaaaaaamiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaanbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaanjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaaoaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaaoaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaoaaaaaaaacaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaaoaaaaaaaadaaaaaaaaaaaaaaadaaaaaaagaaaaaa
apaaaaaaojaaaaaaaaaaaaaaaaaaaaaaadaaaaaaahaaaaaaapaaaaaafaepfdej
feejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepem
epfcaaklepfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
adamaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaiaaaakeaaaaaa
acaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapaaaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaa
ahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefc
oiafaaaaeaaaabaahkabaaaafjaaaaaeegiocaaaaaaaaaaaalaaaaaafjaaaaae
egiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaacnaaaaaafjaaaaae
egiocaaaadaaaaaabdaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaa
acaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaadpccabaaa
adaaaaaagfaaaaadpccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagiaaaaac
aeaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaaf
pccabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaakaaaaaaogikcaaaaaaaaaaaakaaaaaadiaaaaai
hcaabaaaabaaaaaafgbfbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaak
hcaabaaaabaaaaaaegiccaaaadaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaa
abaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaadaaaaaaaoaaaaaakgbkbaaa
aaaaaaaaegacbaaaabaaaaaadcaaaaakhccabaaaacaaaaaaegiccaaaadaaaaaa
apaaaaaapgbpbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaaiccaabaaaaaaaaaaa
bkaabaaaaaaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaakncaabaaaabaaaaaa
agahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadpdgaaaaaf
mccabaaaadaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaaadaaaaaakgakbaaa
abaaaaaamgaabaaaabaaaaaadgaaaaaipccabaaaaeaaaaaaaceaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaadiaaaaaibcaabaaaaaaaaaaaakbabaaaacaaaaaa
akiacaaaadaaaaaabaaaaaaadiaaaaaiccaabaaaaaaaaaaaakbabaaaacaaaaaa
akiacaaaadaaaaaabbaaaaaadiaaaaaiecaabaaaaaaaaaaaakbabaaaacaaaaaa
akiacaaaadaaaaaabcaaaaaadiaaaaaibcaabaaaabaaaaaabkbabaaaacaaaaaa
bkiacaaaadaaaaaabaaaaaaadiaaaaaiccaabaaaabaaaaaabkbabaaaacaaaaaa
bkiacaaaadaaaaaabbaaaaaadiaaaaaiecaabaaaabaaaaaabkbabaaaacaaaaaa
bkiacaaaadaaaaaabcaaaaaaaaaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egacbaaaabaaaaaadiaaaaaibcaabaaaabaaaaaackbabaaaacaaaaaackiacaaa
adaaaaaabaaaaaaadiaaaaaiccaabaaaabaaaaaackbabaaaacaaaaaackiacaaa
adaaaaaabbaaaaaadiaaaaaiecaabaaaabaaaaaackbabaaaacaaaaaackiacaaa
adaaaaaabcaaaaaaaaaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaa
abaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaa
eeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaa
pgapbaaaaaaaaaaaegacbaaaaaaaaaaadiaaaaahbcaabaaaabaaaaaabkaabaaa
aaaaaaaabkaabaaaaaaaaaaadcaaaaakbcaabaaaabaaaaaaakaabaaaaaaaaaaa
akaabaaaaaaaaaaaakaabaiaebaaaaaaabaaaaaadiaaaaahpcaabaaaacaaaaaa
jgacbaaaaaaaaaaaegakbaaaaaaaaaaabbaaaaaibcaabaaaadaaaaaaegiocaaa
acaaaaaacjaaaaaaegaobaaaacaaaaaabbaaaaaiccaabaaaadaaaaaaegiocaaa
acaaaaaackaaaaaaegaobaaaacaaaaaabbaaaaaiecaabaaaadaaaaaaegiocaaa
acaaaaaaclaaaaaaegaobaaaacaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaa
acaaaaaacmaaaaaaagaabaaaabaaaaaaegacbaaaadaaaaaadgaaaaaficaabaaa
aaaaaaaaabeaaaaaaaaaiadpbbaaaaaibcaabaaaacaaaaaaegiocaaaacaaaaaa
cgaaaaaaegaobaaaaaaaaaaabbaaaaaiccaabaaaacaaaaaaegiocaaaacaaaaaa
chaaaaaaegaobaaaaaaaaaaabbaaaaaiecaabaaaacaaaaaaegiocaaaacaaaaaa
ciaaaaaaegaobaaaaaaaaaaaaaaaaaahhccabaaaafaaaaaaegacbaaaabaaaaaa
egacbaaaacaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 37 math
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 208
Vector 160 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 144
Vector 80 [_ProjectionParams]
ConstBuffer "UnityLighting" 720
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0_level_9_1
eefiecedngkaammpkmebnfpgomliieacaneogfdgabaaaaaacealaaaaaeaaaaaa
daaaaaaaieadaaaaheajaaaagmakaaaaebgpgodjemadaaaaemadaaaaaaacpopp
oiacaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaakaa
abaaabaaaaaaaaaaabaaafaaabaaacaaaaaaaaaaacaacgaaahaaadaaaaaaaaaa
adaaaaaaaeaaakaaaaaaaaaaadaaamaaahaaaoaaaaaaaaaaaaaaaaaaaaacpopp
fbaaaaafbfaaapkaaaaaaadpaaaaiadpaaaaaaaaaaaaaaaabpaaaaacafaaaaia
aaaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjaaeaaaaae
aaaaadoaadaaoejaabaaoekaabaaookaafaaaaadaaaaahiaaaaaffjaapaaoeka
aeaaaaaeaaaaahiaaoaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaahiabaaaoeka
aaaakkjaaaaaoeiaaeaaaaaeabaaahoabbaaoekaaaaappjaaaaaoeiaafaaaaad
aaaaapiaaaaaffjaalaaoekaaeaaaaaeaaaaapiaakaaoekaaaaaaajaaaaaoeia
aeaaaaaeaaaaapiaamaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaanaaoeka
aaaappjaaaaaoeiaafaaaaadabaaabiaaaaaffiaacaaaakaafaaaaadabaaaiia
abaaaaiabfaaaakaafaaaaadabaaafiaaaaapeiabfaaaakaacaaaaadacaaadoa
abaakkiaabaaomiaafaaaaadabaaabiaacaaaajabcaaaakaafaaaaadabaaacia
acaaaajabdaaaakaafaaaaadabaaaeiaacaaaajabeaaaakaafaaaaadacaaabia
acaaffjabcaaffkaafaaaaadacaaaciaacaaffjabdaaffkaafaaaaadacaaaeia
acaaffjabeaaffkaacaaaaadabaaahiaabaaoeiaacaaoeiaafaaaaadacaaabia
acaakkjabcaakkkaafaaaaadacaaaciaacaakkjabdaakkkaafaaaaadacaaaeia
acaakkjabeaakkkaacaaaaadabaaahiaabaaoeiaacaaoeiaceaaaaacacaaahia
abaaoeiaafaaaaadabaaabiaacaaffiaacaaffiaaeaaaaaeabaaabiaacaaaaia
acaaaaiaabaaaaibafaaaaadadaaapiaacaacjiaacaakeiaajaaaaadaeaaabia
agaaoekaadaaoeiaajaaaaadaeaaaciaahaaoekaadaaoeiaajaaaaadaeaaaeia
aiaaoekaadaaoeiaaeaaaaaeabaaahiaajaaoekaabaaaaiaaeaaoeiaabaaaaac
acaaaiiabfaaffkaajaaaaadadaaabiaadaaoekaacaaoeiaajaaaaadadaaacia
aeaaoekaacaaoeiaajaaaaadadaaaeiaafaaoekaacaaoeiaacaaaaadaeaaahoa
abaaoeiaadaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaac
aaaaammaaaaaoeiaabaaaaacacaaamoaaaaaoeiaabaaaaacadaaapoabfaakkka
ppppaaaafdeieefcoiafaaaaeaaaabaahkabaaaafjaaaaaeegiocaaaaaaaaaaa
alaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaa
cnaaaaaafjaaaaaeegiocaaaadaaaaaabdaaaaaafpaaaaadpcbabaaaaaaaaaaa
fpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaa
gfaaaaadpccabaaaadaaaaaagfaaaaadpccabaaaaeaaaaaagfaaaaadhccabaaa
afaaaaaagiaaaaacaeaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaa
aaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaa
aaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaa
abaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaakaaaaaaogikcaaaaaaaaaaa
akaaaaaadiaaaaaihcaabaaaabaaaaaafgbfbaaaaaaaaaaaegiccaaaadaaaaaa
anaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaadaaaaaaamaaaaaaagbabaaa
aaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaadaaaaaa
aoaaaaaakgbkbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhccabaaaacaaaaaa
egiccaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaai
ccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaak
ncaabaaaabaaaaaaagahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadp
aaaaaadpdgaaaaafmccabaaaadaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaa
adaaaaaakgakbaaaabaaaaaamgaabaaaabaaaaaadgaaaaaipccabaaaaeaaaaaa
aceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadiaaaaaibcaabaaaaaaaaaaa
akbabaaaacaaaaaaakiacaaaadaaaaaabaaaaaaadiaaaaaiccaabaaaaaaaaaaa
akbabaaaacaaaaaaakiacaaaadaaaaaabbaaaaaadiaaaaaiecaabaaaaaaaaaaa
akbabaaaacaaaaaaakiacaaaadaaaaaabcaaaaaadiaaaaaibcaabaaaabaaaaaa
bkbabaaaacaaaaaabkiacaaaadaaaaaabaaaaaaadiaaaaaiccaabaaaabaaaaaa
bkbabaaaacaaaaaabkiacaaaadaaaaaabbaaaaaadiaaaaaiecaabaaaabaaaaaa
bkbabaaaacaaaaaabkiacaaaadaaaaaabcaaaaaaaaaaaaahhcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaaibcaabaaaabaaaaaackbabaaa
acaaaaaackiacaaaadaaaaaabaaaaaaadiaaaaaiccaabaaaabaaaaaackbabaaa
acaaaaaackiacaaaadaaaaaabbaaaaaadiaaaaaiecaabaaaabaaaaaackbabaaa
acaaaaaackiacaaaadaaaaaabcaaaaaaaaaaaaahhcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaabaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaaaaaaaaa
egacbaaaaaaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaah
hcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaadiaaaaahbcaabaaa
abaaaaaabkaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaakbcaabaaaabaaaaaa
akaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaiaebaaaaaaabaaaaaadiaaaaah
pcaabaaaacaaaaaajgacbaaaaaaaaaaaegakbaaaaaaaaaaabbaaaaaibcaabaaa
adaaaaaaegiocaaaacaaaaaacjaaaaaaegaobaaaacaaaaaabbaaaaaiccaabaaa
adaaaaaaegiocaaaacaaaaaackaaaaaaegaobaaaacaaaaaabbaaaaaiecaabaaa
adaaaaaaegiocaaaacaaaaaaclaaaaaaegaobaaaacaaaaaadcaaaaakhcaabaaa
abaaaaaaegiccaaaacaaaaaacmaaaaaaagaabaaaabaaaaaaegacbaaaadaaaaaa
dgaaaaaficaabaaaaaaaaaaaabeaaaaaaaaaiadpbbaaaaaibcaabaaaacaaaaaa
egiocaaaacaaaaaacgaaaaaaegaobaaaaaaaaaaabbaaaaaiccaabaaaacaaaaaa
egiocaaaacaaaaaachaaaaaaegaobaaaaaaaaaaabbaaaaaiecaabaaaacaaaaaa
egiocaaaacaaaaaaciaaaaaaegaobaaaaaaaaaaaaaaaaaahhccabaaaafaaaaaa
egacbaaaabaaaaaaegacbaaaacaaaaaadoaaaaabejfdeheopaaaaaaaaiaaaaaa
aiaaaaaamiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaanbaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaanjaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahahaaaaoaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apadaaaaoaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaoaaaaaaa
acaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaaoaaaaaaaadaaaaaaaaaaaaaa
adaaaaaaagaaaaaaapaaaaaaojaaaaaaaaaaaaaaaaaaaaaaadaaaaaaahaaaaaa
apaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffied
epepfceeaaedepemepfcaaklepfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadamaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaiaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklkl"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
"!!GLSL"
}
SubProgram "d3d9 " {
// Stats: 9 math, 3 textures
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Vector 0 [_Color]
Float 1 [_Cutoff]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightBuffer] 2D 1
"ps_2_0
dcl t0.xy
dcl t2
dcl t4.xyz
dcl_2d s0
dcl_2d s1
texld r0, t0, s0
mov r1.w, c0.w
mad_pp r1, r0.w, r1.w, -c1.x
mul_pp r0, r0, c0
texkill r1
texldp_pp r1, t2, s1
log_pp r2.x, r1.x
log_pp r2.y, r1.y
log_pp r2.z, r1.z
add_pp r1.xyz, -r2, t4
mul_pp r0.xyz, r0, r1
mov_pp oC0, r0

"
}
SubProgram "d3d11 " {
// Stats: 7 math, 2 textures
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightBuffer] 2D 1
ConstBuffer "$Globals" 208
Vector 144 [_Color]
Float 192 [_Cutoff]
BindCB  "$Globals" 0
"ps_4_0
eefiecedaapaheimbpoonkichldpdojebomkigcaabaaaaaaomacaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaaaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaapalaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcmmabaaaa
eaaaaaaahdaaaaaafjaaaaaeegiocaaaaaaaaaaaanaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaa
fibiaaaeaahabaaaabaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaad
lcbabaaaadaaaaaagcbaaaadhcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaa
giaaaaacacaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaa
aaaaaaaaaagabaaaaaaaaaaadcaaaaambcaabaaaabaaaaaadkaabaaaaaaaaaaa
dkiacaaaaaaaaaaaajaaaaaaakiacaiaebaaaaaaaaaaaaaaamaaaaaadiaaaaai
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaegiocaaaaaaaaaaaajaaaaaadbaaaaah
bcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaaaaanaaaeadakaabaaa
abaaaaaaaoaaaaahdcaabaaaabaaaaaaegbabaaaadaaaaaapgbpbaaaadaaaaaa
efaaaaajpcaabaaaabaaaaaaegaabaaaabaaaaaaeghobaaaabaaaaaaaagabaaa
abaaaaaacpaaaaafhcaabaaaabaaaaaaegacbaaaabaaaaaaaaaaaaaihcaabaaa
abaaaaaaegacbaiaebaaaaaaabaaaaaaegbcbaaaafaaaaaadiaaaaahhccabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaadgaaaaaficcabaaaaaaaaaaa
dkaabaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 7 math, 2 textures
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightBuffer] 2D 1
ConstBuffer "$Globals" 208
Vector 144 [_Color]
Float 192 [_Cutoff]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedhmbebiclplcjhhlkdlkcdjfiikjfpbggabaaaaaaeeaeaaaaaeaaaaaa
daaaaaaaieabaaaafiadaaaabaaeaaaaebgpgodjemabaaaaemabaaaaaaacpppp
aiabaaaaeeaaaaaaacaacmaaaaaaeeaaaaaaeeaaacaaceaaaaaaeeaaaaaaaaaa
abababaaaaaaajaaabaaaaaaaaaaaaaaaaaaamaaabaaabaaaaaaaaaaaaacpppp
bpaaaaacaaaaaaiaaaaaadlabpaaaaacaaaaaaiaacaaaplabpaaaaacaaaaaaia
aeaaahlabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaajaabaiapkaecaaaaad
aaaaapiaaaaaoelaaaaioekaabaaaaacabaaaiiaaaaappkaaeaaaaaeabaacpia
aaaappiaabaappiaabaaaakbafaaaaadaaaacpiaaaaaoeiaaaaaoekaagaaaaac
acaaaiiaacaapplaafaaaaadacaaadiaacaappiaacaaoelaebaaaaababaaapia
ecaaaaadabaacpiaacaaoeiaabaioekaapaaaaacacaacbiaabaaaaiaapaaaaac
acaacciaabaaffiaapaaaaacacaaceiaabaakkiaacaaaaadabaachiaacaaoeib
aeaaoelaafaaaaadaaaachiaaaaaoeiaabaaoeiaabaaaaacaaaicpiaaaaaoeia
ppppaaaafdeieefcmmabaaaaeaaaaaaahdaaaaaafjaaaaaeegiocaaaaaaaaaaa
anaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafibiaaae
aahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaagcbaaaad
dcbabaaaabaaaaaagcbaaaadlcbabaaaadaaaaaagcbaaaadhcbabaaaafaaaaaa
gfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaaefaaaaajpcaabaaaaaaaaaaa
egbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaadcaaaaambcaabaaa
abaaaaaadkaabaaaaaaaaaaadkiacaaaaaaaaaaaajaaaaaaakiacaiaebaaaaaa
aaaaaaaaamaaaaaadiaaaaaipcaabaaaaaaaaaaaegaobaaaaaaaaaaaegiocaaa
aaaaaaaaajaaaaaadbaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaa
aaaaaaaaanaaaeadakaabaaaabaaaaaaaoaaaaahdcaabaaaabaaaaaaegbabaaa
adaaaaaapgbpbaaaadaaaaaaefaaaaajpcaabaaaabaaaaaaegaabaaaabaaaaaa
eghobaaaabaaaaaaaagabaaaabaaaaaacpaaaaafhcaabaaaabaaaaaaegacbaaa
abaaaaaaaaaaaaaihcaabaaaabaaaaaaegacbaiaebaaaaaaabaaaaaaegbcbaaa
afaaaaaadiaaaaahhccabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaa
dgaaaaaficcabaaaaaaaaaaadkaabaaaaaaaaaaadoaaaaabejfdeheolaaaaaaa
agaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
keaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaakeaaaaaaabaaaaaa
aaaaaaaaadaaaaaaacaaaaaaahaaaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaa
adaaaaaaapalaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaa
keaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahahaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaa
caaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgf
heaaklkl"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" }
"!!GLSL"
}
SubProgram "d3d9 " {
// Stats: 6 math, 3 textures
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" }
Vector 0 [_Color]
Float 1 [_Cutoff]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightBuffer] 2D 1
"ps_2_0
dcl t0.xy
dcl t2
dcl t4.xyz
dcl_2d s0
dcl_2d s1
texld r0, t0, s0
mov r1.w, c0.w
mad_pp r1, r0.w, r1.w, -c1.x
mul_pp r0, r0, c0
texkill r1
texldp_pp r1, t2, s1
add_pp r1.xyz, r1, t4
mul_pp r0.xyz, r0, r1
mov_pp oC0, r0

"
}
SubProgram "d3d11 " {
// Stats: 6 math, 2 textures
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightBuffer] 2D 1
ConstBuffer "$Globals" 208
Vector 144 [_Color]
Float 192 [_Cutoff]
BindCB  "$Globals" 0
"ps_4_0
eefiecedffoeibbjflbnmefmpgnpeleeeppelmgaabaaaaaaneacaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaaaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaapalaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcleabaaaa
eaaaaaaagnaaaaaafjaaaaaeegiocaaaaaaaaaaaanaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaa
fibiaaaeaahabaaaabaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaad
lcbabaaaadaaaaaagcbaaaadhcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaa
giaaaaacacaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaa
aaaaaaaaaagabaaaaaaaaaaadcaaaaambcaabaaaabaaaaaadkaabaaaaaaaaaaa
dkiacaaaaaaaaaaaajaaaaaaakiacaiaebaaaaaaaaaaaaaaamaaaaaadiaaaaai
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaegiocaaaaaaaaaaaajaaaaaadbaaaaah
bcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaaaaanaaaeadakaabaaa
abaaaaaaaoaaaaahdcaabaaaabaaaaaaegbabaaaadaaaaaapgbpbaaaadaaaaaa
efaaaaajpcaabaaaabaaaaaaegaabaaaabaaaaaaeghobaaaabaaaaaaaagabaaa
abaaaaaaaaaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaaegbcbaaaafaaaaaa
diaaaaahhccabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaadgaaaaaf
iccabaaaaaaaaaaadkaabaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 6 math, 2 textures
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightBuffer] 2D 1
ConstBuffer "$Globals" 208
Vector 144 [_Color]
Float 192 [_Cutoff]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedklnmfalfooahioopmnhpbadhjffaimjbabaaaaaaaiaeaaaaaeaaaaaa
daaaaaaagaabaaaabmadaaaaneadaaaaebgpgodjciabaaaaciabaaaaaaacpppp
oeaaaaaaeeaaaaaaacaacmaaaaaaeeaaaaaaeeaaacaaceaaaaaaeeaaaaaaaaaa
abababaaaaaaajaaabaaaaaaaaaaaaaaaaaaamaaabaaabaaaaaaaaaaaaacpppp
bpaaaaacaaaaaaiaaaaaadlabpaaaaacaaaaaaiaacaaaplabpaaaaacaaaaaaia
aeaaahlabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaajaabaiapkaecaaaaad
aaaaapiaaaaaoelaaaaioekaabaaaaacabaaaiiaaaaappkaaeaaaaaeabaacpia
aaaappiaabaappiaabaaaakbafaaaaadaaaacpiaaaaaoeiaaaaaoekaagaaaaac
acaaaiiaacaapplaafaaaaadacaaadiaacaappiaacaaoelaebaaaaababaaapia
ecaaaaadabaacpiaacaaoeiaabaioekaacaaaaadabaachiaabaaoeiaaeaaoela
afaaaaadaaaachiaaaaaoeiaabaaoeiaabaaaaacaaaicpiaaaaaoeiappppaaaa
fdeieefcleabaaaaeaaaaaaagnaaaaaafjaaaaaeegiocaaaaaaaaaaaanaaaaaa
fkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaagcbaaaaddcbabaaa
abaaaaaagcbaaaadlcbabaaaadaaaaaagcbaaaadhcbabaaaafaaaaaagfaaaaad
pccabaaaaaaaaaaagiaaaaacacaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaa
abaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaadcaaaaambcaabaaaabaaaaaa
dkaabaaaaaaaaaaadkiacaaaaaaaaaaaajaaaaaaakiacaiaebaaaaaaaaaaaaaa
amaaaaaadiaaaaaipcaabaaaaaaaaaaaegaobaaaaaaaaaaaegiocaaaaaaaaaaa
ajaaaaaadbaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaaaa
anaaaeadakaabaaaabaaaaaaaoaaaaahdcaabaaaabaaaaaaegbabaaaadaaaaaa
pgbpbaaaadaaaaaaefaaaaajpcaabaaaabaaaaaaegaabaaaabaaaaaaeghobaaa
abaaaaaaaagabaaaabaaaaaaaaaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaa
egbcbaaaafaaaaaadiaaaaahhccabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaa
abaaaaaadgaaaaaficcabaaaaaaaaaaadkaabaaaaaaaaaaadoaaaaabejfdeheo
laaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaa
apaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaakeaaaaaa
abaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaaaaaakeaaaaaaacaaaaaaaaaaaaaa
adaaaaaaadaaaaaaapalaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
apaaaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahahaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklkl"
}
}
 }


 // Stats for Vertex shader:
 //       d3d11 : 44 math
 //    d3d11_9x : 44 math
 //        d3d9 : 46 math
 //      opengl : 20 avg math (19..21), 3 texture, 1 branch
 // Stats for Fragment shader:
 //       d3d11 : 13 avg math (13..14), 2 texture
 //    d3d11_9x : 13 avg math (13..14), 2 texture
 //        d3d9 : 26 avg math (25..28), 3 texture
 Pass {
  Name "DEFERRED"
  Tags { "LIGHTMODE"="Deferred" "QUEUE"="AlphaTest" "IGNOREPROJECTOR"="true" "RenderType"="TransparentCutout" }
  GpuProgramID 284925
Program "vp" {
SubProgram "opengl " {
// Stats: 21 math, 3 textures, 1 branches
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
"!!GLSL
#ifdef VERTEX
uniform vec4 unity_SHAr;
uniform vec4 unity_SHAg;
uniform vec4 unity_SHAb;
uniform vec4 unity_SHBr;
uniform vec4 unity_SHBg;
uniform vec4 unity_SHBb;
uniform vec4 unity_SHC;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 _MainTex_ST;
uniform vec4 _BumpMap_ST;
attribute vec4 TANGENT;
varying vec4 xlv_TEXCOORD0;
varying vec4 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD3;
varying vec4 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
void main ()
{
  vec4 tmpvar_1;
  vec4 tmpvar_2;
  tmpvar_1.xy = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_1.zw = ((gl_MultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  vec3 tmpvar_3;
  tmpvar_3 = (_Object2World * gl_Vertex).xyz;
  vec4 v_4;
  v_4.x = _World2Object[0].x;
  v_4.y = _World2Object[1].x;
  v_4.z = _World2Object[2].x;
  v_4.w = _World2Object[3].x;
  vec4 v_5;
  v_5.x = _World2Object[0].y;
  v_5.y = _World2Object[1].y;
  v_5.z = _World2Object[2].y;
  v_5.w = _World2Object[3].y;
  vec4 v_6;
  v_6.x = _World2Object[0].z;
  v_6.y = _World2Object[1].z;
  v_6.z = _World2Object[2].z;
  v_6.w = _World2Object[3].z;
  vec3 tmpvar_7;
  tmpvar_7 = normalize(((
    (v_4.xyz * gl_Normal.x)
   + 
    (v_5.xyz * gl_Normal.y)
  ) + (v_6.xyz * gl_Normal.z)));
  mat3 tmpvar_8;
  tmpvar_8[0] = _Object2World[0].xyz;
  tmpvar_8[1] = _Object2World[1].xyz;
  tmpvar_8[2] = _Object2World[2].xyz;
  vec3 tmpvar_9;
  tmpvar_9 = normalize((tmpvar_8 * TANGENT.xyz));
  vec3 tmpvar_10;
  tmpvar_10 = (((tmpvar_7.yzx * tmpvar_9.zxy) - (tmpvar_7.zxy * tmpvar_9.yzx)) * TANGENT.w);
  vec4 tmpvar_11;
  tmpvar_11.x = tmpvar_9.x;
  tmpvar_11.y = tmpvar_10.x;
  tmpvar_11.z = tmpvar_7.x;
  tmpvar_11.w = tmpvar_3.x;
  vec4 tmpvar_12;
  tmpvar_12.x = tmpvar_9.y;
  tmpvar_12.y = tmpvar_10.y;
  tmpvar_12.z = tmpvar_7.y;
  tmpvar_12.w = tmpvar_3.y;
  vec4 tmpvar_13;
  tmpvar_13.x = tmpvar_9.z;
  tmpvar_13.y = tmpvar_10.z;
  tmpvar_13.z = tmpvar_7.z;
  tmpvar_13.w = tmpvar_3.z;
  tmpvar_2.zw = vec2(0.0, 0.0);
  tmpvar_2.xy = vec2(0.0, 0.0);
  vec4 tmpvar_14;
  tmpvar_14.w = 1.0;
  tmpvar_14.xyz = tmpvar_7;
  vec3 x2_15;
  vec3 x1_16;
  x1_16.x = dot (unity_SHAr, tmpvar_14);
  x1_16.y = dot (unity_SHAg, tmpvar_14);
  x1_16.z = dot (unity_SHAb, tmpvar_14);
  vec4 tmpvar_17;
  tmpvar_17 = (tmpvar_7.xyzz * tmpvar_7.yzzx);
  x2_15.x = dot (unity_SHBr, tmpvar_17);
  x2_15.y = dot (unity_SHBg, tmpvar_17);
  x2_15.z = dot (unity_SHBb, tmpvar_17);
  gl_Position = (gl_ModelViewProjectionMatrix * gl_Vertex);
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_11;
  xlv_TEXCOORD2 = tmpvar_12;
  xlv_TEXCOORD3 = tmpvar_13;
  xlv_TEXCOORD5 = tmpvar_2;
  xlv_TEXCOORD6 = ((x2_15 + (unity_SHC.xyz * 
    ((tmpvar_7.x * tmpvar_7.x) - (tmpvar_7.y * tmpvar_7.y))
  )) + x1_16);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _BumpMap;
uniform vec4 _Color;
uniform float _Cutoff;
varying vec4 xlv_TEXCOORD0;
varying vec4 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD3;
varying vec3 xlv_TEXCOORD6;
void main ()
{
  vec4 outEmission_1;
  vec3 worldN_2;
  vec4 tmpvar_3;
  tmpvar_3 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) * _Color);
  vec3 normal_4;
  normal_4.xy = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).wy * 2.0) - 1.0);
  normal_4.z = sqrt((1.0 - clamp (
    dot (normal_4.xy, normal_4.xy)
  , 0.0, 1.0)));
  float x_5;
  x_5 = (tmpvar_3.w - _Cutoff);
  if ((x_5 < 0.0)) {
    discard;
  };
  worldN_2.x = dot (xlv_TEXCOORD1.xyz, normal_4);
  worldN_2.y = dot (xlv_TEXCOORD2.xyz, normal_4);
  worldN_2.z = dot (xlv_TEXCOORD3.xyz, normal_4);
  vec4 emission_6;
  vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = tmpvar_3.xyz;
  vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = ((worldN_2 * 0.5) + 0.5);
  emission_6.w = 1.0;
  emission_6.xyz = (tmpvar_3.xyz * xlv_TEXCOORD6);
  outEmission_1.w = emission_6.w;
  outEmission_1.xyz = exp2(-(emission_6.xyz));
  gl_FragData[0] = tmpvar_7;
  gl_FragData[1] = vec4(0.0, 0.0, 0.0, 0.0);
  gl_FragData[2] = tmpvar_8;
  gl_FragData[3] = outEmission_1;
}


#endif
"
}
SubProgram "d3d9 " {
// Stats: 46 math
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord4
Matrix 4 [_Object2World] 3
Matrix 7 [_World2Object] 3
Matrix 0 [glstate_matrix_mvp]
Vector 18 [_BumpMap_ST]
Vector 17 [_MainTex_ST]
Vector 12 [unity_SHAb]
Vector 11 [unity_SHAg]
Vector 10 [unity_SHAr]
Vector 15 [unity_SHBb]
Vector 14 [unity_SHBg]
Vector 13 [unity_SHBr]
Vector 16 [unity_SHC]
"vs_2_0
def c19, 1, 0, 0, 0
dcl_position v0
dcl_tangent v1
dcl_normal v2
dcl_texcoord v3
dp4 oPos.x, c0, v0
dp4 oPos.y, c1, v0
dp4 oPos.z, c2, v0
dp4 oPos.w, c3, v0
mad oT0.xy, v3, c17, c17.zwzw
mad oT0.zw, v3.xyxy, c18.xyxy, c18
dp4 oT1.w, c4, v0
dp4 oT2.w, c5, v0
dp4 oT3.w, c6, v0
mul r0.xyz, v2.y, c8
mad r0.xyz, c7, v2.x, r0
mad r0.xyz, c9, v2.z, r0
nrm r1.xyz, r0
mul r0.x, r1.y, r1.y
mad r0.x, r1.x, r1.x, -r0.x
mul r2, r1.yzzx, r1.xyzz
dp4 r3.x, c13, r2
dp4 r3.y, c14, r2
dp4 r3.z, c15, r2
mad r0.xyz, c16, r0.x, r3
mov r1.w, c19.x
dp4 r2.x, c10, r1
dp4 r2.y, c11, r1
dp4 r2.z, c12, r1
add oT6.xyz, r0, r2
dp3 r0.z, c4, v1
dp3 r0.x, c5, v1
dp3 r0.y, c6, v1
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul r0.xyz, r0.w, r0
mov oT1.x, r0.z
mul r2.xyz, r0, r1.zxyw
mad r2.xyz, r1.yzxw, r0.yzxw, -r2
mul r2.xyz, r2, v1.w
mov oT1.y, r2.x
mov oT1.z, r1.x
mov oT2.x, r0.x
mov oT3.x, r0.y
mov oT2.y, r2.y
mov oT3.y, r2.z
mov oT2.z, r1.y
mov oT3.z, r1.z
mov oT5, c19.y

"
}
SubProgram "d3d11 " {
// Stats: 44 math
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord4
ConstBuffer "$Globals" 224
Vector 160 [_MainTex_ST]
Vector 176 [_BumpMap_ST]
ConstBuffer "UnityLighting" 720
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedncenoapffcnlbfdkgoefepeafgphkbmpabaaaaaajiajaaaaadaaaaaa
cmaaaaaaceabaaaapeabaaaaejfdeheopaaaaaaaaiaaaaaaaiaaaaaamiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaanbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaanjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaaoaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaaoaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaoaaaaaaaacaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaaoaaaaaaaadaaaaaaaaaaaaaaadaaaaaaagaaaaaa
apaaaaaaojaaaaaaaaaaaaaaaaaaaaaaadaaaaaaahaaaaaaapaaaaaafaepfdej
feejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepem
epfcaaklepfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
apaaaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaalmaaaaaa
acaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaalmaaaaaaadaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapaaaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaafaaaaaa
apaaaaaalmaaaaaaagaaaaaaaaaaaaaaadaaaaaaagaaaaaaahaiaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefcjmahaaaaeaaaabaa
ohabaaaafjaaaaaeegiocaaaaaaaaaaaamaaaaaafjaaaaaeegiocaaaabaaaaaa
cnaaaaaafjaaaaaeegiocaaaacaaaaaabdaaaaaafpaaaaadpcbabaaaaaaaaaaa
fpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaa
adaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaa
gfaaaaadpccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaagfaaaaadpccabaaa
aeaaaaaagfaaaaadpccabaaaafaaaaaagfaaaaadhccabaaaagaaaaaagiaaaaac
aeaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaa
egiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaal
dccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaakaaaaaaogikcaaa
aaaaaaaaakaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaadaaaaaaagiecaaa
aaaaaaaaalaaaaaakgiocaaaaaaaaaaaalaaaaaadiaaaaaihcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaa
aaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaapaaaaaapgbpbaaa
aaaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaaacaaaaaaakaabaaaaaaaaaaa
diaaaaaihcaabaaaabaaaaaafgbfbaaaabaaaaaajgiecaaaacaaaaaaanaaaaaa
dcaaaaakhcaabaaaabaaaaaajgiecaaaacaaaaaaamaaaaaaagbabaaaabaaaaaa
egacbaaaabaaaaaadcaaaaakhcaabaaaabaaaaaajgiecaaaacaaaaaaaoaaaaaa
kgbkbaaaabaaaaaaegacbaaaabaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaa
abaaaaaaegacbaaaabaaaaaaeeaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
diaaaaahhcaabaaaabaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadiaaaaai
bcaabaaaacaaaaaaakbabaaaacaaaaaaakiacaaaacaaaaaabaaaaaaadiaaaaai
ccaabaaaacaaaaaaakbabaaaacaaaaaaakiacaaaacaaaaaabbaaaaaadiaaaaai
ecaabaaaacaaaaaaakbabaaaacaaaaaaakiacaaaacaaaaaabcaaaaaadiaaaaai
bcaabaaaadaaaaaabkbabaaaacaaaaaabkiacaaaacaaaaaabaaaaaaadiaaaaai
ccaabaaaadaaaaaabkbabaaaacaaaaaabkiacaaaacaaaaaabbaaaaaadiaaaaai
ecaabaaaadaaaaaabkbabaaaacaaaaaabkiacaaaacaaaaaabcaaaaaaaaaaaaah
hcaabaaaacaaaaaaegacbaaaacaaaaaaegacbaaaadaaaaaadiaaaaaibcaabaaa
adaaaaaackbabaaaacaaaaaackiacaaaacaaaaaabaaaaaaadiaaaaaiccaabaaa
adaaaaaackbabaaaacaaaaaackiacaaaacaaaaaabbaaaaaadiaaaaaiecaabaaa
adaaaaaackbabaaaacaaaaaackiacaaaacaaaaaabcaaaaaaaaaaaaahhcaabaaa
acaaaaaaegacbaaaacaaaaaaegacbaaaadaaaaaabaaaaaahbcaabaaaaaaaaaaa
egacbaaaacaaaaaaegacbaaaacaaaaaaeeaaaaafbcaabaaaaaaaaaaaakaabaaa
aaaaaaaadiaaaaahhcaabaaaacaaaaaaagaabaaaaaaaaaaaegacbaaaacaaaaaa
diaaaaahhcaabaaaadaaaaaaegacbaaaabaaaaaacgajbaaaacaaaaaadcaaaaak
hcaabaaaadaaaaaajgaebaaaacaaaaaajgaebaaaabaaaaaaegacbaiaebaaaaaa
adaaaaaadiaaaaahhcaabaaaadaaaaaaegacbaaaadaaaaaapgbpbaaaabaaaaaa
dgaaaaafcccabaaaacaaaaaaakaabaaaadaaaaaadgaaaaafbccabaaaacaaaaaa
ckaabaaaabaaaaaadgaaaaafeccabaaaacaaaaaaakaabaaaacaaaaaadgaaaaaf
bccabaaaadaaaaaaakaabaaaabaaaaaadgaaaaafbccabaaaaeaaaaaabkaabaaa
abaaaaaadgaaaaaficcabaaaadaaaaaabkaabaaaaaaaaaaadgaaaaaficcabaaa
aeaaaaaackaabaaaaaaaaaaadgaaaaafeccabaaaadaaaaaabkaabaaaacaaaaaa
dgaaaaafcccabaaaadaaaaaabkaabaaaadaaaaaadgaaaaafcccabaaaaeaaaaaa
ckaabaaaadaaaaaadgaaaaafeccabaaaaeaaaaaackaabaaaacaaaaaadgaaaaai
pccabaaaafaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadiaaaaah
bcaabaaaaaaaaaaabkaabaaaacaaaaaabkaabaaaacaaaaaadcaaaaakbcaabaaa
aaaaaaaaakaabaaaacaaaaaaakaabaaaacaaaaaaakaabaiaebaaaaaaaaaaaaaa
diaaaaahpcaabaaaabaaaaaajgacbaaaacaaaaaaegakbaaaacaaaaaabbaaaaai
bcaabaaaadaaaaaaegiocaaaabaaaaaacjaaaaaaegaobaaaabaaaaaabbaaaaai
ccaabaaaadaaaaaaegiocaaaabaaaaaackaaaaaaegaobaaaabaaaaaabbaaaaai
ecaabaaaadaaaaaaegiocaaaabaaaaaaclaaaaaaegaobaaaabaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaabaaaaaacmaaaaaaagaabaaaaaaaaaaaegacbaaa
adaaaaaadgaaaaaficaabaaaacaaaaaaabeaaaaaaaaaiadpbbaaaaaibcaabaaa
abaaaaaaegiocaaaabaaaaaacgaaaaaaegaobaaaacaaaaaabbaaaaaiccaabaaa
abaaaaaaegiocaaaabaaaaaachaaaaaaegaobaaaacaaaaaabbaaaaaiecaabaaa
abaaaaaaegiocaaaabaaaaaaciaaaaaaegaobaaaacaaaaaaaaaaaaahhccabaaa
agaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 44 math
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord4
ConstBuffer "$Globals" 224
Vector 160 [_MainTex_ST]
Vector 176 [_BumpMap_ST]
ConstBuffer "UnityLighting" 720
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedbpopekbahcbckdimjfbfnhblkiopkhjmabaaaaaaoaanaaaaaeaaaaaa
daaaaaaaheaeaaaabiamaaaabaanaaaaebgpgodjdmaeaaaadmaeaaaaaaacpopp
oeadaaaafiaaaaaaaeaaceaaaaaafeaaaaaafeaaaaaaceaaabaafeaaaaaaakaa
acaaabaaaaaaaaaaabaacgaaahaaadaaaaaaaaaaacaaaaaaaeaaakaaaaaaaaaa
acaaamaaahaaaoaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafbfaaapkaaaaaiadp
aaaaaaaaaaaaaaaaaaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabia
abaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjaaeaaaaae
aaaaadoaadaaoejaabaaoekaabaaookaaeaaaaaeaaaaamoaadaaeejaacaaeeka
acaaoekaafaaaaadaaaaabiaacaaaajabcaaaakaafaaaaadaaaaaciaacaaaaja
bdaaaakaafaaaaadaaaaaeiaacaaaajabeaaaakaafaaaaadabaaabiaacaaffja
bcaaffkaafaaaaadabaaaciaacaaffjabdaaffkaafaaaaadabaaaeiaacaaffja
beaaffkaacaaaaadaaaaahiaaaaaoeiaabaaoeiaafaaaaadabaaabiaacaakkja
bcaakkkaafaaaaadabaaaciaacaakkjabdaakkkaafaaaaadabaaaeiaacaakkja
beaakkkaacaaaaadaaaaahiaaaaaoeiaabaaoeiaceaaaaacabaaahiaaaaaoeia
afaaaaadaaaaabiaabaaffiaabaaffiaaeaaaaaeaaaaabiaabaaaaiaabaaaaia
aaaaaaibafaaaaadacaaapiaabaacjiaabaakeiaajaaaaadadaaabiaagaaoeka
acaaoeiaajaaaaadadaaaciaahaaoekaacaaoeiaajaaaaadadaaaeiaaiaaoeka
acaaoeiaaeaaaaaeaaaaahiaajaaoekaaaaaaaiaadaaoeiaabaaaaacabaaaiia
bfaaaakaajaaaaadacaaabiaadaaoekaabaaoeiaajaaaaadacaaaciaaeaaoeka
abaaoeiaajaaaaadacaaaeiaafaaoekaabaaoeiaacaaaaadafaaahoaaaaaoeia
acaaoeiaafaaaaadaaaaapiaaaaaffjaalaaoekaaeaaaaaeaaaaapiaakaaoeka
aaaaaajaaaaaoeiaaeaaaaaeaaaaapiaamaaoekaaaaakkjaaaaaoeiaaeaaaaae
aaaaapiaanaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoeka
aaaaoeiaabaaaaacaaaaammaaaaaoeiaafaaaaadaaaaahiaabaaffjaapaamjka
aeaaaaaeaaaaahiaaoaamjkaabaaaajaaaaaoeiaaeaaaaaeaaaaahiabaaamjka
abaakkjaaaaaoeiaaiaaaaadaaaaaiiaaaaaoeiaaaaaoeiaahaaaaacaaaaaiia
aaaappiaafaaaaadaaaaahiaaaaappiaaaaaoeiaabaaaaacabaaaboaaaaakkia
afaaaaadacaaahiaaaaaoeiaabaanciaaeaaaaaeacaaahiaabaamjiaaaaamjia
acaaoeibafaaaaadacaaahiaacaaoeiaabaappjaabaaaaacabaaacoaacaaaaia
abaaaaacabaaaeoaabaaaaiaafaaaaadadaaahiaaaaaffjaapaaoekaaeaaaaae
adaaahiaaoaaoekaaaaaaajaadaaoeiaaeaaaaaeadaaahiabaaaoekaaaaakkja
adaaoeiaaeaaaaaeadaaahiabbaaoekaaaaappjaadaaoeiaabaaaaacabaaaioa
adaaaaiaabaaaaacacaaaboaaaaaaaiaabaaaaacadaaaboaaaaaffiaabaaaaac
acaaacoaacaaffiaabaaaaacadaaacoaacaakkiaabaaaaacacaaaeoaabaaffia
abaaaaacadaaaeoaabaakkiaabaaaaacacaaaioaadaaffiaabaaaaacadaaaioa
adaakkiaabaaaaacaeaaapoabfaaffkappppaaaafdeieefcjmahaaaaeaaaabaa
ohabaaaafjaaaaaeegiocaaaaaaaaaaaamaaaaaafjaaaaaeegiocaaaabaaaaaa
cnaaaaaafjaaaaaeegiocaaaacaaaaaabdaaaaaafpaaaaadpcbabaaaaaaaaaaa
fpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaa
adaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaa
gfaaaaadpccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaagfaaaaadpccabaaa
aeaaaaaagfaaaaadpccabaaaafaaaaaagfaaaaadhccabaaaagaaaaaagiaaaaac
aeaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaa
egiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaal
dccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaakaaaaaaogikcaaa
aaaaaaaaakaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaadaaaaaaagiecaaa
aaaaaaaaalaaaaaakgiocaaaaaaaaaaaalaaaaaadiaaaaaihcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaa
aaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaapaaaaaapgbpbaaa
aaaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaaacaaaaaaakaabaaaaaaaaaaa
diaaaaaihcaabaaaabaaaaaafgbfbaaaabaaaaaajgiecaaaacaaaaaaanaaaaaa
dcaaaaakhcaabaaaabaaaaaajgiecaaaacaaaaaaamaaaaaaagbabaaaabaaaaaa
egacbaaaabaaaaaadcaaaaakhcaabaaaabaaaaaajgiecaaaacaaaaaaaoaaaaaa
kgbkbaaaabaaaaaaegacbaaaabaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaa
abaaaaaaegacbaaaabaaaaaaeeaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
diaaaaahhcaabaaaabaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadiaaaaai
bcaabaaaacaaaaaaakbabaaaacaaaaaaakiacaaaacaaaaaabaaaaaaadiaaaaai
ccaabaaaacaaaaaaakbabaaaacaaaaaaakiacaaaacaaaaaabbaaaaaadiaaaaai
ecaabaaaacaaaaaaakbabaaaacaaaaaaakiacaaaacaaaaaabcaaaaaadiaaaaai
bcaabaaaadaaaaaabkbabaaaacaaaaaabkiacaaaacaaaaaabaaaaaaadiaaaaai
ccaabaaaadaaaaaabkbabaaaacaaaaaabkiacaaaacaaaaaabbaaaaaadiaaaaai
ecaabaaaadaaaaaabkbabaaaacaaaaaabkiacaaaacaaaaaabcaaaaaaaaaaaaah
hcaabaaaacaaaaaaegacbaaaacaaaaaaegacbaaaadaaaaaadiaaaaaibcaabaaa
adaaaaaackbabaaaacaaaaaackiacaaaacaaaaaabaaaaaaadiaaaaaiccaabaaa
adaaaaaackbabaaaacaaaaaackiacaaaacaaaaaabbaaaaaadiaaaaaiecaabaaa
adaaaaaackbabaaaacaaaaaackiacaaaacaaaaaabcaaaaaaaaaaaaahhcaabaaa
acaaaaaaegacbaaaacaaaaaaegacbaaaadaaaaaabaaaaaahbcaabaaaaaaaaaaa
egacbaaaacaaaaaaegacbaaaacaaaaaaeeaaaaafbcaabaaaaaaaaaaaakaabaaa
aaaaaaaadiaaaaahhcaabaaaacaaaaaaagaabaaaaaaaaaaaegacbaaaacaaaaaa
diaaaaahhcaabaaaadaaaaaaegacbaaaabaaaaaacgajbaaaacaaaaaadcaaaaak
hcaabaaaadaaaaaajgaebaaaacaaaaaajgaebaaaabaaaaaaegacbaiaebaaaaaa
adaaaaaadiaaaaahhcaabaaaadaaaaaaegacbaaaadaaaaaapgbpbaaaabaaaaaa
dgaaaaafcccabaaaacaaaaaaakaabaaaadaaaaaadgaaaaafbccabaaaacaaaaaa
ckaabaaaabaaaaaadgaaaaafeccabaaaacaaaaaaakaabaaaacaaaaaadgaaaaaf
bccabaaaadaaaaaaakaabaaaabaaaaaadgaaaaafbccabaaaaeaaaaaabkaabaaa
abaaaaaadgaaaaaficcabaaaadaaaaaabkaabaaaaaaaaaaadgaaaaaficcabaaa
aeaaaaaackaabaaaaaaaaaaadgaaaaafeccabaaaadaaaaaabkaabaaaacaaaaaa
dgaaaaafcccabaaaadaaaaaabkaabaaaadaaaaaadgaaaaafcccabaaaaeaaaaaa
ckaabaaaadaaaaaadgaaaaafeccabaaaaeaaaaaackaabaaaacaaaaaadgaaaaai
pccabaaaafaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadiaaaaah
bcaabaaaaaaaaaaabkaabaaaacaaaaaabkaabaaaacaaaaaadcaaaaakbcaabaaa
aaaaaaaaakaabaaaacaaaaaaakaabaaaacaaaaaaakaabaiaebaaaaaaaaaaaaaa
diaaaaahpcaabaaaabaaaaaajgacbaaaacaaaaaaegakbaaaacaaaaaabbaaaaai
bcaabaaaadaaaaaaegiocaaaabaaaaaacjaaaaaaegaobaaaabaaaaaabbaaaaai
ccaabaaaadaaaaaaegiocaaaabaaaaaackaaaaaaegaobaaaabaaaaaabbaaaaai
ecaabaaaadaaaaaaegiocaaaabaaaaaaclaaaaaaegaobaaaabaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaabaaaaaacmaaaaaaagaabaaaaaaaaaaaegacbaaa
adaaaaaadgaaaaaficaabaaaacaaaaaaabeaaaaaaaaaiadpbbaaaaaibcaabaaa
abaaaaaaegiocaaaabaaaaaacgaaaaaaegaobaaaacaaaaaabbaaaaaiccaabaaa
abaaaaaaegiocaaaabaaaaaachaaaaaaegaobaaaacaaaaaabbaaaaaiecaabaaa
abaaaaaaegiocaaaabaaaaaaciaaaaaaegaobaaaacaaaaaaaaaaaaahhccabaaa
agaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaadoaaaaabejfdeheopaaaaaaa
aiaaaaaaaiaaaaaamiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaa
nbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapapaaaanjaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaacaaaaaaahahaaaaoaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
adaaaaaaapadaaaaoaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaa
oaaaaaaaacaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaaoaaaaaaaadaaaaaa
aaaaaaaaadaaaaaaagaaaaaaapaaaaaaojaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
ahaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaa
feeffiedepepfceeaaedepemepfcaaklepfdeheomiaaaaaaahaaaaaaaiaaaaaa
laaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapaaaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaa
acaaaaaaapaaaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaa
lmaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaalmaaaaaaafaaaaaa
aaaaaaaaadaaaaaaafaaaaaaapaaaaaalmaaaaaaagaaaaaaaaaaaaaaadaaaaaa
agaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl
"
}
SubProgram "opengl " {
// Stats: 19 math, 3 textures, 1 branches
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" }
"!!GLSL
#ifdef VERTEX
uniform vec4 unity_SHAr;
uniform vec4 unity_SHAg;
uniform vec4 unity_SHAb;
uniform vec4 unity_SHBr;
uniform vec4 unity_SHBg;
uniform vec4 unity_SHBb;
uniform vec4 unity_SHC;

uniform mat4 _Object2World;
uniform mat4 _World2Object;
uniform vec4 _MainTex_ST;
uniform vec4 _BumpMap_ST;
attribute vec4 TANGENT;
varying vec4 xlv_TEXCOORD0;
varying vec4 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD3;
varying vec4 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
void main ()
{
  vec4 tmpvar_1;
  vec4 tmpvar_2;
  tmpvar_1.xy = ((gl_MultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_1.zw = ((gl_MultiTexCoord0.xy * _BumpMap_ST.xy) + _BumpMap_ST.zw);
  vec3 tmpvar_3;
  tmpvar_3 = (_Object2World * gl_Vertex).xyz;
  vec4 v_4;
  v_4.x = _World2Object[0].x;
  v_4.y = _World2Object[1].x;
  v_4.z = _World2Object[2].x;
  v_4.w = _World2Object[3].x;
  vec4 v_5;
  v_5.x = _World2Object[0].y;
  v_5.y = _World2Object[1].y;
  v_5.z = _World2Object[2].y;
  v_5.w = _World2Object[3].y;
  vec4 v_6;
  v_6.x = _World2Object[0].z;
  v_6.y = _World2Object[1].z;
  v_6.z = _World2Object[2].z;
  v_6.w = _World2Object[3].z;
  vec3 tmpvar_7;
  tmpvar_7 = normalize(((
    (v_4.xyz * gl_Normal.x)
   + 
    (v_5.xyz * gl_Normal.y)
  ) + (v_6.xyz * gl_Normal.z)));
  mat3 tmpvar_8;
  tmpvar_8[0] = _Object2World[0].xyz;
  tmpvar_8[1] = _Object2World[1].xyz;
  tmpvar_8[2] = _Object2World[2].xyz;
  vec3 tmpvar_9;
  tmpvar_9 = normalize((tmpvar_8 * TANGENT.xyz));
  vec3 tmpvar_10;
  tmpvar_10 = (((tmpvar_7.yzx * tmpvar_9.zxy) - (tmpvar_7.zxy * tmpvar_9.yzx)) * TANGENT.w);
  vec4 tmpvar_11;
  tmpvar_11.x = tmpvar_9.x;
  tmpvar_11.y = tmpvar_10.x;
  tmpvar_11.z = tmpvar_7.x;
  tmpvar_11.w = tmpvar_3.x;
  vec4 tmpvar_12;
  tmpvar_12.x = tmpvar_9.y;
  tmpvar_12.y = tmpvar_10.y;
  tmpvar_12.z = tmpvar_7.y;
  tmpvar_12.w = tmpvar_3.y;
  vec4 tmpvar_13;
  tmpvar_13.x = tmpvar_9.z;
  tmpvar_13.y = tmpvar_10.z;
  tmpvar_13.z = tmpvar_7.z;
  tmpvar_13.w = tmpvar_3.z;
  tmpvar_2.zw = vec2(0.0, 0.0);
  tmpvar_2.xy = vec2(0.0, 0.0);
  vec4 tmpvar_14;
  tmpvar_14.w = 1.0;
  tmpvar_14.xyz = tmpvar_7;
  vec3 x2_15;
  vec3 x1_16;
  x1_16.x = dot (unity_SHAr, tmpvar_14);
  x1_16.y = dot (unity_SHAg, tmpvar_14);
  x1_16.z = dot (unity_SHAb, tmpvar_14);
  vec4 tmpvar_17;
  tmpvar_17 = (tmpvar_7.xyzz * tmpvar_7.yzzx);
  x2_15.x = dot (unity_SHBr, tmpvar_17);
  x2_15.y = dot (unity_SHBg, tmpvar_17);
  x2_15.z = dot (unity_SHBb, tmpvar_17);
  gl_Position = (gl_ModelViewProjectionMatrix * gl_Vertex);
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_11;
  xlv_TEXCOORD2 = tmpvar_12;
  xlv_TEXCOORD3 = tmpvar_13;
  xlv_TEXCOORD5 = tmpvar_2;
  xlv_TEXCOORD6 = ((x2_15 + (unity_SHC.xyz * 
    ((tmpvar_7.x * tmpvar_7.x) - (tmpvar_7.y * tmpvar_7.y))
  )) + x1_16);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _BumpMap;
uniform vec4 _Color;
uniform float _Cutoff;
varying vec4 xlv_TEXCOORD0;
varying vec4 xlv_TEXCOORD1;
varying vec4 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD3;
varying vec3 xlv_TEXCOORD6;
void main ()
{
  vec3 worldN_1;
  vec4 tmpvar_2;
  tmpvar_2 = (texture2D (_MainTex, xlv_TEXCOORD0.xy) * _Color);
  vec3 normal_3;
  normal_3.xy = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).wy * 2.0) - 1.0);
  normal_3.z = sqrt((1.0 - clamp (
    dot (normal_3.xy, normal_3.xy)
  , 0.0, 1.0)));
  float x_4;
  x_4 = (tmpvar_2.w - _Cutoff);
  if ((x_4 < 0.0)) {
    discard;
  };
  worldN_1.x = dot (xlv_TEXCOORD1.xyz, normal_3);
  worldN_1.y = dot (xlv_TEXCOORD2.xyz, normal_3);
  worldN_1.z = dot (xlv_TEXCOORD3.xyz, normal_3);
  vec4 emission_5;
  vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = tmpvar_2.xyz;
  vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = ((worldN_1 * 0.5) + 0.5);
  emission_5.w = 1.0;
  emission_5.xyz = (tmpvar_2.xyz * xlv_TEXCOORD6);
  gl_FragData[0] = tmpvar_6;
  gl_FragData[1] = vec4(0.0, 0.0, 0.0, 0.0);
  gl_FragData[2] = tmpvar_7;
  gl_FragData[3] = emission_5;
}


#endif
"
}
SubProgram "d3d9 " {
// Stats: 46 math
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord4
Matrix 4 [_Object2World] 3
Matrix 7 [_World2Object] 3
Matrix 0 [glstate_matrix_mvp]
Vector 18 [_BumpMap_ST]
Vector 17 [_MainTex_ST]
Vector 12 [unity_SHAb]
Vector 11 [unity_SHAg]
Vector 10 [unity_SHAr]
Vector 15 [unity_SHBb]
Vector 14 [unity_SHBg]
Vector 13 [unity_SHBr]
Vector 16 [unity_SHC]
"vs_2_0
def c19, 1, 0, 0, 0
dcl_position v0
dcl_tangent v1
dcl_normal v2
dcl_texcoord v3
dp4 oPos.x, c0, v0
dp4 oPos.y, c1, v0
dp4 oPos.z, c2, v0
dp4 oPos.w, c3, v0
mad oT0.xy, v3, c17, c17.zwzw
mad oT0.zw, v3.xyxy, c18.xyxy, c18
dp4 oT1.w, c4, v0
dp4 oT2.w, c5, v0
dp4 oT3.w, c6, v0
mul r0.xyz, v2.y, c8
mad r0.xyz, c7, v2.x, r0
mad r0.xyz, c9, v2.z, r0
nrm r1.xyz, r0
mul r0.x, r1.y, r1.y
mad r0.x, r1.x, r1.x, -r0.x
mul r2, r1.yzzx, r1.xyzz
dp4 r3.x, c13, r2
dp4 r3.y, c14, r2
dp4 r3.z, c15, r2
mad r0.xyz, c16, r0.x, r3
mov r1.w, c19.x
dp4 r2.x, c10, r1
dp4 r2.y, c11, r1
dp4 r2.z, c12, r1
add oT6.xyz, r0, r2
dp3 r0.z, c4, v1
dp3 r0.x, c5, v1
dp3 r0.y, c6, v1
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul r0.xyz, r0.w, r0
mov oT1.x, r0.z
mul r2.xyz, r0, r1.zxyw
mad r2.xyz, r1.yzxw, r0.yzxw, -r2
mul r2.xyz, r2, v1.w
mov oT1.y, r2.x
mov oT1.z, r1.x
mov oT2.x, r0.x
mov oT3.x, r0.y
mov oT2.y, r2.y
mov oT3.y, r2.z
mov oT2.z, r1.y
mov oT3.z, r1.z
mov oT5, c19.y

"
}
SubProgram "d3d11 " {
// Stats: 44 math
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord4
ConstBuffer "$Globals" 224
Vector 160 [_MainTex_ST]
Vector 176 [_BumpMap_ST]
ConstBuffer "UnityLighting" 720
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedncenoapffcnlbfdkgoefepeafgphkbmpabaaaaaajiajaaaaadaaaaaa
cmaaaaaaceabaaaapeabaaaaejfdeheopaaaaaaaaiaaaaaaaiaaaaaamiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaanbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaanjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaaoaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaaoaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaoaaaaaaaacaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaaoaaaaaaaadaaaaaaaaaaaaaaadaaaaaaagaaaaaa
apaaaaaaojaaaaaaaaaaaaaaaaaaaaaaadaaaaaaahaaaaaaapaaaaaafaepfdej
feejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepem
epfcaaklepfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
apaaaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaalmaaaaaa
acaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaalmaaaaaaadaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapaaaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaafaaaaaa
apaaaaaalmaaaaaaagaaaaaaaaaaaaaaadaaaaaaagaaaaaaahaiaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefcjmahaaaaeaaaabaa
ohabaaaafjaaaaaeegiocaaaaaaaaaaaamaaaaaafjaaaaaeegiocaaaabaaaaaa
cnaaaaaafjaaaaaeegiocaaaacaaaaaabdaaaaaafpaaaaadpcbabaaaaaaaaaaa
fpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaa
adaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaa
gfaaaaadpccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaagfaaaaadpccabaaa
aeaaaaaagfaaaaadpccabaaaafaaaaaagfaaaaadhccabaaaagaaaaaagiaaaaac
aeaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaa
egiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaal
dccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaakaaaaaaogikcaaa
aaaaaaaaakaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaadaaaaaaagiecaaa
aaaaaaaaalaaaaaakgiocaaaaaaaaaaaalaaaaaadiaaaaaihcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaa
aaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaapaaaaaapgbpbaaa
aaaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaaacaaaaaaakaabaaaaaaaaaaa
diaaaaaihcaabaaaabaaaaaafgbfbaaaabaaaaaajgiecaaaacaaaaaaanaaaaaa
dcaaaaakhcaabaaaabaaaaaajgiecaaaacaaaaaaamaaaaaaagbabaaaabaaaaaa
egacbaaaabaaaaaadcaaaaakhcaabaaaabaaaaaajgiecaaaacaaaaaaaoaaaaaa
kgbkbaaaabaaaaaaegacbaaaabaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaa
abaaaaaaegacbaaaabaaaaaaeeaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
diaaaaahhcaabaaaabaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadiaaaaai
bcaabaaaacaaaaaaakbabaaaacaaaaaaakiacaaaacaaaaaabaaaaaaadiaaaaai
ccaabaaaacaaaaaaakbabaaaacaaaaaaakiacaaaacaaaaaabbaaaaaadiaaaaai
ecaabaaaacaaaaaaakbabaaaacaaaaaaakiacaaaacaaaaaabcaaaaaadiaaaaai
bcaabaaaadaaaaaabkbabaaaacaaaaaabkiacaaaacaaaaaabaaaaaaadiaaaaai
ccaabaaaadaaaaaabkbabaaaacaaaaaabkiacaaaacaaaaaabbaaaaaadiaaaaai
ecaabaaaadaaaaaabkbabaaaacaaaaaabkiacaaaacaaaaaabcaaaaaaaaaaaaah
hcaabaaaacaaaaaaegacbaaaacaaaaaaegacbaaaadaaaaaadiaaaaaibcaabaaa
adaaaaaackbabaaaacaaaaaackiacaaaacaaaaaabaaaaaaadiaaaaaiccaabaaa
adaaaaaackbabaaaacaaaaaackiacaaaacaaaaaabbaaaaaadiaaaaaiecaabaaa
adaaaaaackbabaaaacaaaaaackiacaaaacaaaaaabcaaaaaaaaaaaaahhcaabaaa
acaaaaaaegacbaaaacaaaaaaegacbaaaadaaaaaabaaaaaahbcaabaaaaaaaaaaa
egacbaaaacaaaaaaegacbaaaacaaaaaaeeaaaaafbcaabaaaaaaaaaaaakaabaaa
aaaaaaaadiaaaaahhcaabaaaacaaaaaaagaabaaaaaaaaaaaegacbaaaacaaaaaa
diaaaaahhcaabaaaadaaaaaaegacbaaaabaaaaaacgajbaaaacaaaaaadcaaaaak
hcaabaaaadaaaaaajgaebaaaacaaaaaajgaebaaaabaaaaaaegacbaiaebaaaaaa
adaaaaaadiaaaaahhcaabaaaadaaaaaaegacbaaaadaaaaaapgbpbaaaabaaaaaa
dgaaaaafcccabaaaacaaaaaaakaabaaaadaaaaaadgaaaaafbccabaaaacaaaaaa
ckaabaaaabaaaaaadgaaaaafeccabaaaacaaaaaaakaabaaaacaaaaaadgaaaaaf
bccabaaaadaaaaaaakaabaaaabaaaaaadgaaaaafbccabaaaaeaaaaaabkaabaaa
abaaaaaadgaaaaaficcabaaaadaaaaaabkaabaaaaaaaaaaadgaaaaaficcabaaa
aeaaaaaackaabaaaaaaaaaaadgaaaaafeccabaaaadaaaaaabkaabaaaacaaaaaa
dgaaaaafcccabaaaadaaaaaabkaabaaaadaaaaaadgaaaaafcccabaaaaeaaaaaa
ckaabaaaadaaaaaadgaaaaafeccabaaaaeaaaaaackaabaaaacaaaaaadgaaaaai
pccabaaaafaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadiaaaaah
bcaabaaaaaaaaaaabkaabaaaacaaaaaabkaabaaaacaaaaaadcaaaaakbcaabaaa
aaaaaaaaakaabaaaacaaaaaaakaabaaaacaaaaaaakaabaiaebaaaaaaaaaaaaaa
diaaaaahpcaabaaaabaaaaaajgacbaaaacaaaaaaegakbaaaacaaaaaabbaaaaai
bcaabaaaadaaaaaaegiocaaaabaaaaaacjaaaaaaegaobaaaabaaaaaabbaaaaai
ccaabaaaadaaaaaaegiocaaaabaaaaaackaaaaaaegaobaaaabaaaaaabbaaaaai
ecaabaaaadaaaaaaegiocaaaabaaaaaaclaaaaaaegaobaaaabaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaabaaaaaacmaaaaaaagaabaaaaaaaaaaaegacbaaa
adaaaaaadgaaaaaficaabaaaacaaaaaaabeaaaaaaaaaiadpbbaaaaaibcaabaaa
abaaaaaaegiocaaaabaaaaaacgaaaaaaegaobaaaacaaaaaabbaaaaaiccaabaaa
abaaaaaaegiocaaaabaaaaaachaaaaaaegaobaaaacaaaaaabbaaaaaiecaabaaa
abaaaaaaegiocaaaabaaaaaaciaaaaaaegaobaaaacaaaaaaaaaaaaahhccabaaa
agaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 44 math
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord4
ConstBuffer "$Globals" 224
Vector 160 [_MainTex_ST]
Vector 176 [_BumpMap_ST]
ConstBuffer "UnityLighting" 720
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedbpopekbahcbckdimjfbfnhblkiopkhjmabaaaaaaoaanaaaaaeaaaaaa
daaaaaaaheaeaaaabiamaaaabaanaaaaebgpgodjdmaeaaaadmaeaaaaaaacpopp
oeadaaaafiaaaaaaaeaaceaaaaaafeaaaaaafeaaaaaaceaaabaafeaaaaaaakaa
acaaabaaaaaaaaaaabaacgaaahaaadaaaaaaaaaaacaaaaaaaeaaakaaaaaaaaaa
acaaamaaahaaaoaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafbfaaapkaaaaaiadp
aaaaaaaaaaaaaaaaaaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabia
abaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjaaeaaaaae
aaaaadoaadaaoejaabaaoekaabaaookaaeaaaaaeaaaaamoaadaaeejaacaaeeka
acaaoekaafaaaaadaaaaabiaacaaaajabcaaaakaafaaaaadaaaaaciaacaaaaja
bdaaaakaafaaaaadaaaaaeiaacaaaajabeaaaakaafaaaaadabaaabiaacaaffja
bcaaffkaafaaaaadabaaaciaacaaffjabdaaffkaafaaaaadabaaaeiaacaaffja
beaaffkaacaaaaadaaaaahiaaaaaoeiaabaaoeiaafaaaaadabaaabiaacaakkja
bcaakkkaafaaaaadabaaaciaacaakkjabdaakkkaafaaaaadabaaaeiaacaakkja
beaakkkaacaaaaadaaaaahiaaaaaoeiaabaaoeiaceaaaaacabaaahiaaaaaoeia
afaaaaadaaaaabiaabaaffiaabaaffiaaeaaaaaeaaaaabiaabaaaaiaabaaaaia
aaaaaaibafaaaaadacaaapiaabaacjiaabaakeiaajaaaaadadaaabiaagaaoeka
acaaoeiaajaaaaadadaaaciaahaaoekaacaaoeiaajaaaaadadaaaeiaaiaaoeka
acaaoeiaaeaaaaaeaaaaahiaajaaoekaaaaaaaiaadaaoeiaabaaaaacabaaaiia
bfaaaakaajaaaaadacaaabiaadaaoekaabaaoeiaajaaaaadacaaaciaaeaaoeka
abaaoeiaajaaaaadacaaaeiaafaaoekaabaaoeiaacaaaaadafaaahoaaaaaoeia
acaaoeiaafaaaaadaaaaapiaaaaaffjaalaaoekaaeaaaaaeaaaaapiaakaaoeka
aaaaaajaaaaaoeiaaeaaaaaeaaaaapiaamaaoekaaaaakkjaaaaaoeiaaeaaaaae
aaaaapiaanaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoeka
aaaaoeiaabaaaaacaaaaammaaaaaoeiaafaaaaadaaaaahiaabaaffjaapaamjka
aeaaaaaeaaaaahiaaoaamjkaabaaaajaaaaaoeiaaeaaaaaeaaaaahiabaaamjka
abaakkjaaaaaoeiaaiaaaaadaaaaaiiaaaaaoeiaaaaaoeiaahaaaaacaaaaaiia
aaaappiaafaaaaadaaaaahiaaaaappiaaaaaoeiaabaaaaacabaaaboaaaaakkia
afaaaaadacaaahiaaaaaoeiaabaanciaaeaaaaaeacaaahiaabaamjiaaaaamjia
acaaoeibafaaaaadacaaahiaacaaoeiaabaappjaabaaaaacabaaacoaacaaaaia
abaaaaacabaaaeoaabaaaaiaafaaaaadadaaahiaaaaaffjaapaaoekaaeaaaaae
adaaahiaaoaaoekaaaaaaajaadaaoeiaaeaaaaaeadaaahiabaaaoekaaaaakkja
adaaoeiaaeaaaaaeadaaahiabbaaoekaaaaappjaadaaoeiaabaaaaacabaaaioa
adaaaaiaabaaaaacacaaaboaaaaaaaiaabaaaaacadaaaboaaaaaffiaabaaaaac
acaaacoaacaaffiaabaaaaacadaaacoaacaakkiaabaaaaacacaaaeoaabaaffia
abaaaaacadaaaeoaabaakkiaabaaaaacacaaaioaadaaffiaabaaaaacadaaaioa
adaakkiaabaaaaacaeaaapoabfaaffkappppaaaafdeieefcjmahaaaaeaaaabaa
ohabaaaafjaaaaaeegiocaaaaaaaaaaaamaaaaaafjaaaaaeegiocaaaabaaaaaa
cnaaaaaafjaaaaaeegiocaaaacaaaaaabdaaaaaafpaaaaadpcbabaaaaaaaaaaa
fpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaa
adaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaa
gfaaaaadpccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaagfaaaaadpccabaaa
aeaaaaaagfaaaaadpccabaaaafaaaaaagfaaaaadhccabaaaagaaaaaagiaaaaac
aeaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaa
egiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaal
dccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaakaaaaaaogikcaaa
aaaaaaaaakaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaadaaaaaaagiecaaa
aaaaaaaaalaaaaaakgiocaaaaaaaaaaaalaaaaaadiaaaaaihcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaa
aaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaapaaaaaapgbpbaaa
aaaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaaacaaaaaaakaabaaaaaaaaaaa
diaaaaaihcaabaaaabaaaaaafgbfbaaaabaaaaaajgiecaaaacaaaaaaanaaaaaa
dcaaaaakhcaabaaaabaaaaaajgiecaaaacaaaaaaamaaaaaaagbabaaaabaaaaaa
egacbaaaabaaaaaadcaaaaakhcaabaaaabaaaaaajgiecaaaacaaaaaaaoaaaaaa
kgbkbaaaabaaaaaaegacbaaaabaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaa
abaaaaaaegacbaaaabaaaaaaeeaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
diaaaaahhcaabaaaabaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadiaaaaai
bcaabaaaacaaaaaaakbabaaaacaaaaaaakiacaaaacaaaaaabaaaaaaadiaaaaai
ccaabaaaacaaaaaaakbabaaaacaaaaaaakiacaaaacaaaaaabbaaaaaadiaaaaai
ecaabaaaacaaaaaaakbabaaaacaaaaaaakiacaaaacaaaaaabcaaaaaadiaaaaai
bcaabaaaadaaaaaabkbabaaaacaaaaaabkiacaaaacaaaaaabaaaaaaadiaaaaai
ccaabaaaadaaaaaabkbabaaaacaaaaaabkiacaaaacaaaaaabbaaaaaadiaaaaai
ecaabaaaadaaaaaabkbabaaaacaaaaaabkiacaaaacaaaaaabcaaaaaaaaaaaaah
hcaabaaaacaaaaaaegacbaaaacaaaaaaegacbaaaadaaaaaadiaaaaaibcaabaaa
adaaaaaackbabaaaacaaaaaackiacaaaacaaaaaabaaaaaaadiaaaaaiccaabaaa
adaaaaaackbabaaaacaaaaaackiacaaaacaaaaaabbaaaaaadiaaaaaiecaabaaa
adaaaaaackbabaaaacaaaaaackiacaaaacaaaaaabcaaaaaaaaaaaaahhcaabaaa
acaaaaaaegacbaaaacaaaaaaegacbaaaadaaaaaabaaaaaahbcaabaaaaaaaaaaa
egacbaaaacaaaaaaegacbaaaacaaaaaaeeaaaaafbcaabaaaaaaaaaaaakaabaaa
aaaaaaaadiaaaaahhcaabaaaacaaaaaaagaabaaaaaaaaaaaegacbaaaacaaaaaa
diaaaaahhcaabaaaadaaaaaaegacbaaaabaaaaaacgajbaaaacaaaaaadcaaaaak
hcaabaaaadaaaaaajgaebaaaacaaaaaajgaebaaaabaaaaaaegacbaiaebaaaaaa
adaaaaaadiaaaaahhcaabaaaadaaaaaaegacbaaaadaaaaaapgbpbaaaabaaaaaa
dgaaaaafcccabaaaacaaaaaaakaabaaaadaaaaaadgaaaaafbccabaaaacaaaaaa
ckaabaaaabaaaaaadgaaaaafeccabaaaacaaaaaaakaabaaaacaaaaaadgaaaaaf
bccabaaaadaaaaaaakaabaaaabaaaaaadgaaaaafbccabaaaaeaaaaaabkaabaaa
abaaaaaadgaaaaaficcabaaaadaaaaaabkaabaaaaaaaaaaadgaaaaaficcabaaa
aeaaaaaackaabaaaaaaaaaaadgaaaaafeccabaaaadaaaaaabkaabaaaacaaaaaa
dgaaaaafcccabaaaadaaaaaabkaabaaaadaaaaaadgaaaaafcccabaaaaeaaaaaa
ckaabaaaadaaaaaadgaaaaafeccabaaaaeaaaaaackaabaaaacaaaaaadgaaaaai
pccabaaaafaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadiaaaaah
bcaabaaaaaaaaaaabkaabaaaacaaaaaabkaabaaaacaaaaaadcaaaaakbcaabaaa
aaaaaaaaakaabaaaacaaaaaaakaabaaaacaaaaaaakaabaiaebaaaaaaaaaaaaaa
diaaaaahpcaabaaaabaaaaaajgacbaaaacaaaaaaegakbaaaacaaaaaabbaaaaai
bcaabaaaadaaaaaaegiocaaaabaaaaaacjaaaaaaegaobaaaabaaaaaabbaaaaai
ccaabaaaadaaaaaaegiocaaaabaaaaaackaaaaaaegaobaaaabaaaaaabbaaaaai
ecaabaaaadaaaaaaegiocaaaabaaaaaaclaaaaaaegaobaaaabaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaabaaaaaacmaaaaaaagaabaaaaaaaaaaaegacbaaa
adaaaaaadgaaaaaficaabaaaacaaaaaaabeaaaaaaaaaiadpbbaaaaaibcaabaaa
abaaaaaaegiocaaaabaaaaaacgaaaaaaegaobaaaacaaaaaabbaaaaaiccaabaaa
abaaaaaaegiocaaaabaaaaaachaaaaaaegaobaaaacaaaaaabbaaaaaiecaabaaa
abaaaaaaegiocaaaabaaaaaaciaaaaaaegaobaaaacaaaaaaaaaaaaahhccabaaa
agaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaadoaaaaabejfdeheopaaaaaaa
aiaaaaaaaiaaaaaamiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaa
nbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapapaaaanjaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaacaaaaaaahahaaaaoaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
adaaaaaaapadaaaaoaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaa
oaaaaaaaacaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaaoaaaaaaaadaaaaaa
aaaaaaaaadaaaaaaagaaaaaaapaaaaaaojaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
ahaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaa
feeffiedepepfceeaaedepemepfcaaklepfdeheomiaaaaaaahaaaaaaaiaaaaaa
laaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapaaaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaa
acaaaaaaapaaaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaa
lmaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaalmaaaaaaafaaaaaa
aaaaaaaaadaaaaaaafaaaaaaapaaaaaalmaaaaaaagaaaaaaaaaaaaaaadaaaaaa
agaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl
"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
"!!GLSL"
}
SubProgram "d3d9 " {
// Stats: 28 math, 3 textures
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Vector 0 [_Color]
Float 1 [_Cutoff]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_BumpMap] 2D 1
"ps_2_0
def c2, 2, -1, 0, 1
def c3, 0.5, 0, 0, 0
dcl t0
dcl t1.xyz
dcl t2.xyz
dcl t3.xyz
dcl_pp t6.xyz
dcl_2d s0
dcl_2d s1
texld r0, t0, s0
mov r1.w, c0.w
mad_pp r1, r0.w, r1.w, -c1.x
mul_pp r0.xyz, r0, c0
mov r2.x, t0.z
mov r2.y, t0.w
texkill r1
texld_pp r1, r2, s1
mul_pp r2.xyz, r0, t6
mov_pp r0.w, c2.w
mov_pp oC0, r0
mov_pp r0, c2.z
mov_pp oC1, r0
mad_pp r0.x, r1.w, c2.x, c2.y
mad_pp r0.y, r1.y, c2.x, c2.y
dp2add_sat_pp r0.w, r0, r0, c2.z
add_pp r0.w, -r0.w, c2.w
rsq_pp r0.w, r0.w
rcp_pp r0.z, r0.w
dp3_pp r1.x, t1, r0
dp3_pp r1.y, t2, r0
dp3_pp r1.z, t3, r0
mad_pp r0.xyz, r1, c3.x, c3.x
mov_pp r0.w, c2.w
mov_pp oC2, r0
exp_pp r0.x, -r2.x
exp_pp r0.y, -r2.y
exp_pp r0.z, -r2.z
mov_pp r0.w, c2.w
mov_pp oC3, r0

"
}
SubProgram "d3d11 " {
// Stats: 14 math, 2 textures
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_BumpMap] 2D 1
ConstBuffer "$Globals" 224
Vector 144 [_Color]
Float 208 [_Cutoff]
BindCB  "$Globals" 0
"ps_4_0
eefiecedpjndlgaedjhmiofmgolfioogeijkacafabaaaaaaoeaeaaaaadaaaaaa
cmaaaaaapmaaaaaahiabaaaaejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaapahaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapahaaaalmaaaaaaafaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaalmaaaaaaagaaaaaaaaaaaaaaadaaaaaaagaaaaaa
ahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
heaaaaaaaeaaaaaaaiaaaaaagiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaagiaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaagiaaaaaa
acaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaagiaaaaaaadaaaaaaaaaaaaaa
adaaaaaaadaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcgeadaaaa
eaaaaaaanjaaaaaafjaaaaaeegiocaaaaaaaaaaaaoaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaa
fibiaaaeaahabaaaabaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaagcbaaaad
hcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaa
gcbaaaadhcbabaaaagaaaaaagfaaaaadpccabaaaaaaaaaaagfaaaaadpccabaaa
abaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaagiaaaaac
acaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaa
aagabaaaaaaaaaaadcaaaaamicaabaaaaaaaaaaadkaabaaaaaaaaaaadkiacaaa
aaaaaaaaajaaaaaaakiacaiaebaaaaaaaaaaaaaaanaaaaaadiaaaaaihcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegiccaaaaaaaaaaaajaaaaaadbaaaaahicaabaaa
aaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaaaaanaaaeaddkaabaaaaaaaaaaa
dgaaaaafhccabaaaaaaaaaaaegacbaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegbcbaaaagaaaaaabjaaaaaghccabaaaadaaaaaaegacbaia
ebaaaaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaiadpdgaaaaai
pccabaaaabaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaefaaaaaj
pcaabaaaaaaaaaaaogbkbaaaabaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaa
dcaaaaapdcaabaaaaaaaaaaahgapbaaaaaaaaaaaaceaaaaaaaaaaaeaaaaaaaea
aaaaaaaaaaaaaaaaaceaaaaaaaaaialpaaaaialpaaaaaaaaaaaaaaaaapaaaaah
icaabaaaaaaaaaaaegaabaaaaaaaaaaaegaabaaaaaaaaaaaddaaaaahicaabaaa
aaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaiadpaaaaaaaiicaabaaaaaaaaaaa
dkaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpelaaaaafecaabaaaaaaaaaaa
dkaabaaaaaaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaaacaaaaaaegacbaaa
aaaaaaaabaaaaaahccaabaaaabaaaaaaegbcbaaaadaaaaaaegacbaaaaaaaaaaa
baaaaaahecaabaaaabaaaaaaegbcbaaaaeaaaaaaegacbaaaaaaaaaaadcaaaaap
hccabaaaacaaaaaaegacbaaaabaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadp
aaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaadgaaaaaficcabaaa
acaaaaaaabeaaaaaaaaaiadpdgaaaaaficcabaaaadaaaaaaabeaaaaaaaaaiadp
doaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 14 math, 2 textures
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_BumpMap] 2D 1
ConstBuffer "$Globals" 224
Vector 144 [_Color]
Float 208 [_Cutoff]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedfjjnchkdglehjddeemnpocelmpbmnfolabaaaaaagmahaaaaaeaaaaaa
daaaaaaaleacaaaacaagaaaapaagaaaaebgpgodjhmacaaaahmacaaaaaaacpppp
diacaaaaeeaaaaaaacaacmaaaaaaeeaaaaaaeeaaacaaceaaaaaaeeaaaaaaaaaa
abababaaaaaaajaaabaaaaaaaaaaaaaaaaaaanaaabaaabaaaaaaaaaaaaacpppp
fbaaaaafacaaapkaaaaaaaeaaaaaialpaaaaaaaaaaaaiadpfbaaaaafadaaapka
aaaaaadpaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaaplabpaaaaac
aaaaaaiaabaaaplabpaaaaacaaaaaaiaacaaaplabpaaaaacaaaaaaiaadaaapla
bpaaaaacaaaaaaiaafaachlabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaaja
abaiapkaecaaaaadaaaaapiaaaaaoelaaaaioekaabaaaaacabaaaiiaaaaappka
aeaaaaaeabaacpiaaaaappiaabaappiaabaaaakbafaaaaadaaaachiaaaaaoeia
aaaaoekaabaaaaacacaaabiaaaaakklaabaaaaacacaaaciaaaaapplaebaaaaab
abaaapiaecaaaaadabaacpiaacaaoeiaabaioekaafaaaaadacaachiaaaaaoeia
afaaoelaabaaaaacaaaaciiaacaappkaabaaaaacaaaicpiaaaaaoeiaabaaaaac
aaaacpiaacaakkkaabaaaaacabaicpiaaaaaoeiaaeaaaaaeaaaacbiaabaappia
acaaaakaacaaffkaaeaaaaaeaaaacciaabaaffiaacaaaakaacaaffkafkaaaaae
aaaadiiaaaaaoeiaaaaaoeiaacaakkkaacaaaaadaaaaciiaaaaappibacaappka
ahaaaaacaaaaciiaaaaappiaagaaaaacaaaaceiaaaaappiaaiaaaaadabaacbia
abaaoelaaaaaoeiaaiaaaaadabaacciaacaaoelaaaaaoeiaaiaaaaadabaaceia
adaaoelaaaaaoeiaaeaaaaaeaaaachiaabaaoeiaadaaaakaadaaaakaabaaaaac
aaaaciiaacaappkaabaaaaacacaicpiaaaaaoeiaaoaaaaacaaaacbiaacaaaaib
aoaaaaacaaaacciaacaaffibaoaaaaacaaaaceiaacaakkibabaaaaacaaaaciia
acaappkaabaaaaacadaicpiaaaaaoeiappppaaaafdeieefcgeadaaaaeaaaaaaa
njaaaaaafjaaaaaeegiocaaaaaaaaaaaaoaaaaaafkaaaaadaagabaaaaaaaaaaa
fkaaaaadaagabaaaabaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaae
aahabaaaabaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaagcbaaaadhcbabaaa
acaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaad
hcbabaaaagaaaaaagfaaaaadpccabaaaaaaaaaaagfaaaaadpccabaaaabaaaaaa
gfaaaaadpccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaagiaaaaacacaaaaaa
efaaaaajpcaabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaa
aaaaaaaadcaaaaamicaabaaaaaaaaaaadkaabaaaaaaaaaaadkiacaaaaaaaaaaa
ajaaaaaaakiacaiaebaaaaaaaaaaaaaaanaaaaaadiaaaaaihcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegiccaaaaaaaaaaaajaaaaaadbaaaaahicaabaaaaaaaaaaa
dkaabaaaaaaaaaaaabeaaaaaaaaaaaaaanaaaeaddkaabaaaaaaaaaaadgaaaaaf
hccabaaaaaaaaaaaegacbaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegbcbaaaagaaaaaabjaaaaaghccabaaaadaaaaaaegacbaiaebaaaaaa
aaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaiadpdgaaaaaipccabaaa
abaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaefaaaaajpcaabaaa
aaaaaaaaogbkbaaaabaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaadcaaaaap
dcaabaaaaaaaaaaahgapbaaaaaaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaaa
aaaaaaaaaceaaaaaaaaaialpaaaaialpaaaaaaaaaaaaaaaaapaaaaahicaabaaa
aaaaaaaaegaabaaaaaaaaaaaegaabaaaaaaaaaaaddaaaaahicaabaaaaaaaaaaa
dkaabaaaaaaaaaaaabeaaaaaaaaaiadpaaaaaaaiicaabaaaaaaaaaaadkaabaia
ebaaaaaaaaaaaaaaabeaaaaaaaaaiadpelaaaaafecaabaaaaaaaaaaadkaabaaa
aaaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaa
baaaaaahccaabaaaabaaaaaaegbcbaaaadaaaaaaegacbaaaaaaaaaaabaaaaaah
ecaabaaaabaaaaaaegbcbaaaaeaaaaaaegacbaaaaaaaaaaadcaaaaaphccabaaa
acaaaaaaegacbaaaabaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaa
aceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaadgaaaaaficcabaaaacaaaaaa
abeaaaaaaaaaiadpdgaaaaaficcabaaaadaaaaaaabeaaaaaaaaaiadpdoaaaaab
ejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapapaaaa
lmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapahaaaalmaaaaaaacaaaaaa
aaaaaaaaadaaaaaaadaaaaaaapahaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaapahaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaa
lmaaaaaaagaaaaaaaaaaaaaaadaaaaaaagaaaaaaahahaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaklklklepfdeheoheaaaaaaaeaaaaaaaiaaaaaa
giaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaagiaaaaaaabaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapaaaaaagiaaaaaaacaaaaaaaaaaaaaaadaaaaaa
acaaaaaaapaaaaaagiaaaaaaadaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaa
fdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" }
"!!GLSL"
}
SubProgram "d3d9 " {
// Stats: 25 math, 3 textures
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" }
Vector 0 [_Color]
Float 1 [_Cutoff]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_BumpMap] 2D 1
"ps_2_0
def c2, 2, -1, 0, 1
def c3, 0.5, 0, 0, 0
dcl t0
dcl t1.xyz
dcl t2.xyz
dcl t3.xyz
dcl_pp t6.xyz
dcl_2d s0
dcl_2d s1
texld r0, t0, s0
mov r1.w, c0.w
mad_pp r1, r0.w, r1.w, -c1.x
mul_pp r0.xyz, r0, c0
mov r2.x, t0.z
mov r2.y, t0.w
texkill r1
texld_pp r1, r2, s1
mul_pp r2.xyz, r0, t6
mov_pp r0.w, c2.w
mov_pp oC0, r0
mov_pp r0, c2.z
mov_pp oC1, r0
mad_pp r0.x, r1.w, c2.x, c2.y
mad_pp r0.y, r1.y, c2.x, c2.y
dp2add_sat_pp r0.w, r0, r0, c2.z
add_pp r0.w, -r0.w, c2.w
rsq_pp r0.w, r0.w
rcp_pp r0.z, r0.w
dp3_pp r1.x, t1, r0
dp3_pp r1.y, t2, r0
dp3_pp r1.z, t3, r0
mad_pp r0.xyz, r1, c3.x, c3.x
mov_pp r0.w, c2.w
mov_pp oC2, r0
mov_pp r2.w, c2.w
mov_pp oC3, r2

"
}
SubProgram "d3d11 " {
// Stats: 13 math, 2 textures
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_BumpMap] 2D 1
ConstBuffer "$Globals" 224
Vector 144 [_Color]
Float 208 [_Cutoff]
BindCB  "$Globals" 0
"ps_4_0
eefiecedkmjekgfoelojofccalkimnmpkgkkhpmfabaaaaaammaeaaaaadaaaaaa
cmaaaaaapmaaaaaahiabaaaaejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaapahaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapahaaaalmaaaaaaafaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaalmaaaaaaagaaaaaaaaaaaaaaadaaaaaaagaaaaaa
ahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
heaaaaaaaeaaaaaaaiaaaaaagiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaagiaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaagiaaaaaa
acaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaagiaaaaaaadaaaaaaaaaaaaaa
adaaaaaaadaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcemadaaaa
eaaaaaaandaaaaaafjaaaaaeegiocaaaaaaaaaaaaoaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaa
fibiaaaeaahabaaaabaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaagcbaaaad
hcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaa
gcbaaaadhcbabaaaagaaaaaagfaaaaadpccabaaaaaaaaaaagfaaaaadpccabaaa
abaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaagiaaaaac
acaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaa
aagabaaaaaaaaaaadcaaaaamicaabaaaaaaaaaaadkaabaaaaaaaaaaadkiacaaa
aaaaaaaaajaaaaaaakiacaiaebaaaaaaaaaaaaaaanaaaaaadiaaaaaihcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegiccaaaaaaaaaaaajaaaaaadbaaaaahicaabaaa
aaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaaaaanaaaeaddkaabaaaaaaaaaaa
dgaaaaafhccabaaaaaaaaaaaegacbaaaaaaaaaaadiaaaaahhccabaaaadaaaaaa
egacbaaaaaaaaaaaegbcbaaaagaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaa
aaaaiadpdgaaaaaipccabaaaabaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaefaaaaajpcaabaaaaaaaaaaaogbkbaaaabaaaaaaeghobaaaabaaaaaa
aagabaaaabaaaaaadcaaaaapdcaabaaaaaaaaaaahgapbaaaaaaaaaaaaceaaaaa
aaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaaaceaaaaaaaaaialpaaaaialpaaaaaaaa
aaaaaaaaapaaaaahicaabaaaaaaaaaaaegaabaaaaaaaaaaaegaabaaaaaaaaaaa
ddaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaiadpaaaaaaai
icaabaaaaaaaaaaadkaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpelaaaaaf
ecaabaaaaaaaaaaadkaabaaaaaaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaa
acaaaaaaegacbaaaaaaaaaaabaaaaaahccaabaaaabaaaaaaegbcbaaaadaaaaaa
egacbaaaaaaaaaaabaaaaaahecaabaaaabaaaaaaegbcbaaaaeaaaaaaegacbaaa
aaaaaaaadcaaaaaphccabaaaacaaaaaaegacbaaaabaaaaaaaceaaaaaaaaaaadp
aaaaaadpaaaaaadpaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaa
dgaaaaaficcabaaaacaaaaaaabeaaaaaaaaaiadpdgaaaaaficcabaaaadaaaaaa
abeaaaaaaaaaiadpdoaaaaab"
}
SubProgram "d3d11_9x " {
// Stats: 13 math, 2 textures
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_BumpMap] 2D 1
ConstBuffer "$Globals" 224
Vector 144 [_Color]
Float 208 [_Cutoff]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedhepefjkhmlnchdfpplpbgnknjacngphgabaaaaaadaahaaaaaeaaaaaa
daaaaaaajaacaaaaoeafaaaaleagaaaaebgpgodjfiacaaaafiacaaaaaaacpppp
beacaaaaeeaaaaaaacaacmaaaaaaeeaaaaaaeeaaacaaceaaaaaaeeaaaaaaaaaa
abababaaaaaaajaaabaaaaaaaaaaaaaaaaaaanaaabaaabaaaaaaaaaaaaacpppp
fbaaaaafacaaapkaaaaaaaeaaaaaialpaaaaaaaaaaaaiadpfbaaaaafadaaapka
aaaaaadpaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaaplabpaaaaac
aaaaaaiaabaaaplabpaaaaacaaaaaaiaacaaaplabpaaaaacaaaaaaiaadaaapla
bpaaaaacaaaaaaiaafaachlabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaaja
abaiapkaecaaaaadaaaaapiaaaaaoelaaaaioekaabaaaaacabaaaiiaaaaappka
aeaaaaaeabaacpiaaaaappiaabaappiaabaaaakbafaaaaadaaaachiaaaaaoeia
aaaaoekaabaaaaacacaaabiaaaaakklaabaaaaacacaaaciaaaaapplaebaaaaab
abaaapiaecaaaaadabaacpiaacaaoeiaabaioekaafaaaaadacaachiaaaaaoeia
afaaoelaabaaaaacaaaaciiaacaappkaabaaaaacaaaicpiaaaaaoeiaabaaaaac
aaaacpiaacaakkkaabaaaaacabaicpiaaaaaoeiaaeaaaaaeaaaacbiaabaappia
acaaaakaacaaffkaaeaaaaaeaaaacciaabaaffiaacaaaakaacaaffkafkaaaaae
aaaadiiaaaaaoeiaaaaaoeiaacaakkkaacaaaaadaaaaciiaaaaappibacaappka
ahaaaaacaaaaciiaaaaappiaagaaaaacaaaaceiaaaaappiaaiaaaaadabaacbia
abaaoelaaaaaoeiaaiaaaaadabaacciaacaaoelaaaaaoeiaaiaaaaadabaaceia
adaaoelaaaaaoeiaaeaaaaaeaaaachiaabaaoeiaadaaaakaadaaaakaabaaaaac
aaaaciiaacaappkaabaaaaacacaicpiaaaaaoeiaabaaaaacacaaciiaacaappka
abaaaaacadaicpiaacaaoeiappppaaaafdeieefcemadaaaaeaaaaaaandaaaaaa
fjaaaaaeegiocaaaaaaaaaaaaoaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaa
abaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaa
gcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaadhcbabaaa
agaaaaaagfaaaaadpccabaaaaaaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaad
pccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaagiaaaaacacaaaaaaefaaaaaj
pcaabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaa
dcaaaaamicaabaaaaaaaaaaadkaabaaaaaaaaaaadkiacaaaaaaaaaaaajaaaaaa
akiacaiaebaaaaaaaaaaaaaaanaaaaaadiaaaaaihcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegiccaaaaaaaaaaaajaaaaaadbaaaaahicaabaaaaaaaaaaadkaabaaa
aaaaaaaaabeaaaaaaaaaaaaaanaaaeaddkaabaaaaaaaaaaadgaaaaafhccabaaa
aaaaaaaaegacbaaaaaaaaaaadiaaaaahhccabaaaadaaaaaaegacbaaaaaaaaaaa
egbcbaaaagaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaiadpdgaaaaai
pccabaaaabaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaefaaaaaj
pcaabaaaaaaaaaaaogbkbaaaabaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaa
dcaaaaapdcaabaaaaaaaaaaahgapbaaaaaaaaaaaaceaaaaaaaaaaaeaaaaaaaea
aaaaaaaaaaaaaaaaaceaaaaaaaaaialpaaaaialpaaaaaaaaaaaaaaaaapaaaaah
icaabaaaaaaaaaaaegaabaaaaaaaaaaaegaabaaaaaaaaaaaddaaaaahicaabaaa
aaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaiadpaaaaaaaiicaabaaaaaaaaaaa
dkaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpelaaaaafecaabaaaaaaaaaaa
dkaabaaaaaaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaaacaaaaaaegacbaaa
aaaaaaaabaaaaaahccaabaaaabaaaaaaegbcbaaaadaaaaaaegacbaaaaaaaaaaa
baaaaaahecaabaaaabaaaaaaegbcbaaaaeaaaaaaegacbaaaaaaaaaaadcaaaaap
hccabaaaacaaaaaaegacbaaaabaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadp
aaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaadgaaaaaficcabaaa
acaaaaaaabeaaaaaaaaaiadpdgaaaaaficcabaaaadaaaaaaabeaaaaaaaaaiadp
doaaaaabejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
apapaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapahaaaalmaaaaaa
acaaaaaaaaaaaaaaadaaaaaaadaaaaaaapahaaaalmaaaaaaadaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapahaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaafaaaaaa
apaaaaaalmaaaaaaagaaaaaaaaaaaaaaadaaaaaaagaaaaaaahahaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheoheaaaaaaaeaaaaaa
aiaaaaaagiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaagiaaaaaa
abaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaagiaaaaaaacaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaagiaaaaaaadaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklkl"
}
}
 }
}
Fallback "Legacy Shaders/Transparent/Cutout/Diffuse"
}