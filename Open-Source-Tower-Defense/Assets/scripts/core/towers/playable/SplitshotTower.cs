using UnityEngine;
using System.Collections.Generic;

public class SplitshotTower : BaseTower, ITower
{
    private int _id = TowerManager._TOWER_ID_SPLIT;

    private string _towerName = TowerManager._TOWER_NAME_SPLIT;

    private float _radius = 6f;
    
    public override void projectileLaunch(GameObject gameObject)
    {
        List<BaseUnit> targets = BaseUnit.getUnitsInRange(gameObject.transform.position, _radius);
        foreach(BaseUnit unit in targets)
        {
            if (unit.dead) { continue; }
            base.projectileLaunch(unit.gameObject);
        }
    }

    public override int getId()
    {
        return _id;
    }

    public override string getName()
    {
        return _towerName;
    }
}