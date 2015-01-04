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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        languages = [
            ("Türkçe","tr"),
            ("English" , "en"),
            ("Russian" , "ru")]
        
        var leftWidth = view.bounds.width / 1.5
        self.slidingViewController().anchorRightPeekAmount = leftWidth
        
        slidingViewController().topViewAnchoredGesture = ECSlidingViewControllerAnchoredGesture.Tapping | ECSlidingViewControllerAnchoredGesture.Panning;
        view.addGestureRecognizer(self.slidingViewController().panGesture)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        //        slidingViewController().anchorTopViewToRightAnimated(true)
        //        self.slidingViewController().anchorLeftPeekAmount = 60
        //        self.slidingViewController().anchorRightPeekAmount = 60
    }

    
    //MARK: Actions
    
    @IBAction func segmentValueChanged(sender: UISegmentedControl) {
    }
    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return languages.count
    }
    
}

