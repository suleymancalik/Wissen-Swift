//
//  User.swift
//  Ders10
//
//  Created by Suleyman Calik on 07/12/14.
//  Copyright (c) 2014 Wissen. All rights reserved.
//

import Realm

class User: RLMObject {

    dynamic var firstName:String = ""
    dynamic var lastName:String = ""
    dynamic var username:String = ""
    dynamic var gender:String = ""
    dynamic var userId:String = ""

    
    func fullName() -> String {
        return firstName + " " + lastName
    }
    
    
    override class func primaryKey() -> String! {
        return "userId"
    }
    
}



