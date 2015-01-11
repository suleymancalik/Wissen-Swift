//
//  ViewController.swift
//  Ders20
//
//  Created by Suleyman Calik on 11/01/15.
//  Copyright (c) 2015 Wissen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate , UINavigationControllerDelegate {

    @IBOutlet weak var imgPhoto: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func selectPhoto(sender: AnyObject) {
        var picker = UIImagePickerController()
        picker.delegate = self
        var popover = UIPopoverController(contentViewController: picker)
        popover.presentPopoverFromRect(sender.frame, inView:view, permittedArrowDirections:UIPopoverArrowDirection.Any, animated:true)
    }
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        
        if let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imgPhoto.image = selectedImage
            picker.dismissViewControllerAnimated(true, completion: nil)
        }
    }
}












