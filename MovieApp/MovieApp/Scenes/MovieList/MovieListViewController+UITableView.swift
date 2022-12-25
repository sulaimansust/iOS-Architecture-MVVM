//
//  MovieListViewController+TableView.swift
//  MovieApp
//
//  Created by Md Sulayman on 24.12.22.
//

import Foundation
import UIKit


extension MovieListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: MovieItemCell = tableView.dequeueReusableCell(for: indexPath)
        
        let movie = movies[indexPath.section]
        cell.updateCellUI(with: movie)
        cell.layoutIfNeeded()
        // Set background gradient colors
        let color = GradientColorProvider.instance.getGradientColor(at: indexPath.section)
        cell.updateCellBackground(colors: color)
        
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.movies.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 106
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 15
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }
}

extension MovieListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = self.movies[indexPath.section]
        tableView.deselectRow(at: indexPath, animated: true)
        self.viewModel.navigateToMovieDetails(movie: movie)
    }
    
}
