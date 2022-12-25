//
//  StringFormatHelper.swift
//  MovieApp
//
//  Created by Md Sulayman on 25.12.22.
//

import Foundation

public class StringFormatHelper {
    public static func getIntial(from text: String) -> String {
        let trimmedText = text.trimmingCharacters(in: .whitespacesAndNewlines)
        let words = trimmedText.components(separatedBy: " ")
        var initial = ""
        for item in words {
            initial = "\(initial)\(item.first!.uppercased())."
        }
        return initial
    }
    
    public static func getTypeAndGenre(from movie: MovieDetails) -> String {
        return "\(movie.runtime) - \(movie.genre) - \(movie.year)"
    }
}
