//
//  ProfileVC.swift
//  SuleymanCalik
//
//  Created by Suleyman Calik on 21/12/14.
//  Copyright (c) 2014 Wissen. All rights reserved.
//

import UIKit
import Parse

class ProfileVC: UIViewController {
    
    var user:PFUser!

    override func viewDidLoad() {
        super.viewDidLoad()

        if user == nil {
            user = PFUser.currentUser()
        }
        
        var firstName = user["firstName"] as String
        var lastName = user["lastName"] as String
        
        self.title =  firstName + " " + lastName
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Action Methods

    @IBAction func logoutButtonTapped(sender: UIButton) {
        PFUser.logOut()
        
        tabBarController?.dismissViewControllerAnimated(true, completion:nil)
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
