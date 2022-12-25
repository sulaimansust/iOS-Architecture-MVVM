//
//  RoundedImageView.swift
//  MovieApp
//
//  Created by Md Sulayman on 25.12.22.
//

import Foundation
import UIKit

class RoundedImageView: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)

        clipsToBounds = true
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        clipsToBounds = true
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        assert(bounds.height == bounds.width, "The aspect ratio isn't 1/1. You can never round this image view!")

        layer.cornerRadius = bounds.height / 2
    }
}
