//
//  Makeup.swift
//  makeupStore
//
//  Created by Vania Radmila Alfitri on 23/04/20.
//  Copyright © 2020 Vania Radmila Alfitri. All rights reserved.
//

import Foundation

struct Makeup: Codable {
    var id: Int
    var brand: String?
    var productType: ProductType?
    var imageLink: String?
    
    private enum CodingKeys : String, CodingKey {
        case id
        case brand
        case productType = "product_type"
        case imageLink = "image_link"
    }
}
