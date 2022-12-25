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
       
    @IBOutlet private weak var scrollView: UIScrollView!
    
    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var posterImageView: RoundedImageView!
    @IBOutlet private weak var movieNameLabel: UILabel!
    
    @IBOutlet private weak var directorNameLabel: UILabel!
    
    @IBOutlet private weak var timeAndCategoryLabel: UILabel!
    @IBOutlet private weak var imdbRaingsLabel: UILabel!
    
    @IBOutlet private weak var movieDescriptionLabel: UILabel!
    
    @IBOutlet weak var actorsCollectionView: UICollectionView!
    
    @IBOutlet private weak var rottenTomatoScoreLabel: UILabel!
    @IBOutlet private weak var metacriticRatingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.actorsCollectionView.register(cellType: ActorCellCollectionViewCell.self)
        self.viewModel.getMovieDetails()
    }
}

extension MovieDetailsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ActorCellCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        return cell
    }
    
}

extension MovieDetailsViewController: UICollectionViewDelegate {
    
}

extension MovieDetailsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: collectionView.frame.height)
    }
}
