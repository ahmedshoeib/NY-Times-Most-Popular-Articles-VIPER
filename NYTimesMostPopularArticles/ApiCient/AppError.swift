//
//  AppError.swift
//  NYTimesMostPopularArticles
//
//  Created by Ahmed Shoeib on 04/11/2022.
//

import Foundation

//extension NSError {
//
//    static let noFound = NSError(domain: "com.app.NYTimesMostPopularArticles",
//                                 code: 404,
//                                 userInfo: [NSLocalizedDescriptionKey : "NO Found"])
//    static let badResponse = NSError(domain: "com.app.NYTimesMostPopularArticles",
//                                 code: 400,
//                                 userInfo: [NSLocalizedDescriptionKey : "Unable to decode response"])
//
//    static let noNetwork = NSError(domain: "com.app.NYTimesMostPopularArticles",
//                                     code: -1009,
//                                     userInfo: [NSLocalizedDescriptionKey : "The Internet connection appears to be offline."])
//
//    static let emptyResponse = NSError(domain: "com.app.NYTimesMostPopularArticles",
//                                 code: 200,
//                                 userInfo: [NSLocalizedDescriptionKey : "Response is Empty"])
//}

enum AppErrror: Error {
    case noFound
    case badResponse
    case noNetwork
    case emptyResponse
}
