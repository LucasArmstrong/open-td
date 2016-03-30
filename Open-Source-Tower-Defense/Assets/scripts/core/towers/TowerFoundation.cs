using UnityEngine;

public class TowerFoundation : MonoBehaviour {
    
    public int typeId = 0;

    private BaseTower _towerPrefab = null;

    // Use this for initialization
    void Start()
    {
        if(typeId != 0)
        {
            _towerPrefab = createTower(transform, typeId);
            if(_towerPrefab != null)
            {
                GetComponent<Renderer>().enabled = false;
            }
        }
            
    }

    private BaseTower createTower(Transform foundation, int id)
    {
        BaseTower towerToSpawn = TowerManager.getTowerPrefabByTypeID(id) as BaseTower;
        if (towerToSpawn != null)
        {
            return (BaseTower)Instantiate(towerToSpawn, foundation.position, Quaternion.identity);
        }
        return null;
    }

}
