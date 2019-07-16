using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[ExecuteInEditMode]
public class ShowFragmentInfo : MonoBehaviour
{
    [SerializeField]
    Renderer targetA;

    [SerializeField]
    Renderer targetB;

    int propId;

    private MaterialPropertyBlock mpbA, mpbB;
    // Start is called before the first frame update
    void Start()
    {
        mpbA = new MaterialPropertyBlock();
        mpbB = new MaterialPropertyBlock();

        propId = Shader.PropertyToID("_DestructionValue");
    }

    // Update is called once per frame
    void Update()
    {
        Debug.Log(targetA.material.GetFloat(propId));
        Debug.Log(targetB.material.GetFloat(propId));
    }
}
