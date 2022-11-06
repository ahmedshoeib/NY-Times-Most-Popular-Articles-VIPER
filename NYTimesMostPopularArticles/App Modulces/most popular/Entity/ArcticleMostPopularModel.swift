//
//  ArcticleMostPopularResponseModel.swift
//  NYTimesMostPopularArticles
//
//  Created by Ahmed Shoeib on 04/11/2022.
//

import Foundation

// MARK: - ArcticleMostPopularResponseModel
struct ArcticleMostPopularModel: Decodable {
    let status, copyright: String
    let numResults: Int
    let results: [MostPopularArticle]?

    enum CodingKeys: String, CodingKey {
        case status, copyright
        case numResults = "num_results"
        case results = "results"
    }
}

// MARK: - Result
struct MostPopularArticle: Decodable {
    let uri: String
    let url: String
    let id, assetID: Int
    let source: String
    let publishedDate, updated, section, subsection: String
    let nytdsection, adxKeywords: String
    let column: String?
    let byline: String
    let type: ArticleResultType
    let title, abstract: String
    let desFacet, orgFacet, perFacet, geoFacet: [String]
    let media: [ArticleMedia]
    let etaID: Int

    enum CodingKeys: String, CodingKey {
        case uri, url, id
        case assetID = "asset_id"
        case source
        case publishedDate = "published_date"
        case updated, section, subsection, nytdsection
        case adxKeywords = "adx_keywords"
        case column, byline, type, title, abstract
        case desFacet = "des_facet"
        case orgFacet = "org_facet"
        case perFacet = "per_facet"
        case geoFacet = "geo_facet"
        case media
        case etaID = "eta_id"
    }
}

// MARK: - Media
struct ArticleMedia: Decodable {
    let type: ArticleMediaType
    let subtype: ArticleSubtype
    let caption, copyright: String
    let approvedForSyndication: Int
    let mediaMetadata: [ArticleMediaMetadatum]

    enum CodingKeys: String, CodingKey {
        case type, subtype, caption, copyright
        case approvedForSyndication = "approved_for_syndication"
        case mediaMetadata = "media-metadata"
    }
}

// MARK: - MediaMetadatum
struct ArticleMediaMetadatum: Decodable {
    let url: String
    let format: ArticleFormat
    let height, width: Int
}

enum ArticleFormat: String, Decodable {
    case mediumThreeByTwo210 = "mediumThreeByTwo210"
    case mediumThreeByTwo440 = "mediumThreeByTwo440"
    case standardThumbnail = "Standard Thumbnail"
}

enum ArticleSubtype: String, Decodable {
    case photo = "photo"
}

enum ArticleMediaType: String, Decodable {
    case image = "image"
}

enum ArticleResultType: String, Codable {
    case article = "Article"
}
