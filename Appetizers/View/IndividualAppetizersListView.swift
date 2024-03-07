//
//  IndividualAppetizersListView.swift
//  Appetizers
//
//  Created by Shubham on 07/03/24.
//

import SwiftUI

struct IndividualAppetizersListView: View {
    
    var appetizer: Appetizer
    
    @State private var startAnimation: Bool = false
    
    var body: some View {
        HStack(alignment: .center, spacing: 30) {
//            AppetizerRemoteImage(urlString: appetizer.imageURL)
//                .scaledToFit()
//                .frame(width: 100, height: 100)
//                .clipShape(RoundedRectangle(cornerRadius: 20))
                
            AsyncImage(url: URL(string: appetizer.imageURL)) { image in
                image
                    .resizable()
                    .modifier(ImageModifier())
                    .onAppear {
                        startAnimation = true
                    }
                    .opacity(startAnimation ? 1.0 : 0.0)
                    .animation(.easeInOut(duration: 0.25).delay(0), value: startAnimation)
                
            } placeholder: {
                Image("food-placeholder")
                    .resizable()
                    .modifier(ImageModifier())
            }
            
            
//            AsyncImage(url: URL(string: appetizer.imageURL)) { image in
//                image.image?.resizable()
//                image.image?.scaleEffect()
//            } placeholder: {
//                Image(.foodPlaceholder)
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//            }
//            .frame(width: 120, height: 90)
//            .clipShape(RoundedRectangle(cornerRadius: 12))
            
            
            VStack(alignment: .leading, spacing: 4) {
                Text(appetizer.name)
                    .lineLimit(1)
                    .minimumScaleFactor(0.8)
                    .font(.title3)
                    .fontWeight(.bold)
                
                Text("$\(appetizer.price, specifier: "%.2f")")
                    .multilineTextAlignment(.leading)
                    .foregroundStyle(Color.secondary)
                
            } //: VSTACK
            .padding(.leading)
        } //: HSTACK
    
    }
}

#Preview {
    //let appetizers: [Appetizer] = Bundle.main.decode("appetizer.json")
    
    return IndividualAppetizersListView(appetizer: MockData.appetizers[0])
}
