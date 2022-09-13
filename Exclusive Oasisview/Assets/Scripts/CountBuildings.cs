using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.Audio;
using DG.Tweening;
using UnityEngine.SceneManagement;


public class CountBuildings : MonoBehaviour
{
    private GameObject[] getCount;
    private int count;
    public Text buildingText;
    public Material otherSkybox;
    public Transform buildingContainer;
    public GameObject Pfeil;


    void Start()
    {

    }


    void Update()
    {


        getCount = GameObject.FindGameObjectsWithTag("Building");
        count = getCount.Length;

        // count buildings
        count++;
        buildingText.text = "Building: " + count;

        if (count == 2)
        {
            Destroy(Pfeil.gameObject, 1f);
        }

        if (count > 80)
        {
            RenderSettings.skybox = otherSkybox;
            FindObjectOfType<AudioManager>().PlayOneShot("succsess");


        }

        if (count > 150)
        {
            StartCoroutine(resetLevel());
        }

        //if (buildingContainer.transform.localScale == new Vector3(0, 0, 0))
        //{
        //    StartCoroutine(resetLevel());
        //}

    }

    IEnumerator resetLevel()
    {
        //Tween scalingBuildings = buildingContainer.transform.DOScale(new Vector3(0, 0, 0), 5).SetEase(Ease.InQuart);
        //buildingContainer.transform.DOScale(new Vector3(0, 0, 0), 2).SetEase(Ease.InQuart);
        //yield return new WaitForSeconds(1);
        //FindObjectOfType<AudioManager>().PlayOneShot("BuildingStageOne");
        buildingContainer.transform.DOScale(new Vector3(0, 0, 0), 5);
        yield return new WaitForSeconds(10);
        SceneManager.LoadScene("Scene_Buildingsgrowing");
        
    }
}


//IEnumerator SomeCoroutine()
//{
//    Tween myTween = transform.DOMoveX(45, 1);
//    yield return myTween.WaitForStart();
//    // This log will happen when the tween starts
//    Debug.Log("Tween started!");
//}

