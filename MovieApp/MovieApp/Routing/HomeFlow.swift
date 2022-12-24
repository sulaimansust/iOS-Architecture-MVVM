//
//  HomeFlow.swift
//  MovieApp
//
//  Created by Md Sulayman on 23.12.22.
//

import Foundation
import UIKit
import RxFlow
import RxCocoa

class HomeFlow: Flow {

    private lazy var navigationController: UINavigationController = UINavigationController()

    var root: Presentable {
        return navigationController
    }
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? AppStep else { return .none }
        
        switch step  {
        case .movieList:
            return navigateToMovieList()
        default:
            return .none
        }
    }
    
    private func navigateToMovieList() -> FlowContributors {
        let viewModel = MovieListViewModel()
        let viewController = MovieListViewController.instantiate(with: viewModel)
        self.navigationController.pushViewController(viewController, animated: true)
        return .one(flowContributor: .contribute(withNextPresentable: viewController, withNextStepper: viewModel))
    }
}
