//
//  SignupVC.swift
//  SuleymanCalik
//
//  Created by Suleyman Calik on 21/12/14.
//  Copyright (c) 2014 Wissen. All rights reserved.
//

import UIKit
import Parse

class SignupVC: UIViewController {

    
    @IBOutlet weak var txtFirstname: UITextField!
    @IBOutlet weak var txtLastname: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveButtonTapped(sender: UIButton) {
        
        if !txtFirstname.text.isEmpty &&
            !txtLastname.text.isEmpty &&
            !txtEmail.text.isEmpty    &&
            !txtPassword.text.isEmpty {
                
                var newUser = PFUser()
                newUser.email = txtEmail.text
                newUser.username = txtEmail.text
                newUser.password = txtPassword.text
                newUser["firstName"] = txtFirstname.text
                newUser["lastName"] = txtLastname.text
                
                newUser.signUpInBackgroundWithBlock({ (succeeded: Bool, error: NSError!) -> Void in
                    if succeeded {
                        self.performSegueWithIdentifier("MainSegue", sender: self)
                    }
                    else {
                        println("Kayit basarisiz! \(error.description)")
                    }
                })
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
