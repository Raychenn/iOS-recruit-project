//
//  HomeCollectionHeaderView.swift
//  Hahow-iOS-Recruit
//
//  Created by Boray Chen on 2024/5/19.
//

import UIKit

class HomeCollectionHeaderView: UICollectionReusableView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        // Add and configure UI elements
        addSubview(titleLabel)
        titleLabel.centerY(inView: self)
        titleLabel.anchor(left: leadingAnchor, paddingLeft: 10)
    }
    
    func configure(with title: String) {
        titleLabel.text = title
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
