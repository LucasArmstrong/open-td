using UnityEngine;
using System.Collections;

public class PlayerHealth : MonoBehaviour {

    public static int maxHealth = 50;
    public static int currentHealth = PlayerHealth.maxHealth;

    private float _textWidth = 100f;
    private float _textHeight = 30f;
    private Rect _textRect;
    
    void OnGUI()
    {
        _textRect = new Rect(Screen.width - _textWidth, _textHeight, _textWidth, _textHeight);
        GUI.Label(_textRect, "<3 " + PlayerHealth.currentHealth + "/" + PlayerHealth.maxHealth);
    }
}
