using UnityEngine;
using System.Collections.Generic;

public class TowerManager : MonoBehaviour {

    public static int _TOWER_ID_FIREBALL = 1;
    public static string _TOWER_NAME_FIREBALL = "Fireball Tower";

    private static List<BaseTower> _towerTypes = new List<BaseTower>();
    private static List<BaseTower> _spawnedTower = new List<BaseTower>();

    void Awake()
    {
        addTowerPath("prefabs/towers/FireballTower");
    }

    private void addTowerPath(string path)
    {
        BaseTower tower = ((GameObject)ObjectLocator.Instance.getGameOjbectByPath(path)).GetComponent<BaseTower>();
        if(tower != null)
        {
            TowerManager._towerTypes.Add(tower);
        }
    }

    public static ITower getTowerPrefabByTypeID(int id)
    {
        foreach (ITower t in _towerTypes)
        {
            if (t.getId() == id)
            {
                return t;
            }
        }
        return null;
    }

    public static void addSpawnedTower(BaseTower tower)
    {
        _spawnedTower.Add(tower);
    }

}
