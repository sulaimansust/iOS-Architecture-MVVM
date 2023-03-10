//
//  HTTPMovieService.swift
//  MovieApp
//
//  Created by Md Sulayman on 24.12.22.
//

import Foundation
import RxSwift
/// HTTPMovieService - Will provide list of Movies from the OMBD movie database ..
class HTTPMovieService: MovieApiService {
    
    private let networkProvider: NetworkingManager
    
    init(provider: NetworkingManager) {
        self.networkProvider = provider
    }
    
    func searchMovies(keyword: String, page: Int, type: String) -> Single<[Movie]> {
        return self.networkProvider.getMovies(keyword: keyword, page: page, type: type)
    }
    
    func getMovieDetails(imdbId: String) -> Single<MovieDetails> {
        return self.networkProvider.getMovieDetails(imdbId: imdbId)
    }
    
    
}
