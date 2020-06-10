//
//  StubArticle.swift
//  TestingSwiftWithProtocolsTests
//
//  Created by Corey Davis on 6/9/20.
//  Copyright © 2020 Corey Davis. All rights reserved.
//

import Foundation

@testable import TestingSwiftWithProtocols

extension Article {
    static func stub(title: String = "", author: String = "", body: String = "", isFeatured: Bool = true) -> Article {
        return Article(title: title, author: author, body: body, isFeatured: isFeatured)
    }
}
