//
//  NewAlarmVC.swift
//  Ders16
//
//  Created by Suleyman Calik on 28/12/14.
//  Copyright (c) 2014 Wissen. All rights reserved.
//

import UIKit

class NewAlarmVC: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!    
    @IBOutlet weak var txtTitle: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    // MARK: - Action Methods
    
    @IBAction func cancelTapped(sender: UIButton) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func addTapped(sender: UIButton) {
        
        var newAlarm = UILocalNotification()
        newAlarm.fireDate = datePicker.date
        newAlarm.alertBody = txtTitle.text
        UIApplication.sharedApplication().scheduleLocalNotification(newAlarm)
        
        dismissViewControllerAnimated(true, completion: nil)
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
