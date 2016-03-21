using UnityEngine;
using System.Collections.Generic;

public class LevelLocator {

    public List<BaseLevel> levels = new List<BaseLevel>();

    private LevelLocator()
    {
        BaseLevel level1 = new BaseLevel();
        level1.level = 1;
        LevelUnit level1_unit1 = new LevelUnit(GameObjectLocator.Instance.getGameOjbectByPath("prefabs/units/SpearShieldMummy"), 10, 100, 3, 1.0f, 10);
        level1.addLevelUnit(level1_unit1);
        LevelUnit level1_unit2 = new LevelUnit(GameObjectLocator.Instance.getGameOjbectByPath("prefabs/units/SpearShieldMummy"), 1, 1000, 2.25f, 1.75f, 100);
        level1.addLevelUnit(level1_unit2);
        levels.Add(level1);

        BaseLevel level2 = new BaseLevel();
        level2.level = 2;
        LevelUnit level2_unit1 = new LevelUnit(GameObjectLocator.Instance.getGameOjbectByPath("prefabs/units/AxeMummy"), 20, 200, 2.8f, 1.0f, 15);
        level2.addLevelUnit(level2_unit1);
        levels.Add(level2);

    }

    //singleton code
    private static LevelLocator _instance;
    public static LevelLocator Instance
    {
        get
        {
            if (_instance == null)
            {
                _instance = new LevelLocator();

            }
            return _instance;
        }
    }

}
