//
//  MockMovieApiService.swift
//  MovieAppTests
//
//  Created by Md Sulayman on 26.12.22.
//

import Foundation
import RxSwift


class MockMovieApiService: MovieApiService {
    func searchMovies(keyword: String, page: Int, type: String) -> Single<[Movie]> {
        return Single.just(Seeds.movies)
    }
    
    func getMovieDetails(imdbId: String) -> Single<MovieDetails> {
        return Single.just(Seeds.movieDetails)
    }
    
    
}
