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
import UIKit

class MovieListViewModel: ViewModel {
    
    // Necessary Services
    private let httpMovieService: MovieApiService
    private let localMovieService: LocalMovieService
    
    // Will take care of memory freeing the reactive objects
    private var disposeBag = DisposeBag()
    
    // Handle app routing
    var steps: PublishRelay<Step> = PublishRelay<Step>()
    
    // Publish subject to handle reactive data and error passing from viewmodel to view
    private let moviesSubject: PublishSubject<[Movie]> = PublishSubject()
    private let isLoadingSubject: PublishSubject<Bool> = PublishSubject()
    private let errorSubject: PublishSubject<Error> = PublishSubject()
    
    // Public Observables , viewwill subscribe for events and response if a new event is received
    public var movies: Observable<[Movie]> {
        return moviesSubject.asObservable()
    }
    
    public var errors: Observable<Error> {
        return errorSubject.asObservable()
    }
    
    public var isLoading: Observable<Bool> {
        return isLoadingSubject.asObservable()
    }
    
    init(httpMovieService: MovieApiService, cachedMovieService: LocalMovieService) {
        self.httpMovieService = httpMovieService
        self.localMovieService = cachedMovieService
    }
    
    func getMovies(keyword: String, page: Int, type: String) {
        self.isLoadingSubject.onNext(true)
        self.httpMovieService
            .searchMovies(keyword: keyword, page: page, type: type)
            .subscribe(onSuccess: { [weak self] movies in
                self?.moviesSubject.onNext(movies)
                self?.save(movies: movies)
                self?.isLoadingSubject.onNext(false)
            }, onFailure: { [weak self] error in
                // We will not show an error right now, instead fetch data from local storage
                self?.fetchStoredMovies()
            }).disposed(by: disposeBag)

    }
    
    func fetchStoredMovies() {
        self.localMovieService
            .fetchMovies()
            .subscribe(onNext: { [weak self] movies in
                self?.moviesSubject.onNext(movies)
                self?.isLoadingSubject.onNext(false)

            }, onError: { [weak self] error in
                self?.errorSubject.onNext(error)
                self?.isLoadingSubject.onNext(false)

            })
            .disposed(by: disposeBag)
    }
    
    private func save(movies: [Movie]) {
        localMovieService.save(movies: movies)
    }
    
}

extension MovieListViewModel: Stepper {
    func navigateToMovieDetails(with info: MovieInfo ) {
        self.steps.accept(AppStep.movieDetails(info: info))
    }
}
