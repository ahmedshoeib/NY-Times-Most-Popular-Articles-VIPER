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
    func createArticleMostPopularModule(using navigationController: UINavigationController, testing:Bool) -> ArticleMostPopularModule
    func createArticleDetailsModule(using navigationController: UINavigationController, article: MostPopularArticle) -> ArticleDetailsModule
}


struct ModuleFactory: ModuleFactoryProtocol {
    func createArticleMostPopularModule(using navigationController: UINavigationController = UINavigationController(), testing:Bool) -> ArticleMostPopularModule {
        
        let networkService = NetworkService()
        let repository = ArcticleMostPopularRepository(service: networkService,testing: testing)
        let view: ArticlesMostPopularViewController = UIStoryboard.mainstoryboard.instantiateViewController(withIdentifier: "ArticlesMostPopularViewController") as! ArticlesMostPopularViewController
        let interactor: ArticleMostPopularPresenterToInteractorProtocol = ArticleMostPopularInteractor(repository: repository)
        let presenter: ArticleMostPopularPresenterProtocol = ArticleMostPopularPresenter()
        
        let router = ArticlesMostPopularRouter(navigationController: navigationController, moduleFactory: self)
        
        return ArticleMostPopularModule(view: view, router: router, interactor: interactor, presenter: presenter)
    }
    
    func createArticleDetailsModule(using navigationController: UINavigationController, article: MostPopularArticle) -> ArticleDetailsModule {
        let router = ArticleDetailsRouter(navigationController: navigationController, moduleFactory: self)
        let view: ArticleDetailsViewController = UIStoryboard.mainstoryboard.instantiateViewController(withIdentifier: "ArticleDetailsViewController") as! ArticleDetailsViewController
        let presenter = ArticleDetailsPresenter(article: article)
        return ArticleDetailsModule(view: view, router: router, presenter: presenter)
    }
    
    
}
