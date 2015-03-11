//
//  LoginVC.swift
//  SuleymanCalik
//
//  Created by Suleyman Calik on 21/12/14.
//  Copyright (c) 2014 Wissen. All rights reserved.
//

import UIKit
import Parse

class LoginVC: UIViewController {

    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Action Methods
    
    @IBAction func loginButtonTapped(sender: UIButton) {
        if !txtUsername.text.isEmpty && !txtPassword.text.isEmpty {
            
            PFUser.logInWithUsernameInBackground(txtUsername.text, password: txtPassword.text, block: { (user:PFUser!, error:NSError!) -> Void in
                if let loggedInUser = user {
                    
                    self.txtUsername.text = ""
                    self.txtPassword.text = ""
                    
                    self.performSegueWithIdentifier("MainSegue", sender: self)
                }
                else {
                    println("Login olamadi! \(error)")
                }
            })
        }
        else {
            println("Alanlar bos birakilamaz")
        }
    }
        
    @IBAction func newUserButtonTapped(sender:UIButton!) {
        performSegueWithIdentifier("SignupSegue", sender: self)
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
