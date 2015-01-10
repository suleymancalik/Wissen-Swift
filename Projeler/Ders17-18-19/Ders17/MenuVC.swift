//
//  MenuVC.swift
//  Ders17
//
//  Created by Suleyman Calik on 03/01/15.
//  Copyright (c) 2015 Wissen. All rights reserved.
//

import UIKit

class MenuVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var userDefaults = NSUserDefaults(suiteName:"group.wissen.ExtensionSharingDefaults")!

    @IBOutlet weak var lblSelectedCity: UILabel!
    @IBOutlet weak var tblCities: UITableView!
    
    var cities:Array<String>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cities = [
            "Adana",
            "Adıyaman",
            "Afyonkarahisar",
            "Ağrı",
            "Amasya",
            "Ankara",
            "İstanbul",
            "BALIKESİR",
            "İzmir"]
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if let city:String = userDefaults.valueForKey(keyCity) as? String {
            lblSelectedCity.text = city
        }
        else {
            lblSelectedCity.text = ""
        }
    }
    
    
    //MARK: - TableView Methods
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("CityCell") as UITableViewCell
        
        cell.textLabel?.text = cities[indexPath.row]
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var cityName = cities[indexPath.row]
        lblSelectedCity.text = cityName
        
        userDefaults.setValue(cityName, forKey: keyCity)
        userDefaults.synchronize()
        
        slidingViewController().resetTopViewAnimated(true)
        
        var mainVC = slidingViewController().topViewController as ViewController
        mainVC.refreshWeather()
    }
    
    
}






