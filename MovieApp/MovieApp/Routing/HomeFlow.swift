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
import Moya

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
        case .movieDetails(let info):
            return navigateToMovieDetails(with: info)
        default:
            return .none
        }
    }
    
    private func navigateToMovieList() -> FlowContributors {
        // Initializing network manager
        let provider = MoyaProvider<MovieAPI>()
        let networkManager = NetworkingManager(provider: provider)
        let stack = AppDelegate.sharedAppDelegate.coreDataStack
        let localDataManager = LocalDataManager(movieDataStack: stack)
        
        // Creating ViewModel and Services - dependency
        let httpMovieService = HTTPMovieService(provider: networkManager)
        let cachedMovieService = CachedMovieService(localDataManager: localDataManager)
        let viewModel = MovieListViewModel(httpMovieService: httpMovieService, cachedMovieService: cachedMovieService)
        
        // Creating View and pushing to navigation controller
        let viewController = MovieListViewController.instantiate(with: viewModel)
        self.navigationController.pushViewController(viewController, animated: true)
        
        return .one(flowContributor: .contribute(withNextPresentable: viewController, withNextStepper: viewModel))
    }
    
    private func navigateToMovieDetails(with info: MovieInfo) -> FlowContributors {
        // Initializing network manager
        let provider = MoyaProvider<MovieAPI>()
        let networkManager = NetworkingManager(provider: provider)
        
        // Creating ViewModel and Services - dependency
        let httpMovieService = HTTPMovieService(provider: networkManager)
        let viewModel = MovieDetailsViewModel(movieInfo: info, service: httpMovieService)
        
        let viewController = MovieDetailsViewController.instantiate(with: viewModel)
        self.navigationController.pushViewController(viewController, animated: true)
        
        return .one(flowContributor: .contribute(withNextPresentable: viewController, withNextStepper: viewModel))

    }
}
