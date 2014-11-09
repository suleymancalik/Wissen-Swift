//
//  ViewController.swift
//  Ders4
//
//  Created by Suleyman Calik on 9.11.2014.
//  Copyright (c) 2014 Wissen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addBlueView()
    }


    func addBlueView() {
        
        var yellowRect = CGRect(x: 60, y: 60, width: 100, height: 100)
        var yellowView = UIView(frame: yellowRect)
        yellowView.backgroundColor = UIColor.yellowColor()

        
        var blueRect = CGRect(x:50, y:50, width:100, height:100)
        var blueView = UIView(frame: blueRect)
        blueView.backgroundColor = UIColor.blueColor()
        blueView.clipsToBounds = true
        self.view.addSubview(blueView)
        
        blueView.frame.size = CGSize(width: 200, height: 200)
        blueView.layer.cornerRadius = blueView.bounds.width / 2
        
        var redRect = CGRect(x: 10, y: 10, width: 100, height: 100)
        var redView = UIView(frame: redRect)
        redView.backgroundColor = UIColor.redColor()
        blueView.addSubview(redView)

        
        self.view.addSubview(yellowView)
        
        
        UIView.animateWithDuration(2, animations: { () -> Void in
            
            redView.frame = blueView.frame
            
        }) { (completed) -> Void in
            redView.backgroundColor = UIColor.purpleColor()
        }
        
    }


}









