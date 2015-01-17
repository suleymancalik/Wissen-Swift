//
//  ViewController.swift
//  Ders21
//
//  Created by Suleyman Calik on 17/01/15.
//  Copyright (c) 2015 Wissen. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var count = 0
    var userDefaults = NSUserDefaults.standardUserDefaults()
    let keySayac = "sayac"
    
    @IBOutlet weak var lblCount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        count = userDefaults.integerForKey(keySayac)
        lblCount.text = "\(count)"
        
    }
    
    
    
    //MARK: - Utility Methods
    
    func changeCount(newCount:Int) {
        count = newCount
        userDefaults.setInteger(count, forKey: keySayac)
        userDefaults.synchronize()
        lblCount.text = "\(count)"
    }
    
    func incrementCount() {
        changeCount(count + 1)
    }

    
    func handleShake() {

        changeCount(0)
        
        // Bunlari kullanabilmek icin yukarida AVFoundation'i import ediyoruz
        // Bu satir telefonu titretiyor
        AudioServicesPlaySystemSound(UInt32(kSystemSoundID_Vibrate))
        
        //Bu satir 1322 kodlu sistem sesini caliyor
        // 1000'dden itibaren degisik sesler denenebilir
        AudioServicesPlaySystemSound(1322)
        
        
        animateScreen()
    }
    
    
    func animateScreen() {
        
        var animLbl = CABasicAnimation(keyPath:"transform")
        animLbl.duration = 0.2
        var scale = CATransform3DMakeScale(10, 2, 1)
        animLbl.toValue = NSValue(CATransform3D:scale)
        animLbl.autoreverses = true
        lblCount.layer.addAnimation(animLbl, forKey: nil)
        
        
        var animAlpha = CABasicAnimation(keyPath: "opacity")
        animAlpha.duration = 0.2
        animAlpha.toValue = 0
        animAlpha.autoreverses = true
        lblCount.layer.addAnimation(animAlpha, forKey: nil)
    }
    
    
    //MARK: - Action Methods
    
    // Sallama hareketini yakalamak icin yaziyoruz
    override func canBecomeFirstResponder() -> Bool {
        return true
    }
    
    // Bir hareket sonlandiginda burasi calisiyor
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent) {
        
        // Arguman olarak gelen hareket "Sallama" mi diye kontrol ediyoruz
        if motion == UIEventSubtype.MotionShake {
            handleShake()
        }
    }


    @IBAction func btnCountTapped(sender: UIButton) {
        incrementCount()
    }

}






