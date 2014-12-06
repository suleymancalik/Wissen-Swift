//
//  ViewController.swift
//  Ders9
//
//  Created by Suleyman Calik on 06/12/14.
//  Copyright (c) 2014 Wissen. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet weak var mapview: MKMapView!
    var locationManager:CLLocationManager = CLLocationManager()
    
    // 41.041994  , 29.009049    besiktas
    // 41.0243174 , 28.9762317  galata
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager.delegate = self
        mapview.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        
        okullariGoster()
    }
    
    
    func okullariGoster() {
        
        var besiktasKampusu = CampusAnnotation()
        besiktasKampusu.coordinate =
            CLLocationCoordinate2D(latitude:41.041994, longitude: 29.009049)
        besiktasKampusu.title = "Bahçeşehir Üniversitesi"
        besiktasKampusu.subtitle = "Beşiktaş Kampüsü"
        mapview.addAnnotation(besiktasKampusu)
        
        
        var galataKampusu = CampusAnnotation()
        galataKampusu.coordinate =
            CLLocationCoordinate2D(latitude: 41.0243174, longitude: 28.9762317)
        galataKampusu.title = "Bahçeşehir Üniversitesi"
        galataKampusu.subtitle = "Galata Kampüsü"
        mapview.addAnnotation(galataKampusu)
    }
    
    
    
    // MARK: - MapView Methods
    
    // Kullanicinin konumu degistiginde, harita bize haber verir
    func mapView(mapView: MKMapView!, didUpdateUserLocation userLocation: MKUserLocation!) {
        
        if let kullaniciKonumu = userLocation.location {
            var region = MKCoordinateRegionMakeWithDistance(kullaniciKonumu.coordinate, 5000, 5000)
            mapview.setRegion(region, animated: true)
        }
        
    }
    

    
    // MARK: - LocationManager Methods

    // Izin durumu degistikce bu method cagrilacak
    // Biz de status'u kontrol edecegiz.
    func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        switch status {
        
        // Henuz izin alinmamis, muhtemelen uygulama ilk defa calisiyor
        case .NotDetermined:
            locationManager.requestWhenInUseAuthorization()

        // Lokasyon alimi reddedilmis
        // Kullanici Ayarlar'dan degistirmedikce, kullanicinin konumunu alamayiz
        case .Denied , .Restricted:
            println("Lokasyon Alimina Izin Verilmiyor!")

        // Konum izni verilmis
        case .Authorized , .AuthorizedWhenInUse:
            mapview.showsUserLocation = true
        }
    }
    
}




