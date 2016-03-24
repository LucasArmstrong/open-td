﻿using UnityEngine;
using System.Collections.Generic;
using System;

public class BaseTower : MonoBehaviour, IProjectileOwner {

    [SerializeField]
    private GameObject projectileOrigin = null;

    [SerializeField]
    private float projectileSpeed = 0f;

    [SerializeField]
    private string projectilePath = string.Empty;

    [SerializeField]
    private float range = 15f;

    [SerializeField]
    private float coolDown = 1.5f;

    [SerializeField]
    private int damage = 1;

    private BaseUnit currentTarget = null;
  
    private float runUpdateCounter = 0f;

	// Update is called once per frame
	void Update () {
	    if(runUpdateCounter >= coolDown)
        {
            runUpdateCounter = 0f;
            if(currentTarget == null || !targetInRange())
            {
                currentTarget = getClosestUnit();
            }

            if(currentTarget != null)
            {
                //Debug.Log("Currently targeting: " + currentTarget.id);
                //shoot projectile here
                Vector3 startPos = projectileOrigin != null ? projectileOrigin.transform.position : transform.position + new Vector3(0f,1f,0f);
                GameObject spawnedObj = (GameObject)Instantiate(ObjectLocator.Instance.getGameOjbectByPath(projectilePath),
                            startPos,
                            Quaternion.identity);
                BaseProjectile projectile = spawnedObj.GetComponent<BaseProjectile>();
                if(projectile != null)
                {
                    projectile.speed = projectileSpeed;
                    projectile.setOwner(this);
                    projectile.projectileToGameObject(startPos, currentTarget.gameObject);
                }
            }
            else
            {
                Debug.Log("Currently targeting nothing.");
            }
        }
        else
        {
            runUpdateCounter += Time.deltaTime;
        }
	}

    private bool targetInRange()
    {
        if (currentTarget != null && 
            Vector3.Distance(currentTarget.transform.position, transform.position) <= range)
        {
            return true;
        }
        return false;
    }

    private BaseUnit getClosestUnit()
    {
        BaseUnit unit = null;

        List<BaseUnit> unitsInRange = BaseUnit.getUnitsInRange(transform.position, range);

        if(unitsInRange != null && unitsInRange.Count > 0)
        {
            foreach(BaseUnit bu in unitsInRange)
            {
                if(unit == null || Vector3.Distance(bu.transform.position, transform.position) < 
                                    Vector3.Distance(unit.transform.position, transform.position))
                {
                    unit = bu;
                }
            }
        }

        return unit;
    }

    void IProjectileOwner.projectileHit(Vector3 point)
    {
        throw new NotImplementedException();
    }

    void IProjectileOwner.projectileHit(GameObject gameObject)
    {
        Debug.Log("BaseTower.projectileHit: " + gameObject.name);
        BaseUnit baseUnit = gameObject.GetComponent<BaseUnit>();
        if(baseUnit != null)
        {
            //take life etc
            baseUnit.takeDamage(damage);
        }
    }
}