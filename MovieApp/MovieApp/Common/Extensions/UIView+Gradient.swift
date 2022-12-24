//
//  UIView+Gradient.swift
//  MovieApp
//
//  Created by Md Sulayman on 24.12.22.
//

import Foundation
import UIKit

extension UIView {
    func addGradientBackground(topColor: UIColor, bottomColor: UIColor, corner: CGFloat?=0) {
        let gradient = CAGradientLayer()
        gradient.cornerRadius = corner ?? 0
        gradient.frame = bounds
        gradient.colors = [topColor.cgColor, bottomColor.cgColor]
        layer.insertSublayer(gradient, at: 0)
    }
}
