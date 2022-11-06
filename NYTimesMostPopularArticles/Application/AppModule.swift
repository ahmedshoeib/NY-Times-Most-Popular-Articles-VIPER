//
//  AppModule.swift
//  NYTimesMostPopularArticles
//
//  Created by Ahmed Shoeib on 06/11/2022.
//

import UIKit

protocol AppModule {
    func assemble() -> UIViewController?
}


protocol ModuleFactoryProtocol {
    func createArticleMostPopularModule(using navigationController: UINavigationController) -> ArticleMostPopularModule
    func createArticleDetailsModule(using navigationController: UINavigationController, article: MostPopularArticle) -> ArticleDetailsModule
}


struct ModuleFactory: ModuleFactoryProtocol {
    func createArticleMostPopularModule(using navigationController: UINavigationController = UINavigationController()) -> ArticleMostPopularModule {
        let router = ArticlesMostPopularRouter(navigationController: navigationController, moduleFactory: self)
        let view: ArticlesMostPopularViewController = UIStoryboard.mainstoryboard.instantiateViewController(withIdentifier: "ArticlesMostPopularViewController") as! ArticlesMostPopularViewController
        return ArticleMostPopularModule(view: view, router: router)
    }
    
    func createArticleDetailsModule(using navigationController: UINavigationController, article: MostPopularArticle) -> ArticleDetailsModule {
        let router = ArticleDetailsRouter(navigationController: navigationController, moduleFactory: self)
        let view: ArticleDetailsViewController = UIStoryboard.mainstoryboard.instantiateViewController(withIdentifier: "ArticleDetailsViewController") as! ArticleDetailsViewController
        let presenter = ArticleDetailsPresenter(article: article)
        return ArticleDetailsModule(view: view, router: router, presenter: presenter)
    }
    
    
}
