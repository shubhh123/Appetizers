//
//  NetworkManage.swift
//  Appetizers
//
//  Created by Shubham on 08/03/24.
//

//https://chat.openai.com/share/11981ca0-e01d-4843-bc69-d9ee60f57d47

import SwiftUI
import UIKit
final class NetworkManager {
    
    static let shared = NetworkManager()
    
    //setting up cache
    private let cache = NSCache<NSString, UIImage>()
    
    
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/";
    private let appetizerURL = baseURL + "appetizers"
    
    private init() {} //indicates instances can only be created using shared instances. (Singleton pattern).
    
        
    //We have a function getAppetizers()
    //once that is 'completed'👇🏻 we will have a Result of type [Appetizer] and Error
    func getAppetizers(completed: @escaping (Result<[Appetizer], APError>) -> Void) {
        
        guard let url = URL(string: appetizerURL)  else { //checks and creates a URL else calls the completion closure with a failure case of invalidURL and returns.
            completed(.failure(.invalidURL))
            return
        }
        
        //Initiates a data task with the given URL using URLSession.shared.
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            if error != nil {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidRsesponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
                
                completed(.success(decodedResponse.request)) //.success = Appetizers
            } catch {
                completed(.failure(.invalidData))
            }
        }
        task.resume()
    }
    
    
    func getAppetizers() async throws -> [Appetizer] {
        
        guard let url = URL(string: appetizerURL)  else { //checks and creates a URL else calls the completion closure with a failure case of invalidURL and returns.
            throw APError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            let decoder = JSONDecoder()
            let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
            return decodedResponse.request
        } catch {
            throw APError.invalidData
        }
    }
    
    
    
    func downloadImage(fromURLString urlString: String, completionHandler: @escaping (UIImage?) -> Void ) {
        
        
        let cacheKey = NSString(string: urlString)
        
        //print(cacheKey)
        
        if let image = cache.object(forKey: cacheKey) {
            completionHandler(image)
            return //directky return from the function
        }
        
        guard let url = URL(string: urlString) else {
            completionHandler(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
                
            guard let data, let image = UIImage(data: data) else {
                completionHandler(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            completionHandler(image)
            
        }
        task.resume()
    }
}
