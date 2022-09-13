using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class CountBuildingsProgress : MonoBehaviour
{
    private GameObject[] getCount;
    private int count;
    //public Text buildingText;
    //private int _buildingCount;

    //New Stuff für die ProgressBar
    Image progressBar;
    private float maxDistance;

    void Start()
    {
        //New Stuff für die ProgressBar
        progressBar = GetComponent<Image>();
        maxDistance = 150f;
        getCount = GameObject.FindGameObjectsWithTag("Building");
        count = getCount.Length;
        progressBar.fillAmount = count / maxDistance;
    }
    
    void Update()
    {
        getCount = GameObject.FindGameObjectsWithTag("Building");
        count = getCount.Length;

        // count buildings
        count++;
        //buildingText.text = "Building: " + count;

        //New Stuff für die ProgressBar
        if (progressBar.fillAmount < 1)
        { 
            progressBar.fillAmount = count / maxDistance;

            
        }

 
    }


}
