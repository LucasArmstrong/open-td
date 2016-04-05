using UnityEngine;
using System.Collections.Generic;

public static class WorldObjects<T>{

    public static List<T> withinPointRadius(Vector3 pos, float radius, int layerMask = -1)
    {
        List<T> list = new List<T>();
        Collider[] colliders = (layerMask > 0) == true ? Physics.OverlapSphere(pos, radius, 1 << layerMask) 
                                                       : Physics.OverlapSphere(pos, radius);
        List<GameObject> alreadyChecked = new List<GameObject>();
        for (int i = 0; i < colliders.Length; i++)
        {
            if (alreadyChecked.Contains(colliders[i].gameObject)) { continue; }
            alreadyChecked.Add(colliders[i].gameObject);

            if (colliders[i] != null)
            {
                T obj = colliders[i].gameObject.GetComponent<T>();
                if (obj != null && !list.Contains(obj))
                {
                    list.Add(obj);
                }
            }
        }

        return list;
    }

}
