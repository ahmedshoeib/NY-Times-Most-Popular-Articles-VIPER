//
//  ArticlesMostPopularRouter.swift
//  NYTimesMostPopularArticles
//
//  Created by Ahmed Shoeib on 05/11/2022.
//

import UIKit
class ArticlesMostPopularRouter: ArticleMostPopularPresenterToRouterProtocol {
    
    
    private let navigationController: UINavigationController
    private let moduleFactory: ModuleFactoryProtocol
    
    init(navigationController: UINavigationController = UINavigationController(),
         moduleFactory: ModuleFactoryProtocol = ModuleFactory()) {
        self.navigationController = navigationController
        self.moduleFactory = moduleFactory
    }
    
    func pushArticleDetailsScreen(article: MostPopularArticle) {
        let module = moduleFactory.createArticleDetailsModule(using: navigationController, article: article)
        let viewController = module.assemble()
        navigationController.pushViewController(viewController!, animated: true)
    }
}
