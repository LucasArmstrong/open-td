using UnityEngine;
using System.Collections;

public class InitializeTD : MonoBehaviour {

    [SerializeField]
    private string VERSION = "0";

    [SerializeField]
    private string TITLE = "Open Source Tower Defense";

    private LevelManager levelManager = null;

    void Awake()
    {
        Debug.Log("(" + VERSION + ") " + TITLE);

        levelManager = gameObject.AddComponent<LevelManager>();
    }

}
