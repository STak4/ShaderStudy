﻿Shader "Custom/hokuson/SimpleTransparent"
{
    SubShader
    {
		// Tag変更
        Tags { "Queue"="Transparent" }
        LOD 200

        CGPROGRAM
        // Physically based Standard lighting model, and enable shadows on all light types
		// alpha : fadeの追加
        #pragma surface surf Standard alpha:fade

        // Use shader model 3.0 target, to get nicer looking lighting
        #pragma target 3.0

        sampler2D _MainTex;

        struct Input
        {
            float2 uv_MainTex;
        };

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
			o.Albedo = fixed4(0.6f, 0.7f, 0.4f, 1);
			// Alphaの設定
			o.Alpha = 0.6;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
