using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[ExecuteInEditMode]
public class guide : MonoBehaviour
{
    public Material GuideMaterial = null;

    public Rect ViewRange = new Rect( 0.0f, 0.0f, 0.0f, 0.0f );
    public Color GuideColor = new Color( 0.0f, 0.0f, 0.0f, 0.0f );

    void OnRenderImage( RenderTexture src, RenderTexture dest )
    {
        if( GuideMaterial == null ) return;
        GuideMaterial.color = GuideColor;
        GuideMaterial.SetFloat( "_StartX", ViewRange.x );
        GuideMaterial.SetFloat( "_StartY", ViewRange.y );
        GuideMaterial.SetFloat( "_Width", ViewRange.width );
        GuideMaterial.SetFloat( "_Height", ViewRange.height );

        Graphics.Blit( src, dest, GuideMaterial );
    }
}

