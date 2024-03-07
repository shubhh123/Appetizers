//
//  RemoteImage.swift
//  Appetizers
//
//  Created by Shubham on 12/03/24.
//

import SwiftUI


//DOWNLOADS THE IMAGE
final class ImageLoader: ObservableObject {
    
    @Published var image: Image? = nil
    
    func load(fromUrlString urlString: String) {
        NetworkManager.shared.downloadImage(fromURLString: urlString) { uiImage in // image: UIImage
            guard let uiImage else {
                return
            }
            
            //Now because this would trigger the UI Change, we want to dispatch this in the Main Queue
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
        }
    }
}

struct RemoteImage: View {
    
    var image: Image?
    
    var body: some View {
        image?.resizable() ?? Image("food-placeholder").resizable()
    }
}


//USE THIS TO REPLACE THE IMAGE ON YOUR LIST VIEW
struct AppetizerRemoteImage: View {
    
    @StateObject var imageLoader = ImageLoader()
    let urlString: String
    
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear {
                imageLoader.load(fromUrlString: urlString)
            }
    }
}
