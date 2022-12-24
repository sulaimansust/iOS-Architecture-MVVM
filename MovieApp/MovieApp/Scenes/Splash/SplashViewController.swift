//
//  SplashViewController.swift
//  MovieApp
//
//  Created by Md Sulayman on 23.12.22.
//

import Foundation
import UIKit
import Reusable

class SplashViewController: UIViewController, StoryboardSceneBased, ViewModelBased {
    var viewModel: SplashViewModel!
    static let sceneStoryboard: UIStoryboard = UIStoryboard(name: Constants.StoryboardName.splash.rawValue, bundle: nil)
    
    @IBOutlet weak var appTitleLabel: UILabel!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.transition(with: self.appTitleLabel, duration: 0.5, options: .transitionCurlDown, animations: {
            self.appTitleLabel.isHidden = false
        }, completion: { _ in
            Timer.scheduledTimer(withTimeInterval: 3, repeats: false, block: { [weak self] _ in
                self?.viewModel.finishSplash()
            })
        })
    }
    
    
}
