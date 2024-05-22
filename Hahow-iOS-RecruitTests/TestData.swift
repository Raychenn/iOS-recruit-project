//
//  TestData.swift
//  Hahow-iOS-RecruitTests
//
//  Created by Boray Chen on 2024/5/21.
//

import Foundation

let testThreeCourseData: Data = """
[
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
    },
    {
        "_id": "65194cea6355be57b65e7b00",
        "status": "PUBLISHED",
        "successCriteria": {
            "numSoldTickets": 30
        },
        "numSoldTickets": 641,
        "averageRating": 5,
        "numRating": 5,
        "title": "頂尖構圖x關鍵後製｜國際級風景攝影必修課",
        "coverImage": {
            "_id": "6530f7093f75c40891405125",
            "url": "https://images.hahow.in/images/6530f7093f75c40891405125",
            "height": 562,
            "width": 906
        },
        "totalVideoLengthInSeconds": 27261,
        "createdAt": "2023-10-01T10:41:46.317Z",
        "incubateTime": "2023-10-26T04:00:11.211Z",
        "publishTime": "2023-11-30T03:59:36.648Z",
        "proposalDueTime": "2023-11-24T16:00:00.000Z"
    },
    {
        "_id": "5a2170d5a6d4a5001ec3148d",
        "status": "PUBLISHED",
        "successCriteria": {
            "numSoldTickets": 30
        },
        "numSoldTickets": 12283,
        "averageRating": 4.96,
        "numRating": 755,
        "title": "用 Python 理財：打造小資族選股策略",
        "coverImage": {
            "_id": "5b04d8952a1203001e89084d",
            "url": "https://images.hahow.in/images/5b04d8952a1203001e89084d"
        },
        "totalVideoLengthInSeconds": 30509,
        "createdAt": "2017-12-01T15:10:13.000Z",
        "incubateTime": "2018-02-22T04:03:57.607Z",
        "publishTime": "2018-05-23T04:01:22.415Z",
        "proposalDueTime": "2018-03-23T16:00:00.000Z"
    }
]
""".data(using: .utf8)!

let testOneArticle: Data = """
{
    "staffPickArticles": [
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
    ]
}
""".data(using: .utf8)!

// invalid status key
let testInvalidCourse: Data = """
 [
     {
         "_id": "65e527e46292533d0c4d9c7a",
         "asdasdsad": "INCUBATING",
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
]
""".data(using: .utf8)!

// invalid title key
let testInvalidArticle: Data = """
{
    "staffPickArticles": [
        {
            "_id": "65f155d42e9f676866c94c1e",
            "fsjaiofjsaiofjosafj": "2024 必備的 10 個免費修圖軟體！助你打造高質感照片",
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
    ]
}
""".data(using: .utf8)!

