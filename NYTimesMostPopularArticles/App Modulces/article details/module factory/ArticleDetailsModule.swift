//
//  ArticleDetailsModule.swift
//  NYTimesMostPopularArticles
//
//  Created by Ahmed Shoeib on 06/11/2022.
//

// MARK: - Presenter
typealias ArticleDetailsPresenterProtocol = ArticleDetailsViewToPresenterProtocol

final class ArticleDetailsModule {
    
    private var view: ArticleDetailsPresenterToViewProtocol
    private var router: ArticleDetailsPresenterToRouterProtocol
    private var presenter: ArticleDetailsPresenterProtocol
        
    init(view: ArticleDetailsPresenterToViewProtocol,
         router: ArticleDetailsPresenterToRouterProtocol = ArticleDetailsRouter(),
         presenter: ArticleDetailsPresenterProtocol) {
        self.view = view
        self.router = router
        self.presenter = presenter
    }
}

extension ArticleDetailsModule: AppModule {
    func assemble() -> UIViewController? {
        view.presenter = presenter
        presenter.view = view
        presenter.router = router

        return view as? UIViewController
    }
}


import UIKit
class ArticleDetailsPopularRouter: ArticleDetailsPresenterToRouterProtocol {
   
    
    static func createMostPopularAriclesModule(navigationController: UINavigationController, article: MostPopularArticle) -> ArticleDetailsViewController {
       
        // init
        let view = UIStoryboard.mainstoryboard.instantiateViewController(withIdentifier: "ArticleDetailsViewController") as! ArticleDetailsViewController
        
        // init presenter
        var presenter: ArticleDetailsViewToPresenterProtocol = ArticleDetailsPresenter(article: article)
        
        // init router
        let router: ArticleDetailsPopularRouter = ArticleDetailsPopularRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router

        return view
        
    }
}

