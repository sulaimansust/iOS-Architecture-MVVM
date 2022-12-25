//
//  MovieAPI.swift
//  MovieApp
//
//  Created by Md Sulayman on 24.12.22.
//

import Foundation

enum MovieAPI {
    case getMovie(keyword: String, page: Int, type: String)
    case getMovieDetails(imdbId: String)
}
