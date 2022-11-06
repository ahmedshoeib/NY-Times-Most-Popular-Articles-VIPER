//
//  MostPopularArticlesModule.swift
//  NYTimesMostPopularArticles
//
//  Created by Ahmed Shoeib on 06/11/2022.
//

import Foundation
import UIKit

// MARK: - Presenter
typealias ArticleMostPopularPresenterProtocol = ArticleMostPopularPresenterViewToPresenterProtocol & ArticleMostPopularInteractorToPresenterProtocol

final class ArticleMostPopularModule {
    
    private var view: ArticleMostPopularPresenterToViewProtocol
    private var router: ArticleMostPopularPresenterToRouterProtocol
    private var interactor: ArticleMostPopularPresenterToInteractorProtocol
    private var presenter: ArticleMostPopularPresenterProtocol
        
    init(view: ArticleMostPopularPresenterToViewProtocol = ArticlesMostPopularViewController(),
         router: ArticleMostPopularPresenterToRouterProtocol = ArticlesMostPopularRouter(),
         interactor: ArticleMostPopularPresenterToInteractorProtocol = ArticleMostPopularInteractor(),
         presenter: ArticleMostPopularPresenterProtocol = ArticleMostPopularPresenter()) {
        self.view = view
        self.router = router
        self.interactor = interactor
        self.presenter = presenter
    }
}

extension ArticleMostPopularModule: AppModule {
    func assemble() -> UIViewController? {
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter

        return view as? UIViewController
    }
}
