// Playground - noun: a place where people can play

import UIKit


// Tanimlamalar

func normalDegistir(var a:Int , var b:Int) {
    
    var gecici = a
    a = b
    b = gecici
}

func referanslaDegistir(inout a:Int , inout b:Int) {
    
    var gecici = a
    a = b
    b = gecici
}

// Kullanimlar

var ilkSayi:Int = 10
var ikinciSayi:Int = 20

normalDegistir(ilkSayi, ikinciSayi)

ilkSayi
ikinciSayi



referanslaDegistir(&ilkSayi, &ikinciSayi)

ilkSayi
ikinciSayi




// Ornek

func yarisiniYe(inout deger:Float) {
    
    deger /= 2.0
}



var elmaSayisi:Float = 10

yarisiniYe(&elmaSayisi)
elmaSayisi

yarisiniYe(&elmaSayisi)
elmaSayisi

yarisiniYe(&elmaSayisi)
elmaSayisi




var error : NSError?
var dataOfFile = NSData(contentsOfFile: "", options: NSDataReadingOptions.allZeros, error: &error)

if error == nil {
    // basarili
}
else {
    println(error?.description)
}






// Generic


func degistir<T>(inout a:T , inout b:T) {
 
    var gecici = a
    a = b
    b = gecici
}

var p1 = 10
var p2 = 20
degistir(&p1, &p2)
p1
p2


var p3 = "P3"
var p4 = "P4"
degistir(&p3, &p4)
p3
p4


var durum1 = true
var durum2 = false
degistir(&durum1, &durum2)
durum1
durum2










