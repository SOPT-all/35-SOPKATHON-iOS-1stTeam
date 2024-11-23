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
    
    let questionTextLabel: UILabel = UILabel()
    
    var textCountLabel: UILabel = UILabel()
    
    lazy var trueButton: UIButton = UIButton()
    
    lazy var falseButton: UIButton = UIButton()
    
    private var questionType: QuestionType
    
    init(questionType: QuestionType) {
        self.questionType = questionType
        
        super.init(frame: .zero)
        
        setHierarchy()
        setLayout()
        setStyle()
        
        questionTextView.delegate = self
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
            textCountLabel.isHidden = true
        }
        
        questionTextView.do {
            $0.text = "질문을 입력하세요"
            $0.isEditable = true
        }
        
        questionTextLabel.do {
            $0.numberOfLines = 0
        }
        
        textCountLabel.do {
            $0.text = "(0/100)"
            $0.font = .bodyR12
            $0.textColor = .gray600
            $0.textAlignment = .right
        }
        
        [trueButton, falseButton].forEach {
            $0.isSelected = false
            $0.setTitleColor(.gray800, for: .normal)
            $0.setTitleColor(.white, for: .selected)
            $0.setBackgroundColor(.gray300, for: .normal)
            $0.setBackgroundColor(.tpOrange, for: .selected)
            $0.titleLabel?.font = .bodyB16
            $0.layer.cornerRadius = 16
            $0.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        }
                                      
        trueButton.do {
            $0.setTitle("True", for: .normal)
            $0.addTarget(self, action: #selector(trueButtonTapped), for: .touchUpInside)
        }

        falseButton.do {
            $0.setTitle("False", for: .normal)
            $0.addTarget(self, action: #selector(falseButtonTapped), for: .touchUpInside)
        }
        
    }
    
}

extension CustomQuestionView {
    
    @objc
    func trueButtonTapped() {
        trueButton.isSelected = true
        falseButton.isSelected = false
    }
    
    @objc
    func falseButtonTapped() {
        falseButton.isSelected = true
        trueButton.isSelected = false
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
        let trueValue = trueButton.isSelected ? true : false
        return trueValue
    }
    
}

extension CustomQuestionView : UITextViewDelegate {
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
           let currentText = textView.text ?? ""
           guard let stringRange = Range(range, in: currentText) else {
               return false
           }
           
           let updatedText = currentText.replacingCharacters(in: stringRange, with: text)
           return updatedText.count <= 100 // 100자 이하일 때만 입력 허용
       }

}
