//
//  WebVC.swift
//  Ders9
//
//  Created by Suleyman Calik on 06/12/14.
//  Copyright (c) 2014 Wissen. All rights reserved.
//

import UIKit

class WebVC: UIViewController, UIWebViewDelegate {

    var urlString:String!
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if urlString != nil {
            var url = NSURL(string: urlString)
            var request = NSURLRequest(URL: url!)
            webView.loadRequest(request)
            
            webView.delegate = self
        }
    }


    // MARK: - Webview Methods
    
    //Webview icerigini basariyla yukledi
    func webViewDidFinishLoad(webView: UIWebView) {
        
        // Spinner durdurulup ekrandan kaldiriliyor
        spinner.stopAnimating()
    }
    
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError) {
        
        // Spinner durduruluyor ve onceki ekrana donuluyor
        spinner.stopAnimating()
        navigationController?.popViewControllerAnimated(true)
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
