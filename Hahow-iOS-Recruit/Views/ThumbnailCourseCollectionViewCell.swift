//
//  ThumbnailCourseCollectionViewCell.swift
//  Hahow-iOS-Recruit
//
//  Created by Boray Chen on 2024/5/18.
//

import UIKit

class ThumbnailCourseCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    enum Constants {
        static let titleFontSize: CGFloat = 20
        static let courseTypeFontSize: CGFloat = 18
        static let subtitleFontSize: CGFloat = 15
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
    
    private let courseTypeLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .tiffanyBlue
        label.textColor = .white
        label.clipsToBounds = true
        label.layer.cornerRadius = 5
        label.layer.maskedCorners = [.layerMinXMinYCorner]
        label.font = .systemFont(ofSize: Constants.courseTypeFontSize)
        label.textAlignment = .center
        label.text = "Course Type"
        return label
    }()
    
    private let courseTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: Constants.titleFontSize, weight: .bold)
        label.text = "Procreate 插畫入門-從素描到風格"
        return label
    }()
    
    private let courseInfoContainerStackView: UIStackView = {
       let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 20
        return stack
    }()
    
    private let courseRatingLabel: UILabel = {
        let label = UILabel()
        label.textColor = .yellow
        label.font = .systemFont(ofSize: Constants.subtitleFontSize)
        label.text = "Course Name"
        return label
    }()
    
    private let courseRatingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.tintColor = .yellow
        imageView.image = UIImage(systemName: "star.fill")
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
        return imageView
    }()
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    
    func configue(with viewModel: CourseCollectionViewCellViewModel) {
        thumbnailImageView.loadImageUsingCache(withUrl: viewModel.thumbnailImageURLString,
                                               placeHolder: UIImage())
        courseTitleLabel.text = viewModel.title
        courseRatingLabel.text = "\(viewModel.averageRating)(\(viewModel.totalRatings)"
        courseTimeLabel.text = "\(viewModel.videoDurationMinutes)分"
        courseMembersLabel.text = "\(viewModel.totalTicketsSold)"
    }
    
    func setupUI() {
        // thumbnail
        thumnbnailContainerView.addSubview(thumbnailImageView)
        thumnbnailContainerView.addSubview(courseTypeLabel)
        thumbnailImageView.fillSuperview()
        courseTypeLabel.anchor(bottom: thumnbnailContainerView.bottomAnchor,
                               right: thumnbnailContainerView.trailingAnchor)
        contentView.addSubview(thumnbnailContainerView)
        thumnbnailContainerView.anchor(top: contentView.topAnchor,
                                  left: contentView.leadingAnchor,
                                  right: contentView.trailingAnchor,
                                  height: 300)
        
        // title
        contentView.addSubview(courseTitleLabel)
        courseTitleLabel.anchor(top: thumnbnailContainerView.bottomAnchor,
                                left: contentView.leadingAnchor,
                                right: contentView.trailingAnchor,
                                paddingTop: 15,
                                paddingLeft: 10,
                                paddingRight: 10)
        
        // course info
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
        
        contentView.addSubview(courseInfoContainerStackView)
        courseInfoContainerStackView.anchor(top: courseTitleLabel.bottomAnchor, left: courseTitleLabel.leadingAnchor, paddingTop: 10)
    }
    
    func makeInfoStackView(with subviews: [UIView]) -> UIStackView {
        let stack = UIStackView(arrangedSubviews: subviews)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 3
        return stack
    }
}

// MARK: - Constants (use enum)
// note: should have a course type (INCUBATING, PUBLISHED) enum as well
