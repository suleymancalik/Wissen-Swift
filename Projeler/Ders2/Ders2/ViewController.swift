//
//  ViewController.swift
//  Ders2
//
//  Created by Suleyman Calik on 2.11.2014.
//  Copyright (c) 2014 Wissen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txtUsername: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        println("Giris ekrani hazir")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func actionLogin(sender: UIButton) {
        
        if txtUsername.text.isEmpty {
            // alert goster
            
            var alertController =
            UIAlertController(title: "Eksik Bilgi", message: "Lütfen kullanıcı adınızı giriniz.", preferredStyle: UIAlertControllerStyle.Alert)
            
            var action = UIAlertAction(title: "Tamam", style: UIAlertActionStyle.Default, handler: nil)
            alertController.addAction(action)
            
            presentViewController(alertController, animated: true, completion: nil)
        }
        else {
            // yeni sayfa ac
            performSegueWithIdentifier("LoginToWelcome", sender: nil)
            txtUsername.text = ""
        }
        
    }
    
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        var welcomeVC:WelcomeViewController = segue.destinationViewController as WelcomeViewController
        welcomeVC.username = txtUsername.text
        
    }
    
}









