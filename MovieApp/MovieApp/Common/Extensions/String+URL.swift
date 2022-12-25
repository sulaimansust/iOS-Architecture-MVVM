//
//  String+URL.swift
//  MovieApp
//
//  Created by Md Sulayman on 25.12.22.
//

import Foundation

public extension String {
    /// Always check isValidURL before use
    var asURL: URL {
        return URL(string: self)!
    }
    
    /// Check if the String is a valid web URL
    var isValidURL: Bool {
        get {
            let regEx = "(http[^\\s]+(jpg|jpeg|png|tiff)\\b)"
            let predicate = NSPredicate(format: "SELF MATCHES %@", argumentArray: [regEx])
            return predicate.evaluate(with: self)
        }
    }
}
