using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class WaterEmitter : MonoBehaviour
{
    public Rigidbody waterInstance;
    public Transform waterContainer;
    private AudioSource WateringCanSound;
    private AudioClip clip;
    public float volume = 0.5f;
    bool Tiltrange;
    private float xRotMin = 0f, xRotMax = 90f;


    // Start is called before the first frame update
    void Start()
    {
        //InvokeRepeating("LaunchProjectile", 2.0f, 0.3f);
        WateringCanSound = GetComponent<AudioSource>();
        Tiltrange = false;

    }

    // Update is called once per frame
    void Update()
    {
        float Rotation = this.transform.rotation.eulerAngles.x;
        float ForwardY = transform.forward.y;
        float angle = Vector3.Angle(transform.up, Vector3.up);
        //Mathf.Clamp(Rotation, xRotMin, xRotMax);
        if (angle > 180)
        {
            angle -= 360;
        }
        Debug.Log(Rotation);

        if (Rotation > 45f && Rotation < 60f)
            {
            //emit water
            Rigidbody newWaterInstance = Instantiate(waterInstance, gameObject.transform.position, Quaternion.Euler(new Vector3(0, 0, 0)), waterContainer);
            Tiltrange = true;

        }
        else
        {
            Tiltrange = false;
        }
            //destroy Waterinstances
            foreach (Transform child in waterContainer)
        {
            Destroy(child.gameObject, 1f);
        }

        if (Tiltrange == true)
        {
            WateringCanSound.PlayOneShot(WateringCanSound.clip, volume);
        }

        if (Tiltrange == false)
        {
            WateringCanSound.Stop();
        }
    }


}
