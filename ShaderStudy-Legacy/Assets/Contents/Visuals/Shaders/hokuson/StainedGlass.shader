Shader "Custom/hokuson/StainedGlass"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
    }
    SubShader
    {
        Tags { "Queue"="Transparent" }
        LOD 200

        CGPROGRAM
        // Physically based Standard lighting model, and enable shadows on all light types
        #pragma surface surf Standard alpha:fade

        // Use shader model 3.0 target, to get nicer looking lighting
        #pragma target 3.0

        struct Input
        {
            float2 uv_MainTex;
        };

	sampler2D _MainTex;

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
			fixed4 c = tex2D(_MainTex, IN.uv_MainTex);
			o.Albedo = c.rgb;
			// grayscale = 0.3 * R + 0.6 * G + 0.1 * B
			o.Alpha = (c.r*0.3 + c.g*0.6 + c.b*0.1 < 0.2) ? 1 : 0.5;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
