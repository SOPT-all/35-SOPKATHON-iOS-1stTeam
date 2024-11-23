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
    
    override func viewDidLoad() {
        view.addSubview(splashImageView)
        
        splashImageView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.width.equalTo(214)
            $0.height.equalTo(243)
        }
        
        splashImageView.do {
            $0.clipsToBounds = true
            $0.contentMode = .scaleAspectFill
        }
    }
    
}
