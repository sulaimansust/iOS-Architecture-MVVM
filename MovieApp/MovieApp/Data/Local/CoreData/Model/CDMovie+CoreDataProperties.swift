//
//  CDMovie+CoreDataProperties.swift
//  MovieApp
//
//  Created by Md Sulayman on 26.12.22.
//
//

import Foundation
import CoreData


extension CDMovie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDMovie> {
        return NSFetchRequest<CDMovie>(entityName: "CDMovie")
    }
    
    public class func createOrUpdate(movie: Movie, details: MovieDetails?, with stack: MovieDataStack) {
        var newMovie: CDMovie?
        
        let predicate = NSPredicate(format: "imdbID = %@", movie.imdbID)
        
        let results = CDMovie.fetch(stack: stack, with: predicate)

        if results.isEmpty {
            newMovie = CDMovie(context: stack.managedContext)
            newMovie?.create(with: movie)
        } else {
            newMovie = results.first
            if let details = details {
                newMovie?.update(with: details)
            }
        }

    }
    
    public func update(with details: MovieDetails) {
 
        //TODO: - Need to update movie with details later..
//        self.movieDetails
    }
    public func create(with movie: Movie) {
        self.title = movie.title
        self.imdbID = movie.imdbID
        self.poster = movie.poster
        self.type = movie.type
        self.year = movie.year
    }
    
    public class func fetch(stack: MovieDataStack, with predicate: NSPredicate? = nil) -> [CDMovie] {
        let movieFetch: NSFetchRequest<CDMovie> = CDMovie.fetchRequest()
        if let predicate = predicate {
            movieFetch.predicate = predicate
        }
        do {
            return try stack.managedContext.fetch(movieFetch)
        } catch let error as NSError {
            print("Fetch error: \(error) description: \(error.userInfo)")
            return []
        }
    }

    @NSManaged public var poster: String?
    @NSManaged public var type: String?
    @NSManaged public var imdbID: String?
    @NSManaged public var year: String?
    @NSManaged public var title: String?
    @NSManaged public var movieDetails: CDMovieDetails?

}

extension CDMovie : Identifiable {

}
