//
//  ArticleDetailsRouter.swift
//  NYTimesMostPopularArticles
//
//  Created by Ahmed Shoeib on 06/11/2022.
//

import UIKit
class ArticleDetailsRouter: ArticleDetailsPresenterToRouterProtocol {
   
    
    private let navigationController: UINavigationController
    private let moduleFactory: ModuleFactoryProtocol
    
    init(navigationController: UINavigationController = UINavigationController(),
         moduleFactory: ModuleFactoryProtocol = ModuleFactory()) {
        self.navigationController = navigationController
        self.moduleFactory = moduleFactory
    }
    
//    static func createMostPopularAriclesModule(navigationController: UINavigationController, article: MostPopularArticle) -> ArticleDetailsViewController {
//
//        // init
//        let view = UIStoryboard.mainstoryboard.instantiateViewController(withIdentifier: "ArticleDetailsViewController") as! ArticleDetailsViewController
//
//        // init presenter
//        var presenter: ArticleDetailsViewToPresenterProtocol = ArticleDetailsPresenter(article: article)
//
//        // init router
//        let router: ArticleDetailsPopularRouter = ArticleDetailsPopularRouter()
//
//        view.presenter = presenter
//        presenter.view = view
//        presenter.router = router
//
//        return view
//
//    }
}
