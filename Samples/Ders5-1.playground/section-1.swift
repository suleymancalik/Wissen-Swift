// Playground - noun: a place where people can play

import UIKit

// enum kullanim ornegi
enum Yön {
    case Kuzey
    case Güney
    case Doğu,Batı
}

var istikamet = Yön.Güney
istikamet = Yön.Batı
istikamet = .Doğu

switch istikamet {
case Yön.Kuzey:
    println("Kuzeye gidiyoruz")
case .Güney:
    println("Güneye gidiyoruz")
case .Doğu:
    println("Doğuya gidiyoruz")
case .Batı:
    println("Batıya gidiyoruz")
}


// enum rawValue ornegi
enum Gezegen : Int {
    case Merkur = 1
    case Venus
    case Dünya
    case Mars
    case Jüpiter
    case Satürn
    case Uranüs
    case Neptün
}


Gezegen.Merkur.rawValue
Gezegen.Venus.rawValue

var bizimGezegen = Gezegen.Dünya
bizimGezegen.rawValue



var mustakbelGezegen = Gezegen(rawValue: 3)

// Burada nil kontrolu yapiyoruz
if let gezegen = mustakbelGezegen {
    switch gezegen {
    case .Merkur:
        println("Merkur")
    case .Dünya:
        println("Dünyamız")
    default:
        println("Baska Gezegenmis")
    }
}
else {
    println("Yok boyle bir gezegen!")
}



// Değer parametresi alan enum örneği
enum Barcode {
    case UPCA(Int,Int)
    case QRCode(String)
}


var biskuviBarkodu = Barcode.UPCA(1524524, 27625)

var davetiyeBarkodu = Barcode.QRCode("http://davet.iye/12345")
davetiyeBarkodu = .QRCode("http://davet.iye/54321")


var davetKodu:String?

switch davetiyeBarkodu {
case Barcode.UPCA(let kod1 , let kod2):
    println("biskuvi barkodu: \(kod1) \(kod2)")
case Barcode.QRCode(var davetiye):
    println("davetiye barkodu: \(davetiye)")
    davetKodu = davetiye
}


switch biskuviBarkodu {
case Barcode.UPCA(let kod1 , let kod2):
    println("biskuvi barkodu: \(kod1) \(kod2)")
case Barcode.QRCode(var davetiye):
    println("davetiye barkodu: \(davetiye)")
    davetKodu = davetiye
}










