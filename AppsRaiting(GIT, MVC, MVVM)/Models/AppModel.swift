//
//  AppModel.swift
//  AppsRating(GIT, MVC, MVVM)
//
//  Created by Mikhail on 28.03.2021.
//

import Foundation

struct App: Codable {
    let feed: Feed
}

struct Feed: Codable {
    let results: [FeedResultsApp]
}

struct FeedResultsApp: Codable {
    let name: String
    let artistName: String
    let releaseDate: String
    let imageUrl: String
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case artistName = "artistName"
        case releaseDate = "releaseDate"
        case imageUrl = "artworkUrl100"
    }
}
