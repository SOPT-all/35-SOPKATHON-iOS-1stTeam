//
//  OnboardingViewController.swift
//  SOPKATHON-4Team-iOS
//
//  Created by 이수민 on 11/24/24.
//

import UIKit

import SnapKit
import Then

class OnboardingViewController : UIViewController {
    
    var nicknameLabel : UILabel = UILabel()
    
    var nicknameTextField : UITextField = UITextField()
    
    var startButton: UIButton = UIButton()
    
    override func viewDidLoad() {
        setHierarchy()
        setLayout()
        setStyle()
    }
    
    func setHierarchy() {
        view.addSubviews(nicknameLabel,
                         nicknameTextField,
                         startButton)
    }
    
    func setLayout() {
        nicknameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(361)
            $0.centerX.equalToSuperview()
        }
        
        nicknameTextField.snp.makeConstraints {
            $0.top.equalToSuperview().offset(418)
            $0.horizontalEdges.equalToSuperview().inset(26)
            $0.height.equalTo(48)
        }
        
        startButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(418)
            $0.horizontalEdges.equalToSuperview().inset(48)
            $0.height.equalTo(52)
        }
    }
    
    func setStyle() {
        nicknameLabel = LabelFactory.build(font: <#T##UIFont#>)
        
        nicknameTextField.do {
            $0.backgroundColor = .white
        }
        
        startButton.do {
            $0.setTitle("시작하기", for: .normal)
        }
    }
    
}
