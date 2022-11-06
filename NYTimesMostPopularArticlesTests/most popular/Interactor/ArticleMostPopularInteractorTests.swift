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
    var Interactor = ArticleMostPopularInteractor()
    var repository: MockArticleMostPopularRepository!
    
    override func setUp() {
        let availableRechability = MockAvailableReachability()
        let mockService = MockgetArcticleMostPopularListNetworkService(reachability: availableRechability)
        repository = MockArticleMostPopularRepository(service: mockService)
        Interactor.presenter = presenter
        Interactor.repository = repository
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
