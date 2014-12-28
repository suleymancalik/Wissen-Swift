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
            
            // Uygulama push notification ile açılmış ise,
            // gelen push bilgileri launchOptions içindedir
            if let userInfo = launchOptions {
                if let pushData: AnyObject = userInfo[UIApplicationLaunchOptionsRemoteNotificationKey] {
                    handlePushNoti(pushData as [NSObject: AnyObject])
                }
            }
            else {
                var alertView = UIAlertView(title: "Push Gelmedi", message:"" , delegate: nil, cancelButtonTitle: "Tamam")
                alertView.show()
            }
            
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

    
    func handlePushNoti(userInfo: [NSObject : AnyObject]) {
        // Push notification verisi
        // { "aps" : { "alert" : "Message received from Bob" } }
        // seklinde oldugu icin alert'e erismek icin dictionary'yi kontrol ediyoruz

        if let pushData:AnyObject =  userInfo["aps"] {
            if let alert:AnyObject = pushData["alert"] {
                var alertView = UIAlertView(title: "Push Geldi", message: alert as? String, delegate: nil, cancelButtonTitle: "Tamam")
                alertView.show()
                
                UIApplication.sharedApplication().applicationIconBadgeNumber = 0
                
            }
            else {
                var alertView = UIAlertView(title: "Alert YOK", message:"" , delegate: nil, cancelButtonTitle: "Tamam")
                alertView.show()
            }
        }
        else {
            var alertView = UIAlertView(title: "APS YOK", message:"\(userInfo)" , delegate: nil, cancelButtonTitle: "Tamam")
            alertView.show()
        }
    }
    
    // Uygulama açıkken push noti gelirse burası çağrılır
    func application(application: UIApplication, didReceiveRemoteNotification userInfo: [NSObject : AnyObject]) {
        
        handlePushNoti(userInfo)
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
    
    
    func application(application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: NSError) {
        println(error)
    }
    

}





