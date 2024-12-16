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
    
    let nicknameLabel = LabelFactory.build(text: "닉네임을 입력하세요",
                                       font: .titleB24,
                                       textColor: .black,
                                       textAlignment: .center)
    
    let nicknameTextField : UITextField = UITextField()
    
    let startButton: UIButton = UIButton()
    
    private var keyBoardHandler: KeyboardHandler?
    
    override func viewDidLoad() {
        setStyle()
        setHierarchy()
        setLayout()
        hideKeyboard()
        keyBoardHandler = KeyboardHandler(textField: nicknameTextField)
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
        
        nicknameTextField.do {
            $0.backgroundColor = .white
            $0.textAlignment = .center
            $0.font = .bodyR14
        }
        
        startButton.do {
            $0.makeOrangeButton(title: "시작하기")
            $0.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        }
    }
    
    @objc
    func startButtonTapped() {
        // 홈 화면으로 이동
        postNickname()
    }
    
    func postNickname() {
        let nickname = nicknameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        
        guard !nickname.isEmpty else {
            // 빈 닉네임 처리
            return
        }
        
        UserManager.shared.signIn(nickName: nickname) { [weak self] result in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                switch result {
                case .success(true):
                    // 로그인 성공 시 메인 화면으로 이동
                    let mainViewController = MainViewController()
                    let navigationController = UINavigationController(rootViewController: mainViewController)
                    navigationController.modalPresentationStyle = .fullScreen
                    self.present(navigationController, animated: true, completion: nil)
                case .failure(let error):
                    // 로그인 실패 시 에러 메시지 출력
                    print(error.localizedDescription)
                case .success(false):
                    print("")
                }
            }
        }
    }
}
