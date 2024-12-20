//
//  InputView.swift
//  SOPKATHON-4Team-iOS
//
//  Created by 이세민 on 11/23/24.
//

import UIKit

import SnapKit

class CustomInputView: UIView {

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "초대 코드를 입력하세요"
        label.font = UIFont.titleB24
        label.textColor = .black
        return label
    }()
    
    let codeTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = ""
        textField.clearButtonMode = .whileEditing
        textField.textColor = .black
        textField.font = UIFont.bodyR14
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 8
        textField.textAlignment = .center
        return textField
    }()
    
    var warningButton: UIButton = {
        let button = UIButton()
        button.setTitle("초대코드가 유효하지 않습니다", for: .normal)
        button.backgroundColor = .tpOrange.withAlphaComponent(0.5)
        button.layer.cornerRadius = 20
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.bodyR14
        button.isHidden = true
        return button
    }()
    
    var goToInvitationButton : UIButton = {
        let button = UIButton()
        button.makeOrangeButton(title: "초대장 열어보기")
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
//        setActions()
//        updateButtonState()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        addSubviews(descriptionLabel, codeTextField, warningButton, goToInvitationButton)
    }
    
    private func setLayout() {
        descriptionLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(361)
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
        
        goToInvitationButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(45)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(341)
            $0.height.equalTo(52)
        }
    }
    
//    private func setButton() {
//        
//    }
//    private func setActions() {
//        codeTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
//        goToInvitationButton.addTarget(self, action: #selector(goToInvitationButtonTapped), for: .touchUpInside)
//    }
//    
//    @objc private func textFieldDidChange() {
//        updateButtonState()
//    }
//    
//    private func updateButtonState() {
//        goToInvitationButton.setEnabled(!(codeTextField.text?.isEmpty ?? true))
//    }
}
