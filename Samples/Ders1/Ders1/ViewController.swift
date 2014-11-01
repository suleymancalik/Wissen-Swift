//
//  ViewController.swift
//  Ders1
//
//  Created by Suleyman Calik on 1.11.2014.
//  Copyright (c) 2014 Wissen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblWelcome: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func actionButtonTapped(sender: AnyObject) {
        
        lblWelcome.text = "Hosgeldiniz"
    }

}










