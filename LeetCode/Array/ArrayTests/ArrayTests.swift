//
//  ArrayTests.swift
//  ArrayTests
//
//  Created by Csy on 2019/1/7.
//  Copyright © 2019 CXL. All rights reserved.
//

import XCTest
@testable import Array

class ArrayTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test167TwoSum2() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let answer = TwoSum2()
        let result = answer.solution1([2, 7, 11, 15], 9)
        XCTAssertEqual(result, [1,2])
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
