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
    var segment = UISegmentedControl(items:["Harita", "Uydu" , "Hibrit"])
    var slider = UISlider()
    var distance:CLLocationDistance = 100
    
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
        mapView.zoomEnabled = false
        view.addSubview(mapView)
        
        var margin:CGFloat = 10
        var segmentY = mapView.frame.origin.y + mapView.frame.height + margin
        var segmentWidth = view.bounds.width - (2 * margin)
        segment.frame = CGRect(x:margin, y:segmentY, width:segmentWidth, height: 50)
        segment.selectedSegmentIndex = 2
        segment.addTarget(self, action:Selector("segmentChanged"), forControlEvents: UIControlEvents.ValueChanged)
        view.addSubview(segment)
        
        var sliderRect = segment.frame
        sliderRect.origin.y += segment.frame.height + margin
        slider.frame = sliderRect
        slider.minimumValue = 50   //minimum 50m
        slider.maximumValue = 5000 //maximum 5000m
        slider.value = Float(distance)
        slider.addTarget(self, action:Selector("sliderChanged"), forControlEvents: UIControlEvents.ValueChanged)
        view.addSubview(slider)
        
    }
    
    
    
    
    func kullaniciyiGoster() {
        // haritadan kullanicinin konumunu aliyoruz.
        var userLocation:MKUserLocation = mapView.userLocation

        // henuz lokasyon alinmamis ise devam etmiyoruz
        if let location = userLocation.location {
            var coordinate:CLLocationCoordinate2D = location.coordinate
            
            // Kullanicinin 1000 metre cevresini kapsayacak sekilde alan olusturuyoruz
            var region = MKCoordinateRegionMakeWithDistance(coordinate, distance, distance)
            
            // Haritanin olusturdugumuz alani gostermesini sagliyoruz
            mapView.setRegion(region, animated: true)
        }
    }
    
    
    // MARK: Action Methods
    
    func segmentChanged() {
        switch segment.selectedSegmentIndex {
        case 0:
            // harita secenegi secildi
            mapView.mapType = MKMapType.Standard
        case 1:
            // uydu secildi
            mapView.mapType = MKMapType.Satellite
        case 2:
            // hibrit secildi
            mapView.mapType = MKMapType.Hybrid
        default:
            break
        }
    }
    
    
    func sliderChanged() {
        distance = CLLocationDistance(slider.value)
        kullaniciyiGoster()
    }
    
    // MARK: Mapview Methods
    
    func mapView(mapView: MKMapView!, didUpdateUserLocation userLocation: MKUserLocation!) {
        kullaniciyiGoster()
    }
    
    func mapView(mapView: MKMapView!, didFailToLocateUserWithError error: NSError!) {
        println("didFailToLocateUserWithError: \(error)")
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







