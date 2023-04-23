//
//  MakeupStore.swift
//  MakeupPicker
//
//  Created by Vania Radmila Alfitri on 19/03/20.
//  Copyright © 2020 Vania Radmila Alfitri. All rights reserved.
//

import Foundation

enum ProductType: String, Codable {
    case lipstick = "lipstick"
    case lipLiner = "lip_liner"
    case foundation = "foundation"
    case eyeLiner = "eyeliner"
    case eyeShadow = "eyeshadow"
    case blush = "blush"
    case bronzer = "bronzer"
    case mascara = "mascara"
    case eyeBrow = "eyebrow"
    case nailPolish = "nail_polish"
}

enum NetworkError: Error {
    case badURL
}

class NetworkLayer {
    static var shared = NetworkLayer()
    private init(){}
    
    func fetchMakeUpList(completionHandler: @escaping (Result<[Makeup], NetworkError>) -> Void) {
        let session = URLSession.shared
        let urlRequest = URLRequest(url: URL(string: "https://makeup-api.herokuapp.com/api/v1/products.json")!)
        session.dataTask(with: urlRequest) { (data, response, error) in
            guard error == nil else {
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode >= 200 && httpResponse.statusCode < 300 else {
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    completionHandler(.failure(.badURL))
                }
                return
            }
            
            print(data)
            
            do {
                let makeupList = try JSONDecoder().decode([Makeup].self, from: data)
                print(makeupList)
                DispatchQueue.main.async {
                    completionHandler(.success(makeupList))
                }
            } catch {
                
            }
            
        }.resume()
        
    }
    
    func fetchMakeupListJSON(successHandler: @escaping ([Makeup]) -> Void, errorHandler: @escaping (Error) -> Void) {
        let path = Bundle.main.path(forResource: "makeup", ofType: "json")!
        let data = try! Data(contentsOf: URL(fileURLWithPath: path))
        do {
            let makeupList = try JSONDecoder().decode([Makeup].self, from: data)
            print(makeupList)
            DispatchQueue.main.async {
                successHandler(makeupList)
            }
        } catch {
            
        }
    }
    
}

