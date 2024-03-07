//
//  CustomTabBar.swift
//  Appetizers
//
//  Created by Shubham on 26/03/24.
//

import SwiftUI

struct CustomTabBar: View {
    
    @Binding var selection: Int
    var text1: String
    var text2: String
    var text3: String
    
    var body: some View {
        
        HStack(spacing: 0) {
                    TabBarButton(imageName: "house",
                                 text: 
                                    Text(text1)
                                        .foregroundStyle(Color.brandPrimarySwift)
                                        .fontWeight(.semibold)
                                        .font(.title3),
                                 index: 1,
                                 selection: $selection)
            
                    TabBarButton(imageName: "person", 
                                 text: 
                                    Text(text2)
                                        .foregroundStyle(Color.brandPrimarySwift)
                                        .fontWeight(.semibold)
                                        .font(.title3),
                                 index: 2,
                                 selection: $selection)
            
                    TabBarButton(imageName: "bag", 
                                 text: 
                                    Text(text3)
                                        .foregroundStyle(Color.brandPrimarySwift)
                                        .fontWeight(.semibold)
                                        .font(.title3),
                                 index: 3,
                                 selection: $selection)
            
                }
        .background(Color(.systemBackground))
        //.shadow(radius: 4)
    }
}

#Preview {
    CustomTabBar(selection: .constant(0), text1: "Home", text2: "Account", text3: "Order")
}
