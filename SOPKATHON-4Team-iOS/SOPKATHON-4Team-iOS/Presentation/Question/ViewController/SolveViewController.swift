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
    
    var questions: [String] = []
    
    var answerList: [Int] = []
    var questionId: Int = 0
    
    // MARK: - View Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setButton()
        setQuestionContentView()
    }
    
    private func setupUI() {
        view.addSubview(solveContentView)
        solveContentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func setQuestionContentView() {
        solveContentView.questionData = questions
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
        postSolvedAnswer(questionId: questionId, answerList: answerList) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let data):
                let scoreVC = ScoreViewController()
                guard let window = self.view.window else { return }
                ViewControllerUtils.setRootViewController(window: window, viewController: scoreVC, withAnimation: true)
                scoreVC.scoreView.score = data
            case .failure(let error):
                print("질문 조회 실패: \(error.localizedDescription)")
            }
            
        }

    }
    
    private func postSolvedAnswer(questionId: Int, answerList: [Int], completion: @escaping(Result<Int, FTError>) -> Void) {
        Providers.questionProvider.request(.solveQuestionnaire(questionId: questionId, answerList: answerList)) { result in
            switch result {
            case .success(let response):
                do {
                    let answerCountResponse = try response.map(BaseResponse<Int>.self)
                    
                    if answerCountResponse.status == 200 {
                        if let count = answerCountResponse.data {
                            print("채점이 성공했습니다.. 맞은 개수: \(count)")
                            completion(.success(count))
                        } else {
                            completion(.failure(.networkFail))
                            print("응답에서 초대 코드를 찾을 수 없습니다.")
                        }
                    } else {
                        completion(.failure(.networkFail))
                        print("질문지 생성 실패: \(answerCountResponse.message)")
                    }
                } catch {
                    completion(.failure(.networkFail))
                    print("Decoding error: \(error)")
                }
            case .failure(let error):
                completion(.failure(.networkFail))
                print("Network error: \(error)")
                
            }
        }
    }
}
