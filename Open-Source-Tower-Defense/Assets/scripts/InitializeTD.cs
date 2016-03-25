using UnityEngine;

public class InitializeTD : MonoBehaviour {

    [SerializeField]
    private string VERSION = "0";

    [SerializeField]
    private string TITLE = "Open Source Tower Defense";

    private LevelManager levelManager = null;
    private CurrencyManager currencyManager = null;

    void Awake()
    {
        Debug.Log("(" + VERSION + ") " + TITLE);

        levelManager = gameObject.AddComponent<LevelManager>();
        currencyManager = gameObject.AddComponent<CurrencyManager>();
    }

}