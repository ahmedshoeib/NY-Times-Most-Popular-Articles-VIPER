//
//  ModuleMocks.swift
//  NYTimesMostPopularArticlesTests
//
//  Created by Ahmed Shoeib on 05/11/2022.
//

import Foundation
import XCTest
@testable import NYTimesMostPopularArticles

class MockArticleMostPopularPresenter: ArticleMostPopularInteractorToPresenterProtocol {
    var expectation: XCTestExpectation?
    var currentError: AppErrror?
    var errorMessageFuncCalled: Bool = false
    var results: [MostPopularArticle]?
    
    func fetchedMostPopularListList(mostPopularArticles: [NYTimesMostPopularArticles.MostPopularArticle]) {
        self.results = mostPopularArticles
    }
    
    func showErrorMessage(for error: AppErrror) {
        errorMessageFuncCalled = true
        currentError = error
    }
}


class MockgetArcticleMostPopularListNetworkService: Service {
    var reachability: ReachabilityProtocol?
    var currentError: AppErrror?
    
    required init(reachability: ReachabilityProtocol?) {
        
    }
    
    func build<ArcticleMostPopularModel>(request: Request, completion: @escaping (Result<ArcticleMostPopularModel, AppErrror>) -> Void) {
        
        if let currentError = currentError {
            completion(.failure(currentError))
        } else {
            let arcticleMostPopularModel:ArcticleMostPopularModel = MockResponses.getArcticleMostPopularList() as! ArcticleMostPopularModel
            completion(.success(arcticleMostPopularModel))
        }
    }
    
    
}


class MockArticleMostPopularRepository: ArticleMostPopularRepositoryProtocol {
    var service: Service
    var currentError: AppErrror?
    var arcticleMostPopularModel: ArcticleMostPopularModel?

    func getMostPopularArticles(resultHandler: @escaping (Result<ArcticleMostPopularModel, AppErrror>) -> Void) {
        
        if let currentError = currentError {
            resultHandler(.failure(currentError))
        }else {
            let mockRequest = MockRequest(url: URL(string: "http://api.nytimes.com/svc/mostpopular/v2/viewed/1.json?api-key=qwiFWqKlKtPFmftmAOFrrhkMVrItwYxY")!)
            return service.build(request: mockRequest, completion: resultHandler)
        }
        
    }
    
    required init(service: Service) {
        self.service = service
    }
}


class MockArticleMostPopularView: ArticleMostPopularPresenterToViewProtocol {
    var presenter: NYTimesMostPopularArticles.ArticleMostPopularPresenterViewToPresenterProtocol?
    
    func showLoading() {
        
    }
    
    func hideLoading() {
        
    }
    
    
    var reloadDataCalled = false
    var showErrorCalled = false
    var error: AppErrror?
    
    func reloadData() {
        reloadDataCalled = true
    }
    
    func showErrorMessage(for error: AppErrror) {
        self.error =  error
        showErrorCalled = true
    }
}


class MockArticleMostPopularInteractor: ArticleMostPopularPresenterToInteractorProtocol {
    var presenter: ArticleMostPopularInteractorToPresenterProtocol?
    var repository: ArticleMostPopularRepositoryProtocol?
    
    var currentError: AppErrror?

    func getMostPopularArticles() {
        
        if let currentError = currentError {
            presenter?.showErrorMessage(for: currentError)
        }else {
            presenter?.fetchedMostPopularListList(mostPopularArticles: MockResponses.getArcticleMostPopularList().results!)
        }
    }
}
