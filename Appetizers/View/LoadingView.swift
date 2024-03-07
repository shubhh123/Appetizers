//
//  LoadingView.swift
//  Appetizers
//
//  Created by Shubham on 12/03/24.
//

import SwiftUI
   
struct ActivityIndicator: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        
        let activityIndicatorView = UIActivityIndicatorView(style: .large)
        
        activityIndicatorView.color = UIColor.brandPrimaryUI
        activityIndicatorView.startAnimating()
        return activityIndicatorView;
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
    }
    
    //typealias UIViewType = UIActivityIndicatorView; //a view that shows a task is in progress
    
    
}


struct LoadingView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            
            /*ActivityIndicator()*/
            
            ProgressView()
                .progressViewStyle(.circular)
                .scaleEffect(1)
        } //: ZSTACK
    }
}
