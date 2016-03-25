﻿using UnityEngine;
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

    public float moveSpeed
    {
        get
        {
            return navAgent.speed;
        }
        set
        {
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

    public void die()
    {
        if(_deathCallbacks.Count > 0)
        {
            foreach(UnitDeathCallbackType callback in _deathCallbacks)
            {
                callback(this);
            }
        }
        Destroy(gameObject);
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
}
