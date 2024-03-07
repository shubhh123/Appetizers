//
//  CardView.swift
//  Appetizers
//
//  Created by Shubham on 13/03/24.
//

import SwiftUI

struct CardView: View {
    
    let card: Card
    
    @State private var isShowingAnswer = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(.white)
                .shadow(radius: 10)
            
            VStack {
                Text(card.prompt)
                    .font(.largeTitle)
                    .foregroundStyle(Color(.label))
                
                if isShowingAnswer {
                    Text(card.answer)
                        .font(.title)
                        .foregroundStyle(.secondary)
                }
            } //: VSTACK
            .padding(20)
            .multilineTextAlignment(.center)
        } //: ZSTACK
        .frame(width: 450, height: 250)
        .onTapGesture {
            isShowingAnswer.toggle()
        }
    }
}

#Preview {
    CardView(card: .example)
}
