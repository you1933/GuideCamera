Shader "Custom/guide"
{
	Properties
	{
		// テクスチャの指定
		_StartX( "X", Float ) = 0
		_StartY( "Y", Float ) = 0
		_Width( "Width", Float ) = 0
		_Height( "Height", Float ) = 0
		_Color( "Color", Color ) = ( 0, 0, 0, 0 )
	}


		SubShader
	{
		LOD 100

		Tags
		{
			"Queue" = "Transparent"
			"IgnoreProjector" = "True"
			"RenderType" = "Transparent"
		}

		Cull Off
		ZWrite Off
		Blend SrcAlpha OneMinusSrcAlpha

		Pass
		{
			CGPROGRAM
			#include "UnityCG.cginc"

			#pragma vertex vert_img
			#pragma fragment frag

			uniform float _StartX;
			uniform float _StartY;
			uniform float _Width;
			uniform float _Height;
			uniform float4 _Color;

			fixed4 frag(v2f_img i) : COLOR
			{
				if( i.pos.x < _StartX ) discard;
				if( i.pos.y < _StartY ) discard;
				if( i.pos.x > ( _StartX + _Width ) ) discard;
				if( i.pos.y > ( _StartY + _Height ) ) discard;

				return _Color;
			}
			ENDCG
		}
	}
}
