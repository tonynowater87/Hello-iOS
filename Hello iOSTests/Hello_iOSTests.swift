//
//  Hello_iOSTests.swift
//  Hello iOSTests
//
//  Created by Stan on 2019/8/21.
//  Copyright © 2019 Tony. All rights reserved.
//

import XCTest
@testable import Hello_iOS

class Hello_iOSTests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let firstName = "Tony"
        let lastName = "Liao"
        let age = 30
        let weight = 62.5
        print(String(format: "Name:%@ %@, age:%d(%X), weight: %.0f", firstName, lastName, age, age, weight))
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
