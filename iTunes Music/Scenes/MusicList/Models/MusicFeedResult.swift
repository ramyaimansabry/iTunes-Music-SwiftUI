//
//  MusicFeedResult.swift
//  iTunes Music
//
//  Created by Ramy Sabry on 26/07/2021.
//

import Foundation

struct RSSResult: Codable {
    let feed: MusicFeedResult
}

struct MusicFeedResult: Codable {
    let title: String
    let id: String
    let country: String
    let results: [Music]
}

struct Music: Codable, Hashable {
    let artistName: String
    let id: String
    let releaseDate: String
    let name: String
    let kind: String
    let copyright: String
    let artistId: String
//    let contentAdvisoryRating: String
    let artistUrl: String
    let url: String
    let artworkUrl100: String
}
