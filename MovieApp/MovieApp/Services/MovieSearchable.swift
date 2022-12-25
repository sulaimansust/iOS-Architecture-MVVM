//
//  MovieService.swift
//  MovieApp
//
//  Created by Md Sulayman on 24.12.22.
//

import Foundation
import RxSwift

protocol MovieSearchable {
    func getMovies(keyword: String, page: Int, type: String) -> Single<[Movie]>
}
