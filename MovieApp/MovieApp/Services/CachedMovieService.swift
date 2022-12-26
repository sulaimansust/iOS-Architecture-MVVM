//
//  CachedMovieService.swift
//  MovieApp
//
//  Created by Md Sulayman on 25.12.22.
//

import Foundation
import RxSwift

/// CachedMovieService - Will provide previously stored movies when the network is not available

public class CachedMovieService: LocalMovieService {

    
    private let localDataManager: LocalDataManager
    
    init(localDataManager: LocalDataManager) {
        self.localDataManager = localDataManager
    }
    
    public func fetchMovies() -> Observable<[Movie]> {
        return Observable.create({ [unowned self] observer in
            let movies = self.localDataManager.getMovies()
            observer.onNext(movies)
            return Disposables.create()
        })
    }
    
    public func save(movies: [Movie]) {
        localDataManager.save(movies: movies)
    }
    
    public func save(details: MovieDetails) {
        localDataManager.save(details: details)
    }
    
    public func fetchMovieDetails(imdbId: String) -> Observable<MovieDetails> {
        return Observable.create({ [unowned self] observer in
            let movieDetails = self.localDataManager.getMovieDetails(imdbId: imdbId).first
            if let details = movieDetails {
                observer.onNext(details)
            } else {
                observer.onError(NSError(domain: "No movie details found", code: 404))
            }
            return Disposables.create()
        })
        
    }

}
