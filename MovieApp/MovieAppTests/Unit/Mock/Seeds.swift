//
//  Seeds.swift
//  MovieAppTests
//
//  Created by Md Sulayman on 26.12.22.
//

import Foundation

struct Seeds {
    static let movieInfo = MovieInfo(colorIndex: 1, imdbId: "tt0800369")
    
    static let posterUrl = "https://m.media-amazon.com/images/M/MV5BOGE4NzU1YTAtNzA3Mi00ZTA2LTg2YmYtMDJmMThiMjlkYjg2XkEyXkFqcGdeQXVyNTgzMDMzMTg@._V1_SX300.jpg"
    
    static let movie = Movie(title: "Title",
                      year: "2022",
                      imdbID: "tt0800369",
                      type: "movie",
                      poster: posterUrl)
    
    static let movie2 = Movie(title: "Title2",
                      year: "2022",
                      imdbID: "tt0800368",
                      type: "movie",
                      poster: posterUrl)
    
    static var ratings: [Rating] {
        return [
        Rating(source: "Internet Movie Database", value: "6.8/10"),
        Rating(source: "Rotten Tomatoes", value: "66%"),
        Rating(source: "Metacritic", value: "54/100"),

        ]
    }
    
    static let movieDetails = MovieDetails(title: "Thor", year: "2022", rated: "PG-13", released: "Nov, 2022", runtime: "134 min", genre: "Horror, Comedy", director: "Director", writer: "Writer", actors: "salman khan", plot: "When thor sleeps..", language: "English", country: "Germany", awards: "Oscar", poster: posterUrl, ratings: ratings, metascore: "5", imdbRating: "4.5", imdbVotes: "566", imdbID: "tt0800369", type: "type", dvd: "dvd", boxOffice: "box", production: "prod", website: "n/a", response: "True")
    
    static var movies: [Movie] {
        return [movie,movie2]
    }
}
