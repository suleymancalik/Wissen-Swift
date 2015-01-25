//
//  LocalVC.swift
//  facetoface
//
//  Created by Suleyman Calik on 25/01/15.
//  Copyright (c) 2015 Kadir Erbakar. All rights reserved.
//

import UIKit
import Parse

class LocalVC: GAITrackedViewController {
    
    
    @IBOutlet weak var lblInfo: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        refresh()
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        screenName = "LocalVC"
    }
    
    func refresh() {
        var query = PFQuery(className: "Para")
        query.fromLocalDatastore()
        query.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
            if let paralar = objects as? [PFObject] {
                self.lblInfo.text = "\(paralar.count) adet para var"
            }
            else {
                println("Para bulunamadi! \(error.description)")
            }
        }
    }
    
    func sendPush() {
        
        
//        var query = PFUser.query()
//        query.whereKey("objectId", equalTo: "12s3uyfgfu3")
//        query.whereKey("age", greaterThan: 20)
        
        PFPush.sendPushMessageToQueryInBackground(nil, withMessage: "Mallar Teslim Edildi") { (isSent, error) -> Void in
            if isSent {
                println("PUSH gonderildi")
            }
            else {
                println("PUSH gonderilemedi! \(error.description)")
            }
        }
        
    }
    
    
    //MARK: - Action Methods

    @IBAction func btnAddAction(sender: UIButton) {
        
        var para =  PFObject(className: "Para")
        para["miktar"] = Int(rand() % 1000)
        para.pinInBackgroundWithBlock { (pinned, error) -> Void in
            if pinned {
                self.refresh()
            }
            else {
                println("Para kaydedilemedi! \(error.description)")
            }
        }
        
    }

    @IBAction func btnSendAction(sender: UIButton) {
        
        var query = PFQuery(className: "Para")
        query.fromLocalDatastore()
        query.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
            if let paralar = objects as? [PFObject] {
                
                PFObject.saveAllInBackground(paralar, block: { (saved, error) -> Void in
                    if saved {
                        PFObject.unpinAllInBackground(paralar, block: { (unpinned, error) -> Void in
                            if unpinned {
                                self.refresh()
                                self.sendPush()
                            }
                            else {
                                println("Paralar lokalden silinemedi! \(error.description)")
                            }
                        })
                    }
                    else {
                        println("Paralar kaydedilemedi! \(error.description)")
                    }
                })
                
            }
            else {
                println("Para bulunamadi! \(error.description)")
            }
        }

    }

    @IBAction func btnRefreshAction(sender: UIButton) {
        refresh()
    }
}









