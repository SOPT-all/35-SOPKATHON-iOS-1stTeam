//
//  ResultView.swift
//  SOPKATHON-4Team-iOS
//
//  Created by 이세민 on 11/23/24.
//

import UIKit

import SnapKit

class ResultView: UIView {
    
    private let generatedCodeLabel: UILabel = {
        let label = UILabel()
        label.text = "초대코드를 생성했어요!"
        label.font = UIFont.bodyB20
        label.textColor = .black
        return label
    }()
    
    private let suggestionLabel: UILabel = {
        let label = UILabel()
        label.text = "친구와의 만남에\n토핑을 얹어볼까요?"
        label.font = UIFont.bodyR14
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let codeValueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.bodyB20
        label.textColor = .black
        label.attributedText = NSMutableAttributedString(string: "000000", attributes: [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue])
        return label
    }()
    
    private var copyButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "CopyIcon"), for: .normal)
        return button
    }()
    
    private var copyCompletedButton: UIButton = {
        let button = UIButton()
        button.setTitle("복사 완료", for: .normal)
        button.backgroundColor = UIColor(red: 1, green: 0.499, blue: 0.444, alpha: 0.5)
        button.layer.cornerRadius = 20
        button.setTitleColor(.label, for: .normal)
        button.titleLabel?.font = UIFont.bodyR14
        button.isHidden = true
        return button
    }()
    
    private let goToHomeButton = CustomButton(
        title: "홈으로 돌아가기",
        font: UIFont.bodyB18,
        cornerRadius: 8
    ).setButtonStatus(
        normalColor: UIColor(red: 1, green: 0.499, blue: 0.444, alpha: 1),
        normalTextColor: .white,
        disableColor: UIColor(red: 0.565, green: 0.569, blue: 0.592, alpha: 1),
        disableTextColor: .white
    )
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
        setActions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        addSubviews(generatedCodeLabel, suggestionLabel, codeValueLabel, copyButton, copyCompletedButton, goToHomeButton)
    }
    
    private func setLayout() {
        generatedCodeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(325)
            $0.centerX.equalToSuperview()
        }
        
        suggestionLabel.snp.makeConstraints {
            $0.top.equalTo(generatedCodeLabel.snp.bottom).offset(5)
            $0.centerX.equalToSuperview()
        }
        
        codeValueLabel.snp.makeConstraints{
            $0.top.equalTo(suggestionLabel.snp.bottom).offset(25)
            $0.centerX.equalToSuperview()
        }
        
        copyButton.snp.makeConstraints {
            $0.top.equalTo(codeValueLabel.snp.top)
            $0.leading.equalTo(codeValueLabel.snp.trailing)
            $0.width.height.equalTo(20)
        }
        
        copyCompletedButton.snp.makeConstraints {
            $0.top.equalTo(codeValueLabel.snp.bottom).offset(25)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(241)
            $0.height.equalTo(42)
        }
        
        goToHomeButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(45)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(341)
            $0.height.equalTo(52)
        }
    }
    
    private func setActions() {
        copyButton.addTarget(self, action: #selector(copyCodeToClipboard), for: .touchUpInside)
    }
    
    @objc private func copyCodeToClipboard() {
        if let code = codeValueLabel.text {
            UIPasteboard.general.string = code
            
            copyCompletedButton.isHidden = false
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.copyCompletedButton.isHidden = true
            }
        }
    }
    
}
