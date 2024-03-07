//
//  OrderDetailView.swift
//  Appetizers
//
//  Created by Shubham on 18/03/24.
//

import SwiftUI

struct OrderDetailView: View {
    
    var appetizer: Appetizer
    
    
    var body: some View {
        HStack(spacing: 23) {
            
            
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                
                .scaledToFit()
                .font(.title2)
                .frame(width: 150, height: 150)
                .clipShape(RoundedRectangle(cornerRadius: 30))
            
            VStack(alignment: .leading) {
                Text(appetizer.name)
                Text("$\(appetizer.price, specifier: "%.2f")")
                    .foregroundStyle(.secondary)
            }
            
        } //: HSTACK
    }
}

#Preview {
    OrderDetailView(appetizer: MockData.appetizers[0])
}
