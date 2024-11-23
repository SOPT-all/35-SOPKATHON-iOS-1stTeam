//
//  InputViewController.swift
//  SOPKATHON-4Team-iOS
//
//  Created by 이세민 on 11/23/24.
//

import UIKit

import RxCocoa
import RxSwift

import Moya

class InputViewController: UIViewController {
    
    private let input = InputView()
    private let inviteText: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setUI()
        setLayout()
        
        input.goToInvitationButton.addTarget(self, action: #selector(goToInvitationButtonAction), for: .touchUpInside)
        
    }
    
    private func setStyle() {
        self.view.backgroundColor = .background
    }
    
    private func setUI() {
        view.addSubview(input)
    }
    
    private func setLayout() {
        input.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
    
    
    @objc
    private func goToInvitationButtonAction() {
        
        let solveVC = SolveViewController()
        guard let window = self.view.window else { return }
        
        ViewControllerUtils.setRootViewController(window: window, viewController: solveVC, withAnimation: true)
    }
}
