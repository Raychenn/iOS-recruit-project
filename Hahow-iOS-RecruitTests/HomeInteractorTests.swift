//
//  HomeInteractorTests.swift
//  Hahow-iOS-RecruitTests
//
//  Created by Boray Chen on 2024/5/21.
//

import XCTest
@testable import Hahow_iOS_Recruit

class HomeInteractorTests: XCTestCase {
    func testSuccessCoursesFetch() {
        let mockLoader = MockDataLoader()
        let expectation = XCTestExpectation(description: "waiting group")
        let interactor = HomeInteractor(loader: mockLoader)
        interactor.loadData()
        interactor.didLoadHomeData.bind { homeData in
            expectation.fulfill()
            XCTAssertEqual(interactor.didLoadHomeData.value?.courses.count, 3)
            XCTAssertEqual(interactor.didLoadHomeData.value?.articles.count, 1)
        }
        
        wait(for: [expectation], timeout: 2)
    }
    
    func testCoursesWithInvalidJSON() {
        let mockLoader = MockDataLoader()
        mockLoader.mockArticleData = testInvalidArticle
        mockLoader.mockCourseData = testInvalidCourse
        let expectation = XCTestExpectation(description: "waiting group")
        let interactor = HomeInteractor(loader: mockLoader)
        interactor.loadData()
        interactor.errorLoadHomeData.bind { error in
            expectation.fulfill()
            if let error = error as? APIError {
                XCTAssertEqual(error, APIError.decodeError(description: "decode failed"))
            } else {
                XCTFail("can not cast to APIError")
            }
        }
        wait(for: [expectation], timeout: 2)
    }
}

class MockDataLoader: DataLoaderProtocol {
    var mockCourseData: Data?
    var mockArticleData: Data?
    
    func load<T>(fileName: String, as type: T.Type, completion: @escaping (Result<T, Error>) -> Void) where T : Decodable {
        switch fileName {
        case "courses":
            do {
                let courses = try JSONDecoder().decode([Course].self, from: mockCourseData ?? testThreeCourseData)
                completion(.success(courses as! T))
            } catch {
                completion(.failure(APIError.decodeError(description: "decode failed")))
            }
        case "articles":
            do {
                let article = try JSONDecoder().decode(StaffPickArticle.self, from: mockArticleData ?? testOneArticle)
                completion(.success(article as! T))
            } catch {
                completion(.failure(APIError.decodeError(description: "decode failed")))
            }
        default:
            break
        }
    }
}

