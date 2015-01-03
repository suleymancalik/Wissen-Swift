//
//  ViewController.swift
//  Ders17
//
//  Created by Suleyman Calik on 03/01/15.
//  Copyright (c) 2015 Wissen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


        slidingViewController().topViewAnchoredGesture = ECSlidingViewControllerAnchoredGesture.Tapping | ECSlidingViewControllerAnchoredGesture.Panning;
        view.addGestureRecognizer(self.slidingViewController().panGesture)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        //        slidingViewController().anchorTopViewToRightAnimated(true)
        //        self.slidingViewController().anchorLeftPeekAmount = 60
        //        self.slidingViewController().anchorRightPeekAmount = 60
    }


}

