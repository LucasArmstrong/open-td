using UnityEngine;

public class StartPointLocator
{
    public static GameObject startPointObject = null;
}

public class StartPoint : MonoBehaviour
{

    void Awake()
    {
        StartPointLocator.startPointObject = gameObject;
    }

}

