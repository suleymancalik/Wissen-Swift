//
//  ViewController.swift
//  Ders22-2
//
//  Created by Suleyman Calik on 18/01/15.
//  Copyright (c) 2015 Wissen. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var timer:NSTimer!
    var imagePicker = UIImagePickerController()
    var images = [UIImage]()
    var opened = false
    
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        if !opened {
            opened = true
            presentViewController(imagePicker, animated:false, completion: nil)
            self.timer = NSTimer.scheduledTimerWithTimeInterval(3, target:self, selector:"tick", userInfo:nil, repeats:true)
        }

    }

    
    func tick() {
        if count++ < 10 {
            AudioServicesPlaySystemSound(UInt32(kSystemSoundID_Vibrate))
        }
        else {
            timer.invalidate()
            imagePicker.dismissViewControllerAnimated(true, completion: { () -> Void in
                
            })
        }
    }

    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            images.append(image)
        }
        
        imagePicker.takePicture()

    }
    
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        println("")
    }

}








