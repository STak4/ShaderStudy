Shader "Custom/hokuson/BlockNoise"
{
    Properties
    {
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
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

		// ランダムな値を返す。引数はUV座標でその座標からランダムな値を生成する。
		// https://qiita.com/shimacpyon/items/d15dee44a0b8b3883f76
		float random(fixed2 p)
		{
			return frac(sin(dot(p, fixed2(12.9898, 78.233))) * 43758.5453);
		}

		// ランダムノイズからブロックごとに代表的な一点を取り出す
		float noise(fixed2 st)
		{
			// 小数値の整数部分を返すfloor( x ) 
			// UV座標に使うと(0 <= x < 1 && 0 <= y < 1)のエリアの代表点は(0,0）に、(3 <= x < 4 && 1 <= y < 2)のエリアは(3,1）に
			fixed2 p = floor(st);

			// floorで生成した代表点のUV座標からランダム値を生成してそれを返す
			return random(p);
		}

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
			// ブロックノイズを8x8生成するため、テクスチャ座標を8倍
			float c = noise(IN.uv_MainTex * 8);
			o.Albedo = fixed4(c, c, c, 1);
        }
        ENDCG
    }
    FallBack "Diffuse"
}
