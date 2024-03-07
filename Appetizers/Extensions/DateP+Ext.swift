//
//  DateP+Ext.swift
//  Appetizers
//
//  Created by Shubham on 28/03/24.
//

import Foundation

extension Date {
    var eighteenYearsAgo: Date {
        //return Date()
        Calendar.current.date(byAdding: .year, value: -18, to: Date())!
        
    }
    
    var oneHundredTenYearsAgo: Date {
        Calendar.current.date(byAdding: .year, value: -110, to: Date())!
    }
}
