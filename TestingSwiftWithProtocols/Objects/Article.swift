//
//  Article.swift
//  TestingSwiftWithProtocols
//
//  Created by Corey Davis on 6/9/20.
//  Copyright © 2020 Corey Davis. All rights reserved.
//

import Foundation
import UIKit

struct Article: Decodable, Equatable {
    let title: String
    let author: String
    let body: String
    let isFeatured: Bool
}
