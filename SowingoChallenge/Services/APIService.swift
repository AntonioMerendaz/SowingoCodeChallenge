//
//  APIService.swift
//  SowingoChallenge
//
//  Created by Antonio on 2020-12-21.
//

import Foundation

class APIService :  NSObject {
    func fetchFromServer(completion : @escaping (Products) -> ()) {
        let urlString = "https://demo5514996.mockable.io/products"
        
        guard let url = URL(string: urlString) else { return }
    
        URLSession.shared.dataTask(with: url) { (data, urlResponse, error) in
            if let data = data {
                
                let jsonDecoder = JSONDecoder()
                
                let prodData = try! jsonDecoder.decode(Products.self, from: data)
                    completion(prodData)
            }
            
        }.resume()
    }
}
