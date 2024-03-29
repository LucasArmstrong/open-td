﻿using UnityEngine;

public class StructureHealthBar : MonoBehaviour
{

    private float _healthBarWidth = 80f;
    private float _healthBarHeight = 8f;

    private BaseUnit _unit = null;

    private Texture _healthBarTex = null;
    private Texture _backBarTex = null;
    private Texture _overBarTex = null;

    private float _healthBarRectWidth = 0f;

    private float _updateGate = 1f;
    private float _updateCounter = 0f;

    private float _yOffset = 0f;

    // Use this for initialization
    void Start()
    {

        //load textures
        _healthBarTex = ResourceObjects<Texture>.getResourceObjectByPath("bars/healthBar");
        _backBarTex = ResourceObjects<Texture>.getResourceObjectByPath("bars/backgroundBar");
        _overBarTex = ResourceObjects<Texture>.getResourceObjectByPath("bars/barOverlay");

        _healthBarRectWidth = _healthBarWidth;

        _yOffset = transform.GetComponent<Renderer>() != null ? transform.GetComponent<Renderer>().bounds.size.y : 1f;
    }

    // Update is called once per frame
    void Update()
    {
        if (_updateCounter >= _updateGate)
        {
            forceBarUpdate();
            _updateCounter = 0f;
        }
        else
        {
            _updateCounter += Time.deltaTime;
        }
    }

    public void forceBarUpdate()
    {
        _healthBarRectWidth = _healthBarWidth -
                (float)(_healthBarWidth - PlayerHealth.currentHealth * (_healthBarWidth / PlayerHealth.maxHealth));
    }

    void OnGUI()
    {
        if (_healthBarRectWidth != _healthBarWidth)
        {
            GUI.depth = 3;
            Vector3 pos = Camera.main.WorldToScreenPoint(transform.position + new Vector3(0f, _yOffset, .75f));
            Rect bgRect = new Rect(pos.x - (_healthBarWidth / 2.0f), Screen.height - (pos.y + _yOffset),
                _healthBarWidth, _healthBarHeight);
            Rect hbRect = new Rect(pos.x - (_healthBarWidth / 2.0f), Screen.height - (pos.y + _yOffset),
                _healthBarRectWidth, _healthBarHeight);

            GUI.DrawTexture(bgRect, _backBarTex, ScaleMode.StretchToFill);
            GUI.DrawTexture(hbRect, _healthBarTex, ScaleMode.StretchToFill);
            GUI.DrawTexture(bgRect, _overBarTex, ScaleMode.StretchToFill);
        }

    }
}
