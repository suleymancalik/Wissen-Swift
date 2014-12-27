//
//  ViewController.swift
//  Ders9
//
//  Created by Suleyman Calik on 06/12/14.
//  Copyright (c) 2014 Wissen. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate,  UIActionSheetDelegate {

    @IBOutlet weak var mapview: MKMapView!
    var locationManager:CLLocationManager = CLLocationManager()
    var selectedCoordinate:CLLocationCoordinate2D?
    
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
    
    func adresiOgren() {
        var geocoder = CLGeocoder()
        var location = CLLocation(latitude: selectedCoordinate!.latitude, longitude: selectedCoordinate!.longitude)
        geocoder.reverseGeocodeLocation(location, completionHandler: { (placemarks, error) -> Void in
            
            if error == nil {
                for placemark in placemarks as [CLPlacemark] {
                    println("country: \(placemark.country)")
                    println("administrativeArea: \(placemark.administrativeArea)")
                    println("locality: \(placemark.locality)")
                    println("subLocality: \(placemark.subLocality)")
                    println("thoroughfare: \(placemark.thoroughfare)")
                    println("subThoroughfare: \(placemark.subThoroughfare)")
                }
                
                
//                println(placemarks)
            }
            else {
                println("Geocode yapilamadi: \(error!)")
            }
            
        })
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowWebVC" {
            var webEkrani = segue.destinationViewController as WebVC
            webEkrani.urlString = "http://www.bahcesehir.edu.tr"
        }
    }
    
    // MARK: - MapView Methods
    
    // Kullanicinin konumu degistiginde, harita bize haber verir
    func mapView(mapView: MKMapView!, didUpdateUserLocation userLocation: MKUserLocation!) {
        
        if let kullaniciKonumu = userLocation.location {
            var region = MKCoordinateRegionMakeWithDistance(kullaniciKonumu.coordinate, 5000, 5000)
            mapview.setRegion(region, animated: true)
        }
        
    }
    
    
    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
        if annotation is CampusAnnotation {
            
            let identifier = "KampusAnnotation"
            var annView = mapview.dequeueReusableAnnotationViewWithIdentifier(identifier)

            if annView == nil {
                annView = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                annView.canShowCallout = true
                
                annView.rightCalloutAccessoryView = UIButton.buttonWithType(UIButtonType.DetailDisclosure) as UIView
                
                var buImage = UIImageView(image: UIImage(named: "bu"))
                annView.leftCalloutAccessoryView = buImage
            }
            
            annView.image = UIImage(named: "bu")
            
            return annView
        }
        else {
            return nil
        }
    }
    
    func mapView(mapView: MKMapView!, annotationView view: MKAnnotationView!, calloutAccessoryControlTapped control: UIControl!) {
        
        var actionsheet = UIActionSheet(title: "Kampüs Seçenekleri", delegate: self, cancelButtonTitle: "Vazgeç", destructiveButtonTitle: nil, otherButtonTitles: "Web Sayfası Aç", "Yol Tarifi Al" , "Adresi Öğren")
        actionsheet.showInView(self.view)
        
        selectedCoordinate = view.annotation.coordinate
    }
    
    
    // MARK: - Actionsheet Methods
    
    func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int) {
        
        switch buttonIndex {
        case 1:
            performSegueWithIdentifier("ShowWebVC", sender: nil)
        case 2:
            var coordinate = selectedCoordinate!
            var url = NSURL(string: "http://maps.apple.com/maps?q=\(coordinate.latitude),\(coordinate.longitude)")
            UIApplication.sharedApplication().openURL(url!)
        case 3:
            adresiOgren()
        default:
            break
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




