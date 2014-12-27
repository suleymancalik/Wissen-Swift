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
    
    
    func openImagePicker(sourceType:UIImagePickerControllerSourceType) {
        var picker = UIImagePickerController()
        picker.sourceType = sourceType
        picker.delegate = self
        self.presentViewController(picker, animated: true, completion: nil)
    }

    
    //MARK: - Action Methods
    
    @IBAction func actionAddImage(sender: UIBarButtonItem) {
        
        if UIImagePickerController.isCameraDeviceAvailable(UIImagePickerControllerCameraDevice.Rear) ||
        UIImagePickerController.isCameraDeviceAvailable(UIImagePickerControllerCameraDevice.Front) {
            // Cihazda on yada arka kamera var mi diye bakiyoruz.
            
            var alert = UIAlertController(title: "Fotoğraf Ekle", message: "Kaynak Seciniz", preferredStyle: UIAlertControllerStyle.ActionSheet)
            
            
            var action1 = UIAlertAction(title: "Kamera", style: UIAlertActionStyle.Default, handler: { (action) -> Void in
                self.openImagePicker(.Camera)
            })
            var action2 = UIAlertAction(title: "Fotograf Albumu", style: UIAlertActionStyle.Default, handler: { (action) -> Void in
                self.openImagePicker(.PhotoLibrary)
            })
            var cancelAction = UIAlertAction(title: "Vazgec", style: UIAlertActionStyle.Cancel, handler: nil)
            
            
            alert.addAction(action1)
            alert.addAction(action2)
            alert.addAction(cancelAction)
            
            presentViewController(alert, animated: true, completion: nil)
        }
        else {
            // Simulatorde burasi calisir
            openImagePicker(UIImagePickerControllerSourceType.PhotoLibrary)
        }
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
        if let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageView.image = selectedImage

            UIImageWriteToSavedPhotosAlbum(selectedImage, self, "image:didFinishSavingWithError:contextInfo:", nil)
            
            picker.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    func image(image: UIImage, didFinishSavingWithError error: NSErrorPointer, contextInfo: UnsafePointer<()>) {
        println("RESIM KAYDEDILDI: \(contextInfo)")
    }
    
}




