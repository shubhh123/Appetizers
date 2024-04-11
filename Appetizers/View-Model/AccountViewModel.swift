//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Shubham on 15/03/24.
//

import SwiftUI

final class AccountViewModel: ObservableObject {
    
    @AppStorage("user") private var userData: Data?
    
    @Published var user = User()
    
    @Published var alertItem: AlertItem?
    
    
    func saveChanges() {
        guard isValidForm else {
            return
        }
        
        //ENCODE OUR USER INTO DATA, AND SAVE IT INTO USER DEFAULTS
        do {
            let data = try JSONEncoder().encode(user)
            userData = data
            alertItem = AlertContext().userSaveSuccess
            
        } catch {
            alertItem = AlertContext().invalidUserData
        }
    }
    
    
    func retrieveUser() {
        guard let userData else {
            return
        }
        do {
            user = try JSONDecoder().decode(User.self, from: userData)
        } catch {
            alertItem = AlertContext().invalidUserData
        }
    }
    
    
    var isValidForm: Bool {
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else {
            
            alertItem = AlertContext().invalidForm
            
            return false
        }
        
        guard user.email.isValidEmail else {
            alertItem = AlertContext().invalidEmail
            return false
        }
        
        return true
    }
    
}
