//
//  RSSAppData.swift
//  AppstoreSample
//
//  Created by Nomad on 2019/11/13.
//  Copyright © 2019 Nomad. All rights reserved.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let rssappdata = try? newJSONDecoder().decode(Rssappdata.self, from: jsonData)

// MARK: - RSS App Data
struct RssAppData: Codable {
    let feed: RSSFeed
}

// MARK: - Feed
struct RSSFeed: Codable {
    let title: String
    let id: String
    let author: Authors
    let links: [Link]
    let copyright, country: String
    let icon: String
    let updated: String
    let results: [Results]
}

// MARK: - Author
struct Authors: Codable {
    let name: String
    let uri: String
}

// MARK: - Link
struct Link: Codable {
    let linkSelf: String?
    let alternate: String?

    enum CodingKeys: String, CodingKey {
        case linkSelf = "self"
        case alternate
    }
}

// MARK: - Result
struct Results: Codable {
    let artistName, id, releaseDate, name: String
    let kind: Kind
    let copyright, artistID: String
    let artistURL: String
    let artworkUrl100: String
    let genres: [Genre]
    let url: String

    enum CodingKeys: String, CodingKey {
        case artistName, id, releaseDate, name, kind, copyright
        case artistID = "artistId"
        case artistURL = "artistUrl"
        case artworkUrl100, genres, url
    }
}

// MARK: - Genre
struct Genre: Codable {
    let genreID, name: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case genreID = "genreId"
        case name, url
    }
}

enum Kind: String, Codable {
    case iosSoftware = "iosSoftware"
}
