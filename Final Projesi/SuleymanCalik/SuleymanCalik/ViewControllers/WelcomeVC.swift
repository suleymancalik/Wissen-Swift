//
//  WelcomeVC.swift
//  SuleymanCalik
//
//  Created by Suleyman Calik on 21/12/14.
//  Copyright (c) 2014 Wissen. All rights reserved.
//

import UIKit
import Parse

class WelcomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        if let currentUser = PFUser.currentUser() {
            performSegueWithIdentifier("MainSegue", sender: self)
        }
        else {
            performSegueWithIdentifier("LoginSegue", sender: self)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
