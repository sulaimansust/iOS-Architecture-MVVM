//
//  AppStep.swift
//  MovieApp
//
//  Created by Md Sulayman on 23.12.22.
//

import Foundation
import RxFlow

/// Event name for navigation.
/// App navigate to specific screen asynchronusly based on this step

enum AppStep: Step {
    /// AppStep
    /// - Parameter splash: App will navigate to splash screen when this event occurs
    /// - Parameter splashComplete: App will send this event when the splash is complete
    case splash
    case splashComplete
}
