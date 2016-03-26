using UnityEngine;

public class GoldText : MonoBehaviour
{

    private int _value;

    private float decayTime = 5f;
    private float currentTime = 0.0f;
    private float currentAlpha = 1.0f;

    private int fontSize = Random.Range(26, 28);
    private float fontSizeCounter = 0f;
    private float fontSizeLimit = .055f;
    
    private Vector3 _pos;

    private GUIStyle style = new GUIStyle();

    public void init(Vector3 pos, int value)
    {
        _value = value;
        _pos = Camera.main.WorldToScreenPoint(pos);
        style.fontStyle = FontStyle.Bold;
        style.normal.textColor = Color.yellow;
    }

    void OnGUI()
    {
        float yPos = Screen.height - (_pos.y );
        Color c = new Color();
        c = Color.yellow;
        c.a = currentAlpha;
        GUI.color = c;

        style.fontSize = fontSize;

        GUI.Label(new Rect(_pos.x, yPos, 75f, 22f), "$" + _value.ToString(), style);
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
            fontSizeCounter += Time.deltaTime;

            _pos = Vector3.MoveTowards(_pos, Vector3.zero, 4.75f);

            currentAlpha -= .015f;
            if (fontSizeCounter >= fontSizeLimit)
            {
                fontSizeCounter = 0f;
                if (fontSize > 1)
                {
                    fontSize -= 1;
                }
            }

        }
    }
}
