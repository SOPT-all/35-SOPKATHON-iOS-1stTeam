//
//  AskViewController.swift
//  SOPKATHON-4Team-iOS
//
//  Created by 이수민 on 11/24/24.
//

import UIKit

import SnapKit
import Then

class AskViewController: UIViewController {
    
    lazy var askContentView: QuestionContentView = {
        return QuestionContentView(questionType: .ask)
    }()
    
    // MARK: - View Life Cycless
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        self.view.addSubview(askContentView)
        askContentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
    }
    
}

extension UIStackView {
    func getAllQuestions() -> [Question] {
        return arrangedSubviews
            .compactMap { $0 as? CustomQuestionView }
            .compactMap { $0.getQuestionData() } // 각 뷰에서 데이터 추출
    }
}
