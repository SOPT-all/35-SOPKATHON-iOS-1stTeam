//
//  ResultViewController.swift
//  SOPKATHON-4Team-iOS
//
//  Created by 이세민 on 11/24/24.
//

import UIKit

class ResultViewController: UIViewController {
    
    private let result = ResultView()
    
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
        view.addSubview(result)
    }
    
    private func setLayout() {
        result.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
}
