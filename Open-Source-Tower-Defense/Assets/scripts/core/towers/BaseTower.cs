using UnityEngine;
using System.Collections.Generic;
using System;

public class BaseTower : MonoBehaviour, IProjectileOwner, ITower {

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
    protected int damage = 1;

    private BaseUnit currentTarget = null;
  
    private float runUpdateCounter = 0f;

    public Vector3 screenPos = Vector3.zero;

    public int level = 1;

    void Awake()
    {
        screenPos = Camera.main.WorldToScreenPoint(transform.position);
    }

	// Update is called once per frame
	void Update () {
	    if(runUpdateCounter >= coolDown)
        {
            runUpdateCounter = 0f;
            if(currentTarget == null || !targetInRange() || targetDead())
            {
                currentTarget = getClosestUnit();
            }

            if(currentTarget != null)
            {
                //this will shoot a projectile at the target
                (this as IProjectileOwner).projectileLaunch(currentTarget.gameObject);
            }
            else
            {
                //Debug.Log("Currently targeting nothing.");
            }
        }
        else
        {
            runUpdateCounter += Time.deltaTime;
        }
	}

    private bool targetDead()
    {
        if(currentTarget != null && currentTarget.dead)
        {
            return true;
        }
        return false;
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
        List<BaseUnit> unitsInRange = WorldObjects<BaseUnit>.withinPointRadius(transform.position, range, BaseUnit.layerMask);
        if (unitsInRange != null && unitsInRange.Count > 0)
        {
            foreach(BaseUnit bu in unitsInRange)
            {
                if (bu.dead) { continue; }

                if(unit == null || Vector3.Distance(bu.transform.position, transform.position) < 
                                    Vector3.Distance(unit.transform.position, transform.position))
                {
                    unit = bu;
                }
            }
        }
        return unit;
    }

    //**************  IProjectileOwner implementation start *******************//
    public virtual void projectileHit(Vector3 point)
    {
        throw new NotImplementedException();
    }

    public virtual void projectileHit(GameObject gameObject)
    {
        BaseUnit baseUnit = gameObject.GetComponent<BaseUnit>();
        if(baseUnit != null)
        {
            //take life etc
            baseUnit.takeDamage(damage);
        }
    }

    public virtual void projectileLaunch(Vector3 point)
    {
        throw new NotImplementedException();
    }

    public virtual void projectileLaunch(GameObject gameObject)
    {
        Vector3 startPos = projectileOrigin != null ? projectileOrigin.transform.position : transform.position + new Vector3(0f, 1f, 0f);
        GameObject spawnedObj = (GameObject)Instantiate(ResourceObjects<GameObject>.getResourceObjectByPath(projectilePath),
                    startPos,
                    Quaternion.identity);
        BaseProjectile projectile = spawnedObj.GetComponent<BaseProjectile>();
        if (projectile != null)
        {
            projectile.speed = projectileSpeed;
            projectile.owner = this;
            projectile.useGravity = true;

            float yOffset = 1f;
            BaseUnit targetUnit = gameObject.GetComponent<BaseUnit>();
            if (targetUnit != null && targetUnit.trueRenderer != null)
            {
                yOffset = targetUnit.trueRenderer.bounds.size.y;
            }
            projectile.vectorOffset = new Vector3(0f, yOffset, 0f);

            projectile.projectileToGameObject(gameObject);
        }
    }
    //**************  IProjectileOwner implementation END *******************//


    //**************  ITower implementation *******************//
    public virtual int getId()
    {
        return 0;
    }

    public virtual string getName()
    {
        return string.Empty;
    }

    public virtual void upgradeTower()
    {
        level++;
        Debug.Log("Upgrading: " + getName() + " to level " + level);
    }
    //**************  ITower implementation END *******************//

    void OnMouseUp()
    {
        TowerManager.selectTower(this);
    }
    
    public virtual void UpgradeWindow(int windowID)
    {
        GUILayout.BeginHorizontal();
        GUILayout.Label("Level " + level);
        if (GUILayout.Button("Upgrade ($000)"))
        {
            upgradeTower();
        }
        GUILayout.EndHorizontal();

        GUILayout.Label("Damage: " + damage);
        GUILayout.Label("Cooldown: " + coolDown);
        GUILayout.Label("Range: " + range);
    }
    
}
