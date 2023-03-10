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
    /// Used to send a step/event to homeflow
    var steps: PublishRelay<Step> = PublishRelay()
    /// Will hold the observable/publishsubject object and clear the memory when no use..
    private let disposeBag = DisposeBag()
    let movieInfo: MovieInfo
    private let movieService: MovieApiService
    private let localMovieService: LocalMovieService
    
    // Will emit event to all the subscriber, will provide moviedetails when fetched
    private let movieDetailsSubject: PublishSubject<MovieDetails> = PublishSubject()
    // Will emit event to all the subscriber, will provide error when happened
    private let errorSubject: PublishSubject<Error> = PublishSubject()
    private let isLoadingSubject: PublishSubject<Bool> = PublishSubject()


    // UI will observe this and receive the movie details when available
    public var movieDetails: Observable<MovieDetails> {
        return movieDetailsSubject.asObservable()
    }
    
    public var errors: Observable<Error> {
        return errorSubject.asObservable()
    }
    
    public var isLoading: Observable<Bool> {
        return isLoadingSubject.asObservable()
    }
    
    
    init( movieInfo: MovieInfo, movieService: MovieApiService, localMovieService: LocalMovieService) {
        self.movieInfo = movieInfo
        self.movieService = movieService
        self.localMovieService = localMovieService
    }
    
    func getMovieDetails() {
        self.isLoadingSubject.onNext(true)
        self.movieService
            .getMovieDetails(imdbId: movieInfo.imdbId)
            .subscribe(onSuccess: { [weak self] details in
                self?.movieDetailsSubject.onNext(details)
                self?.save(details: details)
                self?.isLoadingSubject.onNext(false)

            }, onFailure: { [weak self] error in
                self?.getMovieDetailsFromStorage()
                // We will throw error only when both internet and local fetch fails ..
//                self?.errorSubject.onNext(error)
            })
            .disposed(by: disposeBag)
    }
    
    func getRottenTomatoRating(from details: MovieDetails) -> String {
        let rating = details.ratings.first(where: { $0.source == Constants.RatingsSource.rottenTomato.rawValue})
        return rating != nil ? rating!.value : "N/A"
    }
    
    func getMetacriticRating(from details: MovieDetails) -> String {
        let rating = details.ratings.first(where: { $0.source == Constants.RatingsSource.metacritic.rawValue})
        return rating != nil ? rating!.value : "N/A"
    }
    
    func getActors(from details: MovieDetails) -> [String] {
        return details.actors.components(separatedBy: ",")
    }
    
    private func save(details: MovieDetails) {
        localMovieService.save(details: details)
    }
    
    private func getMovieDetailsFromStorage()  {
        localMovieService.fetchMovieDetails(imdbId: movieInfo.imdbId)
            .subscribe(onNext: { [weak self] details  in
                self?.movieDetailsSubject.onNext(details)
                self?.isLoadingSubject.onNext(false)

            }, onError: { [weak self] error in
                self?.errorSubject.onNext(error)
                self?.isLoadingSubject.onNext(false)

            }).disposed(by: disposeBag)
    }
    
}

extension MovieDetailsViewModel: Stepper{
    /// Will handle navigation's from movie details
}
