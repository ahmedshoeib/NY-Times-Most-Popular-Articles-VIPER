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
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
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
