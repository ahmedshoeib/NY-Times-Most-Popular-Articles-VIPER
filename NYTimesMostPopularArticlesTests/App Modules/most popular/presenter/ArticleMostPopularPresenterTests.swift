//
//  ArticleMostPopularPresenterTests.swift
//  NYTimesMostPopularArticlesTests
//
//  Created by Ahmed Shoeib on 06/11/2022.
//

import XCTest
@testable import NYTimesMostPopularArticles

final class ArticleMostPopularPresenterTests: XCTestCase {

    var presenter: ArticleMostPopularPresenter!
    var view = MockArticleMostPopularView()
    var interactor = MockArticleMostPopularInteractor()
    
    override func setUp() {
        presenter = ArticleMostPopularPresenter()
        interactor.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
    }
    
    func test_givenInteractorReturnError_ViewShowErrorMessagesIsCalled() {
        interactor.currentError = .badResponse
        presenter.getMostPopularArticles()
        XCTAssertTrue(view.showErrorCalled)
    }
    
    
    func test_givenInteractorReturnData_ViewReloadDataIsCalled() {
        interactor.currentError = nil
        presenter.getMostPopularArticles()
        XCTAssertTrue(view.reloadDataCalled)
    }

}
