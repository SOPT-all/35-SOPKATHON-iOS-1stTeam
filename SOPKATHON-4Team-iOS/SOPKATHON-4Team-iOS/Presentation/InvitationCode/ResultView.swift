//
//  ResultView.swift
//  SOPKATHON-4Team-iOS
//
//  Created by 이세민 on 11/23/24.
//

import UIKit

import SnapKit

class ResultView: UIView {
    
    private let invitationCodeLabel: UILabel = {
        let label = UILabel()
        label.text = "초대 코드"
        label.font = .systemFont(ofSize: 20, weight: .heavy)
        label.textColor = .label
        return label
    }()
    
    private let codeValueLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .heavy)
        label.textColor = .label
        label.attributedText = NSMutableAttributedString(string: "000000", attributes: [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue])
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        addSubviews(invitationCodeLabel, codeValueLabel)
    }
    
    private func setLayout() {
        invitationCodeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(300)
            $0.centerX.equalToSuperview()
        }
        
        codeValueLabel.snp.makeConstraints{
            $0.top.equalTo(invitationCodeLabel.snp.bottom).offset(12)
            $0.centerX.equalToSuperview()
        }
    }
}

