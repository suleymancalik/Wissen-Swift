//
//  User.swift
//  Ders10
//
//  Created by Suleyman Calik on 07/12/14.
//  Copyright (c) 2014 Wissen. All rights reserved.
//

import UIKit

class User: NSObject {
   
    var firstName:String!
    var lastName:String!
    var username:String!
    var gender:String!

    func fullName() -> String {
        return firstName + " " + lastName
    }
}



