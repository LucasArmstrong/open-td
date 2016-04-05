/**
 * WorldObjects generic static class for finding scene objects at runtime in Unity3D
 *
 * This class provides generic functionality for finding and manipulating actor objects
 * within the current scene at run time. The object search relies on Collider components
 * to exist on the objects that are being searched for
 *
 * @author     Lucas Armstrong <lucasacode@gmail.com>
 * @license    https://opensource.org/licenses/MIT MIT
 * @link       https://github.com/LucasArmstrong/open-td/
 *
 * @requires UnityEngine, System.Collections.Generic
 */
using UnityEngine;
using System.Collections.Generic;

public static class WorldObjects<T>{

    /** @method withinPointRadius
      * @desc searches a radius for T object types from given point
      * @param Vector3 pos - Point where the search starts
      * @param float radius - Distance from the given point 
      * @param int layerMask default -1 - Layer Mask ID if any to optimize OverlapSphere
      * @return List<T>
    */
    public static List<T> withinPointRadius(Vector3 pos, float radius, int layerMask = -1)
    {
        try
        {
            //list to return
            List<T> found = new List<T>();

            //objects with collider found in radius
            Collider[] colliders = (layerMask > 0) == true 
                                  ? Physics.OverlapSphere(pos, radius, 1 << layerMask)
                                  : Physics.OverlapSphere(pos, radius);

            //list of gameobjects we have already collided with to prevent doubles
            List<GameObject> alreadyChecked = new List<GameObject>();
            
            //find objects of type T , add to return list
            for (int i = 0; i < colliders.Length; i++)
            {
                if (colliders[i] == null || alreadyChecked.Contains(colliders[i].gameObject)) { continue; }
                alreadyChecked.Add(colliders[i].gameObject);
                T obj = colliders[i].gameObject.GetComponent<T>();
                if (obj != null && !found.Contains(obj)) { found.Add(obj); }
            }

            //return all the objects we found
            return found;
        }
        catch(System.Exception e)
        {
            Debug.Log("WorldObjects<T>.withinPointRadius(): Error: "+e.Message);

            //if theres any problem then return null
            return null;
        }
    }

}
