//
//  Alert.swift
//  Appetizers
//
//  Created by Shubham on 11/03/24.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    
    //MARK: - NETWORK ALERTS
    var invalidData = AlertItem(title: Text("Server Error"), message: Text("The data received from the server was invalid. Please contact support"), dismissButton: .default(Text("Ok")))
    
    var invalidResponse = AlertItem(title: Text("Server Error"), message: Text("Invalid response from the server. Please try again later or contact support"), dismissButton: .default(Text("Ok")))
    
    var invalidURL = AlertItem(title: Text("Server Error"), message: Text("There was an issue connecting to the server. If this perseist, please contact support."), dismissButton: .default(Text("Ok")))
    
    var unableToComplete = AlertItem(title: Text("Server Error"), message: Text("Unable to complete your request this tme. Please check your internet connection"), dismissButton: .default(Text("Ok")))
    
    
    //MARK: - ACCOUNT ALERTS
    var invalidForm = AlertItem(title: Text("Invalid Form"), message: Text("Please ensure all fields in the form have been filled out"), dismissButton: .default(Text("Ok")))
    
    var invalidEmail = AlertItem(title: Text("Server Error"), message: Text("Please Make sure you enter vaild Email"), dismissButton: .default(Text("Ok")))
    
    //MARK: - @AppStorage
    var userSaveSuccess = AlertItem(title: Text("Profile Saved "), message: Text("Your profile information was successfully saved."), dismissButton: .default(Text("Ok")))
    
    var invalidUserData = AlertItem(title: Text("Profile Error "), message: Text("There was an error saving or retreiving your profile"), dismissButton: .default(Text("Ok")))

    
    
}

