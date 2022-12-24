//
//  MovieAPI+Testing.swift
//  MovieApp
//
//  Created by Md Sulayman on 24.12.22.
//

import Foundation

extension MovieAPI {
    /// Provide sample data while testing API
    var sampleData: Data {
        switch self {
        case .getMovie:
            //TODO: - Send proper file name later
            return stubbedResponse("file_name")
        }
    }
    
    
    // TODO: - Implement this method later. load json from file here..
    
    /// Read json file and return it as Data
    func stubbedResponse(_ fileName: String) -> Data {
        return Data.init()
    }
}
