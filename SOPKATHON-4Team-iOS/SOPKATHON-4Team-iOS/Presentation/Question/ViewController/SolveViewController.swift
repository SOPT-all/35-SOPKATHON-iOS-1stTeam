//
//  SolveViewController.swift
//  SOPKATHON-4Team-iOS
//
//  Created by 이수민 on 11/24/24.
//

import UIKit

import SnapKit
import Then

class SolveViewController: UIViewController {
    
    lazy var askContentView: QuestionContentView = {
        return QuestionContentView(questionType: .solve)
    }()
    
    // MARK: - View Life Cycless
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(askContentView)
        askContentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
}
