using UnityEngine;

public class CriticalText : MonoBehaviour
{

    private int _value;

    private float decayTime = 8.0f;
    private float currentTime = 0.0f;
    private float currentAlpha = 1.0f;

    private Vector3 _originPos;
    private Vector3 _pos;
    private float _offset = Random.Range(50f, 66f);

    private float _xOffset = Random.Range(50f, 70f);
    private int fontSize;
    private GUIStyle style;

    private float _offsetMod = .75f;
    private float _alphaMod = .025f;

    public void init(Vector3 pos, int value, bool crit = false)
    {

        _value = value;
        _originPos = pos;

        this.fontSize = (crit == true) ? 30 : 26;
        style = new GUIStyle();
        style.fontSize = fontSize;
        if (crit == true)
        {
            style.fontStyle = FontStyle.Bold;
        }
        style.normal.textColor = Color.red;
        style.alignment = TextAnchor.MiddleCenter;
        _pos = Camera.main.WorldToScreenPoint(_originPos);
    }

    void OnGUI()
    {

        float yPos = Screen.height - (_pos.y + _offset);
        Color c = new Color();
        c = Color.red;
        c.a = currentAlpha;
        GUI.color = c;

        GUI.Label(new Rect(_pos.x - _xOffset, yPos, 100f, 22f), _value.ToString(), style);

    }

    // Update is called once per frame
    void Update()
    {

        if (currentTime >= decayTime)
        {
            Destroy(this);
        }
        else
        {
            currentTime += Time.deltaTime;
            _offset += _offsetMod;
            currentAlpha -= _alphaMod;
        }
    }
}