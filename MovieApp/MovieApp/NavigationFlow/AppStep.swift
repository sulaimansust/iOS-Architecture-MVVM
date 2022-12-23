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
    /// - Parameter home: App will send this event  and thus the app will be navigated back to home..

    case splash
    case splashComplete
    case movieList
}
