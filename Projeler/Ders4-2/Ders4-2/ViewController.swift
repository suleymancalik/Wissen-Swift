//
//  ViewController.swift
//  Ders4-2
//
//  Created by Suleyman Calik on 9.11.2014.
//  Copyright (c) 2014 Wissen. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UIScrollViewDelegate {

    @IBOutlet weak var lblZoomScale: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var scrollView: UIScrollView!
    var manzaraView:UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var manzaraImage = UIImage(named:"manzara.jpg")
        manzaraView = UIImageView(image: manzaraImage)
        scrollView.addSubview(manzaraView!)
        scrollView.contentSize = manzaraImage!.size
        scrollView.delegate = self
        
        slider.addTarget(self, action:Selector("sliderValueChanged"), forControlEvents:UIControlEvents.ValueChanged)
        
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        var minScale = scrollView.bounds.width / scrollView.contentSize.width
        scrollView.minimumZoomScale = minScale
        scrollView.maximumZoomScale = 1.5
        
        scrollView.setZoomScale(minScale, animated:false)
        
        slider.minimumValue = Float(scrollView.minimumZoomScale)
        slider.maximumValue = Float(scrollView.maximumZoomScale)
     
        lblZoomScale.text = String(format: "%.2f",slider.value)
    }

    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {

        var minScale = size.width / manzaraView!.bounds.size.width
        scrollView.minimumZoomScale = minScale
        slider.minimumValue = Float(scrollView.minimumZoomScale)
        scrollView.setZoomScale(minScale, animated:false)
        slider.setValue(Float(minScale), animated: false)
        lblZoomScale.text = String(format: "%.2f",slider.value)
    }
    
    
    // MARK: - Slider Methods
    
    func sliderValueChanged() {
        scrollView.setZoomScale(CGFloat(slider.value), animated:false)
        lblZoomScale.text = String(format: "%.2f",slider.value)
    }
    
    // MARK: - ScrollView Methods
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return manzaraView
    }
    
    
    func scrollViewDidZoom(scrollView: UIScrollView) {
        slider.setValue(Float(scrollView.zoomScale), animated: false)
    }

    
    
}







