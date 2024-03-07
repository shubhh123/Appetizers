//
//  User.swift
//  Appetizers
//
//  Created by Shubham on 18/03/24.
//

import Foundation

/*
 When You are storing custom objects in @AppStorage, you have to convert it to Data first and then store it in @AppStorage.
 When you are accessing, the data from @AppStorage should first be converted to Data, then it can be modeled into User Object.
 So to achieve this, we use Codable.
 */

struct User: Codable {
    var firstName = ""
    var lastName = ""
    var email = ""
    var birthDate = Date()
    var extraNapkins = false
    var frequentRefills = false
   
}
