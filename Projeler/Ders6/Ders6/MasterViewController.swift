//
//  MasterViewController.swift
//  Ders6
//
//  Created by Suleyman Calik on 16.11.2014.
//  Copyright (c) 2014 Wissen. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController , UISearchBarDelegate {

    var objects = NSMutableArray()
    var filteredObjects = NSMutableArray()


    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.leftBarButtonItem = self.editButtonItem()

        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "insertNewObject:")
        self.navigationItem.rightBarButtonItem = addButton
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func insertNewObject(sender: AnyObject) {
        objects.insertObject(NSDate(), atIndex: 0)
        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
        //self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        
        filteredObjects = NSMutableArray(array: objects)
        tableView.reloadData()
    }

    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow() {
                let object = objects[indexPath.row] as NSDate
            (segue.destinationViewController as DetailViewController).detailItem = object
            }
        }
    }

    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredObjects.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell

        let object = filteredObjects[indexPath.row] as NSDate
        cell.textLabel.text = object.description
        return cell
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            objects.removeObjectAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }

    
    // MARK: - Searchbar Methods
    
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        println("searchText: \(searchText)")
        
        if searchText.isEmpty {
            filteredObjects = NSMutableArray(array: objects)
        }
        else {
            filteredObjects = NSMutableArray()
            for anObject in objects {
                var date = anObject as NSDate
                var description = date.description
                var components = description.componentsSeparatedByString(searchText)
                if components.count > 1 {
                    filteredObjects.addObject(date)
                }
            }
        }
        tableView.reloadData()
    }
    

    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        println("searchBarCancelButtonClicked")
        // Searchbar'i inaktif hale getirip, klavyeyi kapatiyoruz

        filteredObjects = objects.mutableCopy() as NSMutableArray
        tableView.reloadData()
        searchBar.text = ""
        searchBar.resignFirstResponder()
    }
    

}





