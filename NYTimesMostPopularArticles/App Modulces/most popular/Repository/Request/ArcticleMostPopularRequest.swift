//
//  ArcticleMostPopularRequest.swift
//  NYTimesMostPopularArticles
//
//  Created by Ahmed Shoeib on 04/11/2022.
//

import Foundation

class ArcticleMostPopularRequest: Request {
    var urlRequest: URLRequest {
        return URLRequest(url: url)
    }
    
    var url: URL = URL(string: "http://api.nytimes.com/svc/mostpopular/v2/viewed/1.json?api-key=qwiFWqKlKtPFmftmAOFrrhkMVrItwYxY")!
}

