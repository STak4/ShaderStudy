Shader "Custom/hokuson/RimLighting"
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
            float2 uv_MainTex;
			float3 worldNormal;
			float3 viewDir;
        };

        half _Glossiness;
        half _Metallic;
        fixed4 _Color;

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
			fixed4 baseColor = fixed4(0.05, 0.1, 0, 1);
			fixed4 rimColor = fixed4(0.5, 0.7, 0.5, 1);

			o.Albedo = baseColor;
			// FrozenTransparentを先に見る
			// 2つのベクトルが垂直に交わる場合はエミッション（光の放射）を1, 平行の場合を0にする
			// オブジェクトのベクトルは中央に近づけば近づくほど視線ベクトルと平行になる＝内積は0になるので、1から引く
			// FrozenTransparentでは絶対値にしていたが今回はsaturate( x ) でxを0～１にクランプするsaturateを用いる（マイナスはオブジェクトのうち視線の反対側なので0で良い）
			float rim = 1 - saturate(dot( IN.viewDir , o.Normal ) );
			// rimの減衰がcos( x ) に従うため中央付近まで光が減衰せずあまり輪郭が綺麗に出ない、
			// (cosx)^3 にする、グラフを見よう
			o.Emission = rimColor * pow(rim, 3);
        }
        ENDCG
    }
    FallBack "Diffuse"
}
