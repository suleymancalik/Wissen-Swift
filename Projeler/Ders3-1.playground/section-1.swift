// Playground - noun: a place where people can play

import UIKit

let possibleNumber:String = "1234"
let convertedNumber:Int? = possibleNumber.toInt()


// convertedNumber nil mi?
// 1. YONTEM
if let actualNumber = convertedNumber {
    println("sayi olustu: \(actualNumber) ")
}
else {
    println("Sayi olusturulamadi!")
}


// convertedNumber nil mi?
// 2. YONTEM

if convertedNumber == nil {
    println("Sayi olusturulamadi!")
}
else {
    println("sayi olustu: \(convertedNumber!) ")
}


print("yazi 1"); print("yazi 2")










