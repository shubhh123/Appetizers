//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by Shubham on 07/03/24.
//



//https://chat.openai.com/share/7902d968-76ed-4bbf-a14d-d7a5d8678f8c
//refer above for @ObservedObject
import SwiftUI

struct AppetizerDetailView: View {
    
    @EnvironmentObject var order: Order
    
    @State private var startAnimation: Bool = false
    
    let appetizer: Appetizer
    
    //
    //@Binding var isShowingDetailView: Bool
    //
    
        
    //@Binding private var viewModel = AppetizerViewModel()
    
    @ObservedObject var viewModel: AppetizerViewModel
    
    //@Binding var isShowingDetailView: Bool
    //@Binding var isShowingDetailView: Bool
        
    var body: some View {
        
        ZStack {
            
            TransparentView()
                  .onTapGesture {
                     viewModel.isShowingDetailView = false
                  }
            
            
            VStack(spacing: 10) {
                AppetizerRemoteImage(urlString: appetizer.imageURL)
                    .scaledToFit()
                    .frame(width: 300, height: 225)
                
                //Spacer()
                
                VStack {
                    Text(appetizer.name)
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text(appetizer.description)
                        .multilineTextAlignment(.center)
                        .font(.body)
                        .padding()
                    
                    HStack(spacing: 20) {
                        NutritionInfo(title: "Calories", value: "\(appetizer.calories)")
                        NutritionInfo(title: "Proteins", value: "\(appetizer.protein)g")
                        NutritionInfo(title: "Carbs", value: "\(appetizer.carbs)g")
                    } //: HSTACK
                    
                } //: VSTACK
                
                Spacer()
                    
                Button {
                     order.add(appetizer)
                     print("Button tapped")
                    
                     viewModel.isShowingDetailView = false
                     //AccountTab()
                     //viewModel.isShowingDetailView = false
                } label: {
                    //APButton(title: "$\(appetizer.price, specifier: "%.2f") - Add to Order")
                    Text("$\(appetizer.price, specifier: "%.2f") - Add to Order")
                }
                .modifier(StandardButtonStyle())
//                .buttonStyle(.borderedProminent)
//                .tint(.brandPrimarySwift)
//                .controlSize(.large)
                .padding(.bottom, 30)
                
                
                
            } //: VSTACK
            
            
            .frame(width: 300, height: 525)
            .background(Color(.systemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .shadow(radius: 40)
            .overlay(Button {
                print("Cancelled")
                viewModel.isShowingDetailView = false
                
                
            } label: {
                //Text("Squeez me")
                XDimissedButton()
            },
                 alignment: .topTrailing)
        } //: VSTACK
        
        
        .onAppear {
            startAnimation = true
        }
        
        .opacity(startAnimation ? 1.0 : 0.0)
        .animation(.spring(duration: 0.5).delay(0), value: startAnimation)
        //Spacer()
    } //: ZSTACK
    
}

#Preview {
    
    @StateObject var viewModel = AppetizerViewModel()
    
    //let appetizers: [Appetizer] = AppetizersViewM
    return AppetizerDetailView(appetizer: MockData.sampleAppetizer1, viewModel: viewModel)
}


struct NutritionInfo: View {
    
    let title: String
    let value: String
    
    var body: some View {
        VStack(spacing: 5) {
            Text(title)
                .font(.body)
                .fontWeight(.medium)
                
            Text(value)
                .foregroundStyle(.secondary)
                .fontWeight(.semibold)
                .italic()
            
        }
    }
}

