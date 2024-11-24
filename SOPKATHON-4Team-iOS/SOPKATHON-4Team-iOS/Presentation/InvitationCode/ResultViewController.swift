//
//  ResultViewController.swift
//  SOPKATHON-4Team-iOS
//
//  Created by 이세민 on 11/24/24.
//

import UIKit

class ResultViewController: UIViewController {
    
    private let invitationCode: Int
    
    private let result = ResultView()
    
    init(invitationCode: Int) {
        self.invitationCode = invitationCode
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setUI()
        setLayout()
        
        result.codeValueLabel.text = "\(invitationCode)"
        
        self.result.goToHomeButton.addTarget(self, action: #selector(goToHome), for: .touchUpInside)
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
    
    @objc
    private func goToHome() {
        let onboardingViewController = MainViewController()
        navigationController?.pushViewController(onboardingViewController, animated: false)
    }
}
