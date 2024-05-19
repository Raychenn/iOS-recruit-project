//
//  Course.swift
//  Hahow-iOS-Recruit
//
//  Created by Boray Chen on 2024/5/18.
//

import Foundation

struct Course: Codable {
    let id: String
    let status: String
    let successCriteria: SuccessCriteria
    let numSoldTickets: Int
    let averageRating: Double
    let numRating: Int
    let title: String
    let coverImage: CoverImage
    let totalVideoLengthInSeconds: Int
    let createdAt: String
    let incubateTime: String
    let publishTime: String?
    let proposalDueTime: String
    
    struct SuccessCriteria: Codable {
        let numSoldTickets: Int
    }
    
    struct CoverImage: Codable {
        let id: String
        let url: String
        let height: Int?
        let width: Int?
        
        enum CodingKeys: String, CodingKey {
            case id = "_id"
            case url
            case height
            case width
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case status
        case successCriteria
        case numSoldTickets
        case averageRating
        case numRating
        case title
        case coverImage
        case totalVideoLengthInSeconds
        case createdAt
        case incubateTime
        case publishTime
        case proposalDueTime
    }
}

/*
 {
     "_id": "65e527e46292533d0c4d9c7a",
     "status": "INCUBATING",
     "successCriteria": {
         "numSoldTickets": 30
     },
     "numSoldTickets": 1865,
     "averageRating": 0,
     "numRating": 0,
     "title": "Gina 的全方位芳香療法課｜精油—你身心靈的舒緩解方",
     "coverImage": {
         "_id": "65eff95d2e9f676866416e25",
         "url": "https://images.hahow.in/images/65eff95d2e9f676866416e25",
         "height": 620,
         "width": 999
     },
     "totalVideoLengthInSeconds": 0,
     "createdAt": "2024-03-04T01:46:12.348Z",
     "incubateTime": "2024-04-09T04:00:11.728Z",
     "proposalDueTime": "2024-05-23T16:00:00.000Z"
 }
 */
