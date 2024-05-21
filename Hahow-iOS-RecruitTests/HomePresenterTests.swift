//
//  HomeViewModelTests.swift
//  Hahow-iOS-RecruitTests
//
//  Created by Boray Chen on 2024/5/21.
//

import XCTest
@testable import Hahow_iOS_Recruit

class HomePresenterTests: XCTestCase {
    
    func testNumberOfSections() {
        let mockInteractor = MockHomeInteractor()
        let presenter = HomePresenter(interactor: mockInteractor)
        presenter.loadData()
        XCTAssertEqual(presenter.numberOfSections(), 2)
    }
    
    func testOnlyThreeOfRowsForCourses() {
        let mockInteractor = MockHomeInteractor()
        let presenter = HomePresenter(interactor: mockInteractor)
        presenter.loadData()
        XCTAssertEqual(presenter.numberOfRowsInSection(0), 3)
    }
    
    func testMaxThreeOfRowsForCoursesWithIPhone() {
        guard !Interface.isIPad() else { return }
        let mockInteractor = MockHomeInteractor()
        mockInteractor.mockCourseData = testSixCoursesData
        let presenter = HomePresenter(interactor: mockInteractor)
        presenter.loadData()
        XCTAssertEqual(presenter.numberOfRowsInSection(0), 3)
    }
    
    func testMaxFiveOfRowsForCoursesWithIpad() {
        guard Interface.isIPad() else { return }
        let mockInteractor = MockHomeInteractor()
        mockInteractor.mockCourseData = testSixCoursesData
        let presenter = HomePresenter(interactor: mockInteractor)
        presenter.loadData()
        XCTAssertEqual(presenter.numberOfRowsInSection(0), 5)
    }
    
    func testOnlyOneRowForArticles() {
        let mockInteractor = MockHomeInteractor()
        let presenter = HomePresenter(interactor: mockInteractor)
        presenter.loadData()
        XCTAssertEqual(presenter.numberOfRowsInSection(1), 1)
    }
    
    func testMaxSixOfRowsForArticlesWithIpad() {
        guard Interface.isIPad() else { return }
        let mockInteractor = MockHomeInteractor()
        mockInteractor.mockArticleData = testSevenArticlesData
        let presenter = HomePresenter(interactor: mockInteractor)
        presenter.loadData()
        XCTAssertEqual(presenter.numberOfRowsInSection(1), 6)
    }
    
    func testMaxFiveOfRowsForArticlesWithIPhone() {
        guard !Interface.isIPad() else { return }
        let mockInteractor = MockHomeInteractor()
        mockInteractor.mockArticleData = testSevenArticlesData
        let presenter = HomePresenter(interactor: mockInteractor)
        presenter.loadData()
        XCTAssertEqual(presenter.numberOfRowsInSection(1), 5)
    }
}

