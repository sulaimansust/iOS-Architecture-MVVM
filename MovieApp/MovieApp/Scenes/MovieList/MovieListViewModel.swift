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
    
    private var disposeBag = DisposeBag()
    
    var steps: PublishRelay<Step> = PublishRelay<Step>()
    
}

extension MovieListViewModel: Stepper {
    func navigateToMovieDetails() {
        
    }
}
