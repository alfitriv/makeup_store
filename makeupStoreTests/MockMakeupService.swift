//
//  MockMakeupService.swift
//  makeupStoreTests
//
//  Created by Vania Alfitri on 25/04/2023.
//  Copyright © 2023 Vania Radmila Alfitri. All rights reserved.
//

import XCTest
@testable import makeupStore

final class MockMakeupService: MakeupService {
    
    var isMakeupListFetched = false
    static let stubMakeup = [
        Makeup(id: 092, name: "Maybeline"),
        Makeup(id: 099, name: "Covergurl")
    ]
    
    
    func fetchMakeUpList(completionHandler: @escaping (Result<[makeupStore.Makeup], makeupStore.NetworkError>) -> Void) {
        isMakeupListFetched = true
        completionHandler(.success(MockMakeupService.stubMakeup))
    }

}
