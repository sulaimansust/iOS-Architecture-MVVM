//
//  NetworkManager.swift
//  MovieApp
//
//  Created by Md Sulayman on 24.12.22.
//

import Foundation
import Moya
import RxMoya
import RxSwift

class NetworkingManager: Networking {

    
    internal let provider: MoyaProvider<MovieAPI>
    private let disposeBag = DisposeBag()
    
    init(provider: MoyaProvider<MovieAPI>) {
        self.provider = provider
    }
    
    
    func getMovies(keyword: String, page: Int, type: String) -> Single<[Movie]> {
        return provider.rx
            .request(.getMovie(keyword: keyword, page: page, type: type))
            .flatMap{ (response) -> Single<[Movie]> in
                if 200 ... 299 ~= response.statusCode {
                    let decoder = JSONDecoder()
                    do {
                        let movieList = try decoder.decode(MovieList.self, from: response.data)
                        return Single.just(movieList.movies)
                    } catch let error {
                        let networkError = NetworkError(errorTitle: "Json Decode failed!", baseError: error)
                        return Single.error(networkError)
                    }
                } else {
                    let networkError = NetworkError(errorTitle: "Error: \(response.statusCode)", baseError: MoyaError.statusCode(response))
                    return Single.error(networkError)
                }
            }
        
    }
}
