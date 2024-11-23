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
        setStyle()
        setHierarchy()
        setLayout()
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
            $0.bottom.equalToSuperview().inset(46)
            $0.horizontalEdges.equalToSuperview().inset(26)
            $0.height.equalTo(52)
        }
    }
    
    func setStyle() {
        view.backgroundColor = UIColor(resource: .background)
        navigationItem.hidesBackButton = true
        
        nicknameLabel = LabelFactory.build(text: "닉네임을 입력하세요",
                                           font: .titleB24,
                                           textColor: .black,
                                           textAlignment: .center)
        
        nicknameTextField.do {
            $0.backgroundColor = .white
            $0.textAlignment = .center
            $0.font = .bodyR14
        }
        
        startButton.do {
            $0.setTitle("시작하기", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.titleLabel?.font = .bodyB18
            $0.backgroundColor = UIColor(resource: .orange)
            $0.layer.cornerRadius = 8
            $0.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        }
    }
    
    @objc
    func startButtonTapped() {
        // 홈 화면으로 이동
        postNickname()
    }
    
    func postNickname() {
        let nickname = nicknameTextField.text ?? ""
        // 닉네임 서버 Post 통신
    }
    
}
