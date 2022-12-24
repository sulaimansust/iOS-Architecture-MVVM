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
    
    var movie: Movie!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareTableView()
        self.title = "Thor Movies"
        movie = Movie(title: "Thor", year: "2022", imdbID: "tt43234", type: "Movie", poster: "No poster")
        
    }
    
    private func prepareTableView() {
        self.tableView.register(cellType: MovieItemCell.self)
        self.tableView.automaticallyAdjustsScrollIndicatorInsets = false
        self.tableView.contentInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    
}
