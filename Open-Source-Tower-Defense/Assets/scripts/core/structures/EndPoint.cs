﻿using UnityEngine;

public class EndPointLocator
{
    public static GameObject endPointObject = null;
}

[RequireComponent(typeof(StructureHealthBar))]
public class EndPoint : MonoBehaviour {

    void Awake()
    {
        EndPointLocator.endPointObject = gameObject;
    }

}
