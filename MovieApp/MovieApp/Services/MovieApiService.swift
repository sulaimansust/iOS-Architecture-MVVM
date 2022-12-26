//
//  MovieService.swift
//  MovieApp
//
//  Created by Md Sulayman on 24.12.22.
//

import Foundation
import RxSwift

protocol MovieApiService {
    func getMovies(keyword: String, page: Int, type: String) -> Single<[Movie]>
    func getMovieDetails(imdbId: String) -> Single<MovieDetails>
}
