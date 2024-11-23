//
//  CustomQuestionView.swift
//  SOPKATHON-4Team-iOS
//
//  Created by 이수민 on 11/23/24.
//

import UIKit

import SnapKit
import Then

class CustomQuestionView: UIView {
    
    var questionTextView: UITextView = UITextView()
    
    var questionTextLabel: UILabel = UILabel()
    
    var textCountLabel: UILabel = UILabel()
    
    lazy var trueButton: CustomButton = CustomButton(title: "True", font: .bodyB16, cornerRadius: 16)
    
    lazy var falseButton: CustomButton = CustomButton(title: "False", font: .bodyB16, cornerRadius: 16)
    
    private var questionType: QuestionType
    
    init(questionType: QuestionType) {
        self.questionType = questionType
        
        super.init(frame: .zero)
        
        setHierarchy()
        setLayout()
        setStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setHierarchy() {
        self.addSubviews(questionTextView,
                         questionTextLabel,
                         textCountLabel,
                         trueButton,
                         falseButton)
        
    }
    
    func setLayout() {
        questionTextView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(63)
        }
        
        questionTextLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(63)
        }
        
        textCountLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(78)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(20)
        }
        
        trueButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(4.5)
            $0.bottom.equalToSuperview().inset(5)
            $0.width.equalTo(164)
            $0.height.equalTo(42)
        }
        
        falseButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(4.5)
            $0.bottom.equalToSuperview().inset(5)
            $0.width.equalTo(164)
            $0.height.equalTo(42)
        }
        
    }
    
    func setStyle() {
        self.layer.cornerRadius = 20
        self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        self.backgroundColor = .white
        
        switch questionType {
        case .ask:
            questionTextLabel.isHidden = true
        default:
            questionTextView.isHidden = true
        }
        
        questionTextView.do {
            $0.text = "질문을 입력하세요"
            $0.isEditable = true
        }
        
        questionTextLabel.do {
            $0.numberOfLines = 0
        }
        
        trueButton
            .setEnabled(false)
            .setButtonStatus(normalColor: UIColor(resource: .orange), normalTextColor: .white, disableColor: UIColor(resource: .gray300), disableTextColor: UIColor(resource: .gray800))
            .layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        trueButton.addTarget(self, action: #selector(trueButtonTapped), for: .touchUpInside)
        
        falseButton
            .setEnabled(false)
            .setButtonStatus(normalColor: UIColor(resource: .orange), normalTextColor: .white, disableColor: UIColor(resource: .gray300), disableTextColor: UIColor(resource: .gray800))
            .layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        falseButton.addTarget(self, action: #selector(falseButtonTapped), for: .touchUpInside)
        
    }
    
}

extension CustomQuestionView {
    
    @objc
    func trueButtonTapped() {
        print("jdsfjsldkjflakdjf")
        trueButton.setEnabled(true)
        falseButton.setEnabled(false)
    }
    
    @objc
    func falseButtonTapped() {
        falseButton.setEnabled(true)
        trueButton.setEnabled(false)
    }
    
}

extension CustomQuestionView {
    
    func setQuestionText(text: String) {
        switch questionType {
        case .ask:
            questionTextView.text = text
        default:
            questionTextLabel.text = text
        }
    }
    
    func buttonSelected() -> Bool {
        let trueValue = trueButton.isEnabled ? true : false
        return trueValue
    }
    
}
