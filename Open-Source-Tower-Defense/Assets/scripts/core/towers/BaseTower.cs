using UnityEngine;
using System.Collections.Generic;

public class BaseTower : MonoBehaviour {

    [SerializeField]
    private float range = 15f;

    [SerializeField]
    private float coolDown = 1.5f;

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
                Debug.Log("Currently targeting: " + currentTarget.id);
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
}
