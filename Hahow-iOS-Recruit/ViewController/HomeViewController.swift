//
//  ViewController.swift
//  Hahow-iOS-Recruit
//
//  Created by Tommy Lin on 2021/10/5.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: - Properties
    
    private let presenter: HomePresenterDelegate
    
    private let refreshControl = UIRefreshControl()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.refreshControl = refreshControl
        collectionView.refreshControl?.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        collectionView.register(ThumbnailCourseCollectionViewCell.self, forCellWithReuseIdentifier: ThumbnailCourseCollectionViewCell.className())
//        collectionView.register(HomeProfileCell.self, forCellWithReuseIdentifier: HomeProfileCell.identifier)
        return collectionView
    }()
    
    required init(presenter: HomePresenterDelegate) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        swtupUI()
        setupBindings()
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
    
    // MARK: - selectors
    
    @objc func refreshData() {
        
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
        let sectionType = presenter.sections[indexPath.section]
        if indexPath.section == 0, indexPath.row == 0 {
            guard let thumbnailCell = collectionView.dequeueReusableCell(withReuseIdentifier: ThumbnailCourseCollectionViewCell.className(),
                                                                         for: indexPath) as? ThumbnailCourseCollectionViewCell else { return UICollectionViewCell() }
            switch sectionType {
            case .course(viewModels: let courseViewModels):
                let thumbnailVM = courseViewModels[indexPath.row]
                thumbnailCell.configue(with: thumbnailVM)
            default:
                break
            }
            return thumbnailCell
        }
        
        return UICollectionViewCell()
    }
    
}

// MARK: - UICollectionViewDelegateFlowLayout

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let isThumbnail = indexPath.section == 0 && indexPath.row == 0
        if isThumbnail, Interface.isIPad() {
            return CGSize(width: UIScreen.main.bounds.width, height: 500)
        } else if isThumbnail, !Interface.isIPad() {
            return CGSize(width: UIScreen.main.bounds.width, height: 300)
        } else if !isThumbnail, Interface.isIPad() {
            // refactor padding to constants
            return CGSize(width: (UIScreen.main.bounds.width / 2) - 10, height: 200)
        } else {
            return CGSize(width: UIScreen.main.bounds.width - 10, height: 200)
        }
    }
}
