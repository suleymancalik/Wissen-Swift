//
//  ViewController.swift
//  Ders10
//
//  Created by Suleyman Calik on 07/12/14.
//  Copyright (c) 2014 Wissen. All rights reserved.
//

import UIKit
import Realm

class ViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var txtUserId: UITextField!
    @IBOutlet weak var imgUserPhoto: UIImageView!
    @IBOutlet weak var lblFullName: UILabel!
    @IBOutlet weak var lblUsername: UILabel!
    @IBOutlet weak var lblGender: UILabel!
    @IBOutlet weak var btnFetchUser: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        txtUserId.delegate = self

        // "userId" anahtar kelimesinin karsisinda deger varsa aliyoruz
        var userId:String? = NSUserDefaults.standardUserDefaults().objectForKey("userId") as? String
        if userId != nil {
            txtUserId.text = userId
            actFetchUser(self)
        }
    }
    
    
    func veriyiYorumla(data:NSData) {
        
        var gelen = NSString(data: data, encoding: NSUTF8StringEncoding)
        println(gelen!)
        
        
        var userInfo:Dictionary<String,String>! = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments, error: nil) as? Dictionary
        if userInfo != nil {
            var user = User()
            if let firstName = userInfo["first_name"] {
                user.firstName = firstName
            }
            if let lastName = userInfo["last_name"] {
                user.lastName = lastName
            }
            if let username = userInfo["username"] {
                user.username = username
            }
            if let gender = userInfo["gender"] {
                user.gender = gender
            }
            if let userId = userInfo["id"] {
                user.userId = userId
            }
            
            // Olusturdugumuz User'i 
            // veritabanina ekliyoruz
            var realm = RLMRealm.defaultRealm()
            realm.beginWriteTransaction()
            realm.addOrUpdateObject(user)
            realm.commitWriteTransaction()
            
            refreshUI(user)
            
            SVProgressHUD.dismiss()
        }
        else {
            imgUserPhoto.image = nil
            lblUsername.text = ""
            lblFullName.text = ""
            lblGender.text = ""
            
            SVProgressHUD.showErrorWithStatus("Kullanici Bulunamadi")
        }
    }
    
    
    func refreshUI(user:User) {
        
        lblFullName.text = user.fullName()
        lblUsername.text = user.username
        lblGender.text = user.gender
        
        downloadProfilePicture(user)
    }
    
    
    func downloadProfilePicture(user:User) {
        var urlString = "http://graph.facebook.com/" + txtUserId.text + "/picture"
        var url = NSURL(string: urlString)
        if let pictureUrl = url {
            var request = NSURLRequest(URL: pictureUrl)
            NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: { (response:NSURLResponse!, data:NSData!, error:NSError!) -> Void in
                if error == nil {
                    
                    if let image = UIImage(data: data) {
                        self.imgUserPhoto.image = image
                    }
                    else {
                        SVProgressHUD.showErrorWithStatus("Resim Olusmadi")
                    }
                }
                else {
                    SVProgressHUD.showErrorWithStatus("Resim Indirilemedi")
                }
            })
        }
    }
    
    
    // MARK: - Textfield Methods
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    


    // MARK: - Action Methods
    
    @IBAction func backgroundTapped(sender: AnyObject) {
        
        txtUserId.resignFirstResponder()
    }
    
    @IBAction func actFetchUser(sender: AnyObject) {
        if !txtUserId.text.isEmpty {
            
            var urlString = "http://graph.facebook.com/" + txtUserId.text
            var url = NSURL(string: urlString)
            if let userUrl = url {
                
                // girilen id'yi "userId" anahtar kelimesi ile kaydediyoruz
                var userDefaults = NSUserDefaults.standardUserDefaults()
                userDefaults.setObject(txtUserId.text, forKey: "userId")
                userDefaults.synchronize()
                
                SVProgressHUD.show()
                
                var request = NSURLRequest(URL: userUrl)
                NSURLConnection.sendAsynchronousRequest(
                    request,
                    queue:NSOperationQueue.mainQueue(),
                    completionHandler:
                    { (response:NSURLResponse!, data:NSData!, error:NSError!) -> Void in

                        if error == nil {
                            self.veriyiYorumla(data)
                        }
                        else {
                            println("HATA oldu: \(error)")
                        }
                    }
                )
            }
        }
    }


}






