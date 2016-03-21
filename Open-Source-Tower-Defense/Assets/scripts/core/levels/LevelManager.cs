using UnityEngine;
using System.Collections.Generic;

public class LevelManager : MonoBehaviour
{

    private BaseLevel currentLevel = null;
    private LevelLocator levelLocator = LevelLocator.Instance;
    private List<LevelUnit> currentLevelUnits = new List<LevelUnit>();

    private bool runCurrentLevel = false;

    private int unitCount = 0;
    private int maxUnitCount = 10;

    private float spawnTimer = 0f;
    private float spawnTimerLimit = 1.5f;

    void Awake()
    {
        if(levelLocator.levels.Count > 0)
        {
            foreach(BaseLevel level in levelLocator.levels)
            {
                currentLevel = level;
                traceCurrentLevel();
            }

            //start the first level here -- will turn into loadNextLevel()
            currentLevel = levelLocator.levels[0];
            currentLevelUnits = new List<LevelUnit>();
            foreach (LevelUnit unit in currentLevel.levelUnits)
            {
                for(int i = 0; i < unit.quantity; i++)
                {
                    LevelUnit levelUnit = new LevelUnit(unit.prefab, 1, unit.health, unit.speed, unit.scale, unit.goldValue);
                    currentLevelUnits.Add(levelUnit);
                }
            }
            spawnTimer = 0f;
            runCurrentLevel = true;

        }

    }

    void Update()
    {
        if (runCurrentLevel && currentLevelUnits.Count > 0)
        {
            if (spawnTimer >= spawnTimerLimit)
            {
                LevelUnit unit = currentLevelUnits[0];
                currentLevelUnits.RemoveAt(0);

                GameObject spawnedObj = (GameObject)Instantiate(unit.prefab,
                            StartPointLocator.startPointObject.transform.position,
                            Quaternion.identity);
                spawnedObj.transform.localScale = new Vector3(unit.scale, unit.scale, unit.scale);

                BaseUnit baseUnit = spawnedObj.GetComponent<BaseUnit>();
                baseUnit.healthMax = unit.health;
                baseUnit.healthCurrent = unit.health;
                baseUnit.moveSpeed = unit.speed;

                spawnTimer = 0f;
            }
            else
            {
                spawnTimer += Time.deltaTime;
            }
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

}

