using UnityEngine;

//IProjectileOwner is implemented in objects that wish to own a projectile
//the owner handles the hit event 
public interface IProjectileOwner
{
    void projectileHit(Vector3 point);
    void projectileHit(GameObject gameObject);
    void projectileLaunch(Vector3 point);
    void projectileLaunch(GameObject gameObject);
}

[RequireComponent(typeof(Rigidbody))]
public class BaseProjectile : MonoBehaviour {
    
    //used to control the movement speed of projectile
    private float _speed = 0f;
    public float speed
    {
        get { return _speed; }
        set { _speed = value; }
    }
    
    //field to set the use of Rigidbody's built in gravity parameter
    public bool useGravity
    {
        get { return GetComponent<Rigidbody>().useGravity; }
        set { GetComponent<Rigidbody>().useGravity = value; }
    }

    //this will be set if the projectile is targeting a GameObject
    private GameObject _targetObject = null;

    //this will be set if the projectile is targeting a point in the world
    private Vector3 _targetPoint = Vector3.zero;

    //used to adjust the target point of the projectile when its targeting a GameObject
    private Vector3 _vectorOffset = Vector3.zero;
    public Vector3 vectorOffset
    {
        get { return _vectorOffset; }
        set { _vectorOffset = value; }
    }

    //object that launched the projectile (probably a tower)
    private IProjectileOwner _owner = null;
    public IProjectileOwner owner
    {
        get { return _owner; }
        set { _owner = value; }
    }

    //flag to show if projectile has started its path
    private bool _projectileLaunched = false;

    //use this to fire a projectile at a GameObject
    public void projectileToGameObject(GameObject targetObject)
    {
        this._targetObject = targetObject;
        _projectileLaunched = true;
    }

    //called when projectile collides with GameObject its targeting
    private void projectileHitGameObject()
    {
        if(owner != null)
        {
            owner.projectileHit(_targetObject);
        }
    }

    //use this to fire a projectile at a point
    public void projectileToPoint(Vector3 targetPoint)
    {
        this._targetPoint = targetPoint;
        _projectileLaunched = true;
    }

    //called when projectile reaches the point its targeting
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
            Vector3 pos = _targetObject.transform.position + vectorOffset;
            updatePosition(pos);
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

        //projectile was created but no longer has a target, kill projectile
        else if (_projectileLaunched)
        {
            Destroy(gameObject);
        }

	}

    //moves the projectile towards the target position and sets projectile rotation to "look at" the target
    private void updatePosition(Vector3 targetPos)
    {
        float step = speed * Time.deltaTime;

        Vector3 currentPos = Vector3.MoveTowards(transform.position, targetPos, step);
        transform.position = currentPos;
        
        Vector3 pointToFace = targetPos - currentPos;
        Quaternion rot = Quaternion.LookRotation(pointToFace);
        transform.rotation = rot;
    }

    //Unit OnCollisionEnter event -- triggered when projectile enters another collider
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
