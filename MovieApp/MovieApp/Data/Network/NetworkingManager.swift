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
            .flatMap{ [unowned self] (response) -> Single<[Movie]> in
                let movieList: Single<MovieList> = self.reponseToObject(response: response)
                return movieList.flatMap({Single.just($0.movies)})
            }
//        return Single.just([])
    }
    
    func getMovieDetails(imdbId: String) -> Single<MovieDetails>{
        return provider.rx
            .request(.getMovieDetails(imdbId: imdbId))
            .flatMap({ [unowned self] (response) -> Single<MovieDetails> in
                return self.reponseToObject(response: response)
            })
    }
    
    private func reponseToObject<T: Codable>(response: Response) -> Single<T>{
        if 200 ... 299 ~= response.statusCode {
            let decoder = JSONDecoder()
            do {
                let dataObject = try decoder.decode(T.self, from: response.data)
                return Single.just(dataObject)
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
