using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class SceneStart : MonoBehaviour
{

    public string Startscene;
    public Color loadToColor = Color.black;

    void Update()
    {
        if(transform.position.y <= 0)
        {
            StartCoroutine(startExperience());
        }
    }

    IEnumerator startExperience()
    {
        yield return new WaitForSeconds(5);
        Initiate.Fade(Startscene, loadToColor, 20.0f);

    }
}
