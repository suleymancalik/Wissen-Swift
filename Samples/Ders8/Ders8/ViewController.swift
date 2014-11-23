//
//  ViewController.swift
//  Ders8
//
//  Created by Suleyman Calik on 23.11.2014.
//  Copyright (c) 2014 Wissen. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager.delegate = self
    }
    
    // MARK: LocationManager Methods
    
    // loacationmanager bir hata ile karsilastiriginda bu method'u cagirir
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        println("ERR: \(error)")
    }

    //
    func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        
        println("didChangeAuthorizationStatus cagrildi!")
        
        // eger durum henuz belli degil ise (henuz izin istenmedi)
        if status == CLAuthorizationStatus.NotDetermined {

            println("Lokasyon icin henuz izin verilmedi ")
            // location kullanabilmek icin izin istiyoruz
            locationManager.requestWhenInUseAuthorization()
        }
        else if status == CLAuthorizationStatus.AuthorizedWhenInUse || status == CLAuthorizationStatus.Authorized {
            // izin verilmis
            
            // izin verilmisse burasi cagriliyor
            println("Kullanici lokasyona izin verdi ")
            
            // lokasyonu kullanmaya basla
        }
        else {
            println("Kullanici lokasyona izin vermedi ")
            //hata goster
        }
    }



}







