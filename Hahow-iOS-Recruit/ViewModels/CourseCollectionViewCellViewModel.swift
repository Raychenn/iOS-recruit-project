//
//  ThumbnailCourseCollectionViewCellViewModel.swift
//  Hahow-iOS-Recruit
//
//  Created by Boray Chen on 2024/5/18.
//

import UIKit

struct CourseCollectionViewCellViewModel {
    let thumbnailImageURLString: String
    let title: String
    let status: HomePresenter.Status
    let statusText: String
    let statusColor: UIColor
    let incubatingInfo: IncubatingInfo?
    let publishedInfo: PublishedInfo?
}

struct IncubatingInfo {
    let accomplishedRatioString: String
    let numberOfDaysLeft: Int
}

struct PublishedInfo {
    let averageRating: Double
    let totalRating: Int
    let videoDurationMinutes: Int
    let totalTicketsSold: Int
}

