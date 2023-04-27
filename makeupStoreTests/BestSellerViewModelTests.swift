//
//  BestSellerViewModelTests.swift
//  makeupStoreTests
//
//  Created by Vania Alfitri on 27/04/2023.
//  Copyright © 2023 Vania Radmila Alfitri. All rights reserved.
//

import XCTest
@testable import makeupStore

final class BestSellerViewModelTests: XCTestCase {
    
    var sut: BestSellerViewModel!
    
    override func setUp() {
       super.setUp()
       let mockMakeup = Makeup(id: 1, name: "Test Makeup")
        sut = BestSellerViewModel(makeup: mockMakeup)
        
    }
    
    func testFetchMakeupName() {
        _ = sut.makeupName
        XCTAssertNotNil(sut, "The name is returned in view model")
    }

}
