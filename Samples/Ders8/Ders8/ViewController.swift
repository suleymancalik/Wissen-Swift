//
//  ViewController.swift
//  Ders8
//
//  Created by Suleyman Calik on 23.11.2014.
//  Copyright (c) 2014 Wissen. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    var locationManager = CLLocationManager()
    var mapView = MKMapView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager.delegate = self
        mapView.delegate = self
        
        haritaEkle()
    }
    
    
    func haritaEkle() {
        
        var mapSize = view.bounds.width
        
        mapView.frame = CGRect(x: 0, y: 20, width: mapSize, height: mapSize)
        mapView.mapType = MKMapType.Hybrid
        view.addSubview(mapView)
    }
    
    
    func kullaniciyiGoster() {
        // haritadan kullanicinin konumunu aliyoruz.
        var userLocation:MKUserLocation = mapView.userLocation
        var location:CLLocation = userLocation.location
        var coordinate:CLLocationCoordinate2D = location.coordinate
        
        // Kullanicinin 1000 metre cevresini kapsayacak sekilde alan olusturuyoruz
        var region = MKCoordinateRegionMakeWithDistance(coordinate, 5000, 5000)
        
        // Haritanin olusturdugumuz alani gostermesini sagliyoruz
        mapView.setRegion(region, animated: true)
    }
    
    
    
    // MARK: Mapview Methods
    
    func mapView(mapView: MKMapView!, didUpdateUserLocation userLocation: MKUserLocation!) {
        kullaniciyiGoster()
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
            
            mapView.showsUserLocation = true
        }
        else {
            println("Kullanici lokasyona izin vermedi ")
            //hata goster
        }
    }



}







