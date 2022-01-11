//
//  MasterQueryTest.swift
//  DemoTestTests
//
//  Created by Reetika sharma on 10/01/22.
//

import XCTest
@testable import DemoTest

class MasterQueryTest: XCTestCase {
    
    var sut: MasterViewModel!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = MasterViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testAPIIsCalledAsync() {
        var apiResult:Result<MasterDetailData?,Error>?
        sut.request { result in
            apiResult = result
            XCTAssertNotNil(apiResult)
        }
    }
}
