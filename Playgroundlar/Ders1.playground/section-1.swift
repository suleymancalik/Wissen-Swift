// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var text:String = "Hello World"

var myInteger1 = 10
var myInteger2:Int = 10
//var myInteger3:Int = 10.0

/*
deneme
tfyuhijokl
*/


var myArray1 = [3,5,7]
var myArray2:Array = [1,3,5]
var myArray3:Array<Int> = [2,4,6]
var myArray4 = [Int]()


myArray4.append(124)
//myArray4.append("test")

myArray4[0] = 456

if myArray4.count > 1 {
    myArray4[1] = 1234
}
else {
    println("Out of bounds!!")
}


var myArray5 = Array(count: 5,repeatedValue:100)
myArray5.append(123)

var newValue = 234
myArray5.insert(newValue, atIndex:0)


//myArray5.removeAll(keepCapacity: false)
myArray5

var range = Range(start: 1, end: 4)
var range2 = 1...3
var range3 = 1..<4
myArray5.removeRange(range2)


///// OPTIONALS ///////


var notOptionalInt:Int = 10
//notOptionalInt = nil

var myOptionalInt:Int? = 10
myOptionalInt = nil






























