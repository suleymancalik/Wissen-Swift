// Playground - noun: a place where people can play

import UIKit


protocol KatilimciDelegate {
    func katilimciDurumuDegisti(durum:Bool)
}



class HarikaClass : KatilimciDelegate {
    
    func katilimciDurumuDegisti(durum: Bool) {
        print("Yeni durum: \(durum)")
    }
}



var harikaBirClass = HarikaClass()
harikaBirClass.katilimciDurumuDegisti(true)














