//
//  CodableBundleExtension.swift
//  Appetizers
//
//  Created by Shubham on 07/03/24.
//

import Foundation

/*
 The code is extending the functionality of the Bundle class.
 
 
 The final result of this function will be a SERIALIZED ARRAY of Appetizer that we can use in anywhere and any time.
 */
extension Bundle {
    func decode<T: Codable>(_ file: String) -> T { //T is the shorthand for TYPE
        //1. Locate the JSON file
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("failed to locate \(file) in bundle")
        }
        
        //2. Create a property for the data
        guard let data = try? Data(contentsOf: url) else { //Reads Content of file and stores it into Data object
            fatalError("failed to load \(file) from bundle")
        }
        
            
        //3. Create a decoder
        let decoder = JSONDecoder()
        
        //4. Create a property for the decoded data
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("failed to decode file from \(file) bundle")
        }
        //5. Return the Ready to use data
        return loaded
        
    }
}
