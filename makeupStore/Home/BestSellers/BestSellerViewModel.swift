//
//  BestSellerViewModel.swift
//  makeupStore
//
//  Created by Vania Alfitri on 27/04/2023.
//  Copyright © 2023 Vania Radmila Alfitri. All rights reserved.
//

import Foundation


struct BestSellerViewModel {
    var makeup: Makeup
    
    init(makeup: Makeup) {
        self.makeup = makeup
    }
    
    var imageUrl: URL {
        let url = URL(string: makeup.imageLink ?? "")!
        return url
    }
    
    var makeupName: String {
        return makeup.name
    }
    
    var makeupBrand: String {
        return makeup.brand ?? ""
    }
}
