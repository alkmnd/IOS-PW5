//
//  AlarmModel.swift
//  nabelova_1PW5
//
//  Created by Наталья Белова on 11.11.2021.
//

import Foundation
import UIKit
struct ArticleModel: Decodable {
    var newsId: Int?
    var title: String?
    var announce: String?
    var img: ImageContainer?
    var requestId: String?
    var articleUrl: URL? {
        let requestId = requestId ?? ""
        let newsId = newsId ?? 0
        return URL(string:  "https://news.myseldon.com/ru/news/index/\(newsId)?requestId=\(requestId)")
                   }
}
//    init(title: String, description: String, imageLink: String, articleLink: String) {
//        self.title = title
//        self.description = description
//        self.imageLink = imageLink
//        self.articleLink = articleLink
//    }

struct ImageContainer: Decodable {
    var url: URL?
}
