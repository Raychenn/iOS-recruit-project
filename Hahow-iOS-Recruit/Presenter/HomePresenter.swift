//
//  HomePresenter.swift
//  Hahow-iOS-Recruit
//
//  Created by Boray Chen on 2024/5/18.
//

import UIKit

protocol HomePresenterDelegate: AnyObject {
    var isLoadingData: ObservableObject<Bool> { get set }
    var errorLoadHomeData: ObservableObject<Error?> { get set }
    var sections: [HomePresenter.SectionType] { get set }
    func numberOfSections() -> Int
    func numberOfRowsInSection(_ section: Int) -> Int
    
}

class HomePresenter: HomePresenterDelegate {
    
    private let interactor: HomeInteractorDelegate
    
    // bindings
    var isLoadingData: ObservableObject<Bool> = ObservableObject(value: false)
    var errorLoadHomeData: ObservableObject<Error?> = ObservableObject(value: nil)
    
    enum SectionType: CaseIterable {
        static var allCases: [SectionType] {
            return [.course(viewModels: []), .article(viewModels: [])]
        }
        
        case course(viewModels: [CourseCollectionViewCellViewModel])
        case article(viewModels: [ArticleCollectionViewCellViewModel])
    }
    
    var sections: [SectionType] = [.course(viewModels: []), .article(viewModels: [])]
    
    init(interactor: HomeInteractorDelegate) {
        self.interactor = interactor
        setupInteractorBinding()
    }
    
    private func setupInteractorBinding() {
        isLoadingData.value = true
        interactor.didLoadHomeData.bind { [weak self] homeData in
            guard let self else { return }
            sections = [
                .course(viewModels: homeData?.courseViewModels ?? []),
                .article(viewModels: homeData?.articleViewModels ?? [])
            ]
            isLoadingData.value = false
        }
        
        interactor.errorLoadHomeData.bind { [weak self] error in
            guard let self else { return }
            errorLoadHomeData.value = error
        }
    }
    
    func numberOfSections() -> Int {
        return SectionType.allCases.count
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        switch SectionType.allCases[section] {
        case .course(viewModels: let courseViewModels):
            return courseViewModels.count
        case .article(viewModels: let articleViewModels):
            return articleViewModels.count
        }
    }
}
