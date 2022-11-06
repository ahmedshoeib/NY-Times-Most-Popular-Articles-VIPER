//
//  NetworkService.swift
//  NYTimesMostPopularArticles
//
//  Created by Ahmed Shoeib on 04/11/2022.
//

import Foundation


protocol Request {
    var urlRequest: URLRequest { get }
}

protocol Service {
    var reachability:ReachabilityProtocol? { get set }
    
    init(reachability:ReachabilityProtocol?)
    
    func build<T: Decodable>(request: Request, completion: @escaping (Result<T, AppErrror>) -> Void)
}

final class NetworkService: Service {
    
    var reachability: ReachabilityProtocol?
    
    init(reachability: ReachabilityProtocol? = Reachability()) {
        self.reachability = reachability
    }
    
    
    
    func build<T: Decodable>(request: Request, completion: @escaping (Result<T, AppErrror>) -> Void) {
        
        guard let reachability = reachability else {
            completion(.failure(AppErrror.noNetwork))
            return
        }
        
        if reachability.isConnectedToNetwork() {
            URLSession.shared.dataTask(with: request.urlRequest) { (data, response, error) in
                guard let data = data else {
                    completion(.failure(AppErrror.noFound))
                    return
                }
                
                do{
                    let serviceResponseModel = try JSONDecoder().decode(T.self,from: data)
                    completion(.success(serviceResponseModel))
                    return
                }catch let error {
                    print(error.localizedDescription)
                    completion(.failure(AppErrror.badResponse))
                    return
                }
                
            }.resume()
            
        }else {
            completion(.failure(AppErrror.noNetwork))
            return
        }
 
    }
}
