//
//  Article.swift
//  Hahow-iOS-Recruit
//
//  Created by Boray Chen on 2024/5/18.
//

import Foundation

struct StaffPickArticle: Codable  {
    let staffPickArticles: [Article]
}

struct Article: Codable {
    let id: String
    let title: String
    let coverImage: CoverImage
    let previewDescription: String
    let creator: Creator
    let viewCount: Int
    let createdAt: String
    let updatedAt: String
    let publishedAt: String
    
    struct CoverImage: Codable {
        let id: String
        let url: String
        
        enum CodingKeys: String, CodingKey {
            case id = "_id"
            case url
        }
    }
    
    struct Creator: Codable {
        let id: String
        let name: String
        let profileImageUrl: String
        
        enum CodingKeys: String, CodingKey {
            case id = "_id"
            case name
            case profileImageUrl
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case title
        case coverImage
        case previewDescription
        case creator
        case viewCount
        case createdAt
        case updatedAt
        case publishedAt
    }
}

/*
 {
     "_id": "65f155d42e9f676866c94c1e",
     "title": "2024 必備的 10 個免費修圖軟體！助你打造高質感照片",
     "coverImage": {
         "_id": "66138494c52a4de82918bfe9",
         "url": "https://images.hahow.in/images/66138494c52a4de82918bfe9"
     },
     "previewDescription": "P 圖已成為現代人走跳社群的必備技能！但是照片編輯 app 五花八門，到底該如何選擇？以下我們要來推薦 10 款熱門的免費修圖軟體，幫助你輕鬆打造高質感的流量美照！",
     "creator": {
         "_id": "60474783471ff7654f9cf8ab",
         "name": "小蛙同學",
         "profileImageUrl": "https://images.api.hahow.in/images/623ac161f42cbb00072138f9"
     },
     "viewCount": 1140,
     "createdAt": "2024-03-13T07:29:24.316Z",
     "updatedAt": "2024-04-08T05:46:01.335Z",
     "publishedAt": "2024-03-20T05:44:38.435Z"
 }
 */
