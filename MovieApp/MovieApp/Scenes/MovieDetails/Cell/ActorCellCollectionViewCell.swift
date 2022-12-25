//
//  ActorCellCollectionViewCell.swift
//  MovieApp
//
//  Created by Md Sulayman on 25.12.22.
//

import UIKit
import Reusable

class ActorCellCollectionViewCell: UICollectionViewCell, NibReusable {

    @IBOutlet private weak var initialLabel: UILabel!
    @IBOutlet private weak var initialBackgroundView: UIView!
    
    @IBOutlet private weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateUI(with name: String, and color: UIColor) {
        self.nameLabel.text = name
        self.initialLabel.text = StringFormatHelper.getIntial(from: name)
        self.initialBackgroundView.backgroundColor = color
    }
    

}
