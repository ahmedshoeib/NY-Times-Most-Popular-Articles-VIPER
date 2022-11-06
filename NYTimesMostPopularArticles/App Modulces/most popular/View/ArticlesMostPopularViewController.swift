//
//  ViewController.swift
//  NYTimesMostPopularArticles
//
//  Created by Ahmed Shoeib on 04/11/2022.
//

import UIKit

class ArticlesMostPopularViewController: UIViewController {

    var presenter: ArticleMostPopularPresenterViewToPresenterProtocol?

    // MARK: - IBOutlets
        @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
        presenter?.getMostPopularArticles()
    }


    func setupView() {
        
        title = "NY Times Most Popular Articles"
        self.tableView.registerCell(type: ArticleTableViewCell.self)
    }
}

// MARK: - Presenter To View Protocol
extension ArticlesMostPopularViewController: ArticleMostPopularPresenterToViewProtocol {
    
    func showLoading() {
        DispatchQueue.main.async {
            self.view.showBlurLoader()
        }
    }
    
    func hideLoading() {
        DispatchQueue.main.async {
            self.view.removeBluerLoader()
        }
    }
    
    func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func showErrorMessage(for error: AppErrror) {
        DispatchQueue.main.async {
            
            switch error {
                
            case .noFound:
                self.showInvalidDestination()
            case .badResponse:
                self.showBadResponse()
            case .noNetwork:
                self.showNoInterNetAvailabilityMessage()
            case .emptyResponse:
                self.showNoResponse()
            }
            
        }
    }
    
    func showInvalidDestination() {
        showAlert(title: "Invalid destination", message: "Please Check you internet connection and try again", actionTitle: "Okay")
    }
    
    func showNoInterNetAvailabilityMessage() {
        showAlert(title: "No Internet", message: "Please Check you internet connection and try again", actionTitle: "Okay")
    }
    
    func showBadResponse() {
        showAlert(title: "Bad Response", message: "Please Check you internet connection and try again", actionTitle: "Okay")
    }
    
    func showNoResponse() {
        showAlert(title: "No Data Found", message: "No Articles Found. please try again later", actionTitle: "Okay")
    }
    
    func showAlert(title:String,message:String,actionTitle:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: actionTitle, style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}

// MARK: - UITableViewDataSource
extension ArticlesMostPopularViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.articles?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueCell(
             withType: ArticleTableViewCell.self,
             for: indexPath) as? ArticleTableViewCell, let article = presenter?.getArticle(atIndex: indexPath) else {
                  return UITableViewCell()
        }
        
        cell.selectionStyle = .none
        cell.setupCell(article: article)

        return cell
    }
}


// MARK: - UITableViewDelegate
extension ArticlesMostPopularViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let article = presenter?.getArticle(atIndex: indexPath) else {
            return
        }
        
        presenter?.pushArticleDetailsScreen(article:article)
    }
}
