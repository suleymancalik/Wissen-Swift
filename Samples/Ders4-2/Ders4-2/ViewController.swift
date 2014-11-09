//
//  ViewController.swift
//  Ders4-2
//
//  Created by Suleyman Calik on 9.11.2014.
//  Copyright (c) 2014 Wissen. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    var manzaraView:UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var manzaraImage = UIImage(named:"manzara.jpg")
        manzaraView = UIImageView(image: manzaraImage)
        scrollView.addSubview(manzaraView!)
        
        scrollView.contentSize = manzaraImage!.size

        scrollView.delegate = self
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        var minScale = scrollView.bounds.width / scrollView.contentSize.width
        scrollView.minimumZoomScale = minScale
        scrollView.maximumZoomScale = 1.5
        
        scrollView.setZoomScale(minScale, animated: true)
    }
    
    // MARK: - ScrollView Methods
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return manzaraView
    }

}







