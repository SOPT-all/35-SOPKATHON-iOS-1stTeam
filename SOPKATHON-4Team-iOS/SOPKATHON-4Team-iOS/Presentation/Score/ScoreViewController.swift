//
//  ScoreViewController.swift
//  SOPKATHON-4Team-iOS
//
//  Created by 이세민 on 11/24/24.
//

import UIKit

class ScoreViewController: UIViewController {
    
    private let score = ScoreView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setUI()
        setLayout()
    }
    
    private func setStyle() {
        self.view.backgroundColor = .background
    }
    
    private func setUI() {
        view.addSubview(score)
    }
    
    private func setLayout() {
        score.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
}
