//
//  HomeTab.swift
//  Appetizers
//
//  Created by Shubham on 07/03/24.
//

import SwiftUI

struct AppetizerListView: View {
    @StateObject var viewModel = AppetizerViewModel()
    @State private var scale = 1.0
    
    @State private var startAnimatingList: Bool = false
    
    var body: some View {
        ZStack {
            NavigationStack {
                List(viewModel.appetizers) { appetizer in
                        IndividualAppetizersListView(appetizer: appetizer)
                        .animation(.easeIn, value: scale)
                        .listRowSeparator(.hidden)
                        .onTapGesture {
                            viewModel.selectedAppetizer = appetizer
                            viewModel.isShowingDetailView = true
                        }
                    
                } //: LIST
                
                .onAppear {
                    startAnimatingList = true
                }
                .opacity(startAnimatingList ? 1.0 : 0.0)
                .animation(.easeInOut(duration: 1).delay(1), value: startAnimatingList)
                
                .listStyle(.automatic)
                .disabled(viewModel.isShowingDetailView)
//                .disabled(viewModel.isShowingDetailView)
                        
//                    .sheet(isPresented: $viewModel.isShowingDetailView, content: {
//                        AppetizerDetailView(appetizer: viewModel.selectedAppetizer!)
//                    })
                    .navigationTitle("Appetizers")
                    
                    //.disabled(viewModel.isShowingDetailView)
            } //: NavigationStack
            
            .blur(radius: viewModel.isShowingDetailView ? 20 : 0)
            
//            .onAppear {
//                viewModel.getAppetizers()
//            }
            .task {
                viewModel.getAppetizers()
            }
            
            if viewModel.isShowingDetailView {
                AppetizerDetailView(appetizer: viewModel.selectedAppetizer!, viewModel: viewModel)
            }
            
            
            if viewModel.isLoading {
                //LoadingView()
                ProgressView()
                    .progressViewStyle(.circular)
                    .scaleEffect(2)
                    //.border(Color.brandPrimarySwift)
                    //.cornerRadius(4)
            }
            
        } //: ZSTACK
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
    }
}

#Preview {
    AppetizerListView()
}

struct TransparentView: View {
   var body: some View {
      VStack {
         // empty
      }
      .frame( maxWidth: .infinity, maxHeight: .infinity )
      .background( Color.white )
      .opacity( 0.001 )
   }
}


