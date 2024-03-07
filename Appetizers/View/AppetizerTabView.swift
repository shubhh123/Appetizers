//
//  ContentView.swift
//  Appetizers
//
//  Created by Shubham on 07/03/24.
//

import SwiftUI

struct AppetizerTabView: View {
    
    @EnvironmentObject var order: Order
    
    
    @State var tabSelection = 1
    
    var body: some View {
        TabView {
            AppetizerListView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                
            
            AccountTab()
                .tabItem {
                    Label("Account", systemImage: "person")
                }
                
            
            OrderView()
                .tabItem {
                    Label("Order", systemImage: "bag")
                }
                
                .badge(order.items.count)
        } //: TABVIEW
        
        
//        TabView(selection: $tabSelection){
//            AppetizerListView()
////                .tabItem {
////                    Label("Home", systemImage: "house")
////                }
//                .tag(1)
//            
//            AccountTab()
////                .tabItem {
////                    Label("Account", systemImage: "person")
////                }
//                .tag(2)
//            
//            OrderView()
////                .tabItem {
////                    Label("Order", systemImage: "bag")
////                }
//                .tag(3)
//                .badge(order.items.count)
//        }
//        
//        //Add the custom TabBar
//        //Spacer()
//            CustomTabBar(selection: $tabSelection, text1: "Home", text2: "Account", text3: "Order")
//                //.frame(height: 50)
//            
////        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
////        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
////        .animation(.default, value: tabSelection)
        
    }
}

#Preview {
    AppetizerTabView()
}
