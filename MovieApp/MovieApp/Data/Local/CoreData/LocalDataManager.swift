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
    }
    
    func getMovies() -> [Movie] {
        let movies = CDMovie.fetch(stack: movieDataStack)
        return movies.map { Movie(title: $0.title ?? "", year: $0.year ?? "", imdbID: $0.imdbID ?? "", type: $0.type ?? "", poster: $0.poster ?? "")}

    }
}
