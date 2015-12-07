//
//  FailingTestTests.swift
//  FailingTestTests
//
//  Created by Matthew Yohe on 12/6/15.
//  Copyright © 2015 mattyohe. All rights reserved.
//

import XCTest
@testable import FailingTest

class FailingTestTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testPassingTest() {
        XCTAssert(true)
    }
    
    func testBreakingATest() {

        let expect = self.expectationWithDescription("Expectation")
        dispatch_async(dispatch_queue_create("Label", DISPATCH_QUEUE_CONCURRENT)) {
            sleep(2)
            expect.fulfill()
            expect.fulfill()
        }

        self.waitForExpectationsWithTimeout(1, handler: nil)
        sleep(5)
    }

    func testPassingAnotherTest() {
        XCTAssert(true)
    }
}
