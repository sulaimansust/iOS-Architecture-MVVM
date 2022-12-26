//
//  MovieFetchable.swift
//  MovieApp
//
//  Created by Md Sulayman on 25.12.22.
//

import Foundation
import RxSwift

public protocol LocalMovieService {
    func fetchMovies() -> Observable<[Movie]>
    func save(movies: [Movie])
    func save(details: MovieDetails)
    func fetchMovieDetails(imdbId: String) -> Observable<MovieDetails>
}
