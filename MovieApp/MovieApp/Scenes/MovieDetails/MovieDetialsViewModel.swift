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
    private let imdbId: String
    init(imdbId: String) {
        self.imdbId = imdbId
    }
}

extension MovieDetailsViewModel: Stepper{
    
}
