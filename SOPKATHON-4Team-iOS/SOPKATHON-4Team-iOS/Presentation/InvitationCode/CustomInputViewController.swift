//
//  InputViewController.swift
//  SOPKATHON-4Team-iOS
//
//  Created by 이세민 on 11/23/24.
//

import UIKit

class InputViewController: UIViewController {
    
    private lazy var customInputView = CustomInputView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setUI()
        setLayout()
    }
    
    private func setStyle() {
        navigationItem.hidesBackButton = true
        self.view.backgroundColor = .background
        customInputView.goToInvitationButton.addTarget(self, action: #selector(goToInvitationButtonTapped), for: .touchUpInside)
    }
    
    private func setUI() {
        view.addSubview(customInputView)
    }
    
    private func setLayout() {
        customInputView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
    
    @objc private func goToInvitationButtonTapped() {
        guard let code = customInputView.codeTextField.text, code.count == 6, Int(code) != nil else {
            customInputView.warningButton.isHidden = false
            return
        }
        let solveVC = SolveViewController()
        guard let window = UIApplication.shared.windows.first(where: { $0.isKeyWindow }) else { return }
        ViewControllerUtils.setRootViewController(window: window, viewController: solveVC, withAnimation: true)
        customInputView.warningButton.isHidden = true
    }
}
