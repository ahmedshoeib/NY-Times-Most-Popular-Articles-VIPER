//
//  ArticleMostPopularPresenter.swift
//  NYTimesMostPopularArticles
//
//  Created by Ahmed Shoeib on 05/11/2022.
//

import Foundation


class ArticleMostPopularPresenter: ArticleMostPopularPresenterViewToPresenterProtocol {
    
    var articles: [MostPopularArticle]?
    
    var router: ArticleMostPopularPresenterToRouterProtocol?
    var view: ArticleMostPopularPresenterToViewProtocol?
    var interactor: ArticleMostPopularPresenterToInteractorProtocol?
    
    
    func getMostPopularArticles() {
        view?.showLoading()
        interactor?.getMostPopularArticles()
    }
    
    func getArticle(atIndex indexPath: IndexPath) -> MostPopularArticle? {
        if let articles = articles, articles.indices.contains(indexPath.row) {
            return articles[indexPath.row]
        } else {
            return nil
        }
    }
    
    func pushArticleDetailsScreen(article: MostPopularArticle) {
        router?.pushArticleDetailsScreen(article: article)
    }
    
}


extension ArticleMostPopularPresenter: ArticleMostPopularInteractorToPresenterProtocol {
    func fetchedMostPopularListList(mostPopularArticles: [MostPopularArticle]) {
        
        // hide loading
        view?.hideLoading()
        
        // set articles
        self.articles = mostPopularArticles
        
        // relod view data
        view?.reloadData()
    }
    
    func showErrorMessage(for error: AppErrror) {
        
        // hide loading
        view?.hideLoading()
        
        // display error to the customer
        view?.showErrorMessage(for: error)
    }
    
    
}
