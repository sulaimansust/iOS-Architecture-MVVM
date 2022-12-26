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

        return Single.just([movie, movie2])
    }
    
    func getMovieDetails(imdbId: String) -> Single<MovieDetails> {
        let posterUrl = "https://m.media-amazon.com/images/M/MV5BOGE4NzU1YTAtNzA3Mi00ZTA2LTg2YmYtMDJmMThiMjlkYjg2XkEyXkFqcGdeQXVyNTgzMDMzMTg@._V1_SX300.jpg"
        let movieDetails = MovieDetails(title: "Thor", year: "2022", rated: "PG-13", released: "Nov, 2022", runtime: "134 min", genre: "Horror, Comedy", director: "Director", writer: "Writer", actors: "salman khan", plot: "When thor sleeps..", language: "English", country: "Germany", awards: "Oscar", poster: posterUrl, ratings: [], metascore: "5", imdbRating: "4.5", imdbVotes: "566", imdbID: "tt1981115", type: "type", dvd: "dvd", boxOffice: "box", production: "prod", website: "n/a", response: "True")
        return Single.just(movieDetails)
    }
    
    
}
