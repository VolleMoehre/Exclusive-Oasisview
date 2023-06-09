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
    AudioSource Citysound;
    float CitysoundVolume;
    public string Endscene;
    public Color loadToColor = Color.black;


    void Start()
    {
        CitysoundVolume = 0.5f;
        Citysound = GetComponent<AudioSource>();
        Citysound.Play();


    }


    void Update()
    {


        getCount = GameObject.FindGameObjectsWithTag("Building");
        count = getCount.Length;

        // count buildings
        count++;
        buildingText.text = "Building: " + count;

        CitysoundVolume = count / 10;
        Citysound.volume = CitysoundVolume;

        if (count == 2)
        {
            Destroy(Pfeil.gameObject, 1f);
        }

        /*
        if (count > 2)
        {
            StartCoroutine(resetLevel());
        }

        //if (buildingContainer.transform.localScale == new Vector3(0, 0, 0))
        //{
        //    StartCoroutine(resetLevel());
        //}
        */

    }

    IEnumerator resetLevel()
    {
        //Tween scalingBuildings = buildingContainer.transform.DOScale(new Vector3(0, 0, 0), 5).SetEase(Ease.InQuart);
        //buildingContainer.transform.DOScale(new Vector3(0, 0, 0), 2).SetEase(Ease.InQuart);
        //yield return new WaitForSeconds(1);
        //FindObjectOfType<AudioManager>().PlayOneShot("BuildingStageOne");
        buildingContainer.transform.DOScale(new Vector3(0, 0, 0), 5);
        yield return new WaitForSeconds(4);
        Initiate.Fade(Endscene, loadToColor, 1.0f);
        //SceneManager.LoadScene("Scene_END");  

    }
}


