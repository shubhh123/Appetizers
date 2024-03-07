//
//  APError.swift
//  Appetizers
//
//  Created by Shubham on 08/03/24.
//

import Foundation


enum APError: Error {
    case invalidURL
    case invalidRsesponse
    case invalidData
    case unableToComplete //NETWORK ERROR
}
