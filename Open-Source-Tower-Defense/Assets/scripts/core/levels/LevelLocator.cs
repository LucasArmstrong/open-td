using UnityEngine;
using System.Collections.Generic;

public class LevelLocator {

    public List<BaseLevel> levels = new List<BaseLevel>();

    private LevelLocator()
    {
        BaseLevel level1 = new BaseLevel();
        level1.level = 1;
        LevelUnit level1_unit1 = new LevelUnit((GameObject)ObjectLocator.Instance.getGameOjbectByPath("prefabs/units/SpearShieldMummy"), 25, 200, 3, 1.0f, 10);
        level1.addLevelUnit(level1_unit1);
        LevelUnit level1_unit2 = new LevelUnit((GameObject)ObjectLocator.Instance.getGameOjbectByPath("prefabs/units/SpearShieldMummy"), 1, 1500, 2.25f, 1.75f, 100);
        level1.addLevelUnit(level1_unit2);
        levels.Add(level1);

        BaseLevel level2 = new BaseLevel();
        level2.level = 2;
        LevelUnit level2_unit1 = new LevelUnit((GameObject)ObjectLocator.Instance.getGameOjbectByPath("prefabs/units/AxeMummy"), 25, 350, 2.9f, 1.0f, 15);
        level2.addLevelUnit(level2_unit1);
        LevelUnit level2_unit2 = new LevelUnit((GameObject)ObjectLocator.Instance.getGameOjbectByPath("prefabs/units/AxeMummy"), 1, 2500, 2.2f, 1.75f, 150);
        level2.addLevelUnit(level2_unit2);
        levels.Add(level2);

        BaseLevel level3 = new BaseLevel();
        level3.level = 3;
        LevelUnit level3_unit1 = new LevelUnit((GameObject)ObjectLocator.Instance.getGameOjbectByPath("prefabs/units/Mummy"), 25, 475, 3.5f, 1.0f, 20);
        level3.addLevelUnit(level3_unit1);
        LevelUnit level3_unit2 = new LevelUnit((GameObject)ObjectLocator.Instance.getGameOjbectByPath("prefabs/units/Mummy"), 1, 2750, 2.5f, 1.75f, 200);
        level3.addLevelUnit(level3_unit2);
        levels.Add(level3);

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