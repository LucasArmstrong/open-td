using UnityEngine;

public class CurrencyManager : MonoBehaviour {
    
    public static int TOTAL_GOLD = 0;

    public static void AddGold(int gold, Vector3 textPos, GameObject parentObj)
    {
        GoldText goldText = parentObj.AddComponent<GoldText>();
        goldText.init(textPos, gold);
        CurrencyManager.TOTAL_GOLD += gold;
    }

    public static bool RemoveGold(int gold)
    {
        if (TOTAL_GOLD >= gold)
        {
            CurrencyManager.TOTAL_GOLD -= gold;
            return true;
        }
        return false;
    }

    void OnGUI()
    {
        GUI.Label(new Rect(10, Screen.height - 30, 200, 30), "Total Gold: " + CurrencyManager.TOTAL_GOLD);
    }
}