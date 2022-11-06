//
//  ArcticleMostPopularRepository.swift
//  NYTimesMostPopularArticles
//
//  Created by Ahmed Shoeib on 04/11/2022.
//

protocol ArticleMostPopularRepositoryProtocol {
    var service: Service {get set}
    func getMostPopularArticles(resultHandler: @escaping (Result<ArcticleMostPopularModel, AppErrror>) -> Void)
    init(service: Service)
}



class ArcticleMostPopularRepository: ArticleMostPopularRepositoryProtocol {
    
    var service: Service
    
    required init(service: Service = NetworkService()) {
        self.service = service
    }
    
    func getMostPopularArticles(resultHandler: @escaping (Result<ArcticleMostPopularModel, AppErrror>) -> Void) {
        
        let request = ArcticleMostPopularRequest()

        return service.build(request: request, completion: resultHandler)
    }
    
}
