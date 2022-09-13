using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class GrowingBuildings : MonoBehaviour
{
    //public Transform BuildingPrefab;
    //public Collider Floor;
    [SerializeField]
    private GameObject[] prefabs;
    private int randomPrefab;
    public Transform buildingContainer;


    void OnCollisionEnter(Collision collision)
    {
        if (collision.gameObject.tag == "Water")
        {
            ContactPoint contact = collision.contacts[0];
            Quaternion rotation = Quaternion.FromToRotation(Vector3.up, contact.normal);
            Vector3 position = contact.point;
            randomPrefab = Random.Range(0, 100);
            //Instantiate(prefabs[randomPrefab], position, rotation);
            
            //Spawn random Building
            Instantiate(prefabs[randomPrefab], position, Quaternion.Euler(new Vector3(0, Random.Range(0, 360), 0)), buildingContainer);

          

        }
        }
    }
