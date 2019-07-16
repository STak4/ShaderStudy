using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Practice10 : MonoBehaviour
{
    public GameObject targetGameObjectA;
    public GameObject targetGameObjectB;

    private MaterialPropertyBlock materialPropertyBlock;

    void Start ()
    {
        this.materialPropertyBlock = new MaterialPropertyBlock();
    }

    void Update ()
    {

        Material[] materials = GameObject.FindObjectsOfType<Material>();

        Debug.Log("MATERIAL_COUNT_IN_SCENE : " + materials.Length);

        for (int i = 0; i < materials.Length; i++)
        {
            Debug.Log(materials[i].name);
        }

        // CASE:1
        this.targetGameObjectA.GetComponent<Renderer>().sharedMaterial.SetFloat("_FloatValue", Random.value);
    }
}
