//
//  SplashViewModel.swift
//  MovieApp
//
//  Created by Md Sulayman on 23.12.22.
//

import Foundation
import RxFlow
import RxSwift
import RxCocoa

/// ViewModel for splash view

class SplashViewModel: ViewModel {
    private let disposeBag = DisposeBag()
    let steps: PublishRelay<Step> = PublishRelay<Step>()
}
extension SplashViewModel: Stepper {
    /// Send an event to Coordinator that the splash is complete.
    /// And Coordinator will navigate the app to different screen upon receiving of this event.
    func finishSplash() {
        self.steps.accept(AppStep.splashComplete)
    }
}
