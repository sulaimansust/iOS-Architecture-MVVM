//
//  MovieList.swift
//  MovieApp
//
//  Created by Md Sulayman on 24.12.22.
//

import Foundation

import Foundation

// MARK: - MovieList
struct MovieList: Codable {
    let movies: [Movie]
    let totalResults, response: String

    enum CodingKeys: String, CodingKey {
        case movies = "Search"
        case totalResults
        case response = "Response"
    }
}

