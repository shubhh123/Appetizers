//
//  AccountTab.swift
//  Appetizers
//
//  Created by Shubham on 07/03/24.
//

import SwiftUI

struct AccountTab: View {
    
    @StateObject var accountViewModel = AccountViewModel()
    @FocusState private var focusedTextField: FormTextField?

    
    enum FormTextField {
        case firstName, lastName, email
    }
    
    var body: some View {
        NavigationStack {
            Form {
                //MARK: - Section 1
                Section(header: Text("Personal Info")){
                    //Text("Account")
                    TextField("First Name", text: $accountViewModel.user.firstName)
                        .focused($focusedTextField, equals: .firstName)
                        .onSubmit {
                            print(focusedTextField!)
                            focusedTextField = .lastName
                        }
                        .submitLabel(.next)
                    
                    TextField("Last Name", text: $accountViewModel.user.lastName)
                        .focused($focusedTextField, equals: .lastName)
                        .onSubmit {
                            print(focusedTextField!)
                            focusedTextField = .email
                        }
                        .submitLabel(.next)
                    
                    TextField("Email", text: $accountViewModel.user.email)
                        .focused($focusedTextField, equals: .email)
                        .onSubmit {
                            print(focusedTextField!)
                            focusedTextField = nil
                        }
                        .submitLabel(.continue)
                        
                        
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled(true)
                    
//                    DatePicker("Birthday", selection: $accountViewModel.user.birthDate, displayedComponents: .date)
//                        .tint(Color.brandPrimarySwift)
                    
                    DatePicker("Birthday", selection: $accountViewModel.user.birthDate, 
                               in: Date().oneHundredTenYearsAgo...Date().eighteenYearsAgo,
                               displayedComponents: .date)
                    
                    
                    Button {
                        accountViewModel.saveChanges()
                        print("Save")
                    } label: {
                        Text("Save changes")
                    }
                } //: SECTION
                
                //MARK: - Section 2
                Section(header: Text("Requests")) {
                    Toggle("Extra Napkins", isOn: $accountViewModel.user.extraNapkins)
//                        .toggleStyle(SwitchToggleStyle(tint: Color.brandPrimarySwift))
                    Toggle("Frequent Refills", isOn: $accountViewModel.user.frequentRefills)
                }
                .tint(Color.brandPrimarySwift)
                
            } //FORM
            .navigationTitle("Account")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Button("Dismiss") {
                        focusedTextField = nil
                    }
                }
            }
        }  //: NavigationStack
        
        .onAppear {
            accountViewModel.retrieveUser()
        }
        
        
        
        .alert(item: $accountViewModel.alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
    }
}

#Preview {
    AccountTab()
}
