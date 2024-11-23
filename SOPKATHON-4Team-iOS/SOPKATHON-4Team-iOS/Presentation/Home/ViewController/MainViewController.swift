//
//  MainViewController.swift
//  SOPKATHON-4Team-iOS
//
//  Created by 최유빈 on 11/23/24.
//

import UIKit

import SnapKit
import Then

class MainViewController: UIViewController {
    
    // MARK: - UI Component
    
    private let invitationCardView = InvitationCardView()
    private let invitationMakeButtonView = InvitationButtonView()
    private let invitationReceiveButtonView = InvitationButtonView()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setUI()
        setLayout()
    }
    
    // MARK: - UI&Layout
    
    private func setStyle() {
        view.backgroundColor = .white
        
        invitationMakeButtonView.do {
            $0.configure(with: .make)
            $0.layer.cornerRadius = 20
        }
        
        invitationReceiveButtonView.do {
            $0.configure(with: .receive)
            $0.layer.cornerRadius = 20
        }
    }
    
    private func setUI() {
        view.addSubviews(invitationMakeButtonView, invitationReceiveButtonView, invitationCardView)
    }
    
    private func setLayout() {
        invitationMakeButtonView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(100)
            $0.leading.equalToSuperview().offset(17)
            $0.width.equalTo((UIScreen.main.bounds.width - 47) / 2)
            $0.height.equalTo(198)
        }
        
        invitationReceiveButtonView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(100)
            $0.trailing.equalToSuperview().(17)
        }
        
        invitationCardView.snp.makeConstraints {
            $0.height.equalTo(228)
            $0.horizontalEdges.equalToSuperview()
            $0.top.equalToSuperview().offset(150)
        }
        
    }
}
