//
//  ViewController.swift
//  Ders22
//
//  Created by Suleyman Calik on 18/01/15.
//  Copyright (c) 2015 Wissen. All rights reserved.
//

import UIKit

class ViewController:UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView:UITableView!
    
    var numbers = [Dictionary<String,String>]()
    var currentPage = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getNextNumbers()
    }
    
    
    func getNextNumbers() {
        
        var urlString = "http://cop4425.parseapp.com/\(currentPage).json"
        if let url = NSURL(string: urlString) {
            
            var request = NSURLRequest(URL: url)
            
            NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: { (response, data, error) -> Void in
                
                if error == nil {
                    // BASARILI
                    var errorObj:NSError?
                    var numbersArray = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments, error:&errorObj) as? [Dictionary<String,String>]
                    
                    if numbersArray != nil {
                        // OBJELER basarili sekilde olustu
                        
                        if numbersArray!.count < 10 {
                            // verilerin sonuna geldi
                            // TODO
                        }
                        else {
                            // sunucuda hala veri var
                            // TODO
                        }
                        
                        
                        for number in numbersArray! {
                            self.numbers.append(number)
                        }
                        
                        self.tableView.reloadData()
                        
                    }
                    else {
                        // Objeler olusturulamadi
                        println("JSON parse edilemedi \(errorObj?.description)")
                    }
                }
                else {
                // BASARISIZ
                    println("Webservis Hatasi: \(error.description)")
                }
                
            })
            
        }
        else {
            println("HATA: URL olusturulamadi!")
        }
        
    }
    
    
    //MARK: - TableView Methods
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numbers.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("DataCell") as UITableViewCell
        
        var dict = numbers[indexPath.row]
        
        var title = dict["title"]
        var description = dict["description"]
        
        cell.textLabel?.text = title
        cell.detailTextLabel?.text = description
        
        return cell
    }
}










