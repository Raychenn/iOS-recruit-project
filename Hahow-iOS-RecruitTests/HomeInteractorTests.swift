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
        let interactor = MockHomeInteractor()
        interactor.loadData()
        
        XCTAssertEqual(interactor.didLoadHomeData.value?.courses.count, 3)
        XCTAssertEqual(interactor.didLoadHomeData.value?.articles.count, 1)
    }
    
    func testCoursesWithInvalidJSON() {
        let interactor = MockHomeInteractor()
        interactor.mockArticleData = testInvalidArticle
        interactor.loadData()
        XCTAssertEqual(interactor.didLoadHomeData.value?.articles.count, 0)
    }
}

class MockHomeInteractor: HomeInteractorProtocol {
    
    var mockCourseData: Data?
    var mockArticleData: Data?
    
    var didLoadHomeData: Hahow_iOS_Recruit.ObservableObject<Hahow_iOS_Recruit.HomeData?> = ObservableObject(value: nil)
    
    var errorLoadHomeData: Hahow_iOS_Recruit.ObservableObject<Error?> = ObservableObject(value: nil)
    
    func loadData() {
        let courses = try? JSONDecoder().decode([Course].self, from: mockCourseData ?? testThreeCourseData)
        let article = try? JSONDecoder().decode(StaffPickArticle.self, from: mockArticleData ?? testOneArticle)
        let mockHomeData = Hahow_iOS_Recruit.HomeData(courses: courses ?? [], articles: article?.staffPickArticles ?? [])
        didLoadHomeData.value = mockHomeData
    }
}

