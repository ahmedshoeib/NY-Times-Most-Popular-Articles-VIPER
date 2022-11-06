//
//  ArticleDetailsModuleMocks.swift
//  NYTimesMostPopularArticlesTests
//
//  Created by Ahmed Shoeib on 06/11/2022.
//

@testable import NYTimesMostPopularArticles

class MockArticleDetailsView: ArticleDetailsPresenterToViewProtocol {
    
    var setupViewFunctionIsCalled: Bool = false
    var selectedArticle: MostPopularArticle!
    
    func setupView(with article: NYTimesMostPopularArticles.MostPopularArticle) {
        self.selectedArticle = article
        self.setupViewFunctionIsCalled = true
    }
    
    var presenter: NYTimesMostPopularArticles.ArticleDetailsViewToPresenterProtocol?
}


class MockArticleDetailsPresenter: ArticleDetailsViewToPresenterProtocol {
    var article: MostPopularArticle
    
    var view: ArticleDetailsPresenterToViewProtocol?
    
    var router: ArticleDetailsPresenterToRouterProtocol?
    
    var viewDidLoadIsCalled: Bool = false

    init(article: MostPopularArticle, view: ArticleDetailsPresenterToViewProtocol?, router: ArticleDetailsPresenterToRouterProtocol? = nil) {
        self.article = article
        self.view = view
        self.router = router
    }
    
    func viewDidLoad() {
        self.viewDidLoadIsCalled = true
    }
}
