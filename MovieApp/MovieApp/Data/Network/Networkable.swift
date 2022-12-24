//
//  Networkable.swift
//  MovieApp
//
//  Created by Md Sulayman on 24.12.22.
//

import Foundation
import Moya

protocol Networkable {
    var provider: MoyaProvider<MovieAPI> { get }
    func getMovie(keyword: String, page: Int, type: String, completion: ([Movie]?, Error?) -> ())
}
