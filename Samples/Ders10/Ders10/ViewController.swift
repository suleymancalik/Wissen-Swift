//
//  ViewController.swift
//  Ders10
//
//  Created by Suleyman Calik on 07/12/14.
//  Copyright (c) 2014 Wissen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var txtUserId: UITextField!
    @IBOutlet weak var imgUserPhoto: UIImageView!
    @IBOutlet weak var lblFullName: UILabel!
    @IBOutlet weak var lblUsername: UILabel!
    @IBOutlet weak var lblGender: UILabel!
    @IBOutlet weak var btnFetchUser: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    func veriyiYorumla(data:NSData) {
        
        var gelen = NSString(data: data, encoding: NSUTF8StringEncoding)
        println(gelen!)
        
        
        var userInfo:Dictionary<String,String>! = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments, error: nil) as? Dictionary
        if userInfo != nil {
            var user = User()
            user.firstName = userInfo["first_name"]
            user.lastName = userInfo["last_name"]
            user.username = userInfo["username"]
            user.gender = userInfo["gender"]
            
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
    
    


    // MARK: - Action Methods
    
    @IBAction func actFetchUser(sender: AnyObject) {
        if !txtUserId.text.isEmpty {
            
            var urlString = "http://graph.facebook.com/" + txtUserId.text
            var url = NSURL(string: urlString)
            if let userUrl = url {
                
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






