//
//  ViewController.swift
//  PushClient
//
//  Created by Suleyman Calik on 24/01/15.
//  Copyright (c) 2015 Wissen. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sendPush(sender: AnyObject) {
        PFPush.sendPushMessageToQueryInBackground(nil, withMessage:"Merhaba") { (hasSent, error) -> Void in
            if hasSent {
                print("Push gonderildi!")
            }
            else {
                print("Gonderilemedi! \(error)")
            }
        }
    }

}

