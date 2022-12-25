//
//  MovieListViewController.swift
//  MovieApp
//
//  Created by Md Sulayman on 23.12.22.
//

import Foundation
import UIKit
import Reusable
import RxSwift
import RxCocoa

class MovieListViewController: UIViewController, StoryboardSceneBased, ViewModelBased {
    // Variables from protocols, must give implementation
    var viewModel: MovieListViewModel!
    static var sceneStoryboard: UIStoryboard = UIStoryboard(name: Constants.StoryboardName.main.rawValue, bundle: nil)
        
    @IBOutlet private weak var tableView: UITableView!
    var movies: [Movie] = []
    private var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Thor Movies"
        prepareTableView()
        bindViewModel()
        self.viewModel.getMovies(keyword: "Thor", page: 1, type: "movie")
    }
    
    private func prepareTableView() {
        self.tableView.register(cellType: MovieItemCell.self)
        self.tableView.automaticallyAdjustsScrollIndicatorInsets = false
        self.tableView.contentInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    private func bindViewModel() {
        self.viewModel
            .movies
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] movies in
                guard let self = self else { return }
                self.movies.append(contentsOf: movies)
                self.tableView.reloadData()
            }).disposed(by: disposeBag)
    }
    
    
}
