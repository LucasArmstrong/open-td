using UnityEngine;
using System.Collections.Generic;

public class TowerFoundation : MonoBehaviour {

    public List<BaseTower> towerTypes = new List<BaseTower>();

    public int typeId = 0;

    private BaseTower _towerPrefab = null;

    // Use this for initialization
    void Start()
    {
        BaseTower towerToSpawn = getTowerPrefabByTypeID(typeId) as BaseTower;
        if (towerToSpawn != null)
        {
            _towerPrefab = (BaseTower)Instantiate(towerToSpawn, transform.position, Quaternion.identity);
        }
    }

    public ITower getTowerPrefabByTypeID(int id)
    {
        foreach (ITower t in towerTypes)
        {
            if(t.getId() == id)
            {
                return t;
            }
        }
        return null;
    }
}
