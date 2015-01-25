import UIKit


class SomeClass {    
    var name: String

    init(name: String) {        self.name = name
    }}


var objectA = SomeClass(name: "Suleyman")

var objectB = objectA
// Var olan instance'a yeni reference

objectB.name = "Kemal"

println(objectA.name)
println(objectB.name)






struct SomeStruct {
    var name: String
    
    init(name: String) {        self.name = name
    }}

var structA = SomeStruct(name: "Suleyman")
var structB = structA //Yeni bir instance


structB.name = "Kemal"

println(structA.name)
println(structB.name)










var obj1 = SomeClass(name: "1")
var obj2 = SomeClass(name: "2")

var objects = [obj1,obj2]

objects[0].name = "3"

obj1
obj2


var str1 = SomeStruct(name: "1")
var str2 = SomeStruct(name: "2")

var structs = [str1,str2]

structs[0].name = "3"


str1
str2





