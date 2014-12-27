//
//  AppDelegate.swift
//  Ders15
//
//  Created by Suleyman Calik on 27/12/14.
//  Copyright (c) 2014 Wissen. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        if application.isRegisteredForRemoteNotifications() {
            println("Push Notification hazir")
        }
        else {
            var settings = UIUserNotificationSettings(forTypes:
                UIUserNotificationType.Badge |
                UIUserNotificationType.Sound |
                UIUserNotificationType.Alert,
                categories:nil)
            application.registerUserNotificationSettings(settings)
        }
        application.registerForRemoteNotifications()
        

        return true
    }


    
    func application(application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
        println("token: \(deviceToken)")
    }
    

}

