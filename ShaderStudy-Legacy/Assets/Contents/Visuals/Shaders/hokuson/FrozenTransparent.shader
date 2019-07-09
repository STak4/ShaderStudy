Shader "Custom/hokuson/FrozenTransparent"
{
    SubShader
    {
        Tags { "Queue"="Transparent" }
        LOD 200

        CGPROGRAM
		#pragma surface surf Standard alpha:fade
		#pragma target 3.0

        struct Input
        {
			//オブジェクトの法線ベクトル（オブジェクト表面に対する垂直ベクトル）
			float3 worldNormal;
			//視線ベクトル（カメラが向いている方向のベクトル）
			float3 viewDir;
        };

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
			o.Albedo = fixed4(1, 1, 1, 1);
			// オブジェクトの法線ベクトルと視線ベクトルの内積を取って2つのベクトルが交わる角度に変換する
			// worldNormal * viewDir = |worldNormal| * | viewDir | * cos( x ) = cos( x ) 
			// オブジェクトの法線ベクトルと視線ベクトルはどちらも正規化された長さ１のベクトルなので|worldNormal| = |viewDir| = 1
			// 垂直に交わる場合は0, 平行の場合は1, or -1なのでabsで絶対値を透明度とする
			float alpha = 1 - (abs(dot(IN.viewDir, IN.worldNormal)));

			// 透明度の調整、パラメータ化推奨
			o.Alpha = alpha * 1.5f;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
