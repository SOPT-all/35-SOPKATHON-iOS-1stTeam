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
        
        setStyle()
        setHierachy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI&Layout
    
    private func setStyle() {
        titleLabel.do {
            $0.font = .bodyB16
            $0.textColor = .black
            $0.numberOfLines = 0
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
    }
}

// MARK: - configure

extension InvitationButtonView {
    func configure(with state: InvitationState) {
        switch state {
        case .make:
            titleLabel.text = "초대장을\n만들 거에요"
            logoImageView.image = .invitationMakeIcon
            logoImageView.snp.makeConstraints {
                $0.top.equalTo(titleLabel.snp.bottom).offset(40)
                $0.leading.equalTo(titleLabel.snp.leading).offset(43)
            }
            titleLabel.setLineSpacing(spacing: 5.0)
            backgroundColor = .orange3
        case .receive:
            titleLabel.text = "초대장을\n받았어요"
            logoImageView.image = .invitationReceiveIcon
            logoImageView.snp.makeConstraints {
                $0.top.equalTo(titleLabel.snp.bottom).offset(5)
                $0.leading.equalTo(titleLabel.snp.leading).offset(33)
            }
            titleLabel.setLineSpacing(spacing: 5.0)
            backgroundColor = .gray400
        }
    }
}

// MARK: - setLineSpacing

extension UILabel {
    func setLineSpacing(spacing: CGFloat) {
        guard let text = text else { return }

        let attributeString = NSMutableAttributedString(string: text)
        let style = NSMutableParagraphStyle()
        style.lineSpacing = spacing
        attributeString.addAttribute(
            .paragraphStyle,
            value: style,
            range: NSRange(location: 0, length: attributeString.length)
        )
        attributedText = attributeString
    }
}

