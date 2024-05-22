//
//  ViewController.swift
//  Hahow-iOS-Recruit
//
//  Created by Tommy Lin on 2021/10/5.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: - Properties
    
    private let presenter: HomePresenterProtocol
        
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ThumbnailCourseCollectionViewCell.self, forCellWithReuseIdentifier: ThumbnailCourseCollectionViewCell.className())
        collectionView.register(CourseCollectionViewCell.self, forCellWithReuseIdentifier: CourseCollectionViewCell.className())
        collectionView.register(ArticleCollectionViewCell.self, forCellWithReuseIdentifier: ArticleCollectionViewCell.className())
        collectionView.register(HomeCollectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HomeCollectionHeaderView.className())
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return collectionView
    }()
    
    required init(presenter: HomePresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        swtupUI()
        setupBindings()
        presenter.loadData()
    }

    // MARK: - Helpers
    
    private func swtupUI() {
        view.backgroundColor = .white
        collectionView.backgroundColor = .white
        view.addSubview(collectionView)
        collectionView.fillSuperview()
    }
    
    private func setupBindings() {
        presenter.isLoadingData.bind { [weak self] isLoading in
            guard let self else { return }
            
            if isLoading {
                self.presentLoadingView(show: isLoading)
            } else {
                self.collectionView.reloadData()
            }
        }
        
        presenter.errorLoadHomeData.bind { error in
            print("error loading data: \(String(describing: error))")
        }
    }
    
    // MARK: - orientation
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)        
        collectionView.collectionViewLayout.invalidateLayout()
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if Interface.isIPad() {
            return .all
        } else {
            return .portrait
        }
    }
}

// MARK: - UICollectionViewDataSource

extension HomeViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        presenter.numberOfSections()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.numberOfRowsInSection(section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let defaultCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        let sectionType = presenter.sections[indexPath.section]
        
        if indexPath.section == 0, indexPath.row == 0 {
            guard let thumbnailCell = collectionView.dequeueReusableCell(withReuseIdentifier: ThumbnailCourseCollectionViewCell.className(),
                                                                         for: indexPath) as? ThumbnailCourseCollectionViewCell else { return UICollectionViewCell() }
            switch sectionType {
            case .course(viewModels: let courseViewModels):
                let thumbnailVM = courseViewModels[indexPath.row]
                thumbnailCell.configue(with: thumbnailVM)
                return thumbnailCell
            default:
                return defaultCell
            }
        }
        else if indexPath.section == 0 {
            guard let courseCell = collectionView.dequeueReusableCell(withReuseIdentifier: CourseCollectionViewCell.className(),
                                                                         for: indexPath) as? CourseCollectionViewCell else { return UICollectionViewCell() }
            switch sectionType {
            case .course(viewModels: let courseViewModels):
                let courseCellVM = courseViewModels[indexPath.row]
                courseCell.configue(with: courseCellVM)
                return courseCell
            default:
                return defaultCell
            }
        } else {
            guard let articleCell = collectionView.dequeueReusableCell(withReuseIdentifier: ArticleCollectionViewCell.className(),
                                                                         for: indexPath) as? ArticleCollectionViewCell else { return UICollectionViewCell() }
            switch sectionType {
            case .article(viewModels: let articleViewModels):
                let articleVM = articleViewModels[indexPath.row]
                articleCell.configue(with: articleVM)
                return articleCell
            default:
                return defaultCell
            }
        }
    }
}

// MARK: - UICollectionViewDelegate

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HomeCollectionHeaderView.className(), for: indexPath) as? HomeCollectionHeaderView else {
                return UICollectionReusableView()
            }
            let sectionType = presenter.sections[indexPath.section]
            switch sectionType {
            case .course(viewModels: _):
                headerView.configure(with: "熱門課程")
            case .article(viewModels: _):
                headerView.configure(with: "精選文章")
            }
            return headerView
        }
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        1
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let isThumbnail = indexPath.section == 0 && indexPath.row == 0
        if isThumbnail, Interface.isIPad() {
            return CGSize(width: UIScreen.main.bounds.width, height: 500)
        } else if isThumbnail, !Interface.isIPad() {
            return CGSize(width: UIScreen.main.bounds.width, height: 400)
        } else if !isThumbnail, Interface.isIPad() {
            // refactor padding to constants
            return CGSize(width: (UIScreen.main.bounds.width / 2) - 20, height: 150)
        } else if indexPath.section == 0 && indexPath.row > 0 {
            return CGSize(width: UIScreen.main.bounds.width, height: 110)
        } else {
            return CGSize(width: UIScreen.main.bounds.width, height: 160)
        }
    }
}


