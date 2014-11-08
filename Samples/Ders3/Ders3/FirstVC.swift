//
//  FirstVC.swift
//  Ders3
//
//  Created by Suleyman Calik on 8.11.2014.
//  Copyright (c) 2014 Wissen. All rights reserved.
//

import UIKit

class FirstVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
  
    }

    @IBAction func actOpenSecondVC() {
        self.performSegueWithIdentifier("FirstToSecond", sender: nil)
    }


}












