//
//  ActorCellCollectionViewCell.swift
//  MovieApp
//
//  Created by Md Sulayman on 25.12.22.
//

import UIKit
import Reusable

class ActorCellCollectionViewCell: UICollectionViewCell, NibReusable {

    @IBOutlet weak var initialLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
