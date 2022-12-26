//
//  LocalDataManager.swift
//  MovieApp
//
//  Created by Md Sulayman on 26.12.22.
//

import Foundation

class LocalDataManager {
    
    private let movieDataStack: MovieDataStack
    
    init(movieDataStack: MovieDataStack) {
        self.movieDataStack = movieDataStack
    }
    
    func save(movies: [Movie]) {
//        DispatchQueue.global().async { [unowned self] in
        for movie in movies {
            CDMovie.createOrUpdate(movie: movie, details: nil, with: movieDataStack)
        }
        self.movieDataStack.saveContext()
//        }
    }
    
    func save(details: MovieDetails) {
        CDMovieDetails.createOrUpdate(details: details, with: movieDataStack)
        self.movieDataStack.saveContext()
    }
    
    func getMovies() -> [Movie] {
        let movies = CDMovie.fetch(stack: movieDataStack)
        return movies.map { Movie(title: $0.title ?? "", year: $0.year ?? "", imdbID: $0.imdbID ?? "", type: $0.type ?? "", poster: $0.poster ?? "")}

    }
    
    func getMovieDetails(imdbId: String) -> [MovieDetails]{
        let movieDetails = CDMovieDetails.fetch(stack: movieDataStack, with: imdbId)
        // TODO: - Need to convert ratings
        return movieDetails.map {
            MovieDetails(title: $0.title ?? "", year: $0.year ?? "", rated: $0.rated ?? "", released: $0.released ?? "", runtime: $0.runtime ?? "", genre: $0.genre ?? "", director: $0.director ?? "", writer: $0.writer ?? "", actors: $0.actors ?? "", plot: $0.plot ?? "", language: $0.language ?? "", country: $0.country ?? "", awards: $0.awards ?? "", poster: $0.poster ?? "", ratings: [], metascore: $0.metascore ?? "", imdbRating: $0.imdbRating ?? "", imdbVotes: $0.imdbVotes ?? "", imdbID: $0.imdbID ?? "", type: $0.type ?? "", dvd: $0.dvd ?? "", boxOffice: $0.boxOffice ?? "", production: $0.production ?? "", website: $0.website ?? "", response: $0.response ?? "False")
        }
    }
}
