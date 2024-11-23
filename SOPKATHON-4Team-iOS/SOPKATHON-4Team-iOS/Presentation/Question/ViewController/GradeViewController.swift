//
//  GradeViewController.swift
//  SOPKATHON-4Team-iOS
//
//  Created by 이수민 on 11/24/24.
//

import UIKit

import SnapKit
import Then

class GradeViewController: UIViewController {
    
    lazy var gradeContentView: QuestionContentView = {
        return QuestionContentView(questionType: .grade)
    }()
    
    // MARK: - View Life Cycless
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(gradeContentView)
        gradeContentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        gradeContentView.footerButton.do {
            $0.addTarget(self, action: #selector(footerButtonTapped), for: .touchUpInside)
        }
    }
    
    @objc func footerButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
    
}
