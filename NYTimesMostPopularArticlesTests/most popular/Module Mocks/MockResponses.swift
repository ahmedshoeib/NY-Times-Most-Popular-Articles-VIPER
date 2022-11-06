//
//  MockResponses.swift
//  NYTimesMostPopularArticlesTests
//
//  Created by Ahmed Shoeib on 05/11/2022.
//

import Foundation
@testable import NYTimesMostPopularArticles

struct MockResponses {
    
    static func getArcticleMostPopularList() -> ArcticleMostPopularModel {
        let fileUrl = Bundle.main.url(forResource: "mostpopular", withExtension: "json")
        let data = try! Data(contentsOf: fileUrl!)

            let serviceResponseModel = try! JSONDecoder().decode(ArcticleMostPopularModel.self,from: data)
        
            return serviceResponseModel
    }
}
    
