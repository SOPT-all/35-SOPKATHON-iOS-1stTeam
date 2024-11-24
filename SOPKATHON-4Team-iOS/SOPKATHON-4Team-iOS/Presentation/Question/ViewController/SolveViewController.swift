//
//  SolveViewController.swift
//  SOPKATHON-4Team-iOS
//
//  Created by 이수민 on 11/24/24.
//

import UIKit
import SnapKit
import Then
import Moya

class SolveViewController: UIViewController {
    
    lazy var solveContentView: QuestionContentView = {
        return QuestionContentView(questionType: .solve)
    }()
    
    var answerList: [Int] = []
    
    // MARK: - View Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setButton()
        updateAnswerList()
    }
    
    private func setupUI() {
        view.addSubview(solveContentView)
        solveContentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        solveContentView.footerButton.addTarget(self, action: #selector(goToResult), for: .touchUpInside)
    }
    
    private func updateAnswerList() {
        answerList = (0...2).compactMap { index in
            guard let questionView = solveContentView.questionStackView.arrangedSubviews[index] as? CustomQuestionView else {
                return 0  // 또는 적절한 기본값
            }
            return questionView.buttonSelected() ? 1 : 0  // bool 값을 Int로 변환
        }
    }
    
    private func setButton() {
        solveContentView.footerButton.addTarget(self,
                                              action: #selector(buttonTapped),
                                              for: .touchUpInside)
    }

    @objc
    private func buttonTapped() {
        updateAnswerList()  // 버튼 탭 시 최신 상태 업데이트
        postSolvedAnswer(answerList: answerList)
    }
    
    private func postSolvedAnswer(answerList: [Int]) {
        Providers.questionProvider.request(.solveQuestionnaire(answerList: answerList)) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let response):
                do {
                    let answerCountResponse = try JSONDecoder().decode(AnswerCountResponse.self,
                                                                     from: response.data)
                    let count = answerCountResponse.answerCount
                    handleAnswerCount(count)
                } catch {
                    print("Decoding error: \(error)")
                }
            case .failure(let error):
                print("Network error: \(error)")
            }
        }
    }
    
    private func handleAnswerCount(_ count: Int) {
        DispatchQueue.main.async {
            let scoreVC = ScoreViewController()
            scoreVC.scoreView.score = count
            self.navigationController?.pushViewController(scoreVC, animated: false)
        }
    }

    @objc
    private func goToResult() {
        let scoreVC = ScoreViewController()
        guard let window = self.view.window else { return }
        ViewControllerUtils.setRootViewController(window: window, viewController: scoreVC, withAnimation: true)
    }
}
