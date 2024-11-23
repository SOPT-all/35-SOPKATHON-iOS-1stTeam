//
//  InputViewController.swift
//  SOPKATHON-4Team-iOS
//
//  Created by 이세민 on 11/23/24.
//

import UIKit

class InputViewController: UIViewController {
    
    private let input = InputView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setUI()
        setLayout()
    }
    
    private func setStyle() {
        self.view.backgroundColor = UIColor.systemBackground
    }
    
    private func setUI() {
        view.addSubview(input)
    }
    
    private func setLayout() {
        input.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
}
