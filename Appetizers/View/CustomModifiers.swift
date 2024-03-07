//
//  CustomModifiers.swift
//  Appetizers
//
//  Created by Shubham on 21/03/24.
//

import SwiftUI

struct StandardButtonStyle: ViewModifier {
    
    func body(content: Content) -> some View {   //content is Button in our case
        content
            .buttonStyle(.borderedProminent)
            .tint(.brandPrimarySwift)
            .controlSize(.large)
    }
}

struct ImageModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .scaledToFit()
            .frame(width: 100, height: 100)
            .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}


