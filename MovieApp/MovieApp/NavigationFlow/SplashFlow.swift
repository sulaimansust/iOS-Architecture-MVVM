//
//  SplashFlow.swift
//  MovieApp
//
//  Created by Md Sulayman on 23.12.22.
//

import Foundation
import RxFlow
import UIKit

/// Show splash screen when needed, maintain navigation controller
///

class SplashFlow: Flow {

    var root: Presentable {
        return rootViewController
    }

    private lazy var rootViewController: UINavigationController = {
        let navigationController = UINavigationController()
        navigationController.isNavigationBarHidden = true
        return navigationController
    }()

    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? AppStep else { return .none}

        switch step {
        case .splash:
            return navigateToSplashScreen()
        case .splashComplete:
            return completeSplash()
        default:
            return .none
        }
    }

    private func navigateToSplashScreen() -> FlowContributors {
        let viewModel = SplashViewModel()
        let viewController = SplashViewController.instantiate(with: viewModel)
        self.rootViewController.pushViewController(viewController, animated: false)
        return .one(flowContributor: .contribute(withNextPresentable: viewController, withNextStepper: viewModel))
    }

    private func completeSplash() -> FlowContributors {
        return .end(forwardToParentFlowWithStep: AppStep.splashComplete)
    }
}
