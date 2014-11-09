// Playground - noun: a place where people can play

import UIKit

func merhabaDe() {
    println("Merhaba!")
}
merhabaDe()


func merhabaDe(isim:String) {
    println("Merhaba: \(isim)")
}
merhabaDe("Suleyman")


func birseySoyle(birsey:String , isim:String) {
    println(birsey + " " + isim)
}
birseySoyle("Selam", "Suleyman")


func topla(ilkSayi:Int , ikinciSayi:Int) -> Int {
    return ilkSayi + ikinciSayi
}
var toplam = topla(10, 4)
println(toplam)


func ikiyeBol(sayi:Int) -> (Int,Int) {
    var bolum = sayi / 2
    var kalan = sayi % 2
    
    return (bolum,kalan)
}

// Tuple kullanim 1.yontem
var bolumVeKalan = ikiyeBol(13)
bolumVeKalan.0
bolumVeKalan.1

// Tuple kullanim 2.yontem
var (bolum,kalan) = ikiyeBol(13)
bolum
kalan



class Araç {
    var tekerSayısı:Int = 0
    var renk:String!
}


var yeniAracım = Araç()
yeniAracım.tekerSayısı = 4
yeniAracım.renk = "Kırmızı"


var diğerAracım = Araç()
diğerAracım.renk = "Mavi"
diğerAracım.tekerSayısı = 2

yeniAracım = diğerAracım

yeniAracım.renk
yeniAracım.tekerSayısı



class Taksi : Araç {
    
    // Maksimum yolcu limiti
    var yolcuSayisi:Int = 4
    
    // Taksideki yolculari saklar
    var yolcular:Array<String> = [String]()
    
    // Eger yer varsa, taksiye yeni yolcu alir
    func yolcuAl(isim:String) -> Bool {
        
        if yolcular.count < yolcuSayisi {
            // YER VAR, YOLCUYU ALIYORUM
            yolcular.append(isim)
            return true
        }
        else {
            // YER YOK ALAMADIM
            return false
        }
        
    }
    
    // Takside yolcu varsa indirir
    // Ilk binen, ilk iner
    func yolcuIndir() -> String? {
        if yolcular.count > 0 {
            return yolcular.removeAtIndex(0)
        }
        else {
            return nil
        }
    }
    
    
    func yolcuDurumu() -> String {
        return "\(yolcular.count) adet yolcum var. \(yolcular)"
    }
}


var sariTaksi = Taksi()

sariTaksi.yolcuDurumu()
sariTaksi.yolcuAl("Abdullah")
sariTaksi.yolcuDurumu()
sariTaksi.yolcuAl("Cihan")
sariTaksi.yolcuDurumu()
sariTaksi.yolcuIndir()
sariTaksi.yolcuDurumu()
sariTaksi.yolcuAl("Doga")
sariTaksi.yolcuAl("Dogukan")
sariTaksi.yolcuAl("Ebru")
sariTaksi.yolcuDurumu()
sariTaksi.yolcuAl("Emre")
sariTaksi.yolcuDurumu()
sariTaksi.yolcuIndir()
sariTaksi.yolcuIndir()
sariTaksi.yolcuIndir()
sariTaksi.yolcuIndir()
sariTaksi.yolcuIndir()
sariTaksi.yolcuDurumu()











