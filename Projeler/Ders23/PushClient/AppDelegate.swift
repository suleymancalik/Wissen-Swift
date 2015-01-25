//
//  AppDelegate.swift
//  PushClient
//
//  Created by Suleyman Calik on 24/01/15.
//  Copyright (c) 2015 Wissen. All rights reserved.
//

import UIKit
import Parse

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        Parse.setApplicationId("UCVLMahElBOXVkICZsbdJ5kM576DOIk6CdD5cha3", clientKey: "qKamq0NYgb10n3KHERdlK1XrvZi90WSLeGZgj7ad")
        
        
        
        //////  Genel
        if application.isRegisteredForRemoteNotifications() {
            
        }
        else {
            var settings = UIUserNotificationSettings(forTypes:
                UIUserNotificationType.Badge |
                    UIUserNotificationType.Sound |
                    UIUserNotificationType.Alert, categories:nil)
            application.registerUserNotificationSettings(settings)
        }
        
        
        
        return true
    }


    func application(application: UIApplication, didRegisterUserNotificationSettings notificationSettings: UIUserNotificationSettings) {
        application.registerForRemoteNotifications()
    }
    
    func application(application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
        // burada gelen token'i sunucuya gonder, veritabanina kaydetsin
        
        // PARSE
        PFInstallation.currentInstallation().setDeviceTokenFromData(deviceToken)
        PFInstallation.currentInstallation().saveInBackgroundWithBlock { (saved, error) -> Void in
            print("Kaydetti mi? \(saved)")
        }
        
        
        // DIGER
        // "http://www.suleyman.com/tokenKaydet?12345tyuji76"
        // request
    }

    func application(application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: NSError) {
        // Token alinamadi, bir hata var
        print("Token alinamadi, bir hata var: \(error)")
    }

}



