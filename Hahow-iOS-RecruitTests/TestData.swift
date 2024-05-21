//
//  TestData.swift
//  Hahow-iOS-RecruitTests
//
//  Created by Boray Chen on 2024/5/21.
//

import Foundation

// 3 courses
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

let testSixCoursesData: Data = """
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
    },
    {
        "_id": "6059aee039f2512548c187c6",
        "status": "PUBLISHED",
        "successCriteria": {
            "numSoldTickets": 30
        },
        "numSoldTickets": 11711,
        "averageRating": 4.95,
        "numRating": 402,
        "title": "Notion 實戰課程：打造專屬數位工作術",
        "coverImage": {
            "_id": "6466f9efbd56034360cbd008",
            "url": "https://images.hahow.in/images/6466f9efbd56034360cbd008",
            "height": 562,
            "width": 906
        },
        "totalVideoLengthInSeconds": 42719,
        "createdAt": "2021-03-23T09:03:28.000Z",
        "incubateTime": "2021-04-14T04:00:29.078Z",
        "publishTime": "2021-06-18T04:00:24.712Z",
        "proposalDueTime": "2021-05-13T16:00:00.000Z"
    },
    {
        "_id": "60d801869643fa393b2e209c",
        "status": "PUBLISHED",
        "successCriteria": {
            "numSoldTickets": 30
        },
        "numSoldTickets": 3601,
        "averageRating": 5,
        "numRating": 104,
        "title": "減法攝影，感官加乘：逐格收藏觀景窗裡的世界",
        "coverImage": {
            "_id": "60dbbb87638ed068ba988c7a",
            "url": "https://images.hahow.in/images/60dbbb87638ed068ba988c7a",
            "height": 620,
            "width": 999
        },
        "totalVideoLengthInSeconds": 28713,
        "createdAt": "2021-06-27T04:41:42.000Z",
        "incubateTime": "2021-07-15T04:00:20.438Z",
        "publishTime": "2021-10-13T04:01:08.305Z",
        "proposalDueTime": "2021-08-13T16:00:00.000Z"
    },
    {
        "_id": "60d801869643fa393b2e209c",
        "status": "PUBLISHED",
        "successCriteria": {
            "numSoldTickets": 30
        },
        "numSoldTickets": 3601,
        "averageRating": 5,
        "numRating": 104,
        "title": "減法攝影，感官加乘：逐格收藏觀景窗裡的世界",
        "coverImage": {
            "_id": "60dbbb87638ed068ba988c7a",
            "url": "https://images.hahow.in/images/60dbbb87638ed068ba988c7a",
            "height": 620,
            "width": 999
        },
        "totalVideoLengthInSeconds": 28713,
        "createdAt": "2021-06-27T04:41:42.000Z",
        "incubateTime": "2021-07-15T04:00:20.438Z",
        "publishTime": "2021-10-13T04:01:08.305Z",
        "proposalDueTime": "2021-08-13T16:00:00.000Z"
    }
]
""".data(using: .utf8)!

