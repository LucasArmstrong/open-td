using UnityEngine;
using System.Collections;

public class DeselectTowerHandler : MonoBehaviour {

	void OnMouseUp()
    {
        TowerManager.deselectTower();
    }
    
	void Update () {
        if (Input.GetKeyDown(KeyCode.Escape))
        {
            TowerManager.deselectTower();
        }
    }
}
