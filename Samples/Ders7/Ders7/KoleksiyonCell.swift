//
//  KoleksiyonCell.swift
//  Ders7
//
//  Created by Suleyman Calik on 22.11.2014.
//  Copyright (c) 2014 Wissen. All rights reserved.
//

import UIKit

class KoleksiyonCell: UICollectionViewCell {
    
    @IBOutlet var picture:UIImageView!
    
    
    override func awakeFromNib() {

        // saga dogru swipe yapildiginda algilamak icin UISwipeGestureRecognizer
        // olusturup view'e ekliyoruz
        var swipeRight = UISwipeGestureRecognizer(target: self, action: Selector("swipeRight"))
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        addGestureRecognizer(swipeRight)
        
        
        // sola dogru swipe yapildiginda algilamak icin UISwipeGestureRecognizer
        // olusturup view'e ekliyoruz
        var swipeLeft = UISwipeGestureRecognizer(target: self, action: Selector("swipeLeft"))
        swipeLeft.direction = .Left
        addGestureRecognizer(swipeLeft)
    }
    
    
    func swipeRight() {
        if picture.alpha < 1.0 {
            picture.alpha += 0.1
        }
    }
    
    
    func swipeLeft() {
        if picture.alpha > 0.1 {
            picture.alpha -= 0.1
        }
    }

    
    // MARK: Touch Methods
    
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        
        var touch = touches.anyObject() as UITouch
        var point = touch.locationInView(self)
        
        println("DOKUNDU: \(point)")
        
    }
    
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        var touch = touches.anyObject() as UITouch
        var point = touch.locationInView(self)

        println("HAREKET ETTIRDI: \(point)")
    }
    

    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        println("BITTI")
    }
    
    override func touchesCancelled(touches: NSSet!, withEvent event: UIEvent!) {
        println("CANCELLED")
    }
    
}





