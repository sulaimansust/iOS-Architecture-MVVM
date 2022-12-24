//
//  GradientColorProvider.swift
//  MovieApp
//
//  Created by Md Sulayman on 24.12.22.
//

import Foundation
import UIKit

class GradientColorProvider {
    // Singleton object
    static let instance = GradientColorProvider()
    // Array that holds the colors.
    private var gradientsColors: [(top: UIColor,bottom: UIColor)] = []
    
    private init() {
        gradientsColors.append((
            Asset.Colors.gradientBlueLight.color,
            Asset.Colors.gradientBlueDark.color))
        gradientsColors.append((
            Asset.Colors.gradientBrownLight.color,
            Asset.Colors.gradientBrownDark.color))
        gradientsColors.append((
            Asset.Colors.gradientPinkLight.color,
            Asset.Colors.gradientPinkDark.color))
        gradientsColors.append((
            Asset.Colors.gradientVioletLight.color,
            Asset.Colors.gradientVioletDark.color))
        gradientsColors.append((
            Asset.Colors.gradientTarquoiseLight.color,
            Asset.Colors.gradientTarquoiseDark.color))
        gradientsColors.append((
            Asset.Colors.gradientFroly.color,
            Asset.Colors.gradientCeriseRed.color))
    }
    
    func getGradientColor(at position: Int) ->  (top: UIColor,bottom: UIColor) {
        return self.gradientsColors[position % gradientsColors.count]
    }
}
