using UnityEngine;

public class FireballTower : BaseTower
{
    private float _criticalChance = 25f;//25%

    //fireball tower has a chance to hit for 2x damage, we handle that here
    public override void projectileHit(GameObject gameObject)
    {
        int originalDamage = damage;

        float rand = Random.Range(0f, 100f);
        if(rand <= _criticalChance)
        {
            //Debug.Log("Critical hit: "+rand);
            damage *= 2;//multiply the damage by 2

            //display some red damage text in game to show there was a critical hit
            CriticalText critText = gameObject.AddComponent<CriticalText>();
            critText.init(gameObject.transform.position, damage, true);
        }

        //target unit is damaged in the base so we use that 
        base.projectileHit(gameObject);

        damage = originalDamage;
    }
}
