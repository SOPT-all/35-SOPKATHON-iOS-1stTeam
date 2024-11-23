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
        self.view.backgroundColor = UIColor(red: 0.964, green: 0.97, blue: 0.984, alpha: 1)
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
