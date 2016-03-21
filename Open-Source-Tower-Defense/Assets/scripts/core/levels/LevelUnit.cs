using UnityEngine;

public class LevelUnit
{
    public GameObject prefab = null;
    public int quantity = 0;
    public int health = 0;
    public float speed = 0f;
    public float scale = 1.0f;
    public int goldValue = 0;

    public LevelUnit(GameObject prefab, int quantity, int health, float speed, float scale, int goldValue)
    {
        this.prefab = prefab;
        this.quantity = quantity;
        this.health = health;
        this.speed = speed;
        this.scale = scale;
        this.goldValue = goldValue;
    }
}