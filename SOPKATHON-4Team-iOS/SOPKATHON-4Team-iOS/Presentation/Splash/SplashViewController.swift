//
//  SplashViewController.swift
//  SOPKATHON-4Team-iOS
//
//  Created by 이수민 on 11/24/24.
//

import UIKit

import SnapKit
import Then

class SplashViewController : UIViewController {
    
    let splashImageView = UIImageView()
    let splashNameImageView = UIImageView()
    let EffectImageView = UIImageView()
    
    override func viewDidLoad() {
        view.addSubviews(splashImageView, splashNameImageView, EffectImageView)
        
        splashImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(243)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(214)
            $0.height.equalTo(243)
        }
        
        splashNameImageView.snp.makeConstraints {
            $0.top.equalTo(splashImageView.snp.bottom)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(143)
        }
        
        EffectImageView.snp.makeConstraints{
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        view.backgroundColor = UIColor(resource: .background)
        splashImageView.do {
            $0.image = UIImage(resource: .splashLogo)
            $0.clipsToBounds = true
            $0.contentMode = .scaleAspectFill
        }
        
        splashNameImageView.do{
            $0.image = UIImage(resource: .splashNameLogo)
            $0.clipsToBounds = true
            $0.contentMode = .scaleAspectFill
        }
        
        EffectImageView.do{
            $0.image = UIImage(resource: .backgroundEffect)
            $0.clipsToBounds = true
            $0.contentMode = .scaleAspectFill
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) { [weak self] in
            if UserManager.shared.hasUserId {
                self?.pushHomeViewController()
            } else {
                self?.pushOnboardingViewController()
            }
        }
        
    }
    
    private func pushHomeViewController() {
        let mainViewController = MainViewController()
        guard let window = self.view.window else { return }
        ViewControllerUtils.setRootViewController(window: window, viewController: mainViewController, withAnimation: true)
        
    }
    
    private func pushOnboardingViewController() {
        let onboardingViewController = OnboardingViewController()
        guard let window = self.view.window else { return }
        
        ViewControllerUtils.setRootViewController(window: window, viewController: onboardingViewController, withAnimation: true)
    }
    
}
