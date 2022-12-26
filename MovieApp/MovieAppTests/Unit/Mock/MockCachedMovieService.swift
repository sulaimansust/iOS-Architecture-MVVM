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
    func fetchMovies() -> Observable<[Movie]> {
        let posterUrl = "https://m.media-amazon.com/images/M/MV5BOGE4NzU1YTAtNzA3Mi00ZTA2LTg2YmYtMDJmMThiMjlkYjg2XkEyXkFqcGdeQXVyNTgzMDMzMTg@._V1_SX300.jpg"
        let movie = Movie(title: "Title",
                          year: "2022",
                          imdbID: "tt0800369",
                          type: "movie",
                          poster: posterUrl)
        let movie2 = Movie(title: "Title2",
                          year: "2022",
                          imdbID: "tt0800368",
                          type: "movie",
                          poster: posterUrl)

        return Observable.just([movie, movie2])
    }
    
    
}
