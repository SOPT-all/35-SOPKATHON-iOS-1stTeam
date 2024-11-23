//
//  InputView.swift
//  SOPKATHON-4Team-iOS
//
//  Created by 이세민 on 11/23/24.
//

import UIKit

import SnapKit

class InputView: UIView {
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "초대 코드를 입력하세요"
        label.font = .systemFont(ofSize: 24, weight: .heavy)
        label.textColor = .label
        return label
    }()
    
    private let codeTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = ""
        textField.clearButtonMode = .whileEditing
        textField.textColor = .label
        textField.backgroundColor = UIColor(red: 0.879, green: 0.879, blue: 0.879, alpha: 1)
        textField.layer.cornerRadius = 8
        textField.textAlignment = .center
        return textField
    }()
    
    private var warningButton: UIButton = {
        let button = UIButton()
        button.setTitle("초대코드가 유효하지 않습니다", for: .normal)
        button.backgroundColor = UIColor(red: 0.879, green: 0.879, blue: 0.879, alpha: 1)
        button.layer.cornerRadius = 20
        button.setTitleColor(.label, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        return button
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
        addSubviews(descriptionLabel, codeTextField, warningButton)
    }
    
    private func setLayout() {
        descriptionLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(300)
            $0.centerX.equalToSuperview()
        }
        
        codeTextField.snp.makeConstraints{
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(21)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(328)
            $0.height.equalTo(48)
        }
        
        warningButton.snp.makeConstraints{
            $0.top.equalTo(codeTextField.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(341)
            $0.height.equalTo(42)
        }
    }
}

