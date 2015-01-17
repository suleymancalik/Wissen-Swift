//
//  ViewController.swift
//  Ders21
//
//  Created by Suleyman Calik on 17/01/15.
//  Copyright (c) 2015 Wissen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var count = 0
    var userDefaults = NSUserDefaults.standardUserDefaults()
    let keySayac = "sayac"
    
    @IBOutlet weak var lblCount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        count = userDefaults.integerForKey(keySayac)
        lblCount.text = "\(count)"
    }
    
    
    
    //MARK: - Action Methods
    
    override func canBecomeFirstResponder() -> Bool {
        return true
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent) {
        if motion == UIEventSubtype.MotionShake {
            count = 0
            userDefaults.setInteger(count, forKey: keySayac)
            userDefaults.synchronize()
            lblCount.text = "\(count)"
        }
    }


    @IBAction func btnCountTapped(sender: UIButton) {
        count++
        userDefaults.setInteger(count, forKey: keySayac)
        userDefaults.synchronize()
        lblCount.text = "\(count)"
    }

}






