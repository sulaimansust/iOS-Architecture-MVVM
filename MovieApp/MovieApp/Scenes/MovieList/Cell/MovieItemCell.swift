//
//  MovieItemCell.swift
//  MovieApp
//
//  Created by Md Sulayman on 24.12.22.
//

import Foundation
import UIKit
import Reusable

class MovieItemCell: UITableViewCell, NibReusable {
    @IBOutlet weak var rootView: UIView!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    func updateCellUI(with movieData: Movie) {
        titleLabel.text = movieData.title
        typeLabel.text = movieData.type
    }
    
    func updateCellBackground(colors: (UIColor,UIColor)) {
        self.rootView.addGradientBackground(topColor: colors.0, bottomColor: colors.1, corner: 10)
    }
    
}
