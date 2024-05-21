//
//  Hahow_iOS_RecruitTests.swift
//  Hahow-iOS-RecruitTests
//
//  Created by Tommy Lin on 2021/10/5.
//

import XCTest
@testable import Hahow_iOS_Recruit

class Hahow_iOS_RecruitTests: XCTestCase {

//    override func setUpWithError() throws {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//    }
//
//    override func tearDownWithError() throws {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }
//
//    func testExample() throws {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//    }

    func testDecodeCourseIntoArray() throws {
        do {
            let courses = try JSONDecoder().decode([Course].self, from: testThreeCourseData)
            XCTAssert(courses.count > 0)
            XCTAssertEqual(courses.count, 3)
        } catch {
            XCTFail(error.localizedDescription)
        } 
    }

}
