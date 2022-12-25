//
//  ViewModel+Storyboard.swift
//  MovieApp
//
//  Created by Md Sulayman on 23.12.22.
//

import Foundation
import UIKit
import Reusable

/// ViewController's that will follow the MVVM architecture.
///
/// Provide extension methods for initializing a ViewController from Storyboard and provide ViewModel dependency to that ViewControler
///
/// These methods are extention of instantiate() method provided by Reusable framework
///

protocol ViewModelBased: AnyObject {
    associatedtype ViewModelType: ViewModel
    var viewModel: ViewModelType! { get set }
}

/// Extension method for initializing a ViewController from Storyboard initial ViewController and provide ViewModel dependency to that ViewControler
/// This method is an extention of instantiate() method provided by Reusable framework
extension ViewModelBased where Self: StoryboardBased & UIViewController {
    /// Intialize a ViewController with a ViewModel for that ViewController.
    /// - Parameters:
    ///     - ViewModel: Specific ViewModel for the given View
    /// - Returns: A ViewController with a ViewModel attached to it as a property/dependency
    static func instantiate<ViewModelType>( with viewModel: ViewModelType) -> Self where ViewModelType == Self.ViewModelType {
        let viewController = Self.instantiate()
        viewController.viewModel = viewModel
        return viewController
    }
}

/// Extension method for initializing a ViewController from SceneBased Storyboard where multiple view item is present and provide ViewModel dependency to a specific ViewControler
/// This method is an extention of instantiate() method provided by Reusable framework
extension ViewModelBased where Self: StoryboardSceneBased & UIViewController {
    static func instantiate<ViewModelType> (with viewModel: ViewModelType) -> Self where ViewModelType == Self.ViewModelType {
        let viewController = Self.instantiate()
        viewController.viewModel = viewModel
        return viewController
    }
}
