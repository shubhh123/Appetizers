//
//  APButton.swift
//  Appetizers
//
//  Created by Shubham on 13/03/24.
//

import SwiftUI

struct APButton: View {
    
    let title: LocalizedStringKey
    
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 260, height: 50)
            .background(Color.brandPrimarySwift)
            .foregroundStyle(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .shadow(radius: 20)
    }
}

#Preview {
    APButton(title: "Test Title")
}
