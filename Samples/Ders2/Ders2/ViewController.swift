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
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func actionLogin(sender: UIButton) {
        
        if txtUsername.text.isEmpty {
            // alert goster
        }
        else {
            // yeni sayfa ac
            performSegueWithIdentifier("LoginToWelcome", sender: nil)
        }
        
    }

}









