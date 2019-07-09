Shader "Custom/hokuson/UVScroll"
{
    Properties
    {
		_MainTex("Water Texture", 2D) = "white" {}
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 200

        CGPROGRAM
        // Physically based Standard lighting model, and enable shadows on all light types
        #pragma surface surf Standard fullforwardshadows

        // Use shader model 3.0 target, to get nicer looking lighting
        #pragma target 3.0

        sampler2D _MainTex;

        struct Input
        {
            float2 uv_MainTex;
        };

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
			// テクスチャのどの部分を使うか
			fixed2 uv = IN.uv_MainTex;
			// uv変数に対してどれだけのオフセットをたすのかを指定しています。オフセットは「スクロール速度✕時間（＝移動距離）」
			// _Time変数はUnityのシェーダにデフォルトで用意されている変数で、時間とともに値が増加
			uv.x += 0.1 * _Time;
			uv.y += 0.2 * _Time;

			o.Albedo = tex2D(_MainTex, uv);
        }
        ENDCG
    }
    FallBack "Diffuse"
}
