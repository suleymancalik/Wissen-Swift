// Playground - noun: a place where people can play

import UIKit


class Arac {
    
    var tekerlekSayisi:Int {
        return 0
    }
    
    var direksiyonSayisi = 1
    
    var renk:String {
        return "Kırmızı"
    }
    
    func git() -> String {
        return "Gidiyorum"
    }
}

class MotorSiklet: Arac {
    override var tekerlekSayisi:Int {
        return 2
    }

    override func git() -> String {
        return "Gidiyoruum Gidemedim!"
    }

}

class Otomobil : Arac {
    
    override var tekerlekSayisi:Int {
        return 4
    }

    override func git() -> String {
        return "Gidiyoruum Gittim!"
    }
}


class Taksi: Otomobil {
    override var renk:String {
        return "Sarı"
    }

}



var myArac = Arac()
myArac.tekerlekSayisi
myArac.renk
myArac.direksiyonSayisi
myArac.git()



var myOtomobil = Otomobil()
myOtomobil.tekerlekSayisi
myOtomobil.renk
myOtomobil.direksiyonSayisi
myOtomobil.git()



var motor = MotorSiklet()
motor.tekerlekSayisi
motor.renk
motor.direksiyonSayisi
motor.git()

var sariTaksi = Taksi()
sariTaksi.tekerlekSayisi
sariTaksi.renk
sariTaksi.direksiyonSayisi
sariTaksi.git()








