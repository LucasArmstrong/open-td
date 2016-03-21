using UnityEngine;
using System.Collections.Generic;

public class BaseLevel {

    public int level = 0;

    public float hitPointModifier = 1.0f;

    private List<LevelUnit> _levelUnits = new List<LevelUnit>();
    public List<LevelUnit> levelUnits
    {
        get { return _levelUnits; }
    }

    public BaseLevel()
    {

    }

    public void addLevelUnit(LevelUnit levelUnit)
    {
        if (!_levelUnits.Contains(levelUnit))
        {
            levelUnit.health = (int)((float)levelUnit.health * hitPointModifier);
            _levelUnits.Add(levelUnit);
        }
    }
}
