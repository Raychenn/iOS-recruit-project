//
//  HomeInteractor.swift
//  Hahow-iOS-Recruit
//
//  Created by Boray Chen on 2024/5/18.
//

import Foundation

protocol HomeInteractorDelegate {
    var didLoadHomeData: ObservableObject<HomeData?> { get set }
    var errorLoadHomeData: ObservableObject<Error?> { get set }
}

struct HomeData {
    let courseViewModels: [CourseCollectionViewCellViewModel]
    let articleViewModels: [ArticleCollectionViewCellViewModel]
}

class HomeInteractor: HomeInteractorDelegate {
    private let loader: DataLoaderProtocol
    
    private let group = DispatchGroup()
    
    private var courses: [Course]?
    
    private var articles: [Article]?
    
    var didLoadHomeData: ObservableObject<HomeData?> = ObservableObject(value: nil)
    var errorLoadHomeData: ObservableObject<Error?> = ObservableObject(value: nil)
    
    // should init with data loader protocol
    init(loader: DataLoaderProtocol) {
        self.loader = loader
    }
    
    func loadData() {
        group.enter()
        loader.load(fileName: "courses", as: [Course].self) { [weak self] result in
            guard let self else { return }
            defer {
                // Leave the dispatch group when the task finishes, even if there's an error
                self.group.leave()
            }
            switch result {
            case .success(let courses):
                self.courses = courses
            case .failure(let error):
                errorLoadHomeData.value = error
            }
        }

        group.enter()
        loader.load(fileName: "articles", as: StaffPickArticle.self) { result in
            defer {
                self.group.leave()
            }
            switch result {
            case .success(let articles):
                self.articles = articles.staffPickArticles
            case .failure(let error):
                self.errorLoadHomeData.value = error
            }
        }

        group.notify(queue: .main) {
            self.didLoadHomeData.value = HomeData(courseViewModels: self.map(self.courses),
                                                  articleViewModels: self.map(self.articles))
        }
    }
    
    private func map(_ courses: [Course]?) -> [CourseCollectionViewCellViewModel] {
        return courses?.compactMap { course in
            return CourseCollectionViewCellViewModel(thumbnailImageURLString: course.coverImage.url,
                                                     title: course.title,
                                                     averageRating: course.averageRating,
                                                     totalRatings: course.numRating,
                                                     videoDurationMinutes: convertToMinutes(from: course.totalVideoLengthInSeconds),
                                                     totalTicketsSold: course.numSoldTickets)
        } ?? []
    }
    
    private func map(_ articles: [Article]?) -> [ArticleCollectionViewCellViewModel] {
        return articles?.compactMap { article in
            return ArticleCollectionViewCellViewModel(articleImageURLString: article.coverImage.url,
                                                      title: article.title,
                                                      subtitle: article.previewDescription,
                                                      creator: article.creator.name,
                                                      creatorProfileImageURLString: article.creator.profileImageUrl,
                                                      viewCounts: article.viewCount)
        } ?? []
    }
    
    private func convertToMinutes(from seconds: Int) -> Int {
        seconds / 60
    }
}
