//
//  MockCachedMovieService.swift
//  MovieAppTests
//
//  Created by Md Sulayman on 26.12.22.
//

import Foundation

import Foundation
import RxSwift

class MockCachedMovieService: LocalMovieService {
    func save(movies: [Movie]) {
        
    }
    
    func save(details: MovieDetails) {
        
    }
    
    func fetchMovieDetails(imdbId: String) -> Observable<MovieDetails> {
        return Observable.just(Seeds.movieDetails)
    }
    
    func fetchMovies() -> Observable<[Movie]> {
        return Observable.just(Seeds.movies)
    }
    
    
}
