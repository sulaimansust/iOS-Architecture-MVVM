//
//  MovieListViewController.swift
//  MovieApp
//
//  Created by Md Sulayman on 23.12.22.
//

import Foundation
import UIKit
import Reusable

class MovieListViewController: UIViewController, StoryboardSceneBased, ViewModelBased {
    var viewModel: MovieListViewModel!
    static var sceneStoryboard: UIStoryboard = UIStoryboard(name: StoryboardName.main.rawValue, bundle: nil)
    
}
