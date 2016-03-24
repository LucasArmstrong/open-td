using UnityEngine;
using System.Collections;

public class SetRenderer : MonoBehaviour {

	// Use this for initialization
	void Awake () {
        Renderer rend = GetComponent<Renderer>();
        if(rend != null)
        {
            BaseUnit unit = transform.parent.GetComponent<BaseUnit>();
            if(unit != null)
            {
                unit.trueRenderer = rend;
            }
        }
	}
}
