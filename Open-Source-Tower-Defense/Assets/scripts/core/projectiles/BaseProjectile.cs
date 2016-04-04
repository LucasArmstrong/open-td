/**
 * BaseProjectile class for projectile objects in Unity3D
 *
 * This class provides the raw functionality most projectiles require in Unity.
 * An interface is included in this file called IProjectileOnwer. This interface 
 * needs to be implemented by any object that is trying to create and own a BaseProjectile.
 *
 * @author     Lucas Armstrong <lucasacode@gmail.com>
 * @license    https://opensource.org/licenses/MIT MIT
 * @link       https://github.com/LucasArmstrong/open-td/
 *
 * @requires UnityEngine, MonoBehavior and Rigidbody
 */

using UnityEngine;

/**
  * @interface IProjectileOwner 
  * @desc Implemented in objects that wish to own a projectile 
  *  the owner handles the hit event
  *
  * @method projectileHit(Vector3 point) - Handles hit event on a Vector3
  * @method projectileHit(GameObject gameObject) - Handles hit event on a GameObject
  * @method projectileLaunch(Vector3 point) - Starts a projectile that targets Vector3 
  * @method projectileLaunch(GameObject gameObject) - Starts a projectile that targets GameObject
  * 
  * @requires UnityEngine
*/
public interface IProjectileOwner
{
    void projectileHit(Vector3 point);
    void projectileHit(GameObject gameObject);
    void projectileLaunch(Vector3 point);
    void projectileLaunch(GameObject gameObject);
}

[RequireComponent(typeof(Rigidbody))]
public class BaseProjectile : MonoBehaviour {

    /** @field _targetObject
      * @type GameObject
      * @desc this will be set if the projectile is targeting a GameObject
    */
    private GameObject _targetObject = null;

    /** @field _targetPoint
      * @type Vector3
      * @desc this will be set if the projectile is targeting a Vector3 point
    */
    private Vector3 _targetPoint = Vector3.zero;

    /** @field _projectileLaunched
      * @type bool
      * @desc flag to show if projectile has started its path
    */
    private bool _projectileLaunched = false;

    /** @field _startTime
      * @type float
      * @desc the time when projectile was launched
    */
    private float _startTime = 0f;

    /** @field _journeyLength
      * @type float
      * @desc original distance between projectile and its target
    */
    private float _journeyLength = 0f;

    /** @property useGravity
      * @type float
      * @desc control the movement speed of projectile
    */
    private float _speed = 0f;
    public float speed
    {
        get { return _speed; }
        set { _speed = value; }
    }

    /** @property useGravity
      * @type boolean
      * @desc set the use of Rigidbody's built in gravity parameter
    */
    public bool useGravity
    {
        get { return GetComponent<Rigidbody>().useGravity; }
        set { GetComponent<Rigidbody>().useGravity = value; }
    }

    /** @property vectorOffset
      * @type Vector3
      * @desc used to adjust the target point of the projectile when its targeting a GameObject
    */
    private Vector3 _vectorOffset = Vector3.zero;
    public Vector3 vectorOffset
    {
        get { return _vectorOffset; }
        set { _vectorOffset = value; }
    }

    /** @property owner
      * @type IProjectileOwner
      * @desc object that launched the projectile (probably a tower)
    */
    private IProjectileOwner _owner = null;
    public IProjectileOwner owner
    {
        get { return _owner; }
        set { _owner = value; }
    }

    /** @method startProjectile
      * @desc initializes start time and journey length, makes projectile ready
      * @param Vector3 endPos - used to calculate journey distance
      * @return void
    */
    private void startProjectile(Vector3 endPos)
    {
        try
        {
            _startTime = Time.time;
            _journeyLength = Vector3.Distance(transform.position, endPos);
            _projectileLaunched = true;
        }
        catch (System.Exception e)
        {
            Debug.Log("BaseProjectile.startProjectile(" + endPos + "): Error: " + e.Message);
        }
    }

    /** @method projectileToGameObject
      * @desc use this to fire a projectile at a GameObject
      * @param GameObject targetObject - object the projectile will target
      * @return void
    */
    public void projectileToGameObject(GameObject targetObject)
    {
        try
        {
            this._targetObject = targetObject;
            startProjectile(targetObject.transform.position);
        }
        catch (System.Exception e)
        {
            Debug.Log("BaseProjectile.projectileToGameObject(" + targetObject.name + "): Error: " + e.Message);
        }
    }

    /** @method projectileHitGameObject
      * @desc called when projectile collides with GameObject its targeting
      * @return void
    */
    private void projectileHitGameObject()
    {
        try
        {
            if (owner != null)
            {
                owner.projectileHit(_targetObject);
            }
        }
        catch (System.Exception e)
        {
            Debug.Log("BaseProjectile.projectileHitGameObject(): Error: " + e.Message);
        }
    }

    /** @method projectileToPoint
      * @desc use this to fire a projectile at a point
      * @param Vector3 targetPoint - world point the projectile will target
      * @return void
    */
    public void projectileToPoint(Vector3 targetPoint)
    {
        try
        {
            this._targetPoint = targetPoint;
            startProjectile(targetPoint);
        }
        catch (System.Exception e)
        {
            Debug.Log("BaseProjectile.projectileToPoint(" + targetPoint + "): Error: " + e.Message);
        }
    }

    /** @method projectileHitPoint
      * @desc called when projectile reaches the point its targeting
      * @return void
    */
    private void projectileHitPoint()
    {
        try
        {
            if (owner != null)
            {
                owner.projectileHit(_targetPoint);
            }
        }
        catch (System.Exception e)
        {
            Debug.Log("BaseProjectile.projectileHitPoint(): Error: " + e.Message);
        }
    }

    /** @method updatePosition
      * @desc moves the projectile towards the target position and sets projectile 
      *       rotation to "look at" the target
      * @param Vector3 targetPos - point the projectile is targeting
      * @return void
    */
    private void updatePosition(Vector3 targetPos)
    {
        try
        {
            //update projectile position
            float distCovered = (Time.time - _startTime) * speed;
            float fracJourney = distCovered / _journeyLength;
            Vector3 currentPos = Vector3.Lerp(transform.position, targetPos, fracJourney);
            transform.position = currentPos;

            //update projectile rotation
            Vector3 pointToFace = targetPos - currentPos;
            Quaternion rot = Quaternion.LookRotation(pointToFace);
            transform.rotation = rot;
        }
        catch(System.Exception e)
        {
            Debug.Log("BaseProjectile.updatePosition("+targetPos+"): Error: " + e.Message);
        }
    }

    /** @method Update
      * @desc Native Unity method , Update is called once per frame
      * @return void
    */
    private void Update()
    {
        try
        {
            //move towards target object
            if (_targetObject != null)
            {
                Vector3 pos = _targetObject.transform.position + vectorOffset;
                updatePosition(pos);
            }

            //move towards target point
            else if (_targetPoint != Vector3.zero)
            {
                updatePosition(_targetPoint);
                if (_targetPoint == transform.position)
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
        catch (System.Exception e)
        {
            Debug.Log("BaseProjectile.Update(): Error: " + e.Message);
        }
    }

    /** @method OnCollisionEnter
      * @desc Native Unity method , event triggered when projectile enters another collider
      * @return void
    */
    private void OnCollisionEnter(Collision col)
    {
        try
        {
            if (col.gameObject == _targetObject)
            {
                //hit target object
                projectileHitGameObject();
                Destroy(gameObject);
            }
        }
        catch (System.Exception e)
        {
            Debug.Log("BaseProjectile.OnCollisionEnter(): Error: " + e.Message);
        }
    }

}
