//
//  TodayViewController.swift
//  HavaDurumu
//
//  Created by Suleyman Calik on 10/01/15.
//  Copyright (c) 2015 Wissen. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
        
    @IBOutlet weak var lblHello: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var userDefaults = NSUserDefaults(suiteName: "group.wissen.ExtensionSharingDefaults")!
        var temprature = userDefaults.valueForKey("Temprature") as? Float
        var city = userDefaults.valueForKey("City") as String
        if let temprature = temprature {
            lblHello.text = "\(city) \(temprature)"
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)!) {
        // Perform any setup necessary in order to update the view.

        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData

        completionHandler(NCUpdateResult.NewData)
    }
    
}
