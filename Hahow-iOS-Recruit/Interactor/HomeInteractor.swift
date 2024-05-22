//
//  HomeInteractor.swift
//  Hahow-iOS-Recruit
//
//  Created by Boray Chen on 2024/5/18.
//

import UIKit

protocol HomeInteractorProtocol {
    var didLoadHomeData: ObservableObject<HomeData?> { get set }
    var errorLoadHomeData: ObservableObject<Error?> { get set }
    func loadData()
}

struct HomeData {
    let courses: [Course]
    let articles: [Article]
}

/*
 Responsible for 
 1. handling view actions,
 2. performing business logics
 3. fetching data from network or a local database, processing it, and returning it to the presenter.
*/
class HomeInteractor: HomeInteractorProtocol {
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
                DispatchQueue.main.async {
                    self.errorLoadHomeData.value = error
                }
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
                DispatchQueue.main.async {
                    self.errorLoadHomeData.value = error
                }
            }
        }

        group.notify(queue: .main) {
            self.didLoadHomeData.value = HomeData(courses: self.courses ?? [], articles: self.articles ?? [])
        }
    }
}
