//
//  AppetizerViewModel.swift
//  Appetizers
//
//  Created by Shubham on 07/03/24.
//

//VIEW MODEL
import SwiftUI


/*
 @MainActor : Anything that happens with UI related will be re routed to the main thread. Like how we did in: DispatchQueue.main.async
 */

@MainActor final class AppetizerViewModel: ObservableObject {
    
    @Published var isShowingDetailView: Bool = false
    
    //@Published var appetizers: [Appetizer]
    
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    
    @Published var isLoading = false
    
    @Published var selectedAppetizer: Appetizer?
    
    @Published var totalBillSoFar = 0
    
    
    //    func getAppetizers() {
    //        
    //        isLoading = true
    //        
    //        NetworkManager.shared.getAppetizers { result in //result = combo of success[appetizers] and error
    //            
    //            DispatchQueue.main.async {
    //                
    //                self.isLoading = false
    //                
    //                switch result {
    //                case .success(let appetizers):
    //                    
    //                    self.appetizers = appetizers
    //                    
    //                case .failure(let error):
    //                    print("Network Error")
    //                    //print(error.localizedDescription)
    //                    
    //                    switch error {
    //                        
    //                    case .invalidRsesponse:
    //                        self.alertItem = AlertContext().invalidResponse
    //                        
    //                    case .invalidURL:
    //                        self.alertItem = AlertContext().invalidURL
    //                        
    //                    case .invalidData:
    //                        self.alertItem = AlertContext().invalidData
    //                        
    //                    case .unableToComplete:
    //                        self.alertItem = AlertContext().unableToComplete
    //                    }
    //                }
    //            }
    //        }
    //    }
    
    
    func getAppetizers() {
        
        isLoading = true
        
        Task {
            do {
                appetizers = try await NetworkManager.shared.getAppetizers()
                isLoading = false
            } catch {
                if let apError = error as? APError {
                    switch apError {
                    case .invalidURL:
                        alertItem = AlertContext().invalidURL
                    case .invalidRsesponse:
                        alertItem = AlertContext().invalidResponse
                    case.invalidData:
                        alertItem = AlertContext().invalidData
                    case.unableToComplete:
                        alertItem = AlertContext().unableToComplete
                    }
                } else  {
                    alertItem = AlertContext().invalidResponse
                }
                isLoading = false
            }
        }
        
    }
    
    
}
