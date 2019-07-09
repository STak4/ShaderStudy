Shader "Custom/hokuson/SimpleTexture"
{
    Properties
    {
		// 公開する変数名が_MainTex、インスペクタ上の表示がTexture、型名が2D、初期値が"white"
		_MainTex("Texture", 2D) = "white" {}
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

        struct Input
        {
			// テクスチャのuv座標をサーフェイスシェーダに教えるためには、入力の構造体（Input）に、uv[テクスチャ変数名]という名前のメンバ変数を宣言
			// これにより、サーフェイスシェーダには処理すべきテクスチャのuv座標が自動的に渡されます。
            float2 uv_MainTex;
        };

		sampler2D _MainTex;

		// サーフェイスシェーダでは１ピクセルごとにsurfメソッドが実行
		// そのため、サーフェイスシェーダは現在処理しているテクスチャの位置（uv座標）を知らなければいけません。
        void surf (Input IN, inout SurfaceOutputStandard o)
        {
			// _MainTexからuv_MainTexで指定された座標の色を取得して、それを出力する色としてAlbedoに指定
			o.Albedo = tex2D(_MainTex, IN.uv_MainTex);
        }
        ENDCG
    }
    FallBack "Diffuse"
}
