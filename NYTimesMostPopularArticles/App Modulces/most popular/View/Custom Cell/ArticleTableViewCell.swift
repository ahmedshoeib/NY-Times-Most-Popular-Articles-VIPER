//
//  ArticleTableViewCell.swift
//  NYTimesMostPopularArticles
//
//  Created by Ahmed Shoeib on 05/11/2022.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var sectionLabel: UILabel!
    @IBOutlet weak var publishDateLabel: UILabel!
    @IBOutlet weak var articleIconImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupCell(article: MostPopularArticle) {
        titleLabel.text = article.title
        authorLabel.text = article.byline
        sectionLabel.text = article.section
        publishDateLabel.text = article.publishedDate
        
        if let url = article.media.first?.mediaMetadata.first?.url {
            articleIconImageView.downloaded(from: url)
        }else{
            articleIconImageView.fill(with: .lightGray)
        }

    }
    
}
