//
//  ViewController.swift
//  Ders16
//
//  Created by Suleyman Calik on 28/12/14.
//  Copyright (c) 2014 Wissen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var alarms = [UILocalNotification]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        alarms = UIApplication.sharedApplication().scheduledLocalNotifications as [UILocalNotification]
        tableView.reloadData()
    }
    
    
    // MARK: - TableView Methods
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alarms.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("AlarmCell") as UITableViewCell
        
        var alarm = alarms[indexPath.row]
        cell.textLabel?.text = alarm.alertBody
        cell.detailTextLabel?.text = alarm.fireDate?.description
        return cell
    }
    
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            var alarm = alarms[indexPath.row]
            UIApplication.sharedApplication().cancelLocalNotification(alarm)
            alarms.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
        }
    }
}







