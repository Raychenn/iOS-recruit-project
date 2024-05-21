//
//  CourseCollectionViewCell.swift
//  Hahow-iOS-Recruit
//
//  Created by Boray Chen on 2024/5/18.
//

import UIKit

class CourseCollectionViewCell: UICollectionViewCell {
    // MARK: - Properties
    
    private var viewModel: CourseCollectionViewCellViewModel?
    
    enum Constants {
        static let titleFontSize: CGFloat = 15
        static let courseTypeFontSize: CGFloat = 12
        static let subtitleFontSize: CGFloat = 10
    }
    
    private let thumnbnailContainerView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.backgroundColor = .lightGray
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    private let courseTypeButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.contentInsets = .init(top: 5, leading: 5, bottom: 5, trailing: 5)
        let button = UIButton(configuration: config, primaryAction: nil)
        return button
    }()
    
    private let courseTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: Constants.titleFontSize, weight: .bold)
        label.text = "Procreate 插畫入門-從素描到風格"
        label.lineBreakMode = .byCharWrapping
        label.setContentCompressionResistancePriority(.required, for: .horizontal)
        return label
    }()
    
    private let courseInfoContainerStackView: UIStackView = {
       let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 12
        return stack
    }()
    
    private let courseRatingLabel: UILabel = {
        let label = UILabel()
        label.textColor = .orange
        label.font = .systemFont(ofSize: Constants.subtitleFontSize)
        label.text = "Course Name"
        return label
    }()
    
    private let courseRatingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.tintColor = .yellow
        imageView.image = UIImage(systemName: "star.fill")
        imageView.setDimensions(height: 15, width: 15)
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let courseTimeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: Constants.subtitleFontSize)
        label.text = "0"
        return label
    }()
    
    private let courseTimeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.tintColor = .lightGray
        imageView.image = UIImage(systemName: "clock")
        imageView.setDimensions(height: 15, width: 15)
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let courseMembersLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: Constants.subtitleFontSize)
        label.text = "0"
        return label
    }()
    
    private let courseMembersImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.tintColor = .lightGray
        imageView.image = UIImage(systemName: "person")
        imageView.clipsToBounds = true
        imageView.setDimensions(height: 15, width: 15)
        return imageView
    }()
    
    private let courseAccomplishedRatioLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: Constants.subtitleFontSize)
        return label
    }()
    
    private let courseDaysLeftImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.tintColor = .lightGray
        imageView.image = UIImage(systemName: "flame")
        imageView.clipsToBounds = true
        imageView.setDimensions(height: 15, width: 15)
        return imageView
    }()
    
    private let courseDaysLeftLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: Constants.subtitleFontSize)
        return label
    }()
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    
    func configue(with viewModel: CourseCollectionViewCellViewModel) {
        self.viewModel = viewModel
        thumbnailImageView.loadImageUsingCache(withUrl: viewModel.thumbnailImageURLString,
                                               placeHolder: UIImage())
        courseTitleLabel.text = viewModel.title
        if let incubatingInfo = viewModel.incubatingInfo {
            courseAccomplishedRatioLabel.text = "達標 \(incubatingInfo.accomplishedRatioString)%"
            courseDaysLeftLabel.text = "倒數 \(incubatingInfo.numberOfDaysLeft)"
        } else if let publishedInfo = viewModel.publishedInfo {
            courseRatingLabel.text = "\(publishedInfo.averageRating)(\(publishedInfo.totalRating))"
            courseTimeLabel.text = "\(publishedInfo.videoDurationMinutes)分"
            courseMembersLabel.text = "\(publishedInfo.totalTicketsSold)"
        }
        courseTypeButton.setTitle(viewModel.statusText, for: .normal)
        courseTypeButton.configuration?.baseBackgroundColor = viewModel.statusColor
        setupUI(with: viewModel)
    }
    
    func setupUI(with viewModel: CourseCollectionViewCellViewModel) {
        backgroundColor = .brown
        // thumbnail
        thumnbnailContainerView.addSubview(thumbnailImageView)
        thumnbnailContainerView.addSubview(courseTypeButton)
        thumbnailImageView.fillSuperview()
        courseTypeButton.anchor(bottom: thumnbnailContainerView.bottomAnchor,
                               right: thumnbnailContainerView.trailingAnchor)
        contentView.addSubview(thumnbnailContainerView)
        let thumnbnailContainerViewWidth: CGFloat = Interface.isIPad() ? 160 : 100
        let thumnbnailContainerViewHeight: CGFloat = Interface.isIPad() ? 90 : 50
        thumnbnailContainerView.anchor(top: contentView.topAnchor,
                                  left: contentView.leadingAnchor,
                                  width: thumnbnailContainerViewWidth,
                                  height: thumnbnailContainerViewHeight)
        
        // title
        contentView.addSubview(courseTitleLabel)
        courseTitleLabel.anchor(top: thumnbnailContainerView.topAnchor,
                                left: thumnbnailContainerView.trailingAnchor,
                                right: contentView.trailingAnchor,
                                paddingTop: 10,
                                paddingLeft: 10,
                                paddingRight: 10)
        
        // course info
        switch viewModel.status {
        case .incubating:
            courseInfoContainerStackView.addArrangedSubview(makeInfoStackView(with: [
                courseAccomplishedRatioLabel
            ]))
            
            courseInfoContainerStackView.addArrangedSubview(makeInfoStackView(with: [
                courseDaysLeftImageView,
                courseDaysLeftLabel
            ]))
        case .published:
            courseInfoContainerStackView.addArrangedSubview(makeInfoStackView(with: [
                courseRatingImageView,
                courseRatingLabel
            ]))
            
            courseInfoContainerStackView.addArrangedSubview(makeInfoStackView(with: [
                courseTimeImageView,
                courseTimeLabel
            ]))
            
            courseInfoContainerStackView.addArrangedSubview(makeInfoStackView(with: [
                courseMembersImageView,
                courseMembersLabel
            ]))
        case .none:
            break
        }
        contentView.addSubview(courseInfoContainerStackView)
        courseInfoContainerStackView.anchor(top: thumnbnailContainerView.bottomAnchor,
                                            left: courseTitleLabel.leadingAnchor, paddingTop: -20)
    }
    
    func makeInfoStackView(with subviews: [UIView]) -> UIStackView {
        let stack = UIStackView(arrangedSubviews: subviews)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 3
        return stack
    }
}
