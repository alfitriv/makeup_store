//
//  DiscoverViewModel.swift
//  makeupStore
//
//  Created by Vania Alfitri on 26/04/2023.
//  Copyright © 2023 Vania Radmila Alfitri. All rights reserved.
//

import Foundation

struct DiscoverViewModel {
    var brand: String
    
    init(brand: String) {
        self.brand = brand
    }
    
    var textLabel: String {
        return brand
    }
}
