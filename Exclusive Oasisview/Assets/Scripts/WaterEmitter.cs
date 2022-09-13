using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class WaterEmitter : MonoBehaviour
{
    public Rigidbody waterInstance;
    public Transform waterContainer;

    
    // Start is called before the first frame update
    void Start()
    {
        InvokeRepeating("LaunchProjectile", 2.0f, 0.3f);
    }

    // Update is called once per frame
    void Update()
    {
        if (transform.rotation.eulerAngles.x <= 360f && transform.rotation.eulerAngles.x >= 310f)
            //if (Input.GetMouseButtonDown(0))
            {
            //emit water
            Rigidbody newWaterInstance = Instantiate(waterInstance, gameObject.transform.position, Quaternion.Euler(new Vector3(0, 0, 0)), waterContainer);
        }
            //destroy Waterinstances
            foreach (Transform child in waterContainer)
        {
            Destroy(child.gameObject, 1f);
        }
    }


}
