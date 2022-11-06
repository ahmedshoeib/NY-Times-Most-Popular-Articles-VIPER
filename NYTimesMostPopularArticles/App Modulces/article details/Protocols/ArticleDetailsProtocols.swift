//
//  ArticleDetailsProtocols.swift
//  NYTimesMostPopularArticles
//
//  Created by Ahmed Shoeib on 06/11/2022.
//

import Foundation
import UIKit


//MARK: View To Presenter Protocol
protocol ArticleDetailsViewToPresenterProtocol {
    // variables
    var article: MostPopularArticle {get}
    var view: ArticleDetailsPresenterToViewProtocol? {get set}
    var router: ArticleDetailsPresenterToRouterProtocol? {get set}
    
    func viewDidLoad()
}

//MARK: Presenter To View Protocol
protocol ArticleDetailsPresenterToViewProtocol {
    // variables
    var presenter: ArticleDetailsViewToPresenterProtocol? {get set}
    
    func setupView(with article: MostPopularArticle)
}

//MARK: Presenter To Router Protocol
protocol ArticleDetailsPresenterToRouterProtocol {
//    static func createMostPopularAriclesModule(navigationController:UINavigationController, article: MostPopularArticle) -> ArticleDetailsViewController
}
