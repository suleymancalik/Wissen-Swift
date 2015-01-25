//
//  AppDelegate.swift
//  facetoface
//
//  Created by Kadir Erbakar on 24.01.2015.
//  Copyright (c) 2015 Kadir Erbakar. All rights reserved.
//

import UIKit
import Parse

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        
        Parse.enableLocalDatastore()
        Parse.setApplicationId("UCVLMahElBOXVkICZsbdJ5kM576DOIk6CdD5cha3", clientKey: "qKamq0NYgb10n3KHERdlK1XrvZi90WSLeGZgj7ad")
        
        
        ///////////////////////////////////////////////////
        // PUSH icin ADIM 1
        var settings = UIUserNotificationSettings(forTypes:
            UIUserNotificationType.Alert |
            UIUserNotificationType.Badge |
            UIUserNotificationType.Sound
            , categories:nil)
        println("Push Ayarlarina kaydoluyoruz")
        application.registerUserNotificationSettings(settings)
        ///////////////////////////////////////////////////////
        
        return true
    }
    
    
    ///////////////////////////////////////////////////////
    // PUSH icin ADIM 2
    func application(application: UIApplication, didRegisterUserNotificationSettings notificationSettings: UIUserNotificationSettings) {
        println("Push Tokeni alma istegi baslatiyoruz")
        application.registerForRemoteNotifications()
    }
    ///////////////////////////////////////////////////////
    
    
    
    ///////////////////////////////////////////////////////
    // PUSH icin ADIM 3
    func application(application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
        // Token'i sunucya gonder, kaydetsin
        
        
        PFInstallation.currentInstallation().setDeviceTokenFromData(deviceToken)
        PFInstallation.currentInstallation().saveInBackgroundWithBlock { (saved, error) -> Void in
            if saved {
                println("Token sunucuya gonderildi")
            }
            else {
                println("Token sunucuya gonderilemedi! \(error.description)")
            }
        }
    }
    ///////////////////////////////////////////////////////


    
    ///////////////////////////////////////////////////////
    // PUSH icin HATA ADIMI
    func application(application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: NSError) {
        println("Push islemlerinde bir hata aldik! \(error.description)")
    }
    ///////////////////////////////////////////////////////
    
    
}






