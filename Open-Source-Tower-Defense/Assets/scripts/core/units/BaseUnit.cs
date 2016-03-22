using UnityEngine;

public delegate void UnitDeathCallbackType(GameObject deadObj);

[RequireComponent(typeof(NavMeshAgent))]
public class BaseUnit : MonoBehaviour {

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

    }

    public UnitDeathCallbackType deathCallback = null;
    public void die()
    {
        if(deathCallback != null)
        {
            deathCallback(gameObject);
        }
        Destroy(gameObject);
    }

    void Start()
    {
        moveToPoint(EndPointLocator.endPointObject.transform.position);
    }

    void OnCollisionEnter(Collision col)
    {
        if (col.gameObject.tag == "EndPoint")
        {
            die();
        }
    }
}
