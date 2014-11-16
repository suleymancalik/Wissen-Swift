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
    
    var katilimcilar:Array<Katilimci> = [Katilimci]()
    var silinecekIndex:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
        
        katilimcilar.append(Katilimci(name:"Suleyman", durum:true  ))
        katilimcilar.append(Katilimci(name:"Ahmet"   , durum:true  ))
        katilimcilar.append(Katilimci(name:"Mehmet"  , durum:false ))
        katilimcilar.append(Katilimci(name:"Ali"     , durum:false ))
        katilimcilar.append(Katilimci(name:"Veli"    , durum:true  ))
        katilimcilar.append(Katilimci(name:"Murat"   , durum:true  ))
        katilimcilar.append(Katilimci(name:"Hasan"   , durum:false ))
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
        var katilimci = katilimcilar[index]
        
        var cell = tableView.dequeueReusableCellWithIdentifier("CustomKatilimciCell") as KatilimciCell
        cell.lblTitle.text = katilimci.name
        cell.durumSwitch.on = katilimci.durum
        cell.delegate = self
        cell.currentIndex = index
        return cell
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    
    // MARK: Delete Methods
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {

        if editingStyle == .Delete {
            
            var katilimci = katilimcilar[indexPath.row]
            
            var alert = UIAlertView(title: "Silinecek Kisi", message:katilimci.name, delegate:self, cancelButtonTitle: "Vazgec", otherButtonTitles: "Sil")
            alert.show()
            
            // secilen satirin index'ini sakliyoruz
            silinecekIndex = indexPath.row
        }
    }
    

    // MARK: - Alertview Methods
    
    
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        if buttonIndex == 0 {
            // Vazgec butonuna basilmis
            
            tableView.reloadData()
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










