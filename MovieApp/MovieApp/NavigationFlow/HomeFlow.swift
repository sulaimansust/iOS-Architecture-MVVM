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

    
    var root: Presentable {
        return rootViewController
    }
    
    private lazy var rootViewController: UINavigationController = {
        let navigationController = UINavigationController()
        navigationController.isNavigationBarHidden = true
        return navigationController
    }()
    
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? AppStep else { return .none }
        
        switch step  {
        default:
            return .none
        }
    }
}
