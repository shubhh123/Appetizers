//
//  XDimissedButton.swift
//  Appetizers
//
//  Created by Shubham on 13/03/24.
//

import SwiftUI

struct XDimissedButton: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 30, height: 30)
                .foregroundStyle(Color.white)
                .opacity(0.6)
            
            Image(systemName: "xmark")
                .imageScale(.small)
                .frame(width: 44, height: 44)
                .foregroundStyle(Color.black)
        } //ZSTACK
    }
}

#Preview {
    XDimissedButton()
}
