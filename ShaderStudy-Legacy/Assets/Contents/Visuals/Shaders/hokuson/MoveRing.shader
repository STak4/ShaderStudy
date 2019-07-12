Shader "Custom/hokuson/MoveRing"
{
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 200

        CGPROGRAM
        // Physically based Standard lighting model, and enable shadows on all light types
        #pragma surface surf Standard

        // Use shader model 3.0 target, to get nicer looking lighting
        #pragma target 3.0

        sampler2D _MainTex;

        struct Input
        {
			float3 worldPos;
        };

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
			// 現在処理しているワールド座標と原点の距離
			float dist = distance(fixed3(0, 0, 0), IN.worldPos);
			// 静止した円
			//float val = abs(sin(dist * 3.0));
			// 外側に動く波
			// 外側に向けて波を動かすためには、現在の座標があたかも遠ざかっているように見せる
			// 現在処理している座標から_Timeを引くことで、あたかも現在処理している座標が、時間とともに外側へ移動している
			float val = abs(sin((dist * 3.0) - _Time * 100));
			// sinカーブの頂点付近のみ白色
			if (val > 0.99) {
				o.Albedo = fixed4(1, 1, 1, 1);
			}
			else {
				o.Albedo = fixed4(110 / 255.0, 87 / 255.0, 139 / 255.0, 1);
			}
        }
        ENDCG
    }
    FallBack "Diffuse"
}
