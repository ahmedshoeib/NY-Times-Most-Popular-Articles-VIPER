//
//  ArticleDetailsPresenter.swift
//  NYTimesMostPopularArticles
//
//  Created by Ahmed Shoeib on 06/11/2022.
//

import Foundation


class ArticleDetailsPresenter: ArticleDetailsViewToPresenterProtocol {
    
    var view: ArticleDetailsPresenterToViewProtocol?

    var router: ArticleDetailsPresenterToRouterProtocol?
    
    private(set) var article: MostPopularArticle
    
    init(article: MostPopularArticle) {
        self.article = article
    }
       
    func viewDidLoad() {
        view?.setupView(with: article)
    }
}
