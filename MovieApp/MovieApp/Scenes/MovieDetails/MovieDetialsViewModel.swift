//
//  MovieDetialsViewModel.swift
//  MovieApp
//
//  Created by Md Sulayman on 25.12.22.
//

import Foundation
import RxFlow
import RxSwift
import RxCocoa

class MovieDetailsViewModel: ViewModel {
    
    var steps: PublishRelay<Step> = PublishRelay()
    private let disposeBag = DisposeBag()
    private let movie: Movie
    private let movieService: MovieSearchable
    
    init(movie: Movie, service: MovieSearchable) {
        self.movie = movie
        self.movieService = service
    }
    
    func getMovieDetails() {
        self.movieService
            .getMovieDetails(imdbId: movie.imdbID)
            .asObservable()
            .subscribe(onNext: { movieDetails in
                print(movieDetails)
            }).disposed(by: disposeBag)
    }
    
}

extension MovieDetailsViewModel: Stepper{
    /// Will handle navigation's from movie details
}
