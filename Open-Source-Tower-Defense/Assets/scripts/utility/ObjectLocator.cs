using UnityEngine;
using System.Collections.Generic;

public class ObjectLocator
{

    Dictionary<string, Object> objects = new Dictionary<string, Object>();

    public Object getGameOjbectByPath(string path)
    {
        if (!objects.ContainsKey(path))
        {
            objects.Add(path, (Object)Resources.Load(path, typeof(Object)));
        }

        return objects[path];
    }

    //singleton code
    private ObjectLocator() { }
    private static ObjectLocator _instance;
    public static ObjectLocator Instance
    {
        get
        {
            if (_instance == null)
            {
                _instance = new ObjectLocator();

            }
            return _instance;
        }
    }
}