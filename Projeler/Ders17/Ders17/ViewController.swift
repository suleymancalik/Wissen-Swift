//
//  ViewController.swift
//  Ders17
//
//  Created by Suleyman Calik on 03/01/15.
//  Copyright (c) 2015 Wissen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    
    @IBOutlet weak var lblCityName: UILabel!
    @IBOutlet weak var lblTemprature: UILabel!
    @IBOutlet weak var imgWeather: UIImageView!
    @IBOutlet weak var unitSegment: UISegmentedControl!
    @IBOutlet weak var cityPicker: UIPickerView!
    
    var languages:[(String,String)]!
    var weatherService = WeatherService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        languages = [
            ("Türkçe"  , "tr"),
            ("English" , "en"),
            ("Russian" , "ru")]
        
        var leftWidth = view.bounds.width / 1.5
        self.slidingViewController().anchorRightPeekAmount = leftWidth
        
        slidingViewController().topViewAnchoredGesture = ECSlidingViewControllerAnchoredGesture.Tapping | ECSlidingViewControllerAnchoredGesture.Panning;
        view.addGestureRecognizer(self.slidingViewController().panGesture)
    }

    
    
    func refreshWeather() {
        
        weatherService.getWeather("buraya city gelecek", language: "buraya dil gelecek", unit: WeatherUnit.Celsius) { (weather) -> () in
            
            // weather geldi
            // ekrani yenile
        }
        
    }
    

    
    //MARK: - Actions
    
    @IBAction func segmentValueChanged(sender: UISegmentedControl) {
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
        var languageCode = languages[row].1
        // servera gonder
    }
    
}

