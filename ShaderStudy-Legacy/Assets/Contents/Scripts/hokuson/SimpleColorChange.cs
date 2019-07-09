using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace hokuson
{
    public class SimpleColorChange : MonoBehaviour
    {
        void Start()
        {
            GetComponent<Renderer>().material.SetColor("_BaseColor", Color.black);
        }
    }
}

