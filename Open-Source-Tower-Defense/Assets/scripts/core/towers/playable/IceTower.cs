﻿using UnityEngine;

public class IceTower : BaseTower, ITower
{
    private float _slowValue = 1.55f;

    private float _slowDuration = 5f;//5 seconds

    private int _id = TowerManager._TOWER_ID_ICE;

    private string _towerName = TowerManager._TOWER_NAME_ICE;

    //ice tower adds a movement slow effect to its target that is handled here
    public override void projectileHit(GameObject gameObject)
    {
        //target unit is damaged in the base so we use that 
        base.projectileHit(gameObject);

        //add slow
        BaseUnit unit = gameObject.GetComponent<BaseUnit>();
        if(unit != null)
        {
            unit.addSlow(new Slow(_slowDuration, this, _slowValue, Slow.SlowType.iceTower));
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

    public override void upgradeTower()
    {
        base.upgradeTower();
    }

}