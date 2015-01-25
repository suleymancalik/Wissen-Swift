// Playground - noun: a place where people can play

import UIKit



protocol CocukDelegate {
    func aciktim()
    func disariCikabilirmiyim() -> Bool
}


class Cocuk {
    
    var delegate:CocukDelegate?
    
    func sokaktaOyna() -> String {
        
        if delegate != nil {
            if delegate!.disariCikabilirmiyim() {
                delegate!.aciktim()
                return "OYNADIM"
            }
            else {
                return "ANNEM izin vermedi :("
            }
        }
        
        return "OYNAYAMADIM :("

    }
    
}


enum AnneTipi{
    case Despot
    case Yumusak
}

class Anne:CocukDelegate {
    
    var anneTipi:AnneTipi
    
    init(anneTipi:AnneTipi) {
        self.anneTipi = anneTipi
    }
    
    func aciktim() {
        println("Al sana yemek")
    }
    
    func disariCikabilirmiyim() -> Bool {
        
        if anneTipi == .Yumusak {
            return true
        }
        else {
            return false
        }
    }
    
}



var anne1 = Anne(anneTipi: AnneTipi.Yumusak)
var cocuk1 = Cocuk()
cocuk1.delegate = anne1
cocuk1.sokaktaOyna()

var anne2 = Anne(anneTipi: AnneTipi.Despot)
var cocuk2 = Cocuk()
cocuk2.delegate = anne2
cocuk2.sokaktaOyna()



