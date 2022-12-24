//
//  Networkable.swift
//  MovieApp
//
//  Created by Md Sulayman on 24.12.22.
//

import Foundation
import Moya
import RxSwift

protocol Networkable {
    var provider: MoyaProvider<MovieAPI> { get }
    func getMovies(keyword: String, page: Int, type: String) -> Single<[Movie]>
}
