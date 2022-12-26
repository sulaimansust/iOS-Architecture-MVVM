//
//  CDRating+CoreDataProperties.swift
//  MovieApp
//
//  Created by Md Sulayman on 26.12.22.
//
//

import Foundation
import CoreData


extension CDRating {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDRating> {
        return NSFetchRequest<CDRating>(entityName: "CDRating")
    }

    @NSManaged public var source: String?
    @NSManaged public var value: String?
    @NSManaged public var movieDetails: CDMovieDetails?

}

extension CDRating : Identifiable {

}
