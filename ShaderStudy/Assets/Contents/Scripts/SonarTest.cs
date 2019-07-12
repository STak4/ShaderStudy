using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SonarTest : MonoBehaviour
{
    [SerializeField]
    Transform playerPos;

    [SerializeField]
    bool onSonar;

    Material sonarMat;

    // Start is called before the first frame update
    void Start()
    {
        sonarMat = GetComponent<MeshRenderer>().material;
    }

    // Update is called once per frame
    void Update()
    {
        sonarMat.SetVector("_playerPos", playerPos.position);
        if (onSonar)
        {
            sonarMat.SetFloat("_sonarVal", 1);
        }
        else
        {
            sonarMat.SetFloat("_sonarVal", 0);
        }

    }
}
