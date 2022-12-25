//
//  MovieItemCell.swift
//  MovieApp
//
//  Created by Md Sulayman on 24.12.22.
//

import Foundation
import UIKit
import Reusable
import Kingfisher

class MovieItemCell: UITableViewCell, NibReusable {
    @IBOutlet weak var rootView: UIView!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    func updateCellUI(with movieData: Movie) {
        titleLabel.text = movieData.title
        typeLabel.text = movieData.type
        if movieData.poster.isValidURL {
            posterImageView.kf.setImage(with: movieData.poster.asURL)
        }
        /// Putting a dummy for rating for now. As the search api doesn't provide ratings.
        /// Fetching ratings in this page is possbile with another api call, don't wanna add complexity for now..
        ///
        ratingLabel.text = "\(Double.random(in: 2..<5).rounded(toPlaces: 1))"
    }
    
    func updateCellBackground(colors: (UIColor,UIColor)) {
        self.rootView.addGradientBackground(topColor: colors.0, bottomColor: colors.1, corner: 10)
    }
    
}
