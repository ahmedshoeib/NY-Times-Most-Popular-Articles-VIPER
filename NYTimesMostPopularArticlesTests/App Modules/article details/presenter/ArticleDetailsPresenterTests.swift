//
//  ArticleDetailsPresenterTests.swift
//  NYTimesMostPopularArticlesTests
//
//  Created by Ahmed Shoeib on 06/11/2022.
//

import XCTest
@testable import NYTimesMostPopularArticles

final class ArticleDetailsPresenterTests: XCTestCase {

    var presenter: ArticleDetailsPresenter!
    var view = MockArticleDetailsView()
    let article = MockResponses.getArcticleMostPopularList().results!.first!
    
    override func setUp() {
        presenter = ArticleDetailsPresenter(article: article)
        presenter.view = view
        view.presenter = presenter
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func test_givenPresenterCalledSetupView_ViewSetupViewFuncIsCalled() {
        view.setupView(with: article)
        
        XCTAssertEqual(article.id, view.selectedArticle.id)
        XCTAssertEqual(view.setupViewFunctionIsCalled, true)
    }
}
