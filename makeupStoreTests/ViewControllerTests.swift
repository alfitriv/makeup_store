//
//  ViewControllerTests.swift
//  makeupStoreTests
//
//  Created by Vania Alfitri on 25/04/2023.
//  Copyright © 2023 Vania Radmila Alfitri. All rights reserved.
//

import XCTest
@testable import makeupStore

final class ViewControllerTests: XCTestCase {

    var sut: ViewController!
    var mockMakeupService: MockMakeupService!
    
    override func setUp() {
        super.setUp()
        mockMakeupService = MockMakeupService()
        sut = ViewController(networkLayer: mockMakeupService)
    }
    
    func testFetchMakeupIsInvokedInViewDidLoad() {
        _ = sut.view
        XCTAssertTrue(mockMakeupService.isMakeupListFetched)
    }

}
