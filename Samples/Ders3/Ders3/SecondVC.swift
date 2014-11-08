//
//  SecondVC.swift
//  Ders3
//
//  Created by Suleyman Calik on 8.11.2014.
//  Copyright (c) 2014 Wissen. All rights reserved.
//

import UIKit

class SecondVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Ikinci Ekran"
        self.navigationController?.navigationBar.topItem?.title = "Geri"
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
