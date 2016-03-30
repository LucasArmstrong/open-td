public class Slow {

    public float duration = 0f;
    public BaseTower owner = null;
    public float slowValue = 0.0f;
    public SlowType slowType = SlowType.none;

    public enum SlowType
    {
        none,
        iceTower
    }

    public Slow(float duration, BaseTower owner, float slowValue, SlowType slowType)
    {
        this.duration = duration;
        this.owner = owner;
        this.slowValue = slowValue;
        this.slowType = slowType;
    }
}
