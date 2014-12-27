//
//  AppDelegate.swift
//  Ders15
//
//  Created by Suleyman Calik on 27/12/14.
//  Copyright (c) 2014 Wissen. All rights reserved.
//

import UIKit
import Parse

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        Parse.setApplicationId("UCVLMahElBOXVkICZsbdJ5kM576DOIk6CdD5cha3",
            clientKey: "qKamq0NYgb10n3KHERdlK1XrvZi90WSLeGZgj7ad")

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
//        println("token: \(deviceToken)")
        
        PFInstallation.currentInstallation().setDeviceTokenFromData(deviceToken)
        PFInstallation.currentInstallation().saveInBackgroundWithBlock { (completed, error) -> Void in
            if completed {
                println("TOKEN gonderildi")
            }
            else {
                println("TOKEN gonderilemedi! :\(error)")
            }
        }
        
        
    }
    

}

