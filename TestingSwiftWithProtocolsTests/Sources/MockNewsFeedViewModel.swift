//
//  MockNewsFeedViewModel.swift
//  TestingSwiftWithProtocolsTests
//
//  Created by Corey Davis on 6/9/20.
//  Copyright © 2020 Corey Davis. All rights reserved.
//

import Foundation
@testable import TestingSwiftWithProtocols

class MockNewsFeedViewModel: NewsFeedViewModel {
    var invokedArticlesGetter = false
    var invokedArticlesGetterCount = 0
    var stubbedArticles: [Article]! = []
    var articles: [Article] {
        invokedArticlesGetter = true
        invokedArticlesGetterCount += 1
        return stubbedArticles
    }
    var invokedFilterArticlesSetter = false
    var invokedFilterArticlesSetterCount = 0
    var invokedFilterArticles: ((Bool) -> ())?
    var invokedFilterArticlesList = [((Bool) -> ())?]()
    var invokedFilterArticlesGetter = false
    var invokedFilterArticlesGetterCount = 0
    var stubbedFilterArticles: ((Bool) -> ())?
    var filterArticles: ((Bool) -> ())? {
        set {
            invokedFilterArticlesSetter = true
            invokedFilterArticlesSetterCount += 1
            invokedFilterArticles = newValue
            invokedFilterArticlesList.append(newValue)
        }
        get {
            invokedFilterArticlesGetter = true
            invokedFilterArticlesGetterCount += 1
            return stubbedFilterArticles
        }
    }
    var invokedRequestArticles = false
    var invokedRequestArticlesCount = 0
    var shouldInvokeRequestArticlesCompletion = false
    func requestArticles(_ completion: @escaping () -> ()) {
        invokedRequestArticles = true
        invokedRequestArticlesCount += 1
        if shouldInvokeRequestArticlesCompletion {
            completion()
        }
    }
}

