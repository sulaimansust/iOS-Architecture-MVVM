//
//  MovieDetailsViewController.swift
//  MovieApp
//
//  Created by Md Sulayman on 25.12.22.
//

import Foundation
import UIKit
import Reusable
import RxSwift
import RxCocoa
import Kingfisher

class MovieDetailsViewController: UIViewController, StoryboardSceneBased, ViewModelBased {
    // Variables from protocols, must give implementation
    var viewModel: MovieDetailsViewModel!
    static var sceneStoryboard: UIStoryboard = UIStoryboard(name: Constants.StoryboardName.main.rawValue, bundle: nil)
    private let disposeBag = DisposeBag()
    
    var actors: [String] = []
    
    //MARK: - IBOutlets of
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
        self.prepareUI()
        self.bindViewModel()
        self.viewModel.getMovieDetails()
    }
    
    private func prepareUI() {
        self.actorsCollectionView.register(cellType: ActorCellCollectionViewCell.self)
        let color = GradientColorProvider.instance.getGradientColor(at: self.viewModel.movieInfo.colorIndex)
        self.view.addGradientBackground(topColor: color.top, bottomColor: color.bottom)
    }
    
    private func bindViewModel() {
        self.viewModel
            .movieDetails
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: {[weak self] details in
                self?.updateUI(with: details)
            }).disposed(by: disposeBag)
    }
    
    private func updateUI(with details: MovieDetails) {
        if details.poster.isValidURL {
            posterImageView.kf.setImage(with: details.poster.asURL)
        }
        movieNameLabel.text = details.title
        directorNameLabel.text = "by \(details.director)"
        timeAndCategoryLabel.text = StringFormatHelper.getTypeAndGenre(from: details)

        imdbRaingsLabel.text = details.imdbRating
        movieDescriptionLabel.text = details.plot
        
        // Set data for actors
        actors = self.viewModel.getActors(from: details)
        self.actorsCollectionView.reloadData()
        
        self.rottenTomatoScoreLabel.text = self.viewModel.getRottenTomatoRating(from: details)
        self.metacriticRatingsLabel.text = self.viewModel.getMetacriticRating(from: details)

    }
    
}

extension MovieDetailsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return actors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ActorCellCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        let actor = actors[indexPath.row]
        let colorIndex = self.viewModel.movieInfo.colorIndex == indexPath.row ? indexPath.row + 1  : indexPath.row
        let color = GradientColorProvider.instance.getGradientColor(at: colorIndex)
        cell.updateUI(with: actor, and: color.top)
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
