//
//  NewsFeedViewModel.swift
//  TestingSwiftWithProtocols
//
//  Created by Corey Davis on 6/9/20.
//  Copyright © 2020 Corey Davis. All rights reserved.
//

import Foundation

protocol NewsFeedViewModel {
    var articles: [Article] { get }
    var filterArticles: ((Bool) -> ())? { get set }
    
    func requestArticles(_ completion: @escaping () -> ())
}

class NewsFeedViewModelImplementation: NewsFeedViewModel {
    
    private(set) var articles: [Article] = []
    var filterArticles: ((Bool) -> ())?

    func requestArticles(_ completion: @escaping () -> ()) {
        let url = URL(string: "http://someNewsService.com/articles")

        let task = URLSession.shared.dataTask(with: url!) { data, response, err in
            DispatchQueue.main.async {
                self.articles = try! JSONDecoder().decode([Article].self, from: data!)
                completion()
            }
        }

        task.resume()
    }
}

