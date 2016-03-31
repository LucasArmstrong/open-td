using UnityEngine;
using System.Collections.Generic;

public delegate void UnitDeathCallbackType(BaseUnit deadObj);

[RequireComponent(typeof(NavMeshAgent))]
public class BaseUnit : MonoBehaviour {

    private static int _id_counter = 0;
    private static string _layer_string = "Units";

    public int goldValue = 0;

    public Renderer trueRenderer = null;

    private UnitHealthBars _UnitHealthBars = null;

    private int _id = 0;
    public int id
    {
        get { return _id; }
    }

    private int _healthCurrent = 100;
    public int healthCurrent
    {
        get { return _healthCurrent; }
        set { _healthCurrent = value; }
    }

    private int _healthMax = 100;
    public int healthMax
    {
        get { return _healthMax; }
        set { _healthMax = value; }
    }

    private NavMeshAgent _navAgent = null;
    public NavMeshAgent navAgent
    {
        get
        {
            if(_navAgent == null)
            {
                _navAgent = GetComponent<NavMeshAgent>();
            }
            return _navAgent;
            
        }
    }

    private Animator _animator = null;
    public Animator animator
    {
        get
        {
            if(_animator == null)
            {
                _animator = GetComponent<Animator>();
            }
            return _animator;
        }
    }

    private float _originalMoveSpeed = 0f;
    public float moveSpeed
    {
        get { return navAgent.speed; }
        set
        {   
            if(_originalMoveSpeed == 0f)
            {
                _originalMoveSpeed = value;
            }
            navAgent.speed = value;
        }
    }
    
    public void moveToPoint(Vector3 point)
    {
        navAgent.SetDestination(point);
        animator.SetTrigger("Run");
    }

    public void takeDamage(int damage)
    {
        healthCurrent -= damage;

        if(_UnitHealthBars != null)
        {
            _UnitHealthBars.forceBarUpdate();
        }

        if(healthCurrent <= 0)
        {
            die();
        }

    }

    public UnitDeathCallbackType deathCallback = null;
    private List<UnitDeathCallbackType> _deathCallbacks = new List<UnitDeathCallbackType>();
    public void registerDeathCallback(UnitDeathCallbackType callback)
    {
        _deathCallbacks.Add(callback);
    }

    public bool dead = false;
    public void die()
    {
        dead = true;
        animator.SetTrigger("Die");
        navAgent.Stop();
        navAgent.enabled = false;
        Destroy(GetComponent<UnitHealthBars>());
        if (_deathCallbacks.Count > 0)
        {
            foreach(UnitDeathCallbackType callback in _deathCallbacks)
            {
                callback(this);
            }
        }
        Destroy(gameObject, 5f);
    }

    void Start()
    {
        transform.gameObject.layer = LayerMask.NameToLayer(BaseUnit._layer_string);
        _id = ++BaseUnit._id_counter;
        moveToPoint(EndPointLocator.endPointObject.transform.position);
        _UnitHealthBars = gameObject.AddComponent<UnitHealthBars>();
    }

    void OnCollisionEnter(Collision col)
    {
        if (col.gameObject.tag == "EndPoint")
        {
            //unit reached the end of the maze, we dont want to award gold
            goldValue = 0;
            die();
        }
    }

    public static List<BaseUnit> getUnitsInRange(Vector3 pos, float radius)
    {
        List<BaseUnit> unitList = new List<BaseUnit>();

        int _unit_layer = LayerMask.NameToLayer(BaseUnit._layer_string);

        Collider[] colliders = Physics.OverlapSphere(pos, radius, 1 << _unit_layer);
        List<GameObject> alreadyChecked = new List<GameObject>();
        for (int i = 0; i < colliders.Length; i++)
        {
            if (alreadyChecked.Contains(colliders[i].gameObject)) { continue; }
            alreadyChecked.Add(colliders[i].gameObject);

            if (colliders[i] != null)
            {
                BaseUnit unit = colliders[i].gameObject.GetComponent<BaseUnit>();
                if (unit != null && !unitList.Contains(unit))
                {
                    unitList.Add(unit);
                }
            }
        }

        return unitList;
    }

    private Dictionary<Slow.SlowType, Slow> _slowEffects = new Dictionary<Slow.SlowType, Slow>();
    public void addSlow(Slow slow)
    {
        //we only allow one slow per slow type, so update duration and percent to existing slow
        if (_slowEffects.ContainsKey(slow.slowType))
        {
            _slowEffects[slow.slowType].duration = slow.duration;
            _slowEffects[slow.slowType].slowValue = slow.slowValue;
            _slowEffects[slow.slowType].owner = slow.owner;
        }
        //add a new slow effect for the unique tower
        else
        {
            _slowEffects.Add(slow.slowType, slow);
        }
    }

    private float _updateSlowGate = .1f;
    private float _updateSlowCounter = 0f;
    public void updateSlowEffects()
    {
        //if there arent any slows then we dont want to run this
        if(_slowEffects.Count <= 0){
            moveSpeed = _originalMoveSpeed;
            return;
        }

        List<Slow> slowsToRemove = new List<Slow>();
        float totalSlow = 0f;

        //update slow durations, calculate total slow, store slows to remove
        foreach (KeyValuePair<Slow.SlowType, Slow> slow in _slowEffects)
        {
            slow.Value.duration -= Time.deltaTime;
            if (slow.Value.duration <= 0f)
            {
                slowsToRemove.Add(slow.Value);
                continue;
            }
            totalSlow += slow.Value.slowValue;
        }

        //update movespeed here
        float newSpeed = _originalMoveSpeed - totalSlow;
        moveSpeed = (newSpeed >= 0f) == true ? newSpeed: 0f;

        //remove the expired slows here
        foreach(Slow removeSlow in slowsToRemove)
        {
            if (_slowEffects.ContainsKey(removeSlow.slowType))
            {
                _slowEffects.Remove(removeSlow.slowType);
            }
        }
    }

    private void Update()
    {
        //update & remove slow effects
        if(_updateSlowCounter >= _updateSlowGate)
        {
            _updateSlowCounter = 0f;
            updateSlowEffects();
        }
        else
        {
            _updateSlowCounter += Time.deltaTime;
        }
    }
}
