using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;

public class BuildingScalingSmooth : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        transform.DOScale(new Vector3(1, 1, 1), 150f).SetEase(Ease.OutQuart);
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
