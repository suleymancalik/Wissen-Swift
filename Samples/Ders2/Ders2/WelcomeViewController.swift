//
//  WelcomeViewController.swift
//  Ders2
//
//  Created by Suleyman Calik on 2.11.2014.
//  Copyright (c) 2014 Wissen. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var lblWelcome: UILabel!
    
    var username:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblWelcome.text = "Hoşgeldin: \(username)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func actionLogout(sender: AnyObject) {
        
        
        var alertController =
        UIAlertController(title: "Çıkış Yapıyorsunuz", message: "Emin misiniz?", preferredStyle: UIAlertControllerStyle.Alert)
        
        var actionCancel = UIAlertAction(title: "Vazgeç", style: UIAlertActionStyle.Cancel, handler: nil)
        alertController.addAction(actionCancel)
        
        var actionLogout = UIAlertAction(title: "Çıkış Yap", style: UIAlertActionStyle.Destructive)
            { (action) -> Void in
            // Buraya çıkış kodunu yazacağız
                self.dismissViewControllerAnimated(true, completion: nil)
            //
        }
        alertController.addAction(actionLogout)
        
        presentViewController(alertController, animated: true, completion: nil)

        
        
        
        
//
    }



}















