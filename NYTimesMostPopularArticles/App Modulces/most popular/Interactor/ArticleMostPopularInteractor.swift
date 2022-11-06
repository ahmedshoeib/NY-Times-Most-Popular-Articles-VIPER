//
//  ArcticleMostPopularInteractor.swift
//  NYTimesMostPopularArticles
//
//  Created by Ahmed Shoeib on 05/11/2022.
//

import Foundation



class ArticleMostPopularInteractor: ArticleMostPopularPresenterToInteractorProtocol {
    var presenter: ArticleMostPopularInteractorToPresenterProtocol?
    
    var repository: ArticleMostPopularRepositoryProtocol?
    
    init(presenter: ArticleMostPopularInteractorToPresenterProtocol? = ArticleMostPopularPresenter(), repository: ArticleMostPopularRepositoryProtocol) {
        self.presenter = presenter
        self.repository = repository
    }
    
    func getMostPopularArticles() {
        repository?.getMostPopularArticles(resultHandler: { (result) in
            
            switch result {
            case .success(let arcticleMostPopularModel):
                if let mostPopularArticles = arcticleMostPopularModel.results  {
                    self.presenter?.fetchedMostPopularListList(mostPopularArticles: mostPopularArticles)
                }else{
                    self.presenter?.showErrorMessage(for: AppErrror.emptyResponse)
                }
                break
            case .failure(let error):
                self.presenter?.showErrorMessage(for: error)
                break
            }
            
        })
    }
    
    
    
    
}


