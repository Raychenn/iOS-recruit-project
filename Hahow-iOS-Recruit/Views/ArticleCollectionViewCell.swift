//
//  ArticleCollectionViewCell.swift
//  Hahow-iOS-Recruit
//
//  Created by Boray Chen on 2024/5/18.
//

import UIKit

class ArticleCollectionViewCell: UICollectionViewCell {
    enum Constants {
        static let titleFontSize: CGFloat = 15
        static let subtitleFontSize: CGFloat = 12
    }
        
    private let articleThumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.backgroundColor = .lightGray
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 5
        return imageView
    }()
    
    private let articleTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.font = .systemFont(ofSize: Constants.titleFontSize, weight: .bold)
        return label
    }()
    
    private let articleSubtitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: Constants.subtitleFontSize)
        return label
    }()
    
    private let articleInfoContainerStackView: UIStackView = {
       let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 15
        return stack
    }()
    
    private let articleCreatorProfileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.setDimensions(height: 20, width: 20)
        imageView.layer.cornerRadius = imageView.frame.height / 2
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let articleCreatorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: Constants.subtitleFontSize)
        return label
    }()
    
    private let articleViewCountImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.tintColor = .lightGray
        imageView.image = UIImage(systemName: "eye")
        imageView.setDimensions(height: 20, width: 20)
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let articleViewCountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: Constants.subtitleFontSize)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    
    func configue(with viewModel: ArticleCollectionViewCellViewModel) {
        articleTitleLabel.text = viewModel.title
        articleSubtitleLabel.text = viewModel.subtitle
        articleCreatorProfileImageView.loadImageUsingCache(withUrl: viewModel.creatorProfileImageURLString, placeHolder: UIImage())
        articleCreatorLabel.text = viewModel.creator
        articleViewCountLabel.text = "\(viewModel.viewCounts)"
        articleThumbnailImageView.loadImageUsingCache(withUrl: viewModel.articleImageURLString, placeHolder: UIImage())
    }
    
    private func setupUI() {
        contentView.addSubview(articleTitleLabel)
        articleTitleLabel.anchor(top: contentView.topAnchor,
                                 left: contentView.leadingAnchor,
                                 right: contentView.trailingAnchor,
                                 paddingTop: 10,
                                 paddingLeft: 5,
                                 paddingRight: 10)
        
        contentView.addSubview(articleThumbnailImageView)
        articleThumbnailImageView.anchor(top: articleTitleLabel.bottomAnchor,
                                         right: contentView.trailingAnchor,
                                         paddingTop: 7,
                                         paddingRight: 10,
                                         width: 150,
                                         height: 90)

        contentView.addSubview(articleSubtitleLabel)
        articleSubtitleLabel.anchor(top: articleThumbnailImageView.topAnchor,
                                    left: articleTitleLabel.leadingAnchor,
                                    right: articleThumbnailImageView.leadingAnchor,
                                    paddingTop: 10,
                                    paddingRight: 5)

        articleInfoContainerStackView.addArrangedSubview(makeInfoStackView(with: [
            articleCreatorProfileImageView,
            articleCreatorLabel
        ], spacing: 10))
        
        articleInfoContainerStackView.addArrangedSubview(makeInfoStackView(with: [
            articleViewCountImageView,
            articleViewCountLabel
        ], spacing: 5))
        contentView.addSubview(articleInfoContainerStackView)
        articleInfoContainerStackView.anchor(left: articleSubtitleLabel.leadingAnchor, bottom: articleThumbnailImageView.bottomAnchor, paddingTop: 15, paddingBottom: 10)
    }
    
    func makeInfoStackView(with subviews: [UIView], spacing: CGFloat) -> UIStackView {
        let stack = UIStackView(arrangedSubviews: subviews)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = spacing
        return stack
    }

}
