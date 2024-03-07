//
//  EmptyState.swift
//  Appetizers
//
//  Created by Shubham on 20/03/24.
//

import SwiftUI

struct EmptyState: View {
    
    let imageName: String
    let message: String
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            
            VStack {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                    .shadow(radius: 3)
                
                Text(message)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(Color.secondary)
                    .padding()
            } //: VSTACK
            .offset(y: -70)
//            Spacer().frame(height: 70)
        } //: ZSTACK
    }
}

#Preview {
    EmptyState(imageName: "empty-order", message: "This is my Test message. Making it a little longer")
}
