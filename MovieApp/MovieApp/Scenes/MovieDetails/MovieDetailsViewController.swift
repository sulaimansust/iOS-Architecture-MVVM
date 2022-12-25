//
//  MovieDetailsViewController.swift
//  MovieApp
//
//  Created by Md Sulayman on 25.12.22.
//

import Foundation
import UIKit
import Reusable

class MovieDetailsViewController: UIViewController, StoryboardSceneBased, ViewModelBased {
    // Variables from protocols, must give implementation
    var viewModel: MovieDetailsViewModel!
    static var sceneStoryboard: UIStoryboard = UIStoryboard(name: Constants.StoryboardName.main.rawValue, bundle: nil)
       
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
