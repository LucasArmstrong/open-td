using UnityEngine;
using System.Collections;

public interface IProjectileOwner
{
    void projectileHit(Vector3 point);
    void projectileHit(GameObject gameObject);
}

[RequireComponent(typeof(Rigidbody))]
public class BaseProjectile : MonoBehaviour {
    
    private float _speed = 0f;
    public float speed
    {
        get { return _speed; }
        set { _speed = value; }
    }

    private GameObject _targetObject = null;

    private Vector3 _targetPoint = Vector3.zero;

    private Vector3 _originPoint = Vector3.zero;

    private IProjectileOwner owner = null;

    private bool _projectileLaunched = false;

    public void setOwner(IProjectileOwner owner)
    {
        this.owner = owner;
    }

    public void projectileToGameObject(Vector3 originPoint, GameObject targetObject)
    {
        this._originPoint = originPoint;
        this._targetObject = targetObject;
        _projectileLaunched = true;
    }

    private void projectileHitGameObject()
    {
        if(owner != null)
        {
            owner.projectileHit(_targetObject);
        }
    }

    public void projectileToPoint(Vector3 originPoint, Vector3 targetPoint)
    {
        this._originPoint = originPoint;
        this._targetPoint = targetPoint;
        _projectileLaunched = true;
    }

    private void projectileHitPoint()
    {
        if (owner != null)
        {
            owner.projectileHit(_targetPoint);
        }
    }
    
    // Update is called once per frame
    void Update () {
	    
        //move towards target object
        if(_targetObject != null)
        {
            updatePosition(_targetObject.transform.position);
        }

        //move towards target point
        else if (_targetPoint != Vector3.zero)
        {
            updatePosition(_targetPoint);
            if(_targetPoint == transform.position)
            {
                //hit target point
                projectileHitPoint();
                Destroy(gameObject);
            }
        }
        else if (_projectileLaunched)
        {
            Destroy(gameObject);
        }

	}

    private void updatePosition(Vector3 targetPos)
    {
        float step = speed * Time.deltaTime;

        Vector3 currentPos = Vector3.MoveTowards(transform.position, targetPos, step);
        transform.position = currentPos;
        
        Vector3 pointToFace = targetPos - currentPos;
        Quaternion rot = Quaternion.LookRotation(pointToFace);
        transform.rotation = rot;
    }

    void OnCollisionEnter(Collision col)
    {
        if (col.gameObject == _targetObject)
        {
            //hit target object
            projectileHitGameObject();
            Destroy(gameObject);
        }
    }
}
