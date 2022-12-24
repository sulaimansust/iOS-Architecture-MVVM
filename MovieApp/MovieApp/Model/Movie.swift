//
//  Movie.swift
//  MovieApp
//
//  Created by Md Sulayman on 24.12.22.
//

import Foundation


// MARK: - Movie
struct Movie: Codable {
    let title, year, imdbID: String
    let type: String
    let poster: String

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID
        case type = "Type"
        case poster = "Poster"
    }
}