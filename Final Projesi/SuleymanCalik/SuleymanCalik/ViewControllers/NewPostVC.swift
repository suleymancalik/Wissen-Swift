//
//  NewPostVC.swift
//  SuleymanCalik
//
//  Created by Suleyman Calik on 21/12/14.
//  Copyright (c) 2014 Wissen. All rights reserved.
//

import UIKit
import Parse

class NewPostVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var btnSharePhoto: UIButton!
    @IBOutlet weak var txtDescription: UITextField!
    @IBOutlet weak var imgPhoto: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    // MARK: - Utility Methods
    
    func openImagePicker(sourceType:UIImagePickerControllerSourceType) {
        var picker = UIImagePickerController()
        picker.sourceType = sourceType
        picker.delegate = self
        self.presentViewController(picker, animated: true, completion: nil)
    }


    
    // MARK: - Action Methods
    
    @IBAction func shareButtonTapped(sender: UIButton) {
        
        PFGeoPoint.geoPointForCurrentLocationInBackground { (geopoint:PFGeoPoint!, error:NSError!) -> Void in
            
            var imgData:NSData = UIImageJPEGRepresentation(self.imgPhoto.image, 0.2)
            
            var file = PFFile(name: "image.jpg", data: imgData)
            file.saveInBackgroundWithBlock({ (completed:Bool, error:NSError!) -> Void in
                if completed {
                    var newPost = PFObject(className:classPost)
                    newPost["location"] = geopoint
                    newPost["photo"] = file
                    newPost["user"] = PFUser.currentUser()
                    newPost["description"] = self.txtDescription.text
                    newPost.saveInBackgroundWithBlock({ (saved:Bool, error:NSError!) -> Void in
                        if saved {
                            self.btnSharePhoto.enabled = false
                            self.imgPhoto.image = nil
                            self.txtDescription.text = ""
                            
                            self.tabBarController?.selectedIndex = 0
                            
                            var user = PFUser.currentUser()
                            if let postsRelation = user.relationForKey("posts") {
                                postsRelation.addObject(newPost)
                                user.saveEventually()
                            }
                        }
                        else {
                            println("paylasim yapilamadi! \(error)")
                        }
                    })
                }
                else {
                    println("dosya yuklenemedi! \(error)")
                }
                
            })
        }
        
        
//
    }
    
    
    @IBAction func addPhotoTapped(sender: UIButton) {
        
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

    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        println("VAZGECE BASTI !!!")
        picker.dismissViewControllerAnimated(true, completion: { () -> Void in
            println("VAZGECTI !!!")
        })
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        println("RESIM SECTI !!!")
        if let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {

            imgPhoto.image = selectedImage
            btnSharePhoto.enabled = true
            
// UIImageWriteToSavedPhotosAlbum(selectedImage, self, "image:didFinishSavingWithError:contextInfo:", nil)
            
            picker.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    func image(image: UIImage, didFinishSavingWithError error: NSErrorPointer, contextInfo: UnsafePointer<()>) {
        println("RESIM KAYDEDILDI: \(contextInfo)")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
