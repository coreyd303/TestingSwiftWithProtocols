//
//  MockTableView.swift
//  TestingSwiftWithProtocolsTests
//
//  Created by Corey Davis on 6/9/20.
//  Copyright © 2020 Corey Davis. All rights reserved.
//

import Foundation
import UIKit

@testable import TestingSwiftWithProtocols

class MockTableView: UITableView {

    func resetMock() {
        invokedReloadDataCount = 0
    }

    var invokedReloadDataCount = 0
    override func reloadData() {
        invokedReloadDataCount += 1
    }
}

