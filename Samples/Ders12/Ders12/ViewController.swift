//
//  ViewController.swift
//  Ders12
//
//  Created by Suleyman Calik on 20/12/14.
//  Copyright (c) 2014 Wissen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    //MARK: - Action Methods
    
    @IBAction func actionAddImage(sender: UIBarButtonItem) {
        
        var picker = UIImagePickerController()
        picker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        picker.delegate = self
        self.presentViewController(picker, animated: true, completion: nil)
        
    }
    
    
    //MARK: - Image Delegate Methods
    
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        println("VAZGECE BASTI !!!")
        picker.dismissViewControllerAnimated(true, completion: { () -> Void in
            println("VAZGECTI !!!")
        })
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        println("RESIM SECTI !!!")
    }
    
}




