//
//  AppFlow.swift
//  MovieApp
//
//  Created by Md Sulayman on 23.12.22.
//

import Foundation
import UIKit
import RxFlow

/// This is the center entry point for handling application navigation.
/// AppFlow will handle child Flow and will be center of handling app navigation based on different screen directions
///
class AppFlow: Flow {
    
    private let rootWindow: UIWindow
    
    var root: Presentable {
        return self.rootWindow
    }
    
    init(with window: UIWindow) {
        self.rootWindow = window
    }
    
    func navigate(to step: RxFlow.Step) -> RxFlow.FlowContributors {
        guard let step = step as? AppStep else { return .none}
        switch step {
        case .splash:
            return navigateToSplashFlow()
        case .splashComplete:
            return navigateToHomeFlow()
        default:
            return .none
        }
    }
    
    private func navigateToSplashFlow() -> FlowContributors {
        let splashFlow = SplashFlow()
        
        Flows.use(splashFlow, when: .ready) { [unowned self] (root) in
            self.rootWindow.rootViewController = root
        }
        
        return .one(flowContributor: .contribute(withNextPresentable: splashFlow, withNextStepper: OneStepper(withSingleStep: AppStep.splash)))
    }
    
    private func navigateToHomeFlow() -> FlowContributors {
        let homeFlow = HomeFlow()
        
        Flows.use(homeFlow, when: .ready) { [unowned self] (root) in
            self.rootWindow.rootViewController = root
        }
        
        return .one(flowContributor: .contribute(withNextPresentable: homeFlow, withNextStepper: OneStepper(withSingleStep: AppStep.home)))
    }
    
}
