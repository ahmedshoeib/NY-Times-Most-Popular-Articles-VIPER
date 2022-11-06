//
//  Mocks.swift
//  NYTimesMostPopularArticlesTests
//
//  Created by Ahmed Shoeib on 05/11/2022.
//

import Foundation
@testable import NYTimesMostPopularArticles

//MARK: Rechability returns true
struct MockAvailableReachability: ReachabilityProtocol {
    func isConnectedToNetwork() -> Bool {
        return true
    }
}

//MARK: Rechability returns false
struct MockNoReachability: ReachabilityProtocol {
    func isConnectedToNetwork() -> Bool {
        return false
    }
}


//MARK: Mock Request
struct MockRequest: Request {
    var urlRequest: URLRequest {
        return URLRequest(url: url)
    }
    
    var url: URL
}

//MARK: Empty Decodable
struct EmptyDeodable: Decodable {
}
