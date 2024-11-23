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
    
    private let questionView: UIView = UIView()
    
    var questionTextView: UITextView = UITextView()
    
    var questionTextLabel: UILabel = UILabel()
    
    var textCountLabel: UILabel = UILabel()
    
    var trueButton: UIButton = UIButton()
    
    var falseButton: UIButton = UIButton()
    
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
        self.addSubviews(questionView,
                         trueButton,
                         falseButton)
        questionView.addSubviews(questionTextView,
                                 questionTextLabel,
                                 textCountLabel)
        
    }
    
    func setLayout() {
        questionView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            $0.height.equalToSuperview().multipliedBy(0.7)
        }
        
        questionTextView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        questionTextLabel.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        textCountLabel.snp.makeConstraints {
            $0.trailing.bottom.equalToSuperview()
            $0.width.equalTo(50)
        }
        
        trueButton.snp.makeConstraints {
            $0.bottom.leading.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.5)
        }
        
        falseButton.snp.makeConstraints {
            $0.bottom.trailing.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.5)
        }
        
    }
    
    func setStyle() {
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
    }
    
}
