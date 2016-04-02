using UnityEngine;
using System.Collections.Generic;

public class TowerManager : MonoBehaviour {

    //fireball
    public static int _TOWER_ID_FIREBALL = 1;
    public static string _TOWER_NAME_FIREBALL = "Fireball Tower";

    //ice
    public static int _TOWER_ID_ICE = 2;
    public static string _TOWER_NAME_ICE = "Ice Tower";

    //splitshot
    public static int _TOWER_ID_SPLIT = 3;
    public static string _TOWER_NAME_SPLIT = "Splitshot Tower";

    private static List<BaseTower> _towerTypes = new List<BaseTower>();
    private static List<BaseTower> _spawnedTower = new List<BaseTower>();

    private static BaseTower _selectedTower = null;

    void Awake()
    {
        addTowerPath("prefabs/towers/FireballTower");
        addTowerPath("prefabs/towers/IceTower");
        addTowerPath("prefabs/towers/SplitshotTower");
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

    public static void selectTower(BaseTower tower)
    {
        if(TowerManager._selectedTower != tower)
        {
            //Debug.Log("selecting tower: " + tower.getName());
            TowerManager._selectedTower = tower;
        }
    }

    public static void deselectTower()
    {
        TowerManager._selectedTower = null;
    }

    private Rect getSelectedTowerRect()
    {
        if(TowerManager._selectedTower != null)
        {
            Vector3 screenPos = TowerManager._selectedTower.screenPos;
            Rect r = new Rect();
            r.x = screenPos.x;
            r.y = Screen.height - screenPos.y;
            r.width = 150;
            r.height = 50;
            return r;
        }
        return new Rect();
    }

    private void OnGUI()
    {
        if(TowerManager._selectedTower != null)
        {
            GUI.Label(getSelectedTowerRect(), TowerManager._selectedTower.getName());
        }
    }

}
