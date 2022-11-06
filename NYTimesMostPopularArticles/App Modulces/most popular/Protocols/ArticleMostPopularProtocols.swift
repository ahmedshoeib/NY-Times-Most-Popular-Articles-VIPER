//
//  ArticleMostPopularProtocols.swift
//  NYTimesMostPopularArticles
//
//  Created by Ahmed Shoeib on 05/11/2022.
//

import Foundation
import UIKit

//MARK: View To Presenter Protocol
protocol ArticleMostPopularPresenterViewToPresenterProtocol {
    // variables
    var view: ArticleMostPopularPresenterToViewProtocol? {get set}
    var interactor:ArticleMostPopularPresenterToInteractorProtocol? {get set}
    var router: ArticleMostPopularPresenterToRouterProtocol? {get set}
    var articles:[MostPopularArticle]? {get set}

    // functions
    func getMostPopularArticles()
    func getArticle(atIndex indexPath: IndexPath) -> MostPopularArticle?
    func pushArticleDetailsScreen(article: MostPopularArticle)
}

//MARK: Presenter To View Protocol
protocol ArticleMostPopularPresenterToViewProtocol {
    
    // variables
    var presenter: ArticleMostPopularPresenterViewToPresenterProtocol? {get set}
    
    // functions
    func reloadData()
    func showErrorMessage(for error: AppErrror)
    func showLoading()
    func hideLoading()
}

//MARK: Presenter To Interactor Protocol
protocol ArticleMostPopularPresenterToInteractorProtocol {
    
    // variables
    var presenter:ArticleMostPopularInteractorToPresenterProtocol? {get set}
    var repository:ArticleMostPopularRepositoryProtocol? {get set}

    // functions
    func getMostPopularArticles()
}

//MARK: Interactor To Presenter Protocol
protocol ArticleMostPopularInteractorToPresenterProtocol {
    func fetchedMostPopularListList(mostPopularArticles:[MostPopularArticle])
    func showErrorMessage(for error: AppErrror)
}


//MARK: Presenter To Router Protocol
protocol ArticleMostPopularPresenterToRouterProtocol {
//    static func createMostPopularAriclesModule(using navigationController: UINavigationController)-> ArticlesMostPopularViewController
    func pushArticleDetailsScreen(article: MostPopularArticle)
}
