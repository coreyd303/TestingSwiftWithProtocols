//
//  NewFeedViewController.swift
//  TestingSwiftWithProtocols
//
//  Created by Corey Davis on 6/9/20.
//  Copyright © 2020 Corey Davis. All rights reserved.
//

import Foundation
import UIKit

class NewsFeedViewController: UIViewController {
    var tableView: UITableView?
    var viewModel: NewsFeedViewModel?
    var featuredArticles: [Article]?
    
    override func viewDidLoad() {

        viewModel?.filterArticles = { [weak self] featured in
            self?.featuredArticles = self?.viewModel?.articles.filter( { $0.isFeatured == featured })
        }
        
        viewModel?.requestArticles { [weak self] in
            self?.tableView?.reloadData()
        }
    }
    
    //...
    
    @objc func didTapFeatured(_ isFeatured: Bool) {
        viewModel?.filterArticles?(isFeatured)
    }
}
