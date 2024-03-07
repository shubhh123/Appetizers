//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by Shubham on 07/03/24.
//

import SwiftUI

@main
struct AppetizersApp: App {
    
    var orders = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabView().environmentObject(orders)
        }
    }
}
