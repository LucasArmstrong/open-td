using UnityEngine;
using System.Collections.Generic;

public class GameObjectLocator
{

    Dictionary<string, GameObject> objects = new Dictionary<string, GameObject>();

    public GameObject getGameOjbectByPath(string path)
    {
        if (!objects.ContainsKey(path))
        {
            objects.Add(path, (GameObject)Resources.Load(path, typeof(GameObject)));
        }

        return objects[path];
    }

    private GameObjectLocator() { }

    //singleton code
    private static GameObjectLocator _instance;
    public static GameObjectLocator Instance
    {
        get
        {
            if (_instance == null)
            {
                _instance = new GameObjectLocator();

            }
            return _instance;
        }
    }
}