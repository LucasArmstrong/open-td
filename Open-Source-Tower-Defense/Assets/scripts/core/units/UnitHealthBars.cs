using UnityEngine;

public class UnitHealthBars : MonoBehaviour {

    private float _healthBarWidth = 40f;
    private float _healthBarHeight = 4f;

    private BaseUnit _unit = null;

    private Texture _healthBarTex = null;
    private Texture _backBarTex = null;
    private Texture _overBarTex = null;

    private float _healthBarRectWidth = 0f;

    private float _updateGate = 1f;
    private float _updateCounter = 0f;

    // Use this for initialization
    void Start () {
        _unit = GetComponent<BaseUnit>();
        if(_unit == null)
        {
            Destroy(this);
        }

        //load textures
        _healthBarTex = (Texture)ObjectLocator.Instance.getGameOjbectByPath("bars/healthBar");
        _backBarTex = (Texture)ObjectLocator.Instance.getGameOjbectByPath("bars/backgroundBar");
        _overBarTex = (Texture)ObjectLocator.Instance.getGameOjbectByPath("bars/barOverlay");

        _healthBarRectWidth = _healthBarWidth;
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
                (float)(_healthBarWidth - _unit.healthCurrent * (_healthBarWidth / _unit.healthMax));
    }

    void OnGUI()
    {
        if(_healthBarRectWidth != _healthBarWidth)
        {
            GUI.depth = 3;
            float yOffset = _unit.trueRenderer != null ? _unit.trueRenderer.bounds.size.y : 1f;
            Vector3 pos = Camera.main.WorldToScreenPoint(transform.position + new Vector3(0f, yOffset, .75f));
            Rect bgRect = new Rect(pos.x - (_healthBarWidth / 2.0f), Screen.height - (pos.y + yOffset), 
                _healthBarWidth, _healthBarHeight);
            Rect hbRect = new Rect(pos.x - (_healthBarWidth / 2.0f), Screen.height - (pos.y + yOffset), 
                _healthBarRectWidth, _healthBarHeight);

            GUI.DrawTexture(bgRect, _backBarTex, ScaleMode.StretchToFill);
            GUI.DrawTexture(hbRect, _healthBarTex, ScaleMode.StretchToFill);
            GUI.DrawTexture(bgRect, _overBarTex, ScaleMode.StretchToFill);
        }
        
    }
}
