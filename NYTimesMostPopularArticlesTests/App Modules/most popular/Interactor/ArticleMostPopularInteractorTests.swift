//
//  ArticleMostPopularInteractorTests.swift
//  NYTimesMostPopularArticlesTests
//
//  Created by Ahmed Shoeib on 05/11/2022.
//

import XCTest
@testable import NYTimesMostPopularArticles

class ArticleMostPopularInteractorTests: XCTestCase {

    var presenter = MockArticleMostPopularPresenter()
    var Interactor: ArticleMostPopularInteractor!
    var repository: MockArticleMostPopularRepository!
    
    override func setUp() {
        let availableRechability = MockAvailableReachability()
        let mockService = MockgetArcticleMostPopularListNetworkService(reachability: availableRechability)
        repository = MockArticleMostPopularRepository(service: mockService, testing: true)
        Interactor = ArticleMostPopularInteractor(repository: repository)
        Interactor.presenter = presenter
        Interactor.repository = repository
    }
    
    func test_givenRepositoryReturnError_presenterErrorIsCalled() {
        repository.currentError = .badResponse
        Interactor.getMostPopularArticles()
        XCTAssertTrue(presenter.errorMessageFuncCalled)
    }
    
    func test_givenRepositoryReturnError_sameErrorPassedToPresenter() {
        repository.currentError = .badResponse
        Interactor.getMostPopularArticles()
        XCTAssertEqual(repository.currentError, presenter.currentError)
    }
    
    func test_givenRepositoryReturnResuls_sameDataCountPassedToPresenter() {
        repository.currentError = nil
        Interactor.getMostPopularArticles()
        XCTAssertEqual(presenter.results?.count ?? 0, 20)
    }
}
