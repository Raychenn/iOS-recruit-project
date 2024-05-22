//
//  HomePresenter.swift
//  Hahow-iOS-Recruit
//
//  Created by Boray Chen on 2024/5/18.
//

import UIKit

protocol HomePresenterProtocol: AnyObject {
    var isLoadingData: ObservableObject<Bool> { get set }
    var errorLoadHomeData: ObservableObject<Error?> { get set }
    var sections: [HomePresenter.SectionType] { get set }
    func numberOfSections() -> Int
    func numberOfRowsInSection(_ section: Int) -> Int
    func loadData()
}

// Presenter is similar to ViewModel has below responsibilities
/*
  1. acts as an intermediary between the view and the interactor.
  2. receives input from the view (user actions, such as button taps and translates it into commands for the interactor.
  3. receives data from the interactor and formats it for presentation in the view.
  4. responsible for updating the view's state based on the data received from the interactor.
*/
class HomePresenter: HomePresenterProtocol {
    
    private let interactor: HomeInteractorProtocol
    // bindings
    var isLoadingData: ObservableObject<Bool> = ObservableObject(value: false)
    var errorLoadHomeData: ObservableObject<Error?> = ObservableObject(value: nil)
    
    enum Status: String {
        case incubating = "INCUBATING"
        case published = "PUBLISHED"
        case none
        
        func description() -> String {
            switch self {
            case .incubating:
                return "募資中"
            case .published:
                return "已開課"
            case .none:
                return ""
            }
        }
        
        func statusColor() -> UIColor {
            switch self {
            case .incubating:
                return .orange
            case .published:
                return .tiffanyBlue
            case .none:
                return .clear
            }
        }
    }
    enum SectionType: CaseIterable {
        static var allCases: [SectionType] {
            return [.course(viewModels: []), .article(viewModels: [])]
        }
        
        case course(viewModels: [CourseCollectionViewCellViewModel])
        case article(viewModels: [ArticleCollectionViewCellViewModel])
    }
    
    var sections: [SectionType] = [.course(viewModels: []), .article(viewModels: [])]
    
    init(interactor: HomeInteractorProtocol) {
        self.interactor = interactor
        setupInteractorBinding()
    }
    
    // MARK: - helpers
    
    func loadData() {
        interactor.loadData()
    }
    
    func numberOfSections() -> Int {
        return SectionType.allCases.count
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        switch sections[section] {
        case .course(viewModels: let courseViewModels):
            if Interface.isIPad() {
                return courseViewModels.count > 5 ? 5 : courseViewModels.count
            } else {
                return courseViewModels.count > 3 ? 3 : courseViewModels.count
            }
        case .article(viewModels: let articleViewModels):
            if Interface.isIPad() {
                return articleViewModels.count > 6 ? 6 : articleViewModels.count
            } else {
                return articleViewModels.count > 3 ? 3 : articleViewModels.count
            }
        }
    }
}

// MARK: - private helpers

private extension HomePresenter {
    func setupInteractorBinding() {
        isLoadingData.value = true
        interactor.didLoadHomeData.bind { [weak self] homeData in
            guard let self else { return }
            sections = [
                .course(viewModels: self.map(homeData?.courses)),
                .article(viewModels: self.map(homeData?.articles))
            ]
            isLoadingData.value = false
        }
        
        interactor.errorLoadHomeData.bind { [weak self] error in
            guard let self else { return }
            errorLoadHomeData.value = error
        }
    }
    
   func map(_ courses: [Course]?) -> [CourseCollectionViewCellViewModel] {
         return courses?.compactMap { course in
             let status = Status(rawValue: course.status) ?? .none
             let accomplishedRatio = calculateAccomplishedRatio(with: course.numSoldTickets,
                                                                and: course.successCriteria.numSoldTickets)
             let numberOfDaysLeft = calculateNumberOfDays(from: course.proposalDueTime)
             let incubatingInfo = IncubatingInfo(accomplishedRatioString: accomplishedRatio,
                                                 numberOfDaysLeft: numberOfDaysLeft)
             
             let videoDurationInMinutes = convertToMinutes(from: course.totalVideoLengthInSeconds)
             let publishedInfo = PublishedInfo(averageRating: course.averageRating,
                                               totalRating: course.numRating,
                                               videoDurationMinutes: videoDurationInMinutes,
                                               totalTicketsSold: course.numSoldTickets)
             
             switch status {
             case .incubating:
                 return CourseCollectionViewCellViewModel(thumbnailImageURLString: course.coverImage.url,
                                                   title: course.title,
                                                   status: status,
                                                   statusText: status.description(),
                                                   statusColor: Status(rawValue: course.status)?.statusColor() ?? .clear,
                                                   incubatingInfo: incubatingInfo,
                                                   publishedInfo: nil)
             case .published:
                 return CourseCollectionViewCellViewModel(thumbnailImageURLString: course.coverImage.url,
                                                   title: course.title,
                                                   status: status,
                                                   statusText: status.description(),
                                                   statusColor: Status(rawValue: course.status)?.statusColor() ?? .clear,
                                                   incubatingInfo: nil,
                                                   publishedInfo: publishedInfo)
             case .none:
                 return CourseCollectionViewCellViewModel(thumbnailImageURLString: course.coverImage.url,
                                                   title: course.title,
                                                   status: status,
                                                   statusText: status.description(),
                                                   statusColor: Status(rawValue: course.status)?.statusColor() ?? .clear,
                                                   incubatingInfo: nil,
                                                   publishedInfo: nil)
             }
         } ?? []
     }
     
    func map(_ articles: [Article]?) -> [ArticleCollectionViewCellViewModel] {
         return articles?.compactMap { article in
             return ArticleCollectionViewCellViewModel(articleImageURLString: article.coverImage.url,
                                                       title: article.title,
                                                       subtitle: article.previewDescription,
                                                       creator: article.creator.name,
                                                       creatorProfileImageURLString: article.creator.profileImageUrl,
                                                       viewCounts: article.viewCount)
         } ?? []
     }
     
    func convertToMinutes(from seconds: Int) -> Int {
         seconds / 60
    }
    
    func calculateAccomplishedRatio(with soldTickets: Int, and successCriteria: Int) -> String {
        return String(format: "%.3f", Double(soldTickets) / Double(successCriteria))
    }
    
    func calculateNumberOfDays(from dateString: String) -> Int {
        let dateFormatter = ISO8601DateFormatter()
        // Parse the target date string into a Date object
        if let targetDate = dateFormatter.date(from: dateString) {
            let currentDate = Date()
            let calendar = Calendar.current
            let components = calendar.dateComponents([.day], from: currentDate, to: targetDate)
            
            if let daysLeft = components.day {
                print("Number of days left: \(daysLeft)")
                return daysLeft
            } else {
                return 0
            }
        } else {
           return 0
        }
    }
}
