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
        mockInteractor.homeData = HomeData(courses: makeCourses(amount: 3), articles: [])
        let presenter = HomePresenter(interactor: mockInteractor)
        presenter.loadData()
        XCTAssertEqual(presenter.numberOfRowsInSection(0), 3)
    }
    
    func testMaxThreeOfRowsForCoursesWithIPhone() {
        guard !Interface.isIPad() else { return }
        let mockInteractor = MockHomeInteractor()
        mockInteractor.homeData = HomeData(courses: makeCourses(amount: 6), articles: [])
        let presenter = HomePresenter(interactor: mockInteractor)
        presenter.loadData()
        XCTAssertEqual(presenter.numberOfRowsInSection(0), 3)
    }
    
    func testMaxFiveOfRowsForCoursesWithIpad() {
        guard Interface.isIPad() else { return }
        let mockInteractor = MockHomeInteractor()
        mockInteractor.homeData = HomeData(courses: makeCourses(amount: 6), articles: [])
        let presenter = HomePresenter(interactor: mockInteractor)
        presenter.loadData()
        XCTAssertEqual(presenter.numberOfRowsInSection(0), 5)
    }
    
    func testOnlyOneRowForArticles() {
        let mockInteractor = MockHomeInteractor()
        mockInteractor.homeData = HomeData(courses: [], articles: makeArticles(amount: 1))
        let presenter = HomePresenter(interactor: mockInteractor)
        presenter.loadData()
        XCTAssertEqual(presenter.numberOfRowsInSection(1), 1)
    }
    
    func testMaxSixOfRowsForArticlesWithIpad() {
        guard Interface.isIPad() else { return }
        let mockInteractor = MockHomeInteractor()
        mockInteractor.homeData = HomeData(courses: [], articles: makeArticles(amount: 7))
        let presenter = HomePresenter(interactor: mockInteractor)
        presenter.loadData()
        XCTAssertEqual(presenter.numberOfRowsInSection(1), 6)
    }
    
    func testMaxThreeOfRowsForArticlesWithIPhone() {
        guard !Interface.isIPad() else { return }
        let mockInteractor = MockHomeInteractor()
        mockInteractor.homeData = HomeData(courses: [], articles: makeArticles(amount: 7))
        let presenter = HomePresenter(interactor: mockInteractor)
        presenter.loadData()
        XCTAssertEqual(presenter.numberOfRowsInSection(1), 3)
    }
    
    // MARK: - Helpers
    
    func makeCourses(amount: Int) -> [Course] {
        var result: [Course] = []
        for _ in 0..<amount {
            let course = Course(id: "",
                                status: "",
                                successCriteria: Course.SuccessCriteria(numSoldTickets: 0),
                                numSoldTickets: 0,
                                averageRating: 0,
                                numRating: 0,
                                title: "",
                                coverImage: Course.CoverImage(id: "", url: "", height: 0, width: 0),
                                totalVideoLengthInSeconds: 0,
                                createdAt: "",
                                incubateTime: "",
                                publishTime: "",
                                proposalDueTime: "")
            result.append(course)
        }
        return result
    }
    
    func makeArticles(amount: Int) -> [Article] {
        var result: [Article] = []
        for _ in 0..<amount {
            let article = Article(id: "",
                                  title: "",
                                  coverImage: Article.CoverImage(id: "", url: ""),
                                  previewDescription: "",
                                  creator: Article.Creator(id: "", name: "", profileImageUrl: ""),
                                  viewCount: 0,
                                  createdAt: "",
                                  updatedAt: "",
                                  publishedAt: "")
            result.append(article)
        }
        return result
    }
}

class MockHomeInteractor: HomeInteractorProtocol {
    
    var homeData: HomeData?
    
    var homeError: Error?
    
    var didLoadHomeData: Hahow_iOS_Recruit.ObservableObject<Hahow_iOS_Recruit.HomeData?> = ObservableObject(value: nil)
    
    var errorLoadHomeData: Hahow_iOS_Recruit.ObservableObject<Error?> = ObservableObject(value: nil)
    
    func loadData() {
        if let homeError {
            errorLoadHomeData.value = homeError
        } else if let homeData {
            didLoadHomeData.value = homeData
        } else {
            errorLoadHomeData.value = APIError.unknownError(description: "should set at least one value to mock")
        }
    }
}

