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
        return Observable.create({ [weak self] observer in
            let movies = self?.localDataManager.getMovies() ?? []
            observer.onNext(movies)
            return Disposables.create()
        })
    }
    
    public func save(movies: [Movie]) {
        localDataManager.save(movies: movies)
    }
}
