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
        default:
            return .none
        }
    }
    
    
}
