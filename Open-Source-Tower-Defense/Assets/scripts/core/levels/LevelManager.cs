using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class LevelManager : MonoBehaviour
{
    private const float _LEVEL_BUFFER_TIME = 5f;//time inbetween levels

    private BaseLevel currentLevel = null;
    private LevelLocator levelLocator = LevelLocator.Instance;
    private List<LevelUnit> currentLevelUnits = new List<LevelUnit>();

    private bool runCurrentLevel = false;

    private float spawnTimer = 0f;
    private float spawnTimerLimit = 1.5f;//time inbetween unit spawns
    public List<GameObject> spawnedUnits = new List<GameObject>();

    void Awake()
    {
        if(levelLocator.levels.Count > 0)
        {
            loadNextLevel();
        }

    }

    void Update()
    {
        if (runCurrentLevel && currentLevelUnits.Count > 0)
        {
            if (spawnTimer >= spawnTimerLimit)
            {
                //this needs to be moved to a UnitManager
                LevelUnit unit = currentLevelUnits[0];
                currentLevelUnits.RemoveAt(0);
                GameObject spawnedObj = (GameObject)Instantiate(unit.prefab,
                            StartPointLocator.startPointObject.transform.position,
                            Quaternion.identity);
                spawnedObj.transform.localScale = new Vector3(unit.scale, unit.scale, unit.scale);
                spawnedUnits.Add(spawnedObj);
                configureBaseUnit(spawnedObj, unit);
                spawnTimer = 0f;
            }
            else
            {
                spawnTimer += Time.deltaTime;
            }
        }
        else if(runCurrentLevel)
        {
            if (spawnedUnits.Count < 1)
            {
                runCurrentLevel = false;
                StartCoroutine(loadNextLevel(_LEVEL_BUFFER_TIME));
            }
        }
    }

    private void UnitDeathCallback(BaseUnit deadObj)
    {
        if(deadObj.goldValue > 0)
        {
            CurrencyManager.AddGold(deadObj.goldValue, deadObj.transform.position, gameObject);
        }
        
        spawnedUnits.Remove(deadObj.gameObject);
    }

    IEnumerator loadNextLevel(float waitTime)
    {
        yield return new WaitForSeconds(waitTime);
        loadNextLevel();
    }

    public void loadNextLevel()
    {
        if (levelLocator.levels.Count > 0)
        {
            currentLevel = levelLocator.levels[0];
            levelLocator.levels.RemoveAt(0);

            //this needs to be moved to a UnitManager
            currentLevelUnits = new List<LevelUnit>();
            foreach (LevelUnit unit in currentLevel.levelUnits)
            {
                for (int i = 0; i < unit.quantity; i++)
                {
                    LevelUnit levelUnit = new LevelUnit(unit.prefab, 1, unit.health, unit.speed, unit.scale, unit.goldValue);
                    currentLevelUnits.Add(levelUnit);
                }
            }
            spawnTimer = 0f;
            runCurrentLevel = true;
            traceCurrentLevel();
        }
        else
        {
            Debug.Log("No levels available.");
        }
    }

    public void traceCurrentLevel()
    {
        if(currentLevel == null)
        {
            Debug.Log("No level set.");
            return;
        }
        string logMessage = string.Empty;
        logMessage += "Current Level: " + currentLevel.level + "\n";
        logMessage += "--- Hit Point Modifier: " + currentLevel.hitPointModifier + "\n";
        foreach(LevelUnit unit in currentLevel.levelUnits)
        {
            logMessage += "--- " + unit.prefab.name + " (quantity=" + unit.quantity + "), (health=" + unit.health + "), (speed=" + unit.speed + ")\n";
        }
        Debug.Log(logMessage);
    }

    public void configureBaseUnit(GameObject spawnedObj, LevelUnit unit)
    {
        //this needs to be moved to a UnitManager
        BaseUnit baseUnit = spawnedObj.GetComponent<BaseUnit>();
        baseUnit.healthMax = unit.health;
        baseUnit.healthCurrent = unit.health;
        baseUnit.moveSpeed = unit.speed;
        baseUnit.goldValue = unit.goldValue;
        UnitDeathCallbackType deathCallback = new UnitDeathCallbackType(this.UnitDeathCallback);
        baseUnit.registerDeathCallback(deathCallback);
    }
}

