//
//  CDMovieDetails+CoreDataProperties.swift
//  MovieApp
//
//  Created by Md Sulayman on 26.12.22.
//
//

import Foundation
import CoreData


extension CDMovieDetails {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDMovieDetails> {
        return NSFetchRequest<CDMovieDetails>(entityName: "CDMovieDetails")
    }
    
    internal class func createOrUpdate(details: MovieDetails, with stack: MovieDataStack) {
        var movieDetails: CDMovieDetails?
        let movieFetch: NSFetchRequest<CDMovieDetails> = CDMovieDetails.fetchRequest()
        
        let predicate = NSPredicate(format: "imdbID = %@", details.imdbID)
        movieFetch.predicate = predicate
//        NSCompoundPredicate(andPredicateWithSubpredicates: [predicate])
        do {
            let results = try stack.managedContext.fetch(movieFetch)
            if results.isEmpty {
                movieDetails = CDMovieDetails(context: stack.managedContext)
            } else {
                movieDetails = results.first
            }
            movieDetails?.update(with: details, and: stack)
        } catch let error as NSError {
            print("Fetch error: \(error) description: \(error.userInfo)")

        }
    }
    
    internal func update(with movieDetails:  MovieDetails, and stack: MovieDataStack){
        self.title = movieDetails.title
        self.year  = movieDetails.year
        self.rated = movieDetails.rated
        self.released = movieDetails.released
        self.runtime  = movieDetails.runtime
        self.genre = movieDetails.genre
        self.director = movieDetails.director
        self.writer = movieDetails.writer
        self.actors = movieDetails.actors
        self.plot   = movieDetails.plot
        self.language = movieDetails.language
        self.country = movieDetails.country
        self.awards = movieDetails.awards
        self.poster = movieDetails.poster
        self.metascore = movieDetails.metascore
        self.imdbRating = movieDetails.imdbRating
        self.imdbID = movieDetails.imdbID
        self.type = movieDetails.type
        // TODO: - Some properties are not added
    }

    @NSManaged public var title: String?
    @NSManaged public var year: String?
    @NSManaged public var rated: String?
    @NSManaged public var released: String?
    @NSManaged public var runtime: String?
    @NSManaged public var genre: String?
    @NSManaged public var director: String?
    @NSManaged public var writer: String?
    @NSManaged public var actors: String?
    @NSManaged public var plot: String?
    @NSManaged public var language: String?
    @NSManaged public var country: String?
    @NSManaged public var awards: String?
    @NSManaged public var poster: String?
    @NSManaged public var metascore: String?
    @NSManaged public var imdbRating: String?
    @NSManaged public var imdbVotes: String?
    @NSManaged public var imdbID: String?
    @NSManaged public var type: String?
    @NSManaged public var dvd: String?
    @NSManaged public var boxOffice: String?
    @NSManaged public var production: String?
    @NSManaged public var website: String?
    @NSManaged public var response: String?
    @NSManaged public var ratings: NSSet?
    @NSManaged public var movie: CDMovie?

}

// MARK: Generated accessors for ratings
extension CDMovieDetails {

    @objc(addRatingsObject:)
    @NSManaged public func addToRatings(_ value: CDRating)

    @objc(removeRatingsObject:)
    @NSManaged public func removeFromRatings(_ value: CDRating)

    @objc(addRatings:)
    @NSManaged public func addToRatings(_ values: NSSet)

    @objc(removeRatings:)
    @NSManaged public func removeFromRatings(_ values: NSSet)

}

extension CDMovieDetails : Identifiable {

}
