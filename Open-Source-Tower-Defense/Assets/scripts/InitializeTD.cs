using UnityEngine;
using System.Collections;

public class InitializeTD : MonoBehaviour {

    [SerializeField]
    private string VERSION = "0";

    [SerializeField]
    private string TITLE = "Open Source Tower Defense";

    void Awake()
    {
        Debug.Log("(" + VERSION + ") " + TITLE);
    }

}
