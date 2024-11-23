//
//  QuestionContentView.swift
//  SOPKATHON-4Team-iOS
//
//  Created by 이수민 on 11/24/24.
//

import UIKit

import SnapKit
import Then

class QuestionContentView : UIView {
    
    let headerView : UIView = UIView()
    
    let questionStackView : UIStackView = UIStackView()
    
    let footerButton : UIButton = UIButton()
    
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
        self.addSubviews(headerView,
                         questionStackView,
                         footerButton)
        
    }
    
    func setLayout() {
        headerView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            $0.height.equalTo(224)
        }
        
        questionStackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(63)
        }
        
        footerButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(46)
            $0.horizontalEdges.equalToSuperview().inset(26)
            $0.height.equalTo(52)
        }
        
    }
    
    func setStyle() {
        
        questionStackView.do {
            for i in 1...3 {
                let questionView = CustomQuestionView(questionType: questionType)
                $0.addArrangedSubview(questionView)
            }
            $0.setStackView(axis: .horizontal, spacing: 13)
        }
        
        footerButton.do {
            $0.makeOrangeButton(title: questionType.footerButtonTitle)
        }
        
    }
    
}
