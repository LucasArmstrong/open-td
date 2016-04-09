using UnityEngine;
using System.Collections;

public class InitializeTD : MonoBehaviour {

    private const float _START_DELAY_SECONDS = 5f;

    [SerializeField]
    private string VERSION = "0";

    [SerializeField]
    private string TITLE = "Open Source Tower Defense";

    private LevelManager levelManager = null;
    private CurrencyManager currencyManager = null;
    private TowerManager towerManager = null;
    private PlayerHealth playerHealth = null;

    void Awake()
    {
        Debug.Log("(" + VERSION + ") " + TITLE);

        towerManager = gameObject.AddComponent<TowerManager>();
        levelManager = gameObject.AddComponent<LevelManager>();
        currencyManager = gameObject.AddComponent<CurrencyManager>();
        playerHealth = gameObject.AddComponent<PlayerHealth>();

        StartCoroutine(finishInit(1f));
    }

    public IEnumerator finishInit(float waitTime)
    {
        yield return new WaitForSeconds(waitTime);
        Debug.Log("Tower count: " + WorldObjects<BaseTower>.withinPointRadius(StartPointLocator.startPointObject.transform.position, 200f).Count);
        Debug.Log("TD starts in " + _START_DELAY_SECONDS + " seconds!");
        StartCoroutine(levelManager.loadNextLevel(_START_DELAY_SECONDS));
    }

}