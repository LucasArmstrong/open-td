/**
 * ResourceObjects generic static class for locating resources such as prefabs and textures
 *
 * This class provides generic functionality for loading and caching resource objects
 * located within the Unity Editor, T is the targeted resource type where the type 
 * is derived from UnityEngine.Object
 *
 * @author     Lucas Armstrong <lucasacode@gmail.com>
 * @license    https://opensource.org/licenses/MIT MIT
 * @link       https://github.com/LucasArmstrong/open-td/
 *
 * @requires UnityEngine, System.Collections.Generic
 */
using UnityEngine;
using System.Collections.Generic;

public static class ResourceObjects<T> where T : Object{

    /** @field _cache
      * @type static Dictionary<string, T>
      * @desc Cached objects are stored here and are indexed by their physical path
    */
    private static Dictionary<string, T> _cache = new Dictionary<string, T>();

    /** @method getResourceObjectByPath
      * @desc Returns a cached version of the resource if it exists,
      *       loads and caches resource if it does not exist
      * @param string path - Path to desired resource
      * @return T
    */
    public static T getResourceObjectByPath(string path)
    {
        try
        {
            //check to see if the resource is already cached with it's path index
            if (!_cache.ContainsKey(path))
            {
                //load the resource
                T resource = (T)Resources.Load(path, typeof(T));

                //add the resource to cache
                _cache.Add(path, resource);

                //return the loaded resource
                return resource;
            }

            //resource path is already cached
            else
            {
                //return the resource indexed by path
                return (T)_cache[path];
            }
        }
        catch(System.Exception e)
        {
            Debug.Log("ResourceObjects<T>.getResourceObjectByPath("+path+"): Error: " + e.Message);

            //if theres any problem then return null
            return null;
        }
    }

}
