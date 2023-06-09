using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;

public class BuildingScalingSmooth : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        transform.DOScale(new Vector3(1, Random.Range(1,5), 1), Random.Range(50f,500f)).SetEase(Ease.OutQuart);
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
