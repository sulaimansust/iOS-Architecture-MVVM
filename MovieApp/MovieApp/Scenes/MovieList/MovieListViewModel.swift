//
//  MovieListViewModel.swift
//  MovieApp
//
//  Created by Md Sulayman on 23.12.22.
//

import Foundation
import RxFlow
import RxCocoa
import RxSwift

class MovieListViewModel: ViewModel {
    
    // Necessary Services
    private let httpMovieService: MovieSearchable
    private let cachedMovieService: MovieFetchable
    
    // Will take care of memory freeing the reactive objects
    private var disposeBag = DisposeBag()
    
    // Handle app routing
    var steps: PublishRelay<Step> = PublishRelay<Step>()
    
    // Publish subject to handle reactive data and error passing from viewmodel to view
    private let moviesSubject: PublishSubject<[Movie]> = PublishSubject()
    private let errorSubject: PublishSubject<Error> = PublishSubject()
    
    // Public Observables , viewwill subscribe for events and response if a new event is received
    public var movies: Observable<[Movie]> {
        return moviesSubject.asObservable()
    }
    
    public var errors: Observable<Error> {
        return errorSubject.asObservable()
    }
    
    init(httpMovieService: MovieSearchable, cachedMovieService: MovieFetchable) {
        self.httpMovieService = httpMovieService
        self.cachedMovieService = cachedMovieService
    }
    
    func getMovies(keyword: String, page: Int, type: String) {

        self.httpMovieService
            .getMovies(keyword: keyword, page: page, type: type)
            .subscribe(onSuccess: { [weak self] movies in
                self?.moviesSubject.onNext(movies)
            }, onFailure: { [weak self] error in
                self?.errorSubject.onNext(error)
            }).disposed(by: disposeBag)
    }
    
    func fetchStoredMovies() {
        self.cachedMovieService
            .fetchMovies()
            .subscribe(onNext: { [weak self] movies in
                self?.moviesSubject.onNext(movies)
            }, onError: { [weak self] error in
                self?.errorSubject.onNext(error)
            })
            .disposed(by: disposeBag)
    }
    
}

extension MovieListViewModel: Stepper {
    func navigateToMovieDetails(imdbId: String) {
        self.steps.accept(AppStep.movieDetials(imdbId: imdbId))
    }
}
