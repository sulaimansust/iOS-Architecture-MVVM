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
        let posterUrl = "https://m.media-amazon.com/images/M/MV5BOGE4NzU1YTAtNzA3Mi00ZTA2LTg2YmYtMDJmMThiMjlkYjg2XkEyXkFqcGdeQXVyNTgzMDMzMTg@._V1_SX300.jpg"
        let movieDetails = MovieDetails(title: "Thor", year: "2022", rated: "PG-13", released: "Nov, 2022", runtime: "134 min", genre: "Horror, Comedy", director: "Director", writer: "Writer", actors: "salman khan", plot: "When thor sleeps..", language: "English", country: "Germany", awards: "Oscar", poster: posterUrl, ratings: [], metascore: "5", imdbRating: "4.5", imdbVotes: "566", imdbID: imdbId, type: "type", dvd: "dvd", boxOffice: "box", production: "prod", website: "n/a", response: "True")
        return Observable.just(movieDetails)
    }
    
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
