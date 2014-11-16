//
//  ViewController.swift
//  Ders5
//
//  Created by Suleyman Calik on 15.11.2014.
//  Copyright (c) 2014 Wissen. All rights reserved.
//

import UIKit

// UItableViewDataSource : TableView'in icerigini vermek icin kullanilir
// UITableViewDelegate   : TableView'in height ve didSelect'ini almaya yarar
// UIAlertViewDelegate   : Alertview'de basilan butonu ogrenmemizi saglar

class ViewController: UIViewController , UITableViewDataSource , UITableViewDelegate , UIAlertViewDelegate , KatilimciDelegate {

    @IBOutlet weak var tableView: UITableView!
    var katilimcilar:Array<String> = [String]()
    var silinecekIndex:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
        katilimcilar.append("Suleyman")
        katilimcilar.append("Ahmet")
        katilimcilar.append("Mehmet")
        katilimcilar.append("Ali")
        katilimcilar.append("Veli")
        katilimcilar.append("Murat")
        katilimcilar.append("Hasan")
    }


    
    // MARK: - TableView Methods
    
    //UITableViewDataSource'da tanimli zorunlu func
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    //UITableViewDataSource'da tanimli zorunlu func
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return katilimcilar.count
    }
    

    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {

        return 50
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // Gelen row degerine gore ilgili katilimcinin adini bul
        var index = indexPath.row
        var katilimciIsmi = katilimcilar[index]
        
        
        var cell = tableView.dequeueReusableCellWithIdentifier("CustomKatilimciCell") as KatilimciCell
        cell.lblTitle.text = katilimciIsmi
        cell.delegate = self
        return cell
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var katilimciAdi = katilimcilar[indexPath.row]
        
        var alert = UIAlertView(title: "Silinecek Kisi", message: katilimciAdi, delegate:self, cancelButtonTitle: "Vazgec", otherButtonTitles: "Sil")
        alert.show()
        
        // secilen satirin index'ini sakliyoruz
        silinecekIndex = indexPath.row
    }
    
    
    // MARK: - Alertview Methods
    
    
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        if buttonIndex == 0 {
            // Vazgec butonuna basilmis
            
            // deselectRowAtIndexPath methodu indexPath bekledigi icin
            // indexPath olusturuyoruz
            var indexPath = NSIndexPath(forRow:silinecekIndex, inSection:0)
            tableView.deselectRowAtIndexPath(indexPath, animated:true)
        }
        else {
            // Sil butonuna basilmis
            // secilen kisiyi silecegiz
            katilimcilar.removeAtIndex(silinecekIndex)
            tableView.reloadData()

        }
    }
    
    
    
    // MARK: - KatilimciDelegate Methods
    
    
    func katilimciDurumuDegisti(index: Int, yeniDurum: Bool) {
        println("katilimciDurumuDegisti")
        //
    } 
    
}










