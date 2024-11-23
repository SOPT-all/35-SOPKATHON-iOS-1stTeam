//
//  InvitationButton.swift
//  SOPKATHON-4Team-iOS
//
//  Created by 최유빈 on 11/24/24.
//

import UIKit

import SnapKit
import Then

class InvitationButtonView: UIView {
    
    // MARK: - UI Components
    
    private let titleLabel = UILabel()
    private let logoImageView = UIImageView()
    
    // MARK: - View Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        titleLabel.do {
            $0.font = .bodyB16
            $0.textColor = .black
        }
        
        logoImageView.do {
            $0.contentMode = .scaleAspectFill
        }
    }
    
    private func setHierachy() {
        addSubviews(titleLabel, logoImageView)
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(18)
            $0.leading.equalToSuperview().offset(16)
        }
        logoImageView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(7)
            $0.leading.equalTo(titleLabel.snp.leading).offset(37)
        }
    }
}

extension InvitationButtonView {
    func configure(with state: InvitationState) {
        switch state {
        case .make:
            titleLabel.text = "초대장을 만들 거에요"
            logoImageView.image = .invitationMakeLogo
        case .receive:
            titleLabel.text = "초대장을 받았어요"
            logoImageView.image = .invitationReceiveLogo
        }
    }
}
