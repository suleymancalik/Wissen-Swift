//
//  ViewController.swift
//  Ders22
//
//  Created by Suleyman Calik on 18/01/15.
//  Copyright (c) 2015 Wissen. All rights reserved.
//

import UIKit

class ViewController:UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView:UITableView!
    
    var numbers = [Dictionary<String,String>]()
    var currentPage = 1
    var allDataFetched = false
    var fetchingData = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getNextNumbers()
    }
    
    
    func getNextNumbers() {
        
        if allDataFetched || fetchingData {
            return
        }
        
        var urlString = "http://cop4425.parseapp.com/\(currentPage).json"
        if let url = NSURL(string: urlString) {
            
            var request = NSURLRequest(URL: url)
            
            fetchingData = true
            NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: { (response, data, error) -> Void in
                
                if error == nil {
                    // BASARILI
                    var errorObj:NSError?
                    var numbersArray = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments, error:&errorObj) as? [Dictionary<String,String>]
                    
                    if numbersArray != nil {
                        // OBJELER basarili sekilde olustu
                        
                        if numbersArray!.count < 10 {
                            // verilerin sonuna geldi
                            self.allDataFetched = true
                        }
                        else {
                            // sunucuda hala veri var
                            self.currentPage++
                        }
                        
                        // Gelen icerikleri self.numbers'a ekliyoruz
                        for number in numbersArray! {
                            self.numbers.append(number)
                        }
                        
                        // Tabloyu refresh ediyoruz
                        self.tableView.reloadData()
                        self.fetchingData = false
                        
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
        return allDataFetched ? numbers.count : (numbers.count + 1)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // indexPath.row numbers dizisininden buyukse WaitingCell koyuyoruz
        if indexPath.row >= numbers.count {
            var cell = tableView.dequeueReusableCellWithIdentifier("WaitingCell") as UITableViewCell
            return cell
        }
        else {
            var cell = tableView.dequeueReusableCellWithIdentifier("DataCell") as UITableViewCell
            
            var dict = numbers[indexPath.row]
            
            var title = dict["title"]
            var description = dict["description"]
            
            cell.textLabel?.text = title
            cell.detailTextLabel?.text = description
            
            return cell
        }
    }
    
    
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if indexPath.row == numbers.count - 3 {
            getNextNumbers()
        }
        
        if cell.reuseIdentifier == "WaitingCell" {
            if let spinner = cell.contentView.viewWithTag(10) as? UIActivityIndicatorView {
                spinner.startAnimating()
            }
        }
    }
}














