//
//  ArticleDetailsViewController.swift
//  NYTimesMostPopularArticles
//
//  Created by Ahmed Shoeib on 06/11/2022.
//

import UIKit

class ArticleDetailsViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var articleTilleLabel: UILabel!
    @IBOutlet weak var articleAbstractLabel: UILabel!
    @IBOutlet weak var articleAuthorLabel: UILabel!
    @IBOutlet weak var articlePublishedDateLabel: UILabel!

    
    // MARK: - Properties
    var presenter: ArticleDetailsViewToPresenterProtocol?

    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
    }


    func setupView() {
        title = "Article Details"
        
        let article = presenter?.article
        
        articleTilleLabel.text = article?.title ?? ""
        articleAbstractLabel.text = article?.abstract ?? ""
        articleAuthorLabel.text = article?.byline
        articlePublishedDateLabel.text = article?.publishedDate ?? ""
        
        if let url = article?.media.first?.mediaMetadata.first?.url {
            articleImageView.downloaded(from: url)
        }else{
            articleImageView.fill(with: .lightGray)
        }
    }
}

// MARK: - Presenter To View Protocol
extension ArticleDetailsViewController: ArticleDetailsPresenterToViewProtocol {
    
   
}
