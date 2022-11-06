//
//  ArcticleMostPopularRepository.swift
//  NYTimesMostPopularArticles
//
//  Created by Ahmed Shoeib on 04/11/2022.
//

protocol ArticleMostPopularRepositoryProtocol {
    var service: Service {get set}
    func getMostPopularArticles(resultHandler: @escaping (Result<ArcticleMostPopularModel, AppErrror>) -> Void)
    init(service: Service, testing:Bool)
}



class ArcticleMostPopularRepository: ArticleMostPopularRepositoryProtocol {
    
    var service: Service
    var testing:Bool
    required init(service: Service, testing:Bool) {
        self.service = service
        self.testing = testing
    }
    
    func getMostPopularArticles(resultHandler: @escaping (Result<ArcticleMostPopularModel, AppErrror>) -> Void) {
        
        if testing {
            resultHandler(.success(MockResponses.getArcticleMostPopularList()))
            return
        }
        let request = ArcticleMostPopularRequest()

        return service.build(request: request, completion: resultHandler)
    }
    
}
