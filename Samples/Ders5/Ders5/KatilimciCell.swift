//
//  KatilimciCell.swift
//  Ders5
//
//  Created by Suleyman Calik on 15.11.2014.
//  Copyright (c) 2014 Wissen. All rights reserved.
//

import UIKit

class KatilimciCell: UITableViewCell {

    @IBOutlet var lblTitle:UILabel!
    @IBOutlet weak var durumSwitch: UISwitch!
    
    var delegate:KatilimciDelegate!
    var currentIndex:Int = 0

    override func awakeFromNib() {
        super.awakeFromNib()
        
        durumSwitch.addTarget(self, action:Selector("durumDegisti"), forControlEvents: UIControlEvents.ValueChanged)
    }
    
    
    func durumDegisti() {
        delegate.katilimciDurumuDegisti(currentIndex, yeniDurum:durumSwitch.on)
    }
    
    
}