let testSevenArticlesData: Data = """
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
        },
        {
            "_id": "63ef522bf87d21f6ebfd8f6d",
            "title": "德文自學，從零開始——免費德語自學資源大公開",
            "coverImage": {
                "_id": "63ef5864a1c8481694220c48",
                "url": "https://images.hahow.in/images/63ef5864a1c8481694220c48"
            },
            "previewDescription": "學習語言你習慣用什麼工具？這篇文章要來跟大家分享德文的自學工具包，包括語言網站、YouTube 再到德劇與雜誌，滿滿工具讓你從新手開始無痛認識德文。",
            "creator": {
                "_id": "60474783471ff7654f9cf8ab",
                "name": "小蛙同學",
                "profileImageUrl": "https://images.api.hahow.in/images/623ac161f42cbb00072138f9"
            },
            "viewCount": 273,
            "createdAt": "2023-02-17T10:08:43.970Z",
            "updatedAt": "2024-03-20T07:49:32.284Z",
            "publishedAt": "2024-03-20T07:49:32.284Z"
        },
        {
            "_id": "650ccf7bd62ad77bb97fe537",
            "title": "簡報用的圖片畫質不好？你可能需要這兩款 AI 工具",
            "coverImage": {
                "_id": "650d60fb1c0afb7afa8a5000",
                "url": "https://images.hahow.in/images/650d60fb1c0afb7afa8a5000"
            },
            "previewDescription": "想做出美觀又易懂的簡報，好的圖片素材是必不可少的。然而很多時候好不容易才搜到的圖片，儘管非常切合你的簡報內容，但畫質卻不夠好，該怎麼辦呢？接下來我們要介紹：Upscayl（圖片放大）和 Vectorizer.AI（點陣圖轉向量圖）這兩款能幫助你解決這些問題的 AI 工具！",
            "creator": {
                "_id": "572abc76d60bb3090091cc9c",
                "name": "Allan",
                "profileImageUrl": "https://images.api.hahow.in/images/6181cdd3b7fe1c00067aab27"
            },
            "viewCount": 3804,
            "createdAt": "2023-09-21T23:19:23.902Z",
            "updatedAt": "2023-09-28T11:24:05.475Z",
            "publishedAt": "2023-09-25T04:48:49.949Z"
        },
        {
            "_id": "6310600c45b15b0006221e32",
            "title": "Canva 教學大全｜輕鬆做出去背、背景模糊、人物壓字、描邊效果！",
            "coverImage": {
                "_id": "63105ddeec21b600071ee3d0",
                "url": "https://images.hahow.in/images/63105ddeec21b600071ee3d0"
            },
            "previewDescription": "Canva 教學帶你簡單快速產圖，不用專業製圖軟體也能做出特殊圖片效果！本篇 Abby 將手把手讓你掌握 Canva 去背等等多種技巧。",
            "creator": {
                "_id": "617a4cf16692de00064ddfb9",
                "name": "LazyAbby ",
                "profileImageUrl": "https://images.api.hahow.in/images/62dcf779194ca000066ae270"
            },
            "viewCount": 16329,
            "createdAt": "2022-09-01T07:32:28.003Z",
            "updatedAt": "2024-03-19T09:50:14.721Z",
            "publishedAt": "2024-03-19T09:50:14.721Z"
        },
        {
            "_id": "60e81eeea6bcd50006c10d48",
            "title": "日文文法大補帖，新手必看圖解日文基礎三大句型結構、助詞新概念",
            "coverImage": {
                "_id": "60eeae369b2ee60007c95dcb",
                "url": "https://images.hahow.in/images/60eeae369b2ee60007c95dcb"
            },
            "previewDescription": "在自學日文的過程中，對於日文文法中的詞性和句構難免會出現疑惑與學習瓶頸，因此我統整了日文文法的三大句型觀念，想與你一起分享！",
            "creator": {
                "_id": "60474783471ff7654f9cf8ab",
                "name": "小蛙同學",
                "profileImageUrl": "https://images.api.hahow.in/images/623ac161f42cbb00072138f9"
            },
            "viewCount": 41561,
            "createdAt": "2021-07-09T10:03:26.240Z",
            "updatedAt": "2024-03-20T09:24:05.663Z",
            "publishedAt": "2021-07-14T10:38:38.804Z"
        },
        {
            "_id": "63623ef1129787a75f07044c",
            "title": "13 種拍照技巧輕鬆學，找出完美拍照角度，照片超好 PO！",
            "coverImage": {
                "_id": "63623ca767f2d54f035778a3",
                "url": "https://images.hahow.in/images/63623ca767f2d54f035778a3"
            },
            "previewDescription": "擁有拍照技巧和攝影技巧的下一步，就是掌握各種拍攝角度！再平凡無奇的場景都能被你拍得獨樹一格，讚數直線飆升喔！",
            "creator": {
                "_id": "606bf593e6951561f10dad90",
                "name": "韓森",
                "profileImageUrl": "https://images.api.hahow.in/images/6161c12140ee960006cdf42e"
            },
            "viewCount": 15090,
            "createdAt": "2022-11-02T09:57:05.718Z",
            "updatedAt": "2024-03-12T10:20:12.614Z",
            "publishedAt": "2022-11-09T05:32:26.092Z"
        },
        {
            "_id": "63623ef1129787a75f07044c",
            "title": "13 種拍照技巧輕鬆學，找出完美拍照角度，照片超好 PO！",
            "coverImage": {
                "_id": "63623ca767f2d54f035778a3",
                "url": "https://images.hahow.in/images/63623ca767f2d54f035778a3"
            },
            "previewDescription": "擁有拍照技巧和攝影技巧的下一步，就是掌握各種拍攝角度！再平凡無奇的場景都能被你拍得獨樹一格，讚數直線飆升喔！",
            "creator": {
                "_id": "606bf593e6951561f10dad90",
                "name": "韓森",
                "profileImageUrl": "https://images.api.hahow.in/images/6161c12140ee960006cdf42e"
            },
            "viewCount": 15090,
            "createdAt": "2022-11-02T09:57:05.718Z",
            "updatedAt": "2024-03-12T10:20:12.614Z",
            "publishedAt": "2022-11-09T05:32:26.092Z"
        }
    ]
}
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
