//
//  TabBarButton.swift
//  Appetizers
//
//  Created by Shubham on 26/03/24.
//

import SwiftUI

struct TabBarButton: View {
    let imageName: String
    let text: Text
    let index: Int
    @Binding var selection: Int
    
    var isSelected: Bool {
        index == selection
    }
    
    var body: some View {
        Button(action: {
            selection = index
        }, label: {
            VStack {
                text
                    .font(.title3)
                    .foregroundColor(isSelected ? .brandPrimarySwift : .gray)
                    
                Image(systemName: imageName)
                    .resizable()
                    .frame(width: 20, height: 20)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.brandPrimarySwift)
                
            }.padding(.bottom,8)
        })
        .frame(maxWidth: .infinity)
    }
}
#Preview {
    TabBarButton(imageName: "globe", text: Text("Hello"), index: 0, selection: .constant(0))
}
