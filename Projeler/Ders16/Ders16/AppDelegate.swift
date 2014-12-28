//
//  AppDelegate.swift
//  Ders16
//
//  Created by Suleyman Calik on 28/12/14.
//  Copyright (c) 2014 Wissen. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        var settings = UIUserNotificationSettings(forTypes:
            UIUserNotificationType.Alert |
            UIUserNotificationType.Badge |
            UIUserNotificationType.Sound
            ,categories: nil)
        application.registerUserNotificationSettings(settings)
        
        
        if let options = launchOptions {
            if let notification:UILocalNotification = options[UIApplicationLaunchOptionsLocalNotificationKey] as? UILocalNotification {
                handleNotification(notification)
            }
        }
        
        return true
    }

    func application(application: UIApplication, didReceiveLocalNotification notification: UILocalNotification) {
        handleNotification(notification)
    }
    

    //MARK: - Utility Methods
    
    func handleNotification(notification: UILocalNotification) {
        var alertView = UIAlertView(title: "ALARM", message: notification.alertBody, delegate: nil, cancelButtonTitle: "Tamam")
        alertView.show()
    }


}

