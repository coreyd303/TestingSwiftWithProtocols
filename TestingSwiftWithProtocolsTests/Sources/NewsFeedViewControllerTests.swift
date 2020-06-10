//
//  NewsFeedViewControllerTests.swift
//  TestingSwiftWithProtocolsTests
//
//  Created by Corey Davis on 6/9/20.
//  Copyright © 2020 Corey Davis. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import TestingSwiftWithProtocols

class NewsFeedViewControllerTests: QuickSpec {
    override func spec() {
        var sut: NewsFeedViewController!
        var mockViewModel: MockNewsFeedViewModel!
        var mockTableView: MockTableView!
        
        beforeEach() {
            mockViewModel = MockNewsFeedViewModel()
            mockViewModel.shouldInvokeRequestArticlesCompletion = true

            mockTableView = MockTableView()
            

            sut = NewsFeedViewController()
            sut.viewModel = mockViewModel
            sut.tableView = mockTableView
        }

        afterEach {
            mockTableView.resetMock()
        }

        describe("A NewsFeedViewController") {
            beforeEach {
                sut.viewDidLoad()
            }

            it("should invoke requestArticles on the viewModel") {
                expect(mockViewModel.invokedRequestArticlesCount).to(equal(1))
            }

            describe("when requestArticles completes") {
                it("should invoke reloadData on the tableView") {
                    expect(mockTableView.invokedReloadDataCount).to(equal(1))
                }
            }

            describe("when didTapFeatured is invoked and tested poorly") {
                // this is a BAD test!!
                var viewModelImplementation: NewsFeedViewModelImplementation!

                beforeEach {
                    viewModelImplementation = NewsFeedViewModelImplementation()
                    sut.viewModel = viewModelImplementation

                    sut.didTapFeatured(true)
                }

                xit("should invoke filterArticles on the viewModel") {
                    let expectedArticles = viewModelImplementation.articles.filter( { $0.isFeatured == true })

                    expect(sut.featuredArticles).to(equal(expectedArticles))
                }
            }

            describe("when didTapFeatured is invoked") {
                var invokedFilterArticlesCount: Int!
                var invokedFilterArticlesParams: (featured: Bool, Void)?

                beforeEach {
                    invokedFilterArticlesCount = 0

                    mockViewModel.stubbedFilterArticles = { featured in
                        invokedFilterArticlesCount += 1
                        invokedFilterArticlesParams = (featured, ())
                    }


                    mockViewModel.stubbedArticles = [Article.stub(), Article.stub(isFeatured: false)]

                    sut.viewModel = mockViewModel

                    sut.didTapFeatured(true)
                }

                it("should invoke filterArticles on the viewModel") {
                    expect(invokedFilterArticlesCount).to(equal(1))
                }

                it("should invoke filterArticles with matching params") {
                    expect(invokedFilterArticlesParams?.featured).to(beTrue())
                }

                describe("when filterArticles is invoked on the viewModel") {
                    it("should update featuredArticles on sut") {
                        mockViewModel.invokedFilterArticles?(true)
                        expect(sut.featuredArticles).to(equal([mockViewModel.articles.first]))
                    }
                }
            }
        }
    }
}

