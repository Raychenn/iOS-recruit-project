//
//  ThumbnailCourseCollectionViewCell.swift
//  Hahow-iOS-Recruit
//
//  Created by Boray Chen on 2024/5/18.
//

import UIKit

class ThumbnailCourseCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    private var viewModel: CourseCollectionViewCellViewModel?
    
    enum Constants {
        static let titleFontSize: CGFloat = 15
        static let courseTypeFontSize: CGFloat = 18
        static let subtitleFontSize: CGFloat = 12
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
        // can use a defualt one later
        imageView.image = UIImage()
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
        label.numberOfLines = 2
        label.textColor = .black
        label.font = .systemFont(ofSize: Constants.titleFontSize, weight: .bold)
        label.text = "Procreate 插畫入門-從素描到風格"
        return label
    }()
    
    private let courseInfoContainerStackView: UIStackView = {
       let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 20
        stack.setContentHuggingPriority(.required, for: .horizontal)
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
        imageView.tintColor = .orange
        imageView.image = UIImage(systemName: "star.fill")
        imageView.clipsToBounds = true
        imageView.setDimensions(height: 15, width: 15)
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
        imageView.clipsToBounds = true
        imageView.setDimensions(height: 15, width: 15)
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
    
    private let courseAccomplishedUnderlineView: UIView = {
       let view = UIView()
        view.backgroundColor = .orange
        return view
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
            courseDaysLeftLabel.text = "倒數 \(incubatingInfo.numberOfDaysLeft) 天"
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
        courseInfoContainerStackView.arrangedSubviews.forEach({ courseInfoContainerStackView.removeArrangedSubview($0) })
        // thumbnail
        thumnbnailContainerView.addSubview(thumbnailImageView)
        thumnbnailContainerView.addSubview(courseTypeButton)
        thumbnailImageView.fillSuperview()
        courseTypeButton.anchor(bottom: thumnbnailContainerView.bottomAnchor,
                               right: thumnbnailContainerView.trailingAnchor)
        contentView.addSubview(thumnbnailContainerView)
        let thumnbnailContainerViewHeight: CGFloat = Interface.isIPad() ? 500 : 300
        thumnbnailContainerView.anchor(top: contentView.topAnchor,
                                  left: contentView.leadingAnchor,
                                  right: contentView.trailingAnchor,
                                  height: thumnbnailContainerViewHeight)
        
        // title
        contentView.addSubview(courseTitleLabel)
        courseTitleLabel.anchor(top: thumnbnailContainerView.bottomAnchor,
                                left: contentView.leadingAnchor,
                                right: contentView.trailingAnchor,
                                paddingTop: 20,
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
        courseInfoContainerStackView.anchor(top: courseTitleLabel.bottomAnchor,
                                            left: courseTitleLabel.leadingAnchor,
                                            paddingTop: 20)
        
        switch viewModel.status {
        case .incubating:
            contentView.addSubview(courseAccomplishedUnderlineView)
            courseAccomplishedUnderlineView.anchor(top: courseAccomplishedRatioLabel.bottomAnchor, left: courseAccomplishedRatioLabel.leadingAnchor, right: courseAccomplishedRatioLabel.trailingAnchor, height: 4)
        default:
            break
        }
    }
    
    func makeInfoStackView(with subviews: [UIView]) -> UIStackView {
        let stack = UIStackView(arrangedSubviews: subviews)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 3
        return stack
    }
}
