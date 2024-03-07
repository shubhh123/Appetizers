//
//  OrderTab.swift
//  Appetizers
//
//  Created by Shubham on 07/03/24.
//

import SwiftUI

struct OrderView: View {
    
    @StateObject var viewModel = AppetizerViewModel()
    
    @EnvironmentObject var orders: Order
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    List {
                        ForEach(orders.items) { orderedAppetizer in
                            IndividualAppetizersListView(appetizer: orderedAppetizer)
    //
                        }
                        
                        .onDelete(perform: orders.deleteItems)
                        
    //                    .onDelete(perform: { indexSet in
    //                        orderItems.remove(atOffsets: indexSet)
    //                    })
                    } //: LIST
                    .listStyle(PlainListStyle())
                    
                    Button {
                        print("Order Placed")
                    } label: {
                        //APButton(title: "$\(orders.totalPrice, specifier: "%.2f") - Place Order")
                        Text("$\(orders.totalPrice, specifier: "%.2f") - Place Order")
                    }
                    .modifier(StandardButtonStyle())
                    .padding(.bottom, 25)
                } //: VSTACK
                
                if orders.items.isEmpty {
                    EmptyState(imageName: "empty-order", message: "You have no items in your Orders. \nPlease add an appetizer")
                }
            } //: ZSTACK
            .navigationTitle("Orders")
        }
        
    }
    
}
    
    #Preview {
        OrderView()
    }
