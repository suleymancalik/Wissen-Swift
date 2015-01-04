//
//  ViewController.swift
//  Ders17
//
//  Created by Suleyman Calik on 03/01/15.
//  Copyright (c) 2015 Wissen. All rights reserved.
//

import UIKit

let keyCity = "City"
let keyUnit = "Unit"
let keyLanguage = "Language"


class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    
    @IBOutlet weak var lblCityName: UILabel!
    @IBOutlet weak var lblTemprature: UILabel!
    @IBOutlet weak var imgWeather: UIImageView!
    @IBOutlet weak var unitSegment: UISegmentedControl!
    @IBOutlet weak var languagePicker: UIPickerView!
    
    var languages:[(String,String)]!
    var weatherService = WeatherService()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var userDefaults = NSUserDefaults.standardUserDefaults()
        
        if userDefaults.valueForKey(keyUnit) == nil {
           userDefaults.setValue(0, forKey: keyUnit)
        }
        if userDefaults.valueForKey(keyLanguage) == nil {
            userDefaults.setValue(0, forKey: keyLanguage)
        }
        
        
        languages = [
            ("Türkçe"  , "tr"),
            ("English" , "en"),
            ("Russian" , "ru")]
        
        var leftWidth = view.bounds.width / 1.5
        self.slidingViewController().anchorRightPeekAmount = leftWidth
        
        slidingViewController().topViewAnchoredGesture = ECSlidingViewControllerAnchoredGesture.Tapping | ECSlidingViewControllerAnchoredGesture.Panning;
        view.addGestureRecognizer(self.slidingViewController().panGesture)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        refreshUI()
        refreshWeather()
    }

    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        var leftWidth = size.width / 1.5
        self.slidingViewController().anchorRightPeekAmount = leftWidth
    }
    
    
    func refreshUI() {
        
        var userDefaults = NSUserDefaults.standardUserDefaults()
        if let city:String = userDefaults.valueForKey(keyCity) as? String {
            lblCityName.text = city
        }
        else {
            lblCityName.text = "Lütfen Şehir Şeçiniz"
            lblTemprature.text = ""
            imgWeather.image = nil
        }
        
        
        if let unit:Int = userDefaults.valueForKey(keyUnit) as? Int {
            unitSegment.selectedSegmentIndex = unit
        }
        
        if let languageNo:Int = userDefaults.valueForKey(keyLanguage) as? Int {
            languagePicker.selectRow(languageNo, inComponent:0, animated:true)
        }

    }
    
    func refreshWeather() {
        
        var userDefaults = NSUserDefaults.standardUserDefaults()
        if let cityName:String = userDefaults.valueForKey(keyCity) as? String{
            var unitNo:Int = userDefaults.valueForKey(keyUnit) as Int
            var languageNo:Int = userDefaults.valueForKey(keyLanguage) as Int
            
            
            var languageCode = languages[languageNo].1
            var unit = WeatherUnit(rawValue: unitNo)!
            
            SVProgressHUD.showWithMaskType(SVProgressHUDMaskType.Black)
            weatherService.getWeather(cityName, language:languageCode, unit:unit) { (weather) -> () in
                SVProgressHUD.dismiss()
                
                self.refreshUI()
                // weather geldi
                // ekrani yenile
            }
        }

        
    }
    

    
    //MARK: - Actions
    
    @IBAction func segmentValueChanged(sender: UISegmentedControl) {
        NSUserDefaults.standardUserDefaults().setValue(sender.selectedSegmentIndex, forKey:keyUnit)
        NSUserDefaults.standardUserDefaults().synchronize()
        refreshWeather()
    }
    
    
    //MARK: - Picker Methods

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return languages.count
    }
    
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return languages[row].0
    }
    
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        var languageCode = languages[row].1
        
        NSUserDefaults.standardUserDefaults().setValue(row, forKey: keyLanguage)
        NSUserDefaults.standardUserDefaults().synchronize()
        refreshWeather()
    }
    
}

