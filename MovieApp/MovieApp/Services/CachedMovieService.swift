//
//  CachedMovieService.swift
//  MovieApp
//
//  Created by Md Sulayman on 25.12.22.
//

import Foundation
import RxSwift

/// CachedMovieService - Will provide previously stored movies when the network is not available

public class CachedMovieService: MovieFetchable {
    //TODO: - Implement this method later..
    public func fetchMovies() -> Observable<[Movie]> {
        return Observable.empty()
    }
    
}
