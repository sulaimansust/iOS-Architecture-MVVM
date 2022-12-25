//
//  MovieFetchable.swift
//  MovieApp
//
//  Created by Md Sulayman on 25.12.22.
//

import Foundation
import RxSwift

public protocol MovieFetchable {
    func fetchMovies() -> Observable<[Movie]>
}
