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
    
    override func viewDidLoad() {
        view.addSubviews(splashImageView, splashNameImageView)
        
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
        
        //        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) { [weak self] in
        //            let onboardingVC = OnboardingViewController()
        //            self?.navigationController?.pushViewController(onboardingVC, animated: false)
        //        }
    }
    
}
