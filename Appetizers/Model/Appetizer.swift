//
//  Appetizer.swift
//  Appetizers
//
//  Created by Shubham on 07/03/24.
//

import SwiftUI

struct Appetizer: Decodable, Identifiable, Hashable {
//    var id: String
//    let imageName: String
//    let price: String
    
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}

struct AppetizerResponse : Decodable {
    let request: [Appetizer]
}

struct MockData {
    static let sampleAppetizer1 = Appetizer(id: 100,
                                           name: "Test Appetizer1",
                                           description: "This is a description for my appetizer its yummy!!",
                                           price: 9.99,
                                           imageURL: "",
                                           calories: 99,
                                           protein: 99,
                                           carbs: 99)
    
    static let sampleAppetize2 = Appetizer(id: 101,
                                           name: "Test Appetizer2",
                                           description: "Description",
                                           price: 9.99,
                                           imageURL: "",
                                           calories: 99,
                                           protein: 99,
                                           carbs: 99)
    
    static let sampleAppetize3 = Appetizer(id: 102,
                                           name: "Test Appetize3",
                                           description: "Description",
                                           price: 9.99,
                                           imageURL: "",
                                           calories: 99,
                                           protein: 99,
                                           carbs: 99)
    
    static let appetizers = [sampleAppetizer1, sampleAppetize2, sampleAppetize3]
    
    
    static let orderItemOne = Appetizer(id: 111,
                                           name: "Order Test Appetize1",
                                           description: "Description",
                                           price: 9.99,
                                           imageURL: "",
                                           calories: 99,
                                           protein: 99,
                                           carbs: 99)
    
    static let orderItemTwo = Appetizer(id: 112,
                                           name: "Order Test Appetize2",
                                           description: "Description",
                                           price: 9.99,
                                           imageURL: "",
                                           calories: 99,
                                           protein: 99,
                                           carbs: 99)
    
    static let orderItemThree = Appetizer(id: 113,
                                           name: "Order Test Appetize3",
                                           description: "Description",
                                           price: 9.99,
                                           imageURL: "",
                                           calories: 99,
                                           protein: 99,
                                           carbs: 99)
    
    static let orderItems = [orderItemOne, orderItemTwo, orderItemThree]
    
    

}
