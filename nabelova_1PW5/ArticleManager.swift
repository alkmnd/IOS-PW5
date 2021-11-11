//
//  ArticleManager.swift
//  nabelova_1PW5
//
//  Created by Наталья Белова on 11.11.2021.
//

import Foundation

class ArticleManager {
    private func getURL(_ rubric: Int, _ pageIndex: Int) -> URL? {
        URL(string: "https://news.myseldon.com/api/Section?rubricId=\(rubric)&pageSize=8&pageIndex=\(pageIndex)")
    }
    var articles: [ArticleModel] = []
    // MARK: - Fetch news
    func fetchNews() {
        guard let url = getURL(4, 1) else { return }
        URLSession.shared.dataTask(with: url) { [weak self] data,
            response, error in
            if let error = error {
                print(error)
                return
            }
            if let data = data {
                var articlePage = try?
                JSONDecoder().decode(ArticlePage.self, from: data)
                articlePage?.passTheRequestId()
                self?.articles = (articlePage?.news)!
                
            }
        }.resume()
    
    }

}
