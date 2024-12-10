//
//  ScoreViewController.swift
//  SOPKATHON-4Team-iOS
//
//  Created by 이세민 on 11/24/24.
//

import UIKit

class ScoreViewController: UIViewController {
    
    let scoreView = ScoreView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setUI()
        setLayout()
    }
    
    private func setStyle() {
        self.view.backgroundColor = .background
        scoreView.goToScoreHomeButton.addTarget(self, action: #selector(goToHome), for: .touchUpInside)
    }
    
    private func setUI() {
        view.addSubview(scoreView)
    }
    
    private func setLayout() {
        scoreView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
    
    @objc
    private func goToHome() {
        let onboardingViewController = MainViewController()
        guard let window = self.view.window else { return }
        
        ViewControllerUtils.setRootViewController(window: window, viewController: onboardingViewController, withAnimation: true)
    }
}
