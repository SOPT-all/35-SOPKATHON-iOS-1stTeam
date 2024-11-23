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
    private let topLogoImageView = UIImageView()
    private let topTitleLabel = UILabel()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setUI()
        setLayout()
        setAddTarget()
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
        
        invitationCardView.do {
            $0.layer.cornerRadius = 20
        }
        
        topLogoImageView.do {
            $0.image = .topLogo
            $0.contentMode = .scaleAspectFit
        }
        
        let name = UserManager.shared.nickName ?? "사용자"
        
        topTitleLabel.do {
            $0.text = "\(String(describing: name))님의 만남을\n더 맛있게 만들어드릴게요"
            $0.font = .bodyB20
            $0.numberOfLines = 0
            $0.setLineSpacing(spacing: 5.0)
        }
    }
    
    private func setUI() {
        view.addSubviews(topLogoImageView, topTitleLabel, invitationMakeButtonView, invitationReceiveButtonView, invitationCardView)
    }
    
    private func setLayout() {
        topLogoImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(84)
            $0.leading.equalToSuperview().offset(-42)
            $0.width.equalTo(220)
            $0.height.equalTo(211)
        }
        
        topTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(183)
            $0.trailing.equalToSuperview().offset(-23)
        }
        
        invitationMakeButtonView.snp.makeConstraints {
            $0.top.equalTo(topLogoImageView.snp.bottom).offset(-20)
            $0.leading.equalToSuperview().offset(17)
            $0.width.equalTo((UIScreen.main.bounds.width - 47) / 2)
            $0.height.equalTo(198)
        }
        
        invitationReceiveButtonView.snp.makeConstraints {
            $0.top.equalTo(invitationMakeButtonView)
            $0.trailing.equalToSuperview().offset(-17)
            $0.width.equalTo((UIScreen.main.bounds.width - 47) / 2)
            $0.height.equalTo(198)
        }
        
        invitationCardView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(17)
            $0.top.equalTo(invitationMakeButtonView.snp.bottom).offset(14)
            $0.height.equalTo(228)
        }
        
    }
    

    private func setAddTarget() {
        invitationMakeButtonView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleInvitationMakeButtonTapped)))
    }


    @objc private func handleInvitationMakeButtonTapped() {
        let makeViewController = AskViewController()
        navigationController?.pushViewController(makeViewController, animated: true)
    }
}
