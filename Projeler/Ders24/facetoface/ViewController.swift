//
//  ViewController.swift
//  facetoface
//
//  Created by Kadir Erbakar on 24.01.2015.
//  Copyright (c) 2015 Kadir Erbakar. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UIImagePickerControllerDelegate , UINavigationControllerDelegate  {
    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var txtUser: UITextField!
    @IBOutlet weak var txtUserLastName: UITextField!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnLogin(sender: UIButton) {
        
        
    }
    
    func openImagePicker (sourceType:UIImagePickerControllerSourceType) {
        var picker = UIImagePickerController ()
        // .PhotoLibrary buraya camera yazarak iphone'nın kamerasını açabiliyoruz ama bunu sadece telefondan test edebiliyoruz
        picker.sourceType = sourceType
        picker.delegate = self
        presentViewController(picker, animated: true, completion: nil)
        
    }
    
    @IBAction func btnAddPhoto(sender: UIButton) {
        
        if UIImagePickerController.isCameraDeviceAvailable(UIImagePickerControllerCameraDevice.Rear) ||
            UIImagePickerController.isCameraDeviceAvailable(UIImagePickerControllerCameraDevice.Front) {
                
                var alert = UIAlertController(title: "Fotoğraf Ekle", message: "Kaynak Seçiniz", preferredStyle: UIAlertControllerStyle.ActionSheet)
                var action1 = UIAlertAction(title: "Kamera", style: UIAlertActionStyle.Default, handler: { (action) -> Void in
                    self.openImagePicker(.Camera)
                })
                var action2 = UIAlertAction(title: "Fotograf Albumu", style: UIAlertActionStyle.Default, handler: { (action) -> Void in
                    self.openImagePicker(.PhotoLibrary)
                })
                var cancelAction = UIAlertAction(title: "Vazgeç", style: UIAlertActionStyle.Cancel, handler:nil)
                
                alert.addAction(action1)
                alert.addAction(action2)
                alert.addAction(cancelAction)
                
                presentViewController(alert, animated: true, completion: nil)
        }
            
        else {
            openImagePicker(UIImagePickerControllerSourceType.PhotoLibrary)
        }
  
    }
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        println("vazgeçti")
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        println("resim seçti")
        if let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            imgUser.image = selectedImage
            // kamerayı açtıktan sonra resimleri kaydetmek için kullanıyoruz
            UIImageWriteToSavedPhotosAlbum(selectedImage, self , "image:didFinishSavingWithError:contextInfo:", nil)
            
            picker.dismissViewControllerAnimated(true , completion: nil)
        }
    }
    
    func image(image: UIImage, didFinishSavingWithError error: NSErrorPointer, contextInfo: UnsafePointer<()>){
        println("Kaydedildi: \(contextInfo)")
    }

}

