//
//  MostPopular.swift
//  PomacTask
//
//  Created by Khaled Rashed on 8/27/20.
//  Copyright © 2020 Khaled Rashed. All rights reserved.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let mostPopular = try? newJSONDecoder().decode(MostPopular.self, from: jsonData)

import Foundation

// MARK: - MostPopular
struct MostPopular: Codable {
    let status, copyright: String
    let numResults: Int
    let results: [Article]

    enum CodingKeys: String, CodingKey {
        case status, copyright
        case numResults = "num_results"
        case results
    }
}

// MARK: - Result
struct Article: Codable {
    let uri: String
    let url: String
    let id, assetID: Int
    let source: Source
    let publishedDate, updated, section: String
    let subsection: Subsection
    let nytdsection, adxKeywords, byline: String
    let type: ResultType
    let title, abstract: String
    let desFacet: [String]
    let geoFacet: [String]?
    let media: [Media]
    let etaID: Int
    let orgFacet, perFacet: [String]?

    enum CodingKeys: String, CodingKey {
        case uri, url, id
        case assetID = "asset_id"
        case source
        case publishedDate = "published_date"
        case updated, section, subsection, nytdsection
        case adxKeywords = "adx_keywords"
        case byline, type, title, abstract
        case desFacet = "des_facet"
        case geoFacet = "geo_facet"
        case media
        case etaID = "eta_id"
        case orgFacet = "org_facet"
        case perFacet = "per_facet"
    }
}

// MARK: - Media
struct Media: Codable {
    let type: MediaType
    let subtype: Subtype
    let caption, copyright: String
    let approvedForSyndication: Int
    let mediaMetadata: [MediaMetadatum]

    enum CodingKeys: String, CodingKey {
        case type, subtype, caption, copyright
        case approvedForSyndication = "approved_for_syndication"
        case mediaMetadata = "media-metadata"
    }
}

// MARK: - MediaMetadatum
struct MediaMetadatum: Codable {
    let url: String
    let format: Format
    let height, width: Int
}

enum Format: String, Codable {
    case mediumThreeByTwo210 = "mediumThreeByTwo210"
    case mediumThreeByTwo440 = "mediumThreeByTwo440"
    case standardThumbnail = "Standard Thumbnail"
}

enum Subtype: String, Codable {
    case photo = "photo"
}

enum MediaType: String, Codable {
    case image = "image"
}

enum Source: String, Codable {
    case newYorkTimes = "New York Times"
}

enum Subsection: String, Codable {
    case empty = ""
    case music = "Music"
    case politics = "Politics"
}

enum ResultType: String, Codable {
    case article = "Article"
}
