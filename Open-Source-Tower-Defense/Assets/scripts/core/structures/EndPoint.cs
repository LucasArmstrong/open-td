using UnityEngine;

public class EndPointLocator
{
    public static GameObject endPointObject = null;
}

public class EndPoint : MonoBehaviour {

    void Awake()
    {
        EndPointLocator.endPointObject = gameObject;
    }

}
